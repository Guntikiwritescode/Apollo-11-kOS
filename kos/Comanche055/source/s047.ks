// PORT: Original source unit P51-P53.agc.
// PORT: Physical bank 15. Shared continuation entries, slots 15360–15360.
function agcAotUnit867 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE P51-P53.agc:2
//# Filename:     P51-P53.agc
// PORT: SOURCE P51-P53.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE P51-P53.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE P51-P53.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE P51-P53.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE P51-P53.agc:7
//# Reference:    pp. 737-784
// PORT: SOURCE P51-P53.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE P51-P53.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE P51-P53.agc:10
//# Mod history:  2009-05-12 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE P51-P53.agc:11
//#				name, and Comanche 055 page images.
// PORT: SOURCE P51-P53.agc:12
//#		2009-05-20 RSB	Corrections: SETI/PDT -> SET1/PDT,
// PORT: SOURCE P51-P53.agc:13
//#				GOTOPOOH -> GOTOPOOH, R33EXIT -> R53EXIT,
// PORT: SOURCE P51-P53.agc:14
//#				V853 -> VB53, R56A -> R56A1 (some places
// PORT: SOURCE P51-P53.agc:15
//#				only), added missing R56A1 label, added a
// PORT: SOURCE P51-P53.agc:16
//#				missing CAF in COARSTYP, corrected a SETLOC
// PORT: SOURCE P51-P53.agc:17
//#				from P50S to P50S3.
// PORT: SOURCE P51-P53.agc:18
//# 		2009-05-21 RSB	In COARFINE, a TC BANKCALL was corrected to
// PORT: SOURCE P51-P53.agc:19
//#				TC PHASCHNG.  In R53C, a CADR GOFLASHR was
// PORT: SOURCE P51-P53.agc:20
//#				corrected to CADR GOFLASH.
// PORT: SOURCE P51-P53.agc:21
//#
// PORT: SOURCE P51-P53.agc:22
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE P51-P53.agc:23
//# from scanned documents.
// PORT: SOURCE P51-P53.agc:24
//#
// PORT: SOURCE P51-P53.agc:25
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P51-P53.agc:26
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE P51-P53.agc:27
//#
// PORT: SOURCE P51-P53.agc:28
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE P51-P53.agc:29
//#
// PORT: SOURCE P51-P53.agc:30
//#       Prepared by
// PORT: SOURCE P51-P53.agc:31
//#                       Massachusetts Institute of Technology
// PORT: SOURCE P51-P53.agc:32
//#                       75 Cambridge Parkway
// PORT: SOURCE P51-P53.agc:33
//#                       Cambridge, Massachusetts
// PORT: SOURCE P51-P53.agc:34
//#
// PORT: SOURCE P51-P53.agc:35
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE P51-P53.agc:36
//#
// PORT: SOURCE P51-P53.agc:37
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE P51-P53.agc:38
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE P51-P53.agc:39
//
// PORT: SOURCE P51-P53.agc:40
//# Page 737
// PORT: SOURCE P51-P53.agc:41
//# PROGRAM NAME -- PROG52			DATE -- NOV 30, 1966
// PORT: SOURCE P51-P53.agc:42
//# MOD NO -- 2					LOG SECTION -- P51-P53
// PORT: SOURCE P51-P53.agc:43
//# MODIFICATION BY -- LONSKE			ASSEMBLY -- SUNDISK REV 30
// PORT: SOURCE P51-P53.agc:44
//#
// PORT: SOURCE P51-P53.agc:45
//# FUNCTIONAL DESCRIPTION --
// PORT: SOURCE P51-P53.agc:46
//#
// PORT: SOURCE P51-P53.agc:47
//#	ALIGNS THE IMU TO ONE OF THREE ORIENTATIONS SELECTED BY THE ASTRONAUT.  THE PRESENT IMU ORIENTATION IS KNOWN
// PORT: SOURCE P51-P53.agc:48
//#	AND IS STORED IN REFSMMAT.  THE THREE POSSIBLE ORIENTATIONS MAY BE:
// PORT: SOURCE P51-P53.agc:49
//#
// PORT: SOURCE P51-P53.agc:50
//#	(A)	PREFERRED ORIENTATION
// PORT: SOURCE P51-P53.agc:51
//#
// PORT: SOURCE P51-P53.agc:52
//#		AN OPTIMUM ORIENTATION FOR A PREVIOUSLY CALCULATED MANEUVER.  THIS ORIENTATION MUST BE CALCULATED AND
// PORT: SOURCE P51-P53.agc:53
//#		STORED BY A PREVIOUSLY SELECTED PROGRAM.
// PORT: SOURCE P51-P53.agc:54
//#
// PORT: SOURCE P51-P53.agc:55
//#	(B)	NOMINAL ORIENTATION
// PORT: SOURCE P51-P53.agc:56
//#
// PORT: SOURCE P51-P53.agc:57
//#		X   = UNIT ( Y   x Z   )
// PORT: SOURCE P51-P53.agc:58
//#		-SM          -SM   -SM
// PORT: SOURCE P51-P53.agc:59
//#
// PORT: SOURCE P51-P53.agc:60
//#		Y   = UNIT (V X R)
// PORT: SOURCE P51-P53.agc:61
//#		-SM         -   -
// PORT: SOURCE P51-P53.agc:62
//#
// PORT: SOURCE P51-P53.agc:63
//#		Z   = UNIT ( -R )
// PORT: SOURCE P51-P53.agc:64
//#		-SM           -
// PORT: SOURCE P51-P53.agc:65
//#
// PORT: SOURCE P51-P53.agc:66
//#		WHERE:
// PORT: SOURCE P51-P53.agc:67
//#
// PORT: SOURCE P51-P53.agc:68
//#		R = THE GEOMETRIC RADIUS VECTOR AT TIME T(ALIGN) SELECTED BY THE ASTRONAUT
// PORT: SOURCE P51-P53.agc:69
//#		-
// PORT: SOURCE P51-P53.agc:70
//#
// PORT: SOURCE P51-P53.agc:71
//#		V = THE INERTIAL VELOCITY VECTOR AT TIME T(ALIGN) SELECTED BY THE ASTRONAUT
// PORT: SOURCE P51-P53.agc:72
//#		-
// PORT: SOURCE P51-P53.agc:73
//#
// PORT: SOURCE P51-P53.agc:74
//#	(C)	RERSMMAT ORIENTATION
// PORT: SOURCE P51-P53.agc:75
//#
// PORT: SOURCE P51-P53.agc:76
//#		THIS SELECTION CORRECTS THE PRESENT IMU ORIENTATION.  THE PRESENT ORIENTATION DIFFERS FROM THAT TO WHICH IT
// PORT: SOURCE P51-P53.agc:77
//#		WAS LAST ALIGNED ONLY DUE TO GYRO DRIVE (I.E., NEITHER GIMBAL LOCK NOR IMU POWER INTERRUPT HAS OCCURRED
// PORT: SOURCE P51-P53.agc:78
//#		SINCE THE LAST ALIGNMENT).
// PORT: SOURCE P51-P53.agc:79
//#
// PORT: SOURCE P51-P53.agc:80
//#	AFTER A IMU ORIENTATION HAS BEEN SELECTED ROUTINE S52.2 IS OPERATED TO COMPUTE THE GIMBAL ANGLES USING THE
// PORT: SOURCE P51-P53.agc:81
//#	NEW ORIENTATION AND THE PRESENT VEHICLE ATTITUDE.  CAL52A THEN USES THESE ANGLES, STORED IN THETAD,+1,+2, TO
// PORT: SOURCE P51-P53.agc:82
//#	COARSE ALIGN THE IMU.  THE STARS SELECTION ROUTINE, R56, IS THEN OPERATED.  IF 2 STARS ARE NOT AVAILABLE AN ALARM
// PORT: SOURCE P51-P53.agc:83
//#	IS FLASHED TO NOTIFY THE ASTRONAUT.  AT THIS POINT THE ASTRONAUT WILL MANEUVER THE VEHICLE AND SELECT 2 STARS
// PORT: SOURCE P51-P53.agc:84
//# 	EITHER MANUALLY OR AUTOMATICALLY.  AFTER 2 STARS HAVE BEEN SELECTED THE IMU IS FINE ALIGNED USING ROUTINE R51.  IF
// PORT: SOURCE P51-P53.agc:85
//# 	THE RENDEZVOUS NAVIGATION PROCESS IS OPERATING (INDICATED BY RNDVZFLG) P20 IS DISPLAYED.  OTHERWISE P00 IS
// PORT: SOURCE P51-P53.agc:86
//#	REQUESTED.
// PORT: SOURCE P51-P53.agc:87
//#
// PORT: SOURCE P51-P53.agc:88
//# CALLING SEQUENCE --
// PORT: SOURCE P51-P53.agc:89
//#
// PORT: SOURCE P51-P53.agc:90
//#	THE PROGRAM IS CALLED BY THE ASTRONAUT BY DSKY ENTRY.
// PORT: SOURCE P51-P53.agc:91
//# Page 738
// PORT: SOURCE P51-P53.agc:92
//#
// PORT: SOURCE P51-P53.agc:93
//# SUBROUTINES CALLED --
// PORT: SOURCE P51-P53.agc:94
//#
// PORT: SOURCE P51-P53.agc:95
//#	1. FLAGDOWN		 7. S52.2		13. NEWMODEX
// PORT: SOURCE P51-P53.agc:96
//#	2. R02BOTH		 8. CAL53A		14. PRIOLARM
// PORT: SOURCE P51-P53.agc:97
//#	3. GOPERF4		 9. FLAGUP
// PORT: SOURCE P51-P53.agc:98
//#	4. MATMOVE		10. R56
// PORT: SOURCE P51-P53.agc:99
//#	5. GOFLASH		11. R51
// PORT: SOURCE P51-P53.agc:100
//#	6. S52.3		12. GOPERF3
// PORT: SOURCE P51-P53.agc:101
//#
// PORT: SOURCE P51-P53.agc:102
//# NORMAL EXIT MODES --
// PORT: SOURCE P51-P53.agc:103
//#
// PORT: SOURCE P51-P53.agc:104
//#	EXITS TO ENDOFJOB
// PORT: SOURCE P51-P53.agc:105
//#
// PORT: SOURCE P51-P53.agc:106
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P51-P53.agc:107
//#
// PORT: SOURCE P51-P53.agc:108
//#	NONE
// PORT: SOURCE P51-P53.agc:109
//#
// PORT: SOURCE P51-P53.agc:110
//# OUTPUT --
// PORT: SOURCE P51-P53.agc:111
//#
// PORT: SOURCE P51-P53.agc:112
//#	THE FOLLOWING MAY BE FLASHED ON THE DSKY
// PORT: SOURCE P51-P53.agc:113
//#		1. IMU ORIENTATION CODE
// PORT: SOURCE P51-P53.agc:114
//#		2. ALARM CODE 215 -- PREFERRED IMU ORIENTATION NOT SPECIFIED
// PORT: SOURCE P51-P53.agc:115
//#		3. TIME OF NEXT IGNITION
// PORT: SOURCE P51-P53.agc:116
//#		4. GIMBAL ANGLES
// PORT: SOURCE P51-P53.agc:117
//#		5. ALARM CODE 405 -- TWO STARS NOT AVAILABLE
// PORT: SOURCE P51-P53.agc:118
//#		6. PLEASE PERFORM P00
// PORT: SOURCE P51-P53.agc:119
//#	THE MODE DISPLAY MAY BE CHANGED TO 20
// PORT: SOURCE P51-P53.agc:120
//#
// PORT: SOURCE P51-P53.agc:121
//# ERASABLE INITIALIZATION REQUIRED --
// PORT: SOURCE P51-P53.agc:122
//#
// PORT: SOURCE P51-P53.agc:123
//#	PFRATFLG SHOULD BE SET IF A PREFERRED ORIENTATION HAS BEEN COMPUTED.  IF IT HAS BEEN COMPUTED IT IS STORED IN
// PORT: SOURCE P51-P53.agc:124
//#	XSMD, YSMD, ZSMD.
// PORT: SOURCE P51-P53.agc:125
//#
// PORT: SOURCE P51-P53.agc:126
//#	RNDVZFLG INDICATES WHETHER THE RENDEZVOUS NAVIGATION PROCESS IS OPERATING.
// PORT: SOURCE P51-P53.agc:127
//#
// PORT: SOURCE P51-P53.agc:128
//# DEBRIS --
// PORT: SOURCE P51-P53.agc:129
//#
// PORT: SOURCE P51-P53.agc:130
//#	WORK AREA
// PORT: SOURCE P51-P53.agc:131
//
// PORT: SOURCE P51-P53.agc:132
//P54		=	PROG52
// PORT: SOURCE P51-P53.agc:133
//		BANK	33
// PORT: SOURCE P51-P53.agc:134
//		SETLOC	P50S
// PORT: SOURCE P51-P53.agc:135
//		BANK
// PORT: SOURCE P51-P53.agc:136
//
// PORT: SOURCE P51-P53.agc:137
//		SBANK=	LOWSUPER
// PORT: SOURCE P51-P53.agc:138
//		EBANK=	SAC
// PORT: SOURCE P51-P53.agc:139
//		COUNT	15/P52
// PORT: SOURCE P51-P53.agc:140
//
// PORT: SOURCE P51-P53.agc:141
//PROG52		TC	PHASCHNG
// PORT: Fixed ROM slots 15360.
    if slot <> 15360 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[867] to agcAotUnit867@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:142
//		OCT	00254
// PORT: Fixed ROM slots 15361.
    15361, 344
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15362–15362.
function agcAotUnit868 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:143
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 15362.
    if slot <> 15362 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[868] to agcAotUnit868@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:144
//		ADRES	UPDATFLG	# BIT 7 FLAG 1
// PORT: Fixed ROM slots 15363.
    15363, 46
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15364–15364.
function agcAotUnit869 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:145
//# Page 739
// PORT: SOURCE P51-P53.agc:146
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 15364.
    if slot <> 15364 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[869] to agcAotUnit869@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:147
//		ADRES	TRACKFLG	# BIT 5 FLAG 1
// PORT: Fixed ROM slots 15365.
    15365, 50
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15366–15366.
function agcAotUnit870 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:148
//		TC	BANKCALL
// PORT: Fixed ROM slots 15366.
    if slot <> 15366 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[870] to agcAotUnit870@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:149
//		CADR	R02BOTH		# IMU STATUS CHECK
// PORT: Fixed ROM slots 15367.
    15367, 16214
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15368–15377.
function agcAotUnit871 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15372 {
        if slot <= 15369 {
            if slot <= 15368 {
// PORT: SOURCE P51-P53.agc:150
//		CAF	BIT4
// PORT: Fixed ROM slots 15368.
                if slot <> 15368 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:151
//		MASK	STATE +2	# IS PFRATFLG SET?
// PORT: Fixed ROM slots 15369.
                if slot <> 15369 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15370 {
// PORT: SOURCE P51-P53.agc:152
//		CCS	A
// PORT: Fixed ROM slots 15370.
                if slot <> 15370 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15371 {
// PORT: SOURCE P51-P53.agc:153
//		TC	P52A		# YES
// PORT: Fixed ROM slots 15371.
                    if slot <> 15371 or instruction <> 1038 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1038, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:154
//		CAF	BIT2		# NO
// PORT: Fixed ROM slots 15372.
                    if slot <> 15372 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 15374 {
            if slot <= 15373 {
// PORT: SOURCE P51-P53.agc:155
//		TC	P52A +1
// PORT: Fixed ROM slots 15373.
                if slot <> 15373 or instruction <> 1039 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1039, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:156
//P52A		CAF	BIT1
// PORT: Fixed ROM slots 15374.
                if slot <> 15374 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15375 {
// PORT: SOURCE P51-P53.agc:157
//		TS	OPTION2
// PORT: Fixed ROM slots 15375.
                if slot <> 15375 or instruction <> 23130 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23130, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15376 {
// PORT: SOURCE P51-P53.agc:158
//P52B		CAF	BIT1
// PORT: Fixed ROM slots 15376.
                    if slot <> 15376 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:159
//		TC	BANKCALL	# FLASH OPTION CODE AND ORIENTATION CODE
// PORT: Fixed ROM slots 15377.
                    if slot <> 15377 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[871] to agcAotUnit871@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:160
//		CADR	GOPERF4R
// PORT: Fixed ROM slots 15378.
    15378, 17594
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15379–15382.
function agcAotUnit872 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15380 {
        if slot <= 15379 {
// PORT: SOURCE P51-P53.agc:161
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15379.
            if slot <> 15379 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:162
//		TC	+5
// PORT: Fixed ROM slots 15380.
            if slot <> 15380 or instruction <> 1049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15381 {
// PORT: SOURCE P51-P53.agc:163
//		TC	P52B		# NEW CODE -- NEW ORIENTATION CODE INPUT
// PORT: Fixed ROM slots 15381.
            if slot <> 15381 or instruction <> 1040 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1040, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:164
//		TC	PHASCHNG
// PORT: Fixed ROM slots 15382.
            if slot <> 15382 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[872] to agcAotUnit872@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:165
//		OCT	00014
// PORT: Fixed ROM slots 15383.
    15383, 24
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15384–15387.
function agcAotUnit873 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15385 {
        if slot <= 15384 {
// PORT: SOURCE P51-P53.agc:166
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 15384.
            if slot <> 15384 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:167
//		CA	OPTION2
// PORT: Fixed ROM slots 15385.
            if slot <> 15385 or instruction <> 12890 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 602).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15386 {
// PORT: SOURCE P51-P53.agc:168
//		MASK	THREE
// PORT: Fixed ROM slots 15386.
            if slot <> 15386 or instruction <> 31884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                if fixedOperand = 3 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:169
//		INDEX	A
// PORT: Fixed ROM slots 15387.
            if slot <> 15387 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[873] to agcAotUnit873@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:170
//		TC	+1
// PORT: Fixed ROM slots 15388.
    15388, 2106
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15389–15397.
function agcAotUnit874 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15392 {
        if slot <= 15390 {
            if slot <= 15389 {
// PORT: SOURCE P51-P53.agc:171
//		TC	P52T		# L.S.
// PORT: Fixed ROM slots 15389.
                if slot <> 15389 or instruction <> 1057 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1057, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:172
//		TC	P52J		# PREF
// PORT: Fixed ROM slots 15390.
                if slot <> 15390 or instruction <> 1096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1096, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15391 {
// PORT: SOURCE P51-P53.agc:173
//		TC	P52T		# NORM
// PORT: Fixed ROM slots 15391.
                if slot <> 15391 or instruction <> 1057 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1057, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:174
//		TCF	P52C		# REF
// PORT: Fixed ROM slots 15392.
                if slot <> 15392 or instruction <> 5200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5200, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15394 {
            if slot <= 15393 {
// PORT: SOURCE P51-P53.agc:175
//P52T		EXTEND
// PORT: Fixed ROM slots 15393.
                if slot <> 15393 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:176
//		DCA	NEG0
// PORT: Fixed ROM slots 15394.
                if slot <> 15394 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15395 {
// PORT: SOURCE P51-P53.agc:177
//		DXCH	DSPTEM1
// PORT: Fixed ROM slots 15395.
                if slot <> 15395 or instruction <> 22054 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15396 {
// PORT: SOURCE P51-P53.agc:178
//		CAF	V06N34
// PORT: Fixed ROM slots 15396.
                    if slot <> 15396 or instruction <> 13423 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1135), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:179
//		TC	BANKCALL
// PORT: Fixed ROM slots 15397.
                    if slot <> 15397 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[874] to agcAotUnit874@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:180
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15398.
    15398, 17312
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15399–15414.
function agcAotUnit875 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15406 {
        if slot <= 15402 {
            if slot <= 15400 {
                if slot <= 15399 {
// PORT: SOURCE P51-P53.agc:181
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15399.
                    if slot <> 15399 or instruction <> 2118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:182
//		TC	+2
// PORT: Fixed ROM slots 15400.
                    if slot <> 15400 or instruction <> 1066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1066, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15401 {
// PORT: SOURCE P51-P53.agc:183
//		TC	-5
// PORT: Fixed ROM slots 15401.
                    if slot <> 15401 or instruction <> 1060 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1060, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:184
//		EXTEND
// PORT: Fixed ROM slots 15402.
                    if slot <> 15402 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15404 {
                if slot <= 15403 {
// PORT: SOURCE P51-P53.agc:185
//		DCA	DSPTEM1
// PORT: Fixed ROM slots 15403.
                    if slot <> 15403 or instruction <> 12838 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 550, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:186
//		EXTEND
// PORT: Fixed ROM slots 15404.
                    if slot <> 15404 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15405 {
// PORT: SOURCE P51-P53.agc:187
//		BZF	+2
// PORT: Fixed ROM slots 15405.
                    if slot <> 15405 or instruction <> 5167 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5167, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:188
//		TCF	+4
// PORT: Fixed ROM slots 15406.
                    if slot <> 15406 or instruction <> 5170 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5170, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15410 {
            if slot <= 15408 {
                if slot <= 15407 {
// PORT: SOURCE P51-P53.agc:189
//
// PORT: SOURCE P51-P53.agc:190
//		EXTEND
// PORT: Fixed ROM slots 15407.
                    if slot <> 15407 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:191
//		DCA	TIME2
// PORT: Fixed ROM slots 15408.
                    if slot <> 15408 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15409 {
// PORT: SOURCE P51-P53.agc:192
//		DXCH	DSPTEM1
// PORT: Fixed ROM slots 15409.
                    if slot <> 15409 or instruction <> 22054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:193
//		CA	OPTION2
// PORT: Fixed ROM slots 15410.
                    if slot <> 15410 or instruction <> 12890 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 602).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15412 {
                if slot <= 15411 {
// PORT: SOURCE P51-P53.agc:194
//		MASK	BIT2
// PORT: Fixed ROM slots 15411.
                    if slot <> 15411 or instruction <> 31246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:195
//		CCS	A
// PORT: Fixed ROM slots 15412.
                    if slot <> 15412 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15413 {
// PORT: SOURCE P51-P53.agc:196
//# Page 740
// PORT: SOURCE P51-P53.agc:197
//		TCF	+6		# NOM
// PORT: Fixed ROM slots 15413.
                    if slot <> 15413 or instruction <> 5179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5179, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:198
//		TC	INTPRET		# LS
// PORT: Fixed ROM slots 15414.
                    if slot <> 15414 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[875] to agcAotUnit875@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:199
//		CALL
// PORT: Fixed ROM slots 15415.
    15415, 65320,
// PORT: SOURCE P51-P53.agc:200
//			P52LS
// PORT: Fixed ROM slots 15416.
    15416, 29362,
// PORT: SOURCE P51-P53.agc:201
//		GOTO
// PORT: Fixed ROM slots 15417.
    15417, 65360,
// PORT: SOURCE P51-P53.agc:202
//			P52D
// PORT: Fixed ROM slots 15418.
    15418, 26752
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15419–15419.
function agcAotUnit876 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:203
//		TC	INTPRET
// PORT: Fixed ROM slots 15419.
    if slot <> 15419 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[876] to agcAotUnit876@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:204
//		DLOAD
// PORT: Fixed ROM slots 15420.
    15420, 65482,
// PORT: SOURCE P51-P53.agc:205
//			DSPTEM1
// PORT: Fixed ROM slots 15421.
    15421, 1100,
// PORT: SOURCE P51-P53.agc:206
//		CALL			# COMPUTE NOMINAL IMU
// PORT: Fixed ROM slots 15422.
    15422, 65320,
// PORT: SOURCE P51-P53.agc:207
//			S52.3		#	ORIENTATION
// PORT: Fixed ROM slots 15423.
    15423, 29538,
// PORT: SOURCE P51-P53.agc:208
//P52D		CALL			# READ VEHICLE ATTITUDE AND
// PORT: Fixed ROM slots 15424.
    15424, 65320,
// PORT: SOURCE P51-P53.agc:209
//			S52.2		#	COMPUTE GIMBAL ANGLES
// PORT: Fixed ROM slots 15425.
    15425, 18866,
// PORT: SOURCE P51-P53.agc:210
//		EXIT
// PORT: Fixed ROM slots 15426.
    15426, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15427–15428.
function agcAotUnit877 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15427 {
// PORT: SOURCE P51-P53.agc:211
//		CAF	VB06N22
// PORT: Fixed ROM slots 15427.
        if slot <> 15427 or instruction <> 13424 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1136), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:212
//		TC	BANKCALL	# DISPLAY GIMBAL ANGLES
// PORT: Fixed ROM slots 15428.
        if slot <> 15428 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[877] to agcAotUnit877@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:213
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15429.
    15429, 17312
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15430–15432.
function agcAotUnit878 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15430 {
// PORT: SOURCE P51-P53.agc:214
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15430.
        if slot <> 15430 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15431 {
// PORT: SOURCE P51-P53.agc:215
//		TC	COARSTYP
// PORT: Fixed ROM slots 15431.
            if slot <> 15431 or instruction <> 1137 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1137, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:216
//P52J		TC	INTPRET		# RECYCLE: VEHICLE HAS BEEN MANEUVERED
// PORT: Fixed ROM slots 15432.
            if slot <> 15432 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[878] to agcAotUnit878@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:217
//		GOTO
// PORT: Fixed ROM slots 15433.
    15433, 65360,
// PORT: SOURCE P51-P53.agc:218
//			P52D
// PORT: Fixed ROM slots 15434.
    15434, 26752
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15435–15435.
function agcAotUnit879 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:219
//		TC	INTPRET
// PORT: Fixed ROM slots 15435.
    if slot <> 15435 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[879] to agcAotUnit879@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:220
//		CALL			# DO COARSE ALIGN
// PORT: Fixed ROM slots 15436.
    15436, 65320,
// PORT: SOURCE P51-P53.agc:221
//			CAL53A		#	ROUTINE
// PORT: Fixed ROM slots 15437.
    15437, 25584,
// PORT: SOURCE P51-P53.agc:222
//CAL53RET	SET	EXIT
// PORT: Fixed ROM slots 15438.
    15438, 65048,
// PORT: SOURCE P51-P53.agc:223
//			REFSMFLG
// PORT: Fixed ROM slots 15439.
    15439, 1636
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15440–15440.
function agcAotUnit880 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:224
//P52C		TC	PHASCHNG
// PORT: Fixed ROM slots 15440.
    if slot <> 15440 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[880] to agcAotUnit880@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:225
//		OCT	04024
// PORT: Fixed ROM slots 15441.
    15441, 4136
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15442–15443.
function agcAotUnit881 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15442 {
// PORT: SOURCE P51-P53.agc:226
//		CAF	ALRM15
// PORT: Fixed ROM slots 15442.
        if slot <> 15442 or instruction <> 14869 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:227
//		TC	BANKCALL
// PORT: Fixed ROM slots 15443.
        if slot <> 15443 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[881] to agcAotUnit881@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:228
//		CADR	GOPERF1
// PORT: Fixed ROM slots 15444.
    15444, 17482
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15445–15448.
function agcAotUnit882 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15446 {
        if slot <= 15445 {
// PORT: SOURCE P51-P53.agc:229
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15445.
            if slot <> 15445 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:230
//		TC	+2		# V33
// PORT: Fixed ROM slots 15446.
            if slot <> 15446 or instruction <> 1112 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1112, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15447 {
// PORT: SOURCE P51-P53.agc:231
//		TC	P52F		# E
// PORT: Fixed ROM slots 15447.
            if slot <> 15447 or instruction <> 1122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:232
//		TC	INTPRET
// PORT: Fixed ROM slots 15448.
            if slot <> 15448 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[882] to agcAotUnit882@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:233
//		RTB	DAD
// PORT: Fixed ROM slots 15449.
    15449, 36152,
// PORT: SOURCE P51-P53.agc:234
//			LOADTIME
// PORT: Fixed ROM slots 15450.
    15450, 38544,
// PORT: SOURCE P51-P53.agc:235
//			TSIGHT1
// PORT: Fixed ROM slots 15451.
    15451, 26984,
// PORT: SOURCE P51-P53.agc:236
//		CALL
// PORT: Fixed ROM slots 15452.
    15452, 65320,
// PORT: SOURCE P51-P53.agc:237
//			LOCSAM
// PORT: Fixed ROM slots 15453.
    15453, 24874,
// PORT: SOURCE P51-P53.agc:238
//		EXIT
// PORT: Fixed ROM slots 15454.
    15454, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15455–15455.
function agcAotUnit883 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:239
//P52E		TC	BANKCALL	# DO STAR SELECTION
// PORT: Fixed ROM slots 15455.
    if slot <> 15455 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[883] to agcAotUnit883@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:240
//		CADR	PICAPAR
// PORT: Fixed ROM slots 15456.
    15456, 25014
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15457–15458.
function agcAotUnit884 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15457 {
// PORT: SOURCE P51-P53.agc:241
//		TC	P52I		# 2 STARS NOT AVAILABLE
// PORT: Fixed ROM slots 15457.
        if slot <> 15457 or instruction <> 1127 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1127, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:242
//P52F		TC	INTPRET		# 2 STARS AVAILABLE
// PORT: Fixed ROM slots 15458.
        if slot <> 15458 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[884] to agcAotUnit884@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:243
//		CALL
// PORT: Fixed ROM slots 15459.
    15459, 65320,
// PORT: SOURCE P51-P53.agc:244
//			R51
// PORT: Fixed ROM slots 15460.
    15460, 25268,
// PORT: SOURCE P51-P53.agc:245
//ENDP50S		EXIT
// PORT: Fixed ROM slots 15461.
    15461, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15462–15463.
function agcAotUnit885 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15462 {
// PORT: SOURCE P51-P53.agc:246
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15462.
        if slot <> 15462 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:247
//# Page 741
// PORT: SOURCE P51-P53.agc:248
//P52I		TC	ALARM
// PORT: Fixed ROM slots 15463.
        if slot <> 15463 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[885] to agcAotUnit885@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:249
//		OCT 405
// PORT: Fixed ROM slots 15464.
    15464, 522
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15465–15466.
function agcAotUnit886 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15465 {
// PORT: SOURCE P51-P53.agc:250
//		CAF	V05N09
// PORT: Fixed ROM slots 15465.
        if slot <> 15465 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:251
//		TC	BANKCALL
// PORT: Fixed ROM slots 15466.
        if slot <> 15466 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[886] to agcAotUnit886@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:252
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15467.
    15467, 17312
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15468–15470.
function agcAotUnit887 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15468 {
// PORT: SOURCE P51-P53.agc:253
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15468.
        if slot <> 15468 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15469 {
// PORT: SOURCE P51-P53.agc:254
//		TC	P52F		# PROCEED:  DO FINE ALIGN-R51
// PORT: Fixed ROM slots 15469.
            if slot <> 15469 or instruction <> 1122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:255
//		TC	P52C		# RECYCLE:  VEHICLE HAS BEEN MANEUVERED
// PORT: Fixed ROM slots 15470.
            if slot <> 15470 or instruction <> 1104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1104, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[887] to agcAotUnit887@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:256
//V06N34		VN	0634
// PORT: Fixed ROM slots 15471.
    15471, 1604,
// PORT: SOURCE P51-P53.agc:257
//VB06N22		VN	00622
// PORT: Fixed ROM slots 15472.
    15472, 1580
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15473–15474.
function agcAotUnit888 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15473 {
// PORT: SOURCE P51-P53.agc:258
//COARSTYP	CAF	OCT13
// PORT: Fixed ROM slots 15473.
        if slot <> 15473 or instruction <> 14868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2580), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:259
//		TC	BANKCALL
// PORT: Fixed ROM slots 15474.
        if slot <> 15474 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[888] to agcAotUnit888@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:260
//		CADR	GOPERF1
// PORT: Fixed ROM slots 15475.
    15475, 17482
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15476–15478.
function agcAotUnit889 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15476 {
// PORT: SOURCE P51-P53.agc:261
//		TCF	GOTOPOOH	# V34
// PORT: Fixed ROM slots 15476.
        if slot <> 15476 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15477 {
// PORT: SOURCE P51-P53.agc:262
//		TCF	P52J	+3	#	NORMAL
// PORT: Fixed ROM slots 15477.
            if slot <> 15477 or instruction <> 5195 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5195, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:263
//		TC	INTPRET		# GYRO COARSE
// PORT: Fixed ROM slots 15478.
            if slot <> 15478 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[889] to agcAotUnit889@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:264
//GYCRS		VLOAD	MXV
// PORT: Fixed ROM slots 15479.
    15479, 53754,
// PORT: SOURCE P51-P53.agc:265
//			XSMD
// PORT: Fixed ROM slots 15480.
    15480, 398,
// PORT: SOURCE P51-P53.agc:266
//			REFSMMAT
// PORT: Fixed ROM slots 15481.
    15481, 1980,
// PORT: SOURCE P51-P53.agc:267
//		UNIT
// PORT: Fixed ROM slots 15482.
    15482, 65372,
// PORT: SOURCE P51-P53.agc:268
//		STOVL	XDC
// PORT: Fixed ROM slots 15483.
    15483, 23448,
// PORT: SOURCE P51-P53.agc:269
//			YSMD
// PORT: Fixed ROM slots 15484.
    15484, 410,
// PORT: SOURCE P51-P53.agc:270
//		MXV	UNIT
// PORT: Fixed ROM slots 15485.
    15485, 44706,
// PORT: SOURCE P51-P53.agc:271
//			REFSMMAT
// PORT: Fixed ROM slots 15486.
    15486, 1980,
// PORT: SOURCE P51-P53.agc:272
//		STOVL	YDC
// PORT: Fixed ROM slots 15487.
    15487, 23460,
// PORT: SOURCE P51-P53.agc:273
//			ZSMD
// PORT: Fixed ROM slots 15488.
    15488, 422,
// PORT: SOURCE P51-P53.agc:274
//		MXV	UNIT
// PORT: Fixed ROM slots 15489.
    15489, 44706,
// PORT: SOURCE P51-P53.agc:275
//			REFSMMAT
// PORT: Fixed ROM slots 15490.
    15490, 1980,
// PORT: SOURCE P51-P53.agc:276
//		STCALL	ZDC
// PORT: Fixed ROM slots 15491.
    15491, 31664,
// PORT: SOURCE P51-P53.agc:277
//			CALCGTA
// PORT: Fixed ROM slots 15492.
    15492, 40202,
// PORT: SOURCE P51-P53.agc:278
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 15493.
    15493, 35864,
// PORT: SOURCE P51-P53.agc:279
//			DRIFTFLG
// PORT: Fixed ROM slots 15494.
    15494, 1376,
// PORT: SOURCE P51-P53.agc:280
//			REFSMFLG
// PORT: Fixed ROM slots 15495.
    15495, 1892,
// PORT: SOURCE P51-P53.agc:281
//		EXIT
// PORT: Fixed ROM slots 15496.
    15496, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15497–15498.
function agcAotUnit890 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15497 {
// PORT: SOURCE P51-P53.agc:282
//		CAF	V16N20
// PORT: Fixed ROM slots 15497.
        if slot <> 15497 or instruction <> 13476 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1188), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:283
//		TC	BANKCALL
// PORT: Fixed ROM slots 15498.
        if slot <> 15498 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[890] to agcAotUnit890@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:284
//		CADR	GODSPR
// PORT: Fixed ROM slots 15499.
    15499, 17276
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15500–15501.
function agcAotUnit891 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15500 {
// PORT: SOURCE P51-P53.agc:285
//		CA	R55CDR
// PORT: Fixed ROM slots 15500.
        if slot <> 15500 or instruction <> 13523 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1235), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:286
//		TC	BANKCALL
// PORT: Fixed ROM slots 15501.
        if slot <> 15501 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[891] to agcAotUnit891@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:287
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 15502.
    15502, 15628
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15503–15503.
function agcAotUnit892 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:288
//		TC	BANKCALL
// PORT: Fixed ROM slots 15503.
    if slot <> 15503 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[892] to agcAotUnit892@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:289
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 15504.
    15504, 16126
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15505–15506.
function agcAotUnit893 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15505 {
// PORT: SOURCE P51-P53.agc:290
//		TC	CURTAINS
// PORT: Fixed ROM slots 15505.
        if slot <> 15505 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:291
//		TC	PHASCHNG
// PORT: Fixed ROM slots 15506.
        if slot <> 15506 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[893] to agcAotUnit893@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:292
//		OCT	04024
// PORT: Fixed ROM slots 15507.
    15507, 4136
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15508–15508.
function agcAotUnit894 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:293
//		TC	INTPRET
// PORT: Fixed ROM slots 15508.
    if slot <> 15508 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[894] to agcAotUnit894@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:294
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 15509.
    15509, 62688,
// PORT: SOURCE P51-P53.agc:295
//			XSMD
// PORT: Fixed ROM slots 15510.
    15510, 396,
// PORT: SOURCE P51-P53.agc:296
//			REFSMMAT
// PORT: Fixed ROM slots 15511.
    15511, 1978,
// PORT: SOURCE P51-P53.agc:297
//		CALL
// PORT: Fixed ROM slots 15512.
    15512, 65320,
// PORT: SOURCE P51-P53.agc:298
//# Page 742
// PORT: SOURCE P51-P53.agc:299
//			MATMOVE
// PORT: Fixed ROM slots 15513.
    15513, 25686,
// PORT: SOURCE P51-P53.agc:300
//		CLEAR	SET
// PORT: Fixed ROM slots 15514.
    15514, 35864,
// PORT: SOURCE P51-P53.agc:301
//			PFRATFLG
// PORT: Fixed ROM slots 15515.
    15515, 1398,
// PORT: SOURCE P51-P53.agc:302
//			REFSMFLG
// PORT: Fixed ROM slots 15516.
    15516, 1636,
// PORT: SOURCE P51-P53.agc:303
//		RTB	VLOAD
// PORT: Fixed ROM slots 15517.
    15517, 64824,
// PORT: SOURCE P51-P53.agc:304
//			SET1/PDT
// PORT: Fixed ROM slots 15518.
    15518, 25978,
// PORT: SOURCE P51-P53.agc:305
//			ZEROVEC
// PORT: Fixed ROM slots 15519.
    15519, 9964,
// PORT: SOURCE P51-P53.agc:306
//		STORE	GCOMP
// PORT: Fixed ROM slots 15520.
    15520, 1652,
// PORT: SOURCE P51-P53.agc:307
//		SET	GOTO
// PORT: Fixed ROM slots 15521.
    15521, 43032,
// PORT: SOURCE P51-P53.agc:308
//			DRIFTFLG
// PORT: Fixed ROM slots 15522.
    15522, 1120,
// PORT: SOURCE P51-P53.agc:309
//			R51K
// PORT: Fixed ROM slots 15523.
    15523, 25434,
// PORT: SOURCE P51-P53.agc:310
//V16N20		VN	1620
// PORT: Fixed ROM slots 15524.
    15524, 4136,
// PORT: SOURCE P51-P53.agc:311
//ALRM15		EQUALS	OCT15
// PORT: SOURCE P51-P53.agc:312
//		SETLOC	P50S2
// PORT: SOURCE P51-P53.agc:313
//		BANK
// PORT: SOURCE P51-P53.agc:314
//V06N89*		VN	0689
// PORT: Fixed ROM slots 16728.
    16728, 1714,
// PORT: SOURCE P51-P53.agc:315
//
// PORT: SOURCE P51-P53.agc:316
//# NAME -- P52LS
// PORT: SOURCE P51-P53.agc:317
//#
// PORT: SOURCE P51-P53.agc:318
//# FUNCTION -- TO DISPLAY THE LANDING SITE LATITUDE,
// PORT: SOURCE P51-P53.agc:319
//# LONGITUDE AND ALTITUDE.  TO ACCEPT NEW DATA VIA
// PORT: SOURCE P51-P53.agc:320
//# THE KEYBOARD.  TO COMPUTE THE LANDING SITE
// PORT: SOURCE P51-P53.agc:321
//# ORIENTATION FOR P52 OR P54
// PORT: SOURCE P51-P53.agc:322
//#
// PORT: SOURCE P51-P53.agc:323
//# LET:
// PORT: SOURCE P51-P53.agc:324
//#	RLS  = LANDING SITE VECTOR IN REF COORDINATES
// PORT: SOURCE P51-P53.agc:325
//#	R    = CSM POSITION VECTOR IN REF COORDINATES
// PORT: SOURCE P51-P53.agc:326
//#	V    = CSM VELOCITY VECTOR IN REF COORDINATES
// PORT: SOURCE P51-P53.agc:327
//# THEN THE LANDING SITE ORIENTATION IS:
// PORT: SOURCE P51-P53.agc:328
//#	XSMD = UNIT(RLS)
// PORT: SOURCE P51-P53.agc:329
//#	YSMD = UNIT(ZSMD*XSMD)
// PORT: SOURCE P51-P53.agc:330
//#	ZSMD = UNIT((R*V)*RLS)
// PORT: SOURCE P51-P53.agc:331
//#
// PORT: SOURCE P51-P53.agc:332
//# CALL:		CALL
// PORT: SOURCE P51-P53.agc:333
//#			P52LS
// PORT: SOURCE P51-P53.agc:334
//#
// PORT: SOURCE P51-P53.agc:335
//# INPUTS:	DSPTEM1 = TIME OF ALIGNMENT
// PORT: SOURCE P51-P53.agc:336
//#		RLS = LANDING SITE VECTOR IN MOON FIXED COORDINATES
// PORT: SOURCE P51-P53.agc:337
//#
// PORT: SOURCE P51-P53.agc:338
//# OUTPUTS:	XSMD, YSMD, ZSMD
// PORT: SOURCE P51-P53.agc:339
//#
// PORT: SOURCE P51-P53.agc:340
//# SUBROUTINES:	RP-TO-R, LAT-LONG, LLASRD, LLASRDA, CSMPREC
// PORT: SOURCE P51-P53.agc:341
//#
// PORT: SOURCE P51-P53.agc:342
//# DEBRIS:	VAC, SEE SUBROUTINES
// PORT: SOURCE P51-P53.agc:343
//
// PORT: SOURCE P51-P53.agc:344
//P52LS		STQ	SET
// PORT: Fixed ROM slots 16729.
    16729, 35872,
// PORT: SOURCE P51-P53.agc:345
//			QMAJ
// PORT: Fixed ROM slots 16730.
    16730, 384,
// PORT: SOURCE P51-P53.agc:346
//			LUNAFLAG
// PORT: Fixed ROM slots 16731.
    16731, 1638,
// PORT: SOURCE P51-P53.agc:347
//		DLOAD
// PORT: Fixed ROM slots 16732.
    16732, 65482,
// PORT: SOURCE P51-P53.agc:348
//			DSPTEM1
// PORT: Fixed ROM slots 16733.
    16733, 1100,
// PORT: SOURCE P51-P53.agc:349
//		STORE	TSIGHT
// PORT: Fixed ROM slots 16734.
    16734, 2830,
// PORT: SOURCE P51-P53.agc:350
//		VLOAD	SET
// PORT: Fixed ROM slots 16735.
    16735, 36090,
// PORT: SOURCE P51-P53.agc:351
//			RLS
// PORT: Fixed ROM slots 16736.
    16736, 2092,
// PORT: SOURCE P51-P53.agc:352
//			ERADFLAG
// PORT: Fixed ROM slots 16737.
    16737, 612,
// PORT: SOURCE P51-P53.agc:353
//		STODL	0D
// PORT: Fixed ROM slots 16738.
    16738, 12290,
// PORT: SOURCE P51-P53.agc:354
//			TSIGHT
// PORT: Fixed ROM slots 16739.
    16739, 2830,
// PORT: SOURCE P51-P53.agc:355
//		STCALL	6D
// PORT: Fixed ROM slots 16740.
    16740, 28686,
// PORT: SOURCE P51-P53.agc:356
//# Page 743
// PORT: SOURCE P51-P53.agc:357
//			RP-TO-R
// PORT: Fixed ROM slots 16741.
    16741, 46536,
// PORT: SOURCE P51-P53.agc:358
//		VSR2
// PORT: Fixed ROM slots 16742.
    16742, 65476,
// PORT: SOURCE P51-P53.agc:359
//		STODL	ALPHAV
// PORT: Fixed ROM slots 16743.
    16743, 14548,
// PORT: SOURCE P51-P53.agc:360
//			TSIGHT
// PORT: Fixed ROM slots 16744.
    16744, 2830,
// PORT: SOURCE P51-P53.agc:361
//		CALL
// PORT: Fixed ROM slots 16745.
    16745, 65320,
// PORT: SOURCE P51-P53.agc:362
//			LAT-LONG
// PORT: Fixed ROM slots 16746.
    16746, 23024,
// PORT: SOURCE P51-P53.agc:363
//		CALL
// PORT: Fixed ROM slots 16747.
    16747, 65320,
// PORT: SOURCE P51-P53.agc:364
//			LLASRD
// PORT: Fixed ROM slots 16748.
    16748, 51690,
// PORT: SOURCE P51-P53.agc:365
//		EXIT
// PORT: Fixed ROM slots 16749.
    16749, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16750–16751.
function agcAotUnit962 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16750 {
// PORT: SOURCE P51-P53.agc:366
//LSDISP		CAF	V06N89*
// PORT: Fixed ROM slots 16750.
        if slot <> 16750 or instruction <> 13656 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1368), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:367
//		TC	BANKCALL
// PORT: Fixed ROM slots 16751.
        if slot <> 16751 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[962] to agcAotUnit962@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:368
//		CADR	GOFLASH
// PORT: Fixed ROM slots 16752.
    16752, 17312
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16753–16756.
function agcAotUnit963 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16754 {
        if slot <= 16753 {
// PORT: SOURCE P51-P53.agc:369
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 16753.
            if slot <> 16753 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:370
//		TC	+2
// PORT: Fixed ROM slots 16754.
            if slot <> 16754 or instruction <> 1396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1396, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16755 {
// PORT: SOURCE P51-P53.agc:371
//		TC	LSDISP
// PORT: Fixed ROM slots 16755.
            if slot <> 16755 or instruction <> 1390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:372
//		TC	INTPRET
// PORT: Fixed ROM slots 16756.
            if slot <> 16756 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[963] to agcAotUnit963@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:373
//		CALL
// PORT: Fixed ROM slots 16757.
    16757, 65320,
// PORT: SOURCE P51-P53.agc:374
//			LLASRDA
// PORT: Fixed ROM slots 16758.
    16758, 51704,
// PORT: SOURCE P51-P53.agc:375
//		DLOAD	CALL
// PORT: Fixed ROM slots 16759.
    16759, 38090,
// PORT: SOURCE P51-P53.agc:376
//			TSIGHT
// PORT: Fixed ROM slots 16760.
    16760, 2830,
// PORT: SOURCE P51-P53.agc:377
//			LALOTORV
// PORT: Fixed ROM slots 16761.
    16761, 23106,
// PORT: SOURCE P51-P53.agc:378
//		VLOAD	UNIT
// PORT: Fixed ROM slots 16762.
    16762, 44794,
// PORT: SOURCE P51-P53.agc:379
//			ALPHAV
// PORT: Fixed ROM slots 16763.
    16763, 2260,
// PORT: SOURCE P51-P53.agc:380
//		STODL	XSMD
// PORT: Fixed ROM slots 16764.
    16764, 12686,
// PORT: SOURCE P51-P53.agc:381
//			TSIGHT
// PORT: Fixed ROM slots 16765.
    16765, 2830,
// PORT: SOURCE P51-P53.agc:382
//		STCALL	TDEC1
// PORT: Fixed ROM slots 16766.
    16766, 28738,
// PORT: SOURCE P51-P53.agc:383
//			CSMPREC
// PORT: Fixed ROM slots 16767.
    16767, 23666,
// PORT: SOURCE P51-P53.agc:384
//		VLOAD	VXV
// PORT: Fixed ROM slots 16768.
    16768, 40442,
// PORT: SOURCE P51-P53.agc:385
//			RATT
// PORT: Fixed ROM slots 16769.
    16769, 2,
// PORT: SOURCE P51-P53.agc:386
//			VATT
// PORT: Fixed ROM slots 16770.
    16770, 14,
// PORT: SOURCE P51-P53.agc:387
//		VXV	UNIT
// PORT: Fixed ROM slots 16771.
    16771, 44602,
// PORT: SOURCE P51-P53.agc:388
//			XSMD
// PORT: Fixed ROM slots 16772.
    16772, 398,
// PORT: SOURCE P51-P53.agc:389
//		STORE	ZSMD
// PORT: Fixed ROM slots 16773.
    16773, 422,
// PORT: SOURCE P51-P53.agc:390
//		VXV	UNIT
// PORT: Fixed ROM slots 16774.
    16774, 44602,
// PORT: SOURCE P51-P53.agc:391
//			XSMD
// PORT: Fixed ROM slots 16775.
    16775, 398,
// PORT: SOURCE P51-P53.agc:392
//		STCALL	YSMD
// PORT: Fixed ROM slots 16776.
    16776, 29082,
// PORT: SOURCE P51-P53.agc:393
//			QMAJ
// PORT: Fixed ROM slots 16777.
    16777, 384,
// PORT: SOURCE P51-P53.agc:394
//		SETLOC	P50S1
// PORT: SOURCE P51-P53.agc:395
//		BANK
// PORT: SOURCE P51-P53.agc:396
//
// PORT: SOURCE P51-P53.agc:397
//# NAME:		AUTOMATIC OPTICS POSITIONING ROUTINE
// PORT: SOURCE P51-P53.agc:398
//#
// PORT: SOURCE P51-P53.agc:399
//# FUNCTION:	(1) TO POINT THE STAR LOS OF THE OPTICS AT A STAR OR LANDMARK DEFINED BY THE PROGRAM OR BY DSKY INPUT.
// PORT: SOURCE P51-P53.agc:400
//#		(2) TO POINT THE STAR LOS OF THE OPTICS AT THE LEM DURING RENDEZVOUS TRACKING OPERATIONS.
// PORT: SOURCE P51-P53.agc:401
//#
// PORT: SOURCE P51-P53.agc:402
//# CALLING:	CALL R52
// PORT: SOURCE P51-P53.agc:403
//#
// PORT: SOURCE P51-P53.agc:404
//# INPUT:	1.  TARG1FLG AND TARG2FLG:  PRESET BY CALLER
// PORT: SOURCE P51-P53.agc:405
//#		2.  RNDVZFLG AND TRACKFLG:  PRESET BY CALLER
// PORT: SOURCE P51-P53.agc:406
//#		3.  STAR CODE:  PRESET BY CALLER.  ALSO INPUT THROUGH DSKY
// PORT: SOURCE P51-P53.agc:407
//#		4.  LAT, LONG, AND ALT OF LANDMARK:  INPUT THROUGH DSKY
// PORT: SOURCE P51-P53.agc:408
//# Page 744
// PORT: SOURCE P51-P53.agc:409
//#		5.  NO. OF MARKS (MARKINDX):  PRESET BY CALLER
// PORT: SOURCE P51-P53.agc:410
//#
// PORT: SOURCE P51-P53.agc:411
//# OUTPUT:	DRIVE SHAFT AND TRUNNION CDUS.
// PORT: SOURCE P51-P53.agc:412
//#
// PORT: SOURCE P51-P53.agc:413
//# SUBROUTINES:	1.  FIXDELAY		7.  CLEANDSP
// PORT: SOURCE P51-P53.agc:414
//#		2.  GOPERF1		8.  GODSPR
// PORT: SOURCE P51-P53.agc:415
//#		3.  GOFLASH		9.  REFLASHR
// PORT: SOURCE P51-P53.agc:416
//#		4.  R53			10. R52.2
// PORT: SOURCE P51-P53.agc:417
//#		5.  ALARM		11. R52.3
// PORT: SOURCE P51-P53.agc:418
//#		6.  SR52.1
// PORT: SOURCE P51-P53.agc:419
//
// PORT: SOURCE P51-P53.agc:420
//		COUNT	15/R52
// PORT: SOURCE P51-P53.agc:421
//
// PORT: SOURCE P51-P53.agc:422
//R52		STQ	CLEAR
// PORT: Fixed ROM slots 14345.
    14345, 35872,
// PORT: SOURCE P51-P53.agc:423
//			SAVQR52
// PORT: Fixed ROM slots 14346.
    14346, 2812,
// PORT: SOURCE P51-P53.agc:424
//			ADVTRK
// PORT: Fixed ROM slots 14347.
    14347, 4458,
// PORT: SOURCE P51-P53.agc:425
//R52VRB		EXIT
// PORT: Fixed ROM slots 14348.
    14348, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14349–14352.
function agcAotUnit786 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14350 {
        if slot <= 14349 {
// PORT: SOURCE P51-P53.agc:426
//		EXTEND
// PORT: Fixed ROM slots 14349.
            if slot <> 14349 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:427
//		DCA	CDUT
// PORT: Fixed ROM slots 14350.
            if slot <> 14350 or instruction <> 12318 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14351 {
// PORT: SOURCE P51-P53.agc:428
//		DXCH	DESOPTT
// PORT: Fixed ROM slots 14351.
            if slot <> 14351 or instruction <> 22129 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 625, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:429
//		TC	INTPRET
// PORT: Fixed ROM slots 14352.
            if slot <> 14352 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[786] to agcAotUnit786@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:430
//		SSP	CLEAR
// PORT: Fixed ROM slots 14353.
    14353, 36018,
// PORT: SOURCE P51-P53.agc:431
//			OPTIND
// PORT: Fixed ROM slots 14354.
    14354, 1416,
// PORT: SOURCE P51-P53.agc:432
//			0
// PORT: Fixed ROM slots 14355.
    14355, 0,
// PORT: SOURCE P51-P53.agc:433
//			R53FLAG
// PORT: Fixed ROM slots 14356.
    14356, 370,
// PORT: SOURCE P51-P53.agc:434
//		EXIT
// PORT: Fixed ROM slots 14357.
    14357, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14358–14358.
function agcAotUnit787 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:435
//R52A		TC	INTPRET
// PORT: Fixed ROM slots 14358.
    if slot <> 14358 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[787] to agcAotUnit787@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:436
//		SET	BON
// PORT: Fixed ROM slots 14359.
    14359, 35864,
// PORT: SOURCE P51-P53.agc:437
//			TRUNFLAG
// PORT: Fixed ROM slots 14360.
    14360, 118,
// PORT: SOURCE P51-P53.agc:438
//			TARG1FLG
// PORT: Fixed ROM slots 14361.
    14361, 906,
// PORT: SOURCE P51-P53.agc:439
//			R52H
// PORT: Fixed ROM slots 14362.
    14362, 24724,
// PORT: SOURCE P51-P53.agc:440
//		CLEAR	EXIT
// PORT: Fixed ROM slots 14363.
    14363, 65048,
// PORT: SOURCE P51-P53.agc:441
//			TERMIFLG
// PORT: Fixed ROM slots 14364.
    14364, 3936
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14365–14368.
function agcAotUnit788 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14366 {
        if slot <= 14365 {
// PORT: SOURCE P51-P53.agc:442
//R52C		CA	SWSAMPLE	# IS OPTICS MODE IN AGC
// PORT: Fixed ROM slots 14365.
            if slot <> 14365 or instruction <> 13004 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 716).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:443
//		EXTEND
// PORT: Fixed ROM slots 14366.
            if slot <> 14366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14367 {
// PORT: SOURCE P51-P53.agc:444
//		BZMF	R52M		# MANUAL
// PORT: Fixed ROM slots 14367.
            if slot <> 14367 or instruction <> 25696 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 25696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:445
//R52D		TC	BANKCALL	# AGC
// PORT: Fixed ROM slots 14368.
            if slot <> 14368 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[788] to agcAotUnit788@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:446
//		CADR	SR52.1
// PORT: Fixed ROM slots 14369.
    14369, 22856
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14370–14372.
function agcAotUnit789 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14370 {
// PORT: SOURCE P51-P53.agc:447
//		TCF	R52L		# GR 90 DEGREES
// PORT: Fixed ROM slots 14370.
        if slot <> 14370 or instruction <> 5240 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5240, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14371 {
// PORT: SOURCE P51-P53.agc:448
//		TCF	R52J		# GR 50 DEGREES
// PORT: Fixed ROM slots 14371.
            if slot <> 14371 or instruction <> 5211 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5211, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:449
//		TC	UPFLAG		# LS 50 DEGREES
// PORT: Fixed ROM slots 14372.
            if slot <> 14372 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[789] to agcAotUnit789@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:450
//		ADRES	TRUNFLAG	# SET TRUNFLAG BIT 4 FLAG 0
// PORT: Fixed ROM slots 14373.
    14373, 22
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14374–14383.
function agcAotUnit790 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14378 {
        if slot <= 14375 {
            if slot <= 14374 {
// PORT: SOURCE P51-P53.agc:451
//R52JA		CAF	BIT10		# IS THIS A LEM
// PORT: Fixed ROM slots 14374.
                if slot <> 14374 or instruction <> 14854 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:452
//		MASK	STATE +1
// PORT: Fixed ROM slots 14375.
                if slot <> 14375 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14376 {
// PORT: SOURCE P51-P53.agc:453
//		CCS	A
// PORT: Fixed ROM slots 14376.
                if slot <> 14376 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14377 {
// PORT: SOURCE P51-P53.agc:454
//		TC	R52E		# YES
// PORT: Fixed ROM slots 14377.
                    if slot <> 14377 or instruction <> 1073 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1073, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:455
//		CAF	BIT6		# NO, IS R53FLAG SET
// PORT: Fixed ROM slots 14378.
                    if slot <> 14378 or instruction <> 14858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14380 {
            if slot <= 14379 {
// PORT: SOURCE P51-P53.agc:456
//		MASK	STATE
// PORT: Fixed ROM slots 14379.
                if slot <> 14379 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:457
//		CCS	A
// PORT: Fixed ROM slots 14380.
                if slot <> 14380 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14381 {
// PORT: SOURCE P51-P53.agc:458
//		TCF	R52E		# YES
// PORT: Fixed ROM slots 14381.
                if slot <> 14381 or instruction <> 5169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14382 {
// PORT: SOURCE P51-P53.agc:459
//# Page 745
// PORT: SOURCE P51-P53.agc:460
//		CAF	V06N92		# NO
// PORT: Fixed ROM slots 14382.
                    if slot <> 14382 or instruction <> 13424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1136), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:461
//		TC	BANKCALL
// PORT: Fixed ROM slots 14383.
                    if slot <> 14383 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[790] to agcAotUnit790@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:462
//		CADR	GODSPR
// PORT: Fixed ROM slots 14384.
    14384, 17276
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14385–14397.
function agcAotUnit791 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14390 {
        if slot <= 14387 {
            if slot <= 14385 {
// PORT: SOURCE P51-P53.agc:463
//R52E		CA	SWSAMPLE	# IS OSS IN CMC MODE
// PORT: Fixed ROM slots 14385.
                if slot <> 14385 or instruction <> 13004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 716).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14386 {
// PORT: SOURCE P51-P53.agc:464
//		EXTEND
// PORT: Fixed ROM slots 14386.
                    if slot <> 14386 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:465
//		BZMF	R52F		# NO
// PORT: Fixed ROM slots 14387.
                    if slot <> 14387 or instruction <> 25660 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25660, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 14388 {
// PORT: SOURCE P51-P53.agc:466
//		CS	STATE		# YES: IS TRUNFLAG SET
// PORT: Fixed ROM slots 14388.
                if slot <> 14388 or instruction <> 16444 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 60).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14389 {
// PORT: SOURCE P51-P53.agc:467
//		MASK	BIT4
// PORT: Fixed ROM slots 14389.
                    if slot <> 14389 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        if fixedOperand = 8 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:468
//		CCS	A
// PORT: Fixed ROM slots 14390.
                    if slot <> 14390 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14393 {
            if slot <= 14391 {
// PORT: SOURCE P51-P53.agc:469
//		TC	+3		# NO
// PORT: Fixed ROM slots 14391.
                if slot <> 14391 or instruction <> 1082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1082, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14392 {
// PORT: SOURCE P51-P53.agc:470
//		CA	PAC		# YES
// PORT: Fixed ROM slots 14392.
                    if slot <> 14392 or instruction <> 13309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1021).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:471
//		TS	DESOPTT
// PORT: Fixed ROM slots 14393.
                    if slot <> 14393 or instruction <> 23152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23152, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 14395 {
                if slot <= 14394 {
// PORT: SOURCE P51-P53.agc:472
//		CA	SAC
// PORT: Fixed ROM slots 14394.
                    if slot <> 14394 or instruction <> 13307 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1019).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:473
//		TS	DESOPTS
// PORT: Fixed ROM slots 14395.
                    if slot <> 14395 or instruction <> 23153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23153, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 14396 {
// PORT: SOURCE P51-P53.agc:474
//R52F		CAF	.5SEC		# WAIT 1/2 SEC
// PORT: Fixed ROM slots 14396.
                    if slot <> 14396 or instruction <> 14878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:475
//		TC	BANKCALL
// PORT: Fixed ROM slots 14397.
                    if slot <> 14397 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[791] to agcAotUnit791@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:476
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 14398.
    14398, 1972
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14399–14407.
function agcAotUnit792 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14402 {
        if slot <= 14400 {
            if slot <= 14399 {
// PORT: SOURCE P51-P53.agc:477
//		CAF	BIT10
// PORT: Fixed ROM slots 14399.
                if slot <> 14399 or instruction <> 14854 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:478
//		MASK	STATE +1
// PORT: Fixed ROM slots 14400.
                if slot <> 14400 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14401 {
// PORT: SOURCE P51-P53.agc:479
//		CCS	A
// PORT: Fixed ROM slots 14401.
                if slot <> 14401 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:480
//		TCF	R52HA		# YES, LEM
// PORT: Fixed ROM slots 14402.
                if slot <> 14402 or instruction <> 5195 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5195, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 14404 {
            if slot <= 14403 {
// PORT: SOURCE P51-P53.agc:481
//		CAF	BIT15		# NO
// PORT: Fixed ROM slots 14403.
                if slot <> 14403 or instruction <> 14849 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:482
//		MASK	STATE +7	# IS TERMIFLG SET
// PORT: Fixed ROM slots 14404.
                if slot <> 14404 or instruction <> 28739 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14405 {
// PORT: SOURCE P51-P53.agc:483
//		EXTEND
// PORT: Fixed ROM slots 14405.
                if slot <> 14405 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14406 {
// PORT: SOURCE P51-P53.agc:484
//		BZF	R52C		# NO
// PORT: Fixed ROM slots 14406.
                    if slot <> 14406 or instruction <> 5149 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5149, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:485
//R52Q		TC	INTPRET		# YES
// PORT: Fixed ROM slots 14407.
                    if slot <> 14407 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[792] to agcAotUnit792@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:486
//		GOTO
// PORT: Fixed ROM slots 14408.
    14408, 65360,
// PORT: SOURCE P51-P53.agc:487
//			SAVQR52
// PORT: Fixed ROM slots 14409.
    14409, 2812,
// PORT: SOURCE P51-P53.agc:488
//R52H		EXIT			# LEM
// PORT: Fixed ROM slots 14410.
    14410, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14411–14411.
function agcAotUnit793 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:489
//R52HA		TC	BANKCALL
// PORT: Fixed ROM slots 14411.
    if slot <> 14411 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[793] to agcAotUnit793@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:490
//		CADR	R61CSM
// PORT: Fixed ROM slots 14412.
    14412, 64222
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14413–14427.
function agcAotUnit794 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14419 {
        if slot <= 14415 {
            if slot <= 14413 {
// PORT: SOURCE P51-P53.agc:491
//		CA	STATE +1
// PORT: Fixed ROM slots 14413.
                if slot <> 14413 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14414 {
// PORT: SOURCE P51-P53.agc:492
//		MASK	BIT5
// PORT: Fixed ROM slots 14414.
                    if slot <> 14414 or instruction <> 31243 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P51-P53.agc:493
//		EXTEND			# TRACKFLG
// PORT: Fixed ROM slots 14415.
                    if slot <> 14415 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 14417 {
                if slot <= 14416 {
// PORT: SOURCE P51-P53.agc:494
//		BZF	R52Q
// PORT: Fixed ROM slots 14416.
                    if slot <> 14416 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:495
//
// PORT: SOURCE P51-P53.agc:496
//		CS	STATE +1
// PORT: Fixed ROM slots 14417.
                    if slot <> 14417 or instruction <> 16445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 61).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 14418 {
// PORT: SOURCE P51-P53.agc:497
//		MASK	BIT7		# UPDATFLG
// PORT: Fixed ROM slots 14418.
                    if slot <> 14418 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:498
//		CCS	A
// PORT: Fixed ROM slots 14419.
                    if slot <> 14419 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14423 {
            if slot <= 14421 {
                if slot <= 14420 {
// PORT: SOURCE P51-P53.agc:499
//		TCF	R52SYNC
// PORT: Fixed ROM slots 14420.
                    if slot <> 14420 or instruction <> 5209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5209, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:500
//
// PORT: SOURCE P51-P53.agc:501
//R52I		CA	STATE +5
// PORT: Fixed ROM slots 14421.
                    if slot <> 14421 or instruction <> 12353 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 14422 {
// PORT: SOURCE P51-P53.agc:502
//		MASK	BIT10
// PORT: Fixed ROM slots 14422.
                    if slot <> 14422 or instruction <> 31238 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:503
//		CCS	A
// PORT: Fixed ROM slots 14423.
                    if slot <> 14423 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 14425 {
                if slot <= 14424 {
// PORT: SOURCE P51-P53.agc:504
//		TC	R52D		# PRFTRKAT = 1
// PORT: Fixed ROM slots 14424.
                    if slot <> 14424 or instruction <> 1056 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1056, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:505
//R52SYNC		CAF	1.8SEC		# MAKE UP FOR LOST TIME
// PORT: Fixed ROM slots 14425.
                    if slot <> 14425 or instruction <> 13444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1156), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 14426 {
// PORT: SOURCE P51-P53.agc:506
//		TCF	R52F +1
// PORT: Fixed ROM slots 14426.
                    if slot <> 14426 or instruction <> 5181 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5181, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:507
//
// PORT: SOURCE P51-P53.agc:508
//R52J		TC	DOWNFLAG	# CLEAR TRUNFLAG
// PORT: Fixed ROM slots 14427.
                    if slot <> 14427 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[794] to agcAotUnit794@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:509
//		ADRES	TRUNFLAG	# BIT 4 FLAG 0
// PORT: Fixed ROM slots 14428.
    14428, 22
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14429–14429.
function agcAotUnit795 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:510
//# Page 746
// PORT: SOURCE P51-P53.agc:511
//		TC	ALARM		# SET 407 ALARM
// PORT: Fixed ROM slots 14429.
    if slot <> 14429 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[795] to agcAotUnit795@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:512
//		OCT	407
// PORT: Fixed ROM slots 14430.
    14430, 526
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14431–14438.
function agcAotUnit796 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14434 {
        if slot <= 14432 {
            if slot <= 14431 {
// PORT: SOURCE P51-P53.agc:513
//		TC	R52JA
// PORT: Fixed ROM slots 14431.
                if slot <> 14431 or instruction <> 1062 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1062, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:514
//R52M		CAF	BIT6		# IS R53FLAG SET
// PORT: Fixed ROM slots 14432.
                if slot <> 14432 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14433 {
// PORT: SOURCE P51-P53.agc:515
//		MASK	STATE
// PORT: Fixed ROM slots 14433.
                if slot <> 14433 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:516
//		CCS	A
// PORT: Fixed ROM slots 14434.
                if slot <> 14434 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 14436 {
            if slot <= 14435 {
// PORT: SOURCE P51-P53.agc:517
//		TC	R52F		# YES
// PORT: Fixed ROM slots 14435.
                if slot <> 14435 or instruction <> 1084 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1084, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:518
//		INHINT			# NO
// PORT: Fixed ROM slots 14436.
                if slot <> 14436 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14437 {
// PORT: SOURCE P51-P53.agc:519
//		CAF	PRIO24
// PORT: Fixed ROM slots 14437.
                if slot <> 14437 or instruction <> 16305 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4017), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:520
//		TC	FINDVAC
// PORT: Fixed ROM slots 14438.
                if slot <> 14438 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[796] to agcAotUnit796@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:521
//		EBANK=	SAC
// PORT: SOURCE P51-P53.agc:522
//		2CADR	R53JOB
// PORT: Fixed ROM slots 14439 14440.
    14439, 2262, 14440, 24682
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14441–14443.
function agcAotUnit797 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14441 {
// PORT: SOURCE P51-P53.agc:523
//
// PORT: SOURCE P51-P53.agc:524
//		RELINT
// PORT: Fixed ROM slots 14441.
        if slot <> 14441 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14442 {
// PORT: SOURCE P51-P53.agc:525
//		TCF	R52F
// PORT: Fixed ROM slots 14442.
            if slot <> 14442 or instruction <> 5180 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5180, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:526
//R53JOB		TC	INTPRET
// PORT: Fixed ROM slots 14443.
            if slot <> 14443 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[797] to agcAotUnit797@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:527
//		CALL
// PORT: Fixed ROM slots 14444.
    14444, 65320,
// PORT: SOURCE P51-P53.agc:528
//			R53
// PORT: Fixed ROM slots 14445.
    14445, 25984,
// PORT: SOURCE P51-P53.agc:529
//ENDPLAC		EXIT			# INTERPRETER RETURN TO ENDOFJOB (R22 USES)
// PORT: Fixed ROM slots 14446.
    14446, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14447–14447.
function agcAotUnit798 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:530
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 14447.
    if slot <> 14447 or instruction <> 2703 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2703, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[798] to agcAotUnit798@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:531
//V06N92		VN	00692
// PORT: Fixed ROM slots 14448.
    14448, 1720,
// PORT: SOURCE P51-P53.agc:532
//V06N89A		VN	0689
// PORT: Fixed ROM slots 14449.
    14449, 1714,
// PORT: SOURCE P51-P53.agc:533
//SHAXIS		2DEC	.5376381241 B-1
// PORT: Fixed ROM slots 14450 14451.
    14450, 8808, 14451, 10864,
// PORT: SOURCE P51-P53.agc:534
//
// PORT: SOURCE P51-P53.agc:535
//		2DEC	0
// PORT: Fixed ROM slots 14452 14453.
    14452, 0, 14453, 0,
// PORT: SOURCE P51-P53.agc:536
//
// PORT: SOURCE P51-P53.agc:537
//		2DEC	.8431766920 B-1
// PORT: Fixed ROM slots 14454 14455.
    14454, 13814, 14455, 9944
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14456–14461.
function agcAotUnit799 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14458 {
        if slot <= 14456 {
// PORT: SOURCE P51-P53.agc:538
//
// PORT: SOURCE P51-P53.agc:539
//R52L		CAF	BIT10		# IS THIS A LEM
// PORT: Fixed ROM slots 14456.
            if slot <> 14456 or instruction <> 14854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14457 {
// PORT: SOURCE P51-P53.agc:540
//		MASK	STATE +1
// PORT: Fixed ROM slots 14457.
                if slot <> 14457 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:541
//		CCS	A
// PORT: Fixed ROM slots 14458.
                if slot <> 14458 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 14459 {
// PORT: SOURCE P51-P53.agc:542
//		TC	R52J		# YES
// PORT: Fixed ROM slots 14459.
            if slot <> 14459 or instruction <> 1115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1115, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14460 {
// PORT: SOURCE P51-P53.agc:543
//		CAF	OCT404
// PORT: Fixed ROM slots 14460.
                if slot <> 14460 or instruction <> 13443 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1155), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:544
//		TC	BANKCALL
// PORT: Fixed ROM slots 14461.
                if slot <> 14461 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[799] to agcAotUnit799@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:545
//		CADR	PRIOLARM
// PORT: Fixed ROM slots 14462.
    14462, 18412
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14463–14466.
function agcAotUnit800 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14464 {
        if slot <= 14463 {
// PORT: SOURCE P51-P53.agc:546
//		TCF	TERM52		# TERMINATE
// PORT: Fixed ROM slots 14463.
            if slot <> 14463 or instruction <> 5253 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5253, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:547
//		TCF	R52F		# PROCEED
// PORT: Fixed ROM slots 14464.
            if slot <> 14464 or instruction <> 5180 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5180, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14465 {
// PORT: SOURCE P51-P53.agc:548
//		TCF	R52F		# NO PROVISION FOR NEW DATA
// PORT: Fixed ROM slots 14465.
            if slot <> 14465 or instruction <> 5180 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5180, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:549
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 14466.
            if slot <> 14466 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[800] to agcAotUnit800@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:550
//
// PORT: SOURCE P51-P53.agc:551
//OCT404		OCT	404
// PORT: Fixed ROM slots 14467.
    14467, 520,
// PORT: SOURCE P51-P53.agc:552
//1.8SEC		DEC	180
// PORT: Fixed ROM slots 14468.
    14468, 360
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14469–14470.
function agcAotUnit801 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14469 {
// PORT: SOURCE P51-P53.agc:553
//
// PORT: SOURCE P51-P53.agc:554
//TERM52		TC	CLEARMRK
// PORT: Fixed ROM slots 14469.
        if slot <> 14469 or instruction <> 2910 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2910, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:555
//
// PORT: SOURCE P51-P53.agc:556
//		TC	BANKCALL	# KILL MARK SYSTEM
// PORT: Fixed ROM slots 14470.
        if slot <> 14470 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[801] to agcAotUnit801@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:557
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 14471.
    14471, 14438
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14472–14474.
function agcAotUnit802 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14472 {
// PORT: SOURCE P51-P53.agc:558
//
// PORT: SOURCE P51-P53.agc:559
//# Page 747
// PORT: SOURCE P51-P53.agc:560
//
// PORT: SOURCE P51-P53.agc:561
//		CAF	ZERO
// PORT: Fixed ROM slots 14472.
        if slot <> 14472 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14473 {
// PORT: SOURCE P51-P53.agc:562
//		TS	OPTCADR
// PORT: Fixed ROM slots 14473.
            if slot <> 14473 or instruction <> 23251 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23251, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:563
//
// PORT: SOURCE P51-P53.agc:564
//		TC	BANKCALL	# CLEAR OUT EXTENDED VERBS
// PORT: Fixed ROM slots 14474.
            if slot <> 14474 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[802] to agcAotUnit802@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:565
//		CADR	KLEENEX
// PORT: Fixed ROM slots 14475.
    14475, 17120
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14476–14476.
function agcAotUnit803 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:566
//
// PORT: SOURCE P51-P53.agc:567
//		TC	GOTOPOOH	# NO GO TO P00
// PORT: Fixed ROM slots 14476.
    if slot <> 14476 or instruction <> 2118 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2118, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[803] to agcAotUnit803@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:568
//
// PORT: SOURCE P51-P53.agc:569
//ADVORB		STQ	SET		# SETS UP ADVANCED ORBIT TRACKING
// PORT: Fixed ROM slots 14477.
    14477, 35872,
// PORT: SOURCE P51-P53.agc:570
//			SAVQR52
// PORT: Fixed ROM slots 14478.
    14478, 2812,
// PORT: SOURCE P51-P53.agc:571
//			ADVTRK
// PORT: Fixed ROM slots 14479.
    14479, 4202,
// PORT: SOURCE P51-P53.agc:572
//		SET	SET
// PORT: Fixed ROM slots 14480.
    14480, 35864,
// PORT: SOURCE P51-P53.agc:573
//			LUNAFLAG
// PORT: Fixed ROM slots 14481.
    14481, 1638,
// PORT: SOURCE P51-P53.agc:574
//			ERADFLAG
// PORT: Fixed ROM slots 14482.
    14482, 612,
// PORT: SOURCE P51-P53.agc:575
//		GOTO
// PORT: Fixed ROM slots 14483.
    14483, 65360,
// PORT: SOURCE P51-P53.agc:576
//			R52VRB
// PORT: Fixed ROM slots 14484.
    14484, 24600,
// PORT: SOURCE P51-P53.agc:577
//
// PORT: SOURCE P51-P53.agc:578
//# Page 748
// PORT: SOURCE P51-P53.agc:579
//# NAME -- S50 ALIAS LOCSAM
// PORT: SOURCE P51-P53.agc:580
//# NAME:	LOCSAM
// PORT: SOURCE P51-P53.agc:581
//#
// PORT: SOURCE P51-P53.agc:582
//# FUNCTION -- TO COMPUTE QUATITIGS LISTED BELOW, USED IN THE
// PORT: SOURCE P51-P53.agc:583
//#	      IMU ALIGNMENT PROGRAMS.
// PORT: SOURCE P51-P53.agc:584
//#
// PORT: SOURCE P51-P53.agc:585
//#	DEFINE:
// PORT: SOURCE P51-P53.agc:586
//#
// PORT: SOURCE P51-P53.agc:587
//#	RATT = POSITION VECTOR OF CM WRT PRIMARY BODY
// PORT: SOURCE P51-P53.agc:588
//#
// PORT: SOURCE P51-P53.agc:589
//#	VATT = VELOCITY VECTOR OF CM WRT PRIMARY BODY
// PORT: SOURCE P51-P53.agc:590
//#
// PORT: SOURCE P51-P53.agc:591
//#	RE = RADIUS OF EARTH
// PORT: SOURCE P51-P53.agc:592
//#
// PORT: SOURCE P51-P53.agc:593
//#	RM = RADIUS OF MOON
// PORT: SOURCE P51-P53.agc:594
//#
// PORT: SOURCE P51-P53.agc:595
//#	ECLIPOL = POLE OF ECLIPTIC SCALED BY TANGENTIAL VELOCITY OF EARTH
// PORT: SOURCE P51-P53.agc:596
//#		  WRT TO SUN OVER THE VELOCITY OF LIGHT
// PORT: SOURCE P51-P53.agc:597
//#
// PORT: SOURCE P51-P53.agc:598
//#	REM = POSITION OF MOON WRT EARTH
// PORT: SOURCE P51-P53.agc:599
//#
// PORT: SOURCE P51-P53.agc:600
//#	RES = POSITION OF SUN WRT EARTH
// PORT: SOURCE P51-P53.agc:601
//#
// PORT: SOURCE P51-P53.agc:602
//#	C = VELOCITY OF LIGHT
// PORT: SOURCE P51-P53.agc:603
//#
// PORT: SOURCE P51-P53.agc:604
//#		EARTH IS PRIMARY			MOON IS PRIMARY
// PORT: SOURCE P51-P53.agc:605
//#		        _                                       _
// PORT: SOURCE P51-P53.agc:606
//#		VEARTH=-1(RATT)				VEARTH=-1(REM+RATT)
// PORT: SOURCE P51-P53.agc:607
//#		        _				        _
// PORT: SOURCE P51-P53.agc:608
//#		VMOON = 1(REM-RATT)			VMOON =-1(RATT)
// PORT: SOURCE P51-P53.agc:609
//#		        _				        _
// PORT: SOURCE P51-P53.agc:610
//#		VSUN  = 1(RES)				VSUN  = 1(RES-REM)
// PORT: SOURCE P51-P53.agc:611
//#		              -1
// PORT: SOURCE P51-P53.agc:612
//#		CEARTH=COS(SIN  (RE/RATT)+5)		CEARTH=COS 5
// PORT: SOURCE P51-P53.agc:613
//#								      -1
// PORT: SOURCE P51-P53.agc:614
//#		CMOON =COS 5				CMOON =COS(SIN  CRM/RATT)+5)
// PORT: SOURCE P51-P53.agc:615
//#
// PORT: SOURCE P51-P53.agc:616
//#		CSUN  =COS 15				CSUN  =COS 15
// PORT: SOURCE P51-P53.agc:617
//#
// PORT: SOURCE P51-P53.agc:618
//#			    VEL/C = VSUN x ECLIPOL + VATT/C
// PORT: SOURCE P51-P53.agc:619
//#
// PORT: SOURCE P51-P53.agc:620
//# CALL:		DLOAD	CALL
// PORT: SOURCE P51-P53.agc:621
//#			DESIRED TIME
// PORT: SOURCE P51-P53.agc:622
//#			LOCSAM
// PORT: SOURCE P51-P53.agc:623
//#
// PORT: SOURCE P51-P53.agc:624
//# INPUTS:  	MPAC = TIME
// PORT: SOURCE P51-P53.agc:625
//#
// PORT: SOURCE P51-P53.agc:626
//# OUTPUTS:  	VEARTH, VMOON, VSUN, CEARTH, CMOON, CSUN, VEL/C
// PORT: SOURCE P51-P53.agc:627
//#
// PORT: SOURCE P51-P53.agc:628
//# SUBROUTINES:  LSPOS, CSMCONIC
// PORT: SOURCE P51-P53.agc:629
//#
// PORT: SOURCE P51-P53.agc:630
//# DEBRIS:  	VAC AREA, SEE SUBROUTINES.
// PORT: SOURCE P51-P53.agc:631
//
// PORT: SOURCE P51-P53.agc:632
//# Page 749
// PORT: SOURCE P51-P53.agc:633
//		SETLOC	P50S1
// PORT: SOURCE P51-P53.agc:634
//		BANK
// PORT: SOURCE P51-P53.agc:635
//
// PORT: SOURCE P51-P53.agc:636
//		COUNT*	$$/S50
// PORT: SOURCE P51-P53.agc:637
//
// PORT: SOURCE P51-P53.agc:638
//LOCSAM		=	S50
// PORT: SOURCE P51-P53.agc:639
//S50		STQ
// PORT: Fixed ROM slots 14485.
    14485, 65312,
// PORT: SOURCE P51-P53.agc:640
//			QMAJ
// PORT: Fixed ROM slots 14486.
    14486, 384,
// PORT: SOURCE P51-P53.agc:641
//		STCALL	TSIGHT
// PORT: Fixed ROM slots 14487.
    14487, 31502,
// PORT: SOURCE P51-P53.agc:642
//			LSPOS
// PORT: Fixed ROM slots 14488.
    14488, 45200,
// PORT: SOURCE P51-P53.agc:643
//		STOVL	VMOON
// PORT: Fixed ROM slots 14489.
    14489, 23508,
// PORT: SOURCE P51-P53.agc:644
//			2D
// PORT: Fixed ROM slots 14490.
    14490, 6,
// PORT: SOURCE P51-P53.agc:645
//		STODL	VSUN
// PORT: Fixed ROM slots 14491.
    14491, 15304,
// PORT: SOURCE P51-P53.agc:646
//			TSIGHT
// PORT: Fixed ROM slots 14492.
    14492, 2830,
// PORT: SOURCE P51-P53.agc:647
//		STCALL	TDEC1
// PORT: Fixed ROM slots 14493.
    14493, 28738,
// PORT: SOURCE P51-P53.agc:648
//			CSMCONIC
// PORT: Fixed ROM slots 14494.
    14494, 23704,
// PORT: SOURCE P51-P53.agc:649
//		SSP	TIX,2
// PORT: Fixed ROM slots 14495.
    14495, 50354,
// PORT: SOURCE P51-P53.agc:650
//			S2
// PORT: Fixed ROM slots 14496.
    14496, 84,
// PORT: SOURCE P51-P53.agc:651
//			0
// PORT: Fixed ROM slots 14497.
    14497, 0,
// PORT: SOURCE P51-P53.agc:652
//			MOONCNTR
// PORT: Fixed ROM slots 14498.
    14498, 24938,
// PORT: SOURCE P51-P53.agc:653
//EARTCNTR	VLOAD	VSU
// PORT: Fixed ROM slots 14499.
    14499, 43514,
// PORT: SOURCE P51-P53.agc:654
//			VMOON
// PORT: Fixed ROM slots 14500.
    14500, 3028,
// PORT: SOURCE P51-P53.agc:655
//			RATT
// PORT: Fixed ROM slots 14501.
    14501, 2,
// PORT: SOURCE P51-P53.agc:656
//		UNIT
// PORT: Fixed ROM slots 14502.
    14502, 65372,
// PORT: SOURCE P51-P53.agc:657
//		STOVL	VMOON
// PORT: Fixed ROM slots 14503.
    14503, 23508,
// PORT: SOURCE P51-P53.agc:658
//			RATT
// PORT: Fixed ROM slots 14504.
    14504, 2,
// PORT: SOURCE P51-P53.agc:659
//		UNIT	VCOMP
// PORT: Fixed ROM slots 14505.
    14505, 48732,
// PORT: SOURCE P51-P53.agc:660
//		STODL	VEARTH
// PORT: Fixed ROM slots 14506.
    14506, 15292,
// PORT: SOURCE P51-P53.agc:661
//			RSUBE
// PORT: Fixed ROM slots 14507.
    14507, 26960,
// PORT: SOURCE P51-P53.agc:662
//		CALL
// PORT: Fixed ROM slots 14508.
    14508, 65320,
// PORT: SOURCE P51-P53.agc:663
//			OCCOS
// PORT: Fixed ROM slots 14509.
    14509, 25002,
// PORT: SOURCE P51-P53.agc:664
//		STODL	CEARTH
// PORT: Fixed ROM slots 14510.
    14510, 12318,
// PORT: SOURCE P51-P53.agc:665
//			CSS5
// PORT: Fixed ROM slots 14511.
    14511, 26988,
// PORT: SOURCE P51-P53.agc:666
//		STOVL	CMOON
// PORT: Fixed ROM slots 14512.
    14512, 20518,
// PORT: SOURCE P51-P53.agc:667
//			VSUN
// PORT: Fixed ROM slots 14513.
    14513, 3016,
// PORT: SOURCE P51-P53.agc:668
//		UNIT
// PORT: Fixed ROM slots 14514.
    14514, 65372,
// PORT: SOURCE P51-P53.agc:669
//		STCALL	VSUN
// PORT: Fixed ROM slots 14515.
    14515, 31688,
// PORT: SOURCE P51-P53.agc:670
//			ENDSAM
// PORT: Fixed ROM slots 14516.
    14516, 24980,
// PORT: SOURCE P51-P53.agc:671
//MOONCNTR	VLOAD	VSR8
// PORT: Fixed ROM slots 14517.
    14517, 33530,
// PORT: SOURCE P51-P53.agc:672
//			VMOON
// PORT: Fixed ROM slots 14518.
    14518, 3028,
// PORT: SOURCE P51-P53.agc:673
//		VSR1	BVSU
// PORT: Fixed ROM slots 14519.
    14519, 42468,
// PORT: SOURCE P51-P53.agc:674
//			VSUN
// PORT: Fixed ROM slots 14520.
    14520, 3016,
// PORT: SOURCE P51-P53.agc:675
//		UNIT
// PORT: Fixed ROM slots 14521.
    14521, 65372,
// PORT: SOURCE P51-P53.agc:676
//		STOVL	VSUN
// PORT: Fixed ROM slots 14522.
    14522, 23496,
// PORT: SOURCE P51-P53.agc:677
//			VMOON
// PORT: Fixed ROM slots 14523.
    14523, 3028,
// PORT: SOURCE P51-P53.agc:678
//		VAD	UNIT
// PORT: Fixed ROM slots 14524.
    14524, 44634,
// PORT: SOURCE P51-P53.agc:679
//			RATT
// PORT: Fixed ROM slots 14525.
    14525, 2,
// PORT: SOURCE P51-P53.agc:680
//		VCOMP
// PORT: Fixed ROM slots 14526.
    14526, 65404,
// PORT: SOURCE P51-P53.agc:681
//		STOVL	VEARTH
// PORT: Fixed ROM slots 14527.
    14527, 23484,
// PORT: SOURCE P51-P53.agc:682
//# Page 750
// PORT: SOURCE P51-P53.agc:683
//
// PORT: SOURCE P51-P53.agc:684
//			RATT
// PORT: Fixed ROM slots 14528.
    14528, 2,
// PORT: SOURCE P51-P53.agc:685
//		UNIT	VCOMP
// PORT: Fixed ROM slots 14529.
    14529, 48732,
// PORT: SOURCE P51-P53.agc:686
//		STODL	VMOON
// PORT: Fixed ROM slots 14530.
    14530, 15316,
// PORT: SOURCE P51-P53.agc:687
//			RSUBM
// PORT: Fixed ROM slots 14531.
    14531, 26956,
// PORT: SOURCE P51-P53.agc:688
//		CALL
// PORT: Fixed ROM slots 14532.
    14532, 65320,
// PORT: SOURCE P51-P53.agc:689
//			OCCOS
// PORT: Fixed ROM slots 14533.
    14533, 25002,
// PORT: SOURCE P51-P53.agc:690
//		STODL	CMOON
// PORT: Fixed ROM slots 14534.
    14534, 12326,
// PORT: SOURCE P51-P53.agc:691
//			CSS5
// PORT: Fixed ROM slots 14535.
    14535, 26988,
// PORT: SOURCE P51-P53.agc:692
//		STOVL	CEARTH
// PORT: Fixed ROM slots 14536.
    14536, 20510,
// PORT: SOURCE P51-P53.agc:693
//			VSUN
// PORT: Fixed ROM slots 14537.
    14537, 3016,
// PORT: SOURCE P51-P53.agc:694
//ENDSAM		VXV
// PORT: Fixed ROM slots 14538.
    14538, 65338,
// PORT: SOURCE P51-P53.agc:695
//			ECLIPOL
// PORT: Fixed ROM slots 14539.
    14539, 26972
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:696
//		STOVL	VEL/C
// PORT: Fixed ROM slots 14540.
    14540, 24184,
// PORT: SOURCE P51-P53.agc:697
//			VATT
// PORT: Fixed ROM slots 14541.
    14541, 14,
// PORT: SOURCE P51-P53.agc:698
//		VXSC	VAD
// PORT: Fixed ROM slots 14542.
    14542, 44514,
// PORT: SOURCE P51-P53.agc:699
//			1/C
// PORT: Fixed ROM slots 14543.
    14543, 26968,
// PORT: SOURCE P51-P53.agc:700
//			VEL/C
// PORT: Fixed ROM slots 14544.
    14544, 3704,
// PORT: SOURCE P51-P53.agc:701
//		STODL	VEL/C
// PORT: Fixed ROM slots 14545.
    14545, 15992,
// PORT: SOURCE P51-P53.agc:702
//			CSSUN
// PORT: Fixed ROM slots 14546.
    14546, 26992,
// PORT: SOURCE P51-P53.agc:703
//		STCALL	CSUN
// PORT: Fixed ROM slots 14547.
    14547, 28706,
// PORT: SOURCE P51-P53.agc:704
//			QMAJ
// PORT: Fixed ROM slots 14548.
    14548, 384,
// PORT: SOURCE P51-P53.agc:705
//OCCOS		DDV	SR1
// PORT: Fixed ROM slots 14549.
    14549, 57970,
// PORT: SOURCE P51-P53.agc:706
//			36D
// PORT: Fixed ROM slots 14550.
    14550, 74,
// PORT: SOURCE P51-P53.agc:707
//		ASIN	DAD
// PORT: Fixed ROM slots 14551.
    14551, 36284,
// PORT: SOURCE P51-P53.agc:708
//			5DEGREES
// PORT: Fixed ROM slots 14552.
    14552, 26964,
// PORT: SOURCE P51-P53.agc:709
//		COS	SR1
// PORT: Fixed ROM slots 14553.
    14553, 58060,
// PORT: SOURCE P51-P53.agc:710
//		RVQ
// PORT: Fixed ROM slots 14554.
    14554, 65308,
// PORT: SOURCE P51-P53.agc:711
//		SETLOC	P50S
// PORT: SOURCE P51-P53.agc:712
//		BANK
// PORT: SOURCE P51-P53.agc:713
//RSUBM		2DEC	1738090 B-29	# MOON RADIUS IN METERS
// PORT: Fixed ROM slots 15525 15526.
    15525, 106, 15526, 1386,
// PORT: SOURCE P51-P53.agc:714
//
// PORT: SOURCE P51-P53.agc:715
//RSUBE		2DEC	6378166 B-29
// PORT: Fixed ROM slots 15527 15528.
    15527, 388, 15528, 21174,
// PORT: SOURCE P51-P53.agc:716
//
// PORT: SOURCE P51-P53.agc:717
//5DEGREES	2DEC	.013888889 	# SCALED IN REVS
// PORT: Fixed ROM slots 15529 15530.
    15529, 454, 15530, 18204,
// PORT: SOURCE P51-P53.agc:718
//
// PORT: SOURCE P51-P53.agc:719
//1/C		2DEC	.000042699 B-1	# *
// PORT: Fixed ROM slots 15531 15532.
    15531, 0, 15532, 11462,
// PORT: SOURCE P51-P53.agc:720
//
// PORT: SOURCE P51-P53.agc:721
//ECLIPOL		2DEC	0		# *
// PORT: Fixed ROM slots 15533 15534.
    15533, 0, 15534, 0,
// PORT: SOURCE P51-P53.agc:722
//
// PORT: SOURCE P51-P53.agc:723
//		2DEC	-.00007896 B-1	# *
// PORT: Fixed ROM slots 15535 15536.
    15535, 65534, 15536, 44338,
// PORT: SOURCE P51-P53.agc:724
//
// PORT: SOURCE P51-P53.agc:725
//		2DEC	.00018209 B-1	# *		* FOR USE BY CSM ONLY
// PORT: Fixed ROM slots 15537 15538.
    15537, 2, 15538, 16112,
// PORT: SOURCE P51-P53.agc:726
//
// PORT: SOURCE P51-P53.agc:727
//TSIGHT1		2DEC	24000
// PORT: Fixed ROM slots 15539 15540.
    15539, 2, 15540, 15232,
// PORT: SOURCE P51-P53.agc:728
//
// PORT: SOURCE P51-P53.agc:729
//CEARTH		=	14D
// PORT: SOURCE P51-P53.agc:730
//CSUN		=	16D
// PORT: SOURCE P51-P53.agc:731
//CMOON		=	18D
// PORT: SOURCE P51-P53.agc:732
//CSS5		2DEC	.2490475	# (COS 5)/4
// PORT: Fixed ROM slots 15541 15542.
    15541, 8160, 15542, 12918,
// PORT: SOURCE P51-P53.agc:733
//# Page 751
// PORT: SOURCE P51-P53.agc:734
//CSSUN		2DEC	.24148		# (COS 15)/4
// PORT: Fixed ROM slots 15543 15544.
    15543, 7912, 15544, 13380
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14555–14557.
function agcAotUnit804 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14555 {
// PORT: SOURCE P51-P53.agc:735
//
// PORT: SOURCE P51-P53.agc:736
//# Page 752
// PORT: SOURCE P51-P53.agc:737
//# PROGRAM NAME -- PICAPAR	DATE: DEC 20 66
// PORT: SOURCE P51-P53.agc:738
//# MOD 1				LOG SECTION: P51-P53
// PORT: SOURCE P51-P53.agc:739
//#				ASSEMBLY:  SUNDISK REV40
// PORT: SOURCE P51-P53.agc:740
//# BY KEN VINCENT
// PORT: SOURCE P51-P53.agc:741
//#
// PORT: SOURCE P51-P53.agc:742
//# FUNCTION
// PORT: SOURCE P51-P53.agc:743
//#	THIS PROGRAM READS THE IMU-CDUS AND COMPUTES THE VEHICLE ORIENTATION
// PORT: SOURCE P51-P53.agc:744
//#	WITH RESPECT TO INERTIAL SPACE.  IT THEN COMPUTES THE SHAFT AXIS (SAX)
// PORT: SOURCE P51-P53.agc:745
//#	WITH RESPECT TO REFERENCE INERTIAL.  EACH STAR IN THE CATALOG IS TESTED
// PORT: SOURCE P51-P53.agc:746
//# 	TO DETERMINE IF IT IS OCCULTED BY EITHER EARTH, SUN OR MOON.  IF A
// PORT: SOURCE P51-P53.agc:747
//# 	STAR IS NOT OCCULTED THEN IT IS PAIRED WITH ALL STARS OF LOWER INDEX.
// PORT: SOURCE P51-P53.agc:748
//# 	THE PAIRED STAR IS TESTED FOR OCCULTATION.  PAIRS OF STARS THAT PASS
// PORT: SOURCE P51-P53.agc:749
//#	THE OCCULTATION TESTS ARE TESTED FOR GOOD SEPARATION.  A PAIR OF STARS
// PORT: SOURCE P51-P53.agc:750
//#	HAVE GOOD SEPARATION IF THE ANGLE BETWEEN THEM IS LESS THAN 66 DEGREES
// PORT: SOURCE P51-P53.agc:751
//#	AND MORE THAN 40 DEGREES.  THOSE PAIRS WITH GOOD SEPARATION
// PORT: SOURCE P51-P53.agc:752
//#	ARE THEN TESTED TO SEE IF THEY LIE IN CURRENT FIELD OF VIEW.  (WITHIN
// PORT: SOURCE P51-P53.agc:753
//#	33 DEGREES OF SAX).  THE PAIR WITH MAX SEPARATION IS CHOSEN FROM
// PORT: SOURCE P51-P53.agc:754
//#	THOSE WITH GOOD SEPARATION, AND IN FIELD OF VIEW.
// PORT: SOURCE P51-P53.agc:755
//#
// PORT: SOURCE P51-P53.agc:756
//# CALLING SEQUENCE
// PORT: SOURCE P51-P53.agc:757
//#	L	TC	BANKCALL
// PORT: SOURCE P51-P53.agc:758
//#	L+1	CADR	PICAPAR
// PORT: SOURCE P51-P53.agc:759
//#	L+2	ERROR RETURN -- NO STARS IN FIELD OF VIEW
// PORT: SOURCE P51-P53.agc:760
//#	L+3	NORMAL RETURN
// PORT: SOURCE P51-P53.agc:761
//#
// PORT: SOURCE P51-P53.agc:762
//# OUTPUT
// PORT: SOURCE P51-P53.agc:763
//#	BESTI, BESTJ -- SINGLE PREC, INTEGERS, STAR NUMBERS TIMES 6
// PORT: SOURCE P51-P53.agc:764
//#	VFLAG -- FLAG BIT SET IMPLIES NO STARS IN FIELD OF VIEW
// PORT: SOURCE P51-P53.agc:765
//#
// PORT: SOURCE P51-P53.agc:766
//# INITIALIZATION
// PORT: SOURCE P51-P53.agc:767
//#	1)	A CALL TO LOCSAM MUST BE MADE
// PORT: SOURCE P51-P53.agc:768
//#	2)	VEARTH = -UNIT(R) WHERE R HAS BEEN UPDATED TO APPROXIMATE TIME OF
// PORT: SOURCE P51-P53.agc:769
//#		SIGHTINGS.
// PORT: SOURCE P51-P53.agc:770
//#
// PORT: SOURCE P51-P53.agc:771
//# DEBRIS
// PORT: SOURCE P51-P53.agc:772
//#	WORK AREA
// PORT: SOURCE P51-P53.agc:773
//#	X,Y,ZNB
// PORT: SOURCE P51-P53.agc:774
//#	SINCDU, COSCDU
// PORT: SOURCE P51-P53.agc:775
//#	STARAD -- STAR +5
// PORT: SOURCE P51-P53.agc:776
//
// PORT: SOURCE P51-P53.agc:777
//		COUNT	14/PICAP
// PORT: SOURCE P51-P53.agc:778
//
// PORT: SOURCE P51-P53.agc:779
//		SETLOC	P50S1
// PORT: SOURCE P51-P53.agc:780
//		BANK
// PORT: SOURCE P51-P53.agc:781
//PICAPAR		TC	MAKECADR
// PORT: Fixed ROM slots 14555.
        if slot <> 14555 or instruction <> 2505 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2505, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14556 {
// PORT: SOURCE P51-P53.agc:782
//		TS	QMIN
// PORT: Fixed ROM slots 14556.
            if slot <> 14556 or instruction <> 23551 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23551, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:783
//		TC	INTPRET
// PORT: Fixed ROM slots 14557.
            if slot <> 14557 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[804] to agcAotUnit804@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:784
//		CALL
// PORT: Fixed ROM slots 14558.
    14558, 65320,
// PORT: SOURCE P51-P53.agc:785
//			CDUTRIG
// PORT: Fixed ROM slots 14559.
    14559, 40574,
// PORT: SOURCE P51-P53.agc:786
//		CALL
// PORT: Fixed ROM slots 14560.
    14560, 65320,
// PORT: SOURCE P51-P53.agc:787
//			CALCSMSC
// PORT: Fixed ROM slots 14561.
    14561, 29460,
// PORT: SOURCE P51-P53.agc:788
//# Page 753
// PORT: SOURCE P51-P53.agc:789
//		SETPD
// PORT: Fixed ROM slots 14562.
    14562, 65282,
// PORT: SOURCE P51-P53.agc:790
//			0
// PORT: Fixed ROM slots 14563.
    14563, 2,
// PORT: SOURCE P51-P53.agc:791
//		SET	DLOAD		# VFLAG = 1
// PORT: Fixed ROM slots 14564.
    14564, 58648,
// PORT: SOURCE P51-P53.agc:792
//			VFLAG
// PORT: Fixed ROM slots 14565.
    14565, 1642,
// PORT: SOURCE P51-P53.agc:793
//			DPZERO
// PORT: Fixed ROM slots 14566.
    14566, 9964,
// PORT: SOURCE P51-P53.agc:794
//		STOVL	BESTI
// PORT: Fixed ROM slots 14567.
    14567, 20870,
// PORT: SOURCE P51-P53.agc:795
//			XNB
// PORT: Fixed ROM slots 14568.
    14568, 2968,
// PORT: SOURCE P51-P53.agc:796
//		VXSC	PDVL
// PORT: Fixed ROM slots 14569.
    14569, 52706,
// PORT: SOURCE P51-P53.agc:797
//			SIN33
// PORT: Fixed ROM slots 14570.
    14570, 25234,
// PORT: SOURCE P51-P53.agc:798
//			ZNB
// PORT: Fixed ROM slots 14571.
    14571, 2992,
// PORT: SOURCE P51-P53.agc:799
//		AXT,1	VXSC
// PORT: Fixed ROM slots 14572.
    14572, 61936,
// PORT: SOURCE P51-P53.agc:800
//			228D		# X1 = 37 X 6 + 6
// PORT: Fixed ROM slots 14573.
    14573, 456,
// PORT: SOURCE P51-P53.agc:801
//			COS33
// PORT: Fixed ROM slots 14574.
    14574, 25238,
// PORT: SOURCE P51-P53.agc:802
//		VAD
// PORT: Fixed ROM slots 14575.
    14575, 65370,
// PORT: SOURCE P51-P53.agc:803
//		VXM	UNIT
// PORT: Fixed ROM slots 14576.
    14576, 44682,
// PORT: SOURCE P51-P53.agc:804
//			REFSMMAT
// PORT: Fixed ROM slots 14577.
    14577, 1980,
// PORT: SOURCE P51-P53.agc:805
//		STORE	SAX		# SAX = SHAFT AXIS
// PORT: Fixed ROM slots 14578.
    14578, 3040,
// PORT: SOURCE P51-P53.agc:806
//		SSP	SSP		# S1 = S2 = 6
// PORT: Fixed ROM slots 14579.
    14579, 55730,
// PORT: SOURCE P51-P53.agc:807
//			S1
// PORT: Fixed ROM slots 14580.
    14580, 82,
// PORT: SOURCE P51-P53.agc:808
//			6
// PORT: Fixed ROM slots 14581.
    14581, 12,
// PORT: SOURCE P51-P53.agc:809
//			S2
// PORT: Fixed ROM slots 14582.
    14582, 84,
// PORT: SOURCE P51-P53.agc:810
//			6
// PORT: Fixed ROM slots 14583.
    14583, 12,
// PORT: SOURCE P51-P53.agc:811
//PIC1		TIX,1	GOTO		# MAJOR STAR
// PORT: Fixed ROM slots 14584.
    14584, 43136,
// PORT: SOURCE P51-P53.agc:812
//			PIC2
// PORT: Fixed ROM slots 14585.
    14585, 25078,
// PORT: SOURCE P51-P53.agc:813
//			PICEND
// PORT: Fixed ROM slots 14586.
    14586, 25252,
// PORT: SOURCE P51-P53.agc:814
//PIC2		VLOAD*	CALL
// PORT: Fixed ROM slots 14587.
    14587, 38134,
// PORT: SOURCE P51-P53.agc:815
//			CATLOG,1
// PORT: Fixed ROM slots 14588.
    14588, 26594,
// PORT: SOURCE P51-P53.agc:816
//			OCCULT
// PORT: Fixed ROM slots 14589.
    14589, 25196,
// PORT: SOURCE P51-P53.agc:817
//		BON	LXA,2
// PORT: Fixed ROM slots 14590.
    14590, 60440,
// PORT: SOURCE P51-P53.agc:818
//			CULTFLAG
// PORT: Fixed ROM slots 14591.
    14591, 1936,
// PORT: SOURCE P51-P53.agc:819
//			PIC1
// PORT: Fixed ROM slots 14592.
    14592, 25072,
// PORT: SOURCE P51-P53.agc:820
//			X1
// PORT: Fixed ROM slots 14593.
    14593, 76,
// PORT: SOURCE P51-P53.agc:821
//PIC3		TIX,2	GOTO
// PORT: Fixed ROM slots 14594.
    14594, 43144,
// PORT: SOURCE P51-P53.agc:822
//			PIC4
// PORT: Fixed ROM slots 14595.
    14595, 25098,
// PORT: SOURCE P51-P53.agc:823
//			PIC1
// PORT: Fixed ROM slots 14596.
    14596, 25072,
// PORT: SOURCE P51-P53.agc:824
//PIC4		VLOAD*	CALL
// PORT: Fixed ROM slots 14597.
    14597, 38134,
// PORT: SOURCE P51-P53.agc:825
//			CATLOG,2
// PORT: Fixed ROM slots 14598.
    14598, 38940,
// PORT: SOURCE P51-P53.agc:826
//			OCCULT
// PORT: Fixed ROM slots 14599.
    14599, 25196,
// PORT: SOURCE P51-P53.agc:827
//		BON	VLOAD*
// PORT: Fixed ROM slots 14600.
    14600, 64280,
// PORT: SOURCE P51-P53.agc:828
//			CULTFLAG
// PORT: Fixed ROM slots 14601.
    14601, 1936,
// PORT: SOURCE P51-P53.agc:829
//			PIC3
// PORT: Fixed ROM slots 14602.
    14602, 25092,
// PORT: SOURCE P51-P53.agc:830
//			CATLOG,1
// PORT: Fixed ROM slots 14603.
    14603, 26594,
// PORT: SOURCE P51-P53.agc:831
//		DOT*	DSU
// PORT: Fixed ROM slots 14604.
    14604, 38206,
// PORT: SOURCE P51-P53.agc:832
//			CATLOG,2
// PORT: Fixed ROM slots 14605.
    14605, 38940,
// PORT: SOURCE P51-P53.agc:833
//			CSS66		# SEPARATION LESS THAN 66 DEG.
// PORT: Fixed ROM slots 14606.
    14606, 25242,
// PORT: SOURCE P51-P53.agc:834
//		BMN	DAD
// PORT: Fixed ROM slots 14607.
    14607, 36160,
// PORT: SOURCE P51-P53.agc:835
//			PIC3
// PORT: Fixed ROM slots 14608.
    14608, 25092,
// PORT: SOURCE P51-P53.agc:836
//			CSS6640		# SEPARATION MORE THAN 40 DEG.
// PORT: Fixed ROM slots 14609.
    14609, 25246,
// PORT: SOURCE P51-P53.agc:837
//		BPL
// PORT: Fixed ROM slots 14610.
    14610, 65352,
// PORT: SOURCE P51-P53.agc:838
//			PIC3
// PORT: Fixed ROM slots 14611.
    14611, 25092,
// PORT: SOURCE P51-P53.agc:839
//# Page 754
// PORT: SOURCE P51-P53.agc:840
//		VLOAD*	DOT
// PORT: Fixed ROM slots 14612.
    14612, 41462,
// PORT: SOURCE P51-P53.agc:841
//			CATLOG,1
// PORT: Fixed ROM slots 14613.
    14613, 26594,
// PORT: SOURCE P51-P53.agc:842
//			SAX
// PORT: Fixed ROM slots 14614.
    14614, 3040,
// PORT: SOURCE P51-P53.agc:843
//		DSU	BMN		# MAJOR STAR IN CONE
// PORT: Fixed ROM slots 14615.
    14615, 41002,
// PORT: SOURCE P51-P53.agc:844
//			CSS33
// PORT: Fixed ROM slots 14616.
    14616, 25250,
// PORT: SOURCE P51-P53.agc:845
//			PIC1
// PORT: Fixed ROM slots 14617.
    14617, 25072,
// PORT: SOURCE P51-P53.agc:846
//		VLOAD*	DOT
// PORT: Fixed ROM slots 14618.
    14618, 41462,
// PORT: SOURCE P51-P53.agc:847
//			CATLOG,2
// PORT: Fixed ROM slots 14619.
    14619, 38940,
// PORT: SOURCE P51-P53.agc:848
//			SAX
// PORT: Fixed ROM slots 14620.
    14620, 3040,
// PORT: SOURCE P51-P53.agc:849
//		DSU	BPL
// PORT: Fixed ROM slots 14621.
    14621, 42026,
// PORT: SOURCE P51-P53.agc:850
//			CSS33
// PORT: Fixed ROM slots 14622.
    14622, 25250,
// PORT: SOURCE P51-P53.agc:851
//			STRATGY
// PORT: Fixed ROM slots 14623.
    14623, 25156,
// PORT: SOURCE P51-P53.agc:852
//		GOTO
// PORT: Fixed ROM slots 14624.
    14624, 65360,
// PORT: SOURCE P51-P53.agc:853
//			PIC3
// PORT: Fixed ROM slots 14625.
    14625, 25092,
// PORT: SOURCE P51-P53.agc:854
//STRATGY		BONCLR
// PORT: Fixed ROM slots 14626.
    14626, 65304,
// PORT: SOURCE P51-P53.agc:855
//			VFLAG
// PORT: Fixed ROM slots 14627.
    14627, 1802,
// PORT: SOURCE P51-P53.agc:856
//			NEWPAR
// PORT: Fixed ROM slots 14628.
    14628, 25186,
// PORT: SOURCE P51-P53.agc:857
//		XCHX,1	XCHX,2
// PORT: Fixed ROM slots 14629.
    14629, 54432,
// PORT: SOURCE P51-P53.agc:858
//			BESTI
// PORT: Fixed ROM slots 14630.
    14630, 388,
// PORT: SOURCE P51-P53.agc:859
//			BESTJ
// PORT: Fixed ROM slots 14631.
    14631, 390,
// PORT: SOURCE P51-P53.agc:860
//STRAT		VLOAD*	DOT*
// PORT: Fixed ROM slots 14632.
    14632, 40950,
// PORT: SOURCE P51-P53.agc:861
//			CATLOG,1
// PORT: Fixed ROM slots 14633.
    14633, 26594,
// PORT: SOURCE P51-P53.agc:862
//			CATLOG,2
// PORT: Fixed ROM slots 14634.
    14634, 38940,
// PORT: SOURCE P51-P53.agc:863
//		PUSH	BOFINV
// PORT: Fixed ROM slots 14635.
    14635, 35852,
// PORT: SOURCE P51-P53.agc:864
//			VFLAG
// PORT: Fixed ROM slots 14636.
    14636, 1738,
// PORT: SOURCE P51-P53.agc:865
//			STRAT -3
// PORT: Fixed ROM slots 14637.
    14637, 25162,
// PORT: SOURCE P51-P53.agc:866
//		DLOAD	DSU
// PORT: Fixed ROM slots 14638.
    14638, 38346,
// PORT: SOURCE P51-P53.agc:867
//		BPL
// PORT: Fixed ROM slots 14639.
    14639, 65352,
// PORT: SOURCE P51-P53.agc:868
//			PIC3
// PORT: Fixed ROM slots 14640.
    14640, 25092,
// PORT: SOURCE P51-P53.agc:869
//NEWPAR		SXA,1	SXA,2
// PORT: Fixed ROM slots 14641.
    14641, 56496,
// PORT: SOURCE P51-P53.agc:870
//			BESTI
// PORT: Fixed ROM slots 14642.
    14642, 388,
// PORT: SOURCE P51-P53.agc:871
//			BESTJ
// PORT: Fixed ROM slots 14643.
    14643, 390,
// PORT: SOURCE P51-P53.agc:872
//		GOTO
// PORT: Fixed ROM slots 14644.
    14644, 65360,
// PORT: SOURCE P51-P53.agc:873
//			PIC3
// PORT: Fixed ROM slots 14645.
    14645, 25092,
// PORT: SOURCE P51-P53.agc:874
//OCCULT		MXV	BVSU
// PORT: Fixed ROM slots 14646.
    14646, 42402,
// PORT: SOURCE P51-P53.agc:875
//			CULTRIX
// PORT: Fixed ROM slots 14647.
    14647, 3004,
// PORT: SOURCE P51-P53.agc:876
//			CSS
// PORT: Fixed ROM slots 14648.
    14648, 30,
// PORT: SOURCE P51-P53.agc:877
//		BZE
// PORT: Fixed ROM slots 14649.
    14649, 65368,
// PORT: SOURCE P51-P53.agc:878
//			CULTED
// PORT: Fixed ROM slots 14650.
    14650, 25226,
// PORT: SOURCE P51-P53.agc:879
//		BMN	SIGN
// PORT: Fixed ROM slots 14651.
    14651, 62784,
// PORT: SOURCE P51-P53.agc:880
//			CULTED
// PORT: Fixed ROM slots 14652.
    14652, 25226,
// PORT: SOURCE P51-P53.agc:881
//			MPAC +3
// PORT: Fixed ROM slots 14653.
    14653, 224,
// PORT: SOURCE P51-P53.agc:882
//		BMN	SIGN
// PORT: Fixed ROM slots 14654.
    14654, 62784,
// PORT: SOURCE P51-P53.agc:883
//			CULTED
// PORT: Fixed ROM slots 14655.
    14655, 25226,
// PORT: SOURCE P51-P53.agc:884
//			MPAC +5
// PORT: Fixed ROM slots 14656.
    14656, 228,
// PORT: SOURCE P51-P53.agc:885
//		BMN	CLRGO
// PORT: Fixed ROM slots 14657.
    14657, 35904,
// PORT: SOURCE P51-P53.agc:886
//			CULTED
// PORT: Fixed ROM slots 14658.
    14658, 25226,
// PORT: SOURCE P51-P53.agc:887
//			CULTFLAG
// PORT: Fixed ROM slots 14659.
    14659, 1840,
// PORT: SOURCE P51-P53.agc:888
//			QPRET
// PORT: Fixed ROM slots 14660.
    14660, 84,
// PORT: SOURCE P51-P53.agc:889
//CULTED		SETGO
// PORT: Fixed ROM slots 14661.
    14661, 65304,
// PORT: SOURCE P51-P53.agc:890
//# Page 755
// PORT: SOURCE P51-P53.agc:891
//			CULTFLAG
// PORT: Fixed ROM slots 14662.
    14662, 1584,
// PORT: SOURCE P51-P53.agc:892
//			QPRET
// PORT: Fixed ROM slots 14663.
    14663, 84,
// PORT: SOURCE P51-P53.agc:893
//CSS		= 	CEARTH
// PORT: SOURCE P51-P53.agc:894
//SIN33		2DEC	.5376381241
// PORT: Fixed ROM slots 14664 14665.
    14664, 17616, 14665, 21726,
// PORT: SOURCE P51-P53.agc:895
//
// PORT: SOURCE P51-P53.agc:896
//COS33		2DEC	.8431756920
// PORT: Fixed ROM slots 14666 14667.
    14666, 27628, 14667, 19350,
// PORT: SOURCE P51-P53.agc:897
//
// PORT: SOURCE P51-P53.agc:898
//CSS66		2DEC	.060480472	# (COS76)/4
// PORT: Fixed ROM slots 14668 14669.
    14668, 1980, 14669, 29886,
// PORT: SOURCE P51-P53.agc:899
//
// PORT: SOURCE P51-P53.agc:900
//CSS6640		2DEC	-.15602587	# (COS76 - COS30)/4
// PORT: Fixed ROM slots 14670 14671.
    14670, 60422, 14671, 54790,
// PORT: SOURCE P51-P53.agc:901
//
// PORT: SOURCE P51-P53.agc:902
//CSS33		2DEC	.197002688	# (COS(1/2(76))/4
// PORT: Fixed ROM slots 14672 14673.
    14672, 6454, 14673, 22676,
// PORT: SOURCE P51-P53.agc:903
//
// PORT: SOURCE P51-P53.agc:904
//PICEND		BOFF	EXIT
// PORT: Fixed ROM slots 14674.
    14674, 65048,
// PORT: SOURCE P51-P53.agc:905
//			VFLAG
// PORT: Fixed ROM slots 14675.
    14675, 1994,
// PORT: SOURCE P51-P53.agc:906
//			PICGXT
// PORT: Fixed ROM slots 14676.
    14676, 25260
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14677–14677.
function agcAotUnit805 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:907
//		TC	PICBXT
// PORT: Fixed ROM slots 14677.
    if slot <> 14677 or instruction <> 1368 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1368, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[805] to agcAotUnit805@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:908
//PICGXT		EXIT
// PORT: Fixed ROM slots 14678.
    14678, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14679–14681.
function agcAotUnit806 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14679 {
// PORT: SOURCE P51-P53.agc:909
//		INCR	QMIN
// PORT: Fixed ROM slots 14679.
        if slot <> 14679 or instruction <> 11263 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 1023).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14680 {
// PORT: SOURCE P51-P53.agc:910
//PICBXT		CA	QMIN
// PORT: Fixed ROM slots 14680.
            if slot <> 14680 or instruction <> 13311 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1023).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:911
//		TC	SWCALL
// PORT: Fixed ROM slots 14681.
            if slot <> 14681 or instruction <> 2486 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2486, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[806] to agcAotUnit806@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:912
//#V1		= 	12D
// PORT: SOURCE P51-P53.agc:913
//
// PORT: SOURCE P51-P53.agc:914
//# Page 756
// PORT: SOURCE P51-P53.agc:915
//# NAME -- R51	FINE ALIGN
// PORT: SOURCE P51-P53.agc:916
//# FUNCTION -- TO ALIGN THE STABLE MEMBER TO REFSSMAT
// PORT: SOURCE P51-P53.agc:917
//# CALLING SEQ -- CALL R51
// PORT: SOURCE P51-P53.agc:918
//# INPUT -- BESTI, BESTJ (PAIR OF STAR NO)
// PORT: SOURCE P51-P53.agc:919
//# OUTPUT -- GYRO TORQUE PULSES
// PORT: SOURCE P51-P53.agc:920
//# SUBROUTINES -- R52, R54, R55 (SXTNB, NBSM, AXISGEN)
// PORT: SOURCE P51-P53.agc:921
//
// PORT: SOURCE P51-P53.agc:922
//		COUNT	14/R51
// PORT: SOURCE P51-P53.agc:923
//
// PORT: SOURCE P51-P53.agc:924
//R51		EXIT
// PORT: Fixed ROM slots 14682.
    14682, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14683–14686.
function agcAotUnit807 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14684 {
        if slot <= 14683 {
// PORT: SOURCE P51-P53.agc:925
//		CAF	BIT1
// PORT: Fixed ROM slots 14683.
            if slot <> 14683 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:926
//		TS	STARIND
// PORT: Fixed ROM slots 14684.
            if slot <> 14684 or instruction <> 22724 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22724, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14685 {
// PORT: SOURCE P51-P53.agc:927
//		TS	MARKINDX
// PORT: Fixed ROM slots 14685.
            if slot <> 14685 or instruction <> 22721 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22721, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:928
//R51.2		TC	INTPRET
// PORT: Fixed ROM slots 14686.
            if slot <> 14686 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[807] to agcAotUnit807@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:929
//R51.3		CLEAR	CLEAR
// PORT: Fixed ROM slots 14687.
    14687, 35864,
// PORT: SOURCE P51-P53.agc:930
//			TARG2FLG
// PORT: Fixed ROM slots 14688.
    14688, 876,
// PORT: SOURCE P51-P53.agc:931
//			TARG1FLG
// PORT: Fixed ROM slots 14689.
    14689, 874,
// PORT: SOURCE P51-P53.agc:932
//		EXIT
// PORT: Fixed ROM slots 14690.
    14690, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14691–14691.
function agcAotUnit808 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:933
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14691.
    if slot <> 14691 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[808] to agcAotUnit808@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:934
//		OCT	05024		# RESTART GR 4 FOR R52-R53
// PORT: Fixed ROM slots 14692.
    14692, 5160,
// PORT: SOURCE P51-P53.agc:935
//		OCT	13000
// PORT: Fixed ROM slots 14693.
    14693, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14694–14694.
function agcAotUnit809 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:936
//		INDEX	STARIND
// PORT: Fixed ROM slots 14694.
    if slot <> 14694 or instruction <> 20676 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20676, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20676, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[809] to agcAotUnit809@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:937
//		CA	BESTI
// PORT: Fixed ROM slots 14695.
    14695, 24964
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14696–14700.
function agcAotUnit810 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14697 {
        if slot <= 14696 {
// PORT: SOURCE P51-P53.agc:938
//		EXTEND
// PORT: Fixed ROM slots 14696.
            if slot <> 14696 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:939
//		MP	1/6TH
// PORT: Fixed ROM slots 14697.
            if slot <> 14697 or instruction <> 30155 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 1483, readEffective:call(words, 1483)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14698 {
// PORT: SOURCE P51-P53.agc:940
//		TS	STARCODE
// PORT: Fixed ROM slots 14698.
            if slot <> 14698 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14699 {
// PORT: SOURCE P51-P53.agc:941
//R51DSP		CAF	V01N70
// PORT: Fixed ROM slots 14699.
                if slot <> 14699 or instruction <> 13770 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1482), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:942
//		TC	BANKCALL
// PORT: Fixed ROM slots 14700.
                if slot <> 14700 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[810] to agcAotUnit810@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:943
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 14701.
    14701, 17502
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14702–14711.
function agcAotUnit811 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14706 {
        if slot <= 14703 {
            if slot <= 14702 {
// PORT: SOURCE P51-P53.agc:944
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 14702.
                if slot <> 14702 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:945
//		TC	+5
// PORT: Fixed ROM slots 14703.
                if slot <> 14703 or instruction <> 1396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1396, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14704 {
// PORT: SOURCE P51-P53.agc:946
//		TC	-5
// PORT: Fixed ROM slots 14704.
                if slot <> 14704 or instruction <> 1387 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1387, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14705 {
// PORT: SOURCE P51-P53.agc:947
//		CAF	SIX
// PORT: Fixed ROM slots 14705.
                    if slot <> 14705 or instruction <> 15497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:948
//		TC	BLANKET
// PORT: Fixed ROM slots 14706.
                    if slot <> 14706 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14708 {
            if slot <= 14707 {
// PORT: SOURCE P51-P53.agc:949
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 14707.
                if slot <> 14707 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:950
//		TC	CHKSCODE
// PORT: Fixed ROM slots 14708.
                if slot <> 14708 or instruction <> 1782 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1782, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14709 {
// PORT: SOURCE P51-P53.agc:951
//		TC	FALTON
// PORT: Fixed ROM slots 14709.
                if slot <> 14709 or instruction <> 2304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14710 {
// PORT: SOURCE P51-P53.agc:952
//		TC	R51DSP
// PORT: Fixed ROM slots 14710.
                    if slot <> 14710 or instruction <> 1387 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1387, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:953
//		TC	INTPRET
// PORT: Fixed ROM slots 14711.
                    if slot <> 14711 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[811] to agcAotUnit811@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:954
//		RTB	CALL
// PORT: Fixed ROM slots 14712.
    14712, 37944,
// PORT: SOURCE P51-P53.agc:955
//			LOADTIME
// PORT: Fixed ROM slots 14713.
    14713, 38544,
// PORT: SOURCE P51-P53.agc:956
//			PLANET
// PORT: Fixed ROM slots 14714.
    14714, 27072,
// PORT: SOURCE P51-P53.agc:957
//		SSP	LXA,1
// PORT: Fixed ROM slots 14715.
    14715, 59570,
// PORT: SOURCE P51-P53.agc:958
//			S1
// PORT: Fixed ROM slots 14716.
    14716, 82,
// PORT: SOURCE P51-P53.agc:959
//			0
// PORT: Fixed ROM slots 14717.
    14717, 0,
// PORT: SOURCE P51-P53.agc:960
//			STARIND
// PORT: Fixed ROM slots 14718.
    14718, 392,
// PORT: SOURCE P51-P53.agc:961
//		TIX,1
// PORT: Fixed ROM slots 14719.
    14719, 65408,
// PORT: SOURCE P51-P53.agc:962
//			R51ST
// PORT: Fixed ROM slots 14720.
    14720, 25350,
// PORT: SOURCE P51-P53.agc:963
//		STCALL	STARSAV2	# 2ND STAR
// PORT: Fixed ROM slots 14721.
    14721, 31518,
// PORT: SOURCE P51-P53.agc:964
//			R51ST +1
// PORT: Fixed ROM slots 14722.
    14722, 25352,
// PORT: SOURCE P51-P53.agc:965
//R51ST		STORE	STARSAV1	# 1ST STAR
// PORT: Fixed ROM slots 14723.
    14723, 2834,
// PORT: SOURCE P51-P53.agc:966
//# Page 757
// PORT: SOURCE P51-P53.agc:967
//		EXIT
// PORT: Fixed ROM slots 14724.
    14724, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14725–14729.
function agcAotUnit812 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14726 {
        if slot <= 14725 {
// PORT: SOURCE P51-P53.agc:968
//		CS	MODREG		# IS THIS P54
// PORT: Fixed ROM slots 14725.
            if slot <> 14725 or instruction <> 16905 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 521).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:969
//		AD 	OCT66
// PORT: Fixed ROM slots 14726.
            if slot <> 14726 or instruction <> 26057 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1481), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14727 {
// PORT: SOURCE P51-P53.agc:970
//		EXTEND
// PORT: Fixed ROM slots 14727.
            if slot <> 14727 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14728 {
// PORT: SOURCE P51-P53.agc:971
//		BZF	R51B		# YES
// PORT: Fixed ROM slots 14728.
                if slot <> 14728 or instruction <> 5572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5572, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:972
//		TC	INTPRET
// PORT: Fixed ROM slots 14729.
                if slot <> 14729 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[812] to agcAotUnit812@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:973
//		CALL
// PORT: Fixed ROM slots 14730.
    14730, 65320,
// PORT: SOURCE P51-P53.agc:974
//			R52		# AOP WILL MAKE CALLS TO SIGHTING
// PORT: Fixed ROM slots 14731.
    14731, 24594,
// PORT: SOURCE P51-P53.agc:975
//R51A		CALL			# COMPUTE LOS IN SM FROM MARK DATA
// PORT: Fixed ROM slots 14732.
    14732, 65320,
// PORT: SOURCE P51-P53.agc:976
//			SXTSM
// PORT: Fixed ROM slots 14733.
    14733, 30756,
// PORT: SOURCE P51-P53.agc:977
//		STORE	STARSAV2
// PORT: Fixed ROM slots 14734.
    14734, 2846,
// PORT: SOURCE P51-P53.agc:978
//		EXIT
// PORT: Fixed ROM slots 14735.
    14735, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14736–14736.
function agcAotUnit813 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:979
//		TC	BANKCALL
// PORT: Fixed ROM slots 14736.
    if slot <> 14736 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[813] to agcAotUnit813@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:980
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 14737.
    14737, 14438
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14738–14738.
function agcAotUnit814 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:981
//		TC	INTPRET
// PORT: Fixed ROM slots 14738.
    if slot <> 14738 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[814] to agcAotUnit814@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:982
//		DLOAD	CALL
// PORT: Fixed ROM slots 14739.
    14739, 38090,
// PORT: SOURCE P51-P53.agc:983
//			TSIGHT
// PORT: Fixed ROM slots 14740.
    14740, 2830,
// PORT: SOURCE P51-P53.agc:984
//			PLANET
// PORT: Fixed ROM slots 14741.
    14741, 27072,
// PORT: SOURCE P51-P53.agc:985
//		EXIT
// PORT: Fixed ROM slots 14742.
    14742, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14743–14745.
function agcAotUnit815 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14743 {
// PORT: SOURCE P51-P53.agc:986
//		CCS	STARIND
// PORT: Fixed ROM slots 14743.
        if slot <> 14743 or instruction <> 4292 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 196).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14744 {
// PORT: SOURCE P51-P53.agc:987
//		TC	R51.4
// PORT: Fixed ROM slots 14744.
            if slot <> 14744 or instruction <> 1465 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1465, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:988
//		TC	INTPRET
// PORT: Fixed ROM slots 14745.
            if slot <> 14745 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[815] to agcAotUnit815@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:989
//		MXV	UNIT
// PORT: Fixed ROM slots 14746.
    14746, 44706,
// PORT: SOURCE P51-P53.agc:990
//			REFSMMAT
// PORT: Fixed ROM slots 14747.
    14747, 1980,
// PORT: SOURCE P51-P53.agc:991
//		STORE	STARAD
// PORT: Fixed ROM slots 14748.
    14748, 3004,
// PORT: SOURCE P51-P53.agc:992
//		VLOAD
// PORT: Fixed ROM slots 14749.
    14749, 65530,
// PORT: SOURCE P51-P53.agc:993
//			STARSAV2
// PORT: Fixed ROM slots 14750.
    14750, 2846,
// PORT: SOURCE P51-P53.agc:994
//		STOVL	6D
// PORT: Fixed ROM slots 14751.
    14751, 20494,
// PORT: SOURCE P51-P53.agc:995
//			STARSAV1
// PORT: Fixed ROM slots 14752.
    14752, 2834,
// PORT: SOURCE P51-P53.agc:996
//		STOVL	12D
// PORT: Fixed ROM slots 14753.
    14753, 20506,
// PORT: SOURCE P51-P53.agc:997
//			PLANVEC
// PORT: Fixed ROM slots 14754.
    14754, 2818,
// PORT: SOURCE P51-P53.agc:998
//		STCALL	STARAD +6
// PORT: Fixed ROM slots 14755.
    14755, 31688,
// PORT: SOURCE P51-P53.agc:999
//			R54		# STAR DATA TEST
// PORT: Fixed ROM slots 14756.
    14756, 25496,
// PORT: SOURCE P51-P53.agc:1000
//		BOFF	CALL
// PORT: Fixed ROM slots 14757.
    14757, 37912,
// PORT: SOURCE P51-P53.agc:1001
//			FREEFLAG
// PORT: Fixed ROM slots 14758.
    14758, 472,
// PORT: SOURCE P51-P53.agc:1002
//			R51K
// PORT: Fixed ROM slots 14759.
    14759, 25434,
// PORT: SOURCE P51-P53.agc:1003
//			AXISGEN
// PORT: Fixed ROM slots 14760.
    14760, 40450,
// PORT: SOURCE P51-P53.agc:1004
//		CALL
// PORT: Fixed ROM slots 14761.
    14761, 65320,
// PORT: SOURCE P51-P53.agc:1005
//			R55		# GYRO TORQUE
// PORT: Fixed ROM slots 14762.
    14762, 26994,
// PORT: SOURCE P51-P53.agc:1006
//		CLEAR
// PORT: Fixed ROM slots 14763.
    14763, 65304,
// PORT: SOURCE P51-P53.agc:1007
//			PFRATFLG
// PORT: Fixed ROM slots 14764.
    14764, 1398,
// PORT: SOURCE P51-P53.agc:1008
//R51K		EXIT
// PORT: Fixed ROM slots 14765.
    14765, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14766–14766.
function agcAotUnit816 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1009
//		CAF	OCT14
// PORT: Fixed ROM slots 14766.
    if slot <> 14766 or instruction <> 15353 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        local fixedOperand is mod(readEffective:call(words, 3065), 32768).
        set words[0] to agcSignExtend(fixedOperand).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[816] to agcAotUnit816@.

// PORT: Physical bank 14. Shared continuation entries, slots 14767–14767.
function agcAotUnit817 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1010
//		TC	BANKCALL
// PORT: Fixed ROM slots 14767.
    if slot <> 14767 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[817] to agcAotUnit817@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1011
//		CADR	GOPERF1
// PORT: Fixed ROM slots 14768.
    14768, 17482
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14769–14772.
function agcAotUnit818 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14770 {
        if slot <= 14769 {
// PORT: SOURCE P51-P53.agc:1012
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 14769.
            if slot <> 14769 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1013
//		TC	+2		# V33
// PORT: Fixed ROM slots 14770.
            if slot <> 14770 or instruction <> 1460 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1460, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14771 {
// PORT: SOURCE P51-P53.agc:1014
//		TC	+3
// PORT: Fixed ROM slots 14771.
            if slot <> 14771 or instruction <> 1462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1015
//		TC	BANKCALL
// PORT: Fixed ROM slots 14772.
            if slot <> 14772 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[818] to agcAotUnit818@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1016
//		CADR	P52C
// PORT: Fixed ROM slots 14773.
    14773, 26784
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14774–14774.
function agcAotUnit819 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1017
//# Page 758
// PORT: SOURCE P51-P53.agc:1018
//		TC	INTPRET
// PORT: Fixed ROM slots 14774.
    if slot <> 14774 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[819] to agcAotUnit819@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1019
//		GOTO
// PORT: Fixed ROM slots 14775.
    14775, 65360,
// PORT: SOURCE P51-P53.agc:1020
//			ENDP50S
// PORT: Fixed ROM slots 14776.
    14776, 26826
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14777–14777.
function agcAotUnit820 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1021
//R51.4		TC	INTPRET
// PORT: Fixed ROM slots 14777.
    if slot <> 14777 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[820] to agcAotUnit820@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1022
//		MXV	UNIT
// PORT: Fixed ROM slots 14778.
    14778, 44706,
// PORT: SOURCE P51-P53.agc:1023
//			REFSMMAT
// PORT: Fixed ROM slots 14779.
    14779, 1980,
// PORT: SOURCE P51-P53.agc:1024
//		STOVL	PLANVEC
// PORT: Fixed ROM slots 14780.
    14780, 23298,
// PORT: SOURCE P51-P53.agc:1025
//			STARSAV2
// PORT: Fixed ROM slots 14781.
    14781, 2846,
// PORT: SOURCE P51-P53.agc:1026
//		STORE	STARSAV1
// PORT: Fixed ROM slots 14782.
    14782, 2834,
// PORT: SOURCE P51-P53.agc:1027
//		SSP
// PORT: Fixed ROM slots 14783.
    14783, 65458,
// PORT: SOURCE P51-P53.agc:1028
//			STARIND
// PORT: Fixed ROM slots 14784.
    14784, 394,
// PORT: SOURCE P51-P53.agc:1029
//			0
// PORT: Fixed ROM slots 14785.
    14785, 0,
// PORT: SOURCE P51-P53.agc:1030
//		GOTO
// PORT: Fixed ROM slots 14786.
    14786, 65360,
// PORT: SOURCE P51-P53.agc:1031
//			R51.3
// PORT: Fixed ROM slots 14787.
    14787, 25278
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14788–14788.
function agcAotUnit821 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1032
//R51B		TC	INTPRET
// PORT: Fixed ROM slots 14788.
    if slot <> 14788 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[821] to agcAotUnit821@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1033
//		CALL
// PORT: Fixed ROM slots 14789.
    14789, 65320,
// PORT: SOURCE P51-P53.agc:1034
//			R56
// PORT: Fixed ROM slots 14790.
    14790, 30812,
// PORT: SOURCE P51-P53.agc:1035
//		GOTO
// PORT: Fixed ROM slots 14791.
    14791, 65360,
// PORT: SOURCE P51-P53.agc:1036
//			R51A
// PORT: Fixed ROM slots 14792.
    14792, 25368,
// PORT: SOURCE P51-P53.agc:1037
//OCT66		OCT	00066
// PORT: Fixed ROM slots 14793.
    14793, 108,
// PORT: SOURCE P51-P53.agc:1038
//V01N70		VN	0170
// PORT: Fixed ROM slots 14794.
    14794, 396,
// PORT: SOURCE P51-P53.agc:1039
//1/6TH		DEC	.1666667
// PORT: Fixed ROM slots 14795.
    14795, 5462,
// PORT: SOURCE P51-P53.agc:1040
//
// PORT: SOURCE P51-P53.agc:1041
//# Page 759
// PORT: SOURCE P51-P53.agc:1042
//# NAME:		R55	GYRO TORQUE
// PORT: SOURCE P51-P53.agc:1043
//# FUNCTION -- COMPUTE AND SEND GYRO PULSES
// PORT: SOURCE P51-P53.agc:1044
//# CALLING SEQ -- CALL R55
// PORT: SOURCE P51-P53.agc:1045
//# INPUT -- X,Y,ZDC -- REFSMMAT WRT PRESENT STABLE MEMBER
// PORT: SOURCE P51-P53.agc:1046
//# OUTPUT -- GYRO PULSES
// PORT: SOURCE P51-P53.agc:1047
//# SUBROUTINES -- CALCGTA, GOFLASH, GODSPR, IMUFINE, IMUPULSE, GOPERF1
// PORT: SOURCE P51-P53.agc:1048
//
// PORT: SOURCE P51-P53.agc:1049
//		SETLOC	P50S
// PORT: SOURCE P51-P53.agc:1050
//		BANK
// PORT: SOURCE P51-P53.agc:1051
//		COUNT*	$$/R55
// PORT: SOURCE P51-P53.agc:1052
//R55		STQ
// PORT: Fixed ROM slots 15545.
    15545, 65312,
// PORT: SOURCE P51-P53.agc:1053
//			QMIN
// PORT: Fixed ROM slots 15546.
    15546, 3070,
// PORT: SOURCE P51-P53.agc:1054
//		CALL
// PORT: Fixed ROM slots 15547.
    15547, 65320,
// PORT: SOURCE P51-P53.agc:1055
//			CALCGTA
// PORT: Fixed ROM slots 15548.
    15548, 40202,
// PORT: SOURCE P51-P53.agc:1056
//PULSEM		EXIT
// PORT: Fixed ROM slots 15549.
    15549, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15550–15551.
function agcAotUnit895 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15550 {
// PORT: SOURCE P51-P53.agc:1057
//R55.1		CAF	V06N93
// PORT: Fixed ROM slots 15550.
        if slot <> 15550 or instruction <> 13522 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1234), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1058
//		TC	BANKCALL
// PORT: Fixed ROM slots 15551.
        if slot <> 15551 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[895] to agcAotUnit895@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1059
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15552.
    15552, 17312
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15553–15556.
function agcAotUnit896 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15554 {
        if slot <= 15553 {
// PORT: SOURCE P51-P53.agc:1060
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15553.
            if slot <> 15553 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1061
//		TC	R55.2
// PORT: Fixed ROM slots 15554.
            if slot <> 15554 or instruction <> 1220 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1220, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15555 {
// PORT: SOURCE P51-P53.agc:1062
//		TC	R55RET
// PORT: Fixed ROM slots 15555.
            if slot <> 15555 or instruction <> 1231 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1231, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1063
//R55.2		TC	PHASCHNG
// PORT: Fixed ROM slots 15556.
            if slot <> 15556 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[896] to agcAotUnit896@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1064
//		OCT	00314
// PORT: Fixed ROM slots 15557.
    15557, 408
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15558–15559.
function agcAotUnit897 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15558 {
// PORT: SOURCE P51-P53.agc:1065
//		CA	R55CDR
// PORT: Fixed ROM slots 15558.
        if slot <> 15558 or instruction <> 13523 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1235), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1066
//		TC	BANKCALL
// PORT: Fixed ROM slots 15559.
        if slot <> 15559 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[897] to agcAotUnit897@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1067
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 15560.
    15560, 15628
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15561–15561.
function agcAotUnit898 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1068
//		TC	BANKCALL
// PORT: Fixed ROM slots 15561.
    if slot <> 15561 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[898] to agcAotUnit898@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1069
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 15562.
    15562, 16126
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15563–15564.
function agcAotUnit899 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15563 {
// PORT: SOURCE P51-P53.agc:1070
//		TC	CURTAINS
// PORT: Fixed ROM slots 15563.
        if slot <> 15563 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1071
//		TC	PHASCHNG
// PORT: Fixed ROM slots 15564.
        if slot <> 15564 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[899] to agcAotUnit899@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1072
//		OCT	05024
// PORT: Fixed ROM slots 15565.
    15565, 5160,
// PORT: SOURCE P51-P53.agc:1073
//		OCT	13000
// PORT: Fixed ROM slots 15566.
    15566, 11264
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15567–15567.
function agcAotUnit900 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1074
//R55RET		TC	INTPRET
// PORT: Fixed ROM slots 15567.
    if slot <> 15567 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[900] to agcAotUnit900@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1075
//		GOTO
// PORT: Fixed ROM slots 15568.
    15568, 65360,
// PORT: SOURCE P51-P53.agc:1076
//			QMIN
// PORT: Fixed ROM slots 15569.
    15569, 3070,
// PORT: SOURCE P51-P53.agc:1077
//V06N93		VN	0693
// PORT: Fixed ROM slots 15570.
    15570, 1722,
// PORT: SOURCE P51-P53.agc:1078
//R55CDR		ECADR	OGC
// PORT: Fixed ROM slots 15571.
    15571, 3038,
// PORT: SOURCE P51-P53.agc:1079
//R54		=	CHKSDATA
// PORT: SOURCE P51-P53.agc:1080
//
// PORT: SOURCE P51-P53.agc:1081
//# ROUTINE NAME -- CHKSDATA		DATE -- JAN 9, 1967
// PORT: SOURCE P51-P53.agc:1082
//# MOD NO -- 0				LOG SECTION -- P51-P53
// PORT: SOURCE P51-P53.agc:1083
//# MODIFICATION BY -- LONSKE		ASSEMBLY --
// PORT: SOURCE P51-P53.agc:1084
//#
// PORT: SOURCE P51-P53.agc:1085
//# FUNCTIONAL DESCRIPTION -- CHECKS THE VALIDITY OF A PAIR OF STAR SIGHTINGS.  WHEN A PAIR OF STAR SIGHTINGS ARE MADE
// PORT: SOURCE P51-P53.agc:1086
//# BY THE ASTRONAUT THIS ROUTINE OPERATES AND CHECKS THE OBSERVED SIGHTINGS AGAINST STORED STAR VECTORS IN THE
// PORT: SOURCE P51-P53.agc:1087
//# COMPUTER TO INSURE A PROPER SIGHTING WAS MADE.  THE FOLLOWING COMPUTATIONS ARE PERFORMED --
// PORT: SOURCE P51-P53.agc:1088
//#	OS1	=	OBSERVED STAR 1 VECTOR
// PORT: SOURCE P51-P53.agc:1089
//#	OS2	=	OBSERVED STAR 2 VECTOR
// PORT: SOURCE P51-P53.agc:1090
//#	SS1	=	STORED STAR 1 VECTOR
// PORT: SOURCE P51-P53.agc:1091
//#	SS2 	=	STORED STAR 2 VECTOR
// PORT: SOURCE P51-P53.agc:1092
//#	 A1	= 	ARCCOS(OS1 - OS2)
// PORT: SOURCE P51-P53.agc:1093
//# Page 760
// PORT: SOURCE P51-P53.agc:1094
//#	 A2	=	ARCCOS(SS1 - SS2)
// PORT: SOURCE P51-P53.agc:1095
//#	  A 	=	ABS(2(A1 - A2))
// PORT: SOURCE P51-P53.agc:1096
//
// PORT: SOURCE P51-P53.agc:1097
//# THE ANGULAR DIFFERENCE IS DISPLAYED FOR ASTRONAUT ACCEPTANCE.
// PORT: SOURCE P51-P53.agc:1098
//#
// PORT: SOURCE P51-P53.agc:1099
//# EXIT MODE --	1. FREEFLAG SET IMPLIES ASTRONAUT WANTS TO PROCEED
// PORT: SOURCE P51-P53.agc:1100
//#		2. FREEFLAG RESET IMPLIES ASTRONAUT WANTS TO RECYCLE
// PORT: SOURCE P51-P53.agc:1101
//#
// PORT: SOURCE P51-P53.agc:1102
//# OUTPUT --	1. VERB 6,NOUN 3 -- DISPLAYS ANGULAR DIFFERENCE BETWEEN 2 SETS OF STARS.
// PORT: SOURCE P51-P53.agc:1103
//#		2. STAR VECTORS FROM STAR CATALOG ARE LEFT IN 6D AND 12D.
// PORT: SOURCE P51-P53.agc:1104
//#
// PORT: SOURCE P51-P53.agc:1105
//# ERASABLE INITIALIZATION REQUIRED --
// PORT: SOURCE P51-P53.agc:1106
//#		1. MARK VECTORS ARE STORED IN STARAD AND STARAD +6.
// PORT: SOURCE P51-P53.agc:1107
//#		2. CATALOG VECTORS ARE STORED IN 6D AND 12D.
// PORT: SOURCE P51-P53.agc:1108
//#
// PORT: SOURCE P51-P53.agc:1109
//# DEBRIS --
// PORT: SOURCE P51-P53.agc:1110
//
// PORT: SOURCE P51-P53.agc:1111
//		SETLOC	P50S1
// PORT: SOURCE P51-P53.agc:1112
//		BANK
// PORT: SOURCE P51-P53.agc:1113
//		COUNT*	$$/R50
// PORT: SOURCE P51-P53.agc:1114
//CHKSDATA	STQ	SET
// PORT: Fixed ROM slots 14796.
    14796, 35872,
// PORT: SOURCE P51-P53.agc:1115
//			QMIN
// PORT: Fixed ROM slots 14797.
    14797, 3070,
// PORT: SOURCE P51-P53.agc:1116
//			FREEFLAG
// PORT: Fixed ROM slots 14798.
    14798, 120,
// PORT: SOURCE P51-P53.agc:1117
//CHKSAB		AXC,1			# SET X1 TO STORE EPHEMERIS DATA
// PORT: Fixed ROM slots 14799.
    14799, 65504,
// PORT: SOURCE P51-P53.agc:1118
//			STARAD
// PORT: Fixed ROM slots 14800.
    14800, 3002,
// PORT: SOURCE P51-P53.agc:1119
//
// PORT: SOURCE P51-P53.agc:1120
//CHKSB		VLOAD*	DOT*		# CAL. ANGLE THETA
// PORT: Fixed ROM slots 14801.
    14801, 40950,
// PORT: SOURCE P51-P53.agc:1121
//			0,1
// PORT: Fixed ROM slots 14802.
    14802, 2,
// PORT: SOURCE P51-P53.agc:1122
//			6,1
// PORT: Fixed ROM slots 14803.
    14803, 14,
// PORT: SOURCE P51-P53.agc:1123
//		SL1	ACOS
// PORT: Fixed ROM slots 14804.
    14804, 54996,
// PORT: SOURCE P51-P53.agc:1124
//		STORE	THETA
// PORT: Fixed ROM slots 14805.
    14805, 42,
// PORT: SOURCE P51-P53.agc:1125
//		BOFF	INVERT		# BRANCH TO CHKSD IF THIS IS 2ND PASS
// PORT: Fixed ROM slots 14806.
    14806, 35864,
// PORT: SOURCE P51-P53.agc:1126
//			FREEFLAG
// PORT: Fixed ROM slots 14807.
    14807, 472,
// PORT: SOURCE P51-P53.agc:1127
//			CHKSD
// PORT: Fixed ROM slots 14808.
    14808, 25536,
// PORT: SOURCE P51-P53.agc:1128
//			FREEFLAG	# CLEAR FREEFLAG
// PORT: Fixed ROM slots 14809.
    14809, 248,
// PORT: SOURCE P51-P53.agc:1129
//		AXC,1	DLOAD		# SET X1 TO MARK ANGLES
// PORT: Fixed ROM slots 14810.
    14810, 58848,
// PORT: SOURCE P51-P53.agc:1130
//			6D
// PORT: Fixed ROM slots 14811.
    14811, 12,
// PORT: SOURCE P51-P53.agc:1131
//			THETA
// PORT: Fixed ROM slots 14812.
    14812, 42,
// PORT: SOURCE P51-P53.agc:1132
//		STORE	18D
// PORT: Fixed ROM slots 14813.
    14813, 38,
// PORT: SOURCE P51-P53.agc:1133
//		GOTO
// PORT: Fixed ROM slots 14814.
    14814, 65360,
// PORT: SOURCE P51-P53.agc:1134
//			CHKSB		# RETURN TO CAL. 2ND ANGLE
// PORT: Fixed ROM slots 14815.
    14815, 25506,
// PORT: SOURCE P51-P53.agc:1135
//CHKSD		DLOAD	DSU
// PORT: Fixed ROM slots 14816.
    14816, 38346,
// PORT: SOURCE P51-P53.agc:1136
//			THETA		# COMPUTE POS DIFF
// PORT: Fixed ROM slots 14817.
    14817, 42,
// PORT: SOURCE P51-P53.agc:1137
//			18D
// PORT: Fixed ROM slots 14818.
    14818, 38,
// PORT: SOURCE P51-P53.agc:1138
//		ABS	RTB
// PORT: Fixed ROM slots 14819.
    14819, 40012,
// PORT: SOURCE P51-P53.agc:1139
//			SGNAGREE
// PORT: Fixed ROM slots 14820.
    14820, 38600,
// PORT: SOURCE P51-P53.agc:1140
//		STORE	NORMTEM1
// PORT: Fixed ROM slots 14821.
    14821, 1100,
// PORT: SOURCE P51-P53.agc:1141
//		SET	EXIT
// PORT: Fixed ROM slots 14822.
    14822, 65048,
// PORT: SOURCE P51-P53.agc:1142
//			FREEFLAG
// PORT: Fixed ROM slots 14823.
    14823, 120
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14824–14825.
function agcAotUnit822 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14824 {
// PORT: SOURCE P51-P53.agc:1143
//		CAF	ZERO
// PORT: Fixed ROM slots 14824.
        if slot <> 14824 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1144
//		TC	BANKCALL
// PORT: Fixed ROM slots 14825.
        if slot <> 14825 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[822] to agcAotUnit822@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1145
//		CADR	CLEANDSP
// PORT: Fixed ROM slots 14826.
    14826, 17286
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14827–14828.
function agcAotUnit823 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14827 {
// PORT: SOURCE P51-P53.agc:1146
//
// PORT: SOURCE P51-P53.agc:1147
//		CAF	VB6N5
// PORT: Fixed ROM slots 14827.
        if slot <> 14827 or instruction <> 13815 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1527), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1148
//# Page 761
// PORT: SOURCE P51-P53.agc:1149
//		TC	BANKCALL
// PORT: Fixed ROM slots 14828.
        if slot <> 14828 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[823] to agcAotUnit823@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1150
//		CADR	GOFLASH
// PORT: Fixed ROM slots 14829.
    14829, 17312
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14830–14832.
function agcAotUnit824 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14830 {
// PORT: SOURCE P51-P53.agc:1151
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 14830.
        if slot <> 14830 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14831 {
// PORT: SOURCE P51-P53.agc:1152
//		TC	CHKSDA		# PROCEED
// PORT: Fixed ROM slots 14831.
            if slot <> 14831 or instruction <> 1524 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1524, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1153
//		TC	INTPRET
// PORT: Fixed ROM slots 14832.
            if slot <> 14832 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[824] to agcAotUnit824@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1154
//		CLEAR	GOTO
// PORT: Fixed ROM slots 14833.
    14833, 43032,
// PORT: SOURCE P51-P53.agc:1155
//			FREEFLAG
// PORT: Fixed ROM slots 14834.
    14834, 376,
// PORT: SOURCE P51-P53.agc:1156
//			QMIN
// PORT: Fixed ROM slots 14835.
    14835, 3070
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14836–14836.
function agcAotUnit825 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1157
//CHKSDA		TC	INTPRET
// PORT: Fixed ROM slots 14836.
    if slot <> 14836 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[825] to agcAotUnit825@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1158
//		GOTO
// PORT: Fixed ROM slots 14837.
    14837, 65360,
// PORT: SOURCE P51-P53.agc:1159
//			QMIN
// PORT: Fixed ROM slots 14838.
    14838, 3070,
// PORT: SOURCE P51-P53.agc:1160
//VB6N5		VN	605
// PORT: Fixed ROM slots 14839.
    14839, 1546,
// PORT: SOURCE P51-P53.agc:1161
//
// PORT: SOURCE P51-P53.agc:1162
//# NAME -- CAL53A
// PORT: SOURCE P51-P53.agc:1163
//# FUNCTION -- COARSE ALIGN THE IMU, IF NECESSARY
// PORT: SOURCE P51-P53.agc:1164
//# CALLING SEQUENCE -- CALL CAL53A
// PORT: SOURCE P51-P53.agc:1165
//# INPUT -- PRESENT GIMBAL ANGLES -- CDUX, CDUY, CDUZ
// PORT: SOURCE P51-P53.agc:1166
//#	   DESIRED GIMBAL ANGLES -- THETAD,+1,+2
// PORT: SOURCE P51-P53.agc:1167
//# OUTPUT -- THE IMU COORDINATES AT STORED IN REFSMMAT
// PORT: SOURCE P51-P53.agc:1168
//# SUBROUTINES -- 1.IMUCOARS, 2.IMUSTALL, 3CURTAINS
// PORT: SOURCE P51-P53.agc:1169
//
// PORT: SOURCE P51-P53.agc:1170
//		COUNT	14/R50
// PORT: SOURCE P51-P53.agc:1171
//
// PORT: SOURCE P51-P53.agc:1172
//CAL53A		CALL
// PORT: Fixed ROM slots 14840.
    14840, 65320,
// PORT: SOURCE P51-P53.agc:1173
//			S52.2		# MAKE FINAL COMP OF GIMBAL ANGLES
// PORT: Fixed ROM slots 14841.
    14841, 18866,
// PORT: SOURCE P51-P53.agc:1174
//		RTB	SSP
// PORT: Fixed ROM slots 14842.
    14842, 55608,
// PORT: SOURCE P51-P53.agc:1175
//			RDCDUS		# READ CDUS
// PORT: Fixed ROM slots 14843.
    14843, 27048,
// PORT: SOURCE P51-P53.agc:1176
//			S1
// PORT: Fixed ROM slots 14844.
    14844, 82,
// PORT: SOURCE P51-P53.agc:1177
//			1
// PORT: Fixed ROM slots 14845.
    14845, 2,
// PORT: SOURCE P51-P53.agc:1178
//		AXT,1	SETPD
// PORT: Fixed ROM slots 14846.
    14846, 33264,
// PORT: SOURCE P51-P53.agc:1179
//			3
// PORT: Fixed ROM slots 14847.
    14847, 6,
// PORT: SOURCE P51-P53.agc:1180
//			4
// PORT: Fixed ROM slots 14848.
    14848, 10,
// PORT: SOURCE P51-P53.agc:1181
//CALOOP		DLOAD*	SR1
// PORT: Fixed ROM slots 14849.
    14849, 58054,
// PORT: SOURCE P51-P53.agc:1182
//			THETAD +3D,1
// PORT: Fixed ROM slots 14850.
    14850, 1250,
// PORT: SOURCE P51-P53.agc:1183
//		PDDL*	SR1
// PORT: Fixed ROM slots 14851.
    14851, 58022,
// PORT: SOURCE P51-P53.agc:1184
//			4,1
// PORT: Fixed ROM slots 14852.
    14852, 10,
// PORT: SOURCE P51-P53.agc:1185
//		DSU	ABS
// PORT: Fixed ROM slots 14853.
    14853, 42538,
// PORT: SOURCE P51-P53.agc:1186
//		PUSH	DSU
// PORT: Fixed ROM slots 14854.
    14854, 38156,
// PORT: SOURCE P51-P53.agc:1187
//			DEGREE1
// PORT: Fixed ROM slots 14855.
    14855, 25708,
// PORT: SOURCE P51-P53.agc:1188
//		BMN	DLOAD
// PORT: Fixed ROM slots 14856.
    14856, 58688,
// PORT: SOURCE P51-P53.agc:1189
//			CALOOP1
// PORT: Fixed ROM slots 14857.
    14857, 25668,
// PORT: SOURCE P51-P53.agc:1190
//		DSU	BPL
// PORT: Fixed ROM slots 14858.
    14858, 42026,
// PORT: SOURCE P51-P53.agc:1191
//			DEG359
// PORT: Fixed ROM slots 14859.
    14859, 25710,
// PORT: SOURCE P51-P53.agc:1192
//			CALOOP1
// PORT: Fixed ROM slots 14860.
    14860, 25668,
// PORT: SOURCE P51-P53.agc:1193
//COARFINE	EXIT
// PORT: Fixed ROM slots 14861.
    14861, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14862–14862.
function agcAotUnit826 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1194
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14862.
    if slot <> 14862 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[826] to agcAotUnit826@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1195
//		OCT	04024
// PORT: Fixed ROM slots 14863.
    14863, 4136
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14864–14864.
function agcAotUnit827 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1196
//		TC	BANKCALL
// PORT: Fixed ROM slots 14864.
    if slot <> 14864 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[827] to agcAotUnit827@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1197
//		CADR	IMUCOARS	# PERFORM COARSE ALIGNMENT
// PORT: Fixed ROM slots 14865.
    14865, 15206
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14866–14866.
function agcAotUnit828 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1198
//		TC	BANKCALL
// PORT: Fixed ROM slots 14866.
    if slot <> 14866 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[828] to agcAotUnit828@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1199
//		CADR	IMUSTALL	# REQUEST MODE SWITCH
// PORT: Fixed ROM slots 14867.
    14867, 16126
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14868–14869.
function agcAotUnit829 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14868 {
// PORT: SOURCE P51-P53.agc:1200
//# Page 762
// PORT: SOURCE P51-P53.agc:1201
//		TC	CURTAINS
// PORT: Fixed ROM slots 14868.
        if slot <> 14868 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1202
//		TC	BANKCALL
// PORT: Fixed ROM slots 14869.
        if slot <> 14869 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[829] to agcAotUnit829@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1203
//		CADR	IMUFIN20
// PORT: Fixed ROM slots 14870.
    14870, 15478
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14871–14871.
function agcAotUnit830 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1204
//		TC	BANKCALL
// PORT: Fixed ROM slots 14871.
    if slot <> 14871 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[830] to agcAotUnit830@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1205
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 14872.
    14872, 16126
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14873–14874.
function agcAotUnit831 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14873 {
// PORT: SOURCE P51-P53.agc:1206
//		TC	CURTAINS	# TEST FOR MALFUNCTION
// PORT: Fixed ROM slots 14873.
        if slot <> 14873 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1207
//		TC	INTPRET
// PORT: Fixed ROM slots 14874.
        if slot <> 14874 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[831] to agcAotUnit831@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1208
//		RTB	VLOAD
// PORT: Fixed ROM slots 14875.
    14875, 64824,
// PORT: SOURCE P51-P53.agc:1209
//			SET1/PDT
// PORT: Fixed ROM slots 14876.
    14876, 25978,
// PORT: SOURCE P51-P53.agc:1210
//			ZEROVEC
// PORT: Fixed ROM slots 14877.
    14877, 9964,
// PORT: SOURCE P51-P53.agc:1211
//		STORE	GCOMP
// PORT: Fixed ROM slots 14878.
    14878, 1652,
// PORT: SOURCE P51-P53.agc:1212
//		SET	GOTO
// PORT: Fixed ROM slots 14879.
    14879, 43032,
// PORT: SOURCE P51-P53.agc:1213
//			DRIFTFLG
// PORT: Fixed ROM slots 14880.
    14880, 1120,
// PORT: SOURCE P51-P53.agc:1214
//			FINEONLY
// PORT: Fixed ROM slots 14881.
    14881, 25672,
// PORT: SOURCE P51-P53.agc:1215
//CALOOP1		TIX,1
// PORT: Fixed ROM slots 14882.
    14882, 65408,
// PORT: SOURCE P51-P53.agc:1216
//			CALOOP
// PORT: Fixed ROM slots 14883.
    14883, 25602,
// PORT: SOURCE P51-P53.agc:1217
//FINEONLY	AXC,1	AXC,2
// PORT: Fixed ROM slots 14884.
    14884, 62688,
// PORT: SOURCE P51-P53.agc:1218
//			XSM
// PORT: Fixed ROM slots 14885.
    14885, 2930,
// PORT: SOURCE P51-P53.agc:1219
//			REFSMMAT
// PORT: Fixed ROM slots 14886.
    14886, 1978,
// PORT: SOURCE P51-P53.agc:1220
//		CALL
// PORT: Fixed ROM slots 14887.
    14887, 65320,
// PORT: SOURCE P51-P53.agc:1221
//			MATMOVE
// PORT: Fixed ROM slots 14888.
    14888, 25686,
// PORT: SOURCE P51-P53.agc:1222
//		GOTO
// PORT: Fixed ROM slots 14889.
    14889, 65360,
// PORT: SOURCE P51-P53.agc:1223
//			CAL53RET
// PORT: Fixed ROM slots 14890.
    14890, 26780,
// PORT: SOURCE P51-P53.agc:1224
//MATMOVE		VLOAD*			# TRANSFER MATRIX
// PORT: Fixed ROM slots 14891.
    14891, 65526,
// PORT: SOURCE P51-P53.agc:1225
//			0,1
// PORT: Fixed ROM slots 14892.
    14892, 2,
// PORT: SOURCE P51-P53.agc:1226
//		STORE	0,2
// PORT: Fixed ROM slots 14893.
    14893, 8194,
// PORT: SOURCE P51-P53.agc:1227
//		VLOAD*
// PORT: Fixed ROM slots 14894.
    14894, 65526,
// PORT: SOURCE P51-P53.agc:1228
//			6D,1
// PORT: Fixed ROM slots 14895.
    14895, 14,
// PORT: SOURCE P51-P53.agc:1229
//		STORE	6D,2
// PORT: Fixed ROM slots 14896.
    14896, 8206,
// PORT: SOURCE P51-P53.agc:1230
//		VLOAD*
// PORT: Fixed ROM slots 14897.
    14897, 65526,
// PORT: SOURCE P51-P53.agc:1231
//			12D,1
// PORT: Fixed ROM slots 14898.
    14898, 26,
// PORT: SOURCE P51-P53.agc:1232
//		STORE	12D,2
// PORT: Fixed ROM slots 14899.
    14899, 8218,
// PORT: SOURCE P51-P53.agc:1233
//		RVQ
// PORT: Fixed ROM slots 14900.
    14900, 65308,
// PORT: SOURCE P51-P53.agc:1234
//DEGREE1		DEC	46
// PORT: Fixed ROM slots 14901.
    14901, 92,
// PORT: SOURCE P51-P53.agc:1235
//DEG359		DEC	16338
// PORT: Fixed ROM slots 14902.
    14902, 32676
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15572–15574.
function agcAotUnit901 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15572 {
// PORT: SOURCE P51-P53.agc:1236
//		SETLOC	P50S
// PORT: SOURCE P51-P53.agc:1237
//		BANK
// PORT: SOURCE P51-P53.agc:1238
//RDCDUS		INHINT			# READ CDUS
// PORT: Fixed ROM slots 15572.
        if slot <> 15572 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15573 {
// PORT: SOURCE P51-P53.agc:1239
//		CA	CDUX
// PORT: Fixed ROM slots 15573.
            if slot <> 15573 or instruction <> 12314 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 26).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1240
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 15574.
            if slot <> 15574 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[901] to agcAotUnit901@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1241
//		TS	1
// PORT: Fixed ROM slots 15575.
    15575, 45058
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15576–15577.
function agcAotUnit902 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15576 {
// PORT: SOURCE P51-P53.agc:1242
//		CA	CDUY
// PORT: Fixed ROM slots 15576.
        if slot <> 15576 or instruction <> 12315 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 27).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1243
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 15577.
        if slot <> 15577 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[902] to agcAotUnit902@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1244
//		TS	2
// PORT: Fixed ROM slots 15578.
    15578, 45060
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15579–15580.
function agcAotUnit903 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15579 {
// PORT: SOURCE P51-P53.agc:1245
//		CA	CDUZ
// PORT: Fixed ROM slots 15579.
        if slot <> 15579 or instruction <> 12316 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 28).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1246
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 15580.
        if slot <> 15580 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[903] to agcAotUnit903@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1247
//		TS	3
// PORT: Fixed ROM slots 15581.
    15581, 45062
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15582–15583.
function agcAotUnit904 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15582 {
// PORT: SOURCE P51-P53.agc:1248
//		RELINT
// PORT: Fixed ROM slots 15582.
        if slot <> 15582 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1249
//		TC	DANZIG
// PORT: Fixed ROM slots 15583.
        if slot <> 15583 or instruction <> 3096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3096, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[904] to agcAotUnit904@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1250
//
// PORT: SOURCE P51-P53.agc:1251
//# Page 763
// PORT: SOURCE P51-P53.agc:1252
//# NAME:		GIMB
// PORT: SOURCE P51-P53.agc:1253
//#
// PORT: SOURCE P51-P53.agc:1254
//# FUNCTION:	DETERMINE AND COMPUTE THE DESIRED GIMBAL ANGLES TO BE USED FOR COARSE ALIGNMENT.
// PORT: SOURCE P51-P53.agc:1255
//#
// PORT: SOURCE P51-P53.agc:1256
//# CALLING SEQUENCE:  CALL GIMB
// PORT: SOURCE P51-P53.agc:1257
//#
// PORT: SOURCE P51-P53.agc:1258
//# INPUT:	DESIRED IMU INERTIAL ORIENTATION VECTORS:  XSMD, YSMD, ZSMD
// PORT: SOURCE P51-P53.agc:1259
//#
// PORT: SOURCE P51-P53.agc:1260
//# OUTPUT:	GIMBAL ANGLES LEFT IN THETAD, +1, +2
// PORT: SOURCE P51-P53.agc:1261
//#
// PORT: SOURCE P51-P53.agc:1262
//# SUBROUTINES USED:  1.CDUTRIG 2.CALCSMSC 3.CALCGA
// PORT: SOURCE P51-P53.agc:1263
//
// PORT: SOURCE P51-P53.agc:1264
//		SETLOC	P50S2
// PORT: SOURCE P51-P53.agc:1265
//		BANK
// PORT: SOURCE P51-P53.agc:1266
//		COUNT	14/INFLT
// PORT: SOURCE P51-P53.agc:1267
//
// PORT: SOURCE P51-P53.agc:1268
//CALCSMSC	DLOAD	DMP
// PORT: Fixed ROM slots 16778.
    16778, 34250,
// PORT: SOURCE P51-P53.agc:1269
//			SINCDUY
// PORT: Fixed ROM slots 16779.
    16779, 958,
// PORT: SOURCE P51-P53.agc:1270
//			COSCDUZ
// PORT: Fixed ROM slots 16780.
    16780, 974,
// PORT: SOURCE P51-P53.agc:1271
//		DCOMP
// PORT: Fixed ROM slots 16781.
    16781, 65404,
// PORT: SOURCE P51-P53.agc:1272
//		PDDL	SR1
// PORT: Fixed ROM slots 16782.
    16782, 58026,
// PORT: SOURCE P51-P53.agc:1273
//			SINCDUZ
// PORT: Fixed ROM slots 16783.
    16783, 962,
// PORT: SOURCE P51-P53.agc:1274
//		PDDL	DMP
// PORT: Fixed ROM slots 16784.
    16784, 34218,
// PORT: SOURCE P51-P53.agc:1275
//			COSCDUY
// PORT: Fixed ROM slots 16785.
    16785, 970,
// PORT: SOURCE P51-P53.agc:1276
//			COSCDUZ
// PORT: Fixed ROM slots 16786.
    16786, 974,
// PORT: SOURCE P51-P53.agc:1277
//		VDEF	VSL1
// PORT: Fixed ROM slots 16787.
    16787, 64108,
// PORT: SOURCE P51-P53.agc:1278
//		STORE	XNB
// PORT: Fixed ROM slots 16788.
    16788, 2968,
// PORT: SOURCE P51-P53.agc:1279
//		DLOAD	DMP
// PORT: Fixed ROM slots 16789.
    16789, 34250,
// PORT: SOURCE P51-P53.agc:1280
//			SINCDUX
// PORT: Fixed ROM slots 16790.
    16790, 966,
// PORT: SOURCE P51-P53.agc:1281
//			SINCDUZ
// PORT: Fixed ROM slots 16791.
    16791, 962,
// PORT: SOURCE P51-P53.agc:1282
//		SL1
// PORT: Fixed ROM slots 16792.
    16792, 65492,
// PORT: SOURCE P51-P53.agc:1283
//		STORE	26D
// PORT: Fixed ROM slots 16793.
    16793, 54,
// PORT: SOURCE P51-P53.agc:1284
//		DMP
// PORT: Fixed ROM slots 16794.
    16794, 65290,
// PORT: SOURCE P51-P53.agc:1285
//			SINCDUY
// PORT: Fixed ROM slots 16795.
    16795, 958,
// PORT: SOURCE P51-P53.agc:1286
//		PDDL	DMP
// PORT: Fixed ROM slots 16796.
    16796, 34218,
// PORT: SOURCE P51-P53.agc:1287
//			COSCDUX
// PORT: Fixed ROM slots 16797.
    16797, 978,
// PORT: SOURCE P51-P53.agc:1288
//			COSCDUY
// PORT: Fixed ROM slots 16798.
    16798, 970,
// PORT: SOURCE P51-P53.agc:1289
//		DSU
// PORT: Fixed ROM slots 16799.
    16799, 65322,
// PORT: SOURCE P51-P53.agc:1290
//		PDDL	DMP
// PORT: Fixed ROM slots 16800.
    16800, 34218,
// PORT: SOURCE P51-P53.agc:1291
//			SINCDUX
// PORT: Fixed ROM slots 16801.
    16801, 966,
// PORT: SOURCE P51-P53.agc:1292
//			COSCDUZ
// PORT: Fixed ROM slots 16802.
    16802, 974,
// PORT: SOURCE P51-P53.agc:1293
//		DCOMP
// PORT: Fixed ROM slots 16803.
    16803, 65404,
// PORT: SOURCE P51-P53.agc:1294
//		PDDL	DMP
// PORT: Fixed ROM slots 16804.
    16804, 34218,
// PORT: SOURCE P51-P53.agc:1295
//			COSCDUX
// PORT: Fixed ROM slots 16805.
    16805, 978,
// PORT: SOURCE P51-P53.agc:1296
//			SINCDUY
// PORT: Fixed ROM slots 16806.
    16806, 958,
// PORT: SOURCE P51-P53.agc:1297
//		PDDL	DMP
// PORT: Fixed ROM slots 16807.
    16807, 34218,
// PORT: SOURCE P51-P53.agc:1298
//			COSCDUY
// PORT: Fixed ROM slots 16808.
    16808, 970,
// PORT: SOURCE P51-P53.agc:1299
//			26D
// PORT: Fixed ROM slots 16809.
    16809, 54,
// PORT: SOURCE P51-P53.agc:1300
//		DAD	VDEF
// PORT: Fixed ROM slots 16810.
    16810, 46618,
// PORT: SOURCE P51-P53.agc:1301
//		VSL1
// PORT: Fixed ROM slots 16811.
    16811, 65524,
// PORT: SOURCE P51-P53.agc:1302
//		STORE	ZNB
// PORT: Fixed ROM slots 16812.
    16812, 2992,
// PORT: SOURCE P51-P53.agc:1303
//		VXV	VSL1
// PORT: Fixed ROM slots 16813.
    16813, 64058,
// PORT: SOURCE P51-P53.agc:1304
//			XNB
// PORT: Fixed ROM slots 16814.
    16814, 2968,
// PORT: SOURCE P51-P53.agc:1305
//		STORE	YNB
// PORT: Fixed ROM slots 16815.
    16815, 2980,
// PORT: SOURCE P51-P53.agc:1306
//		RVQ
// PORT: Fixed ROM slots 16816.
    16816, 65308
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14903–14907.
function agcAotUnit832 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14904 {
        if slot <= 14903 {
// PORT: SOURCE P51-P53.agc:1307
//
// PORT: SOURCE P51-P53.agc:1308
//# NAME -- P51 -- IMU ORIENTATION DETERMINATION
// PORT: SOURCE P51-P53.agc:1309
//# MOD. NO. 2	21 DEC 66				LOG SECTION -- P51-P53
// PORT: SOURCE P51-P53.agc:1310
//# Page 764
// PORT: SOURCE P51-P53.agc:1311
//# MOD BY STURLAUGSON					ASSEMBLY SUNDISK REV15
// PORT: SOURCE P51-P53.agc:1312
//#
// PORT: SOURCE P51-P53.agc:1313
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P51-P53.agc:1314
//#	DETERMINES THE INERTIAL ORIENTATION OF THE IMU.  THE PROGRAM IS SELECTED BY DSKY ENTRY.  THE SIGHTING
// PORT: SOURCE P51-P53.agc:1315
//#	ROUTINE IS CALLED TO COLLECT THE CDU COUNTERS AND SHAFT AND TRUNNION ANGLES FOR A SIGHTED STAR.  THE DATA IS
// PORT: SOURCE P51-P53.agc:1316
//#	THEN PROCESSED AS FOLLOWS.
// PORT: SOURCE P51-P53.agc:1317
//#
// PORT: SOURCE P51-P53.agc:1318
//#	1.  SEXTANT ANGLES ARE COMPUTED IN TERMS OF NAVIGATIONAL BASE COORDINATES.  LET SA AND TA BE THE SHAFT AND
// PORT: SOURCE P51-P53.agc:1319
//#	TRUNNION ANGLES, RESPECTIVELY.  THEN,
// PORT: SOURCE P51-P53.agc:1320
//#	_
// PORT: SOURCE P51-P53.agc:1321
//#	V  = (SIN(TA)*COS(SA), SIN(TA)*SIN(SA), COS(TA))	(A COLUMN VECTOR)
// PORT: SOURCE P51-P53.agc:1322
//#        NB
// PORT: SOURCE P51-P53.agc:1323
//#	THE OUTPUT IS A HALF-UNIT VECTOR STORED IN STARM.
// PORT: SOURCE P51-P53.agc:1324
//#
// PORT: SOURCE P51-P53.agc:1325
//#	2.  THIS VECTOR IN NAV. BASE COORDS. IS THEN TRANSFORMED TO ONE IN STABLE MEMBER COORDINATES.
// PORT: SOURCE P51-P53.agc:1326
//#	_    T  T  T _
// PORT: SOURCE P51-P53.agc:1327
//#	V = Q *Q *Q *V  ,	WHERE
// PORT: SOURCE P51-P53.agc:1328
//#	     1  2  3  NB
// PORT: SOURCE P51-P53.agc:1329
//#
// PORT: SOURCE P51-P53.agc:1330
//#	     ( COS(IG)	 0    -SIN(IG) )
// PORT: SOURCE P51-P53.agc:1331
//#	     (			       )					THE GIMBAL ANGLES ARE COMPUTED FROM
// PORT: SOURCE P51-P53.agc:1332
//#	Q  = (   0	 1  	 0     ), IG= INNER GIMBAL ANGLE		THE CDU COUNTERS AT NBSM (USING AXIS-
// PORT: SOURCE P51-P53.agc:1333
//#	 1   (			       )					ROT AND CDULOGIC)
// PORT: SOURCE P51-P53.agc:1334
//#	     ( SIN(IG)	 0     COS(IG) )
// PORT: SOURCE P51-P53.agc:1335
//#
// PORT: SOURCE P51-P53.agc:1336
//#	     ( COS(MG) SIN(MG)   0     )
// PORT: SOURCE P51-P53.agc:1337
//#	     (			       )
// PORT: SOURCE P51-P53.agc:1338
//#	Q  = (-SIN(MG) COS(MG)   0     ), MG= MIDDLE GIMBAL ANGLE
// PORT: SOURCE P51-P53.agc:1339
//#	 2   (                         )
// PORT: SOURCE P51-P53.agc:1340
//#	     (   0       0       1     )
// PORT: SOURCE P51-P53.agc:1341
//#
// PORT: SOURCE P51-P53.agc:1342
//#	     (   1       0       0     )
// PORT: SOURCE P51-P53.agc:1343
//#	     (                         )
// PORT: SOURCE P51-P53.agc:1344
//#	Q  = (   0     COS(OG) SIN(OG) ), OG= OUTER GIMBAL ANGLE
// PORT: SOURCE P51-P53.agc:1345
//#	 3   (                         )
// PORT: SOURCE P51-P53.agc:1346
//#	     (   0    -SIN(OG) COS(OG) )
// PORT: SOURCE P51-P53.agc:1347
//#
// PORT: SOURCE P51-P53.agc:1348
//#	3.  THE STAR NUMBER IS SAVED AND THE SECOND STAR IS THEN SIMILARLY PROCESSED.
// PORT: SOURCE P51-P53.agc:1349
//#
// PORT: SOURCE P51-P53.agc:1350
//#	4.  THE ANGLE BETWEEN THE TWO STARS IS THEN CHECKED AT CKSDATA.
// PORT: SOURCE P51-P53.agc:1351
//#
// PORT: SOURCE P51-P53.agc:1352
//#	5.  REFSMMAT IS THEN COMPUTED AT AXISGEN AS FOLLOWS.
// PORT: SOURCE P51-P53.agc:1353
//#		    _      _
// PORT: SOURCE P51-P53.agc:1354
//#		LET S  AND S  BE TWO STAR VECTORS EXPRESSED IN TWO COORDINATE SYSTEMS, A AND B (BASIC AND STABLE MEMBER).
// PORT: SOURCE P51-P53.agc:1355
//#		     1      2
// PORT: SOURCE P51-P53.agc:1356
//# Page 765
// PORT: SOURCE P51-P53.agc:1357
//#		DEFINE,
// PORT: SOURCE P51-P53.agc:1358
//#		_    _
// PORT: SOURCE P51-P53.agc:1359
//#		U  = S
// PORT: SOURCE P51-P53.agc:1360
//#		 A    A1
// PORT: SOURCE P51-P53.agc:1361
//#		_         _    _
// PORT: SOURCE P51-P53.agc:1362
//#		V  = UNIT(S  x S  )
// PORT: SOURCE P51-P53.agc:1363
//#		 A         A1   A2
// PORT: SOURCE P51-P53.agc:1364
//#		_    _   _
// PORT: SOURCE P51-P53.agc:1365
//#		W  = U x V
// PORT: SOURCE P51-P53.agc:1366
//#		 A    A   A
// PORT: SOURCE P51-P53.agc:1367
//#
// PORT: SOURCE P51-P53.agc:1368
//#		AND,
// PORT: SOURCE P51-P53.agc:1369
//#		_    _
// PORT: SOURCE P51-P53.agc:1370
//#		U  = S
// PORT: SOURCE P51-P53.agc:1371
//#		 B    B1
// PORT: SOURCE P51-P53.agc:1372
//#		_         _    _
// PORT: SOURCE P51-P53.agc:1373
//#		V  = UNIT(S  x S  )
// PORT: SOURCE P51-P53.agc:1374
//#		 B         B1   B2
// PORT: SOURCE P51-P53.agc:1375
//#		_    _   _
// PORT: SOURCE P51-P53.agc:1376
//#		W  = U x V
// PORT: SOURCE P51-P53.agc:1377
//#		 B    B   B
// PORT: SOURCE P51-P53.agc:1378
//#
// PORT: SOURCE P51-P53.agc:1379
//#		THEN
// PORT: SOURCE P51-P53.agc:1380
//#		_        _       _       _
// PORT: SOURCE P51-P53.agc:1381
//#		X  = U  *U + V  *V + W  *W
// PORT: SOURCE P51-P53.agc:1382
//#		      B1  A   B1  A   B1  A
// PORT: SOURCE P51-P53.agc:1383
//#		_        _       _       _
// PORT: SOURCE P51-P53.agc:1384
//#		Y  = U  *U + V  *V + W  *W		(REFSMMAT)
// PORT: SOURCE P51-P53.agc:1385
//#		      B2  A   B2  A   B2  A
// PORT: SOURCE P51-P53.agc:1386
//#		_        _       _       _
// PORT: SOURCE P51-P53.agc:1387
//#		Z  = U  *U + V  *V + W  *W
// PORT: SOURCE P51-P53.agc:1388
//#		      B3  A   B3  A   B3  A
// PORT: SOURCE P51-P53.agc:1389
//#
// PORT: SOURCE P51-P53.agc:1390
//# THE INPUTS CONSIST OF THE FOUR HALF-UNIT VECTORS STORED AS FOLLOWS
// PORT: SOURCE P51-P53.agc:1391
//#		_
// PORT: SOURCE P51-P53.agc:1392
//#		S   IN 6-11 OF THE VAC AREA
// PORT: SOURCE P51-P53.agc:1393
//#		 A1
// PORT: SOURCE P51-P53.agc:1394
//#		_
// PORT: SOURCE P51-P53.agc:1395
//#		S   IN 12-17 OF THE VAC AREA
// PORT: SOURCE P51-P53.agc:1396
//#		 A2
// PORT: SOURCE P51-P53.agc:1397
//#		_
// PORT: SOURCE P51-P53.agc:1398
//#		S   IN STARAD
// PORT: SOURCE P51-P53.agc:1399
//#		 B1
// PORT: SOURCE P51-P53.agc:1400
//# Page 766	_
// PORT: SOURCE P51-P53.agc:1401
//#		S   IN STARAD +6
// PORT: SOURCE P51-P53.agc:1402
//#		 B2
// PORT: SOURCE P51-P53.agc:1403
//#
// PORT: SOURCE P51-P53.agc:1404
//# CALLING SEQUENCE:
// PORT: SOURCE P51-P53.agc:1405
//#
// PORT: SOURCE P51-P53.agc:1406
//#	THE PROGRAM IS CALLED BY THE ASTRONAUT BY DSKY ENTRY.
// PORT: SOURCE P51-P53.agc:1407
//#
// PORT: SOURCE P51-P53.agc:1408
//# SUBROUTINES CALLED:
// PORT: SOURCE P51-P53.agc:1409
//#
// PORT: SOURCE P51-P53.agc:1410
//#	GOPERF3
// PORT: SOURCE P51-P53.agc:1411
//#	GOPERF1R
// PORT: SOURCE P51-P53.agc:1412
//#	GODSPR
// PORT: SOURCE P51-P53.agc:1413
//#	IMUCOARS
// PORT: SOURCE P51-P53.agc:1414
//#	IMUFIN20
// PORT: SOURCE P51-P53.agc:1415
//#	R53
// PORT: SOURCE P51-P53.agc:1416
//#	SXTNB
// PORT: SOURCE P51-P53.agc:1417
//#	NBSM
// PORT: SOURCE P51-P53.agc:1418
//#	MKRELEAS
// PORT: SOURCE P51-P53.agc:1419
//#	CHKSDATA
// PORT: SOURCE P51-P53.agc:1420
//#	MATMOVE
// PORT: SOURCE P51-P53.agc:1421
//#
// PORT: SOURCE P51-P53.agc:1422
//# ALARMS
// PORT: SOURCE P51-P53.agc:1423
//#
// PORT: SOURCE P51-P53.agc:1424
//#	NONE
// PORT: SOURCE P51-P53.agc:1425
//#
// PORT: SOURCE P51-P53.agc:1426
//# ERASABLE INITIALIZATION:
// PORT: SOURCE P51-P53.agc:1427
//#
// PORT: SOURCE P51-P53.agc:1428
//#	IMU ZERO FLAG SHOULD BE SET.
// PORT: SOURCE P51-P53.agc:1429
//#
// PORT: SOURCE P51-P53.agc:1430
//# OUTPUT
// PORT: SOURCE P51-P53.agc:1431
//#
// PORT: SOURCE P51-P53.agc:1432
//#	REFSMMAT
// PORT: SOURCE P51-P53.agc:1433
//#	REFSMFLG
// PORT: SOURCE P51-P53.agc:1434
//#
// PORT: SOURCE P51-P53.agc:1435
//# DEBRIS
// PORT: SOURCE P51-P53.agc:1436
//#
// PORT: SOURCE P51-P53.agc:1437
//#	WORK AREA
// PORT: SOURCE P51-P53.agc:1438
//#	STARAD
// PORT: SOURCE P51-P53.agc:1439
//#	STARIND
// PORT: SOURCE P51-P53.agc:1440
//#	BESTI
// PORT: SOURCE P51-P53.agc:1441
//#	BESTJ
// PORT: SOURCE P51-P53.agc:1442
//
// PORT: SOURCE P51-P53.agc:1443
//		SETLOC	P50S1
// PORT: SOURCE P51-P53.agc:1444
//		BANK
// PORT: SOURCE P51-P53.agc:1445
//		COUNT	14/P5153
// PORT: SOURCE P51-P53.agc:1446
//
// PORT: SOURCE P51-P53.agc:1447
//P53		EQUALS	P51
// PORT: SOURCE P51-P53.agc:1448
//P51		CS	IMODES30
// PORT: Fixed ROM slots 14903.
            if slot <> 14903 or instruction <> 17104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 720).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1449
//		MASK	BIT9
// PORT: Fixed ROM slots 14904.
            if slot <> 14904 or instruction <> 31239 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                if fixedOperand = 256 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14905 {
// PORT: SOURCE P51-P53.agc:1450
//		CCS	A
// PORT: Fixed ROM slots 14905.
            if slot <> 14905 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14906 {
// PORT: SOURCE P51-P53.agc:1451
//# Page 767
// PORT: SOURCE P51-P53.agc:1452
//		TC	P51A
// PORT: Fixed ROM slots 14906.
                if slot <> 14906 or instruction <> 1598 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1598, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1453
//		TC	ALARM
// PORT: Fixed ROM slots 14907.
                if slot <> 14907 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[832] to agcAotUnit832@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1454
//		OCT	210
// PORT: Fixed ROM slots 14908.
    14908, 272
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14909–14910.
function agcAotUnit833 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14909 {
// PORT: SOURCE P51-P53.agc:1455
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 14909.
        if slot <> 14909 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1456
//P51A		TC	BANKCALL
// PORT: Fixed ROM slots 14910.
        if slot <> 14910 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[833] to agcAotUnit833@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1457
//		CADR	R02ZERO
// PORT: Fixed ROM slots 14911.
    14911, 16238
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14912–14913.
function agcAotUnit834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14912 {
// PORT: SOURCE P51-P53.agc:1458
//
// PORT: SOURCE P51-P53.agc:1459
//P51AA		CAF	PRFMSTAQ
// PORT: Fixed ROM slots 14912.
        if slot <> 14912 or instruction <> 14869 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1460
//		TC	BANKCALL
// PORT: Fixed ROM slots 14913.
        if slot <> 14913 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[834] to agcAotUnit834@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1461
//		CADR	GOPERF1
// PORT: Fixed ROM slots 14914.
    14914, 17482
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14915–14917.
function agcAotUnit835 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14915 {
// PORT: SOURCE P51-P53.agc:1462
//		TC	GOTOPOOH	# TERM.
// PORT: Fixed ROM slots 14915.
        if slot <> 14915 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14916 {
// PORT: SOURCE P51-P53.agc:1463
//		TC	P51B		# V33
// PORT: Fixed ROM slots 14916.
            if slot <> 14916 or instruction <> 1632 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1632, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1464
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14917.
            if slot <> 14917 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[835] to agcAotUnit835@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1465
//		OCT	05024
// PORT: Fixed ROM slots 14918.
    14918, 5160,
// PORT: SOURCE P51-P53.agc:1466
//		OCT	13000
// PORT: Fixed ROM slots 14919.
    14919, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14920–14925.
function agcAotUnit836 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14922 {
        if slot <= 14920 {
// PORT: SOURCE P51-P53.agc:1467
//		CAF	P51ZERO
// PORT: Fixed ROM slots 14920.
            if slot <> 14920 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14921 {
// PORT: SOURCE P51-P53.agc:1468
//		TS	THETAD		# ZERO THE GIMBALS
// PORT: Fixed ROM slots 14921.
                if slot <> 14921 or instruction <> 23149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23149, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1469
//		TS	THETAD +1
// PORT: Fixed ROM slots 14922.
                if slot <> 14922 or instruction <> 23150 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23150, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 14923 {
// PORT: SOURCE P51-P53.agc:1470
//		TS	THETAD +2
// PORT: Fixed ROM slots 14923.
            if slot <> 14923 or instruction <> 23151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23151, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14924 {
// PORT: SOURCE P51-P53.agc:1471
//		CAF	V6N22
// PORT: Fixed ROM slots 14924.
                if slot <> 14924 or instruction <> 14011 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1723), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1472
//		TC	BANKCALL
// PORT: Fixed ROM slots 14925.
                if slot <> 14925 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[836] to agcAotUnit836@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1473
//		CADR	GODSPRET
// PORT: Fixed ROM slots 14926.
    14926, 17270
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14927–14928.
function agcAotUnit837 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14927 {
// PORT: SOURCE P51-P53.agc:1474
//		CAF	V41K		# NOW DISPLAY COARSE ALIGN VERB 41
// PORT: Fixed ROM slots 14927.
        if slot <> 14927 or instruction <> 14012 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1724), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1475
//		TC	BANKCALL
// PORT: Fixed ROM slots 14928.
        if slot <> 14928 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[837] to agcAotUnit837@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1476
//		CADR	GODSPRET
// PORT: Fixed ROM slots 14929.
    14929, 17270
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14930–14930.
function agcAotUnit838 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1477
//		TC	BANKCALL
// PORT: Fixed ROM slots 14930.
    if slot <> 14930 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[838] to agcAotUnit838@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1478
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 14931.
    14931, 15206
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14932–14932.
function agcAotUnit839 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1479
//		TC	BANKCALL
// PORT: Fixed ROM slots 14932.
    if slot <> 14932 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[839] to agcAotUnit839@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1480
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 14933.
    14933, 16126
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14934–14935.
function agcAotUnit840 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14934 {
// PORT: SOURCE P51-P53.agc:1481
//		TC	CURTAINS	# CAGING OR BAD END
// PORT: Fixed ROM slots 14934.
        if slot <> 14934 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1482
//		TC	BANKCALL	# SCHEDULE IFAILOK AND IMUFINED TASKS, IN 5
// PORT: Fixed ROM slots 14935.
        if slot <> 14935 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[840] to agcAotUnit840@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1483
//		CADR	IMUFIN20	# AND 20 SECS. DIRECT RETURN AND NO STALL,
// PORT: Fixed ROM slots 14936.
    14936, 15478
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14937–14937.
function agcAotUnit841 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1484
//		TC	BANKCALL	# IF CAGING, BUT T4 WILL ZERO C/A ENABLE.
// PORT: Fixed ROM slots 14937.
    if slot <> 14937 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[841] to agcAotUnit841@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1485
//		CADR	IMUSTALL	# IF PUT TO SLEEP, IMUFINED WILL WAKE US
// PORT: Fixed ROM slots 14938.
    14938, 16126
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14939–14940.
function agcAotUnit842 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14939 {
// PORT: SOURCE P51-P53.agc:1486
//		TC	CURTAINS	# UP.
// PORT: Fixed ROM slots 14939.
        if slot <> 14939 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1487
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14940.
        if slot <> 14940 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[842] to agcAotUnit842@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1488
//		OCT	05024
// PORT: Fixed ROM slots 14941.
    14941, 5160,
// PORT: SOURCE P51-P53.agc:1489
//		OCT	13000
// PORT: Fixed ROM slots 14942.
    14942, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14943–14944.
function agcAotUnit843 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14943 {
// PORT: SOURCE P51-P53.agc:1490
//		TCF	P51AA		# COARSE ALIGN DONE:  RECYCLE FOR FINE
// PORT: Fixed ROM slots 14943.
        if slot <> 14943 or instruction <> 5696 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5696, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1491
//
// PORT: SOURCE P51-P53.agc:1492
//# Page 768
// PORT: SOURCE P51-P53.agc:1493
//# DO STAR SIGHTING AND COMPUTE NEW REFSMMAT
// PORT: SOURCE P51-P53.agc:1494
//P51B		TC	PHASCHNG
// PORT: Fixed ROM slots 14944.
        if slot <> 14944 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[843] to agcAotUnit843@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1495
//		OCT	00014
// PORT: Fixed ROM slots 14945.
    14945, 24
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14946–14946.
function agcAotUnit844 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1496
//		TC	INTPRET
// PORT: Fixed ROM slots 14946.
    if slot <> 14946 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[844] to agcAotUnit844@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1497
//		SSP	SETPD
// PORT: Fixed ROM slots 14947.
    14947, 33202,
// PORT: SOURCE P51-P53.agc:1498
//			STARIND		# INDEX -- STAR 1 OR 2
// PORT: Fixed ROM slots 14948.
    14948, 394,
// PORT: SOURCE P51-P53.agc:1499
//			0
// PORT: Fixed ROM slots 14949.
    14949, 0,
// PORT: SOURCE P51-P53.agc:1500
//			0
// PORT: Fixed ROM slots 14950.
    14950, 2,
// PORT: SOURCE P51-P53.agc:1501
//		RTB	VLOAD
// PORT: Fixed ROM slots 14951.
    14951, 64824,
// PORT: SOURCE P51-P53.agc:1502
//			SET1/PDT
// PORT: Fixed ROM slots 14952.
    14952, 25978,
// PORT: SOURCE P51-P53.agc:1503
//			ZEROVEC
// PORT: Fixed ROM slots 14953.
    14953, 9964,
// PORT: SOURCE P51-P53.agc:1504
//		STORE	GCOMP
// PORT: Fixed ROM slots 14954.
    14954, 1652,
// PORT: SOURCE P51-P53.agc:1505
//		SET	CLEAR
// PORT: Fixed ROM slots 14955.
    14955, 35864,
// PORT: SOURCE P51-P53.agc:1506
//			DRIFTFLG	# ENABLE T4 COMPENSATION
// PORT: Fixed ROM slots 14956.
    14956, 1120,
// PORT: SOURCE P51-P53.agc:1507
//			TARG2FLG	# SHOW MARK IS STAR --- NOT LANDMARK
// PORT: Fixed ROM slots 14957.
    14957, 876,
// PORT: SOURCE P51-P53.agc:1508
//		EXIT
// PORT: Fixed ROM slots 14958.
    14958, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14959–14961.
function agcAotUnit845 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14959 {
// PORT: SOURCE P51-P53.agc:1509
//		CAF	BIT1
// PORT: Fixed ROM slots 14959.
        if slot <> 14959 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14960 {
// PORT: SOURCE P51-P53.agc:1510
//		TS	MARKINDX	# INITIALIZE FOR ONE MARK
// PORT: Fixed ROM slots 14960.
            if slot <> 14960 or instruction <> 22721 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22721, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1511
//
// PORT: SOURCE P51-P53.agc:1512
//P51C		TC	PHASCHNG
// PORT: Fixed ROM slots 14961.
            if slot <> 14961 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[845] to agcAotUnit845@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1513
//		OCT	05024
// PORT: Fixed ROM slots 14962.
    14962, 5160,
// PORT: SOURCE P51-P53.agc:1514
//		OCT	13000
// PORT: Fixed ROM slots 14963.
    14963, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14964–14964.
function agcAotUnit846 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1515
//		TC	CHECKMM
// PORT: Fixed ROM slots 14964.
    if slot <> 14964 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[846] to agcAotUnit846@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1516
//		MM	53		# BACKUP PROGRAM
// PORT: Fixed ROM slots 14965.
    14965, 106
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14966–14967.
function agcAotUnit847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14966 {
// PORT: SOURCE P51-P53.agc:1517
//		TCF	P51C.1		# NOT P53
// PORT: Fixed ROM slots 14966.
        if slot <> 14966 or instruction <> 5756 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5756, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1518
//		TC	INTPRET
// PORT: Fixed ROM slots 14967.
        if slot <> 14967 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[847] to agcAotUnit847@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1519
//		CALL
// PORT: Fixed ROM slots 14968.
    14968, 65320,
// PORT: SOURCE P51-P53.agc:1520
//			R56
// PORT: Fixed ROM slots 14969.
    14969, 30812,
// PORT: SOURCE P51-P53.agc:1521
//		GOTO
// PORT: Fixed ROM slots 14970.
    14970, 65360,
// PORT: SOURCE P51-P53.agc:1522
//			P51C.2
// PORT: Fixed ROM slots 14971.
    14971, 25854
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14972–14972.
function agcAotUnit848 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1523
//P51C.1		TC	INTPRET
// PORT: Fixed ROM slots 14972.
    if slot <> 14972 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[848] to agcAotUnit848@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1524
//		CALL
// PORT: Fixed ROM slots 14973.
    14973, 65320,
// PORT: SOURCE P51-P53.agc:1525
//			R53		# SIGHTING ROUTINE
// PORT: Fixed ROM slots 14974.
    14974, 25984,
// PORT: SOURCE P51-P53.agc:1526
//P51C.2		CALL			# COMPUTE LOS IN SM FROM MARK DATA
// PORT: Fixed ROM slots 14975.
    14975, 65320,
// PORT: SOURCE P51-P53.agc:1527
//			SXTSM
// PORT: Fixed ROM slots 14976.
    14976, 30756,
// PORT: SOURCE P51-P53.agc:1528
//		PUSH
// PORT: Fixed ROM slots 14977.
    14977, 65292,
// PORT: SOURCE P51-P53.agc:1529
//		SLOAD	BZE
// PORT: Fixed ROM slots 14978.
    14978, 44218,
// PORT: SOURCE P51-P53.agc:1530
//			STARIND
// PORT: Fixed ROM slots 14979.
    14979, 394,
// PORT: SOURCE P51-P53.agc:1531
//			P51D
// PORT: Fixed ROM slots 14980.
    14980, 25874,
// PORT: SOURCE P51-P53.agc:1532
//		VLOAD	STADR
// PORT: Fixed ROM slots 14981.
    14981, 38650,
// PORT: SOURCE P51-P53.agc:1533
//		STORE	STARSAV2	# DOWNLINK
// PORT: Fixed ROM slots 14982.
    14982, 62688,
// PORT: SOURCE P51-P53.agc:1534
//		GOTO
// PORT: Fixed ROM slots 14983.
    14983, 65360,
// PORT: SOURCE P51-P53.agc:1535
//			P51E
// PORT: Fixed ROM slots 14984.
    14984, 25886,
// PORT: SOURCE P51-P53.agc:1536
//P51D		VLOAD	STADR
// PORT: Fixed ROM slots 14985.
    14985, 38650,
// PORT: SOURCE P51-P53.agc:1537
//		STODL	STARSAV1
// PORT: Fixed ROM slots 14986.
    14986, 50412,
// PORT: SOURCE P51-P53.agc:1538
//			TSIGHT
// PORT: Fixed ROM slots 14987.
    14987, 2830,
// PORT: SOURCE P51-P53.agc:1539
//		CALL
// PORT: Fixed ROM slots 14988.
    14988, 65320,
// PORT: SOURCE P51-P53.agc:1540
//			PLANET
// PORT: Fixed ROM slots 14989.
    14989, 27072,
// PORT: SOURCE P51-P53.agc:1541
//		STORE	PLANVEC
// PORT: Fixed ROM slots 14990.
    14990, 2818,
// PORT: SOURCE P51-P53.agc:1542
//# Page 769
// PORT: SOURCE P51-P53.agc:1543
//P51E		EXIT
// PORT: Fixed ROM slots 14991.
    14991, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14992–14992.
function agcAotUnit849 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1544
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14992.
    if slot <> 14992 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[849] to agcAotUnit849@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1545
//		OCT	05024
// PORT: Fixed ROM slots 14993.
    14993, 5160,
// PORT: SOURCE P51-P53.agc:1546
//		OCT	13000
// PORT: Fixed ROM slots 14994.
    14994, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14995–14995.
function agcAotUnit850 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1547
//		TC	BANKCALL
// PORT: Fixed ROM slots 14995.
    if slot <> 14995 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[850] to agcAotUnit850@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1548
//		CADR	MKRELEAS	# ZERO MARKSTAT
// PORT: Fixed ROM slots 14996.
    14996, 14438
)).

// PORT: Physical bank 14. Shared continuation entries, slots 14997–14999.
function agcAotUnit851 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14997 {
// PORT: SOURCE P51-P53.agc:1549
//		CCS	STARIND
// PORT: Fixed ROM slots 14997.
        if slot <> 14997 or instruction <> 4292 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 196).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14998 {
// PORT: SOURCE P51-P53.agc:1550
//		TCF	P51F		# STAR 2
// PORT: Fixed ROM slots 14998.
            if slot <> 14998 or instruction <> 5789 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5789, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1551
//		TC	PHASCHNG
// PORT: Fixed ROM slots 14999.
            if slot <> 14999 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[851] to agcAotUnit851@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1552
//		OCT	05024
// PORT: Fixed ROM slots 15000.
    15000, 5160,
// PORT: SOURCE P51-P53.agc:1553
//		OCT	13000
// PORT: Fixed ROM slots 15001.
    15001, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15002–15005.
function agcAotUnit852 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15003 {
        if slot <= 15002 {
// PORT: SOURCE P51-P53.agc:1554
//		CAF	BIT1
// PORT: Fixed ROM slots 15002.
            if slot <> 15002 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1555
//		TS	STARIND
// PORT: Fixed ROM slots 15003.
            if slot <> 15003 or instruction <> 22724 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22724, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15004 {
// PORT: SOURCE P51-P53.agc:1556
//		TCF	P51C		# GO DO SECOND STAR
// PORT: Fixed ROM slots 15004.
            if slot <> 15004 or instruction <> 5745 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5745, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1557
//P51F		TC	PHASCHNG
// PORT: Fixed ROM slots 15005.
            if slot <> 15005 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[852] to agcAotUnit852@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1558
//		OCT	05024
// PORT: Fixed ROM slots 15006.
    15006, 5160,
// PORT: SOURCE P51-P53.agc:1559
//		OCT	13000
// PORT: Fixed ROM slots 15007.
    15007, 11264
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15008–15008.
function agcAotUnit853 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1560
//		TC	INTPRET
// PORT: Fixed ROM slots 15008.
    if slot <> 15008 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[853] to agcAotUnit853@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1561
//		DLOAD	CALL
// PORT: Fixed ROM slots 15009.
    15009, 38090,
// PORT: SOURCE P51-P53.agc:1562
//			TSIGHT
// PORT: Fixed ROM slots 15010.
    15010, 2830,
// PORT: SOURCE P51-P53.agc:1563
//			PLANET
// PORT: Fixed ROM slots 15011.
    15011, 27072,
// PORT: SOURCE P51-P53.agc:1564
//		STOVL	12D
// PORT: Fixed ROM slots 15012.
    15012, 20506,
// PORT: SOURCE P51-P53.agc:1565
//			PLANVEC
// PORT: Fixed ROM slots 15013.
    15013, 2818,
// PORT: SOURCE P51-P53.agc:1566
//		STOVL	6D
// PORT: Fixed ROM slots 15014.
    15014, 20494,
// PORT: SOURCE P51-P53.agc:1567
//			STARSAV1
// PORT: Fixed ROM slots 15015.
    15015, 2834,
// PORT: SOURCE P51-P53.agc:1568
//		STOVL	STARAD
// PORT: Fixed ROM slots 15016.
    15016, 23484,
// PORT: SOURCE P51-P53.agc:1569
//			STARSAV2
// PORT: Fixed ROM slots 15017.
    15017, 2846,
// PORT: SOURCE P51-P53.agc:1570
//		STCALL	STARAD +6
// PORT: Fixed ROM slots 15018.
    15018, 31688,
// PORT: SOURCE P51-P53.agc:1571
//			CHKSDATA	# CHECK STAR ANGLES IN STARAD AND
// PORT: Fixed ROM slots 15019.
    15019, 25496,
// PORT: SOURCE P51-P53.agc:1572
//		BON	EXIT
// PORT: Fixed ROM slots 15020.
    15020, 65048,
// PORT: SOURCE P51-P53.agc:1573
//			FREEFLAG
// PORT: Fixed ROM slots 15021.
    15021, 408,
// PORT: SOURCE P51-P53.agc:1574
//			P51G
// PORT: Fixed ROM slots 15022.
    15022, 25952
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15023–15023.
function agcAotUnit854 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1575
//		TC	P51AA
// PORT: Fixed ROM slots 15023.
    if slot <> 15023 or instruction <> 1600 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1600, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[854] to agcAotUnit854@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1576
//P51G		CALL
// PORT: Fixed ROM slots 15024.
    15024, 65320,
// PORT: SOURCE P51-P53.agc:1577
//			AXISGEN		# COME BACK WITH REFSMMAT IN XDC
// PORT: Fixed ROM slots 15025.
    15025, 40450,
// PORT: SOURCE P51-P53.agc:1578
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 15026.
    15026, 62688,
// PORT: SOURCE P51-P53.agc:1579
//			XDC
// PORT: Fixed ROM slots 15027.
    15027, 2966,
// PORT: SOURCE P51-P53.agc:1580
//			REFSMMAT
// PORT: Fixed ROM slots 15028.
    15028, 1978,
// PORT: SOURCE P51-P53.agc:1581
//		CLEAR	CALL
// PORT: Fixed ROM slots 15029.
    15029, 37912,
// PORT: SOURCE P51-P53.agc:1582
//			REFSMFLG
// PORT: Fixed ROM slots 15030.
    15030, 1892,
// PORT: SOURCE P51-P53.agc:1583
//			MATMOVE
// PORT: Fixed ROM slots 15031.
    15031, 25686,
// PORT: SOURCE P51-P53.agc:1584
//		SET	GOTO
// PORT: Fixed ROM slots 15032.
    15032, 43032,
// PORT: SOURCE P51-P53.agc:1585
//			REFSMFLG
// PORT: Fixed ROM slots 15033.
    15033, 1636,
// PORT: SOURCE P51-P53.agc:1586
//			ENDP50S
// PORT: Fixed ROM slots 15034.
    15034, 26826,
// PORT: SOURCE P51-P53.agc:1587
//PRFMSTAQ	=	OCT15
// PORT: SOURCE P51-P53.agc:1588
//P51ZERO		=	ZERO
// PORT: SOURCE P51-P53.agc:1589
//P51FIVE		=	FIVE
// PORT: SOURCE P51-P53.agc:1590
//V6N22		VN	0622
// PORT: Fixed ROM slots 15035.
    15035, 1580,
// PORT: SOURCE P51-P53.agc:1591
//V41K		VN	4100
// PORT: Fixed ROM slots 15036.
    15036, 10496
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15037–15039.
function agcAotUnit855 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15037 {
// PORT: SOURCE P51-P53.agc:1592
//SET1/PDT	CA	TIME1
// PORT: Fixed ROM slots 15037.
        if slot <> 15037 or instruction <> 12309 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 21).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15038 {
// PORT: SOURCE P51-P53.agc:1593
//# Page 770
// PORT: SOURCE P51-P53.agc:1594
//		TS	1/PIPADT
// PORT: Fixed ROM slots 15038.
            if slot <> 15038 or instruction <> 23100 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23100, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1595
//		TCF	DANZIG
// PORT: Fixed ROM slots 15039.
            if slot <> 15039 or instruction <> 7192 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7192, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[855] to agcAotUnit855@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1596
//
// PORT: SOURCE P51-P53.agc:1597
//# Page 771
// PORT: SOURCE P51-P53.agc:1598
//# SXTSM COMPUTES AN LOS VECTOR IN SM COORD FROM OCDU AND ICDU MARK DATA
// PORT: SOURCE P51-P53.agc:1599
//
// PORT: SOURCE P51-P53.agc:1600
//		SETLOC	P50S3
// PORT: SOURCE P51-P53.agc:1601
//		BANK
// PORT: SOURCE P51-P53.agc:1602
//SXTSM		STQ
// PORT: Fixed ROM slots 17426.
    17426, 65312,
// PORT: SOURCE P51-P53.agc:1603
//			QMAJ
// PORT: Fixed ROM slots 17427.
    17427, 384,
// PORT: SOURCE P51-P53.agc:1604
//		LXC,1	DLOAD*
// PORT: Fixed ROM slots 17428.
    17428, 58304,
// PORT: SOURCE P51-P53.agc:1605
//			MARKSTAT
// PORT: Fixed ROM slots 17429.
    17429, 1456,
// PORT: SOURCE P51-P53.agc:1606
//			0D,1
// PORT: Fixed ROM slots 17430.
    17430, 2,
// PORT: SOURCE P51-P53.agc:1607
//		STORE	TSIGHT
// PORT: Fixed ROM slots 17431.
    17431, 2830,
// PORT: SOURCE P51-P53.agc:1608
//		LXC,2	SLOAD*
// PORT: Fixed ROM slots 17432.
    17432, 56264,
// PORT: SOURCE P51-P53.agc:1609
//			STARIND
// PORT: Fixed ROM slots 17433.
    17433, 392,
// PORT: SOURCE P51-P53.agc:1610
//			MKDNCDR,2
// PORT: Fixed ROM slots 17434.
    17434, 34724,
// PORT: SOURCE P51-P53.agc:1611
//		LXC,2	VLOAD*
// PORT: Fixed ROM slots 17435.
    17435, 64456,
// PORT: SOURCE P51-P53.agc:1612
//			MPAC
// PORT: Fixed ROM slots 17436.
    17436, 216,
// PORT: SOURCE P51-P53.agc:1613
//			0,1
// PORT: Fixed ROM slots 17437.
    17437, 2,
// PORT: SOURCE P51-P53.agc:1614
//		STORE	0,2
// PORT: Fixed ROM slots 17438.
    17438, 8194,
// PORT: SOURCE P51-P53.agc:1615
//		DLOAD*
// PORT: Fixed ROM slots 17439.
    17439, 65478,
// PORT: SOURCE P51-P53.agc:1616
//			5,1
// PORT: Fixed ROM slots 17440.
    17440, 12,
// PORT: SOURCE P51-P53.agc:1617
//		STORE	5,2
// PORT: Fixed ROM slots 17441.
    17441, 8204,
// PORT: SOURCE P51-P53.agc:1618
//		CALL
// PORT: Fixed ROM slots 17442.
    17442, 65320,
// PORT: SOURCE P51-P53.agc:1619
//			SXTNB		# COMPUTE LOS VECTOR FROM OCDU IN MKVAC
// PORT: Fixed ROM slots 17443.
    17443, 38912,
// PORT: SOURCE P51-P53.agc:1620
//		LXA,1	INCR,1
// PORT: Fixed ROM slots 17444.
    17444, 51408,
// PORT: SOURCE P51-P53.agc:1621
//			MARKSTAT
// PORT: Fixed ROM slots 17445.
    17445, 1456,
// PORT: SOURCE P51-P53.agc:1622
//			2		# INCREMENT TO BASE ADR OF ICDU
// PORT: Fixed ROM slots 17446.
    17446, 4,
// PORT: SOURCE P51-P53.agc:1623
//		SXA,1	CALL
// PORT: Fixed ROM slots 17447.
    17447, 38064,
// PORT: SOURCE P51-P53.agc:1624
//			S1
// PORT: Fixed ROM slots 17448.
    17448, 80,
// PORT: SOURCE P51-P53.agc:1625
//			NBSM		# TRANSFORM LOS TO SM
// PORT: Fixed ROM slots 17449.
    17449, 40716,
// PORT: SOURCE P51-P53.agc:1626
//		GOTO
// PORT: Fixed ROM slots 17450.
    17450, 65360,
// PORT: SOURCE P51-P53.agc:1627
//			QMAJ
// PORT: Fixed ROM slots 17451.
    17451, 384,
// PORT: SOURCE P51-P53.agc:1628
//MKDNCDR		ECADR	MARKDOWN
// PORT: Fixed ROM slots 17452.
    17452, 3960,
// PORT: SOURCE P51-P53.agc:1629
//		ECADR	MARK2DWN
// PORT: Fixed ROM slots 17453.
    17453, 3716,
// PORT: SOURCE P51-P53.agc:1630
//
// PORT: SOURCE P51-P53.agc:1631
//# Page 772
// PORT: SOURCE P51-P53.agc:1632
//# PROGRAM DESCRIPTION:  R53 -- SIGHTING MARK ROUTINE
// PORT: SOURCE P51-P53.agc:1633
//# MOD. NO. 2						21 DEC 66
// PORT: SOURCE P51-P53.agc:1634
//# MOD. BY STURLAUGSON
// PORT: SOURCE P51-P53.agc:1635
//#
// PORT: SOURCE P51-P53.agc:1636
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P51-P53.agc:1637
//#
// PORT: SOURCE P51-P53.agc:1638
//#	TO PERFORM A SATISFACTORY NUMBER OF SIGHTING MARKS FOR THE REQUESTING PROGRAM (OR ROUTINE).  SIGHTINGS
// PORT: SOURCE P51-P53.agc:1639
//# 	CAN BE MADE ON A STAR OR LANDMARK.  WHEN THE CMC ACCEPTS A MARK IT RECORDS AND STORES 5 ANGLES (3 ICDUS AND 2
// PORT: SOURCE P51-P53.agc:1640
//#	OCDUS) AND THE TIME OF THE MARK.
// PORT: SOURCE P51-P53.agc:1641
//#
// PORT: SOURCE P51-P53.agc:1642
//# CALLING SEQUENCE:
// PORT: SOURCE P51-P53.agc:1643
//#
// PORT: SOURCE P51-P53.agc:1644
//#	R53 IS CALLED AND RETURNS IN INTERPRETIVE CODE.  RETURN IS VIA QPRET.
// PORT: SOURCE P51-P53.agc:1645
//#	THERE IS NO ERROR EXIT IN THIS ROUTINE ITSELF.
// PORT: SOURCE P51-P53.agc:1646
//#
// PORT: SOURCE P51-P53.agc:1647
//# SUBROUTINES CALLED
// PORT: SOURCE P51-P53.agc:1648
//#
// PORT: SOURCE P51-P53.agc:1649
//#	SXTMARK
// PORT: SOURCE P51-P53.agc:1650
//#	OPTSTALL
// PORT: SOURCE P51-P53.agc:1651
//#	GOFLASH
// PORT: SOURCE P51-P53.agc:1652
//#
// PORT: SOURCE P51-P53.agc:1653
//# ERASABLE INITIALIZATION:
// PORT: SOURCE P51-P53.agc:1654
//#
// PORT: SOURCE P51-P53.agc:1655
//#	TARGET FLAG -- STAR OR LANDMARK
// PORT: SOURCE P51-P53.agc:1656
//#	MARKINDX -- NUMBER OF MARKS WANTED
// PORT: SOURCE P51-P53.agc:1657
//#	STARIND -- INDEX TO BESTI OR BESTJ (STAR NUMBER)
// PORT: SOURCE P51-P53.agc:1658
//#
// PORT: SOURCE P51-P53.agc:1659
//# OUTPUT
// PORT: SOURCE P51-P53.agc:1660
//#
// PORT: SOURCE P51-P53.agc:1661
//#	MARKSTAT CONTAINS INDEX TO VACANT AREA WEHRE MARK DATA IS STORED
// PORT: SOURCE P51-P53.agc:1662
//#	BESTI (INDEXED BY STARIND) CONTAINS STAR NUMBER SIGHTED.
// PORT: SOURCE P51-P53.agc:1663
//#
// PORT: SOURCE P51-P53.agc:1664
//# DEBRIS
// PORT: SOURCE P51-P53.agc:1665
//#
// PORT: SOURCE P51-P53.agc:1666
//#	MARKINDX CONTAINS NUMBER OF MARKS DESIRED
// PORT: SOURCE P51-P53.agc:1667
//
// PORT: SOURCE P51-P53.agc:1668
//		SETLOC	RT53
// PORT: SOURCE P51-P53.agc:1669
//		BANK
// PORT: SOURCE P51-P53.agc:1670
//
// PORT: SOURCE P51-P53.agc:1671
//		COUNT	14/R53
// PORT: SOURCE P51-P53.agc:1672
//
// PORT: SOURCE P51-P53.agc:1673
//R53		STQ	SET		# SET SIGHTING MARK FLAG
// PORT: Fixed ROM slots 15040.
    15040, 35872,
// PORT: SOURCE P51-P53.agc:1674
//			R53EXIT
// PORT: Fixed ROM slots 15041.
    15041, 3714,
// PORT: SOURCE P51-P53.agc:1675
//			R53FLAG
// PORT: Fixed ROM slots 15042.
    15042, 114,
// PORT: SOURCE P51-P53.agc:1676
//		EXIT
// PORT: Fixed ROM slots 15043.
    15043, 65532
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15044–15046.
function agcAotUnit856 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15044 {
// PORT: SOURCE P51-P53.agc:1677
//R53A		CA	MARKINDX	# NUMBER OF MARKS
// PORT: Fixed ROM slots 15044.
        if slot <> 15044 or instruction <> 12481 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 193).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15045 {
// PORT: SOURCE P51-P53.agc:1678
//		MASK	LOW3
// PORT: Fixed ROM slots 15045.
            if slot <> 15045 or instruction <> 31251 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                if fixedOperand = 7 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1679
//		TC	BANKCALL
// PORT: Fixed ROM slots 15046.
            if slot <> 15046 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[856] to agcAotUnit856@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1680
//		CADR	SXTMARK
// PORT: Fixed ROM slots 15047.
    15047, 14340
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15048–15048.
function agcAotUnit857 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1681
//		TC	BANKCALL
// PORT: Fixed ROM slots 15048.
    if slot <> 15048 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[857] to agcAotUnit857@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1682
//		CADR	OPTSTALL
// PORT: Fixed ROM slots 15049.
    15049, 16118
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15050–15051.
function agcAotUnit858 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15050 {
// PORT: SOURCE P51-P53.agc:1683
//		TC	CURTAINS
// PORT: Fixed ROM slots 15050.
        if slot <> 15050 or instruction <> 3055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1684
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 15051.
        if slot <> 15051 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[858] to agcAotUnit858@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1685
//		CCS	QPRET		# NUMBER OF MARKS ACTUALLY DONE
// PORT: Fixed ROM slots 15052.
    15052, 8276
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15053–15059.
function agcAotUnit859 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15055 {
        if slot <= 15053 {
// PORT: SOURCE P51-P53.agc:1686
//		TCF	R53B
// PORT: Fixed ROM slots 15053.
            if slot <> 15053 or instruction <> 5846 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5846, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15054 {
// PORT: SOURCE P51-P53.agc:1687
//		TCF	+2		# ZERO
// PORT: Fixed ROM slots 15054.
                if slot <> 15054 or instruction <> 5840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1688
//		TCF	+1		# CCS HOLE
// PORT: Fixed ROM slots 15055.
                if slot <> 15055 or instruction <> 5840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15057 {
            if slot <= 15056 {
// PORT: SOURCE P51-P53.agc:1689
//		CAF	ZERO		# HOUSEKEEP VAC AREA SAVE
// PORT: Fixed ROM slots 15056.
                if slot <> 15056 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1690
//		XCH	MARKSTAT	#	AND MARKSTAT
// PORT: Fixed ROM slots 15057.
                if slot <> 15057 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15058 {
// PORT: SOURCE P51-P53.agc:1691
//# Page 773
// PORT: SOURCE P51-P53.agc:1692
//		CCS	A
// PORT: Fixed ROM slots 15058.
                if slot <> 15058 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1693
//		INDEX	A
// PORT: Fixed ROM slots 15059.
                if slot <> 15059 or instruction <> 20480 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20480, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20480, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[859] to agcAotUnit859@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1694
//		TS	0
// PORT: Fixed ROM slots 15060.
    15060, 45056
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15061–15062.
function agcAotUnit860 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15061 {
// PORT: SOURCE P51-P53.agc:1695
//		TCF	R53A
// PORT: Fixed ROM slots 15061.
        if slot <> 15061 or instruction <> 5828 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5828, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1696
//R53B		TC	CHECKMM
// PORT: Fixed ROM slots 15062.
        if slot <> 15062 or instruction <> 2804 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2804, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[860] to agcAotUnit860@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1697
//		MM	22
// PORT: Fixed ROM slots 15063.
    15063, 44
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15064–15066.
function agcAotUnit861 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15064 {
// PORT: SOURCE P51-P53.agc:1698
//		TCF	+2
// PORT: Fixed ROM slots 15064.
        if slot <> 15064 or instruction <> 5850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5850, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15065 {
// PORT: SOURCE P51-P53.agc:1699
//		TCF	R53D
// PORT: Fixed ROM slots 15065.
            if slot <> 15065 or instruction <> 5873 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5873, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1700
//		TC	CHECKMM
// PORT: Fixed ROM slots 15066.
            if slot <> 15066 or instruction <> 2804 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2804, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[861] to agcAotUnit861@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1701
//		MM	23
// PORT: Fixed ROM slots 15067.
    15067, 46
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15068–15071.
function agcAotUnit862 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15069 {
        if slot <= 15068 {
// PORT: SOURCE P51-P53.agc:1702
//		TCF	R53C1
// PORT: Fixed ROM slots 15068.
            if slot <> 15068 or instruction <> 5854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5854, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1703
//		TCF	R53D
// PORT: Fixed ROM slots 15069.
            if slot <> 15069 or instruction <> 5873 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5873, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15070 {
// PORT: SOURCE P51-P53.agc:1704
//R53C1		CAF	ZERO
// PORT: Fixed ROM slots 15070.
            if slot <> 15070 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1705
//		TC	BANKCALL
// PORT: Fixed ROM slots 15071.
            if slot <> 15071 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[862] to agcAotUnit862@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1706
//		CADR	CLEANDSP
// PORT: Fixed ROM slots 15072.
    15072, 17286
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15073–15074.
function agcAotUnit863 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15073 {
// PORT: SOURCE P51-P53.agc:1707
//R53C		CAF	V01N71
// PORT: Fixed ROM slots 15073.
        if slot <> 15073 or instruction <> 14069 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1781), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:1708
//		TC	BANKCALL
// PORT: Fixed ROM slots 15074.
        if slot <> 15074 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[863] to agcAotUnit863@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1709
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15075.
    15075, 17312
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15076–15087.
function agcAotUnit864 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15081 {
        if slot <= 15078 {
            if slot <= 15076 {
// PORT: SOURCE P51-P53.agc:1710
//		TC	GOTOPOOH	# TERM.
// PORT: Fixed ROM slots 15076.
                if slot <> 15076 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15077 {
// PORT: SOURCE P51-P53.agc:1711
//		TCF	R53Z
// PORT: Fixed ROM slots 15077.
                    if slot <> 15077 or instruction <> 5863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:1712
//		TC	R53C		# RECYCLE
// PORT: Fixed ROM slots 15078.
                    if slot <> 15078 or instruction <> 1761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15079 {
// PORT: SOURCE P51-P53.agc:1713
//R53Z		TC	CHKSCODE
// PORT: Fixed ROM slots 15079.
                if slot <> 15079 or instruction <> 1782 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1782, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15080 {
// PORT: SOURCE P51-P53.agc:1714
//		TC	FALTON
// PORT: Fixed ROM slots 15080.
                    if slot <> 15080 or instruction <> 2304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2304, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:1715
//		TC	R53C
// PORT: Fixed ROM slots 15081.
                    if slot <> 15081 or instruction <> 1761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15084 {
            if slot <= 15082 {
// PORT: SOURCE P51-P53.agc:1716
//		CS	HIGH9
// PORT: Fixed ROM slots 15082.
                if slot <> 15082 or instruction <> 20427 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15083 {
// PORT: SOURCE P51-P53.agc:1717
//		MASK	STARCODE
// PORT: Fixed ROM slots 15083.
                    if slot <> 15083 or instruction <> 29149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 477).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:1718
//		EXTEND
// PORT: Fixed ROM slots 15084.
                    if slot <> 15084 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15085 {
// PORT: SOURCE P51-P53.agc:1719
//		MP	SIGHTSIX
// PORT: Fixed ROM slots 15085.
                if slot <> 15085 or instruction <> 31881 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 3209, readEffective:call(words, 3209)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15086 {
// PORT: SOURCE P51-P53.agc:1720
//		XCH	L
// PORT: Fixed ROM slots 15086.
                    if slot <> 15086 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P51-P53.agc:1721
//		INDEX	STARIND
// PORT: Fixed ROM slots 15087.
                    if slot <> 15087 or instruction <> 20676 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20676, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20676, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[864] to agcAotUnit864@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1722
//		TS	BESTI
// PORT: Fixed ROM slots 15088.
    15088, 45444
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15089–15089.
function agcAotUnit865 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1723
//R53D		TC	INTPRET
// PORT: Fixed ROM slots 15089.
    if slot <> 15089 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[865] to agcAotUnit865@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1724
//R53OUT		SETGO
// PORT: Fixed ROM slots 15090.
    15090, 65304,
// PORT: SOURCE P51-P53.agc:1725
//			TERMIFLG	# SET TERMINATE FOR R52
// PORT: Fixed ROM slots 15091.
    15091, 3616,
// PORT: SOURCE P51-P53.agc:1726
//			R53EXIT
// PORT: Fixed ROM slots 15092.
    15092, 3714,
// PORT: SOURCE P51-P53.agc:1727
//SIGHTSIX	=	SIX
// PORT: SOURCE P51-P53.agc:1728
//V01N71		VN	0171
// PORT: Fixed ROM slots 15093.
    15093, 398
)).

// PORT: Physical bank 14. Shared continuation entries, slots 15094–15100.
function agcAotUnit866 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15096 {
        if slot <= 15094 {
// PORT: SOURCE P51-P53.agc:1729
//
// PORT: SOURCE P51-P53.agc:1730
//# ****** KEEP IN SAME BANK AS R51 AND R53 ********
// PORT: SOURCE P51-P53.agc:1731
//CHKSCODE	CCS	STARCODE
// PORT: Fixed ROM slots 15094.
            if slot <> 15094 or instruction <> 4573 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 477).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15095 {
// PORT: SOURCE P51-P53.agc:1732
//		AD	NEG47
// PORT: Fixed ROM slots 15095.
                if slot <> 15095 or instruction <> 26366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1790), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1733
//		CCS	A
// PORT: Fixed ROM slots 15096.
                if slot <> 15096 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15098 {
            if slot <= 15097 {
// PORT: SOURCE P51-P53.agc:1734
//		TC	Q		# SC < 0 OR SC > 50
// PORT: Fixed ROM slots 15097.
                if slot <> 15097 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1735
//		TCF	+2		# SC = + OR - 0
// PORT: Fixed ROM slots 15098.
                if slot <> 15098 or instruction <> 5884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15099 {
// PORT: SOURCE P51-P53.agc:1736
//		TCF	+1		# 0 <= SC< 50
// PORT: Fixed ROM slots 15099.
                if slot <> 15099 or instruction <> 5884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1737
//		INDEX	Q		# SC = 50
// PORT: Fixed ROM slots 15100.
                if slot <> 15100 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[866] to agcAotUnit866@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1738
//		TC	00002
// PORT: Fixed ROM slots 15101.
    15101, 4,
// PORT: SOURCE P51-P53.agc:1739
//NEG47		OCT	77730
// PORT: Fixed ROM slots 15102.
    15102, 65456,
// PORT: SOURCE P51-P53.agc:1740
//
// PORT: SOURCE P51-P53.agc:1741
//# Page 774
// PORT: SOURCE P51-P53.agc:1742
//# NAME -- S52.2
// PORT: SOURCE P51-P53.agc:1743
//# FUNCTION -- COMPUTE GIMBAL ANGLES FOR DESIRED SM AND PRESENT VEHICLE
// PORT: SOURCE P51-P53.agc:1744
//# CALL -- CALL S52.2
// PORT: SOURCE P51-P53.agc:1745
//# INPUT -- X,Y,ZSMD
// PORT: SOURCE P51-P53.agc:1746
//# OUTPUT -- OGC,IGC,MGC,THETAD,+1,+2
// PORT: SOURCE P51-P53.agc:1747
//# SUBROUTINES -- CDUTRIG, CALCSMSC, MATMOVE, CALCGA
// PORT: SOURCE P51-P53.agc:1748
//
// PORT: SOURCE P51-P53.agc:1749
//		SETLOC	S52/2
// PORT: SOURCE P51-P53.agc:1750
//		BANK
// PORT: SOURCE P51-P53.agc:1751
//
// PORT: SOURCE P51-P53.agc:1752
//		COUNT	13/S52.2
// PORT: SOURCE P51-P53.agc:1753
//S52.2		STQ
// PORT: Fixed ROM slots 11481.
    11481, 65312,
// PORT: SOURCE P51-P53.agc:1754
//			QMAJ
// PORT: Fixed ROM slots 11482.
    11482, 384,
// PORT: SOURCE P51-P53.agc:1755
//		CALL
// PORT: Fixed ROM slots 11483.
    11483, 65320,
// PORT: SOURCE P51-P53.agc:1756
//			CDUTRIG
// PORT: Fixed ROM slots 11484.
    11484, 40574,
// PORT: SOURCE P51-P53.agc:1757
//		CALL
// PORT: Fixed ROM slots 11485.
    11485, 65320,
// PORT: SOURCE P51-P53.agc:1758
//			CALCSMSC
// PORT: Fixed ROM slots 11486.
    11486, 29460,
// PORT: SOURCE P51-P53.agc:1759
//		AXT,1	SSP
// PORT: Fixed ROM slots 11487.
    11487, 55792,
// PORT: SOURCE P51-P53.agc:1760
//			18D
// PORT: Fixed ROM slots 11488.
    11488, 36,
// PORT: SOURCE P51-P53.agc:1761
//			S1
// PORT: Fixed ROM slots 11489.
    11489, 82,
// PORT: SOURCE P51-P53.agc:1762
//			6D
// PORT: Fixed ROM slots 11490.
    11490, 12,
// PORT: SOURCE P51-P53.agc:1763
//S52.2A		VLOAD*	VXM
// PORT: Fixed ROM slots 11491.
    11491, 50678,
// PORT: SOURCE P51-P53.agc:1764
//			XNB 	+18D,1
// PORT: Fixed ROM slots 11492.
    11492, 3004,
// PORT: SOURCE P51-P53.agc:1765
//			REFSMMAT
// PORT: Fixed ROM slots 11493.
    11493, 1980,
// PORT: SOURCE P51-P53.agc:1766
//		UNIT
// PORT: Fixed ROM slots 11494.
    11494, 65372,
// PORT: SOURCE P51-P53.agc:1767
//		STORE	XNB 	+18D,1
// PORT: Fixed ROM slots 11495.
    11495, 7100,
// PORT: SOURCE P51-P53.agc:1768
//		TIX,1
// PORT: Fixed ROM slots 11496.
    11496, 65408,
// PORT: SOURCE P51-P53.agc:1769
//			S52.2A
// PORT: Fixed ROM slots 11497.
    11497, 18886,
// PORT: SOURCE P51-P53.agc:1770
//S52.2.1		AXC,1	AXC,2
// PORT: Fixed ROM slots 11498.
    11498, 62688,
// PORT: SOURCE P51-P53.agc:1771
//			XSMD
// PORT: Fixed ROM slots 11499.
    11499, 396,
// PORT: SOURCE P51-P53.agc:1772
//			XSM
// PORT: Fixed ROM slots 11500.
    11500, 2930,
// PORT: SOURCE P51-P53.agc:1773
//		CALL
// PORT: Fixed ROM slots 11501.
    11501, 65320,
// PORT: SOURCE P51-P53.agc:1774
//			MATMOVE
// PORT: Fixed ROM slots 11502.
    11502, 25686,
// PORT: SOURCE P51-P53.agc:1775
//		CALL
// PORT: Fixed ROM slots 11503.
    11503, 65320,
// PORT: SOURCE P51-P53.agc:1776
//			CALCGA
// PORT: Fixed ROM slots 11504.
    11504, 40338,
// PORT: SOURCE P51-P53.agc:1777
//		GOTO
// PORT: Fixed ROM slots 11505.
    11505, 65360,
// PORT: SOURCE P51-P53.agc:1778
//			QMAJ
// PORT: Fixed ROM slots 11506.
    11506, 384
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13476–13478.
function agcAotUnit739 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13476 {
// PORT: SOURCE P51-P53.agc:1779
//
// PORT: SOURCE P51-P53.agc:1780
//# Page 775
// PORT: SOURCE P51-P53.agc:1781
//# PROGRAM NAME:  SR52.1				DATE:  DEC 20 1968
// PORT: SOURCE P51-P53.agc:1782
//# MOD 1						LOG SEC:  P51-P53
// PORT: SOURCE P51-P53.agc:1783
//# BY KEN VINCENT				ASSEMBLY:  SUNDISK REV 40
// PORT: SOURCE P51-P53.agc:1784
//#
// PORT: SOURCE P51-P53.agc:1785
//# FUNCTION
// PORT: SOURCE P51-P53.agc:1786
//#
// PORT: SOURCE P51-P53.agc:1787
//# TARG1 AND TARG2 FLAGS ARE LOOKED AT TO DETERMINE IF THE TARGET IS THE
// PORT: SOURCE P51-P53.agc:1788
//# LEM, STAR, OR LANDMARK.  IN CASE OF LEM OR LMK, THE PRESENT TIME PLUS
// PORT: SOURCE P51-P53.agc:1789
//# 2 SECONDS IS SAVED IN AOPTIME (ALIAS STARAD, +1).  IF THE LEM IS
// PORT: SOURCE P51-P53.agc:1790
//# THE TARGET THEN CONIC UPDATES OF THE CSM AND LEM ARE MADE TO
// PORT: SOURCE P51-P53.agc:1791
//# THE TIME IN AOPTIME.  THE UNIT OF THE DIFFERENCE OF LEM AND CSM
// PORT: SOURCE P51-P53.agc:1792
//# POSITION VECTORS BECOMES THE REFERENCE SIGHTING VECTOR USED IN THE
// PORT: SOURCE P51-P53.agc:1793
//# COMMON PART OF THE THIS PROGRAM.
// PORT: SOURCE P51-P53.agc:1794
//#
// PORT: SOURCE P51-P53.agc:1795
//# IN THE CASE OF LANDMARK, THE CSM IS UPDATED CONICALLY.  THE RADIUS
// PORT: SOURCE P51-P53.agc:1796
//# VECTOR FOR THE LANDMARK IS OBTAINED FROM LALOTORV.  BOTH OF THESE ARE
// PORT: SOURCE P51-P53.agc:1797
//# FOUND FOR THE TIME IN AOPTIME.  THE UNIT OF THE DIFFERENCE BETWEEN
// PORT: SOURCE P51-P53.agc:1798
//# THE LANDMARK AND CSM RADIUS VECTORS BECOMES THE REFERENCE SIGHTING
// PORT: SOURCE P51-P53.agc:1799
//# VECTOR FOR THE COMMON PART OF THIS ROUTINE.
// PORT: SOURCE P51-P53.agc:1800
//#
// PORT: SOURCE P51-P53.agc:1801
//# IF A STAR IS THE TARGET, THE PROPER STAR IS OBTAINED FROM THE CATALOG
// PORT: SOURCE P51-P53.agc:1802
//# AND THIS VECTOR BECOMES THE REFERENCE SIGHTING VECTOR.
// PORT: SOURCE P51-P53.agc:1803
//#
// PORT: SOURCE P51-P53.agc:1804
//# THE COMMON PART OF THIS PROGRAM TRANSFORMS THE REFERENCE SIGHTING
// PORT: SOURCE P51-P53.agc:1805
//# VECTOR INTO STABLE MEMBER COORDINATES.  IT READS THE IMU-CDUS AND USES
// PORT: SOURCE P51-P53.agc:1806
//# THIS DATA IN A CALL TO CALCSXA.  ON RETURN FROM CALCSXA A TEST IS
// PORT: SOURCE P51-P53.agc:1807
//# MADE TO SEE IF THE TRUNNION ANGLE IS GREATER THAN  90DEG OR 38DEG.
// PORT: SOURCE P51-P53.agc:1808
//# MADE TO SEE IF THE TRUNNION ANGLE IS GREATER THAN 90DEG. OR 50DEG.
// PORT: SOURCE P51-P53.agc:1809
//#
// PORT: SOURCE P51-P53.agc:1810
//# CALLING SEQUENCE
// PORT: SOURCE P51-P53.agc:1811
//#
// PORT: SOURCE P51-P53.agc:1812
//# 	L+4	RETURN WHEN SHAFT OR TRUNION NOT WITHIN 5 DEG OF DESIRED
// PORT: SOURCE P51-P53.agc:1813
//#	L	TC	BANKCALL
// PORT: SOURCE P51-P53.agc:1814
//#	L+1	CADR	SR52.1
// PORT: SOURCE P51-P53.agc:1815
//#	L+2	ERROR RETURN	TRUNNION GREATER THAN 90 DEG.
// PORT: SOURCE P51-P53.agc:1816
//#	L+3	ERROR RETURN	TRUNNION GREATER THAN 50 DEG
// PORT: SOURCE P51-P53.agc:1817
//#	L+4	NORMAL RETURN
// PORT: SOURCE P51-P53.agc:1818
//#
// PORT: SOURCE P51-P53.agc:1819
//# OUTPUT
// PORT: SOURCE P51-P53.agc:1820
//#
// PORT: SOURCE P51-P53.agc:1821
//#	SAC:	SINGLE PREC, 2'S COMP, SCALED AT HALF REVS -- SHAFT ANGLE DESIRED.
// PORT: SOURCE P51-P53.agc:1822
//#	PAC:	SINGLE PREC, 2'S COMP, SCALED AT EIGHTH REVS -- TRUNNION ANGLE DESIRED.
// PORT: SOURCE P51-P53.agc:1823
//#
// PORT: SOURCE P51-P53.agc:1824
//# INITIALIZATION
// PORT: SOURCE P51-P53.agc:1825
//#
// PORT: SOURCE P51-P53.agc:1826
//#	IF TARG1FLG =1 THEN TARGET IS LEM -- NO OTHER INPUT REQUIRED.
// PORT: SOURCE P51-P53.agc:1827
//#
// PORT: SOURCE P51-P53.agc:1828
//#	IF TARG1FLG =0 AND TARG2FLG =0 THE TARGET IS STAR, STARIND SHOULD
// PORT: SOURCE P51-P53.agc:1829
//#	0 OR 1 DENOTING BESTI OR BESTJ RESPECTIVELY AS STAR CODE.  STAR CODES
// PORT: SOURCE P51-P53.agc:1830
//#	ARE 6 TIMES STAR NUMBER.
// PORT: SOURCE P51-P53.agc:1831
//#
// PORT: SOURCE P51-P53.agc:1832
//#	IF TARG1FLG =0 AND TARG2FLG =1 THEN TARGET IS LANDMARK.  SETT ROUTINE
// PORT: SOURCE P51-P53.agc:1833
//#	LALOTORV FOR INPUT REQUIREMENTS.  HERE FIXERAD=1 FOR CONSTANT EARTH
// PORT: SOURCE P51-P53.agc:1834
//#	RADIUS
// PORT: SOURCE P51-P53.agc:1835
//#
// PORT: SOURCE P51-P53.agc:1836
//# DEBRIS
// PORT: SOURCE P51-P53.agc:1837
//#
// PORT: SOURCE P51-P53.agc:1838
//#	WORK AREA
// PORT: SOURCE P51-P53.agc:1839
//#	STARAD -- STAR+5 (STAR IS DESIRED LOS IN STABLE MEMBER COORDINATES)
// PORT: SOURCE P51-P53.agc:1840
//
// PORT: SOURCE P51-P53.agc:1841
//		COUNT*	$$/SR521
// PORT: SOURCE P51-P53.agc:1842
//# Page 776
// PORT: SOURCE P51-P53.agc:1843
//		SETLOC	SR52/1
// PORT: SOURCE P51-P53.agc:1844
//		BANK
// PORT: SOURCE P51-P53.agc:1845
//
// PORT: SOURCE P51-P53.agc:1846
//SR52.1		TC	MAKECADR
// PORT: Fixed ROM slots 13476.
        if slot <> 13476 or instruction <> 2505 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2505, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 13477 {
// PORT: SOURCE P51-P53.agc:1847
//		TS	QMIN
// PORT: Fixed ROM slots 13477.
            if slot <> 13477 or instruction <> 23551 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23551, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1848
//		TC	INTPRET
// PORT: Fixed ROM slots 13478.
            if slot <> 13478 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[739] to agcAotUnit739@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1849
//		RTB	DAD
// PORT: Fixed ROM slots 13479.
    13479, 36152,
// PORT: SOURCE P51-P53.agc:1850
//			LOADTIME
// PORT: Fixed ROM slots 13480.
    13480, 38544,
// PORT: SOURCE P51-P53.agc:1851
//			1.3SECDP
// PORT: Fixed ROM slots 13481.
    13481, 23018,
// PORT: SOURCE P51-P53.agc:1852
//		STORE	AOPTIME
// PORT: Fixed ROM slots 13482.
    13482, 2524,
// PORT: SOURCE P51-P53.agc:1853
//		BON	BON
// PORT: Fixed ROM slots 13483.
    13483, 35864,
// PORT: SOURCE P51-P53.agc:1854
//			TARG1FLG
// PORT: Fixed ROM slots 13484.
    13484, 906,
// PORT: SOURCE P51-P53.agc:1855
//			LEM52
// PORT: Fixed ROM slots 13485.
    13485, 22884,
// PORT: SOURCE P51-P53.agc:1856
//			TARG2FLG
// PORT: Fixed ROM slots 13486.
    13486, 908,
// PORT: SOURCE P51-P53.agc:1857
//			LMK52
// PORT: Fixed ROM slots 13487.
    13487, 22900,
// PORT: SOURCE P51-P53.agc:1858
//		GOTO
// PORT: Fixed ROM slots 13488.
    13488, 65360,
// PORT: SOURCE P51-P53.agc:1859
//			STAR52
// PORT: Fixed ROM slots 13489.
    13489, 22934,
// PORT: SOURCE P51-P53.agc:1860
//LEM52		DLOAD
// PORT: Fixed ROM slots 13490.
    13490, 65482,
// PORT: SOURCE P51-P53.agc:1861
//			AOPTIME
// PORT: Fixed ROM slots 13491.
    13491, 2524,
// PORT: SOURCE P51-P53.agc:1862
//		STCALL	TDEC1
// PORT: Fixed ROM slots 13492.
    13492, 28738,
// PORT: SOURCE P51-P53.agc:1863
//			LEMCONIC
// PORT: Fixed ROM slots 13493.
    13493, 23724,
// PORT: SOURCE P51-P53.agc:1864
//		VLOAD
// PORT: Fixed ROM slots 13494.
    13494, 65530,
// PORT: SOURCE P51-P53.agc:1865
//			RATT
// PORT: Fixed ROM slots 13495.
    13495, 2,
// PORT: SOURCE P51-P53.agc:1866
//		GOTO
// PORT: Fixed ROM slots 13496.
    13496, 65360,
// PORT: SOURCE P51-P53.agc:1867
//			LMKLMCOM
// PORT: Fixed ROM slots 13497.
    13497, 22916,
// PORT: SOURCE P51-P53.agc:1868
//LMK52		BON	DLOAD
// PORT: Fixed ROM slots 13498.
    13498, 58648,
// PORT: SOURCE P51-P53.agc:1869
//			ADVTRK
// PORT: Fixed ROM slots 13499.
    13499, 4490,
// PORT: SOURCE P51-P53.agc:1870
//			ADVTRACK
// PORT: Fixed ROM slots 13500.
    13500, 45056,
// PORT: SOURCE P51-P53.agc:1871
//			AOPTIME
// PORT: Fixed ROM slots 13501.
    13501, 2524,
// PORT: SOURCE P51-P53.agc:1872
//		CALL
// PORT: Fixed ROM slots 13502.
    13502, 65320,
// PORT: SOURCE P51-P53.agc:1873
//			LALOTORV
// PORT: Fixed ROM slots 13503.
    13503, 23106,
// PORT: SOURCE P51-P53.agc:1874
//		VLOAD
// PORT: Fixed ROM slots 13504.
    13504, 65530,
// PORT: SOURCE P51-P53.agc:1875
//			ALPHAV
// PORT: Fixed ROM slots 13505.
    13505, 2260,
// PORT: SOURCE P51-P53.agc:1876
//LMKLMCOM	STODL	STAR
// PORT: Fixed ROM slots 13506.
    13506, 15340,
// PORT: SOURCE P51-P53.agc:1877
//			AOPTIME
// PORT: Fixed ROM slots 13507.
    13507, 2524,
// PORT: SOURCE P51-P53.agc:1878
//		STCALL	TDEC1
// PORT: Fixed ROM slots 13508.
    13508, 28738,
// PORT: SOURCE P51-P53.agc:1879
//			CSMCONIC
// PORT: Fixed ROM slots 13509.
    13509, 23704,
// PORT: SOURCE P51-P53.agc:1880
//		VLOAD	VSU
// PORT: Fixed ROM slots 13510.
    13510, 43514,
// PORT: SOURCE P51-P53.agc:1881
//			STAR
// PORT: Fixed ROM slots 13511.
    13511, 3052,
// PORT: SOURCE P51-P53.agc:1882
//			RATT
// PORT: Fixed ROM slots 13512.
    13512, 2,
// PORT: SOURCE P51-P53.agc:1883
//		UNIT	GOTO
// PORT: Fixed ROM slots 13513.
    13513, 43100,
// PORT: SOURCE P51-P53.agc:1884
//			COM52
// PORT: Fixed ROM slots 13514.
    13514, 22956,
// PORT: SOURCE P51-P53.agc:1885
//STAR52		SSP	LXA,1
// PORT: Fixed ROM slots 13515.
    13515, 59570,
// PORT: SOURCE P51-P53.agc:1886
//			S1
// PORT: Fixed ROM slots 13516.
    13516, 82,
// PORT: SOURCE P51-P53.agc:1887
//			0
// PORT: Fixed ROM slots 13517.
    13517, 0,
// PORT: SOURCE P51-P53.agc:1888
//			STARIND
// PORT: Fixed ROM slots 13518.
    13518, 392,
// PORT: SOURCE P51-P53.agc:1889
//		TIX,1
// PORT: Fixed ROM slots 13519.
    13519, 65408,
// PORT: SOURCE P51-P53.agc:1890
//			ST52ST
// PORT: Fixed ROM slots 13520.
    13520, 22952,
// PORT: SOURCE P51-P53.agc:1891
//		VLOAD	GOTO
// PORT: Fixed ROM slots 13521.
    13521, 43258,
// PORT: SOURCE P51-P53.agc:1892
//			STARSAV2
// PORT: Fixed ROM slots 13522.
    13522, 2846,
// PORT: SOURCE P51-P53.agc:1893
//# Page 777
// PORT: SOURCE P51-P53.agc:1894
//			COM52
// PORT: Fixed ROM slots 13523.
    13523, 22956,
// PORT: SOURCE P51-P53.agc:1895
//ST52ST		VLOAD
// PORT: Fixed ROM slots 13524.
    13524, 65530,
// PORT: SOURCE P51-P53.agc:1896
//			STARSAV1
// PORT: Fixed ROM slots 13525.
    13525, 2834,
// PORT: SOURCE P51-P53.agc:1897
//COM52		MXV	UNIT
// PORT: Fixed ROM slots 13526.
    13526, 44706,
// PORT: SOURCE P51-P53.agc:1898
//			REFSMMAT
// PORT: Fixed ROM slots 13527.
    13527, 1980,
// PORT: SOURCE P51-P53.agc:1899
//		STORE	STAR
// PORT: Fixed ROM slots 13528.
    13528, 3052,
// PORT: SOURCE P51-P53.agc:1900
//		SETPD	CALL
// PORT: Fixed ROM slots 13529.
    13529, 37890,
// PORT: SOURCE P51-P53.agc:1901
//			0
// PORT: Fixed ROM slots 13530.
    13530, 2,
// PORT: SOURCE P51-P53.agc:1902
//			CDUTRIG		# COMPUTES SINES AND COSINES FOR CALCSXA
// PORT: Fixed ROM slots 13531.
    13531, 40574,
// PORT: SOURCE P51-P53.agc:1903
//		CALL			#	NOW EXPECT TO SEE THE CDU ANGLES.
// PORT: Fixed ROM slots 13532.
    13532, 65320,
// PORT: SOURCE P51-P53.agc:1904
//			CALCSXA
// PORT: Fixed ROM slots 13533.
    13533, 38968,
// PORT: SOURCE P51-P53.agc:1905
//		BOFF	EXIT
// PORT: Fixed ROM slots 13534.
    13534, 65048,
// PORT: SOURCE P51-P53.agc:1906
//			CULTFLAG
// PORT: Fixed ROM slots 13535.
    13535, 2000,
// PORT: SOURCE P51-P53.agc:1907
//			TRUN38
// PORT: Fixed ROM slots 13536.
    13536, 22980
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13537–13537.
function agcAotUnit740 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1908
//		TC	SR52E1
// PORT: Fixed ROM slots 13537.
    if slot <> 13537 or instruction <> 1264 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1264, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[740] to agcAotUnit740@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1909
//TRUN38		DLOAD	DSU
// PORT: Fixed ROM slots 13538.
    13538, 38346,
// PORT: SOURCE P51-P53.agc:1910
//			PAC
// PORT: Fixed ROM slots 13539.
    13539, 3068,
// PORT: SOURCE P51-P53.agc:1911
//			38TRDEG
// PORT: Fixed ROM slots 13540.
    13540, 23014,
// PORT: SOURCE P51-P53.agc:1912
//		BPL	DLOAD
// PORT: Fixed ROM slots 13541.
    13541, 58696,
// PORT: SOURCE P51-P53.agc:1913
//			SR52E22
// PORT: Fixed ROM slots 13542.
    13542, 22998,
// PORT: SOURCE P51-P53.agc:1914
//			PAC
// PORT: Fixed ROM slots 13543.
    13543, 3068,
// PORT: SOURCE P51-P53.agc:1915
//		DSU	BPL
// PORT: Fixed ROM slots 13544.
    13544, 42026,
// PORT: SOURCE P51-P53.agc:1916
//			20DEGSMN
// PORT: Fixed ROM slots 13545.
    13545, 23022,
// PORT: SOURCE P51-P53.agc:1917
//			SR52E3
// PORT: Fixed ROM slots 13546.
    13546, 23002,
// PORT: SOURCE P51-P53.agc:1918
//SR52E22		EXIT
// PORT: Fixed ROM slots 13547.
    13547, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13548–13548.
function agcAotUnit741 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1919
//		TC	SR52E2
// PORT: Fixed ROM slots 13548.
    if slot <> 13548 or instruction <> 1263 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1263, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[741] to agcAotUnit741@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1920
//SR52E3		EXIT
// PORT: Fixed ROM slots 13549.
    13549, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13550–13553.
function agcAotUnit742 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13551 {
        if slot <= 13550 {
// PORT: SOURCE P51-P53.agc:1921
//		INCR	QMIN
// PORT: Fixed ROM slots 13550.
            if slot <> 13550 or instruction <> 11263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1023).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1922
//SR52E2		INCR	QMIN
// PORT: Fixed ROM slots 13551.
            if slot <> 13551 or instruction <> 11263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1023).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13552 {
// PORT: SOURCE P51-P53.agc:1923
//SR52E1		CA	QMIN
// PORT: Fixed ROM slots 13552.
            if slot <> 13552 or instruction <> 13311 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1023).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:1924
//		TC	SWCALL
// PORT: Fixed ROM slots 13553.
            if slot <> 13553 or instruction <> 2486 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2486, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[742] to agcAotUnit742@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1925
//38TRDEG		2DEC	.66666667	# CORRESPONDS TO 50 DEGS IN TRUNION
// PORT: Fixed ROM slots 13554 13555.
    13554, 21844, 13555, 21848,
// PORT: SOURCE P51-P53.agc:1926
//
// PORT: SOURCE P51-P53.agc:1927
//1.3SECDP	2DEC	130
// PORT: Fixed ROM slots 13556 13557.
    13556, 0, 13557, 260,
// PORT: SOURCE P51-P53.agc:1928
//
// PORT: SOURCE P51-P53.agc:1929
//20DEGSMN	DEC	-07199
// PORT: Fixed ROM slots 13558.
    13558, 51136,
// PORT: SOURCE P51-P53.agc:1930
//		DEC	-0
// PORT: Fixed ROM slots 13559.
    13559, 65534,
// PORT: SOURCE P51-P53.agc:1931
//
// PORT: SOURCE P51-P53.agc:1932
//# Page 778
// PORT: SOURCE P51-P53.agc:1933
//# THE ADVTRACK ROUTINE IS USED TO COMPUTE AN OPTICS LOS VECTOR TO
// PORT: SOURCE P51-P53.agc:1934
//# A POINT ON THE GROUND TRACK 60 DEGREES FORWARD OF THE LOCAL VERTICAL
// PORT: SOURCE P51-P53.agc:1935
//# OF AN ADVANCED ORBIT A SPECIFIED NUMBER OF REVOLUTIONS FROM NOW.
// PORT: SOURCE P51-P53.agc:1936
//
// PORT: SOURCE P51-P53.agc:1937
//		SETLOC	26P50S
// PORT: SOURCE P51-P53.agc:1938
//		BANK
// PORT: SOURCE P51-P53.agc:1939
//ADVTRACK	SETPD
// PORT: Fixed ROM slots 24576.
    24576, 65282,
// PORT: SOURCE P51-P53.agc:1940
//			0
// PORT: Fixed ROM slots 24577.
    24577, 2,
// PORT: SOURCE P51-P53.agc:1941
//		VLOAD	PUSH		# INITIALIZE FOR RP-TO-R
// PORT: Fixed ROM slots 24578.
    24578, 34554,
// PORT: SOURCE P51-P53.agc:1942
//			UNITZ		# UZ VEC IN PD 0-5
// PORT: Fixed ROM slots 24579.
    24579, 13742,
// PORT: SOURCE P51-P53.agc:1943
//		RTB	PUSH		# TIME IN PD 6-7
// PORT: Fixed ROM slots 24580.
    24580, 34360,
// PORT: SOURCE P51-P53.agc:1944
//			LOADTIME
// PORT: Fixed ROM slots 24581.
    24581, 38544,
// PORT: SOURCE P51-P53.agc:1945
//		STCALL	AOPTIME		# TIME ALSO IN AOPTIME FOR CSMCONIC
// PORT: Fixed ROM slots 24582.
    24582, 31196,
// PORT: SOURCE P51-P53.agc:1946
//			RP-TO-R		# GET MOON ROTATION VEC IN REF
// PORT: Fixed ROM slots 24583.
    24583, 46536,
// PORT: SOURCE P51-P53.agc:1947
//		STODL	STAR
// PORT: Fixed ROM slots 24584.
    24584, 15340,
// PORT: SOURCE P51-P53.agc:1948
//			AOPTIME		# PICK UP TIME
// PORT: Fixed ROM slots 24585.
    24585, 2524,
// PORT: SOURCE P51-P53.agc:1949
//		STCALL	TDEC1		# UPDATE STATE TO TIME
// PORT: Fixed ROM slots 24586.
    24586, 28738,
// PORT: SOURCE P51-P53.agc:1950
//			CSMCONIC
// PORT: Fixed ROM slots 24587.
    24587, 23704,
// PORT: SOURCE P51-P53.agc:1951
//		VLOAD	VXV
// PORT: Fixed ROM slots 24588.
    24588, 40442,
// PORT: SOURCE P51-P53.agc:1952
//			VATT
// PORT: Fixed ROM slots 24589.
    24589, 14,
// PORT: SOURCE P51-P53.agc:1953
//			RATT
// PORT: Fixed ROM slots 24590.
    24590, 2,
// PORT: SOURCE P51-P53.agc:1954
//		UNIT
// PORT: Fixed ROM slots 24591.
    24591, 65372,
// PORT: SOURCE P51-P53.agc:1955
//		STOVL	24D		# SAVE -UNIT(VxR) FOR 2ND ROTATION
// PORT: Fixed ROM slots 24592.
    24592, 20530,
// PORT: SOURCE P51-P53.agc:1956
//			RATT
// PORT: Fixed ROM slots 24593.
    24593, 2,
// PORT: SOURCE P51-P53.agc:1957
//		UNIT	VCOMP
// PORT: Fixed ROM slots 24594.
    24594, 48732,
// PORT: SOURCE P51-P53.agc:1958
//		SETPD	PUSH		# PUSH LOS=-UNIT(RVEC) PD 0-5
// PORT: Fixed ROM slots 24595.
    24595, 34306,
// PORT: SOURCE P51-P53.agc:1959
//			0
// PORT: Fixed ROM slots 24596.
    24596, 2,
// PORT: SOURCE P51-P53.agc:1960
//		EXIT
// PORT: Fixed ROM slots 24597.
    24597, 65532
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24598–24603.
function agcAotUnit1422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24600 {
        if slot <= 24598 {
// PORT: SOURCE P51-P53.agc:1961
//		CA	LANDMARK
// PORT: Fixed ROM slots 24598.
            if slot <> 24598 or instruction <> 13289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1001).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24599 {
// PORT: SOURCE P51-P53.agc:1962
//		MASK	SEVEN		# GET NUMBER OF ADVANCE PERIODS
// PORT: Fixed ROM slots 24599.
                if slot <> 24599 or instruction <> 31251 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    if fixedOperand = 7 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1963
//		EXTEND
// PORT: Fixed ROM slots 24600.
                if slot <> 24600 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24601 {
// PORT: SOURCE P51-P53.agc:1964
//		MP	BIT11		# GET N/16
// PORT: Fixed ROM slots 24601.
            if slot <> 24601 or instruction <> 31237 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2565, readEffective:call(words, 2565)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24602 {
// PORT: SOURCE P51-P53.agc:1965
//		XCH	L
// PORT: Fixed ROM slots 24602.
                if slot <> 24602 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:1966
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 24603.
                if slot <> 24603 or instruction <> 20560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1422] to agcAotUnit1422@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1967
//		TS	30D		# TEMP STORE N/16
// PORT: Fixed ROM slots 24604.
    24604, 45116
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24605–24605.
function agcAotUnit1423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:1968
//		TC	INTPRET
// PORT: Fixed ROM slots 24605.
    if slot <> 24605 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1423] to agcAotUnit1423@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:1969
//		SLOAD	DMP
// PORT: Fixed ROM slots 24606.
    24606, 34234,
// PORT: SOURCE P51-P53.agc:1970
//			30D
// PORT: Fixed ROM slots 24607.
    24607, 62,
// PORT: SOURCE P51-P53.agc:1971
//			MPERIOD
// PORT: Fixed ROM slots 24608.
    24608, 12430,
// PORT: SOURCE P51-P53.agc:1972
//		STCALL	AOPTIME		# ROTATE ANG ABOUT UR
// PORT: Fixed ROM slots 24609.
    24609, 31196,
// PORT: SOURCE P51-P53.agc:1973
//			ROTA
// PORT: Fixed ROM slots 24610.
    24610, 45150,
// PORT: SOURCE P51-P53.agc:1974
//		VLOAD
// PORT: Fixed ROM slots 24611.
    24611, 65530,
// PORT: SOURCE P51-P53.agc:1975
//			24D		# PICK UP 2ND ROTATION AXIS
// PORT: Fixed ROM slots 24612.
    24612, 50,
// PORT: SOURCE P51-P53.agc:1976
//		STODL	STAR
// PORT: Fixed ROM slots 24613.
    24613, 15340,
// PORT: SOURCE P51-P53.agc:1977
//			DP1/6
// PORT: Fixed ROM slots 24614.
    24614, 12426,
// PORT: SOURCE P51-P53.agc:1978
//		DSU
// PORT: Fixed ROM slots 24615.
    24615, 65322,
// PORT: SOURCE P51-P53.agc:1979
//			AOPTIME		# 2ND RAT ANGLE = 60 - A
// PORT: Fixed ROM slots 24616.
    24616, 2524,
// PORT: SOURCE P51-P53.agc:1980
//		STCALL	AOPTIME
// PORT: Fixed ROM slots 24617.
    24617, 31196,
// PORT: SOURCE P51-P53.agc:1981
//			ROTA		# GO ROTATE 2ND TIME
// PORT: Fixed ROM slots 24618.
    24618, 45150,
// PORT: SOURCE P51-P53.agc:1982
//		VLOAD
// PORT: Fixed ROM slots 24619.
    24619, 65530,
// PORT: SOURCE P51-P53.agc:1983
//# Page 779
// PORT: SOURCE P51-P53.agc:1984
//			0
// PORT: Fixed ROM slots 24620.
    24620, 2,
// PORT: SOURCE P51-P53.agc:1985
//		STCALL	STAR		# STORE FINAL LOS IN STAR
// PORT: Fixed ROM slots 24621.
    24621, 31724,
// PORT: SOURCE P51-P53.agc:1986
//			COM52		# RETURN TO SR52.1
// PORT: Fixed ROM slots 24622.
    24622, 22956,
// PORT: SOURCE P51-P53.agc:1987
//
// PORT: SOURCE P51-P53.agc:1988
//ROTA		DLOAD	SIN
// PORT: Fixed ROM slots 24623.
    24623, 61130,
// PORT: SOURCE P51-P53.agc:1989
//			AOPTIME
// PORT: Fixed ROM slots 24624.
    24624, 2524,
// PORT: SOURCE P51-P53.agc:1990
//		PDVL	VXV		# PUSH 1/2SIN(A) PD 6-7
// PORT: Fixed ROM slots 24625.
    24625, 40346,
// PORT: SOURCE P51-P53.agc:1991
//			STAR		#	UR VEC
// PORT: Fixed ROM slots 24626.
    24626, 3052,
// PORT: SOURCE P51-P53.agc:1992
//			0		#	LOS
// PORT: Fixed ROM slots 24627.
    24627, 2,
// PORT: SOURCE P51-P53.agc:1993
//		VXSC	VSL2		# 1/2SIN(A)(URXLOS) PD 6-11
// PORT: Fixed ROM slots 24628.
    24628, 60130,
// PORT: SOURCE P51-P53.agc:1994
//		PDVL	DOT
// PORT: Fixed ROM slots 24629.
    24629, 41370,
// PORT: SOURCE P51-P53.agc:1995
//			STAR
// PORT: Fixed ROM slots 24630.
    24630, 3052,
// PORT: SOURCE P51-P53.agc:1996
//			0
// PORT: Fixed ROM slots 24631.
    24631, 2,
// PORT: SOURCE P51-P53.agc:1997
//		VXSC	VSL2
// PORT: Fixed ROM slots 24632.
    24632, 60130,
// PORT: SOURCE P51-P53.agc:1998
//			STAR
// PORT: Fixed ROM slots 24633.
    24633, 3052,
// PORT: SOURCE P51-P53.agc:1999
//		PDDL	COS		# 1/2(UR . LOS)UR 12-17
// PORT: Fixed ROM slots 24634.
    24634, 59050,
// PORT: SOURCE P51-P53.agc:2000
//			AOPTIME
// PORT: Fixed ROM slots 24635.
    24635, 2524,
// PORT: SOURCE P51-P53.agc:2001
//		PDVL	BVSU		# PUSH 1/2COS(A) 18-19
// PORT: Fixed ROM slots 24636.
    24636, 42394,
// PORT: SOURCE P51-P53.agc:2002
//			12D
// PORT: Fixed ROM slots 24637.
    24637, 26,
// PORT: SOURCE P51-P53.agc:2003
//			0
// PORT: Fixed ROM slots 24638.
    24638, 2,
// PORT: SOURCE P51-P53.agc:2004
//		VXSC	VSL1		# UP 18-19
// PORT: Fixed ROM slots 24639.
    24639, 64226,
// PORT: SOURCE P51-P53.agc:2005
//		VAD	VAD		# UP 12-17 UP 6011
// PORT: Fixed ROM slots 24640.
    24640, 44378,
// PORT: SOURCE P51-P53.agc:2006
//		UNIT	SETPD
// PORT: Fixed ROM slots 24641.
    24641, 33116,
// PORT: SOURCE P51-P53.agc:2007
//			0
// PORT: Fixed ROM slots 24642.
    24642, 2,
// PORT: SOURCE P51-P53.agc:2008
//		PUSH	RVQ
// PORT: Fixed ROM slots 24643.
    24643, 36364,
// PORT: SOURCE P51-P53.agc:2009
//
// PORT: SOURCE P51-P53.agc:2010
//DP1/6		2DEC	.16666666
// PORT: Fixed ROM slots 24644 24645.
    24644, 5460, 24645, 21842,
// PORT: SOURCE P51-P53.agc:2011
//
// PORT: SOURCE P51-P53.agc:2012
//MPERIOD		2DEC	.047619		# APPROX LUNAR ROT ANG IN 2HRS x 16
// PORT: Fixed ROM slots 24646 24647.
    24646, 1560, 24647, 6216,
// PORT: SOURCE P51-P53.agc:2013
//
// PORT: SOURCE P51-P53.agc:2014
//# Page 780
// PORT: SOURCE P51-P53.agc:2015
//# NAME -- S52.3
// PORT: SOURCE P51-P53.agc:2016
//# FUNCTION --	XSMD= UNIT(YSMD x ZSMD)
// PORT: SOURCE P51-P53.agc:2017
//#		YSMD= UNIT(V X R)
// PORT: SOURCE P51-P53.agc:2018
//#		ZSMD= UNIT(-R)
// PORT: SOURCE P51-P53.agc:2019
//# CALL --	DLOAD	CALL
// PORT: SOURCE P51-P53.agc:2020
//#			TALIGN
// PORT: SOURCE P51-P53.agc:2021
//#			S52.3
// PORT: SOURCE P51-P53.agc:2022
//# INPUT --	TIME OF ALIGNMENT IN MPAC
// PORT: SOURCE P51-P53.agc:2023
//# OUTPUT --	X,Y,ZSMD
// PORT: SOURCE P51-P53.agc:2024
//# SUBROUTINES -- CSMCONIC
// PORT: SOURCE P51-P53.agc:2025
//
// PORT: SOURCE P51-P53.agc:2026
//		SETLOC	P50S2
// PORT: SOURCE P51-P53.agc:2027
//		BANK
// PORT: SOURCE P51-P53.agc:2028
//
// PORT: SOURCE P51-P53.agc:2029
//		COUNT	15/S52.3
// PORT: SOURCE P51-P53.agc:2030
//S52.3		STQ
// PORT: Fixed ROM slots 16817.
    16817, 65312,
// PORT: SOURCE P51-P53.agc:2031
//			QMAJ
// PORT: Fixed ROM slots 16818.
    16818, 384,
// PORT: SOURCE P51-P53.agc:2032
//		STCALL	TDEC1
// PORT: Fixed ROM slots 16819.
    16819, 28738,
// PORT: SOURCE P51-P53.agc:2033
//			CSMPREC
// PORT: Fixed ROM slots 16820.
    16820, 23666,
// PORT: SOURCE P51-P53.agc:2034
//		SETPD
// PORT: Fixed ROM slots 16821.
    16821, 65282,
// PORT: SOURCE P51-P53.agc:2035
//			0
// PORT: Fixed ROM slots 16822.
    16822, 2,
// PORT: SOURCE P51-P53.agc:2036
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 16823.
    16823, 48890,
// PORT: SOURCE P51-P53.agc:2037
//			RATT
// PORT: Fixed ROM slots 16824.
    16824, 2,
// PORT: SOURCE P51-P53.agc:2038
//		UNIT
// PORT: Fixed ROM slots 16825.
    16825, 65372,
// PORT: SOURCE P51-P53.agc:2039
//		STOVL	ZSMD
// PORT: Fixed ROM slots 16826.
    16826, 20902,
// PORT: SOURCE P51-P53.agc:2040
//			VATT
// PORT: Fixed ROM slots 16827.
    16827, 14,
// PORT: SOURCE P51-P53.agc:2041
//		VXV	UNIT
// PORT: Fixed ROM slots 16828.
    16828, 44602,
// PORT: SOURCE P51-P53.agc:2042
//			RATT
// PORT: Fixed ROM slots 16829.
    16829, 2,
// PORT: SOURCE P51-P53.agc:2043
//		STORE	YSMD
// PORT: Fixed ROM slots 16830.
    16830, 410,
// PORT: SOURCE P51-P53.agc:2044
//		VXV	UNIT
// PORT: Fixed ROM slots 16831.
    16831, 44602,
// PORT: SOURCE P51-P53.agc:2045
//			ZSMD
// PORT: Fixed ROM slots 16832.
    16832, 422,
// PORT: SOURCE P51-P53.agc:2046
//		STCALL	XSMD
// PORT: Fixed ROM slots 16833.
    16833, 29070,
// PORT: SOURCE P51-P53.agc:2047
//			QMAJ
// PORT: Fixed ROM slots 16834.
    16834, 384,
// PORT: SOURCE P51-P53.agc:2048
//
// PORT: SOURCE P51-P53.agc:2049
//# Page 781
// PORT: SOURCE P51-P53.agc:2050
//# PROGRAM DESCRIPTION:  R56 -- ALTERNATE LOS SIGHTING MARK ROUTINE
// PORT: SOURCE P51-P53.agc:2051
//#
// PORT: SOURCE P51-P53.agc:2052
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P51-P53.agc:2053
//#
// PORT: SOURCE P51-P53.agc:2054
//#	TO PERFORM SIGHTING MARKS FOR THE BACK-UP ALIGNMENT PROGRAMS (P53,P54).  THE ASTRONAUT KNOWS THE
// PORT: SOURCE P51-P53.agc:2055
//#	COORDINATES (OPTICS) OF THE ALTERNATE LINE OF SIGHT HE MUST USE FOR THIS ROUTINE.  WHEN THE ASTRONAUT KEYS IN
// PORT: SOURCE P51-P53.agc:2056
//#	ENTER IN RESPONSE TO THE FLASHING V50 N25 R1-XXXXX THE CMC STORES THE THREE ICDU ANGLES AND TWO ANGLES DISPLAYED
// PORT: SOURCE P51-P53.agc:2057
//#	IN N92.
// PORT: SOURCE P51-P53.agc:2058
//#
// PORT: SOURCE P51-P53.agc:2059
//# CALLING SEQUENCE
// PORT: SOURCE P51-P53.agc:2060
//#
// PORT: SOURCE P51-P53.agc:2061
//#	CALL
// PORT: SOURCE P51-P53.agc:2062
//#		R56
// PORT: SOURCE P51-P53.agc:2063
//#
// PORT: SOURCE P51-P53.agc:2064
//# SUBROUTINES CALLED
// PORT: SOURCE P51-P53.agc:2065
//#
// PORT: SOURCE P51-P53.agc:2066
//#	A PORTION OF SXTMARK (VAC.AREA SEARCH)
// PORT: SOURCE P51-P53.agc:2067
//#	GOFLASH
// PORT: SOURCE P51-P53.agc:2068
//#	GOPERF1
// PORT: SOURCE P51-P53.agc:2069
//#
// PORT: SOURCE P51-P53.agc:2070
//# ERASABLE INITIALIZATION
// PORT: SOURCE P51-P53.agc:2071
//#
// PORT: SOURCE P51-P53.agc:2072
//#	STARIND:  INDEX TO STAR NUMBER
// PORT: SOURCE P51-P53.agc:2073
//#
// PORT: SOURCE P51-P53.agc:2074
//# OUTPUT
// PORT: SOURCE P51-P53.agc:2075
//#
// PORT: SOURCE P51-P53.agc:2076
//#	MARKSTAT:  INDEX TO VAC.AREA WHERE OUTPUT IS STORED.
// PORT: SOURCE P51-P53.agc:2077
//#	BESTI (INDEXED BY STARIND) CONTAINS STAR NUMBER.
// PORT: SOURCE P51-P53.agc:2078
//#	ICDU AND OCDU ANGLES IN VAC. AREA AS FOLLOWS:
// PORT: SOURCE P51-P53.agc:2079
//#		VAC +2	CDUY
// PORT: SOURCE P51-P53.agc:2080
//#		VAC +3	CDUS
// PORT: SOURCE P51-P53.agc:2081
//#		VAC +4	CDUZ
// PORT: SOURCE P51-P53.agc:2082
//#		VAC +5	CDUT
// PORT: SOURCE P51-P53.agc:2083
//#		VAC +6	CDUX
// PORT: SOURCE P51-P53.agc:2084
//
// PORT: SOURCE P51-P53.agc:2085
//		COUNT*	$$/R56
// PORT: SOURCE P51-P53.agc:2086
//		SETLOC	P50S3
// PORT: SOURCE P51-P53.agc:2087
//		BANK
// PORT: SOURCE P51-P53.agc:2088
//R56		STQ	EXIT
// PORT: Fixed ROM slots 17454.
    17454, 65056,
// PORT: SOURCE P51-P53.agc:2089
//			R53EXIT
// PORT: Fixed ROM slots 17455.
    17455, 3714
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17456–17457.
function agcAotUnit990 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17456 {
// PORT: SOURCE P51-P53.agc:2090
//		CAF	V06N94B
// PORT: Fixed ROM slots 17456.
        if slot <> 17456 or instruction <> 13414 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1126), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2091
//		TC	BANKCALL
// PORT: Fixed ROM slots 17457.
        if slot <> 17457 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[990] to agcAotUnit990@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2092
//		CADR	GOFLASH
// PORT: Fixed ROM slots 17458.
    17458, 17312
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17459–17462.
function agcAotUnit991 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17460 {
        if slot <= 17459 {
// PORT: SOURCE P51-P53.agc:2093
//		TC	GOTOPOOH	# TERM.
// PORT: Fixed ROM slots 17459.
            if slot <> 17459 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2094
//		TC	R56A		# PROCEED:  ANGLES OK
// PORT: Fixed ROM slots 17460.
            if slot <> 17460 or instruction <> 1078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17461 {
// PORT: SOURCE P51-P53.agc:2095
//		TC	-5		# ENTER:  NEW ANGLES
// PORT: Fixed ROM slots 17461.
            if slot <> 17461 or instruction <> 1072 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1072, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2096
//R56A		TC	BANKCALL
// PORT: Fixed ROM slots 17462.
            if slot <> 17462 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[991] to agcAotUnit991@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2097
//		CADR	SXTMARK +2	# INHIBIR EXT VB ACT AND FIND VAC AREA
// PORT: Fixed ROM slots 17463.
    17463, 14344
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17464–17465.
function agcAotUnit992 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17464 {
// PORT: SOURCE P51-P53.agc:2098
//
// PORT: SOURCE P51-P53.agc:2099
//		CAF	ZERO
// PORT: Fixed ROM slots 17464.
        if slot <> 17464 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2100
//		TC	BANKCALL
// PORT: Fixed ROM slots 17465.
        if slot <> 17465 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[992] to agcAotUnit992@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2101
//		CADR	CLEANDSP
// PORT: Fixed ROM slots 17466.
    17466, 17286
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17467–17468.
function agcAotUnit993 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17467 {
// PORT: SOURCE P51-P53.agc:2102
//
// PORT: SOURCE P51-P53.agc:2103
//R56A1		CAF	VB53		# DISPLAY V53 REQUESTING ALTERNATE MARK
// PORT: Fixed ROM slots 17467.
        if slot <> 17467 or instruction <> 13413 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1125), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2104
//		TC	BANKCALL
// PORT: Fixed ROM slots 17468.
        if slot <> 17468 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[993] to agcAotUnit993@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2105
//# Page 782
// PORT: SOURCE P51-P53.agc:2106
//		CADR	GOMARK2
// PORT: Fixed ROM slots 17469.
    17469, 17128
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17470–17472.
function agcAotUnit994 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17470 {
// PORT: SOURCE P51-P53.agc:2107
//		TCF	GOTOPOOH	# V34:  TERMINATE
// PORT: Fixed ROM slots 17470.
        if slot <> 17470 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17471 {
// PORT: SOURCE P51-P53.agc:2108
//		TCF	R56A1		# V33:  DON'T PROCEED -- JUST ENTER TO MARK
// PORT: Fixed ROM slots 17471.
            if slot <> 17471 or instruction <> 5179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2109
//		TC	INTPRET
// PORT: Fixed ROM slots 17472.
            if slot <> 17472 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[994] to agcAotUnit994@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2110
//		DLOAD
// PORT: Fixed ROM slots 17473.
    17473, 65482,
// PORT: SOURCE P51-P53.agc:2111
//			MRKBUF1 +3
// PORT: Fixed ROM slots 17474.
    17474, 4018,
// PORT: SOURCE P51-P53.agc:2112
//		STODL	SAC
// PORT: Fixed ROM slots 17475.
    17475, 15352,
// PORT: SOURCE P51-P53.agc:2113
//			MRKBUF1 +5
// PORT: Fixed ROM slots 17476.
    17476, 4022,
// PORT: SOURCE P51-P53.agc:2114
//		STORE	PAC
// PORT: Fixed ROM slots 17477.
    17477, 3068,
// PORT: SOURCE P51-P53.agc:2115
//		EXIT
// PORT: Fixed ROM slots 17478.
    17478, 65532
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17479–17482.
function agcAotUnit995 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17480 {
        if slot <= 17479 {
// PORT: SOURCE P51-P53.agc:2116
//		INHINT
// PORT: Fixed ROM slots 17479.
            if slot <> 17479 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2117
//		EXTEND
// PORT: Fixed ROM slots 17480.
            if slot <> 17480 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17481 {
// PORT: SOURCE P51-P53.agc:2118
//		DCA	TIME2
// PORT: Fixed ROM slots 17481.
            if slot <> 17481 or instruction <> 12309 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2119
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17482.
            if slot <> 17482 or instruction <> 21208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21208, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[995] to agcAotUnit995@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2120
//		DXCH	0
// PORT: Fixed ROM slots 17483.
    17483, 43010
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17484–17485.
function agcAotUnit996 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17484 {
// PORT: SOURCE P51-P53.agc:2121
//		CA	CDUY		# ENTER:  THIS IS A BACKUP SYSTEM MARK
// PORT: Fixed ROM slots 17484.
        if slot <> 17484 or instruction <> 12315 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 27).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2122
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17485.
        if slot <> 17485 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[996] to agcAotUnit996@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2123
//		TS	2
// PORT: Fixed ROM slots 17486.
    17486, 45060
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17487–17488.
function agcAotUnit997 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17487 {
// PORT: SOURCE P51-P53.agc:2124
//		CA	SAC
// PORT: Fixed ROM slots 17487.
        if slot <> 17487 or instruction <> 13307 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 1019).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2125
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17488.
        if slot <> 17488 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[997] to agcAotUnit997@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2126
//		TS	3
// PORT: Fixed ROM slots 17489.
    17489, 45062
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17490–17491.
function agcAotUnit998 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17490 {
// PORT: SOURCE P51-P53.agc:2127
//		CA	CDUZ
// PORT: Fixed ROM slots 17490.
        if slot <> 17490 or instruction <> 12316 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 28).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2128
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17491.
        if slot <> 17491 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[998] to agcAotUnit998@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2129
//		TS	4
// PORT: Fixed ROM slots 17492.
    17492, 45064
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17493–17494.
function agcAotUnit999 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17493 {
// PORT: SOURCE P51-P53.agc:2130
//		CA	PAC
// PORT: Fixed ROM slots 17493.
        if slot <> 17493 or instruction <> 13309 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 1021).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2131
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17494.
        if slot <> 17494 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[999] to agcAotUnit999@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2132
//		TS	5
// PORT: Fixed ROM slots 17495.
    17495, 45066
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17496–17497.
function agcAotUnit1000 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17496 {
// PORT: SOURCE P51-P53.agc:2133
//		CA	CDUX
// PORT: Fixed ROM slots 17496.
        if slot <> 17496 or instruction <> 12314 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 26).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P51-P53.agc:2134
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 17497.
        if slot <> 17497 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1000] to agcAotUnit1000@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2135
//		TS	6
// PORT: Fixed ROM slots 17498.
    17498, 45068
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17499–17502.
function agcAotUnit1001 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17500 {
        if slot <= 17499 {
// PORT: SOURCE P51-P53.agc:2136
//		RELINT
// PORT: Fixed ROM slots 17499.
            if slot <> 17499 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2137
//		TC	CLEARMRK	# ENABLE EXTENDED VERBS
// PORT: Fixed ROM slots 17500.
            if slot <> 17500 or instruction <> 2910 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2910, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17501 {
// PORT: SOURCE P51-P53.agc:2138
//		CAF	OCT16
// PORT: Fixed ROM slots 17501.
            if slot <> 17501 or instruction <> 14555 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2267), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2139
//		TC	BANKCALL
// PORT: Fixed ROM slots 17502.
            if slot <> 17502 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1001] to agcAotUnit1001@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2140
//		CADR	GOPERF1
// PORT: Fixed ROM slots 17503.
    17503, 17482
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17504–17507.
function agcAotUnit1002 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17505 {
        if slot <= 17504 {
// PORT: SOURCE P51-P53.agc:2141
//		TC	GOTOPOOH	# TERM.
// PORT: Fixed ROM slots 17504.
            if slot <> 17504 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2142
//		TCF	R56B		# PROCEED:  MARK COMPLETED
// PORT: Fixed ROM slots 17505.
            if slot <> 17505 or instruction <> 5219 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5219, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17506 {
// PORT: SOURCE P51-P53.agc:2143
//		TCF	R56A 	+2	# RECYCLE:  DO ANOTHER MARK -- LIKE REJECT.
// PORT: Fixed ROM slots 17506.
            if slot <> 17506 or instruction <> 5176 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5176, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2144
//R56B		TC	BANKCALL
// PORT: Fixed ROM slots 17507.
            if slot <> 17507 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1002] to agcAotUnit1002@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2145
//		CADR	R53C1
// PORT: Fixed ROM slots 17508.
    17508, 26044,
// PORT: SOURCE P51-P53.agc:2146
//VB53		VN	05300		# ALTERNATE MARK VERB
// PORT: Fixed ROM slots 17509.
    17509, 13568,
// PORT: SOURCE P51-P53.agc:2147
//V06N94B		VN	00694
// PORT: Fixed ROM slots 17510.
    17510, 1724,
// PORT: SOURCE P51-P53.agc:2148
//		SETLOC	P50S
// PORT: SOURCE P51-P53.agc:2149
//		BANK
// PORT: SOURCE P51-P53.agc:2150
//
// PORT: SOURCE P51-P53.agc:2151
//PLANET		STORE	TSIGHT
// PORT: Fixed ROM slots 15584.
    15584, 2830,
// PORT: SOURCE P51-P53.agc:2152
//		STQ	CALL
// PORT: Fixed ROM slots 15585.
    15585, 37920,
// PORT: SOURCE P51-P53.agc:2153
//			QMIN
// PORT: Fixed ROM slots 15586.
    15586, 3070,
// PORT: SOURCE P51-P53.agc:2154
//			LOCSAM
// PORT: Fixed ROM slots 15587.
    15587, 24874,
// PORT: SOURCE P51-P53.agc:2155
//		VLOAD
// PORT: Fixed ROM slots 15588.
    15588, 65530,
// PORT: SOURCE P51-P53.agc:2156
//# Page 783
// PORT: SOURCE P51-P53.agc:2157
//			VEARTH
// PORT: Fixed ROM slots 15589.
    15589, 3004,
// PORT: SOURCE P51-P53.agc:2158
//		STOVL	0D
// PORT: Fixed ROM slots 15590.
    15590, 20482,
// PORT: SOURCE P51-P53.agc:2159
//			VSUN
// PORT: Fixed ROM slots 15591.
    15591, 3016,
// PORT: SOURCE P51-P53.agc:2160
//		STOVL	VEARTH
// PORT: Fixed ROM slots 15592.
    15592, 23484,
// PORT: SOURCE P51-P53.agc:2161
//			0D
// PORT: Fixed ROM slots 15593.
    15593, 2,
// PORT: SOURCE P51-P53.agc:2162
//		STORE 	VSUN
// PORT: Fixed ROM slots 15594.
    15594, 3016,
// PORT: SOURCE P51-P53.agc:2163
//NOSAM		EXIT
// PORT: Fixed ROM slots 15595.
    15595, 65532
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15596–15601.
function agcAotUnit905 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15598 {
        if slot <= 15596 {
// PORT: SOURCE P51-P53.agc:2164
//		CS	HIGH9
// PORT: Fixed ROM slots 15596.
            if slot <> 15596 or instruction <> 20427 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15597 {
// PORT: SOURCE P51-P53.agc:2165
//		MASK	STARCODE
// PORT: Fixed ROM slots 15597.
                if slot <> 15597 or instruction <> 29149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 477).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:2166
//		EXTEND
// PORT: Fixed ROM slots 15598.
                if slot <> 15598 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15599 {
// PORT: SOURCE P51-P53.agc:2167
//		MP	SIGHTSIX
// PORT: Fixed ROM slots 15599.
            if slot <> 15599 or instruction <> 31881 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 3209, readEffective:call(words, 3209)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15600 {
// PORT: SOURCE P51-P53.agc:2168
//		XCH	L
// PORT: Fixed ROM slots 15600.
                if slot <> 15600 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:2169
//		INDEX	STARIND
// PORT: Fixed ROM slots 15601.
                if slot <> 15601 or instruction <> 20676 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20676, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20676, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[905] to agcAotUnit905@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2170
//		TS	BESTI
// PORT: Fixed ROM slots 15602.
    15602, 45444
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15603–15606.
function agcAotUnit906 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15604 {
        if slot <= 15603 {
// PORT: SOURCE P51-P53.agc:2171
//		CCS	A
// PORT: Fixed ROM slots 15603.
            if slot <> 15603 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2172
//		TCF	NOTPLAN
// PORT: Fixed ROM slots 15604.
            if slot <> 15604 or instruction <> 5377 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5377, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15605 {
// PORT: SOURCE P51-P53.agc:2173
//		CAF	VNPLANV
// PORT: Fixed ROM slots 15605.
            if slot <> 15605 or instruction <> 13593 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1305), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2174
//		TC	BANKCALL
// PORT: Fixed ROM slots 15606.
            if slot <> 15606 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[906] to agcAotUnit906@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2175
//		CADR	GOFLASH
// PORT: Fixed ROM slots 15607.
    15607, 17312
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15608–15611.
function agcAotUnit907 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15609 {
        if slot <= 15608 {
// PORT: SOURCE P51-P53.agc:2176
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 15608.
            if slot <> 15608 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2177
//		TC	+2
// PORT: Fixed ROM slots 15609.
            if slot <> 15609 or instruction <> 1275 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1275, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15610 {
// PORT: SOURCE P51-P53.agc:2178
//		TC	-5
// PORT: Fixed ROM slots 15610.
            if slot <> 15610 or instruction <> 1269 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1269, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2179
//		TC	INTPRET
// PORT: Fixed ROM slots 15611.
            if slot <> 15611 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[907] to agcAotUnit907@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2180
//		VLOAD	VXSC
// PORT: Fixed ROM slots 15612.
    15612, 61946,
// PORT: SOURCE P51-P53.agc:2181
//			STARSAV3
// PORT: Fixed ROM slots 15613.
    15613, 3978,
// PORT: SOURCE P51-P53.agc:2182
//			1/SQR3
// PORT: Fixed ROM slots 15614.
    15614, 27190,
// PORT: SOURCE P51-P53.agc:2183
//		UNIT	GOTO
// PORT: Fixed ROM slots 15615.
    15615, 43100,
// PORT: SOURCE P51-P53.agc:2184
//			CORPLAN
// PORT: Fixed ROM slots 15616.
    15616, 27176
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15617–15621.
function agcAotUnit908 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15618 {
        if slot <= 15617 {
// PORT: SOURCE P51-P53.agc:2185
//NOTPLAN		CS	A
// PORT: Fixed ROM slots 15617.
            if slot <> 15617 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P51-P53.agc:2186
//		AD	DEC227
// PORT: Fixed ROM slots 15618.
            if slot <> 15618 or instruction <> 25880 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1304), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15619 {
// PORT: SOURCE P51-P53.agc:2187
//		EXTEND
// PORT: Fixed ROM slots 15619.
            if slot <> 15619 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15620 {
// PORT: SOURCE P51-P53.agc:2188
//		BZMF	CALSAM1
// PORT: Fixed ROM slots 15620.
                if slot <> 15620 or instruction <> 25869 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25869, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P51-P53.agc:2189
//		INDEX	STARIND
// PORT: Fixed ROM slots 15621.
                if slot <> 15621 or instruction <> 20676 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20676, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20676, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[908] to agcAotUnit908@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2190
//		CA	BESTI
// PORT: Fixed ROM slots 15622.
    15622, 24964
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15623–15623.
function agcAotUnit909 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:2191
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 15623.
    if slot <> 15623 or instruction <> 20560 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[909] to agcAotUnit909@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2192
//		TS	X1
// PORT: Fixed ROM slots 15624.
    15624, 45132
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15625–15625.
function agcAotUnit910 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:2193
//		TC	INTPRET
// PORT: Fixed ROM slots 15625.
    if slot <> 15625 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[910] to agcAotUnit910@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2194
//		VLOAD*	GOTO
// PORT: Fixed ROM slots 15626.
    15626, 43254,
// PORT: SOURCE P51-P53.agc:2195
//			CATLOG,1
// PORT: Fixed ROM slots 15627.
    15627, 26594,
// PORT: SOURCE P51-P53.agc:2196
//			CORPLAN
// PORT: Fixed ROM slots 15628.
    15628, 27176
)).

// PORT: Physical bank 15. Shared continuation entries, slots 15629–15629.
function agcAotUnit911 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P51-P53.agc:2197
//CALSAM1		TC	INTPRET
// PORT: Fixed ROM slots 15629.
    if slot <> 15629 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[911] to agcAotUnit911@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P51-P53.agc:2198
//		LXC,1	DLOAD*
// PORT: Fixed ROM slots 15630.
    15630, 58304,
// PORT: SOURCE P51-P53.agc:2199
//			STARIND
// PORT: Fixed ROM slots 15631.
    15631, 392,
// PORT: SOURCE P51-P53.agc:2200
//			BESTI,1
// PORT: Fixed ROM slots 15632.
    15632, 390,
// PORT: SOURCE P51-P53.agc:2201
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 15633.
    15633, 64448,
// PORT: SOURCE P51-P53.agc:2202
//			MPAC
// PORT: Fixed ROM slots 15634.
    15634, 216,
// PORT: SOURCE P51-P53.agc:2203
//			STARAD 	-228D,1
// PORT: Fixed ROM slots 15635.
    15635, 2548,
// PORT: SOURCE P51-P53.agc:2204
//CORPLAN		VAD	UNIT
// PORT: Fixed ROM slots 15636.
    15636, 44634,
// PORT: SOURCE P51-P53.agc:2205
//			VEL/C
// PORT: Fixed ROM slots 15637.
    15637, 3704,
// PORT: SOURCE P51-P53.agc:2206
//		GOTO
// PORT: Fixed ROM slots 15638.
    15638, 65360,
// PORT: SOURCE P51-P53.agc:2207
//# Page 784
// PORT: SOURCE P51-P53.agc:2208
//			QMIN
// PORT: Fixed ROM slots 15639.
    15639, 3070,
// PORT: SOURCE P51-P53.agc:2209
//DEC227		DEC	227
// PORT: Fixed ROM slots 15640.
    15640, 454,
// PORT: SOURCE P51-P53.agc:2210
//VNPLANV		VN	0688
// PORT: Fixed ROM slots 15641.
    15641, 1712,
// PORT: SOURCE P51-P53.agc:2211
//1/SQR3		2DEC	.57735021
// PORT: Fixed ROM slots 15642 15643.
    15642, 18918, 15643, 10022
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P51-P53.agc:2212
//
// PORT: SOURCE P51-P53.agc:2213
//
