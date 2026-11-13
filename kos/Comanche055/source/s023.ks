// PORT: Original source unit IMU_MODE_SWITCHING_ROUTINES.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4945–4949.
function agcAotUnit216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4946 {
        if slot <= 4945 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:2
//# Filename:	IMU_MODE_SWITCHING_ROUTINES.agc
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:9
//# Pages:	1420-1448
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:10
//# Mod history:	2009-05-10 SN	(Sergio Navarro).  Started adapting from
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:11
//#				the Colossus249/ file of the same name,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:12
//#				using Comanche055 page images.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:13
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:22
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:24
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:27
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:29
//#            Colossus 2A
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:30
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:31
//# Page 1420
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:32
//		BLOCK	02
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:33
//		SETLOC	FFTAG3
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:34
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:35
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:36
//		EBANK=	COMMAND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:37
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:38
//# FIXED-FIXED ROUTINES.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:39
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:40
//		COUNT	02/IMODE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:41
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:42
//ZEROICDU	CAF	ZERO		# ZERO ICDU COUNTERS.
// PORT: Fixed ROM slots 4945.
            if slot <> 4945 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:43
//		TS	CDUX
// PORT: Fixed ROM slots 4946.
            if slot <> 4946 or instruction <> 22554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4947 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:44
//		TS	CDUY
// PORT: Fixed ROM slots 4947.
            if slot <> 4947 or instruction <> 22555 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22555, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4948 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:45
//		TS	CDUZ
// PORT: Fixed ROM slots 4948.
                if slot <> 4948 or instruction <> 22556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22556, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:46
//		TC	Q
// PORT: Fixed ROM slots 4949.
                if slot <> 4949 or instruction <> 2 { return choose false if checkOnly else -1. }
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

// PORT: Physical bank 07. Shared continuation entries, slots 9599–9604.
function agcAotUnit574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9601 {
        if slot <= 9599 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:47
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:48
//SPSCODE		=	BIT9
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:49
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:50
//# Page 1421
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:51
//# IMU ZEROING ROUTINE.
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
//		COUNT	07/IMODE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:58
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:59
//IMUZERO		INHINT			# ROUTINE TO ZERO ICDUS.
// PORT: Fixed ROM slots 9599.
            if slot <> 9599 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9600 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:60
//		CS	DSPTAB +11D	# DONT ZERO CDUS IS IMU IN GIMBAL LOCK AND
// PORT: Fixed ROM slots 9600.
                if slot <> 9600 or instruction <> 16926 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 542).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:61
//		MASK	BITS4&6		# COARSE ALIGN (GIMBAL RUNAWAY PROTECTION)
// PORT: Fixed ROM slots 9601.
                if slot <> 9601 or instruction <> 31259 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2587), 32768).
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
        if slot <= 9602 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:62
//		CCS	A
// PORT: Fixed ROM slots 9602.
            if slot <> 9602 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9603 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:63
//		TCF	IMUZEROA
// PORT: Fixed ROM slots 9603.
                if slot <> 9603 or instruction <> 5511 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:64
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:65
//		TC	ALARM		# IF SO.
// PORT: Fixed ROM slots 9604.
                if slot <> 9604 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[574] to agcAotUnit574@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:66
//		OCT	00206
// PORT: Fixed ROM slots 9605.
    9605, 268
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9606–9623.
function agcAotUnit575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9614 {
        if slot <= 9609 {
            if slot <= 9607 {
                if slot <= 9606 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:67
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:68
//		TCF	CAGETSTJ +4	# IMMEDIATE FAILURE.
// PORT: Fixed ROM slots 9606.
                    if slot <> 9606 or instruction <> 5986 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5986, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:69
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:70
//IMUZEROA	TC	CAGETSTJ
// PORT: Fixed ROM slots 9607.
                    if slot <> 9607 or instruction <> 1886 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1886, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9608 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:71
//# DO ALL THE WORK.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:72
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9608.
                    if slot <> 9608 or instruction <> 17105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 721).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:73
//		MASK	SUPER011	# 	BIT5 FOR GROUND
// PORT: Fixed ROM slots 9609.
                    if slot <> 9609 or instruction <> 31261 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2589), 32768).
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
            if slot <= 9611 {
                if slot <= 9610 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:74
//		ADS	IMODES33
// PORT: Fixed ROM slots 9610.
                    if slot <> 9610 or instruction <> 11985 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:75
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:76
//		CS	IMODES30	# INHIBIT ICDUFAIL AND IMUFAIL (IN CASE WE
// PORT: Fixed ROM slots 9611.
                    if slot <> 9611 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9612 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:77
//		MASK	BITS3&4		# JUST CAME OUT OF COARSE ALIGN).
// PORT: Fixed ROM slots 9612.
                    if slot <> 9612 or instruction <> 31737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                        if fixedOperand = 12 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 4) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9613 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:78
//		ADS	IMODES30
// PORT: Fixed ROM slots 9613.
                        if slot <> 9613 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:79
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:80
//		CS	BITS4&6		# SEND ZERO ENCODE WITH COARSE AND ERROR
// PORT: Fixed ROM slots 9614.
                        if slot <> 9614 or instruction <> 18971 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9618 {
            if slot <= 9616 {
                if slot <= 9615 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:81
//		EXTEND			# COUNTER DISABLED.
// PORT: Fixed ROM slots 9615.
                    if slot <> 9615 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:82
//		WAND 	CHAN12
// PORT: Fixed ROM slots 9616.
                    if slot <> 9616 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9617 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:83
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:84
//		TC	NOATTOFF	# TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 9617.
                    if slot <> 9617 or instruction <> 1641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:85
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:86
//		CAF	BIT5
// PORT: Fixed ROM slots 9618.
                    if slot <> 9618 or instruction <> 14859 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 9620 {
                if slot <= 9619 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:87
//		EXTEND
// PORT: Fixed ROM slots 9619.
                    if slot <> 9619 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:88
//		WOR	CHAN12
// PORT: Fixed ROM slots 9620.
                    if slot <> 9620 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9621 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:89
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:90
//		TC	ZEROICDU
// PORT: Fixed ROM slots 9621.
                    if slot <> 9621 or instruction <> 2897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2897, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9622 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:91
//		CAF	BIT6		# WAIT 320 MS TO GIVE AGS ADEQUATE TIME TO
// PORT: Fixed ROM slots 9622.
                        if slot <> 9622 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:92
//		TC	WAITLIST	# RECEIVE ITS PULSE TRAIN.
// PORT: Fixed ROM slots 9623.
                        if slot <> 9623 or instruction <> 2725 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2725, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[575] to agcAotUnit575@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:93
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:94
//		2CADR	IMUZERO2
// PORT: Fixed ROM slots 9624 9625.
    9624, 2884, 9625, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9626–9630.
function agcAotUnit576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9627 {
        if slot <= 9626 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:95
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:96
//		CS	IMODES30	# SEE IF IMU OPERATING AND ALARM IF NOT.
// PORT: Fixed ROM slots 9626.
            if slot <> 9626 or instruction <> 17104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 720).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:97
//		MASK	BIT9
// PORT: Fixed ROM slots 9627.
            if slot <> 9627 or instruction <> 31239 { return choose false if checkOnly else -1. }
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
        if slot <= 9628 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:98
//		CCS	A
// PORT: Fixed ROM slots 9628.
            if slot <> 9628 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9629 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:99
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9629.
                if slot <> 9629 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:100
//# Page 1422
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:101
//		TC	ALARM
// PORT: Fixed ROM slots 9630.
                if slot <> 9630 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[576] to agcAotUnit576@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:102
//		OCT	210
// PORT: Fixed ROM slots 9631.
    9631, 272
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9632–9648.
function agcAotUnit577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9639 {
        if slot <= 9635 {
            if slot <= 9633 {
                if slot <= 9632 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:103
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:104
//MODEEXIT	RELINT			# GENERAL MODE-SWITCHING EXIT.
// PORT: Fixed ROM slots 9632.
                    if slot <> 9632 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:105
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9633.
                    if slot <> 9633 or instruction <> 6589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6589, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9634 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:106
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:107
//IMUZERO2	TC	CAGETEST
// PORT: Fixed ROM slots 9634.
                    if slot <> 9634 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:108
//		TC	ZEROICDU	# ZERO CDUX, CDUY, CDUZ
// PORT: Fixed ROM slots 9635.
                    if slot <> 9635 or instruction <> 2897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2897, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9637 {
                if slot <= 9636 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:109
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:110
//		CS	BIT5		# REMOVE ZERO DISCRETE.
// PORT: Fixed ROM slots 9636.
                    if slot <> 9636 or instruction <> 18955 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:111
//		EXTEND
// PORT: Fixed ROM slots 9637.
                    if slot <> 9637 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9638 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:112
//		WAND	CHAN12
// PORT: Fixed ROM slots 9638.
                    if slot <> 9638 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:113
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:114
//		CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
// PORT: Fixed ROM slots 9639.
                    if slot <> 9639 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9643 {
            if slot <= 9641 {
                if slot <= 9640 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:115
//		TC	VARDELAY
// PORT: Fixed ROM slots 9640.
                    if slot <> 9640 or instruction <> 2746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:116
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:117
//IMUZERO3	TC	CAGETEST
// PORT: Fixed ROM slots 9641.
                    if slot <> 9641 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9642 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:118
//		CS	BITS3&4		# REMOVE IMUFAIL AND ICDUFAIL INHIBIT.
// PORT: Fixed ROM slots 9642.
                    if slot <> 9642 or instruction <> 19449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:119
//		MASK	IMODES30
// PORT: Fixed ROM slots 9643.
                    if slot <> 9643 or instruction <> 29392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9645 {
                if slot <= 9644 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:120
//		TS	IMODES30
// PORT: Fixed ROM slots 9644.
                    if slot <> 9644 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:121
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:122
//		CS	SUPER011	# ENABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9645.
                    if slot <> 9645 or instruction <> 18973 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2589), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9646 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:123
//		MASK	IMODES33	#	BIT5 FOR GROUND
// PORT: Fixed ROM slots 9646.
                    if slot <> 9646 or instruction <> 29393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9647 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:124
//		TS	IMODES33
// PORT: Fixed ROM slots 9647.
                        if slot <> 9647 or instruction <> 23249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23249, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:125
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:126
//		TC	IBNKCALL	# SET ISS WARNING IF EITHER OF ABOVE ARE
// PORT: Fixed ROM slots 9648.
                        if slot <> 9648 or instruction <> 2528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[577] to agcAotUnit577@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:127
//		CADR	SETISSW		# PRESENT.
// PORT: Fixed ROM slots 9649.
    9649, 13162
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9650–9655.
function agcAotUnit578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9652 {
        if slot <= 9650 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:128
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:129
//		TCF	ENDIMU
// PORT: Fixed ROM slots 9650.
            if slot <> 9650 or instruction <> 5964 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5964, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9651 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:130
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:131
//# Page 1423
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:132
//# IMU COARSE ALIGN MODE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:133
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:134
//IMUCOARS	INHINT
// PORT: Fixed ROM slots 9651.
                if slot <> 9651 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:135
//		TC	CAGETSTJ
// PORT: Fixed ROM slots 9652.
                if slot <> 9652 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9653 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:136
//		TC	SETCOARS
// PORT: Fixed ROM slots 9653.
            if slot <> 9653 or instruction <> 1559 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1559, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9654 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:137
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:138
//		CAF	SIX
// PORT: Fixed ROM slots 9654.
                if slot <> 9654 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:139
//		TC	WAITLIST
// PORT: Fixed ROM slots 9655.
                if slot <> 9655 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[578] to agcAotUnit578@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:140
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:141
//		2CADR	COARS
// PORT: Fixed ROM slots 9656 9657.
    9656, 2934, 9657, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9658–9665.
function agcAotUnit579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9661 {
        if slot <= 9659 {
            if slot <= 9658 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:142
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:143
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9658.
                if slot <> 9658 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:144
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:145
//COARS		TC	CAGETEST
// PORT: Fixed ROM slots 9659.
                if slot <> 9659 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9660 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:146
//		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// PORT: Fixed ROM slots 9660.
                if slot <> 9660 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:147
//		EXTEND
// PORT: Fixed ROM slots 9661.
                if slot <> 9661 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9663 {
            if slot <= 9662 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:148
//		WOR	CHAN12
// PORT: Fixed ROM slots 9662.
                if slot <> 9662 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:149
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:150
//		CAF	TWO		# SET CDU INDICATOR
// PORT: Fixed ROM slots 9663.
                if slot <> 9663 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9664 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:151
//COARS1		TS	CDUIND
// PORT: Fixed ROM slots 9664.
                if slot <> 9664 or instruction <> 23356 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23356, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:152
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:153
//		INDEX	CDUIND		# COMPUTE THETAD - THETAA IN 1:S
// PORT: Fixed ROM slots 9665.
                if slot <> 9665 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[579] to agcAotUnit579@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:154
//		CA	THETAD		# 	COMPLEMENT FORM
// PORT: Fixed ROM slots 9666.
    9666, 25818
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9667–9668.
function agcAotUnit580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9667 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:155
//		EXTEND
// PORT: Fixed ROM slots 9667.
        if slot <> 9667 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:156
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9668.
        if slot <> 9668 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[580] to agcAotUnit580@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:157
//		MSU	CDUX
// PORT: Fixed ROM slots 9669.
    9669, 16436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9670–9677.
function agcAotUnit581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9673 {
        if slot <= 9671 {
            if slot <= 9670 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:158
//		EXTEND
// PORT: Fixed ROM slots 9670.
                if slot <> 9670 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:159
//		MP	BIT13		# SHIFT RIGHT 2
// PORT: Fixed ROM slots 9671.
                if slot <> 9671 or instruction <> 31235 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2563, readEffective:call(words, 2563)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9672 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:160
//		XCH	L		# ROUND
// PORT: Fixed ROM slots 9672.
                if slot <> 9672 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:161
//		DOUBLE
// PORT: Fixed ROM slots 9673.
                if slot <> 9673 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
        if slot <= 9675 {
            if slot <= 9674 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:162
//		TS	ITEMP1
// PORT: Fixed ROM slots 9674.
                if slot <> 9674 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:163
//		TCF	+2
// PORT: Fixed ROM slots 9675.
                if slot <> 9675 or instruction <> 5581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5581, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9676 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:164
//		ADS	L
// PORT: Fixed ROM slots 9676.
                if slot <> 9676 or instruction <> 11265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:165
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:166
//		INDEX	CDUIND		# DIFFERENCE TO BE COMPUTED
// PORT: Fixed ROM slots 9677.
                if slot <> 9677 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[581] to agcAotUnit581@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:167
//		LXCH	COMMAND
// PORT: Fixed ROM slots 9678.
    9678, 20082
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9679–9687.
function agcAotUnit582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9682 {
        if slot <= 9680 {
            if slot <= 9679 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:168
//		CCS	CDUIND
// PORT: Fixed ROM slots 9679.
                if slot <> 9679 or instruction <> 4924 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:169
//		TC	COARS1
// PORT: Fixed ROM slots 9680.
                if slot <> 9680 or instruction <> 1472 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1472, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9681 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:170
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:171
//		CAF	TWO		# MINIMUM OF 4 MS WAIT
// PORT: Fixed ROM slots 9681.
                if slot <> 9681 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:172
//		TC 	VARDELAY
// PORT: Fixed ROM slots 9682.
                if slot <> 9682 or instruction <> 2746 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2746, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9684 {
            if slot <= 9683 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:173
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:174
//# Page 1424
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:175
//COARS2		TC	CAGETEST	# DONT CONTINUE IF CAGED.
// PORT: Fixed ROM slots 9683.
                if slot <> 9683 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:176
//		TS	ITEMP1		# SET TO +0.
// PORT: Fixed ROM slots 9684.
                if slot <> 9684 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9685 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:177
//		CAF	TWO		# SET CDU INDICATOR
// PORT: Fixed ROM slots 9685.
                if slot <> 9685 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9686 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:178
//	+3	TS	CDUIND
// PORT: Fixed ROM slots 9686.
                    if slot <> 9686 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:179
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:180
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9687.
                    if slot <> 9687 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[582] to agcAotUnit582@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:181
//		CCS	COMMAND		# NUMBER OF PULSES REQUIRED
// PORT: Fixed ROM slots 9688.
    9688, 9842
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9689–9696.
function agcAotUnit583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9692 {
        if slot <= 9690 {
            if slot <= 9689 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:182
//		TC	COMPOS		# GREATER THAN MAX ALLOWED
// PORT: Fixed ROM slots 9689.
                if slot <> 9689 or instruction <> 1501 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1501, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:183
//		TC	NEXTCDU +1
// PORT: Fixed ROM slots 9690.
                if slot <> 9690 or instruction <> 1508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1508, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9691 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:184
//		TC	COMNEG
// PORT: Fixed ROM slots 9691.
                if slot <> 9691 or instruction <> 1538 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1538, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:185
//		TC	NEXTCDU +1
// PORT: Fixed ROM slots 9692.
                if slot <> 9692 or instruction <> 1508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1508, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9694 {
            if slot <= 9693 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:186
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:187
//COMPOS		AD	-COMMAX		# COMMAX = MAX NUMBER OF PULSES ALLOWED
// PORT: Fixed ROM slots 9693.
                if slot <> 9693 or instruction <> 26516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1940), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:188
//		EXTEND			# 	MINUS ONE
// PORT: Fixed ROM slots 9694.
                if slot <> 9694 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9695 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:189
//		BZMF	COMZERO
// PORT: Fixed ROM slots 9695.
                if slot <> 9695 or instruction <> 26122 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:190
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9696.
                if slot <> 9696 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[583] to agcAotUnit583@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:191
//		TS	COMMAND		# REDUCE COMMAND BY MAX NUMBER OF PULSES
// PORT: Fixed ROM slots 9697.
    9697, 46706
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9698–9701.
function agcAotUnit584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9699 {
        if slot <= 9698 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:192
//		CS	-COMMAX-	# 	ALLOWED
// PORT: Fixed ROM slots 9698.
            if slot <> 9698 or instruction <> 18325 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1941), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:193
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:194
//NEXTCDU		INCR	ITEMP1
// PORT: Fixed ROM slots 9699.
            if slot <> 9699 or instruction <> 10289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9700 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:195
//		AD	NEG0
// PORT: Fixed ROM slots 9700.
            if slot <> 9700 or instruction <> 27152 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:196
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9701.
            if slot <> 9701 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[584] to agcAotUnit584@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:197
//		TS	CDUXCMD		# SET UP COMMAND REGISTER.
// PORT: Fixed ROM slots 9702.
    9702, 45136
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9703–9707.
function agcAotUnit585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9704 {
        if slot <= 9703 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:198
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:199
//		CCS	CDUIND
// PORT: Fixed ROM slots 9703.
            if slot <> 9703 or instruction <> 4924 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 828).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:200
//		TC	COARS2 +3
// PORT: Fixed ROM slots 9704.
            if slot <> 9704 or instruction <> 1494 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1494, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9705 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:201
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:202
//		CCS	ITEMP1		# SEE IF ANY PULSES TO GO OUT.
// PORT: Fixed ROM slots 9705.
            if slot <> 9705 or instruction <> 4145 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9706 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:203
//		TCF	SENDPULS
// PORT: Fixed ROM slots 9706.
                if slot <> 9706 or instruction <> 5646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:204
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:205
//		TC	FIXDELAY	# WAIT FOR GIMBALS TO SETTLE.
// PORT: Fixed ROM slots 9707.
                if slot <> 9707 or instruction <> 2743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2743, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[585] to agcAotUnit585@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:206
//		DEC	150
// PORT: Fixed ROM slots 9708.
    9708, 300
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9709–9711.
function agcAotUnit586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9709 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:207
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:208
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:209
//		CAF	TWO		# AT END OF COMMAND, CHECK TO SEE THAT
// PORT: Fixed ROM slots 9709.
        if slot <> 9709 or instruction <> 14862 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9710 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:210
//CHKCORS		TS	ITEMP1		# GIMBALS ARE WITHIN 2 DEGREES OF THETAD.
// PORT: Fixed ROM slots 9710.
            if slot <> 9710 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:211
//		INDEX	A
// PORT: Fixed ROM slots 9711.
            if slot <> 9711 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[586] to agcAotUnit586@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:212
//		CA	CDUX
// PORT: Fixed ROM slots 9712.
    9712, 24628
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9713–9714.
function agcAotUnit587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9713 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:213
//		EXTEND
// PORT: Fixed ROM slots 9713.
        if slot <> 9713 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:214
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 9714.
        if slot <> 9714 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[587] to agcAotUnit587@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:215
//		MSU	THETAD
// PORT: Fixed ROM slots 9715.
    9715, 17626
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9716–9726.
function agcAotUnit588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9720 {
        if slot <= 9717 {
            if slot <= 9716 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:216
//		CCS	A
// PORT: Fixed ROM slots 9716.
                if slot <> 9716 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:217
//		TCF	COARSERR
// PORT: Fixed ROM slots 9717.
                if slot <> 9717 or instruction <> 5627 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5627, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9718 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:218
//		TCF	CORSCHK2
// PORT: Fixed ROM slots 9718.
                if slot <> 9718 or instruction <> 5624 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5624, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9719 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:219
//		TCF	COARSERR
// PORT: Fixed ROM slots 9719.
                    if slot <> 9719 or instruction <> 5627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:220
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:221
//# Page 1425
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:222
//CORSCHK2	CCS	ITEMP1
// PORT: Fixed ROM slots 9720.
                    if slot <> 9720 or instruction <> 4145 { return choose false if checkOnly else -1. }
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
        if slot <= 9723 {
            if slot <= 9721 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:223
//		TCF	CHKCORS
// PORT: Fixed ROM slots 9721.
                if slot <> 9721 or instruction <> 5614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5614, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9722 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:224
//		TCF	ENDIMU		# END OF COARSE ALIGNMENT.
// PORT: Fixed ROM slots 9722.
                    if slot <> 9722 or instruction <> 5964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5964, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:225
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:226
//COARSERR	AD	COARSTOL	# 2 DEGREES.
// PORT: Fixed ROM slots 9723.
                    if slot <> 9723 or instruction <> 26113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1537), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9724 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:227
//		EXTEND
// PORT: Fixed ROM slots 9724.
                if slot <> 9724 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9725 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:228
//		BZMF	CORSCHK2
// PORT: Fixed ROM slots 9725.
                    if slot <> 9725 or instruction <> 26104 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:229
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:230
//		TC	ALARM		# COARSE ALIGN ERROR.
// PORT: Fixed ROM slots 9726.
                    if slot <> 9726 or instruction <> 2984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2984, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[588] to agcAotUnit588@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:231
//		OCT	211
// PORT: Fixed ROM slots 9727.
    9727, 274
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9728–9728.
function agcAotUnit589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:232
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:233
//		TCF	IMUBAD
// PORT: Fixed ROM slots 9728.
    if slot <> 9728 or instruction <> 5970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[589] to agcAotUnit589@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:234
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:235
//COARSTOL	DEC	-.01111		# 2 DEGREES SCALED AT HALF-REVOLUTIONS
// PORT: Fixed ROM slots 9729.
    9729, 65170
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9730–9734.
function agcAotUnit590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9731 {
        if slot <= 9730 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:236
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:237
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:238
//COMNEG		AD	-COMMAX
// PORT: Fixed ROM slots 9730.
            if slot <> 9730 or instruction <> 26516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1940), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:239
//		EXTEND
// PORT: Fixed ROM slots 9731.
            if slot <> 9731 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9732 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:240
//		BZMF	COMZERO
// PORT: Fixed ROM slots 9732.
            if slot <> 9732 or instruction <> 26122 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9733 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:241
//		COM
// PORT: Fixed ROM slots 9733.
                if slot <> 9733 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:242
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9734.
                if slot <> 9734 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[590] to agcAotUnit590@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:243
//		TS	COMMAND
// PORT: Fixed ROM slots 9735.
    9735, 46706
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9736–9739.
function agcAotUnit591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9737 {
        if slot <= 9736 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:244
//		CA	-COMMAX-
// PORT: Fixed ROM slots 9736.
            if slot <> 9736 or instruction <> 14229 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1941), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:245
//		TC	NEXTCDU
// PORT: Fixed ROM slots 9737.
            if slot <> 9737 or instruction <> 1507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9738 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:246
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:247
//COMZERO		CAF	ZERO
// PORT: Fixed ROM slots 9738.
            if slot <> 9738 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:248
//		INDEX	CDUIND
// PORT: Fixed ROM slots 9739.
            if slot <> 9739 or instruction <> 21308 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[591] to agcAotUnit591@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:249
//		XCH	COMMAND
// PORT: Fixed ROM slots 9740.
    9740, 48754
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9741–9746.
function agcAotUnit592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9743 {
        if slot <= 9741 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:250
//		TC	NEXTCDU
// PORT: Fixed ROM slots 9741.
            if slot <> 9741 or instruction <> 1507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9742 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:251
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:252
//SENDPULS	CAF	13,14,15
// PORT: Fixed ROM slots 9742.
                if slot <> 9742 or instruction <> 16327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:253
//		EXTEND
// PORT: Fixed ROM slots 9743.
                if slot <> 9743 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9744 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:254
//		WOR	CHAN14
// PORT: Fixed ROM slots 9744.
            if slot <> 9744 or instruction <> 2572 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9745 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:255
//		CAF	600MS
// PORT: Fixed ROM slots 9745.
                if slot <> 9745 or instruction <> 14230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1942), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:256
//		TCF	COARS2 -1	# THEN TO VARDELAY
// PORT: Fixed ROM slots 9746.
                if slot <> 9746 or instruction <> 5586 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5586, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[592] to agcAotUnit592@.

// PORT: Physical bank 07. Shared continuation entries, slots 9747–9785.
function agcAotUnit593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9765 {
        if slot <= 9755 {
            if slot <= 9750 {
                if slot <= 9748 {
                    if slot <= 9747 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:257
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:258
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:259
//CA+ECE		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// PORT: Fixed ROM slots 9747.
                        if slot <> 9747 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:260
//		EXTEND
// PORT: Fixed ROM slots 9748.
                        if slot <> 9748 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9749 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:261
//		WOR	CHAN12
// PORT: Fixed ROM slots 9749.
                        if slot <> 9749 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:262
//		TC	TASKOVER
// PORT: Fixed ROM slots 9750.
                        if slot <> 9750 or instruction <> 2772 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2772, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9752 {
                    if slot <= 9751 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:263
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:264
//# Page 1426
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:265
//SETCOARS	CAF	BIT4		# BYPASS IF ALREADY IN COARSE ALIGN
// PORT: Fixed ROM slots 9751.
                        if slot <> 9751 or instruction <> 14860 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:266
//		EXTEND
// PORT: Fixed ROM slots 9752.
                        if slot <> 9752 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9753 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:267
//		RAND	CHAN12
// PORT: Fixed ROM slots 9753.
                        if slot <> 9753 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9754 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:268
//		CCS	A
// PORT: Fixed ROM slots 9754.
                            if slot <> 9754 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:269
//		TC	Q
// PORT: Fixed ROM slots 9755.
                            if slot <> 9755 or instruction <> 2 { return choose false if checkOnly else -1. }
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
            if slot <= 9760 {
                if slot <= 9757 {
                    if slot <= 9756 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:270
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:271
//		CS	BIT6		# CLEAR ISS ERROR COUNTERS
// PORT: Fixed ROM slots 9756.
                        if slot <> 9756 or instruction <> 18954 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:272
//		EXTEND
// PORT: Fixed ROM slots 9757.
                        if slot <> 9757 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9758 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:273
//		WAND	CHAN12
// PORT: Fixed ROM slots 9758.
                        if slot <> 9758 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9759 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:274
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:275
//		CS	BIT10		# KNOCK DOWN GYRO ACTIVITY
// PORT: Fixed ROM slots 9759.
                            if slot <> 9759 or instruction <> 18950 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:276
//		EXTEND
// PORT: Fixed ROM slots 9760.
                            if slot <> 9760 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9762 {
                    if slot <= 9761 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:277
//		WAND	CHAN14
// PORT: Fixed ROM slots 9761.
                        if slot <> 9761 or instruction <> 1548 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:278
//		CS	ZERO
// PORT: Fixed ROM slots 9762.
                        if slot <> 9762 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9763 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:279
//		TS	GYROCMD
// PORT: Fixed ROM slots 9763.
                        if slot <> 9763 or instruction <> 22567 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22567, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9764 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:280
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:281
//		CAF	BIT4		# PUT ISS IN COARSE ALIGN
// PORT: Fixed ROM slots 9764.
                            if slot <> 9764 or instruction <> 14860 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:282
//		EXTEND
// PORT: Fixed ROM slots 9765.
                            if slot <> 9765 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 9775 {
            if slot <= 9770 {
                if slot <= 9767 {
                    if slot <= 9766 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:283
//		WOR	CHAN12
// PORT: Fixed ROM slots 9766.
                        if slot <> 9766 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:284
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:285
//		CS	DSPTAB +11D	# TURN ON NO ATT LAMP
// PORT: Fixed ROM slots 9767.
                        if slot <> 9767 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9768 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:286
//		MASK	OCT40010
// PORT: Fixed ROM slots 9768.
                        if slot <> 9768 or instruction <> 30266 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1594), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9769 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:287
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 9769.
                            if slot <> 9769 or instruction <> 11806 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:288
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:289
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 9770.
                            if slot <> 9770 or instruction <> 17105 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 721).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9772 {
                    if slot <= 9771 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:290
//		MASK	BIT6
// PORT: Fixed ROM slots 9771.
                        if slot <> 9771 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:291
//		ADS	IMODES33
// PORT: Fixed ROM slots 9772.
                        if slot <> 9772 or instruction <> 11985 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9773 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:292
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:293
//		CS	IMODES30	# DISABLE IMUFAIL
// PORT: Fixed ROM slots 9773.
                        if slot <> 9773 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9774 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:294
//		MASK	BIT4
// PORT: Fixed ROM slots 9774.
                            if slot <> 9774 or instruction <> 31244 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:295
//		ADS	IMODES30
// PORT: Fixed ROM slots 9775.
                            if slot <> 9775 or instruction <> 11984 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 720).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9780 {
                if slot <= 9777 {
                    if slot <= 9776 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:296
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:297
//RNDREFDR	CS	BIT5		# KNOCK DOWN TRACK FLAG
// PORT: Fixed ROM slots 9776.
                        if slot <> 9776 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:298
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 9777.
                        if slot <> 9777 or instruction <> 28733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9778 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:299
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 9778.
                        if slot <> 9778 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9779 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:300
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:301
//		CS	BIT15		# KNOCK DOWN DRIFT FLAG
// PORT: Fixed ROM slots 9779.
                            if slot <> 9779 or instruction <> 18945 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:302
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 9780.
                            if slot <> 9780 or instruction <> 28734 { return choose false if checkOnly else -1. }
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
                if slot <= 9782 {
                    if slot <= 9781 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:303
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 9781.
                        if slot <> 9781 or instruction <> 22590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:304
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:305
//		CS	BIT13		# KNOCK DOWN REFSMMAT FLAG
// PORT: Fixed ROM slots 9782.
                        if slot <> 9782 or instruction <> 18947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9783 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:306
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 9783.
                        if slot <> 9783 or instruction <> 28735 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 63).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9784 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:307
//		TS	FLAGWRD3
// PORT: Fixed ROM slots 9784.
                            if slot <> 9784 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:308
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:309
//		TC	Q
// PORT: Fixed ROM slots 9785.
                            if slot <> 9785 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[593] to agcAotUnit593@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:310
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:311
//OCT40010	OCT	40010
// PORT: Fixed ROM slots 9786.
    9786, 32784
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9787–9797.
function agcAotUnit594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9791 {
        if slot <= 9788 {
            if slot <= 9787 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:312
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:313
//# Page 1427
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:314
//# IMU FINE ALIGN MODE SWITCH.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:315
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:316
//IMUFINE		INHINT
// PORT: Fixed ROM slots 9787.
                if slot <> 9787 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:317
//		TC	CAGETSTJ	# SEE IF IMU BEING CAGED.
// PORT: Fixed ROM slots 9788.
                if slot <> 9788 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9789 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:318
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:319
//		CS	BITS4-5		# RESET ZERO AND COARSE
// PORT: Fixed ROM slots 9789.
                if slot <> 9789 or instruction <> 18967 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9790 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:320
//		EXTEND
// PORT: Fixed ROM slots 9790.
                    if slot <> 9790 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:321
//		WAND	CHAN12
// PORT: Fixed ROM slots 9791.
                    if slot <> 9791 or instruction <> 1546 { return choose false if checkOnly else -1. }
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
        if slot <= 9794 {
            if slot <= 9792 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:322
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:323
//		CS	BIT6		# INSURE DAP AUTO AND HOLD MODES ENABLED
// PORT: Fixed ROM slots 9792.
                if slot <> 9792 or instruction <> 18954 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9793 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:324
//		MASK	IMODES33
// PORT: Fixed ROM slots 9793.
                    if slot <> 9793 or instruction <> 29393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:325
//		TS	IMODES33
// PORT: Fixed ROM slots 9794.
                    if slot <> 9794 or instruction <> 23249 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23249, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9795 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:326
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:327
//		TC	NOATTOFF
// PORT: Fixed ROM slots 9795.
                if slot <> 9795 or instruction <> 1641 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1641, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9796 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:328
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:329
//		CAF	BIT10		# IMU FAIL WAS INHIBITED DURING THE
// PORT: Fixed ROM slots 9796.
                    if slot <> 9796 or instruction <> 14854 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:330
//		TC	WAITLIST	# PRESUMABLY PRECEDING COARSE ALIGN.  LEAVE
// PORT: Fixed ROM slots 9797.
                    if slot <> 9797 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[594] to agcAotUnit594@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:331
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:332
//		2CADR	IFAILOK		# IT ON FOR THE FIRST 5 SECS OF FINE ALIGN
// PORT: Fixed ROM slots 9798 9799.
    9798, 3230, 9799, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9800–9801.
function agcAotUnit595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9800 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:333
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:334
//		CAF	2SECS
// PORT: Fixed ROM slots 9800.
        if slot <> 9800 or instruction <> 14882 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2594), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:335
//		TC	WAITLIST
// PORT: Fixed ROM slots 9801.
        if slot <> 9801 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[595] to agcAotUnit595@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:336
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:337
//		2CADR	IMUFINED
// PORT: Fixed ROM slots 9802 9803.
    9802, 3226, 9803, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9804–9820.
function agcAotUnit596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9811 {
        if slot <= 9807 {
            if slot <= 9805 {
                if slot <= 9804 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:338
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:339
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9804.
                    if slot <> 9804 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:340
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:341
//IMUFINED	TC	CAGETEST	# SEE THAT NO ONE HAS CAGED THE IMU.
// PORT: Fixed ROM slots 9805.
                    if slot <> 9805 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9806 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:342
//		TCF	ENDIMU
// PORT: Fixed ROM slots 9806.
                    if slot <> 9806 or instruction <> 5964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5964, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:343
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:344
//# Page 1428
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:345
//IFAILOK		TC	CAGETSTQ	# ENABLE IMU FIAL UNLESS IMU BEING CAGED.
// PORT: Fixed ROM slots 9807.
                    if slot <> 9807 or instruction <> 1881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1881, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9809 {
                if slot <= 9808 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:346
//		TCF	TASKOVER	# IT IS.
// PORT: Fixed ROM slots 9808.
                    if slot <> 9808 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:347
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:348
//		CAF	BIT4		# DONT RESET IMU FAIL INHIBIT IF SOMEONE
// PORT: Fixed ROM slots 9809.
                    if slot <> 9809 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9810 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:349
//		EXTEND			# HAS GONE INTO COARSE ALIGN.
// PORT: Fixed ROM slots 9810.
                    if slot <> 9810 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:350
//		RAND	CHAN12
// PORT: Fixed ROM slots 9811.
                    if slot <> 9811 or instruction <> 1034 { return choose false if checkOnly else -1. }
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
        if slot <= 9815 {
            if slot <= 9813 {
                if slot <= 9812 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:351
//		CCS	A
// PORT: Fixed ROM slots 9812.
                    if slot <> 9812 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:352
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9813.
                    if slot <> 9813 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9814 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:353
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:354
//		CS	IMODES30	# RESET IMUFAIL.
// PORT: Fixed ROM slots 9814.
                    if slot <> 9814 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:355
//		MASK	BIT13
// PORT: Fixed ROM slots 9815.
                    if slot <> 9815 or instruction <> 31235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
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
            if slot <= 9817 {
                if slot <= 9816 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:356
//		ADS	IMODES30
// PORT: Fixed ROM slots 9816.
                    if slot <> 9816 or instruction <> 11984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:357
//		CS	BIT4
// PORT: Fixed ROM slots 9817.
                    if slot <> 9817 or instruction <> 18956 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9818 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:358
//PFAILOK2	MASK	IMODES30
// PORT: Fixed ROM slots 9818.
                    if slot <> 9818 or instruction <> 29392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9819 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:359
//		TS	IMODES30
// PORT: Fixed ROM slots 9819.
                        if slot <> 9819 or instruction <> 23248 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23248, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:360
//		TC	IBNKCALL	# THE ISS WARNING LIGHT MAY COME ON NOW
// PORT: Fixed ROM slots 9820.
                        if slot <> 9820 or instruction <> 2528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[596] to agcAotUnit596@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:361
//		CADR	SETISSW		# THAT THE INHIBIT WAS BEEN REMOVED.
// PORT: Fixed ROM slots 9821.
    9821, 13162
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9822–9848.
function agcAotUnit597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9834 {
        if slot <= 9827 {
            if slot <= 9824 {
                if slot <= 9822 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:362
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9822.
                    if slot <> 9822 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9823 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:363
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:364
//PFAILOK		TC	CAGETSTQ	# ENABLE PIP FAIL PROG ALARM.
// PORT: Fixed ROM slots 9823.
                        if slot <> 9823 or instruction <> 1881 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1881, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:365
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9824.
                        if slot <> 9824 or instruction <> 6868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6868, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9825 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:366
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:367
//		CS	IMODES30	# RESET IMU AND PIPA FAIL BITS.
// PORT: Fixed ROM slots 9825.
                    if slot <> 9825 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9826 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:368
//		MASK	BIT10
// PORT: Fixed ROM slots 9826.
                        if slot <> 9826 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:369
//		ADS	IMODES30
// PORT: Fixed ROM slots 9827.
                        if slot <> 9827 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9830 {
                if slot <= 9828 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:370
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:371
//		CS	IMODES33
// PORT: Fixed ROM slots 9828.
                    if slot <> 9828 or instruction <> 17105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 721).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9829 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:372
//		MASK	BIT13
// PORT: Fixed ROM slots 9829.
                        if slot <> 9829 or instruction <> 31235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:373
//		ADS	IMODES33
// PORT: Fixed ROM slots 9830.
                        if slot <> 9830 or instruction <> 11985 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9832 {
                    if slot <= 9831 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:374
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:375
//		CS	BIT5
// PORT: Fixed ROM slots 9831.
                        if slot <> 9831 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:376
//		TCF	PFAILOK2
// PORT: Fixed ROM slots 9832.
                        if slot <> 9832 or instruction <> 5722 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5722, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9833 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:377
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:378
//NOATTOFF	CS	OCT40010	# SUBROUTINE TO TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 9833.
                        if slot <> 9833 or instruction <> 17978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1594), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:379
//		MASK	DSPTAB +11D
// PORT: Fixed ROM slots 9834.
                        if slot <> 9834 or instruction <> 29214 { return choose false if checkOnly else -1. }
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
        if slot <= 9841 {
            if slot <= 9837 {
                if slot <= 9835 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:380
//		AD	BIT15
// PORT: Fixed ROM slots 9835.
                    if slot <> 9835 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
                    if slot <= 9836 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:381
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 9836.
                        if slot <> 9836 or instruction <> 23070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:382
//		TC	Q
// PORT: Fixed ROM slots 9837.
                        if slot <> 9837 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9839 {
                    if slot <= 9838 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:383
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:384
//# Page 1429
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:385
//# ROUTINES TO INITIATE AND TERMINATE PROGRAM USE OF THE PIPAS.  NO IMUSTALL REQUIRED IN EITHER CASE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:386
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:387
//PIPUSE		CS	ZERO
// PORT: Fixed ROM slots 9838.
                        if slot <> 9838 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:388
//		TS	PIPAX
// PORT: Fixed ROM slots 9839.
                        if slot <> 9839 or instruction <> 22559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9840 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:389
//		TS	PIPAY
// PORT: Fixed ROM slots 9840.
                        if slot <> 9840 or instruction <> 22560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:390
//		TS	PIPAZ
// PORT: Fixed ROM slots 9841.
                        if slot <> 9841 or instruction <> 22561 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22561, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9844 {
                if slot <= 9842 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:391
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:392
//PIPUSE1		TC	CAGETSTQ	# DO NOT ENABLE PIPA FAIL IF IMU IS CAGED
// PORT: Fixed ROM slots 9842.
                    if slot <> 9842 or instruction <> 1881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1881, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9843 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:393
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9843.
                        if slot <> 9843 or instruction <> 6589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:394
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:395
//		INHINT
// PORT: Fixed ROM slots 9844.
                        if slot <> 9844 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9846 {
                    if slot <= 9845 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:396
//		CS	BIT1		# IF PIPA FAILS FROM NOW ON (UNTIL
// PORT: Fixed ROM slots 9845.
                        if slot <> 9845 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:397
//		MASK	IMODES30	# PIPFREE), LIGHT ISS WARNING.
// PORT: Fixed ROM slots 9846.
                        if slot <> 9846 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9847 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:398
//		TS	IMODES30
// PORT: Fixed ROM slots 9847.
                        if slot <> 9847 or instruction <> 23248 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23248, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:399
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:400
//PIPFREE2	TC	IBNKCALL	# ISS WARNING MIGHT COME ON NOW.
// PORT: Fixed ROM slots 9848.
                        if slot <> 9848 or instruction <> 2528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[597] to agcAotUnit597@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:401
//		CADR	SETISSW		# (OR GO OFF ON PIPFREE).
// PORT: Fixed ROM slots 9849.
    9849, 13162
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9850–9858.
function agcAotUnit598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9853 {
        if slot <= 9851 {
            if slot <= 9850 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:402
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:403
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9850.
                if slot <> 9850 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:404
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:405
//PIPFREE		INHINT			# PROGRAM DONE WITH PIPAS.  DONT LIGHT
// PORT: Fixed ROM slots 9851.
                if slot <> 9851 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9852 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:406
//		CS	IMODES30	# ISS WARNING.
// PORT: Fixed ROM slots 9852.
                if slot <> 9852 or instruction <> 17104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 720).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:407
//		MASK	BIT1
// PORT: Fixed ROM slots 9853.
                if slot <> 9853 or instruction <> 31247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
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
        if slot <= 9855 {
            if slot <= 9854 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:408
//		ADS	IMODES30
// PORT: Fixed ROM slots 9854.
                if slot <> 9854 or instruction <> 11984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 720).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:409
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:410
//		MASK	BIT10		# IF PIP FAIL ON, DO PROG ALSRM AND RESET
// PORT: Fixed ROM slots 9855.
                if slot <> 9855 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 9856 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:411
//		CCS	A		# ISS WARNING.
// PORT: Fixed ROM slots 9856.
                if slot <> 9856 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9857 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:412
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9857.
                    if slot <> 9857 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:413
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:414
//		TC	ALARM
// PORT: Fixed ROM slots 9858.
                    if slot <> 9858 or instruction <> 2984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2984, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[598] to agcAotUnit598@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:415
//		OCT	212
// PORT: Fixed ROM slots 9859.
    9859, 276
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9860–9871.
function agcAotUnit599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9865 {
        if slot <= 9862 {
            if slot <= 9860 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:416
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:417
//		INHINT
// PORT: Fixed ROM slots 9860.
                if slot <> 9860 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9861 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:418
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:419
//		TCF	PIPFREE2
// PORT: Fixed ROM slots 9861.
                    if slot <> 9861 or instruction <> 5752 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5752, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:420
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:421
//# Page 1430
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:422
//# 	THE FOLLOWING ROUTINE TORQUES THE IRIGS ACCORDING TO DOUBLE PRECISION INPUTS IN THE SIX REGISTERS
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:423
//# BEGINNING AT THE ECADR ARRIVING IN A.  THE MINIMUM SIZE OF ANY PULSE TRAIN IS 16 PULSES (.25 CDU COUNTS).  THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:424
//# UNSENT PORTION OF THE COMMAND IS LEFT INTACT IN THE INPUT COMMAND REGISTERS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:425
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:426
//		EBANK=	1400		# VARIABLE, ACTUALLY.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:427
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:428
//IMUPULSE	TS	MPAC +5		# SAVE ARRIVING ECADR.
// PORT: Fixed ROM slots 9862.
                    if slot <> 9862 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9863 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:429
//		TC	CAGETSTJ	# DONT PROCEED IF IMU BEING CAGED.
// PORT: Fixed ROM slots 9863.
                if slot <> 9863 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9864 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:430
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:431
//		CCS	LGYRO		# SEE IF GYROS BUSY.
// PORT: Fixed ROM slots 9864.
                    if slot <> 9864 or instruction <> 4804 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:432
//		TC	GYROBUSY	# SLEEP.
// PORT: Fixed ROM slots 9865.
                    if slot <> 9865 or instruction <> 1706 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1706, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9868 {
            if slot <= 9866 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:433
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:434
//		TS	MPAC +2
// PORT: Fixed ROM slots 9866.
                if slot <> 9866 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9867 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:435
//		CAF	BIT6		# ENABLE THE POWER SUPPLY.
// PORT: Fixed ROM slots 9867.
                    if slot <> 9867 or instruction <> 14858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:436
//		EXTEND
// PORT: Fixed ROM slots 9868.
                    if slot <> 9868 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9869 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:437
//		WOR	CHAN14
// PORT: Fixed ROM slots 9869.
                if slot <> 9869 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9870 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:438
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:439
//		CAF	FOUR
// PORT: Fixed ROM slots 9870.
                    if slot <> 9870 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:440
//GWAKE2		TC	WAITLIST	# (IF A JOB WAS PUT TO SLEEP, THE POWER
// PORT: Fixed ROM slots 9871.
                    if slot <> 9871 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[599] to agcAotUnit599@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:441
//		EBANK=	CDUIND		# SUPPLY IS LEFT ON BY THE WAKING JOB).
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:442
//		2CADR	STRTGYRO
// PORT: Fixed ROM slots 9872 9873.
    9872, 3440, 9873, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9874–9884.
function agcAotUnit600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9878 {
        if slot <= 9875 {
            if slot <= 9874 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:443
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:444
//		CA	MPAC +5		# SET UP EBANK, SAVING CALLER'S EBANK FOR
// PORT: Fixed ROM slots 9874.
                if slot <> 9874 or instruction <> 12401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 113).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:445
//		XCH	EBANK		# RESTORATION ON RETURN.
// PORT: Fixed ROM slots 9875.
                if slot <> 9875 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9876 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:446
//		XCH	MPAC +5
// PORT: Fixed ROM slots 9876.
                if slot <> 9876 or instruction <> 23665 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 113, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9877 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:447
//		TS	LGYRO		# RESERVES GYROS.
// PORT: Fixed ROM slots 9877.
                    if slot <> 9877 or instruction <> 23236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23236, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:448
//		MASK	LOW8
// PORT: Fixed ROM slots 9878.
                    if slot <> 9878 or instruction <> 30971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2299), 32768).
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
        if slot <= 9881 {
            if slot <= 9879 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:449
//		TS	ITEMP1
// PORT: Fixed ROM slots 9879.
                if slot <> 9879 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9880 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:450
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:451
//		CAF	TWO		# FORCE SIGN AGREEMENT ON INPUTS.
// PORT: Fixed ROM slots 9880.
                    if slot <> 9880 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:452
//GYROAGRE	TS	MPAC +3
// PORT: Fixed ROM slots 9881.
                    if slot <> 9881 or instruction <> 22639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22639, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9882 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:453
//		DOUBLE
// PORT: Fixed ROM slots 9882.
                if slot <> 9882 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9883 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:454
//		AD	ITEMP1
// PORT: Fixed ROM slots 9883.
                    if slot <> 9883 or instruction <> 24625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:455
//		TS	MPAC +4
// PORT: Fixed ROM slots 9884.
                    if slot <> 9884 or instruction <> 22640 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[600] to agcAotUnit600@.

// PORT: Physical bank 07. Shared continuation entries, slots 9885–9886.
function agcAotUnit601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9885 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:456
//		EXTEND
// PORT: Fixed ROM slots 9885.
        if slot <> 9885 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:457
//		INDEX	A
// PORT: Fixed ROM slots 9886.
        if slot <> 9886 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[601] to agcAotUnit601@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:458
//		DCA	1400
// PORT: Fixed ROM slots 9887.
    9887, 26114
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9888–9891.
function agcAotUnit602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9889 {
        if slot <= 9888 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:459
//		DXCH	MPAC
// PORT: Fixed ROM slots 9888.
            if slot <> 9888 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:460
//		TC	TPAGREE
// PORT: Fixed ROM slots 9889.
            if slot <> 9889 or instruction <> 3734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9890 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:461
//		DXCH	MPAC
// PORT: Fixed ROM slots 9890.
            if slot <> 9890 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:462
//		INDEX	MPAC +4
// PORT: Fixed ROM slots 9891.
            if slot <> 9891 or instruction <> 20592 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[602] to agcAotUnit602@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:463
//		DXCH	1400
// PORT: Fixed ROM slots 9892.
    9892, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9893–9910.
function agcAotUnit603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9901 {
        if slot <= 9896 {
            if slot <= 9894 {
                if slot <= 9893 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:464
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:465
//		CCS	MPAC +3
// PORT: Fixed ROM slots 9893.
                    if slot <> 9893 or instruction <> 4207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 111).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:466
//		TCF	GYROAGRE
// PORT: Fixed ROM slots 9894.
                    if slot <> 9894 or instruction <> 5785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5785, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9895 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:467
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:468
//		CA	MPAC +5		# RESTORE CALLER'S EBANK.
// PORT: Fixed ROM slots 9895.
                    if slot <> 9895 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:469
//		TS	EBANK
// PORT: Fixed ROM slots 9896.
                    if slot <> 9896 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9898 {
                if slot <= 9897 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:470
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 9897.
                    if slot <> 9897 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:471
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:472
//# Page 1431
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:473
//# ROUTINES TO ALLOW TORQUING BY ONLY ONE JOB AT A TIME.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:474
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:475
//GYROBUSY	EXTEND			# SAVE RETURN 2FCADR.
// PORT: Fixed ROM slots 9898.
                    if slot <> 9898 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9899 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:476
//		DCA	BUF2
// PORT: Fixed ROM slots 9899.
                    if slot <> 9899 or instruction <> 12380 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9900 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:477
//		DXCH	MPAC
// PORT: Fixed ROM slots 9900.
                        if slot <> 9900 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:478
//REGSLEEP	CAF	LGWAKE
// PORT: Fixed ROM slots 9901.
                        if slot <> 9901 or instruction <> 14007 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1719), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9905 {
            if slot <= 9903 {
                if slot <= 9902 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:479
//		TCF	JOBSLEEP
// PORT: Fixed ROM slots 9902.
                    if slot <> 9902 or instruction <> 6781 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6781, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:480
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:481
//GWAKE		CCS	LGYRO		# WHEN AWAKENED, SEE IF GYROS STILL BUSY.
// PORT: Fixed ROM slots 9903.
                    if slot <> 9903 or instruction <> 4804 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9904 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:482
//		TCF	REGSLEEP	# IF SO, SLEEP SOME MORE.
// PORT: Fixed ROM slots 9904.
                    if slot <> 9904 or instruction <> 5805 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5805, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:483
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:484
//		TS	MPAC +2
// PORT: Fixed ROM slots 9905.
                    if slot <> 9905 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9907 {
                if slot <= 9906 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:485
//		EXTEND
// PORT: Fixed ROM slots 9906.
                    if slot <> 9906 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:486
//		DCA	MPAC
// PORT: Fixed ROM slots 9907.
                    if slot <> 9907 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9908 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:487
//		DXCH	BUF2		# RESTORE SWRETURN INFO.
// PORT: Fixed ROM slots 9908.
                    if slot <> 9908 or instruction <> 21596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9909 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:488
//		CAF	ONE
// PORT: Fixed ROM slots 9909.
                        if slot <> 9909 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:489
//		TCF	GWAKE2
// PORT: Fixed ROM slots 9910.
                        if slot <> 9910 or instruction <> 5775 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5775, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[603] to agcAotUnit603@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:490
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:491
//LGWAKE		CADR	GWAKE
// PORT: Fixed ROM slots 9911.
    9911, 15710
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9912–9919.
function agcAotUnit604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9915 {
        if slot <= 9913 {
            if slot <= 9912 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:492
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:493
//# Page 1432
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:494
//# GYRO-TORQUING WAITLIST TASKS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:495
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:496
//STRTGYRO	CS	GDESELCT	# DE-SELECT LAST GYRO.
// PORT: Fixed ROM slots 9912.
                if slot <> 9912 or instruction <> 18249 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1865), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:497
//		EXTEND
// PORT: Fixed ROM slots 9913.
                if slot <> 9913 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9914 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:498
//		WAND	CHAN14
// PORT: Fixed ROM slots 9914.
                if slot <> 9914 or instruction <> 1548 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:499
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:500
//		TC	CAGETEST
// PORT: Fixed ROM slots 9915.
                if slot <> 9915 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9917 {
            if slot <= 9916 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:501
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:502
//STRTGYR2	CA	LGYRO		# JUMP ON PHASE COUNTER IN BITS 13-14.
// PORT: Fixed ROM slots 9916.
                if slot <> 9916 or instruction <> 12996 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:503
//		EXTEND
// PORT: Fixed ROM slots 9917.
                if slot <> 9917 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9918 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:504
//		MP	BIT4
// PORT: Fixed ROM slots 9918.
                if slot <> 9918 or instruction <> 31244 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:505
//		INDEX	A
// PORT: Fixed ROM slots 9919.
                if slot <> 9919 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[604] to agcAotUnit604@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:506
//		TCF	+1
// PORT: Fixed ROM slots 9920.
    9920, 11650
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9921–9921.
function agcAotUnit605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:507
//		TC	GSELECT		# =0.  DO Y GYRO.
// PORT: Fixed ROM slots 9921.
    if slot <> 9921 or instruction <> 1742 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1742, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[605] to agcAotUnit605@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:508
//		OCT	00202
// PORT: Fixed ROM slots 9922.
    9922, 260
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9923–9923.
function agcAotUnit606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:509
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:510
//		TC	GSELECT		# =1.  DO Z GYRO.
// PORT: Fixed ROM slots 9923.
    if slot <> 9923 or instruction <> 1742 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1742, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[606] to agcAotUnit606@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:511
//		OCT	00302
// PORT: Fixed ROM slots 9924.
    9924, 388
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9925–9925.
function agcAotUnit607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:512
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:513
//		TC	GSELECT -2	# =2.  DO X GYRO.
// PORT: Fixed ROM slots 9925.
    if slot <> 9925 or instruction <> 1740 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1740, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[607] to agcAotUnit607@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:514
//		OCT	00100
// PORT: Fixed ROM slots 9926.
    9926, 128
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9927–9934.
function agcAotUnit608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9930 {
        if slot <= 9928 {
            if slot <= 9927 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:515
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:516
//		CAF	ZERO		# =3.  DONE
// PORT: Fixed ROM slots 9927.
                if slot <> 9927 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:517
//		TS	LGYRO
// PORT: Fixed ROM slots 9928.
                if slot <> 9928 or instruction <> 23236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23236, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9929 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:518
//		CAF	LGWAKE		# WAKE A POSSIBLE SLEEPING JOB.
// PORT: Fixed ROM slots 9929.
                if slot <> 9929 or instruction <> 14007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1719), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:519
//		TC	JOBWAKE
// PORT: Fixed ROM slots 9930.
                if slot <> 9930 or instruction <> 2689 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2689, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9932 {
            if slot <= 9931 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:520
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:521
//NORESET		TCF	IMUFINED	# DO NOT RESET POWER SUPPLY
// PORT: Fixed ROM slots 9931.
                if slot <> 9931 or instruction <> 5709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5709, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:522
//# Page 1433
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:523
//	-2	CS	FOUR		# SPECIAL ENTRY TO REGRESS LGYRO FOR X.
// PORT: Fixed ROM slots 9932.
                if slot <> 9932 or instruction <> 18957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9933 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:524
//		ADS	LGYRO
// PORT: Fixed ROM slots 9933.
                if slot <> 9933 or instruction <> 11972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:525
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:526
//GSELECT		INDEX	Q		# SELECT GYRO.
// PORT: Fixed ROM slots 9934.
                if slot <> 9934 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[608] to agcAotUnit608@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:527
//		CAF	0		# PACKED WORD CONTAINS GYRO SELECT BITS
// PORT: Fixed ROM slots 9935.
    9935, 24576
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9936–9947.
function agcAotUnit609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9941 {
        if slot <= 9938 {
            if slot <= 9936 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:528
//		TS	ITEMP4		# AND INCREMENT TO LGYRO.
// PORT: Fixed ROM slots 9936.
                if slot <> 9936 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9937 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:529
//		MASK	SEVEN
// PORT: Fixed ROM slots 9937.
                    if slot <> 9937 or instruction <> 31251 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:530
//		AD	BIT13
// PORT: Fixed ROM slots 9938.
                    if slot <> 9938 or instruction <> 27139 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9939 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:531
//		ADS	LGYRO
// PORT: Fixed ROM slots 9939.
                if slot <> 9939 or instruction <> 11972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9940 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:532
//		TS	EBANK
// PORT: Fixed ROM slots 9940.
                    if slot <> 9940 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:533
//		MASK	LOW8
// PORT: Fixed ROM slots 9941.
                    if slot <> 9941 or instruction <> 30971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2299), 32768).
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
        if slot <= 9944 {
            if slot <= 9942 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:534
//		TS	ITEMP1
// PORT: Fixed ROM slots 9942.
                if slot <> 9942 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9943 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:535
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:536
//		CS	SEVEN
// PORT: Fixed ROM slots 9943.
                    if slot <> 9943 or instruction <> 18963 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:537
//		MASK	ITEMP4
// PORT: Fixed ROM slots 9944.
                    if slot <> 9944 or instruction <> 28724 { return choose false if checkOnly else -1. }
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
            if slot <= 9945 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:538
//		TS	ITEMP4
// PORT: Fixed ROM slots 9945.
                if slot <> 9945 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9946 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:539
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:540
//		EXTEND			# MOVE DP COMMAND TO RUPTREGS FOR TESTING.
// PORT: Fixed ROM slots 9946.
                    if slot <> 9946 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:541
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 9947.
                    if slot <> 9947 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[609] to agcAotUnit609@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:542
//		DCA	1400
// PORT: Fixed ROM slots 9948.
    9948, 26114
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9949–9986.
function agcAotUnit610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9967 {
        if slot <= 9957 {
            if slot <= 9952 {
                if slot <= 9950 {
                    if slot <= 9949 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:543
//		DXCH	RUPTREG1
// PORT: Fixed ROM slots 9949.
                        if slot <> 9949 or instruction <> 21561 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:544
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:545
//		CCS	RUPTREG1
// PORT: Fixed ROM slots 9950.
                        if slot <> 9950 or instruction <> 4152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9951 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:546
//		TCF	MAJ+
// PORT: Fixed ROM slots 9951.
                        if slot <> 9951 or instruction <> 5866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5866, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:547
//		TCF	+2
// PORT: Fixed ROM slots 9952.
                        if slot <> 9952 or instruction <> 5858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5858, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9954 {
                    if slot <= 9953 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:548
//		TCF	MAJ-
// PORT: Fixed ROM slots 9953.
                        if slot <> 9953 or instruction <> 5946 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5946, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:549
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:550
//		CCS	RUPTREG2
// PORT: Fixed ROM slots 9954.
                        if slot <> 9954 or instruction <> 4153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 57).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9955 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:551
//		TCF	MIN+
// PORT: Fixed ROM slots 9955.
                        if slot <> 9955 or instruction <> 5863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5863, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9956 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:552
//		TCF	STRTGYR2
// PORT: Fixed ROM slots 9956.
                            if slot <> 9956 or instruction <> 5820 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5820, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:553
//		TCF	MIN-
// PORT: Fixed ROM slots 9957.
                            if slot <> 9957 or instruction <> 5943 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5943, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9962 {
                if slot <= 9959 {
                    if slot <= 9958 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:554
//		TCF	STRTGYR2
// PORT: Fixed ROM slots 9958.
                        if slot <> 9958 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:555
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:556
//# Page 1434
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:557
//MIN+		AD	-GYROMIN	# SMALL POSITIVE COMMAND.  SEE IF AT LEAST
// PORT: Fixed ROM slots 9959.
                        if slot <> 9959 or instruction <> 26371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1795), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9960 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:558
//		EXTEND			# 16 GYRO PULSES.
// PORT: Fixed ROM slots 9960.
                        if slot <> 9960 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9961 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:559
//		BZMF	STRTGYR2
// PORT: Fixed ROM slots 9961.
                            if slot <> 9961 or instruction <> 26300 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26300, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:560
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:561
//MAJ+		EXTEND			# DEFINITE POSITIVE OUTPUT.
// PORT: Fixed ROM slots 9962.
                            if slot <> 9962 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9964 {
                    if slot <= 9963 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:562
//		DCA	GYROFRAC
// PORT: Fixed ROM slots 9963.
                        if slot <> 9963 or instruction <> 14155 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1867, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:563
//		DAS	RUPTREG1
// PORT: Fixed ROM slots 9964.
                        if slot <> 9964 or instruction <> 8249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 57) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9965 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:564
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:565
//		CA	ITEMP4		# SELECT POSITIVE TORQUING FOR THIS GYRO.
// PORT: Fixed ROM slots 9965.
                        if slot <> 9965 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9966 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:566
//		EXTEND
// PORT: Fixed ROM slots 9966.
                            if slot <> 9966 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:567
//		WOR	CHAN14
// PORT: Fixed ROM slots 9967.
                            if slot <> 9967 or instruction <> 2572 { return choose false if checkOnly else -1. }
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
        if slot <= 9976 {
            if slot <= 9971 {
                if slot <= 9969 {
                    if slot <= 9968 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:568
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:569
//		CAF	LOW7		# LEAVE NUMBER OF POSSIBLE 8192 AUGMENTS
// PORT: Fixed ROM slots 9968.
                        if slot <> 9968 or instruction <> 15395 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3107), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:570
//		MASK	RUPTREG2	# TO INITIAL COMMAND IN MAJOR PART OF LONG
// PORT: Fixed ROM slots 9969.
                        if slot <> 9969 or instruction <> 28729 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 57).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9970 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:571
//		XCH	RUPTREG2	# TERM STORAGE AND TRUNCATED FRACTION
// PORT: Fixed ROM slots 9970.
                        if slot <> 9970 or instruction <> 23609 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 57, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:572
//GMERGE		EXTEND			# IN MINOR PART.  THE MAJOR PART WILL BE
// PORT: Fixed ROM slots 9971.
                        if slot <> 9971 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9973 {
                    if slot <= 9972 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:573
//		MP	BIT8		# COUNTED DOWN TO ZERO IN THE COURSE OF
// PORT: Fixed ROM slots 9972.
                        if slot <> 9972 or instruction <> 31240 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:574
//		TS	ITEMP2		# PUTTING OUT THE ENTIRE COMMAND.
// PORT: Fixed ROM slots 9973.
                        if slot <> 9973 or instruction <> 22578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9974 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:575
//		CA	RUPTREG1
// PORT: Fixed ROM slots 9974.
                        if slot <> 9974 or instruction <> 12344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9975 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:576
//		EXTEND
// PORT: Fixed ROM slots 9975.
                            if slot <> 9975 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:577
//		MP	BIT9
// PORT: Fixed ROM slots 9976.
                            if slot <> 9976 or instruction <> 31239 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2567, readEffective:call(words, 2567)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9981 {
                if slot <= 9978 {
                    if slot <= 9977 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:578
//		TS	RUPTREG1
// PORT: Fixed ROM slots 9977.
                        if slot <> 9977 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:579
//		CA	L
// PORT: Fixed ROM slots 9978.
                        if slot <> 9978 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9979 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:580
//		EXTEND
// PORT: Fixed ROM slots 9979.
                        if slot <> 9979 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9980 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:581
//		MP	BIT14
// PORT: Fixed ROM slots 9980.
                            if slot <> 9980 or instruction <> 31234 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:582
//		ADS	ITEMP2		# INITIAL COMMAND.
// PORT: Fixed ROM slots 9981.
                            if slot <> 9981 or instruction <> 11314 { return choose false if checkOnly else -1. }
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
                if slot <= 9983 {
                    if slot <= 9982 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:583
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:584
//		EXTEND			# SEE IF MORE THAN ONE PULSE TRAIN NEEDED
// PORT: Fixed ROM slots 9982.
                        if slot <> 9982 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:585
//		DCA	RUPTREG1	# (MORE THAN 16383 PULSES).
// PORT: Fixed ROM slots 9983.
                        if slot <> 9983 or instruction <> 12345 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 57, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9984 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:586
//		AD	MINUS1
// PORT: Fixed ROM slots 9984.
                        if slot <> 9984 or instruction <> 28622 { return choose false if checkOnly else -1. }
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
                        if slot <= 9985 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:587
//		CCS	A
// PORT: Fixed ROM slots 9985.
                            if slot <> 9985 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:588
//		TCF	LONGGYRO
// PORT: Fixed ROM slots 9986.
                            if slot <> 9986 or instruction <> 5910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5910, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[610] to agcAotUnit610@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:589
//-GYROMIN	OCT	-176		# MAY BE ADJUSTED TO SPECIFY MINIMUM CMD
// PORT: Fixed ROM slots 9987.
    9987, 65282
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9988–9992.
function agcAotUnit611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9989 {
        if slot <= 9988 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:590
//		TCF	+4
// PORT: Fixed ROM slots 9988.
            if slot <> 9988 or instruction <> 5896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5896, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:591
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:592
//		CAF	BIT14
// PORT: Fixed ROM slots 9989.
            if slot <> 9989 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9990 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:593
//		ADS	ITEMP2
// PORT: Fixed ROM slots 9990.
            if slot <> 9990 or instruction <> 11314 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9991 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:594
//		CAF	ZERO
// PORT: Fixed ROM slots 9991.
                if slot <> 9991 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:595
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:596
//	+4	INDEX	ITEMP1
// PORT: Fixed ROM slots 9992.
                if slot <> 9992 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[611] to agcAotUnit611@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:597
//		DXCH	1400
// PORT: Fixed ROM slots 9993.
    9993, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9994–9999.
function agcAotUnit612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9996 {
        if slot <= 9994 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:598
//# Page 1435
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:599
//		CA	ITEMP2		# ENTIRE COMMAND.
// PORT: Fixed ROM slots 9994.
            if slot <> 9994 or instruction <> 12338 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9995 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:600
//LASTSEG		TS	GYROCMD
// PORT: Fixed ROM slots 9995.
                if slot <> 9995 or instruction <> 22567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:601
//		EXTEND
// PORT: Fixed ROM slots 9996.
                if slot <> 9996 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9997 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:602
//		MP	BIT10		# WAITLIST DT
// PORT: Fixed ROM slots 9997.
            if slot <> 9997 or instruction <> 31238 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2566, readEffective:call(words, 2566)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9998 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:603
//		AD	THREE		# TRUNCATION AND PHASE UNCERTAINTIES.
// PORT: Fixed ROM slots 9998.
                if slot <> 9998 or instruction <> 27788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:604
//		TC	WAITLIST
// PORT: Fixed ROM slots 9999.
                if slot <> 9999 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[612] to agcAotUnit612@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:605
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:606
//		2CADR	STRTGYRO
// PORT: Fixed ROM slots 10000 10001.
    10000, 3440, 10001, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10002–10006.
function agcAotUnit613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10003 {
        if slot <= 10002 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:607
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:608
//GYROEXIT	CAF	BIT10
// PORT: Fixed ROM slots 10002.
            if slot <> 10002 or instruction <> 14854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:609
//		EXTEND
// PORT: Fixed ROM slots 10003.
            if slot <> 10003 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10004 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:610
//		WOR	CHAN14
// PORT: Fixed ROM slots 10004.
            if slot <> 10004 or instruction <> 2572 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10005 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:611
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10005.
                if slot <> 10005 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:612
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:613
//LONGGYRO	INDEX	ITEMP1
// PORT: Fixed ROM slots 10006.
                if slot <> 10006 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[613] to agcAotUnit613@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:614
//		DXCH	1400		# INITIAL COMMAND OUT PLUS N AUGMENTS OF
// PORT: Fixed ROM slots 10007.
    10007, 44546
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10008–10014.
function agcAotUnit614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10010 {
        if slot <= 10008 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:615
//		CAF	BIT14		# 8192.  INITIAL COMMAND IS AT LEAST 8192.
// PORT: Fixed ROM slots 10008.
            if slot <> 10008 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10009 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:616
//		AD	ITEMP2
// PORT: Fixed ROM slots 10009.
                if slot <> 10009 or instruction <> 24626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:617
//		TS	GYROCMD
// PORT: Fixed ROM slots 10010.
                if slot <> 10010 or instruction <> 22567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10012 {
            if slot <= 10011 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:618
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:619
//AUG3		EXTEND			# GET WAITLIST DT TO TIME WHEN TRAIN IS
// PORT: Fixed ROM slots 10011.
                if slot <> 10011 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:620
//		MP	BIT10		# ALMOST OUT.
// PORT: Fixed ROM slots 10012.
                if slot <> 10012 or instruction <> 31238 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2566, readEffective:call(words, 2566)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10013 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:621
//		AD	NEG3
// PORT: Fixed ROM slots 10013.
                if slot <> 10013 or instruction <> 28620 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:622
//		TC	WAITLIST
// PORT: Fixed ROM slots 10014.
                if slot <> 10014 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[614] to agcAotUnit614@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:623
//		EBANK=	CDUIND
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:624
//		2CADR	8192AUG
// PORT: Fixed ROM slots 10015 10016.
    10015, 3652, 10016, 14438
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10017–10028.
function agcAotUnit615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10022 {
        if slot <= 10019 {
            if slot <= 10017 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:625
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:626
//		TCF	GYROEXIT
// PORT: Fixed ROM slots 10017.
                if slot <> 10017 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10018 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:627
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:628
//8192AUG		TC	CAGETEST
// PORT: Fixed ROM slots 10018.
                    if slot <> 10018 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:629
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:630
//		CAF	BIT4
// PORT: Fixed ROM slots 10019.
                    if slot <> 10019 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10020 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:631
//		EXTEND
// PORT: Fixed ROM slots 10020.
                if slot <> 10020 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10021 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:632
//		RAND	CHAN12
// PORT: Fixed ROM slots 10021.
                    if slot <> 10021 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:633
//		CCS	A
// PORT: Fixed ROM slots 10022.
                    if slot <> 10022 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 10025 {
            if slot <= 10023 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:634
//		TCF	IMUBAD
// PORT: Fixed ROM slots 10023.
                if slot <> 10023 or instruction <> 5970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10024 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:635
//		CA	LGYRO		# ADD 8192 PULSES TO GYROCMD
// PORT: Fixed ROM slots 10024.
                    if slot <> 10024 or instruction <> 12996 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:636
//		TS	EBANK
// PORT: Fixed ROM slots 10025.
                    if slot <> 10025 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10026 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:637
//		MASK	LOW8
// PORT: Fixed ROM slots 10026.
                if slot <> 10026 or instruction <> 30971 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2299), 32768).
                    if fixedOperand = 255 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10027 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:638
//		TS	ITEMP1
// PORT: Fixed ROM slots 10027.
                    if slot <> 10027 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:639
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:640
//		INDEX	ITEMP1		# SEE IF THIS IS THE LAST AUG.
// PORT: Fixed ROM slots 10028.
                    if slot <> 10028 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[615] to agcAotUnit615@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:641
//		CCS	1400
// PORT: Fixed ROM slots 10029.
    10029, 9728
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10030–10034.
function agcAotUnit616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10031 {
        if slot <= 10030 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:642
//		TCF	AUG2		# MORE TO COME.
// PORT: Fixed ROM slots 10030.
            if slot <> 10030 or instruction <> 5938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5938, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:643
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:644
//		CAF	BIT14
// PORT: Fixed ROM slots 10031.
            if slot <> 10031 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10032 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:645
//		ADS	GYROCMD
// PORT: Fixed ROM slots 10032.
            if slot <> 10032 or instruction <> 11303 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 39).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10033 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:646
//		TCF	LASTSEG +1
// PORT: Fixed ROM slots 10033.
                if slot <> 10033 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:647
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:648
//# Page 1436
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:649
//AUG2		INDEX	ITEMP1
// PORT: Fixed ROM slots 10034.
                if slot <> 10034 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[616] to agcAotUnit616@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:650
//		TS	1400
// PORT: Fixed ROM slots 10035.
    10035, 46592
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10036–10056.
function agcAotUnit617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10045 {
        if slot <= 10040 {
            if slot <= 10037 {
                if slot <= 10036 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:651
//		CAF	BIT14
// PORT: Fixed ROM slots 10036.
                    if slot <> 10036 or instruction <> 14850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:652
//		ADS	GYROCMD
// PORT: Fixed ROM slots 10037.
                    if slot <> 10037 or instruction <> 11303 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 39).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10038 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:653
//		TCF	AUG3		# COMPUTE DT.
// PORT: Fixed ROM slots 10038.
                    if slot <> 10038 or instruction <> 5915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5915, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10039 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:654
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:655
//# Page 1437
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:656
//MIN-		AD	-GYROMIN	# POSSIBLE NEGATIVE OUTPUT.
// PORT: Fixed ROM slots 10039.
                        if slot <> 10039 or instruction <> 26371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1795), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:657
//		EXTEND
// PORT: Fixed ROM slots 10040.
                        if slot <> 10040 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10042 {
                if slot <= 10041 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:658
//		BZMF	STRTGYR2
// PORT: Fixed ROM slots 10041.
                    if slot <> 10041 or instruction <> 26300 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26300, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:659
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:660
//MAJ-		EXTEND			# DEFINITE NEGATIVE OUTPUT.
// PORT: Fixed ROM slots 10042.
                    if slot <> 10042 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10043 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:661
//		DCS	GYROFRAC
// PORT: Fixed ROM slots 10043.
                    if slot <> 10043 or instruction <> 18251 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 1867, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10044 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:662
//		DAS	RUPTREG1
// PORT: Fixed ROM slots 10044.
                        if slot <> 10044 or instruction <> 8249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 57) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:663
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:664
//		CA	ITEMP4		# SELECT NEGATIVE TORQUING FOR THIS GYRO.
// PORT: Fixed ROM slots 10045.
                        if slot <> 10045 or instruction <> 12340 { return choose false if checkOnly else -1. }
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
        if slot <= 10050 {
            if slot <= 10047 {
                if slot <= 10046 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:665
//		AD	BIT9
// PORT: Fixed ROM slots 10046.
                    if slot <> 10046 or instruction <> 27143 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:666
//		EXTEND
// PORT: Fixed ROM slots 10047.
                    if slot <> 10047 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10048 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:667
//		WOR	CHAN14
// PORT: Fixed ROM slots 10048.
                    if slot <> 10048 or instruction <> 2572 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10049 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:668
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:669
//		CS	RUPTREG1	# SET UP RUPTREGS TO FALL INTO GMERGE.
// PORT: Fixed ROM slots 10049.
                        if slot <> 10049 or instruction <> 16440 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 56).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:670
//		TS	RUPTREG1	# ALL NUMBERS PUT INTO GYROCMD ARE
// PORT: Fixed ROM slots 10050.
                        if slot <> 10050 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10053 {
                if slot <= 10051 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:671
//		CS	RUPTREG2	# POSITIVE - BIT9 OF CHAN 14 DETERMINES
// PORT: Fixed ROM slots 10051.
                    if slot <> 10051 or instruction <> 16441 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 57).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10052 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:672
//		MASK	LOW7		# THE SIGN OF THE COMMAND.
// PORT: Fixed ROM slots 10052.
                        if slot <> 10052 or instruction <> 31779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3107), 32768).
                            if fixedOperand = 127 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:673
//		COM
// PORT: Fixed ROM slots 10053.
                        if slot <> 10053 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10054 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:674
//		XCH	RUPTREG2
// PORT: Fixed ROM slots 10054.
                    if slot <> 10054 or instruction <> 23609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 57, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10055 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:675
//		COM
// PORT: Fixed ROM slots 10055.
                        if slot <> 10055 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:676
//		TCF	GMERGE
// PORT: Fixed ROM slots 10056.
                        if slot <> 10056 or instruction <> 5875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[617] to agcAotUnit617@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:677
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:678
//GDESELCT	OCT	1700		# TURN OFF SELECT AND ACTIVITY BITS.
// PORT: Fixed ROM slots 10057.
    10057, 1920,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:679
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:680
//GYROFRAC	2DEC	.215 B-21
// PORT: Fixed ROM slots 10058 10059.
    10058, 0, 10059, 56
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10060–10091.
function agcAotUnit618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10075 {
        if slot <= 10067 {
            if slot <= 10063 {
                if slot <= 10061 {
                    if slot <= 10060 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:681
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:682
//# Page 1438
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:683
//# IMU MODE SWITCHING ROUTINES COME HERE WHEN ACTION COMPLETE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:684
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:685
//ENDIMU		EXTEND			# MODE IS BAD IF CAGE HAS OCCURRED OR IF
// PORT: Fixed ROM slots 10060.
                        if slot <> 10060 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:686
//		READ	DSALMOUT	# ISS WARNING IS ON.
// PORT: Fixed ROM slots 10061.
                        if slot <> 10061 or instruction <> 9 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10062 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:687
//		MASK	BIT1
// PORT: Fixed ROM slots 10062.
                        if slot <> 10062 or instruction <> 31247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            if fixedOperand = 1 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:688
//		CCS	A
// PORT: Fixed ROM slots 10063.
                        if slot <> 10063 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 10065 {
                    if slot <= 10064 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:689
//		TCF	IMUBAD
// PORT: Fixed ROM slots 10064.
                        if slot <> 10064 or instruction <> 5970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5970, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:690
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:691
//IMUGOOD		TCF	GOODEND		# WITH C(A) = 0.
// PORT: Fixed ROM slots 10065.
                        if slot <> 10065 or instruction <> 5992 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5992, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10066 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:692
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:693
//IMUBAD		CAF	ZERO
// PORT: Fixed ROM slots 10066.
                        if slot <> 10066 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:694
//		TCF	BADEND
// PORT: Fixed ROM slots 10067.
                        if slot <> 10067 or instruction <> 5989 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5989, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10071 {
                if slot <= 10069 {
                    if slot <= 10068 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:695
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:696
//CAGETEST	CAF	BIT6		# SUBROUTINE TO TERMINATE IMU MODE
// PORT: Fixed ROM slots 10068.
                        if slot <> 10068 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:697
//		MASK	IMODES30	# SWITCH IF IMU HAS BEEN CAGED.
// PORT: Fixed ROM slots 10069.
                        if slot <> 10069 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10070 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:698
//		CCS	A
// PORT: Fixed ROM slots 10070.
                        if slot <> 10070 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:699
//		TCF	IMUBAD		# DIRECTLY.
// PORT: Fixed ROM slots 10071.
                        if slot <> 10071 or instruction <> 5970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5970, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10073 {
                    if slot <= 10072 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:700
//		TC	Q		# WITH C(A) = +0.
// PORT: Fixed ROM slots 10072.
                        if slot <> 10072 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:701
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:702
//CAGETSTQ	CS	IMODES30	# SKIP IF IMU NOT BEING CAGED.
// PORT: Fixed ROM slots 10073.
                        if slot <> 10073 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10074 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:703
//		MASK	BIT6
// PORT: Fixed ROM slots 10074.
                        if slot <> 10074 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:704
//		CCS	A
// PORT: Fixed ROM slots 10075.
                        if slot <> 10075 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 10083 {
            if slot <= 10079 {
                if slot <= 10077 {
                    if slot <= 10076 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:705
//		INCR	Q
// PORT: Fixed ROM slots 10076.
                        if slot <> 10076 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:706
//		TC	Q
// PORT: Fixed ROM slots 10077.
                        if slot <> 10077 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10078 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:707
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:708
//CAGETSTJ	CS	IMODES30	# IF DURING MODE SWITCH INITIALIZATION.
// PORT: Fixed ROM slots 10078.
                        if slot <> 10078 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:709
//		MASK	BIT6		# IT IS FOUND THAT THE IMU IS BEING CAGED.
// PORT: Fixed ROM slots 10079.
                        if slot <> 10079 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
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
                if slot <= 10081 {
                    if slot <= 10080 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:710
//		CCS	A		# SET IMUCADR TO -0 TO INDICATE OPERATION
// PORT: Fixed ROM slots 10080.
                        if slot <> 10080 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:711
//		TC	Q		# COMPLETE BUT FAILED.  RETURN IMMEDIATELY
// PORT: Fixed ROM slots 10081.
                        if slot <> 10081 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10082 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:712
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:713
//		CS	ZERO		# TO SWRETURN.
// PORT: Fixed ROM slots 10082.
                        if slot <> 10082 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:714
//		TS	IMUCADR
// PORT: Fixed ROM slots 10083.
                        if slot <> 10083 or instruction <> 23250 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23250, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10087 {
                if slot <= 10085 {
                    if slot <= 10084 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:715
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 10084.
                        if slot <> 10084 or instruction <> 5536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5536, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:716
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:717
//# Page 1439
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:718
//# 	GENERALIZED MODE SWITCHING TERMINATION.  ENTER AT GOODEND FOR SUCCESSFUL COMPLETION OF AN I/O OPERATION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:719
//# OR AT BADEND FOR AN UNSUCCESSFUL ONE.  C(A) OR ARRIVAL =0 FOR IMU, 1 FOR OPTICS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:720
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:721
//BADEND		TS	RUPTREG2	# DEVICE INDEX.
// PORT: Fixed ROM slots 10085.
                        if slot <> 10085 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10086 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:722
//		CS	ZERO		# FOR FAILURE.
// PORT: Fixed ROM slots 10086.
                        if slot <> 10086 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:723
//		TCF	GOODEND +2
// PORT: Fixed ROM slots 10087.
                        if slot <> 10087 or instruction <> 5994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5994, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10089 {
                    if slot <= 10088 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:724
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:725
//GOODEND		TS	RUPTREG2
// PORT: Fixed ROM slots 10088.
                        if slot <> 10088 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:726
//		CS	ONE		# FOR SUCCESS.
// PORT: Fixed ROM slots 10089.
                        if slot <> 10089 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10090 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:727
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:728
//		TS	RUPTREG3
// PORT: Fixed ROM slots 10090.
                        if slot <> 10090 or instruction <> 22586 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22586, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:729
//		INDEX	RUPTREG2	# SEE IF USING PROGRAM ASLEEP.
// PORT: Fixed ROM slots 10091.
                        if slot <> 10091 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[618] to agcAotUnit618@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:730
//		CCS	MODECADR
// PORT: Fixed ROM slots 10092.
    10092, 9636
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10093–10096.
function agcAotUnit619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10094 {
        if slot <= 10093 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:731
//		TCF	+2		# YES - WAKE IT UP.
// PORT: Fixed ROM slots 10093.
            if slot <> 10093 or instruction <> 5999 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5999, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:732
//		TCF	ENDMODE		# IF 0, PROGRAM NOT IN YET.
// PORT: Fixed ROM slots 10094.
            if slot <> 10094 or instruction <> 6007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10095 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:733
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:734
//		CAF	ZERO		# WAKE SLEEPING PROGRAM.
// PORT: Fixed ROM slots 10095.
            if slot <> 10095 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:735
//		INDEX	RUPTREG2
// PORT: Fixed ROM slots 10096.
            if slot <> 10096 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[619] to agcAotUnit619@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:736
//		XCH	MODECADR
// PORT: Fixed ROM slots 10097.
    10097, 48548
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10098–10100.
function agcAotUnit620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10098 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:737
//		TC	JOBWAKE
// PORT: Fixed ROM slots 10098.
        if slot <> 10098 or instruction <> 2689 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2689, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10099 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:738
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:739
//		CS	RUPTREG3	# ADVANCE LOC IF SUCCESSFUL.
// PORT: Fixed ROM slots 10099.
            if slot <> 10099 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:740
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 10100.
            if slot <> 10100 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[620] to agcAotUnit620@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:741
//		ADS	LOC
// PORT: Fixed ROM slots 10101.
    10101, 22760
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10102–10104.
function agcAotUnit621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10102 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:742
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:743
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10102.
        if slot <> 10102 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10103 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:744
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:745
//ENDMODE		CA	RUPTREG3	# -0 INDICATES OPERATION COMPLETE BUT
// PORT: Fixed ROM slots 10103.
            if slot <> 10103 or instruction <> 12346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 58).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:746
//		INDEX	RUPTREG2	# UNSUCCESSFUL - -1 INDICATES COMPLETE AND
// PORT: Fixed ROM slots 10104.
            if slot <> 10104 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[621] to agcAotUnit621@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:747
//		TS	MODECADR	# SUCCESSFUL.
// PORT: Fixed ROM slots 10105.
    10105, 46500
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10106–10114.
function agcAotUnit622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10109 {
        if slot <= 10107 {
            if slot <= 10106 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:748
//		TCF	TASKOVER
// PORT: Fixed ROM slots 10106.
                if slot <> 10106 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:749
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:750
//# Page 1440
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:751
//# 	GENERAL STALLING ROUTINE.  USING PROGRAMS COME HERE TO WAIT FOR I/O COMPLETION.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:752
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:753
//# PROGRAM DESCRIPTION					DATE- 21 FEB 1967
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:754
//#						LOG SECTION IMU MODE SWITCHING
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:755
//# MOD BY- R.MELANSON TO ADD DOCUMENTATION		ASSEMBLY SUNDISK REV. 82
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:756
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:757
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:758
//#	TO DELAY FURTHER EXECUTION OF THE CALLING ROUTINE UNTIL ITS SELECTED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:759
//#	I/O FUNCTION IS COMPLETE.  THE FOLLOWING CHECKS ON THE CALLING ROUTINES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:760
//#	MODECADR ARE MADE AND ACTED UPON.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:761
//#	1) +0 INDICATES INCOMPLETE I/O OPERATION.CALLING ROUTINE IS PUT TO
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:762
//#	   SLEEP.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:763
//#	2) -1 INDICATES COMPLETED I/O OPERATION.  STALL BYPASSES JOBSLEEP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:764
//#	   CALL AND RETURNS TO CALLING ROUTINE AT L+3
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:765
//#	3) -0 INDICATES COMPLETED I/O WITH FAILURE.  STALL CLEARS MODECADR
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:766
//#	   AND RETURNS TO CALLING ROUTINE AT L+2.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:767
//#	4) VALUE GREATER THAN 0 INDICATES TWO ROUTINES CALLING FOR USE OF
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:768
//#	   SAME DEVICE.  STALL EXITS TO ABORT WHICH EXECUTES A PROGRAM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:769
//#	   RESTART WHICH IN TURN CLEARS ALL MODECADR REGISTERS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:770
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:771
//# CALLING SEQUENCE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:772
//# L 	TC	BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:773
//# L+1	CADR	(ONE OF 5 STALL ADDRESSES I.E. IMUSTALL,OPTSTALL,RADSTALL,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:774
//#		AOTSTALL,OR ATTSTALL)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:775
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:776
//# NORMAL-EXIT MODE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:777
//# TCF	JOBSLEEP OR TCF	MODEXIT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:778
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:779
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:780
//# TC	ABORT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:781
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:782
//# OUTPUT-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:783
//#	MODECADR= CADR 	IF JOBSLEEP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:784
//#	MODECADR=+0	IF I/O COMPLETE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:785
//#	BUF2=L+3	IF I/O COMPLETE AND GOOD.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:786
//#	BUF2=L+2 IF I/O COMPLETE BUT FAILED.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:787
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:788
//# ERASABLE INITIALIZATION-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:789
//#	BUF2 CONTAINS RETURN ADDRESS PLUS 1,(L+2)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:790
//#	BUF2+1 CONTAINS FBANK VALUE OF CALLING ROUTINE.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:791
//#	MODECADR OF CALLING ROUTINE CONTAINS +0,-1,-0 OR CADR RETURN ADDRESS.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:792
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:793
//# DEBRIS-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:794
//#	RUPTREG2 AND CALLING ROUTINE MODECADR.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:795
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:796
//AOTSTALL	CAF	ONE		# AOT.
// PORT: Fixed ROM slots 10107.
                if slot <> 10107 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
            if slot <= 10108 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:797
//		TC	STALL
// PORT: Fixed ROM slots 10108.
                if slot <> 10108 or instruction <> 1920 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1920, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:798
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:799
//RADSTALL	CAF	TWO
// PORT: Fixed ROM slots 10109.
                if slot <> 10109 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        if slot <= 10111 {
            if slot <= 10110 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:800
//		TCF	STALL
// PORT: Fixed ROM slots 10110.
                if slot <> 10110 or instruction <> 6016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:801
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:802
//# Page 1441
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:803
//OPTSTALL	EQUALS	AOTSTALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:804
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:805
//IMUSTALL	CAF	ZERO		# IMU.
// PORT: Fixed ROM slots 10111.
                if slot <> 10111 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 10112 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:806
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:807
//STALL		INHINT
// PORT: Fixed ROM slots 10112.
                if slot <> 10112 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10113 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:808
//		TS	RUPTREG2	# SAVE DEVICE INDEX.
// PORT: Fixed ROM slots 10113.
                    if slot <> 10113 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:809
//		INDEX	A		# SEE IF OPERATION COMPLETE.
// PORT: Fixed ROM slots 10114.
                    if slot <> 10114 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[622] to agcAotUnit622@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:810
//		CCS	MODECADR
// PORT: Fixed ROM slots 10115.
    10115, 9636
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10116–10119.
function agcAotUnit623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10117 {
        if slot <= 10116 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:811
//		TCF	MODABORT	# ALLOWABLE STATES ARE +0, -1, AND -0.
// PORT: Fixed ROM slots 10116.
            if slot <> 10116 or instruction <> 6034 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6034, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:812
//		TCF	MODESLP		# OPERATION INCOMPLETE.
// PORT: Fixed ROM slots 10117.
            if slot <> 10117 or instruction <> 6030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10118 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:813
//		TCF	MODEGOOD	# COMPLETE AND GOOD IF = -1.
// PORT: Fixed ROM slots 10118.
            if slot <> 10118 or instruction <> 6026 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6026, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:814
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:815
//MG2		INDEX	RUPTREG2	# COMPLETE FAILED IF -0.  RESET TO +0.
// PORT: Fixed ROM slots 10119.
            if slot <> 10119 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[623] to agcAotUnit623@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:816
//		TS	MODECADR	# RETURN TO CALLER.
// PORT: Fixed ROM slots 10120.
    10120, 46500
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10121–10127.
function agcAotUnit624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10123 {
        if slot <= 10121 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:817
//		TCF	MODEEXIT
// PORT: Fixed ROM slots 10121.
            if slot <> 10121 or instruction <> 5536 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5536, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10122 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:818
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:819
//MODEGOOD	CCS	A		# MAKE SURE INITIAL STATE -1.
// PORT: Fixed ROM slots 10122.
                if slot <> 10122 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:820
//		TCF	MODABORT
// PORT: Fixed ROM slots 10123.
                if slot <> 10123 or instruction <> 6034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10125 {
            if slot <= 10124 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:821
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:822
//		INCR	BUF2		# IF SO, INCREMENT RETURN ADDRESS AND
// PORT: Fixed ROM slots 10124.
                if slot <> 10124 or instruction <> 10331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:823
//		TCF	MG2		# RETURN IMMEDIATELY, SETTIN CADR = +0.
// PORT: Fixed ROM slots 10125.
                if slot <> 10125 or instruction <> 6023 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6023, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10126 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:824
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:825
//MODESLP		TC	MAKECADR	# CALL FROM SWITCHABLE FIXED ONLY.
// PORT: Fixed ROM slots 10126.
                if slot <> 10126 or instruction <> 2505 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2505, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:826
//		INDEX	RUPTREG2
// PORT: Fixed ROM slots 10127.
                if slot <> 10127 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[624] to agcAotUnit624@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:827
//		TS	MODECADR
// PORT: Fixed ROM slots 10128.
    10128, 46500
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10129–10130.
function agcAotUnit625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10129 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:828
//		TCF	JOBSLEEP
// PORT: Fixed ROM slots 10129.
        if slot <> 10129 or instruction <> 6781 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6781, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:829
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:830
//MODABORT	TC	POODOO		# TWO PROGRAMS USING THE SAME DEVICE.
// PORT: Fixed ROM slots 10130.
        if slot <> 10130 or instruction <> 3025 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3025, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[625] to agcAotUnit625@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:831
//		OCT	1210
// PORT: Fixed ROM slots 10131.
    10131, 1296,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:832
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:833
//# Page 1442
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:834
//# CONSTANTS FOR MODE SWITCHING ROUTINES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:835
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:836
//BITS3&4		=	OCT14
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:837
//BITS4&6		=	OCT50
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:838
//BITS4-5		EQUALS	BITS4&5
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:839
//IMUSEFLG	EQUALS	BIT8		# INTERPRETER SWITCH 7.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:840
//-COMMAX		DEC	-191
// PORT: Fixed ROM slots 10132.
    10132, 65152,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:841
//-COMMAX-	DEC	-192
// PORT: Fixed ROM slots 10133.
    10133, 65150,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:842
//600MS		DEC	60
// PORT: Fixed ROM slots 10134.
    10134, 120
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10135–10138.
function agcAotUnit626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10136 {
        if slot <= 10135 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:843
//IMUFIN20	=	IMUFINE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:844
//GOMANUR		CA	ATTCADR		# IS KALCMANU FREE
// PORT: Fixed ROM slots 10135.
            if slot <> 10135 or instruction <> 13013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 725).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:845
//		EXTEND
// PORT: Fixed ROM slots 10136.
            if slot <> 10136 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10137 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:846
//		BZF	+3
// PORT: Fixed ROM slots 10137.
            if slot <> 10137 or instruction <> 6044 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:847
//		TC	POODOO		# NO
// PORT: Fixed ROM slots 10138.
            if slot <> 10138 or instruction <> 3025 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3025, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[626] to agcAotUnit626@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:848
//		OCT	1210		# 2 TRYING TO USE SAME DEVICE
// PORT: Fixed ROM slots 10139.
    10139, 1296
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10140–10151.
function agcAotUnit627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10145 {
        if slot <= 10142 {
            if slot <= 10140 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:849
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:850
//	+3	EXTEND
// PORT: Fixed ROM slots 10140.
                if slot <> 10140 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10141 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:851
//		DCA	BUF2
// PORT: Fixed ROM slots 10141.
                    if slot <> 10141 or instruction <> 12380 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:852
//		DXCH	ATTCADR		# SAVE FINAL RETURN FOR KALCMAN3
// PORT: Fixed ROM slots 10142.
                    if slot <> 10142 or instruction <> 22230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 726, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10143 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:853
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:854
//		CA	BBANK
// PORT: Fixed ROM slots 10143.
                if slot <> 10143 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10144 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:855
//		MASK	SEVEN
// PORT: Fixed ROM slots 10144.
                    if slot <> 10144 or instruction <> 31251 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:856
//		ADS	ATTCADR +1
// PORT: Fixed ROM slots 10145.
                    if slot <> 10145 or instruction <> 11990 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 726).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10148 {
            if slot <= 10146 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:857
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:858
//		CA	PRIORITY
// PORT: Fixed ROM slots 10146.
                if slot <> 10146 or instruction <> 12407 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 119).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10147 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:859
//		MASK	PRIO37
// PORT: Fixed ROM slots 10147.
                    if slot <> 10147 or instruction <> 32700 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4028), 32768).
                        if fixedOperand = 15872 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 32) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:860
//		TS	ATTPRIO		# SAVE USERS PRIO
// PORT: Fixed ROM slots 10148.
                    if slot <> 10148 or instruction <> 23255 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23255, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10149 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:861
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:862
//		CAF	KALEBCON	# SET EBANK FOR KALCMAN3
// PORT: Fixed ROM slots 10149.
                if slot <> 10149 or instruction <> 14249 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1961), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10150 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:863
//		TS	EBANK
// PORT: Fixed ROM slots 10150.
                    if slot <> 10150 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:864
//		TC	POSTJUMP
// PORT: Fixed ROM slots 10151.
                    if slot <> 10151 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[627] to agcAotUnit627@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:865
//		CADR	KALCMAN3
// PORT: Fixed ROM slots 10152.
    10152, 36864,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:866
//KALEBCON	ECADR	BCDU
// PORT: Fixed ROM slots 10153.
    10153, 3426,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:867
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:868
//# Page 1443
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:869
//# PROGRAM DESCRIPTION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:870
//# IMU STATUS CHECK ROUTINE R02 (SUBROUTINE UTILITY)
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:871
//# MOD NO - 1
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:872
//# MOD BY - N.BRODEUR
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:873
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:874
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:875
//# TO CHECK WHETHER IMU IS ON AND IF ON WHETHER IT IS ALIGNED TO AN
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:876
//# ORIENTATION KNOWN BY THE CMC.  TO REQUEST SELECTION OF THE APPROPRIATE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:877
//# PROGRAM IF THE IMU IS OFF OR NOT ALIGNED TO AN ORIENTATION KNOWN BY THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:878
//# CMC.  CALLED THROUGH BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:879
//# CALLING SEQUENCE-
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:880
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:881
//# L	TC	BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:882
//# L+1	CADR	R02BOTH
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:883
//# SUBROUTINES CALLED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:884
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:885
//#	VARALARM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:886
//#	FLAGUP
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:887
//# NORMAL EXIT MODES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:888
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:889
//# AT L+2 OF CALLING SEQUENCE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:890
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:891
//#	GOTOPOOH, WITH ALARM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:892
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:893
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:894
//# NONE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:895
//# DEBRIS
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:896
//#
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:897
//# CENTRALS-A,Q,L
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:898
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:899
//		BANK	34
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:900
//		SETLOC	R02
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:901
//		BANK
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:902
//		COUNT	04/R02		# COUNT*
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:903
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:904
//DEC51		DEC	51
// PORT: Fixed ROM slots 10154.
    10154, 102
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10155–10167.
function agcAotUnit628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10160 {
        if slot <= 10157 {
            if slot <= 10155 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:905
//R02BOTH		CAF	BIT13
// PORT: Fixed ROM slots 10155.
                if slot <> 10155 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10156 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:906
//		MASK	STATE +3	# REFSMFLG
// PORT: Fixed ROM slots 10156.
                    if slot <> 10156 or instruction <> 28735 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 10157.
                    if slot <> 10157 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 10158 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:908
//		TC	R02ZERO		# ZERO IMUS
// PORT: Fixed ROM slots 10158.
                if slot <> 10158 or instruction <> 1975 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1975, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10159 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:909
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:910
//		CA	IMODES30
// PORT: Fixed ROM slots 10159.
                    if slot <> 10159 or instruction <> 13008 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:911
//		MASK	BIT9		# IS ISS INITIALIZED
// PORT: Fixed ROM slots 10160.
                    if slot <> 10160 or instruction <> 31239 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 10163 {
            if slot <= 10161 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:912
//		EXTEND
// PORT: Fixed ROM slots 10161.
                if slot <> 10161 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10162 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:913
//		BZF	+2
// PORT: Fixed ROM slots 10162.
                    if slot <> 10162 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:914
//		CS	BIT4		# SEND IMU ALARM CODE 210
// PORT: Fixed ROM slots 10163.
                    if slot <> 10163 or instruction <> 18956 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10165 {
                if slot <= 10164 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:915
//		AD	OCT220		# SEND REFSMM ALARM
// PORT: Fixed ROM slots 10164.
                    if slot <> 10164 or instruction <> 26554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1978), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:916
//		TC	VARALARM
// PORT: Fixed ROM slots 10165.
                    if slot <> 10165 or instruction <> 3060 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3060, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10166 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:917
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:918
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 10166.
                    if slot <> 10166 or instruction <> 2118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:919
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:920
//# Page 1444
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:921
//R02ZERO		TC	UPFLAG
// PORT: Fixed ROM slots 10167.
                    if slot <> 10167 or instruction <> 2918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[628] to agcAotUnit628@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:922
//		ADRES	IMUSE
// PORT: Fixed ROM slots 10168.
    10168, 14
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10169–10169.
function agcAotUnit629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:923
//		TCF	SWRETURN
// PORT: Fixed ROM slots 10169.
    if slot <> 10169 or instruction <> 6589 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6589, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[629] to agcAotUnit629@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:924
//OCT220		OCT	220
// PORT: Fixed ROM slots 10170.
    10170, 288
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25520–25520.
function agcAotUnit1475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:925
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:926
//# Page 1445
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:927
//# PROGRAM DESCRIPTION	P06	10FEB67
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:928
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:929
//# TRANSFER THE ISS/CMC FROM THE OPERATE TO THE STANDBY CONDITION.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:930
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:931
//# THE NORMAL CONDITION OF READINESS OF THE GNCS WHEN NOT IN USE IS STANDBY.  IN THIS CONDITION THE IMU
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:932
//# HEATER POWER IS ON.  THE IMU OPERATE POWER IS OFF.  THE COMPUTER POWER IS ON.  THE OPTICS POWER IS OFF.  THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:933
//# CMC STANDBY ON THE MAIN AND LEB DISKYS IS ON.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:934
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:935
//# CALLING SEQUENCE:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:936
//#	ASTRONAUT REQUEST THROUGH DSKY	V37E 06E.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:937
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:938
//# SUBROUTINES CALLED:
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:939
//#	GOPERF1
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:940
//#	BANKCALL
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:941
//#	FLAGDOWN
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:942
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:943
//# Page 1446
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:944
//# PRESTAND PREPARES FOR STANDBY BY SNAPSHOTTING THE SCALER AND TIME1 TIME2
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:945
//# THE LOW 5 BITS OF THE SCALER ARE INSPECTED TO INSURE COMPATABILITY
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
// PORT: Fixed ROM slots 25520.
    if slot <> 25520 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1475] to agcAotUnit1475@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:955
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 25521.
    25521, 88
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25522–25531.
function agcAotUnit1476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25526 {
        if slot <= 25523 {
            if slot <= 25522 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:956
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:957
//PRESTAND	INHINT
// PORT: Fixed ROM slots 25522.
                if slot <> 25522 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:958
//		EXTEND
// PORT: Fixed ROM slots 25523.
                if slot <> 25523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25524 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:959
//		DCA	TIME2		# SNAPSHOT TIME1TIME2
// PORT: Fixed ROM slots 25524.
                if slot <> 25524 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25525 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:960
//		DXCH	TIME2SAV
// PORT: Fixed ROM slots 25525.
                    if slot <> 25525 or instruction <> 22121 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 617, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:961
//		TC	SCALPREP
// PORT: Fixed ROM slots 25526.
                    if slot <> 25526 or instruction <> 1999 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1999, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25528 {
            if slot <= 25527 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:962
//		TC	PRESTAND	# T1,T2,SCALER NOT COMPATIBLE
// PORT: Fixed ROM slots 25527.
                if slot <> 25527 or instruction <> 1970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:963
//		DXCH	MPAC		# T1,T2 AND SCALER OK
// PORT: Fixed ROM slots 25528.
                if slot <> 25528 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25529 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:964
//		DXCH	SCALSAVE	# STORE SCALER
// PORT: Fixed ROM slots 25529.
                if slot <> 25529 or instruction <> 22123 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 619, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25530 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:965
//		INHINT
// PORT: Fixed ROM slots 25530.
                    if slot <> 25530 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:966
//		TC	BANKCALL
// PORT: Fixed ROM slots 25531.
                    if slot <> 25531 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1476] to agcAotUnit1476@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:967
//		CADR	RNDREFDR	# REFSMM, DRIFT, TRACK FLAGS DOWN
// PORT: Fixed ROM slots 25532.
    25532, 15456
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25533–25533.
function agcAotUnit1477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:968
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:969
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 25533.
    if slot <> 25533 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1477] to agcAotUnit1477@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:970
//		ADRES	IMUSE		# IMUSE DOWN
// PORT: Fixed ROM slots 25534.
    25534, 14
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25535–25535.
function agcAotUnit1478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:971
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 25535.
    if slot <> 25535 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1478] to agcAotUnit1478@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:972
//		ADRES	RNDVZFLG	# RNDVZFLG DOWN
// PORT: Fixed ROM slots 25536.
    25536, 16
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25537–25540.
function agcAotUnit1479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25538 {
        if slot <= 25537 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:973
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:974
//		CAF	BIT11
// PORT: Fixed ROM slots 25537.
            if slot <> 25537 or instruction <> 14853 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:975
//		EXTEND
// PORT: Fixed ROM slots 25538.
            if slot <> 25538 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25539 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:976
//		WOR	CHAN13		# SET STANDBY ENABLE BIT
// PORT: Fixed ROM slots 25539.
            if slot <> 25539 or instruction <> 2571 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 25540.
            if slot <> 25540 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1479] to agcAotUnit1479@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:979
//		OCT	07024		#	RECOVERS
// PORT: Fixed ROM slots 25541.
    25541, 7208,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:980
//		OCT	20000
// PORT: Fixed ROM slots 25542.
    25542, 16384,
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:981
//		EBANK=	SCALSAVE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:982
//		2CADR	POSTAND
// PORT: Fixed ROM slots 25543 25544.
    25543, 4030, 25544, 45156
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25545–25546.
function agcAotUnit1480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25545 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:983
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:984
//		CAF	OCT62
// PORT: Fixed ROM slots 25545.
        if slot <> 25545 or instruction <> 14878 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2590), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:985
//		TC	BANKCALL
// PORT: Fixed ROM slots 25546.
        if slot <> 25546 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1480] to agcAotUnit1480@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:986
//		CADR	GOPERF1
// PORT: Fixed ROM slots 25547.
    25547, 17482
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25548–25596.
function agcAotUnit1481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25571 {
        if slot <= 25559 {
            if slot <= 25553 {
                if slot <= 25550 {
                    if slot <= 25548 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:987
//		TCF	-3
// PORT: Fixed ROM slots 25548.
                        if slot <> 25548 or instruction <> 6089 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6089, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25549 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:988
//		TCF	-4
// PORT: Fixed ROM slots 25549.
                            if slot <> 25549 or instruction <> 6089 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6089, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:989
//		TCF	-5
// PORT: Fixed ROM slots 25550.
                            if slot <> 25550 or instruction <> 6089 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6089, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25551 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:990
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:991
//OCT62		EQUALS	.5SEC		# DEC 50 = OCT 62
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:992
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:993
//# THE LOW 5 BITS OF THE SCALER READS 10000 FOR THE FIRST INTERVAL AFTER A
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:994
//# Page 1447.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:995
//# T1 INCREMENT.  IF SCALPREP DETECTS THIS INTERVAL THE T1,T2 AND SCALER
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:996
//# DATA ARE NOT COMPATABLE AND RETURN IS TO L+1 FOR ANOTHER READING OF THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:997
//# DATA.  OTHERWISE, THE RETURN IS TO L+2 TO PROCEED.  ROUTINE ALSO PREPARES
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:998
//# THE SCALER READING FOR COMPUTATION OF THE INCREMENT TO UPDATE T1T2.  (THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:999
//# 10 MS BIT (BIT 6) OF THE SCALER IS INCREMENTED 5 MS OUT OF PHASE FROM
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1000
//# T1.) ADDITION OF 5 MS (BIT 5) TO THE SCALER READING HAS THE EFFECT OF
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1001
//# ADJUSTING BIT 6 IN THE SCALER TO BE IN PHASE WITH BIT 1 OF T1.  THE LOW 5
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1002
//# BITS OF THE SCALER READING ARE THEN SET TO ZERO, TO TRUNCATE THE SCALER
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1003
//# DATA TO 10 MS.  RESULTS ARE STORED IN MPAC, +1.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1004
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1005
//SCALPREP	EXTEND
// PORT: Fixed ROM slots 25551.
                        if slot <> 25551 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25552 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1006
//		QXCH	MPAC +2
// PORT: Fixed ROM slots 25552.
                            if slot <> 25552 or instruction <> 9326 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 25553.
                            if slot <> 25553 or instruction <> 2412 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2412, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 25556 {
                    if slot <= 25554 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1008
//		RELINT
// PORT: Fixed ROM slots 25554.
                        if slot <> 25554 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25555 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1009
//		DXCH	MPAC
// PORT: Fixed ROM slots 25555.
                            if slot <> 25555 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1010
//		CA	BIT5		# ADD 5 MS TO THE SCALER READING.
// PORT: Fixed ROM slots 25556.
                            if slot <> 25556 or instruction <> 14859 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 25557 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1011
//		TS	L
// PORT: Fixed ROM slots 25557.
                        if slot <> 25557 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25558 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1012
//		CA	ZERO
// PORT: Fixed ROM slots 25558.
                            if slot <> 25558 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1013
//		DAS	MPAC
// PORT: Fixed ROM slots 25559.
                            if slot <> 25559 or instruction <> 8301 { return choose false if checkOnly else -1. }
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
            if slot <= 25565 {
                if slot <= 25562 {
                    if slot <= 25560 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1014
//		CS	LOW5		# SET LOW 5 BITS OF (SCALER+5MS) TO ZERO
// PORT: Fixed ROM slots 25560.
                        if slot <> 25560 or instruction <> 18674 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25561 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1015
//		MASK 	MPAC +1		# AND STORE RESULTS IN MPAC,+1.
// PORT: Fixed ROM slots 25561.
                            if slot <> 25561 or instruction <> 28781 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 25562.
                            if slot <> 25562 or instruction <> 23661 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 109, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25563 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1017
//		MASK	LOW5		# TEST LOW 5 BITS OF SCALER FOR THE FIRST
// PORT: Fixed ROM slots 25563.
                        if slot <> 25563 or instruction <> 30962 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25564 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1018
//					# INTERVAL AFTER THE T1 INCREMENT
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1019
//					# (NOW = 00000, SINCE BIT 5 ADDED).
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1020
//		CCS	A		# IS IT 1ST INTERVAL AFTER T1 INCREMENT
// PORT: Fixed ROM slots 25564.
                            if slot <> 25564 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 25565.
                            if slot <> 25565 or instruction <> 10350 { return choose false if checkOnly else -1. }
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
                if slot <= 25568 {
                    if slot <= 25566 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1022
//		TC	MPAC +2		# YES
// PORT: Fixed ROM slots 25566.
                        if slot <> 25566 or instruction <> 110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 110, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25567 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1023
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1024
//# POSTAND RECOVERS TIME AFTER STANDBY.THE SCALER IS SNAPSHOTTED AND THE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1025
//# TIME1 TIME2 COUNTER IS SET TO ZERO.  THE LOW 5 BITS OF THE SCALER ARE
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1026
//# INSPECTED TO INSURE COMPATABILITY BETWEEN THE SCALER READING AND THE
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
// PORT: Fixed ROM slots 25567.
                            if slot <> 25567 or instruction <> 18949 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1034
//		EXTEND
// PORT: Fixed ROM slots 25568.
                            if slot <> 25568 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25569 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1035
//		WAND	CHAN13		# CLEAR STANDBY ENABLE BIT
// PORT: Fixed ROM slots 25569.
                        if slot <> 25569 or instruction <> 1547 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25570 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1036
//		INHINT
// PORT: Fixed ROM slots 25570.
                            if slot <> 25570 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1037
//		CA	ZERO
// PORT: Fixed ROM slots 25571.
                            if slot <> 25571 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                }
            }
        }
    } else {
        if slot <= 25583 {
            if slot <= 25577 {
                if slot <= 25574 {
                    if slot <= 25572 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1038
//		TS	L
// PORT: Fixed ROM slots 25572.
                        if slot <> 25572 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25573 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1039
//		DXCH	TIME2		# CLEAR TIME1 TIME2
// PORT: Fixed ROM slots 25573.
                            if slot <> 25573 or instruction <> 21525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1040
//		TC	SCALPREP	# STORE SCALER IN MPAC, MPAC+1
// PORT: Fixed ROM slots 25574.
                            if slot <> 25574 or instruction <> 1999 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1999, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25575 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1041
//		TC	POSTAND +3	# T1,T2,SCALER NOT COMPATIBLE
// PORT: Fixed ROM slots 25575.
                        if slot <> 25575 or instruction <> 2018 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2018, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25576 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1042
//		EXTEND			# T1,T2 AND SCALER OK
// PORT: Fixed ROM slots 25576.
                            if slot <> 25576 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1043
//		DCS	SCALSAVE
// PORT: Fixed ROM slots 25577.
                            if slot <> 25577 or instruction <> 17003 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 619, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 25580 {
                    if slot <= 25578 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1044
//		DAS	MPAC		# FORM DP DIFFERENCE OF POSTSTANDBY SCALER
// PORT: Fixed ROM slots 25578.
                        if slot <> 25578 or instruction <> 8301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 109) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25579 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1045
//# Page 1448
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1046
//		CAF	BIT10		# MINUS PRESTANDBY SCALER AND SHIFT RIGHT
// PORT: Fixed ROM slots 25579.
                            if slot <> 25579 or instruction <> 14854 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1047
//		TC	SHORTMP		# 5 TO ALIGN BITS WITH TIME1TIME2.
// PORT: Fixed ROM slots 25580.
                            if slot <> 25580 or instruction <> 3758 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3758, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25581 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1048
//		CAF	ZERO
// PORT: Fixed ROM slots 25581.
                        if slot <> 25581 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25582 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1049
//		TS	MPAC +2		# NEEDED FOR TP AGREE
// PORT: Fixed ROM slots 25582.
                            if slot <> 25582 or instruction <> 22638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1050
//		TC	TPAGREE		# MAKE DP DIFF AGREE
// PORT: Fixed ROM slots 25583.
                            if slot <> 25583 or instruction <> 3734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3734, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 25589 {
                if slot <= 25586 {
                    if slot <= 25584 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1051
//		CCS	MPAC
// PORT: Fixed ROM slots 25584.
                        if slot <> 25584 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25585 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1052
//		TC	POSTCOM		# IF DP DIFF NET +, NO SCALER OVERFLOW
// PORT: Fixed ROM slots 25585.
                            if slot <> 25585 or instruction <> 2038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1053
//		TC	POSTCOM		# BETWEEN PRE AND POST STANDBY.
// PORT: Fixed ROM slots 25586.
                            if slot <> 25586 or instruction <> 2038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 25587 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1054
//		TC	+1		# IF DP DIFF NET -, SCALER OVERFLOWED.  ADD
// PORT: Fixed ROM slots 25587.
                        if slot <> 25587 or instruction <> 2036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25588 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1055
//		CAF	BIT10		# BIT 10 TO HIGH DIFF TO CORRECT.
// PORT: Fixed ROM slots 25588.
                            if slot <> 25588 or instruction <> 14854 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1056
//		ADS	MPAC
// PORT: Fixed ROM slots 25589.
                            if slot <> 25589 or instruction <> 11372 { return choose false if checkOnly else -1. }
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
                if slot <= 25592 {
                    if slot <= 25590 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1057
//POSTCOM		EXTEND			# C(MPAC,+1) IS MAGNITUDE OF DELTA SCALER.
// PORT: Fixed ROM slots 25590.
                        if slot <> 25590 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25591 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1058
//		DCA	TIME2SAV	# PRE-STANDBY TIME1TIME2
// PORT: Fixed ROM slots 25591.
                            if slot <> 25591 or instruction <> 12905 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 617, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1059
//		DAS	MPAC
// PORT: Fixed ROM slots 25592.
                            if slot <> 25592 or instruction <> 8301 { return choose false if checkOnly else -1. }
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
                    if slot <= 25594 {
                        if slot <= 25593 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1060
//		TC	TPAGREE		# FORCE SIGN AGREEMENT
// PORT: Fixed ROM slots 25593.
                            if slot <> 25593 or instruction <> 3734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3734, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1061
//		DXCH	MPAC		# UPDATED VALUE FOR T1,T2.
// PORT: Fixed ROM slots 25594.
                            if slot <> 25594 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 25595 {
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1062
//		DAS	TIME2		# LOAD UPDATED VALUE INTO T1,T2, WITH
// PORT: Fixed ROM slots 25595.
                            if slot <> 25595 or instruction <> 8213 { return choose false if checkOnly else -1. }
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
// PORT: Fixed ROM slots 25596.
                            if slot <> 25596 or instruction <> 2928 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1481] to agcAotUnit1481@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1064
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 25597.
    25597, 88
)).

// PORT: Physical bank 26. Shared continuation entries, slots 25598–25598.
function agcAotUnit1482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1065
//
// PORT: SOURCE IMU_MODE_SWITCHING_ROUTINES.agc:1066
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 25598.
    if slot <> 25598 or instruction <> 2118 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2118, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1482] to agcAotUnit1482@.

