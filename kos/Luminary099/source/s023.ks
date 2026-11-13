// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc
// bank 35, slots 32040-32043
function agcAotUnit2035 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32041 {
        if slot <= 32040 {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:1
//# Copyright:	Public domain.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:2
//# Filename:	LAMBERT_AIMPOINT_GUIDANCE.agc
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:6
//# Assembler:	yaYUL
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:9
//# Pages:	651-653
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:10
//# Mod history:	2009-05-18 RSB	Transcribed from Luminary 099
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:11
//#				page images.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:12
//#		2009-06-05 RSB	Corrected 4 typos.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:13
//#		2009-06-07 RSB	Fixed a typo.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:14
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:15
//# This source code has been transcribed or otherwise adapted from
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:19
//# in storage size and consequent reduction in image quality as well) are
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:22
//# about getting access to the (much) higher-quality images which Paul
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:23
//# actually created.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:24
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:25
//# Notations on the hardcopy document read, in part:
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:26
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:28
//#	16:27 JULY 14,1969
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:29
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:30
//# Page 651
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:31
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:32
//# GENERAL  LAMBERT AIMPOINT GUIDANCE **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:33
//# WRITTEN  BY RAMA M AIYAWAR
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:34
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:35
//# PROGRAM P-31 DESCRIPTION **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:36
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:37
//# 1.	   TO ACCEPT TARGETING PARAMETERS OBTAINED FROM A SOURCE EXTERNAL
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:38
//#	   TO THE LEM AND COMPUTE THERE FROM THE REQUIRED-VELOCITY AND
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:39
//#	   OTHER INITIAL CONDITIONS REQUIRED BY LM FOR DESIRED MANEUVER.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:40
//#	   THE TARGETING PARAMETERS ARE TIG (TIME OF IGNITION), TARGET
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:41
//#	   VECTOR (RTARG), AND THE TIME FROM TIG UNTIL THE TARGET IS
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:42
//#	   REACHED(DELLT4),DESIRED TIME OF FLIGHT FROM  RINIT TO RTARG..
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:43
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:44
//# ASSUMPTIONS **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:45
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:46
//# 1.	   THE TARGET PARAMETERS MAY HAVE BEEN LOADED PRIOR TO THE
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:47
//#	   EXECUTION OF THIS PROGRAM.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:48
//# 2.	   THIS PROGRAM IS APPLICABLE IN EITHER EARTH OR LUNAR ORBIT.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:49
//# 3.	   THIS PROGRAM IS DESIGNED FOR ONE-MAN OPERATION, AND SHOULD
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:50
//#	   BE SELECTED BY THE ASTRONAUT BY DSKY ENTRY  V37 E31.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:51
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:52
//# SUBROUTINES USED **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:53
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:54
//# MANUPARM, TTG/N35, R02BOTH, MIDGIM, DISPMGA, FLAGDOWN, BANKCALL,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:55
//# GOTOPOOH, ENDOFJOB, PHASCHNG, GOFLASHR, GOFLASH.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:56
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:57
//# MANUPARM	  CALCULATES APOGEE, PERIGEE ALTITUDES AND DELTAV DESIRED
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:58
//#		  FOR THE MANEUVER.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:59
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:60
//# TTG/N35	  CLOCKTASK - UPDATES CLOCK.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:61
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:62
//# MIDGIM	  CALCULATES MIDDLE GIMBAL ANGLE FOR DISPLAY.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:63
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:64
//# R02BOTH	  IMU - STATUS CHECK ROUTINE.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:65
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:66
//# DISPLAYS USED IN P-31LM **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:67
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:68
//# V06N33	  DISPLAY SOTRED  TIG (IN HRS. MINS. SECS)
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:69
//# V06N42	  DISPLAY APOGEE, PERIGEE, DELTAV.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:70
//# V16N35	  DISPLAY TIME FROM TIG.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:71
//# V06N45	  TIME FROM IGNITION AND MIDDLE GIMBAL ANGLE.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:72
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:73
//# ERASABLE INITIALIZATION REQUIRED **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:74
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:75
//# TIG		  TIME OF IGNITION    DP    (B+28) CS.
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:76
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:77
//# DELLT4	  DESIRED TIME OF FLIGHT   DP  (B+28) CS
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:78
//#		  FROM RINIT TO RTARG .
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:79
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:80
//# RTARG		  RADIUS VECTOR OF TARGET POSITION VECTOR
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:81
//#		  RADIUS VECTOR   SCALED TO  (B+29)METERS IF EARTH ORBIT
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:82
//# Page 652
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:83
//#		  RADIUS VECTOR SCALED TO    (B+27)METERS IF MOON  ORBIT
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:84
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:85
//# OUTPUT **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:86
//#
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:87
//# HAPO		  APOGEE ALTITUDE
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:88
//# HPER		  PERIGEE ALTITUDE
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:89
//# VGDISP	  MAG.OF DELTAV FOR DISPLAY ,SCALING	  B+7 M/CS EARTH
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:90
//#		  MAG.OF DELTAV FOR DISPLAY,SCALING	  B+5 M/CS MOON
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:91
//# MIDGIM	  MIDDLE GIMBAL ANGLE
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:92
//# XDELVFLG	  RESETS XDELVFLG FOR LAMBERT VG COMPUTATIONS
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:93
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:94
//# ALARMS OR ABORTS  NONE **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:95
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:96
//# RESTARTS  ARE VIA GROUP 4 **
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:97
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:98
//		SETLOC	GLM
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:99
//		BANK
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:100
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:101
//		EBANK=	SUBEXIT
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:102
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:103
//		COUNT*	$$/P31
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:104
//P31		TC	P20FLGON
// slot 32040
            if slot <> 32040 or instruction <> 1265 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1265, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:105
//		CAF	V06N33		# TIG
// slot 32041
            if slot <> 32041 or instruction <> 13333 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1045), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32042 {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:106
//		TC	VNPOOH
// slot 32042
            if slot <> 32042 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:107
//		TC	INTPRET
// slot 32043
            if slot <> 32043 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2035] to agcAotUnit2035@.

agcAotInstallSourceRope(list(
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:108
//		CLEAR	DLOAD
// slot 32044
    32044, 58648,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:109
//			UPDATFLG
// slot 32045
    32045, 880,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:110
//			TIG
// slot 32046
    32046, 3652,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:111
//		STCALL	TDEC1		# INTEGRATE STATE VECTORS TO TIG
// slot 32047
    32047, 28738,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:112
//			LEMPREC
// slot 32048
    32048, 23646,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:113
//		VLOAD	SETPD
// slot 32049
    32049, 33274,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:114
//			RATT
// slot 32050
    32050, 2,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:115
//			0D
// slot 32051
    32051, 2,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:116
//		STORE	RTIG
// slot 32052
    32052, 3908,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:117
//		STOVL	RINIT
// slot 32053
    32053, 22950,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:118
//			VATT
// slot 32054
    32054, 14,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:119
//		STORE	VTIG
// slot 32055
    32055, 3920,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:120
//		STODL	VINIT
// slot 32056
    32056, 14770,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:121
//			P30ZERO
// slot 32057
    32057, 27168,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:122
//		PUSH	PDDL		# E4 AND NUMIT = 0
// slot 32058
    32058, 54540,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:123
//			DELLT4
// slot 32059
    32059, 3668,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:124
//		DAD	SXA,1
// slot 32060
    32060, 55322,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:125
//			TIG
// slot 32061
    32061, 3652,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:126
//			RTX1
// slot 32062
    32062, 3068,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:127
//		STORE	TPASS4
// slot 32063
    32063, 3890,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:128
//		SXA,2	CALL
// slot 32064
    32064, 38072,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:129
//			RTX2
// slot 32065
    32065, 3070,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:130
//			INITVEL
// slot 32066
    32066, 18432,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:131
//		VLOAD	PUSH
// slot 32067
    32067, 34554,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:132
//# Page 653
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:133
//			DELVEET3
// slot 32068
    32068, 2540,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:134
//		STORE	DELVSIN
// slot 32069
    32069, 3932,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:135
//		ABVAL	CLEAR
// slot 32070
    32070, 35916,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:136
//			XDELVFLG
// slot 32071
    32071, 1390,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:137
//		STCALL	VGDISP
// slot 32072
    32072, 32616,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:138
//			GET.LVC
// slot 32073
    32073, 14262,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:139
//		VLOAD	PDVL
// slot 32074
    32074, 52730,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:140
//			RTIG
// slot 32075
    32075, 3908,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:141
//			VIPRIME
// slot 32076
    32076, 2494,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:142
//		CALL
// slot 32077
    32077, 65320,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:143
//			PERIAPO1
// slot 32078
    32078, 39324,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:144
//		CALL
// slot 32079
    32079, 65320,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:145
//			SHIFTR1
// slot 32080
    32080, 39468,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:146
//		CALL			# LIMIT DISPLAY TO 9999.9 N. MI.
// slot 32081
    32081, 65320,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:147
//			MAXCHK
// slot 32082
    32082, 38716,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:148
//		STODL	HPER
// slot 32083
    32083, 14754,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:149
//			4D
// slot 32084
    32084, 10,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:150
//		CALL
// slot 32085
    32085, 65320,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:151
//			SHIFTR1
// slot 32086
    32086, 39468,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:152
//		CALL			# LIMIT DISPLAY TO 9999.9 N. MI.
// slot 32087
    32087, 65320,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:153
//			MAXCHK
// slot 32088
    32088, 38716,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:154
//		STORE	HAPO
// slot 32089
    32089, 2462,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:155
//		EXIT
// slot 32090
    32090, 65532
)).

// bank 35, slots 32091-32095
function agcAotUnit2036 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32092 {
        if slot <= 32091 {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:156
//		CAF	V06N81		# DELVLVC
// slot 32091
            if slot <> 32091 or instruction <> 14295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2007), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:157
//		TC	VNPOOH
// slot 32092
            if slot <> 32092 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32093 {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:158
//		CAF	V06N42		# HAPO, HPER, VGDISP
// slot 32093
            if slot <> 32093 or instruction <> 13334 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1046), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32094 {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:159
//		TC	VNPOOH
// slot 32094
                if slot <> 32094 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:160
//		TC	INTPRET
// slot 32095
                if slot <> 32095 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2036] to agcAotUnit2036@.

agcAotInstallSourceRope(list(
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:161
//REVN1645	SET	CALL		# TRKMKCNT, TTOGO, +MGA
// slot 32096
    32096, 37912,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:162
//			FINALFLG
// slot 32097
    32097, 1138,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:163
//			VN1645
// slot 32098
    32098, 61196,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:164
//		GOTO
// slot 32099
    32099, 65360,
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:165
//			REVN1645
// slot 32100
    32100, 60096
)).

// no code for the lines below
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:166
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:167
//
// GENERAL_LAMBERT_AIMPOINT_GUIDANCE.agc:168
//# *** END OF LEMP30S .103 ***
