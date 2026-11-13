// PORT: Original source unit IMU_COMPENSATION_PACKAGE.agc.
// PORT: Physical bank 06. Shared continuation entries, slots 8882–8892.
function agcAotUnit505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8886 {
        if slot <= 8883 {
            if slot <= 8882 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:2
//# Filename:	IMU_COMPENSATION_PACKAGE.agc
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:9
//# Pages:	297-306
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:10
//# Mod history:	2009-05-08 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:11
//#				same name, using Comanche055 page images/
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:12
//#		2009-05-21 RSB	In IRIGZ, PRIO17 corrected to PRIO21.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:13
//#
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:22
//#
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:24
//#
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:25
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:26
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:27
//#
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:28
//#	This AGC program shall also be referred to as
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:29
//#			Colossus 2A
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:30
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:31
//# Page 297
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:32
//		BANK	7
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:33
//		SETLOC	IMUCOMP
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:34
//		BANK
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:35
//		EBANK=	NBDX
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:36
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:37
//		COUNT	06/ICOMP
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:38
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:39
//1/PIPA		CAF	LGCOMP		# SAVE EBANK OF CALLING PROGRAM
// PORT: Fixed ROM slots 8882.
                if slot <> 8882 or instruction <> 14158 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1870), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:40
//		XCH	EBANK
// PORT: Fixed ROM slots 8883.
                if slot <> 8883 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8884 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:41
//		TS	MODE
// PORT: Fixed ROM slots 8884.
                if slot <> 8884 or instruction <> 22643 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22643, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8885 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:42
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:43
//		CCS	GCOMPSW		# BYPASS IF GCOMPSW NEGATIVE
// PORT: Fixed ROM slots 8885.
                    if slot <> 8885 or instruction <> 4927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:44
//		TCF	+3
// PORT: Fixed ROM slots 8886.
                    if slot <> 8886 or instruction <> 5817 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5817, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8889 {
            if slot <= 8887 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:45
//		TCF	+2
// PORT: Fixed ROM slots 8887.
                if slot <> 8887 or instruction <> 5817 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5817, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8888 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:46
//		TCF	IRIG1		# RETURN
// PORT: Fixed ROM slots 8888.
                    if slot <> 8888 or instruction <> 5895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5895, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:47
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:48
//		INHINT			#  ASSURE COMPLETE COMPENSATION OF DELV'S
// PORT: Fixed ROM slots 8889.
                    if slot <> 8889 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8890 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:49
//					# FOR DOWNLINK.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:50
//1/PIPA1		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 8890.
                if slot <> 8890 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8891 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:51
//		TS	BUF +2
// PORT: Fixed ROM slots 8891.
                    if slot <> 8891 or instruction <> 22618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:52
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:53
//		INDEX	BUF +2
// PORT: Fixed ROM slots 8892.
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
set agcAotRoutes[505] to agcAotUnit505@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:54
//		CA	PIPASCF		# (P.P.M.) X 2(-9)
// PORT: Fixed ROM slots 8893.
    8893, 26198
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8894–8895.
function agcAotUnit506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8894 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:55
//		EXTEND
// PORT: Fixed ROM slots 8894.
        if slot <> 8894 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:56
//		INDEX	BUF +2
// PORT: Fixed ROM slots 8895.
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
set agcAotRoutes[506] to agcAotUnit506@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:57
//		MP	DELVX		# (PP) X 2(+14) NOW (PIPA PULSES) X 2(+5)
// PORT: Fixed ROM slots 8896.
    8896, 58596
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8897–8901.
function agcAotUnit507 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8898 {
        if slot <= 8897 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:58
//		TS	Q		# SAVE MAJOR PART
// PORT: Fixed ROM slots 8897.
            if slot <> 8897 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:59
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:60
//		CA	L		# MINOR PART
// PORT: Fixed ROM slots 8898.
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
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:61
//		EXTEND
// PORT: Fixed ROM slots 8899.
            if slot <> 8899 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8900 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:62
//		MP	BIT6		# SCALE 2(+9)	SHIFT RIGHT 9
// PORT: Fixed ROM slots 8900.
                if slot <> 8900 or instruction <> 31242 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2570, readEffective:call(words, 2570)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:63
//		INDEX 	BUF +2
// PORT: Fixed ROM slots 8901.
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
set agcAotRoutes[507] to agcAotUnit507@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:64
//		TS	DELVX +1	# FRACTIONAL PIPA PULSES SCALED 2(+14)
// PORT: Fixed ROM slots 8902.
    8902, 46310
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8903–8906.
function agcAotUnit508 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8904 {
        if slot <= 8903 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:65
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:66
//		CA	Q		# MAJOR PART
// PORT: Fixed ROM slots 8903.
            if slot <> 8903 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:67
//		EXTEND
// PORT: Fixed ROM slots 8904.
            if slot <> 8904 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8905 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:68
//		MP	BIT6		# SCALE 2(+9)	SHIFT RIGHT 9
// PORT: Fixed ROM slots 8905.
            if slot <> 8905 or instruction <> 31242 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2570, readEffective:call(words, 2570)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:69
//		INDEX	BUF +2
// PORT: Fixed ROM slots 8906.
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
set agcAotRoutes[508] to agcAotUnit508@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:70
//		DAS	DELVX		# (PIPAI) + (PIPAI)(SFE)
// PORT: Fixed ROM slots 8907.
    8907, 17638
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8908–8908.
function agcAotUnit509 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:71
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:72
//		INDEX	BUF +2
// PORT: Fixed ROM slots 8908.
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
set agcAotRoutes[509] to agcAotUnit509@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:73
//		CS	PIPABIAS	# (PIPA PULSES)/(CS) X 2(-8)			*
// PORT: Fixed ROM slots 8909.
    8909, 34388
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8910–8914.
function agcAotUnit510 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8911 {
        if slot <= 8910 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:74
//		EXTEND
// PORT: Fixed ROM slots 8910.
            if slot <> 8910 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:75
//		MP	1/PIPADT	# (CS) X 2(+8) NOW (PIPA PULSES) X 2(+0)	*
// PORT: Fixed ROM slots 8911.
            if slot <> 8911 or instruction <> 29244 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 572, readEffective:call(words, 572)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8912 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:76
//		EXTEND
// PORT: Fixed ROM slots 8912.
            if slot <> 8912 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8913 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:77
//		MP	BIT1		# SCALE 2(+14) SHIFT RIGHT 14			*
// PORT: Fixed ROM slots 8913.
                if slot <> 8913 or instruction <> 31247 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2575, readEffective:call(words, 2575)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:78
//		INDEX	BUF +2
// PORT: Fixed ROM slots 8914.
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
set agcAotRoutes[510] to agcAotUnit510@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:79
//		DAS	DELVX		# (PIPAI) + (PIPAI)(SFE) - (BIAS)(DELTAT)
// PORT: Fixed ROM slots 8915.
    8915, 17638
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8916–8963.
function agcAotUnit511 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8939 {
        if slot <= 8927 {
            if slot <= 8921 {
                if slot <= 8918 {
                    if slot <= 8916 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:80
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:81
//		CCS	BUF +2		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 8916.
                        if slot <> 8916 or instruction <> 4186 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 90).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8917 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:82
//# Page 298
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:83
//		AD	NEG1
// PORT: Fixed ROM slots 8917.
                            if slot <> 8917 or instruction <> 28622 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:84
//		TCF	1/PIPA1 +1
// PORT: Fixed ROM slots 8918.
                            if slot <> 8918 or instruction <> 5819 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5819, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8919 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:85
//		NOOP			# LESS THAN ZERO IMPOSSIBLE.
// PORT: Fixed ROM slots 8919.
                        if slot <> 8919 or instruction <> 5848 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5848, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8920 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:86
//		RELINT
// PORT: Fixed ROM slots 8920.
                            if slot <> 8920 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:87
//# Page 299
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:88
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:89
//IRIGCOMP	TS	GCOMPSW		# INDICATE COMMANDS 2 PULSES OR LESS.
// PORT: Fixed ROM slots 8921.
                            if slot <> 8921 or instruction <> 23359 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23359, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8924 {
                    if slot <= 8922 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:90
//		TS	BUF		# INDEX COUNTER - IRIGX, IRIGY, IRIGZ.
// PORT: Fixed ROM slots 8922.
                        if slot <> 8922 or instruction <> 22616 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22616, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8923 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:91
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:92
//IRIGX		EXTEND
// PORT: Fixed ROM slots 8923.
                            if slot <> 8923 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:93
//		DCS	DELVX		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8924.
                            if slot <> 8924 or instruction <> 17011 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 627, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8925 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:94
//		DXCH	MPAC
// PORT: Fixed ROM slots 8925.
                        if slot <> 8925 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8926 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:95
//		CA	ADIAX		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8926.
                            if slot <> 8926 or instruction <> 13107 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 819).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:96
//		TC	GCOMPSUB	# -(ADIAX)(PIPAX)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8927.
                            if slot <> 8927 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8933 {
                if slot <= 8930 {
                    if slot <= 8928 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:97
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:98
//		EXTEND			#
// PORT: Fixed ROM slots 8928.
                        if slot <> 8928 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8929 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:99
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8929.
                            if slot <> 8929 or instruction <> 17013 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 629, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:100
//		DXCH	MPAC		#
// PORT: Fixed ROM slots 8930.
                            if slot <> 8930 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8931 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:101
//		CS	ADSRAX		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)	*
// PORT: Fixed ROM slots 8931.
                        if slot <> 8931 or instruction <> 17206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 822).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8932 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:102
//		TC	GCOMPSUB	# +(ADSRAX)(PIPAY)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8932.
                            if slot <> 8932 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:103
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:104
//#		EXTEND			# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:105
//#		DCS	DELVY		# ***	(PIPA PULSES) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:106
//#		DXCH	MPAC		# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:107
//#		CA	ADOAX		# ***	(GYRO PULSES)/(PIPA PULSE) X 2(-3)	*
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:108
//#		TC	GCOMPSUB	# ***	-(ADOAX)(PIPAZ)		(GYRO PULSES) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:109
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:110
//		CS	NBDX		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 8933.
                            if slot <> 8933 or instruction <> 17200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 816).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8936 {
                    if slot <= 8934 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:111
//		TC	DRIFTSUB	# -(NBDX)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8934.
                        if slot <> 8934 or instruction <> 1825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1825, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8935 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:112
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:113
//IRIGY		EXTEND
// PORT: Fixed ROM slots 8935.
                            if slot <> 8935 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:114
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8936.
                            if slot <> 8936 or instruction <> 17013 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 629, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8937 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:115
//		DXCH	MPAC
// PORT: Fixed ROM slots 8937.
                        if slot <> 8937 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8938 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:116
//		CA	ADIAY		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8938.
                            if slot <> 8938 or instruction <> 13108 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 820).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:117
//		TC	GCOMPSUB	# -(ADIAY)(PIPAY)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8939.
                            if slot <> 8939 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8951 {
            if slot <= 8945 {
                if slot <= 8942 {
                    if slot <= 8940 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:118
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:119
//		EXTEND
// PORT: Fixed ROM slots 8940.
                        if slot <> 8940 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8941 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:120
//		DCS	DELVZ		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8941.
                            if slot <> 8941 or instruction <> 17015 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 631, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:121
//		DXCH	MPAC
// PORT: Fixed ROM slots 8942.
                            if slot <> 8942 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8943 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:122
//		CS	ADSRAY		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8943.
                        if slot <> 8943 or instruction <> 17207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 823).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8944 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:123
//		TC	GCOMPSUB	# +(ADSRAY)(PIPAZ)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8944.
                            if slot <> 8944 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:124
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:125
//#		EXTEND			# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:126
//#		DCS	DELVX		# ***	(PIPA PULSES) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:127
//#		DXCH	MPAC		# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:128
//#		CA	ADOAY		# ***	(GYRO PULSES)/(PIPA PULSE) X 2(-3)	*
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:129
//#		TC	GCOMPSUB	# ***	-(ADOAY)(PIPAZ)	(GYRO PULSES) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:130
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:131
//		CS	NBDY		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 8945.
                            if slot <> 8945 or instruction <> 17201 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 817).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8948 {
                    if slot <= 8946 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:132
//		TC	DRIFTSUB	# -(NBDY)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8946.
                        if slot <> 8946 or instruction <> 1825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1825, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8947 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:133
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:134
//IRIGZ		EXTEND
// PORT: Fixed ROM slots 8947.
                            if slot <> 8947 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:135
//		DCS	DELVY		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8948.
                            if slot <> 8948 or instruction <> 17013 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 629, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8949 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:136
//		DXCH	MPAC
// PORT: Fixed ROM slots 8949.
                        if slot <> 8949 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8950 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:137
//		CA	ADSRAZ		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8950.
                            if slot <> 8950 or instruction <> 13112 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 824).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:138
//# Page 300
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:139
//		TC	GCOMPSUB	# -(ADSRAZ)(PIPAY)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8951.
                            if slot <> 8951 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8957 {
                if slot <= 8954 {
                    if slot <= 8952 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:140
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:141
//		EXTEND
// PORT: Fixed ROM slots 8952.
                        if slot <> 8952 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8953 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:142
//		DCS	DELVZ		# (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8953.
                            if slot <> 8953 or instruction <> 17015 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 631, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:143
//		DXCH	MPAC
// PORT: Fixed ROM slots 8954.
                            if slot <> 8954 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8955 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:144
//		CA	ADIAZ		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8955.
                        if slot <> 8955 or instruction <> 13109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 821).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8956 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:145
//		TC	GCOMPSUB	# -(ADIAZ)(PIPAZ)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8956.
                            if slot <> 8956 or instruction <> 1802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:146
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:147
//#		EXTEND			# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:148
//#		DCS	DELVX		# ***	(PIPA PULSE) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:149
//#		DXCH	MPAC		# ***
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:150
//#		CS	ADOAZ		# ***	(GYRO PULSES)/(PIPA PULSE) X 2(-3)	*
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:151
//#		TC	GCOMPSUB	# ***	+(ADOAZ)(PIPAX)	(GYRO PULSES) X 2(+14)
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:152
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:153
//		CA	NBDZ		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 8957.
                            if slot <> 8957 or instruction <> 13106 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 818).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8960 {
                    if slot <= 8958 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:154
//		TC	DRIFTSUB	# +(NBDZ)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8958.
                        if slot <> 8958 or instruction <> 1825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1825, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8959 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:155
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:156
//# Page 301
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:157
//		CCS	GCOMPSW		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// PORT: Fixed ROM slots 8959.
                            if slot <> 8959 or instruction <> 4927 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 831).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:158
//		TCF	+2		# YES
// PORT: Fixed ROM slots 8960.
                            if slot <> 8960 or instruction <> 5890 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5890, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8961 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:159
//		TCF	IRIG1		# NO
// PORT: Fixed ROM slots 8961.
                        if slot <> 8961 or instruction <> 5895 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5895, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8962 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:160
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:161
//		CAF	PRIO21		# HIGHER THAN SERVICER-LESS THAN PRELAUNCH
// PORT: Fixed ROM slots 8962.
                            if slot <> 8962 or instruction <> 14907 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2619), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:162
//		TC	NOVAC
// PORT: Fixed ROM slots 8963.
                            if slot <> 8963 or instruction <> 2652 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2652, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[511] to agcAotUnit511@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:163
//		EBANK=	NBDX
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:164
//		2CADR	1/GYRO
// PORT: Fixed ROM slots 8964 8965.
    8964, 3704, 8965, 12390
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8966–8983.
function agcAotUnit512 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8974 {
        if slot <= 8969 {
            if slot <= 8967 {
                if slot <= 8966 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:165
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:166
//		RELINT
// PORT: Fixed ROM slots 8966.
                    if slot <> 8966 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:167
//IRIG1		CA	MODE		# SET EBANK FOR RETURN
// PORT: Fixed ROM slots 8967.
                    if slot <> 8967 or instruction <> 12403 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 115).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8968 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:168
//		TS	EBANK
// PORT: Fixed ROM slots 8968.
                    if slot <> 8968 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:169
//		TCF	SWRETURN
// PORT: Fixed ROM slots 8969.
                    if slot <> 8969 or instruction <> 6589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6589, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8971 {
                if slot <= 8970 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:170
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:171
//GCOMPSUB	XCH	MPAC		# ADIA OR ADSRA COEFFICIENT ARRIVES IN A
// PORT: Fixed ROM slots 8970.
                    if slot <> 8970 or instruction <> 23660 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 108, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:172
//		EXTEND			# C(MPAC) = (PIPA PULSES) X 2(+14)
// PORT: Fixed ROM slots 8971.
                    if slot <> 8971 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8972 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:173
//		MP	MPAC		# (GYRO PULSES)/(PIPA PULSE) X 2(-3)		*
// PORT: Fixed ROM slots 8972.
                    if slot <> 8972 or instruction <> 28780 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 108, readEffective:call(words, 108)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8973 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:174
//		DXCH	VBUF		# NOW = (GYRO PULSES) X 2(+11)			*
// PORT: Fixed ROM slots 8973.
                        if slot <> 8973 or instruction <> 21587 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 83, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:175
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:176
//		CA	MPAC +1		# MINOR PART OF PIPA PULSES
// PORT: Fixed ROM slots 8974.
                        if slot <> 8974 or instruction <> 12397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8978 {
            if slot <= 8976 {
                if slot <= 8975 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:177
//		EXTEND
// PORT: Fixed ROM slots 8975.
                    if slot <> 8975 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:178
//		MP	MPAC		# ADIA OR ADSRA
// PORT: Fixed ROM slots 8976.
                    if slot <> 8976 or instruction <> 28780 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 108, readEffective:call(words, 108)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8977 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:179
//		TS	L
// PORT: Fixed ROM slots 8977.
                    if slot <> 8977 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:180
//		CAF	ZERO
// PORT: Fixed ROM slots 8978.
                    if slot <> 8978 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 8980 {
                if slot <= 8979 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:181
//		DAS	VBUF		# NOW = (GYRO PULSES) X 2(+11)			*
// PORT: Fixed ROM slots 8979.
                    if slot <> 8979 or instruction <> 8275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 83) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:182
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:183
//		CA	VBUF		# PARTIAL RESULT - MAJOR
// PORT: Fixed ROM slots 8980.
                    if slot <> 8980 or instruction <> 12370 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 82).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8981 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:184
//		EXTEND
// PORT: Fixed ROM slots 8981.
                    if slot <> 8981 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8982 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:185
//		MP	BIT12		# SCALE 2(+3)	SHIFT RIGHT 3			*
// PORT: Fixed ROM slots 8982.
                        if slot <> 8982 or instruction <> 31236 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2564, readEffective:call(words, 2564)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:186
//		INDEX	BUF		# RESULT = (GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8983.
                        if slot <> 8983 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[512] to agcAotUnit512@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:187
//		DAS	GCOMP		# HI(ADIA)(PIPAI) OR HI(ADSRA)(PIPAI)
// PORT: Fixed ROM slots 8984.
    8984, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8985–8990.
function agcAotUnit513 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8987 {
        if slot <= 8985 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:188
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:189
//		CA	VBUF +1		# PARTIAL RESULT - MINOR
// PORT: Fixed ROM slots 8985.
            if slot <> 8985 or instruction <> 12371 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 83).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8986 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:190
//		EXTEND
// PORT: Fixed ROM slots 8986.
                if slot <> 8986 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:191
//		MP	BIT12		# SCALE 2(+3)	SHIFT RIGHT 3			*
// PORT: Fixed ROM slots 8987.
                if slot <> 8987 or instruction <> 31236 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2564, readEffective:call(words, 2564)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8988 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:192
//		TS	L
// PORT: Fixed ROM slots 8988.
            if slot <> 8988 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8989 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:193
//		CAF	ZERO
// PORT: Fixed ROM slots 8989.
                if slot <> 8989 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:194
//		INDEX	BUF		# RESULT = (GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 8990.
                if slot <> 8990 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[513] to agcAotUnit513@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:195
//		DAS	GCOMP		# (ADIA)(PIPAI)  OR  (ADSRA)(PIPAI)
// PORT: Fixed ROM slots 8991.
    8991, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8992–9000.
function agcAotUnit514 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8995 {
        if slot <= 8993 {
            if slot <= 8992 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:196
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:197
//		TC	Q
// PORT: Fixed ROM slots 8992.
                if slot <> 8992 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:198
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:199
//# Page 302
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:200
//DRIFTSUB	EXTEND
// PORT: Fixed ROM slots 8993.
                if slot <> 8993 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8994 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:201
//		QXCH	BUF +1
// PORT: Fixed ROM slots 8994.
                if slot <> 8994 or instruction <> 9305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 89, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:202
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:203
//		EXTEND			# C(A) = NBD	(GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 8995.
                if slot <> 8995 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8997 {
            if slot <= 8996 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:204
//		MP	1/PIPADT	# (CS) X 2(+8)	NO (GYRO PULSES) X 2(+3)
// PORT: Fixed ROM slots 8996.
                if slot <> 8996 or instruction <> 29244 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 572, readEffective:call(words, 572)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:205
//		LXCH	MPAC +1		# SAVE FOR FRACTIONAL COMPENSATION
// PORT: Fixed ROM slots 8997.
                if slot <> 8997 or instruction <> 9325 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 109, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8998 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:206
//		EXTEND
// PORT: Fixed ROM slots 8998.
                if slot <> 8998 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8999 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:207
//		MP	BIT4		# SCALE 2(+11)	SHIFT RIGHT 11
// PORT: Fixed ROM slots 8999.
                    if slot <> 8999 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:208
//		INDEX	BUF
// PORT: Fixed ROM slots 9000.
                    if slot <> 9000 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[514] to agcAotUnit514@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:209
//		DAS	GCOMP		# HI(NBD)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9001.
    9001, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9002–9007.
function agcAotUnit515 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9004 {
        if slot <= 9002 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:210
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:211
//		CA	MPAC +1		# NOW MINOR PART
// PORT: Fixed ROM slots 9002.
            if slot <> 9002 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 109).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9003 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:212
//		EXTEND
// PORT: Fixed ROM slots 9003.
                if slot <> 9003 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:213
//		MP	BIT4		# SCALE 2(+11)		SHIFT RIGHT 11
// PORT: Fixed ROM slots 9004.
                if slot <> 9004 or instruction <> 31244 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9005 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:214
//		TS	L
// PORT: Fixed ROM slots 9005.
            if slot <> 9005 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9006 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:215
//		CAF	ZERO
// PORT: Fixed ROM slots 9006.
                if slot <> 9006 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:216
//		INDEX	BUF		# ADD IN FRACTIONAL COMPENSATION
// PORT: Fixed ROM slots 9007.
                if slot <> 9007 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[515] to agcAotUnit515@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:217
//		DAS	GCOMP		# (NBD)(DELTAT)		(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9008.
    9008, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9009–9012.
function agcAotUnit516 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9010 {
        if slot <= 9009 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:218
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:219
//DRFTSUB2	CAF	TWO		# PIPAX, PIPAY, PIPAZ
// PORT: Fixed ROM slots 9009.
            if slot <> 9009 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:220
//		AD	BUF
// PORT: Fixed ROM slots 9010.
            if slot <> 9010 or instruction <> 24664 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 88).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9011 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:221
//		XCH	BUF
// PORT: Fixed ROM slots 9011.
            if slot <> 9011 or instruction <> 23640 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 88, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:222
//		INDEX	A
// PORT: Fixed ROM slots 9012.
            if slot <> 9012 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[516] to agcAotUnit516@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:223
//		CCS	GCOMP		# ARE GYRO COMMANDS 1 PULSE OR GREATER
// PORT: Fixed ROM slots 9013.
    9013, 9842
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9014–9022.
function agcAotUnit517 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9017 {
        if slot <= 9015 {
            if slot <= 9014 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:224
//		TCF	+2		# YES
// PORT: Fixed ROM slots 9014.
                if slot <> 9014 or instruction <> 5944 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5944, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:225
//		TC	BUF +1		# NO
// PORT: Fixed ROM slots 9015.
                if slot <> 9015 or instruction <> 89 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 89, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9016 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:226
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:227
//		MASK	NEGONE
// PORT: Fixed ROM slots 9016.
                if slot <> 9016 or instruction <> 32718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    if fixedOperand = 32766 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 16384) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:228
//		CCS	A		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// PORT: Fixed ROM slots 9017.
                if slot <> 9017 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 9019 {
            if slot <= 9018 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:229
//		TS	GCOMPSW		# YES - SET GCOMPSW POSITIVE
// PORT: Fixed ROM slots 9018.
                if slot <> 9018 or instruction <> 23359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:230
//		TC	BUF +1		# NO
// PORT: Fixed ROM slots 9019.
                if slot <> 9019 or instruction <> 89 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 89, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9020 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:231
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:232
//# Page 303
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:233
//1/GYRO		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 9020.
                if slot <> 9020 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9021 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:234
//		TS	BUF
// PORT: Fixed ROM slots 9021.
                    if slot <> 9021 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:235
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:236
//		INDEX	BUF		# SCALE GYRO COMMANDS FOR IMUPULSE
// PORT: Fixed ROM slots 9022.
                    if slot <> 9022 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[517] to agcAotUnit517@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:237
//		CA	GCOMP +1	# FRACTIONAL PULSES
// PORT: Fixed ROM slots 9023.
    9023, 26228
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9024–9026.
function agcAotUnit518 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9024 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:238
//		EXTEND
// PORT: Fixed ROM slots 9024.
        if slot <> 9024 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9025 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:239
//		MP	BIT8		# SHIFT RIGHT 7
// PORT: Fixed ROM slots 9025.
            if slot <> 9025 or instruction <> 31240 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:240
//		INDEX	BUF
// PORT: Fixed ROM slots 9026.
            if slot <> 9026 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[518] to agcAotUnit518@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:241
//		TS	GCOMP +1	# FRACTIONAL PULSES SCALED
// PORT: Fixed ROM slots 9027.
    9027, 46708
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9028–9029.
function agcAotUnit519 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9028 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:242
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:243
//		CAF	ZERO		# SET GCOMP = 0 FOR DAS INSTRUCTION
// PORT: Fixed ROM slots 9028.
        if slot <> 9028 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:244
//		INDEX	BUF
// PORT: Fixed ROM slots 9029.
        if slot <> 9029 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[519] to agcAotUnit519@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:245
//		XCH	GCOMP		# GYRO PULSES
// PORT: Fixed ROM slots 9030.
    9030, 48754
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9031–9033.
function agcAotUnit520 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9031 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:246
//		EXTEND
// PORT: Fixed ROM slots 9031.
        if slot <> 9031 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9032 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:247
//		MP	BIT8		# SHIFT RIGHT 7
// PORT: Fixed ROM slots 9032.
            if slot <> 9032 or instruction <> 31240 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:248
//		INDEX	BUF
// PORT: Fixed ROM slots 9033.
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
set agcAotRoutes[520] to agcAotUnit520@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:249
//		DAS	GCOMP		# ADD THESE TO FRACTIONAL PULSES ABOVE
// PORT: Fixed ROM slots 9034.
    9034, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9035–9037.
function agcAotUnit521 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9035 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:250
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:251
//		CCS	BUF		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 9035.
        if slot <> 9035 or instruction <> 4184 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 88).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9036 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:252
//		AD	NEG1
// PORT: Fixed ROM slots 9036.
            if slot <> 9036 or instruction <> 28622 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:253
//		TCF	1/GYRO +1
// PORT: Fixed ROM slots 9037.
            if slot <> 9037 or instruction <> 5949 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5949, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[521] to agcAotUnit521@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:254
//LGCOMP		ECADR	GCOMP		# LESS THAN ZERO IMPOSSIBLE
// PORT: Fixed ROM slots 9038.
    9038, 1650
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9039–9040.
function agcAotUnit522 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9039 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:255
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:256
//		CAF	LGCOMP
// PORT: Fixed ROM slots 9039.
        if slot <> 9039 or instruction <> 14158 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1870), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:257
//		TC	BANKCALL
// PORT: Fixed ROM slots 9040.
        if slot <> 9040 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[522] to agcAotUnit522@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:258
//		CADR	IMUPULSE	# CALL GYRO TORQUING ROUTINE
// PORT: Fixed ROM slots 9041.
    9041, 15628
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9042–9042.
function agcAotUnit523 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:259
//		TC	BANKCALL
// PORT: Fixed ROM slots 9042.
    if slot <> 9042 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[523] to agcAotUnit523@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:260
//		CADR	IMUSTALL	# WAIT FOR PULSES TO GET OUT
// PORT: Fixed ROM slots 9043.
    9043, 16126
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9044–9047.
function agcAotUnit524 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9045 {
        if slot <= 9044 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:261
//		TCF	ENDOFJOB	# TEMPORARY
// PORT: Fixed ROM slots 9044.
            if slot <> 9044 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:262
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:263
//GCOMP1		CAF	FOUR		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 9045.
            if slot <> 9045 or instruction <> 14861 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9046 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:264
//		TS	BUF
// PORT: Fixed ROM slots 9046.
            if slot <> 9046 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:265
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:266
//		INDEX	BUF		# RESCALE
// PORT: Fixed ROM slots 9047.
            if slot <> 9047 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[524] to agcAotUnit524@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:267
//		CA	GCOMP +1
// PORT: Fixed ROM slots 9048.
    9048, 26228
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9049–9051.
function agcAotUnit525 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9049 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:268
//		EXTEND
// PORT: Fixed ROM slots 9049.
        if slot <> 9049 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9050 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:269
//		MP	BIT8		# SHIFT MINOR PART LEFT 7 - MAJOR PART = 0
// PORT: Fixed ROM slots 9050.
            if slot <> 9050 or instruction <> 31240 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:270
//		INDEX	BUF
// PORT: Fixed ROM slots 9051.
            if slot <> 9051 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[525] to agcAotUnit525@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:271
//		LXCH	GCOMP +1	# BITS 8-14 OF MINOR PART WERE = 0
// PORT: Fixed ROM slots 9052.
    9052, 20084
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9053–9055.
function agcAotUnit526 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9053 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:272
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:273
//		CCS	BUF		# PIPAZ, PIPAY, PIPAX
// PORT: Fixed ROM slots 9053.
        if slot <> 9053 or instruction <> 4184 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 88).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9054 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:274
//		AD	NEG1
// PORT: Fixed ROM slots 9054.
            if slot <> 9054 or instruction <> 28622 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:275
//		TCF	GCOMP1 +1
// PORT: Fixed ROM slots 9055.
            if slot <> 9055 or instruction <> 5974 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5974, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[526] to agcAotUnit526@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:276
//V06N30S		VN	0630
// PORT: Fixed ROM slots 9056.
    9056, 1596
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9057–9108.
function agcAotUnit527 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9082 {
        if slot <= 9069 {
            if slot <= 9062 {
                if slot <= 9059 {
                    if slot <= 9057 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:277
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 9057.
                        if slot <> 9057 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9058 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:278
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:279
//# Page 304
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:280
//NBDONLY		CCS	GCOMPSW		# BYPASS IF GCOMPSW NEGATIVE
// PORT: Fixed ROM slots 9058.
                            if slot <> 9058 or instruction <> 4927 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 831).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:281
//		TCF	+3
// PORT: Fixed ROM slots 9059.
                            if slot <> 9059 or instruction <> 5990 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5990, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9060 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:282
//		TCF	+2
// PORT: Fixed ROM slots 9060.
                        if slot <> 9060 or instruction <> 5990 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5990, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9061 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:283
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 9061.
                            if slot <> 9061 or instruction <> 6799 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6799, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:284
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:285
//		INHINT
// PORT: Fixed ROM slots 9062.
                            if slot <> 9062 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9065 {
                    if slot <= 9063 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:286
//		CCS	FLAGWRD2	# PREREAD T3RUPT MAY COINCIDE
// PORT: Fixed ROM slots 9063.
                        if slot <> 9063 or instruction <> 4158 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9064 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:287
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 9064.
                            if slot <> 9064 or instruction <> 6799 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6799, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:288
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 9065.
                            if slot <> 9065 or instruction <> 6799 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6799, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9067 {
                        if slot <= 9066 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:289
//		TCF	+1
// PORT: Fixed ROM slots 9066.
                            if slot <> 9066 or instruction <> 5995 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5995, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:290
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:291
//		CA	TIME1		# (CS) X 2(+14)
// PORT: Fixed ROM slots 9067.
                            if slot <> 9067 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 21).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 9068 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:292
//		XCH	1/PIPADT	# PREVIOUS TIME
// PORT: Fixed ROM slots 9068.
                            if slot <> 9068 or instruction <> 24124 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 572, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:293
//		RELINT
// PORT: Fixed ROM slots 9069.
                            if slot <> 9069 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9075 {
                if slot <= 9072 {
                    if slot <= 9070 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:294
//		COM
// PORT: Fixed ROM slots 9070.
                        if slot <> 9070 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9071 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:295
//		AD	1/PIPADT
// PORT: Fixed ROM slots 9071.
                            if slot <> 9071 or instruction <> 25148 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 572).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:296
//NBD2		CCS	A		# CALCULATE ELAPSED TIME
// PORT: Fixed ROM slots 9072.
                            if slot <> 9072 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 9073 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:297
//		AD	ONE		# NO TIME1 OVERFLOW
// PORT: Fixed ROM slots 9073.
                        if slot <> 9073 or instruction <> 27151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9074 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:298
//		TCF	NBD3		# RESTORE TIME DIFFERENCE AND JUMP
// PORT: Fixed ROM slots 9074.
                            if slot <> 9074 or instruction <> 6007 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6007, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:299
//		TCF	+2		# TIME1 OVERFLOW
// PORT: Fixed ROM slots 9075.
                            if slot <> 9075 or instruction <> 6005 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6005, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9078 {
                    if slot <= 9076 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:300
//		TCF	ENDOFJOB	# IF ELAPSED TIME = 0 (DIFFERENCE = -0)
// PORT: Fixed ROM slots 9076.
                        if slot <> 9076 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9077 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:301
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:302
//		COM			# CALCULATE ABSOLUTE DIFFERENCE
// PORT: Fixed ROM slots 9077.
                            if slot <> 9077 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:303
//		AD	POSMAX
// PORT: Fixed ROM slots 9078.
                            if slot <> 9078 or instruction <> 27135 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9080 {
                        if slot <= 9079 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:304
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:305
//NBD3		EXTEND			# C(A) = DELTAT		(CS) X 2(+14)
// PORT: Fixed ROM slots 9079.
                            if slot <> 9079 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:306
//		MP	BIT10		# SHIFT RIGHT 5
// PORT: Fixed ROM slots 9080.
                            if slot <> 9080 or instruction <> 31238 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2566, readEffective:call(words, 2566)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 9081 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:307
//		DXCH	VBUF
// PORT: Fixed ROM slots 9081.
                            if slot <> 9081 or instruction <> 21587 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 83, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:308
//		EXTEND
// PORT: Fixed ROM slots 9082.
                            if slot <> 9082 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 9095 {
            if slot <= 9088 {
                if slot <= 9085 {
                    if slot <= 9083 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:309
//		DCA	VBUF
// PORT: Fixed ROM slots 9083.
                        if slot <> 9083 or instruction <> 12371 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 83, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9084 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:310
//		DXCH	MPAC		# DELTAT NOW SCALED (CS) X 2(+19)
// PORT: Fixed ROM slots 9084.
                            if slot <> 9084 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:311
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:312
//		CAF	ZERO
// PORT: Fixed ROM slots 9085.
                            if slot <> 9085 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    if slot <= 9086 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:313
//		TS	GCOMPSW		# INDICATE COMMANDS 2 PULSES OR LESS
// PORT: Fixed ROM slots 9086.
                        if slot <> 9086 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9087 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:314
//		TS	BUF		# PIPAX, PIPAY, PIPAZ
// PORT: Fixed ROM slots 9087.
                            if slot <> 9087 or instruction <> 22616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22616, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:315
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:316
//		CS	NBDX		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 9088.
                            if slot <> 9088 or instruction <> 17200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 816).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9091 {
                    if slot <= 9089 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:317
//		TC	FBIASSUB	# -(NBOX)(DELTAT) 	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9089.
                        if slot <> 9089 or instruction <> 1935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9090 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:318
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:319
//		EXTEND
// PORT: Fixed ROM slots 9090.
                            if slot <> 9090 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:320
//		DCS	VBUF
// PORT: Fixed ROM slots 9091.
                            if slot <> 9091 or instruction <> 16467 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 83, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9093 {
                        if slot <= 9092 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:321
//		DXCH	MPAC		# DELTAT SCALED (CS) X 2(+19)
// PORT: Fixed ROM slots 9092.
                            if slot <> 9092 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:322
//		CA	NBDY		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 9093.
                            if slot <> 9093 or instruction <> 13105 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 817).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 9094 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:323
//		TC	FBIASSUB	# -(NBDY)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9094.
                            if slot <> 9094 or instruction <> 1935 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1935, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:324
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:325
//		EXTEND
// PORT: Fixed ROM slots 9095.
                            if slot <> 9095 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 9101 {
                if slot <= 9098 {
                    if slot <= 9096 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:326
//		DCS	VBUF
// PORT: Fixed ROM slots 9096.
                        if slot <> 9096 or instruction <> 16467 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 83, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9097 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:327
//		DXCH	MPAC		# DELTAT SCALED (CS) X 2(+19)
// PORT: Fixed ROM slots 9097.
                            if slot <> 9097 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:328
//		CS	NBDZ		# (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 9098.
                            if slot <> 9098 or instruction <> 17202 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 818).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9099 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:329
//		TC	FBIASSUB	# +(NBDZ)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9099.
                        if slot <> 9099 or instruction <> 1935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9100 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:330
//# Page 305
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:331
//		CCS	GCOMPSW		# ARE GYRO COMMANDS GREATER THAN 2 PULSES
// PORT: Fixed ROM slots 9100.
                            if slot <> 9100 or instruction <> 4927 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 831).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:332
//		TCF	1/GYRO		# YES
// PORT: Fixed ROM slots 9101.
                            if slot <> 9101 or instruction <> 5948 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5948, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9104 {
                    if slot <= 9102 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:333
//		TCF	ENDOFJOB	# NO
// PORT: Fixed ROM slots 9102.
                        if slot <> 9102 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9103 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:334
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:335
//# Page 306
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:336
//FBIASSUB	XCH	Q
// PORT: Fixed ROM slots 9103.
                            if slot <> 9103 or instruction <> 23554 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 2, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:337
//		TS	BUF +1
// PORT: Fixed ROM slots 9104.
                            if slot <> 9104 or instruction <> 22617 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22617, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9106 {
                        if slot <= 9105 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:338
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:339
//		CA	Q		# NBD SCALED (GYRO PULSES)/(CS) X 2(-5)
// PORT: Fixed ROM slots 9105.
                            if slot <> 9105 or instruction <> 12290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:340
//		EXTEND
// PORT: Fixed ROM slots 9106.
                            if slot <> 9106 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 9107 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:341
//		MP	MPAC		# DELTAT SCALED (CS) X 2(+19)
// PORT: Fixed ROM slots 9107.
                            if slot <> 9107 or instruction <> 28780 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 108, readEffective:call(words, 108)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:342
//		INDEX	BUF
// PORT: Fixed ROM slots 9108.
                            if slot <> 9108 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[527] to agcAotUnit527@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:343
//		DAS	GCOMP		# HI(NBD)(DELTAT)	(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9109.
    9109, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9110–9115.
function agcAotUnit528 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9112 {
        if slot <= 9110 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:344
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:345
//		CA	Q		# NO FRACTIONAL PART
// PORT: Fixed ROM slots 9110.
            if slot <> 9110 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9111 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:346
//		EXTEND
// PORT: Fixed ROM slots 9111.
                if slot <> 9111 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:347
//		MP	MPAC +1
// PORT: Fixed ROM slots 9112.
                if slot <> 9112 or instruction <> 28781 { return choose false if checkOnly else -1. }
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
        if slot <= 9113 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:348
//		TS	L
// PORT: Fixed ROM slots 9113.
            if slot <> 9113 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9114 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:349
//		CAF	ZERO
// PORT: Fixed ROM slots 9114.
                if slot <> 9114 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:350
//		INDEX	BUF
// PORT: Fixed ROM slots 9115.
                if slot <> 9115 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[528] to agcAotUnit528@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:351
//		DAS	GCOMP		# (NBD)(DELTAT)		(GYRO PULSES) X 2(+14)
// PORT: Fixed ROM slots 9116.
    9116, 18036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9117–9118.
function agcAotUnit529 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9117 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:352
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:353
//		TCF	DRFTSUB2	# CHECK MAGNITUDE OF COMPENSATION
// PORT: Fixed ROM slots 9117.
        if slot <> 9117 or instruction <> 5937 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5937, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:354
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:355
//LASTBIAS	TC	BANKCALL
// PORT: Fixed ROM slots 9118.
        if slot <> 9118 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[529] to agcAotUnit529@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:356
//		CADR	PIPUSE
// PORT: Fixed ROM slots 9119.
    9119, 15580
)).

// PORT: Physical bank 06. Shared continuation entries, slots 9120–9128.
function agcAotUnit530 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9123 {
        if slot <= 9121 {
            if slot <= 9120 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:357
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:358
//		CCS	GCOMPSW		# BYPASS IF GCOMPSW NEGATIVE
// PORT: Fixed ROM slots 9120.
                if slot <> 9120 or instruction <> 4927 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 831).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:359
//		TCF	+3
// PORT: Fixed ROM slots 9121.
                if slot <> 9121 or instruction <> 6052 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6052, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9122 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:360
//		TCF	+2
// PORT: Fixed ROM slots 9122.
                if slot <> 9122 or instruction <> 6052 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6052, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:361
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 9123.
                if slot <> 9123 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9125 {
            if slot <= 9124 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:362
//
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:363
//		CAF	PRIO31		# 2 SECONDS SCALED (CS) X 2(+8)
// PORT: Fixed ROM slots 9124.
                if slot <> 9124 or instruction <> 16309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4021), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:364
//		XCH	1/PIPADT
// PORT: Fixed ROM slots 9125.
                if slot <> 9125 or instruction <> 24124 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 572, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9126 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:365
//		COM
// PORT: Fixed ROM slots 9126.
                if slot <> 9126 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9127 {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:366
//		AD	PIPTIME1 +1	# TIME AT PIPA1 =0
// PORT: Fixed ROM slots 9127.
                    if slot <> 9127 or instruction <> 25254 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 678).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:367
//		TCF	NBD2
// PORT: Fixed ROM slots 9128.
                    if slot <> 9128 or instruction <> 6000 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6000, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[530] to agcAotUnit530@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE IMU_COMPENSATION_PACKAGE.agc:368
//
