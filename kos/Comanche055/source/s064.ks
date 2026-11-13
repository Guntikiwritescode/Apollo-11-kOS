// S-BAND_ANTENNA_FOR_CM.agc
// bank 42, slots 37802-37802
function agcAotUnit2204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// S-BAND_ANTENNA_FOR_CM.agc:1
//# Copyright:	Public domain.
// S-BAND_ANTENNA_FOR_CM.agc:2
//# Filename:	S-BAND_ANTENNA_FOR_CM.agc
// S-BAND_ANTENNA_FOR_CM.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// S-BAND_ANTENNA_FOR_CM.agc:4
//#		It is part of the source code for the Command Module's (CM)
// S-BAND_ANTENNA_FOR_CM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// S-BAND_ANTENNA_FOR_CM.agc:6
//# Assembler:	yaYUL
// S-BAND_ANTENNA_FOR_CM.agc:7
//# Contact:	Lawton Kerman <jim.lawton@gmail.com>.
// S-BAND_ANTENNA_FOR_CM.agc:8
//# Website:	www.ibiblio.org/apollo.
// S-BAND_ANTENNA_FOR_CM.agc:9
//# Pages:	934-935
// S-BAND_ANTENNA_FOR_CM.agc:10
//# Mod history:	2009-05-11 JVL	Adapted from the Colossus249/ file
// S-BAND_ANTENNA_FOR_CM.agc:11
//#				of the same name, using Comanche055 page
// S-BAND_ANTENNA_FOR_CM.agc:12
//#				images.
// S-BAND_ANTENNA_FOR_CM.agc:13
//#
// S-BAND_ANTENNA_FOR_CM.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// S-BAND_ANTENNA_FOR_CM.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// S-BAND_ANTENNA_FOR_CM.agc:16
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// S-BAND_ANTENNA_FOR_CM.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// S-BAND_ANTENNA_FOR_CM.agc:18
//# consequent reduction in image quality as well) are available online at
// S-BAND_ANTENNA_FOR_CM.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// S-BAND_ANTENNA_FOR_CM.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// S-BAND_ANTENNA_FOR_CM.agc:21
//# (much) higher-quality images which Fjeld Kerman actually created.
// S-BAND_ANTENNA_FOR_CM.agc:22
//#
// S-BAND_ANTENNA_FOR_CM.agc:23
//# Notations on the hardcopy document read, in part:
// S-BAND_ANTENNA_FOR_CM.agc:24
//#
// S-BAND_ANTENNA_FOR_CM.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// S-BAND_ANTENNA_FOR_CM.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// S-BAND_ANTENNA_FOR_CM.agc:27
//#
// S-BAND_ANTENNA_FOR_CM.agc:28
//#    This AGC program shall also be referred to as
// S-BAND_ANTENNA_FOR_CM.agc:29
//#            Colossus 2A
// S-BAND_ANTENNA_FOR_CM.agc:30
//
// S-BAND_ANTENNA_FOR_CM.agc:31
//# Page 934
// S-BAND_ANTENNA_FOR_CM.agc:32
//# S-BAND ANTENNA FOR CM
// S-BAND_ANTENNA_FOR_CM.agc:33
//
// S-BAND_ANTENNA_FOR_CM.agc:34
//		BANK	23
// S-BAND_ANTENNA_FOR_CM.agc:35
//		SETLOC	SBAND
// S-BAND_ANTENNA_FOR_CM.agc:36
//		BANK
// S-BAND_ANTENNA_FOR_CM.agc:37
//
// S-BAND_ANTENNA_FOR_CM.agc:38
//		COUNT*	$$/R05
// S-BAND_ANTENNA_FOR_CM.agc:39
//		EBANK=	EMSALT
// S-BAND_ANTENNA_FOR_CM.agc:40
//
// S-BAND_ANTENNA_FOR_CM.agc:41
//SBANDANT	TC	BANKCALL	# V 64 E GETS US HERE
// slot 37802
    if slot <> 37802 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2204] to agcAotUnit2204@.

agcAotInstallSourceRope(list(
// S-BAND_ANTENNA_FOR_CM.agc:42
//		CADR	R02BOTH		# CHECK IF IMU IS ON AND ALIGNED
// slot 37803
    37803, 16214
)).

// bank 42, slots 37804-37804
function agcAotUnit2205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// S-BAND_ANTENNA_FOR_CM.agc:43
//		TC	INTPRET
// slot 37804
    if slot <> 37804 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2205] to agcAotUnit2205@.

agcAotInstallSourceRope(list(
// S-BAND_ANTENNA_FOR_CM.agc:44
//		RTB	CALL
// slot 37805
    37805, 37944,
// S-BAND_ANTENNA_FOR_CM.agc:45
//			LOADTIME	# PICKUP CURRENT TIME SCALED B-28
// slot 37806
    37806, 38544,
// S-BAND_ANTENNA_FOR_CM.agc:46
//			CDUTRIG		# COMPUTE SINES AND COSINES OF CDU ANGLES
// slot 37807
    37807, 40574,
// S-BAND_ANTENNA_FOR_CM.agc:47
//		STCALL	TDEC1		# ADVANCE INTEGRATION TO TIME IN TDEC1
// slot 37808
    37808, 28738,
// S-BAND_ANTENNA_FOR_CM.agc:48
//			CSMCONIC	# USING CONIC INTEGRATION
// slot 37809
    37809, 23704,
// S-BAND_ANTENNA_FOR_CM.agc:49
//		SLOAD	BHIZ		# ORIGIN OF REFERENCE INERTIAL SYSTEM IS
// slot 37810
    37810, 39098,
// S-BAND_ANTENNA_FOR_CM.agc:50
//			X2		# KERBIN = 0, MUN = 2
// slot 37811
    37811, 80,
// S-BAND_ANTENNA_FOR_CM.agc:51
//			EISOI
// slot 37812
    37812, 55166,
// S-BAND_ANTENNA_FOR_CM.agc:52
//		VLOAD
// slot 37813
    37813, 65530,
// S-BAND_ANTENNA_FOR_CM.agc:53
//			RATT
// slot 37814
    37814, 2,
// S-BAND_ANTENNA_FOR_CM.agc:54
//		STORE	RCM		# MOVE RATT TO PREVENT WIPEOUT
// slot 37815
    37815, 6,
// S-BAND_ANTENNA_FOR_CM.agc:55
//		DLOAD	CALL		# MUN, PUSH ON
// slot 37816
    37816, 38090,
// S-BAND_ANTENNA_FOR_CM.agc:56
//			TAT		# GET ORIGINAL TIME
// slot 37817
    37817, 26,
// S-BAND_ANTENNA_FOR_CM.agc:57
//			LUNPOS		# COMPUTE POSITION VECTOR OF MUN
// slot 37818
    37818, 45210,
// S-BAND_ANTENNA_FOR_CM.agc:58
//		VAD	VCOMP		# R= -(REM+RCM) = NEG. OF S/C POS. VEC
// slot 37819
    37819, 48730,
// S-BAND_ANTENNA_FOR_CM.agc:59
//			RCM
// slot 37820
    37820, 6,
// S-BAND_ANTENNA_FOR_CM.agc:60
//		GOTO
// slot 37821
    37821, 65360,
// S-BAND_ANTENNA_FOR_CM.agc:61
//			EISOI +2
// slot 37822
    37822, 55170,
// S-BAND_ANTENNA_FOR_CM.agc:62
//EISOI		VLOAD	VCOMP		# KERBIN, R= -RCM
// slot 37823
    37823, 48890,
// S-BAND_ANTENNA_FOR_CM.agc:63
//			RATT
// slot 37824
    37824, 2,
// S-BAND_ANTENNA_FOR_CM.agc:64
//		SETPD	MXV		# RCS TO STABLE MEMBER- B-1X B-29X B+1
// slot 37825
    37825, 53506,
// S-BAND_ANTENNA_FOR_CM.agc:65
//			2D		# 2D
// slot 37826
    37826, 6,
// S-BAND_ANTENNA_FOR_CM.agc:66
//			REFSMMAT	# STABLE MEMBER.  B-1X B-29X B+1= B-29
// slot 37827
    37827, 1980,
// S-BAND_ANTENNA_FOR_CM.agc:67
//		VSL1	PDDL		# 8D
// slot 37828
    37828, 54772,
// S-BAND_ANTENNA_FOR_CM.agc:68
//			HI6ZEROS
// slot 37829
    37829, 13754,
// S-BAND_ANTENNA_FOR_CM.agc:69
//		STOVL	YAWANG		# ZERO OUT YAWANG, SET UP FOR SMNB
// slot 37830
    37830, 20522,
// S-BAND_ANTENNA_FOR_CM.agc:70
//			RCM		# TRANSFORMATION.  SM COORD.  SCALED B-29
// slot 37831
    37831, 6,
// S-BAND_ANTENNA_FOR_CM.agc:71
//		CALL
// slot 37832
    37832, 65320,
// S-BAND_ANTENNA_FOR_CM.agc:72
//			*SMNB*
// slot 37833
    37833, 40776,
// S-BAND_ANTENNA_FOR_CM.agc:73
//		STORE	R		# SAVE NAV. BASE COORDINATES
// slot 37834
    37834, 6,
// S-BAND_ANTENNA_FOR_CM.agc:74
//		UNIT	PDVL		# 14D
// slot 37835
    37835, 52572,
// S-BAND_ANTENNA_FOR_CM.agc:75
//			R
// slot 37836
    37836, 6,
// S-BAND_ANTENNA_FOR_CM.agc:76
//		VPROJ	VSL2		# COMPUTE PROJECTION OF VECTOR INTO CM
// slot 37837
    37837, 59954,
// S-BAND_ANTENNA_FOR_CM.agc:77
//			HIUNITZ		# XY-PLANE, R-(R.UZ)UZ
// slot 37838
    37838, 13742,
// S-BAND_ANTENNA_FOR_CM.agc:78
//		BVSU	BOV		# CLEAR OVERFLOW INDICATOR IF SET
// slot 37839
    37839, 32842,
// S-BAND_ANTENNA_FOR_CM.agc:79
//			R
// slot 37840
    37840, 6,
// S-BAND_ANTENNA_FOR_CM.agc:80
//			COVCNV
// slot 37841
    37841, 55204,
// S-BAND_ANTENNA_FOR_CM.agc:81
//COVCNV		UNIT	BOV		# TEST OVERFLOW FOR INDICATION OF NULL
// slot 37842
    37842, 32860,
// S-BAND_ANTENNA_FOR_CM.agc:82
//			NOADJUST	# VECTOR
// slot 37843
    37843, 55230,
// S-BAND_ANTENNA_FOR_CM.agc:83
//		PUSH	DOT		# 20D
// slot 37844
    37844, 41228,
// S-BAND_ANTENNA_FOR_CM.agc:84
//# Page 935
// S-BAND_ANTENNA_FOR_CM.agc:85
//			HIUNITX		# COMPUTE YAW ANGLE = ACOS (URP.UX)
// slot 37845
    37845, 13750,
// S-BAND_ANTENNA_FOR_CM.agc:86
//		SL1	ACOS		# REVOLUTIONS SCALED B0
// slot 37846
    37846, 54996,
// S-BAND_ANTENNA_FOR_CM.agc:87
//		PDVL	DOT		# 22D YAWANG
// slot 37847
    37847, 41370,
// S-BAND_ANTENNA_FOR_CM.agc:88
//			URP
// slot 37848
    37848, 30,
// S-BAND_ANTENNA_FOR_CM.agc:89
//			HIUNITY		# COMPUTE FOLLOWING- URP.UY
// slot 37849
    37849, 13746,
// S-BAND_ANTENNA_FOR_CM.agc:90
//		SL1	BPL		# POSITIVE
// slot 37850
    37850, 42196,
// S-BAND_ANTENNA_FOR_CM.agc:91
//			NOADJUST	# YES, 0- 180 DEGREES
// slot 37851
    37851, 55230,
// S-BAND_ANTENNA_FOR_CM.agc:92
//		DLOAD	DSU		# NO, 181-360 DEGREES 20D
// slot 37852
    37852, 38346,
// S-BAND_ANTENNA_FOR_CM.agc:93
//			DPPOSMAX	# COMPUTE 2 PI MINUS YAW ANGLE
// slot 37853
    37853, 13766,
// S-BAND_ANTENNA_FOR_CM.agc:94
//		PUSH			# 22D YAWANG
// slot 37854
    37854, 65292,
// S-BAND_ANTENNA_FOR_CM.agc:95
//NOADJUST	VLOAD	DOT		# COMPUTE PITCH ANGLE
// slot 37855
    37855, 41466,
// S-BAND_ANTENNA_FOR_CM.agc:96
//			UR		# ACOS (UR.UZ) - PI/2
// slot 37856
    37856, 18,
// S-BAND_ANTENNA_FOR_CM.agc:97
//			HIUNITZ
// slot 37857
    37857, 13742,
// S-BAND_ANTENNA_FOR_CM.agc:98
//		SL1	ACOS		# REVOLUTIONS B0
// slot 37858
    37858, 54996,
// S-BAND_ANTENNA_FOR_CM.agc:99
//		DSU
// slot 37859
    37859, 65322,
// S-BAND_ANTENNA_FOR_CM.agc:100
//			HIDP1/4
// slot 37860
    37860, 13738,
// S-BAND_ANTENNA_FOR_CM.agc:101
//		STODL	RHOSB
// slot 37861
    37861, 14754,
// S-BAND_ANTENNA_FOR_CM.agc:102
//			YAWANG
// slot 37862
    37862, 42,
// S-BAND_ANTENNA_FOR_CM.agc:103
//		STORE	GAMMASB		# PATCH FOR CHECKOUT
// slot 37863
    37863, 2470,
// S-BAND_ANTENNA_FOR_CM.agc:104
//		EXIT
// slot 37864
    37864, 65532
)).

// bank 42, slots 37865-37870
function agcAotUnit2206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37867 {
        if slot <= 37865 {
// S-BAND_ANTENNA_FOR_CM.agc:105
//		CA	EXTVBACT	# IS BIT 5 STILL ON
// slot 37865
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
// S-BAND_ANTENNA_FOR_CM.agc:106
//		MASK	BIT5
// slot 37866
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
// S-BAND_ANTENNA_FOR_CM.agc:107
//		EXTEND
// slot 37867
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
// S-BAND_ANTENNA_FOR_CM.agc:108
//		BZF	ENDEXT		# NO, WE HAVE BEEN ANSWERED
// slot 37868
            if slot <> 37868 or instruction <> 7004 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7004, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37869 {
// S-BAND_ANTENNA_FOR_CM.agc:109
//		CAF	V06N51		# DISPLAY ANGLES
// slot 37869
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
// S-BAND_ANTENNA_FOR_CM.agc:110
//		TC	BANKCALL
// slot 37870
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
// S-BAND_ANTENNA_FOR_CM.agc:111
//		CADR	GOMARKFR
// slot 37871
    37871, 17152
)).

// bank 42, slots 37872-37878
function agcAotUnit2207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37874 {
        if slot <= 37872 {
// S-BAND_ANTENNA_FOR_CM.agc:112
//		TC	B5OFF		# TERMINATE
// slot 37872
            if slot <> 37872 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37873 {
// S-BAND_ANTENNA_FOR_CM.agc:113
//		TC	B5OFF
// slot 37873
                if slot <> 37873 or instruction <> 2965 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2965, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// S-BAND_ANTENNA_FOR_CM.agc:114
//		TC	ENDOFJOB	# RECYCLE
// slot 37874
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
// S-BAND_ANTENNA_FOR_CM.agc:115
//		CAF	BIT3		# IMMEDIATE RETURN
// slot 37875
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
// S-BAND_ANTENNA_FOR_CM.agc:116
//		TC	BLANKET		# BLANK R3
// slot 37876
                if slot <> 37876 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37877 {
// S-BAND_ANTENNA_FOR_CM.agc:117
//		CAF	BIT1		# DELAY MINIMUM TIME TO ALLOW DISPLAY IN
// slot 37877
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
// S-BAND_ANTENNA_FOR_CM.agc:118
//		TC	BANKCALL
// slot 37878
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
// S-BAND_ANTENNA_FOR_CM.agc:119
//		CADR	DELAYJOB
// slot 37879
    37879, 1972
)).

// bank 42, slots 37880-37880
function agcAotUnit2208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// S-BAND_ANTENNA_FOR_CM.agc:120
//		TCF	SBANDANT +2
// slot 37880
    if slot <> 37880 or instruction <> 6060 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6060, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2208] to agcAotUnit2208@.

agcAotInstallSourceRope(list(
// S-BAND_ANTENNA_FOR_CM.agc:121
//V06N51		VN	0651
// slot 37881
    37881, 1638
)).

// no code for the lines below
// S-BAND_ANTENNA_FOR_CM.agc:122
//RCM		EQUALS	2D
// S-BAND_ANTENNA_FOR_CM.agc:123
//UR		EQUALS	8D
// S-BAND_ANTENNA_FOR_CM.agc:124
//URP		EQUALS	14D
// S-BAND_ANTENNA_FOR_CM.agc:125
//YAWANG		EQUALS	20D
// S-BAND_ANTENNA_FOR_CM.agc:126
//PITCHANG	EQUALS	22D
// S-BAND_ANTENNA_FOR_CM.agc:127
//R		EQUALS	RCM
// S-BAND_ANTENNA_FOR_CM.agc:128
//		SBANK=	LOWSUPER
