// PORT: Original source unit IMU_MODE_SWITCHING_ROUTINES.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4911–4915.
function agcAotUnit216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4912 {
        if slot <= 4911 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:2
//# Filename:	IMU_MODE_SWITCHING_ROUTINES.agc
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:9
//# Pages:	1309-1337
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:10
//# Mod history:	2009-05-28 OH	Transcribed from page images.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:11
//#		2009-06-05 RSB	Fixed a typo.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:12
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:13
//#		2011-05-08 JL	Removed workaround. Flagged SBANK=
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:14
//#				workaround for future removal.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:15
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:24
//# actually created.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:25
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:27
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:30
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:31
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:32
//# Page 1309
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:33
//		BLOCK	02
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:34
//		SETLOC	FFTAG3
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:35
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:36
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:37
//		EBANK=	COMMAND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:38
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:39
//# FIXED-FIXED ROUTINES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:40
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:41
//		COUNT*	$$/IMODE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:42
//ZEROICDU	CAF	ZERO		# ZERO ICDU COUNTERS.
// PORT: Fixed ROM slots 4911.
            if slot <> 4911 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:43
//		TS	CDUX
// PORT: Fixed ROM slots 4912.
            if slot <> 4912 or instruction <> 22554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4913 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:44
//		TS	CDUY
// PORT: Fixed ROM slots 4913.
            if slot <> 4913 or instruction <> 22555 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22555, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4914 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:45
//		TS	CDUZ
// PORT: Fixed ROM slots 4914.
                if slot <> 4914 or instruction <> 22556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22556, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:46
//		TC	Q
// PORT: Fixed ROM slots 4915.
                if slot <> 4915 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[216] to agcAotUnit216@.

// PORT: Physical bank 07. Shared continuation entries, slots 9676–9681.
function agcAotUnit586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9678 {
        if slot <= 9676 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:47
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:48
//SPSCODE		=	BIT9
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:49
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:50
//# Page 1310
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:51
//# IMU ZEROING ROUTINES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:52
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:53
//		BANK	11
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:54
//		SETLOC	MODESW
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:55
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:56
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:57
//		COUNT*	$$/IMODE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:58
//IMUZERO		INHINT			# ROUTINE TO ZERO ICDUS.
// PORT: Fixed ROM slots 9676.
            if slot <> 9676 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9677 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:59
//		CS	DSPTAB +11D	# DON'T ZERO CDUS IF IMU IN GIMBAL LOCK AND
// PORT: Fixed ROM slots 9677.
                if slot <> 9677 or instruction <> 16926 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 542).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:60
//		MASK	BITS4&6		# COARSE ALIGN (GIMBAL RUNAWAY PROTECTION)
// PORT: Fixed ROM slots 9678.
                if slot <> 9678 or instruction <> 31225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                    if fixedOperand = 40 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8 + mod(floor(words[0] / 32), 2) * 32).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9679 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:61
//		CCS	A
// PORT: Fixed ROM slots 9679.
            if slot <> 9679 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9680 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:62
//		TCF	IMUZEROA
// PORT: Fixed ROM slots 9680.
                if slot <> 9680 or instruction <> 5588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:63
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:64
//		TC	ALARM		# IF SO.
// PORT: Fixed ROM slots 9681.
                if slot <> 9681 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[586] to agcAotUnit586@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:65
//		OCT	00206
// PORT: Fixed ROM slots 9682.
    9682, 268
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9683–9700.
function agcAotUnit587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9691 {
        if slot <= 9686 {
            if slot <= 9684 {
                if slot <= 9683 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:66
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:67
//		TCF	CAGETSTJ +4	# IMMEDIATE FAILURE.
// PORT: Fixed ROM slots 9683.
                    if slot <> 9683 or instruction <> 6063 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6063, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:68
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:69
//IMUZEROA	TC	CAGETSTJ
// PORT: Fixed ROM slots 9684.
                    if slot <> 9684 or instruction <> 1963 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1963, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9685 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:70
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:71
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9685.
                    if slot <> 9685 or instruction <> 17091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 707).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:72
//		MASK	SUPER011	# 	BIT5 FOR GROUND
// PORT: Fixed ROM slots 9686.
                    if slot <> 9686 or instruction <> 31227 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2555), 32768).
                        if fixedOperand = 48 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16), 4) * 16).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9688 {
                if slot <= 9687 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:73
//		ADS	IMODES33
// PORT: Fixed ROM slots 9687.
                    if slot <> 9687 or instruction <> 11971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:74
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:75
//		CS	IMODES30	# INHIBIT ICDUFAIL AND IMUFAIL (IN CASE WE
// PORT: Fixed ROM slots 9688.
                    if slot <> 9688 or instruction <> 17090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 706).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9689 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:76
//		MASK	BITS3&4		# JUST CAME OUT OF COARSE ALIGN).
// PORT: Fixed ROM slots 9689.
                    if slot <> 9689 or instruction <> 31721 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 3049), 32768).
                        if fixedOperand = 12 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 4) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9690 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:77
//		ADS	IMODES30
// PORT: Fixed ROM slots 9690.
                        if slot <> 9690 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:78
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:79
//		CS	BITS4&6		# SEND ZERO ENCODE WITH COARSE AND ERROR
// PORT: Fixed ROM slots 9691.
                        if slot <> 9691 or instruction <> 18937 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9695 {
            if slot <= 9693 {
                if slot <= 9692 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:80
//		EXTEND			# COUNTER DISABLED.
// PORT: Fixed ROM slots 9692.
                    if slot <> 9692 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:81
//		WAND 	CHAN12
// PORT: Fixed ROM slots 9693.
                    if slot <> 9693 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9694 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:82
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:83
//		TC	NOATTOFF	# TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 9694.
                    if slot <> 9694 or instruction <> 1718 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1718, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:84
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:85
//		CAF	BIT5
// PORT: Fixed ROM slots 9695.
                    if slot <> 9695 or instruction <> 14823 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9697 {
                if slot <= 9696 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:86
//		EXTEND
// PORT: Fixed ROM slots 9696.
                    if slot <> 9696 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:87
//		WOR	CHAN12
// PORT: Fixed ROM slots 9697.
                    if slot <> 9697 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9698 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:88
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:89
//		TC	ZEROICDU
// PORT: Fixed ROM slots 9698.
                    if slot <> 9698 or instruction <> 2863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9699 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:90
//		CAF	BIT6		# WAIT 320 MS TO GIVE AGS ADEQUATE TIME TO
// PORT: Fixed ROM slots 9699.
                        if slot <> 9699 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:91
//		TC	WAITLIST	# RECEIVE ITS PULSE TRAIN.
// PORT: Fixed ROM slots 9700.
                        if slot <> 9700 or instruction <> 2691 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2691, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[587] to agcAotUnit587@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:92
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:93
//		2CADR	IMUZERO2
// PORT: Fixed ROM slots 9701 9702.
    9701, 3038, 9702, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9703–9707.
function agcAotUnit588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9704 {
        if slot <= 9703 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:94
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:95
//		CS	IMODES30	# SEE IF IMU OPERATING AND ALARM IF NOT.
// PORT: Fixed ROM slots 9703.
            if slot <> 9703 or instruction <> 17090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 706).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:96
//		MASK	BIT9
// PORT: Fixed ROM slots 9704.
            if slot <> 9704 or instruction <> 31203 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
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
        if slot <= 9705 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:97
//		CCS	A
// PORT: Fixed ROM slots 9705.
            if slot <> 9705 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9706 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:98
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9706.
                if slot <> 9706 or instruction <> 5613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:99
//# Page 1311
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:100
//		TC	ALARM
// PORT: Fixed ROM slots 9707.
                if slot <> 9707 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[588] to agcAotUnit588@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:101
//		OCT	210
// PORT: Fixed ROM slots 9708.
    9708, 272
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9709–9725.
function agcAotUnit589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9716 {
        if slot <= 9712 {
            if slot <= 9710 {
                if slot <= 9709 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:102
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:103
//MODEEXIT	RELINT			# GENERAL MODE-SWITCHING EXIT.
// PORT: Fixed ROM slots 9709.
                    if slot <> 9709 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:104
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9710.
                    if slot <> 9710 or instruction <> 6553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9711 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:105
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:106
//IMUZERO2	TC	CAGETEST
// PORT: Fixed ROM slots 9711.
                    if slot <> 9711 or instruction <> 1953 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1953, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:107
//		TC	ZEROICDU	# ZERO CDUX, CDUY, CDUZ
// PORT: Fixed ROM slots 9712.
                    if slot <> 9712 or instruction <> 2863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9714 {
                if slot <= 9713 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:108
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:109
//		CS	BIT5		# REMOVE ZERO DISCRETE.
// PORT: Fixed ROM slots 9713.
                    if slot <> 9713 or instruction <> 18919 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:110
//		EXTEND
// PORT: Fixed ROM slots 9714.
                    if slot <> 9714 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9715 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:111
//		WAND	CHAN12
// PORT: Fixed ROM slots 9715.
                    if slot <> 9715 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:112
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:113
//		CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
// PORT: Fixed ROM slots 9716.
                    if slot <> 9716 or instruction <> 14817 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9720 {
            if slot <= 9718 {
                if slot <= 9717 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:114
//		TC	VARDELAY
// PORT: Fixed ROM slots 9717.
                    if slot <> 9717 or instruction <> 2708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2708, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:115
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:116
//IMUZERO3	TC	CAGETEST
// PORT: Fixed ROM slots 9718.
                    if slot <> 9718 or instruction <> 1953 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1953, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9719 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:117
//		CS	BITS3&4		# REMOVE IMUFAIL AND ICDUFAIL INHIBIT.
// PORT: Fixed ROM slots 9719.
                    if slot <> 9719 or instruction <> 19433 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3049), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:118
//		MASK	IMODES30
// PORT: Fixed ROM slots 9720.
                    if slot <> 9720 or instruction <> 29378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9722 {
                if slot <= 9721 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:119
//		TS	IMODES30
// PORT: Fixed ROM slots 9721.
                    if slot <> 9721 or instruction <> 23234 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23234, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:120
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:121
//		CS	SUPER011	# ENABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9722.
                    if slot <> 9722 or instruction <> 18939 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2555), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9723 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:122
//		MASK	IMODES33	#	BIT5 FOR GROUND
// PORT: Fixed ROM slots 9723.
                    if slot <> 9723 or instruction <> 29379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9724 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:123
//		TS	IMODES33
// PORT: Fixed ROM slots 9724.
                        if slot <> 9724 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:124
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:125
//		TC	IBNKCALL	# SET ISS WARNING IF EITHER OF ABOVE ARE
// PORT: Fixed ROM slots 9725.
                        if slot <> 9725 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[589] to agcAotUnit589@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:126
//		CADR	SETISSW		# PRESENT.
// PORT: Fixed ROM slots 9726.
    9726, 13190
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9727–9732.
function agcAotUnit590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9729 {
        if slot <= 9727 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:127
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:128
//		TCF	ENDIMU
// PORT: Fixed ROM slots 9727.
            if slot <> 9727 or instruction <> 6041 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6041, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9728 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:129
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:130
//# Page 1312
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:131
//# IMU COARSE ALIGN MODE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:132
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:133
//IMUCOARS	INHINT
// PORT: Fixed ROM slots 9728.
                if slot <> 9728 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:134
//		TC	CAGETSTJ
// PORT: Fixed ROM slots 9729.
                if slot <> 9729 or instruction <> 1963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1963, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9730 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:135
//		TC	SETCOARS
// PORT: Fixed ROM slots 9730.
            if slot <> 9730 or instruction <> 1636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9731 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:136
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:137
//		CAF	SIX
// PORT: Fixed ROM slots 9731.
                if slot <> 9731 or instruction <> 15522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:138
//		TC	WAITLIST
// PORT: Fixed ROM slots 9732.
                if slot <> 9732 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[590] to agcAotUnit590@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:139
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:140
//		2CADR	COARS
// PORT: Fixed ROM slots 9733 9734.
    9733, 3088, 9734, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9735–9742.
function agcAotUnit591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9738 {
        if slot <= 9736 {
            if slot <= 9735 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:141
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:142
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9735.
                if slot <> 9735 or instruction <> 5613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:143
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:144
//COARS		TC	CAGETEST
// PORT: Fixed ROM slots 9736.
                if slot <> 9736 or instruction <> 1953 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1953, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9737 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:145
//		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// PORT: Fixed ROM slots 9737.
                if slot <> 9737 or instruction <> 14822 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:146
//		EXTEND
// PORT: Fixed ROM slots 9738.
                if slot <> 9738 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9740 {
            if slot <= 9739 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:147
//		WOR	CHAN12
// PORT: Fixed ROM slots 9739.
                if slot <> 9739 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:148
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:149
//		CAF	TWO		# SET CDU INDICATOR
// PORT: Fixed ROM slots 9740.
                if slot <> 9740 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9741 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:150
//COARS1		TS	CDUIND
// PORT: Fixed ROM slots 9741.
                if slot <> 9741 or instruction <> 23356 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23356, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:151
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:152
//		INDEX	CDUIND		# COMPUTE THETAD -- THETAA IN 1'S
// PORT: Fixed ROM slots 9742.
                if slot <> 9742 or instruction <> 21308 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[591] to agcAotUnit591@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:153
//		CA	THETAD		# 	COMPLEMENT FORM
// PORT: Fixed ROM slots 9743.
    9743, 24994
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9744–9745.
function agcAotUnit592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9744 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:154
//		EXTEND
// PORT: Fixed ROM slots 9744.
        if slot <> 9744 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:155
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9745.
        if slot <> 9745 or instruction <> 21308 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21308, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21308, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[592] to agcAotUnit592@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:156
//		MSU	CDUX
// PORT: Fixed ROM slots 9746.
    9746, 16436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9747–9754.
function agcAotUnit593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9750 {
        if slot <= 9748 {
            if slot <= 9747 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:157
//		EXTEND
// PORT: Fixed ROM slots 9747.
                if slot <> 9747 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:158
//		MP	BIT13		# SHIFT RIGHT 2
// PORT: Fixed ROM slots 9748.
                if slot <> 9748 or instruction <> 31199 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2527, readEffective:call(words, 2527)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9749 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:159
//		XCH	L		# ROUND
// PORT: Fixed ROM slots 9749.
                if slot <> 9749 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:160
//		DOUBLE
// PORT: Fixed ROM slots 9750.
                if slot <> 9750 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9752 {
            if slot <= 9751 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:161
//		TS	ITEMP1
// PORT: Fixed ROM slots 9751.
                if slot <> 9751 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:162
//		TCF	+2
// PORT: Fixed ROM slots 9752.
                if slot <> 9752 or instruction <> 5658 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5658, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9753 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:163
//		ADS	L
// PORT: Fixed ROM slots 9753.
                if slot <> 9753 or instruction <> 11265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:164
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:165
//		INDEX	CDUIND		# DIFFERENCE TO BE COMPUTED
// PORT: Fixed ROM slots 9754.
                if slot <> 9754 or instruction <> 21308 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[593] to agcAotUnit593@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:166
//		LXCH	COMMAND
// PORT: Fixed ROM slots 9755.
    9755, 20082
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9756–9764.
function agcAotUnit594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9759 {
        if slot <= 9757 {
            if slot <= 9756 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:167
//		CCS	CDUIND
// PORT: Fixed ROM slots 9756.
                if slot <> 9756 or instruction <> 4924 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:168
//		TC	COARS1
// PORT: Fixed ROM slots 9757.
                if slot <> 9757 or instruction <> 1549 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1549, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9758 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:169
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:170
//		CAF	TWO		# MINIMUM OF 4 MS WAIT
// PORT: Fixed ROM slots 9758.
                if slot <> 9758 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:171
//		TC 	VARDELAY
// PORT: Fixed ROM slots 9759.
                if slot <> 9759 or instruction <> 2708 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2708, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9761 {
            if slot <= 9760 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:172
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:173
//# Page 1313
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:174
//COARS2		TC	CAGETEST	# DON'T CONTINUE IF CAGED.
// PORT: Fixed ROM slots 9760.
                if slot <> 9760 or instruction <> 1953 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1953, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:175
//		TS	ITEMP1		# SET TO +0.
// PORT: Fixed ROM slots 9761.
                if slot <> 9761 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9762 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:176
//		CAF	TWO		# SET CDU INDICATOR.
// PORT: Fixed ROM slots 9762.
                if slot <> 9762 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9763 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:177
// +3		TS	CDUIND
// PORT: Fixed ROM slots 9763.
                    if slot <> 9763 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:178
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:179
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9764.
                    if slot <> 9764 or instruction <> 21308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21308, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[594] to agcAotUnit594@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:180
//		CCS	COMMAND		# NUMBER OF PULSES REQUIRED
// PORT: Fixed ROM slots 9765.
    9765, 9842
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9766–9773.
function agcAotUnit595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9769 {
        if slot <= 9767 {
            if slot <= 9766 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:181
//		TC	COMPOS		# GREATER THAN MAX ALLOWED
// PORT: Fixed ROM slots 9766.
                if slot <> 9766 or instruction <> 1578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:182
//		TC	NEXTCDU +1
// PORT: Fixed ROM slots 9767.
                if slot <> 9767 or instruction <> 1585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1585, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9768 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:183
//		TC	COMNEG
// PORT: Fixed ROM slots 9768.
                if slot <> 9768 or instruction <> 1615 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1615, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:184
//		TC	NEXTCDU +1
// PORT: Fixed ROM slots 9769.
                if slot <> 9769 or instruction <> 1585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1585, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9771 {
            if slot <= 9770 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:185
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:186
//COMPOS		AD	-COMMAX		# COMMAX = MAX NUMBER OF PULSES ALLOWED
// PORT: Fixed ROM slots 9770.
                if slot <> 9770 or instruction <> 26597 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2021), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:187
//		EXTEND			# 	MINUS ONE
// PORT: Fixed ROM slots 9771.
                if slot <> 9771 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9772 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:188
//		BZMF	COMZERO
// PORT: Fixed ROM slots 9772.
                if slot <> 9772 or instruction <> 26199 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26199, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:189
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9773.
                if slot <> 9773 or instruction <> 21308 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[595] to agcAotUnit595@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:190
//		TS	COMMAND		# REDUCE COMMAND BY MAX NUMBER OF PULSES
// PORT: Fixed ROM slots 9774.
    9774, 46706
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9775–9778.
function agcAotUnit596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9776 {
        if slot <= 9775 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:191
//		CS	-COMMAX-	# 	ALLOWED
// PORT: Fixed ROM slots 9775.
            if slot <> 9775 or instruction <> 18406 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2022), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:192
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:193
//NEXTCDU		INCR	ITEMP1
// PORT: Fixed ROM slots 9776.
            if slot <> 9776 or instruction <> 10289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9777 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:194
//		AD	NEG0
// PORT: Fixed ROM slots 9777.
            if slot <> 9777 or instruction <> 27116 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2540), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:195
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9778.
            if slot <> 9778 or instruction <> 21308 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21308, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21308, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[596] to agcAotUnit596@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:196
//		TS	CDUXCMD		# SET UP COMMAND REGISTER.
// PORT: Fixed ROM slots 9779.
    9779, 45136
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9780–9784.
function agcAotUnit597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9781 {
        if slot <= 9780 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:197
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:198
//		CCS	CDUIND
// PORT: Fixed ROM slots 9780.
            if slot <> 9780 or instruction <> 4924 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 828).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:199
//		TC	COARS2 +3
// PORT: Fixed ROM slots 9781.
            if slot <> 9781 or instruction <> 1571 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1571, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9782 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:200
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:201
//		CCS	ITEMP1		# SEE IF ANY PULSES TO GO OUT.
// PORT: Fixed ROM slots 9782.
            if slot <> 9782 or instruction <> 4145 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9783 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:202
//		TCF	SENDPULS
// PORT: Fixed ROM slots 9783.
                if slot <> 9783 or instruction <> 5723 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5723, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:203
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:204
//		TC	FIXDELAY	# WAIT FOR GIMBALS TO SETTLE.
// PORT: Fixed ROM slots 9784.
                if slot <> 9784 or instruction <> 2705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2705, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[597] to agcAotUnit597@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:205
//		DEC	150
// PORT: Fixed ROM slots 9785.
    9785, 300
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9786–9788.
function agcAotUnit598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9786 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:206
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:207
//		CAF	TWO		# AT END OF COMMAND, CHECK TO SEE THAT
// PORT: Fixed ROM slots 9786.
        if slot <> 9786 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9787 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:208
//CHKCORS		TS	ITEMP1		# GIMBALS ARE WITHIN 2 DEGREES OF THETAD.
// PORT: Fixed ROM slots 9787.
            if slot <> 9787 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:209
//		INDEX	A
// PORT: Fixed ROM slots 9788.
            if slot <> 9788 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[598] to agcAotUnit598@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:210
//		CA	CDUX
// PORT: Fixed ROM slots 9789.
    9789, 24628
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9790–9791.
function agcAotUnit599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9790 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:211
//		EXTEND
// PORT: Fixed ROM slots 9790.
        if slot <> 9790 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:212
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 9791.
        if slot <> 9791 or instruction <> 20529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20529, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[599] to agcAotUnit599@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:213
//		MSU	THETAD
// PORT: Fixed ROM slots 9792.
    9792, 16802
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9793–9803.
function agcAotUnit600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9797 {
        if slot <= 9794 {
            if slot <= 9793 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:214
//		CCS	A
// PORT: Fixed ROM slots 9793.
                if slot <> 9793 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:215
//		TCF	COARSERR
// PORT: Fixed ROM slots 9794.
                if slot <> 9794 or instruction <> 5704 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5704, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9795 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:216
//		TCF	CORSCHK2
// PORT: Fixed ROM slots 9795.
                if slot <> 9795 or instruction <> 5701 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5701, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9796 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:217
//		TCF	COARSERR
// PORT: Fixed ROM slots 9796.
                    if slot <> 9796 or instruction <> 5704 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5704, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:218
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:219
//# Page 1314
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:220
//CORSCHK2	CCS	ITEMP1
// PORT: Fixed ROM slots 9797.
                    if slot <> 9797 or instruction <> 4145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9800 {
            if slot <= 9798 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:221
//		TCF	CHKCORS
// PORT: Fixed ROM slots 9798.
                if slot <> 9798 or instruction <> 5691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9799 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:222
//		TCF	ENDIMU		# END OF COARSE ALIGNMENT
// PORT: Fixed ROM slots 9799.
                    if slot <> 9799 or instruction <> 6041 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6041, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:223
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:224
//COARSERR	AD	COARSTOL	# 2 DEGREES.
// PORT: Fixed ROM slots 9800.
                    if slot <> 9800 or instruction <> 26190 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1614), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9801 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:225
//		EXTEND
// PORT: Fixed ROM slots 9801.
                if slot <> 9801 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9802 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:226
//		BZMF	CORSCHK2
// PORT: Fixed ROM slots 9802.
                    if slot <> 9802 or instruction <> 26181 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26181, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:227
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:228
//		TC	ALARM		# COARSE ALIGN ERROR.
// PORT: Fixed ROM slots 9803.
                    if slot <> 9803 or instruction <> 2935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[600] to agcAotUnit600@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:229
//		OCT	211
// PORT: Fixed ROM slots 9804.
    9804, 274
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9805–9805.
function agcAotUnit601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:230
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:231
//		TCF	IMUBAD
// PORT: Fixed ROM slots 9805.
    if slot <> 9805 or instruction <> 6047 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6047, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[601] to agcAotUnit601@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:232
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:233
//COARSTOL	DEC	-.01111		# 2 DEGREES SCALED AT HALF-REVOLUTIONS
// PORT: Fixed ROM slots 9806.
    9806, 65170
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9807–9811.
function agcAotUnit602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9808 {
        if slot <= 9807 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:234
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:235
//COMNEG		AD	-COMMAX
// PORT: Fixed ROM slots 9807.
            if slot <> 9807 or instruction <> 26597 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2021), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:236
//		EXTEND
// PORT: Fixed ROM slots 9808.
            if slot <> 9808 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9809 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:237
//		BZMF	COMZERO
// PORT: Fixed ROM slots 9809.
            if slot <> 9809 or instruction <> 26199 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26199, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9810 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:238
//		COM
// PORT: Fixed ROM slots 9810.
                if slot <> 9810 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:239
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9811.
                if slot <> 9811 or instruction <> 21308 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[602] to agcAotUnit602@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:240
//		TS	COMMAND
// PORT: Fixed ROM slots 9812.
    9812, 46706
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9813–9816.
function agcAotUnit603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9814 {
        if slot <= 9813 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:241
//		CA	-COMMAX-
// PORT: Fixed ROM slots 9813.
            if slot <> 9813 or instruction <> 14310 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2022), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:242
//		TC	NEXTCDU
// PORT: Fixed ROM slots 9814.
            if slot <> 9814 or instruction <> 1584 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1584, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9815 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:243
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:244
//COMZERO		CAF	ZERO
// PORT: Fixed ROM slots 9815.
            if slot <> 9815 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:245
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9816.
            if slot <> 9816 or instruction <> 21308 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21308, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21308, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[603] to agcAotUnit603@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:246
//		XCH	COMMAND
// PORT: Fixed ROM slots 9817.
    9817, 48754
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9818–9823.
function agcAotUnit604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9820 {
        if slot <= 9818 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:247
//		TC	NEXTCDU
// PORT: Fixed ROM slots 9818.
            if slot <> 9818 or instruction <> 1584 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1584, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9819 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:248
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:249
//SENDPULS	CAF	13,14,15
// PORT: Fixed ROM slots 9819.
                if slot <> 9819 or instruction <> 16352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4064), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:250
//		EXTEND
// PORT: Fixed ROM slots 9820.
                if slot <> 9820 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9821 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:251
//		WOR	CHAN14
// PORT: Fixed ROM slots 9821.
            if slot <> 9821 or instruction <> 2572 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9822 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:252
//		CAF	600MS
// PORT: Fixed ROM slots 9822.
                if slot <> 9822 or instruction <> 14311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2023), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:253
//		TCF	COARS2 -1	# THEN TO VARDELAY
// PORT: Fixed ROM slots 9823.
                if slot <> 9823 or instruction <> 5663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[604] to agcAotUnit604@.

// PORT: Physical bank 07. Shared continuation entries, slots 9824–9862.
function agcAotUnit605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9842 {
        if slot <= 9832 {
            if slot <= 9827 {
                if slot <= 9825 {
                    if slot <= 9824 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:254
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:255
//CA+ECE		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// PORT: Fixed ROM slots 9824.
                        if slot <> 9824 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:256
//		EXTEND
// PORT: Fixed ROM slots 9825.
                        if slot <> 9825 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9826 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:257
//		WOR	CHAN12
// PORT: Fixed ROM slots 9826.
                        if slot <> 9826 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:258
//		TC	TASKOVER
// PORT: Fixed ROM slots 9827.
                        if slot <> 9827 or instruction <> 2737 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2737, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9829 {
                    if slot <= 9828 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:259
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:260
//# Page 1315
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:261
//SETCOARS	CAF	BIT4		# BYPASS IF ALREADY IN COARSE ALIGN
// PORT: Fixed ROM slots 9828.
                        if slot <> 9828 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:262
//		EXTEND
// PORT: Fixed ROM slots 9829.
                        if slot <> 9829 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9830 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:263
//		RAND	CHAN12
// PORT: Fixed ROM slots 9830.
                        if slot <> 9830 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9831 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:264
//		CCS	A
// PORT: Fixed ROM slots 9831.
                            if slot <> 9831 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:265
//		TC	Q
// PORT: Fixed ROM slots 9832.
                            if slot <> 9832 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9837 {
                if slot <= 9834 {
                    if slot <= 9833 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:266
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:267
//		CS	BIT6		# CLEAR ISS ERROR COUNTERS
// PORT: Fixed ROM slots 9833.
                        if slot <> 9833 or instruction <> 18918 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:268
//		EXTEND
// PORT: Fixed ROM slots 9834.
                        if slot <> 9834 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9835 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:269
//		WAND	CHAN12
// PORT: Fixed ROM slots 9835.
                        if slot <> 9835 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9836 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:270
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:271
//		CS	BIT10		# KNOCK DOWN GYRO ACTIVITY
// PORT: Fixed ROM slots 9836.
                            if slot <> 9836 or instruction <> 18914 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:272
//		EXTEND
// PORT: Fixed ROM slots 9837.
                            if slot <> 9837 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9839 {
                    if slot <= 9838 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:273
//		WAND	CHAN14
// PORT: Fixed ROM slots 9838.
                        if slot <> 9838 or instruction <> 1548 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:274
//		CS	ZERO
// PORT: Fixed ROM slots 9839.
                        if slot <> 9839 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9840 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:275
//		TS	GYROCMD
// PORT: Fixed ROM slots 9840.
                        if slot <> 9840 or instruction <> 22567 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22567, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9841 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:276
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:277
//		CAF	BIT4		# PUT ISS IN COARSE ALIGN
// PORT: Fixed ROM slots 9841.
                            if slot <> 9841 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:278
//		EXTEND
// PORT: Fixed ROM slots 9842.
                            if slot <> 9842 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 9852 {
            if slot <= 9847 {
                if slot <= 9844 {
                    if slot <= 9843 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:279
//		WOR	CHAN12
// PORT: Fixed ROM slots 9843.
                        if slot <> 9843 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:280
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:281
//		CS	DSPTAB +11D	# TURN ON NO ATT LAMP
// PORT: Fixed ROM slots 9844.
                        if slot <> 9844 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9845 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:282
//		MASK	OCT40010
// PORT: Fixed ROM slots 9845.
                        if slot <> 9845 or instruction <> 30343 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1671), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9846 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:283
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 9846.
                            if slot <> 9846 or instruction <> 11806 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:284
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:285
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9847.
                            if slot <> 9847 or instruction <> 17091 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 707).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9849 {
                    if slot <= 9848 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:286
//		MASK	BIT6
// PORT: Fixed ROM slots 9848.
                        if slot <> 9848 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:287
//		ADS	IMODES33
// PORT: Fixed ROM slots 9849.
                        if slot <> 9849 or instruction <> 11971 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9850 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:288
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:289
//		CS	IMODES30	# DISABLE IMUFAIL
// PORT: Fixed ROM slots 9850.
                        if slot <> 9850 or instruction <> 17090 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 706).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9851 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:290
//		MASK	BIT4
// PORT: Fixed ROM slots 9851.
                            if slot <> 9851 or instruction <> 31208 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                if fixedOperand = 8 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:291
//		ADS	IMODES30
// PORT: Fixed ROM slots 9852.
                            if slot <> 9852 or instruction <> 11970 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 706).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9857 {
                if slot <= 9854 {
                    if slot <= 9853 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:292
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:293
//RNDREFDR	CS	TRACKBIT	# CLEAR TRACK FLAG
// PORT: Fixed ROM slots 9853.
                        if slot <> 9853 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:294
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 9854.
                        if slot <> 9854 or instruction <> 28733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9855 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:295
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 9855.
                        if slot <> 9855 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9856 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:296
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:297
//		CS	DRFTBIT		# CLEAR DRIFT FLAG
// PORT: Fixed ROM slots 9856.
                            if slot <> 9856 or instruction <> 18909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:298
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 9857.
                            if slot <> 9857 or instruction <> 28734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9859 {
                    if slot <= 9858 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:299
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 9858.
                        if slot <> 9858 or instruction <> 22590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:300
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:301
//		CS	REFSMBIT	# CLEAR REFSMMAT FLAG
// PORT: Fixed ROM slots 9859.
                        if slot <> 9859 or instruction <> 18911 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9860 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:302
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 9860.
                        if slot <> 9860 or instruction <> 28735 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 63).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9861 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:303
//		TS	FLAGWRD3
// PORT: Fixed ROM slots 9861.
                            if slot <> 9861 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:304
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:305
//		TC	Q
// PORT: Fixed ROM slots 9862.
                            if slot <> 9862 or instruction <> 2 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[605] to agcAotUnit605@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:306
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:307
//OCT40010	OCT	40010
// PORT: Fixed ROM slots 9863.
    9863, 32784
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9864–9874.
function agcAotUnit606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9868 {
        if slot <= 9865 {
            if slot <= 9864 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:308
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:309
//# Page 1316
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:310
//# IMU FINE ALIGN MODE SWITCH.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:311
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:312
//IMUFINE		INHINT
// PORT: Fixed ROM slots 9864.
                if slot <> 9864 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:313
//		TC	CAGETSTJ	# SEE IF IMU BEING CAGED.
// PORT: Fixed ROM slots 9865.
                if slot <> 9865 or instruction <> 1963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1963, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9866 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:314
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:315
//		CS	BITS4-5		# RESET ZERO AND COARSE
// PORT: Fixed ROM slots 9866.
                if slot <> 9866 or instruction <> 18404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2020), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9867 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:316
//		EXTEND
// PORT: Fixed ROM slots 9867.
                    if slot <> 9867 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:317
//		WAND	CHAN12
// PORT: Fixed ROM slots 9868.
                    if slot <> 9868 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9871 {
            if slot <= 9869 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:318
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:319
//		CS	BIT6		# INSURE DAP AUTO AND HOLD MODES ENABLED
// PORT: Fixed ROM slots 9869.
                if slot <> 9869 or instruction <> 18918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9870 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:320
//		MASK	IMODES33
// PORT: Fixed ROM slots 9870.
                    if slot <> 9870 or instruction <> 29379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:321
//		TS	IMODES33
// PORT: Fixed ROM slots 9871.
                    if slot <> 9871 or instruction <> 23235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23235, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9872 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:322
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:323
//		TC	NOATTOFF
// PORT: Fixed ROM slots 9872.
                if slot <> 9872 or instruction <> 1718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1718, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9873 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:324
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:325
//		CAF	BIT10		# IMU FAIL WAS INHIBITED DURING THE
// PORT: Fixed ROM slots 9873.
                    if slot <> 9873 or instruction <> 14818 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:326
//		TC	WAITLIST	# PRESUMABLY PRECEDING COARSE ALIGN.  LEAVE
// PORT: Fixed ROM slots 9874.
                    if slot <> 9874 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[606] to agcAotUnit606@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:327
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:328
//		2CADR	IFAILOK		# IT ON FOR THE FIRST 5 SECS OF FINE ALIGN
// PORT: Fixed ROM slots 9875 9876.
    9875, 3384, 9876, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9877–9878.
function agcAotUnit607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9877 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:329
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:330
//		CAF	2SECS
// PORT: Fixed ROM slots 9877.
        if slot <> 9877 or instruction <> 14848 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:331
//		TC	WAITLIST
// PORT: Fixed ROM slots 9878.
        if slot <> 9878 or instruction <> 2691 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2691, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[607] to agcAotUnit607@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:332
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:333
//		2CADR	IMUFINED
// PORT: Fixed ROM slots 9879 9880.
    9879, 3380, 9880, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9881–9897.
function agcAotUnit608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9888 {
        if slot <= 9884 {
            if slot <= 9882 {
                if slot <= 9881 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:334
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:335
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9881.
                    if slot <> 9881 or instruction <> 5613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5613, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:336
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:337
//IMUFINED	TC	CAGETEST	# SEE THAT NO ONE HAS CAGED THE IMU.
// PORT: Fixed ROM slots 9882.
                    if slot <> 9882 or instruction <> 1953 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1953, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9883 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:338
//		TCF	ENDIMU
// PORT: Fixed ROM slots 9883.
                    if slot <> 9883 or instruction <> 6041 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6041, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:339
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:340
//# Page 1317
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:341
//IFAILOK		TC	CAGETSTQ	# ENABLE IMU FAIL UNLESS IMU BEING CAGED.
// PORT: Fixed ROM slots 9884.
                    if slot <> 9884 or instruction <> 1958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1958, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9886 {
                if slot <= 9885 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:342
//		TCF	TASKOVER	# IT IS.
// PORT: Fixed ROM slots 9885.
                    if slot <> 9885 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:343
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:344
//		CAF	BIT4		# DON'T RESET IMU FAIL INHIBIT IF SOMEONE
// PORT: Fixed ROM slots 9886.
                    if slot <> 9886 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9887 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:345
//		EXTEND			# HAS GONE INTO COARSE ALIGN.
// PORT: Fixed ROM slots 9887.
                    if slot <> 9887 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:346
//		RAND	CHAN12
// PORT: Fixed ROM slots 9888.
                    if slot <> 9888 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9892 {
            if slot <= 9890 {
                if slot <= 9889 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:347
//		CCS	A
// PORT: Fixed ROM slots 9889.
                    if slot <> 9889 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:348
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9890.
                    if slot <> 9890 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9891 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:349
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:350
//		CS	IMODES30	# RESET IMUFAIL.
// PORT: Fixed ROM slots 9891.
                    if slot <> 9891 or instruction <> 17090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 706).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:351
//		MASK	BIT13
// PORT: Fixed ROM slots 9892.
                    if slot <> 9892 or instruction <> 31199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        if fixedOperand = 4096 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9894 {
                if slot <= 9893 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:352
//		ADS	IMODES30
// PORT: Fixed ROM slots 9893.
                    if slot <> 9893 or instruction <> 11970 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:353
//		CS	BIT4
// PORT: Fixed ROM slots 9894.
                    if slot <> 9894 or instruction <> 18920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9895 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:354
//PFAILOK2	MASK	IMODES30
// PORT: Fixed ROM slots 9895.
                    if slot <> 9895 or instruction <> 29378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9896 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:355
//		TS	IMODES30
// PORT: Fixed ROM slots 9896.
                        if slot <> 9896 or instruction <> 23234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23234, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:356
//		TC	IBNKCALL	# THE ISS WARNING LIGHT MAY COME ON NOW
// PORT: Fixed ROM slots 9897.
                        if slot <> 9897 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[608] to agcAotUnit608@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:357
//		CADR	SETISSW		# THAT THE INHIBIT WAS BEEN REMOVED.
// PORT: Fixed ROM slots 9898.
    9898, 13190
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9899–9925.
function agcAotUnit609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9911 {
        if slot <= 9904 {
            if slot <= 9901 {
                if slot <= 9899 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:358
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9899.
                    if slot <> 9899 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9900 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:359
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:360
//PFAILOK		TC	CAGETSTQ	# ENABLE PIP FAIL PROG ALARM.
// PORT: Fixed ROM slots 9900.
                        if slot <> 9900 or instruction <> 1958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1958, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:361
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9901.
                        if slot <> 9901 or instruction <> 6833 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6833, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9902 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:362
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:363
//		CS	IMODES30	# RESET IMU AND PIPA FAIL BITS.
// PORT: Fixed ROM slots 9902.
                    if slot <> 9902 or instruction <> 17090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 706).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9903 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:364
//		MASK	BIT10
// PORT: Fixed ROM slots 9903.
                        if slot <> 9903 or instruction <> 31202 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            if fixedOperand = 512 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:365
//		ADS	IMODES30
// PORT: Fixed ROM slots 9904.
                        if slot <> 9904 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9907 {
                if slot <= 9905 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:366
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:367
//		CS	IMODES33
// PORT: Fixed ROM slots 9905.
                    if slot <> 9905 or instruction <> 17091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 707).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9906 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:368
//		MASK	BIT13
// PORT: Fixed ROM slots 9906.
                        if slot <> 9906 or instruction <> 31199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:369
//		ADS	IMODES33
// PORT: Fixed ROM slots 9907.
                        if slot <> 9907 or instruction <> 11971 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9909 {
                    if slot <= 9908 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:370
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:371
//		CS	BIT5
// PORT: Fixed ROM slots 9908.
                        if slot <> 9908 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:372
//		TCF	PFAILOK2
// PORT: Fixed ROM slots 9909.
                        if slot <> 9909 or instruction <> 5799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9910 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:373
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:374
//NOATTOFF	CS	OCT40010	# SUBROUTINE TO TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 9910.
                        if slot <> 9910 or instruction <> 18055 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1671), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:375
//		MASK	DSPTAB +11D
// PORT: Fixed ROM slots 9911.
                        if slot <> 9911 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9918 {
            if slot <= 9914 {
                if slot <= 9912 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:376
//		AD	BIT15
// PORT: Fixed ROM slots 9912.
                    if slot <> 9912 or instruction <> 27101 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9913 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:377
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 9913.
                        if slot <> 9913 or instruction <> 23070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:378
//		TC	Q
// PORT: Fixed ROM slots 9914.
                        if slot <> 9914 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9916 {
                    if slot <= 9915 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:379
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:380
//# Page 1318
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:381
//# ROUTINES TO INITIATE AND TERMINATE PROGRAM USE OF THE PIPAS. NO IMUSTALL REQUIRED IN EITHER CASE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:382
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:383
//PIPUSE		CS	ZERO
// PORT: Fixed ROM slots 9915.
                        if slot <> 9915 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:384
//		TS	PIPAX
// PORT: Fixed ROM slots 9916.
                        if slot <> 9916 or instruction <> 22559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9917 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:385
//		TS	PIPAY
// PORT: Fixed ROM slots 9917.
                        if slot <> 9917 or instruction <> 22560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:386
//		TS	PIPAZ
// PORT: Fixed ROM slots 9918.
                        if slot <> 9918 or instruction <> 22561 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22561, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9921 {
                if slot <= 9919 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:387
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:388
//PIPUSE1		TC	CAGETSTQ	# DO NOT ENABLE PIPA FAIL IF IMU IS CAGED
// PORT: Fixed ROM slots 9919.
                    if slot <> 9919 or instruction <> 1958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1958, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9920 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:389
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9920.
                        if slot <> 9920 or instruction <> 6553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:390
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:391
//		INHINT
// PORT: Fixed ROM slots 9921.
                        if slot <> 9921 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9923 {
                    if slot <= 9922 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:392
//		CS	BIT1		# IF PIPA FAILS FROM NOW ON (UNTIL
// PORT: Fixed ROM slots 9922.
                        if slot <> 9922 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:393
//		MASK	IMODES30	# PIPFREE), LIGHT ISS WARNING.
// PORT: Fixed ROM slots 9923.
                        if slot <> 9923 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9924 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:394
//		TS	IMODES30
// PORT: Fixed ROM slots 9924.
                        if slot <> 9924 or instruction <> 23234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23234, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:395
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:396
//PIPFREE2	TC	IBNKCALL	# ISS WARNING MIGHT COME ON NOW.
// PORT: Fixed ROM slots 9925.
                        if slot <> 9925 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[609] to agcAotUnit609@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:397
//		CADR	SETISSW		# (OR GO OFF ON PIPFREE).
// PORT: Fixed ROM slots 9926.
    9926, 13190
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9927–9935.
function agcAotUnit610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9930 {
        if slot <= 9928 {
            if slot <= 9927 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:398
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:399
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9927.
                if slot <> 9927 or instruction <> 5613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:400
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:401
//PIPFREE		INHINT			# PROGRAM DONE WITH PIPAS.  DON'T LIGHT
// PORT: Fixed ROM slots 9928.
                if slot <> 9928 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9929 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:402
//		CS	IMODES30	# ISS WARNING.
// PORT: Fixed ROM slots 9929.
                if slot <> 9929 or instruction <> 17090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 706).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:403
//		MASK	BIT1
// PORT: Fixed ROM slots 9930.
                if slot <> 9930 or instruction <> 31211 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9932 {
            if slot <= 9931 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:404
//		ADS	IMODES30
// PORT: Fixed ROM slots 9931.
                if slot <> 9931 or instruction <> 11970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 706).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:405
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:406
//		MASK	BIT10		# IF PIP FAIL ON, DO PROG ALSRM AND RESET
// PORT: Fixed ROM slots 9932.
                if slot <> 9932 or instruction <> 31202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    if fixedOperand = 512 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9933 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:407
//		CCS	A		# ISS WARNING.
// PORT: Fixed ROM slots 9933.
                if slot <> 9933 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9934 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:408
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9934.
                    if slot <> 9934 or instruction <> 5613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5613, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:409
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:410
//		TC	ALARM
// PORT: Fixed ROM slots 9935.
                    if slot <> 9935 or instruction <> 2935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[610] to agcAotUnit610@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:411
//		OCT	212
// PORT: Fixed ROM slots 9936.
    9936, 276
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9937–9948.
function agcAotUnit611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9942 {
        if slot <= 9939 {
            if slot <= 9937 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:412
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:413
//		INHINT
// PORT: Fixed ROM slots 9937.
                if slot <> 9937 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9938 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:414
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:415
//		TCF	PIPFREE2
// PORT: Fixed ROM slots 9938.
                    if slot <> 9938 or instruction <> 5829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5829, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:416
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:417
//# Page 1319
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:418
//#          THE FOLLOWING ROUTINE TORQUES THE IRIGS ACCORDING TO DOUBLE PRECISION INPUTS IN THE SIX REGISTERS
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:419
//# BEGINNING AT THE ECADR ARRIVING IN A. THE MINIMUM SIZE OF ANY PULSE TRAIN IS 16 PULSES (.25 CDU COUNTS). THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:420
//# UNSENT PORTION OF THE COMMAND IS LEFT INTACT IN THE INPUT COMMAND REGISTERS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:421
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:422
//		EBANK=	1400		# VARIABLE, ACTUALLY.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:423
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:424
//IMUPULSE	TS	MPAC +5		# SAVE ARRIVING ECADR.
// PORT: Fixed ROM slots 9939.
                    if slot <> 9939 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9940 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:425
//		TC	CAGETSTJ	# DON'T PROCEED IF IMU BEING CAGED.
// PORT: Fixed ROM slots 9940.
                if slot <> 9940 or instruction <> 1963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1963, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9941 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:426
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:427
//		CCS	LGYRO		# SEE IF GYROS BUSY.
// PORT: Fixed ROM slots 9941.
                    if slot <> 9941 or instruction <> 4812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 716).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:428
//		TC	GYROBUSY	# SLEEP.
// PORT: Fixed ROM slots 9942.
                    if slot <> 9942 or instruction <> 1783 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1783, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9945 {
            if slot <= 9943 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:429
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:430
//		TS	MPAC +2
// PORT: Fixed ROM slots 9943.
                if slot <> 9943 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9944 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:431
//		CAF	BIT6		# ENABLE THE POWER SUPPLY.
// PORT: Fixed ROM slots 9944.
                    if slot <> 9944 or instruction <> 14822 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:432
//		EXTEND
// PORT: Fixed ROM slots 9945.
                    if slot <> 9945 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9946 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:433
//		WOR	CHAN14
// PORT: Fixed ROM slots 9946.
                if slot <> 9946 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9947 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:434
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:435
//		CAF	FOUR
// PORT: Fixed ROM slots 9947.
                    if slot <> 9947 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:436
//GWAKE2		TC	WAITLIST	# (IF A JOB WAS PUT TO SLEEP, THE POWER
// PORT: Fixed ROM slots 9948.
                    if slot <> 9948 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[611] to agcAotUnit611@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:437
//		EBANK=	CDUIND		# SUPPLY IS LEFT ON BY THE WAKING JOB).
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:438
//		2CADR	STRTGYRO
// PORT: Fixed ROM slots 9949 9950.
    9949, 3594, 9950, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9951–9961.
function agcAotUnit612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9955 {
        if slot <= 9952 {
            if slot <= 9951 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:439
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:440
//		CA	MPAC +5		# SET UP EBANK, SAVING CALLER'S EBANK FOR
// PORT: Fixed ROM slots 9951.
                if slot <> 9951 or instruction <> 12401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 113).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:441
//		XCH	EBANK		# RESTORATION ON RETURN.
// PORT: Fixed ROM slots 9952.
                if slot <> 9952 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9953 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:442
//		XCH	MPAC +5
// PORT: Fixed ROM slots 9953.
                if slot <> 9953 or instruction <> 23665 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 113, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9954 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:443
//		TS	LGYRO		# RESERVES GYROS.
// PORT: Fixed ROM slots 9954.
                    if slot <> 9954 or instruction <> 23244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23244, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:444
//		MASK	LOW8
// PORT: Fixed ROM slots 9955.
                    if slot <> 9955 or instruction <> 30959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                        if fixedOperand = 255 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
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
        if slot <= 9958 {
            if slot <= 9956 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:445
//		TS	ITEMP1
// PORT: Fixed ROM slots 9956.
                if slot <> 9956 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9957 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:446
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:447
//		CAF	TWO		# FORCE SIGN AGREEMENT ON INPUTS.
// PORT: Fixed ROM slots 9957.
                    if slot <> 9957 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:448
//GYROAGRE	TS	MPAC +3
// PORT: Fixed ROM slots 9958.
                    if slot <> 9958 or instruction <> 22639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22639, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9959 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:449
//		DOUBLE
// PORT: Fixed ROM slots 9959.
                if slot <> 9959 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9960 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:450
//		AD	ITEMP1
// PORT: Fixed ROM slots 9960.
                    if slot <> 9960 or instruction <> 24625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:451
//		TS	MPAC +4
// PORT: Fixed ROM slots 9961.
                    if slot <> 9961 or instruction <> 22640 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22640, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[612] to agcAotUnit612@.

// PORT: Physical bank 07. Shared continuation entries, slots 9962–9963.
function agcAotUnit613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9962 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:452
//		EXTEND
// PORT: Fixed ROM slots 9962.
        if slot <> 9962 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:453
//		INDEX	A
// PORT: Fixed ROM slots 9963.
        if slot <> 9963 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[613] to agcAotUnit613@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:454
//		DCA	1400
// PORT: Fixed ROM slots 9964.
    9964, 26114
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9965–9968.
function agcAotUnit614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9966 {
        if slot <= 9965 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:455
//		DXCH	MPAC
// PORT: Fixed ROM slots 9965.
            if slot <> 9965 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:456
//		TC	TPAGREE
// PORT: Fixed ROM slots 9966.
            if slot <> 9966 or instruction <> 3759 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3759, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9967 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:457
//		DXCH	MPAC
// PORT: Fixed ROM slots 9967.
            if slot <> 9967 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:458
//		INDEX	MPAC +4
// PORT: Fixed ROM slots 9968.
            if slot <> 9968 or instruction <> 20592 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20592, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20592, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[614] to agcAotUnit614@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:459
//		DXCH	1400
// PORT: Fixed ROM slots 9969.
    9969, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9970–9987.
function agcAotUnit615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9978 {
        if slot <= 9973 {
            if slot <= 9971 {
                if slot <= 9970 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:460
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:461
//		CCS	MPAC +3
// PORT: Fixed ROM slots 9970.
                    if slot <> 9970 or instruction <> 4207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 111).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:462
//		TCF	GYROAGRE
// PORT: Fixed ROM slots 9971.
                    if slot <> 9971 or instruction <> 5862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9972 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:463
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:464
//		CA	MPAC +5		# RESTORE CALLER'S EBANK.
// PORT: Fixed ROM slots 9972.
                    if slot <> 9972 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:465
//		TS	EBANK
// PORT: Fixed ROM slots 9973.
                    if slot <> 9973 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9975 {
                if slot <= 9974 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:466
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9974.
                    if slot <> 9974 or instruction <> 5613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5613, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:467
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:468
//# Page 1320
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:469
//# ROUTINES TO ALLOW TORQUING ONLY ONE JOB AT A TIME.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:470
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:471
//GYROBUSY	EXTEND			# SAVE RETURN 2FCADR.
// PORT: Fixed ROM slots 9975.
                    if slot <> 9975 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9976 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:472
//		DCA	BUF2
// PORT: Fixed ROM slots 9976.
                    if slot <> 9976 or instruction <> 12380 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9977 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:473
//		DXCH	MPAC
// PORT: Fixed ROM slots 9977.
                        if slot <> 9977 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:474
//REGSLEEP	CAF	LGWAKE
// PORT: Fixed ROM slots 9978.
                        if slot <> 9978 or instruction <> 14084 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1796), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9982 {
            if slot <= 9980 {
                if slot <= 9979 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:475
//		TCF	JOBSLEEP
// PORT: Fixed ROM slots 9979.
                    if slot <> 9979 or instruction <> 6747 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6747, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:476
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:477
//GWAKE		CCS	LGYRO		# WHEN AWAKENED, SEE IF GYROS STILL BUSY.
// PORT: Fixed ROM slots 9980.
                    if slot <> 9980 or instruction <> 4812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 716).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9981 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:478
//		TCF	REGSLEEP	# IF SO, SLEEP SOME MORE.
// PORT: Fixed ROM slots 9981.
                    if slot <> 9981 or instruction <> 5882 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5882, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:479
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:480
//		TS	MPAC +2
// PORT: Fixed ROM slots 9982.
                    if slot <> 9982 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9984 {
                if slot <= 9983 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:481
//		EXTEND
// PORT: Fixed ROM slots 9983.
                    if slot <> 9983 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:482
//		DCA	MPAC
// PORT: Fixed ROM slots 9984.
                    if slot <> 9984 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9985 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:483
//		DXCH	BUF2		# RESTORE SWRETURN INFO.
// PORT: Fixed ROM slots 9985.
                    if slot <> 9985 or instruction <> 21596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9986 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:484
//		CAF	ONE
// PORT: Fixed ROM slots 9986.
                        if slot <> 9986 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:485
//		TCF	GWAKE2
// PORT: Fixed ROM slots 9987.
                        if slot <> 9987 or instruction <> 5852 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5852, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[615] to agcAotUnit615@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:486
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:487
//LGWAKE		CADR	GWAKE
// PORT: Fixed ROM slots 9988.
    9988, 15864
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9989–9996.
function agcAotUnit616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9992 {
        if slot <= 9990 {
            if slot <= 9989 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:488
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:489
//# Page 1321
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:490
//# GYRO-TORQUING WAITLIST TASKS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:491
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:492
//STRTGYRO	CS	GDESELCT	# DE-SELECT LAST GYRO.
// PORT: Fixed ROM slots 9989.
                if slot <> 9989 or instruction <> 18326 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1942), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:493
//		EXTEND
// PORT: Fixed ROM slots 9990.
                if slot <> 9990 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9991 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:494
//		WAND	CHAN14
// PORT: Fixed ROM slots 9991.
                if slot <> 9991 or instruction <> 1548 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:495
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:496
//		TC	CAGETEST
// PORT: Fixed ROM slots 9992.
                if slot <> 9992 or instruction <> 1953 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1953, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9994 {
            if slot <= 9993 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:497
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:498
//STRTGYR2	CA	LGYRO		# JUMP ON PHASE COUNTER IN BITS 13-14.
// PORT: Fixed ROM slots 9993.
                if slot <> 9993 or instruction <> 13004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 716).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:499
//		EXTEND
// PORT: Fixed ROM slots 9994.
                if slot <> 9994 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9995 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:500
//		MP	BIT4
// PORT: Fixed ROM slots 9995.
                if slot <> 9995 or instruction <> 31208 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:501
//		INDEX	A
// PORT: Fixed ROM slots 9996.
                if slot <> 9996 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[616] to agcAotUnit616@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:502
//		TCF	+1
// PORT: Fixed ROM slots 9997.
    9997, 11804
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9998–9998.
function agcAotUnit617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:503
//		TC	GSELECT		# =0.  DO Y GYRO.
// PORT: Fixed ROM slots 9998.
    if slot <> 9998 or instruction <> 1819 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1819, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[617] to agcAotUnit617@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:504
//		OCT	00202
// PORT: Fixed ROM slots 9999.
    9999, 260
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10000–10000.
function agcAotUnit618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:505
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:506
//		TC	GSELECT		# =1.  DO Z GYRO.
// PORT: Fixed ROM slots 10000.
    if slot <> 10000 or instruction <> 1819 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1819, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[618] to agcAotUnit618@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:507
//		OCT	00302
// PORT: Fixed ROM slots 10001.
    10001, 388
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10002–10002.
function agcAotUnit619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:508
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:509
//		TC	GSELECT -2	# =2.  DO X GYRO.
// PORT: Fixed ROM slots 10002.
    if slot <> 10002 or instruction <> 1817 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1817, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[619] to agcAotUnit619@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:510
//		OCT	00100
// PORT: Fixed ROM slots 10003.
    10003, 128
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10004–10011.
function agcAotUnit620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10007 {
        if slot <= 10005 {
            if slot <= 10004 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:511
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:512
//		CAF	ZERO		# =3.  DONE
// PORT: Fixed ROM slots 10004.
                if slot <> 10004 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:513
//		TS	LGYRO
// PORT: Fixed ROM slots 10005.
                if slot <> 10005 or instruction <> 23244 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23244, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10006 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:514
//		CAF	LGWAKE		# WAKE A POSSIBLE SLEEPING JOB.
// PORT: Fixed ROM slots 10006.
                if slot <> 10006 or instruction <> 14084 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1796), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:515
//		TC	JOBWAKE
// PORT: Fixed ROM slots 10007.
                if slot <> 10007 or instruction <> 2655 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2655, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10009 {
            if slot <= 10008 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:516
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:517
//NORESET		TCF	IMUFINED	# DO NOT RESET POWER SUPPLY
// PORT: Fixed ROM slots 10008.
                if slot <> 10008 or instruction <> 5786 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5786, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:518
//# Page 1322
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:519
// -2		CS	FOUR		# SPECIAL ENTRY TO REGRESS LGYRO FOR X.
// PORT: Fixed ROM slots 10009.
                if slot <> 10009 or instruction <> 18921 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10010 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:520
//		ADS	LGYRO
// PORT: Fixed ROM slots 10010.
                if slot <> 10010 or instruction <> 11980 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 716).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:521
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:522
//GSELECT		INDEX	Q		# SELECT GYRO.
// PORT: Fixed ROM slots 10011.
                if slot <> 10011 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[620] to agcAotUnit620@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:523
//		CAF	0		# PACKED WORD CONTAINS GYRO SELECT BITS
// PORT: Fixed ROM slots 10012.
    10012, 24576
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10013–10024.
function agcAotUnit621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10018 {
        if slot <= 10015 {
            if slot <= 10013 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:524
//		TS	ITEMP4		# AND INCREMENT TO LGYRO.
// PORT: Fixed ROM slots 10013.
                if slot <> 10013 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10014 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:525
//		MASK	SEVEN
// PORT: Fixed ROM slots 10014.
                    if slot <> 10014 or instruction <> 31215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:526
//		AD	BIT13
// PORT: Fixed ROM slots 10015.
                    if slot <> 10015 or instruction <> 27103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10016 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:527
//		ADS	LGYRO
// PORT: Fixed ROM slots 10016.
                if slot <> 10016 or instruction <> 11980 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 716).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10017 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:528
//		TS	EBANK
// PORT: Fixed ROM slots 10017.
                    if slot <> 10017 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:529
//		MASK	LOW8
// PORT: Fixed ROM slots 10018.
                    if slot <> 10018 or instruction <> 30959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                        if fixedOperand = 255 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
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
        if slot <= 10021 {
            if slot <= 10019 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:530
//		TS	ITEMP1
// PORT: Fixed ROM slots 10019.
                if slot <> 10019 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10020 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:531
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:532
//		CS	SEVEN
// PORT: Fixed ROM slots 10020.
                    if slot <> 10020 or instruction <> 18927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:533
//		MASK	ITEMP4
// PORT: Fixed ROM slots 10021.
                    if slot <> 10021 or instruction <> 28724 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 52).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10022 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:534
//		TS	ITEMP4
// PORT: Fixed ROM slots 10022.
                if slot <> 10022 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10023 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:535
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:536
//		EXTEND			# MOVE DP COMMAND TO RUPTREGS FOR TESTING.
// PORT: Fixed ROM slots 10023.
                    if slot <> 10023 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:537
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 10024.
                    if slot <> 10024 or instruction <> 20529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[621] to agcAotUnit621@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:538
//		DCA	1400
// PORT: Fixed ROM slots 10025.
    10025, 26114
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10026–10063.
function agcAotUnit622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10044 {
        if slot <= 10034 {
            if slot <= 10029 {
                if slot <= 10027 {
                    if slot <= 10026 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:539
//		DXCH	RUPTREG1
// PORT: Fixed ROM slots 10026.
                        if slot <> 10026 or instruction <> 21561 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:540
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:541
//		CCS	RUPTREG1
// PORT: Fixed ROM slots 10027.
                        if slot <> 10027 or instruction <> 4152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10028 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:542
//		TCF	MAJ+
// PORT: Fixed ROM slots 10028.
                        if slot <> 10028 or instruction <> 5943 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5943, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:543
//		TCF	+2
// PORT: Fixed ROM slots 10029.
                        if slot <> 10029 or instruction <> 5935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10031 {
                    if slot <= 10030 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:544
//		TCF	MAJ-
// PORT: Fixed ROM slots 10030.
                        if slot <> 10030 or instruction <> 6023 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6023, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:545
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:546
//		CCS	RUPTREG2
// PORT: Fixed ROM slots 10031.
                        if slot <> 10031 or instruction <> 4153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 57).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10032 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:547
//		TCF	MIN+
// PORT: Fixed ROM slots 10032.
                        if slot <> 10032 or instruction <> 5940 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5940, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10033 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:548
//		TCF	STRTGYR2
// PORT: Fixed ROM slots 10033.
                            if slot <> 10033 or instruction <> 5897 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5897, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:549
//		TCF	MIN-
// PORT: Fixed ROM slots 10034.
                            if slot <> 10034 or instruction <> 6020 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6020, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 10039 {
                if slot <= 10036 {
                    if slot <= 10035 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:550
//		TCF	STRTGYR2
// PORT: Fixed ROM slots 10035.
                        if slot <> 10035 or instruction <> 5897 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5897, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:551
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:552
//# Page 1323
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:553
//MIN+		AD	-GYROMIN	# SMALL POSITIVE COMMAND.  SEE IF AT LEAST
// PORT: Fixed ROM slots 10036.
                        if slot <> 10036 or instruction <> 26448 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1872), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10037 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:554
//		EXTEND			# 16 GYRO PULSES.
// PORT: Fixed ROM slots 10037.
                        if slot <> 10037 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10038 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:555
//		BZMF	STRTGYR2
// PORT: Fixed ROM slots 10038.
                            if slot <> 10038 or instruction <> 26377 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26377, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:556
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:557
//MAJ+		EXTEND			# DEFINITE POSITIVE OUTPUT.
// PORT: Fixed ROM slots 10039.
                            if slot <> 10039 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10041 {
                    if slot <= 10040 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:558
//		DCA	GYROFRAC
// PORT: Fixed ROM slots 10040.
                        if slot <> 10040 or instruction <> 14232 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1944, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:559
//		DAS	RUPTREG1
// PORT: Fixed ROM slots 10041.
                        if slot <> 10041 or instruction <> 8249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 57) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10042 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:560
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:561
//		CA	ITEMP4		# SELECT POSITIVE TORQUING FOR THIS GYRO.
// PORT: Fixed ROM slots 10042.
                        if slot <> 10042 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10043 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:562
//		EXTEND
// PORT: Fixed ROM slots 10043.
                            if slot <> 10043 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:563
//		WOR	CHAN14
// PORT: Fixed ROM slots 10044.
                            if slot <> 10044 or instruction <> 2572 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 10053 {
            if slot <= 10048 {
                if slot <= 10046 {
                    if slot <= 10045 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:564
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:565
//		CAF	LOW7		# LEAVE NUMBER OF POSSIBLE 8192 AUGMENTS
// PORT: Fixed ROM slots 10045.
                        if slot <> 10045 or instruction <> 15420 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:566
//		MASK	RUPTREG2	# TO INITIAL COMMAND IN MAJOR PART OF LONG
// PORT: Fixed ROM slots 10046.
                        if slot <> 10046 or instruction <> 28729 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 57).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10047 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:567
//		XCH	RUPTREG2	# TERM STORAGE AND TRUNCATED FRACTION
// PORT: Fixed ROM slots 10047.
                        if slot <> 10047 or instruction <> 23609 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 57, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:568
//GMERGE		EXTEND			# IN MINOR PART.  THE MAJOR PART WILL BE
// PORT: Fixed ROM slots 10048.
                        if slot <> 10048 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10050 {
                    if slot <= 10049 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:569
//		MP	BIT8		# COUNTED DOWN TO ZERO IN THE COURSE OF
// PORT: Fixed ROM slots 10049.
                        if slot <> 10049 or instruction <> 31204 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2532, readEffective:call(words, 2532)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:570
//		TS	ITEMP2		# PUTTING OUT THE ENTIRE COMMAND.
// PORT: Fixed ROM slots 10050.
                        if slot <> 10050 or instruction <> 22578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10051 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:571
//		CA	RUPTREG1
// PORT: Fixed ROM slots 10051.
                        if slot <> 10051 or instruction <> 12344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10052 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:572
//		EXTEND
// PORT: Fixed ROM slots 10052.
                            if slot <> 10052 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:573
//		MP	BIT9
// PORT: Fixed ROM slots 10053.
                            if slot <> 10053 or instruction <> 31203 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 10058 {
                if slot <= 10055 {
                    if slot <= 10054 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:574
//		TS	RUPTREG1
// PORT: Fixed ROM slots 10054.
                        if slot <> 10054 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:575
//		CA	L
// PORT: Fixed ROM slots 10055.
                        if slot <> 10055 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10056 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:576
//		EXTEND
// PORT: Fixed ROM slots 10056.
                        if slot <> 10056 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10057 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:577
//		MP	BIT14
// PORT: Fixed ROM slots 10057.
                            if slot <> 10057 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:578
//		ADS	ITEMP2		# INITIAL COMMAND.
// PORT: Fixed ROM slots 10058.
                            if slot <> 10058 or instruction <> 11314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 50).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10060 {
                    if slot <= 10059 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:579
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:580
//		EXTEND			# SEE IF MORE THAN ONE PULSE TRAIN NEEDED
// PORT: Fixed ROM slots 10059.
                        if slot <> 10059 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:581
//		DCA	RUPTREG1	# (MORE THAN 16383 PULSES).
// PORT: Fixed ROM slots 10060.
                        if slot <> 10060 or instruction <> 12345 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 57, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10061 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:582
//		AD	MINUS1
// PORT: Fixed ROM slots 10061.
                        if slot <> 10061 or instruction <> 28647 { return choose false if checkOnly else -1. }
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
                        if slot <= 10062 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:583
//		CCS	A
// PORT: Fixed ROM slots 10062.
                            if slot <> 10062 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:584
//		TCF	LONGGYRO
// PORT: Fixed ROM slots 10063.
                            if slot <> 10063 or instruction <> 5987 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5987, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[622] to agcAotUnit622@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:585
//-GYROMIN	OCT	-176		# MAY BE ADJUSTED TO SPECIFY MINIMUM CMD
// PORT: Fixed ROM slots 10064.
    10064, 65282
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10065–10069.
function agcAotUnit623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10066 {
        if slot <= 10065 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:586
//		TCF	+4
// PORT: Fixed ROM slots 10065.
            if slot <> 10065 or instruction <> 5973 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5973, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:587
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:588
//		CAF	BIT14
// PORT: Fixed ROM slots 10066.
            if slot <> 10066 or instruction <> 14814 { return choose false if checkOnly else -1. }
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
        if slot <= 10067 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:589
//		ADS	ITEMP2
// PORT: Fixed ROM slots 10067.
            if slot <> 10067 or instruction <> 11314 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10068 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:590
//		CAF	ZERO
// PORT: Fixed ROM slots 10068.
                if slot <> 10068 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:591
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:592
// +4		INDEX	ITEMP1
// PORT: Fixed ROM slots 10069.
                if slot <> 10069 or instruction <> 20529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[623] to agcAotUnit623@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:593
//		DXCH	1400
// PORT: Fixed ROM slots 10070.
    10070, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10071–10076.
function agcAotUnit624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10073 {
        if slot <= 10071 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:594
//# Page 1324
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:595
//		CA	ITEMP2		# ENTIRE COMMAND.
// PORT: Fixed ROM slots 10071.
            if slot <> 10071 or instruction <> 12338 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10072 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:596
//LASTSEG		TS	GYROCMD
// PORT: Fixed ROM slots 10072.
                if slot <> 10072 or instruction <> 22567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:597
//		EXTEND
// PORT: Fixed ROM slots 10073.
                if slot <> 10073 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10074 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:598
//		MP	BIT10		# WAITLIST DT
// PORT: Fixed ROM slots 10074.
            if slot <> 10074 or instruction <> 31202 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10075 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:599
//		AD	THREE		# TRUNCATION AND PHASE UNCERTAINTIES.
// PORT: Fixed ROM slots 10075.
                if slot <> 10075 or instruction <> 27813 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:600
//		TC	WAITLIST
// PORT: Fixed ROM slots 10076.
                if slot <> 10076 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[624] to agcAotUnit624@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:601
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:602
//		2CADR	STRTGYRO
// PORT: Fixed ROM slots 10077 10078.
    10077, 3594, 10078, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10079–10083.
function agcAotUnit625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10080 {
        if slot <= 10079 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:603
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:604
//GYROEXIT	CAF	BIT10
// PORT: Fixed ROM slots 10079.
            if slot <> 10079 or instruction <> 14818 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:605
//		EXTEND
// PORT: Fixed ROM slots 10080.
            if slot <> 10080 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10081 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:606
//		WOR	CHAN14
// PORT: Fixed ROM slots 10081.
            if slot <> 10081 or instruction <> 2572 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10082 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:607
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10082.
                if slot <> 10082 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:608
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:609
//LONGGYRO	INDEX	ITEMP1
// PORT: Fixed ROM slots 10083.
                if slot <> 10083 or instruction <> 20529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[625] to agcAotUnit625@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:610
//		DXCH	1400		# INITIAL COMMAND OUT PLUS N AUGMENTS OF
// PORT: Fixed ROM slots 10084.
    10084, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10085–10091.
function agcAotUnit626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10087 {
        if slot <= 10085 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:611
//		CAF	BIT14		# 8192.  INITIAL COMMAND IS AT LEAST 8192.
// PORT: Fixed ROM slots 10085.
            if slot <> 10085 or instruction <> 14814 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10086 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:612
//		AD	ITEMP2
// PORT: Fixed ROM slots 10086.
                if slot <> 10086 or instruction <> 24626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:613
//		TS	GYROCMD
// PORT: Fixed ROM slots 10087.
                if slot <> 10087 or instruction <> 22567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10089 {
            if slot <= 10088 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:614
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:615
//AUG3		EXTEND			# GET WAITLIST DT TO TIME WHEN TRAIN IS
// PORT: Fixed ROM slots 10088.
                if slot <> 10088 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:616
//		MP	BIT10		# ALMOST OUT.
// PORT: Fixed ROM slots 10089.
                if slot <> 10089 or instruction <> 31202 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10090 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:617
//		AD	NEG3
// PORT: Fixed ROM slots 10090.
                if slot <> 10090 or instruction <> 28645 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:618
//		TC	WAITLIST
// PORT: Fixed ROM slots 10091.
                if slot <> 10091 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[626] to agcAotUnit626@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:619
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:620
//		2CADR	8192AUG
// PORT: Fixed ROM slots 10092 10093.
    10092, 3806, 10093, 14470
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10094–10105.
function agcAotUnit627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10099 {
        if slot <= 10096 {
            if slot <= 10094 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:621
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:622
//		TCF	GYROEXIT
// PORT: Fixed ROM slots 10094.
                if slot <> 10094 or instruction <> 5983 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5983, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10095 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:623
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:624
//8192AUG		TC	CAGETEST
// PORT: Fixed ROM slots 10095.
                    if slot <> 10095 or instruction <> 1953 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1953, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:625
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:626
//		CAF	BIT4
// PORT: Fixed ROM slots 10096.
                    if slot <> 10096 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10097 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:627
//		EXTEND
// PORT: Fixed ROM slots 10097.
                if slot <> 10097 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10098 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:628
//		RAND	CHAN12
// PORT: Fixed ROM slots 10098.
                    if slot <> 10098 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:629
//		CCS	A
// PORT: Fixed ROM slots 10099.
                    if slot <> 10099 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 10102 {
            if slot <= 10100 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:630
//		TCF	IMUBAD
// PORT: Fixed ROM slots 10100.
                if slot <> 10100 or instruction <> 6047 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6047, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10101 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:631
//		CA	LGYRO		# ADD 8192 PULSES TO GYROCMD
// PORT: Fixed ROM slots 10101.
                    if slot <> 10101 or instruction <> 13004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 716).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:632
//		TS	EBANK
// PORT: Fixed ROM slots 10102.
                    if slot <> 10102 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10103 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:633
//		MASK	LOW8
// PORT: Fixed ROM slots 10103.
                if slot <> 10103 or instruction <> 30959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                    if fixedOperand = 255 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10104 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:634
//		TS	ITEMP1
// PORT: Fixed ROM slots 10104.
                    if slot <> 10104 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:635
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:636
//		INDEX	ITEMP1		# SEE IF THIS IS THE LAST AUG.
// PORT: Fixed ROM slots 10105.
                    if slot <> 10105 or instruction <> 20529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[627] to agcAotUnit627@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:637
//		CCS	1400
// PORT: Fixed ROM slots 10106.
    10106, 9728
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10107–10111.
function agcAotUnit628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10108 {
        if slot <= 10107 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:638
//		TCF	AUG2		# MORE TO COME.
// PORT: Fixed ROM slots 10107.
            if slot <> 10107 or instruction <> 6015 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6015, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:639
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:640
//		CAF	BIT14
// PORT: Fixed ROM slots 10108.
            if slot <> 10108 or instruction <> 14814 { return choose false if checkOnly else -1. }
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
        if slot <= 10109 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:641
//		ADS	GYROCMD
// PORT: Fixed ROM slots 10109.
            if slot <> 10109 or instruction <> 11303 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 39).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10110 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:642
//		TCF	LASTSEG +1
// PORT: Fixed ROM slots 10110.
                if slot <> 10110 or instruction <> 5977 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5977, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:643
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:644
//# Page 1325
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:645
//AUG2		INDEX	ITEMP1
// PORT: Fixed ROM slots 10111.
                if slot <> 10111 or instruction <> 20529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[628] to agcAotUnit628@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:646
//		TS	1400
// PORT: Fixed ROM slots 10112.
    10112, 46592
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10113–10133.
function agcAotUnit629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10122 {
        if slot <= 10117 {
            if slot <= 10114 {
                if slot <= 10113 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:647
//		CAF	BIT14
// PORT: Fixed ROM slots 10113.
                    if slot <> 10113 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:648
//		ADS	GYROCMD
// PORT: Fixed ROM slots 10114.
                    if slot <> 10114 or instruction <> 11303 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 39).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10115 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:649
//		TCF	AUG3		# COMPUTE DT.
// PORT: Fixed ROM slots 10115.
                    if slot <> 10115 or instruction <> 5992 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5992, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10116 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:650
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:651
//# Page 1326
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:652
//MIN-		AD	-GYROMIN	# POSSIBLE NEGATIVE OUTPUT.
// PORT: Fixed ROM slots 10116.
                        if slot <> 10116 or instruction <> 26448 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1872), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:653
//		EXTEND
// PORT: Fixed ROM slots 10117.
                        if slot <> 10117 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10119 {
                if slot <= 10118 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:654
//		BZMF	STRTGYR2
// PORT: Fixed ROM slots 10118.
                    if slot <> 10118 or instruction <> 26377 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26377, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:655
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:656
//MAJ-		EXTEND			# DEFINITE NEGATIVE OUTPUT.
// PORT: Fixed ROM slots 10119.
                    if slot <> 10119 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10120 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:657
//		DCS	GYROFRAC
// PORT: Fixed ROM slots 10120.
                    if slot <> 10120 or instruction <> 18328 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 1944, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10121 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:658
//		DAS	RUPTREG1
// PORT: Fixed ROM slots 10121.
                        if slot <> 10121 or instruction <> 8249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 57) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:659
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:660
//		CA	ITEMP4		# SELECT NEGATIVE TORQUING FOR THIS GYRO.
// PORT: Fixed ROM slots 10122.
                        if slot <> 10122 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 10127 {
            if slot <= 10124 {
                if slot <= 10123 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:661
//		AD	BIT9
// PORT: Fixed ROM slots 10123.
                    if slot <> 10123 or instruction <> 27107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:662
//		EXTEND
// PORT: Fixed ROM slots 10124.
                    if slot <> 10124 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10125 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:663
//		WOR	CHAN14
// PORT: Fixed ROM slots 10125.
                    if slot <> 10125 or instruction <> 2572 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10126 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:664
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:665
//		CS	RUPTREG1	# SET UP RUPTREGS TO FALL INTO GMERGE.
// PORT: Fixed ROM slots 10126.
                        if slot <> 10126 or instruction <> 16440 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 56).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:666
//		TS	RUPTREG1	# ALL NUMBERS PUT INTO GYROCMD ARE
// PORT: Fixed ROM slots 10127.
                        if slot <> 10127 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10130 {
                if slot <= 10128 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:667
//		CS	RUPTREG2	# POSITIVE -- BIT9 OF CHAN 14 DETERMINES
// PORT: Fixed ROM slots 10128.
                    if slot <> 10128 or instruction <> 16441 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 57).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10129 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:668
//		MASK	LOW7		# THE SIGN OF THE COMMAND.
// PORT: Fixed ROM slots 10129.
                        if slot <> 10129 or instruction <> 31804 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                            if fixedOperand = 127 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:669
//		COM
// PORT: Fixed ROM slots 10130.
                        if slot <> 10130 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10131 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:670
//		XCH	RUPTREG2
// PORT: Fixed ROM slots 10131.
                    if slot <> 10131 or instruction <> 23609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 57, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10132 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:671
//		COM
// PORT: Fixed ROM slots 10132.
                        if slot <> 10132 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:672
//		TCF	GMERGE
// PORT: Fixed ROM slots 10133.
                        if slot <> 10133 or instruction <> 5952 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5952, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[629] to agcAotUnit629@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:673
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:674
//GDESELCT	OCT	1700		# TURN OFF SELECT AND ACTIVITY BITS.
// PORT: Fixed ROM slots 10134.
    10134, 1920,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:675
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:676
//GYROFRAC	2DEC	.215 B -21
// PORT: Fixed ROM slots 10135 10136.
    10135, 0, 10136, 56
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10137–10168.
function agcAotUnit630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10152 {
        if slot <= 10144 {
            if slot <= 10140 {
                if slot <= 10138 {
                    if slot <= 10137 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:677
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:678
//# Page 1327
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:679
//# IMU MODE SWITCHING ROUTINES COME HERE WHEN ACTION COMPLETE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:680
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:681
//ENDIMU		EXTEND			# MODE IS BAD IF CAGE HAS OCCURRED OR IF
// PORT: Fixed ROM slots 10137.
                        if slot <> 10137 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:682
//		READ	DSALMOUT	# ISS WARNING IS ON.
// PORT: Fixed ROM slots 10138.
                        if slot <> 10138 or instruction <> 9 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10139 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:683
//		MASK	BIT1
// PORT: Fixed ROM slots 10139.
                        if slot <> 10139 or instruction <> 31211 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            if fixedOperand = 1 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:684
//		CCS	A
// PORT: Fixed ROM slots 10140.
                        if slot <> 10140 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 10142 {
                    if slot <= 10141 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:685
//		TCF	IMUBAD
// PORT: Fixed ROM slots 10141.
                        if slot <> 10141 or instruction <> 6047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:686
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:687
//IMUGOOD		TCF	GOODEND		# WITH C(A) = 0.
// PORT: Fixed ROM slots 10142.
                        if slot <> 10142 or instruction <> 6069 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6069, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10143 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:688
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:689
//IMUBAD		CAF	ZERO
// PORT: Fixed ROM slots 10143.
                        if slot <> 10143 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:690
//		TCF	BADEND
// PORT: Fixed ROM slots 10144.
                        if slot <> 10144 or instruction <> 6066 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6066, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10148 {
                if slot <= 10146 {
                    if slot <= 10145 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:691
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:692
//CAGETEST	CAF	BIT6		# SUBROUTINE TO TERMINATE IMU MODE
// PORT: Fixed ROM slots 10145.
                        if slot <> 10145 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:693
//		MASK	IMODES30	# SWITCH IF IMU HAS BEEN CAGED.
// PORT: Fixed ROM slots 10146.
                        if slot <> 10146 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10147 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:694
//		CCS	A
// PORT: Fixed ROM slots 10147.
                        if slot <> 10147 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:695
//		TCF	IMUBAD		# DIRECTLY.
// PORT: Fixed ROM slots 10148.
                        if slot <> 10148 or instruction <> 6047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10150 {
                    if slot <= 10149 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:696
//		TC	Q		# WITH C(A) = +0.
// PORT: Fixed ROM slots 10149.
                        if slot <> 10149 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:697
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:698
//CAGETSTQ	CS	IMODES30	# SKIP IF IMU NOT BEING CAGED.
// PORT: Fixed ROM slots 10150.
                        if slot <> 10150 or instruction <> 17090 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 706).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10151 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:699
//		MASK	BIT6
// PORT: Fixed ROM slots 10151.
                        if slot <> 10151 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:700
//		CCS	A
// PORT: Fixed ROM slots 10152.
                        if slot <> 10152 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 10160 {
            if slot <= 10156 {
                if slot <= 10154 {
                    if slot <= 10153 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:701
//		INCR	Q
// PORT: Fixed ROM slots 10153.
                        if slot <> 10153 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:702
//		TC	Q
// PORT: Fixed ROM slots 10154.
                        if slot <> 10154 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10155 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:703
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:704
//CAGETSTJ	CS	IMODES30	# IF DURING MODE SWITCH INITIALIZATION
// PORT: Fixed ROM slots 10155.
                        if slot <> 10155 or instruction <> 17090 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 706).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:705
//		MASK	BIT6		# IT IS FOUND THAT THE IMU IS BEING CAGED,
// PORT: Fixed ROM slots 10156.
                        if slot <> 10156 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
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
                if slot <= 10158 {
                    if slot <= 10157 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:706
//		CCS	A		# SET IMUCADR TO -0 TO INDICATE OPERATION
// PORT: Fixed ROM slots 10157.
                        if slot <> 10157 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:707
//		TC	Q		# COMPLETE BUT FAILED.  RETURN IMMEDIATELY
// PORT: Fixed ROM slots 10158.
                        if slot <> 10158 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10159 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:708
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:709
//		CS	ZERO		# TO SWRETURN.
// PORT: Fixed ROM slots 10159.
                        if slot <> 10159 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:710
//		TS	IMUCADR
// PORT: Fixed ROM slots 10160.
                        if slot <> 10160 or instruction <> 23236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23236, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10164 {
                if slot <= 10162 {
                    if slot <= 10161 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:711
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 10161.
                        if slot <> 10161 or instruction <> 5613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5613, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:712
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:713
//# Page 1328
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:714
//#          GENERALIZED MODE SWITCHING TERMINATION. ENTER AT GOODEND FOR SUCCESSFUL COMPLETION OF AN I/O OPERATION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:715
//# OR AT BADEND FOR A N UNSUCCESSFUL ONE. C(A) OR ARRIVAL =0 FOR IMU, 1 FOR OPTICS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:716
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:717
//BADEND		TS	RUPTREG2	# DEVICE INDEX.
// PORT: Fixed ROM slots 10162.
                        if slot <> 10162 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10163 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:718
//		CS	ZERO		# FOR FAILURE.
// PORT: Fixed ROM slots 10163.
                        if slot <> 10163 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:719
//		TCF	GOODEND +2
// PORT: Fixed ROM slots 10164.
                        if slot <> 10164 or instruction <> 6071 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6071, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10166 {
                    if slot <= 10165 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:720
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:721
//GOODEND		TS	RUPTREG2
// PORT: Fixed ROM slots 10165.
                        if slot <> 10165 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:722
//		CS	ONE		# FOR SUCCESS.
// PORT: Fixed ROM slots 10166.
                        if slot <> 10166 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10167 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:723
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:724
//		TS	RUPTREG3
// PORT: Fixed ROM slots 10167.
                        if slot <> 10167 or instruction <> 22586 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22586, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:725
//		INDEX	RUPTREG2	# SEE IF USING PROGRAM ASLEEP.
// PORT: Fixed ROM slots 10168.
                        if slot <> 10168 or instruction <> 20537 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20537, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20537, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[630] to agcAotUnit630@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:726
//		CCS	MODECADR
// PORT: Fixed ROM slots 10169.
    10169, 9608
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10170–10175.
function agcAotUnit631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10172 {
        if slot <= 10170 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:727
//		TCF	+4		# YES -- WAKE IT UP.
// PORT: Fixed ROM slots 10170.
            if slot <> 10170 or instruction <> 6078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10171 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:728
//		TCF	ENDMODE		# IF 0, PROGRAM NOT IN YET.
// PORT: Fixed ROM slots 10171.
                if slot <> 10171 or instruction <> 6086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:729
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:730
//		EXTEND
// PORT: Fixed ROM slots 10172.
                if slot <> 10172 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10173 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:731
//		BZF	ENDMODE +1	# BZF = TCF IF MODECADR = -0.
// PORT: Fixed ROM slots 10173.
            if slot <> 10173 or instruction <> 6087 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6087, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10174 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:732
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:733
//		CAF	ZERO		# WAKE SLEEPING PROGRAM.
// PORT: Fixed ROM slots 10174.
                if slot <> 10174 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:734
//		INDEX	RUPTREG2
// PORT: Fixed ROM slots 10175.
                if slot <> 10175 or instruction <> 20537 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[631] to agcAotUnit631@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:735
//		XCH	MODECADR
// PORT: Fixed ROM slots 10176.
    10176, 48520
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10177–10179.
function agcAotUnit632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10177 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:736
//		TC	JOBWAKE
// PORT: Fixed ROM slots 10177.
        if slot <> 10177 or instruction <> 2655 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2655, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10178 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:737
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:738
//		CS	RUPTREG3	# ADVANCE LOC IF SUCCESSFUL.
// PORT: Fixed ROM slots 10178.
            if slot <> 10178 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:739
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 10179.
            if slot <> 10179 or instruction <> 20532 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[632] to agcAotUnit632@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:740
//		ADS	LOC
// PORT: Fixed ROM slots 10180.
    10180, 22760
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10181–10183.
function agcAotUnit633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10181 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:741
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:742
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10181.
        if slot <> 10181 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10182 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:743
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:744
//ENDMODE		CA	RUPTREG3	# -0 INDICATES OPERATION COMPLETE BUT
// PORT: Fixed ROM slots 10182.
            if slot <> 10182 or instruction <> 12346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 58).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:745
// +1		INDEX	RUPTREG2	# UNSUCCESSFUL: -1 INDICATES COMPLETE AND
// PORT: Fixed ROM slots 10183.
            if slot <> 10183 or instruction <> 20537 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20537, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20537, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[633] to agcAotUnit633@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:746
//		TS	MODECADR	# SUCCESSFUL.
// PORT: Fixed ROM slots 10184.
    10184, 46472
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10185–10193.
function agcAotUnit634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10188 {
        if slot <= 10186 {
            if slot <= 10185 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:747
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10185.
                if slot <> 10185 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:748
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:749
//# Page 1329
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:750
//#          GENERAL STALLING ROUTINE. USING PROGRAMS COME HERE TO WAIT FOR I/O COMPLETION.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:751
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:752
//# PROGRAM DESCRIPTION                                    DATE- 21 FEB 1967
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:753
//#                                           LOG SECTION IMU MODE SWITCHING
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:754
//# MOD BY- R.MELANSON TO ADD DOCUMENTATION       ASSEMBLY SUNDISK  REV.  82
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:755
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:756
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:757
//#	TO DELAY FURTHER EXECUTION OF THE CALLING ROUTINE UNTIL ITS SELECTED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:758
//#	I/O FUNCTION IS COMPLETE.THE FOLLOWING CHECKS ON THE CALLING ROUTINE:S
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:759
//#	MODECADR ARE MADE AND ACTED UPON.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:760
//#	  1) +0 INDICATES INCOMPLETE I/O OPERATION.CALLING ROUTINE IS PUT TO
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:761
//#	     SLEEP.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:762
//#	  2) -1 INDICATES COMPLETED I/O OPERATION. STALL BYPASSES JOBSLEEP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:763
//#	     CALL AND RETURNS TO CALLING ROUTINE AT L+3
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:764
//#	  3) -0 INDICATES COMPLETED I/O WITH FAILURE. STALL CLEARS MODECADR
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:765
//#	     AND RETURNS TO CALLING ROUTINE AT L+2.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:766
//#	  4) VALUE GREATER THAN 0 INDICATES TWO ROUTINES CALLING FOR USE OF
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:767
//#	     SAME DEVICE.  STALL EXITS TO ABORT WHICH EXECUTES A PROGRAM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:768
//#	     RESTART WHICH IN TURN CLEARS ALL MODECADR REGISTERS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:769
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:770
//#  CALLING SEQUENCE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:771
//#	L 	TC	 BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:772
//#	L+1	CADR (ONE OF 5 STALL ADDRESSES I.E. IMUSTALL,OPTSTALL,RADSTALL,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:773
//#			  AOTSTALL,OR ATTSTALL)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:774
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:775
//# NORMAL-EXIT MODE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:776
//#	TCF  JOBSLEEP OR TCF   MODEXIT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:777
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:778
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:779
//#	TC   ABORT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:780
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:781
//# OUTPUT-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:782
//#	MODECADR= CADR IF JOBSLEEP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:783
//#	MODECADR=+0    IF I/O COMPLETE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:784
//#	BUF2=L+3       IF I/O COMPLETE AND GOOD.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:785
//#	BUF2=L+2 IF I/O COMPLETE BUT FAILED.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:786
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:787
//# ERASABLE INITIALIZATION-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:788
//#	BUF2 CONTAINS RETURN ADDRESS PLUS 1,(L+2)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:789
//#	BUF2+1 CONTAINS FBANK VALUE OF CALLING ROUTINE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:790
//#	MODECADR OF CALLING ROUTINE CONTAINS +0,-1,-0 OR  CADR RETURN ADDRESS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:791
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:792
//# DEBRIS-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:793
//#	RUPTREG2 AND CALLING ROUTINE MODECADR.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:794
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:795
//AOTSTALL	CAF	ONE		# AOT.
// PORT: Fixed ROM slots 10186.
                if slot <> 10186 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 10187 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:796
//		TC	STALL
// PORT: Fixed ROM slots 10187.
                if slot <> 10187 or instruction <> 1999 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1999, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:797
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:798
//RADSTALL	CAF	TWO
// PORT: Fixed ROM slots 10188.
                if slot <> 10188 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10190 {
            if slot <= 10189 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:799
//		TCF	STALL
// PORT: Fixed ROM slots 10189.
                if slot <> 10189 or instruction <> 6095 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6095, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:800
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:801
//# Page 1330
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:802
//OPTSTALL	EQUALS	AOTSTALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:803
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:804
//IMUSTALL	CAF	ZERO		# IMU.
// PORT: Fixed ROM slots 10190.
                if slot <> 10190 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 10191 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:805
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:806
//STALL		INHINT
// PORT: Fixed ROM slots 10191.
                if slot <> 10191 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10192 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:807
//		TS	RUPTREG2	# SAVE DEVICE INDEX.
// PORT: Fixed ROM slots 10192.
                    if slot <> 10192 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:808
//		INDEX	A		# SEE IF OPERATION COMPLETE.
// PORT: Fixed ROM slots 10193.
                    if slot <> 10193 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[634] to agcAotUnit634@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:809
//		CCS	MODECADR
// PORT: Fixed ROM slots 10194.
    10194, 9608
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10195–10198.
function agcAotUnit635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10196 {
        if slot <= 10195 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:810
//		TCF	MODABORT	# ALLOWABLE STATES ARE +0, -1, AND -0.
// PORT: Fixed ROM slots 10195.
            if slot <> 10195 or instruction <> 6113 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6113, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:811
//		TCF	MODESLP		# OPERATION INCOMPLETE.
// PORT: Fixed ROM slots 10196.
            if slot <> 10196 or instruction <> 6109 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6109, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10197 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:812
//		TCF	MODEGOOD	# COMPLETE AND GOOD IF = -1.
// PORT: Fixed ROM slots 10197.
            if slot <> 10197 or instruction <> 6105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:813
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:814
//MG2		INDEX	RUPTREG2	# COMPLETE AND FAILED IF -0.  RESET TO +0.
// PORT: Fixed ROM slots 10198.
            if slot <> 10198 or instruction <> 20537 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20537, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20537, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[635] to agcAotUnit635@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:815
//		TS	MODECADR	# RETURN TO CALLER.
// PORT: Fixed ROM slots 10199.
    10199, 46472
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10200–10206.
function agcAotUnit636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10202 {
        if slot <= 10200 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:816
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 10200.
            if slot <> 10200 or instruction <> 5613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5613, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10201 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:817
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:818
//MODEGOOD	CCS	A		# MAKE SURE INITIAL STATE -1.
// PORT: Fixed ROM slots 10201.
                if slot <> 10201 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:819
//		TCF	MODABORT
// PORT: Fixed ROM slots 10202.
                if slot <> 10202 or instruction <> 6113 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6113, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10204 {
            if slot <= 10203 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:820
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:821
//		INCR	BUF2		# IF SO, INCREMENT RETURN ADDRESS AND
// PORT: Fixed ROM slots 10203.
                if slot <> 10203 or instruction <> 10331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:822
//		TCF	MG2		# RETURN IMMEDIATELY, SETTING CADR = +0.
// PORT: Fixed ROM slots 10204.
                if slot <> 10204 or instruction <> 6102 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6102, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10205 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:823
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:824
//MODESLP		TC	MAKECADR	# CALL FROM SWITCHABLE FIXED ONLY.
// PORT: Fixed ROM slots 10205.
                if slot <> 10205 or instruction <> 2469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:825
//		INDEX	RUPTREG2
// PORT: Fixed ROM slots 10206.
                if slot <> 10206 or instruction <> 20537 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[636] to agcAotUnit636@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:826
//		TS	MODECADR
// PORT: Fixed ROM slots 10207.
    10207, 46472
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10208–10210.
function agcAotUnit637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10208 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:827
//		TCF	JOBSLEEP
// PORT: Fixed ROM slots 10208.
        if slot <> 10208 or instruction <> 6747 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6747, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10209 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:828
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:829
//MODABORT	DXCH	BUF2
// PORT: Fixed ROM slots 10209.
            if slot <> 10209 or instruction <> 21596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:830
//		TC	BAILOUT1	# TWO PROGRAMS USING THE SAME DEVICE.
// PORT: Fixed ROM slots 10210.
            if slot <> 10210 or instruction <> 3022 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3022, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[637] to agcAotUnit637@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:831
//		OCT	1210
// PORT: Fixed ROM slots 10211.
    10211, 1296,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:832
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:833
//# Page 1331
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:834
//# CONSTANTS FOR MODE SWITCHING ROUTINES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:835
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:836
//BITS3&4		=	OCT14
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:837
//BITS4&6		=	OCT50
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:838
//BITS4-5		OCT	00030
// PORT: Fixed ROM slots 10212.
    10212, 48,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:839
//IMUSEFLG	EQUALS	BIT8		# INTERPRETER SWITCH 7.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:840
//-COMMAX		DEC	-191
// PORT: Fixed ROM slots 10213.
    10213, 65152,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:841
//-COMMAX-	DEC	-192
// PORT: Fixed ROM slots 10214.
    10214, 65150,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:842
//600MS		DEC	60
// PORT: Fixed ROM slots 10215.
    10215, 120
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10216–10219.
function agcAotUnit638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10217 {
        if slot <= 10216 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:843
//IMUFIN20	=	IMUFINE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:844
//GOMANUR		CA	ATTCADR		# IS KALCMANU FREE
// PORT: Fixed ROM slots 10216.
            if slot <> 10216 or instruction <> 12999 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 711).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:845
//		EXTEND
// PORT: Fixed ROM slots 10217.
            if slot <> 10217 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10218 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:846
//		BZF	+3
// PORT: Fixed ROM slots 10218.
            if slot <> 10218 or instruction <> 6125 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6125, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:847
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:848
//		TC	POODOO		# NO
// PORT: Fixed ROM slots 10219.
            if slot <> 10219 or instruction <> 2986 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2986, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[638] to agcAotUnit638@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:849
//		OCT	1210		# 2 TRYING TO USE SAME DEVICE
// PORT: Fixed ROM slots 10220.
    10220, 1296
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10221–10232.
function agcAotUnit639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10226 {
        if slot <= 10223 {
            if slot <= 10221 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:850
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:851
// +3		EXTEND
// PORT: Fixed ROM slots 10221.
                if slot <> 10221 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10222 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:852
//		DCA	BUF2
// PORT: Fixed ROM slots 10222.
                    if slot <> 10222 or instruction <> 12380 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:853
//		DXCH	ATTCADR		# SAVE FINAL RETURN FOR KALCMAN3
// PORT: Fixed ROM slots 10223.
                    if slot <> 10223 or instruction <> 22216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 712, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10224 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:854
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:855
//		CA	BBANK
// PORT: Fixed ROM slots 10224.
                if slot <> 10224 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10225 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:856
//		MASK	SEVEN
// PORT: Fixed ROM slots 10225.
                    if slot <> 10225 or instruction <> 31215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:857
//		ADS	ATTCADR +1
// PORT: Fixed ROM slots 10226.
                    if slot <> 10226 or instruction <> 11976 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 712).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10229 {
            if slot <= 10227 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:858
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:859
//		CA	PRIORITY
// PORT: Fixed ROM slots 10227.
                if slot <> 10227 or instruction <> 12407 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 119).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10228 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:860
//		MASK	PRIO37
// PORT: Fixed ROM slots 10228.
                    if slot <> 10228 or instruction <> 32725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4053), 32768).
                        if fixedOperand = 15872 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 32) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:861
//		TS	ATTPRIO		# SAVE USERS PRIO
// PORT: Fixed ROM slots 10229.
                    if slot <> 10229 or instruction <> 23241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23241, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10230 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:862
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:863
//		CAF	KALEBCON	# SET EBANK FOR KALCMAN3
// PORT: Fixed ROM slots 10230.
                if slot <> 10230 or instruction <> 14330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2042), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10231 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:864
//		TS	EBANK
// PORT: Fixed ROM slots 10231.
                    if slot <> 10231 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:865
//		TC	POSTJUMP
// PORT: Fixed ROM slots 10232.
                    if slot <> 10232 or instruction <> 2461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[639] to agcAotUnit639@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:866
//		CADR	KALCMAN3
// PORT: Fixed ROM slots 10233.
    10233, 36872,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:867
//KALEBCON	ECADR	BCDU
// PORT: Fixed ROM slots 10234.
    10234, 3452,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:868
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:869
//# Page 1332
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:870
//# PROGRAM DESCRIPTION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:871
//# IMU STATUS CHECK ROUTINE R02 (SUBROUTINE UTILITY)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:872
//# MOD NO - 1
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:873
//# MOD BY - N.BRODEUR
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:874
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:875
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:876
//# TO CHECK WHETHER IMU IS ON AND IF ON WHETHER IT IS ALIGNED TO AN
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:877
//# ORIENTATION KNOWN BY THE CMC. TO REQUEST SELECTION OF THE APPROPRIATE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:878
//# PROGRAM IF THE IMU IS OFF OR NOT ALIGNED TO AN ORIENTATION KNOWN BY THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:879
//# CMC. CALLED THROUGH BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:880
//# CALLING SEQUENCE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:881
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:882
//# L        TC     BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:883
//# L+1      CADR   R02BOTH
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:884
//# SUBROUTINES CALLED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:885
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:886
//#       VARALARM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:887
//#       FLAGUP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:888
//# NORMAL EXIT MODES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:889
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:890
//# AT L+2 OF CALLING SEQUENCE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:891
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:892
//#       GOTOPOOH, WITH ALARM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:893
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:894
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:895
//# NONE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:896
//# DEBRIS
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:897
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:898
//# CENTRALS-A,Q,L
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:899
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:900
//		BANK	34
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:901
//		SETLOC	R02
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:902
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:903
//		COUNT*	$$/R02
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:904
//DEC51		DEC	51
// PORT: Fixed ROM slots 6827.
    6827, 102
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6828–6840.
function agcAotUnit401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6833 {
        if slot <= 6830 {
            if slot <= 6828 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:905
//R02BOTH		CAF	REFSMBIT
// PORT: Fixed ROM slots 6828.
                if slot <> 6828 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6829 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:906
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 6829.
                    if slot <> 6829 or instruction <> 28735 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:907
//		CCS	A
// PORT: Fixed ROM slots 6830.
                    if slot <> 6830 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 6831 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:908
//		TC	R02ZERO		# ZERO IMUS
// PORT: Fixed ROM slots 6831.
                if slot <> 6831 or instruction <> 1720 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1720, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6832 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:909
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:910
//		CA	IMODES30
// PORT: Fixed ROM slots 6832.
                    if slot <> 6832 or instruction <> 12994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:911
//		MASK	BIT9		# IS ISS INITIALIZED
// PORT: Fixed ROM slots 6833.
                    if slot <> 6833 or instruction <> 31203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        if fixedOperand = 256 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
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
        if slot <= 6836 {
            if slot <= 6834 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:912
//		EXTEND
// PORT: Fixed ROM slots 6834.
                if slot <> 6834 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6835 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:913
//		BZF	+2
// PORT: Fixed ROM slots 6835.
                    if slot <> 6835 or instruction <> 5813 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5813, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:914
//		CS	BIT4		# SEND IMU ALARM CODE 210
// PORT: Fixed ROM slots 6836.
                    if slot <> 6836 or instruction <> 18920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6838 {
                if slot <= 6837 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:915
//		AD	OCT220		# SEND REFSMM ALARM
// PORT: Fixed ROM slots 6837.
                    if slot <> 6837 or instruction <> 26299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1723), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:916
//		TC	VARALARM
// PORT: Fixed ROM slots 6838.
                    if slot <> 6838 or instruction <> 3044 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3044, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6839 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:917
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:918
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 6839.
                    if slot <> 6839 or instruction <> 3073 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3073, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:919
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:920
//R02ZERO		TC	UPFLAG
// PORT: Fixed ROM slots 6840.
                    if slot <> 6840 or instruction <> 2884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[401] to agcAotUnit401@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:921
//# Page 1333
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:922
//		ADRES	IMUSE
// PORT: Fixed ROM slots 6841.
    6841, 14
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6842–6842.
function agcAotUnit402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:923
//		TCF	SWRETURN
// PORT: Fixed ROM slots 6842.
    if slot <> 6842 or instruction <> 6553 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6553, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[402] to agcAotUnit402@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:924
//OCT220		OCT	220
// PORT: Fixed ROM slots 6843.
    6843, 288
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34733–34733.
function agcAotUnit2288 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:925
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:926
//# Page 1334
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:927
//# PROGRAM DESCRIPTION   P06   10FEB67
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:928
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:929
//# TRANSFER THE ISS/CMC FROM THE OPERATE TO THE STANDBY CONDITION.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:930
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:931
//# THE NORMAL CONDITION OF READINESS OF THE GNCS WHEN NOT IN USE IS STANDBY. IN THIS CONDITION THE IMU
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:932
//# HEATER POWER IS ON. THE IMU OPERATE POWER IS OFF. THE COMPUTER POWER IS ON. THE OPTICS POWER IS OFF. THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:933
//# CMC  STANDBY ON THE MAIN AND LEB DISKYS IS ON.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:934
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:935
//# CALLING SEQUENCE:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:936
//#          ASTRONAUT REQUEST THROUGH DSKY     V37E 06E.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:937
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:938
//# SUBROUTINES CALLED:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:939
//#          GOPERF1
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:940
//#          BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:941
//#          FLAGDOWN
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:942
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:943
//# Page 1335
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:944
//# PRESTAND PREPARES FOR STANDBY BY SNAPSHOTTING THE SCALER AND TIME1 TIME2
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:945
//# THE LOW 5 BITS OF THE SCALER ARE INSPECTED TO INSURE COMPATIBILITY
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:946
//# BETWEEN THE SCALER READING AND THE TIME1 TIME2 READING.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:947
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:948
//		SETLOC	P05P06
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:949
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:950
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:951
//		EBANK=	TIME2SAV
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:952
//		COUNT*	$$/P06
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:953
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:954
//P06		TC	UPFLAG		# SET NODOV37 BIT
// PORT: Fixed ROM slots 34733.
    if slot <> 34733 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2288] to agcAotUnit2288@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:955
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 34734.
    34734, 88
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34735–34744.
function agcAotUnit2289 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34739 {
        if slot <= 34736 {
            if slot <= 34735 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:956
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:957
//PRESTAND	INHINT
// PORT: Fixed ROM slots 34735.
                if slot <> 34735 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:958
//		EXTEND
// PORT: Fixed ROM slots 34736.
                if slot <> 34736 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34737 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:959
//		DCA	TIME2		# SNAPSHOT TIME1TIME2
// PORT: Fixed ROM slots 34737.
                if slot <> 34737 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34738 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:960
//		DXCH	TIME2SAV
// PORT: Fixed ROM slots 34738.
                    if slot <> 34738 or instruction <> 21709 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 205, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:961
//		TC	SCALPREP
// PORT: Fixed ROM slots 34739.
                    if slot <> 34739 or instruction <> 1996 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1996, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34741 {
            if slot <= 34740 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:962
//		TC	PRESTAND	# T1,T2,SCALER NOT COMPATIBLE
// PORT: Fixed ROM slots 34740.
                if slot <> 34740 or instruction <> 1967 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1967, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:963
//		DXCH	MPAC		# T1,T2 AND SCALER OK
// PORT: Fixed ROM slots 34741.
                if slot <> 34741 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34742 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:964
//		DXCH	SCALSAVE	# STORE SCALER
// PORT: Fixed ROM slots 34742.
                if slot <> 34742 or instruction <> 21711 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 207, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34743 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:965
//		INHINT
// PORT: Fixed ROM slots 34743.
                    if slot <> 34743 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:966
//		TC	BANKCALL
// PORT: Fixed ROM slots 34744.
                    if slot <> 34744 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2289] to agcAotUnit2289@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:967
//		CADR	RNDREFDR	# REFSMM, DRIFT, TRACK FLAGS DOWN
// PORT: Fixed ROM slots 34745.
    34745, 15610
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34746–34746.
function agcAotUnit2290 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:968
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:969
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 34746.
    if slot <> 34746 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2290] to agcAotUnit2290@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:970
//		ADRES	IMUSE		# IMUSE DOWN
// PORT: Fixed ROM slots 34747.
    34747, 14
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34748–34748.
function agcAotUnit2291 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:971
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 34748.
    if slot <> 34748 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2291] to agcAotUnit2291@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:972
//		ADRES	RNDVZFLG	# RNDVZFLG DOWN
// PORT: Fixed ROM slots 34749.
    34749, 16
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34750–34753.
function agcAotUnit2292 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34751 {
        if slot <= 34750 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:973
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:974
//		CAF	BIT11
// PORT: Fixed ROM slots 34750.
            if slot <> 34750 or instruction <> 14817 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:975
//		EXTEND
// PORT: Fixed ROM slots 34751.
            if slot <> 34751 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34752 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:976
//		WOR	CHAN13		# SET STANDBY ENABLE BIT
// PORT: Fixed ROM slots 34752.
            if slot <> 34752 or instruction <> 2571 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:977
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:978
//		TC	PHASCHNG	# SET RESTART TO POSTAND WHEN STANDBY
// PORT: Fixed ROM slots 34753.
            if slot <> 34753 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2292] to agcAotUnit2292@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:979
//		OCT	07024		#	RECOVERS
// PORT: Fixed ROM slots 34754.
    34754, 7208,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:980
//		OCT	20000
// PORT: Fixed ROM slots 34755.
    34755, 16384,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:981
//		EBANK=	SCALSAVE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:982
//		2CADR	POSTAND
// PORT: Fixed ROM slots 34756 34757.
    34756, 4024, 34757, 63584
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34758–34759.
function agcAotUnit2293 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34758 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:983
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:984
//		CAF	OCT62
// PORT: Fixed ROM slots 34758.
        if slot <> 34758 or instruction <> 14844 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2556), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:985
//		TC	BANKCALL
// PORT: Fixed ROM slots 34759.
        if slot <> 34759 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2293] to agcAotUnit2293@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:986
//		CADR	GOPERF1
// PORT: Fixed ROM slots 34760.
    34760, 17190
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34761–34809.
function agcAotUnit2294 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34784 {
        if slot <= 34772 {
            if slot <= 34766 {
                if slot <= 34763 {
                    if slot <= 34761 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:987
//		TCF	-3
// PORT: Fixed ROM slots 34761.
                        if slot <> 34761 or instruction <> 6086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34762 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:988
//		TCF	-4
// PORT: Fixed ROM slots 34762.
                            if slot <> 34762 or instruction <> 6086 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6086, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:989
//		TCF	-5
// PORT: Fixed ROM slots 34763.
                            if slot <> 34763 or instruction <> 6086 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6086, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34764 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:990
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:991
//OCT62		EQUALS	.5SEC		# DEC 50 = OCT 62
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:992
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:993
//# THE LOW 5 BITS OF THE SCALER READS 10000 FOR THE FIRST INTERVAL AFTER A
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:994
//# Page 1336
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:995
//# T1 INCREMENT. IF SCALPREP DETECTS THIS INTERVAL THE T1,T2 AND SCALER
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:996
//# DATA ARE NOT COMPATIBLE AND RETURN IS TO L+1 FOR ANOTHER READING OF THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:997
//# DATA. OTHERWISE, THE RETURN IS TO L+2 TO PROCEED. ROUTINE ALSO PREPARES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:998
//# THE SCALER READING FOR COMPUTATION OF THE INCREMENT TO UPDATE T1T2. (THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:999
//# 10 MS BIT (BIT 6) OF THE SCALER IS INCREMENTED 5 MS OUT OF PHASE FROM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1000
//# T1.) ADDITION OF 5 MS (BIT 5) TO THE SCALER READING HAS THE EFFECT OF
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1001
//# ADJUSTING BIT 6 IN THE SCALER TO BE IN PHASE WITH BIT 1 OF T1. THE LOW 5
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1002
//# BITS OF THE SCALER READING ARE THEN SET TO ZERO, TO TRUNCATE THE SCALER
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1003
//# DATA TO 10 MS. RESULTS ARE STORED IN MPAC, +1.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1004
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1005
//SCALPREP	EXTEND
// PORT: Fixed ROM slots 34764.
                        if slot <> 34764 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34765 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1006
//		QXCH	MPAC +2
// PORT: Fixed ROM slots 34765.
                            if slot <> 34765 or instruction <> 9326 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 110, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1007
//		TC	FINETIME +1
// PORT: Fixed ROM slots 34766.
                            if slot <> 34766 or instruction <> 2115 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2115, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34769 {
                    if slot <= 34767 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1008
//		RELINT
// PORT: Fixed ROM slots 34767.
                        if slot <> 34767 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34768 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1009
//		DXCH	MPAC
// PORT: Fixed ROM slots 34768.
                            if slot <> 34768 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1010
//		CA	BIT5		# ADD 5 MS TO THE SCALER READING.
// PORT: Fixed ROM slots 34769.
                            if slot <> 34769 or instruction <> 14823 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34770 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1011
//		TS	L
// PORT: Fixed ROM slots 34770.
                        if slot <> 34770 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34771 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1012
//		CA	ZERO
// PORT: Fixed ROM slots 34771.
                            if slot <> 34771 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1013
//		DAS	MPAC
// PORT: Fixed ROM slots 34772.
                            if slot <> 34772 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34778 {
                if slot <= 34775 {
                    if slot <= 34773 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1014
//		CS	LOW5		# SET LOW 5 BITS OF (SCALER+5MS) TO ZERO
// PORT: Fixed ROM slots 34773.
                        if slot <> 34773 or instruction <> 18662 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34774 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1015
//		MASK 	MPAC +1		# AND STORE RESULTS IN MPAC,+1.
// PORT: Fixed ROM slots 34774.
                            if slot <> 34774 or instruction <> 28781 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1016
//		XCH	MPAC +1
// PORT: Fixed ROM slots 34775.
                            if slot <> 34775 or instruction <> 23661 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 109, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34776 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1017
//		MASK	LOW5		# TEST LOW 5 BITS OF SCALER FOR THE FIRST
// PORT: Fixed ROM slots 34776.
                        if slot <> 34776 or instruction <> 30950 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34777 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1018
//					# INTERVAL AFTER THE T1 INCREMENT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1019
//					# (NOW = 00000, SINCE BIT 5 ADDED).
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1020
//		CCS	A		# IS IT 1ST INTERVAL AFTER T1 INCREMENT
// PORT: Fixed ROM slots 34777.
                            if slot <> 34777 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1021
//		INCR	MPAC +2		# NO
// PORT: Fixed ROM slots 34778.
                            if slot <> 34778 or instruction <> 10350 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 110).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34781 {
                    if slot <= 34779 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1022
//		TC	MPAC +2		# YES
// PORT: Fixed ROM slots 34779.
                        if slot <> 34779 or instruction <> 110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 110, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34780 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1023
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1024
//# POSTAND RECOVERS TIME AFTER STANDBY.THE SCALER IS SNAPSHOTTED AND THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1025
//# TIME1 TIME2 COUNTER IS SET TO ZERO. THE LOW 5 BITS OF THE SCALER ARE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1026
//# INSPECTED TO INSURE COMPATIBILITY BETWEEN THE SCALER READING AND THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1027
//# CLEARING OF THE TIME COUNTER.  IT THEN COMPUTES THE DIFFERENCE IN SCALER
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1028
//# VALUES (IN DP) AND ADDS THIS TO THE PREVIOUSLY SNAPSHOTTED VALUES OF
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1029
//# TIME1 TIME2 AND PLACES THIS NEW TIME INTO THE TIME1 TIME2 COUNTER.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1030
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1031
//		COUNT*	$$/P05
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1032
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1033
//POSTAND		CS	BIT11		# RECOVER TIME AFTER STANDBY.
// PORT: Fixed ROM slots 34780.
                            if slot <> 34780 or instruction <> 18913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1034
//		EXTEND
// PORT: Fixed ROM slots 34781.
                            if slot <> 34781 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34782 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1035
//		WAND	CHAN13		# CLEAR STANDBY ENABLE BIT
// PORT: Fixed ROM slots 34782.
                        if slot <> 34782 or instruction <> 1547 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34783 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1036
//		INHINT
// PORT: Fixed ROM slots 34783.
                            if slot <> 34783 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1037
//		CA	ZERO
// PORT: Fixed ROM slots 34784.
                            if slot <> 34784 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 34796 {
            if slot <= 34790 {
                if slot <= 34787 {
                    if slot <= 34785 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1038
//		TS	L
// PORT: Fixed ROM slots 34785.
                        if slot <> 34785 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34786 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1039
//		DXCH	TIME2		# CLEAR TIME1TIME2
// PORT: Fixed ROM slots 34786.
                            if slot <> 34786 or instruction <> 21525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1040
//		TC	SCALPREP	# STORE SCALER IN MPAC, MPAC+1
// PORT: Fixed ROM slots 34787.
                            if slot <> 34787 or instruction <> 1996 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1996, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34788 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1041
//		TC	POSTAND +3	# T1,T2,SCALER NOT COMPATIBLE
// PORT: Fixed ROM slots 34788.
                        if slot <> 34788 or instruction <> 2015 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2015, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34789 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1042
//		EXTEND			# T1,T2 AND SCALER OK
// PORT: Fixed ROM slots 34789.
                            if slot <> 34789 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1043
//		DCS	SCALSAVE
// PORT: Fixed ROM slots 34790.
                            if slot <> 34790 or instruction <> 16591 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 207, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34793 {
                    if slot <= 34791 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1044
//		DAS	MPAC		# FORM DP DIFFERENCE OF POSTSTANDBY SCALER
// PORT: Fixed ROM slots 34791.
                        if slot <> 34791 or instruction <> 8301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 109) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34792 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1045
//# Page 1337
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1046
//		CAF	BIT10		# MINUS PRESTANDBY SCALER AND SHIFT RIGHT
// PORT: Fixed ROM slots 34792.
                            if slot <> 34792 or instruction <> 14818 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1047
//		TC	SHORTMP		# 5 TO ALIGN BITS WITH TIME1TIME2.
// PORT: Fixed ROM slots 34793.
                            if slot <> 34793 or instruction <> 3783 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3783, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34794 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1048
//		CAF	ZERO
// PORT: Fixed ROM slots 34794.
                        if slot <> 34794 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34795 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1049
//		TS	MPAC +2		# NEEDED FOR TP AGREE
// PORT: Fixed ROM slots 34795.
                            if slot <> 34795 or instruction <> 22638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1050
//		TC	TPAGREE		# MAKE DP DIFF AGREE
// PORT: Fixed ROM slots 34796.
                            if slot <> 34796 or instruction <> 3759 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3759, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34802 {
                if slot <= 34799 {
                    if slot <= 34797 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1051
//		CCS	MPAC
// PORT: Fixed ROM slots 34797.
                        if slot <> 34797 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34798 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1052
//		TC	POSTCOM		# IF DP DIFF NET +, NO SCALER OVERFLOW
// PORT: Fixed ROM slots 34798.
                            if slot <> 34798 or instruction <> 2035 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2035, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1053
//		TC	POSTCOM		# BETWEEN PRE AND POST STANDBY.
// PORT: Fixed ROM slots 34799.
                            if slot <> 34799 or instruction <> 2035 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2035, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34800 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1054
//		TC	+1		# IF DP DIFF NET -, SCALER OVERFLOWED. ADD
// PORT: Fixed ROM slots 34800.
                        if slot <> 34800 or instruction <> 2033 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2033, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34801 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1055
//		CAF	BIT10		# BIT 10 TO HIGH DIFF TO CORRECT.
// PORT: Fixed ROM slots 34801.
                            if slot <> 34801 or instruction <> 14818 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1056
//		ADS	MPAC
// PORT: Fixed ROM slots 34802.
                            if slot <> 34802 or instruction <> 11372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 108).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34805 {
                    if slot <= 34803 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1057
//POSTCOM		EXTEND			# C(MPAC,+1) IS MAGNITUDE OF DELTA SCALER.
// PORT: Fixed ROM slots 34803.
                        if slot <> 34803 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34804 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1058
//		DCA	TIME2SAV	# PRESTANDBY TIME1TIME2
// PORT: Fixed ROM slots 34804.
                            if slot <> 34804 or instruction <> 12493 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 205, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1059
//		DAS	MPAC
// PORT: Fixed ROM slots 34805.
                            if slot <> 34805 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34807 {
                        if slot <= 34806 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1060
//		TC	TPAGREE		# FORCE SIGN AGREEMENT
// PORT: Fixed ROM slots 34806.
                            if slot <> 34806 or instruction <> 3759 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3759, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1061
//		DXCH	MPAC		# UPDATED VALUE FOR T1,T2.
// PORT: Fixed ROM slots 34807.
                            if slot <> 34807 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34808 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1062
//		DAS	TIME2		# LOAD UPDATED VALUE INTO T1,T2, WITH
// PORT: Fixed ROM slots 34808.
                            if slot <> 34808 or instruction <> 8213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 21) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1063
//		TC	DOWNFLAG	# CLEAR NODOFLAG
// PORT: Fixed ROM slots 34809.
                            if slot <> 34809 or instruction <> 2894 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2294] to agcAotUnit2294@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1064
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 34810.
    34810, 88
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34811–34811.
function agcAotUnit2295 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1065
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1066
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 34811.
    if slot <> 34811 or instruction <> 3073 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3073, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2295] to agcAotUnit2295@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1067
//
