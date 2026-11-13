// PORT: Original source unit S-BAND_ANTENNA_FOR_CM.agc.
// PORT: Physical bank 42. Shared continuation entries, slots 37802–37802.
function agcAotUnit2204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:2
//# Filename:	S-BAND_ANTENNA_FOR_CM.agc
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:7
//# Contact:	Jim Lawton <jim.lawton@gmail.com>.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:9
//# Pages:	934-935
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:10
//# Mod history:	2009-05-11 JVL	Adapted from the Colossus249/ file
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:12
//#				images.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:13
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:22
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:24
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:27
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:29
//#            Colossus 2A
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:30
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:31
//# Page 934
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:32
//# S-BAND ANTENNA FOR CM
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:33
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:34
//		BANK	23
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:35
//		SETLOC	SBAND
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:36
//		BANK
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:37
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:38
//		COUNT*	$$/R05
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:39
//		EBANK=	EMSALT
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:40
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:41
//SBANDANT	TC	BANKCALL	# V 64 E GETS US HERE
// PORT: Fixed ROM slots 37802.
    if slot <> 37802 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2204] to agcAotUnit2204@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:42
//		CADR	R02BOTH		# CHECK IF IMU IS ON AND ALIGNED
// PORT: Fixed ROM slots 37803.
    37803, 16214
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37804–37804.
function agcAotUnit2205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:43
//		TC	INTPRET
// PORT: Fixed ROM slots 37804.
    if slot <> 37804 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2205] to agcAotUnit2205@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:44
//		RTB	CALL
// PORT: Fixed ROM slots 37805.
    37805, 37944,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:45
//			LOADTIME	# PICKUP CURRENT TIME SCALED B-28
// PORT: Fixed ROM slots 37806.
    37806, 38544,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:46
//			CDUTRIG		# COMPUTE SINES AND COSINES OF CDU ANGLES
// PORT: Fixed ROM slots 37807.
    37807, 40574,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:47
//		STCALL	TDEC1		# ADVANCE INTEGRATION TO TIME IN TDEC1
// PORT: Fixed ROM slots 37808.
    37808, 28738,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:48
//			CSMCONIC	# USING CONIC INTEGRATION
// PORT: Fixed ROM slots 37809.
    37809, 23704,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:49
//		SLOAD	BHIZ		# ORIGIN OF REFERENCE INERTIAL SYSTEM IS
// PORT: Fixed ROM slots 37810.
    37810, 39098,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:50
//			X2		# EARTH = 0, MOON = 2
// PORT: Fixed ROM slots 37811.
    37811, 80,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:51
//			EISOI
// PORT: Fixed ROM slots 37812.
    37812, 55166,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:52
//		VLOAD
// PORT: Fixed ROM slots 37813.
    37813, 65530,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:53
//			RATT
// PORT: Fixed ROM slots 37814.
    37814, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:54
//		STORE	RCM		# MOVE RATT TO PREVENT WIPEOUT
// PORT: Fixed ROM slots 37815.
    37815, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:55
//		DLOAD	CALL		# MOON, PUSH ON
// PORT: Fixed ROM slots 37816.
    37816, 38090,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:56
//			TAT		# GET ORIGINAL TIME
// PORT: Fixed ROM slots 37817.
    37817, 26,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:57
//			LUNPOS		# COMPUTE POSITION VECTOR OF MOON
// PORT: Fixed ROM slots 37818.
    37818, 45210,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:58
//		VAD	VCOMP		# R= -(REM+RCM) = NEG. OF S/C POS. VEC
// PORT: Fixed ROM slots 37819.
    37819, 48730,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:59
//			RCM
// PORT: Fixed ROM slots 37820.
    37820, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:60
//		GOTO
// PORT: Fixed ROM slots 37821.
    37821, 65360,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:61
//			EISOI +2
// PORT: Fixed ROM slots 37822.
    37822, 55170,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:62
//EISOI		VLOAD	VCOMP		# EARTH, R= -RCM
// PORT: Fixed ROM slots 37823.
    37823, 48890,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:63
//			RATT
// PORT: Fixed ROM slots 37824.
    37824, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:64
//		SETPD	MXV		# RCS TO STABLE MEMBER- B-1X B-29X B+1
// PORT: Fixed ROM slots 37825.
    37825, 53506,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:65
//			2D		# 2D
// PORT: Fixed ROM slots 37826.
    37826, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:66
//			REFSMMAT	# STABLE MEMBER.  B-1X B-29X B+1= B-29
// PORT: Fixed ROM slots 37827.
    37827, 1980,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:67
//		VSL1	PDDL		# 8D
// PORT: Fixed ROM slots 37828.
    37828, 54772,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:68
//			HI6ZEROS
// PORT: Fixed ROM slots 37829.
    37829, 13754,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:69
//		STOVL	YAWANG		# ZERO OUT YAWANG, SET UP FOR SMNB
// PORT: Fixed ROM slots 37830.
    37830, 20522,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:70
//			RCM		# TRANSFORMATION.  SM COORD.  SCALED B-29
// PORT: Fixed ROM slots 37831.
    37831, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:71
//		CALL
// PORT: Fixed ROM slots 37832.
    37832, 65320,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:72
//			*SMNB*
// PORT: Fixed ROM slots 37833.
    37833, 40776,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:73
//		STORE	R		# SAVE NAV. BASE COORDINATES
// PORT: Fixed ROM slots 37834.
    37834, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:74
//		UNIT	PDVL		# 14D
// PORT: Fixed ROM slots 37835.
    37835, 52572,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:75
//			R
// PORT: Fixed ROM slots 37836.
    37836, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:76
//		VPROJ	VSL2		# COMPUTE PROJECTION OF VECTOR INTO CM
// PORT: Fixed ROM slots 37837.
    37837, 59954,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:77
//			HIUNITZ		# XY-PLANE, R-(R.UZ)UZ
// PORT: Fixed ROM slots 37838.
    37838, 13742,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:78
//		BVSU	BOV		# CLEAR OVERFLOW INDICATOR IF SET
// PORT: Fixed ROM slots 37839.
    37839, 32842,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:79
//			R
// PORT: Fixed ROM slots 37840.
    37840, 6,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:80
//			COVCNV
// PORT: Fixed ROM slots 37841.
    37841, 55204,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:81
//COVCNV		UNIT	BOV		# TEST OVERFLOW FOR INDICATION OF NULL
// PORT: Fixed ROM slots 37842.
    37842, 32860,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:82
//			NOADJUST	# VECTOR
// PORT: Fixed ROM slots 37843.
    37843, 55230,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:83
//		PUSH	DOT		# 20D
// PORT: Fixed ROM slots 37844.
    37844, 41228,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:84
//# Page 935
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:85
//			HIUNITX		# COMPUTE YAW ANGLE = ACOS (URP.UX)
// PORT: Fixed ROM slots 37845.
    37845, 13750,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:86
//		SL1	ACOS		# REVOLUTIONS SCALED B0
// PORT: Fixed ROM slots 37846.
    37846, 54996,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:87
//		PDVL	DOT		# 22D YAWANG
// PORT: Fixed ROM slots 37847.
    37847, 41370,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:88
//			URP
// PORT: Fixed ROM slots 37848.
    37848, 30,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:89
//			HIUNITY		# COMPUTE FOLLOWING- URP.UY
// PORT: Fixed ROM slots 37849.
    37849, 13746,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:90
//		SL1	BPL		# POSITIVE
// PORT: Fixed ROM slots 37850.
    37850, 42196,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:91
//			NOADJUST	# YES, 0- 180 DEGREES
// PORT: Fixed ROM slots 37851.
    37851, 55230,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:92
//		DLOAD	DSU		# NO, 181-360 DEGREES 20D
// PORT: Fixed ROM slots 37852.
    37852, 38346,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:93
//			DPPOSMAX	# COMPUTE 2 PI MINUS YAW ANGLE
// PORT: Fixed ROM slots 37853.
    37853, 13766,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:94
//		PUSH			# 22D YAWANG
// PORT: Fixed ROM slots 37854.
    37854, 65292,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:95
//NOADJUST	VLOAD	DOT		# COMPUTE PITCH ANGLE
// PORT: Fixed ROM slots 37855.
    37855, 41466,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:96
//			UR		# ACOS (UR.UZ) - PI/2
// PORT: Fixed ROM slots 37856.
    37856, 18,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:97
//			HIUNITZ
// PORT: Fixed ROM slots 37857.
    37857, 13742,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:98
//		SL1	ACOS		# REVOLUTIONS B0
// PORT: Fixed ROM slots 37858.
    37858, 54996,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:99
//		DSU
// PORT: Fixed ROM slots 37859.
    37859, 65322,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:100
//			HIDP1/4
// PORT: Fixed ROM slots 37860.
    37860, 13738,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:101
//		STODL	RHOSB
// PORT: Fixed ROM slots 37861.
    37861, 14754,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:102
//			YAWANG
// PORT: Fixed ROM slots 37862.
    37862, 42,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:103
//		STORE	GAMMASB		# PATCH FOR CHECKOUT
// PORT: Fixed ROM slots 37863.
    37863, 2470,
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:104
//		EXIT
// PORT: Fixed ROM slots 37864.
    37864, 65532
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37865–37870.
function agcAotUnit2206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37867 {
        if slot <= 37865 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:105
//		CA	EXTVBACT	# IS BIT 5 STILL ON
// PORT: Fixed ROM slots 37865.
            if slot <> 37865 or instruction <> 12836 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 548).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37866 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:106
//		MASK	BIT5
// PORT: Fixed ROM slots 37866.
                if slot <> 37866 or instruction <> 31243 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    if fixedOperand = 16 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:107
//		EXTEND
// PORT: Fixed ROM slots 37867.
                if slot <> 37867 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37868 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:108
//		BZF	ENDEXT		# NO, WE HAVE BEEN ANSWERED
// PORT: Fixed ROM slots 37868.
            if slot <> 37868 or instruction <> 7004 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7004, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37869 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:109
//		CAF	V06N51		# DISPLAY ANGLES
// PORT: Fixed ROM slots 37869.
                if slot <> 37869 or instruction <> 14329 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2041), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:110
//		TC	BANKCALL
// PORT: Fixed ROM slots 37870.
                if slot <> 37870 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2206] to agcAotUnit2206@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:111
//		CADR	GOMARKFR
// PORT: Fixed ROM slots 37871.
    37871, 17152
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37872–37878.
function agcAotUnit2207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37874 {
        if slot <= 37872 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:112
//		TC	B5OFF		# TERMINATE
// PORT: Fixed ROM slots 37872.
            if slot <> 37872 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37873 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:113
//		TC	B5OFF
// PORT: Fixed ROM slots 37873.
                if slot <> 37873 or instruction <> 2965 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2965, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:114
//		TC	ENDOFJOB	# RECYCLE
// PORT: Fixed ROM slots 37874.
                if slot <> 37874 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37876 {
            if slot <= 37875 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:115
//		CAF	BIT3		# IMMEDIATE RETURN
// PORT: Fixed ROM slots 37875.
                if slot <> 37875 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:116
//		TC	BLANKET		# BLANK R3
// PORT: Fixed ROM slots 37876.
                if slot <> 37876 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37877 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:117
//		CAF	BIT1		# DELAY MINIMUM TIME TO ALLOW DISPLAY IN
// PORT: Fixed ROM slots 37877.
                if slot <> 37877 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:118
//		TC	BANKCALL
// PORT: Fixed ROM slots 37878.
                if slot <> 37878 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2207] to agcAotUnit2207@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:119
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 37879.
    37879, 1972
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37880–37880.
function agcAotUnit2208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:120
//		TCF	SBANDANT +2
// PORT: Fixed ROM slots 37880.
    if slot <> 37880 or instruction <> 6060 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6060, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2208] to agcAotUnit2208@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:121
//V06N51		VN	0651
// PORT: Fixed ROM slots 37881.
    37881, 1638
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:122
//RCM		EQUALS	2D
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:123
//UR		EQUALS	8D
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:124
//URP		EQUALS	14D
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:125
//YAWANG		EQUALS	20D
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:126
//PITCHANG	EQUALS	22D
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:127
//R		EQUALS	RCM
// PORT: SOURCE S-BAND_ANTENNA_FOR_CM.agc:128
//		SBANK=	LOWSUPER
