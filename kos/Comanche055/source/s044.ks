// P34-35_P74-75.agc
// bank 35, slots 31744-31750
function agcAotUnit1807 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31746 {
        if slot <= 31744 {
// P34-35_P74-75.agc:1
//# Copyright:	Public domain.
// P34-35_P74-75.agc:2
//# Filename:	P34-35_P74-75.agc
// P34-35_P74-75.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// P34-35_P74-75.agc:4
//#               is part of the source code for the Command Module's
// P34-35_P74-75.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// P34-35_P74-75.agc:6
//# Assembler:    yaYUL
// P34-35_P74-75.agc:7
//# Reference:    pp. 460-504
// P34-35_P74-75.agc:8
//# Contact:      Onno Hommes <ohommes@cmu.edu>
// P34-35_P74-75.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// P34-35_P74-75.agc:10
//# Mod history:  2009-05-10 OH	Batch 2 Assignment Comanche Transcription
// P34-35_P74-75.agc:11
//#		2009-05-23 RSB	In DISPLAYE, corrected a CADR GOFLASHR
// P34-35_P74-75.agc:12
//#				to CADR GOFLASH.
// P34-35_P74-75.agc:13
//#
// P34-35_P74-75.agc:14
//# The contents of the "Comanche055" files, in general, are transcribed
// P34-35_P74-75.agc:15
//# from scanned documents.
// P34-35_P74-75.agc:16
//#
// P34-35_P74-75.agc:17
//#       Assemble revision 055 of AGC program Comanche by NASA
// P34-35_P74-75.agc:18
//#       2021113-051.  April 1, 1969.
// P34-35_P74-75.agc:19
//#
// P34-35_P74-75.agc:20
//#       This AGC program shall also be referred to as Colossus 2A
// P34-35_P74-75.agc:21
//#
// P34-35_P74-75.agc:22
//#       Prepared by
// P34-35_P74-75.agc:23
//#                       Massachusetts Institute of Technology
// P34-35_P74-75.agc:24
//#                       75 Cambridge Parkway
// P34-35_P74-75.agc:25
//#                       Cambridge, Massachusetts
// P34-35_P74-75.agc:26
//#
// P34-35_P74-75.agc:27
//#       under NASA contract NAS 9-4065.
// P34-35_P74-75.agc:28
//#
// P34-35_P74-75.agc:29
//# Refer directly to the online document mentioned above for further
// P34-35_P74-75.agc:30
//# information.  Please report any errors to info@sandroid.org.
// P34-35_P74-75.agc:31
//
// P34-35_P74-75.agc:32
//
// P34-35_P74-75.agc:33
//# Page 460
// P34-35_P74-75.agc:34
//# TRANSFER PHASE INITIATION (TPI) PROGRAMS (P34 AND P74)
// P34-35_P74-75.agc:35
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// P34-35_P74-75.agc:36
//# MOD BY WHITE, P.		DATE: 1 JUNE 67
// P34-35_P74-75.agc:37
//#
// P34-35_P74-75.agc:38
//# PURPOSE
// P34-35_P74-75.agc:39
//#	(1)	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// P34-35_P74-75.agc:40
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE TRANSFER
// P34-35_P74-75.agc:41
//#		PHASE INITIATION (TPI) MANEUVER, GIVEN --
// P34-35_P74-75.agc:42
//#		(A)	TIME OF IGNITION TIG (TPI) OR THE ELEVATION ANGLE (E) OF
// P34-35_P74-75.agc:43
//#			THE ACTIVE/PASSIVE VEHICLE LOS AT TIG (TPI).
// P34-35_P74-75.agc:44
//#		(B)	CENTRAL ANGLE OF TRANSFER (CENTANG) FROM TIG (TPI) TO
// P34-35_P74-75.agc:45
//#			INTERCEPT TIME (TIG (TPF)).
// P34-35_P74-75.agc:46
//#	(2)	TO CALCULATE TIG (TPI) GIVEN E OR E GIVEN TIG (TPI).
// P34-35_P74-75.agc:47
//#	(3)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P34-35_P74-75.agc:48
//#		APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// P34-35_P74-75.agc:49
//#	(4)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// P34-35_P74-75.agc:50
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// P34-35_P74-75.agc:51
//#		ASTRONAUT/GROUND.
// P34-35_P74-75.agc:52
//#	(5)	TO STORE THE TPI TARGET PARAMETERS FOR USE BY THE DESIRED
// P34-35_P74-75.agc:53
//#		THRUSTING PROGRAM.
// P34-35_P74-75.agc:54
//#
// P34-35_P74-75.agc:55
//# ASSUMPTIONS
// P34-35_P74-75.agc:56
//#	(1)	LM ONLY -- THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF
// P34-35_P74-75.agc:57
//#		THE CONSTANT DELTA ALTITUDE (CDH) PROGRAM (P33/P73).
// P34-35_P74-75.agc:58
//#		THEREFORE --
// P34-35_P74-75.agc:59
//#		(A)	AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// P34-35_P74-75.agc:60
//#			BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// P34-35_P74-75.agc:61
//#			A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// P34-35_P74-75.agc:62
//#			HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// P34-35_P74-75.agc:63
//#		(B)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// P34-35_P74-75.agc:64
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// P34-35_P74-75.agc:65
//#		(C)	THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// P34-35_P74-75.agc:66
//#			ORBITS WAS MINIMIZED.
// P34-35_P74-75.agc:67
//#		(D)	THE PERICENTER ALTITUDES OF ORBITS FOLLOWING CSI AND
// P34-35_P74-75.agc:68
//#			CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// P34-35_P74-75.agc:69
//# Page 461
// P34-35_P74-75.agc:70
//#			ORBIT OR 85 NM FOR EARTH ORBIT.
// P34-35_P74-75.agc:71
//#		(E)	THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// P34-35_P74-75.agc:72
//#			THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// P34-35_P74-75.agc:73
//#			MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// P34-35_P74-75.agc:74
//#			IN AN OUT-OF-PLANE MANEUVER.
// P34-35_P74-75.agc:75
//#	(2)	STATE VECTOR UPDATED BY P27 ARE DISALLOWED DURING AUTOMATIC
// P34-35_P74-75.agc:76
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (4)).
// P34-35_P74-75.agc:77
//#	(3)	THIS PROGRAM MUST BE DONE OVER A TRACKING STATION FOR REAL
// P34-35_P74-75.agc:78
//#		TIME GROUND PARTICIPATION IN DATA INPUT AND OUTPUT.  COMPUTED
// P34-35_P74-75.agc:79
//#		VARIABLES MAY BE STORED FOR LATER VERIFICATION BY THE GROUND.
// P34-35_P74-75.agc:80
//#		THESE STORAGE CAPABILITIES ARE LIMITED ONLY TO THE PARAMETERS
// P34-35_P74-75.agc:81
//#		FOR ONE THRUSTING MANEUVER AT A TIME EXCEPT FOR CONCENTRIC
// P34-35_P74-75.agc:82
//#		FLIGHT PLAN MANEUVER SEQUENCES.
// P34-35_P74-75.agc:83
//#	(4)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// P34-35_P74-75.agc:84
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P34-35_P74-75.agc:85
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// P34-35_P74-75.agc:86
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P34-35_P74-75.agc:87
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P34-35_P74-75.agc:88
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P34-35_P74-75.agc:89
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P34-35_P74-75.agc:90
//#		THRUSTING MANEUVER.
// P34-35_P74-75.agc:91
//#	(5)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P34-35_P74-75.agc:92
//#	(6)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P34-35_P74-75.agc:93
//#
// P34-35_P74-75.agc:94
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P34-35_P74-75.agc:95
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P34-35_P74-75.agc:96
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P34-35_P74-75.agc:97
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P34-35_P74-75.agc:98
//#
// P34-35_P74-75.agc:99
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P34-35_P74-75.agc:100
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// P34-35_P74-75.agc:101
//#
// P34-35_P74-75.agc:102
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// P34-35_P74-75.agc:103
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// P34-35_P74-75.agc:104
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// P34-35_P74-75.agc:105
//#
// P34-35_P74-75.agc:106
//#	(7)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// P34-35_P74-75.agc:107
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// P34-35_P74-75.agc:108
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STORED.
// P34-35_P74-75.agc:109
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// P34-35_P74-75.agc:110
//#		THROUGH THE USE OF V06N52.
// P34-35_P74-75.agc:111
//#
// P34-35_P74-75.agc:112
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// P34-35_P74-75.agc:113
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// P34-35_P74-75.agc:114
//# Page 462
// P34-35_P74-75.agc:115
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// P34-35_P74-75.agc:116
//#		ASTRONAUT SHOULD REASSES THE INPUT TARGETING PARAMETERS BASED
// P34-35_P74-75.agc:117
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// P34-35_P74-75.agc:118
//#	(8)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// P34-35_P74-75.agc:119
//#
// P34-35_P74-75.agc:120
//#			P34 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P34-35_P74-75.agc:121
//#
// P34-35_P74-75.agc:122
//#			P74 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P34-35_P74-75.agc:123
//#
// P34-35_P74-75.agc:124
//# INPUT
// P34-35_P74-75.agc:125
//#	(1)	TTPI	TIME OF THE TPI MANEUVER.
// P34-35_P74-75.agc:126
//#	(2)	ELEV	DESIRED LOS ANGLE AT TPI
// P34-35_P74-75.agc:127
//#	(3)	CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// P34-35_P74-75.agc:128
//#			TRANSFER FROM TPI TO TIME OF INTERCEPT
// P34-35_P74-75.agc:129
//#
// P34-35_P74-75.agc:130
//# OUTPUT
// P34-35_P74-75.agc:131
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P34-35_P74-75.agc:132
//#	(2)	TTOGO		TIME TO GO
// P34-35_P74-75.agc:133
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// P34-35_P74-75.agc:134
//#	(4)	TTPI		COMPUTED TIME OF TPI MANEUVER
// P34-35_P74-75.agc:135
//#		 OR
// P34-35_P74-75.agc:136
//#		ELEV		COMPUTED LOS ANGLE AT TPI
// P34-35_P74-75.agc:137
//#	(5)	POSTTPI		PERIGEE ALTITUDE AFTER THE TPI MANEUVER
// P34-35_P74-75.agc:138
//#	(6)	DELVTPI		MAGNITUDE OF DELTA V AT TPI
// P34-35_P74-75.agc:139
//#	(7)	DELVTPF		MAGNITUDE OF DELTA V AT INTERCEPT
// P34-35_P74-75.agc:140
//#	(8)	DVLOS		DELTA VELOCITY AT TPI -- LINE OF SIGHT
// P34-35_P74-75.agc:141
//#	(9)	DELVLVC		DELTA VELOCITY AT TPI -- LOCAL VERTICAL COORDINATES
// P34-35_P74-75.agc:142
//#
// P34-35_P74-75.agc:143
//# DOWNLINK
// P34-35_P74-75.agc:144
//#	(1)	TTPI		TIME OF TPI MANEUVER
// P34-35_P74-75.agc:145
//#	(2)	TIG		TIME OF TPI MANEUVER
// P34-35_P74-75.agc:146
//#	(3)	ELEV		DESIRED LOS ANGLE AT TPI
// P34-35_P74-75.agc:147
//#	(4)	CENTANG		ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// P34-35_P74-75.agc:148
//#				TRANSFER FROM TPI TO TIME OF INTERCEPT
// P34-35_P74-75.agc:149
//#	(5)	DELVEET3	DELTA VELOCITY AT TPI -- REFERENCE COORDINATES
// P34-35_P74-75.agc:150
//#	(6)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:151
//#
// P34-35_P74-75.agc:152
//# COMMUNICATION TO THRUSTING PROGRAMS
// P34-35_P74-75.agc:153
//#	(1)	TIG		TIME OF THE TPI MANEUVER
// P34-35_P74-75.agc:154
//#	(2)	RTARG		OFFSET TARGET POSITION
// P34-35_P74-75.agc:155
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:156
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION
// P34-35_P74-75.agc:157
//#
// P34-35_P74-75.agc:158
//# SUBROUTINES USED
// P34-35_P74-75.agc:159
//#	AVFLAGA
// P34-35_P74-75.agc:160
//# Page 463
// P34-35_P74-75.agc:161
//#	AVFLAGP
// P34-35_P74-75.agc:162
//#	VNPOOH
// P34-35_P74-75.agc:163
//#	DISPLAYE
// P34-35_P74-75.agc:164
//#	SELECTMU
// P34-35_P74-75.agc:165
//#	PRECSET
// P34-35_P74-75.agc:166
//#	S33/34.1
// P34-35_P74-75.agc:167
//#	ALARM
// P34-35_P74-75.agc:168
//#	BANKCALL
// P34-35_P74-75.agc:169
//#	GOFLASH
// P34-35_P74-75.agc:170
//#	GOTOPOOH
// P34-35_P74-75.agc:171
//#	TIMETHET
// P34-35_P74-75.agc:172
//#	S34/35.2
// P34-35_P74-75.agc:173
//#	PERIAPO1
// P34-35_P74-75.agc:174
//#	SHIFTR1
// P34-35_P74-75.agc:175
//#	S34/35.5
// P34-35_P74-75.agc:176
//#	VN1645
// P34-35_P74-75.agc:177
//
// P34-35_P74-75.agc:178
//		SETLOC	CSI/CDH
// P34-35_P74-75.agc:179
//		BANK
// P34-35_P74-75.agc:180
//		EBANK=	SUBEXIT
// P34-35_P74-75.agc:181
//		COUNT	35/P3474
// P34-35_P74-75.agc:182
//
// P34-35_P74-75.agc:183
//P34		TC	AVFLAGA
// slot 31744
            if slot <> 31744 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31745 {
// P34-35_P74-75.agc:184
//		TC	P34/P74A
// slot 31745
                if slot <> 31745 or instruction <> 1027 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1027, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:185
//P74		TC	AVFLAGP
// slot 31746
                if slot <> 31746 or instruction <> 2466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31748 {
            if slot <= 31747 {
// P34-35_P74-75.agc:186
//P34/P74A	TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// slot 31747
                if slot <> 31747 or instruction <> 2471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:187
//		CAF	V06N37		# TTPI
// slot 31748
                if slot <> 31748 or instruction <> 14732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2444), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31749 {
// P34-35_P74-75.agc:188
//		TC	VNPOOH		# Onno: The scans look like O not zero
// slot 31749
                if slot <> 31749 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:189
//		TC	INTPRET
// slot 31750
                if slot <> 31750 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1807] to agcAotUnit1807@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:190
//		SSP	EXIT
// slot 31751
    31751, 65202,
// P34-35_P74-75.agc:191
//			NN
// slot 31752
    31752, 4076,
// P34-35_P74-75.agc:192
//			0
// slot 31753
    31753, 0
)).

// bank 35, slots 31754-31755
function agcAotUnit1808 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31754 {
// P34-35_P74-75.agc:193
//		TC	DISPLAYE	# ELEV AND CENTANG
// slot 31754
        if slot <> 31754 or instruction <> 1592 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1592, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:194
//		TC	INTPRET
// slot 31755
        if slot <> 31755 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1808] to agcAotUnit1808@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:195
//		CLEAR	DLOAD
// slot 31756
    31756, 58648,
// P34-35_P74-75.agc:196
//			ETPIFLAG
// slot 31757
    31757, 1392,
// P34-35_P74-75.agc:197
//			TTPI
// slot 31758
    31758, 3942,
// P34-35_P74-75.agc:198
//		STODL	TIG
// slot 31759
    31759, 15894,
// P34-35_P74-75.agc:199
//			ELEV
// slot 31760
    31760, 4040,
// P34-35_P74-75.agc:200
//		BZE	SET
// slot 31761
    31761, 35928,
// P34-35_P74-75.agc:201
//			P34/P74B
// slot 31762
    31762, 59432,
// P34-35_P74-75.agc:202
//			ETPIFLAG
// slot 31763
    31763, 1136,
// P34-35_P74-75.agc:203
//P34/P74B	CALL
// slot 31764
    31764, 65320,
// P34-35_P74-75.agc:204
//			SELECTMU
// slot 31765
    31765, 9108,
// P34-35_P74-75.agc:205
//DELELO		EQUALS	26D
// P34-35_P74-75.agc:206
//P34/P74C	DLOAD	SET
// slot 31766
    31766, 36042,
// P34-35_P74-75.agc:207
//			ZEROVECS
// slot 31767
    31767, 13754,
// P34-35_P74-75.agc:208
//			ITSWICH
// slot 31768
    31768, 3682,
// P34-35_P74-75.agc:209
//		BON	CLEAR
// slot 31769
    31769, 35864,
// P34-35_P74-75.agc:210
//			ETPIFLAG
// slot 31770
    31770, 1424,
// P34-35_P74-75.agc:211
//# Page 464
// P34-35_P74-75.agc:212
//			SWCHSET
// slot 31771
    31771, 59450,
// P34-35_P74-75.agc:213
//			ITSWICH
// slot 31772
    31772, 3938,
// P34-35_P74-75.agc:214
//SWCHSET		STORE	NOMTPI
// slot 31773
    31773, 2536,
// P34-35_P74-75.agc:215
//INTLOOP		DLOAD	DAD
// slot 31774
    31774, 36298,
// P34-35_P74-75.agc:216
//			TTPI
// slot 31775
    31775, 3942,
// P34-35_P74-75.agc:217
//			NOMTPI
// slot 31776
    31776, 2536,
// P34-35_P74-75.agc:218
//		STCALL	TDEC1
// slot 31777
    31777, 28738,
// P34-35_P74-75.agc:219
//			PRECSET
// slot 31778
    31778, 38170,
// P34-35_P74-75.agc:220
//		CALL
// slot 31779
    31779, 65320,
// P34-35_P74-75.agc:221
//			S33/34.1
// slot 31780
    31780, 59676,
// P34-35_P74-75.agc:222
//		BZE	EXIT
// slot 31781
    31781, 65112,
// P34-35_P74-75.agc:223
//			SWCHCLR
// slot 31782
    31782, 59486
)).

// bank 35, slots 31783-31783
function agcAotUnit1809 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:224
//		TC	ALARM
// slot 31783
    if slot <> 31783 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1809] to agcAotUnit1809@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:225
//		OCT	611
// slot 31784
    31784, 786
)).

// bank 35, slots 31785-31786
function agcAotUnit1810 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31785 {
// P34-35_P74-75.agc:226
//		CAF	V05N09
// slot 31785
        if slot <> 31785 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:227
//		TC	BANKCALL
// slot 31786
        if slot <> 31786 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1810] to agcAotUnit1810@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:228
//		CADR	GOFLASH
// slot 31787
    31787, 17312
)).

// bank 35, slots 31788-31790
function agcAotUnit1811 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31788 {
// P34-35_P74-75.agc:229
//		TC	GOTOPOOH
// slot 31788
        if slot <> 31788 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31789 {
// P34-35_P74-75.agc:230
//		TC	P34/P74A	# PROCEED
// slot 31789
            if slot <> 31789 or instruction <> 1027 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1027, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:231
//		TC	-7		# V32
// slot 31790
            if slot <> 31790 or instruction <> 1063 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1063, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1811] to agcAotUnit1811@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:232
//
// P34-35_P74-75.agc:233
//SWCHCLR		BONCLR	BON
// slot 31791
    31791, 35864,
// P34-35_P74-75.agc:234
//			ITSWICH
// slot 31792
    31792, 3842,
// P34-35_P74-75.agc:235
//			INTLOOP
// slot 31793
    31793, 59452,
// P34-35_P74-75.agc:236
//			ETPIFLAG
// slot 31794
    31794, 1424,
// P34-35_P74-75.agc:237
//			P34/P74D	# DISPLAY TTPI
// slot 31795
    31795, 59502,
// P34-35_P74-75.agc:238
//		EXIT
// slot 31796
    31796, 65532
)).

// bank 35, slots 31797-31798
function agcAotUnit1812 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31797 {
// P34-35_P74-75.agc:239
//		TC	DISPLAYE	# DISPLAY ELEV AND CENTANG
// slot 31797
        if slot <> 31797 or instruction <> 1592 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1592, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:240
//		TC	P34/P74E
// slot 31798
        if slot <> 31798 or instruction <> 1082 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1082, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1812] to agcAotUnit1812@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:241
//P34/P74D	EXIT
// slot 31799
    31799, 65532
)).

// bank 35, slots 31800-31802
function agcAotUnit1813 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31800 {
// P34-35_P74-75.agc:242
//		CAF	V06N37		# TTPI
// slot 31800
        if slot <> 31800 or instruction <> 14732 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2444), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31801 {
// P34-35_P74-75.agc:243
//		TC	VNPOOH
// slot 31801
            if slot <> 31801 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:244
//P34/P74E	TC	INTPRET
// slot 31802
            if slot <> 31802 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1813] to agcAotUnit1813@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:245
//		SETPD	DLOAD
// slot 31803
    31803, 58626,
// P34-35_P74-75.agc:246
//			0D
// slot 31804
    31804, 2,
// P34-35_P74-75.agc:247
//			RTX1
// slot 31805
    31805, 4044,
// P34-35_P74-75.agc:248
//		STODL	X1
// slot 31806
    31806, 12366,
// P34-35_P74-75.agc:249
//			CENTANG
// slot 31807
    31807, 4056,
// P34-35_P74-75.agc:250
//		PUSH	COS
// slot 31808
    31808, 58892,
// P34-35_P74-75.agc:251
//		STODL	CSTH
// slot 31809
    31809, 15288,
// P34-35_P74-75.agc:252
//		SIN
// slot 31810
    31810, 65500,
// P34-35_P74-75.agc:253
//		STOVL	SNTH
// slot 31811
    31811, 23476,
// P34-35_P74-75.agc:254
//			RPASS3
// slot 31812
    31812, 3800,
// P34-35_P74-75.agc:255
//		VSR*
// slot 31813
    31813, 65374,
// P34-35_P74-75.agc:256
//			0,2
// slot 31814
    31814, 48380,
// P34-35_P74-75.agc:257
//		STOVL	RVEC
// slot 31815
    31815, 23390,
// P34-35_P74-75.agc:258
//			VPASS3
// slot 31816
    31816, 3812,
// P34-35_P74-75.agc:259
//		VSR*	SET
// slot 31817
    31817, 35934,
// P34-35_P74-75.agc:260
//			0,2
// slot 31818
    31818, 48380,
// P34-35_P74-75.agc:261
//			RVSW
// slot 31819
    31819, 3692,
// P34-35_P74-75.agc:262
//# Page 465
// P34-35_P74-75.agc:263
//		STCALL	VVEC
// slot 31820
    31820, 31692,
// P34-35_P74-75.agc:264
//			TIMETHET
// slot 31821
    31821, 21448,
// P34-35_P74-75.agc:265
//		DLOAD
// slot 31822
    31822, 65482,
// P34-35_P74-75.agc:266
//			TTPI
// slot 31823
    31823, 3942,
// P34-35_P74-75.agc:267
//		STORE	INTIME		# FOR INITVEL
// slot 31824
    31824, 3718,
// P34-35_P74-75.agc:268
//		DAD
// slot 31825
    31825, 65306,
// P34-35_P74-75.agc:269
//			T		# RENDEZVOUS TIME
// slot 31826
    31826, 62,
// P34-35_P74-75.agc:270
//		STCALL	TPASS4		# FOR INITVEL
// slot 31827
    31827, 32604,
// P34-35_P74-75.agc:271
//			S34/35.2
// slot 31828
    31828, 60076,
// P34-35_P74-75.agc:272
//		VLOAD	ABVAL
// slot 31829
    31829, 42746,
// P34-35_P74-75.agc:273
//			DELVEET3
// slot 31830
    31830, 3916,
// P34-35_P74-75.agc:274
//		STOVL	DELVTPI
// slot 31831
    31831, 23354,
// P34-35_P74-75.agc:275
//			VPASS4
// slot 31832
    31832, 3904,
// P34-35_P74-75.agc:276
//		VSU	ABVAL
// slot 31833
    31833, 42578,
// P34-35_P74-75.agc:277
//			VTPRIME
// slot 31834
    31834, 3872,
// P34-35_P74-75.agc:278
//		STOVL	DELVTPF
// slot 31835
    31835, 23358,
// P34-35_P74-75.agc:279
//			RACT3
// slot 31836
    31836, 3776,
// P34-35_P74-75.agc:280
//		PDVL	CALL
// slot 31837
    31837, 38042,
// P34-35_P74-75.agc:281
//			VIPRIME
// slot 31838
    31838, 3860,
// P34-35_P74-75.agc:282
//			PERIAPO1
// slot 31839
    31839, 38102,
// P34-35_P74-75.agc:283
//		CALL
// slot 31840
    31840, 65320,
// P34-35_P74-75.agc:284
//			SHIFTR1
// slot 31841
    31841, 38246,
// P34-35_P74-75.agc:285
//		STODL	POSTTPI
// slot 31842
    31842, 15170,
// P34-35_P74-75.agc:286
//			TTPI
// slot 31843
    31843, 3942,
// P34-35_P74-75.agc:287
//		STORE	TIG
// slot 31844
    31844, 3606,
// P34-35_P74-75.agc:288
//		EXIT
// slot 31845
    31845, 65532
)).

// bank 35, slots 31846-31848
function agcAotUnit1814 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31846 {
// P34-35_P74-75.agc:289
//		CAF	V06N58
// slot 31846
        if slot <> 31846 or instruction <> 14734 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2446), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31847 {
// P34-35_P74-75.agc:290
//		TC	VNPOOH
// slot 31847
            if slot <> 31847 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:291
//		TC	INTPRET
// slot 31848
            if slot <> 31848 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1814] to agcAotUnit1814@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:292
//		CALL
// slot 31849
    31849, 65320,
// P34-35_P74-75.agc:293
//			S34/35.5
// slot 31850
    31850, 60354,
// P34-35_P74-75.agc:294
//		CALL
// slot 31851
    31851, 65320,
// P34-35_P74-75.agc:295
//			VN1645
// slot 31852
    31852, 60420,
// P34-35_P74-75.agc:296
//		GOTO
// slot 31853
    31853, 65360,
// P34-35_P74-75.agc:297
//			P34/P74C
// slot 31854
    31854, 59436
)).

// bank 35, slots 31855-31864
function agcAotUnit1815 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31859 {
        if slot <= 31856 {
            if slot <= 31855 {
// P34-35_P74-75.agc:298
//
// P34-35_P74-75.agc:299
//# Page 466
// P34-35_P74-75.agc:300
//# RENDEZVOUS MID-COURSE MANEUVER PROGRAMS (P35 AND P75)
// P34-35_P74-75.agc:301
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// P34-35_P74-75.agc:302
//# MOD BY WHITE, P.		DATE:  1 JUNE 67
// P34-35_P74-75.agc:303
//#
// P34-35_P74-75.agc:304
//# PURPOSE
// P34-35_P74-75.agc:305
//#	(1) 	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// P34-35_P74-75.agc:306
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE NEXT
// P34-35_P74-75.agc:307
//#		MID-COURSE CORRECTION OF THE TRANSFER PHASE OF AN ACTIVE
// P34-35_P74-75.agc:308
//#		VEHICLE RENDEZVOUS.
// P34-35_P74-75.agc:309
//#	(2)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// P34-35_P74-75.agc:310
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// P34-35_P74-75.agc:311
//#		ASTRONAUT/GROUND.
// P34-35_P74-75.agc:312
//#	(3)	TO STORE THE TPM TARGET PARAMETERS FOR USE BY THE DESIRED
// P34-35_P74-75.agc:313
//#		THRUSTING PROGRAM.
// P34-35_P74-75.agc:314
//#
// P34-35_P74-75.agc:315
//# ASSUMPTIONS
// P34-35_P74-75.agc:316
//#	(1)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P34-35_P74-75.agc:317
//#	(2)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P34-35_P74-75.agc:318
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (3)).
// P34-35_P74-75.agc:319
//#	(3)	THE RENDEZVOUS RADAR IS ON AND IS LOCKED ON THE CSM.  THIS WAS
// P34-35_P74-75.agc:320
//#		DONE DURING PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS
// P34-35_P74-75.agc:321
//#		WILL BE MADE AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN
// P34-35_P74-75.agc:322
//#		ENABLED BY THE TRACK AND UPDATE FLAGS (SEE P20).  THE
// P34-35_P74-75.agc:323
//#		RENDEZVOUS TRACKING MARK COUNTER IS ZEROED BY THE SELECTION OF
// P34-35_P74-75.agc:324
//#		P20 AND AFTER EACH THRUSTING MANEUVER.
// P34-35_P74-75.agc:325
//#	(4)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P34-35_P74-75.agc:326
//#
// P34-35_P74-75.agc:327
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P34-35_P74-75.agc:328
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P34-35_P74-75.agc:329
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P34-35_P74-75.agc:330
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P34-35_P74-75.agc:331
//#
// P34-35_P74-75.agc:332
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P34-35_P74-75.agc:333
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// P34-35_P74-75.agc:334
//#
// P34-35_P74-75.agc:335
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// P34-35_P74-75.agc:336
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// P34-35_P74-75.agc:337
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// P34-35_P74-75.agc:338
//#
// P34-35_P74-75.agc:339
//#	(5)	THE TIME OF INTERCEPT (T(INT)) WAS DEFINED BY PREVIOUS
// P34-35_P74-75.agc:340
//#		COMPLETION OF THE TRANSFER PHASE INITIATION (TPI) PROGRAM
// P34-35_P74-75.agc:341
//#		(P34/P74) AND IS PRESENTLY AVAILABLE IN STORAGE.
// P34-35_P74-75.agc:342
//# Page 467
// P34-35_P74-75.agc:343
//#	(6)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// P34-35_P74-75.agc:344
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// P34-35_P74-75.agc:345
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STORED.
// P34-35_P74-75.agc:346
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// P34-35_P74-75.agc:347
//#		THROUGH THE USE OF V06N52
// P34-35_P74-75.agc:348
//#
// P34-35_P74-75.agc:349
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// P34-35_P74-75.agc:350
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// P34-35_P74-75.agc:351
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// P34-35_P74-75.agc:352
//#		ASTRONAUT SHOULD REASSESS THE INPUT TARGETING PARAMETERS BASED
// P34-35_P74-75.agc:353
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// P34-35_P74-75.agc:354
//#	(7)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// P34-35_P74-75.agc:355
//#
// P34-35_P74-75.agc:356
//#			P35 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P34-35_P74-75.agc:357
//#
// P34-35_P74-75.agc:358
//#			P75 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P34-35_P74-75.agc:359
//#
// P34-35_P74-75.agc:360
//# INPUT
// P34-35_P74-75.agc:361
//#	(1)	TPASS4		TIME OF INTERCEPT -- SAVED FROM P34/P74
// P34-35_P74-75.agc:362
//#
// P34-35_P74-75.agc:363
//# OUTPUT
// P34-35_P74-75.agc:364
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P34-35_P74-75.agc:365
//#	(2)	TTOGO		TIME TO GO
// P34-35_P74-75.agc:366
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// P34-35_P74-75.agc:367
//#	(4)	DVLOS		DELTA VELOCITY AT MID -- LINE OF SIGHT
// P34-35_P74-75.agc:368
//#	(5)	DELVLVC		DELTA VELOCITY AT MID -- LOCAL VERTICAL COORDINATES
// P34-35_P74-75.agc:369
//#
// P34-35_P74-75.agc:370
//# DOWNLINK
// P34-35_P74-75.agc:371
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// P34-35_P74-75.agc:372
//#	(2)	DELVEET3	DELTA VELOCITY AT TPM -- REFERENCE COORDINATES
// P34-35_P74-75.agc:373
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:374
//#
// P34-35_P74-75.agc:375
//# COMMUNICATION TO THRUSTING PROGRAMS
// P34-35_P74-75.agc:376
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// P34-35_P74-75.agc:377
//#	(2)	RTARG		OFFSET TARGET POSITION
// P34-35_P74-75.agc:378
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:379
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION.
// P34-35_P74-75.agc:380
//#
// P34-35_P74-75.agc:381
//# SUBROUTINES USED
// P34-35_P74-75.agc:382
//#	AVFLAGA
// P34-35_P74-75.agc:383
//#	AVFLAGP
// P34-35_P74-75.agc:384
//#	LOADTIME
// P34-35_P74-75.agc:385
//#	SELECTMU
// P34-35_P74-75.agc:386
//#	PRECSET
// P34-35_P74-75.agc:387
//#	S34/35.1
// P34-35_P74-75.agc:388
//#	S34/35.2
// P34-35_P74-75.agc:389
//# Page 468
// P34-35_P74-75.agc:390
//#	S34/35.5
// P34-35_P74-75.agc:391
//#	VN1645
// P34-35_P74-75.agc:392
//
// P34-35_P74-75.agc:393
//		COUNT	35/P3575
// P34-35_P74-75.agc:394
//		EBANK=	KT
// P34-35_P74-75.agc:395
//
// P34-35_P74-75.agc:396
//P35		TC	AVFLAGA
// slot 31855
                if slot <> 31855 or instruction <> 2455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:397
//		EXTEND
// slot 31856
                if slot <> 31856 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31857 {
// P34-35_P74-75.agc:398
//		DCA	ATIGINC
// slot 31857
                if slot <> 31857 or instruction <> 13074 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 786, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31858 {
// P34-35_P74-75.agc:399
//		TC	P35/P75A
// slot 31858
                    if slot <> 31858 or instruction <> 1142 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1142, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:400
//P75		TC	AVFLAGP
// slot 31859
                    if slot <> 31859 or instruction <> 2466 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2466, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31861 {
            if slot <= 31860 {
// P34-35_P74-75.agc:401
//		EXTEND
// slot 31860
                if slot <> 31860 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:402
//		DCA	PTIGINC
// slot 31861
                if slot <> 31861 or instruction <> 13076 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 788, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31862 {
// P34-35_P74-75.agc:403
//P35/P75A	DXCH	KT
// slot 31862
                if slot <> 31862 or instruction <> 22516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31863 {
// P34-35_P74-75.agc:404
//		TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// slot 31863
                    if slot <> 31863 or instruction <> 2471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:405
//		TC	INTPRET
// slot 31864
                    if slot <> 31864 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1815] to agcAotUnit1815@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:406
//		CALL
// slot 31865
    31865, 65320,
// P34-35_P74-75.agc:407
//			SELECTMU
// slot 31866
    31866, 9108,
// P34-35_P74-75.agc:408
//P35/P75B	RTB
// slot 31867
    31867, 65336,
// P34-35_P74-75.agc:409
//			LOADTIME
// slot 31868
    31868, 38544,
// P34-35_P74-75.agc:410
//		STORE	TSTRT
// slot 31869
    31869, 3946,
// P34-35_P74-75.agc:411
//		DAD
// slot 31870
    31870, 65306,
// P34-35_P74-75.agc:412
//			KT
// slot 31871
    31871, 2536,
// P34-35_P74-75.agc:413
//		STORE	TIG
// slot 31872
    31872, 3606,
// P34-35_P74-75.agc:414
//		STORE	INTIME		# FOR INITVEL
// slot 31873
    31873, 3718,
// P34-35_P74-75.agc:415
//		STCALL	TDEC1
// slot 31874
    31874, 28738,
// P34-35_P74-75.agc:416
//			PRECSET		# ADVANCE BOTH VEHICLES
// slot 31875
    31875, 38170,
// P34-35_P74-75.agc:417
//		CALL
// slot 31876
    31876, 65320,
// P34-35_P74-75.agc:418
//			S34/35.1	# GET NORM AND LOS FOR TRANSFORM
// slot 31877
    31877, 61440,
// P34-35_P74-75.agc:419
//		CALL
// slot 31878
    31878, 65320,
// P34-35_P74-75.agc:420
//			S34/35.2	# GET DELTA V(LV)
// slot 31879
    31879, 60076,
// P34-35_P74-75.agc:421
//		CALL
// slot 31880
    31880, 65320,
// P34-35_P74-75.agc:422
//			S34/35.5
// slot 31881
    31881, 60354,
// P34-35_P74-75.agc:423
//		CALL
// slot 31882
    31882, 65320,
// P34-35_P74-75.agc:424
//			VN1645
// slot 31883
    31883, 60420,
// P34-35_P74-75.agc:425
//		GOTO
// slot 31884
    31884, 65360,
// P34-35_P74-75.agc:426
//			P35/P75B
// slot 31885
    31885, 59638,
// P34-35_P74-75.agc:427
//# Page 469
// P34-35_P74-75.agc:428
//# ***** S33/34.1 *****
// P34-35_P74-75.agc:429
//
// P34-35_P74-75.agc:430
//S33/34.1	STQ	SSP
// slot 31886
    31886, 55584,
// P34-35_P74-75.agc:431
//			NORMEX
// slot 31887
    31887, 1472,
// P34-35_P74-75.agc:432
//			TITER
// slot 31888
    31888, 3946,
// P34-35_P74-75.agc:433
//		OCT	40000
// slot 31889
    31889, 32768,
// P34-35_P74-75.agc:434
//		DLOAD	SETPD
// slot 31890
    31890, 33226,
// P34-35_P74-75.agc:435
//			MAX250
// slot 31891
    31891, 27794,
// P34-35_P74-75.agc:436
//			0D
// slot 31892
    31892, 2,
// P34-35_P74-75.agc:437
//		STOVL	SECMAX
// slot 31893
    31893, 24152,
// P34-35_P74-75.agc:438
//			RACT3
// slot 31894
    31894, 3776,
// P34-35_P74-75.agc:439
//		STOVL	RAPREC
// slot 31895
    31895, 24316,
// P34-35_P74-75.agc:440
//			VACT3
// slot 31896
    31896, 3788,
// P34-35_P74-75.agc:441
//		STOVL	VAPREC
// slot 31897
    31897, 24304,
// P34-35_P74-75.agc:442
//			RPASS3
// slot 31898
    31898, 3800,
// P34-35_P74-75.agc:443
//		STOVL	RPPREC
// slot 31899
    31899, 24352,
// P34-35_P74-75.agc:444
//			VPASS3
// slot 31900
    31900, 3812,
// P34-35_P74-75.agc:445
//		STORE	VPPREC
// slot 31901
    31901, 3860,
// P34-35_P74-75.agc:446
//ELCALC		CALL
// slot 31902
    31902, 65320,
// P34-35_P74-75.agc:447
//			S34/35.1	# NORMAL AND LOS
// slot 31903
    31903, 61440,
// P34-35_P74-75.agc:448
//		VXV	PDVL
// slot 31904
    31904, 52538,
// P34-35_P74-75.agc:449
//			RACT3		# (RA*VA)*RA 0D
// slot 31905
    31905, 3776,
// P34-35_P74-75.agc:450
//		PDVL	UNIT		# ULOS AT 6D
// slot 31906
    31906, 44698,
// P34-35_P74-75.agc:451
//			RACT3
// slot 31907
    31907, 3776,
// P34-35_P74-75.agc:452
//		PDVL	VPROJ		# XCHNJ AND UP
// slot 31908
    31908, 39322,
// P34-35_P74-75.agc:453
//		VSL2	BVSU
// slot 31909
    31909, 42452,
// P34-35_P74-75.agc:454
//			ULOS
// slot 31910
    31910, 2858,
// P34-35_P74-75.agc:455
//		UNIT	PDVL		# UP AT 0D
// slot 31911
    31911, 52572,
// P34-35_P74-75.agc:456
//		DOT	PDVL		# UP.UN*RA AT 0D
// slot 31912
    31912, 52546,
// P34-35_P74-75.agc:457
//			0D		# UP IN MPAC
// slot 31913
    31913, 2,
// P34-35_P74-75.agc:458
//		DOT	SIGN
// slot 31914
    31914, 62786,
// P34-35_P74-75.agc:459
//			ULOS
// slot 31915
    31915, 2858,
// P34-35_P74-75.agc:460
//		SL1	ACOS
// slot 31916
    31916, 54996,
// P34-35_P74-75.agc:461
//		PDVL	DOT		# EA AT 0D
// slot 31917
    31917, 41370,
// P34-35_P74-75.agc:462
//			ULOS
// slot 31918
    31918, 2858,
// P34-35_P74-75.agc:463
//			RACT3
// slot 31919
    31919, 3776,
// P34-35_P74-75.agc:464
//		BPL	DLOAD
// slot 31920
    31920, 58696,
// P34-35_P74-75.agc:465
//			TESTY
// slot 31921
    31921, 59752,
// P34-35_P74-75.agc:466
//			DPPOSMAX
// slot 31922
    31922, 13766,
// P34-35_P74-75.agc:467
//		DSU	PUSH
// slot 31923
    31923, 34346,
// P34-35_P74-75.agc:468
//TESTY		BOFF	DLOAD
// slot 31924
    31924, 58648,
// P34-35_P74-75.agc:469
//			ITSWICH
// slot 31925
    31925, 4034,
// P34-35_P74-75.agc:470
//			ELEX
// slot 31926
    31926, 60054,
// P34-35_P74-75.agc:471
//			DELEL
// slot 31927
    31927, 3668,
// P34-35_P74-75.agc:472
//		STODL	DELELO
// slot 31928
    31928, 12342,
// P34-35_P74-75.agc:473
//		DSU
// slot 31929
    31929, 65322,
// P34-35_P74-75.agc:474
//			ELEV
// slot 31930
    31930, 4040,
// P34-35_P74-75.agc:475
//		STORE	DELEL
// slot 31931
    31931, 3668,
// P34-35_P74-75.agc:476
//		ABS	DSU
// slot 31932
    31932, 38220,
// P34-35_P74-75.agc:477
//			ELEPS
// slot 31933
    31933, 27802,
// P34-35_P74-75.agc:478
//# Page 470
// P34-35_P74-75.agc:479
//		BMN
// slot 31934
    31934, 65344,
// P34-35_P74-75.agc:480
//			TIMEX		# COMMERCIALS EVERYWHERE
// slot 31935
    31935, 60070,
// P34-35_P74-75.agc:481
//FIGTIME		SLOAD	SR1
// slot 31936
    31936, 58042,
// P34-35_P74-75.agc:482
//			TITER
// slot 31937
    31937, 3946,
// P34-35_P74-75.agc:483
//		BHIZ	LXA,1
// slot 31938
    31938, 59440,
// P34-35_P74-75.agc:484
//			NORMEX		# TOO MANY ITERATIONS
// slot 31939
    31939, 1472,
// P34-35_P74-75.agc:485
//			MPAC
// slot 31940
    31940, 216,
// P34-35_P74-75.agc:486
//		SXA,1	VLOAD
// slot 31941
    31941, 64944,
// P34-35_P74-75.agc:487
//			TITER
// slot 31942
    31942, 3944,
// P34-35_P74-75.agc:488
//			RPASS3
// slot 31943
    31943, 3800,
// P34-35_P74-75.agc:489
//		UNIT	PDDL
// slot 31944
    31944, 54620,
// P34-35_P74-75.agc:490
//			36D
// slot 31945
    31945, 74,
// P34-35_P74-75.agc:491
//		PDVL	UNIT
// slot 31946
    31946, 44698,
// P34-35_P74-75.agc:492
//			RACT3
// slot 31947
    31947, 3776,
// P34-35_P74-75.agc:493
//		PDDL
// slot 31948
    31948, 65450,
// P34-35_P74-75.agc:494
//		PDDL	PUSH
// slot 31949
    31949, 34474,
// P34-35_P74-75.agc:495
//			36D
// slot 31950
    31950, 74,
// P34-35_P74-75.agc:496
//		BDSU
// slot 31951
    31951, 65314,
// P34-35_P74-75.agc:497
//			12D
// slot 31952
    31952, 26,
// P34-35_P74-75.agc:498
//		STODL	30D		# RP-RA MAGNITUDES
// slot 31953
    31953, 12350,
// P34-35_P74-75.agc:499
//			DPHALF
// slot 31954
    31954, 13750,
// P34-35_P74-75.agc:500
//		DSU	PUSH
// slot 31955
    31955, 34346,
// P34-35_P74-75.agc:501
//			ELEV
// slot 31956
    31956, 4040,
// P34-35_P74-75.agc:502
//		SIGN	BMN
// slot 31957
    31957, 41194,
// P34-35_P74-75.agc:503
//			30D
// slot 31958
    31958, 62,
// P34-35_P74-75.agc:504
//			NORMEX
// slot 31959
    31959, 1472,
// P34-35_P74-75.agc:505
//		DLOAD	COS
// slot 31960
    31960, 59082,
// P34-35_P74-75.agc:506
//		DMP	DDV
// slot 31961
    31961, 47370,
// P34-35_P74-75.agc:507
//			14D
// slot 31962
    31962, 30,
// P34-35_P74-75.agc:508
//			12D
// slot 31963
    31963, 26,
// P34-35_P74-75.agc:509
//		DCOMP			# SINCE COS(180-A)=-COS A
// slot 31964
    31964, 65404,
// P34-35_P74-75.agc:510
//		STORE	28D
// slot 31965
    31965, 58,
// P34-35_P74-75.agc:511
//		ABS	BDSU
// slot 31966
    31966, 37196,
// P34-35_P74-75.agc:512
//			DPHALF
// slot 31967
    31967, 13750,
// P34-35_P74-75.agc:513
//		BMN	VLOAD
// slot 31968
    31968, 64832,
// P34-35_P74-75.agc:514
//			NORMEX
// slot 31969
    31969, 1472,
// P34-35_P74-75.agc:515
//			UNRM
// slot 31970
    31970, 2846,
// P34-35_P74-75.agc:516
//		VXV	UNIT
// slot 31971
    31971, 44602,
// P34-35_P74-75.agc:517
//			6D		# UN*RA
// slot 31972
    31972, 14,
// P34-35_P74-75.agc:518
//		DOT	DMP
// slot 31973
    31973, 34114,
// P34-35_P74-75.agc:519
//			VACT3
// slot 31974
    31974, 3788,
// P34-35_P74-75.agc:520
//			12D
// slot 31975
    31975, 26,
// P34-35_P74-75.agc:521
//		PDVL	VXV
// slot 31976
    31976, 40346,
// P34-35_P74-75.agc:522
//			0D
// slot 31977
    31977, 2,
// P34-35_P74-75.agc:523
//			VPASS3
// slot 31978
    31978, 3812,
// P34-35_P74-75.agc:524
//		VXV	UNIT
// slot 31979
    31979, 44602,
// P34-35_P74-75.agc:525
//			0D		# (RP*VP)*RP
// slot 31980
    31980, 2,
// P34-35_P74-75.agc:526
//		DOT	DMP
// slot 31981
    31981, 34114,
// P34-35_P74-75.agc:527
//			VPASS3
// slot 31982
    31982, 3812,
// P34-35_P74-75.agc:528
//			14D
// slot 31983
    31983, 30,
// P34-35_P74-75.agc:529
//# Page 471
// P34-35_P74-75.agc:530
//		BDSU
// slot 31984
    31984, 65314,
// P34-35_P74-75.agc:531
//		NORM	PDVL		# NORMALIZED WA-WP 12D
// slot 31985
    31985, 52610,
// P34-35_P74-75.agc:532
//			X1
// slot 31986
    31986, 78,
// P34-35_P74-75.agc:533
//			6D
// slot 31987
    31987, 14
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:534
//		VXV	DOT
// slot 31988
    31988, 41274,
// P34-35_P74-75.agc:535
//			0D
// slot 31989
    31989, 2,
// P34-35_P74-75.agc:536
//			UNRM		# RA*RP.UN 14D
// slot 31990
    31990, 2846,
// P34-35_P74-75.agc:537
//		PDVL	DOT
// slot 31991
    31991, 41370,
// P34-35_P74-75.agc:538
//			0D
// slot 31992
    31992, 2,
// P34-35_P74-75.agc:539
//			6D
// slot 31993
    31993, 14,
// P34-35_P74-75.agc:540
//		SL1	ACOS
// slot 31994
    31994, 54996,
// P34-35_P74-75.agc:541
//		SIGN
// slot 31995
    31995, 65514,
// P34-35_P74-75.agc:542
//		DSU	DAD		# ALPHA PI
// slot 31996
    31996, 36138,
// P34-35_P74-75.agc:543
//			DPHALF
// slot 31997
    31997, 13750,
// P34-35_P74-75.agc:544
//			ELEV
// slot 31998
    31998, 4040,
// P34-35_P74-75.agc:545
//		PDDL	ACOS
// slot 31999
    31999, 54954,
// P34-35_P74-75.agc:546
//			28D
// slot 32000
    32000, 58,
// P34-35_P74-75.agc:547
//		BDSU	SIGN
// slot 32001
    32001, 62754,
// P34-35_P74-75.agc:548
//			DPHALF
// slot 32002
    32002, 13750,
// P34-35_P74-75.agc:549
//			30D		# CONTAINS RP-RA
// slot 32003
    32003, 62,
// P34-35_P74-75.agc:550
//		DAD
// slot 32004
    32004, 65306,
// P34-35_P74-75.agc:551
//		DMP	DDV
// slot 32005
    32005, 47370,
// P34-35_P74-75.agc:552
//			TWOPI
// slot 32006
    32006, 27790,
// P34-35_P74-75.agc:553
//		DMP
// slot 32007
    32007, 65290,
// P34-35_P74-75.agc:554
//		SL*	DMP
// slot 32008
    32008, 34142,
// P34-35_P74-75.agc:555
//			0 -3,1
// slot 32009
    32009, 16636,
// P34-35_P74-75.agc:556
//		PUSH	ABS
// slot 32010
    32010, 42508,
// P34-35_P74-75.agc:557
//		DSU	BMN
// slot 32011
    32011, 41002,
// P34-35_P74-75.agc:558
//			SECMAX
// slot 32012
    32012, 3672,
// P34-35_P74-75.agc:559
//			OKMAX
// slot 32013
    32013, 59938,
// P34-35_P74-75.agc:560
//		DLOAD	SIGN		# REPLACE TIME WITH MAX TIME SIGNED
// slot 32014
    32014, 62922,
// P34-35_P74-75.agc:561
//			SECMAX
// slot 32015
    32015, 3672,
// P34-35_P74-75.agc:562
//		PUSH
// slot 32016
    32016, 65292,
// P34-35_P74-75.agc:563
//OKMAX		SLOAD	BPL		# TEST FIRST ITERATION
// slot 32017
    32017, 42170,
// P34-35_P74-75.agc:564
//			TITER
// slot 32018
    32018, 3946,
// P34-35_P74-75.agc:565
//			REPETE
// slot 32019
    32019, 59954,
// P34-35_P74-75.agc:566
//		SSP	DLOAD
// slot 32020
    32020, 58802,
// P34-35_P74-75.agc:567
//			TITER
// slot 32021
    32021, 3946,
// P34-35_P74-75.agc:568
//		OCT	37777
// slot 32022
    32022, 32766,
// P34-35_P74-75.agc:569
//		GOTO
// slot 32023
    32023, 65360,
// P34-35_P74-75.agc:570
//			STORDELT
// slot 32024
    32024, 60014,
// P34-35_P74-75.agc:571
//REPETE		DLOAD	DMP
// slot 32025
    32025, 34250,
// P34-35_P74-75.agc:572
//			DELEL
// slot 32026
    32026, 3668,
// P34-35_P74-75.agc:573
//			DELELO
// slot 32027
    32027, 54,
// P34-35_P74-75.agc:574
//		BPL	DLOAD
// slot 32028
    32028, 58696,
// P34-35_P74-75.agc:575
//			NEXTES
// slot 32029
    32029, 59978,
// P34-35_P74-75.agc:576
//			SECMAX
// slot 32030
    32030, 3672,
// P34-35_P74-75.agc:577
//		DMP
// slot 32031
    32031, 65290,
// P34-35_P74-75.agc:578
//			THIRD
// slot 32032
    32032, 27798,
// P34-35_P74-75.agc:579
//		STODL	SECMAX
// slot 32033
    32033, 15960,
// P34-35_P74-75.agc:580
//# Page 472
// P34-35_P74-75.agc:581
//		ABS	SR1		# CROSSED OVER SOLUTION
// slot 32034
    32034, 57932,
// P34-35_P74-75.agc:582
//		DCOMP	GOTO		# DT=(-SIGN(DTO)//DT//)/2
// slot 32035
    32035, 43132,
// P34-35_P74-75.agc:583
//			RESIGN
// slot 32036
    32036, 59994,
// P34-35_P74-75.agc:584
//NEXTES		DLOAD	ABS
// slot 32037
    32037, 42698,
// P34-35_P74-75.agc:585
//			DELEL
// slot 32038
    32038, 3668,
// P34-35_P74-75.agc:586
//		PDDL	ABS
// slot 32039
    32039, 42666,
// P34-35_P74-75.agc:587
//			DELELO
// slot 32040
    32040, 54,
// P34-35_P74-75.agc:588
//		DSU
// slot 32041
    32041, 65322,
// P34-35_P74-75.agc:589
//		BMN	DLOAD
// slot 32042
    32042, 58688,
// P34-35_P74-75.agc:590
//			REVERS		# WRONG DIRECTION
// slot 32043
    32043, 60000,
// P34-35_P74-75.agc:591
//		ABS
// slot 32044
    32044, 65356,
// P34-35_P74-75.agc:592
//RESIGN		SIGN 	GOTO
// slot 32045
    32045, 43242,
// P34-35_P74-75.agc:593
//			DELTEEO
// slot 32046
    32046, 3664,
// P34-35_P74-75.agc:594
//			STORDELT
// slot 32047
    32047, 60014,
// P34-35_P74-75.agc:595
//REVERS		DLOAD	DCOMP
// slot 32048
    32048, 48842,
// P34-35_P74-75.agc:596
//			DELTEEO
// slot 32049
    32049, 3664,
// P34-35_P74-75.agc:597
//		PUSH	SR1
// slot 32050
    32050, 57868,
// P34-35_P74-75.agc:598
//		STORE	DELTEEO
// slot 32051
    32051, 3664,
// P34-35_P74-75.agc:599
//		DAD
// slot 32052
    32052, 65306,
// P34-35_P74-75.agc:600
//		GOTO
// slot 32053
    32053, 65360,
// P34-35_P74-75.agc:601
//			ADTIME
// slot 32054
    32054, 60016,
// P34-35_P74-75.agc:602
//STORDELT	STORE	DELTEEO
// slot 32055
    32055, 3664,
// P34-35_P74-75.agc:603
//ADTIME		DAD
// slot 32056
    32056, 65306,
// P34-35_P74-75.agc:604
//			NOMTPI		# SUM OF DELTA T:S
// slot 32057
    32057, 2536,
// P34-35_P74-75.agc:605
//		STORE	NOMTPI
// slot 32058
    32058, 2536,
// P34-35_P74-75.agc:606
//		VLOAD	PDVL
// slot 32059
    32059, 52730,
// P34-35_P74-75.agc:607
//			VAPREC
// slot 32060
    32060, 3824,
// P34-35_P74-75.agc:608
//			RAPREC
// slot 32061
    32061, 3836,
// P34-35_P74-75.agc:609
//		CALL
// slot 32062
    32062, 65320,
// P34-35_P74-75.agc:610
//			GOINT
// slot 32063
    32063, 60290,
// P34-35_P74-75.agc:611
//		CALL
// slot 32064
    32064, 65320,
// P34-35_P74-75.agc:612
//			ACTIVE		# STORE NEW RACT3 VACT3
// slot 32065
    32065, 38206,
// P34-35_P74-75.agc:613
//		VLOAD	PDVL
// slot 32066
    32066, 52730,
// P34-35_P74-75.agc:614
//			VPPREC
// slot 32067
    32067, 3860,
// P34-35_P74-75.agc:615
//			RPPREC
// slot 32068
    32068, 3872,
// P34-35_P74-75.agc:616
//		CALL
// slot 32069
    32069, 65320,
// P34-35_P74-75.agc:617
//			GOINT
// slot 32070
    32070, 60290,
// P34-35_P74-75.agc:618
//		CALL
// slot 32071
    32071, 65320,
// P34-35_P74-75.agc:619
//			PASSIVE		# STORE NEW RPASS3 VPASS3
// slot 32072
    32072, 38222,
// P34-35_P74-75.agc:620
//		GOTO
// slot 32073
    32073, 65360,
// P34-35_P74-75.agc:621
//			ELCALC
// slot 32074
    32074, 59708,
// P34-35_P74-75.agc:622
//ELEX		DLOAD	DAD
// slot 32075
    32075, 36298,
// P34-35_P74-75.agc:623
//			TTPI
// slot 32076
    32076, 3942,
// P34-35_P74-75.agc:624
//			NOMTPI
// slot 32077
    32077, 2536,
// P34-35_P74-75.agc:625
//		STODL	TTPI
// slot 32078
    32078, 16230,
// P34-35_P74-75.agc:626
//		BON
// slot 32079
    32079, 65304,
// P34-35_P74-75.agc:627
//			ETPIFLAG
// slot 32080
    32080, 1424,
// P34-35_P74-75.agc:628
//			TIMEX
// slot 32081
    32081, 60070,
// P34-35_P74-75.agc:629
//		STORE	ELEV
// slot 32082
    32082, 4040,
// P34-35_P74-75.agc:630
//TIMEX		DLOAD	GOTO
// slot 32083
    32083, 43210,
// P34-35_P74-75.agc:631
//# Page 473
// P34-35_P74-75.agc:632
//			ZEROVECS
// slot 32084
    32084, 13754,
// P34-35_P74-75.agc:633
//			NORMEX
// slot 32085
    32085, 1472,
// P34-35_P74-75.agc:634
//
// P34-35_P74-75.agc:635
//# Page 474
// P34-35_P74-75.agc:636
//# ***** S34/35.1 *****
// P34-35_P74-75.agc:637
//
// P34-35_P74-75.agc:638
//# COMPUTE UNIT NORMAL AND LINE OF SIGHT VECTORS GIVEN THE ACTIVE AND
// P34-35_P74-75.agc:639
//# PASSIVE POS AND VEL AT TIME T3
// P34-35_P74-75.agc:640
//		SETLOC	S3435LOC
// P34-35_P74-75.agc:641
//		BANK
// P34-35_P74-75.agc:642
//
// P34-35_P74-75.agc:643
//S34/35.1	VLOAD	VSU
// slot 32768
    32768, 43514,
// P34-35_P74-75.agc:644
//			RPASS3
// slot 32769
    32769, 3800,
// P34-35_P74-75.agc:645
//			RACT3
// slot 32770
    32770, 3776,
// P34-35_P74-75.agc:646
//		UNIT	PUSH
// slot 32771
    32771, 34396,
// P34-35_P74-75.agc:647
//		STOVL	ULOS
// slot 32772
    32772, 23338,
// P34-35_P74-75.agc:648
//			RACT3
// slot 32773
    32773, 3776,
// P34-35_P74-75.agc:649
//		VXV	UNIT
// slot 32774
    32774, 44602,
// P34-35_P74-75.agc:650
//			VACT3
// slot 32775
    32775, 3788,
// P34-35_P74-75.agc:651
//		STORE	UNRM
// slot 32776
    32776, 2846,
// P34-35_P74-75.agc:652
//		RVQ
// slot 32777
    32777, 65308,
// P34-35_P74-75.agc:653
//
// P34-35_P74-75.agc:654
//# Page 475
// P34-35_P74-75.agc:655
//# ***** S34/35.2 *****
// P34-35_P74-75.agc:656
//
// P34-35_P74-75.agc:657
//# ADVANCE PASSIVE VEH TO RENDEZVOUS TIME AND GET REQ VEL FROM LAMBERT
// P34-35_P74-75.agc:658
//		SETLOC	CSI/CDH
// P34-35_P74-75.agc:659
//		BANK
// P34-35_P74-75.agc:660
//
// P34-35_P74-75.agc:661
//S34/35.2 	STQ	VLOAD
// slot 32086
    32086, 64800
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:662
//			SUBEXIT
// slot 32087
    32087, 2544,
// P34-35_P74-75.agc:663
//			VPASS3
// slot 32088
    32088, 3812,
// P34-35_P74-75.agc:664
//		PDVL	PDDL
// slot 32089
    32089, 54682,
// P34-35_P74-75.agc:665
//			RPASS3
// slot 32090
    32090, 3800,
// P34-35_P74-75.agc:666
//			INTIME
// slot 32091
    32091, 3718,
// P34-35_P74-75.agc:667
//		PDDL	PDDL
// slot 32092
    32092, 54698,
// P34-35_P74-75.agc:668
//			TPASS4
// slot 32093
    32093, 3932,
// P34-35_P74-75.agc:669
//			TWOPI		# CONIC
// slot 32094
    32094, 27790,
// P34-35_P74-75.agc:670
//		PDDL	BHIZ
// slot 32095
    32095, 39082,
// P34-35_P74-75.agc:671
//			NN
// slot 32096
    32096, 4076,
// P34-35_P74-75.agc:672
//			S3435.23
// slot 32097
    32097, 60104,
// P34-35_P74-75.agc:673
//		DLOAD	PDDL
// slot 32098
    32098, 54730,
// P34-35_P74-75.agc:674
//			ZEROVECS	# PRECISION
// slot 32099
    32099, 13754,
// P34-35_P74-75.agc:675
//S3435.23	CALL
// slot 32100
    32100, 65320,
// P34-35_P74-75.agc:676
//			INTINT		# GET TARGET VECTOR
// slot 32101
    32101, 60298,
// P34-35_P74-75.agc:677
//S3435.25	STOVL	RTARG
// slot 32102
    32102, 24090,
// P34-35_P74-75.agc:678
//			VATT
// slot 32103
    32103, 14,
// P34-35_P74-75.agc:679
//		STOVL	VPASS4
// slot 32104
    32104, 24384,
// P34-35_P74-75.agc:680
//			RTARG
// slot 32105
    32105, 3610,
// P34-35_P74-75.agc:681
//# COMPUTE PHI = PI + (ACOS(UNIT RA.UNIT RP) - PI) SIGN(RA*RP.U)
// P34-35_P74-75.agc:682
//		UNIT	PDVL		# UNIT RP
// slot 32106
    32106, 52572,
// P34-35_P74-75.agc:683
//			RACT3
// slot 32107
    32107, 3776,
// P34-35_P74-75.agc:684
//		UNIT	PUSH		# UNIT RA
// slot 32108
    32108, 34396,
// P34-35_P74-75.agc:685
//		VXV	DOT
// slot 32109
    32109, 41274,
// P34-35_P74-75.agc:686
//			0D
// slot 32110
    32110, 2,
// P34-35_P74-75.agc:687
//			UNRM		# RA*RP.U
// slot 32111
    32111, 2846,
// P34-35_P74-75.agc:688
//		PDVL
// slot 32112
    32112, 65434,
// P34-35_P74-75.agc:689
//		DOT	SL1		# UNIT RA.UNIT RP
// slot 32113
    32113, 59970,
// P34-35_P74-75.agc:690
//			0D
// slot 32114
    32114, 2,
// P34-35_P74-75.agc:691
//		ACOS	SIGN
// slot 32115
    32115, 62892,
// P34-35_P74-75.agc:692
//		BPL	DAD
// slot 32116
    32116, 36168,
// P34-35_P74-75.agc:693
//			NOPIE
// slot 32117
    32117, 60142,
// P34-35_P74-75.agc:694
//			DPPOSMAX	# REASONABLE TWO PI
// slot 32118
    32118, 13766,
// P34-35_P74-75.agc:695
//NOPIE		STODL	ACTCENT
// slot 32119
    32119, 15158,
// P34-35_P74-75.agc:696
//			TPASS4
// slot 32120
    32120, 3932,
// P34-35_P74-75.agc:697
//		DSU
// slot 32121
    32121, 65322,
// P34-35_P74-75.agc:698
//			INTIME
// slot 32122
    32122, 3718,
// P34-35_P74-75.agc:699
//		STORE	DELLT4
// slot 32123
    32123, 3622,
// P34-35_P74-75.agc:700
//		SLOAD	SETPD
// slot 32124
    32124, 33210,
// P34-35_P74-75.agc:701
//			NN		# NUMBER OF OFFSETS
// slot 32125
    32125, 4076,
// P34-35_P74-75.agc:702
//			0D
// slot 32126
    32126, 2,
// P34-35_P74-75.agc:703
//		PDDL	PDVL
// slot 32127
    32127, 52650,
// P34-35_P74-75.agc:704
//			EPSFOUR
// slot 32128
    32128, 27812,
// P34-35_P74-75.agc:705
//# Page 476
// P34-35_P74-75.agc:706
//			RACT3
// slot 32129
    32129, 3776,
// P34-35_P74-75.agc:707
//		STOVL	RINIT
// slot 32130
    32130, 24304,
// P34-35_P74-75.agc:708
//			VACT3
// slot 32131
    32131, 3788,
// P34-35_P74-75.agc:709
//		STCALL	VINIT
// slot 32132
    32132, 32508,
// P34-35_P74-75.agc:710
//			INITVEL
// slot 32133
    32133, 18432,
// P34-35_P74-75.agc:711
//		CALL
// slot 32134
    32134, 65320,
// P34-35_P74-75.agc:712
//			LOMAT
// slot 32135
    32135, 60268,
// P34-35_P74-75.agc:713
//		VLOAD	MXV
// slot 32136
    32136, 53754,
// P34-35_P74-75.agc:714
//			DELVEET3
// slot 32137
    32137, 3916,
// P34-35_P74-75.agc:715
//			0D
// slot 32138
    32138, 2,
// P34-35_P74-75.agc:716
//		VSL1
// slot 32139
    32139, 65524,
// P34-35_P74-75.agc:717
//		STCALL	DELVLVC
// slot 32140
    32140, 32266,
// P34-35_P74-75.agc:718
//			SUBEXIT
// slot 32141
    32141, 2544,
// P34-35_P74-75.agc:719
//
// P34-35_P74-75.agc:720
//# Page 477
// P34-35_P74-75.agc:721
//# ***** S34/35.3 *****
// P34-35_P74-75.agc:722
//
// P34-35_P74-75.agc:723
//S34/35.3	STQ	CALL
// slot 32142
    32142, 37920,
// P34-35_P74-75.agc:724
//			NORMEX
// slot 32143
    32143, 1472,
// P34-35_P74-75.agc:725
//			LOMAT		# GET MATRIX IN PUSH LIST
// slot 32144
    32144, 60268,
// P34-35_P74-75.agc:726
//		VLOAD	VXM
// slot 32145
    32145, 50682,
// P34-35_P74-75.agc:727
//			DELVLVC		# NEW DEL V TPI
// slot 32146
    32146, 3594,
// P34-35_P74-75.agc:728
//			0D
// slot 32147
    32147, 2,
// P34-35_P74-75.agc:729
//		VSL1
// slot 32148
    32148, 65524,
// P34-35_P74-75.agc:730
//		STORE	DELVEET3	# SAVE FOR TRANSFORM
// slot 32149
    32149, 3916,
// P34-35_P74-75.agc:731
//		VAD	PDVL
// slot 32150
    32150, 52570,
// P34-35_P74-75.agc:732
//			VACT3		# NEW V REQ
// slot 32151
    32151, 3788,
// P34-35_P74-75.agc:733
//			RACT3
// slot 32152
    32152, 3776,
// P34-35_P74-75.agc:734
//		PDDL	PDDL
// slot 32153
    32153, 54698,
// P34-35_P74-75.agc:735
//			TIG
// slot 32154
    32154, 3606,
// P34-35_P74-75.agc:736
//			TPASS4
// slot 32155
    32155, 3932,
// P34-35_P74-75.agc:737
//		PDDL	PUSH
// slot 32156
    32156, 34474,
// P34-35_P74-75.agc:738
//			DPPOSMAX
// slot 32157
    32157, 13766,
// P34-35_P74-75.agc:739
//		CALL			# INTEG. FOR NEW TARGET VEC
// slot 32158
    32158, 65320,
// P34-35_P74-75.agc:740
//			INTINT
// slot 32159
    32159, 60298,
// P34-35_P74-75.agc:741
//		VLOAD
// slot 32160
    32160, 65530,
// P34-35_P74-75.agc:742
//			RATT
// slot 32161
    32161, 2,
// P34-35_P74-75.agc:743
//		STORE	RTARG
// slot 32162
    32162, 3610,
// P34-35_P74-75.agc:744
//NOVRWRT		VLOAD	PUSH
// slot 32163
    32163, 34554,
// P34-35_P74-75.agc:745
//			ULOS
// slot 32164
    32164, 2858,
// P34-35_P74-75.agc:746
//		VXV	VCOMP
// slot 32165
    32165, 48698,
// P34-35_P74-75.agc:747
//			UNRM
// slot 32166
    32166, 2846,
// P34-35_P74-75.agc:748
//		UNIT	PUSH
// slot 32167
    32167, 34396,
// P34-35_P74-75.agc:749
//		VXV	VSL1
// slot 32168
    32168, 64058,
// P34-35_P74-75.agc:750
//			ULOS
// slot 32169
    32169, 2858,
// P34-35_P74-75.agc:751
//		PDVL
// slot 32170
    32170, 65434,
// P34-35_P74-75.agc:752
//		PDVL	MXV
// slot 32171
    32171, 53658,
// P34-35_P74-75.agc:753
//			DELVEET3
// slot 32172
    32172, 3916,
// P34-35_P74-75.agc:754
//			0D
// slot 32173
    32173, 2,
// P34-35_P74-75.agc:755
//		VSL1
// slot 32174
    32174, 65524,
// P34-35_P74-75.agc:756
//		STCALL	DVLOS
// slot 32175
    32175, 31506,
// P34-35_P74-75.agc:757
//			NORMEX
// slot 32176
    32176, 1472,
// P34-35_P74-75.agc:758
//
// P34-35_P74-75.agc:759
//# Page 478
// P34-35_P74-75.agc:760
//# ***** S34/35.4 *****
// P34-35_P74-75.agc:761
//
// P34-35_P74-75.agc:762
//S34/35.4	STQ	SETPD		# NO ASTRONAUT OVERWRITE
// slot 32177
    32177, 33056,
// P34-35_P74-75.agc:763
//			NORMEX
// slot 32178
    32178, 1472,
// P34-35_P74-75.agc:764
//			0D
// slot 32179
    32179, 2,
// P34-35_P74-75.agc:765
//		GOTO
// slot 32180
    32180, 65360,
// P34-35_P74-75.agc:766
//			NOVRWRT
// slot 32181
    32181, 60230,
// P34-35_P74-75.agc:767
//
// P34-35_P74-75.agc:768
//# Page 479
// P34-35_P74-75.agc:769
//# ***** LOMAT *****
// P34-35_P74-75.agc:770
//
// P34-35_P74-75.agc:771
//LOMAT		VLOAD	VCOMP
// slot 32182
    32182, 48890,
// P34-35_P74-75.agc:772
//			UNRM
// slot 32183
    32183, 2846,
// P34-35_P74-75.agc:773
//		STOVL	6D		# Y
// slot 32184
    32184, 20494,
// P34-35_P74-75.agc:774
//			RACT3
// slot 32185
    32185, 3776,
// P34-35_P74-75.agc:775
//		UNIT	VCOMP
// slot 32186
    32186, 48732,
// P34-35_P74-75.agc:776
//		STORE	12D
// slot 32187
    32187, 26,
// P34-35_P74-75.agc:777
//		VXV	VSL1
// slot 32188
    32188, 64058,
// P34-35_P74-75.agc:778
//			UNRM		# Z*-Y
// slot 32189
    32189, 2846,
// P34-35_P74-75.agc:779
//		STORE	0D
// slot 32190
    32190, 2,
// P34-35_P74-75.agc:780
//		SETPD	RVQ
// slot 32191
    32191, 36354,
// P34-35_P74-75.agc:781
//			18D
// slot 32192
    32192, 38,
// P34-35_P74-75.agc:782
//GOINT		PDDL	PDDL		# DO
// slot 32193
    32193, 54698,
// P34-35_P74-75.agc:783
//			ZEROVECS	#	NOT
// slot 32194
    32194, 13754,
// P34-35_P74-75.agc:784
//			NOMTPI		#
// slot 32195
    32195, 2536,
// P34-35_P74-75.agc:785
//		PUSH	PUSH		#		ORDER OR INSERT BEFORE INTINT
// slot 32196
    32196, 34316,
// P34-35_P74-75.agc:786
//INTINT		STQ	CALL
// slot 32197
    32197, 37920,
// P34-35_P74-75.agc:787
//			RTRN
// slot 32198
    32198, 2542,
// P34-35_P74-75.agc:788
//			INTSTALL
// slot 32199
    32199, 24132,
// P34-35_P74-75.agc:789
//		CLEAR	DLOAD
// slot 32200
    32200, 58648
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:790
//			INTYPFLG
// slot 32201
    32201, 1910,
// P34-35_P74-75.agc:791
//		BZE	SET
// slot 32202
    32202, 35928,
// P34-35_P74-75.agc:792
//			+2
// slot 32203
    32203, 60314,
// P34-35_P74-75.agc:793
//			INTYPFLG
// slot 32204
    32204, 1654,
// P34-35_P74-75.agc:794
//		DLOAD	STADR
// slot 32205
    32205, 38602,
// P34-35_P74-75.agc:795
//		STODL	TDEC1
// slot 32206
    32206, 53180,
// P34-35_P74-75.agc:796
//		SET	LXA,2
// slot 32207
    32207, 60440,
// P34-35_P74-75.agc:797
//			MOONFLAG
// slot 32208
    32208, 102,
// P34-35_P74-75.agc:798
//			RTX2
// slot 32209
    32209, 4044,
// P34-35_P74-75.agc:799
//		BON	CLEAR
// slot 32210
    32210, 35864,
// P34-35_P74-75.agc:800
//			CMOONFLG
// slot 32211
    32211, 4486,
// P34-35_P74-75.agc:801
//			ALLSET
// slot 32212
    32212, 60332,
// P34-35_P74-75.agc:802
//			MOONFLAG
// slot 32213
    32213, 358,
// P34-35_P74-75.agc:803
//ALLSET		STOVL	TET
// slot 32214
    32214, 22174,
// P34-35_P74-75.agc:804
//		VSR*
// slot 32215
    32215, 65374,
// P34-35_P74-75.agc:805
//			0,2
// slot 32216
    32216, 48380,
// P34-35_P74-75.agc:806
//		STOVL	RCV
// slot 32217
    32217, 22202,
// P34-35_P74-75.agc:807
//		VSR*
// slot 32218
    32218, 65374,
// P34-35_P74-75.agc:808
//			0,2
// slot 32219
    32219, 48380,
// P34-35_P74-75.agc:809
//		STCALL	VCV
// slot 32220
    32220, 30406,
// P34-35_P74-75.agc:810
//			INTEGRVS
// slot 32221
    32221, 23738,
// P34-35_P74-75.agc:811
//		VLOAD	GOTO
// slot 32222
    32222, 43258,
// P34-35_P74-75.agc:812
//			RATT
// slot 32223
    32223, 2,
// P34-35_P74-75.agc:813
//			RTRN
// slot 32224
    32224, 2542,
// P34-35_P74-75.agc:814
//
// P34-35_P74-75.agc:815
//# Page 480
// P34-35_P74-75.agc:816
//# ***** S34/35.5 *****
// P34-35_P74-75.agc:817
//#
// P34-35_P74-75.agc:818
//# SUBROUTINES USED
// P34-35_P74-75.agc:819
//#	BANKCALL
// P34-35_P74-75.agc:820
//#	GOFLASH
// P34-35_P74-75.agc:821
//#	GOTOPOOH
// P34-35_P74-75.agc:822
//#	S34/35.3
// P34-35_P74-75.agc:823
//#	S34.35.4
// P34-35_P74-75.agc:824
//#	VNPOOH
// P34-35_P74-75.agc:825
//
// P34-35_P74-75.agc:826
//S34/35.5	STQ	BON
// slot 32225
    32225, 35872,
// P34-35_P74-75.agc:827
//			SUBEXIT
// slot 32226
    32226, 2544,
// P34-35_P74-75.agc:828
//			FINALFLG
// slot 32227
    32227, 1426,
// P34-35_P74-75.agc:829
//			FLAGON
// slot 32228
    32228, 60368,
// P34-35_P74-75.agc:830
//		SET	GOTO
// slot 32229
    32229, 43032,
// P34-35_P74-75.agc:831
//			UPDATFLG
// slot 32230
    32230, 624,
// P34-35_P74-75.agc:832
//			FLAGOFF
// slot 32231
    32231, 60404,
// P34-35_P74-75.agc:833
//FLAGON		VLOAD
// slot 32232
    32232, 65530,
// P34-35_P74-75.agc:834
//			DELVLVC
// slot 32233
    32233, 3594,
// P34-35_P74-75.agc:835
//		STORE	DVLOS		# SAVE DELTA V BEFORE DISPLAY
// slot 32234
    32234, 2834,
// P34-35_P74-75.agc:836
//		EXIT
// slot 32235
    32235, 65532
)).

// bank 35, slots 32236-32238
function agcAotUnit1816 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32236 {
// P34-35_P74-75.agc:837
// 		CAF	V06N81
// slot 32236
        if slot <> 32236 or instruction <> 14736 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2448), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32237 {
// P34-35_P74-75.agc:838
// 		TC	VNPOOH
// slot 32237
            if slot <> 32237 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:839
// 		TC	INTPRET
// slot 32238
            if slot <> 32238 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1816] to agcAotUnit1816@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:840
// 		VLOAD	VSU		# TEST FOR OVERWRITE OF COMPUTED
// slot 32239
    32239, 43514,
// P34-35_P74-75.agc:841
// 			DELVLVC		#                      DELTA V
// slot 32240
    32240, 3594,
// P34-35_P74-75.agc:842
// 			DVLOS
// slot 32241
    32241, 2834,
// P34-35_P74-75.agc:843
// 		ABVAL	BZE
// slot 32242
    32242, 44108,
// P34-35_P74-75.agc:844
// 			NOCHG		# NO OVERWRITE
// slot 32243
    32243, 60396,
// P34-35_P74-75.agc:845
// 		CALL
// slot 32244
    32244, 65320,
// P34-35_P74-75.agc:846
// 			S34/35.3
// slot 32245
    32245, 60188,
// P34-35_P74-75.agc:847
//NOCHG		CLEAR	VLOAD
// slot 32246
    32246, 64792,
// P34-35_P74-75.agc:848
//			XDELVFLG
// slot 32247
    32247, 1390,
// P34-35_P74-75.agc:849
//			DELVEET3
// slot 32248
    32248, 3916,
// P34-35_P74-75.agc:850
//		STORE	DELVSIN
// slot 32249
    32249, 3916,
// P34-35_P74-75.agc:851
//FLAGOFF		CALL
// slot 32250
    32250, 65320,
// P34-35_P74-75.agc:852
//			S34/35.4
// slot 32251
    32251, 60258,
// P34-35_P74-75.agc:853
//		EXIT
// slot 32252
    32252, 65532
)).

// bank 35, slots 32253-32255
function agcAotUnit1817 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32253 {
// P34-35_P74-75.agc:854
//		CAF	V06N59
// slot 32253
        if slot <> 32253 or instruction <> 14735 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2447), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32254 {
// P34-35_P74-75.agc:855
//		TC	VNPOOH
// slot 32254
            if slot <> 32254 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:856
//		TC	INTPRET
// slot 32255
            if slot <> 32255 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1817] to agcAotUnit1817@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:857
//		GOTO
// slot 32256
    32256, 65360,
// P34-35_P74-75.agc:858
//			SUBEXIT
// slot 32257
    32257, 2544,
// P34-35_P74-75.agc:859
//
// P34-35_P74-75.agc:860
//# Page 481
// P34-35_P74-75.agc:861
//# ***** VN1645 *****
// P34-35_P74-75.agc:862
//#
// P34-35_P74-75.agc:863
//# SUBROUTINES USED
// P34-35_P74-75.agc:864
//#	P3XORP7X
// P34-35_P74-75.agc:865
//#	GET+MGA
// P34-35_P74-75.agc:866
//#	BANKCALL
// P34-35_P74-75.agc:867
//#	DELAYJOB
// P34-35_P74-75.agc:868
//#	COMPTGO
// P34-35_P74-75.agc:869
//#	GOFLASHR
// P34-35_P74-75.agc:870
//#	GOTOPOOH
// P34-35_P74-75.agc:871
//#	FLAGUP
// P34-35_P74-75.agc:872
//
// P34-35_P74-75.agc:873
//VN1645		STQ	DLOAD
// slot 32258
    32258, 58656,
// P34-35_P74-75.agc:874
//			SUBEXIT
// slot 32259
    32259, 2544,
// P34-35_P74-75.agc:875
//			DP-.01
// slot 32260
    32260, 27808,
// P34-35_P74-75.agc:876
//		STORE	+MGA		# MGA = -.01
// slot 32261
    32261, 3884,
// P34-35_P74-75.agc:877
//		BOFF	DLOAD
// slot 32262
    32262, 58648,
// P34-35_P74-75.agc:878
//			FINALFLG
// slot 32263
    32263, 1490,
// P34-35_P74-75.agc:879
//			GET45
// slot 32264
    32264, 60464,
// P34-35_P74-75.agc:880
//			DP-.01
// slot 32265
    32265, 27808,
// P34-35_P74-75.agc:881
//		DAD
// slot 32266
    32266, 65306,
// P34-35_P74-75.agc:882
//			DP-.01
// slot 32267
    32267, 27808,
// P34-35_P74-75.agc:883
//		STORE	+MGA		# MGA = -.02
// slot 32268
    32268, 3884,
// P34-35_P74-75.agc:884
//		BOFF	EXIT
// slot 32269
    32269, 65048,
// P34-35_P74-75.agc:885
//			REFSMFLG
// slot 32270
    32270, 1988,
// P34-35_P74-75.agc:886
//			GET45
// slot 32271
    32271, 60464
)).

// bank 35, slots 32272-32275
function agcAotUnit1818 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32273 {
        if slot <= 32272 {
// P34-35_P74-75.agc:887
//		TC	P3XORP7X
// slot 32272
            if slot <> 32272 or instruction <> 1600 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1600, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:888
//		TC	+2		# P3X
// slot 32273
            if slot <> 32273 or instruction <> 1555 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1555, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32274 {
// P34-35_P74-75.agc:889
//		TC	GET45 +1	# P7X
// slot 32274
            if slot <> 32274 or instruction <> 1561 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1561, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:890
//		TC	INTPRET
// slot 32275
            if slot <> 32275 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1818] to agcAotUnit1818@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:891
//		VLOAD	PUSH
// slot 32276
    32276, 34554,
// P34-35_P74-75.agc:892
//			DELVSIN
// slot 32277
    32277, 3916,
// P34-35_P74-75.agc:893
//		CALL			# COMPUTE MGA
// slot 32278
    32278, 65320,
// P34-35_P74-75.agc:894
//			GET+MGA
// slot 32279
    32279, 9048,
// P34-35_P74-75.agc:895
//GET45		EXIT
// slot 32280
    32280, 65532
)).

// bank 35, slots 32281-32285
function agcAotUnit1819 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32282 {
        if slot <= 32281 {
// P34-35_P74-75.agc:896
//		TC	COMPTGO		# INITIATE TASK TO UPDATE TTOGO
// slot 32281
            if slot <> 32281 or instruction <> 1732 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1732, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:897
//		CA	SUBEXIT
// slot 32282
            if slot <> 32282 or instruction <> 13304 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1016).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32283 {
// P34-35_P74-75.agc:898
//		TS	QSAVED
// slot 32283
            if slot <> 32283 or instruction <> 23542 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23542, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32284 {
// P34-35_P74-75.agc:899
//		CAF	1SEC
// slot 32284
                if slot <> 32284 or instruction <> 14881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:900
//		TC	BANKCALL
// slot 32285
                if slot <> 32285 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1819] to agcAotUnit1819@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:901
//		CADR	DELAYJOB
// slot 32286
    32286, 1972
)).

// bank 35, slots 32287-32288
function agcAotUnit1820 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32287 {
// P34-35_P74-75.agc:902
//		CAF	V16N45		# TRKMKCNT, TTOGO, +MGA
// slot 32287
        if slot <> 32287 or instruction <> 14737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2449), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:903
//		TC	BANKCALL
// slot 32288
        if slot <> 32288 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1820] to agcAotUnit1820@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:904
//		CADR	GOFLASH
// slot 32289
    32289, 17312
)).

// bank 35, slots 32290-32300
function agcAotUnit1821 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32294 {
        if slot <= 32291 {
            if slot <= 32290 {
// P34-35_P74-75.agc:905
//		TC	KILCLOCK	# TERMINATE
// slot 32290
                if slot <> 32290 or instruction <> 1573 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1573, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:906
//		TC	N45PROC		# PROCEED
// slot 32291
                if slot <> 32291 or instruction <> 1576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1576, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32292 {
// P34-35_P74-75.agc:907
//		TC	CLUPDATE	# RECYCLE -- RETURN FOR INITIAL COMPUTATION
// slot 32292
                if slot <> 32292 or instruction <> 1584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32293 {
// P34-35_P74-75.agc:908
//KILCLOCK	CA	Z
// slot 32293
                    if slot <> 32293 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:909
//		TS	DISPDEX
// slot 32294
                    if slot <> 32294 or instruction <> 22528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32297 {
            if slot <= 32295 {
// P34-35_P74-75.agc:910
//# Page 482
// P34-35_P74-75.agc:911
//		TC	GOTOPOOH
// slot 32295
                if slot <> 32295 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32296 {
// P34-35_P74-75.agc:912
//N45PROC		CS	FLAGWRD2
// slot 32296
                    if slot <> 32296 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:913
//		MASK	BIT6
// slot 32297
                    if slot <> 32297 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
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
            if slot <= 32298 {
// P34-35_P74-75.agc:914
//		EXTEND
// slot 32298
                if slot <> 32298 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32299 {
// P34-35_P74-75.agc:915
//		BZF	KILCLOCK	# FINALFLG IS SET -- FLASH V37 -- AWAIT NEW PGM
// slot 32299
                    if slot <> 32299 or instruction <> 5669 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:916
//		TC	PHASCHNG
// slot 32300
                    if slot <> 32300 or instruction <> 2826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2826, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1821] to agcAotUnit1821@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:917
//		OCT	04024
// slot 32301
    32301, 4136
)).

// bank 35, slots 32302-32302
function agcAotUnit1822 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:918
//		TC	UPFLAG		# SET
// slot 32302
    if slot <> 32302 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1822] to agcAotUnit1822@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:919
//		ADRES	FINALFLG	# FINALFLG
// slot 32303
    32303, 78
)).

// bank 35, slots 32304-32306
function agcAotUnit1823 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32304 {
// P34-35_P74-75.agc:920
//CLUPDATE	CA	Z
// slot 32304
        if slot <> 32304 or instruction <> 12293 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 5).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32305 {
// P34-35_P74-75.agc:921
//		TS	DISPDEX
// slot 32305
            if slot <> 32305 or instruction <> 22528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:922
//		TC	PHASCHNG
// slot 32306
            if slot <> 32306 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1823] to agcAotUnit1823@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:923
//		OCT	04024
// slot 32307
    32307, 4136
)).

// bank 35, slots 32308-32308
function agcAotUnit1824 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:924
//		TC	INTPRET
// slot 32308
    if slot <> 32308 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1824] to agcAotUnit1824@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:925
//		CLEAR	GOTO
// slot 32309
    32309, 43032,
// P34-35_P74-75.agc:926
//			UPDATFLG
// slot 32310
    32310, 880,
// P34-35_P74-75.agc:927
//			QSAVED
// slot 32311
    32311, 2540
)).

// bank 35, slots 32312-32315
function agcAotUnit1825 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32313 {
        if slot <= 32312 {
// P34-35_P74-75.agc:928
//
// P34-35_P74-75.agc:929
//# Page 483
// P34-35_P74-75.agc:930
//# ***** DISPLAYE *****
// P34-35_P74-75.agc:931
//#
// P34-35_P74-75.agc:932
//# SUBROUTINES USED
// P34-35_P74-75.agc:933
//#	BANKCALL
// P34-35_P74-75.agc:934
//#	GOFLASHR
// P34-35_P74-75.agc:935
//#	GOTOPOOH
// P34-35_P74-75.agc:936
//#	BLANKET
// P34-35_P74-75.agc:937
//#	ENDOFJOB
// P34-35_P74-75.agc:938
//
// P34-35_P74-75.agc:939
//DISPLAYE	EXTEND
// slot 32312
            if slot <> 32312 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:940
//		QXCH	NORMEX
// slot 32313
            if slot <> 32313 or instruction <> 9952 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 736, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32314 {
// P34-35_P74-75.agc:941
//		CAF	V06N55
// slot 32314
            if slot <> 32314 or instruction <> 14733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2445), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:942
//		TCR	BANKCALL
// slot 32315
            if slot <> 32315 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1825] to agcAotUnit1825@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:943
//		CADR	GOFLASH
// slot 32316
    32316, 17312
)).

// bank 35, slots 32317-32325
function agcAotUnit1826 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32320 {
        if slot <= 32318 {
            if slot <= 32317 {
// P34-35_P74-75.agc:944
//		TCF	GOTOPOOH
// slot 32317
                if slot <> 32317 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:945
//		TC	NORMEX
// slot 32318
                if slot <> 32318 or instruction <> 736 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 736, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32319 {
// P34-35_P74-75.agc:946
//		TCF	-5
// slot 32319
                if slot <> 32319 or instruction <> 5690 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5690, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:947
//
// P34-35_P74-75.agc:948
//# Page 484
// P34-35_P74-75.agc:949
//# ***** P3XORP7X *****
// P34-35_P74-75.agc:950
//
// P34-35_P74-75.agc:951
//P3XORP7X	CAF	HIGH9
// slot 32320
                if slot <> 32320 or instruction <> 16331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32322 {
            if slot <= 32321 {
// P34-35_P74-75.agc:952
//		MASK	MODREG
// slot 32321
                if slot <> 32321 or instruction <> 29193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:953
//		EXTEND
// slot 32322
                if slot <> 32322 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32323 {
// P34-35_P74-75.agc:954
//		BZF	+2
// slot 32323
                if slot <> 32323 or instruction <> 5701 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5701, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32324 {
// P34-35_P74-75.agc:955
//		INCR	Q
// slot 32324
                    if slot <> 32324 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:956
//		RETURN
// slot 32325
                    if slot <> 32325 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1826] to agcAotUnit1826@.

// bank 02, slots 4477-4484
function agcAotUnit166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4480 {
        if slot <= 4478 {
            if slot <= 4477 {
// P34-35_P74-75.agc:957
//
// P34-35_P74-75.agc:958
//# ***** VNPOOH *****
// P34-35_P74-75.agc:959
//#
// P34-35_P74-75.agc:960
//# SUBROUTINES USED
// P34-35_P74-75.agc:961
//#	BANKCALL
// P34-35_P74-75.agc:962
//#	GOFLASH
// P34-35_P74-75.agc:963
//#	GOTOPOOH
// P34-35_P74-75.agc:964
//
// P34-35_P74-75.agc:965
//		SETLOC P30SUBS
// P34-35_P74-75.agc:966
//		BANK
// P34-35_P74-75.agc:967
//
// P34-35_P74-75.agc:968
//VNPOOH		EXTEND
// slot 4477
                if slot <> 4477 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:969
//		QXCH	RTRN
// slot 4478
                if slot <> 4478 or instruction <> 10231 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 1015, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4479 {
// P34-35_P74-75.agc:970
//		TS	VERBNOUN
// slot 4479
                if slot <> 4479 or instruction <> 23541 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23541, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:971
//		CAF	VNBANK		# ***** THIS ROUTINE MUST REMAIN IN
// slot 4480
                if slot <> 4480 or instruction <> 14728 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2440), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4482 {
            if slot <= 4481 {
// P34-35_P74-75.agc:972
//		XCH	FBANK		#       FIXED-FIXED *****
// slot 4481
                if slot <> 4481 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:973
//		TS	TBASE5		# * WATCH OUT *
// slot 4482
                if slot <> 4482 or instruction <> 23091 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23091, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4483 {
// P34-35_P74-75.agc:974
//
// P34-35_P74-75.agc:975
//		CA	VERBNOUN
// slot 4483
                if slot <> 4483 or instruction <> 13301 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1013).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:976
//		TCR	BANKCALL
// slot 4484
                if slot <> 4484 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[166] to agcAotUnit166@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:977
//		CADR	GOFLASH
// slot 4485
    4485, 17312
)).

// bank 02, slots 4486-4491
function agcAotUnit167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4488 {
        if slot <= 4486 {
// P34-35_P74-75.agc:978
//		TCF	GOTOPOOH
// slot 4486
            if slot <> 4486 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4487 {
// P34-35_P74-75.agc:979
//		TCF	+2
// slot 4487
                if slot <> 4487 or instruction <> 6537 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6537, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:980
//VNBANK		TC	-5
// slot 4488
                if slot <> 4488 or instruction <> 2435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2435, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4489 {
// P34-35_P74-75.agc:981
//
// P34-35_P74-75.agc:982
//		CA	TBASE5
// slot 4489
            if slot <> 4489 or instruction <> 12851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 563).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4490 {
// P34-35_P74-75.agc:983
//		TS	FBANK
// slot 4490
                if slot <> 4490 or instruction <> 22532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:984
//		TC	RTRN
// slot 4491
                if slot <> 4491 or instruction <> 1015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1015, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[167] to agcAotUnit167@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:985
//
// P34-35_P74-75.agc:986
//# Page 485
// P34-35_P74-75.agc:987
//# ***** CONSTANTS *****
// P34-35_P74-75.agc:988
//
// P34-35_P74-75.agc:989
//V06N37		VN	0637
// slot 4492
    4492, 1610,
// P34-35_P74-75.agc:990
//V06N55		VN	0655
// slot 4493
    4493, 1646,
// P34-35_P74-75.agc:991
//V06N58		VN	0658
// slot 4494
    4494, 1652,
// P34-35_P74-75.agc:992
//V06N59		VN	0659
// slot 4495
    4495, 1654,
// P34-35_P74-75.agc:993
//V06N81		VN	0681
// slot 4496
    4496, 1698,
// P34-35_P74-75.agc:994
//V16N45		VN	1645
// slot 4497
    4497, 4186,
// P34-35_P74-75.agc:995
//		SETLOC	CSI/CDH
// P34-35_P74-75.agc:996
//		BANK
// P34-35_P74-75.agc:997
//
// P34-35_P74-75.agc:998
//TWOPI		2DEC	6.283185307 B-4
// slot 32326 32327
    32326, 12866, 32327, 32170,
// P34-35_P74-75.agc:999
//MAX250		2DEC	25 E3 B-28	# RSB 2004 added the B-28. OH 2009 leave?
// slot 32328 32329
    32328, 2, 32329, 17232,
// P34-35_P74-75.agc:1000
//THIRD		2DEC	.333333333
// slot 32330 32331
    32330, 10922, 32331, 10922,
// P34-35_P74-75.agc:1001
//ELEPS		2DEC	.27777777 E-3
// slot 32332 32333
    32332, 8, 32333, 18058,
// P34-35_P74-75.agc:1002
//DECTWO		OCT	2
// slot 32334
    32334, 4,
// P34-35_P74-75.agc:1003
//DP-.01		OCT	77777		# CONSTANTS
// slot 32335
    32335, 65534,
// P34-35_P74-75.agc:1004
//		OCT	61337		# ADJACENT	-.01 FOR MGA DSP
// slot 32336
    32336, 50622,
// P34-35_P74-75.agc:1005
//EPSFOUR		2DEC	.0416666666
// slot 32337 32338
    32337, 1364, 32338, 21846,
// P34-35_P74-75.agc:1006
//
// P34-35_P74-75.agc:1007
//# Page 486
// P34-35_P74-75.agc:1008
//# ***** INITVEL *****
// P34-35_P74-75.agc:1009
//# MOD NO -1			LOG SECTION -- P34-P35, P74-P75
// P34-35_P74-75.agc:1010
//# MOD BY WHITE, P.		DATE:  21 NOV 67
// P34-35_P74-75.agc:1011
//#
// P34-35_P74-75.agc:1012
//# FUNCTIONAL DESCRIPTION
// P34-35_P74-75.agc:1013
//#	THIS SUBROUTINE COMPUTES THE REQUIRED INITIAL VELOCITY VECTOR FOR
// P34-35_P74-75.agc:1014
//#	A TRAJECTORY OF SPECIFIC TRANSFER TIME BETWEEN SPECIFIED INITIAL
// P34-35_P74-75.agc:1015
//#	AND TARGET POSITIONS.  THE TRAJECTORY MAY BE EITHER CONIC OR
// P34-35_P74-75.agc:1016
//#	PRECISION DEPENDING ON AN INPUT PARAMETER (NAMELY, NUMBER OF
// P34-35_P74-75.agc:1017
//#	OFFSETS).  IN ADDITION, IN THE PRECISION TRAJECTORY CASE, THE
// P34-35_P74-75.agc:1018
//#	SUBROUTINE ALSO COMPUTES AN OFFSET TARGET VECTOR, TO BE USED
// P34-35_P74-75.agc:1019
//#	DURING PURE-CONIC CROSS-PRODUCT STEERING.  THE OFFSET TARGET
// P34-35_P74-75.agc:1020
//#	VECTOR IS THE TERMINAL POSITION VECTOR OF A CONIC TRAJECTORY WHICH
// P34-35_P74-75.agc:1021
//#	HAS THE SAME INITIAL STATE AS A PRECISION TRAJECTORY WHOSE
// P34-35_P74-75.agc:1022
//#	TERMINAL POSITION VECTOR IS THE SPECIFIED TARGET VECTOR.
// P34-35_P74-75.agc:1023
//#
// P34-35_P74-75.agc:1024
//#	IN ORDER TO AVOID THE INHERENT SINGULARITIES IN THE 180 DEGREE
// P34-35_P74-75.agc:1025
//#	TRANSFER CASE WHEN THE (TRUE OR OFFSET) TARGET VECTOR MAY BE
// P34-35_P74-75.agc:1026
//#	SLIGHTLY OUT OF THE ORBITAL PLANE, THIS SUBROUTINE ROTATES THIS
// P34-35_P74-75.agc:1027
//#	VECTOR INTO A PLANE DEFINED BY THE INPUT INITIAL POSITION VECTOR
// P34-35_P74-75.agc:1028
//#	AND ANOTHER INPUT VECTOR (USUALLY THE INITIAL VELOCITY VECTOR),
// P34-35_P74-75.agc:1029
//#	WHENEVER THE INPUT TARGET VECTOR LIES INSIDE A CONE WHOSE VERTEX
// P34-35_P74-75.agc:1030
//#	IS THE ORIGIN OF COORDINATES, WHOSE AXIS IS THE 180 DEGREE
// P34-35_P74-75.agc:1031
//#	TRANSFER DIRECTION, AND WHOSE CONE ANGLE IS SPECIFIED BY THE USER.
// P34-35_P74-75.agc:1032
//#
// P34-35_P74-75.agc:1033
//#	THE LAMBERT SUBROUTINE IS UTILIZED FOR THE CONIC COMPUTATIONS AND
// P34-35_P74-75.agc:1034
//#	THE COASTING INTEGRATION SUBROUTINE IS UTILIZED FOR THE PRECISION
// P34-35_P74-75.agc:1035
//#	TRAJECTORY COMPUTATIONS.
// P34-35_P74-75.agc:1036
//#
// P34-35_P74-75.agc:1037
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1038
//#	L	CALL
// P34-35_P74-75.agc:1039
//#	L+1		INITVEL
// P34-35_P74-75.agc:1040
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1041
//#
// P34-35_P74-75.agc:1042
//# INPUT
// P34-35_P74-75.agc:1043
//#	(1)	RINIT		INITIAL POSITION RADIUS VECTOR
// P34-35_P74-75.agc:1044
//#	(2)	VINIT		INITIAL POSITION VELOCITY VECTOR
// P34-35_P74-75.agc:1045
//#	(3)	RTARG		TARGET POSITION RADIUS VECTOR
// P34-35_P74-75.agc:1046
//#	(4)	DELLT4		DESIRED TIME OF FLIGHT FROM RINIT TO RTARG
// P34-35_P74-75.agc:1047
//#	(5)	INTIME		TIME OF RINIT
// P34-35_P74-75.agc:1048
//#	(6)	0D		NUMBER OF ITERATIONS OF LAMBERT/INTEGRVS
// P34-35_P74-75.agc:1049
//#	(7)	2D		ANGLE TO 180 DEGREES WHEN ROTATION STARTS
// P34-35_P74-75.agc:1050
//#	(8)	RTX1		-2 FOR EARTH, -10D FOR LUNAR
// P34-35_P74-75.agc:1051
//#	(9)	RTX2		COORDINATE SYSTEM ORIGIN -- 0 FOR EARTH, 2 FOR LUNAR
// P34-35_P74-75.agc:1052
//#	PUSHLOC SET AT 4D
// P34-35_P74-75.agc:1053
//#
// P34-35_P74-75.agc:1054
//# Page 487
// P34-35_P74-75.agc:1055
//# OUTPUT
// P34-35_P74-75.agc:1056
//#	(1)	RTARG		OFFSET TARGET POSITION VECTOR
// P34-35_P74-75.agc:1057
//#	(2)	VIPRIME		MANEUVER VELOCITY REQUIRED
// P34-35_P74-75.agc:1058
//#	(3)	VTPRIME		VELOCITY AT TARGET AFTER MANEUVER
// P34-35_P74-75.agc:1059
//#	(4)	DELVEET3	DELTA VELOCITY REQUIRED FOR MANEUVER
// P34-35_P74-75.agc:1060
//#
// P34-35_P74-75.agc:1061
//# SUBROUTINES USED
// P34-35_P74-75.agc:1062
//#	LAMBERT
// P34-35_P74-75.agc:1063
//#	INTSTALL
// P34-35_P74-75.agc:1064
//#	INTEGRVS
// P34-35_P74-75.agc:1065
//
// P34-35_P74-75.agc:1066
//		SETLOC	INTVEL
// P34-35_P74-75.agc:1067
//		BANK
// P34-35_P74-75.agc:1068
//
// P34-35_P74-75.agc:1069
//		COUNT	11/INITV
// P34-35_P74-75.agc:1070
//INITVEL		SET			# COGA GUESS NOT AVAILABLE
// slot 11264
    11264, 65304,
// P34-35_P74-75.agc:1071
//			GUESSW
// slot 11265
    11265, 634,
// P34-35_P74-75.agc:1072
//HAVEGUES	VLOAD	STQ
// slot 11266
    11266, 37114,
// P34-35_P74-75.agc:1073
//			RTARG
// slot 11267
    11267, 3610,
// P34-35_P74-75.agc:1074
//			NORMEX
// slot 11268
    11268, 1472,
// P34-35_P74-75.agc:1075
//		STORE	RTARG1
// slot 11269
    11269, 3848,
// P34-35_P74-75.agc:1076
//		SLOAD	BHIZ
// slot 11270
    11270, 39098,
// P34-35_P74-75.agc:1077
//			RTX2
// slot 11271
    11271, 4046,
// P34-35_P74-75.agc:1078
//			INITVEL1
// slot 11272
    11272, 18468,
// P34-35_P74-75.agc:1079
//		VLOAD	VSL2
// slot 11273
    11273, 60154,
// P34-35_P74-75.agc:1080
//			RINIT		# B29
// slot 11274
    11274, 3824,
// P34-35_P74-75.agc:1081
//		STOVL	RINIT		# B27
// slot 11275
    11275, 24304,
// P34-35_P74-75.agc:1082
//			VINIT		# B7
// slot 11276
    11276, 3836,
// P34-35_P74-75.agc:1083
//		VSL2
// slot 11277
    11277, 65492,
// P34-35_P74-75.agc:1084
//		STOVL	VINIT		# B5
// slot 11278
    11278, 24316,
// P34-35_P74-75.agc:1085
//			RTARG1
// slot 11279
    11279, 3848,
// P34-35_P74-75.agc:1086
//		VSL2
// slot 11280
    11280, 65492,
// P34-35_P74-75.agc:1087
//		STORE	RTARG1
// slot 11281
    11281, 3848,
// P34-35_P74-75.agc:1088
//
// P34-35_P74-75.agc:1089
//# INITIALIZATION
// P34-35_P74-75.agc:1090
//
// P34-35_P74-75.agc:1091
//INITVEL1	SSP	DLOAD		# SET ITCTR TO -1,LOAD MPAC WITH E4 (PL 2D)
// slot 11282
    11282, 58802,
// P34-35_P74-75.agc:1092
//			ITCTR
// slot 11283
    11283, 3722,
// P34-35_P74-75.agc:1093
//			0 -1
// slot 11284
    11284, 65532,
// P34-35_P74-75.agc:1094
//		COSINE	SR1		# CALCULATE COSINE (E4) (+2)
// slot 11285
    11285, 58060,
// P34-35_P74-75.agc:1095
//		STODL	COZY4		# SET COZY4 TO COSINE (E4) (PL 0D)
// slot 11286
    11286, 16176,
// P34-35_P74-75.agc:1096
//		LXA,2	SXA,2
// slot 11287
    11287, 56536,
// P34-35_P74-75.agc:1097
//			MPAC
// slot 11288
    11288, 216,
// P34-35_P74-75.agc:1098
//			VTARGTAG	# SET VTARGTAG TO 0D (SP)
// slot 11289
    11289, 2950,
// P34-35_P74-75.agc:1099
//		VLOAD
// slot 11290
    11290, 65530,
// P34-35_P74-75.agc:1100
//			RINIT
// slot 11291
    11291, 3824,
// P34-35_P74-75.agc:1101
//		STOVL	R1VEC		# R1VEC EQ RINIT
// slot 11292
    11292, 23390,
// P34-35_P74-75.agc:1102
//			RTARG1
// slot 11293
    11293, 3848,
// P34-35_P74-75.agc:1103
//# Page 488
// P34-35_P74-75.agc:1104
//		STODL	R2VEC		# R2VEC EQ RTARG
// slot 11294
    11294, 15210,
// P34-35_P74-75.agc:1105
//			DELLT4
// slot 11295
    11295, 3622,
// P34-35_P74-75.agc:1106
//		STORE	TDESIRED	# TDESIRED EQ DELLT4
// slot 11296
    11296, 2934,
// P34-35_P74-75.agc:1107
//		SETPD	VLOAD
// slot 11297
    11297, 64770,
// P34-35_P74-75.agc:1108
//			0D		# INITIALIZE PL TO 0D
// slot 11298
    11298, 2,
// P34-35_P74-75.agc:1109
//			RINIT		# MPAC EQ RINIT (+29)
// slot 11299
    11299, 3824,
// P34-35_P74-75.agc:1110
//		UNIT	PUSH		# UNIT(RI) (+1)		(PL 6D)
// slot 11300
    11300, 34396,
// P34-35_P74-75.agc:1111
//		VXV	UNIT
// slot 11301
    11301, 44602,
// P34-35_P74-75.agc:1112
//			VINIT		# MPAC EQ UNIT(RI) X VI (+8)
// slot 11302
    11302, 3836
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1113
//		STOVL	UN
// slot 11303
    11303, 23420,
// P34-35_P74-75.agc:1114
//			RTARG1
// slot 11304
    11304, 3848,
// P34-35_P74-75.agc:1115
//		UNIT	DOT		# TEMP=URT.URI (+2)	(PL 0D)
// slot 11305
    11305, 41308,
// P34-35_P74-75.agc:1116
//		DAD	CLEAR
// slot 11306
    11306, 35866,
// P34-35_P74-75.agc:1117
//			COZY4
// slot 11307
    11307, 3888,
// P34-35_P74-75.agc:1118
//			NORMSW
// slot 11308
    11308, 3946,
// P34-35_P74-75.agc:1119
//		STORE	COZY4
// slot 11309
    11309, 3888,
// P34-35_P74-75.agc:1120
//INITVEL2	BPL	SET
// slot 11310
    11310, 35912,
// P34-35_P74-75.agc:1121
//			INITVEL3	# UN CALCULATED IN LAMBERT
// slot 11311
    11311, 18562,
// P34-35_P74-75.agc:1122
//			NORMSW
// slot 11312
    11312, 3690,
// P34-35_P74-75.agc:1123
//
// P34-35_P74-75.agc:1124
//# ROTATE RC INTO YC PLANE -- SET UNIT NORMAL TO YC
// P34-35_P74-75.agc:1125
//
// P34-35_P74-75.agc:1126
//		VLOAD	PUSH		#		                   (PL 6D)
// slot 11313
    11313, 34554,
// P34-35_P74-75.agc:1127
//			R2VEC		# RC TO 6D (+29)
// slot 11314
    11314, 2922,
// P34-35_P74-75.agc:1128
//		ABVAL	PDVL		# RC TO MPAC, ABVAL(RC) (+29) TO OD(PL 2D)
// slot 11315
    11315, 52556,
// P34-35_P74-75.agc:1129
//		PUSH	VPROJ		#                                  (PL 8D)
// slot 11316
    11316, 39180,
// P34-35_P74-75.agc:1130
//			UN
// slot 11317
    11317, 2940,
// P34-35_P74-75.agc:1131
//		VSL2	BVSU
// slot 11318
    11318, 42452,
// P34-35_P74-75.agc:1132
//		UNIT	VXSC		#                                  (PL 0D)
// slot 11319
    11319, 61788,
// P34-35_P74-75.agc:1133
//		VSL1
// slot 11320
    11320, 65524,
// P34-35_P74-75.agc:1134
//		STORE	R2VEC
// slot 11321
    11321, 2922,
// P34-35_P74-75.agc:1135
//		TLOAD	SLOAD
// slot 11322
    11322, 56786,
// P34-35_P74-75.agc:1136
//			ZEROVEC
// slot 11323
    11323, 9964,
// P34-35_P74-75.agc:1137
//			ITCTR
// slot 11324
    11324, 3722,
// P34-35_P74-75.agc:1138
//		BPL	VLOAD
// slot 11325
    11325, 64840,
// P34-35_P74-75.agc:1139
//			INITVEL3
// slot 11326
    11326, 18562,
// P34-35_P74-75.agc:1140
//			R2VEC
// slot 11327
    11327, 2922,
// P34-35_P74-75.agc:1141
//		STORE	RTARG1
// slot 11328
    11328, 3848,
// P34-35_P74-75.agc:1142
//INITVEL3	DLOAD	PDVL		#				(PL 2D)
// slot 11329
    11329, 52682,
// P34-35_P74-75.agc:1143
//			MUEARTH		# POSITIVE VALUE
// slot 11330
    11330, 24506,
// P34-35_P74-75.agc:1144
//			R2VEC
// slot 11331
    11331, 2922,
// P34-35_P74-75.agc:1145
//		UNIT	PDVL		# 2D = UNIT(R2VEC)		(PL 8D)
// slot 11332
    11332, 52572,
// P34-35_P74-75.agc:1146
//			R1VEC
// slot 11333
    11333, 2910,
// P34-35_P74-75.agc:1147
//		UNIT	PUSH		# 8D = UNIT(R1VEC)		(PL 14D)
// slot 11334
    11334, 34396,
// P34-35_P74-75.agc:1148
//		VXV	VCOMP		# -N = UNIT(R2VEC) X UNIT(R1VEC)
// slot 11335
    11335, 48698,
// P34-35_P74-75.agc:1149
//			2D
// slot 11336
    11336, 6,
// P34-35_P74-75.agc:1150
//		PUSH			#				(PL 20D)
// slot 11337
    11337, 65292,
// P34-35_P74-75.agc:1151
//		LXA,1	DLOAD
// slot 11338
    11338, 58832,
// P34-35_P74-75.agc:1152
//			RTX1
// slot 11339
    11339, 4042,
// P34-35_P74-75.agc:1153
//			18D
// slot 11340
    11340, 38,
// P34-35_P74-75.agc:1154
//		BMN	INCR,1
// slot 11341
    11341, 51264,
// P34-35_P74-75.agc:1155
//# Page 489
// P34-35_P74-75.agc:1156
//			+2
// slot 11342
    11342, 18592,
// P34-35_P74-75.agc:1157
//		DEC	-8
// slot 11343
    11343, 65518,
// P34-35_P74-75.agc:1158
//		INCR,1	SLOAD
// slot 11344
    11344, 56720,
// P34-35_P74-75.agc:1159
//			10D
// slot 11345
    11345, 20,
// P34-35_P74-75.agc:1160
//			X1
// slot 11346
    11346, 78,
// P34-35_P74-75.agc:1161
//		BHIZ	VLOAD		#			(PL 14D)
// slot 11347
    11347, 64816,
// P34-35_P74-75.agc:1162
//			+2
// slot 11348
    11348, 18604,
// P34-35_P74-75.agc:1163
//		VCOMP	PUSH		#			(PL 20 D)
// slot 11349
    11349, 34428,
// P34-35_P74-75.agc:1164
//		VLOAD			#			(PL 14D)
// slot 11350
    11350, 65530,
// P34-35_P74-75.agc:1165
//		VXV	DOT		#			(PL 2D)
// slot 11351
    11351, 41274,
// P34-35_P74-75.agc:1166
//		BPL	DLOAD		#			(PL 0D)
// slot 11352
    11352, 58696,
// P34-35_P74-75.agc:1167
//			INITVEL4
// slot 11353
    11353, 18614,
// P34-35_P74-75.agc:1168
//		DCOMP	PUSH		#			(PL 2D)
// slot 11354
    11354, 34428,
// P34-35_P74-75.agc:1169
//INITVEL4	LXA,2	SXA,2
// slot 11355
    11355, 56536,
// P34-35_P74-75.agc:1170
//			0D
// slot 11356
    11356, 0,
// P34-35_P74-75.agc:1171
//			GEOMSGN
// slot 11357
    11357, 2936,
// P34-35_P74-75.agc:1172
//
// P34-35_P74-75.agc:1173
//# SET INPUTS UP FOR LAMBERT
// P34-35_P74-75.agc:1174
//
// P34-35_P74-75.agc:1175
//		LXA,1	CALL
// slot 11358
    11358, 38096,
// P34-35_P74-75.agc:1176
//			RTX1
// slot 11359
    11359, 4042,
// P34-35_P74-75.agc:1177
//#  OPERATE THE LAMBERT CONIC ROUTINE (COASTFLT SUBROUTINE)
// P34-35_P74-75.agc:1178
//
// P34-35_P74-75.agc:1179
//			LAMBERT
// slot 11360
    11360, 21800,
// P34-35_P74-75.agc:1180
//
// P34-35_P74-75.agc:1181
//# ARRIVED AT SOLUTION IS GOOD ENOUGH ACCORDING TO SLIGHTLY WIDER BOUNDS.
// P34-35_P74-75.agc:1182
//
// P34-35_P74-75.agc:1183
//		CLEAR	VLOAD
// slot 11361
    11361, 64792,
// P34-35_P74-75.agc:1184
//			GUESSW
// slot 11362
    11362, 890,
// P34-35_P74-75.agc:1185
//			VVEC
// slot 11363
    11363, 3020,
// P34-35_P74-75.agc:1186
//
// P34-35_P74-75.agc:1187
//# STORE CALCULATED INITIAL VELOCITY REQUIRED IN VIPRIME
// P34-35_P74-75.agc:1188
//
// P34-35_P74-75.agc:1189
//		STODL	VIPRIME		# INITIAL VELOCITY REQUIRED (+7)
// slot 11364
    11364, 16148,
// P34-35_P74-75.agc:1190
//
// P34-35_P74-75.agc:1191
//# IF NUMIT IS ZERO, CONTINUE AT INITVELB, OTHERWISE
// P34-35_P74-75.agc:1192
//# SET UP INPUTS FOR ENCKE INTEGRATION (INTEGRVS).
// P34-35_P74-75.agc:1193
//
// P34-35_P74-75.agc:1194
//			VTARGTAG
// slot 11365
    11365, 2952,
// P34-35_P74-75.agc:1195
//		BHIZ	CALL
// slot 11366
    11366, 37936,
// P34-35_P74-75.agc:1196
//			INITVEL7
// slot 11367
    11367, 18728,
// P34-35_P74-75.agc:1197
//			INTSTALL
// slot 11368
    11368, 24132,
// P34-35_P74-75.agc:1198
//		SLOAD	CLEAR
// slot 11369
    11369, 36026,
// P34-35_P74-75.agc:1199
//			RTX2
// slot 11370
    11370, 4046,
// P34-35_P74-75.agc:1200
//			MOONFLAG
// slot 11371
    11371, 358,
// P34-35_P74-75.agc:1201
//		BHIZ	SET
// slot 11372
    11372, 35888,
// P34-35_P74-75.agc:1202
//			INITVEL5
// slot 11373
    11373, 18654,
// P34-35_P74-75.agc:1203
//			MOONFLAG
// slot 11374
    11374, 102,
// P34-35_P74-75.agc:1204
//INITVEL5	VLOAD
// slot 11375
    11375, 65530,
// P34-35_P74-75.agc:1205
//			RINIT
// slot 11376
    11376, 3824,
// P34-35_P74-75.agc:1206
//		STORE	R1VEC
// slot 11377
    11377, 2910,
// P34-35_P74-75.agc:1207
//# Page 490
// P34-35_P74-75.agc:1208
//		STOVL	RCV
// slot 11378
    11378, 22202,
// P34-35_P74-75.agc:1209
//			VIPRIME
// slot 11379
    11379, 3860,
// P34-35_P74-75.agc:1210
//		STODL	VCV
// slot 11380
    11380, 14022,
// P34-35_P74-75.agc:1211
//			INTIME
// slot 11381
    11381, 3718,
// P34-35_P74-75.agc:1212
//		STORE	TET
// slot 11382
    11382, 1694,
// P34-35_P74-75.agc:1213
//		DAD	CLEAR
// slot 11383
    11383, 35866,
// P34-35_P74-75.agc:1214
//			DELLT4
// slot 11384
    11384, 3622,
// P34-35_P74-75.agc:1215
//			INTYPFLG
// slot 11385
    11385, 1910,
// P34-35_P74-75.agc:1216
//		STCALL	TDEC1
// slot 11386
    11386, 28738,
// P34-35_P74-75.agc:1217
//			INTEGRVS
// slot 11387
    11387, 23738,
// P34-35_P74-75.agc:1218
//		VLOAD
// slot 11388
    11388, 65530,
// P34-35_P74-75.agc:1219
//			VATT1
// slot 11389
    11389, 42,
// P34-35_P74-75.agc:1220
//		STORE	VTARGET
// slot 11390
    11390, 2954,
// P34-35_P74-75.agc:1221
//
// P34-35_P74-75.agc:1222
//# IF ITERATION COUNTER (ITCTR) EQ NO. ITERATIONS (NUMIT), CONTINUE AT
// P34-35_P74-75.agc:1223
//# INITVELC, OTHERWISE REITERATE LAMBERT AND ENCKE
// P34-35_P74-75.agc:1224
//
// P34-35_P74-75.agc:1225
//		LXA,2	INCR,2
// slot 11391
    11391, 52440,
// P34-35_P74-75.agc:1226
//			ITCTR
// slot 11392
    11392, 3720,
// P34-35_P74-75.agc:1227
//			1D		# INCREMENT ITCTR
// slot 11393
    11393, 2,
// P34-35_P74-75.agc:1228
//		SXA,2	XSU,2
// slot 11394
    11394, 46264,
// P34-35_P74-75.agc:1229
//			ITCTR
// slot 11395
    11395, 3720,
// P34-35_P74-75.agc:1230
//			VTARGTAG
// slot 11396
    11396, 2950,
// P34-35_P74-75.agc:1231
//		SLOAD	BHIZ		# IF SP(MPAC) EQ 0, CONTINUE AT INITVELC
// slot 11397
    11397, 39098,
// P34-35_P74-75.agc:1232
//			X2
// slot 11398
    11398, 80,
// P34-35_P74-75.agc:1233
//			INITVEL6
// slot 11399
    11399, 18722,
// P34-35_P74-75.agc:1234
//
// P34-35_P74-75.agc:1235
//# OFFSET CONIC TARGET VECTGOR
// P34-35_P74-75.agc:1236
//
// P34-35_P74-75.agc:1237
//		VLOAD	VSU
// slot 11400
    11400, 43514,
// P34-35_P74-75.agc:1238
//			RTARG1
// slot 11401
    11401, 3848,
// P34-35_P74-75.agc:1239
//			RATT1
// slot 11402
    11402, 30,
// P34-35_P74-75.agc:1240
//		VAD
// slot 11403
    11403, 65370
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1241
//			R2VEC
// slot 11404
    11404, 2922,
// P34-35_P74-75.agc:1242
//		STODL	R2VEC
// slot 11405
    11405, 15210,
// P34-35_P74-75.agc:1243
//			COZY4
// slot 11406
    11406, 3888,
// P34-35_P74-75.agc:1244
//		GOTO
// slot 11407
    11407, 65360,
// P34-35_P74-75.agc:1245
//			INITVEL2	# CONTINUE ITERATING AT INITVEL2
// slot 11408
    11408, 18524,
// P34-35_P74-75.agc:1246
//
// P34-35_P74-75.agc:1247
//# COMPUTE THE DELTA VELOCITY
// P34-35_P74-75.agc:1248
//
// P34-35_P74-75.agc:1249
//INITVEL6	VLOAD
// slot 11409
    11409, 65530,
// P34-35_P74-75.agc:1250
//			R2VEC
// slot 11410
    11410, 2922,
// P34-35_P74-75.agc:1251
//		STORE	RTARG1
// slot 11411
    11411, 3848,
// P34-35_P74-75.agc:1252
//INITVEL7	VLOAD	VSU
// slot 11412
    11412, 43514,
// P34-35_P74-75.agc:1253
//			VIPRIME
// slot 11413
    11413, 3860,
// P34-35_P74-75.agc:1254
//			VINIT
// slot 11414
    11414, 3836,
// P34-35_P74-75.agc:1255
//		STOVL	DELVEET3	# DELVEET3 = VIPRIME-VINIT (+7)
// slot 11415
    11415, 24396,
// P34-35_P74-75.agc:1256
//			VTARGET
// slot 11416
    11416, 2954,
// P34-35_P74-75.agc:1257
//		STORE	VTPRIME
// slot 11417
    11417, 3872,
// P34-35_P74-75.agc:1258
//		SLOAD	BHIZ
// slot 11418
    11418, 39098,
// P34-35_P74-75.agc:1259
//			RTX2
// slot 11419
    11419, 4046,
// P34-35_P74-75.agc:1260
//# Page 491
// P34-35_P74-75.agc:1261
//			INITVELX
// slot 11420
    11420, 18770,
// P34-35_P74-75.agc:1262
//		VLOAD	VSR2
// slot 11421
    11421, 58106,
// P34-35_P74-75.agc:1263
//			VTPRIME
// slot 11422
    11422, 3872,
// P34-35_P74-75.agc:1264
//		STOVL	VTPRIME
// slot 11423
    11423, 24352,
// P34-35_P74-75.agc:1265
//			VIPRIME
// slot 11424
    11424, 3860,
// P34-35_P74-75.agc:1266
//		VSR2
// slot 11425
    11425, 65476,
// P34-35_P74-75.agc:1267
//		STOVL	VIPRIME
// slot 11426
    11426, 24340,
// P34-35_P74-75.agc:1268
//			RTARG1
// slot 11427
    11427, 3848,
// P34-35_P74-75.agc:1269
//		VSR2
// slot 11428
    11428, 65476,
// P34-35_P74-75.agc:1270
//		STOVL	RTARG1
// slot 11429
    11429, 24328,
// P34-35_P74-75.agc:1271
//			DELVEET3
// slot 11430
    11430, 3916,
// P34-35_P74-75.agc:1272
//		VSR2
// slot 11431
    11431, 65476,
// P34-35_P74-75.agc:1273
//		STORE	DELVEET3
// slot 11432
    11432, 3916,
// P34-35_P74-75.agc:1274
//INITVELX	SETPD	VLOAD
// slot 11433
    11433, 64770,
// P34-35_P74-75.agc:1275
//			0D
// slot 11434
    11434, 2,
// P34-35_P74-75.agc:1276
//			RTARG1
// slot 11435
    11435, 3848,
// P34-35_P74-75.agc:1277
//		STCALL	RTARG
// slot 11436
    11436, 32282,
// P34-35_P74-75.agc:1278
//			NORMEX
// slot 11437
    11437, 1472,
// P34-35_P74-75.agc:1279
//
// P34-35_P74-75.agc:1280
//# ***** END OF INITVEL ROUTINE *****
// P34-35_P74-75.agc:1281
//
// P34-35_P74-75.agc:1282
//# Page 492
// P34-35_P74-75.agc:1283
//# ***** MIDGIM *****
// P34-35_P74-75.agc:1284
//# MOD NO. 0, BY WILLMAN, SUBROUTINE RENDGUID, LOG P34-P35, P74-P75
// P34-35_P74-75.agc:1285
//# REVISION 03, 17 FEB 67
// P34-35_P74-75.agc:1286
//#
// P34-35_P74-75.agc:1287
//# IF THE ACTIVE VEHICLE IS DOING THE COMPUTATION, MIDGIM COMPUTES
// P34-35_P74-75.agc:1288
//# THE POSITIVE MIDDLE GIMBAL ANGLE OF THE ACTIVE VEHICLE TO THE INPUT
// P34-35_P74-75.agc:1289
//# DELTA VELOCITY VECTOR (0D IN PUSY LIST), OTHERWISE
// P34-35_P74-75.agc:1290
//# MIDGIM CONVERTS THE INPUT DELTA VELOCITY VECTOR FROM INERTIAL COORDIN-
// P34-35_P74-75.agc:1291
//# ATES TO LOCAL VERTICAL COORDINATES OF THE ACTIVE VEHICLE.
// P34-35_P74-75.agc:1292
//#
// P34-35_P74-75.agc:1293
//# ** INPUTS **
// P34-35_P74-75.agc:1294
//#   NAME     MEANING					  	UNITS/SCALING/MODE
// P34-35_P74-75.agc:1295
//#   AVFLAG   INT FLAG -- 0 IS CSM ACTIVE, 1 IS LEM ACTIVE	BIT
// P34-35_P74-75.agc:1296
//#   COMPUTER INT FLAG -- 0 IS LEM COMPUTER, 1 IS CSM COMPUTER	BIT
// P34-35_P74-75.agc:1297
//#   RINIT    ACTIVE VEHICLE RADIUS VECTOR			METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1298
//#   VINIT    ACTIVE VEHICLE VELOCITY VECTOR			METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1299
//#   0D(PL)   ACTIVE VEHICLE DELTA VELOCITY VECTOR		METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1300
//#
// P34-35_P74-75.agc:1301
//# ** OUTPUTS **
// P34-35_P74-75.agc:1302
//#   NAME     MEANING						UNITS/SCALING/MODE
// P34-35_P74-75.agc:1303
//#   +MGA     + MIDDLE GIMBAL ANGLE				REVOLUTIONS (+0) DP
// P34-35_P74-75.agc:1304
//#   DELVLVC  DELTA VELOCITY VECTOR IN LV COORD.			METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1305
//#   MGLVFLAG INT FLAG: 0 IS +MGA COMUTED, 1 IS DELVLVC COMP.	BIT
// P34-35_P74-75.agc:1306
//#
// P34-35_P74-75.agc:1307
//# ** CALLING SEQUENCE **
// P34-35_P74-75.agc:1308
//#	L 	CALL
// P34-35_P74-75.agc:1309
//#	L+1		MIDGIM
// P34-35_P74-75.agc:1310
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1311
//#
// P34-35_P74-75.agc:1312
//# ** NO SUBROUTINES CALLED **
// P34-35_P74-75.agc:1313
//#
// P34-35_P74-75.agc:1314
//# ** DEBRIS -- ERASABLE TEMPORARY USAGE **
// P34-35_P74-75.agc:1315
//#	A,Q,L, PUSH LIST, MPAC.
// P34-35_P74-75.agc:1316
//#
// P34-35_P74-75.agc:1317
//# ** ALARMS -- NONE **
// P34-35_P74-75.agc:1318
//
// P34-35_P74-75.agc:1319
//# Page 493
// P34-35_P74-75.agc:1320
//# MIDDLE GIMBAL ANGLE COMPUTATION
// P34-35_P74-75.agc:1321
//		SETLOC	MIDDGIM
// P34-35_P74-75.agc:1322
//		BANK
// P34-35_P74-75.agc:1323
//
// P34-35_P74-75.agc:1324
//		COUNT*	$$/MIDG
// P34-35_P74-75.agc:1325
//
// P34-35_P74-75.agc:1326
//HALFREV		2DEC	1 B-1
// slot 6565 6566
    6565, 16384, 6566, 0,
// P34-35_P74-75.agc:1327
//
// P34-35_P74-75.agc:1328
//MIDGIM		BON	BOFF
// slot 6567
    6567, 35864,
// P34-35_P74-75.agc:1329
//			AVFLAG
// slot 6568
    6568, 1428,
// P34-35_P74-75.agc:1330
//			MIDGIM1
// slot 6569
    6569, 9070,
// P34-35_P74-75.agc:1331
//			COMPUTER
// slot 6570
    6570, 3022,
// P34-35_P74-75.agc:1332
//			GET.LVC
// slot 6571
    6571, 9076,
// P34-35_P74-75.agc:1333
//
// P34-35_P74-75.agc:1334
//# COMPUTE +MGA IF AVFLAG AND COMPUTER HAVE OPPOSITE VALUES.
// P34-35_P74-75.agc:1335
//
// P34-35_P74-75.agc:1336
//GET+MGA		VLOAD	UNIT		# (PL 0D) V (+7) TO MPAC UNITIZE UV (+1)
// slot 6572
    6572, 44794,
// P34-35_P74-75.agc:1337
//		DOT	SL1		# DOT UV WITH Y(STABLE MEMBER) AND RESCALE
// slot 6573
    6573, 59970,
// P34-35_P74-75.agc:1338
//			REFSMMAT +6	# FROM +2 TO +1 FOR ASIN ROUTINE
// slot 6574
    6574, 1992,
// P34-35_P74-75.agc:1339
//		ARCSIN	BPL
// slot 6575
    6575, 42172,
// P34-35_P74-75.agc:1340
//			SETMGA
// slot 6576
    6576, 9064,
// P34-35_P74-75.agc:1341
//		DAD	DAD		# CONVERT -MGA TO +MGA BY
// slot 6577
    6577, 36122,
// P34-35_P74-75.agc:1342
//			HALFREV		# ADDING ONE REVOLUTION
// slot 6578
    6578, 9036,
// P34-35_P74-75.agc:1343
//			HALFREV
// slot 6579
    6579, 9036,
// P34-35_P74-75.agc:1344
//SETMGA		STORE	+MGA
// slot 6580
    6580, 3884,
// P34-35_P74-75.agc:1345
//		CLR	RVQ		# CLEAR MGLVFLAG TO INDICATE +MGA CALC
// slot 6581
    6581, 36376,
// P34-35_P74-75.agc:1346
//			MGLVFLAG	# AND EXIT
// slot 6582
    6582, 2938,
// P34-35_P74-75.agc:1347
//
// P34-35_P74-75.agc:1348
//MIDGIM1		BOFF
// slot 6583
    6583, 65304,
// P34-35_P74-75.agc:1349
//			COMPUTER
// slot 6584
    6584, 3022,
// P34-35_P74-75.agc:1350
//			GET+MGA
// slot 6585
    6585, 9048,
// P34-35_P74-75.agc:1351
//
// P34-35_P74-75.agc:1352
//# COMPUTE DELVLVC IF AVFLAG AND COMPUTER HAVE SAME VALUES
// P34-35_P74-75.agc:1353
//
// P34-35_P74-75.agc:1354
//GET.LVC		VLOAD	UNIT		# (PL 6D) R (+29) IN MPAC UNITZE UR
// slot 6586
    6586, 44794,
// P34-35_P74-75.agc:1355
//			RINIT
// slot 6587
    6587, 3824,
// P34-35_P74-75.agc:1356
//		VCOMP			# U(-R)
// slot 6588
    6588, 65404,
// P34-35_P74-75.agc:1357
//		STORE	18D		# U(-R) TO 18D
// slot 6589
    6589, 38,
// P34-35_P74-75.agc:1358
//		VXV	UNIT		# U(-R)*V EQ V*U(R), U(V*R)
// slot 6590
    6590, 44602,
// P34-35_P74-75.agc:1359
//			VINIT
// slot 6591
    6591, 3836,
// P34-35_P74-75.agc:1360
//		STORE	12D		# U(V*R) TO 12D
// slot 6592
    6592, 26,
// P34-35_P74-75.agc:1361
//		VXV	UNIT		# U(V*R)*U(-R), U((V*R)*(-R))
// slot 6593
    6593, 44602,
// P34-35_P74-75.agc:1362
//			18D
// slot 6594
    6594, 38,
// P34-35_P74-75.agc:1363
//		STOVL	6D		# TRANSFORMATION MATRIX IS IN 6D (+1)
// slot 6595
    6595, 20494,
// P34-35_P74-75.agc:1364
//			0D		# DELTA V (+7) IN 0D
// slot 6596
    6596, 2,
// P34-35_P74-75.agc:1365
//		MXV	VSL1		# CONVERT FROM INER COOR TO LV COOR (+8)
// slot 6597
    6597, 64162,
// P34-35_P74-75.agc:1366
//			6D		# AND SCALE +7 IN MPAC
// slot 6598
    6598, 14,
// P34-35_P74-75.agc:1367
//		STORE	DELVLVC		# STORE IN DELVLVC (+7(
// slot 6599
    6599, 3594,
// P34-35_P74-75.agc:1368
//		SET	RVQ		# SET MGLVFLAG TO INDICATE LVC CALC
// slot 6600
    6600, 36376
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1369
//			MGLVFLAG	# AND EXIT
// slot 6601
    6601, 2682,
// P34-35_P74-75.agc:1370
//
// P34-35_P74-75.agc:1371
//# ***** END OF MIDGIM ROUTINE *****
// P34-35_P74-75.agc:1372
//
// P34-35_P74-75.agc:1373
//# Page 494
// P34-35_P74-75.agc:1374
//SELECTMU	AXC,1	AXT,2
// slot 6602
    6602, 64736,
// P34-35_P74-75.agc:1375
//			2D
// slot 6603
    6603, 4,
// P34-35_P74-75.agc:1376
//			0D
// slot 6604
    6604, 0,
// P34-35_P74-75.agc:1377
//		BOFF
// slot 6605
    6605, 65304,
// P34-35_P74-75.agc:1378
//			CMOONFLG
// slot 6606
    6606, 4550,
// P34-35_P74-75.agc:1379
//			SETMUER
// slot 6607
    6607, 9126,
// P34-35_P74-75.agc:1380
//		AXC,1	AXT,2
// slot 6608
    6608, 64736,
// P34-35_P74-75.agc:1381
//			10D
// slot 6609
    6609, 20,
// P34-35_P74-75.agc:1382
//			2D
// slot 6610
    6610, 4,
// P34-35_P74-75.agc:1383
//SETMUER		DLOAD*	SXA,1
// slot 6611
    6611, 55494,
// P34-35_P74-75.agc:1384
//			MUTABLE +4,1
// slot 6612
    6612, 10184,
// P34-35_P74-75.agc:1385
//			RTX1
// slot 6613
    6613, 4042,
// P34-35_P74-75.agc:1386
//		STODL*	RTSR1/MU
// slot 6614
    6614, 20436,
// P34-35_P74-75.agc:1387
//			MUTABLE -2,1
// slot 6615
    6615, 10172,
// P34-35_P74-75.agc:1388
//		BOFF	SR
// slot 6616
    6616, 45336,
// P34-35_P74-75.agc:1389
//			CMOONFLG
// slot 6617
    6617, 4550,
// P34-35_P74-75.agc:1390
//			RTRNMU
// slot 6618
    6618, 9144,
// P34-35_P74-75.agc:1391
//			6D
// slot 6619
    6619, 17166,
// P34-35_P74-75.agc:1392
//RTRNMU		STORE	RTMU
// slot 6620
    6620, 4048,
// P34-35_P74-75.agc:1393
//		SXA,2	CLEAR
// slot 6621
    6621, 36024,
// P34-35_P74-75.agc:1394
//			RTX2
// slot 6622
    6622, 4044,
// P34-35_P74-75.agc:1395
//			FINALFLG
// slot 6623
    6623, 1394,
// P34-35_P74-75.agc:1396
//		GOTO
// slot 6624
    6624, 65360,
// P34-35_P74-75.agc:1397
//			VN1645
// slot 6625
    6625, 60420,
// P34-35_P74-75.agc:1398
//
// P34-35_P74-75.agc:1399
//# Page 495
// P34-35_P74-75.agc:1400
//# ***** PERIAPO *****
// P34-35_P74-75.agc:1401
//# MOD NO -1       LOG SECTION - P34-P35, P74-P75
// P34-35_P74-75.agc:1402
//# MOD BY WHITE.P  DATE  18JAN68
// P34-35_P74-75.agc:1403
//#
// P34-35_P74-75.agc:1404
//# FUNCTIONAL DESCRIPTION
// P34-35_P74-75.agc:1405
//#	THIS SUBROUTINE COMPUTES THE TWO BODY APOCENTER AND PERICENTER
// P34-35_P74-75.agc:1406
//#	ALTITUDES GIVEN THE POSITION AND VELOCITY VECTORS FOR A POINT ON
// P34-35_P74-75.agc:1407
//#	THE TRAJECTORY AND THE PRIMARY BODY.
// P34-35_P74-75.agc:1408
//#
// P34-35_P74-75.agc:1409
//#	SETRAD IS CALLED TO DETERMINE THE RADIUS OF THE PRIMARY BODY.
// P34-35_P74-75.agc:1410
//#
// P34-35_P74-75.agc:1411
//#	APSIDES IS CALLED TO SOVE FOR THE TWO BODY RADII OF APOCENTER AND
// P34-35_P74-75.agc:1412
//#	PERICENTER AND THE ECCENTRICITY OF THE TRAJECTORY.
// P34-35_P74-75.agc:1413
//#
// P34-35_P74-75.agc:1414
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1415
//#	L	CALL
// P34-35_P74-75.agc:1416
//#	L+1		PERIAPO
// P34-35_P74-75.agc:1417
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1418
//#
// P34-35_P74-75.agc:1419
//# INPUT
// P34-35_P74-75.agc:1420
//#	(1)	RVEC	POSITION VECTOR IN METERS
// P34-35_P74-75.agc:1421
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1422
//#	(2)	VVEC	VELOCITY VECTOR IN METERS/CENTISECOND
// P34-35_P74-75.agc:1423
//#			SCALE FACTOR -- EARTH +7, MOON +5
// P34-35_P74-75.agc:1424
//#	(3)	X1	PRIMARY BODY INDICATOR
// P34-35_P74-75.agc:1425
//#			EARTH -2, MOON -10
// P34-35_P74-75.agc:1426
//#
// P34-35_P74-75.agc:1427
//# OUTPUT
// P34-35_P74-75.agc:1428
//#	(1)	2D	APOCENTER RADIUS IN METERS
// P34-35_P74-75.agc:1429
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1430
//#	(2)	4D	APOCENTER ALTITUDE IN METERS
// P34-35_P74-75.agc:1431
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1432
//#	(3)	6D	PERICENTER RADIUS IN METERS
// P34-35_P74-75.agc:1433
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1434
//#	(4)	8D	PERICENTER ALTITUDE IN METERS
// P34-35_P74-75.agc:1435
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1436
//#	(5)	ECC	ECCENTRICITY OF CONIC TRAJECTORY
// P34-35_P74-75.agc:1437
//#			SCALE FACTOR -- +3
// P34-35_P74-75.agc:1438
//#	(6)	XXXALT	RADIUS OF THE PRIMARY BODY IN METERS
// P34-35_P74-75.agc:1439
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1440
//#	(7)	PUSHLOC	EQUALS 10D
// P34-35_P74-75.agc:1441
//#
// P34-35_P74-75.agc:1442
//# SUBROUTINES USED
// P34-35_P74-75.agc:1443
//#	SETRAD
// P34-35_P74-75.agc:1444
//# Page 496
// P34-35_P74-75.agc:1445
//#	APSIDES
// P34-35_P74-75.agc:1446
//
// P34-35_P74-75.agc:1447
//		SETLOC	APOPERI
// P34-35_P74-75.agc:1448
//		BANK
// P34-35_P74-75.agc:1449
//
// P34-35_P74-75.agc:1450
//		COUNT*	$$/PERAP
// P34-35_P74-75.agc:1451
//
// P34-35_P74-75.agc:1452
//RPAD		2DEC	6373338 B-29	# STANDARD RADIUS OF PAD 37-B.
// slot 21097 21098
    21097, 388, 21098, 16346,
// P34-35_P74-75.agc:1453
//					# = 20 909 901.57 FT
// P34-35_P74-75.agc:1454
//
// P34-35_P74-75.agc:1455
//PERIAPO1	LXA,2	VSR*
// slot 21099
    21099, 45016,
// P34-35_P74-75.agc:1456
//			RTX2
// slot 21100
    21100, 4044,
// P34-35_P74-75.agc:1457
//			0,2
// slot 21101
    21101, 48380,
// P34-35_P74-75.agc:1458
//		STOVL	VVEC
// slot 21102
    21102, 23500,
// P34-35_P74-75.agc:1459
//		LXA,1	VSR*
// slot 21103
    21103, 45008,
// P34-35_P74-75.agc:1460
//			RTX1
// slot 21104
    21104, 4042,
// P34-35_P74-75.agc:1461
//			0,2
// slot 21105
    21105, 48380,
// P34-35_P74-75.agc:1462
//		STORE	RVEC
// slot 21106
    21106, 2910,
// P34-35_P74-75.agc:1463
//PERIAPO		STQ	CALL
// slot 21107
    21107, 37920,
// P34-35_P74-75.agc:1464
//			NORMEX
// slot 21108
    21108, 1472,
// P34-35_P74-75.agc:1465
//			SETRAD
// slot 21109
    21109, 38146,
// P34-35_P74-75.agc:1466
//		STCALL	XXXALT
// slot 21110
    21110, 32348,
// P34-35_P74-75.agc:1467
//			APSIDES
// slot 21111
    21111, 22406,
// P34-35_P74-75.agc:1468
//		SETPD	PUSH		# 2D = APOCENTER RADIUS		B29 OR B27
// slot 21112
    21112, 34306,
// P34-35_P74-75.agc:1469
//			2D
// slot 21113
    21113, 6,
// P34-35_P74-75.agc:1470
//		DSU	PDDL		# 4D = APOGEE ALTITUDE 		B29 OR B27
// slot 21114
    21114, 54570,
// P34-35_P74-75.agc:1471
//			XXXALT
// slot 21115
    21115, 3676,
// P34-35_P74-75.agc:1472
//			0D
// slot 21116
    21116, 2,
// P34-35_P74-75.agc:1473
//		PUSH	DSU		# 6D = PERICENTER RADIUS	B29 OR B27
// slot 21117
    21117, 38156,
// P34-35_P74-75.agc:1474
//			XXXALT
// slot 21118
    21118, 3676,
// P34-35_P74-75.agc:1475
//		PUSH	GOTO		# 8D = PERIGEE ALTITUDE 	B29 OR B27
// slot 21119
    21119, 43020,
// P34-35_P74-75.agc:1476
//			NORMEX
// slot 21120
    21120, 1472,
// P34-35_P74-75.agc:1477
//# Page 497
// P34-35_P74-75.agc:1478
//# SETRAD
// P34-35_P74-75.agc:1479
//SETRAD		DLOAD	PUSH
// slot 21121
    21121, 34506,
// P34-35_P74-75.agc:1480
//			RPAD
// slot 21122
    21122, 5332,
// P34-35_P74-75.agc:1481
//		SXA,1	INCR,2
// slot 21123
    21123, 52400,
// P34-35_P74-75.agc:1482
//			X2
// slot 21124
    21124, 78,
// P34-35_P74-75.agc:1483
//			2D
// slot 21125
    21125, 4,
// P34-35_P74-75.agc:1484
//		SLOAD	BHIZ
// slot 21126
    21126, 39098,
// P34-35_P74-75.agc:1485
//			X2
// slot 21127
    21127, 80,
// P34-35_P74-75.agc:1486
//			SETRADX
// slot 21128
    21128, 38168,
// P34-35_P74-75.agc:1487
//		VLOAD	ABVAL
// slot 21129
    21129, 42746,
// P34-35_P74-75.agc:1488
//			RLS
// slot 21130
    21130, 2092,
// P34-35_P74-75.agc:1489
//		PDDL
// slot 21131
    21131, 65450,
// P34-35_P74-75.agc:1490
//SETRADX		DLOAD	RVQ
// slot 21132
    21132, 36554,
// P34-35_P74-75.agc:1491
//
// P34-35_P74-75.agc:1492
//# Page 498
// P34-35_P74-75.agc:1493
//# PRECSET
// P34-35_P74-75.agc:1494
//PRECSET		STQ
// slot 21133
    21133, 65312,
// P34-35_P74-75.agc:1495
//			NORMEX
// slot 21134
    21134, 1472,
// P34-35_P74-75.agc:1496
//		STCALL	TDEC2
// slot 21135
    21135, 31546
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1497
//			LEMPREC
// slot 21136
    21136, 23690,
// P34-35_P74-75.agc:1498
//		CALL
// slot 21137
    21137, 65320,
// P34-35_P74-75.agc:1499
//			LEMSTORE
// slot 21138
    21138, 38198,
// P34-35_P74-75.agc:1500
//		DLOAD
// slot 21139
    21139, 65482,
// P34-35_P74-75.agc:1501
//			TDEC2
// slot 21140
    21140, 2874,
// P34-35_P74-75.agc:1502
//		STCALL	TDEC1
// slot 21141
    21141, 28738,
// P34-35_P74-75.agc:1503
//			CSMPREC
// slot 21142
    21142, 23666,
// P34-35_P74-75.agc:1504
//		CALL
// slot 21143
    21143, 65320,
// P34-35_P74-75.agc:1505
//			CSMSTORE
// slot 21144
    21144, 38214,
// P34-35_P74-75.agc:1506
//		GOTO
// slot 21145
    21145, 65360,
// P34-35_P74-75.agc:1507
//			NORMEX
// slot 21146
    21146, 1472,
// P34-35_P74-75.agc:1508
//LEMSTORE	VLOAD	BOFF
// slot 21147
    21147, 36090,
// P34-35_P74-75.agc:1509
//			RATT
// slot 21148
    21148, 2,
// P34-35_P74-75.agc:1510
//			AVFLAG
// slot 21149
    21149, 1492,
// P34-35_P74-75.agc:1511
//			PASSIVE
// slot 21150
    21150, 38222,
// P34-35_P74-75.agc:1512
//ACTIVE		STOVL	RACT3
// slot 21151
    21151, 24256,
// P34-35_P74-75.agc:1513
//			VATT
// slot 21152
    21152, 14,
// P34-35_P74-75.agc:1514
//		STORE	VACT3
// slot 21153
    21153, 3788,
// P34-35_P74-75.agc:1515
//		RVQ
// slot 21154
    21154, 65308,
// P34-35_P74-75.agc:1516
//CSMSTORE	VLOAD	BOFF
// slot 21155
    21155, 36090,
// P34-35_P74-75.agc:1517
//			RATT
// slot 21156
    21156, 2,
// P34-35_P74-75.agc:1518
//			AVFLAG
// slot 21157
    21157, 1492,
// P34-35_P74-75.agc:1519
//			ACTIVE
// slot 21158
    21158, 38206,
// P34-35_P74-75.agc:1520
//PASSIVE		STOVL	RPASS3
// slot 21159
    21159, 24280,
// P34-35_P74-75.agc:1521
//			VATT
// slot 21160
    21160, 14,
// P34-35_P74-75.agc:1522
//		STORE	VPASS3
// slot 21161
    21161, 3812,
// P34-35_P74-75.agc:1523
//		RVQ
// slot 21162
    21162, 65308,
// P34-35_P74-75.agc:1524
//
// P34-35_P74-75.agc:1525
//# Page 499
// P34-35_P74-75.agc:1526
//# VECSHIFT
// P34-35_P74-75.agc:1527
//VECSHIFT	LXA,2	VSR*
// slot 21163
    21163, 45016,
// P34-35_P74-75.agc:1528
//			RTX2
// slot 21164
    21164, 4044,
// P34-35_P74-75.agc:1529
//			0,2
// slot 21165
    21165, 48380,
// P34-35_P74-75.agc:1530
//		LXA,1	PDVL
// slot 21166
    21166, 52688,
// P34-35_P74-75.agc:1531
//			RTX1
// slot 21167
    21167, 4042,
// P34-35_P74-75.agc:1532
//		VSR*	PDVL
// slot 21168
    21168, 52574,
// P34-35_P74-75.agc:1533
//			0,2
// slot 21169
    21169, 48380,
// P34-35_P74-75.agc:1534
//		RVQ
// slot 21170
    21170, 65308,
// P34-35_P74-75.agc:1535
//
// P34-35_P74-75.agc:1536
//# Page 500
// P34-35_P74-75.agc:1537
//# SHIFTR1
// P34-35_P74-75.agc:1538
//SHIFTR1		LXA,2	SL*
// slot 21171
    21171, 45016,
// P34-35_P74-75.agc:1539
//			RTX2
// slot 21172
    21172, 4044,
// P34-35_P74-75.agc:1540
//			0,2
// slot 21173
    21173, 48892,
// P34-35_P74-75.agc:1541
//		RVQ
// slot 21174
    21174, 65308
)).

// bank 20, slots 18548-18553
function agcAotUnit1086 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18550 {
        if slot <= 18548 {
// P34-35_P74-75.agc:1542
//
// P34-35_P74-75.agc:1543
//# Page 501
// P34-35_P74-75.agc:1544
//# PROGRAM DESCRIPTION
// P34-35_P74-75.agc:1545
//#
// P34-35_P74-75.agc:1546
//# SUBROUTINE NAME	R36	OUT-OF-PLANE RENDEZVOUS ROUTINE
// P34-35_P74-75.agc:1547
//# MOD NO. 2		DATE 2 JANUARY 1969
// P34-35_P74-75.agc:1548
//# MOD BY A.W.BANCROFT	LOG SECTION EXTENDED VERBS
// P34-35_P74-75.agc:1549
//#
// P34-35_P74-75.agc:1550
//# FUNCTIONAL DESCRIPTION
// P34-35_P74-75.agc:1551
//#
// P34-35_P74-75.agc:1552
//# TO DISPLAY AT ASTRONAUT REQUEST LGC CALCULATED RENDEZVOUS
// P34-35_P74-75.agc:1553
//# OUT-OF-PLANE PARAMETERS (Y, YDOT, PSI).  (REQUESTED BY DSKY).
// P34-35_P74-75.agc:1554
//#
// P34-35_P74-75.agc:1555
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1556
//#	ASTRONAUT REQUEST THROUGH DSKY V 90 E
// P34-35_P74-75.agc:1557
//#
// P34-35_P74-75.agc:1558
//# SUBROUTINES CALLED
// P34-35_P74-75.agc:1559
//#	EXDSPRET
// P34-35_P74-75.agc:1560
//#	GOMARKF
// P34-35_P74-75.agc:1561
//#	CSMPREC
// P34-35_P74-75.agc:1562
//#	LEMPREC
// P34-35_P74-75.agc:1563
//#	SGNAGREE
// P34-35_P74-75.agc:1564
//#	LOADTIME
// P34-35_P74-75.agc:1565
//#
// P34-35_P74-75.agc:1566
//# NORMAL EXIT MODES
// P34-35_P74-75.agc:1567
//#	ASTRONAUT REQUEST THROUGH DSKY TO TERMINATE PROGRAM V 34 E
// P34-35_P74-75.agc:1568
//#
// P34-35_P74-75.agc:1569
//# ALARM OR ABORT EXIT MODES
// P34-35_P74-75.agc:1570
//#	NONE
// P34-35_P74-75.agc:1571
//#
// P34-35_P74-75.agc:1572
//# OUTPUT
// P34-35_P74-75.agc:1573
//#	DECIMAL DISPLAY OF TIME, Y, YDOT AND PSI
// P34-35_P74-75.agc:1574
//#
// P34-35_P74-75.agc:1575
//#	DISPLAYED VALUES Y, YDOT, AND PSI, ARE STORED IN ERASABLE
// P34-35_P74-75.agc:1576
//#	REGISTERS RANGE, RRATE, AND RTHETA RESPECTIVELY.
// P34-35_P74-75.agc:1577
//#
// P34-35_P74-75.agc:1578
//# ERASABLE INITIALIZATION REQUIRED
// P34-35_P74-75.agc:1579
//#	CSM AND LEM STATE VECTORS
// P34-35_P74-75.agc:1580
//#
// P34-35_P74-75.agc:1581
//# DEBRIS
// P34-35_P74-75.agc:1582
//#	CENTRALS A,Q,L
// P34-35_P74-75.agc:1583
//#	OTHER:  THOSE USED BY THE ABOVE LISTED SUBROUTINES
// P34-35_P74-75.agc:1584
//
// P34-35_P74-75.agc:1585
//		BANK	20
// P34-35_P74-75.agc:1586
//		SETLOC	R36CM
// P34-35_P74-75.agc:1587
//		BANK
// P34-35_P74-75.agc:1588
//# Page 502
// P34-35_P74-75.agc:1589
//		EBANK=	RPASS36
// P34-35_P74-75.agc:1590
//
// P34-35_P74-75.agc:1591
//		SBANK=	R36A
// P34-35_P74-75.agc:1592
//		COUNT*	$$/R36
// P34-35_P74-75.agc:1593
//
// P34-35_P74-75.agc:1594
//R36		CAF	TWO
// slot 18548
            if slot <> 18548 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18549 {
// P34-35_P74-75.agc:1595
//		TS	OPTIONX
// slot 18549
                if slot <> 18549 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1596
//		CAF	ONE
// slot 18550
                if slot <> 18550 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18551 {
// P34-35_P74-75.agc:1597
//		TS	OPTIONX +1
// slot 18551
            if slot <> 18551 or instruction <> 23082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18552 {
// P34-35_P74-75.agc:1598
//		CAF	OPTION36	# V 04 N 12
// slot 18552
                if slot <> 18552 or instruction <> 13440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1152), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1599
//		TC	BANKCALL
// slot 18553
                if slot <> 18553 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1086] to agcAotUnit1086@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1600
//		CADR	GOXDSPF
// slot 18554
    18554, 17122
)).

// bank 20, slots 18555-18558
function agcAotUnit1087 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18556 {
        if slot <= 18555 {
// P34-35_P74-75.agc:1601
//		TC	ENDEXT		# TERMINATE
// slot 18555
            if slot <> 18555 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:1602
//		TC	+2		# PROCEED
// slot 18556
            if slot <> 18556 or instruction <> 1150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1150, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18557 {
// P34-35_P74-75.agc:1603
//		TC	-5		# R2 LOADED VIA DSKY
// slot 18557
            if slot <> 18557 or instruction <> 1144 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1144, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:1604
//		TC 	POSTJUMP
// slot 18558
            if slot <> 18558 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1087] to agcAotUnit1087@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1605
//		CADR	R36A
// slot 18559
    18559, 53166,
// P34-35_P74-75.agc:1606
//
// P34-35_P74-75.agc:1607
//OPTION36	VN	0412
// slot 18560
    18560, 1048
)).

// bank 41, slots 36823-36828
function agcAotUnit2152 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36825 {
        if slot <= 36823 {
// P34-35_P74-75.agc:1608
//
// P34-35_P74-75.agc:1609
//		SETLOC	R36LM
// P34-35_P74-75.agc:1610
//		BANK
// P34-35_P74-75.agc:1611
//
// P34-35_P74-75.agc:1612
//R36A		ZL
// slot 36823
            if slot <> 36823 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36824 {
// P34-35_P74-75.agc:1613
//		CAF	ZERO		# SET TIME OF EVENT TO ZERO FOR FIRST
// slot 36824
                if slot <> 36824 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1614
//		DXCH	DSPTEMX		# DISPLAY
// slot 36825
                if slot <> 36825 or instruction <> 22058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36826 {
// P34-35_P74-75.agc:1615
//		LXCH	OPTIONY		# SAVE VEH. OPTION
// slot 36826
            if slot <> 36826 or instruction <> 10210 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 994, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36827 {
// P34-35_P74-75.agc:1616
//R36P3		CAF	V06N16N
// slot 36827
                if slot <> 36827 or instruction <> 14333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2045), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1617
//		TC	BANKCALL
// slot 36828
                if slot <> 36828 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2152] to agcAotUnit2152@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1618
//		CADR	GOMARKF
// slot 36829
    36829, 17122
)).

// bank 41, slots 36830-36837
function agcAotUnit2153 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36833 {
        if slot <= 36831 {
            if slot <= 36830 {
// P34-35_P74-75.agc:1619
//		TCF	ENDEXT		# TERMINATE
// slot 36830
                if slot <> 36830 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1620
//		TCF	+2		# PROCEED
// slot 36831
                if slot <> 36831 or instruction <> 6113 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6113, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36832 {
// P34-35_P74-75.agc:1621
//		TCF	-5		# RECYCLE FOR ASTRONAUT INPUT TIME
// slot 36832
                if slot <> 36832 or instruction <> 6107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6107, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1622
//		DXCH	DSPTEMX
// slot 36833
                if slot <> 36833 or instruction <> 22058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36835 {
            if slot <= 36834 {
// P34-35_P74-75.agc:1623
//		EXTEND
// slot 36834
                if slot <> 36834 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1624
//		BZF	LREGCHK		# A-REG ZERO GOTO CHECK L-REG FOR ZERO
// slot 36835
                if slot <> 36835 or instruction <> 6132 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6132, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36836 {
// P34-35_P74-75.agc:1625
//ASTROTIM	DXCH	MPAC		# A-REG NON-ZERO, TIME = ASTRO INPUT TIME
// slot 36836
                if slot <> 36836 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1626
//		TC	INTPRET
// slot 36837
                if slot <> 36837 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2153] to agcAotUnit2153@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1627
//		RTB	GOTO
// slot 36838
    36838, 43064,
// P34-35_P74-75.agc:1628
//			DPMODE
// slot 36839
    36839, 38812,
// P34-35_P74-75.agc:1629
//			R36INT
// slot 36840
    36840, 54946,
// P34-35_P74-75.agc:1630
//
// P34-35_P74-75.agc:1631
//		SETLOC	R36LM1
// P34-35_P74-75.agc:1632
//		BANK
// P34-35_P74-75.agc:1633
//
// P34-35_P74-75.agc:1634
//R36INT		STORE	TDEC1
// slot 37713
    37713, 66,
// P34-35_P74-75.agc:1635
//		SLOAD	SR1
// slot 37714
    37714, 58042,
// P34-35_P74-75.agc:1636
//			OPTIONY
// slot 37715
    37715, 2502,
// P34-35_P74-75.agc:1637
//		BHIZ	CALL
// slot 37716
    37716, 37936,
// P34-35_P74-75.agc:1638
//			R36PROG2	# FOR CSM DISPLAY
// slot 37717
    37717, 54962,
// P34-35_P74-75.agc:1639
//# Page 503
// P34-35_P74-75.agc:1640
//			THISPREC	# FOR LEM DISPLAY
// slot 37718
    37718, 23666,
// P34-35_P74-75.agc:1641
//		GOTO
// slot 37719
    37719, 65360,
// P34-35_P74-75.agc:1642
//			R36PROG3
// slot 37720
    37720, 54966,
// P34-35_P74-75.agc:1643
//R36PROG2	CALL
// slot 37721
    37721, 65320,
// P34-35_P74-75.agc:1644
//			OTHPREC
// slot 37722
    37722, 23690,
// P34-35_P74-75.agc:1645
//R36PROG3	VLOAD	PDVL
// slot 37723
    37723, 52730,
// P34-35_P74-75.agc:1646
//			VATT
// slot 37724
    37724, 14,
// P34-35_P74-75.agc:1647
//			RATT		# _
// slot 37725
    37725, 2,
// P34-35_P74-75.agc:1648
//		STORE	RPASS36		# R
// slot 37726
    37726, 2478,
// P34-35_P74-75.agc:1649
//		UNIT	PDVL		#  P
// slot 37727
    37727, 52572,
// P34-35_P74-75.agc:1650
//		VXV	UNIT		# -
// slot 37728
    37728, 44602,
// P34-35_P74-75.agc:1651
//		STADR
// slot 37729
    37729, 65324,
// P34-35_P74-75.agc:1652
//		STODL	UNP36		# U
// slot 37730
    37730, 50756,
// P34-35_P74-75.agc:1653
//			TAT
// slot 37731
    37731, 26,
// P34-35_P74-75.agc:1654
//		STORE	TDEC1
// slot 37732
    37732, 66,
// P34-35_P74-75.agc:1655
//		SLOAD	SR1
// slot 37733
    37733, 58042,
// P34-35_P74-75.agc:1656
//			OPTIONY
// slot 37734
    37734, 2502,
// P34-35_P74-75.agc:1657
//		BHIZ	CALL
// slot 37735
    37735, 37936,
// P34-35_P74-75.agc:1658
//			R36PROG4	# FOR CSM DISPLAY
// slot 37736
    37736, 55000,
// P34-35_P74-75.agc:1659
//			OTHPREC		# FOR LEM DISPLAY
// slot 37737
    37737, 23690,
// P34-35_P74-75.agc:1660
//		GOTO
// slot 37738
    37738, 65360,
// P34-35_P74-75.agc:1661
//			R36PROG5
// slot 37739
    37739, 55004,
// P34-35_P74-75.agc:1662
//R36PROG4	CALL
// slot 37740
    37740, 65320,
// P34-35_P74-75.agc:1663
//			THISPREC
// slot 37741
    37741, 23666,
// P34-35_P74-75.agc:1664
//R36PROG5	VLOAD	PDVL		#			_
// slot 37742
    37742, 52730,
// P34-35_P74-75.agc:1665
//			VATT		# VELOCITY VECTOR	V	00D
// slot 37743
    37743, 14,
// P34-35_P74-75.agc:1666
//			RATT		# 			 A
// slot 37744
    37744, 2,
// P34-35_P74-75.agc:1667
//		PDDL
// slot 37745
    37745, 65450,
// P34-35_P74-75.agc:1668
//			TAT		# SAVE TIME IN LOCATION 30D FOR REDISPLAY
// slot 37746
    37746, 26,
// P34-35_P74-75.agc:1669
//		STOVL	30D		#		        _
// slot 37747
    37747, 20542,
// P34-35_P74-75.agc:1670
//		PUSH	PUSH		# POSITION VECTOR	R   IN	06D AND 12D
// slot 37748
    37748, 34316,
// P34-35_P74-75.agc:1671
//		BVSU	PDVL		#			_A  _
// slot 37749
    37749, 52554,
// P34-35_P74-75.agc:1672
//			RPASS36		# LINE OF SIGHT VECTOR	R - R	12D
// slot 37750
    37750, 2478,
// P34-35_P74-75.agc:1673
//		DOT	SL1		#			 P   A
// slot 37751
    37751, 59970,
// P34-35_P74-75.agc:1674
//			UNP36		#     _   _
// slot 37752
    37752, 2490,
// P34-35_P74-75.agc:1675
//		STOVL	RANGE		# Y = U . R
// slot 37753
    37753, 22946,
// P34-35_P74-75.agc:1676
//			00D		#          A
// slot 37754
    37754, 2,
// P34-35_P74-75.agc:1677
//		DOT	SL1
// slot 37755
    37755, 59970,
// P34-35_P74-75.agc:1678
//			UNP36		# .   _   _
// slot 37756
    37756, 2490,
// P34-35_P74-75.agc:1679
//		STOVL	RRATE		# Y = U . V
// slot 37757
    37757, 22950,
// P34-35_P74-75.agc:1680
//			06D		# _        A
// slot 37758
    37758, 14,
// P34-35_P74-75.agc:1681
//		UNIT	PUSH		# U  = UNIT ( R  )		18D
// slot 37759
    37759, 34396,
// P34-35_P74-75.agc:1682
//		VXV	VXV		#  RA          A
// slot 37760
    37760, 40250,
// P34-35_P74-75.agc:1683
//			00D		#  _    _     _     _
// slot 37761
    37761, 2,
// P34-35_P74-75.agc:1684
//			18D		# (U  X V ) X U   = U
// slot 37762
    37762, 38,
// P34-35_P74-75.agc:1685
//		VSL2	UNIT		#   RA   A     RA    A
// slot 37763
    37763, 44756,
// P34-35_P74-75.agc:1686
//		UNIT	GOTO
// slot 37764
    37764, 43100,
// P34-35_P74-75.agc:1687
//			R36B
// slot 37765
    37765, 50944,
// P34-35_P74-75.agc:1688
//
// P34-35_P74-75.agc:1689
//		SETLOC	R36CM1
// P34-35_P74-75.agc:1690
//# Page 504
// P34-35_P74-75.agc:1691
//		BANK
// P34-35_P74-75.agc:1692
//
// P34-35_P74-75.agc:1693
//R36B		STOVL	00D		# UNIT HORIZONTAL IN FORWARD DIR. 00D
// slot 35712
    35712, 20482,
// P34-35_P74-75.agc:1694
//			18D
// slot 35713
    35713, 38,
// P34-35_P74-75.agc:1695
//		DOT	VXSC		# _
// slot 35714
    35714, 61762,
// P34-35_P74-75.agc:1696
//			12D		# U
// slot 35715
    35715, 26,
// P34-35_P74-75.agc:1697
//		VSL2			#  L
// slot 35716
    35716, 65492,
// P34-35_P74-75.agc:1698
//		BVSU	UNIT
// slot 35717
    35717, 44618,
// P34-35_P74-75.agc:1699
//		UNIT
// slot 35718
    35718, 65372,
// P34-35_P74-75.agc:1700
//		PUSH	DOT		# LOS PROJECTED INTO HORIZONTAL  12D
// slot 35719
    35719, 41228,
// P34-35_P74-75.agc:1701
//			00D		# PLANE
// slot 35720
    35720, 2,
// P34-35_P74-75.agc:1702
//		SL1	ARCCOS		#              _   _
// slot 35721
    35721, 54996,
// P34-35_P74-75.agc:1703
//		STOVL	RTHETA		# PSI = ARCCOS(U . U )
// slot 35722
    35722, 22954,
// P34-35_P74-75.agc:1704
//		VXV	DOT		#               A   L
// slot 35723
    35723, 41274,
// P34-35_P74-75.agc:1705
//			00D
// slot 35724
    35724, 2,
// P34-35_P74-75.agc:1706
//		BPL	DLOAD
// slot 35725
    35725, 58696,
// P34-35_P74-75.agc:1707
//			R36TAG2
// slot 35726
    35726, 53202,
// P34-35_P74-75.agc:1708
//			DPPOSMAX
// slot 35727
    35727, 13766,
// P34-35_P74-75.agc:1709
//		DSU
// slot 35728
    35728, 65322,
// P34-35_P74-75.agc:1710
//			RTHETA
// slot 35729
    35729, 2474,
// P34-35_P74-75.agc:1711
//		STCALL	RTHETA
// slot 35730
    35730, 31146,
// P34-35_P74-75.agc:1712
//			R36TAG2
// slot 35731
    35731, 53202,
// P34-35_P74-75.agc:1713
//
// P34-35_P74-75.agc:1714
//		SETLOC	R36LM
// P34-35_P74-75.agc:1715
//		BANK
// P34-35_P74-75.agc:1716
//
// P34-35_P74-75.agc:1717
//R36TAG2		DLOAD	RTB
// slot 36841
    36841, 40138,
// P34-35_P74-75.agc:1718
//			30D
// slot 36842
    36842, 62,
// P34-35_P74-75.agc:1719
//			SGNAGREE
// slot 36843
    36843, 38600,
// P34-35_P74-75.agc:1720
//		STORE	DSPTEMX
// slot 36844
    36844, 1108,
// P34-35_P74-75.agc:1721
//		EXIT
// slot 36845
    36845, 65532
)).

// bank 41, slots 36846-36847
function agcAotUnit2154 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36846 {
// P34-35_P74-75.agc:1722
//		CAF	V06N90N		# DISPLAY Y, YDOT, AND PSI.
// slot 36846
        if slot <> 36846 or instruction <> 14334 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2046), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:1723
//		TC	BANKCALL
// slot 36847
        if slot <> 36847 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2154] to agcAotUnit2154@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1724
//		CADR	GOMARKF
// slot 36848
    36848, 17122
)).

// bank 41, slots 36849-36857
function agcAotUnit2155 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36852 {
        if slot <= 36850 {
            if slot <= 36849 {
// P34-35_P74-75.agc:1725
//		TCF	ENDEXT		# TERMINATE
// slot 36849
                if slot <> 36849 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1726
//		TCF	ENDEXT		# PROCEED, END OF PROGRAM
// slot 36850
                if slot <> 36850 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36851 {
// P34-35_P74-75.agc:1727
//		TCF	R36P3		# REDISPLAY OUTPUT
// slot 36851
                if slot <> 36851 or instruction <> 6107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6107, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1728
//LREGCHK		XCH	L
// slot 36852
                if slot <> 36852 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36854 {
            if slot <= 36853 {
// P34-35_P74-75.agc:1729
//		EXTEND
// slot 36853
                if slot <> 36853 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1730
//		BZF	ENTTIM2		# L-REG ZERO, SET TIME = PRESENT TIME
// slot 36854
                if slot <> 36854 or instruction <> 6137 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6137, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36855 {
// P34-35_P74-75.agc:1731
//		XCH	L		# L-REG NON ZERO, TIME = ASTRO INPUT TIME
// slot 36855
                if slot <> 36855 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36856 {
// P34-35_P74-75.agc:1732
//		TCF	ASTROTIM
// slot 36856
                    if slot <> 36856 or instruction <> 6116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6116, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1733
//ENTTIM2		TC	INTPRET
// slot 36857
                    if slot <> 36857 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2155] to agcAotUnit2155@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1734
//		RTB	GOTO
// slot 36858
    36858, 43064,
// P34-35_P74-75.agc:1735
//			LOADTIME
// slot 36859
    36859, 38544,
// P34-35_P74-75.agc:1736
//			R36INT
// slot 36860
    36860, 54946,
// P34-35_P74-75.agc:1737
//V06N16N		VN	00616
// slot 36861
    36861, 1568,
// P34-35_P74-75.agc:1738
//V06N90N		VN	00690
// slot 36862
    36862, 1716
)).

// no code for the lines below
// P34-35_P74-75.agc:1739
//		SBANK=	LOWSUPER
