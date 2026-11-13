// IMU_CALIBRATION_AND_ALIGNMENT.agc
// bank 33, slots 29700-29710
function agcAotUnit1628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29704 {
        if slot <= 29701 {
            if slot <= 29700 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1
//# Copyright:	Public domain.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:2
//# Filename:	IMU_CALIBRATION_AND_ALIGNMENT.agc
// IMU_CALIBRATION_AND_ALIGNMENT.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// IMU_CALIBRATION_AND_ALIGNMENT.agc:4
//#               is part of the source code for the Command Module's
// IMU_CALIBRATION_AND_ALIGNMENT.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:6
//# Assembler:    yaYUL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:7
//# Reference:    pp. 423-455
// IMU_CALIBRATION_AND_ALIGNMENT.agc:8
//# Contact:      Hommes Kerman <ohommes@cmu.edu>
// IMU_CALIBRATION_AND_ALIGNMENT.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:10
//# Mod history:  2009-05-10 OH	Batch 1 Assignment Comanche Transcription
// IMU_CALIBRATION_AND_ALIGNMENT.agc:11
//#		2009-05-20 RSB	Corrections: P00D00H -> P00DOOH, definition
// IMU_CALIBRATION_AND_ALIGNMENT.agc:12
//#				of 25DECML fixed.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:13
//#		2009-05-23 RSB	At SPECSTS, corrected to PRIO22.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:14
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:15
//# The contents of the "Comanche055" files, in general, are transcribed
// IMU_CALIBRATION_AND_ALIGNMENT.agc:16
//# from scanned documents.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:17
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:18
//#       Assemble revision 055 of AGC program Comanche by NASA
// IMU_CALIBRATION_AND_ALIGNMENT.agc:19
//#       2021113-051.  April 1, 1969.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:20
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:21
//#       This AGC program shall also be referred to as Colossus 2A
// IMU_CALIBRATION_AND_ALIGNMENT.agc:22
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:23
//#       Prepared by
// IMU_CALIBRATION_AND_ALIGNMENT.agc:24
//#                       Massachusetts Institute of Technology
// IMU_CALIBRATION_AND_ALIGNMENT.agc:25
//#                       75 Cambridge Parkway
// IMU_CALIBRATION_AND_ALIGNMENT.agc:26
//#                       Cambridge, Massachusetts
// IMU_CALIBRATION_AND_ALIGNMENT.agc:27
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:28
//#       under NASA contract NAS 9-4065.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:29
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:30
//# Refer directly to the online document mentioned above for further
// IMU_CALIBRATION_AND_ALIGNMENT.agc:31
//# information.  Please report any errors to info@sandroid.org.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:32
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:33
//# Page 423
// IMU_CALIBRATION_AND_ALIGNMENT.agc:34
//# NAME- IMU PERFORMANCE TESTS 2
// IMU_CALIBRATION_AND_ALIGNMENT.agc:35
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:36
//# DATE- MARCH 20,1967
// IMU_CALIBRATION_AND_ALIGNMENT.agc:37
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:38
//# BY- SYSTEM TEST GROUP 864-6900 EXT. 1274
// IMU_CALIBRATION_AND_ALIGNMENT.agc:39
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:40
//# MODNO.- ZERO
// IMU_CALIBRATION_AND_ALIGNMENT.agc:41
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:42
//# FUNCTIONAL DESCRIPTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:43
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:44
//# POSITIONING ROUTINES FOR THE IMU PERFORMANCE TESTS AS WELL AS SOME OF
// IMU_CALIBRATION_AND_ALIGNMENT.agc:45
//# THE TESTS THEMSELVES.  FOR A DESCRIPTION OF THESE SUBROUTINES AND THE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:46
//# OPERATING PROCEDURES (TYPICALLY) SEE STG MEMO 685.THEORETICAL REF.E-1973
// IMU_CALIBRATION_AND_ALIGNMENT.agc:47
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:48
//		BANK	33
// IMU_CALIBRATION_AND_ALIGNMENT.agc:49
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:50
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:51
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:52
//		EBANK=	POSITON
// IMU_CALIBRATION_AND_ALIGNMENT.agc:53
//IMUTEST		CA	ZERO
// slot 29700
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:54
//		TS	DRIFTT
// slot 29701
                if slot <> 29701 or instruction <> 23338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23338, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29702 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:55
//		TS	GEOCOMP1
// slot 29702
                if slot <> 29702 or instruction <> 23459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29703 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:56
//		CAF	TESTTIME
// slot 29703
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:57
//		TS	LENGTHOT
// slot 29704
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:58
//		TC	COAALIGN		# TAKE CARE OF DRIFT FLAG
// slot 29705
                if slot <> 29705 or instruction <> 1218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1218, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29706 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:59
//		CAF	1SECX
// slot 29706
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:60
//		TS	1SECXT1
// slot 29707
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:61
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:62
//		CA	OC14400
// slot 29708
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:63
//		TS	1/PIPADT
// slot 29709
                    if slot <> 29709 or instruction <> 23100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:64
//GUESS		TC	INTPRET			# CALCULATE -COS LATITUDE AND SIN LATITUDE
// slot 29710
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:65
//		CALL
// slot 29711
    29711, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:66
//			LATAZCHK
// slot 29712
    29712, 8982,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:67
//		COS	DCOMP
// slot 29713
    29713, 48844,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:68
//		SL1
// slot 29714
    29714, 65492,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:69
//		STODL	WANGI
// slot 29715
    29715, 14926,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:70
//			LATITUDE
// slot 29716
    29716, 2566,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:71
//		SIN	SL1
// slot 29717
    29717, 60124,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:72
//		STORE	WANGO
// slot 29718
    29718, 2634,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:73
//		EXIT
// slot 29719
    29719, 65532
)).

// bank 33, slots 29720-29720
function agcAotUnit1629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:74
//GEOIMUTT	TC	BANKCALL		# GYROCOMPASS COMES IN HERE
// slot 29720
    if slot <> 29720 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1629] to agcAotUnit1629@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:75
//		CADR	IMUZERO
// slot 29721
    29721, 15102
)).

// bank 33, slots 29722-29733
function agcAotUnit1630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29727 {
        if slot <= 29724 {
            if slot <= 29722 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:76
//		TC	IMUSTLLG
// slot 29722
                if slot <> 29722 or instruction <> 1230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1230, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29723 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:77
//IMUBACK		CA	ZERO
// slot 29723
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:78
//		TS	NDXCTR
// slot 29724
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:79
//		TS	TORQNDX
// slot 29725
                if slot <> 29725 or instruction <> 23336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23336, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29726 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:80
//		TS	TORQNDX	+1
// slot 29726
                    if slot <> 29726 or instruction <> 23337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:81
//NBPOSPL		CA	DEC17
// slot 29727
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:82
//		TS	ZERONDX1
// slot 29728
                if slot <> 29728 or instruction <> 23469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29729 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:83
//		CA	XNBADR
// slot 29729
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:84
//# Page 424
// IMU_CALIBRATION_AND_ALIGNMENT.agc:85
//		TC	ZEROING
// slot 29730
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:86
//		CA	HALF
// slot 29731
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:87
//		TS	XNB
// slot 29732
                    if slot <> 29732 or instruction <> 23499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23499, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:88
//		TC	INTPRET
// slot 29733
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:89
//		DLOAD	SIN
// slot 29734
    29734, 61130,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:90
//			AZIMUTH
// slot 29735
    29735, 2562,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:91
//		STORE	YNB	+2
// slot 29736
    29736, 2984,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:92
//		STODL	ZNB	+4
// slot 29737
    29737, 15288,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:93
//			AZIMUTH
// slot 29738
    29738, 2562,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:94
//		COS
// slot 29739
    29739, 65484,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:95
//		STORE	YNB	+4
// slot 29740
    29740, 2988,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:96
//		DCOMP
// slot 29741
    29741, 65404,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:97
//		STORE	ZNB	+2
// slot 29742
    29742, 2996,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:98
//		EXIT
// slot 29743
    29743, 65532
)).

// bank 33, slots 29744-29744
function agcAotUnit1631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:99
//		TC	CHECKMM
// slot 29744
    if slot <> 29744 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1631] to agcAotUnit1631@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:100
//		MM	03			#   SEE IF IN OPTICAL VERIFICATION
// slot 29745
    29745, 6
)).

// bank 33, slots 29746-29748
function agcAotUnit1632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29746 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:101
//		TCF	+2			#  NO
// slot 29746
        if slot <> 29746 or instruction <> 5172 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5172, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29747 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:102
//		TCF	SETNBPOS +1		#    YES
// slot 29747
            if slot <> 29747 or instruction <> 5923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5923, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:103
//		TC	INTPRET
// slot 29748
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:104
//		CALL
// slot 29749
    29749, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:105
//			CALCGA
// slot 29750
    29750, 40338,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:106
//		EXIT
// slot 29751
    29751, 65532
)).

// bank 33, slots 29752-29752
function agcAotUnit1633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:107
//		TC	BANKCALL
// slot 29752
    if slot <> 29752 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1633] to agcAotUnit1633@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:108
//		CADR	IMUCOARS
// slot 29753
    29753, 15206
)).

// bank 33, slots 29754-29759
function agcAotUnit1634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29756 {
        if slot <= 29754 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:109
//		CAF	GLOKFBIT		# IF GLOKFAIL SET, GIMBAL LOCK
// slot 29754
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:110
//		MASK	FLAGWRD3
// slot 29755
                if slot <> 29755 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:111
//		EXTEND
// slot 29756
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:112
//		BZF	+2
// slot 29757
            if slot <> 29757 or instruction <> 5183 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5183, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29758 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:113
//		INCR	NDXCTR			# +1 IF IN GIMBAL LOCK,OTHERWISE 0
// slot 29758
                if slot <> 29758 or instruction <> 11025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 785).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:114
//		TC	DOWNFLAG		# RESET GIMBAL LOCK FLAG
// slot 29759
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:115
//		ADRES	GLOKFAIL		# BIT 14 FLAG 3
// slot 29760
    29760, 92
)).

// bank 33, slots 29761-29764
function agcAotUnit1635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29762 {
        if slot <= 29761 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:116
//		TC	IMUSTLLG
// slot 29761
            if slot <> 29761 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:117
//		CCS	NDXCTR			# IF ONE GO AND DO A PIPA TEST ONLY
// slot 29762
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:118
//		TC	PIPACHK			# ALIGN AND MEASURE VERTICAL PIPA RATE
// slot 29763
            if slot <> 29763 or instruction <> 1113 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1113, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:119
//		TC	BANKCALL
// slot 29764
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:120
//		CADR	IMUFINE
// slot 29765
    29765, 15478
)).

// bank 33, slots 29766-29769
function agcAotUnit1636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29767 {
        if slot <= 29766 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:121
//		TC	IMUSTLLG
// slot 29766
            if slot <> 29766 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:122
//		EXTEND
// slot 29767
            if slot <> 29767 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29768 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:123
//		DCA	PERFDLAY
// slot 29768
            if slot <> 29768 or instruction <> 13231 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 943, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:124
//		TC	LONGCALL
// slot 29769
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:125
//		EBANK=	POSITON
// IMU_CALIBRATION_AND_ALIGNMENT.agc:126
//		2CADR	GOESTIMS
// slot 29770 29771
    29770, 2204, 29771, 55402
)).

// bank 33, slots 29772-29776
function agcAotUnit1637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29773 {
        if slot <= 29772 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:127
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:128
//		CA	ESTICADR
// slot 29772
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:129
//		TC	JOBSLEEP
// slot 29773
            if slot <> 29773 or instruction <> 2685 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2685, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29774 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:130
//GOESTIMS	CA	ESTICADR
// slot 29774
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:131
//		TC	JOBWAKE
// slot 29775
                if slot <> 29775 or instruction <> 2689 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2689, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:132
//		TC	TASKOVER
// slot 29776
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:133
//ESTICADR	CADR	ESTIMS
// slot 29777
    29777, 55894
)).

// bank 33, slots 29778-29782
function agcAotUnit1638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29779 {
        if slot <= 29778 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:134
//# Page 425
// IMU_CALIBRATION_AND_ALIGNMENT.agc:135
//TORQUE		CA	ZERO
// slot 29778
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:136
//		TS	DSPTEM2
// slot 29779
            if slot <> 29779 or instruction <> 23080 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23080, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29780 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:137
//		CA	DRIFTI
// slot 29780
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:138
//		TS	DSPTEM2	+1
// slot 29781
                if slot <> 29781 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:139
//		INDEX	POSITON
// slot 29782
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:140
//		TS	SOUTHDR	-1
// slot 29783
    29783, 46640
)).

// bank 33, slots 29784-29785
function agcAotUnit1639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29784 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:141
//		TC	SHOW
// slot 29784
        if slot <> 29784 or instruction <> 1303 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1303, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:142
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:143
//PIPACHK		INDEX	NDXCTR		# PIPA TEST
// slot 29785
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:144
//		TC	+1
// slot 29786
    29786, 2230
)).

// bank 33, slots 29787-29793
function agcAotUnit1640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29789 {
        if slot <= 29787 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:145
//		TC	EARTHR*
// slot 29787
            if slot <> 29787 or instruction <> 1295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1295, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29788 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:146
//		CA	DEC57
// slot 29788
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:147
//		TS	LENGTHOT
// slot 29789
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:148
//		CA	ONE
// slot 29790
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:149
//		TS	RESULTCT
// slot 29791
                if slot <> 29791 or instruction <> 23399 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23399, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29792 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:150
//		CA	ZERO
// slot 29792
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:151
//		INDEX	PIPINDEX
// slot 29793
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:152
//		TS	PIPAX
// slot 29794
    29794, 45118
)).

// bank 33, slots 29795-29800
function agcAotUnit1641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29797 {
        if slot <= 29795 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:153
//		TS	DATAPL
// slot 29795
            if slot <> 29795 or instruction <> 23362 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23362, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29796 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:154
//		TS	DATAPL +4
// slot 29796
                if slot <> 29796 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:155
//		TC	CHECKG		# PIP PULSE CATCHING ROUTINE
// slot 29797
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:156
//		INHINT
// slot 29798
            if slot <> 29798 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29799 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:157
//		CAF	TWO
// slot 29799
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:158
//		TC	TWIDDLE
// slot 29800
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:159
//		EBANK=	XSM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:160
//		ADRES	PIPATASK
// slot 29801
    29801, 2262
)).

// bank 33, slots 29802-29809
function agcAotUnit1642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29805 {
        if slot <= 29803 {
            if slot <= 29802 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:161
//		TC	ENDOFJOB
// slot 29802
                if slot <> 29802 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:162
//PIPATASK	EXTEND
// slot 29803
                if slot <> 29803 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29804 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:163
//		DIM	LENGTHOT
// slot 29804
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:164
//		CA	LENGTHOT
// slot 29805
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:165
//		EXTEND
// slot 29806
                if slot <> 29806 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:166
//		BZMF	STARTPIP
// slot 29807
                if slot <> 29807 or instruction <> 25715 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29808 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:167
//		CAF	BIT10
// slot 29808
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:168
//		TC	TWIDDLE
// slot 29809
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:169
//		EBANK=	XSM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:170
//		ADRES	PIPATASK
// slot 29810
    29810, 2262
)).

// bank 33, slots 29811-29812
function agcAotUnit1643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29811 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:171
//STARTPIP	CAF	PRIO20
// slot 29811
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:172
//		TC	FINDVAC
// slot 29812
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:173
//		EBANK=	XSM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:174
//		2CADR	PIPJOBB
// slot 29813 29814
    29813, 2288, 29814, 55402
)).

// bank 33, slots 29815-29816
function agcAotUnit1644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29815 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:175
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:176
//		TC	TASKOVER
// slot 29815
        if slot <> 29815 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:177
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:178
//PIPJOBB		INDEX	NDXCTR
// slot 29816
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:179
//		TC	+1
// slot 29817
    29817, 2292
)).

// bank 33, slots 29818-29829
function agcAotUnit1645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29823 {
        if slot <= 29820 {
            if slot <= 29818 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:180
//		TC	EARTHR*
// slot 29818
                if slot <> 29818 or instruction <> 1295 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1295, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29819 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:181
//		CA	LENGTHOT
// slot 29819
                    if slot <> 29819 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:182
//		EXTEND
// slot 29820
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:183
//		BZMF	+2
// slot 29821
                if slot <> 29821 or instruction <> 25727 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25727, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29822 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:184
//		TC	ENDOFJOB
// slot 29822
                    if slot <> 29822 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:185
//		CA	FIVE
// slot 29823
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:186
//# Page 426
// IMU_CALIBRATION_AND_ALIGNMENT.agc:187
//		TS	RESULTCT
// slot 29824
                if slot <> 29824 or instruction <> 23399 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23399, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29825 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:188
//		TC	CHECKG
// slot 29825
                    if slot <> 29825 or instruction <> 1233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1233, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:189
//		EXTEND
// slot 29826
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:190
//		DCS	DATAPL
// slot 29827
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:191
//		DAS	DATAPL 	+4
// slot 29828
                    if slot <> 29828 or instruction <> 9031 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 839) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:192
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:193
//		TC	INTPRET
// slot 29829
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:194
//		DLOAD	DSU
// slot 29830
    29830, 38346,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:195
//			DATAPL	+6
// slot 29831
    29831, 2706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:196
//			DATAPL 	+2
// slot 29832
    29832, 2698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:197
//		BPL	CALL
// slot 29833
    29833, 37960,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:198
//			AINGOTN
// slot 29834
    29834, 55576,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:199
//			OVERFFIX
// slot 29835
    29835, 55676,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:200
//AINGOTN		PDDL	DDV
// slot 29836
    29836, 47530,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:201
//			DATAPL 	+4
// slot 29837
    29837, 2702,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:202
//		SL4	DMPR
// slot 29838
    29838, 48404,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:203
//			DEC585		# DEC585 HAS BEEN REDEFINED FOR LEM
// slot 29839
    29839, 23696,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:204
//		RTB
// slot 29840
    29840, 65336,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:205
//			SGNAGREE
// slot 29841
    29841, 38600,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:206
//		STORE	DSPTEM2
// slot 29842
    29842, 1106,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:207
//		EXIT
// slot 29843
    29843, 65532
)).

// bank 33, slots 29844-29849
function agcAotUnit1646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29846 {
        if slot <= 29844 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:208
//		CCS	NDXCTR
// slot 29844
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:209
//		TC	COAALIGN	# TAKE PLATFORM OUT OF GIMBAL LOCK
// slot 29845
                if slot <> 29845 or instruction <> 1218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1218, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:210
//		TC	SHOW
// slot 29846
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:211
//VERTDRFT	CA	3990DEC		# ABOUT 1 HOUR VERTICAL DRIFT TEST
// slot 29847
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:212
//		TS	LENGTHOT
// slot 29848
                if slot <> 29848 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:213
//		INDEX	POSITON
// slot 29849
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:214
//		CS	SOUTHDR -2
// slot 29850
    29850, 34350
)).

// bank 33, slots 29851-29879
function agcAotUnit1647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29864 {
        if slot <= 29857 {
            if slot <= 29853 {
                if slot <= 29851 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:215
//		TS	DRIFTT
// slot 29851
                    if slot <> 29851 or instruction <> 23338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23338, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 29852 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:216
//		CA	XSM	+4	# 0 IF POSN 4
// slot 29852
                        if slot <> 29852 or instruction <> 13245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 957).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:217
//		EXTEND
// slot 29853
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:218
//		BZF	PON2
// slot 29854
                        if slot <> 29854 or instruction <> 5284 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5284, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:219
//PON4		CS	BIT5		# 	OFFSET PLATFORM
// slot 29855
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:220
//		ADS	ERCOMP1	+2
// slot 29856
                        if slot <> 29856 or instruction <> 12201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:221
//		CA	BIT5
// slot 29857
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:222
//		ADS	ERCOMP1
// slot 29858
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:223
//		TCF	PONG
// slot 29859
                        if slot <> 29859 or instruction <> 5288 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5288, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:224
//PON2		CS	BIT5
// slot 29860
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:225
//		ADS	ERCOMP1 +2
// slot 29861
                        if slot <> 29861 or instruction <> 12201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:226
//		CA	BIT5
// slot 29862
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:227
//		ADS	ERCOMP1 +4
// slot 29863
                        if slot <> 29863 or instruction <> 12203 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 939).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:228
//PONG		TC	EARTHR*
// slot 29864
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:229
//		CA	ZERO		# ALLOW ONLY SOUTH GYRO KERBIN RATE COMPENS
// slot 29865
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:230
//		TS	ERVECTOR
// slot 29866
                        if slot <> 29866 or instruction <> 23300 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23300, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:231
//		TS	ERVECTOR +1
// slot 29867
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:232
//GUESS1		CAF	POSMAX
// slot 29868
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:233
//		TS	TORQNDX
// slot 29869
                        if slot <> 29869 or instruction <> 23336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23336, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29870 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:234
//		TS	TORQNDX +1
// slot 29870
                        if slot <> 29870 or instruction <> 23337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:235
//		CA	CDUX
// slot 29871
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:236
//		TS	LOSVEC
// slot 29872
                        if slot <> 29872 or instruction <> 23307 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23307, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:237
//# Page 427
// IMU_CALIBRATION_AND_ALIGNMENT.agc:238
//		TC	ESTIMS
// slot 29873
                        if slot <> 29873 or instruction <> 1323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1323, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29874 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:239
//VALMIS		CA	DRIFTO
// slot 29874
                        if slot <> 29874 or instruction <> 13130 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 842).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:240
//		TS	DSPTEM2 +1
// slot 29875
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:241
//		CA	ZERO
// slot 29876
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:242
//		TS	DSPTEM2
// slot 29877
                        if slot <> 29877 or instruction <> 23080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23080, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29878 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:243
//		TC	SHOW
// slot 29878
                        if slot <> 29878 or instruction <> 1303 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1303, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:244
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:245
//ENDTEST1	TC	DOWNFLAG	# IMU NOT IN USE
// slot 29879
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:246
//		ADRES	IMUSE		# BIT 8 FLAG 0
// slot 29880
    29880, 14
)).

// bank 33, slots 29881-29881
function agcAotUnit1648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:247
//		CS	ZERO
// slot 29881
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

// bank 33, slots 29882-29883
function agcAotUnit1649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29882 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:248
//		TC	NEWMODEX +3
// slot 29882
        if slot <> 29882 or instruction <> 2799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:249
//		TC	BANKCALL
// slot 29883
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:250
//		CADR	MKRELEAS
// slot 29884
    29884, 14438
)).

// bank 33, slots 29885-29885
function agcAotUnit1650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:251
//		TC	ENDEXT
// slot 29885
    if slot <> 29885 or instruction <> 2908 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2908, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1650] to agcAotUnit1650@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:252
//# Page 428
// IMU_CALIBRATION_AND_ALIGNMENT.agc:253
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:254
//OVERFFIX	DAD	DAD
// slot 29886
    29886, 36122,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:255
//			DPPOSMAX
// slot 29887
    29887, 13766,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:256
//			ONEDPP
// slot 29888
    29888, 23708,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:257
//		RVQ
// slot 29889
    29889, 65308
)).

// bank 33, slots 29890-29896
function agcAotUnit1651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29892 {
        if slot <= 29890 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:258
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:259
//COAALIGN	EXTEND			# COARSE ALIGN SUBROUTINE
// slot 29890
            if slot <> 29890 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29891 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:260
//		QXCH	QPLACE
// slot 29891
                if slot <> 29891 or instruction <> 10005 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 789, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:261
//		CA	ZERO
// slot 29892
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:262
//		TS	THETAD
// slot 29893
                if slot <> 29893 or instruction <> 23149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23149, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:263
//		TS	THETAD +1
// slot 29894
                if slot <> 29894 or instruction <> 23150 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23150, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29895 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:264
//		TS	THETAD +2
// slot 29895
                if slot <> 29895 or instruction <> 23151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23151, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:265
//		TC	BANKCALL
// slot 29896
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:266
//		CADR	IMUCOARS
// slot 29897
    29897, 15206
)).

// bank 33, slots 29898-29898
function agcAotUnit1652 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:267
//		TC	BANKCALL
// slot 29898
    if slot <> 29898 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1652] to agcAotUnit1652@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:268
//		CADR	IMUSTALL
// slot 29899
    29899, 16126
)).

// bank 33, slots 29900-29914
function agcAotUnit1653 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29906 {
        if slot <= 29902 {
            if slot <= 29900 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:269
//		TC	SOMERR2
// slot 29900
                if slot <> 29900 or instruction <> 1602 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1602, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29901 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:270
//		TC	QPLACE
// slot 29901
                    if slot <> 29901 or instruction <> 789 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 789, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:271
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:272
//IMUSTLLG	EXTEND
// slot 29902
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:273
//		QXCH	QPLACE
// slot 29903
                    if slot <> 29903 or instruction <> 10005 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 789, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:274
//		TC	COAALIGN +10
// slot 29904
                    if slot <> 29904 or instruction <> 1226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1226, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29905 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:275
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:276
//CHECKG		EXTEND			# PIP PULSE CATCHING ROUTINE
// slot 29905
                    if slot <> 29905 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:277
//		QXCH	QPLACE
// slot 29906
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:278
//		TC	+6
// slot 29907
                    if slot <> 29907 or instruction <> 1241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1241, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:279
//CHECKG1		RELINT
// slot 29908
                    if slot <> 29908 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29909 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:280
//		CA	NEWJOB
// slot 29909
                    if slot <> 29909 or instruction <> 12343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:281
//		EXTEND
// slot 29910
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:282
//		BZMF	+6
// slot 29911
                    if slot <> 29911 or instruction <> 25821 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25821, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:283
//		TC	CHANG1
// slot 29912
                    if slot <> 29912 or instruction <> 2676 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2676, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29913 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:284
//		INHINT
// slot 29913
                    if slot <> 29913 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:285
//		INDEX	PIPINDEX
// slot 29914
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:286
//		CS	PIPAX
// slot 29915
    29915, 32830
)).

// bank 33, slots 29916-29918
function agcAotUnit1654 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29916 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:287
//		TS	ZERONDX
// slot 29916
        if slot <> 29916 or instruction <> 23469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29917 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:288
//		INHINT
// slot 29917
            if slot <> 29917 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:289
//		INDEX	PIPINDEX
// slot 29918
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:290
//		CA	PIPAX
// slot 29919
    29919, 24638
)).

// bank 33, slots 29920-29923
function agcAotUnit1655 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29921 {
        if slot <= 29920 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:291
//		AD	ZERONDX
// slot 29920
            if slot <> 29920 or instruction <> 25517 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 941).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:292
//		EXTEND
// slot 29921
            if slot <> 29921 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29922 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:293
//		BZF	CHECKG1
// slot 29922
            if slot <> 29922 or instruction <> 5332 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5332, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:294
//		INDEX	PIPINDEX
// slot 29923
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:295
//		CA	PIPAX
// slot 29924
    29924, 24638
)).

// bank 33, slots 29925-29925
function agcAotUnit1656 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:296
//		INDEX	RESULTCT
// slot 29925
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:297
//		TS	DATAPL
// slot 29926
    29926, 46724
)).

// bank 33, slots 29927-29928
function agcAotUnit1657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29927 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:298
//		TC	FINETIME
// slot 29927
        if slot <> 29927 or instruction <> 2411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2411, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:299
//		INDEX	RESULTCT
// slot 29928
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:300
//		TS	DATAPL +1
// slot 29929
    29929, 46726
)).

// bank 33, slots 29930-29930
function agcAotUnit1658 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:301
//# Page 429
// IMU_CALIBRATION_AND_ALIGNMENT.agc:302
//		INDEX	RESULTCT
// slot 29930
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:303
//		LXCH	DATAPL +2
// slot 29931
    29931, 20104
)).

// bank 33, slots 29932-29938
function agcAotUnit1659 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29934 {
        if slot <= 29932 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:304
//		RELINT
// slot 29932
            if slot <> 29932 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29933 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:305
//ENDCHKG		TC	QPLACE
// slot 29933
                if slot <> 29933 or instruction <> 789 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 789, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:306
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:307
//ZEROING		TS	L
// slot 29934
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:308
//		TCF	+2
// slot 29935
                if slot <> 29935 or instruction <> 5361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:309
//ZEROING1	TS	ZERONDX1
// slot 29936
                if slot <> 29936 or instruction <> 23469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29937 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:310
//		CAF	ZERO
// slot 29937
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:311
//		INDEX	L
// slot 29938
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:312
//		TS	0
// slot 29939
    29939, 45056
)).

// bank 33, slots 29940-29943
function agcAotUnit1660 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29941 {
        if slot <= 29940 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:313
//		INCR	L
// slot 29940
            if slot <> 29940 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:314
//		CCS	ZERONDX1
// slot 29941
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:315
//		TCF	ZEROING1
// slot 29942
            if slot <> 29942 or instruction <> 5360 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5360, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:316
//		TC	Q
// slot 29943
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:317
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:318
//# Page 430
// IMU_CALIBRATION_AND_ALIGNMENT.agc:319
//		SETLOC	IMUCAL3
// IMU_CALIBRATION_AND_ALIGNMENT.agc:320
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:321
//ERTHRVSE	DLOAD	PDDL
// slot 28672
    28672, 54730,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:322
//			SCHZEROS	# PD24 = (SIN		-COS	0)(OMEG/MS)
// slot 28673
    28673, 23698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:323
//			LATITUDE
// slot 28674
    28674, 2566,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:324
//		COS	DCOMP
// slot 28675
    28675, 48844,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:325
//		PDDL	SIN
// slot 28676
    28676, 61098,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:326
//			LATITUDE
// slot 28677
    28677, 2566,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:327
//		VDEF	VXSC
// slot 28678
    28678, 61804,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:328
//			OMEG/MS
// slot 28679
    28679, 23120,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:329
//		STORE	ERVECTOR
// slot 28680
    28680, 2570,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:330
//		RTB
// slot 28681
    28681, 65336,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:331
//			LOADTIME
// slot 28682
    28682, 38544,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:332
//		STOVL	TMARK
// slot 28683
    28683, 23110,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:333
//			SCHZEROS
// slot 28684
    28684, 23698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:334
//		STORE	ERCOMP1
// slot 28685
    28685, 2896,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:335
//		RVQ
// slot 28686
    28686, 65308,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:336
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:337
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:338
//EARTHR		ITA	RTB		# CALCULATES AND COMPENSATES KERBIN RATE
// slot 29944
    29944, 39968,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:339
//			S2
// slot 29945
    29945, 82,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:340
//			LOADTIME
// slot 29946
    29946, 38544,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:341
//		STORE	TEMPTIME
// slot 29947
    29947, 2626,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:342
//		DSU	BPL
// slot 29948
    29948, 42026,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:343
//			TMARK
// slot 29949
    29949, 2630,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:344
//			ERTHR
// slot 29950
    29950, 55810,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:345
//		CALL
// slot 29951
    29951, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:346
//			OVERFFIX
// slot 29952
    29952, 55676,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:347
//ERTHR		SL	VXSC
// slot 29953
    29953, 61794,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:348
//			9D
// slot 29954
    29954, 16660,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:349
//			ERVECTOR
// slot 29955
    29955, 2570,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:350
//		MXV	VAD
// slot 29956
    29956, 44450,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:351
//			XSM
// slot 29957
    29957, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:352
//			ERCOMP1
// slot 29958
    29958, 2896,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:353
//		STODL	ERCOMP1
// slot 29959
    29959, 15184,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:354
//			TEMPTIME
// slot 29960
    29960, 2626,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:355
//		STORE	TMARK
// slot 29961
    29961, 2630,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:356
//		AXT,1	RTB
// slot 29962
    29962, 40176,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:357
//		ECADR	ERCOMP1
// slot 29963
    29963, 2894,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:358
//			PULSEIMU
// slot 29964
    29964, 38742,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:359
//		GOTO
// slot 29965
    29965, 65360,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:360
//			S2
// slot 29966
    29966, 82
)).

// bank 33, slots 29967-29969
function agcAotUnit1661 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29967 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:361
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:362
//EARTHR*		EXTEND
// slot 29967
        if slot <> 29967 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29968 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:363
//		QXCH	QPLACES
// slot 29968
            if slot <> 29968 or instruction <> 10006 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 790, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:364
//		TC	INTPRET
// slot 29969
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:365
//		CALL
// slot 29970
    29970, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:366
//			EARTHR
// slot 29971
    29971, 55792,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:367
//PROUT		EXIT
// slot 29972
    29972, 65532
)).

// bank 33, slots 29973-29980
function agcAotUnit1662 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29976 {
        if slot <= 29974 {
            if slot <= 29973 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:368
//		TC	IMUSTLLG
// slot 29973
                if slot <> 29973 or instruction <> 1230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1230, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:369
//		TC	QPLACES
// slot 29974
                if slot <> 29974 or instruction <> 790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29975 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:370
//# Page 431
// IMU_CALIBRATION_AND_ALIGNMENT.agc:371
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:372
//SHOW		EXTEND
// slot 29975
                if slot <> 29975 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:373
//		QXCH	QPLACE
// slot 29976
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:374
//SHOW1		CA	POSITON
// slot 29977
                if slot <> 29977 or instruction <> 13075 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 787).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:375
//		TS	DSPTEM2 +2
// slot 29978
                if slot <> 29978 or instruction <> 23082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23082, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29979 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:376
//		CA	VB06N98
// slot 29979
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:377
//		TC	BANKCALL
// slot 29980
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:378
//		CADR	GOFLASH
// slot 29981
    29981, 17312
)).

// bank 33, slots 29982-29984
function agcAotUnit1663 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29982 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:379
//		TC	ENDTEST1	# V 34
// slot 29982
        if slot <> 29982 or instruction <> 1207 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1207, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29983 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:380
//		TC	QPLACE		#  V33
// slot 29983
            if slot <> 29983 or instruction <> 789 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 789, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:381
//		TCF	SHOW1
// slot 29984
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:382
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:383
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:384
//OC14400		OCT	14400
// slot 29985
    29985, 12800,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:385
//3990DEC		=	OMEG/MS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:386
//VB06N98		VN	0698
// slot 29986
    29986, 1732,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:387
//TESTTIME	OCT	01602
// slot 29987
    29987, 1796,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:388
//DEC17		=	ND1
// IMU_CALIBRATION_AND_ALIGNMENT.agc:389
//OGCPL		ECADR	OGC
// slot 29988
    29988, 3038,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:390
//1SECX		=	1SEC
// IMU_CALIBRATION_AND_ALIGNMENT.agc:391
//DEC57		=	VD1
// IMU_CALIBRATION_AND_ALIGNMENT.agc:392
//XNBADR		GENADR	XNB
// slot 29989
    29989, 1942,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:393
//XSMADR		GENADR	XSM
// slot 29990
    29990, 1906,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:394
//OMEG/MS		2DEC	.24339048
// slot 29991 29992
    29991, 7974, 29992, 23252
)).

// bank 33, slots 29993-29993
function agcAotUnit1664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:395
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:396
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:397
//P11OUT		TC	BANKCALL
// slot 29993
    if slot <> 29993 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1664] to agcAotUnit1664@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:398
//		CADR	MATRXJOB	# RETURN TO P11
// slot 29994
    29994, 57502
)).

// bank 02, slots 4459-4476
function agcAotUnit165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4467 {
        if slot <= 4462 {
            if slot <= 4460 {
                if slot <= 4459 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:399
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:400
//		COUNT	02/COMST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:401
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:402
//		BLOCK	2
// IMU_CALIBRATION_AND_ALIGNMENT.agc:403
//FINETIME	INHINT			# RETURNS WITH INTERRUPT INHIBITED
// slot 4459
                    if slot <> 4459 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:404
//		EXTEND
// slot 4460
                    if slot <> 4460 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4461 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:405
//		READ	LOSCALAR
// slot 4461
                    if slot <> 4461 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:406
//		TS	L
// slot 4462
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:407
//		EXTEND
// slot 4463
                    if slot <> 4463 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:408
//		RXOR	LOSCALAR
// slot 4464
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:409
//		EXTEND
// slot 4465
                    if slot <> 4465 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4466 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:410
//		BZF	+4
// slot 4466
                        if slot <> 4466 or instruction <> 6518 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6518, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:411
//		EXTEND
// slot 4467
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:412
//		READ	LOSCALAR
// slot 4468
                    if slot <> 4468 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:413
//		TS	L
// slot 4469
                    if slot <> 4469 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4470 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:414
//	+4	CS	POSMAX
// slot 4470
                    if slot <> 4470 or instruction <> 18943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:415
//		AD	L
// slot 4471
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:416
//		EXTEND
// slot 4472
                    if slot <> 4472 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:417
//		BZF	FINETIME +1
// slot 4473
                    if slot <> 4473 or instruction <> 6508 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6508, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4474 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:418
//		EXTEND
// slot 4474
                    if slot <> 4474 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4475 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:419
//		READ	HISCALAR
// slot 4475
                        if slot <> 4475 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 3, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:420
//		TC Q
// slot 4476
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

// bank 33, slots 29995-29995
function agcAotUnit1665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:421
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:422
//# Page 432
// IMU_CALIBRATION_AND_ALIGNMENT.agc:423
//# PROGRAM NAME-OPTIMUM PRELAUNCH ALIGNMENT CALIBRATION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:424
//# DATE- NOVEMBER 2 1966
// IMU_CALIBRATION_AND_ALIGNMENT.agc:425
//# BY- SCHMIDT KERMAN IL 7-146 EXT. 126
// IMU_CALIBRATION_AND_ALIGNMENT.agc:426
//# MOD NO 3
// IMU_CALIBRATION_AND_ALIGNMENT.agc:427
//# FUNCTIONAL DESCRIPTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:428
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:429
//# THIS	SECTION CONSISTS OF PRELAUNCH ALIGNMENT AND GYRO DRIFT TESTS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:430
//# INTEGRATED TOGETHER TO SAVE WORDS.  COMPASS IS COMPLETELY RESTART
// IMU_CALIBRATION_AND_ALIGNMENT.agc:431
//# PROOFED EXCEPT FOR THE FIRST 30 SECONDS OR SO.  PERFORMANCE TESTS OF
// IMU_CALIBRATION_AND_ALIGNMENT.agc:432
//# THE IRIGS IS RESTART PROOFED ENOUGH TO GIVE 75 PERCENT CONFIDENCE THAT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:433
//# IF A RESTART OCCURS THE DATA WILL STILL BE GOOD.  GOOD PRACTICE TO RECYCL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:434
//# WHEN A RESTART OCCURS UNLESS IT HAPPENS NEAR THE END OF A TEST-THEN WAIT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:435
//# FOR THE DATA TO FLASH.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:436
//# A RESTART IN GYROCOMPASS DURING GYRO TORQUING CAUSES PULSES TO BE LOST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:437
//# THE PRELAUNCH ALIGNMENT TECHNIQUE IS BASICALLY THE SAME AS IN BLOCK 1
// IMU_CALIBRATION_AND_ALIGNMENT.agc:438
//# EXCEPT THAT IT HAS BEEN SIMPLIFIED IN THE SENSE THAT SMALL ANGLE APPROX.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:439
//# HAVE BEEN USED.  THE DRIFT TESTS USE A UNIQUE IMPLEMENTATION OF THE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:440
//# OPTIMUM STATISTICAL FILTER.  FOR A DESCRIPTION SEE E-1973.BOTH OF THESE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:441
//# ROUTINES USE STANDARD SYSTEM TEST LEADIN PROCEDURES.  THE INITIALIZATION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:442
//# PROCEDURE THE DRIFT TESTS IS IN THE JDC S.  THE INITIALIZATION METHOD
// IMU_CALIBRATION_AND_ALIGNMENT.agc:443
//# FOR GYROCOMPASS IS AN ERAS LOAD THEN A MISSION PHASE CALL.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:444
//# THE COMPASS ALIGNS TO Z DOWN,X DOWNRANGE, HAS THE CAPABILITY
// IMU_CALIBRATION_AND_ALIGNMENT.agc:445
//# CHANGE AZIMUTH WHILE RUNNING , IS COMPENSATED FOR
// IMU_CALIBRATION_AND_ALIGNMENT.agc:446
//# COMPONENT ERRORS,IS CAPABLE OF OPTICAL VERIFICATION( CSM ONLY).
// IMU_CALIBRATION_AND_ALIGNMENT.agc:447
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:448
//# COMPASS ERASABLE LOAD REQUIRED
// IMU_CALIBRATION_AND_ALIGNMENT.agc:449
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:450
//#  1-LAUNCHAZ -DP AZIMUTH IN REV FROM NORTH OF XSM DESIRED	(NOM=.2)
// IMU_CALIBRATION_AND_ALIGNMENT.agc:451
//# 2- LATITUDE -DP-OF LAUNCH PAD
// IMU_CALIBRATION_AND_ALIGNMENT.agc:452
//# 3- AZIMUTH-DP-OF ZNB OF VEHICLE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:453
//# 4- IMU COMPENSATION PARAMETERS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:454
//# 5-AZ AND ELEVATION OF TARGETS 1,2		****OPTIONAL****
// IMU_CALIBRATION_AND_ALIGNMENT.agc:455
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:456
//# TO PERFORM AS PART OF COMPASS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:457
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:458
//# 1-OPTICAL VERIFICATION- V 65 E
// IMU_CALIBRATION_AND_ALIGNMENT.agc:459
//# 2-AZIMUTH CHANGE-V 78 E
// IMU_CALIBRATION_AND_ALIGNMENT.agc:460
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:461
//# SUBROUTINES CALLED
// IMU_CALIBRATION_AND_ALIGNMENT.agc:462
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:463
//# DURING OPTICAL VERIFICATION (CSM ONLY) ESSENTIALLY ALL OF INFLIGHT ALIGN
// IMU_CALIBRATION_AND_ALIGNMENT.agc:464
//# IS CALLED IN ONE WAY OR ANOTHER.  SEE THE LISTING.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:465
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:466
//# NORMAL EXIT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:467
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:468
//# DRIFT TESTS-  LENGTHOT GOES TO ZERO-RETURN TO IMU PERF TEST2 CONTROL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:469
//# GYROCOMPASS-MANY, SEE THE LISTING
// IMU_CALIBRATION_AND_ALIGNMENT.agc:470
//# ALARMS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:471
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:472
//# 1600	OVERFLOW IN DRIFT TEST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:473
//# Page 433
// IMU_CALIBRATION_AND_ALIGNMENT.agc:474
//# 1601	BAD IMU TORQUE ABORT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:475
//# 1602	BAD OPTICS DURING VERIFICATION-RETURN TO COMPASS	CSM ONLY
// IMU_CALIBRATION_AND_ALIGNMENT.agc:476
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:477
//# OUTPUT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:478
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:479
//# DRIFT TESTS- FLASHING DISPLAYS OF RESULTS-CONTROLLED IN IMU PERF TESTS 2
// IMU_CALIBRATION_AND_ALIGNMENT.agc:480
//# COMPASS-PROGRAM MODE LIGHTS TELL YOU WHAT PHAS OF PROGRAM YOU ARE IN
// IMU_CALIBRATION_AND_ALIGNMENT.agc:481
//#   01	INITIALIZING THE PLATFORM POSITION AND ERASABLE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:482
//#   02	GYROCOMPASSING
// IMU_CALIBRATION_AND_ALIGNMENT.agc:483
//#   03	DOING OPTICAL VERIFICATION (CSM)
// IMU_CALIBRATION_AND_ALIGNMENT.agc:484
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:485
//#
// IMU_CALIBRATION_AND_ALIGNMENT.agc:486
//# DEBRIS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:487
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:488
//# ALL CENTRALS,ALL OF EBANK XSM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:489
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:490
//# Page 434
// IMU_CALIBRATION_AND_ALIGNMENT.agc:491
//# MOST OF THE ROUTINES COMMON TO ALIGNMENT AND CALIBRATION APPEAR
// IMU_CALIBRATION_AND_ALIGNMENT.agc:492
//# ON THE NEXT FEW PAGES.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:493
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:494
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:495
//		COUNT	33/P02
// IMU_CALIBRATION_AND_ALIGNMENT.agc:496
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:497
//		EBANK=	XSM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:498
//		BANK	33
// IMU_CALIBRATION_AND_ALIGNMENT.agc:499
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:500
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:501
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:502
//ESTIMS		TC	2PHSCHNG	# COMES HERE FROM IMU2
// slot 29995
    if slot <> 29995 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1665] to agcAotUnit1665@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:503
//		OCT	00075
// slot 29996
    29996, 122,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:504
//		OCT	00004		# TURN OFF GROUP 4 IF ON
// slot 29997
    29997, 8
)).

// bank 33, slots 29998-30010
function agcAotUnit1666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30003 {
        if slot <= 30000 {
            if slot <= 29998 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:505
//RSTGTS1		INHINT			# COMES HERE PHASE1 RESTART
// slot 29998
                if slot <> 29998 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29999 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:506
//		CA	TIME1
// slot 29999
                    if slot <> 29999 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 21).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:507
//		TS	GTSWTLT1
// slot 30000
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:508
//		CAF	ZERO		# ZERO THE PIPAS
// slot 30001
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:509
//		TS	PIPAX
// slot 30002
                    if slot <> 30002 or instruction <> 22559 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22559, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:510
//		TS	PIPAY
// slot 30003
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:511
//		TS	PIPAZ
// slot 30004
                if slot <> 30004 or instruction <> 22561 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22561, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30005 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:512
//		RELINT
// slot 30005
                    if slot <> 30005 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:513
//		CA	77DECML		# ZERO ALL NECESSARY LOCATIONS
// slot 30006
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:514
//		TS	ZERONDX1
// slot 30007
                    if slot <> 30007 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:515
//		CA	ALXXXZ
// slot 30008
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:516
//		TC	ZEROING
// slot 30009
                    if slot <> 30009 or instruction <> 1262 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1262, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:517
//		TC	INTPRET
// slot 30010
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:518
//		SLOAD
// slot 30011
    30011, 65466,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:519
//			SCHZEROS
// slot 30012
    30012, 23698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:520
//		STOVL	GCOMPSW -1
// slot 30013
    30013, 22142,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:521
//			INTVAL +2	# LOAD SOME INITIAL DRIFT GAINS
// slot 30014
    30014, 23716,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:522
//		STOVL	ALX1S
// slot 30015
    30015, 23130,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:523
//			SCHZEROS
// slot 30016
    30016, 23698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:524
//		STORE	GCOMP
// slot 30017
    30017, 1652,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:525
//		STORE	DELVX		# GCOMPZER SUBROUTINE NO LONGER NEEDED
// slot 30018
    30018, 1254,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:526
//		EXIT
// slot 30019
    30019, 65532
)).

// bank 33, slots 30020-30023
function agcAotUnit1667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30021 {
        if slot <= 30020 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:527
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:528
//		CCS	GEOCOMP1	# NON ZERO IF COMPASS.
// slot 30020
            if slot <> 30020 or instruction <> 5027 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 931).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:529
//		TC	+2
// slot 30021
            if slot <> 30021 or instruction <> 1351 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1351, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30022 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:530
//		TC	SLEEPIE	+1
// slot 30022
            if slot <> 30022 or instruction <> 1363 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1363, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:531
//		TC	INTPRET
// slot 30023
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:532
//		CALL
// slot 30024
    30024, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:533
//			ERTHRVSE
// slot 30025
    30025, 53248,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:534
//		EXIT
// slot 30026
    30026, 65532
)).

// bank 33, slots 30027-30029
function agcAotUnit1668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30027 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:535
//		CA	LENGTHOT	# TIMES FIVE IS THE NUM OF SEC ERECTING
// slot 30027
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:536
//		TS	ERECTIME
// slot 30028
            if slot <> 30028 or instruction <> 23462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:537
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:538
//		TC	NEWMODEX
// slot 30029
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:539
//		MM	02
// slot 30030
    30030, 4
)).

// bank 33, slots 30031-30031
function agcAotUnit1669 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:540
//		TC	BANKCALL	# SET UP PIPA FAIL TO CAUSE ISS ALARM
// slot 30031
    if slot <> 30031 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1669] to agcAotUnit1669@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:541
//# Page 435
// IMU_CALIBRATION_AND_ALIGNMENT.agc:542
//		CADR	PIPUSE		# COMPASS NEVER TURNS THIS OFF
// slot 30032
    30032, 15580
)).

// bank 33, slots 30033-30035
function agcAotUnit1670 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30033 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:543
//		TC	ANNNNNN		# END OF FIRST TIME THROUGH
// slot 30033
        if slot <> 30033 or instruction <> 1795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30034 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:544
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:545
//# Page 436
// IMU_CALIBRATION_AND_ALIGNMENT.agc:546
//# COMES HERE AT THE END OF EVERY ITERATION THROUGH DRIFT TEST OR COMPASS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:547
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:548
//# SET UP WAITLIST SECTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:549
//SLEEPIE		TS	LENGTHOT	# TEST NOT OVER-DECREMENT LENGTHOT
// slot 30034
            if slot <> 30034 or instruction <> 23306 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23306, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:550
//		TC	PHASCHNG	# CHANGE PHASE
// slot 30035
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:551
//		OCT	00135
// slot 30036
    30036, 186
)).

// bank 33, slots 30037-30053
function agcAotUnit1671 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30044 {
        if slot <= 30040 {
            if slot <= 30038 {
                if slot <= 30037 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:552
//		CCS	TORQNDX		# ARE WE DOING VERTDRIFT
// slot 30037
                    if slot <> 30037 or instruction <> 4904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 808).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:553
//		TC	EARTHR*		# TRUE TORQUE SOUTH GYRO
// slot 30038
                    if slot <> 30038 or instruction <> 1295 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1295, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30039 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:554
//WTLISTNT	TC	CHKCOMED	# 	SEE IF COMPASS OVER
// slot 30039
                    if slot <> 30039 or instruction <> 1798 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1798, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:555
//		TC	SETGWLST
// slot 30040
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:556
//		TC	ENDOFJOB
// slot 30041
                    if slot <> 30041 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:557
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:558
//SETGWLST	EXTEND
// slot 30042
                    if slot <> 30042 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30043 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:559
//		QXCH	MPAC		# CALLED EVERY WAITLIST OR AZIMUTH CHANGE
// slot 30043
                    if slot <> 30043 or instruction <> 9324 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 108, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:560
//		INHINT
// slot 30044
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:561
//		CS	TIME1
// slot 30045
                    if slot <> 30045 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:562
//		AD	GTSWTLT1
// slot 30046
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:563
//		EXTEND
// slot 30047
                    if slot <> 30047 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:564
//		BZMF	+2
// slot 30048
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:565
//		AD	NEGMAX		# 10 MS ERROR OK
// slot 30049
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:566
//		AD	1SECXT1		# 1 SEC FOR CALIBRATION, .5 SEC IN COMPASS
// slot 30050
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:567
//		EXTEND
// slot 30051
                    if slot <> 30051 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30052 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:568
//		BZMF	RIGHTGTS
// slot 30052
                        if slot <> 30052 or instruction <> 25960 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25960, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:569
//WTGTSMPL	TC	TWIDDLE
// slot 30053
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:570
//		EBANK=	ALTIM
// IMU_CALIBRATION_AND_ALIGNMENT.agc:571
//		ADRES	ALLOOP
// slot 30054
    30054, 2808
)).

// bank 33, slots 30055-30060
function agcAotUnit1672 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30057 {
        if slot <= 30055 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:572
//		TC	MPAC
// slot 30055
            if slot <> 30055 or instruction <> 108 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 108, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30056 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:573
//RIGHTGTS	CAF	FOUR		# SET UP NEXT WAITLIST-ALLOW SOME TIME
// slot 30056
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:574
//		TC	WTGTSMPL	# END OF WAITLIST SECTION
// slot 30057
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:575
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:576
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:577
//# STORE AND LOAD DATA SECTIONS FOR RESTART PROOFING
// IMU_CALIBRATION_AND_ALIGNMENT.agc:578
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:579
//25DECML		EQUALS	OCT31
// IMU_CALIBRATION_AND_ALIGNMENT.agc:580
//STOREDTA	CAF	25DECML
// slot 30058
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:581
//		TS	MPAC
// slot 30059
                if slot <> 30059 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:582
//		INDEX	MPAC
// slot 30060
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:583
//		CAE	THETAX1
// slot 30061
    30061, 26208
)).

// bank 33, slots 30062-30062
function agcAotUnit1673 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:584
//		INDEX	MPAC
// slot 30062
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:585
//		TS	RESTARPT
// slot 30063
    30063, 46846
)).

// bank 33, slots 30064-30069
function agcAotUnit1674 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30066 {
        if slot <= 30064 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:586
//		CCS	MPAC
// slot 30064
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:587
//		TCF	STOREDTA +1
// slot 30065
                if slot <> 30065 or instruction <> 5483 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5483, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:588
//		TC	Q
// slot 30066
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:589
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:590
//LOADSTDT	CAF	25DECML
// slot 30067
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:591
//		TS	MPAC
// slot 30068
                if slot <> 30068 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:592
//		INDEX	MPAC
// slot 30069
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:593
//		CA	RESTARPT
// slot 30070
    30070, 26366
)).

// bank 33, slots 30071-30071
function agcAotUnit1675 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:594
//		INDEX	MPAC
// slot 30071
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:595
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:596
//# Page 437
// IMU_CALIBRATION_AND_ALIGNMENT.agc:597
//		TS	THETAX1
// slot 30072
    30072, 46688
)).

// bank 33, slots 30073-30080
function agcAotUnit1676 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30076 {
        if slot <= 30074 {
            if slot <= 30073 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:598
//		CCS	MPAC
// slot 30073
                if slot <> 30073 or instruction <> 4204 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:599
//		TCF	LOADSTDT +1
// slot 30074
                if slot <> 30074 or instruction <> 5492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30075 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:600
//		TC	Q
// slot 30075
                if slot <> 30075 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:601
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:602
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:603
//# COMES HERE EVERY ITERATION BY A WAITLIST CALL SET IN SLEEPIE
// IMU_CALIBRATION_AND_ALIGNMENT.agc:604
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:605
//ALLOOP		CA	TIME1
// slot 30076
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:606
//		TS	GTSWTLT1	# STORE TIME TO SET UP NEXT WAITLIST.
// slot 30077
                if slot <> 30077 or instruction <> 23461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:607
//ALLOOP3		CA	ALTIM
// slot 30078
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:608
//		TS	GEOSAVE1
// slot 30079
                if slot <> 30079 or instruction <> 23449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23449, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:609
//		TC	PHASCHNG
// slot 30080
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:610
//		OCT	00115
// slot 30081
    30081, 154
)).

// bank 33, slots 30082-30082
function agcAotUnit1677 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:611
//ALLOOP1		CAE	GEOSAVE1
// slot 30082
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

// bank 33, slots 30083-30099
function agcAotUnit1678 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30090 {
        if slot <= 30086 {
            if slot <= 30084 {
                if slot <= 30083 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:612
//		TS	ALTIM
// slot 30083
                    if slot <> 30083 or instruction <> 23392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23392, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:613
//		CCS	A
// slot 30084
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:614
//		CA	A		# SHOULD NEVER HIT THIS LOCATION
// slot 30085
                    if slot <> 30085 or instruction <> 12288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:615
//		TS	ALTIMS
// slot 30086
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:616
//		CS	A
// slot 30087
                    if slot <> 30087 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:617
//		TS	ALTIM
// slot 30088
                    if slot <> 30088 or instruction <> 23392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23392, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30089 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:618
//		CAF	ZERO
// slot 30089
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:619
//		XCH	PIPAX
// slot 30090
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:620
//		TS	DELVX
// slot 30091
                    if slot <> 30091 or instruction <> 23154 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23154, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:621
//		CAF	ZERO
// slot 30092
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:622
//		XCH	PIPAY
// slot 30093
                    if slot <> 30093 or instruction <> 23584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 32, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:623
//		TS	DELVY
// slot 30094
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:624
//		CAF	ZERO
// slot 30095
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:625
//		XCH	PIPAZ
// slot 30096
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:626
//		TS	DELVZ
// slot 30097
                    if slot <> 30097 or instruction <> 23158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23158, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30098 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:627
//		CAF	19DECML		# 23 OCT
// slot 30098
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:628
//		TC	NEWPHASE
// slot 30099
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:629
//		OCT	00005
// slot 30100
    30100, 10
)).

// bank 33, slots 30101-30102
function agcAotUnit1679 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30101 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:630
//SPECSTS		CAF	PRIO22
// slot 30101
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:631
//		TC	FINDVAC
// slot 30102
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:632
//		EBANK=	GEOSAVE1
// IMU_CALIBRATION_AND_ALIGNMENT.agc:633
//		2CADR	ALFLT		# START THE JOB
// slot 30103 30104
    30103, 2868, 30104, 55402
)).

// bank 33, slots 30105-30107
function agcAotUnit1680 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30105 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:634
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:635
//		TC	TASKOVER
// slot 30105
        if slot <> 30105 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30106 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:636
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:637
//# Page 438
// IMU_CALIBRATION_AND_ALIGNMENT.agc:638
//# THIS IS PART OF THE JOB DONE EVERY ITERATION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:639
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:640
//ALFLT		TC	STOREDTA	# STORE DATA IN CASE OF RESTART IN JOB
// slot 30106
            if slot <> 30106 or instruction <> 1386 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1386, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:641
//		TC	PHASCHNG	# THIS IS THE JOB DONE EVERY ITERATION
// slot 30107
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:642
//		OCT	00215
// slot 30108
    30108, 282
)).

// bank 33, slots 30109-30115
function agcAotUnit1681 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30111 {
        if slot <= 30109 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:643
//		TCF	+2
// slot 30109
            if slot <> 30109 or instruction <> 5535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30110 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:644
//ALFLT1		TC	LOADSTDT	# COMES HERE ON RESTART
// slot 30110
                if slot <> 30110 or instruction <> 1395 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1395, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:645
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:646
//		CCS	GEOCOMP1
// slot 30111
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:647
//		TC	+2
// slot 30112
                if slot <> 30112 or instruction <> 1442 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1442, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:648
//		TC	NORMLOP
// slot 30113
                if slot <> 30113 or instruction <> 1445 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1445, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30114 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:649
//		TC	CHKCOMED	# 	SEE IF PRELAUNCH OVER
// slot 30114
                if slot <> 30114 or instruction <> 1798 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:650
//		TC	BANKCALL	# COMPENSATION IF IN COMPASS
// slot 30115
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:651
//		CADR	1/PIPA
// slot 30116
    30116, 13668
)).

// bank 33, slots 30117-30117
function agcAotUnit1682 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:652
//NORMLOP		TC	INTPRET
// slot 30117
    if slot <> 30117 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1682] to agcAotUnit1682@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:653
//		DLOAD
// slot 30118
    30118, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:654
//			INTVAL
// slot 30119
    30119, 23712,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:655
//		STOVL	S1
// slot 30120
    30120, 20562,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:656
//			DELVX
// slot 30121
    30121, 1254,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:657
//		VXM	VSL1
// slot 30122
    30122, 64138,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:658
//			XSM
// slot 30123
    30123, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:659
//		DLOAD	DCOMP
// slot 30124
    30124, 48842,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:660
//			MPAC +3
// slot 30125
    30125, 224,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:661
//		STODL	DPIPAY
// slot 30126
    30126, 15030,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:662
//			MPAC +5
// slot 30127
    30127, 228,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:663
//		STORE	DPIPAZ
// slot 30128
    30128, 2750,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:664
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:665
//		SETPD	AXT,1
// slot 30129
    30129, 63490,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:666
//			0
// slot 30130
    30130, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:667
//			8D
// slot 30131
    30131, 16,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:668
//		SLOAD	DCOMP
// slot 30132
    30132, 48826,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:669
//			GEOCOMP1
// slot 30133
    30133, 2888,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:670
//		BMN
// slot 30134
    30134, 65344,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:671
//			ALWAYSG		# DO A QUICK COMPASS
// slot 30135
    30135, 56592,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:672
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:673
//# Page 439
// IMU_CALIBRATION_AND_ALIGNMENT.agc:674
//# NOW WE HAVE JUST THE CALIBRATION PARTS OF THE PROGRAM-NEXT PAGES
// IMU_CALIBRATION_AND_ALIGNMENT.agc:675
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:676
//		COUNT	33/COMST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:677
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:678
//ALCGKK		SLOAD	BMN
// slot 30136
    30136, 41146,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:679
//			ALTIMS
// slot 30137
    30137, 2756,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:680
//			ALFLT3		# NO NEW GAINS NEEDED
// slot 30138
    30138, 56202,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:681
//ALKCG		AXT,2	LXA,1		# LOADS SLOPES AND TIME CONSTANTS AT RQST
// slot 30139
    30139, 59640,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:682
//			12D
// slot 30140
    30140, 24,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:683
//			ALX1S
// slot 30141
    30141, 2648,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:684
//ALKCG2		DLOAD*	INCR,1
// slot 30142
    30142, 51398,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:685
//			ALFDK +144D,1
// slot 30143
    30143, 2374,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:686
//		DEC	-2
// slot 30144
    30144, 65530,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:687
//		STORE	ALDK +10D,2
// slot 30145
    30145, 10970,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:688
//		TIX,2	SXA,1
// slot 30146
    30146, 55432,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:689
//			ALKCG2
// slot 30147
    30147, 56188,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:690
//			ALX1S
// slot 30148
    30148, 2648,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:691
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:692
//ALFLT3		AXT,1			# MEASUREMENT INCORPORATION ROUTINES
// slot 30149
    30149, 65520,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:693
//			8D		# AND GAIN UPDATES
// slot 30150
    30150, 16,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:694
//DELMLP		DLOAD*	DMP
// slot 30151
    30151, 34246,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:695
//			DPIPAY +8D,1
// slot 30152
    30152, 2758,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:696
//			PIPASC
// slot 30153
    30153, 24458,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:697
//		SLR	BDSU*
// slot 30154
    30154, 36706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:698
//			9D
// slot 30155
    30155, 17684,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:699
//			INTY +8D,1
// slot 30156
    30156, 2706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:700
//		STORE	INTY +8D,1
// slot 30157
    30157, 6802,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:701
//		PDDL	DMP*
// slot 30158
    30158, 33706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:702
//			VELSC
// slot 30159
    30159, 24462,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:703
//			VLAUN +8D,1
// slot 30160
    30160, 2738,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:704
//		SL2R
// slot 30161
    30161, 65460,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:705
//		DSU	STADR
// slot 30162
    30162, 38442,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:706
//		STORE	DELM +8D,1
// slot 30163
    30163, 58636,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:707
//		STORE	DELM +10D,1
// slot 30164
    30164, 6902,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:708
//		TIX,1	AXT,2
// slot 30165
    30165, 64640,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:709
//			DELMLP
// slot 30166
    30166, 56206,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:710
//			4
// slot 30167
    30167, 8,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:711
//ALILP		DLOAD*	DMPR*
// slot 30168
    30168, 48070,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:712
//			ALK +4,2
// slot 30169
    30169, 62872,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:713
//			ALDK +4,2
// slot 30170
    30170, 62768,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:714
//		STORE	ALK +4,2
// slot 30171
    30171, 10854,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:715
//		TIX,2	AXT,2
// slot 30172
    30172, 64648,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:716
//			ALILP
// slot 30173
    30173, 56240,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:717
//			8D
// slot 30174
    30174, 16,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:718
//ALKLP		LXC,1	SXA,1
// slot 30175
    30175, 55488,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:719
//			CMPX1
// slot 30176
    30176, 2650,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:720
//			CMPX1
// slot 30177
    30177, 2650,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:721
//		DLOAD*	DMPR*
// slot 30178
    30178, 48070,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:722
//			ALK +1,1
// slot 30179
    30179, 2656,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:723
//			DELM +8D,2
// slot 30180
    30180, 62732,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:724
//# Page 440
// IMU_CALIBRATION_AND_ALIGNMENT.agc:725
//		DAD*
// slot 30181
    30181, 65302,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:726
//			INTY +8D,2
// slot 30182
    30182, 62828,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:727
//		STORE	INTY +8D,2
// slot 30183
    30183, 10898,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:728
//		DLOAD*	DAD*
// slot 30184
    30184, 35782,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:729
//			ALK +12D,2
// slot 30185
    30185, 62856,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:730
//			ALDK +12D,2
// slot 30186
    30186, 62752,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:731
//		STORE	ALK +12D,2
// slot 30187
    30187, 10870,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:732
//		DMPR*	DAD*
// slot 30188
    30188, 35702,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:733
//			DELM +8D,2
// slot 30189
    30189, 62732,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:734
//			INTY +16D,2
// slot 30190
    30190, 62812,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:735
//		STORE	INTY +16D,2
// slot 30191
    30191, 10914,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:736
//		DLOAD*	DMP*
// slot 30192
    30192, 33734,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:737
//			ALSK +1,1
// slot 30193
    30193, 24468,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:738
//			DELM +8D,2
// slot 30194
    30194, 62732,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:739
//		SL1R	DAD*
// slot 30195
    30195, 35828,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:740
//			VLAUN +8D,2
// slot 30196
    30196, 62796,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:741
//		STORE	VLAUN +8D,2
// slot 30197
    30197, 10930,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:742
//		TIX,2	AXT,1
// slot 30198
    30198, 63624,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:743
//			ALKLP
// slot 30199
    30199, 56254,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:744
//			8D
// slot 30200
    30200, 16,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:745
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:746
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:747
//LOOSE		DLOAD*	PDDL*		# EXTRAPOLATE SWAY VARIABLES
// slot 30201
    30201, 54214,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:748
//			ACCWD +8D,1
// slot 30202
    30202, 2742,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:749
//			VLAUN +8D,1
// slot 30203
    30203, 2738,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:750
//		PDDL*	VDEF
// slot 30204
    30204, 46758,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:751
//			POSNV +8D,1
// slot 30205
    30205, 2754,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:752
//		MXV	VSL1
// slot 30206
    30206, 64162,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:753
//			TRANSM1
// slot 30207
    30207, 2050,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:754
//		DLOAD
// slot 30208
    30208, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:755
//			MPAC
// slot 30209
    30209, 218,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:756
//		STORE	POSNV +8D,1
// slot 30210
    30210, 6850,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:757
//		DLOAD
// slot 30211
    30211, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:758
//			MPAC +3
// slot 30212
    30212, 224,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:759
//		STORE	VLAUN +8D,1
// slot 30213
    30213, 6834,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:760
//		DLOAD
// slot 30214
    30214, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:761
//			MPAC +5
// slot 30215
    30215, 228,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:762
//		STORE	ACCWD +8D,1
// slot 30216
    30216, 6838,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:763
//		TIX,1
// slot 30217
    30217, 65408,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:764
//			LOOSE
// slot 30218
    30218, 56306,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:765
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:766
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:767
//		AXT,2	AXT,1		# EVALUATE SINES AND COSINES
// slot 30219
    30219, 63736,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:768
//			6
// slot 30220
    30220, 12,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:769
//			2
// slot 30221
    30221, 4,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:770
//BOOP		DLOAD*	DMPR
// slot 30222
    30222, 48582,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:771
//			ANGX +2,1
// slot 30223
    30223, 2710,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:772
//			GEORGEJ
// slot 30224
    30224, 24474,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:773
//		SR2R
// slot 30225
    30225, 65444,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:774
//		PUSH	SIN
// slot 30226
    30226, 60940,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:775
//# Page 441
// IMU_CALIBRATION_AND_ALIGNMENT.agc:776
//		SL3R	XAD,1
// slot 30227
    30227, 47220,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:777
//			X1
// slot 30228
    30228, 76,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:778
//		STORE	16D,2
// slot 30229
    30229, 8226,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:779
//		DLOAD
// slot 30230
    30230, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:780
//		COS
// slot 30231
    30231, 65484
)).

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:781
//		STORE	22D,2		# COSINES
// slot 30232
    30232, 8238,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:782
//		TIX,2
// slot 30233
    30233, 65416,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:783
//			BOOP
// slot 30234
    30234, 56348,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:784
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:785
//PERFERAS	EXIT
// slot 30235
    30235, 65532
)).

// bank 33, slots 30236-30246
function agcAotUnit1683 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30240 {
        if slot <= 30237 {
            if slot <= 30236 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:786
//		CA	EBANK7
// slot 30236
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:787
//		EBANK=	LAT(SPL)
// IMU_CALIBRATION_AND_ALIGNMENT.agc:788
//		TS	EBANK
// slot 30237
                if slot <> 30237 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30238 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:789
//		TC	LAT(SPL)	# GO TO ERASABLE ONLY TO RETURN
// slot 30238
                if slot <> 30238 or instruction <> 768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30239 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:790
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:791
//# CAUTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:792
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:793
//# THE ERASABLE PROGRAM THAT DOES THE CALCULATIONS MUST BE LOADED
// IMU_CALIBRATION_AND_ALIGNMENT.agc:794
//# BEFORE ANY ATTEMPT IS MADE TO RUN THE IMU PERFORMANCE TEST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:795
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:796
//		EBANK=	LENGTHOT
// IMU_CALIBRATION_AND_ALIGNMENT.agc:797
//ONCEMORE	CCS	LENGTHOT
// slot 30239
                    if slot <> 30239 or instruction <> 4874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:798
//		TC	SLEEPIE		# TEST NOT OVER SET UP NEXT WAITLIST
// slot 30240
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:799
//		CCS	TORQNDX
// slot 30241
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:800
//		TCF	+2
// slot 30242
                    if slot <> 30242 or instruction <> 5668 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5668, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:801
//		TC	SETUPER1
// slot 30243
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:802
//		CA	CDUX
// slot 30244
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:803
//		TS	LOSVEC +1	# FOR TROUBLESHOOTING POSNS 2$4 VD
// slot 30245
                    if slot <> 30245 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:804
//SETUPER1	TC	INTPRET		# DRIFT TEST OVER
// slot 30246
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:805
//		DLOAD	PDDL		# ANGLES FROM DRIFT TEST ONLY
// slot 30247
    30247, 54730,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:806
//			ANGZ
// slot 30248
    30248, 2694,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:807
//			ANGY
// slot 30249
    30249, 2702,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:808
//		PDDL	VDEF
// slot 30250
    30250, 46762,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:809
//			ANGX
// slot 30251
    30251, 2706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:810
//		VCOMP	VXSC
// slot 30252
    30252, 61820,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:811
//			GEORGEJ
// slot 30253
    30253, 24474,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:812
//		MXV	VSR1
// slot 30254
    30254, 62114,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:813
//			XSM
// slot 30255
    30255, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:814
//		STORE	OGC
// slot 30256
    30256, 3040,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:815
//		EXIT
// slot 30257
    30257, 65532
)).

// bank 33, slots 30258-30258
function agcAotUnit1684 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:816
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:817
//TORQINCH	TC	PHASCHNG
// slot 30258
    if slot <> 30258 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1684] to agcAotUnit1684@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:818
//		OCT	00005
// slot 30259
    30259, 10
)).

// bank 33, slots 30260-30261
function agcAotUnit1685 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30260 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:819
//		CA	OGCPL
// slot 30260
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:820
//		TC	BANKCALL
// slot 30261
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:821
//		CADR	IMUPULSE
// slot 30262
    30262, 15628
)).

// bank 33, slots 30263-30266
function agcAotUnit1686 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30264 {
        if slot <= 30263 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:822
//		TC	IMUSTLLG
// slot 30263
            if slot <> 30263 or instruction <> 1230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:823
//		CCS	TORQNDX		# + IF IN VERTICAL DRIFT TEST
// slot 30264
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:824
//		TC	VALMIS		# VERT DRIFT TEST OVER
// slot 30265
            if slot <> 30265 or instruction <> 1202 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1202, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:825
//		TC	INTPRET
// slot 30266
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:826
//# Page 442
// IMU_CALIBRATION_AND_ALIGNMENT.agc:827
//		CALL			# SET UP ERATE FOR PIP TEST OR COMPASS
// slot 30267
    30267, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:828
//			ERTHRVSE
// slot 30268
    30268, 53248,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:829
//		EXIT
// slot 30269
    30269, 65532
)).

// bank 33, slots 30270-30271
function agcAotUnit1687 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30270 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:830
//		TC	TORQUE		# GO TO IMU2 FOR A PIPA TEST AND DISPLAY
// slot 30270
        if slot <> 30270 or instruction <> 1106 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1106, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:831
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:832
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:833
//SOMEERRR	TC	ALARM
// slot 30271
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:834
//		OCT	1600
// slot 30272
    30272, 1792
)).

// bank 33, slots 30273-30274
function agcAotUnit1688 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30273 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:835
//		TC	+3
// slot 30273
        if slot <> 30273 or instruction <> 1604 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1604, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:836
//SOMERR2		TC	ALARM
// slot 30274
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:837
//		OCT	1601
// slot 30275
    30275, 1794
)).

// bank 33, slots 30276-30276
function agcAotUnit1689 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:838
//		TC	PHASCHNG
// slot 30276
    if slot <> 30276 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1689] to agcAotUnit1689@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:839
//		OCT	00005
// slot 30277
    30277, 10
)).

// bank 33, slots 30278-30278
function agcAotUnit1690 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:840
//		TC	ENDTEST1
// slot 30278
    if slot <> 30278 or instruction <> 1207 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1207, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1690] to agcAotUnit1690@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:841
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:842
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:843
//# THE FAMOUS MAGIC NUMBERS OF SCHMIDT KERMAN ARE NOW PART OF AN ERASABLE LOAD.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:844
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:845
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:846
//DEC585		OCT	02222		# 1170 B+14 ORDER IS NOW IMPORTANT
// slot 30279
    30279, 2340,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:847
//SCHZEROS	2DEC	.00000000
// slot 30280 30281
    30280, 0, 30281, 0,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:848
//		2DEC	.00000000
// slot 30282 30283
    30282, 0, 30283, 0,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:849
//		OCT	00000
// slot 30284
    30284, 0,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:850
//ONEDPP		OCT	00000
// slot 30285
    30285, 0,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:851
//		OCT	00001		# 	ABOVE ORDER IS IMPORTANT
// slot 30286
    30286, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:852
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:853
//INTVAL		OCT	4
// slot 30287
    30287, 8,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:854
//		OCT	2
// slot 30288
    30288, 4,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:855
//		DEC	144
// slot 30289
    30289, 288,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:856
//		DEC	-1
// slot 30290
    30290, 65532,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:857
//SOUPLY		2DEC	.93505870	# INITIAL GAINS FOR PIP OUTPUTS
// slot 30291 30292
    30291, 30640, 30292, 58,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:858
//		2DEC	.26266423	# INITIAL GAINS/4 FOR ERECTION ANGLES
// slot 30293 30294
    30293, 8606, 30294, 16080,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:859
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:860
//77DECML		DEC	77
// slot 30295
    30295, 154,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:861
//ALXXXZ		GENADR	ALX1S -1
// slot 30296
    30296, 1622
)).

// bank 33, slots 30297-30301
function agcAotUnit1691 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30298 {
        if slot <= 30297 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:862
//# GYROCOMPASS PORTIONS FINISH THIS LOG SECTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:863
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:864
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:865
//		COUNT	33/P01
// IMU_CALIBRATION_AND_ALIGNMENT.agc:866
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:867
//# INITIALIZATION SECTION
// IMU_CALIBRATION_AND_ALIGNMENT.agc:868
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:869
//GTSCPSS		CA	FLAGWRD1	# CALLED BY V37
// slot 30297
            if slot <> 30297 or instruction <> 12349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:870
//		MASK	NOP01BIT
// slot 30298
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:871
//# Page 443
// IMU_CALIBRATION_AND_ALIGNMENT.agc:872
//		EXTEND
// slot 30299
            if slot <> 30299 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30300 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:873
//		BZF	GTSCPSSA
// slot 30300
                if slot <> 30300 or instruction <> 5727 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5727, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:874
//		TC	POODOO
// slot 30301
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:875
//		OCT	1521		# NODO ALARM FOR P01 - P11 ALREADY DONE
// slot 30302
    30302, 1698
)).

// bank 33, slots 30303-30332
function agcAotUnit1692 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30317 {
        if slot <= 30309 {
            if slot <= 30305 {
                if slot <= 30303 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:876
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:877
//GTSCPSSA	CAF	ONE
// slot 30303
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:878
//		TS	GEOCOMP1	# THIS IS THE LEAD IN FOR COMPASS.
// slot 30304
                        if slot <> 30304 or instruction <> 23459 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23459, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:879
//		CA	1/PIPAGT
// slot 30305
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:880
//		TS	1/PIPADT
// slot 30306
                        if slot <> 30306 or instruction <> 23100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23100, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:881
//NXXTENN		CA	BIT8
// slot 30307
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:882
//		TS	LENGTHOT
// slot 30308
                        if slot <> 30308 or instruction <> 23306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23306, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:883
//		CAF	1/2SECX		# COMPASS IS A .5 SEC LOOP
// slot 30309
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:884
//		TS	1SECXT1
// slot 30310
                        if slot <> 30310 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:885
//		CAF	ONE
// slot 30311
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:886
//		TS	PREMTRX1
// slot 30312
                        if slot <> 30312 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:887
//		TS	PERFDLAY +1
// slot 30313
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:888
//		CAF	ZERO
// slot 30314
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:889
//		TS	PERFDLAY
// slot 30315
                        if slot <> 30315 or instruction <> 23470 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23470, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30316 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:890
//		EXTEND
// slot 30316
                        if slot <> 30316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:891
//		DCA	LUNCHAZ1
// slot 30317
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:892
//		DXCH	NEWAZ1
// slot 30318
                    if slot <> 30318 or instruction <> 22430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 926, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30319 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:893
//		EXTEND
// slot 30319
                        if slot <> 30319 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:894
//		DCA	LUNCHAZ1
// slot 30320
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:895
//		DXCH	OLDAZMTH
// slot 30321
                        if slot <> 30321 or instruction <> 22432 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 928, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:896
//SETUPGC		CA	DEC17
// slot 30322
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:897
//		TS	ZERONDX1
// slot 30323
                        if slot <> 30323 or instruction <> 23469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23469, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:898
//		CA	XSMADR
// slot 30324
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:899
//		TC	ZEROING
// slot 30325
                        if slot <> 30325 or instruction <> 1262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1262, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:900
//		TC	POSN17C
// slot 30326
                        if slot <> 30326 or instruction <> 1656 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1656, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30327 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:901
//		TC	GEOIMUTT	# GO TO IMU2 FOR FURTHER INITIALIZATION
// slot 30327
                        if slot <> 30327 or instruction <> 1048 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1048, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:902
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:903
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:904
//POSN17C		EXTEND			# COMPASS POSITION Z DOWN,X DOWNRANGE
// slot 30328
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:905
//		QXCH	QPLACE		# FROM NORTH IN REVOLUTIONS + CLOCKWISE
// slot 30329
                        if slot <> 30329 or instruction <> 10005 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 789, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:906
//		CS	HALF		# ALL THIS TO INITIALIZE MATRIX
// slot 30330
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:907
//		TS	ZSM
// slot 30331
                        if slot <> 30331 or instruction <> 23493 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23493, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:908
//		TC	INTPRET
// slot 30332
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:909
//		DLOAD	PUSH
// slot 30333
    30333, 34506,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:910
//			NEWAZ1
// slot 30334
    30334, 2876,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:911
//		SIN
// slot 30335
    30335, 65500,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:912
//		STORE	XSM	+4
// slot 30336
    30336, 2940,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:913
//		STODL	YSM	+2
// slot 30337
    30337, 15236,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:914
//		COS
// slot 30338
    30338, 65484,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:915
//		STORE	YSM	+4
// slot 30339
    30339, 2952,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:916
//		DCOMP
// slot 30340
    30340, 65404,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:917
//		STORE	XSM	+2
// slot 30341
    30341, 2936,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:918
//		EXIT
// slot 30342
    30342, 65532
)).

// bank 33, slots 30343-30343
function agcAotUnit1693 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:919
//		TC	QPLACE
// slot 30343
    if slot <> 30343 or instruction <> 789 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 789, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1693] to agcAotUnit1693@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:920
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:921
//# Page 444
// IMU_CALIBRATION_AND_ALIGNMENT.agc:922
//# JOB DONE EVERY ITERATION THROUGH COMPASS PROGRAM.SET BY TASK ALLOOP
// IMU_CALIBRATION_AND_ALIGNMENT.agc:923
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:924
//		COUNT	33/P02
// IMU_CALIBRATION_AND_ALIGNMENT.agc:925
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:926
//ALWAYSG		DLOAD*	DSU*		# COMPASS AND ERECT
// slot 30344
    30344, 37830,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:927
//			DPIPAY +8D,1
// slot 30345
    30345, 2758,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:928
//			FILDELV1 +8D,1
// slot 30346
    30346, 2698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:929
//		DMPR	DAD*
// slot 30347
    30347, 35706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:930
//			GEOCONS1
// slot 30348
    30348, 24478,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:931
//			FILDELV1 +8D,1
// slot 30349
    30349, 2698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:932
//		STORE	FILDELV1 +8D,1
// slot 30350
    30350, 6794,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:933
//		DAD*
// slot 30351
    30351, 65302,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:934
//			INTVEC1 +8D,1
// slot 30352
    30352, 2702,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:935
//		STORE	INTVEC1 +8D,1
// slot 30353
    30353, 6798,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:936
//		DMPR	DAD*
// slot 30354
    30354, 35706,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:937
//			GEOCONS2
// slot 30355
    30355, 24482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:938
//			FILDELV1 +8D,1
// slot 30356
    30356, 2698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:939
//		DMPR	PUSH
// slot 30357
    30357, 34426,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:940
//			GEOCONS5
// slot 30358
    30358, 13750,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:941
//		TIX,1	SLOAD
// slot 30359
    30359, 56704,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:942
//			ALWAYSG
// slot 30360
    30360, 56592,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:943
//			ERECTIM1
// slot 30361
    30361, 2894,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:944
//		BZE	DLOAD
// slot 30362
    30362, 58712,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:945
//			COMPGS
// slot 30363
    30363, 56648,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:946
//			THETAN1 +2
// slot 30364
    30364, 2674,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:947
//		DSU	STADR
// slot 30365
    30365, 38442,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:948
//		STODL	THETAN1 +2	# ERECTION ONLY.
// slot 30366
    30366, 50572,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:949
//		BDSU
// slot 30367
    30367, 65314,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:950
//			THETAN1 +4
// slot 30368
    30368, 2678,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:951
//		STORE	THETAN1 +4
// slot 30369
    30369, 2678,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:952
//		GOTO
// slot 30370
    30370, 65360,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:953
//			ADDINDRF
// slot 30371
    30371, 56684,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:954
//COMPGS		DLOAD	DAD		# COMPASS
// slot 30372
    30372, 36298,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:955
//			THETAN1
// slot 30373
    30373, 2670,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:956
//			FILDELV1
// slot 30374
    30374, 2682,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:957
//		STODL	THETAN1
// slot 30375
    30375, 14958,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:958
//			FILDELV1
// slot 30376
    30376, 2682,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:959
//		DMPR	BDSU
// slot 30377
    30377, 37242,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:960
//			GEOCONS3
// slot 30378
    30378, 24486,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:961
//			THETAN1 +4
// slot 30379
    30379, 2678,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:962
//		STODL	THETAN1 +4
// slot 30380
    30380, 14966,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:963
//			FILDELV1 +4
// slot 30381
    30381, 2690,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:964
//		DMPR	BDSU
// slot 30382
    30382, 37242,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:965
//			GEOCONS3
// slot 30383
    30383, 24486,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:966
//			THETAN1 +2
// slot 30384
    30384, 2674,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:967
//		PDDL	DMPR
// slot 30385
    30385, 48554,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:968
//			INTVEC1 +4
// slot 30386
    30386, 2694,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:969
//			GEOCONS4
// slot 30387
    30387, 24490,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:970
//		BDSU	STADR
// slot 30388
    30388, 38434,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:971
//		STORE	THETAN1 +2
// slot 30389
    30389, 62860,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:972
//# Page 445
// IMU_CALIBRATION_AND_ALIGNMENT.agc:973
//ADDINDRF	EXIT
// slot 30390
    30390, 65532
)).

// bank 33, slots 30391-30396
function agcAotUnit1694 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30393 {
        if slot <= 30391 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:974
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:975
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:976
//ENDGTSAL	CCS	LENGTHOT	# IS 5 SEC OVER-THE TIME TO TORQ PLATFORM
// slot 30391
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:977
//		TC	SLEEPIE		# NO-SET UP NEXT WAITLIST CALL FOR .5 SEC
// slot 30392
                if slot <> 30392 or instruction <> 1362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:978
//		TC	CHKCOMED
// slot 30393
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:979
//		CCS	LGYRO		# YES BUT ARE GYROS BUSY
// slot 30394
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:980
//		TCF	SLEEPIE +1	# BUSY-GET THEM .5 SECONDS FROM NOW
// slot 30395
                if slot <> 30395 or instruction <> 5459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:981
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:982
//LASTGTS		TC	INTPRET
// slot 30396
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:983
//		VLOAD
// slot 30397
    30397, 65530,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:984
//			ERCOMP1
// slot 30398
    30398, 2896,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:985
//		STODL	THETAX1
// slot 30399
    30399, 14946,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:986
//			TMARK
// slot 30400
    30400, 2630,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:987
//		STORE	ALK
// slot 30401
    30401, 2654,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:988
//		EXIT			# PREVIOUS SECTION WAS FOR RESTARTS
// slot 30402
    30402, 65532
)).

// bank 33, slots 30403-30403
function agcAotUnit1695 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:989
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:990
//RESTAIER	TC	PHASCHNG
// slot 30403
    if slot <> 30403 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1695] to agcAotUnit1695@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:991
//		OCT	00275
// slot 30404
    30404, 378
)).

// bank 33, slots 30405-30405
function agcAotUnit1696 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:992
//		TC	INTPRET		# ADD COMPASS COMMANDS INTO ERATE
// slot 30405
    if slot <> 30405 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1696] to agcAotUnit1696@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:993
//		VLOAD	MXV
// slot 30406
    30406, 53754,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:994
//			THETAN1
// slot 30407
    30407, 2670,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:995
//			XSM
// slot 30408
    30408, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:996
//		VSL1	VAD
// slot 30409
    30409, 44532,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:997
//			THETAX1
// slot 30410
    30410, 2658,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:998
//		STODL	ERCOMP1
// slot 30411
    30411, 15184,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:999
//			ALK
// slot 30412
    30412, 2654,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1000
//		STORE	TMARK
// slot 30413
    30413, 2630,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1001
//		EXIT
// slot 30414
    30414, 65532
)).

// bank 33, slots 30415-30418
function agcAotUnit1697 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30416 {
        if slot <= 30415 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1002
//		TC	EARTHR*		# TORQUE IT ALL IN
// slot 30415
            if slot <> 30415 or instruction <> 1295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1295, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1003
//		CAE	ERECTIM1
// slot 30416
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1004
//		TS	GEOSAVE1
// slot 30417
            if slot <> 30417 or instruction <> 23449 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23449, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1005
//		TC	PHASCHNG
// slot 30418
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1006
//		OCT	00155
// slot 30419
    30419, 218
)).

// bank 33, slots 30420-30420
function agcAotUnit1698 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1007
//RESTEST1	TC	INTPRET
// slot 30420
    if slot <> 30420 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1698] to agcAotUnit1698@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1008
//		VLOAD
// slot 30421
    30421, 65530,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1009
//			SCHZEROS
// slot 30422
    30422, 23698,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1010
//		STORE	THETAN1
// slot 30423
    30423, 2670,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1011
//		EXIT
// slot 30424
    30424, 65532
)).

// bank 33, slots 30425-30427
function agcAotUnit1699 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30425 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1012
//		CCS	PREMTRXC
// slot 30425
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1013
//		TC	NOCHORLD
// slot 30426
            if slot <> 30426 or instruction <> 1793 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1793, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1014
//		TC	PHASCHNG
// slot 30427
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1015
//		OCT	00255
// slot 30428
    30428, 346
)).

// bank 33, slots 30429-30429
function agcAotUnit1700 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1016
//RESTEST3	TC	INTPRET
// slot 30429
    if slot <> 30429 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1700] to agcAotUnit1700@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1017
//		DLOAD
// slot 30430
    30430, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1018
//			LAUNCHAZ
// slot 30431
    30431, 2872,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1019
//		DSU	BZE
// slot 30432
    30432, 44074,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1020
//			OLDAZMTH
// slot 30433
    30433, 2880,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1021
//			NOAZCHGE
// slot 30434
    30434, 56828,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1022
//		STORE	0D
// slot 30435
    30435, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1023
//# Page 446
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1024
//		SLOAD	DAD
// slot 30436
    30436, 36282,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1025
//			ONEDPP +1
// slot 30437
    30437, 23710,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1026
//			PREMTRXC	# DOES NOT CHANGE LAUNCHAZ
// slot 30438
    30438, 2870,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1027
//		STODL	PREMTRXC
// slot 30439
    30439, 15158,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1028
//			LAUNCHAZ
// slot 30440
    30440, 2872,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1029
//		STODL	NEWAZMTH
// slot 30441
    30441, 15164,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1030
//			0D
// slot 30442
    30442, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1031
//ADERCOMP	STORE	ERCOMP +4
// slot 30443
    30443, 2904,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1032
//		EXIT
// slot 30444
    30444, 65532
)).

// bank 33, slots 30445-30446
function agcAotUnit1701 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30445 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1033
//		TC	POSN17C
// slot 30445
        if slot <> 30445 or instruction <> 1656 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1656, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1034
//		TC	PHASCHNG
// slot 30446
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1035
//		OCT	00335
// slot 30447
    30447, 442
)).

// bank 33, slots 30448-30453
function agcAotUnit1702 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30450 {
        if slot <= 30448 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1036
//RESCHNG		EXTEND
// slot 30448
            if slot <> 30448 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30449 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1037
//		DCA	NEWAZMTH
// slot 30449
                if slot <> 30449 or instruction <> 13214 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 926, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1038
//		DXCH	OLDAZMTH
// slot 30450
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1039
//		CA	BIT7		# SPEND 320 SEC ERECTING
// slot 30451
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1040
//		TS	LENGTHOT
// slot 30452
                if slot <> 30452 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1041
//		TC	PHASCHNG
// slot 30453
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1042
//		OCT	00075
// slot 30454
    30454, 122
)).

// bank 33, slots 30455-30456
function agcAotUnit1703 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30455 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1043
//SPITGYRO	CA	ERCOMPPL
// slot 30455
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1044
//		TC	BANKCALL
// slot 30456
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1045
//		CADR	IMUPULSE
// slot 30457
    30457, 15628
)).

// bank 33, slots 30458-30458
function agcAotUnit1704 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1046
//		TC	BANKCALL
// slot 30458
    if slot <> 30458 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1704] to agcAotUnit1704@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1047
//		CADR	IMUSTALL
// slot 30459
    30459, 16126
)).

// bank 33, slots 30460-30461
function agcAotUnit1705 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30460 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1048
//		TC	SOMERR2
// slot 30460
        if slot <> 30460 or instruction <> 1602 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1602, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1049
//		TC	ESTIMS		# RE-INITIALIZE
// slot 30461
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1050
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1051
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1052
//NOAZCHGE	EXIT
// slot 30462
    30462, 65532
)).

// bank 33, slots 30463-30470
function agcAotUnit1706 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30466 {
        if slot <= 30464 {
            if slot <= 30463 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1053
//		CA	ONE
// slot 30463
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1054
//		TS	PREMTRXC
// slot 30464
                if slot <> 30464 or instruction <> 23450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23450, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30465 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1055
//NOCHORLD	CCS	GEOSAVE1
// slot 30465
                if slot <> 30465 or instruction <> 5017 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 921).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1056
//		TS	ERECTIM1	# COUNTS DOWN FOR ERECTION.
// slot 30466
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1057
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1058
//ANNNNNN		CAF	NINE
// slot 30467
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1059
//		TS	LENGTHOT
// slot 30468
                if slot <> 30468 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30469 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1060
//		TC	SLEEPIE +1
// slot 30469
                if slot <> 30469 or instruction <> 1363 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1363, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1061
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1062
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1063
//CHKCOMED	INHINT
// slot 30470
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

// bank 33, slots 30471-30490
function agcAotUnit1707 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30480 {
        if slot <= 30475 {
            if slot <= 30472 {
                if slot <= 30471 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1064
//		CS 	MODREG		# CHECK FOR MM 07 FIRST
// slot 30471
                    if slot <> 30471 or instruction <> 16905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 521).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1065
//		AD 	SEVEN
// slot 30472
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1066
//		EXTEND
// slot 30473
                    if slot <> 30473 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30474 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1067
//		BZF 	GOBKCALB	# IF MM 07 RETURN TO PERF TEST
// slot 30474
                        if slot <> 30474 or instruction <> 5910 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5910, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1068
//		CS	ZERO
// slot 30475
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1069
//		EXTEND
// slot 30476
                    if slot <> 30476 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1070
//		RXOR	CHAN30		# READ AND INVERT BITS IN CHANNEL 30
// slot 30477
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1071
//		MASK	BIT5		# LIFTOFF BIT
// slot 30478
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1072
//		CCS	A
// slot 30479
                        if slot <> 30479 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1073
//		TCF	PRELTERM	# LIFTOFF HAS OCCURRED
// slot 30480
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1074
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1075
//# Page 447
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1076
//		CA	GRRBKBIT	# CHECK FOR BACKUP LIFTOFF
// slot 30481
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1077
//		MASK	FLAGWRD5	# BIT5 FLAGWRD5
// slot 30482
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1078
//		CCS	A
// slot 30483
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1079
//		TCF	PRELTERM	# BACKUP RECEIVED
// slot 30484
                        if slot <> 30484 or instruction <> 5911 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5911, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1080
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1081
//		RELINT
// slot 30485
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1082
//GOBKCALB	TC	Q
// slot 30486
                    if slot <> 30486 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1083
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1084
//PRELTERM	CA	PRIO22		# PRELAUNCH DONE - SET UP P11
// slot 30487
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1085
//		TC	PRIOCHNG	# INCREASE PRIORITY HIGHER THAN SERVICER
// slot 30488
                    if slot <> 30488 or instruction <> 2696 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2696, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30489 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1086
//		INHINT
// slot 30489
                        if slot <> 30489 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1087
//		TC	POSTJUMP
// slot 30490
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1088
//		CADR	P11
// slot 30491
    30491, 57348,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1089
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1090
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1091
//ERCOMPPL	ECADR	ERCOMP
// slot 30492
    30492, 2894,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1092
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1093
//GEOCONS5	EQUALS	HIDPHALF
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1094
//1/PIPAGT	OCT	06200
// slot 30493
    30493, 6400
)).

// bank 33, slots 30494-30494
function agcAotUnit1708 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1095
//17DECML		=	ND1		# OCT 21
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1096
//19DECML		=	VD1		# OCT 23
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1097
//1/2SECX		=	.5SEC
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1098
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1099
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1100
//# Page 448
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1101
//GEOSTRT4	EQUALS	ENDOFJOB
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1102
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1103
//# Page 449
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1104
//# OPTICAL VERIFICATION ROUTINES FOR GYROCOMPASS
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1105
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1106
//		COUNT	33/P03
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1107
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1108
//GCOMPVER	TC	PHASCHNG	# OPTICAL VERIFICATION ROUTINE
// slot 30494
    if slot <> 30494 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1708] to agcAotUnit1708@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1109
//		OCT	00154
// slot 30495
    30495, 216
)).

// bank 33, slots 30496-30496
function agcAotUnit1709 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1110
//		TC	NEWMODEX	# ENTERED BY VERB 65 ENTER
// slot 30496
    if slot <> 30496 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1709] to agcAotUnit1709@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1111
//		MM	03
// slot 30497
    30497, 6
)).

// bank 33, slots 30498-30499
function agcAotUnit1710 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30498 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1112
//SETNBPOS	TC	NBPOSPL
// slot 30498
        if slot <> 30498 or instruction <> 1055 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1055, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1113
//		TC	BANKCALL
// slot 30499
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1114
//		CADR	MKRELEAS
// slot 30500
    30500, 14438
)).

// bank 33, slots 30501-30506
function agcAotUnit1711 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30503 {
        if slot <= 30501 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1115
//OPTDATA		CAF	BIT1		# CALLS FOR AZIMUTH AND ELEVATION OF TARGE
// slot 30501
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1116
//		ZL			# T 1,THEN TARGET 2
// slot 30502
                if slot <> 30502 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1117
//		LXCH	RUN		# AZIMUTH CLOCKWSE FROM NORTH TO TARGET
// slot 30503
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1118
//		TS	DSPTEM1 +2	# ELEVATION MEASURED FROM HORIZONTAL
// slot 30504
            if slot <> 30504 or instruction <> 23079 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23079, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30505 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1119
//		EXTEND
// slot 30505
                if slot <> 30505 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1120
//		INDEX	RUN
// slot 30506
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1121
//		DCA	TAZEL1
// slot 30507
    30507, 26166
)).

// bank 33, slots 30508-30510
function agcAotUnit1712 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30508 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1122
//		DXCH	DSPTEM1
// slot 30508
        if slot <> 30508 or instruction <> 22054 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30509 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1123
//		CAF	V05N30E
// slot 30509
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1124
//		TC	BANKCALL
// slot 30510
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1125
//		CADR	GODSPRET
// slot 30511
    30511, 17270
)).

// bank 33, slots 30512-30513
function agcAotUnit1713 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30512 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1126
//		CAF	VN0641
// slot 30512
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1127
//		TC	BANKCALL
// slot 30513
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1128
//		CADR	GOFLASH
// slot 30514
    30514, 17312
)).

// bank 33, slots 30515-30517
function agcAotUnit1714 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30515 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1129
//		TC	GCOMP5
// slot 30515
        if slot <> 30515 or instruction <> 1936 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1936, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30516 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1130
//		TC	+3
// slot 30516
            if slot <> 30516 or instruction <> 1847 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1847, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1131
//		TC	-8D
// slot 30517
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1132
//VN0641		VN	0641
// slot 30518
    30518, 1618
)).

// bank 33, slots 30519-30520
function agcAotUnit1715 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30519 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1133
//		DXCH	DSPTEM1		# TAZEL1 TARGET 1 AZIMUTH
// slot 30519
        if slot <> 30519 or instruction <> 22054 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1134
//		INDEX	RUN
// slot 30520
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1135
//		DXCH	TAZEL1		# TAZEL1 +2 TARGET 2 AZIMUTH
// slot 30521
    30521, 44598
)).

// bank 33, slots 30522-30527
function agcAotUnit1716 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30524 {
        if slot <= 30522 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1136
//		CCS	RUN
// slot 30522
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1137
//		TCF	+4
// slot 30523
                if slot <> 30523 or instruction <> 5951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1138
//		CAF	TWO
// slot 30524
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1139
//		TS	L
// slot 30525
            if slot <> 30525 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30526 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1140
//		TCF	OPTDATA +2	# MPAC	1ST PASS=0 2ND PASS=2
// slot 30526
                if slot <> 30526 or instruction <> 5927 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5927, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1141
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1142
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1143
//		TC	CONTIN33
// slot 30527
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1144
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1145
//V05N30E		VN	0530
// slot 30528
    30528, 1340
)).

// bank 33, slots 30529-30529
function agcAotUnit1717 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1146
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1147
//		TC	INTPRET		# UNDYNAMIC ASSEMBLER
// slot 30529
    if slot <> 30529 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1717] to agcAotUnit1717@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1148
//TAR/EREF	AXT,1	AXT,2		# TARGET VECTOR
// slot 30530
    30530, 64752,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1149
//			2		# SIN(EL)   -COS(AZ)COS(EL)   SIN(AZ)COS(EL
// slot 30531
    30531, 4,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1150
//			12D
// slot 30532
    30532, 24,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1151
//		SSP	SETPD
// slot 30533
    30533, 33202,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1152
//			S2
// slot 30534
    30534, 84,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1153
//			6
// slot 30535
    30535, 12,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1154
//# Page 450
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1155
//			0
// slot 30536
    30536, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1156
//TAR1		SLOAD*	SR2		# X1=2 X2=12 S2=6 X1=0 X2=6 S2=6
// slot 30537
    30537, 49846,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1157
//			TAZEL1 +3,1
// slot 30538
    30538, 2620,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1158
//		STORE	0		# PD00 ELEVATION PD00
// slot 30539
    30539, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1159
//		SIN
// slot 30540
    30540, 65500,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1160
//		STORE	18D,2		# PD06 *** SIN(EL) ***PD12
// slot 30541
    30541, 8230,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1161
//		DLOAD
// slot 30542
    30542, 65482,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1162
//			0
// slot 30543
    30543, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1163
//		COS	PUSH		# PD00 COS(EL) PD00
// slot 30544
    30544, 34508,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1164
//		SLOAD*	RTB
// slot 30545
    30545, 40118,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1165
//			TAZEL1 +2,1
// slot 30546
    30546, 2618,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1166
//			CDULOGIC
// slot 30547
    30547, 38550,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1167
//		STORE	2		# PD02 AZIMUTH PD02
// slot 30548
    30548, 6,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1168
//		SIN	DMP
// slot 30549
    30549, 34268,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1169
//			0
// slot 30550
    30550, 2,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1170
//		SL1
// slot 30551
    30551, 65492,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1171
//		STORE	22D,2		# PD10 *** SIN(AZ)COS(EL) ***PD16
// slot 30552
    30552, 8238,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1172
//		DLOAD	COS
// slot 30553
    30553, 59082,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1173
//			2
// slot 30554
    30554, 6,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1174
//		DMP	SL1
// slot 30555
    30555, 59914,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1175
//		DCOMP	AXT,1
// slot 30556
    30556, 63612,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1176
//			0
// slot 30557
    30557, 0,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1177
//		STORE	20D,2		# PD08 *** -COS(AZ)COS(EL) ***PD14
// slot 30558
    30558, 8234,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1178
//		TIX,2	RVQ
// slot 30559
    30559, 36488,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1179
//			TAR1
// slot 30560
    30560, 56978
)).

// bank 33, slots 30561-30565
function agcAotUnit1718 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30562 {
        if slot <= 30561 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1180
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1181
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1182
//		BANK	33
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1183
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1184
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1185
//		COUNT*	$$/P03
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1186
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1187
//CONTIN33	CA	ONE
// slot 30561
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1188
//		TS	STARCODE
// slot 30562
            if slot <> 30562 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30563 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1189
//		CA	ZERO
// slot 30563
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1190
//		TC	TARGDRVE
// slot 30564
                if slot <> 30564 or instruction <> 1949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1191
//		TC	INTPRET
// slot 30565
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1192
//		CALL
// slot 30566
    30566, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1193
//			TAR/EREF
// slot 30567
    30567, 56964,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1194
//NEXTBNKS	VLOAD	MXV
// slot 30568
    30568, 53754,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1195
//			6D
// slot 30569
    30569, 14,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1196
//			XSM
// slot 30570
    30570, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1197
//		VSL1
// slot 30571
    30571, 65524,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1198
//		STOVL	STARAD
// slot 30572
    30572, 23484,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1199
//			12D
// slot 30573
    30573, 26,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1200
//		MXV	VSL1
// slot 30574
    30574, 64162,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1201
//			XSM
// slot 30575
    30575, 2932,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1202
//		STCALL	STARAD +6
// slot 30576
    30576, 31688,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1203
//			LITTLSUB
// slot 30577
    30577, 57260,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1204
//		STORE	LOSVEC
// slot 30578
    30578, 2584,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1205
//# Page 451
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1206
//		EXIT
// slot 30579
    30579, 65532
)).

// bank 33, slots 30580-30580
function agcAotUnit1719 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1207
//		TC	BANKCALL
// slot 30580
    if slot <> 30580 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1719] to agcAotUnit1719@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1208
//		CADR	MKRELEAS
// slot 30581
    30581, 14438
)).

// bank 33, slots 30582-30586
function agcAotUnit1720 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30583 {
        if slot <= 30582 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1209
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1210
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1211
//NEXBNKSS	CAF	TWO
// slot 30582
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1212
//		TS	STARCODE
// slot 30583
            if slot <> 30583 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30584 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1213
//		CAF	SIX
// slot 30584
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1214
//		TC	TARGDRVE
// slot 30585
                if slot <> 30585 or instruction <> 1949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1215
//		TC	INTPRET
// slot 30586
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1216
//		CALL
// slot 30587
    30587, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1217
//			LITTLSUB
// slot 30588
    30588, 57260,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1218
//		STOVL	12D
// slot 30589
    30589, 20506,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1219
//			LOSVEC
// slot 30590
    30590, 2584,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1220
//		STCALL	06D
// slot 30591
    30591, 28686,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1221
//			AXISGEN
// slot 30592
    30592, 40450,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1222
//		CALL
// slot 30593
    30593, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1223
//			CALCGTA
// slot 30594
    30594, 40202,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1224
//		EXIT
// slot 30595
    30595, 65532
)).

// bank 33, slots 30596-30597
function agcAotUnit1721 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30596 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1225
//GCOMP4		CAF	V06N93S
// slot 30596
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1226
//		TC	BANKCALL
// slot 30597
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1227
//		CADR	GOFLASH
// slot 30598
    30598, 17312
)).

// bank 33, slots 30599-30602
function agcAotUnit1722 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30600 {
        if slot <= 30599 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1228
//		TC	GCOMP5
// slot 30599
            if slot <> 30599 or instruction <> 1936 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1936, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1229
//		TCF	+2
// slot 30600
            if slot <> 30600 or instruction <> 6026 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6026, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30601 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1230
//		TCF	GCOMP4
// slot 30601
            if slot <> 30601 or instruction <> 6020 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6020, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1231
//		TC	INTPRET
// slot 30602
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1232
//		VLOAD	VAD
// slot 30603
    30603, 44538,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1233
//			OGC
// slot 30604
    30604, 3040,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1234
//			ERCOMP1
// slot 30605
    30605, 2896,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1235
//		STORE	ERCOMP1
// slot 30606
    30606, 2896,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1236
//		EXIT
// slot 30607
    30607, 65532
)).

// bank 33, slots 30608-30608
function agcAotUnit1723 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1237
//GCOMP5		TC	BANKCALL
// slot 30608
    if slot <> 30608 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1723] to agcAotUnit1723@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1238
//		CADR	MKRELEAS
// slot 30609
    30609, 14438
)).

// bank 33, slots 30610-30610
function agcAotUnit1724 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1239
//		TC	DOWNFLAG
// slot 30610
    if slot <> 30610 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1724] to agcAotUnit1724@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1240
//		ADRES	TRM03FLG
// slot 30611
    30611, 52
)).

// bank 33, slots 30612-30612
function agcAotUnit1725 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1241
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1242
//		TC	NEWMODEX
// slot 30612
    if slot <> 30612 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1725] to agcAotUnit1725@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1243
//		MM	02
// slot 30613
    30613, 4
)).

// bank 33, slots 30614-30614
function agcAotUnit1726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1244
//		TC	PHASCHNG
// slot 30614
    if slot <> 30614 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1726] to agcAotUnit1726@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1245
//		OCT	00004
// slot 30615
    30615, 8
)).

// bank 33, slots 30616-30616
function agcAotUnit1727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1246
//		TC	ENDOFJOB
// slot 30616
    if slot <> 30616 or instruction <> 2703 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2703, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1727] to agcAotUnit1727@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1247
//V06N93S		VN	0693
// slot 30617
    30617, 1722
)).

// bank 33, slots 30618-30618
function agcAotUnit1728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1248
//GTSOPTCS	TC	ALARM
// slot 30618
    if slot <> 30618 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1728] to agcAotUnit1728@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1249
//GTSOPTSS	OCT	01602
// slot 30619
    30619, 1796
)).

// bank 33, slots 30620-30620
function agcAotUnit1729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1250
//		TC	GCOMP5
// slot 30620
    if slot <> 30620 or instruction <> 1936 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1936, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1729] to agcAotUnit1729@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1251
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1252
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1253
//		BANK	34
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1254
//		SETLOC	IMUCAL1
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1255
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1256
//# Page 452
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1257
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1258
//		COUNT	34/COMST
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1259
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1260
//LATAZCHK	DLOAD	SL2		# CALLS FOR AZIMUTH AND LATITUDE
// slot 6539
    6539, 51914,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1261
//			LATITUDE
// slot 6540
    6540, 2566,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1262
//		STODL	DSPTEM1 +1
// slot 6541
    6541, 13390,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1263
//			AZIMUTH
// slot 6542
    6542, 2562,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1264
//		RTB	EXIT
// slot 6543
    6543, 65080,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1265
//			1STO2S
// slot 6544
    6544, 38604
)).

// bank 04, slots 6545-6547
function agcAotUnit393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6545 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1266
//		XCH	MPAC
// slot 6545
        if slot <> 6545 or instruction <> 23660 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 108, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6546 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1267
//		TS	DSPTEM1
// slot 6546
            if slot <> 6546 or instruction <> 23077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23077, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1268
//		TC	BANKCALL
// slot 6547
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1269
//		CADR	CLEANDSP
// slot 6548
    6548, 17286
)).

// bank 04, slots 6549-6550
function agcAotUnit394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6549 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1270
//		CAF	VNG0641
// slot 6549
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1271
//		TC	BANKCALL
// slot 6550
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1272
//		CADR	GOFLASH
// slot 6551
    6551, 17312
)).

// bank 04, slots 6552-6555
function agcAotUnit395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6553 {
        if slot <= 6552 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1273
//		TC	+2		# NOT ALLOWED
// slot 6552
            if slot <> 6552 or instruction <> 1434 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1434, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1274
//		TC	+2
// slot 6553
            if slot <> 6553 or instruction <> 1435 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1435, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6554 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1275
//		TC	-5
// slot 6554
            if slot <> 6554 or instruction <> 1429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1276
//		TC	INTPRET
// slot 6555
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1277
//		SLOAD	RTB
// slot 6556
    6556, 40122,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1278
//			DSPTEM1
// slot 6557
    6557, 1100,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1279
//			CDULOGIC
// slot 6558
    6558, 38550,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1280
//		STORE	AZIMUTH
// slot 6559
    6559, 2562,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1281
//		SLOAD	SR2
// slot 6560
    6560, 49850,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1282
//			DSPTEM1 +1
// slot 6561
    6561, 1102,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1283
//		STORE	LATITUDE
// slot 6562
    6562, 2566,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1284
//		RVQ
// slot 6563
    6563, 65308,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1285
//VNG0641		VN	0641
// slot 6564
    6564, 1618
)).

// bank 33, slots 30621-30624
function agcAotUnit1730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30622 {
        if slot <= 30621 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1286
//		BANK	33
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1287
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1288
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1289
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1290
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1291
//		COUNT*	$$/P03
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1292
//TARGDRVE	EXTEND
// slot 30621
            if slot <> 30621 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1293
//		QXCH	QPLAC
// slot 30622
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1294
//		TS	TARG1/2
// slot 30623
            if slot <> 30623 or instruction <> 23321 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23321, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1295
//		TC	INTPRET
// slot 30624
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1296
//		CALL
// slot 30625
    30625, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1297
//			TAR/EREF
// slot 30626
    30626, 56964,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1298
//		LXC,1	VLOAD*
// slot 30627
    30627, 64448,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1299
//			TARG1/2
// slot 30628
    30628, 2610,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1300
//			6D,1
// slot 30629
    30629, 14,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1301
//		STCALL	STAR
// slot 30630
    30630, 31724,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1302
//			SXTANG
// slot 30631
    30631, 38998,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1303
//		EXIT
// slot 30632
    30632, 65532
)).

// bank 33, slots 30633-30640
function agcAotUnit1731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30636 {
        if slot <= 30634 {
            if slot <= 30633 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1304
//		CA	SAC
// slot 30633
                if slot <> 30633 or instruction <> 13307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1019).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1305
//		TS	DESOPTS
// slot 30634
                if slot <> 30634 or instruction <> 23153 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23153, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30635 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1306
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1307
//# Page 453
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1308
//		CA	PAC
// slot 30635
                if slot <> 30635 or instruction <> 13309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1021).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1309
//		TS	DESOPTT
// slot 30636
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1310
//RETARG		CAF	ZERO
// slot 30637
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1311
//		TS	OPTIND
// slot 30638
                if slot <> 30638 or instruction <> 23235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30639 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1312
//		CAF	ONE
// slot 30639
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1313
//		TC	BANKCALL
// slot 30640
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1314
//		CADR	SXTMARK
// slot 30641
    30641, 14340
)).

// bank 33, slots 30642-30642
function agcAotUnit1732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1315
//		TC	BANKCALL
// slot 30642
    if slot <> 30642 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1732] to agcAotUnit1732@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1316
//		CADR	OPTSTALL
// slot 30643
    30643, 16118
)).

// bank 33, slots 30644-30649
function agcAotUnit1733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30646 {
        if slot <= 30644 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1317
//		TC	GTSOPTCS
// slot 30644
            if slot <> 30644 or instruction <> 1946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30645 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1318
//		CAE	FLAGWRD1
// slot 30645
                if slot <> 30645 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1319
//		MASK	TRM03BIT
// slot 30646
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1320
//		CCS	A
// slot 30647
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1321
//		TC	GCOMP5
// slot 30648
                if slot <> 30648 or instruction <> 1936 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1322
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1323
//		INDEX	MARKSTAT
// slot 30649
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1324
//		CA	QPRET
// slot 30650
    30650, 24660
)).

// bank 33, slots 30651-30657
function agcAotUnit1734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30653 {
        if slot <= 30651 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1325
//		EXTEND
// slot 30651
            if slot <> 30651 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30652 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1326
//		BZF	RETARG1
// slot 30652
                if slot <> 30652 or instruction <> 6078 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1327
//		TC	QPLAC
// slot 30653
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1328
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1329
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1330
//RETARG1		CA	ZERO		# RELEASE PREVIOUSLY GRABBED VAC AREA
// slot 30654
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1331
//		XCH	MARKSTAT
// slot 30655
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1332
//		CCS	A
// slot 30656
                if slot <> 30656 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1333
//		INDEX	A
// slot 30657
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1334
//		TS	A
// slot 30658
    30658, 45056
)).

// bank 33, slots 30659-30659
function agcAotUnit1735 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1335
//		TCF	RETARG		# GO DO SXTMARK AGAIN
// slot 30659
    if slot <> 30659 or instruction <> 6061 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6061, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1735] to agcAotUnit1735@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1336
//		BANK	33
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1337
//		SETLOC	IMUCAL
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1338
//		BANK
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1339
//		COUNT*	$$/P03
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1340
//PIPASC		2DEC	.76376833
// slot 30660 30661
    30660, 25026, 30661, 19016,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1341
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1342
//VELSC		2DEC	-.52223476
// slot 30662 30663
    30662, 48422, 30663, 55890,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1343
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1344
//ALSK		2DEC	.17329931
// slot 30664 30665
    30664, 5678, 30665, 11006,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1345
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1346
//		2DEC	-.00835370
// slot 30666 30667
    30666, 65262, 30667, 37124,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1347
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1348
//GEORGEJ		2DEC	.63661977
// slot 30668 30669
    30668, 20860, 30669, 12396,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1349
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1350
//GEOCONS1	2DEC	.1
// slot 30670 30671
    30670, 3276, 30671, 13108,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1351
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1352
//GEOCONS2	2DEC	.005
// slot 30672 30673
    30672, 162, 30673, 30146,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1353
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1354
//GEOCONS3	2DEC	.062
// slot 30674 30675
    30674, 2030, 30675, 26476,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1355
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1356
//GEOCONS4	2DEC	.0003
// slot 30676 30677
    30676, 8, 30677, 29990,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1357
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1358
//# Page 454
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1359
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1360
//		COUNT	33/P02
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1361
//LITTLSUB	STQ
// slot 30678
    30678, 65312,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1362
//			QPLAC
// slot 30679
    30679, 2600,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1363
//		LXC,1	VLOAD*
// slot 30680
    30680, 64448,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1364
//			MARKSTAT
// slot 30681
    30681, 1456,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1365
//			2,1
// slot 30682
    30682, 6,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1366
//		STCALL	CDUSPOT
// slot 30683
    30683, 29678,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1367
//			SXTNB
// slot 30684
    30684, 38912,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1368
//		CALL
// slot 30685
    30685, 65320,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1369
//			TRG*NBSM
// slot 30686
    30686, 40766,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1370
//		GOTO
// slot 30687
    30687, 65360,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1371
//			QPLAC
// slot 30688
    30688, 2600,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1372
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1373
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1374
//		EXIT
// slot 30689
    30689, 65532
)).

// bank 33, slots 30690-30690
function agcAotUnit1736 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1375
//AZMTHCG1	TC	INTPRET
// slot 30690
    if slot <> 30690 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1736] to agcAotUnit1736@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1376
//		DLOAD	RTB
// slot 30691
    30691, 40138,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1377
//			NEWAZMTH
// slot 30692
    30692, 2876,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1378
//			1STO2S
// slot 30693
    30693, 38604,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1379
//		EXIT
// slot 30694
    30694, 65532
)).

// bank 33, slots 30695-30697
function agcAotUnit1737 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30695 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1380
//		XCH	MPAC
// slot 30695
        if slot <> 30695 or instruction <> 23660 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 108, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30696 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1381
//		TS	DSPTEM1
// slot 30696
            if slot <> 30696 or instruction <> 23077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23077, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1382
//		TC	BANKCALL
// slot 30697
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1383
//		CADR	CLEANDSP
// slot 30698
    30698, 17286
)).

// bank 33, slots 30699-30700
function agcAotUnit1738 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30699 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1384
//		CAF	VN0629
// slot 30699
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1385
//		TC	BANKCALL
// slot 30700
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1386
//		CADR	GOFLASH
// slot 30701
    30701, 17312
)).

// bank 33, slots 30702-30705
function agcAotUnit1739 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30703 {
        if slot <= 30702 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1387
//		TCF	+2
// slot 30702
            if slot <> 30702 or instruction <> 6128 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1388
//		TCF	+2
// slot 30703
            if slot <> 30703 or instruction <> 6129 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6129, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30704 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1389
//		TCF	-5
// slot 30704
            if slot <> 30704 or instruction <> 6123 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6123, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1390
//		TC	INTPRET
// slot 30705
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1391
//		SLOAD	RTB
// slot 30706
    30706, 40122,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1392
//			DSPTEM1
// slot 30707
    30707, 1100,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1393
//			CDULOGIC
// slot 30708
    30708, 38550,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1394
//		STORE	LAUNCHAZ
// slot 30709
    30709, 2872,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1395
//		EXIT
// slot 30710
    30710, 65532
)).

// bank 33, slots 30711-30713
function agcAotUnit1740 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30711 {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1396
//		CA	ZERO
// slot 30711
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1397
//		TS	PREMTRXC
// slot 30712
            if slot <> 30712 or instruction <> 23450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23450, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1398
//		TC	PHASCHNG
// slot 30713
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
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1399
//		OCT	00004
// slot 30714
    30714, 8
)).

// bank 33, slots 30715-30715
function agcAotUnit1741 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1400
//		TC	POSTJUMP
// slot 30715
    if slot <> 30715 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1741] to agcAotUnit1741@.

agcAotInstallSourceRope(list(
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1401
//		CADR	PINBRNCH
// slot 30716
    30716, 17780,
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1402
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1403
//VN0629		VN	0629
// slot 30717
    30717, 1594
)).

// no code for the lines below
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1404
//
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1405
//# Page 455
// IMU_CALIBRATION_AND_ALIGNMENT.agc:1406
//# *** END OF COMAID .029 ***
