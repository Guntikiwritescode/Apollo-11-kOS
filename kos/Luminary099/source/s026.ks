// IMU_COMPENSATION_PACKAGE.agc
// bank 06, slots 8883-8892
function agcAotUnit517 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8887 {
        if slot <= 8884 {
            if slot <= 8883 {
// IMU_COMPENSATION_PACKAGE.agc:1
//# Copyright:	Public domain.
// IMU_COMPENSATION_PACKAGE.agc:2
//# Filename:	IMU_COMPENSATION_PACKAGE.agc
// IMU_COMPENSATION_PACKAGE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// IMU_COMPENSATION_PACKAGE.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// IMU_COMPENSATION_PACKAGE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// IMU_COMPENSATION_PACKAGE.agc:6
//# Assembler:	yaYUL
// IMU_COMPENSATION_PACKAGE.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// IMU_COMPENSATION_PACKAGE.agc:8
//# Website:	www.ibiblio.org/apollo.
// IMU_COMPENSATION_PACKAGE.agc:9
//# Pages:	326-337
// IMU_COMPENSATION_PACKAGE.agc:10
//# Mod history:	2009-05-16 RSB	Adapted from the corresponding
// IMU_COMPENSATION_PACKAGE.agc:11
//#				Luminary131 file, using page
// IMU_COMPENSATION_PACKAGE.agc:12
//#				images from Luminary 1A.
// IMU_COMPENSATION_PACKAGE.agc:13
//#		2009-06-07 RSB	Corrected a typo.
// IMU_COMPENSATION_PACKAGE.agc:14
//#
// IMU_COMPENSATION_PACKAGE.agc:15
//# This source code has been transcribed or otherwise adapted from
// IMU_COMPENSATION_PACKAGE.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// IMU_COMPENSATION_PACKAGE.agc:17
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// IMU_COMPENSATION_PACKAGE.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// IMU_COMPENSATION_PACKAGE.agc:19
//# in storage size and consequent reduction in image quality as well) are
// IMU_COMPENSATION_PACKAGE.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// IMU_COMPENSATION_PACKAGE.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// IMU_COMPENSATION_PACKAGE.agc:22
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// IMU_COMPENSATION_PACKAGE.agc:23
//# actually created.
// IMU_COMPENSATION_PACKAGE.agc:24
//#
// IMU_COMPENSATION_PACKAGE.agc:25
//# Notations on the hardcopy document read, in part:
// IMU_COMPENSATION_PACKAGE.agc:26
//#
// IMU_COMPENSATION_PACKAGE.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// IMU_COMPENSATION_PACKAGE.agc:28
//#	16:27 JULY 14, 1969
// IMU_COMPENSATION_PACKAGE.agc:29
//
// IMU_COMPENSATION_PACKAGE.agc:30
//# Page 326
// IMU_COMPENSATION_PACKAGE.agc:31
//		BANK	7
// IMU_COMPENSATION_PACKAGE.agc:32
//		SETLOC	IMUCOMP
// IMU_COMPENSATION_PACKAGE.agc:33
//		BANK
// IMU_COMPENSATION_PACKAGE.agc:34
//
// IMU_COMPENSATION_PACKAGE.agc:35
//		EBANK=	NBDX
// IMU_COMPENSATION_PACKAGE.agc:36
//
// IMU_COMPENSATION_PACKAGE.agc:37
//		COUNT*	$$/ICOMP
// IMU_COMPENSATION_PACKAGE.agc:38
//1/PIPA		CAF	LGCOMP		# SAVE EBANK OF CALLING PROGRAM
// slot 8883
                if slot <> 8883 or instruction <> 14169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1881), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:39
//		XCH	EBANK
// slot 8884
                if slot <> 8884 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8885 {
// IMU_COMPENSATION_PACKAGE.agc:40
//		TS	MODE
// slot 8885
                if slot <> 8885 or instruction <> 22643 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22643, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8886 {
// IMU_COMPENSATION_PACKAGE.agc:41
//
// IMU_COMPENSATION_PACKAGE.agc:42
//		CCS	GCOMPSW		# BYPASS IF GCOMPSW NEGATIVE
// slot 8886
                    if slot <> 8886 or instruction <> 4927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:43
//		TCF	+3
// slot 8887
                    if slot <> 8887 or instruction <> 5818 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5818, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8889 {
            if slot <= 8888 {
// IMU_COMPENSATION_PACKAGE.agc:44
//		TCF	+2
// slot 8888
                if slot <> 8888 or instruction <> 5818 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5818, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:45
//		TCF	IRIG1		# RETURN
// slot 8889
                if slot <> 8889 or instruction <> 5867 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5867, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8890 {
// IMU_COMPENSATION_PACKAGE.agc:46
//
// IMU_COMPENSATION_PACKAGE.agc:47
//1/PIPA1		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// slot 8890
                if slot <> 8890 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8891 {
// IMU_COMPENSATION_PACKAGE.agc:48
//		TS	BUF +2
// slot 8891
                    if slot <> 8891 or instruction <> 22618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:49
//
// IMU_COMPENSATION_PACKAGE.agc:50
//		INDEX	BUF +2
// slot 8892
                    if slot <> 8892 or instruction <> 20570 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20570, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20570, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[517] to agcAotUnit517@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:51
//		CA	PIPASCF		# (P.P.M.) X 2(-9)
// slot 8893
    8893, 26198
)).

// bank 06, slots 8894-8895
function agcAotUnit518 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8894 {
// IMU_COMPENSATION_PACKAGE.agc:52
//		EXTEND
// slot 8894
        if slot <> 8894 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_COMPENSATION_PACKAGE.agc:53
//		INDEX	BUF +2
// slot 8895
        if slot <> 8895 or instruction <> 20570 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20570, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20570, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[518] to agcAotUnit518@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:54
//		MP	DELVX		# (PP) X 2(+14) NOW (PIPA PULSES) X 2(+5)
// slot 8896
    8896, 57768
)).

// bank 06, slots 8897-8901
function agcAotUnit519 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8898 {
        if slot <= 8897 {
// IMU_COMPENSATION_PACKAGE.agc:55
//		TS	Q		# SAVE MAJOR PART
// slot 8897
            if slot <> 8897 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:56
//
// IMU_COMPENSATION_PACKAGE.agc:57
//		CA	L		# MINOR PART
// slot 8898
            if slot <> 8898 or instruction <> 12289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8899 {
// IMU_COMPENSATION_PACKAGE.agc:58
//		EXTEND
// slot 8899
            if slot <> 8899 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8900 {
// IMU_COMPENSATION_PACKAGE.agc:59
//		MP	BIT6		# SCALE 2(+9)   SHIFT RIGHT 9
// slot 8900
                if slot <> 8900 or instruction <> 31206 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2534, readEffective:call(words, 2534)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:60
//		INDEX 	BUF +2
// slot 8901
                if slot <> 8901 or instruction <> 20570 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20570, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20570, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[519] to agcAotUnit519@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:61
//		TS	DELVX +1	# FRACTIONAL PIPA PULSES SCALED 2(+14)
// slot 8902
    8902, 45482
)).

// bank 06, slots 8903-8906
function agcAotUnit520 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8904 {
        if slot <= 8903 {
// IMU_COMPENSATION_PACKAGE.agc:62
//
// IMU_COMPENSATION_PACKAGE.agc:63
//		CA	Q		# MAJOR PART
// slot 8903
            if slot <> 8903 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:64
//		EXTEND
// slot 8904
            if slot <> 8904 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8905 {
// IMU_COMPENSATION_PACKAGE.agc:65
//		MP	BIT6		# SCALE 2(+9)	SHIFT RIGHT 9
// slot 8905
            if slot <> 8905 or instruction <> 31206 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2534, readEffective:call(words, 2534)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:66
//		INDEX	BUF  +2
// slot 8906
            if slot <> 8906 or instruction <> 20570 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20570, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20570, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[520] to agcAotUnit520@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:67
//		DAS	DELVX		# (PIPAI) + (PIPAI)(SFE)
// slot 8907
    8907, 16810
)).

// bank 06, slots 8908-8908
function agcAotUnit521 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_COMPENSATION_PACKAGE.agc:68
//
// IMU_COMPENSATION_PACKAGE.agc:69
//		INDEX	BUF +2
// slot 8908
    if slot <> 8908 or instruction <> 20570 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20570, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20570, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[521] to agcAotUnit521@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:70
//		CS	PIPABIAS	# (PIPA PULSES)/(CS) X 2(-5)		 *
// slot 8909
    8909, 34388
)).

// bank 06, slots 8910-8914
function agcAotUnit522 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8911 {
        if slot <= 8910 {
// IMU_COMPENSATION_PACKAGE.agc:71
//		EXTEND
// slot 8910
            if slot <> 8910 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:72
//		MP	1/PIPADT	# (CS) X 2(+8)  NOW (PIPA PULSES) X 2(+3)*
// slot 8911
            if slot <> 8911 or instruction <> 29245 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 573, readEffective:call(words, 573)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8912 {
// IMU_COMPENSATION_PACKAGE.agc:73
//		EXTEND
// slot 8912
            if slot <> 8912 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8913 {
// IMU_COMPENSATION_PACKAGE.agc:74
//		MP	BIT4		# SCALE 2(+11)  SHIFT RIGHT 11		 *
// slot 8913
                if slot <> 8913 or instruction <> 31208 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:75
//		INDEX	BUF +2
// slot 8914
                if slot <> 8914 or instruction <> 20570 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20570, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20570, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[522] to agcAotUnit522@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:76
//		DAS	DELVX		# (PIPAI) + (PIPAI)(SFE) - (BIAS)(DELTAT)
// slot 8915
    8915, 16810
)).

// bank 06, slots 8916-8935
function agcAotUnit523 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8925 {
        if slot <= 8920 {
            if slot <= 8917 {
                if slot <= 8916 {
// IMU_COMPENSATION_PACKAGE.agc:77
//
// IMU_COMPENSATION_PACKAGE.agc:78
//		CCS	BUF 	+2	# PIPAZ, PIPAY, PIPAX
// slot 8916
                    if slot <> 8916 or instruction <> 4186 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 90).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:79
//		AD	NEG1
// slot 8917
                    if slot <> 8917 or instruction <> 28647 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8918 {
// IMU_COMPENSATION_PACKAGE.agc:80
//		TCF	1/PIPA1	+1
// slot 8918
                    if slot <> 8918 or instruction <> 5819 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5819, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8919 {
// IMU_COMPENSATION_PACKAGE.agc:81
//# Page 327
// IMU_COMPENSATION_PACKAGE.agc:82
//		NOOP			# LESS THAN ZERO IMPOSSIBLE
// slot 8919
                        if slot <> 8919 or instruction <> 5848 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5848, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:83
//
// IMU_COMPENSATION_PACKAGE.agc:84
//# Page 328
// IMU_COMPENSATION_PACKAGE.agc:85
//IRIGCOMP	TS	GCOMPSW		# INDICATE COMMANDS 2 PULSES OR LESS.
// slot 8920
                        if slot <> 8920 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8922 {
                if slot <= 8921 {
// IMU_COMPENSATION_PACKAGE.agc:86
//		TS	BUF		# INDEX COUNTER .  IRIGX, IRIGY, IRIGZ.
// slot 8921
                    if slot <> 8921 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:87
//
// IMU_COMPENSATION_PACKAGE.agc:88
//		TC	IRIGX		# COMPENSATE ACCELERATION TERMS
// slot 8922
                    if slot <> 8922 or instruction <> 1774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1774, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8923 {
// IMU_COMPENSATION_PACKAGE.agc:89
//
// IMU_COMPENSATION_PACKAGE.agc:90
//		CS	NBDX		# (GYRO PULSES)/(CS) X 2(-5)
// slot 8923
                    if slot <> 8923 or instruction <> 17200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 816).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8924 {
// IMU_COMPENSATION_PACKAGE.agc:91
//		TC	DRIFTSUB	# -(NBOX)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 8924
                        if slot <> 8924 or instruction <> 1836 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1836, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:92
//
// IMU_COMPENSATION_PACKAGE.agc:93
//		TC	IRIGY		# COMPENSATE ACCELERATION TERMS
// slot 8925
                        if slot <> 8925 or instruction <> 1787 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1787, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8930 {
            if slot <= 8927 {
                if slot <= 8926 {
// IMU_COMPENSATION_PACKAGE.agc:94
//
// IMU_COMPENSATION_PACKAGE.agc:95
//		CS	NBDY		# (GYRO PULSES)/(CS) X 2(-5)
// slot 8926
                    if slot <> 8926 or instruction <> 17201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 817).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:96
//		TC	DRIFTSUB	# -(NBDY)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 8927
                    if slot <> 8927 or instruction <> 1836 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1836, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8928 {
// IMU_COMPENSATION_PACKAGE.agc:97
//
// IMU_COMPENSATION_PACKAGE.agc:98
//		TC	IRIGZ		# COMPENSATE ACCELERATION TERMS
// slot 8928
                    if slot <> 8928 or instruction <> 1800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1800, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8929 {
// IMU_COMPENSATION_PACKAGE.agc:99
//
// IMU_COMPENSATION_PACKAGE.agc:100
//		CA	NBDZ		# (GYRO PULSES)/(CS) X 2(-5)
// slot 8929
                        if slot <> 8929 or instruction <> 13106 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 818).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:101
//		TC	DRIFTSUB	# +(NBDZ)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 8930
                        if slot <> 8930 or instruction <> 1836 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1836, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8932 {
                if slot <= 8931 {
// IMU_COMPENSATION_PACKAGE.agc:102
//
// IMU_COMPENSATION_PACKAGE.agc:103
//		CCS	GCOMPSW		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// slot 8931
                    if slot <> 8931 or instruction <> 4927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:104
//		TCF	+2		# YES  SEND OUT GYRO TORQUING COMMANDS.
// slot 8932
                    if slot <> 8932 or instruction <> 5862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8933 {
// IMU_COMPENSATION_PACKAGE.agc:105
//		TCF	IRIG1		# NO  RETURN
// slot 8933
                    if slot <> 8933 or instruction <> 5867 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5867, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8934 {
// IMU_COMPENSATION_PACKAGE.agc:106
//
// IMU_COMPENSATION_PACKAGE.agc:107
//		CA	PRIO21		# PRIO GREATER THAN SERVICER
// slot 8934
                        if slot <> 8934 or instruction <> 14873 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2585), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:108
//		TC	NOVAC		# SEND OUT GYRO TORQUING COMMANDS.
// slot 8935
                        if slot <> 8935 or instruction <> 2618 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2618, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[523] to agcAotUnit523@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:109
//		EBANK=	NBDX
// IMU_COMPENSATION_PACKAGE.agc:110
//		2CADR	1/GYRO
// slot 8936 8937
    8936, 3726, 8937, 12390
)).

// bank 06, slots 8938-8994
function agcAotUnit524 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8965 {
        if slot <= 8951 {
            if slot <= 8944 {
                if slot <= 8940 {
                    if slot <= 8938 {
// IMU_COMPENSATION_PACKAGE.agc:111
//
// IMU_COMPENSATION_PACKAGE.agc:112
//		RELINT
// slot 8938
                        if slot <> 8938 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8939 {
// IMU_COMPENSATION_PACKAGE.agc:113
//IRIG1		CA	MODE		# RESTORE CALLERS EBANK
// slot 8939
                            if slot <> 8939 or instruction <> 12403 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 115).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:114
//		TS	EBANK
// slot 8940
                            if slot <> 8940 or instruction <> 22531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8942 {
                        if slot <= 8941 {
// IMU_COMPENSATION_PACKAGE.agc:115
//		TCF	SWRETURN
// slot 8941
                            if slot <> 8941 or instruction <> 6553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6553, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:116
//
// IMU_COMPENSATION_PACKAGE.agc:117
//# Page 329
// IMU_COMPENSATION_PACKAGE.agc:118
//IRIGX		EXTEND
// slot 8942
                            if slot <> 8942 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8943 {
// IMU_COMPENSATION_PACKAGE.agc:119
//		QXCH	MPAC +2	        # SAVE Q
// slot 8943
                            if slot <> 8943 or instruction <> 9326 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 110, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:120
//		EXTEND
// slot 8944
                            if slot <> 8944 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8947 {
                    if slot <= 8945 {
// IMU_COMPENSATION_PACKAGE.agc:121
//		DCS	DELVX		# (PIPA PULSES) X 2(+14)
// slot 8945
                        if slot <> 8945 or instruction <> 16597 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 213, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8946 {
// IMU_COMPENSATION_PACKAGE.agc:122
//		DXCH	MPAC
// slot 8946
                            if slot <> 8946 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:123
//		CA	ADIAX		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)     *
// slot 8947
                            if slot <> 8947 or instruction <> 13107 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 819).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8949 {
                        if slot <= 8948 {
// IMU_COMPENSATION_PACKAGE.agc:124
//		TC	GCOMPSUB	# -(ADIAX)(PIPAX)   (GYRO PULSES) X 2(+14)
// slot 8948
                            if slot <> 8948 or instruction <> 1813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1813, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:125
//
// IMU_COMPENSATION_PACKAGE.agc:126
//		EXTEND			#
// slot 8949
                            if slot <> 8949 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8950 {
// IMU_COMPENSATION_PACKAGE.agc:127
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// slot 8950
                            if slot <> 8950 or instruction <> 16599 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 215, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:128
//		DXCH	MPAC		#
// slot 8951
                            if slot <> 8951 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8958 {
                if slot <= 8954 {
                    if slot <= 8952 {
// IMU_COMPENSATION_PACKAGE.agc:129
//		CS	ADSRAX		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// slot 8952
                        if slot <> 8952 or instruction <> 17206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 822).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8953 {
// IMU_COMPENSATION_PACKAGE.agc:130
//		TC	GCOMPSUB	# +(ADSRAX)(PIPAY)  (GYRO PULSES) X 2(+14)
// slot 8953
                            if slot <> 8953 or instruction <> 1813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1813, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:131
//
// IMU_COMPENSATION_PACKAGE.agc:132
//#		EXTEND		 # ***
// IMU_COMPENSATION_PACKAGE.agc:133
//#		DCS	DELVZ	 # ***    (PIPA PULSES) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:134
//#		DXCH	MPAC	 # ***
// IMU_COMPENSATION_PACKAGE.agc:135
//#		CA	ADOAX	 # ***    (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// IMU_COMPENSATION_PACKAGE.agc:136
//#		TC	GCOMPSUB # ***    -(ADOAX)(PIPAZ)   (GYRO PULSES) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:137
//
// IMU_COMPENSATION_PACKAGE.agc:138
//		TC	MPAC  +2
// slot 8954
                            if slot <> 8954 or instruction <> 110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 110, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8956 {
                        if slot <= 8955 {
// IMU_COMPENSATION_PACKAGE.agc:139
//
// IMU_COMPENSATION_PACKAGE.agc:140
//IRIGY		EXTEND
// slot 8955
                            if slot <> 8955 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:141
//		QXCH	MPAC  +2	# SAVE Q
// slot 8956
                            if slot <> 8956 or instruction <> 9326 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 110, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8957 {
// IMU_COMPENSATION_PACKAGE.agc:142
//		EXTEND
// slot 8957
                            if slot <> 8957 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:143
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// slot 8958
                            if slot <> 8958 or instruction <> 16599 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 215, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8961 {
                    if slot <= 8959 {
// IMU_COMPENSATION_PACKAGE.agc:144
//		DXCH	MPAC
// slot 8959
                        if slot <> 8959 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8960 {
// IMU_COMPENSATION_PACKAGE.agc:145
//		CA	ADIAY		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)     *
// slot 8960
                            if slot <> 8960 or instruction <> 13108 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 820).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:146
//		TC	GCOMPSUB	# -(ADIAY)(PIPAY)   (GYRO PULSES) X 2(+14)
// slot 8961
                            if slot <> 8961 or instruction <> 1813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1813, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8963 {
                        if slot <= 8962 {
// IMU_COMPENSATION_PACKAGE.agc:147
//
// IMU_COMPENSATION_PACKAGE.agc:148
//		EXTEND
// slot 8962
                            if slot <> 8962 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:149
//		DCS	DELVZ		# (PIPA PULSES) X 2(+14)
// slot 8963
                            if slot <> 8963 or instruction <> 16601 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 217, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8964 {
// IMU_COMPENSATION_PACKAGE.agc:150
//		DXCH	MPAC
// slot 8964
                            if slot <> 8964 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:151
//		CS	ADSRAY		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// slot 8965
                            if slot <> 8965 or instruction <> 17207 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 823).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8979 {
            if slot <= 8972 {
                if slot <= 8968 {
                    if slot <= 8966 {
// IMU_COMPENSATION_PACKAGE.agc:152
//		TC	GCOMPSUB	# +(ADSRAY)(PIPAZ)  (GYRO PULSES) X 2(+14)
// slot 8966
                        if slot <> 8966 or instruction <> 1813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1813, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8967 {
// IMU_COMPENSATION_PACKAGE.agc:153
//
// IMU_COMPENSATION_PACKAGE.agc:154
//#		EXTEND		 # ***
// IMU_COMPENSATION_PACKAGE.agc:155
//#		DCS	DELVX	 # ***    (PIPA PULSES) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:156
//#		DXCH	MPAC	 # ***
// IMU_COMPENSATION_PACKAGE.agc:157
//#		CA	ADOAY	 # ***    (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// IMU_COMPENSATION_PACKAGE.agc:158
//#		TC	GCOMPSUB # ***    -(ADOAY)(PIPAX)   (GYRO PULSES) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:159
//
// IMU_COMPENSATION_PACKAGE.agc:160
//		TC	MPAC +2
// slot 8967
                            if slot <> 8967 or instruction <> 110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 110, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:161
//
// IMU_COMPENSATION_PACKAGE.agc:162
//IRIGZ		EXTEND
// slot 8968
                            if slot <> 8968 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8970 {
                        if slot <= 8969 {
// IMU_COMPENSATION_PACKAGE.agc:163
//		QXCH	MPAC +2		# SAVE Q
// slot 8969
                            if slot <> 8969 or instruction <> 9326 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 110, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:164
//		EXTEND
// slot 8970
                            if slot <> 8970 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8971 {
// IMU_COMPENSATION_PACKAGE.agc:165
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// slot 8971
                            if slot <> 8971 or instruction <> 16599 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 215, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:166
//		DXCH	MPAC
// slot 8972
                            if slot <> 8972 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8975 {
                    if slot <= 8973 {
// IMU_COMPENSATION_PACKAGE.agc:167
//		CA	ADSRAZ		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// slot 8973
                        if slot <> 8973 or instruction <> 13112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 824).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8974 {
// IMU_COMPENSATION_PACKAGE.agc:168
//# Page 330
// IMU_COMPENSATION_PACKAGE.agc:169
//		TC	GCOMPSUB	# -(ADSRAZ)(PIPAY)  (GYRO PULSES) X 2(+14)
// slot 8974
                            if slot <> 8974 or instruction <> 1813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1813, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:170
//
// IMU_COMPENSATION_PACKAGE.agc:171
//		EXTEND
// slot 8975
                            if slot <> 8975 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8977 {
                        if slot <= 8976 {
// IMU_COMPENSATION_PACKAGE.agc:172
//		DCS	DELVZ		# (PIPA PULSES) X 2(+14)
// slot 8976
                            if slot <> 8976 or instruction <> 16601 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 217, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:173
//		DXCH	MPAC
// slot 8977
                            if slot <> 8977 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8978 {
// IMU_COMPENSATION_PACKAGE.agc:174
//		CA	ADIAZ		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// slot 8978
                            if slot <> 8978 or instruction <> 13109 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 821).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:175
//		TC	GCOMPSUB	# -(ADIAZ)(PIPAZ)   (GYRO PULSES) X 2(+14)
// slot 8979
                            if slot <> 8979 or instruction <> 1813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1813, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8986 {
                if slot <= 8982 {
                    if slot <= 8980 {
// IMU_COMPENSATION_PACKAGE.agc:176
//
// IMU_COMPENSATION_PACKAGE.agc:177
//#		EXTEND		 # ***
// IMU_COMPENSATION_PACKAGE.agc:178
//#		DCS	DELVX	 # ***	  (PIPA PULSE) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:179
//#		DXCH	MPAC	 # ***
// IMU_COMPENSATION_PACKAGE.agc:180
//#		CS	ADOAZ	 # ***	  (GYRO PULSES)/(PIPA PULSE) X 2(-6)     *
// IMU_COMPENSATION_PACKAGE.agc:181
//#		TC	GCOMPSUB # ***	  +(ADOAZ)(PIPAX)   (GYRO PULSES) X 2(+14)
// IMU_COMPENSATION_PACKAGE.agc:182
//
// IMU_COMPENSATION_PACKAGE.agc:183
//		TC	MPAC +2
// slot 8980
                        if slot <> 8980 or instruction <> 110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 110, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8981 {
// IMU_COMPENSATION_PACKAGE.agc:184
//
// IMU_COMPENSATION_PACKAGE.agc:185
//# Page 331
// IMU_COMPENSATION_PACKAGE.agc:186
//GCOMPSUB	XCH	MPAC		# ADIA OR ADSRA COEFFICIENT ARRIVES IN A
// slot 8981
                            if slot <> 8981 or instruction <> 23660 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 108, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:187
//		EXTEND			# C(MPAC) = (PIPA PULSES) X 2(+14)
// slot 8982
                            if slot <> 8982 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8984 {
                        if slot <= 8983 {
// IMU_COMPENSATION_PACKAGE.agc:188
//		MP	MPAC		# (GYRO PULSES)/(PIPA PULSE) X 2(-6)	 *
// slot 8983
                            if slot <> 8983 or instruction <> 28780 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 108, readEffective:call(words, 108)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:189
//		DXCH	VBUF		# NOW = (GYRO PULSES) X 2(+8)		 *
// slot 8984
                            if slot <> 8984 or instruction <> 21587 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 83, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8985 {
// IMU_COMPENSATION_PACKAGE.agc:190
//
// IMU_COMPENSATION_PACKAGE.agc:191
//		CA	MPAC +1		# MINOR PART OF PIPA PULSES
// slot 8985
                            if slot <> 8985 or instruction <> 12397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:192
//		EXTEND
// slot 8986
                            if slot <> 8986 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8990 {
                    if slot <= 8988 {
                        if slot <= 8987 {
// IMU_COMPENSATION_PACKAGE.agc:193
//		MP	MPAC		# ADIA OR ADSRA
// slot 8987
                            if slot <> 8987 or instruction <> 28780 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 108, readEffective:call(words, 108)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:194
//		TS	L
// slot 8988
                            if slot <> 8988 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8989 {
// IMU_COMPENSATION_PACKAGE.agc:195
//		CAF	ZERO
// slot 8989
                            if slot <> 8989 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:196
//		DAS	VBUF		# NOW = (GYRO PULSES) X 2(+8)		 *
// slot 8990
                            if slot <> 8990 or instruction <> 8275 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 83) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8992 {
                        if slot <= 8991 {
// IMU_COMPENSATION_PACKAGE.agc:197
//
// IMU_COMPENSATION_PACKAGE.agc:198
//		CA	VBUF		# PARTIAL RESULT - MAJOR
// slot 8991
                            if slot <> 8991 or instruction <> 12370 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 82).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:199
//		EXTEND
// slot 8992
                            if slot <> 8992 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8993 {
// IMU_COMPENSATION_PACKAGE.agc:200
//		MP	BIT9		# SCALE 2(+6)	   SHIFT RIGHT           *
// slot 8993
                            if slot <> 8993 or instruction <> 31203 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:201
//		INDEX	BUF		# RESULT = (GYRO PULSES) X 2(+14)
// slot 8994
                            if slot <> 8994 or instruction <> 20568 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20568, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20568, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[524] to agcAotUnit524@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:202
//		DAS	GCOMP		# HI(ADIA)(PIPAI)  OR  HI(ADSRA)(PIPAI)
// slot 8995
    8995, 18036
)).

// bank 06, slots 8996-9001
function agcAotUnit525 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8998 {
        if slot <= 8996 {
// IMU_COMPENSATION_PACKAGE.agc:203
//
// IMU_COMPENSATION_PACKAGE.agc:204
//		CA	VBUF +1		# PARTIAL RESULT - MINOR
// slot 8996
            if slot <> 8996 or instruction <> 12371 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 83).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8997 {
// IMU_COMPENSATION_PACKAGE.agc:205
//		EXTEND
// slot 8997
                if slot <> 8997 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:206
//		MP	BIT9		# SCALE 2(+6)	SHIFT RIGHT 6		 *
// slot 8998
                if slot <> 8998 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8999 {
// IMU_COMPENSATION_PACKAGE.agc:207
//		TS	L
// slot 8999
            if slot <> 8999 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9000 {
// IMU_COMPENSATION_PACKAGE.agc:208
//		CAF	ZERO
// slot 9000
                if slot <> 9000 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:209
//		INDEX	BUF		# RESULT = (GYRO PULSES) X 2(+14)
// slot 9001
                if slot <> 9001 or instruction <> 20568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[525] to agcAotUnit525@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:210
//		DAS	GCOMP		# (ADIA)(PIPAI) OR (ADSRA)(PIPAI)
// slot 9002
    9002, 18036
)).

// bank 06, slots 9003-9011
function agcAotUnit526 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9006 {
        if slot <= 9004 {
            if slot <= 9003 {
// IMU_COMPENSATION_PACKAGE.agc:211
//
// IMU_COMPENSATION_PACKAGE.agc:212
//		TC	Q
// slot 9003
                if slot <> 9003 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:213
//
// IMU_COMPENSATION_PACKAGE.agc:214
//# Page 332
// IMU_COMPENSATION_PACKAGE.agc:215
//DRIFTSUB	EXTEND
// slot 9004
                if slot <> 9004 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9005 {
// IMU_COMPENSATION_PACKAGE.agc:216
//		QXCH	BUF +1
// slot 9005
                if slot <> 9005 or instruction <> 9305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 89, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:217
//
// IMU_COMPENSATION_PACKAGE.agc:218
//		EXTEND			# C(A) = NBD	(GYRO PULSES)/(CS) X 2(-5)
// slot 9006
                if slot <> 9006 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9008 {
            if slot <= 9007 {
// IMU_COMPENSATION_PACKAGE.agc:219
//		MP	1/PIPADT	# (CS) X 2(+8)	 NOW (GYRO PULSES) X 2(+3)
// slot 9007
                if slot <> 9007 or instruction <> 29245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 573, readEffective:call(words, 573)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:220
//		LXCH	MPAC +1	        # SAVE FOR FRACTIONAL COMPENSATION
// slot 9008
                if slot <> 9008 or instruction <> 9325 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 109, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9009 {
// IMU_COMPENSATION_PACKAGE.agc:221
//		EXTEND
// slot 9009
                if slot <> 9009 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9010 {
// IMU_COMPENSATION_PACKAGE.agc:222
//		MP	BIT4		# SCALE 2(+11)	   SHIFT RIGHT 11
// slot 9010
                    if slot <> 9010 or instruction <> 31208 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:223
//		INDEX	BUF
// slot 9011
                    if slot <> 9011 or instruction <> 20568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20568, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20568, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[526] to agcAotUnit526@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:224
//		DAS	GCOMP		# HI(NBD)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 9012
    9012, 18036
)).

// bank 06, slots 9013-9018
function agcAotUnit527 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9015 {
        if slot <= 9013 {
// IMU_COMPENSATION_PACKAGE.agc:225
//
// IMU_COMPENSATION_PACKAGE.agc:226
//		CA	MPAC +1	        # NOW MINOR PART
// slot 9013
            if slot <> 9013 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 109).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9014 {
// IMU_COMPENSATION_PACKAGE.agc:227
//		EXTEND
// slot 9014
                if slot <> 9014 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:228
//		MP	BIT4		# SCALE 2(+11)	   SHIFT RIGHT 11
// slot 9015
                if slot <> 9015 or instruction <> 31208 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9016 {
// IMU_COMPENSATION_PACKAGE.agc:229
//		TS	L
// slot 9016
            if slot <> 9016 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9017 {
// IMU_COMPENSATION_PACKAGE.agc:230
//		CAF	ZERO
// slot 9017
                if slot <> 9017 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:231
//		INDEX	BUF		# ADD IN FRACTIONAL COMPENSATION
// slot 9018
                if slot <> 9018 or instruction <> 20568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[527] to agcAotUnit527@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:232
//		DAS	GCOMP		# (NBD)(DELTAT)     (GYRO PULSES) X 2(+14)
// slot 9019
    9019, 18036
)).

// bank 06, slots 9020-9022
function agcAotUnit528 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9020 {
// IMU_COMPENSATION_PACKAGE.agc:233
//
// IMU_COMPENSATION_PACKAGE.agc:234
//DRFTSUB2	CAF	TWO		# PIPAX, PIPAY, PIPAZ
// slot 9020
        if slot <> 9020 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9021 {
// IMU_COMPENSATION_PACKAGE.agc:235
//		AD	BUF
// slot 9021
            if slot <> 9021 or instruction <> 24664 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 88).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:236
//		XCH	BUF
// slot 9022
            if slot <> 9022 or instruction <> 23640 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 88, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[528] to agcAotUnit528@.

// bank 06, slots 9023-9023
function agcAotUnit529 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_COMPENSATION_PACKAGE.agc:237
//		INDEX	A
// slot 9023
    if slot <> 9023 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[529] to agcAotUnit529@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:238
//		CCS	GCOMP		# ARE GYRO COMMANDS 1 PULSE OR GREATER
// slot 9024
    9024, 9842
)).

// bank 06, slots 9025-9033
function agcAotUnit530 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9028 {
        if slot <= 9026 {
            if slot <= 9025 {
// IMU_COMPENSATION_PACKAGE.agc:239
//		TCF	+2		# YES
// slot 9025
                if slot <> 9025 or instruction <> 5955 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5955, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:240
//		TC	BUF +1	        # NO
// slot 9026
                if slot <> 9026 or instruction <> 89 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 89, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9027 {
// IMU_COMPENSATION_PACKAGE.agc:241
//
// IMU_COMPENSATION_PACKAGE.agc:242
//		MASK	COMPCHK		# DEC -1
// slot 9027
                if slot <> 9027 or instruction <> 30571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1899), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:243
//		CCS	A		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// slot 9028
                if slot <> 9028 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 9030 {
            if slot <= 9029 {
// IMU_COMPENSATION_PACKAGE.agc:244
//		TS	GCOMPSW		# YES - SET GCOMPSW POSITIVE
// slot 9029
                if slot <> 9029 or instruction <> 23359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:245
//		TC	BUF +1	        # NO
// slot 9030
                if slot <> 9030 or instruction <> 89 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 89, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9031 {
// IMU_COMPENSATION_PACKAGE.agc:246
//
// IMU_COMPENSATION_PACKAGE.agc:247
//# Page 333
// IMU_COMPENSATION_PACKAGE.agc:248
//1/GYRO		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// slot 9031
                if slot <> 9031 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9032 {
// IMU_COMPENSATION_PACKAGE.agc:249
//		TS	BUF
// slot 9032
                    if slot <> 9032 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:250
//
// IMU_COMPENSATION_PACKAGE.agc:251
//		INDEX	BUF		# SCALE GYRO COMMANDS FOR IMUPULSE
// slot 9033
                    if slot <> 9033 or instruction <> 20568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20568, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20568, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[530] to agcAotUnit530@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:252
//		CA	GCOMP  +1	# FRACTIONAL PULSES
// slot 9034
    9034, 26228
)).

// bank 06, slots 9035-9037
function agcAotUnit531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9035 {
// IMU_COMPENSATION_PACKAGE.agc:253
//		EXTEND
// slot 9035
        if slot <> 9035 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9036 {
// IMU_COMPENSATION_PACKAGE.agc:254
//		MP	BIT8		# SHIFT RIGHT 7
// slot 9036
            if slot <> 9036 or instruction <> 31204 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2532, readEffective:call(words, 2532)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:255
//		INDEX	BUF
// slot 9037
            if slot <> 9037 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[531] to agcAotUnit531@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:256
//		TS	GCOMP  +1	# FRACTIONAL PULSES SCALED
// slot 9038
    9038, 46708
)).

// bank 06, slots 9039-9040
function agcAotUnit532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9039 {
// IMU_COMPENSATION_PACKAGE.agc:257
//
// IMU_COMPENSATION_PACKAGE.agc:258
//		CAF	ZERO		# SET GCOMP = 0 FOR DAS INSTRUCTION
// slot 9039
        if slot <> 9039 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_COMPENSATION_PACKAGE.agc:259
//		INDEX	BUF
// slot 9040
        if slot <> 9040 or instruction <> 20568 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20568, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20568, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[532] to agcAotUnit532@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:260
//		XCH	GCOMP		# GYRO PULSES
// slot 9041
    9041, 48754
)).

// bank 06, slots 9042-9044
function agcAotUnit533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9042 {
// IMU_COMPENSATION_PACKAGE.agc:261
//		EXTEND
// slot 9042
        if slot <> 9042 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9043 {
// IMU_COMPENSATION_PACKAGE.agc:262
//		MP	BIT8		# SHIFT RIGHT 7
// slot 9043
            if slot <> 9043 or instruction <> 31204 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2532, readEffective:call(words, 2532)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:263
//		INDEX	BUF
// slot 9044
            if slot <> 9044 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[533] to agcAotUnit533@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:264
//		DAS	GCOMP		# ADD THESE TO FRACTIONAL PULSES ABOVE
// slot 9045
    9045, 18036
)).

// bank 06, slots 9046-9048
function agcAotUnit534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9046 {
// IMU_COMPENSATION_PACKAGE.agc:265
//
// IMU_COMPENSATION_PACKAGE.agc:266
//		CCS	BUF		# PIPAZ, PIPAY, PIPAX
// slot 9046
        if slot <> 9046 or instruction <> 4184 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 88).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9047 {
// IMU_COMPENSATION_PACKAGE.agc:267
//		AD	NEG1
// slot 9047
            if slot <> 9047 or instruction <> 28647 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:268
//		TCF	1/GYRO +1
// slot 9048
            if slot <> 9048 or instruction <> 5960 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5960, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[534] to agcAotUnit534@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:269
//LGCOMP		ECADR	GCOMP		# LESS THAN ZERO IMPOSSIBLE
// slot 9049
    9049, 1650
)).

// bank 06, slots 9050-9051
function agcAotUnit535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9050 {
// IMU_COMPENSATION_PACKAGE.agc:270
//
// IMU_COMPENSATION_PACKAGE.agc:271
//		CAF	LGCOMP
// slot 9050
        if slot <> 9050 or instruction <> 14169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1881), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_COMPENSATION_PACKAGE.agc:272
//		TC	BANKCALL
// slot 9051
        if slot <> 9051 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[535] to agcAotUnit535@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:273
//		CADR	IMUPULSE	# CALL GYRO TORQUING ROUTINE
// slot 9052
    9052, 15782
)).

// bank 06, slots 9053-9053
function agcAotUnit536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_COMPENSATION_PACKAGE.agc:274
//		TC	BANKCALL
// slot 9053
    if slot <> 9053 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[536] to agcAotUnit536@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:275
//		CADR	IMUSTALL	# WAIT FOR PULSES TO GET OUT
// slot 9054
    9054, 16284
)).

// bank 06, slots 9055-9058
function agcAotUnit537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9056 {
        if slot <= 9055 {
// IMU_COMPENSATION_PACKAGE.agc:276
//		TCF	ENDOFJOB	# TEMPORARY
// slot 9055
            if slot <> 9055 or instruction <> 6765 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6765, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:277
//
// IMU_COMPENSATION_PACKAGE.agc:278
//GCOMP1		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// slot 9056
            if slot <> 9056 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9057 {
// IMU_COMPENSATION_PACKAGE.agc:279
//		TS	BUF
// slot 9057
            if slot <> 9057 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:280
//
// IMU_COMPENSATION_PACKAGE.agc:281
//		INDEX	BUF		# RESCALE
// slot 9058
            if slot <> 9058 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[537] to agcAotUnit537@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:282
//		CA	GCOMP +1
// slot 9059
    9059, 26228
)).

// bank 06, slots 9060-9062
function agcAotUnit538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9060 {
// IMU_COMPENSATION_PACKAGE.agc:283
//		EXTEND
// slot 9060
        if slot <> 9060 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9061 {
// IMU_COMPENSATION_PACKAGE.agc:284
//		MP	BIT8		# SHIFT MINOR PART LEFT 7 - MAJOR PART = 0
// slot 9061
            if slot <> 9061 or instruction <> 31204 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2532, readEffective:call(words, 2532)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:285
//		INDEX	BUF
// slot 9062
            if slot <> 9062 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[538] to agcAotUnit538@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:286
//		LXCH	GCOMP +1	# BITS 8-14 OF MINOR PART WERE = 0
// slot 9063
    9063, 20084
)).

// bank 06, slots 9064-9066
function agcAotUnit539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9064 {
// IMU_COMPENSATION_PACKAGE.agc:287
//
// IMU_COMPENSATION_PACKAGE.agc:288
//		CCS	BUF		# PIPAZ, PIPAY, PIPAX
// slot 9064
        if slot <> 9064 or instruction <> 4184 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 88).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9065 {
// IMU_COMPENSATION_PACKAGE.agc:289
//		AD	NEG1
// slot 9065
            if slot <> 9065 or instruction <> 28647 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_COMPENSATION_PACKAGE.agc:290
//		TCF	GCOMP1 +1
// slot 9066
            if slot <> 9066 or instruction <> 5985 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5985, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[539] to agcAotUnit539@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:291
//COMPCHK		DEC	-1		# LESS THAN ZERO IMPOSSIBLE
// slot 9067
    9067, 65532
)).

// bank 06, slots 9068-9083
function agcAotUnit540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9075 {
        if slot <= 9071 {
            if slot <= 9069 {
                if slot <= 9068 {
// IMU_COMPENSATION_PACKAGE.agc:292
//		TCF	ENDOFJOB
// slot 9068
                    if slot <> 9068 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:293
//
// IMU_COMPENSATION_PACKAGE.agc:294
//# Page 334
// IMU_COMPENSATION_PACKAGE.agc:295
//NBDONLY		CCS	GCOMPSW		# BYPASS IF GCOMPSW NEGATIVE
// slot 9069
                    if slot <> 9069 or instruction <> 4927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9070 {
// IMU_COMPENSATION_PACKAGE.agc:296
//		TCF	+3
// slot 9070
                    if slot <> 9070 or instruction <> 6001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6001, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:297
//		TCF	+2
// slot 9071
                    if slot <> 9071 or instruction <> 6001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6001, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9073 {
                if slot <= 9072 {
// IMU_COMPENSATION_PACKAGE.agc:298
//		TCF	ENDOFJOB
// slot 9072
                    if slot <> 9072 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:299
//
// IMU_COMPENSATION_PACKAGE.agc:300
//		INHINT
// slot 9073
                    if slot <> 9073 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9074 {
// IMU_COMPENSATION_PACKAGE.agc:301
//		CCS	FLAGWRD2	# PREREAD T3RUPT MAY COINCIDE
// slot 9074
                    if slot <> 9074 or instruction <> 4158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:302
//		TCF	ENDOFJOB
// slot 9075
                    if slot <> 9075 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9079 {
            if slot <= 9077 {
                if slot <= 9076 {
// IMU_COMPENSATION_PACKAGE.agc:303
//		TCF	ENDOFJOB
// slot 9076
                    if slot <> 9076 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:304
//		TCF	+1
// slot 9077
                    if slot <> 9077 or instruction <> 6006 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6006, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9078 {
// IMU_COMPENSATION_PACKAGE.agc:305
//
// IMU_COMPENSATION_PACKAGE.agc:306
//		CA	FLAGWRD8	# IF SURFACE FLAG IS SET, SET TEM1
// slot 9078
                    if slot <> 9078 or instruction <> 12356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 68).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:307
//		MASK	BIT8		# POSITIVE SO THAT THE ACCELERATION TERMS
// slot 9079
                    if slot <> 9079 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        if fixedOperand = 128 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9081 {
                if slot <= 9080 {
// IMU_COMPENSATION_PACKAGE.agc:308
//		TS	TEM1		# WILL BE COMPENSATED.
// slot 9080
                    if slot <> 9080 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:309
//		EXTEND
// slot 9081
                    if slot <> 9081 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9082 {
// IMU_COMPENSATION_PACKAGE.agc:310
//		BZF	+3		# ARE WE ON THE SURFACE
// slot 9082
                    if slot <> 9082 or instruction <> 6013 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_COMPENSATION_PACKAGE.agc:311
//
// IMU_COMPENSATION_PACKAGE.agc:312
//		TC	IBNKCALL	# ON THE SURFACE
// slot 9083
                    if slot <> 9083 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[540] to agcAotUnit540@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:313
//		CADR	PIPASR +3	# READ PIPAS, BUT DO NOT SCALE THEM
// slot 9084
    9084, 65224
)).

// bank 06, slots 9085-9129
function agcAotUnit541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9106 {
        if slot <= 9095 {
            if slot <= 9089 {
                if slot <= 9086 {
                    if slot <= 9085 {
// IMU_COMPENSATION_PACKAGE.agc:314
//
// IMU_COMPENSATION_PACKAGE.agc:315
//		CA	TIME1		# (CS) X 2(+14)
// slot 9085
                        if slot <> 9085 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:316
//		XCH	1/PIPADT	# PREVIOUS TIME
// slot 9086
                        if slot <> 9086 or instruction <> 24125 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 573, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9087 {
// IMU_COMPENSATION_PACKAGE.agc:317
//		RELINT
// slot 9087
                        if slot <> 9087 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9088 {
// IMU_COMPENSATION_PACKAGE.agc:318
//		COM
// slot 9088
                            if slot <> 9088 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:319
//		AD	1/PIPADT	# PRESENT TIME - PREVIOUS TIME
// slot 9089
                            if slot <> 9089 or instruction <> 25149 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 573).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9092 {
                    if slot <= 9090 {
// IMU_COMPENSATION_PACKAGE.agc:320
//NBD2		AD	HALF		# CORRECT FOR POSSIBLE TIME1 TICK
// slot 9090
                        if slot <> 9090 or instruction <> 27102 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9091 {
// IMU_COMPENSATION_PACKAGE.agc:321
//		AD	HALF
// slot 9091
                            if slot <> 9091 or instruction <> 27102 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:322
//		XCH	L		# IF TIME1 DID NOT TICK, REMOVE RESULTING
// slot 9092
                            if slot <> 9092 or instruction <> 23553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 1, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9093 {
// IMU_COMPENSATION_PACKAGE.agc:323
//		XCH	L		# OVERFLOW.
// slot 9093
                        if slot <> 9093 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9094 {
// IMU_COMPENSATION_PACKAGE.agc:324
//
// IMU_COMPENSATION_PACKAGE.agc:325
//NBD3		EXTEND			# C(A) = DELTAT    (CS) X 2(+14)
// slot 9094
                            if slot <> 9094 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:326
//		MP	BIT10		# SHIFT RIGHT 5
// slot 9095
                            if slot <> 9095 or instruction <> 31202 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9100 {
                if slot <= 9097 {
                    if slot <= 9096 {
// IMU_COMPENSATION_PACKAGE.agc:327
//		DXCH	VBUF +2
// slot 9096
                        if slot <> 9096 or instruction <> 21589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 85, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:328
//
// IMU_COMPENSATION_PACKAGE.agc:329
//		CA	ZERO
// slot 9097
                        if slot <> 9097 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 9098 {
// IMU_COMPENSATION_PACKAGE.agc:330
//		TS	GCOMPSW		# INDICATE COMMANDS 2 PULSES OR LESS.
// slot 9098
                        if slot <> 9098 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9099 {
// IMU_COMPENSATION_PACKAGE.agc:331
//		TS	BUF		# INDEX  X, Y, Z.
// slot 9099
                            if slot <> 9099 or instruction <> 22616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22616, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:332
//
// IMU_COMPENSATION_PACKAGE.agc:333
//		CCS	TEM1		# IF SURFACE FLAG IS SET,
// slot 9100
                            if slot <> 9100 or instruction <> 4193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 97).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9103 {
                    if slot <= 9101 {
// IMU_COMPENSATION_PACKAGE.agc:334
//		TC	IRIGX		# COMPENSATE ACCELERATION TERMS.
// slot 9101
                        if slot <> 9101 or instruction <> 1774 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1774, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9102 {
// IMU_COMPENSATION_PACKAGE.agc:335
//
// IMU_COMPENSATION_PACKAGE.agc:336
//		EXTEND
// slot 9102
                            if slot <> 9102 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:337
//		DCA	VBUF +2
// slot 9103
                            if slot <> 9103 or instruction <> 12373 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 85, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9104 {
// IMU_COMPENSATION_PACKAGE.agc:338
//		DXCH	MPAC		# DELTAT NOW SCALED (CS) X 2(+19)
// slot 9104
                        if slot <> 9104 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9105 {
// IMU_COMPENSATION_PACKAGE.agc:339
//
// IMU_COMPENSATION_PACKAGE.agc:340
//		CS	NBDX		# (GYRO PULSES)/(CS) X 2(-5)
// slot 9105
                            if slot <> 9105 or instruction <> 17200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 816).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:341
//		TC	FBIASSUB	# -(NBDX)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 9106
                            if slot <> 9106 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 9117 {
            if slot <= 9111 {
                if slot <= 9108 {
                    if slot <= 9107 {
// IMU_COMPENSATION_PACKAGE.agc:342
//
// IMU_COMPENSATION_PACKAGE.agc:343
//		CCS	TEM1		# IF SURFACE FLAG IS SET,
// slot 9107
                        if slot <> 9107 or instruction <> 4193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 97).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:344
//		TC	IRIGY		# COMPENSATE ACCELERATION TERMS.
// slot 9108
                        if slot <> 9108 or instruction <> 1787 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1787, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9109 {
// IMU_COMPENSATION_PACKAGE.agc:345
//# Page 335
// IMU_COMPENSATION_PACKAGE.agc:346
//		EXTEND
// slot 9109
                        if slot <> 9109 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9110 {
// IMU_COMPENSATION_PACKAGE.agc:347
//		DCS	VBUF +2
// slot 9110
                            if slot <> 9110 or instruction <> 16469 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 85, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:348
//		DXCH	MPAC		# DELTAT SCALED (CS) X 2(+19)
// slot 9111
                            if slot <> 9111 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9114 {
                    if slot <= 9112 {
// IMU_COMPENSATION_PACKAGE.agc:349
//		CA	NBDY		# (GYRO PULSES)/(CS) X 2(-5)
// slot 9112
                        if slot <> 9112 or instruction <> 13105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 817).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9113 {
// IMU_COMPENSATION_PACKAGE.agc:350
//		TC	FBIASSUB	# -(NBDY)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 9113
                            if slot <> 9113 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:351
//
// IMU_COMPENSATION_PACKAGE.agc:352
//		CCS	TEM1		# IF SURFACE FLAG IS SET.
// slot 9114
                            if slot <> 9114 or instruction <> 4193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 97).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9115 {
// IMU_COMPENSATION_PACKAGE.agc:353
//		TC	IRIGZ		# COMPENSATE ACCELERATION TERMS
// slot 9115
                        if slot <> 9115 or instruction <> 1800 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1800, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9116 {
// IMU_COMPENSATION_PACKAGE.agc:354
//
// IMU_COMPENSATION_PACKAGE.agc:355
//		EXTEND
// slot 9116
                            if slot <> 9116 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:356
//		DCS	VBUF +2
// slot 9117
                            if slot <> 9117 or instruction <> 16469 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 85, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9123 {
                if slot <= 9120 {
                    if slot <= 9118 {
// IMU_COMPENSATION_PACKAGE.agc:357
//		DXCH	MPAC		# DELTAT SCALED (CS) X 2(+19)
// slot 9118
                        if slot <> 9118 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9119 {
// IMU_COMPENSATION_PACKAGE.agc:358
//		CS	NBDZ		# (GYRO PULSES)/(CS) X 2(-5)
// slot 9119
                            if slot <> 9119 or instruction <> 17202 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 818).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:359
//		TC	FBIASSUB	# +(NBDZ)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 9120
                            if slot <> 9120 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9121 {
// IMU_COMPENSATION_PACKAGE.agc:360
//
// IMU_COMPENSATION_PACKAGE.agc:361
//		CCS	GCOMPSW		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// slot 9121
                        if slot <> 9121 or instruction <> 4927 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 831).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9122 {
// IMU_COMPENSATION_PACKAGE.agc:362
//		TCF	1/GYRO		# YES
// slot 9122
                            if slot <> 9122 or instruction <> 5959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5959, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:363
//		TCF	ENDOFJOB	# NO
// slot 9123
                            if slot <> 9123 or instruction <> 6765 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6765, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9126 {
                    if slot <= 9124 {
// IMU_COMPENSATION_PACKAGE.agc:364
//
// IMU_COMPENSATION_PACKAGE.agc:365
//# Page 336
// IMU_COMPENSATION_PACKAGE.agc:366
//FBIASSUB	XCH	Q
// slot 9124
                        if slot <> 9124 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9125 {
// IMU_COMPENSATION_PACKAGE.agc:367
//		TS	BUF +1
// slot 9125
                            if slot <> 9125 or instruction <> 22617 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22617, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:368
//
// IMU_COMPENSATION_PACKAGE.agc:369
//		CA	Q		# NBD SCALED (GYRO PULSES)/(CS) X 2(-5)
// slot 9126
                            if slot <> 9126 or instruction <> 12290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9127 {
// IMU_COMPENSATION_PACKAGE.agc:370
//		EXTEND
// slot 9127
                        if slot <> 9127 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9128 {
// IMU_COMPENSATION_PACKAGE.agc:371
//		MP	MPAC		# DELTAT SCALED (CS) X 2(+19)
// slot 9128
                            if slot <> 9128 or instruction <> 28780 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 108, readEffective:call(words, 108)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_COMPENSATION_PACKAGE.agc:372
//		INDEX	BUF
// slot 9129
                            if slot <> 9129 or instruction <> 20568 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20568, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20568, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[541] to agcAotUnit541@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:373
//		DAS	GCOMP		# HI(NBD)(DELTAT)   (GYRO PULSES) X 2(+14)
// slot 9130
    9130, 18036
)).

// bank 06, slots 9131-9136
function agcAotUnit542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9133 {
        if slot <= 9131 {
// IMU_COMPENSATION_PACKAGE.agc:374
//
// IMU_COMPENSATION_PACKAGE.agc:375
//		CA	Q		# NOW FRACTIONAL PART
// slot 9131
            if slot <> 9131 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9132 {
// IMU_COMPENSATION_PACKAGE.agc:376
//		EXTEND
// slot 9132
                if slot <> 9132 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:377
//		MP	MPAC +1
// slot 9133
                if slot <> 9133 or instruction <> 28781 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 109, readEffective:call(words, 109)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9134 {
// IMU_COMPENSATION_PACKAGE.agc:378
//		TS	L
// slot 9134
            if slot <> 9134 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9135 {
// IMU_COMPENSATION_PACKAGE.agc:379
//		CAF	ZERO
// slot 9135
                if slot <> 9135 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_COMPENSATION_PACKAGE.agc:380
//		INDEX	BUF
// slot 9136
                if slot <> 9136 or instruction <> 20568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[542] to agcAotUnit542@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:381
//		DAS	GCOMP		# (NBD)(DELTAT)     (GYRO PULSES) X 2(+14)
// slot 9137
    9137, 18036
)).

// bank 06, slots 9138-9139
function agcAotUnit543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9138 {
// IMU_COMPENSATION_PACKAGE.agc:382
//
// IMU_COMPENSATION_PACKAGE.agc:383
//		TCF	DRFTSUB2	# CHECK MAGNITUDE OF COMPENSATION
// slot 9138
        if slot <> 9138 or instruction <> 5948 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5948, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_COMPENSATION_PACKAGE.agc:384
//
// IMU_COMPENSATION_PACKAGE.agc:385
//LASTBIAS	TC	BANKCALL
// slot 9139
        if slot <> 9139 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[543] to agcAotUnit543@.

agcAotInstallSourceRope(list(
// IMU_COMPENSATION_PACKAGE.agc:386
//		CADR	PIPUSE1
// slot 9140
    9140, 15742
)).

// bank 06, slots 9141-9164
function agcAotUnit544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9152 {
        if slot <= 9146 {
            if slot <= 9143 {
                if slot <= 9141 {
// IMU_COMPENSATION_PACKAGE.agc:387
//
// IMU_COMPENSATION_PACKAGE.agc:388
//		CCS	GCOMPSW
// slot 9141
                    if slot <> 9141 or instruction <> 4927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9142 {
// IMU_COMPENSATION_PACKAGE.agc:389
//		TCF	+3
// slot 9142
                        if slot <> 9142 or instruction <> 6073 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6073, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:390
//		TCF	+2
// slot 9143
                        if slot <> 9143 or instruction <> 6073 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6073, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9144 {
// IMU_COMPENSATION_PACKAGE.agc:391
//		TCF	ENDOFJOB
// slot 9144
                    if slot <> 9144 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9145 {
// IMU_COMPENSATION_PACKAGE.agc:392
//
// IMU_COMPENSATION_PACKAGE.agc:393
//		CA	FLAGWRD8	# IF SURFACE FLAG IS SET, SET TEM1
// slot 9145
                        if slot <> 9145 or instruction <> 12356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 68).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:394
//		MASK	SURFFBIT	# POSITIVE SO THAT THE ACCELERATION TERMS
// slot 9146
                        if slot <> 9146 or instruction <> 31204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            if fixedOperand = 128 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9149 {
                if slot <= 9147 {
// IMU_COMPENSATION_PACKAGE.agc:395
//		TS	TEM1		# WILL BE COMPENSATED.
// slot 9147
                    if slot <> 9147 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9148 {
// IMU_COMPENSATION_PACKAGE.agc:396
//
// IMU_COMPENSATION_PACKAGE.agc:397
//		CAF	PRIO31		# 2 SECONDS SCALED (CS) X 2(+8)
// slot 9148
                        if slot <> 9148 or instruction <> 16334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:398
//		XCH	1/PIPADT
// slot 9149
                        if slot <> 9149 or instruction <> 24125 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 573, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9150 {
// IMU_COMPENSATION_PACKAGE.agc:399
//		COM
// slot 9150
                    if slot <> 9150 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9151 {
// IMU_COMPENSATION_PACKAGE.agc:400
//		AD	PIPTIME +1
// slot 9151
                        if slot <> 9151 or instruction <> 25245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 669).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:401
//		TCF	NBD2
// slot 9152
                        if slot <> 9152 or instruction <> 6018 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6018, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9158 {
            if slot <= 9155 {
                if slot <= 9153 {
// IMU_COMPENSATION_PACKAGE.agc:402
//
// IMU_COMPENSATION_PACKAGE.agc:403
//GCOMPZER	CAF	LGCOMP		# ROUTINE TO ZERO GCOMP BEFORE FIRST
// slot 9153
                    if slot <> 9153 or instruction <> 14169 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1881), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9154 {
// IMU_COMPENSATION_PACKAGE.agc:404
//		XCH	EBANK		# CALL TO 1/PIPA
// slot 9154
                        if slot <> 9154 or instruction <> 23555 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 3, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:405
//		TS	MODE
// slot 9155
                        if slot <> 9155 or instruction <> 22643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9156 {
// IMU_COMPENSATION_PACKAGE.agc:406
//
// IMU_COMPENSATION_PACKAGE.agc:407
//		CAF	ZERO
// slot 9156
                    if slot <> 9156 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9157 {
// IMU_COMPENSATION_PACKAGE.agc:408
//		TS	GCOMPSW
// slot 9157
                        if slot <> 9157 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:409
//		TS	GCOMP
// slot 9158
                        if slot <> 9158 or instruction <> 23353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23353, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9161 {
                if slot <= 9159 {
// IMU_COMPENSATION_PACKAGE.agc:410
//		TS	GCOMP +1
// slot 9159
                    if slot <> 9159 or instruction <> 23354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9160 {
// IMU_COMPENSATION_PACKAGE.agc:411
//		TS	GCOMP +2
// slot 9160
                        if slot <> 9160 or instruction <> 23355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23355, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:412
//		TS	GCOMP +3
// slot 9161
                        if slot <> 9161 or instruction <> 23356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23356, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9162 {
// IMU_COMPENSATION_PACKAGE.agc:413
//		TS	GCOMP +4
// slot 9162
                    if slot <> 9162 or instruction <> 23357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23357, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9163 {
// IMU_COMPENSATION_PACKAGE.agc:414
//# Page 337
// IMU_COMPENSATION_PACKAGE.agc:415
//		TS	GCOMP +5
// slot 9163
                        if slot <> 9163 or instruction <> 23358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23358, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_COMPENSATION_PACKAGE.agc:416
//
// IMU_COMPENSATION_PACKAGE.agc:417
//		TCF	IRIG1		# RESTORE EBANK AND RETURN
// slot 9164
                        if slot <> 9164 or instruction <> 5867 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5867, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[544] to agcAotUnit544@.

