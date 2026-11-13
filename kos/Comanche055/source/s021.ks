// PORT: Original source unit IMU_CALIBRATION_AND_ALIGNMENT.agc.
// PORT: Physical bank 33. Shared continuation entries, slots 29700–29710.
function agcAotUnit1628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29704 {
        if slot <= 29701 {
            if slot <= 29700 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:2
//# Filename:	IMU_CALIBRATION_AND_ALIGNMENT.agc
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:7
//# Reference:    pp. 423-455
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:8
//# Contact:      Onno Hommes <ohommes@cmu.edu>
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:10
//# Mod history:  2009-05-10 OH	Batch 1 Assignment Comanche Transcription
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:11
//#		2009-05-20 RSB	Corrections: P00D00H -> P00DOOH, definition
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:12
//#				of 25DECML fixed.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:13
//#		2009-05-23 RSB	At SPECSTS, corrected to PRIO22.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:14
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:15
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:16
//# from scanned documents.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:17
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:18
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:19
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:20
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:21
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:22
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:23
//#       Prepared by
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:24
//#                       Massachusetts Institute of Technology
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:25
//#                       75 Cambridge Parkway
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:26
//#                       Cambridge, Massachusetts
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:27
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:28
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:29
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:30
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:31
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:32
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:33
//# Page 423
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:34
//# NAME- IMU PERFORMANCE TESTS 2
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:35
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:36
//# DATE- MARCH 20,1967
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:37
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:38
//# BY- SYSTEM TEST GROUP 864-6900 EXT. 1274
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:39
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:40
//# MODNO.- ZERO
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:41
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:42
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:43
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:44
//# POSITIONING ROUTINES FOR THE IMU PERFORMANCE TESTS AS WELL AS SOME OF
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:45
//# THE TESTS THEMSELVES.  FOR A DESCRIPTION OF THESE SUBROUTINES AND THE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:46
//# OPERATING PROCEDURES (TYPICALLY) SEE STG MEMO 685.THEORETICAL REF.E-1973
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:47
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:48
//		BANK	33
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:49
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:50
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:51
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:52
//		EBANK=	POSITON
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:53
//IMUTEST		CA	ZERO
// PORT: Fixed ROM slots 29700.
                if slot <> 29700 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:54
//		TS	DRIFTT
// PORT: Fixed ROM slots 29701.
                if slot <> 29701 or instruction <> 23338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23338, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29702 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:55
//		TS	GEOCOMP1
// PORT: Fixed ROM slots 29702.
                if slot <> 29702 or instruction <> 23459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29703 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:56
//		CAF	TESTTIME
// PORT: Fixed ROM slots 29703.
                    if slot <> 29703 or instruction <> 13603 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1315), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:57
//		TS	LENGTHOT
// PORT: Fixed ROM slots 29704.
                    if slot <> 29704 or instruction <> 23306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23306, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29707 {
            if slot <= 29705 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:58
//		TC	COAALIGN		# TAKE CARE OF DRIFT FLAG
// PORT: Fixed ROM slots 29705.
                if slot <> 29705 or instruction <> 1218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1218, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29706 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:59
//		CAF	1SECX
// PORT: Fixed ROM slots 29706.
                    if slot <> 29706 or instruction <> 14881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:60
//		TS	1SECXT1
// PORT: Fixed ROM slots 29707.
                    if slot <> 29707 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29708 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:61
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:62
//		CA	OC14400
// PORT: Fixed ROM slots 29708.
                if slot <> 29708 or instruction <> 13601 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1313), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29709 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:63
//		TS	1/PIPADT
// PORT: Fixed ROM slots 29709.
                    if slot <> 29709 or instruction <> 23100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:64
//GUESS		TC	INTPRET			# CALCULATE -COS LATITUDE AND SIN LATITUDE
// PORT: Fixed ROM slots 29710.
                    if slot <> 29710 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1628] to agcAotUnit1628@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:65
//		CALL
// PORT: Fixed ROM slots 29711.
    29711, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:66
//			LATAZCHK
// PORT: Fixed ROM slots 29712.
    29712, 8982,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:67
//		COS	DCOMP
// PORT: Fixed ROM slots 29713.
    29713, 48844,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:68
//		SL1
// PORT: Fixed ROM slots 29714.
    29714, 65492,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:69
//		STODL	WANGI
// PORT: Fixed ROM slots 29715.
    29715, 14926,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:70
//			LATITUDE
// PORT: Fixed ROM slots 29716.
    29716, 2566,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:71
//		SIN	SL1
// PORT: Fixed ROM slots 29717.
    29717, 60124,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:72
//		STORE	WANGO
// PORT: Fixed ROM slots 29718.
    29718, 2634,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:73
//		EXIT
// PORT: Fixed ROM slots 29719.
    29719, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29720–29720.
function agcAotUnit1629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:74
//GEOIMUTT	TC	BANKCALL		# GYROCOMPASS COMES IN HERE
// PORT: Fixed ROM slots 29720.
    if slot <> 29720 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1629] to agcAotUnit1629@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:75
//		CADR	IMUZERO
// PORT: Fixed ROM slots 29721.
    29721, 15102
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29722–29733.
function agcAotUnit1630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29727 {
        if slot <= 29724 {
            if slot <= 29722 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:76
//		TC	IMUSTLLG
// PORT: Fixed ROM slots 29722.
                if slot <> 29722 or instruction <> 1230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1230, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29723 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:77
//IMUBACK		CA	ZERO
// PORT: Fixed ROM slots 29723.
                    if slot <> 29723 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:78
//		TS	NDXCTR
// PORT: Fixed ROM slots 29724.
                    if slot <> 29724 or instruction <> 23313 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23313, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29725 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:79
//		TS	TORQNDX
// PORT: Fixed ROM slots 29725.
                if slot <> 29725 or instruction <> 23336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23336, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29726 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:80
//		TS	TORQNDX	+1
// PORT: Fixed ROM slots 29726.
                    if slot <> 29726 or instruction <> 23337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:81
//NBPOSPL		CA	DEC17
// PORT: Fixed ROM slots 29727.
                    if slot <> 29727 or instruction <> 14589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2301), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29730 {
            if slot <= 29728 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:82
//		TS	ZERONDX1
// PORT: Fixed ROM slots 29728.
                if slot <> 29728 or instruction <> 23469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29729 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:83
//		CA	XNBADR
// PORT: Fixed ROM slots 29729.
                    if slot <> 29729 or instruction <> 13605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1317), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:84
//# Page 424
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:85
//		TC	ZEROING
// PORT: Fixed ROM slots 29730.
                    if slot <> 29730 or instruction <> 1262 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1262, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29731 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:86
//		CA	HALF
// PORT: Fixed ROM slots 29731.
                if slot <> 29731 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29732 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:87
//		TS	XNB
// PORT: Fixed ROM slots 29732.
                    if slot <> 29732 or instruction <> 23499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23499, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:88
//		TC	INTPRET
// PORT: Fixed ROM slots 29733.
                    if slot <> 29733 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1630] to agcAotUnit1630@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:89
//		DLOAD	SIN
// PORT: Fixed ROM slots 29734.
    29734, 61130,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:90
//			AZIMUTH
// PORT: Fixed ROM slots 29735.
    29735, 2562,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:91
//		STORE	YNB	+2
// PORT: Fixed ROM slots 29736.
    29736, 2984,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:92
//		STODL	ZNB	+4
// PORT: Fixed ROM slots 29737.
    29737, 15288,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:93
//			AZIMUTH
// PORT: Fixed ROM slots 29738.
    29738, 2562,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:94
//		COS
// PORT: Fixed ROM slots 29739.
    29739, 65484,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:95
//		STORE	YNB	+4
// PORT: Fixed ROM slots 29740.
    29740, 2988,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:96
//		DCOMP
// PORT: Fixed ROM slots 29741.
    29741, 65404,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:97
//		STORE	ZNB	+2
// PORT: Fixed ROM slots 29742.
    29742, 2996,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:98
//		EXIT
// PORT: Fixed ROM slots 29743.
    29743, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29744–29744.
function agcAotUnit1631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:99
//		TC	CHECKMM
// PORT: Fixed ROM slots 29744.
    if slot <> 29744 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1631] to agcAotUnit1631@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:100
//		MM	03			#   SEE IF IN OPTICAL VERIFICATION
// PORT: Fixed ROM slots 29745.
    29745, 6
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29746–29748.
function agcAotUnit1632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29746 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:101
//		TCF	+2			#  NO
// PORT: Fixed ROM slots 29746.
        if slot <> 29746 or instruction <> 5172 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5172, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29747 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:102
//		TCF	SETNBPOS +1		#    YES
// PORT: Fixed ROM slots 29747.
            if slot <> 29747 or instruction <> 5923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5923, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:103
//		TC	INTPRET
// PORT: Fixed ROM slots 29748.
            if slot <> 29748 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1632] to agcAotUnit1632@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:104
//		CALL
// PORT: Fixed ROM slots 29749.
    29749, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:105
//			CALCGA
// PORT: Fixed ROM slots 29750.
    29750, 40338,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:106
//		EXIT
// PORT: Fixed ROM slots 29751.
    29751, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29752–29752.
function agcAotUnit1633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:107
//		TC	BANKCALL
// PORT: Fixed ROM slots 29752.
    if slot <> 29752 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1633] to agcAotUnit1633@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:108
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 29753.
    29753, 15206
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29754–29759.
function agcAotUnit1634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29756 {
        if slot <= 29754 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:109
//		CAF	GLOKFBIT		# IF GLOKFAIL SET, GIMBAL LOCK
// PORT: Fixed ROM slots 29754.
            if slot <> 29754 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29755 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:110
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 29755.
                if slot <> 29755 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:111
//		EXTEND
// PORT: Fixed ROM slots 29756.
                if slot <> 29756 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29757 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:112
//		BZF	+2
// PORT: Fixed ROM slots 29757.
            if slot <> 29757 or instruction <> 5183 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5183, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29758 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:113
//		INCR	NDXCTR			# +1 IF IN GIMBAL LOCK,OTHERWISE 0
// PORT: Fixed ROM slots 29758.
                if slot <> 29758 or instruction <> 11025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 785).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:114
//		TC	DOWNFLAG		# RESET GIMBAL LOCK FLAG
// PORT: Fixed ROM slots 29759.
                if slot <> 29759 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1634] to agcAotUnit1634@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:115
//		ADRES	GLOKFAIL		# BIT 14 FLAG 3
// PORT: Fixed ROM slots 29760.
    29760, 92
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29761–29764.
function agcAotUnit1635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29762 {
        if slot <= 29761 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:116
//		TC	IMUSTLLG
// PORT: Fixed ROM slots 29761.
            if slot <> 29761 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:117
//		CCS	NDXCTR			# IF ONE GO AND DO A PIPA TEST ONLY
// PORT: Fixed ROM slots 29762.
            if slot <> 29762 or instruction <> 4881 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 785).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29763 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:118
//		TC	PIPACHK			# ALIGN AND MEASURE VERTICAL PIPA RATE
// PORT: Fixed ROM slots 29763.
            if slot <> 29763 or instruction <> 1113 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1113, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:119
//		TC	BANKCALL
// PORT: Fixed ROM slots 29764.
            if slot <> 29764 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1635] to agcAotUnit1635@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:120
//		CADR	IMUFINE
// PORT: Fixed ROM slots 29765.
    29765, 15478
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29766–29769.
function agcAotUnit1636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29767 {
        if slot <= 29766 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:121
//		TC	IMUSTLLG
// PORT: Fixed ROM slots 29766.
            if slot <> 29766 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:122
//		EXTEND
// PORT: Fixed ROM slots 29767.
            if slot <> 29767 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29768 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:123
//		DCA	PERFDLAY
// PORT: Fixed ROM slots 29768.
            if slot <> 29768 or instruction <> 13231 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 943, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:124
//		TC	LONGCALL
// PORT: Fixed ROM slots 29769.
            if slot <> 29769 or instruction <> 2786 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2786, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1636] to agcAotUnit1636@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:125
//		EBANK=	POSITON
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:126
//		2CADR	GOESTIMS
// PORT: Fixed ROM slots 29770 29771.
    29770, 2204, 29771, 55402
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29772–29776.
function agcAotUnit1637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29773 {
        if slot <= 29772 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:127
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:128
//		CA	ESTICADR
// PORT: Fixed ROM slots 29772.
            if slot <> 29772 or instruction <> 13393 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1105), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:129
//		TC	JOBSLEEP
// PORT: Fixed ROM slots 29773.
            if slot <> 29773 or instruction <> 2685 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2685, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29774 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:130
//GOESTIMS	CA	ESTICADR
// PORT: Fixed ROM slots 29774.
            if slot <> 29774 or instruction <> 13393 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1105), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29775 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:131
//		TC	JOBWAKE
// PORT: Fixed ROM slots 29775.
                if slot <> 29775 or instruction <> 2689 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2689, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:132
//		TC	TASKOVER
// PORT: Fixed ROM slots 29776.
                if slot <> 29776 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1637] to agcAotUnit1637@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:133
//ESTICADR	CADR	ESTIMS
// PORT: Fixed ROM slots 29777.
    29777, 55894
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29778–29782.
function agcAotUnit1638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29779 {
        if slot <= 29778 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:134
//# Page 425
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:135
//TORQUE		CA	ZERO
// PORT: Fixed ROM slots 29778.
            if slot <> 29778 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:136
//		TS	DSPTEM2
// PORT: Fixed ROM slots 29779.
            if slot <> 29779 or instruction <> 23080 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23080, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29780 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:137
//		CA	DRIFTI
// PORT: Fixed ROM slots 29780.
            if slot <> 29780 or instruction <> 13132 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 844).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29781 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:138
//		TS	DSPTEM2	+1
// PORT: Fixed ROM slots 29781.
                if slot <> 29781 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:139
//		INDEX	POSITON
// PORT: Fixed ROM slots 29782.
                if slot <> 29782 or instruction <> 21267 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21267, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21267, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1638] to agcAotUnit1638@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:140
//		TS	SOUTHDR	-1
// PORT: Fixed ROM slots 29783.
    29783, 46640
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29784–29785.
function agcAotUnit1639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29784 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:141
//		TC	SHOW
// PORT: Fixed ROM slots 29784.
        if slot <> 29784 or instruction <> 1303 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1303, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:142
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:143
//PIPACHK		INDEX	NDXCTR		# PIPA TEST
// PORT: Fixed ROM slots 29785.
        if slot <> 29785 or instruction <> 21265 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21265, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21265, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1639] to agcAotUnit1639@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:144
//		TC	+1
// PORT: Fixed ROM slots 29786.
    29786, 2230
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29787–29793.
function agcAotUnit1640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29789 {
        if slot <= 29787 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:145
//		TC	EARTHR*
// PORT: Fixed ROM slots 29787.
            if slot <> 29787 or instruction <> 1295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1295, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29788 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:146
//		CA	DEC57
// PORT: Fixed ROM slots 29788.
                if slot <> 29788 or instruction <> 14588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:147
//		TS	LENGTHOT
// PORT: Fixed ROM slots 29789.
                if slot <> 29789 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29791 {
            if slot <= 29790 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:148
//		CA	ONE
// PORT: Fixed ROM slots 29790.
                if slot <> 29790 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:149
//		TS	RESULTCT
// PORT: Fixed ROM slots 29791.
                if slot <> 29791 or instruction <> 23399 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23399, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29792 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:150
//		CA	ZERO
// PORT: Fixed ROM slots 29792.
                if slot <> 29792 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:151
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 29793.
                if slot <> 29793 or instruction <> 21266 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21266, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21266, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1640] to agcAotUnit1640@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:152
//		TS	PIPAX
// PORT: Fixed ROM slots 29794.
    29794, 45118
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29795–29800.
function agcAotUnit1641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29797 {
        if slot <= 29795 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:153
//		TS	DATAPL
// PORT: Fixed ROM slots 29795.
            if slot <> 29795 or instruction <> 23362 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23362, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29796 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:154
//		TS	DATAPL +4
// PORT: Fixed ROM slots 29796.
                if slot <> 29796 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:155
//		TC	CHECKG		# PIP PULSE CATCHING ROUTINE
// PORT: Fixed ROM slots 29797.
                if slot <> 29797 or instruction <> 1233 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1233, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29798 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:156
//		INHINT
// PORT: Fixed ROM slots 29798.
            if slot <> 29798 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29799 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:157
//		CAF	TWO
// PORT: Fixed ROM slots 29799.
                if slot <> 29799 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:158
//		TC	TWIDDLE
// PORT: Fixed ROM slots 29800.
                if slot <> 29800 or instruction <> 2717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1641] to agcAotUnit1641@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:159
//		EBANK=	XSM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:160
//		ADRES	PIPATASK
// PORT: Fixed ROM slots 29801.
    29801, 2262
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29802–29809.
function agcAotUnit1642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29805 {
        if slot <= 29803 {
            if slot <= 29802 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:161
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 29802.
                if slot <> 29802 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:162
//PIPATASK	EXTEND
// PORT: Fixed ROM slots 29803.
                if slot <> 29803 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29804 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:163
//		DIM	LENGTHOT
// PORT: Fixed ROM slots 29804.
                if slot <> 29804 or instruction <> 12042 { return choose false if checkOnly else -1. }
                if extended {
                    local operandSlot is agcAddressSlot(778, words[3], words[4], words["channel7"]).
                    if operandSlot >= 16 and operandSlot <= 19 and
                        (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreDIM(words, 778).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:164
//		CA	LENGTHOT
// PORT: Fixed ROM slots 29805.
                if slot <> 29805 or instruction <> 13066 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 778).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29807 {
            if slot <= 29806 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:165
//		EXTEND
// PORT: Fixed ROM slots 29806.
                if slot <> 29806 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:166
//		BZMF	STARTPIP
// PORT: Fixed ROM slots 29807.
                if slot <> 29807 or instruction <> 25715 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29808 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:167
//		CAF	BIT10
// PORT: Fixed ROM slots 29808.
                if slot <> 29808 or instruction <> 14854 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:168
//		TC	TWIDDLE
// PORT: Fixed ROM slots 29809.
                if slot <> 29809 or instruction <> 2717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1642] to agcAotUnit1642@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:169
//		EBANK=	XSM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:170
//		ADRES	PIPATASK
// PORT: Fixed ROM slots 29810.
    29810, 2262
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29811–29812.
function agcAotUnit1643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29811 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:171
//STARTPIP	CAF	PRIO20
// PORT: Fixed ROM slots 29811.
        if slot <> 29811 or instruction <> 14850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:172
//		TC	FINDVAC
// PORT: Fixed ROM slots 29812.
        if slot <> 29812 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1643] to agcAotUnit1643@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:173
//		EBANK=	XSM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:174
//		2CADR	PIPJOBB
// PORT: Fixed ROM slots 29813 29814.
    29813, 2288, 29814, 55402
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29815–29816.
function agcAotUnit1644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29815 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:175
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:176
//		TC	TASKOVER
// PORT: Fixed ROM slots 29815.
        if slot <> 29815 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:177
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:178
//PIPJOBB		INDEX	NDXCTR
// PORT: Fixed ROM slots 29816.
        if slot <> 29816 or instruction <> 21265 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21265, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21265, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1644] to agcAotUnit1644@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:179
//		TC	+1
// PORT: Fixed ROM slots 29817.
    29817, 2292
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29818–29829.
function agcAotUnit1645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29823 {
        if slot <= 29820 {
            if slot <= 29818 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:180
//		TC	EARTHR*
// PORT: Fixed ROM slots 29818.
                if slot <> 29818 or instruction <> 1295 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1295, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29819 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:181
//		CA	LENGTHOT
// PORT: Fixed ROM slots 29819.
                    if slot <> 29819 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:182
//		EXTEND
// PORT: Fixed ROM slots 29820.
                    if slot <> 29820 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29821 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:183
//		BZMF	+2
// PORT: Fixed ROM slots 29821.
                if slot <> 29821 or instruction <> 25727 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25727, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29822 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:184
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 29822.
                    if slot <> 29822 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:185
//		CA	FIVE
// PORT: Fixed ROM slots 29823.
                    if slot <> 29823 or instruction <> 14866 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29826 {
            if slot <= 29824 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:186
//# Page 426
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:187
//		TS	RESULTCT
// PORT: Fixed ROM slots 29824.
                if slot <> 29824 or instruction <> 23399 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23399, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29825 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:188
//		TC	CHECKG
// PORT: Fixed ROM slots 29825.
                    if slot <> 29825 or instruction <> 1233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1233, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:189
//		EXTEND
// PORT: Fixed ROM slots 29826.
                    if slot <> 29826 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29827 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:190
//		DCS	DATAPL
// PORT: Fixed ROM slots 29827.
                if slot <> 29827 or instruction <> 17219 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 835, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29828 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:191
//		DAS	DATAPL 	+4
// PORT: Fixed ROM slots 29828.
                    if slot <> 29828 or instruction <> 9031 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 839) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:192
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:193
//		TC	INTPRET
// PORT: Fixed ROM slots 29829.
                    if slot <> 29829 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1645] to agcAotUnit1645@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:194
//		DLOAD	DSU
// PORT: Fixed ROM slots 29830.
    29830, 38346,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:195
//			DATAPL	+6
// PORT: Fixed ROM slots 29831.
    29831, 2706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:196
//			DATAPL 	+2
// PORT: Fixed ROM slots 29832.
    29832, 2698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:197
//		BPL	CALL
// PORT: Fixed ROM slots 29833.
    29833, 37960,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:198
//			AINGOTN
// PORT: Fixed ROM slots 29834.
    29834, 55576,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:199
//			OVERFFIX
// PORT: Fixed ROM slots 29835.
    29835, 55676,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:200
//AINGOTN		PDDL	DDV
// PORT: Fixed ROM slots 29836.
    29836, 47530,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:201
//			DATAPL 	+4
// PORT: Fixed ROM slots 29837.
    29837, 2702,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:202
//		SL4	DMPR
// PORT: Fixed ROM slots 29838.
    29838, 48404,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:203
//			DEC585		# DEC585 HAS BEEN REDEFINED FOR LEM
// PORT: Fixed ROM slots 29839.
    29839, 23696,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:204
//		RTB
// PORT: Fixed ROM slots 29840.
    29840, 65336,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:205
//			SGNAGREE
// PORT: Fixed ROM slots 29841.
    29841, 38600,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:206
//		STORE	DSPTEM2
// PORT: Fixed ROM slots 29842.
    29842, 1106,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:207
//		EXIT
// PORT: Fixed ROM slots 29843.
    29843, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29844–29849.
function agcAotUnit1646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29846 {
        if slot <= 29844 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:208
//		CCS	NDXCTR
// PORT: Fixed ROM slots 29844.
            if slot <> 29844 or instruction <> 4881 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 785).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29845 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:209
//		TC	COAALIGN	# TAKE PLATFORM OUT OF GIMBAL LOCK
// PORT: Fixed ROM slots 29845.
                if slot <> 29845 or instruction <> 1218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1218, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:210
//		TC	SHOW
// PORT: Fixed ROM slots 29846.
                if slot <> 29846 or instruction <> 1303 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1303, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29847 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:211
//VERTDRFT	CA	3990DEC		# ABOUT 1 HOUR VERTICAL DRIFT TEST
// PORT: Fixed ROM slots 29847.
            if slot <> 29847 or instruction <> 13607 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1319), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29848 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:212
//		TS	LENGTHOT
// PORT: Fixed ROM slots 29848.
                if slot <> 29848 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:213
//		INDEX	POSITON
// PORT: Fixed ROM slots 29849.
                if slot <> 29849 or instruction <> 21267 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21267, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21267, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1646] to agcAotUnit1646@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:214
//		CS	SOUTHDR -2
// PORT: Fixed ROM slots 29850.
    29850, 34350
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29851–29879.
function agcAotUnit1647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29864 {
        if slot <= 29857 {
            if slot <= 29853 {
                if slot <= 29851 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:215
//		TS	DRIFTT
// PORT: Fixed ROM slots 29851.
                    if slot <> 29851 or instruction <> 23338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23338, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 29852 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:216
//		CA	XSM	+4	# 0 IF POSN 4
// PORT: Fixed ROM slots 29852.
                        if slot <> 29852 or instruction <> 13245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 957).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:217
//		EXTEND
// PORT: Fixed ROM slots 29853.
                        if slot <> 29853 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29855 {
                    if slot <= 29854 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:218
//		BZF	PON2
// PORT: Fixed ROM slots 29854.
                        if slot <> 29854 or instruction <> 5284 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5284, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:219
//PON4		CS	BIT5		# 	OFFSET PLATFORM
// PORT: Fixed ROM slots 29855.
                        if slot <> 29855 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29856 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:220
//		ADS	ERCOMP1	+2
// PORT: Fixed ROM slots 29856.
                        if slot <> 29856 or instruction <> 12201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:221
//		CA	BIT5
// PORT: Fixed ROM slots 29857.
                        if slot <> 29857 or instruction <> 14859 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 29860 {
                if slot <= 29858 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:222
//		ADS	ERCOMP1
// PORT: Fixed ROM slots 29858.
                    if slot <> 29858 or instruction <> 12199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 935).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 29859 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:223
//		TCF	PONG
// PORT: Fixed ROM slots 29859.
                        if slot <> 29859 or instruction <> 5288 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5288, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:224
//PON2		CS	BIT5
// PORT: Fixed ROM slots 29860.
                        if slot <> 29860 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29862 {
                    if slot <= 29861 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:225
//		ADS	ERCOMP1 +2
// PORT: Fixed ROM slots 29861.
                        if slot <> 29861 or instruction <> 12201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:226
//		CA	BIT5
// PORT: Fixed ROM slots 29862.
                        if slot <> 29862 or instruction <> 14859 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29863 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:227
//		ADS	ERCOMP1 +4
// PORT: Fixed ROM slots 29863.
                        if slot <> 29863 or instruction <> 12203 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 939).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:228
//PONG		TC	EARTHR*
// PORT: Fixed ROM slots 29864.
                        if slot <> 29864 or instruction <> 1295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 29871 {
            if slot <= 29867 {
                if slot <= 29865 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:229
//		CA	ZERO		# ALLOW ONLY SOUTH GYRO EARTH RATE COMPENS
// PORT: Fixed ROM slots 29865.
                    if slot <> 29865 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 29866 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:230
//		TS	ERVECTOR
// PORT: Fixed ROM slots 29866.
                        if slot <> 29866 or instruction <> 23300 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23300, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:231
//		TS	ERVECTOR +1
// PORT: Fixed ROM slots 29867.
                        if slot <> 29867 or instruction <> 23301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23301, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29869 {
                    if slot <= 29868 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:232
//GUESS1		CAF	POSMAX
// PORT: Fixed ROM slots 29868.
                        if slot <> 29868 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:233
//		TS	TORQNDX
// PORT: Fixed ROM slots 29869.
                        if slot <> 29869 or instruction <> 23336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23336, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29870 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:234
//		TS	TORQNDX +1
// PORT: Fixed ROM slots 29870.
                        if slot <> 29870 or instruction <> 23337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:235
//		CA	CDUX
// PORT: Fixed ROM slots 29871.
                        if slot <> 29871 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 29875 {
                if slot <= 29873 {
                    if slot <= 29872 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:236
//		TS	LOSVEC
// PORT: Fixed ROM slots 29872.
                        if slot <> 29872 or instruction <> 23307 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23307, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:237
//# Page 427
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:238
//		TC	ESTIMS
// PORT: Fixed ROM slots 29873.
                        if slot <> 29873 or instruction <> 1323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1323, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29874 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:239
//VALMIS		CA	DRIFTO
// PORT: Fixed ROM slots 29874.
                        if slot <> 29874 or instruction <> 13130 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 842).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:240
//		TS	DSPTEM2 +1
// PORT: Fixed ROM slots 29875.
                        if slot <> 29875 or instruction <> 23081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29877 {
                    if slot <= 29876 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:241
//		CA	ZERO
// PORT: Fixed ROM slots 29876.
                        if slot <> 29876 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:242
//		TS	DSPTEM2
// PORT: Fixed ROM slots 29877.
                        if slot <> 29877 or instruction <> 23080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23080, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29878 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:243
//		TC	SHOW
// PORT: Fixed ROM slots 29878.
                        if slot <> 29878 or instruction <> 1303 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1303, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:244
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:245
//ENDTEST1	TC	DOWNFLAG	# IMU NOT IN USE
// PORT: Fixed ROM slots 29879.
                        if slot <> 29879 or instruction <> 2928 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1647] to agcAotUnit1647@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:246
//		ADRES	IMUSE		# BIT 8 FLAG 0
// PORT: Fixed ROM slots 29880.
    29880, 14
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29881–29881.
function agcAotUnit1648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:247
//		CS	ZERO
// PORT: Fixed ROM slots 29881.
    if slot <> 29881 or instruction <> 18961 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
        set words[0] to agcSignExtend(32767 - fixedOperand).
        return list(false, false, true, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1648] to agcAotUnit1648@.

// PORT: Physical bank 33. Shared continuation entries, slots 29882–29883.
function agcAotUnit1649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29882 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:248
//		TC	NEWMODEX +3
// PORT: Fixed ROM slots 29882.
        if slot <> 29882 or instruction <> 2799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:249
//		TC	BANKCALL
// PORT: Fixed ROM slots 29883.
        if slot <> 29883 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1649] to agcAotUnit1649@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:250
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 29884.
    29884, 14438
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29885–29885.
function agcAotUnit1650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:251
//		TC	ENDEXT
// PORT: Fixed ROM slots 29885.
    if slot <> 29885 or instruction <> 2908 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2908, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1650] to agcAotUnit1650@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:252
//# Page 428
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:253
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:254
//OVERFFIX	DAD	DAD
// PORT: Fixed ROM slots 29886.
    29886, 36122,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:255
//			DPPOSMAX
// PORT: Fixed ROM slots 29887.
    29887, 13766,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:256
//			ONEDPP
// PORT: Fixed ROM slots 29888.
    29888, 23708,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:257
//		RVQ
// PORT: Fixed ROM slots 29889.
    29889, 65308
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29890–29896.
function agcAotUnit1651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29892 {
        if slot <= 29890 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:258
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:259
//COAALIGN	EXTEND			# COARSE ALIGN SUBROUTINE
// PORT: Fixed ROM slots 29890.
            if slot <> 29890 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29891 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:260
//		QXCH	QPLACE
// PORT: Fixed ROM slots 29891.
                if slot <> 29891 or instruction <> 10005 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 789, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:261
//		CA	ZERO
// PORT: Fixed ROM slots 29892.
                if slot <> 29892 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29894 {
            if slot <= 29893 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:262
//		TS	THETAD
// PORT: Fixed ROM slots 29893.
                if slot <> 29893 or instruction <> 23149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23149, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:263
//		TS	THETAD +1
// PORT: Fixed ROM slots 29894.
                if slot <> 29894 or instruction <> 23150 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23150, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29895 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:264
//		TS	THETAD +2
// PORT: Fixed ROM slots 29895.
                if slot <> 29895 or instruction <> 23151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23151, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:265
//		TC	BANKCALL
// PORT: Fixed ROM slots 29896.
                if slot <> 29896 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1651] to agcAotUnit1651@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:266
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 29897.
    29897, 15206
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29898–29898.
function agcAotUnit1652 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:267
//		TC	BANKCALL
// PORT: Fixed ROM slots 29898.
    if slot <> 29898 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1652] to agcAotUnit1652@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:268
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 29899.
    29899, 16126
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29900–29914.
function agcAotUnit1653 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29906 {
        if slot <= 29902 {
            if slot <= 29900 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:269
//		TC	SOMERR2
// PORT: Fixed ROM slots 29900.
                if slot <> 29900 or instruction <> 1602 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1602, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29901 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:270
//		TC	QPLACE
// PORT: Fixed ROM slots 29901.
                    if slot <> 29901 or instruction <> 789 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 789, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:271
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:272
//IMUSTLLG	EXTEND
// PORT: Fixed ROM slots 29902.
                    if slot <> 29902 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29904 {
                if slot <= 29903 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:273
//		QXCH	QPLACE
// PORT: Fixed ROM slots 29903.
                    if slot <> 29903 or instruction <> 10005 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 789, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:274
//		TC	COAALIGN +10
// PORT: Fixed ROM slots 29904.
                    if slot <> 29904 or instruction <> 1226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1226, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29905 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:275
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:276
//CHECKG		EXTEND			# PIP PULSE CATCHING ROUTINE
// PORT: Fixed ROM slots 29905.
                    if slot <> 29905 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:277
//		QXCH	QPLACE
// PORT: Fixed ROM slots 29906.
                    if slot <> 29906 or instruction <> 10005 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 789, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29910 {
            if slot <= 29908 {
                if slot <= 29907 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:278
//		TC	+6
// PORT: Fixed ROM slots 29907.
                    if slot <> 29907 or instruction <> 1241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1241, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:279
//CHECKG1		RELINT
// PORT: Fixed ROM slots 29908.
                    if slot <> 29908 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29909 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:280
//		CA	NEWJOB
// PORT: Fixed ROM slots 29909.
                    if slot <> 29909 or instruction <> 12343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:281
//		EXTEND
// PORT: Fixed ROM slots 29910.
                    if slot <> 29910 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29912 {
                if slot <= 29911 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:282
//		BZMF	+6
// PORT: Fixed ROM slots 29911.
                    if slot <> 29911 or instruction <> 25821 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25821, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:283
//		TC	CHANG1
// PORT: Fixed ROM slots 29912.
                    if slot <> 29912 or instruction <> 2676 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2676, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29913 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:284
//		INHINT
// PORT: Fixed ROM slots 29913.
                    if slot <> 29913 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:285
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 29914.
                    if slot <> 29914 or instruction <> 21266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21266, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21266, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1653] to agcAotUnit1653@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:286
//		CS	PIPAX
// PORT: Fixed ROM slots 29915.
    29915, 32830
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29916–29918.
function agcAotUnit1654 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29916 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:287
//		TS	ZERONDX
// PORT: Fixed ROM slots 29916.
        if slot <> 29916 or instruction <> 23469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29917 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:288
//		INHINT
// PORT: Fixed ROM slots 29917.
            if slot <> 29917 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:289
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 29918.
            if slot <> 29918 or instruction <> 21266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21266, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21266, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1654] to agcAotUnit1654@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:290
//		CA	PIPAX
// PORT: Fixed ROM slots 29919.
    29919, 24638
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29920–29923.
function agcAotUnit1655 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29921 {
        if slot <= 29920 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:291
//		AD	ZERONDX
// PORT: Fixed ROM slots 29920.
            if slot <> 29920 or instruction <> 25517 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 941).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:292
//		EXTEND
// PORT: Fixed ROM slots 29921.
            if slot <> 29921 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29922 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:293
//		BZF	CHECKG1
// PORT: Fixed ROM slots 29922.
            if slot <> 29922 or instruction <> 5332 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5332, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:294
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 29923.
            if slot <> 29923 or instruction <> 21266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21266, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21266, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1655] to agcAotUnit1655@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:295
//		CA	PIPAX
// PORT: Fixed ROM slots 29924.
    29924, 24638
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29925–29925.
function agcAotUnit1656 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:296
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 29925.
    if slot <> 29925 or instruction <> 21351 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21351, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21351, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1656] to agcAotUnit1656@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:297
//		TS	DATAPL
// PORT: Fixed ROM slots 29926.
    29926, 46724
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29927–29928.
function agcAotUnit1657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29927 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:298
//		TC	FINETIME
// PORT: Fixed ROM slots 29927.
        if slot <> 29927 or instruction <> 2411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2411, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:299
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 29928.
        if slot <> 29928 or instruction <> 21351 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21351, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21351, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1657] to agcAotUnit1657@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:300
//		TS	DATAPL +1
// PORT: Fixed ROM slots 29929.
    29929, 46726
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29930–29930.
function agcAotUnit1658 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:301
//# Page 429
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:302
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 29930.
    if slot <> 29930 or instruction <> 21351 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21351, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21351, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1658] to agcAotUnit1658@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:303
//		LXCH	DATAPL +2
// PORT: Fixed ROM slots 29931.
    29931, 20104
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29932–29938.
function agcAotUnit1659 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29934 {
        if slot <= 29932 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:304
//		RELINT
// PORT: Fixed ROM slots 29932.
            if slot <> 29932 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29933 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:305
//ENDCHKG		TC	QPLACE
// PORT: Fixed ROM slots 29933.
                if slot <> 29933 or instruction <> 789 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 789, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:306
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:307
//ZEROING		TS	L
// PORT: Fixed ROM slots 29934.
                if slot <> 29934 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29936 {
            if slot <= 29935 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:308
//		TCF	+2
// PORT: Fixed ROM slots 29935.
                if slot <> 29935 or instruction <> 5361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:309
//ZEROING1	TS	ZERONDX1
// PORT: Fixed ROM slots 29936.
                if slot <> 29936 or instruction <> 23469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29937 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:310
//		CAF	ZERO
// PORT: Fixed ROM slots 29937.
                if slot <> 29937 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:311
//		INDEX	L
// PORT: Fixed ROM slots 29938.
                if slot <> 29938 or instruction <> 20481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1659] to agcAotUnit1659@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:312
//		TS	0
// PORT: Fixed ROM slots 29939.
    29939, 45056
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29940–29943.
function agcAotUnit1660 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29941 {
        if slot <= 29940 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:313
//		INCR	L
// PORT: Fixed ROM slots 29940.
            if slot <> 29940 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:314
//		CCS	ZERONDX1
// PORT: Fixed ROM slots 29941.
            if slot <> 29941 or instruction <> 5037 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 941).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29942 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:315
//		TCF	ZEROING1
// PORT: Fixed ROM slots 29942.
            if slot <> 29942 or instruction <> 5360 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5360, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:316
//		TC	Q
// PORT: Fixed ROM slots 29943.
            if slot <> 29943 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1660] to agcAotUnit1660@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:317
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:318
//# Page 430
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:319
//		SETLOC	IMUCAL3
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:320
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:321
//ERTHRVSE	DLOAD	PDDL
// PORT: Fixed ROM slots 28672.
    28672, 54730,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:322
//			SCHZEROS	# PD24 = (SIN		-COS	0)(OMEG/MS)
// PORT: Fixed ROM slots 28673.
    28673, 23698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:323
//			LATITUDE
// PORT: Fixed ROM slots 28674.
    28674, 2566,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:324
//		COS	DCOMP
// PORT: Fixed ROM slots 28675.
    28675, 48844,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:325
//		PDDL	SIN
// PORT: Fixed ROM slots 28676.
    28676, 61098,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:326
//			LATITUDE
// PORT: Fixed ROM slots 28677.
    28677, 2566,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:327
//		VDEF	VXSC
// PORT: Fixed ROM slots 28678.
    28678, 61804,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:328
//			OMEG/MS
// PORT: Fixed ROM slots 28679.
    28679, 23120,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:329
//		STORE	ERVECTOR
// PORT: Fixed ROM slots 28680.
    28680, 2570,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:330
//		RTB
// PORT: Fixed ROM slots 28681.
    28681, 65336,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:331
//			LOADTIME
// PORT: Fixed ROM slots 28682.
    28682, 38544,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:332
//		STOVL	TMARK
// PORT: Fixed ROM slots 28683.
    28683, 23110,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:333
//			SCHZEROS
// PORT: Fixed ROM slots 28684.
    28684, 23698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:334
//		STORE	ERCOMP1
// PORT: Fixed ROM slots 28685.
    28685, 2896,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:335
//		RVQ
// PORT: Fixed ROM slots 28686.
    28686, 65308,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:336
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:337
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:338
//EARTHR		ITA	RTB		# CALCULATES AND COMPENSATES EARTH RATE
// PORT: Fixed ROM slots 29944.
    29944, 39968,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:339
//			S2
// PORT: Fixed ROM slots 29945.
    29945, 82,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:340
//			LOADTIME
// PORT: Fixed ROM slots 29946.
    29946, 38544,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:341
//		STORE	TEMPTIME
// PORT: Fixed ROM slots 29947.
    29947, 2626,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:342
//		DSU	BPL
// PORT: Fixed ROM slots 29948.
    29948, 42026,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:343
//			TMARK
// PORT: Fixed ROM slots 29949.
    29949, 2630,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:344
//			ERTHR
// PORT: Fixed ROM slots 29950.
    29950, 55810,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:345
//		CALL
// PORT: Fixed ROM slots 29951.
    29951, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:346
//			OVERFFIX
// PORT: Fixed ROM slots 29952.
    29952, 55676,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:347
//ERTHR		SL	VXSC
// PORT: Fixed ROM slots 29953.
    29953, 61794,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:348
//			9D
// PORT: Fixed ROM slots 29954.
    29954, 16660,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:349
//			ERVECTOR
// PORT: Fixed ROM slots 29955.
    29955, 2570,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:350
//		MXV	VAD
// PORT: Fixed ROM slots 29956.
    29956, 44450,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:351
//			XSM
// PORT: Fixed ROM slots 29957.
    29957, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:352
//			ERCOMP1
// PORT: Fixed ROM slots 29958.
    29958, 2896,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:353
//		STODL	ERCOMP1
// PORT: Fixed ROM slots 29959.
    29959, 15184,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:354
//			TEMPTIME
// PORT: Fixed ROM slots 29960.
    29960, 2626,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:355
//		STORE	TMARK
// PORT: Fixed ROM slots 29961.
    29961, 2630,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:356
//		AXT,1	RTB
// PORT: Fixed ROM slots 29962.
    29962, 40176,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:357
//		ECADR	ERCOMP1
// PORT: Fixed ROM slots 29963.
    29963, 2894,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:358
//			PULSEIMU
// PORT: Fixed ROM slots 29964.
    29964, 38742,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:359
//		GOTO
// PORT: Fixed ROM slots 29965.
    29965, 65360,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:360
//			S2
// PORT: Fixed ROM slots 29966.
    29966, 82
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29967–29969.
function agcAotUnit1661 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29967 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:361
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:362
//EARTHR*		EXTEND
// PORT: Fixed ROM slots 29967.
        if slot <> 29967 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29968 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:363
//		QXCH	QPLACES
// PORT: Fixed ROM slots 29968.
            if slot <> 29968 or instruction <> 10006 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 790, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:364
//		TC	INTPRET
// PORT: Fixed ROM slots 29969.
            if slot <> 29969 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1661] to agcAotUnit1661@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:365
//		CALL
// PORT: Fixed ROM slots 29970.
    29970, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:366
//			EARTHR
// PORT: Fixed ROM slots 29971.
    29971, 55792,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:367
//PROUT		EXIT
// PORT: Fixed ROM slots 29972.
    29972, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29973–29980.
function agcAotUnit1662 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29976 {
        if slot <= 29974 {
            if slot <= 29973 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:368
//		TC	IMUSTLLG
// PORT: Fixed ROM slots 29973.
                if slot <> 29973 or instruction <> 1230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1230, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:369
//		TC	QPLACES
// PORT: Fixed ROM slots 29974.
                if slot <> 29974 or instruction <> 790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29975 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:370
//# Page 431
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:371
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:372
//SHOW		EXTEND
// PORT: Fixed ROM slots 29975.
                if slot <> 29975 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:373
//		QXCH	QPLACE
// PORT: Fixed ROM slots 29976.
                if slot <> 29976 or instruction <> 10005 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 789, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29978 {
            if slot <= 29977 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:374
//SHOW1		CA	POSITON
// PORT: Fixed ROM slots 29977.
                if slot <> 29977 or instruction <> 13075 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 787).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:375
//		TS	DSPTEM2 +2
// PORT: Fixed ROM slots 29978.
                if slot <> 29978 or instruction <> 23082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23082, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29979 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:376
//		CA	VB06N98
// PORT: Fixed ROM slots 29979.
                if slot <> 29979 or instruction <> 13602 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1314), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:377
//		TC	BANKCALL
// PORT: Fixed ROM slots 29980.
                if slot <> 29980 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1662] to agcAotUnit1662@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:378
//		CADR	GOFLASH
// PORT: Fixed ROM slots 29981.
    29981, 17312
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29982–29984.
function agcAotUnit1663 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29982 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:379
//		TC	ENDTEST1	# V 34
// PORT: Fixed ROM slots 29982.
        if slot <> 29982 or instruction <> 1207 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1207, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29983 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:380
//		TC	QPLACE		#  V33
// PORT: Fixed ROM slots 29983.
            if slot <> 29983 or instruction <> 789 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 789, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:381
//		TCF	SHOW1
// PORT: Fixed ROM slots 29984.
            if slot <> 29984 or instruction <> 5401 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5401, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1663] to agcAotUnit1663@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:382
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:383
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:384
//OC14400		OCT	14400
// PORT: Fixed ROM slots 29985.
    29985, 12800,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:385
//3990DEC		=	OMEG/MS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:386
//VB06N98		VN	0698
// PORT: Fixed ROM slots 29986.
    29986, 1732,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:387
//TESTTIME	OCT	01602
// PORT: Fixed ROM slots 29987.
    29987, 1796,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:388
//DEC17		=	ND1
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:389
//OGCPL		ECADR	OGC
// PORT: Fixed ROM slots 29988.
    29988, 3038,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:390
//1SECX		=	1SEC
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:391
//DEC57		=	VD1
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:392
//XNBADR		GENADR	XNB
// PORT: Fixed ROM slots 29989.
    29989, 1942,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:393
//XSMADR		GENADR	XSM
// PORT: Fixed ROM slots 29990.
    29990, 1906,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:394
//OMEG/MS		2DEC	.24339048
// PORT: Fixed ROM slots 29991 29992.
    29991, 7974, 29992, 23252
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29993–29993.
function agcAotUnit1664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:395
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:396
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:397
//P11OUT		TC	BANKCALL
// PORT: Fixed ROM slots 29993.
    if slot <> 29993 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1664] to agcAotUnit1664@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:398
//		CADR	MATRXJOB	# RETURN TO P11
// PORT: Fixed ROM slots 29994.
    29994, 57502
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4459–4476.
function agcAotUnit165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4467 {
        if slot <= 4462 {
            if slot <= 4460 {
                if slot <= 4459 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:399
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:400
//		COUNT	02/COMST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:401
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:402
//		BLOCK	2
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:403
//FINETIME	INHINT			# RETURNS WITH INTERRUPT INHIBITED
// PORT: Fixed ROM slots 4459.
                    if slot <> 4459 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:404
//		EXTEND
// PORT: Fixed ROM slots 4460.
                    if slot <> 4460 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4461 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:405
//		READ	LOSCALAR
// PORT: Fixed ROM slots 4461.
                    if slot <> 4461 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:406
//		TS	L
// PORT: Fixed ROM slots 4462.
                    if slot <> 4462 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4464 {
                if slot <= 4463 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:407
//		EXTEND
// PORT: Fixed ROM slots 4463.
                    if slot <> 4463 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:408
//		RXOR	LOSCALAR
// PORT: Fixed ROM slots 4464.
                    if slot <> 4464 or instruction <> 3076 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4465 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:409
//		EXTEND
// PORT: Fixed ROM slots 4465.
                    if slot <> 4465 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4466 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:410
//		BZF	+4
// PORT: Fixed ROM slots 4466.
                        if slot <> 4466 or instruction <> 6518 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6518, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:411
//		EXTEND
// PORT: Fixed ROM slots 4467.
                        if slot <> 4467 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4471 {
            if slot <= 4469 {
                if slot <= 4468 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:412
//		READ	LOSCALAR
// PORT: Fixed ROM slots 4468.
                    if slot <> 4468 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:413
//		TS	L
// PORT: Fixed ROM slots 4469.
                    if slot <> 4469 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4470 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:414
//	+4	CS	POSMAX
// PORT: Fixed ROM slots 4470.
                    if slot <> 4470 or instruction <> 18943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:415
//		AD	L
// PORT: Fixed ROM slots 4471.
                    if slot <> 4471 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4473 {
                if slot <= 4472 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:416
//		EXTEND
// PORT: Fixed ROM slots 4472.
                    if slot <> 4472 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:417
//		BZF	FINETIME +1
// PORT: Fixed ROM slots 4473.
                    if slot <> 4473 or instruction <> 6508 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6508, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4474 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:418
//		EXTEND
// PORT: Fixed ROM slots 4474.
                    if slot <> 4474 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4475 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:419
//		READ	HISCALAR
// PORT: Fixed ROM slots 4475.
                        if slot <> 4475 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 3, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:420
//		TC Q
// PORT: Fixed ROM slots 4476.
                        if slot <> 4476 or instruction <> 2 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[165] to agcAotUnit165@.

// PORT: Physical bank 33. Shared continuation entries, slots 29995–29995.
function agcAotUnit1665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:421
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:422
//# Page 432
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:423
//# PROGRAM NAME-OPTIMUM PRELAUNCH ALIGNMENT CALIBRATION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:424
//# DATE- NOVEMBER 2 1966
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:425
//# BY- GEORGE SCHMIDT IL 7-146 EXT. 126
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:426
//# MOD NO 3
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:427
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:428
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:429
//# THIS	SECTION CONSISTS OF PRELAUNCH ALIGNMENT AND GYRO DRIFT TESTS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:430
//# INTEGRATED TOGETHER TO SAVE WORDS.  COMPASS IS COMPLETELY RESTART
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:431
//# PROOFED EXCEPT FOR THE FIRST 30 SECONDS OR SO.  PERFORMANCE TESTS OF
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:432
//# THE IRIGS IS RESTART PROOFED ENOUGH TO GIVE 75 PERCENT CONFIDENCE THAT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:433
//# IF A RESTART OCCURS THE DATA WILL STILL BE GOOD.  GOOD PRACTICE TO RECYCL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:434
//# WHEN A RESTART OCCURS UNLESS IT HAPPENS NEAR THE END OF A TEST-THEN WAIT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:435
//# FOR THE DATA TO FLASH.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:436
//# A RESTART IN GYROCOMPASS DURING GYRO TORQUING CAUSES PULSES TO BE LOST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:437
//# THE PRELAUNCH ALIGNMENT TECHNIQUE IS BASICALLY THE SAME AS IN BLOCK 1
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:438
//# EXCEPT THAT IT HAS BEEN SIMPLIFIED IN THE SENSE THAT SMALL ANGLE APPROX.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:439
//# HAVE BEEN USED.  THE DRIFT TESTS USE A UNIQUE IMPLEMENTATION OF THE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:440
//# OPTIMUM STATISTICAL FILTER.  FOR A DESCRIPTION SEE E-1973.BOTH OF THESE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:441
//# ROUTINES USE STANDARD SYSTEM TEST LEADIN PROCEDURES.  THE INITIALIZATION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:442
//# PROCEDURE THE DRIFT TESTS IS IN THE JDC S.  THE INITIALIZATION METHOD
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:443
//# FOR GYROCOMPASS IS AN ERAS LOAD THEN A MISSION PHASE CALL.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:444
//# THE COMPASS ALIGNS TO Z DOWN,X DOWNRANGE, HAS THE CAPABILITY
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:445
//# CHANGE AZIMUTH WHILE RUNNING , IS COMPENSATED FOR
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:446
//# COMPONENT ERRORS,IS CAPABLE OF OPTICAL VERIFICATION( CSM ONLY).
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:447
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:448
//# COMPASS ERASABLE LOAD REQUIRED
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:449
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:450
//#  1-LAUNCHAZ -DP AZIMUTH IN REV FROM NORTH OF XSM DESIRED	(NOM=.2)
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:451
//# 2- LATITUDE -DP-OF LAUNCH PAD
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:452
//# 3- AZIMUTH-DP-OF ZNB OF VEHICLE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:453
//# 4- IMU COMPENSATION PARAMETERS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:454
//# 5-AZ AND ELEVATION OF TARGETS 1,2		****OPTIONAL****
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:455
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:456
//# TO PERFORM AS PART OF COMPASS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:457
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:458
//# 1-OPTICAL VERIFICATION- V 65 E
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:459
//# 2-AZIMUTH CHANGE-V 78 E
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:460
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:461
//# SUBROUTINES CALLED
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:462
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:463
//# DURING OPTICAL VERIFICATION (CSM ONLY) ESSENTIALLY ALL OF INFLIGHT ALIGN
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:464
//# IS CALLED IN ONE WAY OR ANOTHER.  SEE THE LISTING.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:465
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:466
//# NORMAL EXIT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:467
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:468
//# DRIFT TESTS-  LENGTHOT GOES TO ZERO-RETURN TO IMU PERF TEST2 CONTROL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:469
//# GYROCOMPASS-MANY, SEE THE LISTING
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:470
//# ALARMS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:471
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:472
//# 1600	OVERFLOW IN DRIFT TEST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:473
//# Page 433
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:474
//# 1601	BAD IMU TORQUE ABORT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:475
//# 1602	BAD OPTICS DURING VERIFICATION-RETURN TO COMPASS	CSM ONLY
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:476
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:477
//# OUTPUT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:478
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:479
//# DRIFT TESTS- FLASHING DISPLAYS OF RESULTS-CONTROLLED IN IMU PERF TESTS 2
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:480
//# COMPASS-PROGRAM MODE LIGHTS TELL YOU WHAT PHAS OF PROGRAM YOU ARE IN
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:481
//#   01	INITIALIZING THE PLATFORM POSITION AND ERASABLE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:482
//#   02	GYROCOMPASSING
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:483
//#   03	DOING OPTICAL VERIFICATION (CSM)
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:484
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:485
//#
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:486
//# DEBRIS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:487
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:488
//# ALL CENTRALS,ALL OF EBANK XSM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:489
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:490
//# Page 434
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:491
//# MOST OF THE ROUTINES COMMON TO ALIGNMENT AND CALIBRATION APPEAR
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:492
//# ON THE NEXT FEW PAGES.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:493
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:494
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:495
//		COUNT	33/P02
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:496
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:497
//		EBANK=	XSM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:498
//		BANK	33
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:499
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:500
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:501
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:502
//ESTIMS		TC	2PHSCHNG	# COMES HERE FROM IMU2
// PORT: Fixed ROM slots 29995.
    if slot <> 29995 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1665] to agcAotUnit1665@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:503
//		OCT	00075
// PORT: Fixed ROM slots 29996.
    29996, 122,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:504
//		OCT	00004		# TURN OFF GROUP 4 IF ON
// PORT: Fixed ROM slots 29997.
    29997, 8
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29998–30010.
function agcAotUnit1666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30003 {
        if slot <= 30000 {
            if slot <= 29998 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:505
//RSTGTS1		INHINT			# COMES HERE PHASE1 RESTART
// PORT: Fixed ROM slots 29998.
                if slot <> 29998 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29999 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:506
//		CA	TIME1
// PORT: Fixed ROM slots 29999.
                    if slot <> 29999 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 21).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:507
//		TS	GTSWTLT1
// PORT: Fixed ROM slots 30000.
                    if slot <> 30000 or instruction <> 23461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30001 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:508
//		CAF	ZERO		# ZERO THE PIPAS
// PORT: Fixed ROM slots 30001.
                if slot <> 30001 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30002 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:509
//		TS	PIPAX
// PORT: Fixed ROM slots 30002.
                    if slot <> 30002 or instruction <> 22559 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22559, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:510
//		TS	PIPAY
// PORT: Fixed ROM slots 30003.
                    if slot <> 30003 or instruction <> 22560 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22560, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30006 {
            if slot <= 30004 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:511
//		TS	PIPAZ
// PORT: Fixed ROM slots 30004.
                if slot <> 30004 or instruction <> 22561 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22561, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30005 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:512
//		RELINT
// PORT: Fixed ROM slots 30005.
                    if slot <> 30005 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:513
//		CA	77DECML		# ZERO ALL NECESSARY LOCATIONS
// PORT: Fixed ROM slots 30006.
                    if slot <> 30006 or instruction <> 13911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1623), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30008 {
                if slot <= 30007 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:514
//		TS	ZERONDX1
// PORT: Fixed ROM slots 30007.
                    if slot <> 30007 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:515
//		CA	ALXXXZ
// PORT: Fixed ROM slots 30008.
                    if slot <> 30008 or instruction <> 13912 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1624), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30009 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:516
//		TC	ZEROING
// PORT: Fixed ROM slots 30009.
                    if slot <> 30009 or instruction <> 1262 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1262, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:517
//		TC	INTPRET
// PORT: Fixed ROM slots 30010.
                    if slot <> 30010 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1666] to agcAotUnit1666@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:518
//		SLOAD
// PORT: Fixed ROM slots 30011.
    30011, 65466,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:519
//			SCHZEROS
// PORT: Fixed ROM slots 30012.
    30012, 23698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:520
//		STOVL	GCOMPSW -1
// PORT: Fixed ROM slots 30013.
    30013, 22142,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:521
//			INTVAL +2	# LOAD SOME INITIAL DRIFT GAINS
// PORT: Fixed ROM slots 30014.
    30014, 23716,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:522
//		STOVL	ALX1S
// PORT: Fixed ROM slots 30015.
    30015, 23130,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:523
//			SCHZEROS
// PORT: Fixed ROM slots 30016.
    30016, 23698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:524
//		STORE	GCOMP
// PORT: Fixed ROM slots 30017.
    30017, 1652,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:525
//		STORE	DELVX		# GCOMPZER SUBROUTINE NO LONGER NEEDED
// PORT: Fixed ROM slots 30018.
    30018, 1254,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:526
//		EXIT
// PORT: Fixed ROM slots 30019.
    30019, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30020–30023.
function agcAotUnit1667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30021 {
        if slot <= 30020 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:527
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:528
//		CCS	GEOCOMP1	# NON ZERO IF COMPASS.
// PORT: Fixed ROM slots 30020.
            if slot <> 30020 or instruction <> 5027 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 931).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:529
//		TC	+2
// PORT: Fixed ROM slots 30021.
            if slot <> 30021 or instruction <> 1351 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1351, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30022 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:530
//		TC	SLEEPIE	+1
// PORT: Fixed ROM slots 30022.
            if slot <> 30022 or instruction <> 1363 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1363, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:531
//		TC	INTPRET
// PORT: Fixed ROM slots 30023.
            if slot <> 30023 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1667] to agcAotUnit1667@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:532
//		CALL
// PORT: Fixed ROM slots 30024.
    30024, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:533
//			ERTHRVSE
// PORT: Fixed ROM slots 30025.
    30025, 53248,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:534
//		EXIT
// PORT: Fixed ROM slots 30026.
    30026, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30027–30029.
function agcAotUnit1668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30027 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:535
//		CA	LENGTHOT	# TIMES FIVE IS THE NUM OF SEC ERECTING
// PORT: Fixed ROM slots 30027.
        if slot <> 30027 or instruction <> 13066 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 778).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30028 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:536
//		TS	ERECTIME
// PORT: Fixed ROM slots 30028.
            if slot <> 30028 or instruction <> 23462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:537
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:538
//		TC	NEWMODEX
// PORT: Fixed ROM slots 30029.
            if slot <> 30029 or instruction <> 2796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1668] to agcAotUnit1668@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:539
//		MM	02
// PORT: Fixed ROM slots 30030.
    30030, 4
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30031–30031.
function agcAotUnit1669 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:540
//		TC	BANKCALL	# SET UP PIPA FAIL TO CAUSE ISS ALARM
// PORT: Fixed ROM slots 30031.
    if slot <> 30031 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1669] to agcAotUnit1669@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:541
//# Page 435
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:542
//		CADR	PIPUSE		# COMPASS NEVER TURNS THIS OFF
// PORT: Fixed ROM slots 30032.
    30032, 15580
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30033–30035.
function agcAotUnit1670 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30033 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:543
//		TC	ANNNNNN		# END OF FIRST TIME THROUGH
// PORT: Fixed ROM slots 30033.
        if slot <> 30033 or instruction <> 1795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30034 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:544
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:545
//# Page 436
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:546
//# COMES HERE AT THE END OF EVERY ITERATION THROUGH DRIFT TEST OR COMPASS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:547
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:548
//# SET UP WAITLIST SECTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:549
//SLEEPIE		TS	LENGTHOT	# TEST NOT OVER-DECREMENT LENGTHOT
// PORT: Fixed ROM slots 30034.
            if slot <> 30034 or instruction <> 23306 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23306, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:550
//		TC	PHASCHNG	# CHANGE PHASE
// PORT: Fixed ROM slots 30035.
            if slot <> 30035 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1670] to agcAotUnit1670@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:551
//		OCT	00135
// PORT: Fixed ROM slots 30036.
    30036, 186
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30037–30053.
function agcAotUnit1671 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30044 {
        if slot <= 30040 {
            if slot <= 30038 {
                if slot <= 30037 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:552
//		CCS	TORQNDX		# ARE WE DOING VERTDRIFT
// PORT: Fixed ROM slots 30037.
                    if slot <> 30037 or instruction <> 4904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 808).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:553
//		TC	EARTHR*		# TRUE TORQUE SOUTH GYRO
// PORT: Fixed ROM slots 30038.
                    if slot <> 30038 or instruction <> 1295 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1295, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30039 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:554
//WTLISTNT	TC	CHKCOMED	# 	SEE IF COMPASS OVER
// PORT: Fixed ROM slots 30039.
                    if slot <> 30039 or instruction <> 1798 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1798, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:555
//		TC	SETGWLST
// PORT: Fixed ROM slots 30040.
                    if slot <> 30040 or instruction <> 1370 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1370, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30042 {
                if slot <= 30041 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:556
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 30041.
                    if slot <> 30041 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:557
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:558
//SETGWLST	EXTEND
// PORT: Fixed ROM slots 30042.
                    if slot <> 30042 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30043 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:559
//		QXCH	MPAC		# CALLED EVERY WAITLIST OR AZIMUTH CHANGE
// PORT: Fixed ROM slots 30043.
                    if slot <> 30043 or instruction <> 9324 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 108, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:560
//		INHINT
// PORT: Fixed ROM slots 30044.
                    if slot <> 30044 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30048 {
            if slot <= 30046 {
                if slot <= 30045 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:561
//		CS	TIME1
// PORT: Fixed ROM slots 30045.
                    if slot <> 30045 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:562
//		AD	GTSWTLT1
// PORT: Fixed ROM slots 30046.
                    if slot <> 30046 or instruction <> 25509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 933).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30047 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:563
//		EXTEND
// PORT: Fixed ROM slots 30047.
                    if slot <> 30047 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:564
//		BZMF	+2
// PORT: Fixed ROM slots 30048.
                    if slot <> 30048 or instruction <> 25954 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25954, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30050 {
                if slot <= 30049 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:565
//		AD	NEGMAX		# 10 MS ERROR OK
// PORT: Fixed ROM slots 30049.
                    if slot <> 30049 or instruction <> 27137 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:566
//		AD	1SECXT1		# 1 SEC FOR CALIBRATION, .5 SEC IN COMPASS
// PORT: Fixed ROM slots 30050.
                    if slot <> 30050 or instruction <> 25508 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 932).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30051 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:567
//		EXTEND
// PORT: Fixed ROM slots 30051.
                    if slot <> 30051 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30052 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:568
//		BZMF	RIGHTGTS
// PORT: Fixed ROM slots 30052.
                        if slot <> 30052 or instruction <> 25960 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25960, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:569
//WTGTSMPL	TC	TWIDDLE
// PORT: Fixed ROM slots 30053.
                        if slot <> 30053 or instruction <> 2717 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2717, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1671] to agcAotUnit1671@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:570
//		EBANK=	ALTIM
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:571
//		ADRES	ALLOOP
// PORT: Fixed ROM slots 30054.
    30054, 2808
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30055–30060.
function agcAotUnit1672 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30057 {
        if slot <= 30055 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:572
//		TC	MPAC
// PORT: Fixed ROM slots 30055.
            if slot <> 30055 or instruction <> 108 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 108, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30056 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:573
//RIGHTGTS	CAF	FOUR		# SET UP NEXT WAITLIST-ALLOW SOME TIME
// PORT: Fixed ROM slots 30056.
                if slot <> 30056 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:574
//		TC	WTGTSMPL	# END OF WAITLIST SECTION
// PORT: Fixed ROM slots 30057.
                if slot <> 30057 or instruction <> 1381 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1381, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30058 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:575
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:576
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:577
//# STORE AND LOAD DATA SECTIONS FOR RESTART PROOFING
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:578
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:579
//25DECML		EQUALS	OCT31
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:580
//STOREDTA	CAF	25DECML
// PORT: Fixed ROM slots 30058.
            if slot <> 30058 or instruction <> 14411 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2123), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30059 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:581
//		TS	MPAC
// PORT: Fixed ROM slots 30059.
                if slot <> 30059 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:582
//		INDEX	MPAC
// PORT: Fixed ROM slots 30060.
                if slot <> 30060 or instruction <> 20588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1672] to agcAotUnit1672@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:583
//		CAE	THETAX1
// PORT: Fixed ROM slots 30061.
    30061, 26208
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30062–30062.
function agcAotUnit1673 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:584
//		INDEX	MPAC
// PORT: Fixed ROM slots 30062.
    if slot <> 30062 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1673] to agcAotUnit1673@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:585
//		TS	RESTARPT
// PORT: Fixed ROM slots 30063.
    30063, 46846
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30064–30069.
function agcAotUnit1674 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30066 {
        if slot <= 30064 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:586
//		CCS	MPAC
// PORT: Fixed ROM slots 30064.
            if slot <> 30064 or instruction <> 4204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30065 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:587
//		TCF	STOREDTA +1
// PORT: Fixed ROM slots 30065.
                if slot <> 30065 or instruction <> 5483 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5483, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:588
//		TC	Q
// PORT: Fixed ROM slots 30066.
                if slot <> 30066 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30067 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:589
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:590
//LOADSTDT	CAF	25DECML
// PORT: Fixed ROM slots 30067.
            if slot <> 30067 or instruction <> 14411 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2123), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30068 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:591
//		TS	MPAC
// PORT: Fixed ROM slots 30068.
                if slot <> 30068 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:592
//		INDEX	MPAC
// PORT: Fixed ROM slots 30069.
                if slot <> 30069 or instruction <> 20588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1674] to agcAotUnit1674@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:593
//		CA	RESTARPT
// PORT: Fixed ROM slots 30070.
    30070, 26366
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30071–30071.
function agcAotUnit1675 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:594
//		INDEX	MPAC
// PORT: Fixed ROM slots 30071.
    if slot <> 30071 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1675] to agcAotUnit1675@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:595
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:596
//# Page 437
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:597
//		TS	THETAX1
// PORT: Fixed ROM slots 30072.
    30072, 46688
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30073–30080.
function agcAotUnit1676 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30076 {
        if slot <= 30074 {
            if slot <= 30073 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:598
//		CCS	MPAC
// PORT: Fixed ROM slots 30073.
                if slot <> 30073 or instruction <> 4204 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:599
//		TCF	LOADSTDT +1
// PORT: Fixed ROM slots 30074.
                if slot <> 30074 or instruction <> 5492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30075 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:600
//		TC	Q
// PORT: Fixed ROM slots 30075.
                if slot <> 30075 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:601
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:602
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:603
//# COMES HERE EVERY ITERATION BY A WAITLIST CALL SET IN SLEEPIE
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:604
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:605
//ALLOOP		CA	TIME1
// PORT: Fixed ROM slots 30076.
                if slot <> 30076 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 21).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30078 {
            if slot <= 30077 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:606
//		TS	GTSWTLT1	# STORE TIME TO SET UP NEXT WAITLIST.
// PORT: Fixed ROM slots 30077.
                if slot <> 30077 or instruction <> 23461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:607
//ALLOOP3		CA	ALTIM
// PORT: Fixed ROM slots 30078.
                if slot <> 30078 or instruction <> 13152 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 864).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30079 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:608
//		TS	GEOSAVE1
// PORT: Fixed ROM slots 30079.
                if slot <> 30079 or instruction <> 23449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23449, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:609
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30080.
                if slot <> 30080 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1676] to agcAotUnit1676@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:610
//		OCT	00115
// PORT: Fixed ROM slots 30081.
    30081, 154
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30082–30082.
function agcAotUnit1677 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:611
//ALLOOP1		CAE	GEOSAVE1
// PORT: Fixed ROM slots 30082.
    if slot <> 30082 or instruction <> 13209 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 921).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1677] to agcAotUnit1677@.

// PORT: Physical bank 33. Shared continuation entries, slots 30083–30099.
function agcAotUnit1678 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30090 {
        if slot <= 30086 {
            if slot <= 30084 {
                if slot <= 30083 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:612
//		TS	ALTIM
// PORT: Fixed ROM slots 30083.
                    if slot <> 30083 or instruction <> 23392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23392, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:613
//		CCS	A
// PORT: Fixed ROM slots 30084.
                    if slot <> 30084 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30085 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:614
//		CA	A		# SHOULD NEVER HIT THIS LOCATION
// PORT: Fixed ROM slots 30085.
                    if slot <> 30085 or instruction <> 12288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:615
//		TS	ALTIMS
// PORT: Fixed ROM slots 30086.
                    if slot <> 30086 or instruction <> 23393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23393, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30088 {
                if slot <= 30087 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:616
//		CS	A
// PORT: Fixed ROM slots 30087.
                    if slot <> 30087 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:617
//		TS	ALTIM
// PORT: Fixed ROM slots 30088.
                    if slot <> 30088 or instruction <> 23392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23392, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30089 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:618
//		CAF	ZERO
// PORT: Fixed ROM slots 30089.
                    if slot <> 30089 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:619
//		XCH	PIPAX
// PORT: Fixed ROM slots 30090.
                    if slot <> 30090 or instruction <> 23583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 31, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30094 {
            if slot <= 30092 {
                if slot <= 30091 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:620
//		TS	DELVX
// PORT: Fixed ROM slots 30091.
                    if slot <> 30091 or instruction <> 23154 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23154, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:621
//		CAF	ZERO
// PORT: Fixed ROM slots 30092.
                    if slot <> 30092 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30093 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:622
//		XCH	PIPAY
// PORT: Fixed ROM slots 30093.
                    if slot <> 30093 or instruction <> 23584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 32, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:623
//		TS	DELVY
// PORT: Fixed ROM slots 30094.
                    if slot <> 30094 or instruction <> 23156 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23156, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30096 {
                if slot <= 30095 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:624
//		CAF	ZERO
// PORT: Fixed ROM slots 30095.
                    if slot <> 30095 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:625
//		XCH	PIPAZ
// PORT: Fixed ROM slots 30096.
                    if slot <> 30096 or instruction <> 23585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 33, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30097 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:626
//		TS	DELVZ
// PORT: Fixed ROM slots 30097.
                    if slot <> 30097 or instruction <> 23158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23158, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30098 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:627
//		CAF	19DECML		# 23 OCT
// PORT: Fixed ROM slots 30098.
                        if slot <> 30098 or instruction <> 14588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:628
//		TC	NEWPHASE
// PORT: Fixed ROM slots 30099.
                        if slot <> 30099 or instruction <> 2124 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2124, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1678] to agcAotUnit1678@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:629
//		OCT	00005
// PORT: Fixed ROM slots 30100.
    30100, 10
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30101–30102.
function agcAotUnit1679 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30101 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:630
//SPECSTS		CAF	PRIO22
// PORT: Fixed ROM slots 30101.
        if slot <> 30101 or instruction <> 16303 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4015), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:631
//		TC	FINDVAC
// PORT: Fixed ROM slots 30102.
        if slot <> 30102 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1679] to agcAotUnit1679@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:632
//		EBANK=	GEOSAVE1
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:633
//		2CADR	ALFLT		# START THE JOB
// PORT: Fixed ROM slots 30103 30104.
    30103, 2868, 30104, 55402
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30105–30107.
function agcAotUnit1680 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30105 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:634
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:635
//		TC	TASKOVER
// PORT: Fixed ROM slots 30105.
        if slot <> 30105 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30106 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:636
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:637
//# Page 438
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:638
//# THIS IS PART OF THE JOB DONE EVERY ITERATION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:639
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:640
//ALFLT		TC	STOREDTA	# STORE DATA IN CASE OF RESTART IN JOB
// PORT: Fixed ROM slots 30106.
            if slot <> 30106 or instruction <> 1386 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1386, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:641
//		TC	PHASCHNG	# THIS IS THE JOB DONE EVERY ITERATION
// PORT: Fixed ROM slots 30107.
            if slot <> 30107 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1680] to agcAotUnit1680@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:642
//		OCT	00215
// PORT: Fixed ROM slots 30108.
    30108, 282
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30109–30115.
function agcAotUnit1681 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30111 {
        if slot <= 30109 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:643
//		TCF	+2
// PORT: Fixed ROM slots 30109.
            if slot <> 30109 or instruction <> 5535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30110 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:644
//ALFLT1		TC	LOADSTDT	# COMES HERE ON RESTART
// PORT: Fixed ROM slots 30110.
                if slot <> 30110 or instruction <> 1395 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1395, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:645
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:646
//		CCS	GEOCOMP1
// PORT: Fixed ROM slots 30111.
                if slot <> 30111 or instruction <> 5027 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 931).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30113 {
            if slot <= 30112 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:647
//		TC	+2
// PORT: Fixed ROM slots 30112.
                if slot <> 30112 or instruction <> 1442 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1442, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:648
//		TC	NORMLOP
// PORT: Fixed ROM slots 30113.
                if slot <> 30113 or instruction <> 1445 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1445, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30114 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:649
//		TC	CHKCOMED	# 	SEE IF PRELAUNCH OVER
// PORT: Fixed ROM slots 30114.
                if slot <> 30114 or instruction <> 1798 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:650
//		TC	BANKCALL	# COMPENSATION IF IN COMPASS
// PORT: Fixed ROM slots 30115.
                if slot <> 30115 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1681] to agcAotUnit1681@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:651
//		CADR	1/PIPA
// PORT: Fixed ROM slots 30116.
    30116, 13668
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30117–30117.
function agcAotUnit1682 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:652
//NORMLOP		TC	INTPRET
// PORT: Fixed ROM slots 30117.
    if slot <> 30117 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1682] to agcAotUnit1682@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:653
//		DLOAD
// PORT: Fixed ROM slots 30118.
    30118, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:654
//			INTVAL
// PORT: Fixed ROM slots 30119.
    30119, 23712,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:655
//		STOVL	S1
// PORT: Fixed ROM slots 30120.
    30120, 20562,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:656
//			DELVX
// PORT: Fixed ROM slots 30121.
    30121, 1254,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:657
//		VXM	VSL1
// PORT: Fixed ROM slots 30122.
    30122, 64138,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:658
//			XSM
// PORT: Fixed ROM slots 30123.
    30123, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:659
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 30124.
    30124, 48842,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:660
//			MPAC +3
// PORT: Fixed ROM slots 30125.
    30125, 224,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:661
//		STODL	DPIPAY
// PORT: Fixed ROM slots 30126.
    30126, 15030,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:662
//			MPAC +5
// PORT: Fixed ROM slots 30127.
    30127, 228,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:663
//		STORE	DPIPAZ
// PORT: Fixed ROM slots 30128.
    30128, 2750,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:664
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:665
//		SETPD	AXT,1
// PORT: Fixed ROM slots 30129.
    30129, 63490,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:666
//			0
// PORT: Fixed ROM slots 30130.
    30130, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:667
//			8D
// PORT: Fixed ROM slots 30131.
    30131, 16,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:668
//		SLOAD	DCOMP
// PORT: Fixed ROM slots 30132.
    30132, 48826,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:669
//			GEOCOMP1
// PORT: Fixed ROM slots 30133.
    30133, 2888,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:670
//		BMN
// PORT: Fixed ROM slots 30134.
    30134, 65344,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:671
//			ALWAYSG		# DO A QUICK COMPASS
// PORT: Fixed ROM slots 30135.
    30135, 56592,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:672
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:673
//# Page 439
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:674
//# NOW WE HAVE JUST THE CALIBRATION PARTS OF THE PROGRAM-NEXT PAGES
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:675
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:676
//		COUNT	33/COMST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:677
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:678
//ALCGKK		SLOAD	BMN
// PORT: Fixed ROM slots 30136.
    30136, 41146,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:679
//			ALTIMS
// PORT: Fixed ROM slots 30137.
    30137, 2756,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:680
//			ALFLT3		# NO NEW GAINS NEEDED
// PORT: Fixed ROM slots 30138.
    30138, 56202,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:681
//ALKCG		AXT,2	LXA,1		# LOADS SLOPES AND TIME CONSTANTS AT RQST
// PORT: Fixed ROM slots 30139.
    30139, 59640,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:682
//			12D
// PORT: Fixed ROM slots 30140.
    30140, 24,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:683
//			ALX1S
// PORT: Fixed ROM slots 30141.
    30141, 2648,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:684
//ALKCG2		DLOAD*	INCR,1
// PORT: Fixed ROM slots 30142.
    30142, 51398,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:685
//			ALFDK +144D,1
// PORT: Fixed ROM slots 30143.
    30143, 2374,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:686
//		DEC	-2
// PORT: Fixed ROM slots 30144.
    30144, 65530,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:687
//		STORE	ALDK +10D,2
// PORT: Fixed ROM slots 30145.
    30145, 10970,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:688
//		TIX,2	SXA,1
// PORT: Fixed ROM slots 30146.
    30146, 55432,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:689
//			ALKCG2
// PORT: Fixed ROM slots 30147.
    30147, 56188,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:690
//			ALX1S
// PORT: Fixed ROM slots 30148.
    30148, 2648,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:691
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:692
//ALFLT3		AXT,1			# MEASUREMENT INCORPORATION ROUTINES
// PORT: Fixed ROM slots 30149.
    30149, 65520,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:693
//			8D		# AND GAIN UPDATES
// PORT: Fixed ROM slots 30150.
    30150, 16,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:694
//DELMLP		DLOAD*	DMP
// PORT: Fixed ROM slots 30151.
    30151, 34246,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:695
//			DPIPAY +8D,1
// PORT: Fixed ROM slots 30152.
    30152, 2758,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:696
//			PIPASC
// PORT: Fixed ROM slots 30153.
    30153, 24458,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:697
//		SLR	BDSU*
// PORT: Fixed ROM slots 30154.
    30154, 36706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:698
//			9D
// PORT: Fixed ROM slots 30155.
    30155, 17684,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:699
//			INTY +8D,1
// PORT: Fixed ROM slots 30156.
    30156, 2706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:700
//		STORE	INTY +8D,1
// PORT: Fixed ROM slots 30157.
    30157, 6802,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:701
//		PDDL	DMP*
// PORT: Fixed ROM slots 30158.
    30158, 33706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:702
//			VELSC
// PORT: Fixed ROM slots 30159.
    30159, 24462,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:703
//			VLAUN +8D,1
// PORT: Fixed ROM slots 30160.
    30160, 2738,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:704
//		SL2R
// PORT: Fixed ROM slots 30161.
    30161, 65460,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:705
//		DSU	STADR
// PORT: Fixed ROM slots 30162.
    30162, 38442,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:706
//		STORE	DELM +8D,1
// PORT: Fixed ROM slots 30163.
    30163, 58636,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:707
//		STORE	DELM +10D,1
// PORT: Fixed ROM slots 30164.
    30164, 6902,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:708
//		TIX,1	AXT,2
// PORT: Fixed ROM slots 30165.
    30165, 64640,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:709
//			DELMLP
// PORT: Fixed ROM slots 30166.
    30166, 56206,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:710
//			4
// PORT: Fixed ROM slots 30167.
    30167, 8,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:711
//ALILP		DLOAD*	DMPR*
// PORT: Fixed ROM slots 30168.
    30168, 48070,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:712
//			ALK +4,2
// PORT: Fixed ROM slots 30169.
    30169, 62872,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:713
//			ALDK +4,2
// PORT: Fixed ROM slots 30170.
    30170, 62768,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:714
//		STORE	ALK +4,2
// PORT: Fixed ROM slots 30171.
    30171, 10854,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:715
//		TIX,2	AXT,2
// PORT: Fixed ROM slots 30172.
    30172, 64648,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:716
//			ALILP
// PORT: Fixed ROM slots 30173.
    30173, 56240,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:717
//			8D
// PORT: Fixed ROM slots 30174.
    30174, 16,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:718
//ALKLP		LXC,1	SXA,1
// PORT: Fixed ROM slots 30175.
    30175, 55488,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:719
//			CMPX1
// PORT: Fixed ROM slots 30176.
    30176, 2650,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:720
//			CMPX1
// PORT: Fixed ROM slots 30177.
    30177, 2650,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:721
//		DLOAD*	DMPR*
// PORT: Fixed ROM slots 30178.
    30178, 48070,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:722
//			ALK +1,1
// PORT: Fixed ROM slots 30179.
    30179, 2656,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:723
//			DELM +8D,2
// PORT: Fixed ROM slots 30180.
    30180, 62732,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:724
//# Page 440
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:725
//		DAD*
// PORT: Fixed ROM slots 30181.
    30181, 65302,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:726
//			INTY +8D,2
// PORT: Fixed ROM slots 30182.
    30182, 62828,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:727
//		STORE	INTY +8D,2
// PORT: Fixed ROM slots 30183.
    30183, 10898,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:728
//		DLOAD*	DAD*
// PORT: Fixed ROM slots 30184.
    30184, 35782,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:729
//			ALK +12D,2
// PORT: Fixed ROM slots 30185.
    30185, 62856,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:730
//			ALDK +12D,2
// PORT: Fixed ROM slots 30186.
    30186, 62752,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:731
//		STORE	ALK +12D,2
// PORT: Fixed ROM slots 30187.
    30187, 10870,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:732
//		DMPR*	DAD*
// PORT: Fixed ROM slots 30188.
    30188, 35702,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:733
//			DELM +8D,2
// PORT: Fixed ROM slots 30189.
    30189, 62732,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:734
//			INTY +16D,2
// PORT: Fixed ROM slots 30190.
    30190, 62812,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:735
//		STORE	INTY +16D,2
// PORT: Fixed ROM slots 30191.
    30191, 10914,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:736
//		DLOAD*	DMP*
// PORT: Fixed ROM slots 30192.
    30192, 33734,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:737
//			ALSK +1,1
// PORT: Fixed ROM slots 30193.
    30193, 24468,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:738
//			DELM +8D,2
// PORT: Fixed ROM slots 30194.
    30194, 62732,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:739
//		SL1R	DAD*
// PORT: Fixed ROM slots 30195.
    30195, 35828,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:740
//			VLAUN +8D,2
// PORT: Fixed ROM slots 30196.
    30196, 62796,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:741
//		STORE	VLAUN +8D,2
// PORT: Fixed ROM slots 30197.
    30197, 10930,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:742
//		TIX,2	AXT,1
// PORT: Fixed ROM slots 30198.
    30198, 63624,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:743
//			ALKLP
// PORT: Fixed ROM slots 30199.
    30199, 56254,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:744
//			8D
// PORT: Fixed ROM slots 30200.
    30200, 16,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:745
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:746
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:747
//LOOSE		DLOAD*	PDDL*		# EXTRAPOLATE SWAY VARIABLES
// PORT: Fixed ROM slots 30201.
    30201, 54214,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:748
//			ACCWD +8D,1
// PORT: Fixed ROM slots 30202.
    30202, 2742,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:749
//			VLAUN +8D,1
// PORT: Fixed ROM slots 30203.
    30203, 2738,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:750
//		PDDL*	VDEF
// PORT: Fixed ROM slots 30204.
    30204, 46758,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:751
//			POSNV +8D,1
// PORT: Fixed ROM slots 30205.
    30205, 2754,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:752
//		MXV	VSL1
// PORT: Fixed ROM slots 30206.
    30206, 64162,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:753
//			TRANSM1
// PORT: Fixed ROM slots 30207.
    30207, 2050,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:754
//		DLOAD
// PORT: Fixed ROM slots 30208.
    30208, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:755
//			MPAC
// PORT: Fixed ROM slots 30209.
    30209, 218,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:756
//		STORE	POSNV +8D,1
// PORT: Fixed ROM slots 30210.
    30210, 6850,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:757
//		DLOAD
// PORT: Fixed ROM slots 30211.
    30211, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:758
//			MPAC +3
// PORT: Fixed ROM slots 30212.
    30212, 224,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:759
//		STORE	VLAUN +8D,1
// PORT: Fixed ROM slots 30213.
    30213, 6834,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:760
//		DLOAD
// PORT: Fixed ROM slots 30214.
    30214, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:761
//			MPAC +5
// PORT: Fixed ROM slots 30215.
    30215, 228,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:762
//		STORE	ACCWD +8D,1
// PORT: Fixed ROM slots 30216.
    30216, 6838,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:763
//		TIX,1
// PORT: Fixed ROM slots 30217.
    30217, 65408,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:764
//			LOOSE
// PORT: Fixed ROM slots 30218.
    30218, 56306,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:765
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:766
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:767
//		AXT,2	AXT,1		# EVALUATE SINES AND COSINES
// PORT: Fixed ROM slots 30219.
    30219, 63736,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:768
//			6
// PORT: Fixed ROM slots 30220.
    30220, 12,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:769
//			2
// PORT: Fixed ROM slots 30221.
    30221, 4,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:770
//BOOP		DLOAD*	DMPR
// PORT: Fixed ROM slots 30222.
    30222, 48582,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:771
//			ANGX +2,1
// PORT: Fixed ROM slots 30223.
    30223, 2710,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:772
//			GEORGEJ
// PORT: Fixed ROM slots 30224.
    30224, 24474,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:773
//		SR2R
// PORT: Fixed ROM slots 30225.
    30225, 65444,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:774
//		PUSH	SIN
// PORT: Fixed ROM slots 30226.
    30226, 60940,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:775
//# Page 441
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:776
//		SL3R	XAD,1
// PORT: Fixed ROM slots 30227.
    30227, 47220,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:777
//			X1
// PORT: Fixed ROM slots 30228.
    30228, 76,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:778
//		STORE	16D,2
// PORT: Fixed ROM slots 30229.
    30229, 8226,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:779
//		DLOAD
// PORT: Fixed ROM slots 30230.
    30230, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:780
//		COS
// PORT: Fixed ROM slots 30231.
    30231, 65484
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:781
//		STORE	22D,2		# COSINES
// PORT: Fixed ROM slots 30232.
    30232, 8238,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:782
//		TIX,2
// PORT: Fixed ROM slots 30233.
    30233, 65416,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:783
//			BOOP
// PORT: Fixed ROM slots 30234.
    30234, 56348,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:784
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:785
//PERFERAS	EXIT
// PORT: Fixed ROM slots 30235.
    30235, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30236–30246.
function agcAotUnit1683 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30240 {
        if slot <= 30237 {
            if slot <= 30236 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:786
//		CA	EBANK7
// PORT: Fixed ROM slots 30236.
                if slot <> 30236 or instruction <> 14896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:787
//		EBANK=	LAT(SPL)
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:788
//		TS	EBANK
// PORT: Fixed ROM slots 30237.
                if slot <> 30237 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30238 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:789
//		TC	LAT(SPL)	# GO TO ERASABLE ONLY TO RETURN
// PORT: Fixed ROM slots 30238.
                if slot <> 30238 or instruction <> 768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30239 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:790
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:791
//# CAUTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:792
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:793
//# THE ERASABLE PROGRAM THAT DOES THE CALCULATIONS MUST BE LOADED
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:794
//# BEFORE ANY ATTEMPT IS MADE TO RUN THE IMU PERFORMANCE TEST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:795
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:796
//		EBANK=	LENGTHOT
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:797
//ONCEMORE	CCS	LENGTHOT
// PORT: Fixed ROM slots 30239.
                    if slot <> 30239 or instruction <> 4874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:798
//		TC	SLEEPIE		# TEST NOT OVER SET UP NEXT WAITLIST
// PORT: Fixed ROM slots 30240.
                    if slot <> 30240 or instruction <> 1362 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1362, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30243 {
            if slot <= 30241 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:799
//		CCS	TORQNDX
// PORT: Fixed ROM slots 30241.
                if slot <> 30241 or instruction <> 4904 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 808).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30242 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:800
//		TCF	+2
// PORT: Fixed ROM slots 30242.
                    if slot <> 30242 or instruction <> 5668 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5668, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:801
//		TC	SETUPER1
// PORT: Fixed ROM slots 30243.
                    if slot <> 30243 or instruction <> 1574 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1574, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30244 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:802
//		CA	CDUX
// PORT: Fixed ROM slots 30244.
                if slot <> 30244 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30245 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:803
//		TS	LOSVEC +1	# FOR TROUBLESHOOTING POSNS 2$4 VD
// PORT: Fixed ROM slots 30245.
                    if slot <> 30245 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:804
//SETUPER1	TC	INTPRET		# DRIFT TEST OVER
// PORT: Fixed ROM slots 30246.
                    if slot <> 30246 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1683] to agcAotUnit1683@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:805
//		DLOAD	PDDL		# ANGLES FROM DRIFT TEST ONLY
// PORT: Fixed ROM slots 30247.
    30247, 54730,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:806
//			ANGZ
// PORT: Fixed ROM slots 30248.
    30248, 2694,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:807
//			ANGY
// PORT: Fixed ROM slots 30249.
    30249, 2702,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:808
//		PDDL	VDEF
// PORT: Fixed ROM slots 30250.
    30250, 46762,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:809
//			ANGX
// PORT: Fixed ROM slots 30251.
    30251, 2706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:810
//		VCOMP	VXSC
// PORT: Fixed ROM slots 30252.
    30252, 61820,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:811
//			GEORGEJ
// PORT: Fixed ROM slots 30253.
    30253, 24474,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:812
//		MXV	VSR1
// PORT: Fixed ROM slots 30254.
    30254, 62114,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:813
//			XSM
// PORT: Fixed ROM slots 30255.
    30255, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:814
//		STORE	OGC
// PORT: Fixed ROM slots 30256.
    30256, 3040,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:815
//		EXIT
// PORT: Fixed ROM slots 30257.
    30257, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30258–30258.
function agcAotUnit1684 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:816
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:817
//TORQINCH	TC	PHASCHNG
// PORT: Fixed ROM slots 30258.
    if slot <> 30258 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1684] to agcAotUnit1684@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:818
//		OCT	00005
// PORT: Fixed ROM slots 30259.
    30259, 10
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30260–30261.
function agcAotUnit1685 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30260 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:819
//		CA	OGCPL
// PORT: Fixed ROM slots 30260.
        if slot <> 30260 or instruction <> 13604 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1316), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:820
//		TC	BANKCALL
// PORT: Fixed ROM slots 30261.
        if slot <> 30261 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1685] to agcAotUnit1685@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:821
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 30262.
    30262, 15628
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30263–30266.
function agcAotUnit1686 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30264 {
        if slot <= 30263 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:822
//		TC	IMUSTLLG
// PORT: Fixed ROM slots 30263.
            if slot <> 30263 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:823
//		CCS	TORQNDX		# + IF IN VERTICAL DRIFT TEST
// PORT: Fixed ROM slots 30264.
            if slot <> 30264 or instruction <> 4904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 808).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30265 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:824
//		TC	VALMIS		# VERT DRIFT TEST OVER
// PORT: Fixed ROM slots 30265.
            if slot <> 30265 or instruction <> 1202 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1202, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:825
//		TC	INTPRET
// PORT: Fixed ROM slots 30266.
            if slot <> 30266 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1686] to agcAotUnit1686@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:826
//# Page 442
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:827
//		CALL			# SET UP ERATE FOR PIP TEST OR COMPASS
// PORT: Fixed ROM slots 30267.
    30267, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:828
//			ERTHRVSE
// PORT: Fixed ROM slots 30268.
    30268, 53248,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:829
//		EXIT
// PORT: Fixed ROM slots 30269.
    30269, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30270–30271.
function agcAotUnit1687 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30270 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:830
//		TC	TORQUE		# GO TO IMU2 FOR A PIPA TEST AND DISPLAY
// PORT: Fixed ROM slots 30270.
        if slot <> 30270 or instruction <> 1106 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1106, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:831
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:832
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:833
//SOMEERRR	TC	ALARM
// PORT: Fixed ROM slots 30271.
        if slot <> 30271 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1687] to agcAotUnit1687@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:834
//		OCT	1600
// PORT: Fixed ROM slots 30272.
    30272, 1792
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30273–30274.
function agcAotUnit1688 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30273 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:835
//		TC	+3
// PORT: Fixed ROM slots 30273.
        if slot <> 30273 or instruction <> 1604 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1604, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:836
//SOMERR2		TC	ALARM
// PORT: Fixed ROM slots 30274.
        if slot <> 30274 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1688] to agcAotUnit1688@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:837
//		OCT	1601
// PORT: Fixed ROM slots 30275.
    30275, 1794
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30276–30276.
function agcAotUnit1689 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:838
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30276.
    if slot <> 30276 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1689] to agcAotUnit1689@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:839
//		OCT	00005
// PORT: Fixed ROM slots 30277.
    30277, 10
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30278–30278.
function agcAotUnit1690 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:840
//		TC	ENDTEST1
// PORT: Fixed ROM slots 30278.
    if slot <> 30278 or instruction <> 1207 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1207, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1690] to agcAotUnit1690@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:841
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:842
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:843
//# THE FAMOUS MAGIC NUMBERS OF SCHMIDT ARE NOW PART OF AN ERASABLE LOAD.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:844
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:845
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:846
//DEC585		OCT	02222		# 1170 B+14 ORDER IS NOW IMPORTANT
// PORT: Fixed ROM slots 30279.
    30279, 2340,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:847
//SCHZEROS	2DEC	.00000000
// PORT: Fixed ROM slots 30280 30281.
    30280, 0, 30281, 0,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:848
//		2DEC	.00000000
// PORT: Fixed ROM slots 30282 30283.
    30282, 0, 30283, 0,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:849
//		OCT	00000
// PORT: Fixed ROM slots 30284.
    30284, 0,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:850
//ONEDPP		OCT	00000
// PORT: Fixed ROM slots 30285.
    30285, 0,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:851
//		OCT	00001		# 	ABOVE ORDER IS IMPORTANT
// PORT: Fixed ROM slots 30286.
    30286, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:852
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:853
//INTVAL		OCT	4
// PORT: Fixed ROM slots 30287.
    30287, 8,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:854
//		OCT	2
// PORT: Fixed ROM slots 30288.
    30288, 4,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:855
//		DEC	144
// PORT: Fixed ROM slots 30289.
    30289, 288,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:856
//		DEC	-1
// PORT: Fixed ROM slots 30290.
    30290, 65532,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:857
//SOUPLY		2DEC	.93505870	# INITIAL GAINS FOR PIP OUTPUTS
// PORT: Fixed ROM slots 30291 30292.
    30291, 30640, 30292, 58,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:858
//		2DEC	.26266423	# INITIAL GAINS/4 FOR ERECTION ANGLES
// PORT: Fixed ROM slots 30293 30294.
    30293, 8606, 30294, 16080,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:859
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:860
//77DECML		DEC	77
// PORT: Fixed ROM slots 30295.
    30295, 154,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:861
//ALXXXZ		GENADR	ALX1S -1
// PORT: Fixed ROM slots 30296.
    30296, 1622
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30297–30301.
function agcAotUnit1691 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30298 {
        if slot <= 30297 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:862
//# GYROCOMPASS PORTIONS FINISH THIS LOG SECTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:863
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:864
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:865
//		COUNT	33/P01
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:866
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:867
//# INITIALIZATION SECTION
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:868
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:869
//GTSCPSS		CA	FLAGWRD1	# CALLED BY V37
// PORT: Fixed ROM slots 30297.
            if slot <> 30297 or instruction <> 12349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:870
//		MASK	NOP01BIT
// PORT: Fixed ROM slots 30298.
            if slot <> 30298 or instruction <> 31236 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                if fixedOperand = 2048 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30299 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:871
//# Page 443
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:872
//		EXTEND
// PORT: Fixed ROM slots 30299.
            if slot <> 30299 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30300 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:873
//		BZF	GTSCPSSA
// PORT: Fixed ROM slots 30300.
                if slot <> 30300 or instruction <> 5727 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5727, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:874
//		TC	POODOO
// PORT: Fixed ROM slots 30301.
                if slot <> 30301 or instruction <> 3025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3025, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1691] to agcAotUnit1691@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:875
//		OCT	1521		# NODO ALARM FOR P01 - P11 ALREADY DONE
// PORT: Fixed ROM slots 30302.
    30302, 1698
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30303–30332.
function agcAotUnit1692 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30317 {
        if slot <= 30309 {
            if slot <= 30305 {
                if slot <= 30303 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:876
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:877
//GTSCPSSA	CAF	ONE
// PORT: Fixed ROM slots 30303.
                    if slot <> 30303 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30304 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:878
//		TS	GEOCOMP1	# THIS IS THE LEAD IN FOR COMPASS.
// PORT: Fixed ROM slots 30304.
                        if slot <> 30304 or instruction <> 23459 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23459, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:879
//		CA	1/PIPAGT
// PORT: Fixed ROM slots 30305.
                        if slot <> 30305 or instruction <> 14109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1821), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30307 {
                    if slot <= 30306 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:880
//		TS	1/PIPADT
// PORT: Fixed ROM slots 30306.
                        if slot <> 30306 or instruction <> 23100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23100, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:881
//NXXTENN		CA	BIT8
// PORT: Fixed ROM slots 30307.
                        if slot <> 30307 or instruction <> 14856 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30308 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:882
//		TS	LENGTHOT
// PORT: Fixed ROM slots 30308.
                        if slot <> 30308 or instruction <> 23306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23306, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:883
//		CAF	1/2SECX		# COMPASS IS A .5 SEC LOOP
// PORT: Fixed ROM slots 30309.
                        if slot <> 30309 or instruction <> 14878 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30313 {
                if slot <= 30311 {
                    if slot <= 30310 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:884
//		TS	1SECXT1
// PORT: Fixed ROM slots 30310.
                        if slot <> 30310 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:885
//		CAF	ONE
// PORT: Fixed ROM slots 30311.
                        if slot <> 30311 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                    if slot <= 30312 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:886
//		TS	PREMTRX1
// PORT: Fixed ROM slots 30312.
                        if slot <> 30312 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:887
//		TS	PERFDLAY +1
// PORT: Fixed ROM slots 30313.
                        if slot <> 30313 or instruction <> 23471 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23471, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30315 {
                    if slot <= 30314 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:888
//		CAF	ZERO
// PORT: Fixed ROM slots 30314.
                        if slot <> 30314 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:889
//		TS	PERFDLAY
// PORT: Fixed ROM slots 30315.
                        if slot <> 30315 or instruction <> 23470 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23470, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30316 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:890
//		EXTEND
// PORT: Fixed ROM slots 30316.
                        if slot <> 30316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:891
//		DCA	LUNCHAZ1
// PORT: Fixed ROM slots 30317.
                        if slot <> 30317 or instruction <> 13212 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 924, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30324 {
            if slot <= 30320 {
                if slot <= 30318 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:892
//		DXCH	NEWAZ1
// PORT: Fixed ROM slots 30318.
                    if slot <> 30318 or instruction <> 22430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 926, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30319 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:893
//		EXTEND
// PORT: Fixed ROM slots 30319.
                        if slot <> 30319 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:894
//		DCA	LUNCHAZ1
// PORT: Fixed ROM slots 30320.
                        if slot <> 30320 or instruction <> 13212 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 924, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30322 {
                    if slot <= 30321 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:895
//		DXCH	OLDAZMTH
// PORT: Fixed ROM slots 30321.
                        if slot <> 30321 or instruction <> 22432 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 928, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:896
//SETUPGC		CA	DEC17
// PORT: Fixed ROM slots 30322.
                        if slot <> 30322 or instruction <> 14589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2301), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30323 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:897
//		TS	ZERONDX1
// PORT: Fixed ROM slots 30323.
                        if slot <> 30323 or instruction <> 23469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23469, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:898
//		CA	XSMADR
// PORT: Fixed ROM slots 30324.
                        if slot <> 30324 or instruction <> 13606 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1318), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30328 {
                if slot <= 30326 {
                    if slot <= 30325 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:899
//		TC	ZEROING
// PORT: Fixed ROM slots 30325.
                        if slot <> 30325 or instruction <> 1262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1262, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:900
//		TC	POSN17C
// PORT: Fixed ROM slots 30326.
                        if slot <> 30326 or instruction <> 1656 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1656, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30327 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:901
//		TC	GEOIMUTT	# GO TO IMU2 FOR FURTHER INITIALIZATION
// PORT: Fixed ROM slots 30327.
                        if slot <> 30327 or instruction <> 1048 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1048, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:902
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:903
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:904
//POSN17C		EXTEND			# COMPASS POSITION Z DOWN,X DOWNRANGE
// PORT: Fixed ROM slots 30328.
                        if slot <> 30328 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30330 {
                    if slot <= 30329 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:905
//		QXCH	QPLACE		# FROM NORTH IN REVOLUTIONS + CLOCKWISE
// PORT: Fixed ROM slots 30329.
                        if slot <> 30329 or instruction <> 10005 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 789, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:906
//		CS	HALF		# ALL THIS TO INITIALIZE MATRIX
// PORT: Fixed ROM slots 30330.
                        if slot <> 30330 or instruction <> 18946 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30331 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:907
//		TS	ZSM
// PORT: Fixed ROM slots 30331.
                        if slot <> 30331 or instruction <> 23493 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23493, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:908
//		TC	INTPRET
// PORT: Fixed ROM slots 30332.
                        if slot <> 30332 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1692] to agcAotUnit1692@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:909
//		DLOAD	PUSH
// PORT: Fixed ROM slots 30333.
    30333, 34506,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:910
//			NEWAZ1
// PORT: Fixed ROM slots 30334.
    30334, 2876,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:911
//		SIN
// PORT: Fixed ROM slots 30335.
    30335, 65500,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:912
//		STORE	XSM	+4
// PORT: Fixed ROM slots 30336.
    30336, 2940,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:913
//		STODL	YSM	+2
// PORT: Fixed ROM slots 30337.
    30337, 15236,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:914
//		COS
// PORT: Fixed ROM slots 30338.
    30338, 65484,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:915
//		STORE	YSM	+4
// PORT: Fixed ROM slots 30339.
    30339, 2952,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:916
//		DCOMP
// PORT: Fixed ROM slots 30340.
    30340, 65404,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:917
//		STORE	XSM	+2
// PORT: Fixed ROM slots 30341.
    30341, 2936,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:918
//		EXIT
// PORT: Fixed ROM slots 30342.
    30342, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30343–30343.
function agcAotUnit1693 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:919
//		TC	QPLACE
// PORT: Fixed ROM slots 30343.
    if slot <> 30343 or instruction <> 789 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 789, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1693] to agcAotUnit1693@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:920
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:921
//# Page 444
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:922
//# JOB DONE EVERY ITERATION THROUGH COMPASS PROGRAM.SET BY TASK ALLOOP
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:923
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:924
//		COUNT	33/P02
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:925
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:926
//ALWAYSG		DLOAD*	DSU*		# COMPASS AND ERECT
// PORT: Fixed ROM slots 30344.
    30344, 37830,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:927
//			DPIPAY +8D,1
// PORT: Fixed ROM slots 30345.
    30345, 2758,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:928
//			FILDELV1 +8D,1
// PORT: Fixed ROM slots 30346.
    30346, 2698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:929
//		DMPR	DAD*
// PORT: Fixed ROM slots 30347.
    30347, 35706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:930
//			GEOCONS1
// PORT: Fixed ROM slots 30348.
    30348, 24478,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:931
//			FILDELV1 +8D,1
// PORT: Fixed ROM slots 30349.
    30349, 2698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:932
//		STORE	FILDELV1 +8D,1
// PORT: Fixed ROM slots 30350.
    30350, 6794,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:933
//		DAD*
// PORT: Fixed ROM slots 30351.
    30351, 65302,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:934
//			INTVEC1 +8D,1
// PORT: Fixed ROM slots 30352.
    30352, 2702,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:935
//		STORE	INTVEC1 +8D,1
// PORT: Fixed ROM slots 30353.
    30353, 6798,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:936
//		DMPR	DAD*
// PORT: Fixed ROM slots 30354.
    30354, 35706,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:937
//			GEOCONS2
// PORT: Fixed ROM slots 30355.
    30355, 24482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:938
//			FILDELV1 +8D,1
// PORT: Fixed ROM slots 30356.
    30356, 2698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:939
//		DMPR	PUSH
// PORT: Fixed ROM slots 30357.
    30357, 34426,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:940
//			GEOCONS5
// PORT: Fixed ROM slots 30358.
    30358, 13750,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:941
//		TIX,1	SLOAD
// PORT: Fixed ROM slots 30359.
    30359, 56704,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:942
//			ALWAYSG
// PORT: Fixed ROM slots 30360.
    30360, 56592,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:943
//			ERECTIM1
// PORT: Fixed ROM slots 30361.
    30361, 2894,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:944
//		BZE	DLOAD
// PORT: Fixed ROM slots 30362.
    30362, 58712,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:945
//			COMPGS
// PORT: Fixed ROM slots 30363.
    30363, 56648,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:946
//			THETAN1 +2
// PORT: Fixed ROM slots 30364.
    30364, 2674,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:947
//		DSU	STADR
// PORT: Fixed ROM slots 30365.
    30365, 38442,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:948
//		STODL	THETAN1 +2	# ERECTION ONLY.
// PORT: Fixed ROM slots 30366.
    30366, 50572,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:949
//		BDSU
// PORT: Fixed ROM slots 30367.
    30367, 65314,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:950
//			THETAN1 +4
// PORT: Fixed ROM slots 30368.
    30368, 2678,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:951
//		STORE	THETAN1 +4
// PORT: Fixed ROM slots 30369.
    30369, 2678,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:952
//		GOTO
// PORT: Fixed ROM slots 30370.
    30370, 65360,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:953
//			ADDINDRF
// PORT: Fixed ROM slots 30371.
    30371, 56684,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:954
//COMPGS		DLOAD	DAD		# COMPASS
// PORT: Fixed ROM slots 30372.
    30372, 36298,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:955
//			THETAN1
// PORT: Fixed ROM slots 30373.
    30373, 2670,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:956
//			FILDELV1
// PORT: Fixed ROM slots 30374.
    30374, 2682,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:957
//		STODL	THETAN1
// PORT: Fixed ROM slots 30375.
    30375, 14958,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:958
//			FILDELV1
// PORT: Fixed ROM slots 30376.
    30376, 2682,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:959
//		DMPR	BDSU
// PORT: Fixed ROM slots 30377.
    30377, 37242,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:960
//			GEOCONS3
// PORT: Fixed ROM slots 30378.
    30378, 24486,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:961
//			THETAN1 +4
// PORT: Fixed ROM slots 30379.
    30379, 2678,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:962
//		STODL	THETAN1 +4
// PORT: Fixed ROM slots 30380.
    30380, 14966,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:963
//			FILDELV1 +4
// PORT: Fixed ROM slots 30381.
    30381, 2690,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:964
//		DMPR	BDSU
// PORT: Fixed ROM slots 30382.
    30382, 37242,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:965
//			GEOCONS3
// PORT: Fixed ROM slots 30383.
    30383, 24486,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:966
//			THETAN1 +2
// PORT: Fixed ROM slots 30384.
    30384, 2674,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:967
//		PDDL	DMPR
// PORT: Fixed ROM slots 30385.
    30385, 48554,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:968
//			INTVEC1 +4
// PORT: Fixed ROM slots 30386.
    30386, 2694,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:969
//			GEOCONS4
// PORT: Fixed ROM slots 30387.
    30387, 24490,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:970
//		BDSU	STADR
// PORT: Fixed ROM slots 30388.
    30388, 38434,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:971
//		STORE	THETAN1 +2
// PORT: Fixed ROM slots 30389.
    30389, 62860,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:972
//# Page 445
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:973
//ADDINDRF	EXIT
// PORT: Fixed ROM slots 30390.
    30390, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30391–30396.
function agcAotUnit1694 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30393 {
        if slot <= 30391 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:974
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:975
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:976
//ENDGTSAL	CCS	LENGTHOT	# IS 5 SEC OVER-THE TIME TO TORQ PLATFORM
// PORT: Fixed ROM slots 30391.
            if slot <> 30391 or instruction <> 4874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 778).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30392 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:977
//		TC	SLEEPIE		# NO-SET UP NEXT WAITLIST CALL FOR .5 SEC
// PORT: Fixed ROM slots 30392.
                if slot <> 30392 or instruction <> 1362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:978
//		TC	CHKCOMED
// PORT: Fixed ROM slots 30393.
                if slot <> 30393 or instruction <> 1798 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30394 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:979
//		CCS	LGYRO		# YES BUT ARE GYROS BUSY
// PORT: Fixed ROM slots 30394.
            if slot <> 30394 or instruction <> 4804 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 708).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30395 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:980
//		TCF	SLEEPIE +1	# BUSY-GET THEM .5 SECONDS FROM NOW
// PORT: Fixed ROM slots 30395.
                if slot <> 30395 or instruction <> 5459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:981
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:982
//LASTGTS		TC	INTPRET
// PORT: Fixed ROM slots 30396.
                if slot <> 30396 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1694] to agcAotUnit1694@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:983
//		VLOAD
// PORT: Fixed ROM slots 30397.
    30397, 65530,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:984
//			ERCOMP1
// PORT: Fixed ROM slots 30398.
    30398, 2896,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:985
//		STODL	THETAX1
// PORT: Fixed ROM slots 30399.
    30399, 14946,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:986
//			TMARK
// PORT: Fixed ROM slots 30400.
    30400, 2630,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:987
//		STORE	ALK
// PORT: Fixed ROM slots 30401.
    30401, 2654,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:988
//		EXIT			# PREVIOUS SECTION WAS FOR RESTARTS
// PORT: Fixed ROM slots 30402.
    30402, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30403–30403.
function agcAotUnit1695 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:989
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:990
//RESTAIER	TC	PHASCHNG
// PORT: Fixed ROM slots 30403.
    if slot <> 30403 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1695] to agcAotUnit1695@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:991
//		OCT	00275
// PORT: Fixed ROM slots 30404.
    30404, 378
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30405–30405.
function agcAotUnit1696 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:992
//		TC	INTPRET		# ADD COMPASS COMMANDS INTO ERATE
// PORT: Fixed ROM slots 30405.
    if slot <> 30405 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1696] to agcAotUnit1696@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:993
//		VLOAD	MXV
// PORT: Fixed ROM slots 30406.
    30406, 53754,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:994
//			THETAN1
// PORT: Fixed ROM slots 30407.
    30407, 2670,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:995
//			XSM
// PORT: Fixed ROM slots 30408.
    30408, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:996
//		VSL1	VAD
// PORT: Fixed ROM slots 30409.
    30409, 44532,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:997
//			THETAX1
// PORT: Fixed ROM slots 30410.
    30410, 2658,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:998
//		STODL	ERCOMP1
// PORT: Fixed ROM slots 30411.
    30411, 15184,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:999
//			ALK
// PORT: Fixed ROM slots 30412.
    30412, 2654,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1000
//		STORE	TMARK
// PORT: Fixed ROM slots 30413.
    30413, 2630,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1001
//		EXIT
// PORT: Fixed ROM slots 30414.
    30414, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30415–30418.
function agcAotUnit1697 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30416 {
        if slot <= 30415 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1002
//		TC	EARTHR*		# TORQUE IT ALL IN
// PORT: Fixed ROM slots 30415.
            if slot <> 30415 or instruction <> 1295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1295, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1003
//		CAE	ERECTIM1
// PORT: Fixed ROM slots 30416.
            if slot <> 30416 or instruction <> 13222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 934).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30417 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1004
//		TS	GEOSAVE1
// PORT: Fixed ROM slots 30417.
            if slot <> 30417 or instruction <> 23449 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23449, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1005
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30418.
            if slot <> 30418 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1697] to agcAotUnit1697@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1006
//		OCT	00155
// PORT: Fixed ROM slots 30419.
    30419, 218
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30420–30420.
function agcAotUnit1698 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1007
//RESTEST1	TC	INTPRET
// PORT: Fixed ROM slots 30420.
    if slot <> 30420 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1698] to agcAotUnit1698@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1008
//		VLOAD
// PORT: Fixed ROM slots 30421.
    30421, 65530,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1009
//			SCHZEROS
// PORT: Fixed ROM slots 30422.
    30422, 23698,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1010
//		STORE	THETAN1
// PORT: Fixed ROM slots 30423.
    30423, 2670,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1011
//		EXIT
// PORT: Fixed ROM slots 30424.
    30424, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30425–30427.
function agcAotUnit1699 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30425 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1012
//		CCS	PREMTRXC
// PORT: Fixed ROM slots 30425.
        if slot <> 30425 or instruction <> 5018 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 922).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30426 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1013
//		TC	NOCHORLD
// PORT: Fixed ROM slots 30426.
            if slot <> 30426 or instruction <> 1793 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1793, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1014
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30427.
            if slot <> 30427 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1699] to agcAotUnit1699@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1015
//		OCT	00255
// PORT: Fixed ROM slots 30428.
    30428, 346
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30429–30429.
function agcAotUnit1700 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1016
//RESTEST3	TC	INTPRET
// PORT: Fixed ROM slots 30429.
    if slot <> 30429 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1700] to agcAotUnit1700@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1017
//		DLOAD
// PORT: Fixed ROM slots 30430.
    30430, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1018
//			LAUNCHAZ
// PORT: Fixed ROM slots 30431.
    30431, 2872,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1019
//		DSU	BZE
// PORT: Fixed ROM slots 30432.
    30432, 44074,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1020
//			OLDAZMTH
// PORT: Fixed ROM slots 30433.
    30433, 2880,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1021
//			NOAZCHGE
// PORT: Fixed ROM slots 30434.
    30434, 56828,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1022
//		STORE	0D
// PORT: Fixed ROM slots 30435.
    30435, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1023
//# Page 446
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1024
//		SLOAD	DAD
// PORT: Fixed ROM slots 30436.
    30436, 36282,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1025
//			ONEDPP +1
// PORT: Fixed ROM slots 30437.
    30437, 23710,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1026
//			PREMTRXC	# DOES NOT CHANGE LAUNCHAZ
// PORT: Fixed ROM slots 30438.
    30438, 2870,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1027
//		STODL	PREMTRXC
// PORT: Fixed ROM slots 30439.
    30439, 15158,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1028
//			LAUNCHAZ
// PORT: Fixed ROM slots 30440.
    30440, 2872,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1029
//		STODL	NEWAZMTH
// PORT: Fixed ROM slots 30441.
    30441, 15164,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1030
//			0D
// PORT: Fixed ROM slots 30442.
    30442, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1031
//ADERCOMP	STORE	ERCOMP +4
// PORT: Fixed ROM slots 30443.
    30443, 2904,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1032
//		EXIT
// PORT: Fixed ROM slots 30444.
    30444, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30445–30446.
function agcAotUnit1701 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30445 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1033
//		TC	POSN17C
// PORT: Fixed ROM slots 30445.
        if slot <> 30445 or instruction <> 1656 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1656, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1034
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30446.
        if slot <> 30446 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1701] to agcAotUnit1701@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1035
//		OCT	00335
// PORT: Fixed ROM slots 30447.
    30447, 442
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30448–30453.
function agcAotUnit1702 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30450 {
        if slot <= 30448 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1036
//RESCHNG		EXTEND
// PORT: Fixed ROM slots 30448.
            if slot <> 30448 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30449 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1037
//		DCA	NEWAZMTH
// PORT: Fixed ROM slots 30449.
                if slot <> 30449 or instruction <> 13214 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 926, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1038
//		DXCH	OLDAZMTH
// PORT: Fixed ROM slots 30450.
                if slot <> 30450 or instruction <> 22432 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 928, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30451 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1039
//		CA	BIT7		# SPEND 320 SEC ERECTING
// PORT: Fixed ROM slots 30451.
            if slot <> 30451 or instruction <> 14857 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30452 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1040
//		TS	LENGTHOT
// PORT: Fixed ROM slots 30452.
                if slot <> 30452 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1041
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30453.
                if slot <> 30453 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1702] to agcAotUnit1702@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1042
//		OCT	00075
// PORT: Fixed ROM slots 30454.
    30454, 122
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30455–30456.
function agcAotUnit1703 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30455 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1043
//SPITGYRO	CA	ERCOMPPL
// PORT: Fixed ROM slots 30455.
        if slot <> 30455 or instruction <> 14108 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1820), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1044
//		TC	BANKCALL
// PORT: Fixed ROM slots 30456.
        if slot <> 30456 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1703] to agcAotUnit1703@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1045
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 30457.
    30457, 15628
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30458–30458.
function agcAotUnit1704 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1046
//		TC	BANKCALL
// PORT: Fixed ROM slots 30458.
    if slot <> 30458 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1704] to agcAotUnit1704@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1047
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 30459.
    30459, 16126
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30460–30461.
function agcAotUnit1705 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30460 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1048
//		TC	SOMERR2
// PORT: Fixed ROM slots 30460.
        if slot <> 30460 or instruction <> 1602 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1602, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1049
//		TC	ESTIMS		# RE-INITIALIZE
// PORT: Fixed ROM slots 30461.
        if slot <> 30461 or instruction <> 1323 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1323, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1705] to agcAotUnit1705@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1050
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1051
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1052
//NOAZCHGE	EXIT
// PORT: Fixed ROM slots 30462.
    30462, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30463–30470.
function agcAotUnit1706 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30466 {
        if slot <= 30464 {
            if slot <= 30463 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1053
//		CA	ONE
// PORT: Fixed ROM slots 30463.
                if slot <> 30463 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1054
//		TS	PREMTRXC
// PORT: Fixed ROM slots 30464.
                if slot <> 30464 or instruction <> 23450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23450, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30465 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1055
//NOCHORLD	CCS	GEOSAVE1
// PORT: Fixed ROM slots 30465.
                if slot <> 30465 or instruction <> 5017 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 921).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1056
//		TS	ERECTIM1	# COUNTS DOWN FOR ERECTION.
// PORT: Fixed ROM slots 30466.
                if slot <> 30466 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30468 {
            if slot <= 30467 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1057
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1058
//ANNNNNN		CAF	NINE
// PORT: Fixed ROM slots 30467.
                if slot <> 30467 or instruction <> 14556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1059
//		TS	LENGTHOT
// PORT: Fixed ROM slots 30468.
                if slot <> 30468 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30469 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1060
//		TC	SLEEPIE +1
// PORT: Fixed ROM slots 30469.
                if slot <> 30469 or instruction <> 1363 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1363, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1061
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1062
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1063
//CHKCOMED	INHINT
// PORT: Fixed ROM slots 30470.
                if slot <> 30470 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1706] to agcAotUnit1706@.

// PORT: Physical bank 33. Shared continuation entries, slots 30471–30490.
function agcAotUnit1707 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30480 {
        if slot <= 30475 {
            if slot <= 30472 {
                if slot <= 30471 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1064
//		CS 	MODREG		# CHECK FOR MM 07 FIRST
// PORT: Fixed ROM slots 30471.
                    if slot <> 30471 or instruction <> 16905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 521).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1065
//		AD 	SEVEN
// PORT: Fixed ROM slots 30472.
                    if slot <> 30472 or instruction <> 27155 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30473 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1066
//		EXTEND
// PORT: Fixed ROM slots 30473.
                    if slot <> 30473 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30474 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1067
//		BZF 	GOBKCALB	# IF MM 07 RETURN TO PERF TEST
// PORT: Fixed ROM slots 30474.
                        if slot <> 30474 or instruction <> 5910 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5910, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1068
//		CS	ZERO
// PORT: Fixed ROM slots 30475.
                        if slot <> 30475 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30477 {
                if slot <= 30476 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1069
//		EXTEND
// PORT: Fixed ROM slots 30476.
                    if slot <> 30476 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1070
//		RXOR	CHAN30		# READ AND INVERT BITS IN CHANNEL 30
// PORT: Fixed ROM slots 30477.
                    if slot <> 30477 or instruction <> 3096 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 24, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30478 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1071
//		MASK	BIT5		# LIFTOFF BIT
// PORT: Fixed ROM slots 30478.
                    if slot <> 30478 or instruction <> 31243 { return choose false if checkOnly else -1. }
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
                    if slot <= 30479 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1072
//		CCS	A
// PORT: Fixed ROM slots 30479.
                        if slot <> 30479 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1073
//		TCF	PRELTERM	# LIFTOFF HAS OCCURRED
// PORT: Fixed ROM slots 30480.
                        if slot <> 30480 or instruction <> 5911 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5911, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30485 {
            if slot <= 30482 {
                if slot <= 30481 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1074
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1075
//# Page 447
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1076
//		CA	GRRBKBIT	# CHECK FOR BACKUP LIFTOFF
// PORT: Fixed ROM slots 30481.
                    if slot <> 30481 or instruction <> 14859 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1077
//		MASK	FLAGWRD5	# BIT5 FLAGWRD5
// PORT: Fixed ROM slots 30482.
                    if slot <> 30482 or instruction <> 28737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30483 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1078
//		CCS	A
// PORT: Fixed ROM slots 30483.
                    if slot <> 30483 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30484 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1079
//		TCF	PRELTERM	# BACKUP RECEIVED
// PORT: Fixed ROM slots 30484.
                        if slot <> 30484 or instruction <> 5911 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5911, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1080
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1081
//		RELINT
// PORT: Fixed ROM slots 30485.
                        if slot <> 30485 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30487 {
                if slot <= 30486 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1082
//GOBKCALB	TC	Q
// PORT: Fixed ROM slots 30486.
                    if slot <> 30486 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1083
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1084
//PRELTERM	CA	PRIO22		# PRELAUNCH DONE - SET UP P11
// PORT: Fixed ROM slots 30487.
                    if slot <> 30487 or instruction <> 16303 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4015), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30488 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1085
//		TC	PRIOCHNG	# INCREASE PRIORITY HIGHER THAN SERVICER
// PORT: Fixed ROM slots 30488.
                    if slot <> 30488 or instruction <> 2696 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2696, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30489 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1086
//		INHINT
// PORT: Fixed ROM slots 30489.
                        if slot <> 30489 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1087
//		TC	POSTJUMP
// PORT: Fixed ROM slots 30490.
                        if slot <> 30490 or instruction <> 2497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1707] to agcAotUnit1707@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1088
//		CADR	P11
// PORT: Fixed ROM slots 30491.
    30491, 57348,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1089
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1090
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1091
//ERCOMPPL	ECADR	ERCOMP
// PORT: Fixed ROM slots 30492.
    30492, 2894,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1092
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1093
//GEOCONS5	EQUALS	HIDPHALF
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1094
//1/PIPAGT	OCT	06200
// PORT: Fixed ROM slots 30493.
    30493, 6400
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30494–30494.
function agcAotUnit1708 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1095
//17DECML		=	ND1		# OCT 21
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1096
//19DECML		=	VD1		# OCT 23
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1097
//1/2SECX		=	.5SEC
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1098
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1099
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1100
//# Page 448
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1101
//GEOSTRT4	EQUALS	ENDOFJOB
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1102
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1103
//# Page 449
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1104
//# OPTICAL VERIFICATION ROUTINES FOR GYROCOMPASS
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1105
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1106
//		COUNT	33/P03
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1107
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1108
//GCOMPVER	TC	PHASCHNG	# OPTICAL VERIFICATION ROUTINE
// PORT: Fixed ROM slots 30494.
    if slot <> 30494 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1708] to agcAotUnit1708@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1109
//		OCT	00154
// PORT: Fixed ROM slots 30495.
    30495, 216
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30496–30496.
function agcAotUnit1709 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1110
//		TC	NEWMODEX	# ENTERED BY VERB 65 ENTER
// PORT: Fixed ROM slots 30496.
    if slot <> 30496 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1709] to agcAotUnit1709@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1111
//		MM	03
// PORT: Fixed ROM slots 30497.
    30497, 6
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30498–30499.
function agcAotUnit1710 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30498 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1112
//SETNBPOS	TC	NBPOSPL
// PORT: Fixed ROM slots 30498.
        if slot <> 30498 or instruction <> 1055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1113
//		TC	BANKCALL
// PORT: Fixed ROM slots 30499.
        if slot <> 30499 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1710] to agcAotUnit1710@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1114
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 30500.
    30500, 14438
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30501–30506.
function agcAotUnit1711 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30503 {
        if slot <= 30501 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1115
//OPTDATA		CAF	BIT1		# CALLS FOR AZIMUTH AND ELEVATION OF TARGE
// PORT: Fixed ROM slots 30501.
            if slot <> 30501 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30502 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1116
//		ZL			# T 1,THEN TARGET 2
// PORT: Fixed ROM slots 30502.
                if slot <> 30502 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1117
//		LXCH	RUN		# AZIMUTH CLOCKWSE FROM NORTH TO TARGET
// PORT: Fixed ROM slots 30503.
                if slot <> 30503 or instruction <> 10007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 791, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30504 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1118
//		TS	DSPTEM1 +2	# ELEVATION MEASURED FROM HORIZONTAL
// PORT: Fixed ROM slots 30504.
            if slot <> 30504 or instruction <> 23079 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23079, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30505 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1119
//		EXTEND
// PORT: Fixed ROM slots 30505.
                if slot <> 30505 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1120
//		INDEX	RUN
// PORT: Fixed ROM slots 30506.
                if slot <> 30506 or instruction <> 21271 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21271, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21271, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1711] to agcAotUnit1711@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1121
//		DCA	TAZEL1
// PORT: Fixed ROM slots 30507.
    30507, 26166
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30508–30510.
function agcAotUnit1712 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30508 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1122
//		DXCH	DSPTEM1
// PORT: Fixed ROM slots 30508.
        if slot <> 30508 or instruction <> 22054 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30509 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1123
//		CAF	V05N30E
// PORT: Fixed ROM slots 30509.
            if slot <> 30509 or instruction <> 14144 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1856), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1124
//		TC	BANKCALL
// PORT: Fixed ROM slots 30510.
            if slot <> 30510 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1712] to agcAotUnit1712@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1125
//		CADR	GODSPRET
// PORT: Fixed ROM slots 30511.
    30511, 17270
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30512–30513.
function agcAotUnit1713 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30512 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1126
//		CAF	VN0641
// PORT: Fixed ROM slots 30512.
        if slot <> 30512 or instruction <> 14134 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1846), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1127
//		TC	BANKCALL
// PORT: Fixed ROM slots 30513.
        if slot <> 30513 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1713] to agcAotUnit1713@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1128
//		CADR	GOFLASH
// PORT: Fixed ROM slots 30514.
    30514, 17312
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30515–30517.
function agcAotUnit1714 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30515 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1129
//		TC	GCOMP5
// PORT: Fixed ROM slots 30515.
        if slot <> 30515 or instruction <> 1936 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1936, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30516 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1130
//		TC	+3
// PORT: Fixed ROM slots 30516.
            if slot <> 30516 or instruction <> 1847 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1847, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1131
//		TC	-8D
// PORT: Fixed ROM slots 30517.
            if slot <> 30517 or instruction <> 1837 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1837, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1714] to agcAotUnit1714@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1132
//VN0641		VN	0641
// PORT: Fixed ROM slots 30518.
    30518, 1618
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30519–30520.
function agcAotUnit1715 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30519 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1133
//		DXCH	DSPTEM1		# TAZEL1 TARGET 1 AZIMUTH
// PORT: Fixed ROM slots 30519.
        if slot <> 30519 or instruction <> 22054 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1134
//		INDEX	RUN
// PORT: Fixed ROM slots 30520.
        if slot <> 30520 or instruction <> 21271 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21271, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21271, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1715] to agcAotUnit1715@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1135
//		DXCH	TAZEL1		# TAZEL1 +2 TARGET 2 AZIMUTH
// PORT: Fixed ROM slots 30521.
    30521, 44598
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30522–30527.
function agcAotUnit1716 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30524 {
        if slot <= 30522 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1136
//		CCS	RUN
// PORT: Fixed ROM slots 30522.
            if slot <> 30522 or instruction <> 4887 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 791).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30523 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1137
//		TCF	+4
// PORT: Fixed ROM slots 30523.
                if slot <> 30523 or instruction <> 5951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1138
//		CAF	TWO
// PORT: Fixed ROM slots 30524.
                if slot <> 30524 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        if slot <= 30525 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1139
//		TS	L
// PORT: Fixed ROM slots 30525.
            if slot <> 30525 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30526 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1140
//		TCF	OPTDATA +2	# MPAC	1ST PASS=0 2ND PASS=2
// PORT: Fixed ROM slots 30526.
                if slot <> 30526 or instruction <> 5927 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5927, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1141
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1142
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1143
//		TC	CONTIN33
// PORT: Fixed ROM slots 30527.
                if slot <> 30527 or instruction <> 1889 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1889, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1716] to agcAotUnit1716@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1144
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1145
//V05N30E		VN	0530
// PORT: Fixed ROM slots 30528.
    30528, 1340
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30529–30529.
function agcAotUnit1717 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1146
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1147
//		TC	INTPRET		# UNDYNAMIC ASSEMBLER
// PORT: Fixed ROM slots 30529.
    if slot <> 30529 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1717] to agcAotUnit1717@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1148
//TAR/EREF	AXT,1	AXT,2		# TARGET VECTOR
// PORT: Fixed ROM slots 30530.
    30530, 64752,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1149
//			2		# SIN(EL)   -COS(AZ)COS(EL)   SIN(AZ)COS(EL
// PORT: Fixed ROM slots 30531.
    30531, 4,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1150
//			12D
// PORT: Fixed ROM slots 30532.
    30532, 24,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1151
//		SSP	SETPD
// PORT: Fixed ROM slots 30533.
    30533, 33202,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1152
//			S2
// PORT: Fixed ROM slots 30534.
    30534, 84,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1153
//			6
// PORT: Fixed ROM slots 30535.
    30535, 12,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1154
//# Page 450
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1155
//			0
// PORT: Fixed ROM slots 30536.
    30536, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1156
//TAR1		SLOAD*	SR2		# X1=2 X2=12 S2=6 X1=0 X2=6 S2=6
// PORT: Fixed ROM slots 30537.
    30537, 49846,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1157
//			TAZEL1 +3,1
// PORT: Fixed ROM slots 30538.
    30538, 2620,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1158
//		STORE	0		# PD00 ELEVATION PD00
// PORT: Fixed ROM slots 30539.
    30539, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1159
//		SIN
// PORT: Fixed ROM slots 30540.
    30540, 65500,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1160
//		STORE	18D,2		# PD06 *** SIN(EL) ***PD12
// PORT: Fixed ROM slots 30541.
    30541, 8230,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1161
//		DLOAD
// PORT: Fixed ROM slots 30542.
    30542, 65482,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1162
//			0
// PORT: Fixed ROM slots 30543.
    30543, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1163
//		COS	PUSH		# PD00 COS(EL) PD00
// PORT: Fixed ROM slots 30544.
    30544, 34508,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1164
//		SLOAD*	RTB
// PORT: Fixed ROM slots 30545.
    30545, 40118,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1165
//			TAZEL1 +2,1
// PORT: Fixed ROM slots 30546.
    30546, 2618,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1166
//			CDULOGIC
// PORT: Fixed ROM slots 30547.
    30547, 38550,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1167
//		STORE	2		# PD02 AZIMUTH PD02
// PORT: Fixed ROM slots 30548.
    30548, 6,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1168
//		SIN	DMP
// PORT: Fixed ROM slots 30549.
    30549, 34268,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1169
//			0
// PORT: Fixed ROM slots 30550.
    30550, 2,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1170
//		SL1
// PORT: Fixed ROM slots 30551.
    30551, 65492,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1171
//		STORE	22D,2		# PD10 *** SIN(AZ)COS(EL) ***PD16
// PORT: Fixed ROM slots 30552.
    30552, 8238,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1172
//		DLOAD	COS
// PORT: Fixed ROM slots 30553.
    30553, 59082,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1173
//			2
// PORT: Fixed ROM slots 30554.
    30554, 6,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1174
//		DMP	SL1
// PORT: Fixed ROM slots 30555.
    30555, 59914,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1175
//		DCOMP	AXT,1
// PORT: Fixed ROM slots 30556.
    30556, 63612,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1176
//			0
// PORT: Fixed ROM slots 30557.
    30557, 0,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1177
//		STORE	20D,2		# PD08 *** -COS(AZ)COS(EL) ***PD14
// PORT: Fixed ROM slots 30558.
    30558, 8234,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1178
//		TIX,2	RVQ
// PORT: Fixed ROM slots 30559.
    30559, 36488,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1179
//			TAR1
// PORT: Fixed ROM slots 30560.
    30560, 56978
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30561–30565.
function agcAotUnit1718 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30562 {
        if slot <= 30561 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1180
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1181
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1182
//		BANK	33
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1183
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1184
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1185
//		COUNT*	$$/P03
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1186
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1187
//CONTIN33	CA	ONE
// PORT: Fixed ROM slots 30561.
            if slot <> 30561 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1188
//		TS	STARCODE
// PORT: Fixed ROM slots 30562.
            if slot <> 30562 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30563 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1189
//		CA	ZERO
// PORT: Fixed ROM slots 30563.
            if slot <> 30563 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30564 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1190
//		TC	TARGDRVE
// PORT: Fixed ROM slots 30564.
                if slot <> 30564 or instruction <> 1949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1191
//		TC	INTPRET
// PORT: Fixed ROM slots 30565.
                if slot <> 30565 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1718] to agcAotUnit1718@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1192
//		CALL
// PORT: Fixed ROM slots 30566.
    30566, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1193
//			TAR/EREF
// PORT: Fixed ROM slots 30567.
    30567, 56964,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1194
//NEXTBNKS	VLOAD	MXV
// PORT: Fixed ROM slots 30568.
    30568, 53754,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1195
//			6D
// PORT: Fixed ROM slots 30569.
    30569, 14,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1196
//			XSM
// PORT: Fixed ROM slots 30570.
    30570, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1197
//		VSL1
// PORT: Fixed ROM slots 30571.
    30571, 65524,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1198
//		STOVL	STARAD
// PORT: Fixed ROM slots 30572.
    30572, 23484,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1199
//			12D
// PORT: Fixed ROM slots 30573.
    30573, 26,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1200
//		MXV	VSL1
// PORT: Fixed ROM slots 30574.
    30574, 64162,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1201
//			XSM
// PORT: Fixed ROM slots 30575.
    30575, 2932,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1202
//		STCALL	STARAD +6
// PORT: Fixed ROM slots 30576.
    30576, 31688,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1203
//			LITTLSUB
// PORT: Fixed ROM slots 30577.
    30577, 57260,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1204
//		STORE	LOSVEC
// PORT: Fixed ROM slots 30578.
    30578, 2584,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1205
//# Page 451
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1206
//		EXIT
// PORT: Fixed ROM slots 30579.
    30579, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30580–30580.
function agcAotUnit1719 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1207
//		TC	BANKCALL
// PORT: Fixed ROM slots 30580.
    if slot <> 30580 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1719] to agcAotUnit1719@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1208
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 30581.
    30581, 14438
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30582–30586.
function agcAotUnit1720 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30583 {
        if slot <= 30582 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1209
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1210
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1211
//NEXBNKSS	CAF	TWO
// PORT: Fixed ROM slots 30582.
            if slot <> 30582 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1212
//		TS	STARCODE
// PORT: Fixed ROM slots 30583.
            if slot <> 30583 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30584 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1213
//		CAF	SIX
// PORT: Fixed ROM slots 30584.
            if slot <> 30584 or instruction <> 15497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30585 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1214
//		TC	TARGDRVE
// PORT: Fixed ROM slots 30585.
                if slot <> 30585 or instruction <> 1949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1215
//		TC	INTPRET
// PORT: Fixed ROM slots 30586.
                if slot <> 30586 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1720] to agcAotUnit1720@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1216
//		CALL
// PORT: Fixed ROM slots 30587.
    30587, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1217
//			LITTLSUB
// PORT: Fixed ROM slots 30588.
    30588, 57260,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1218
//		STOVL	12D
// PORT: Fixed ROM slots 30589.
    30589, 20506,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1219
//			LOSVEC
// PORT: Fixed ROM slots 30590.
    30590, 2584,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1220
//		STCALL	06D
// PORT: Fixed ROM slots 30591.
    30591, 28686,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1221
//			AXISGEN
// PORT: Fixed ROM slots 30592.
    30592, 40450,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1222
//		CALL
// PORT: Fixed ROM slots 30593.
    30593, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1223
//			CALCGTA
// PORT: Fixed ROM slots 30594.
    30594, 40202,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1224
//		EXIT
// PORT: Fixed ROM slots 30595.
    30595, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30596–30597.
function agcAotUnit1721 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30596 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1225
//GCOMP4		CAF	V06N93S
// PORT: Fixed ROM slots 30596.
        if slot <> 30596 or instruction <> 14233 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1945), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1226
//		TC	BANKCALL
// PORT: Fixed ROM slots 30597.
        if slot <> 30597 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1721] to agcAotUnit1721@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1227
//		CADR	GOFLASH
// PORT: Fixed ROM slots 30598.
    30598, 17312
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30599–30602.
function agcAotUnit1722 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30600 {
        if slot <= 30599 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1228
//		TC	GCOMP5
// PORT: Fixed ROM slots 30599.
            if slot <> 30599 or instruction <> 1936 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1936, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1229
//		TCF	+2
// PORT: Fixed ROM slots 30600.
            if slot <> 30600 or instruction <> 6026 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6026, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30601 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1230
//		TCF	GCOMP4
// PORT: Fixed ROM slots 30601.
            if slot <> 30601 or instruction <> 6020 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6020, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1231
//		TC	INTPRET
// PORT: Fixed ROM slots 30602.
            if slot <> 30602 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1722] to agcAotUnit1722@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1232
//		VLOAD	VAD
// PORT: Fixed ROM slots 30603.
    30603, 44538,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1233
//			OGC
// PORT: Fixed ROM slots 30604.
    30604, 3040,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1234
//			ERCOMP1
// PORT: Fixed ROM slots 30605.
    30605, 2896,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1235
//		STORE	ERCOMP1
// PORT: Fixed ROM slots 30606.
    30606, 2896,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1236
//		EXIT
// PORT: Fixed ROM slots 30607.
    30607, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30608–30608.
function agcAotUnit1723 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1237
//GCOMP5		TC	BANKCALL
// PORT: Fixed ROM slots 30608.
    if slot <> 30608 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1723] to agcAotUnit1723@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1238
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 30609.
    30609, 14438
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30610–30610.
function agcAotUnit1724 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1239
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 30610.
    if slot <> 30610 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1724] to agcAotUnit1724@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1240
//		ADRES	TRM03FLG
// PORT: Fixed ROM slots 30611.
    30611, 52
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30612–30612.
function agcAotUnit1725 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1241
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1242
//		TC	NEWMODEX
// PORT: Fixed ROM slots 30612.
    if slot <> 30612 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1725] to agcAotUnit1725@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1243
//		MM	02
// PORT: Fixed ROM slots 30613.
    30613, 4
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30614–30614.
function agcAotUnit1726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1244
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30614.
    if slot <> 30614 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1726] to agcAotUnit1726@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1245
//		OCT	00004
// PORT: Fixed ROM slots 30615.
    30615, 8
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30616–30616.
function agcAotUnit1727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1246
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 30616.
    if slot <> 30616 or instruction <> 2703 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2703, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1727] to agcAotUnit1727@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1247
//V06N93S		VN	0693
// PORT: Fixed ROM slots 30617.
    30617, 1722
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30618–30618.
function agcAotUnit1728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1248
//GTSOPTCS	TC	ALARM
// PORT: Fixed ROM slots 30618.
    if slot <> 30618 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1728] to agcAotUnit1728@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1249
//GTSOPTSS	OCT	01602
// PORT: Fixed ROM slots 30619.
    30619, 1796
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30620–30620.
function agcAotUnit1729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1250
//		TC	GCOMP5
// PORT: Fixed ROM slots 30620.
    if slot <> 30620 or instruction <> 1936 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1936, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1729] to agcAotUnit1729@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1251
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1252
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1253
//		BANK	34
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1254
//		SETLOC	IMUCAL1
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1255
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1256
//# Page 452
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1257
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1258
//		COUNT	34/COMST
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1259
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1260
//LATAZCHK	DLOAD	SL2		# CALLS FOR AZIMUTH AND LATITUDE
// PORT: Fixed ROM slots 6539.
    6539, 51914,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1261
//			LATITUDE
// PORT: Fixed ROM slots 6540.
    6540, 2566,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1262
//		STODL	DSPTEM1 +1
// PORT: Fixed ROM slots 6541.
    6541, 13390,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1263
//			AZIMUTH
// PORT: Fixed ROM slots 6542.
    6542, 2562,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1264
//		RTB	EXIT
// PORT: Fixed ROM slots 6543.
    6543, 65080,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1265
//			1STO2S
// PORT: Fixed ROM slots 6544.
    6544, 38604
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6545–6547.
function agcAotUnit393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6545 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1266
//		XCH	MPAC
// PORT: Fixed ROM slots 6545.
        if slot <> 6545 or instruction <> 23660 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 108, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6546 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1267
//		TS	DSPTEM1
// PORT: Fixed ROM slots 6546.
            if slot <> 6546 or instruction <> 23077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23077, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1268
//		TC	BANKCALL
// PORT: Fixed ROM slots 6547.
            if slot <> 6547 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[393] to agcAotUnit393@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1269
//		CADR	CLEANDSP
// PORT: Fixed ROM slots 6548.
    6548, 17286
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6549–6550.
function agcAotUnit394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6549 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1270
//		CAF	VNG0641
// PORT: Fixed ROM slots 6549.
        if slot <> 6549 or instruction <> 13732 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1444), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1271
//		TC	BANKCALL
// PORT: Fixed ROM slots 6550.
        if slot <> 6550 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[394] to agcAotUnit394@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1272
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6551.
    6551, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6552–6555.
function agcAotUnit395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6553 {
        if slot <= 6552 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1273
//		TC	+2		# NOT ALLOWED
// PORT: Fixed ROM slots 6552.
            if slot <> 6552 or instruction <> 1434 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1434, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1274
//		TC	+2
// PORT: Fixed ROM slots 6553.
            if slot <> 6553 or instruction <> 1435 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1435, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6554 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1275
//		TC	-5
// PORT: Fixed ROM slots 6554.
            if slot <> 6554 or instruction <> 1429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1276
//		TC	INTPRET
// PORT: Fixed ROM slots 6555.
            if slot <> 6555 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[395] to agcAotUnit395@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1277
//		SLOAD	RTB
// PORT: Fixed ROM slots 6556.
    6556, 40122,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1278
//			DSPTEM1
// PORT: Fixed ROM slots 6557.
    6557, 1100,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1279
//			CDULOGIC
// PORT: Fixed ROM slots 6558.
    6558, 38550,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1280
//		STORE	AZIMUTH
// PORT: Fixed ROM slots 6559.
    6559, 2562,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1281
//		SLOAD	SR2
// PORT: Fixed ROM slots 6560.
    6560, 49850,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1282
//			DSPTEM1 +1
// PORT: Fixed ROM slots 6561.
    6561, 1102,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1283
//		STORE	LATITUDE
// PORT: Fixed ROM slots 6562.
    6562, 2566,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1284
//		RVQ
// PORT: Fixed ROM slots 6563.
    6563, 65308,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1285
//VNG0641		VN	0641
// PORT: Fixed ROM slots 6564.
    6564, 1618
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30621–30624.
function agcAotUnit1730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30622 {
        if slot <= 30621 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1286
//		BANK	33
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1287
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1288
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1289
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1290
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1291
//		COUNT*	$$/P03
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1292
//TARGDRVE	EXTEND
// PORT: Fixed ROM slots 30621.
            if slot <> 30621 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1293
//		QXCH	QPLAC
// PORT: Fixed ROM slots 30622.
            if slot <> 30622 or instruction <> 10004 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 788, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30623 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1294
//		TS	TARG1/2
// PORT: Fixed ROM slots 30623.
            if slot <> 30623 or instruction <> 23321 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23321, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1295
//		TC	INTPRET
// PORT: Fixed ROM slots 30624.
            if slot <> 30624 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1730] to agcAotUnit1730@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1296
//		CALL
// PORT: Fixed ROM slots 30625.
    30625, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1297
//			TAR/EREF
// PORT: Fixed ROM slots 30626.
    30626, 56964,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1298
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 30627.
    30627, 64448,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1299
//			TARG1/2
// PORT: Fixed ROM slots 30628.
    30628, 2610,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1300
//			6D,1
// PORT: Fixed ROM slots 30629.
    30629, 14,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1301
//		STCALL	STAR
// PORT: Fixed ROM slots 30630.
    30630, 31724,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1302
//			SXTANG
// PORT: Fixed ROM slots 30631.
    30631, 38998,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1303
//		EXIT
// PORT: Fixed ROM slots 30632.
    30632, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30633–30640.
function agcAotUnit1731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30636 {
        if slot <= 30634 {
            if slot <= 30633 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1304
//		CA	SAC
// PORT: Fixed ROM slots 30633.
                if slot <> 30633 or instruction <> 13307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1019).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1305
//		TS	DESOPTS
// PORT: Fixed ROM slots 30634.
                if slot <> 30634 or instruction <> 23153 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23153, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30635 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1306
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1307
//# Page 453
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1308
//		CA	PAC
// PORT: Fixed ROM slots 30635.
                if slot <> 30635 or instruction <> 13309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1021).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1309
//		TS	DESOPTT
// PORT: Fixed ROM slots 30636.
                if slot <> 30636 or instruction <> 23152 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23152, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30638 {
            if slot <= 30637 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1310
//RETARG		CAF	ZERO
// PORT: Fixed ROM slots 30637.
                if slot <> 30637 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1311
//		TS	OPTIND
// PORT: Fixed ROM slots 30638.
                if slot <> 30638 or instruction <> 23235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30639 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1312
//		CAF	ONE
// PORT: Fixed ROM slots 30639.
                if slot <> 30639 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1313
//		TC	BANKCALL
// PORT: Fixed ROM slots 30640.
                if slot <> 30640 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1731] to agcAotUnit1731@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1314
//		CADR	SXTMARK
// PORT: Fixed ROM slots 30641.
    30641, 14340
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30642–30642.
function agcAotUnit1732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1315
//		TC	BANKCALL
// PORT: Fixed ROM slots 30642.
    if slot <> 30642 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1732] to agcAotUnit1732@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1316
//		CADR	OPTSTALL
// PORT: Fixed ROM slots 30643.
    30643, 16118
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30644–30649.
function agcAotUnit1733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30646 {
        if slot <= 30644 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1317
//		TC	GTSOPTCS
// PORT: Fixed ROM slots 30644.
            if slot <> 30644 or instruction <> 1946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30645 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1318
//		CAE	FLAGWRD1
// PORT: Fixed ROM slots 30645.
                if slot <> 30645 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1319
//		MASK	TRM03BIT
// PORT: Fixed ROM slots 30646.
                if slot <> 30646 or instruction <> 31244 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 30647 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1320
//		CCS	A
// PORT: Fixed ROM slots 30647.
            if slot <> 30647 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30648 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1321
//		TC	GCOMP5
// PORT: Fixed ROM slots 30648.
                if slot <> 30648 or instruction <> 1936 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1322
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1323
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 30649.
                if slot <> 30649 or instruction <> 21208 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1733] to agcAotUnit1733@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1324
//		CA	QPRET
// PORT: Fixed ROM slots 30650.
    30650, 24660
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30651–30657.
function agcAotUnit1734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30653 {
        if slot <= 30651 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1325
//		EXTEND
// PORT: Fixed ROM slots 30651.
            if slot <> 30651 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30652 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1326
//		BZF	RETARG1
// PORT: Fixed ROM slots 30652.
                if slot <> 30652 or instruction <> 6078 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1327
//		TC	QPLAC
// PORT: Fixed ROM slots 30653.
                if slot <> 30653 or instruction <> 788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30655 {
            if slot <= 30654 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1328
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1329
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1330
//RETARG1		CA	ZERO		# RELEASE PREVIOUSLY GRABBED VAC AREA
// PORT: Fixed ROM slots 30654.
                if slot <> 30654 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1331
//		XCH	MARKSTAT
// PORT: Fixed ROM slots 30655.
                if slot <> 30655 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30656 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1332
//		CCS	A
// PORT: Fixed ROM slots 30656.
                if slot <> 30656 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1333
//		INDEX	A
// PORT: Fixed ROM slots 30657.
                if slot <> 30657 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1734] to agcAotUnit1734@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1334
//		TS	A
// PORT: Fixed ROM slots 30658.
    30658, 45056
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30659–30659.
function agcAotUnit1735 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1335
//		TCF	RETARG		# GO DO SXTMARK AGAIN
// PORT: Fixed ROM slots 30659.
    if slot <> 30659 or instruction <> 6061 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6061, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1735] to agcAotUnit1735@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1336
//		BANK	33
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1337
//		SETLOC	IMUCAL
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1338
//		BANK
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1339
//		COUNT*	$$/P03
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1340
//PIPASC		2DEC	.76376833
// PORT: Fixed ROM slots 30660 30661.
    30660, 25026, 30661, 19016,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1341
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1342
//VELSC		2DEC	-.52223476
// PORT: Fixed ROM slots 30662 30663.
    30662, 48422, 30663, 55890,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1343
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1344
//ALSK		2DEC	.17329931
// PORT: Fixed ROM slots 30664 30665.
    30664, 5678, 30665, 11006,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1345
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1346
//		2DEC	-.00835370
// PORT: Fixed ROM slots 30666 30667.
    30666, 65262, 30667, 37124,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1347
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1348
//GEORGEJ		2DEC	.63661977
// PORT: Fixed ROM slots 30668 30669.
    30668, 20860, 30669, 12396,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1349
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1350
//GEOCONS1	2DEC	.1
// PORT: Fixed ROM slots 30670 30671.
    30670, 3276, 30671, 13108,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1351
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1352
//GEOCONS2	2DEC	.005
// PORT: Fixed ROM slots 30672 30673.
    30672, 162, 30673, 30146,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1353
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1354
//GEOCONS3	2DEC	.062
// PORT: Fixed ROM slots 30674 30675.
    30674, 2030, 30675, 26476,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1355
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1356
//GEOCONS4	2DEC	.0003
// PORT: Fixed ROM slots 30676 30677.
    30676, 8, 30677, 29990,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1357
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1358
//# Page 454
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1359
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1360
//		COUNT	33/P02
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1361
//LITTLSUB	STQ
// PORT: Fixed ROM slots 30678.
    30678, 65312,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1362
//			QPLAC
// PORT: Fixed ROM slots 30679.
    30679, 2600,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1363
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 30680.
    30680, 64448,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1364
//			MARKSTAT
// PORT: Fixed ROM slots 30681.
    30681, 1456,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1365
//			2,1
// PORT: Fixed ROM slots 30682.
    30682, 6,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1366
//		STCALL	CDUSPOT
// PORT: Fixed ROM slots 30683.
    30683, 29678,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1367
//			SXTNB
// PORT: Fixed ROM slots 30684.
    30684, 38912,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1368
//		CALL
// PORT: Fixed ROM slots 30685.
    30685, 65320,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1369
//			TRG*NBSM
// PORT: Fixed ROM slots 30686.
    30686, 40766,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1370
//		GOTO
// PORT: Fixed ROM slots 30687.
    30687, 65360,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1371
//			QPLAC
// PORT: Fixed ROM slots 30688.
    30688, 2600,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1372
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1373
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1374
//		EXIT
// PORT: Fixed ROM slots 30689.
    30689, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30690–30690.
function agcAotUnit1736 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1375
//AZMTHCG1	TC	INTPRET
// PORT: Fixed ROM slots 30690.
    if slot <> 30690 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1736] to agcAotUnit1736@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1376
//		DLOAD	RTB
// PORT: Fixed ROM slots 30691.
    30691, 40138,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1377
//			NEWAZMTH
// PORT: Fixed ROM slots 30692.
    30692, 2876,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1378
//			1STO2S
// PORT: Fixed ROM slots 30693.
    30693, 38604,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1379
//		EXIT
// PORT: Fixed ROM slots 30694.
    30694, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30695–30697.
function agcAotUnit1737 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30695 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1380
//		XCH	MPAC
// PORT: Fixed ROM slots 30695.
        if slot <> 30695 or instruction <> 23660 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 108, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30696 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1381
//		TS	DSPTEM1
// PORT: Fixed ROM slots 30696.
            if slot <> 30696 or instruction <> 23077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23077, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1382
//		TC	BANKCALL
// PORT: Fixed ROM slots 30697.
            if slot <> 30697 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1737] to agcAotUnit1737@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1383
//		CADR	CLEANDSP
// PORT: Fixed ROM slots 30698.
    30698, 17286
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30699–30700.
function agcAotUnit1738 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30699 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1384
//		CAF	VN0629
// PORT: Fixed ROM slots 30699.
        if slot <> 30699 or instruction <> 14333 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2045), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1385
//		TC	BANKCALL
// PORT: Fixed ROM slots 30700.
        if slot <> 30700 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1738] to agcAotUnit1738@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1386
//		CADR	GOFLASH
// PORT: Fixed ROM slots 30701.
    30701, 17312
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30702–30705.
function agcAotUnit1739 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30703 {
        if slot <= 30702 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1387
//		TCF	+2
// PORT: Fixed ROM slots 30702.
            if slot <> 30702 or instruction <> 6128 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1388
//		TCF	+2
// PORT: Fixed ROM slots 30703.
            if slot <> 30703 or instruction <> 6129 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6129, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30704 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1389
//		TCF	-5
// PORT: Fixed ROM slots 30704.
            if slot <> 30704 or instruction <> 6123 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6123, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1390
//		TC	INTPRET
// PORT: Fixed ROM slots 30705.
            if slot <> 30705 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1739] to agcAotUnit1739@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1391
//		SLOAD	RTB
// PORT: Fixed ROM slots 30706.
    30706, 40122,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1392
//			DSPTEM1
// PORT: Fixed ROM slots 30707.
    30707, 1100,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1393
//			CDULOGIC
// PORT: Fixed ROM slots 30708.
    30708, 38550,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1394
//		STORE	LAUNCHAZ
// PORT: Fixed ROM slots 30709.
    30709, 2872,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1395
//		EXIT
// PORT: Fixed ROM slots 30710.
    30710, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30711–30713.
function agcAotUnit1740 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30711 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1396
//		CA	ZERO
// PORT: Fixed ROM slots 30711.
        if slot <> 30711 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30712 {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1397
//		TS	PREMTRXC
// PORT: Fixed ROM slots 30712.
            if slot <> 30712 or instruction <> 23450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23450, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1398
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30713.
            if slot <> 30713 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1740] to agcAotUnit1740@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1399
//		OCT	00004
// PORT: Fixed ROM slots 30714.
    30714, 8
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30715–30715.
function agcAotUnit1741 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1400
//		TC	POSTJUMP
// PORT: Fixed ROM slots 30715.
    if slot <> 30715 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1741] to agcAotUnit1741@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1401
//		CADR	PINBRNCH
// PORT: Fixed ROM slots 30716.
    30716, 17780,
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1402
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1403
//VN0629		VN	0629
// PORT: Fixed ROM slots 30717.
    30717, 1594
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1404
//
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1405
//# Page 455
// PORT: SOURCE IMU_CALIBRATION_AND_ALIGNMENT.agc:1406
//# *** END OF COMAID .029 ***
