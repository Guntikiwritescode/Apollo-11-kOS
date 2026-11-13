// PORT: Original source unit IMU_PERFORMANCE_TEST_2.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 33794–33794.
function agcAotUnit2228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:2
//# Filename:	IMU_PERFORMANCE_TEST_2.agc
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:9
//# Pages:	373-381
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:13
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:22
//# actually created.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:23
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:25
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:28
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:29
//# Page 373
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:30
//# NAME --	IMU PERFORMANCE TESTS 2
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:31
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:32
//# DATE --	MARCH 20, 1967
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:33
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:34
//# BY --		SYSTEM TEST GROUP 864-6900 EXT. 1274
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:35
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:36
//# MODNO. --	ZERO
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:37
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:38
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:39
//#
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:40
//# POSITIONING ROUTINES FOR THE IMU PERFORMANCE TESTS AS WELL AS SOME OF
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:41
//# THE TESTS THEMSELVES.  FOR A DESCRIPTION OF THESE SUBROUTINES AND THE
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:42
//# OPERATING PROCEDURES (TYPICALLY) SEE STG MEMO 685.  THEORETICAL REF. E-1973
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:43
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:44
//		BANK	33
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:45
//		SETLOC	IMU2
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:46
//		BANK
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:47
//		EBANK=	POSITON
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:48
//		COUNT*	$$/P07
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:49
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:50
//REDO		TC	NEWMODEX
// PORT: Fixed ROM slots 33794.
    if slot <> 33794 or instruction <> 2761 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2761, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2228] to agcAotUnit2228@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:51
//		MM	07
// PORT: Fixed ROM slots 33795.
    33795, 14
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33796–33808.
function agcAotUnit2229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33801 {
        if slot <= 33798 {
            if slot <= 33796 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:52
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:53
//GEOIMUTT	TC	IMUZERR
// PORT: Fixed ROM slots 33796.
                if slot <> 33796 or instruction <> 1237 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1237, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33797 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:54
//IMUBACK		CA	ZERO
// PORT: Fixed ROM slots 33797.
                    if slot <> 33797 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:55
//		TS	NDXCTR
// PORT: Fixed ROM slots 33798.
                    if slot <> 33798 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33799 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:56
//		TS	TORQNDX
// PORT: Fixed ROM slots 33799.
                if slot <> 33799 or instruction <> 23328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23328, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33800 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:57
//		TS	TORQNDX +1
// PORT: Fixed ROM slots 33800.
                    if slot <> 33800 or instruction <> 23329 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23329, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:58
//		TS	OVFLOWCK
// PORT: Fixed ROM slots 33801.
                    if slot <> 33801 or instruction <> 23422 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33804 {
            if slot <= 33802 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:59
//NBPOSPL		CA	DEC17
// PORT: Fixed ROM slots 33802.
                if slot <> 33802 or instruction <> 14577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2289), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33803 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:60
//		TS	ZERONDX
// PORT: Fixed ROM slots 33803.
                    if slot <> 33803 or instruction <> 23417 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23417, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:61
//		CA	XNBADR
// PORT: Fixed ROM slots 33804.
                    if slot <> 33804 or instruction <> 13630 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1342), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33806 {
                if slot <= 33805 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:62
//		TC	ZEROING
// PORT: Fixed ROM slots 33805.
                    if slot <> 33805 or instruction <> 1271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:63
//		CA	HALF
// PORT: Fixed ROM slots 33806.
                    if slot <> 33806 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33807 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:64
//		TS	XNB
// PORT: Fixed ROM slots 33807.
                    if slot <> 33807 or instruction <> 23476 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23476, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:65
//GUESS		TC	INTPRET
// PORT: Fixed ROM slots 33808.
                    if slot <> 33808 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2229] to agcAotUnit2229@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:66
//LATAZCHK	DLOAD	SL2
// PORT: Fixed ROM slots 33809.
    33809, 51914,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:67
//			LATITUDE
// PORT: Fixed ROM slots 33810.
    33810, 2566,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:68
//		STODL	DSPTEM1 +1
// PORT: Fixed ROM slots 33811.
    33811, 13390,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:69
//			AZIMUTH
// PORT: Fixed ROM slots 33812.
    33812, 2562,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:70
//		RTB	EXIT
// PORT: Fixed ROM slots 33813.
    33813, 65080,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:71
//			1STO2S
// PORT: Fixed ROM slots 33814.
    33814, 18200
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33815–33818.
function agcAotUnit2230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33816 {
        if slot <= 33815 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:72
//		XCH	MPAC
// PORT: Fixed ROM slots 33815.
            if slot <> 33815 or instruction <> 23660 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 108, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:73
//		TS	DSPTEM1
// PORT: Fixed ROM slots 33816.
            if slot <> 33816 or instruction <> 23077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23077, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33817 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:74
//		CAF	VN0641
// PORT: Fixed ROM slots 33817.
            if slot <> 33817 or instruction <> 13627 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1339), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:75
//		TC	BANKCALL
// PORT: Fixed ROM slots 33818.
            if slot <> 33818 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2230] to agcAotUnit2230@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:76
//		CADR	GOFLASH
// PORT: Fixed ROM slots 33819.
    33819, 17020
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33820–33823.
function agcAotUnit2231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33821 {
        if slot <= 33820 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:77
//		TC	ENDTEST1
// PORT: Fixed ROM slots 33820.
            if slot <> 33820 or instruction <> 1208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:78
//		TC	+2
// PORT: Fixed ROM slots 33821.
            if slot <> 33821 or instruction <> 1055 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1055, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33822 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:79
//		TC	-5
// PORT: Fixed ROM slots 33822.
            if slot <> 33822 or instruction <> 1049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:80
//# Page 374
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:81
//		TC	INTPRET
// PORT: Fixed ROM slots 33823.
            if slot <> 33823 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2231] to agcAotUnit2231@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:82
//		SLOAD	RTB
// PORT: Fixed ROM slots 33824.
    33824, 40122,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:83
//			DSPTEM1
// PORT: Fixed ROM slots 33825.
    33825, 1100,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:84
//			CDULOGIC
// PORT: Fixed ROM slots 33826.
    33826, 18172,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:85
//		STORE	AZIMUTH
// PORT: Fixed ROM slots 33827.
    33827, 2562,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:86
//		SLOAD	SR2
// PORT: Fixed ROM slots 33828.
    33828, 49850,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:87
//			DSPTEM1 +1
// PORT: Fixed ROM slots 33829.
    33829, 1102,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:88
//		STORE	LATITUDE
// PORT: Fixed ROM slots 33830.
    33830, 2566,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:89
//		COS	DCOMP
// PORT: Fixed ROM slots 33831.
    33831, 48844,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:90
//		SL1
// PORT: Fixed ROM slots 33832.
    33832, 65492,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:91
//		STODL	WANGI
// PORT: Fixed ROM slots 33833.
    33833, 14910,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:92
//			LATITUDE
// PORT: Fixed ROM slots 33834.
    33834, 2566,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:93
//		SIN	SL1
// PORT: Fixed ROM slots 33835.
    33835, 60124,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:94
//		STODL	WANGO
// PORT: Fixed ROM slots 33836.
    33836, 14906,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:95
//			AZIMUTH
// PORT: Fixed ROM slots 33837.
    33837, 2562,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:96
//		PUSH	SIN
// PORT: Fixed ROM slots 33838.
    33838, 60940,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:97
//		STORE	YNB 	+2
// PORT: Fixed ROM slots 33839.
    33839, 2938,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:98
//		STODL	ZNB 	+4
// PORT: Fixed ROM slots 33840.
    33840, 15242,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:99
//		COS
// PORT: Fixed ROM slots 33841.
    33841, 65484,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:100
//		STORE	YNB	+4
// PORT: Fixed ROM slots 33842.
    33842, 2942,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:101
//		DCOMP
// PORT: Fixed ROM slots 33843.
    33843, 65404,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:102
//POSGMBL		STCALL	ZNB 	+2
// PORT: Fixed ROM slots 33844.
    33844, 31622,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:103
//			CALCGA
// PORT: Fixed ROM slots 33845.
    33845, 40406,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:104
//		EXIT
// PORT: Fixed ROM slots 33846.
    33846, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33847–33847.
function agcAotUnit2232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:105
//		TC	BANKCALL
// PORT: Fixed ROM slots 33847.
    if slot <> 33847 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2232] to agcAotUnit2232@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:106
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 33848.
    33848, 15360
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33849–33854.
function agcAotUnit2233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33851 {
        if slot <= 33849 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:107
//		CAF	BIT14		# IF BIT14 SET, GIMBAL LOCK
// PORT: Fixed ROM slots 33849.
            if slot <> 33849 or instruction <> 14814 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33850 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:108
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 33850.
                if slot <> 33850 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:109
//		EXTEND
// PORT: Fixed ROM slots 33851.
                if slot <> 33851 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33852 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:110
//		BZF	+2
// PORT: Fixed ROM slots 33852.
            if slot <> 33852 or instruction <> 5182 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5182, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33853 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:111
//		INCR	NDXCTR		# +1 IF IN GIMBAL LOCK, OTHERWISE 0
// PORT: Fixed ROM slots 33853.
                if slot <> 33853 or instruction <> 11020 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 780).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:112
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 33854.
                if slot <> 33854 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2233] to agcAotUnit2233@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:113
//		ADRES	GLOKFAIL	# RESET GIMBAL LOCK FLAG
// PORT: Fixed ROM slots 33855.
    33855, 92
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33856–33862.
function agcAotUnit2234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33858 {
        if slot <= 33856 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:114
//		TC	IMUSLLLG
// PORT: Fixed ROM slots 33856.
            if slot <> 33856 or instruction <> 1229 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1229, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33857 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:115
//		CCS	NDXCTR		# IF ONE GO AND DO A PIPA TEST ONLY
// PORT: Fixed ROM slots 33857.
                if slot <> 33857 or instruction <> 4876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 780).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:116
//		TC	PIPACHK		# ALIGN AND MEASURE VERTICAL PIPA RATE
// PORT: Fixed ROM slots 33858.
                if slot <> 33858 or instruction <> 1110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1110, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33860 {
            if slot <= 33859 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:117
//		TC	FINIMUDD
// PORT: Fixed ROM slots 33859.
                if slot <> 33859 or instruction <> 1232 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1232, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:118
//		EXTEND
// PORT: Fixed ROM slots 33860.
                if slot <> 33860 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33861 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:119
//		DCA	PERFDLAY
// PORT: Fixed ROM slots 33861.
                if slot <> 33861 or instruction <> 13181 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 893, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:120
//		TC	LONGCALL	# DELAY WHILE SUSPENSION STABILIZES
// PORT: Fixed ROM slots 33862.
                if slot <> 33862 or instruction <> 2751 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2751, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2234] to agcAotUnit2234@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:121
//		EBANK=	POSITON
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:122
//		2CADR	GOESTIMS
// PORT: Fixed ROM slots 33863 33864.
    33863, 2198, 33864, 63594
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33865–33869.
function agcAotUnit2235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33866 {
        if slot <= 33865 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:123
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:124
//		CA	ESTICADR
// PORT: Fixed ROM slots 33865.
            if slot <> 33865 or instruction <> 13390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1102), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:125
//		TC	JOBSLEEP
// PORT: Fixed ROM slots 33866.
            if slot <> 33866 or instruction <> 2651 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2651, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33867 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:126
//GOESTIMS	CA	ESTICADR
// PORT: Fixed ROM slots 33867.
            if slot <> 33867 or instruction <> 13390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1102), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33868 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:127
//		TC	JOBWAKE
// PORT: Fixed ROM slots 33868.
                if slot <> 33868 or instruction <> 2655 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2655, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:128
//		TC	TASKOVER
// PORT: Fixed ROM slots 33869.
                if slot <> 33869 or instruction <> 2737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2235] to agcAotUnit2235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:129
//ESTICADR	CADR	ESTIMS
// PORT: Fixed ROM slots 33870.
    33870, 64128
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33871–33875.
function agcAotUnit2236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33872 {
        if slot <= 33871 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:130
//TORQUE		CA	ZERO
// PORT: Fixed ROM slots 33871.
            if slot <> 33871 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:131
//# Page 375
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:132
//		TS	DSPTEM2
// PORT: Fixed ROM slots 33872.
            if slot <> 33872 or instruction <> 23080 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23080, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33873 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:133
//		CA	DRIFTI
// PORT: Fixed ROM slots 33873.
            if slot <> 33873 or instruction <> 13124 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 836).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33874 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:134
//		TS	DSPTEM2 +1
// PORT: Fixed ROM slots 33874.
                if slot <> 33874 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:135
//		INDEX	POSITON
// PORT: Fixed ROM slots 33875.
                if slot <> 33875 or instruction <> 21262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21262, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21262, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2236] to agcAotUnit2236@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:136
//		TS	SOUTHDR -1
// PORT: Fixed ROM slots 33876.
    33876, 46624
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33877–33878.
function agcAotUnit2237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33877 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:137
//		TC	SHOW
// PORT: Fixed ROM slots 33877.
        if slot <> 33877 or instruction <> 1327 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1327, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:138
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:139
//PIPACHK		INDEX	NDXCTR		# PIPA TEST
// PORT: Fixed ROM slots 33878.
        if slot <> 33878 or instruction <> 21260 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21260, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21260, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2237] to agcAotUnit2237@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:140
//		TC	+1
// PORT: Fixed ROM slots 33879.
    33879, 2224
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33880–33888.
function agcAotUnit2238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33883 {
        if slot <= 33881 {
            if slot <= 33880 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:141
//		TC	EARTHR*
// PORT: Fixed ROM slots 33880.
                if slot <> 33880 or instruction <> 1319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:142
//		CA	DEC17		# ALLOW PIP COUNTER TO OVERFLOW 17 TIMES
// PORT: Fixed ROM slots 33881.
                if slot <> 33881 or instruction <> 14577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2289), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33882 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:143
//		TS	DATAPL	+4	# IN THE ALLOTTED TIME INTERVAL
// PORT: Fixed ROM slots 33882.
                if slot <> 33882 or instruction <> 23358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:144
//		CA	DEC58
// PORT: Fixed ROM slots 33883.
                if slot <> 33883 or instruction <> 13628 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1340), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33885 {
            if slot <= 33884 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:145
//		TS	LENGTHOT
// PORT: Fixed ROM slots 33884.
                if slot <> 33884 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:146
//		CA	ONE
// PORT: Fixed ROM slots 33885.
                if slot <> 33885 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33886 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:147
//		TS	RESULTCT
// PORT: Fixed ROM slots 33886.
                if slot <> 33886 or instruction <> 23391 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23391, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33887 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:148
//		CA	ZERO
// PORT: Fixed ROM slots 33887.
                    if slot <> 33887 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:149
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 33888.
                    if slot <> 33888 or instruction <> 21261 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21261, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21261, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2238] to agcAotUnit2238@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:150
//		TS	PIPAX
// PORT: Fixed ROM slots 33889.
    33889, 45118
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33890–33894.
function agcAotUnit2239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33891 {
        if slot <= 33890 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:151
//		TS	DATAPL
// PORT: Fixed ROM slots 33890.
            if slot <> 33890 or instruction <> 23354 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23354, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:152
//		TC	CHECKG
// PORT: Fixed ROM slots 33891.
            if slot <> 33891 or instruction <> 1242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1242, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33892 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:153
//		INHINT
// PORT: Fixed ROM slots 33892.
            if slot <> 33892 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33893 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:154
//		CAF	TWO
// PORT: Fixed ROM slots 33893.
                if slot <> 33893 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:155
//		TC	TWIDDLE
// PORT: Fixed ROM slots 33894.
                if slot <> 33894 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2239] to agcAotUnit2239@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:156
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:157
//		ADRES	PIPATASK
// PORT: Fixed ROM slots 33895.
    33895, 2258
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33896–33903.
function agcAotUnit2240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33899 {
        if slot <= 33897 {
            if slot <= 33896 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:158
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 33896.
                if slot <> 33896 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:159
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:160
//PIPATASK	EXTEND
// PORT: Fixed ROM slots 33897.
                if slot <> 33897 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33898 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:161
//		DIM	LENGTHOT
// PORT: Fixed ROM slots 33898.
                if slot <> 33898 or instruction <> 12042 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:162
//		CA	LENGTHOT
// PORT: Fixed ROM slots 33899.
                if slot <> 33899 or instruction <> 13066 { return choose false if checkOnly else -1. }
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
        if slot <= 33901 {
            if slot <= 33900 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:163
//		EXTEND
// PORT: Fixed ROM slots 33900.
                if slot <> 33900 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:164
//		BZMF	STARTPIP
// PORT: Fixed ROM slots 33901.
                if slot <> 33901 or instruction <> 25713 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25713, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33902 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:165
//		CAF	BIT10
// PORT: Fixed ROM slots 33902.
                if slot <> 33902 or instruction <> 14818 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:166
//		TC	TWIDDLE
// PORT: Fixed ROM slots 33903.
                if slot <> 33903 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2240] to agcAotUnit2240@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:167
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:168
//		ADRES	PIPATASK
// PORT: Fixed ROM slots 33904.
    33904, 2258
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33905–33906.
function agcAotUnit2241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33905 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:169
//STARTPIP	CAF	PRIO20
// PORT: Fixed ROM slots 33905.
        if slot <> 33905 or instruction <> 14814 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:170
//		TC	FINDVAC
// PORT: Fixed ROM slots 33906.
        if slot <> 33906 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2241] to agcAotUnit2241@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:171
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:172
//		2CADR	PIPJOBB
// PORT: Fixed ROM slots 33907 33908.
    33907, 2284, 33908, 63594
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33909–33910.
function agcAotUnit2242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33909 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:173
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:174
//		TC	TASKOVER
// PORT: Fixed ROM slots 33909.
        if slot <> 33909 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:175
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:176
//PIPJOBB		INDEX	NDXCTR
// PORT: Fixed ROM slots 33910.
        if slot <> 33910 or instruction <> 21260 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21260, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21260, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2242] to agcAotUnit2242@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:177
//		TC	+1
// PORT: Fixed ROM slots 33911.
    33911, 2288
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33912–33928.
function agcAotUnit2243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33919 {
        if slot <= 33915 {
            if slot <= 33913 {
                if slot <= 33912 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:178
//		TC	EARTHR*
// PORT: Fixed ROM slots 33912.
                    if slot <> 33912 or instruction <> 1319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1319, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:179
//		CA	LENGTHOT
// PORT: Fixed ROM slots 33913.
                    if slot <> 33913 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33914 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:180
//# Page 376
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:181
//		EXTEND
// PORT: Fixed ROM slots 33914.
                    if slot <> 33914 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:182
//		BZMF	+2
// PORT: Fixed ROM slots 33915.
                    if slot <> 33915 or instruction <> 25725 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33917 {
                if slot <= 33916 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:183
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 33916.
                    if slot <> 33916 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:184
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:185
//		CA	FIVE
// PORT: Fixed ROM slots 33917.
                    if slot <> 33917 or instruction <> 14830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33918 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:186
//		TS	RESULTCT
// PORT: Fixed ROM slots 33918.
                    if slot <> 33918 or instruction <> 23391 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23391, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:187
//		TC	CHECKG
// PORT: Fixed ROM slots 33919.
                    if slot <> 33919 or instruction <> 1242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1242, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33923 {
            if slot <= 33921 {
                if slot <= 33920 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:188
//		CCS	DATAPL 	+1
// PORT: Fixed ROM slots 33920.
                    if slot <> 33920 or instruction <> 4923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 827).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:189
//		TC	+4
// PORT: Fixed ROM slots 33921.
                    if slot <> 33921 or instruction <> 1157 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1157, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33922 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:190
//		TC	CCSHOLE
// PORT: Fixed ROM slots 33922.
                    if slot <> 33922 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:191
//		CS	DATAPL	+4
// PORT: Fixed ROM slots 33923.
                    if slot <> 33923 or instruction <> 17214 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 830).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33925 {
                if slot <= 33924 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:192
//		TS	DATAPL	+4
// PORT: Fixed ROM slots 33924.
                    if slot <> 33924 or instruction <> 23358 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23358, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:193
//		EXTEND
// PORT: Fixed ROM slots 33925.
                    if slot <> 33925 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33926 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:194
//		DCS	DATAPL
// PORT: Fixed ROM slots 33926.
                    if slot <> 33926 or instruction <> 17211 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 827, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33927 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:195
//		DAS	DATAPL 	+4
// PORT: Fixed ROM slots 33927.
                        if slot <> 33927 or instruction <> 9023 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 831) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:196
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:197
//		TC	INTPRET
// PORT: Fixed ROM slots 33928.
                        if slot <> 33928 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2243] to agcAotUnit2243@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:198
//		DLOAD	DSU
// PORT: Fixed ROM slots 33929.
    33929, 38346,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:199
//			DATAPL	+6
// PORT: Fixed ROM slots 33930.
    33930, 2690,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:200
//			DATAPL 	+2
// PORT: Fixed ROM slots 33931.
    33931, 2682,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:201
//		BPL	CALL
// PORT: Fixed ROM slots 33932.
    33932, 37960,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:202
//			AINGOTN
// PORT: Fixed ROM slots 33933.
    33933, 63774,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:203
//			OVERFFIX
// PORT: Fixed ROM slots 33934.
    33934, 63866,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:204
//AINGOTN		PDDL	DDV
// PORT: Fixed ROM slots 33935.
    33935, 47530,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:205
//			DATAPL 	+4
// PORT: Fixed ROM slots 33936.
    33936, 2686,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:206
//		DMPR	RTB
// PORT: Fixed ROM slots 33937.
    33937, 40058,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:207
//			DEC585		# DEC585 HAS BEEN REDEFINED FOR LEM
// PORT: Fixed ROM slots 33938.
    33938, 31836,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:208
//			SGNAGREE
// PORT: Fixed ROM slots 33939.
    33939, 18196,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:209
//		STORE	DSPTEM2
// PORT: Fixed ROM slots 33940.
    33940, 1106,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:210
//		EXIT
// PORT: Fixed ROM slots 33941.
    33941, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33942–33947.
function agcAotUnit2244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33944 {
        if slot <= 33942 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:211
//		CCS	NDXCTR
// PORT: Fixed ROM slots 33942.
            if slot <> 33942 or instruction <> 4876 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 780).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33943 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:212
//		TC	COAALIGN	# TAKE PLATFORM OUT OF GIMBAL LOCK
// PORT: Fixed ROM slots 33943.
                if slot <> 33943 or instruction <> 1217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1217, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:213
//		TC	SHOW
// PORT: Fixed ROM slots 33944.
                if slot <> 33944 or instruction <> 1327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1327, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33945 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:214
//VERTDRFT	CA	3990DEC		# ABOUT 1 HOUR VERTICAL DRIFT TEST
// PORT: Fixed ROM slots 33945.
            if slot <> 33945 or instruction <> 13625 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1337), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33946 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:215
//		TS	LENGTHOT
// PORT: Fixed ROM slots 33946.
                if slot <> 33946 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:216
//		INDEX	POSITON
// PORT: Fixed ROM slots 33947.
                if slot <> 33947 or instruction <> 21262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21262, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21262, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2244] to agcAotUnit2244@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:217
//		CS	SOUTHDR -2
// PORT: Fixed ROM slots 33948.
    33948, 34334
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33949–33976.
function agcAotUnit2245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33962 {
        if slot <= 33955 {
            if slot <= 33951 {
                if slot <= 33949 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:218
//		TS	DRIFTT
// PORT: Fixed ROM slots 33949.
                    if slot <> 33949 or instruction <> 23330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23330, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33950 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:219
//		CCS	PIPINDEX	# OFFSET PLATFORM TO MISS PIP DEAD-ZONES
// PORT: Fixed ROM slots 33950.
                        if slot <> 33950 or instruction <> 4877 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 781).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:220
//		TCF	PON4		# Z-UP IN POS 4
// PORT: Fixed ROM slots 33951.
                        if slot <> 33951 or instruction <> 5285 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5285, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33953 {
                    if slot <= 33952 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:221
//PON2		CS	BIT5		# X-UP
// PORT: Fixed ROM slots 33952.
                        if slot <> 33952 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:222
//		ADS	ERCOMP 	+2
// PORT: Fixed ROM slots 33953.
                        if slot <> 33953 or instruction <> 12149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 885).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33954 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:223
//		CA	BIT5
// PORT: Fixed ROM slots 33954.
                        if slot <> 33954 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:224
//		ADS	ERCOMP 	+4
// PORT: Fixed ROM slots 33955.
                        if slot <> 33955 or instruction <> 12151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 887).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33958 {
                if slot <= 33956 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:225
//		TCF	PON
// PORT: Fixed ROM slots 33956.
                    if slot <> 33956 or instruction <> 5289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5289, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33957 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:226
//PON4		CS	BIT5
// PORT: Fixed ROM slots 33957.
                        if slot <> 33957 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:227
//		ADS	ERCOMP	+2
// PORT: Fixed ROM slots 33958.
                        if slot <> 33958 or instruction <> 12149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 885).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33960 {
                    if slot <= 33959 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:228
//		CA	BIT5
// PORT: Fixed ROM slots 33959.
                        if slot <> 33959 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:229
//		ADS	ERCOMP
// PORT: Fixed ROM slots 33960.
                        if slot <> 33960 or instruction <> 12147 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 883).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33961 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:230
//PON		TC	EARTHR*
// PORT: Fixed ROM slots 33961.
                        if slot <> 33961 or instruction <> 1319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:231
//# Page 377
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:232
//		CA	ZERO		# ALLOW ONLY SOUTH GYRO EARTH RATE COMPENS
// PORT: Fixed ROM slots 33962.
                        if slot <> 33962 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 33969 {
            if slot <= 33965 {
                if slot <= 33963 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:233
//		TS	ERVECTOR
// PORT: Fixed ROM slots 33963.
                    if slot <> 33963 or instruction <> 23300 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23300, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33964 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:234
//		TS	ERVECTOR +1
// PORT: Fixed ROM slots 33964.
                        if slot <> 33964 or instruction <> 23301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23301, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:235
//GUESS1		CAF	POSMAX
// PORT: Fixed ROM slots 33965.
                        if slot <> 33965 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33967 {
                    if slot <= 33966 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:236
//		TS	TORQNDX
// PORT: Fixed ROM slots 33966.
                        if slot <> 33966 or instruction <> 23328 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23328, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:237
//		TS	TORQNDX +1
// PORT: Fixed ROM slots 33967.
                        if slot <> 33967 or instruction <> 23329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23329, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33968 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:238
//		CA	CDUX
// PORT: Fixed ROM slots 33968.
                        if slot <> 33968 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:239
//		TS	LOSVEC
// PORT: Fixed ROM slots 33969.
                        if slot <> 33969 or instruction <> 23307 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23307, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33972 {
                if slot <= 33970 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:240
//		TC	ESTIMS
// PORT: Fixed ROM slots 33970.
                    if slot <> 33970 or instruction <> 1344 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1344, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33971 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:241
//VALMIS		CA	DRIFTO
// PORT: Fixed ROM slots 33971.
                        if slot <> 33971 or instruction <> 13122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 834).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:242
//		TS	DSPTEM2 +1
// PORT: Fixed ROM slots 33972.
                        if slot <> 33972 or instruction <> 23081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33974 {
                    if slot <= 33973 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:243
//		CA	ZERO
// PORT: Fixed ROM slots 33973.
                        if slot <> 33973 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:244
//		TS	DSPTEM2
// PORT: Fixed ROM slots 33974.
                        if slot <> 33974 or instruction <> 23080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23080, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33975 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:245
//		TC	SHOW
// PORT: Fixed ROM slots 33975.
                        if slot <> 33975 or instruction <> 1327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:246
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:247
//ENDTEST1	TC	DOWNFLAG
// PORT: Fixed ROM slots 33976.
                        if slot <> 33976 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2245] to agcAotUnit2245@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:248
//		ADRES	IMUSE
// PORT: Fixed ROM slots 33977.
    33977, 14
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33978–33980.
function agcAotUnit2246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33978 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:249
//		CS	ZERO
// PORT: Fixed ROM slots 33978.
        if slot <> 33978 or instruction <> 18925 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33979 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:250
//		TC	NEWMODEA
// PORT: Fixed ROM slots 33979.
            if slot <> 33979 or instruction <> 2764 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2764, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:251
//		TC	ENDEXT
// PORT: Fixed ROM slots 33980.
            if slot <> 33980 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2246] to agcAotUnit2246@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:252
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:253
//# Page 378
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:254
//OVERFFIX	DAD	DAD
// PORT: Fixed ROM slots 33981.
    33981, 36122,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:255
//			DPPOSMAX
// PORT: Fixed ROM slots 33982.
    33982, 6832,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:256
//			ONEDPP
// PORT: Fixed ROM slots 33983.
    33983, 31848,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:257
//		RVQ
// PORT: Fixed ROM slots 33984.
    33984, 65308
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33985–33991.
function agcAotUnit2247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33987 {
        if slot <= 33985 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:258
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:259
//COAALIGN	EXTEND			# COARSE ALIGN SUBROUTINE
// PORT: Fixed ROM slots 33985.
            if slot <> 33985 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33986 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:260
//		QXCH	ZERONDX
// PORT: Fixed ROM slots 33986.
                if slot <> 33986 or instruction <> 10105 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 889, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:261
//		CA	ZERO
// PORT: Fixed ROM slots 33987.
                if slot <> 33987 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        if slot <= 33989 {
            if slot <= 33988 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:262
//		TS	THETAD
// PORT: Fixed ROM slots 33988.
                if slot <> 33988 or instruction <> 22737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:263
//		TS	THETAD +1
// PORT: Fixed ROM slots 33989.
                if slot <> 33989 or instruction <> 22738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22738, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33990 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:264
//		TS	THETAD +2
// PORT: Fixed ROM slots 33990.
                if slot <> 33990 or instruction <> 22739 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22739, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:265
//		TC	BANKCALL
// PORT: Fixed ROM slots 33991.
                if slot <> 33991 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2247] to agcAotUnit2247@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:266
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 33992.
    33992, 15360
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33993–33993.
function agcAotUnit2248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:267
//ALIGNCOA	TC	BANKCALL
// PORT: Fixed ROM slots 33993.
    if slot <> 33993 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2248] to agcAotUnit2248@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:268
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 33994.
    33994, 16284
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33995–34002.
function agcAotUnit2249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33998 {
        if slot <= 33996 {
            if slot <= 33995 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:269
//		TC	SOMERR2
// PORT: Fixed ROM slots 33995.
                if slot <> 33995 or instruction <> 1575 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1575, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:270
//		TC	ZERONDX
// PORT: Fixed ROM slots 33996.
                if slot <> 33996 or instruction <> 889 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 889, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33997 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:271
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:272
//IMUSLLLG	EXTEND
// PORT: Fixed ROM slots 33997.
                if slot <> 33997 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:273
//		QXCH	ZERONDX
// PORT: Fixed ROM slots 33998.
                if slot <> 33998 or instruction <> 10105 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 889, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34000 {
            if slot <= 33999 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:274
//		TC	ALIGNCOA
// PORT: Fixed ROM slots 33999.
                if slot <> 33999 or instruction <> 1225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:275
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:276
//FINIMUDD	EXTEND
// PORT: Fixed ROM slots 34000.
                if slot <> 34000 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34001 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:277
//		QXCH	ZERONDX
// PORT: Fixed ROM slots 34001.
                if slot <> 34001 or instruction <> 10105 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 889, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:278
//		TC	BANKCALL
// PORT: Fixed ROM slots 34002.
                if slot <> 34002 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2249] to agcAotUnit2249@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:279
//		CADR	IMUFINE
// PORT: Fixed ROM slots 34003.
    34003, 15632
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34004–34007.
function agcAotUnit2250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34005 {
        if slot <= 34004 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:280
//		TC	ALIGNCOA
// PORT: Fixed ROM slots 34004.
            if slot <> 34004 or instruction <> 1225 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1225, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:281
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:282
//IMUZERR		EXTEND
// PORT: Fixed ROM slots 34005.
            if slot <> 34005 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34006 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:283
//		QXCH	ZERONDX
// PORT: Fixed ROM slots 34006.
            if slot <> 34006 or instruction <> 10105 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 889, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:284
//		TC	BANKCALL
// PORT: Fixed ROM slots 34007.
            if slot <> 34007 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2250] to agcAotUnit2250@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:285
//		CADR	IMUZERO
// PORT: Fixed ROM slots 34008.
    34008, 15256
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34009–34019.
function agcAotUnit2251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34013 {
        if slot <= 34010 {
            if slot <= 34009 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:286
//		TC	ALIGNCOA
// PORT: Fixed ROM slots 34009.
                if slot <> 34009 or instruction <> 1225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:287
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:288
//CHECKG		EXTEND			# PIP PULSE CATCHING ROUTINE
// PORT: Fixed ROM slots 34010.
                if slot <> 34010 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34011 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:289
//		QXCH	QPLACE
// PORT: Fixed ROM slots 34011.
                if slot <> 34011 or instruction <> 9999 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 783, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34012 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:290
//		TC	+6
// PORT: Fixed ROM slots 34012.
                    if slot <> 34012 or instruction <> 1250 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1250, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:291
//CHECKG1		RELINT
// PORT: Fixed ROM slots 34013.
                    if slot <> 34013 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34016 {
            if slot <= 34014 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:292
//		CA	NEWJOB
// PORT: Fixed ROM slots 34014.
                if slot <> 34014 or instruction <> 12343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 55).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34015 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:293
//		EXTEND
// PORT: Fixed ROM slots 34015.
                    if slot <> 34015 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:294
//		BZMF	+6
// PORT: Fixed ROM slots 34016.
                    if slot <> 34016 or instruction <> 25830 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25830, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34017 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:295
//		TC	CHANG1
// PORT: Fixed ROM slots 34017.
                if slot <> 34017 or instruction <> 2642 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2642, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34018 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:296
//		INHINT
// PORT: Fixed ROM slots 34018.
                    if slot <> 34018 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:297
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 34019.
                    if slot <> 34019 or instruction <> 21261 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21261, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21261, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2251] to agcAotUnit2251@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:298
//		CS	PIPAX
// PORT: Fixed ROM slots 34020.
    34020, 32830
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34021–34023.
function agcAotUnit2252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34021 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:299
//		TS	ZERONDX
// PORT: Fixed ROM slots 34021.
        if slot <> 34021 or instruction <> 23417 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23417, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34022 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:300
//		INHINT
// PORT: Fixed ROM slots 34022.
            if slot <> 34022 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:301
//# Page 379
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:302
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 34023.
            if slot <> 34023 or instruction <> 21261 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21261, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21261, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2252] to agcAotUnit2252@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:303
//		CA	PIPAX
// PORT: Fixed ROM slots 34024.
    34024, 24638
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34025–34028.
function agcAotUnit2253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34026 {
        if slot <= 34025 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:304
//		AD	ZERONDX
// PORT: Fixed ROM slots 34025.
            if slot <> 34025 or instruction <> 25465 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 889).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:305
//		EXTEND
// PORT: Fixed ROM slots 34026.
            if slot <> 34026 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34027 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:306
//		BZF	CHECKG1
// PORT: Fixed ROM slots 34027.
            if slot <> 34027 or instruction <> 5341 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5341, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:307
//		INDEX	PIPINDEX
// PORT: Fixed ROM slots 34028.
            if slot <> 34028 or instruction <> 21261 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21261, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21261, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2253] to agcAotUnit2253@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:308
//		CA	PIPAX
// PORT: Fixed ROM slots 34029.
    34029, 24638
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34030–34030.
function agcAotUnit2254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:309
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 34030.
    if slot <> 34030 or instruction <> 21343 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21343, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21343, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2254] to agcAotUnit2254@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:310
//		TS	DATAPL
// PORT: Fixed ROM slots 34031.
    34031, 46708
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34032–34033.
function agcAotUnit2255 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34032 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:311
//		TC	FINETIME
// PORT: Fixed ROM slots 34032.
        if slot <> 34032 or instruction <> 2114 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2114, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:312
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 34033.
        if slot <> 34033 or instruction <> 21343 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21343, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21343, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2255] to agcAotUnit2255@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:313
//		TS	DATAPL +1
// PORT: Fixed ROM slots 34034.
    34034, 46710
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34035–34035.
function agcAotUnit2256 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:314
//		INDEX	RESULTCT
// PORT: Fixed ROM slots 34035.
    if slot <> 34035 or instruction <> 21343 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21343, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21343, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2256] to agcAotUnit2256@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:315
//		LXCH	DATAPL +2
// PORT: Fixed ROM slots 34036.
    34036, 20088
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34037–34043.
function agcAotUnit2257 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34039 {
        if slot <= 34037 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:316
//		RELINT
// PORT: Fixed ROM slots 34037.
            if slot <> 34037 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34038 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:317
//ENDCHKG		TC	QPLACE
// PORT: Fixed ROM slots 34038.
                if slot <> 34038 or instruction <> 783 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 783, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:318
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:319
//ZEROING		TS	L
// PORT: Fixed ROM slots 34039.
                if slot <> 34039 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34041 {
            if slot <= 34040 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:320
//		TCF	+2
// PORT: Fixed ROM slots 34040.
                if slot <> 34040 or instruction <> 5370 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5370, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:321
//ZEROING1	TS	ZERONDX
// PORT: Fixed ROM slots 34041.
                if slot <> 34041 or instruction <> 23417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34042 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:322
//		CAF	ZERO
// PORT: Fixed ROM slots 34042.
                if slot <> 34042 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:323
//		INDEX	L
// PORT: Fixed ROM slots 34043.
                if slot <> 34043 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2257] to agcAotUnit2257@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:324
//		TS	0
// PORT: Fixed ROM slots 34044.
    34044, 45056
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34045–34048.
function agcAotUnit2258 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34046 {
        if slot <= 34045 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:325
//		INCR	L
// PORT: Fixed ROM slots 34045.
            if slot <> 34045 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:326
//		CCS	ZERONDX
// PORT: Fixed ROM slots 34046.
            if slot <> 34046 or instruction <> 4985 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 889).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34047 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:327
//		TCF	ZEROING1
// PORT: Fixed ROM slots 34047.
            if slot <> 34047 or instruction <> 5369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:328
//		TC	Q
// PORT: Fixed ROM slots 34048.
            if slot <> 34048 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2258] to agcAotUnit2258@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:329
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:330
//# Page 380
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:331
//ERTHRVSE	DLOAD	PDDL
// PORT: Fixed ROM slots 34049.
    34049, 54730,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:332
//			SCHZEROS	# PD24 = (SIN             -COS     0)(OMEG/MS)
// PORT: Fixed ROM slots 34050.
    34050, 31838,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:333
//			LATITUDE
// PORT: Fixed ROM slots 34051.
    34051, 2566,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:334
//		COS	DCOMP
// PORT: Fixed ROM slots 34052.
    34052, 48844,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:335
//		PDDL	SIN
// PORT: Fixed ROM slots 34053.
    34053, 61098,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:336
//			LATITUDE
// PORT: Fixed ROM slots 34054.
    34054, 2566,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:337
//		VDEF	VXSC
// PORT: Fixed ROM slots 34055.
    34055, 61804,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:338
//			OMEG/MS
// PORT: Fixed ROM slots 34056.
    34056, 30722,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:339
//		STORE	ERVECTOR
// PORT: Fixed ROM slots 34057.
    34057, 2570,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:340
//		RTB
// PORT: Fixed ROM slots 34058.
    34058, 65336,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:341
//			LOADTIME
// PORT: Fixed ROM slots 34059.
    34059, 18166,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:342
//		STOVL	TMARK
// PORT: Fixed ROM slots 34060.
    34060, 23094,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:343
//			SCHZEROS
// PORT: Fixed ROM slots 34061.
    34061, 31838,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:344
//		STORE	ERCOMP
// PORT: Fixed ROM slots 34062.
    34062, 2792,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:345
//		RVQ
// PORT: Fixed ROM slots 34063.
    34063, 65308,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:346
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:347
//EARTHR		ITA	RTB
// PORT: Fixed ROM slots 34064.
    34064, 39968,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:348
//			S2
// PORT: Fixed ROM slots 34065.
    34065, 82,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:349
//			LOADTIME
// PORT: Fixed ROM slots 34066.
    34066, 18166,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:350
//		STORE	TEMPTIME
// PORT: Fixed ROM slots 34067.
    34067, 2610,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:351
//		DSU	BPL
// PORT: Fixed ROM slots 34068.
    34068, 42026,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:352
//			TMARK
// PORT: Fixed ROM slots 34069.
    34069, 2614,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:353
//			ERTHR
// PORT: Fixed ROM slots 34070.
    34070, 64050,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:354
//		CALL
// PORT: Fixed ROM slots 34071.
    34071, 65320,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:355
//			OVERFFIX
// PORT: Fixed ROM slots 34072.
    34072, 63866,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:356
//ERTHR		SL	VXSC
// PORT: Fixed ROM slots 34073.
    34073, 61794,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:357
//			9D
// PORT: Fixed ROM slots 34074.
    34074, 16660,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:358
//			ERVECTOR
// PORT: Fixed ROM slots 34075.
    34075, 2570,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:359
//		MXV	VAD
// PORT: Fixed ROM slots 34076.
    34076, 44450,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:360
//			XSM
// PORT: Fixed ROM slots 34077.
    34077, 2886,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:361
//			ERCOMP
// PORT: Fixed ROM slots 34078.
    34078, 2792,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:362
//		STODL	ERCOMP
// PORT: Fixed ROM slots 34079.
    34079, 15080,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:363
//			TEMPTIME
// PORT: Fixed ROM slots 34080.
    34080, 2610,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:364
//		STORE	TMARK
// PORT: Fixed ROM slots 34081.
    34081, 2614,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:365
//		AXT,1	RTB
// PORT: Fixed ROM slots 34082.
    34082, 40176,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:366
//		ECADR	ERCOMP
// PORT: Fixed ROM slots 34083.
    34083, 2790,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:367
//			PULSEIMU
// PORT: Fixed ROM slots 34084.
    34084, 18314,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:368
//		GOTO
// PORT: Fixed ROM slots 34085.
    34085, 65360,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:369
//			S2
// PORT: Fixed ROM slots 34086.
    34086, 82
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34087–34089.
function agcAotUnit2259 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34087 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:370
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:371
//EARTHR*		EXTEND
// PORT: Fixed ROM slots 34087.
        if slot <> 34087 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34088 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:372
//		QXCH	QPLACES
// PORT: Fixed ROM slots 34088.
            if slot <> 34088 or instruction <> 10000 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 784, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:373
//		TC	INTPRET
// PORT: Fixed ROM slots 34089.
            if slot <> 34089 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2259] to agcAotUnit2259@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:374
//		CALL
// PORT: Fixed ROM slots 34090.
    34090, 65320,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:375
//			EARTHR
// PORT: Fixed ROM slots 34091.
    34091, 64032,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:376
//		EXIT
// PORT: Fixed ROM slots 34092.
    34092, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34093–34100.
function agcAotUnit2260 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34096 {
        if slot <= 34094 {
            if slot <= 34093 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:377
//		TC	IMUSLLLG
// PORT: Fixed ROM slots 34093.
                if slot <> 34093 or instruction <> 1229 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1229, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:378
//		TC	QPLACES
// PORT: Fixed ROM slots 34094.
                if slot <> 34094 or instruction <> 784 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 784, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34095 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:379
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:380
//SHOW		EXTEND
// PORT: Fixed ROM slots 34095.
                if slot <> 34095 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:381
//# Page 381
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:382
//		QXCH	QPLACE
// PORT: Fixed ROM slots 34096.
                if slot <> 34096 or instruction <> 9999 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 783, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34098 {
            if slot <= 34097 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:383
//SHOW1		CA	POSITON
// PORT: Fixed ROM slots 34097.
                if slot <> 34097 or instruction <> 13070 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 782).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:384
//		TS	DSPTEM2 +2
// PORT: Fixed ROM slots 34098.
                if slot <> 34098 or instruction <> 23082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23082, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34099 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:385
//		CA	VB06N98
// PORT: Fixed ROM slots 34099.
                if slot <> 34099 or instruction <> 13626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1338), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:386
//		TC	BANKCALL
// PORT: Fixed ROM slots 34100.
                if slot <> 34100 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2260] to agcAotUnit2260@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:387
//		CADR	GOFLASH
// PORT: Fixed ROM slots 34101.
    34101, 17020
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34102–34104.
function agcAotUnit2261 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34102 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:388
//		TC	ENDTEST1	# V34
// PORT: Fixed ROM slots 34102.
        if slot <> 34102 or instruction <> 1208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34103 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:389
//		TC	QPLACE		# V33
// PORT: Fixed ROM slots 34103.
            if slot <> 34103 or instruction <> 783 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 783, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:390
//		TCF	SHOW1
// PORT: Fixed ROM slots 34104.
            if slot <> 34104 or instruction <> 5425 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5425, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2261] to agcAotUnit2261@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:391
//
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:392
//3990DEC		DEC	3990
// PORT: Fixed ROM slots 34105.
    34105, 7980,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:393
//VB06N98		VN	0698
// PORT: Fixed ROM slots 34106.
    34106, 1732,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:394
//VN0641		VN	0641
// PORT: Fixed ROM slots 34107.
    34107, 1618,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:395
//DEC17		=	ND1
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:396
//DEC58		DEC	58
// PORT: Fixed ROM slots 34108.
    34108, 116,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:397
//OGCPL		ECADR	OGC
// PORT: Fixed ROM slots 34109.
    34109, 3006,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:398
//1SECX		=	1SEC
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:399
//XNBADR		GENADR	XNB
// PORT: Fixed ROM slots 34110.
    34110, 1896,
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:400
//XSMADR		GENADR	XSM
// PORT: Fixed ROM slots 34111.
    34111, 1860
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4162–4179.
function agcAotUnit149 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4170 {
        if slot <= 4165 {
            if slot <= 4163 {
                if slot <= 4162 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:401
//		BLOCK	2
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:402
//		COUNT*	$$/P07
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:403
//FINETIME	INHINT			# RETURNS WITH INTERRUPT INHIBITED
// PORT: Fixed ROM slots 4162.
                    if slot <> 4162 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:404
//		EXTEND
// PORT: Fixed ROM slots 4163.
                    if slot <> 4163 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4164 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:405
//		READ	LOSCALAR
// PORT: Fixed ROM slots 4164.
                    if slot <> 4164 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:406
//		TS	L
// PORT: Fixed ROM slots 4165.
                    if slot <> 4165 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4167 {
                if slot <= 4166 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:407
//		EXTEND
// PORT: Fixed ROM slots 4166.
                    if slot <> 4166 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:408
//		RXOR	LOSCALAR
// PORT: Fixed ROM slots 4167.
                    if slot <> 4167 or instruction <> 3076 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4168 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:409
//		EXTEND
// PORT: Fixed ROM slots 4168.
                    if slot <> 4168 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4169 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:410
//		BZF	+4
// PORT: Fixed ROM slots 4169.
                        if slot <> 4169 or instruction <> 6221 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6221, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:411
//		EXTEND
// PORT: Fixed ROM slots 4170.
                        if slot <> 4170 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 4174 {
            if slot <= 4172 {
                if slot <= 4171 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:412
//		READ	LOSCALAR
// PORT: Fixed ROM slots 4171.
                    if slot <> 4171 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:413
//		TS	L
// PORT: Fixed ROM slots 4172.
                    if slot <> 4172 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4173 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:414
// +4		CS	POSMAX
// PORT: Fixed ROM slots 4173.
                    if slot <> 4173 or instruction <> 18907 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:415
//		AD	L
// PORT: Fixed ROM slots 4174.
                    if slot <> 4174 or instruction <> 24577 { return choose false if checkOnly else -1. }
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
            if slot <= 4176 {
                if slot <= 4175 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:416
//		EXTEND
// PORT: Fixed ROM slots 4175.
                    if slot <> 4175 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:417
//		BZF	FINETIME +1
// PORT: Fixed ROM slots 4176.
                    if slot <> 4176 or instruction <> 6211 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6211, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4177 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:418
//		EXTEND
// PORT: Fixed ROM slots 4177.
                    if slot <> 4177 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4178 {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:419
//		READ	HISCALAR
// PORT: Fixed ROM slots 4178.
                        if slot <> 4178 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 3, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:420
//		TC Q
// PORT: Fixed ROM slots 4179.
                        if slot <> 4179 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[149] to agcAotUnit149@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE IMU_PERFORMANCE_TEST_2.agc:421
//
