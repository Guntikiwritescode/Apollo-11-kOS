// IMU_MODE_SWITCHING_ROUTINES.agc
// bank 02, slots 4945-4949
function agcAotUnit216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4946 {
        if slot <= 4945 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1
//# Copyright:	Public domain.
// IMU_MODE_SWITCHING_ROUTINES.agc:2
//# Filename:	IMU_MODE_SWITCHING_ROUTINES.agc
// IMU_MODE_SWITCHING_ROUTINES.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// IMU_MODE_SWITCHING_ROUTINES.agc:4
//#		It is part of the source code for the Command Module's (CM)
// IMU_MODE_SWITCHING_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// IMU_MODE_SWITCHING_ROUTINES.agc:6
//# Assembler:	yaYUL
// IMU_MODE_SWITCHING_ROUTINES.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// IMU_MODE_SWITCHING_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// IMU_MODE_SWITCHING_ROUTINES.agc:9
//# Pages:	1420-1448
// IMU_MODE_SWITCHING_ROUTINES.agc:10
//# Mod history:	2009-05-10 SN	(Navarro Kerman).  Started adapting from
// IMU_MODE_SWITCHING_ROUTINES.agc:11
//#				the Colossus249/ file of the same name,
// IMU_MODE_SWITCHING_ROUTINES.agc:12
//#				using Comanche055 page images.
// IMU_MODE_SWITCHING_ROUTINES.agc:13
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// IMU_MODE_SWITCHING_ROUTINES.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// IMU_MODE_SWITCHING_ROUTINES.agc:16
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// IMU_MODE_SWITCHING_ROUTINES.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// IMU_MODE_SWITCHING_ROUTINES.agc:18
//# consequent reduction in image quality as well) are available online at
// IMU_MODE_SWITCHING_ROUTINES.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// IMU_MODE_SWITCHING_ROUTINES.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// IMU_MODE_SWITCHING_ROUTINES.agc:21
//# (much) higher-quality images which Fjeld Kerman actually created.
// IMU_MODE_SWITCHING_ROUTINES.agc:22
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:23
//# Notations on the hardcopy document read, in part:
// IMU_MODE_SWITCHING_ROUTINES.agc:24
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// IMU_MODE_SWITCHING_ROUTINES.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// IMU_MODE_SWITCHING_ROUTINES.agc:27
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:28
//#    This AGC program shall also be referred to as
// IMU_MODE_SWITCHING_ROUTINES.agc:29
//#            Colossus 2A
// IMU_MODE_SWITCHING_ROUTINES.agc:30
//
// IMU_MODE_SWITCHING_ROUTINES.agc:31
//# Page 1420
// IMU_MODE_SWITCHING_ROUTINES.agc:32
//		BLOCK	02
// IMU_MODE_SWITCHING_ROUTINES.agc:33
//		SETLOC	FFTAG3
// IMU_MODE_SWITCHING_ROUTINES.agc:34
//		BANK
// IMU_MODE_SWITCHING_ROUTINES.agc:35
//
// IMU_MODE_SWITCHING_ROUTINES.agc:36
//		EBANK=	COMMAND
// IMU_MODE_SWITCHING_ROUTINES.agc:37
//
// IMU_MODE_SWITCHING_ROUTINES.agc:38
//# FIXED-FIXED ROUTINES.
// IMU_MODE_SWITCHING_ROUTINES.agc:39
//
// IMU_MODE_SWITCHING_ROUTINES.agc:40
//		COUNT	02/IMODE
// IMU_MODE_SWITCHING_ROUTINES.agc:41
//
// IMU_MODE_SWITCHING_ROUTINES.agc:42
//ZEROICDU	CAF	ZERO		# ZERO ICDU COUNTERS.
// slot 4945
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
// IMU_MODE_SWITCHING_ROUTINES.agc:43
//		TS	CDUX
// slot 4946
            if slot <> 4946 or instruction <> 22554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4947 {
// IMU_MODE_SWITCHING_ROUTINES.agc:44
//		TS	CDUY
// slot 4947
            if slot <> 4947 or instruction <> 22555 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22555, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4948 {
// IMU_MODE_SWITCHING_ROUTINES.agc:45
//		TS	CDUZ
// slot 4948
                if slot <> 4948 or instruction <> 22556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22556, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:46
//		TC	Q
// slot 4949
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

// bank 07, slots 9599-9604
function agcAotUnit574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9601 {
        if slot <= 9599 {
// IMU_MODE_SWITCHING_ROUTINES.agc:47
//
// IMU_MODE_SWITCHING_ROUTINES.agc:48
//SPSCODE		=	BIT9
// IMU_MODE_SWITCHING_ROUTINES.agc:49
//
// IMU_MODE_SWITCHING_ROUTINES.agc:50
//# Page 1421
// IMU_MODE_SWITCHING_ROUTINES.agc:51
//# IMU ZEROING ROUTINE.
// IMU_MODE_SWITCHING_ROUTINES.agc:52
//
// IMU_MODE_SWITCHING_ROUTINES.agc:53
//		BANK	11
// IMU_MODE_SWITCHING_ROUTINES.agc:54
//		SETLOC	MODESW
// IMU_MODE_SWITCHING_ROUTINES.agc:55
//		BANK
// IMU_MODE_SWITCHING_ROUTINES.agc:56
//
// IMU_MODE_SWITCHING_ROUTINES.agc:57
//		COUNT	07/IMODE
// IMU_MODE_SWITCHING_ROUTINES.agc:58
//
// IMU_MODE_SWITCHING_ROUTINES.agc:59
//IMUZERO		INHINT			# ROUTINE TO ZERO ICDUS.
// slot 9599
            if slot <> 9599 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9600 {
// IMU_MODE_SWITCHING_ROUTINES.agc:60
//		CS	DSPTAB +11D	# DONT ZERO CDUS IS IMU IN GIMBAL LOCK AND
// slot 9600
                if slot <> 9600 or instruction <> 16926 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 542).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:61
//		MASK	BITS4&6		# COARSE ALIGN (GIMBAL RUNAWAY PROTECTION)
// slot 9601
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
// IMU_MODE_SWITCHING_ROUTINES.agc:62
//		CCS	A
// slot 9602
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
// IMU_MODE_SWITCHING_ROUTINES.agc:63
//		TCF	IMUZEROA
// slot 9603
                if slot <> 9603 or instruction <> 5511 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:64
//
// IMU_MODE_SWITCHING_ROUTINES.agc:65
//		TC	ALARM		# IF SO.
// slot 9604
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
// IMU_MODE_SWITCHING_ROUTINES.agc:66
//		OCT	00206
// slot 9605
    9605, 268
)).

// bank 07, slots 9606-9623
function agcAotUnit575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9614 {
        if slot <= 9609 {
            if slot <= 9607 {
                if slot <= 9606 {
// IMU_MODE_SWITCHING_ROUTINES.agc:67
//
// IMU_MODE_SWITCHING_ROUTINES.agc:68
//		TCF	CAGETSTJ +4	# IMMEDIATE FAILURE.
// slot 9606
                    if slot <> 9606 or instruction <> 5986 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5986, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:69
//
// IMU_MODE_SWITCHING_ROUTINES.agc:70
//IMUZEROA	TC	CAGETSTJ
// slot 9607
                    if slot <> 9607 or instruction <> 1886 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1886, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9608 {
// IMU_MODE_SWITCHING_ROUTINES.agc:71
//# DO ALL THE WORK.
// IMU_MODE_SWITCHING_ROUTINES.agc:72
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// slot 9608
                    if slot <> 9608 or instruction <> 17105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 721).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:73
//		MASK	SUPER011	# 	BIT5 FOR GROUND
// slot 9609
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
// IMU_MODE_SWITCHING_ROUTINES.agc:74
//		ADS	IMODES33
// slot 9610
                    if slot <> 9610 or instruction <> 11985 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:75
//
// IMU_MODE_SWITCHING_ROUTINES.agc:76
//		CS	IMODES30	# INHIBIT ICDUFAIL AND IMUFAIL (IN CASE WE
// slot 9611
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
// IMU_MODE_SWITCHING_ROUTINES.agc:77
//		MASK	BITS3&4		# JUST CAME OUT OF COARSE ALIGN).
// slot 9612
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
// IMU_MODE_SWITCHING_ROUTINES.agc:78
//		ADS	IMODES30
// slot 9613
                        if slot <> 9613 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:79
//
// IMU_MODE_SWITCHING_ROUTINES.agc:80
//		CS	BITS4&6		# SEND ZERO ENCODE WITH COARSE AND ERROR
// slot 9614
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
// IMU_MODE_SWITCHING_ROUTINES.agc:81
//		EXTEND			# COUNTER DISABLED.
// slot 9615
                    if slot <> 9615 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:82
//		WAND 	CHAN12
// slot 9616
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
// IMU_MODE_SWITCHING_ROUTINES.agc:83
//
// IMU_MODE_SWITCHING_ROUTINES.agc:84
//		TC	NOATTOFF	# TURN OFF NO ATT LAMP.
// slot 9617
                    if slot <> 9617 or instruction <> 1641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:85
//
// IMU_MODE_SWITCHING_ROUTINES.agc:86
//		CAF	BIT5
// slot 9618
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
// IMU_MODE_SWITCHING_ROUTINES.agc:87
//		EXTEND
// slot 9619
                    if slot <> 9619 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:88
//		WOR	CHAN12
// slot 9620
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
// IMU_MODE_SWITCHING_ROUTINES.agc:89
//
// IMU_MODE_SWITCHING_ROUTINES.agc:90
//		TC	ZEROICDU
// slot 9621
                    if slot <> 9621 or instruction <> 2897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2897, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9622 {
// IMU_MODE_SWITCHING_ROUTINES.agc:91
//		CAF	BIT6		# WAIT 320 MS TO GIVE AGS ADEQUATE TIME TO
// slot 9622
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
// IMU_MODE_SWITCHING_ROUTINES.agc:92
//		TC	WAITLIST	# RECEIVE ITS PULSE TRAIN.
// slot 9623
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
// IMU_MODE_SWITCHING_ROUTINES.agc:93
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:94
//		2CADR	IMUZERO2
// slot 9624 9625
    9624, 2884, 9625, 14438
)).

// bank 07, slots 9626-9630
function agcAotUnit576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9627 {
        if slot <= 9626 {
// IMU_MODE_SWITCHING_ROUTINES.agc:95
//
// IMU_MODE_SWITCHING_ROUTINES.agc:96
//		CS	IMODES30	# SEE IF IMU OPERATING AND ALARM IF NOT.
// slot 9626
            if slot <> 9626 or instruction <> 17104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 720).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:97
//		MASK	BIT9
// slot 9627
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
// IMU_MODE_SWITCHING_ROUTINES.agc:98
//		CCS	A
// slot 9628
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
// IMU_MODE_SWITCHING_ROUTINES.agc:99
//		TCF	MODEEXIT
// slot 9629
                if slot <> 9629 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:100
//# Page 1422
// IMU_MODE_SWITCHING_ROUTINES.agc:101
//		TC	ALARM
// slot 9630
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
// IMU_MODE_SWITCHING_ROUTINES.agc:102
//		OCT	210
// slot 9631
    9631, 272
)).

// bank 07, slots 9632-9648
function agcAotUnit577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9639 {
        if slot <= 9635 {
            if slot <= 9633 {
                if slot <= 9632 {
// IMU_MODE_SWITCHING_ROUTINES.agc:103
//
// IMU_MODE_SWITCHING_ROUTINES.agc:104
//MODEEXIT	RELINT			# GENERAL MODE-SWITCHING EXIT.
// slot 9632
                    if slot <> 9632 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:105
//		TCF	SWRETURN
// slot 9633
                    if slot <> 9633 or instruction <> 6589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6589, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9634 {
// IMU_MODE_SWITCHING_ROUTINES.agc:106
//
// IMU_MODE_SWITCHING_ROUTINES.agc:107
//IMUZERO2	TC	CAGETEST
// slot 9634
                    if slot <> 9634 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:108
//		TC	ZEROICDU	# ZERO CDUX, CDUY, CDUZ
// slot 9635
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
// IMU_MODE_SWITCHING_ROUTINES.agc:109
//
// IMU_MODE_SWITCHING_ROUTINES.agc:110
//		CS	BIT5		# REMOVE ZERO DISCRETE.
// slot 9636
                    if slot <> 9636 or instruction <> 18955 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:111
//		EXTEND
// slot 9637
                    if slot <> 9637 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9638 {
// IMU_MODE_SWITCHING_ROUTINES.agc:112
//		WAND	CHAN12
// slot 9638
                    if slot <> 9638 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:113
//
// IMU_MODE_SWITCHING_ROUTINES.agc:114
//		CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
// slot 9639
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
// IMU_MODE_SWITCHING_ROUTINES.agc:115
//		TC	VARDELAY
// slot 9640
                    if slot <> 9640 or instruction <> 2746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:116
//
// IMU_MODE_SWITCHING_ROUTINES.agc:117
//IMUZERO3	TC	CAGETEST
// slot 9641
                    if slot <> 9641 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9642 {
// IMU_MODE_SWITCHING_ROUTINES.agc:118
//		CS	BITS3&4		# REMOVE IMUFAIL AND ICDUFAIL INHIBIT.
// slot 9642
                    if slot <> 9642 or instruction <> 19449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:119
//		MASK	IMODES30
// slot 9643
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
// IMU_MODE_SWITCHING_ROUTINES.agc:120
//		TS	IMODES30
// slot 9644
                    if slot <> 9644 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:121
//
// IMU_MODE_SWITCHING_ROUTINES.agc:122
//		CS	SUPER011	# ENABLE DAP AUTO AND HOLD MODES
// slot 9645
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
// IMU_MODE_SWITCHING_ROUTINES.agc:123
//		MASK	IMODES33	#	BIT5 FOR GROUND
// slot 9646
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
// IMU_MODE_SWITCHING_ROUTINES.agc:124
//		TS	IMODES33
// slot 9647
                        if slot <> 9647 or instruction <> 23249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23249, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:125
//
// IMU_MODE_SWITCHING_ROUTINES.agc:126
//		TC	IBNKCALL	# SET ISS WARNING IF EITHER OF ABOVE ARE
// slot 9648
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
// IMU_MODE_SWITCHING_ROUTINES.agc:127
//		CADR	SETISSW		# PRESENT.
// slot 9649
    9649, 13162
)).

// bank 07, slots 9650-9655
function agcAotUnit578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9652 {
        if slot <= 9650 {
// IMU_MODE_SWITCHING_ROUTINES.agc:128
//
// IMU_MODE_SWITCHING_ROUTINES.agc:129
//		TCF	ENDIMU
// slot 9650
            if slot <> 9650 or instruction <> 5964 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5964, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9651 {
// IMU_MODE_SWITCHING_ROUTINES.agc:130
//
// IMU_MODE_SWITCHING_ROUTINES.agc:131
//# Page 1423
// IMU_MODE_SWITCHING_ROUTINES.agc:132
//# IMU COARSE ALIGN MODE.
// IMU_MODE_SWITCHING_ROUTINES.agc:133
//
// IMU_MODE_SWITCHING_ROUTINES.agc:134
//IMUCOARS	INHINT
// slot 9651
                if slot <> 9651 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:135
//		TC	CAGETSTJ
// slot 9652
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
// IMU_MODE_SWITCHING_ROUTINES.agc:136
//		TC	SETCOARS
// slot 9653
            if slot <> 9653 or instruction <> 1559 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1559, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9654 {
// IMU_MODE_SWITCHING_ROUTINES.agc:137
//
// IMU_MODE_SWITCHING_ROUTINES.agc:138
//		CAF	SIX
// slot 9654
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
// IMU_MODE_SWITCHING_ROUTINES.agc:139
//		TC	WAITLIST
// slot 9655
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
// IMU_MODE_SWITCHING_ROUTINES.agc:140
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:141
//		2CADR	COARS
// slot 9656 9657
    9656, 2934, 9657, 14438
)).

// bank 07, slots 9658-9665
function agcAotUnit579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9661 {
        if slot <= 9659 {
            if slot <= 9658 {
// IMU_MODE_SWITCHING_ROUTINES.agc:142
//
// IMU_MODE_SWITCHING_ROUTINES.agc:143
//		TCF	MODEEXIT
// slot 9658
                if slot <> 9658 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:144
//
// IMU_MODE_SWITCHING_ROUTINES.agc:145
//COARS		TC	CAGETEST
// slot 9659
                if slot <> 9659 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9660 {
// IMU_MODE_SWITCHING_ROUTINES.agc:146
//		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// slot 9660
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
// IMU_MODE_SWITCHING_ROUTINES.agc:147
//		EXTEND
// slot 9661
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
// IMU_MODE_SWITCHING_ROUTINES.agc:148
//		WOR	CHAN12
// slot 9662
                if slot <> 9662 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:149
//
// IMU_MODE_SWITCHING_ROUTINES.agc:150
//		CAF	TWO		# SET CDU INDICATOR
// slot 9663
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
// IMU_MODE_SWITCHING_ROUTINES.agc:151
//COARS1		TS	CDUIND
// slot 9664
                if slot <> 9664 or instruction <> 23356 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23356, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:152
//
// IMU_MODE_SWITCHING_ROUTINES.agc:153
//		INDEX	CDUIND		# COMPUTE THETAD - THETAA IN 1:S
// slot 9665
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
// IMU_MODE_SWITCHING_ROUTINES.agc:154
//		CA	THETAD		# 	COMPLEMENT FORM
// slot 9666
    9666, 25818
)).

// bank 07, slots 9667-9668
function agcAotUnit580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9667 {
// IMU_MODE_SWITCHING_ROUTINES.agc:155
//		EXTEND
// slot 9667
        if slot <> 9667 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:156
//		INDEX	CDUIND
// slot 9668
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
// IMU_MODE_SWITCHING_ROUTINES.agc:157
//		MSU	CDUX
// slot 9669
    9669, 16436
)).

// bank 07, slots 9670-9677
function agcAotUnit581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9673 {
        if slot <= 9671 {
            if slot <= 9670 {
// IMU_MODE_SWITCHING_ROUTINES.agc:158
//		EXTEND
// slot 9670
                if slot <> 9670 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:159
//		MP	BIT13		# SHIFT RIGHT 2
// slot 9671
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
// IMU_MODE_SWITCHING_ROUTINES.agc:160
//		XCH	L		# ROUND
// slot 9672
                if slot <> 9672 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:161
//		DOUBLE
// slot 9673
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
// IMU_MODE_SWITCHING_ROUTINES.agc:162
//		TS	ITEMP1
// slot 9674
                if slot <> 9674 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:163
//		TCF	+2
// slot 9675
                if slot <> 9675 or instruction <> 5581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5581, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9676 {
// IMU_MODE_SWITCHING_ROUTINES.agc:164
//		ADS	L
// slot 9676
                if slot <> 9676 or instruction <> 11265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:165
//
// IMU_MODE_SWITCHING_ROUTINES.agc:166
//		INDEX	CDUIND		# DIFFERENCE TO BE COMPUTED
// slot 9677
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
// IMU_MODE_SWITCHING_ROUTINES.agc:167
//		LXCH	COMMAND
// slot 9678
    9678, 20082
)).

// bank 07, slots 9679-9687
function agcAotUnit582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9682 {
        if slot <= 9680 {
            if slot <= 9679 {
// IMU_MODE_SWITCHING_ROUTINES.agc:168
//		CCS	CDUIND
// slot 9679
                if slot <> 9679 or instruction <> 4924 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:169
//		TC	COARS1
// slot 9680
                if slot <> 9680 or instruction <> 1472 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1472, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9681 {
// IMU_MODE_SWITCHING_ROUTINES.agc:170
//
// IMU_MODE_SWITCHING_ROUTINES.agc:171
//		CAF	TWO		# MINIMUM OF 4 MS WAIT
// slot 9681
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
// IMU_MODE_SWITCHING_ROUTINES.agc:172
//		TC 	VARDELAY
// slot 9682
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
// IMU_MODE_SWITCHING_ROUTINES.agc:173
//
// IMU_MODE_SWITCHING_ROUTINES.agc:174
//# Page 1424
// IMU_MODE_SWITCHING_ROUTINES.agc:175
//COARS2		TC	CAGETEST	# DONT CONTINUE IF CAGED.
// slot 9683
                if slot <> 9683 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:176
//		TS	ITEMP1		# SET TO +0.
// slot 9684
                if slot <> 9684 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9685 {
// IMU_MODE_SWITCHING_ROUTINES.agc:177
//		CAF	TWO		# SET CDU INDICATOR
// slot 9685
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
// IMU_MODE_SWITCHING_ROUTINES.agc:178
//	+3	TS	CDUIND
// slot 9686
                    if slot <> 9686 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:179
//
// IMU_MODE_SWITCHING_ROUTINES.agc:180
//		INDEX	CDUIND
// slot 9687
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
// IMU_MODE_SWITCHING_ROUTINES.agc:181
//		CCS	COMMAND		# NUMBER OF PULSES REQUIRED
// slot 9688
    9688, 9842
)).

// bank 07, slots 9689-9696
function agcAotUnit583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9692 {
        if slot <= 9690 {
            if slot <= 9689 {
// IMU_MODE_SWITCHING_ROUTINES.agc:182
//		TC	COMPOS		# GREATER THAN MAX ALLOWED
// slot 9689
                if slot <> 9689 or instruction <> 1501 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1501, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:183
//		TC	NEXTCDU +1
// slot 9690
                if slot <> 9690 or instruction <> 1508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1508, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9691 {
// IMU_MODE_SWITCHING_ROUTINES.agc:184
//		TC	COMNEG
// slot 9691
                if slot <> 9691 or instruction <> 1538 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1538, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:185
//		TC	NEXTCDU +1
// slot 9692
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
// IMU_MODE_SWITCHING_ROUTINES.agc:186
//
// IMU_MODE_SWITCHING_ROUTINES.agc:187
//COMPOS		AD	-COMMAX		# COMMAX = MAX NUMBER OF PULSES ALLOWED
// slot 9693
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
// IMU_MODE_SWITCHING_ROUTINES.agc:188
//		EXTEND			# 	MINUS ONE
// slot 9694
                if slot <> 9694 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9695 {
// IMU_MODE_SWITCHING_ROUTINES.agc:189
//		BZMF	COMZERO
// slot 9695
                if slot <> 9695 or instruction <> 26122 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:190
//		INDEX	CDUIND
// slot 9696
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
// IMU_MODE_SWITCHING_ROUTINES.agc:191
//		TS	COMMAND		# REDUCE COMMAND BY MAX NUMBER OF PULSES
// slot 9697
    9697, 46706
)).

// bank 07, slots 9698-9701
function agcAotUnit584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9699 {
        if slot <= 9698 {
// IMU_MODE_SWITCHING_ROUTINES.agc:192
//		CS	-COMMAX-	# 	ALLOWED
// slot 9698
            if slot <> 9698 or instruction <> 18325 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1941), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:193
//
// IMU_MODE_SWITCHING_ROUTINES.agc:194
//NEXTCDU		INCR	ITEMP1
// slot 9699
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
// IMU_MODE_SWITCHING_ROUTINES.agc:195
//		AD	NEG0
// slot 9700
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
// IMU_MODE_SWITCHING_ROUTINES.agc:196
//		INDEX	CDUIND
// slot 9701
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
// IMU_MODE_SWITCHING_ROUTINES.agc:197
//		TS	CDUXCMD		# SET UP COMMAND REGISTER.
// slot 9702
    9702, 45136
)).

// bank 07, slots 9703-9707
function agcAotUnit585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9704 {
        if slot <= 9703 {
// IMU_MODE_SWITCHING_ROUTINES.agc:198
//
// IMU_MODE_SWITCHING_ROUTINES.agc:199
//		CCS	CDUIND
// slot 9703
            if slot <> 9703 or instruction <> 4924 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 828).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:200
//		TC	COARS2 +3
// slot 9704
            if slot <> 9704 or instruction <> 1494 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1494, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9705 {
// IMU_MODE_SWITCHING_ROUTINES.agc:201
//
// IMU_MODE_SWITCHING_ROUTINES.agc:202
//		CCS	ITEMP1		# SEE IF ANY PULSES TO GO OUT.
// slot 9705
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
// IMU_MODE_SWITCHING_ROUTINES.agc:203
//		TCF	SENDPULS
// slot 9706
                if slot <> 9706 or instruction <> 5646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:204
//
// IMU_MODE_SWITCHING_ROUTINES.agc:205
//		TC	FIXDELAY	# WAIT FOR GIMBALS TO SETTLE.
// slot 9707
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
// IMU_MODE_SWITCHING_ROUTINES.agc:206
//		DEC	150
// slot 9708
    9708, 300
)).

// bank 07, slots 9709-9711
function agcAotUnit586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9709 {
// IMU_MODE_SWITCHING_ROUTINES.agc:207
//
// IMU_MODE_SWITCHING_ROUTINES.agc:208
//
// IMU_MODE_SWITCHING_ROUTINES.agc:209
//		CAF	TWO		# AT END OF COMMAND, CHECK TO SEE THAT
// slot 9709
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
// IMU_MODE_SWITCHING_ROUTINES.agc:210
//CHKCORS		TS	ITEMP1		# GIMBALS ARE WITHIN 2 DEGREES OF THETAD.
// slot 9710
            if slot <> 9710 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:211
//		INDEX	A
// slot 9711
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
// IMU_MODE_SWITCHING_ROUTINES.agc:212
//		CA	CDUX
// slot 9712
    9712, 24628
)).

// bank 07, slots 9713-9714
function agcAotUnit587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9713 {
// IMU_MODE_SWITCHING_ROUTINES.agc:213
//		EXTEND
// slot 9713
        if slot <> 9713 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:214
//		INDEX	ITEMP1
// slot 9714
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
// IMU_MODE_SWITCHING_ROUTINES.agc:215
//		MSU	THETAD
// slot 9715
    9715, 17626
)).

// bank 07, slots 9716-9726
function agcAotUnit588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9720 {
        if slot <= 9717 {
            if slot <= 9716 {
// IMU_MODE_SWITCHING_ROUTINES.agc:216
//		CCS	A
// slot 9716
                if slot <> 9716 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:217
//		TCF	COARSERR
// slot 9717
                if slot <> 9717 or instruction <> 5627 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5627, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9718 {
// IMU_MODE_SWITCHING_ROUTINES.agc:218
//		TCF	CORSCHK2
// slot 9718
                if slot <> 9718 or instruction <> 5624 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5624, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9719 {
// IMU_MODE_SWITCHING_ROUTINES.agc:219
//		TCF	COARSERR
// slot 9719
                    if slot <> 9719 or instruction <> 5627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:220
//
// IMU_MODE_SWITCHING_ROUTINES.agc:221
//# Page 1425
// IMU_MODE_SWITCHING_ROUTINES.agc:222
//CORSCHK2	CCS	ITEMP1
// slot 9720
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
// IMU_MODE_SWITCHING_ROUTINES.agc:223
//		TCF	CHKCORS
// slot 9721
                if slot <> 9721 or instruction <> 5614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5614, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9722 {
// IMU_MODE_SWITCHING_ROUTINES.agc:224
//		TCF	ENDIMU		# END OF COARSE ALIGNMENT.
// slot 9722
                    if slot <> 9722 or instruction <> 5964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5964, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:225
//
// IMU_MODE_SWITCHING_ROUTINES.agc:226
//COARSERR	AD	COARSTOL	# 2 DEGREES.
// slot 9723
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
// IMU_MODE_SWITCHING_ROUTINES.agc:227
//		EXTEND
// slot 9724
                if slot <> 9724 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9725 {
// IMU_MODE_SWITCHING_ROUTINES.agc:228
//		BZMF	CORSCHK2
// slot 9725
                    if slot <> 9725 or instruction <> 26104 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:229
//
// IMU_MODE_SWITCHING_ROUTINES.agc:230
//		TC	ALARM		# COARSE ALIGN ERROR.
// slot 9726
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
// IMU_MODE_SWITCHING_ROUTINES.agc:231
//		OCT	211
// slot 9727
    9727, 274
)).

// bank 07, slots 9728-9728
function agcAotUnit589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:232
//
// IMU_MODE_SWITCHING_ROUTINES.agc:233
//		TCF	IMUBAD
// slot 9728
    if slot <> 9728 or instruction <> 5970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[589] to agcAotUnit589@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:234
//
// IMU_MODE_SWITCHING_ROUTINES.agc:235
//COARSTOL	DEC	-.01111		# 2 DEGREES SCALED AT HALF-REVOLUTIONS
// slot 9729
    9729, 65170
)).

// bank 07, slots 9730-9734
function agcAotUnit590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9731 {
        if slot <= 9730 {
// IMU_MODE_SWITCHING_ROUTINES.agc:236
//
// IMU_MODE_SWITCHING_ROUTINES.agc:237
//
// IMU_MODE_SWITCHING_ROUTINES.agc:238
//COMNEG		AD	-COMMAX
// slot 9730
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
// IMU_MODE_SWITCHING_ROUTINES.agc:239
//		EXTEND
// slot 9731
            if slot <> 9731 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9732 {
// IMU_MODE_SWITCHING_ROUTINES.agc:240
//		BZMF	COMZERO
// slot 9732
            if slot <> 9732 or instruction <> 26122 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9733 {
// IMU_MODE_SWITCHING_ROUTINES.agc:241
//		COM
// slot 9733
                if slot <> 9733 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:242
//		INDEX	CDUIND
// slot 9734
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
// IMU_MODE_SWITCHING_ROUTINES.agc:243
//		TS	COMMAND
// slot 9735
    9735, 46706
)).

// bank 07, slots 9736-9739
function agcAotUnit591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9737 {
        if slot <= 9736 {
// IMU_MODE_SWITCHING_ROUTINES.agc:244
//		CA	-COMMAX-
// slot 9736
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
// IMU_MODE_SWITCHING_ROUTINES.agc:245
//		TC	NEXTCDU
// slot 9737
            if slot <> 9737 or instruction <> 1507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9738 {
// IMU_MODE_SWITCHING_ROUTINES.agc:246
//
// IMU_MODE_SWITCHING_ROUTINES.agc:247
//COMZERO		CAF	ZERO
// slot 9738
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
// IMU_MODE_SWITCHING_ROUTINES.agc:248
//		INDEX	CDUIND
// slot 9739
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
// IMU_MODE_SWITCHING_ROUTINES.agc:249
//		XCH	COMMAND
// slot 9740
    9740, 48754
)).

// bank 07, slots 9741-9746
function agcAotUnit592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9743 {
        if slot <= 9741 {
// IMU_MODE_SWITCHING_ROUTINES.agc:250
//		TC	NEXTCDU
// slot 9741
            if slot <> 9741 or instruction <> 1507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9742 {
// IMU_MODE_SWITCHING_ROUTINES.agc:251
//
// IMU_MODE_SWITCHING_ROUTINES.agc:252
//SENDPULS	CAF	13,14,15
// slot 9742
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
// IMU_MODE_SWITCHING_ROUTINES.agc:253
//		EXTEND
// slot 9743
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
// IMU_MODE_SWITCHING_ROUTINES.agc:254
//		WOR	CHAN14
// slot 9744
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
// IMU_MODE_SWITCHING_ROUTINES.agc:255
//		CAF	600MS
// slot 9745
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
// IMU_MODE_SWITCHING_ROUTINES.agc:256
//		TCF	COARS2 -1	# THEN TO VARDELAY
// slot 9746
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

// bank 07, slots 9747-9785
function agcAotUnit593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9765 {
        if slot <= 9755 {
            if slot <= 9750 {
                if slot <= 9748 {
                    if slot <= 9747 {
// IMU_MODE_SWITCHING_ROUTINES.agc:257
//
// IMU_MODE_SWITCHING_ROUTINES.agc:258
//
// IMU_MODE_SWITCHING_ROUTINES.agc:259
//CA+ECE		CAF	BIT6		# ENABLE ALL THREE ISS CDU ERROR COUNTERS
// slot 9747
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
// IMU_MODE_SWITCHING_ROUTINES.agc:260
//		EXTEND
// slot 9748
                        if slot <> 9748 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9749 {
// IMU_MODE_SWITCHING_ROUTINES.agc:261
//		WOR	CHAN12
// slot 9749
                        if slot <> 9749 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:262
//		TC	TASKOVER
// slot 9750
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
// IMU_MODE_SWITCHING_ROUTINES.agc:263
//
// IMU_MODE_SWITCHING_ROUTINES.agc:264
//# Page 1426
// IMU_MODE_SWITCHING_ROUTINES.agc:265
//SETCOARS	CAF	BIT4		# BYPASS IF ALREADY IN COARSE ALIGN
// slot 9751
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
// IMU_MODE_SWITCHING_ROUTINES.agc:266
//		EXTEND
// slot 9752
                        if slot <> 9752 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9753 {
// IMU_MODE_SWITCHING_ROUTINES.agc:267
//		RAND	CHAN12
// slot 9753
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
// IMU_MODE_SWITCHING_ROUTINES.agc:268
//		CCS	A
// slot 9754
                            if slot <> 9754 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:269
//		TC	Q
// slot 9755
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
// IMU_MODE_SWITCHING_ROUTINES.agc:270
//
// IMU_MODE_SWITCHING_ROUTINES.agc:271
//		CS	BIT6		# CLEAR ISS ERROR COUNTERS
// slot 9756
                        if slot <> 9756 or instruction <> 18954 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:272
//		EXTEND
// slot 9757
                        if slot <> 9757 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9758 {
// IMU_MODE_SWITCHING_ROUTINES.agc:273
//		WAND	CHAN12
// slot 9758
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
// IMU_MODE_SWITCHING_ROUTINES.agc:274
//
// IMU_MODE_SWITCHING_ROUTINES.agc:275
//		CS	BIT10		# KNOCK DOWN GYRO ACTIVITY
// slot 9759
                            if slot <> 9759 or instruction <> 18950 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:276
//		EXTEND
// slot 9760
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
// IMU_MODE_SWITCHING_ROUTINES.agc:277
//		WAND	CHAN14
// slot 9761
                        if slot <> 9761 or instruction <> 1548 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:278
//		CS	ZERO
// slot 9762
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
// IMU_MODE_SWITCHING_ROUTINES.agc:279
//		TS	GYROCMD
// slot 9763
                        if slot <> 9763 or instruction <> 22567 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22567, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9764 {
// IMU_MODE_SWITCHING_ROUTINES.agc:280
//
// IMU_MODE_SWITCHING_ROUTINES.agc:281
//		CAF	BIT4		# PUT ISS IN COARSE ALIGN
// slot 9764
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
// IMU_MODE_SWITCHING_ROUTINES.agc:282
//		EXTEND
// slot 9765
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
// IMU_MODE_SWITCHING_ROUTINES.agc:283
//		WOR	CHAN12
// slot 9766
                        if slot <> 9766 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:284
//
// IMU_MODE_SWITCHING_ROUTINES.agc:285
//		CS	DSPTAB +11D	# TURN ON NO ATT LAMP
// slot 9767
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
// IMU_MODE_SWITCHING_ROUTINES.agc:286
//		MASK	OCT40010
// slot 9768
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
// IMU_MODE_SWITCHING_ROUTINES.agc:287
//		ADS	DSPTAB +11D
// slot 9769
                            if slot <> 9769 or instruction <> 11806 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:288
//
// IMU_MODE_SWITCHING_ROUTINES.agc:289
//		CS	IMODES33	# DISABLE DAP AUTO AND HOLD MODES
// slot 9770
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
// IMU_MODE_SWITCHING_ROUTINES.agc:290
//		MASK	BIT6
// slot 9771
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
// IMU_MODE_SWITCHING_ROUTINES.agc:291
//		ADS	IMODES33
// slot 9772
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
// IMU_MODE_SWITCHING_ROUTINES.agc:292
//
// IMU_MODE_SWITCHING_ROUTINES.agc:293
//		CS	IMODES30	# DISABLE IMUFAIL
// slot 9773
                        if slot <> 9773 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9774 {
// IMU_MODE_SWITCHING_ROUTINES.agc:294
//		MASK	BIT4
// slot 9774
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
// IMU_MODE_SWITCHING_ROUTINES.agc:295
//		ADS	IMODES30
// slot 9775
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
// IMU_MODE_SWITCHING_ROUTINES.agc:296
//
// IMU_MODE_SWITCHING_ROUTINES.agc:297
//RNDREFDR	CS	BIT5		# KNOCK DOWN TRACK FLAG
// slot 9776
                        if slot <> 9776 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:298
//		MASK	FLAGWRD1
// slot 9777
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
// IMU_MODE_SWITCHING_ROUTINES.agc:299
//		TS	FLAGWRD1
// slot 9778
                        if slot <> 9778 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9779 {
// IMU_MODE_SWITCHING_ROUTINES.agc:300
//
// IMU_MODE_SWITCHING_ROUTINES.agc:301
//		CS	BIT15		# KNOCK DOWN DRIFT FLAG
// slot 9779
                            if slot <> 9779 or instruction <> 18945 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:302
//		MASK	FLAGWRD2
// slot 9780
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
// IMU_MODE_SWITCHING_ROUTINES.agc:303
//		TS	FLAGWRD2
// slot 9781
                        if slot <> 9781 or instruction <> 22590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:304
//
// IMU_MODE_SWITCHING_ROUTINES.agc:305
//		CS	BIT13		# KNOCK DOWN REFSMMAT FLAG
// slot 9782
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
// IMU_MODE_SWITCHING_ROUTINES.agc:306
//		MASK	FLAGWRD3
// slot 9783
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
// IMU_MODE_SWITCHING_ROUTINES.agc:307
//		TS	FLAGWRD3
// slot 9784
                            if slot <> 9784 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:308
//
// IMU_MODE_SWITCHING_ROUTINES.agc:309
//		TC	Q
// slot 9785
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
// IMU_MODE_SWITCHING_ROUTINES.agc:310
//
// IMU_MODE_SWITCHING_ROUTINES.agc:311
//OCT40010	OCT	40010
// slot 9786
    9786, 32784
)).

// bank 07, slots 9787-9797
function agcAotUnit594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9791 {
        if slot <= 9788 {
            if slot <= 9787 {
// IMU_MODE_SWITCHING_ROUTINES.agc:312
//
// IMU_MODE_SWITCHING_ROUTINES.agc:313
//# Page 1427
// IMU_MODE_SWITCHING_ROUTINES.agc:314
//# IMU FINE ALIGN MODE SWITCH.
// IMU_MODE_SWITCHING_ROUTINES.agc:315
//
// IMU_MODE_SWITCHING_ROUTINES.agc:316
//IMUFINE		INHINT
// slot 9787
                if slot <> 9787 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:317
//		TC	CAGETSTJ	# SEE IF IMU BEING CAGED.
// slot 9788
                if slot <> 9788 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9789 {
// IMU_MODE_SWITCHING_ROUTINES.agc:318
//
// IMU_MODE_SWITCHING_ROUTINES.agc:319
//		CS	BITS4-5		# RESET ZERO AND COARSE
// slot 9789
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
// IMU_MODE_SWITCHING_ROUTINES.agc:320
//		EXTEND
// slot 9790
                    if slot <> 9790 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:321
//		WAND	CHAN12
// slot 9791
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
// IMU_MODE_SWITCHING_ROUTINES.agc:322
//
// IMU_MODE_SWITCHING_ROUTINES.agc:323
//		CS	BIT6		# INSURE DAP AUTO AND HOLD MODES ENABLED
// slot 9792
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
// IMU_MODE_SWITCHING_ROUTINES.agc:324
//		MASK	IMODES33
// slot 9793
                    if slot <> 9793 or instruction <> 29393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:325
//		TS	IMODES33
// slot 9794
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
// IMU_MODE_SWITCHING_ROUTINES.agc:326
//
// IMU_MODE_SWITCHING_ROUTINES.agc:327
//		TC	NOATTOFF
// slot 9795
                if slot <> 9795 or instruction <> 1641 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1641, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9796 {
// IMU_MODE_SWITCHING_ROUTINES.agc:328
//
// IMU_MODE_SWITCHING_ROUTINES.agc:329
//		CAF	BIT10		# IMU FAIL WAS INHIBITED DURING THE
// slot 9796
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
// IMU_MODE_SWITCHING_ROUTINES.agc:330
//		TC	WAITLIST	# PRESUMABLY PRECEDING COARSE ALIGN.  LEAVE
// slot 9797
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
// IMU_MODE_SWITCHING_ROUTINES.agc:331
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:332
//		2CADR	IFAILOK		# IT ON FOR THE FIRST 5 SECS OF FINE ALIGN
// slot 9798 9799
    9798, 3230, 9799, 14438
)).

// bank 07, slots 9800-9801
function agcAotUnit595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9800 {
// IMU_MODE_SWITCHING_ROUTINES.agc:333
//
// IMU_MODE_SWITCHING_ROUTINES.agc:334
//		CAF	2SECS
// slot 9800
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
// IMU_MODE_SWITCHING_ROUTINES.agc:335
//		TC	WAITLIST
// slot 9801
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
// IMU_MODE_SWITCHING_ROUTINES.agc:336
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:337
//		2CADR	IMUFINED
// slot 9802 9803
    9802, 3226, 9803, 14438
)).

// bank 07, slots 9804-9820
function agcAotUnit596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9811 {
        if slot <= 9807 {
            if slot <= 9805 {
                if slot <= 9804 {
// IMU_MODE_SWITCHING_ROUTINES.agc:338
//
// IMU_MODE_SWITCHING_ROUTINES.agc:339
//		TCF	MODEEXIT
// slot 9804
                    if slot <> 9804 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:340
//
// IMU_MODE_SWITCHING_ROUTINES.agc:341
//IMUFINED	TC	CAGETEST	# SEE THAT NO ONE HAS CAGED THE IMU.
// slot 9805
                    if slot <> 9805 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9806 {
// IMU_MODE_SWITCHING_ROUTINES.agc:342
//		TCF	ENDIMU
// slot 9806
                    if slot <> 9806 or instruction <> 5964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5964, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:343
//
// IMU_MODE_SWITCHING_ROUTINES.agc:344
//# Page 1428
// IMU_MODE_SWITCHING_ROUTINES.agc:345
//IFAILOK		TC	CAGETSTQ	# ENABLE IMU FIAL UNLESS IMU BEING CAGED.
// slot 9807
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
// IMU_MODE_SWITCHING_ROUTINES.agc:346
//		TCF	TASKOVER	# IT IS.
// slot 9808
                    if slot <> 9808 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:347
//
// IMU_MODE_SWITCHING_ROUTINES.agc:348
//		CAF	BIT4		# DONT RESET IMU FAIL INHIBIT IF SOMEONE
// slot 9809
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
// IMU_MODE_SWITCHING_ROUTINES.agc:349
//		EXTEND			# HAS GONE INTO COARSE ALIGN.
// slot 9810
                    if slot <> 9810 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:350
//		RAND	CHAN12
// slot 9811
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
// IMU_MODE_SWITCHING_ROUTINES.agc:351
//		CCS	A
// slot 9812
                    if slot <> 9812 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:352
//		TCF	TASKOVER
// slot 9813
                    if slot <> 9813 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9814 {
// IMU_MODE_SWITCHING_ROUTINES.agc:353
//
// IMU_MODE_SWITCHING_ROUTINES.agc:354
//		CS	IMODES30	# RESET IMUFAIL.
// slot 9814
                    if slot <> 9814 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:355
//		MASK	BIT13
// slot 9815
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
// IMU_MODE_SWITCHING_ROUTINES.agc:356
//		ADS	IMODES30
// slot 9816
                    if slot <> 9816 or instruction <> 11984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:357
//		CS	BIT4
// slot 9817
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
// IMU_MODE_SWITCHING_ROUTINES.agc:358
//PFAILOK2	MASK	IMODES30
// slot 9818
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
// IMU_MODE_SWITCHING_ROUTINES.agc:359
//		TS	IMODES30
// slot 9819
                        if slot <> 9819 or instruction <> 23248 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23248, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:360
//		TC	IBNKCALL	# THE ISS WARNING LIGHT MAY COME ON NOW
// slot 9820
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
// IMU_MODE_SWITCHING_ROUTINES.agc:361
//		CADR	SETISSW		# THAT THE INHIBIT WAS BEEN REMOVED.
// slot 9821
    9821, 13162
)).

// bank 07, slots 9822-9848
function agcAotUnit597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9834 {
        if slot <= 9827 {
            if slot <= 9824 {
                if slot <= 9822 {
// IMU_MODE_SWITCHING_ROUTINES.agc:362
//		TCF	TASKOVER
// slot 9822
                    if slot <> 9822 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9823 {
// IMU_MODE_SWITCHING_ROUTINES.agc:363
//
// IMU_MODE_SWITCHING_ROUTINES.agc:364
//PFAILOK		TC	CAGETSTQ	# ENABLE PIP FAIL PROG ALARM.
// slot 9823
                        if slot <> 9823 or instruction <> 1881 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1881, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:365
//		TCF	TASKOVER
// slot 9824
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
// IMU_MODE_SWITCHING_ROUTINES.agc:366
//
// IMU_MODE_SWITCHING_ROUTINES.agc:367
//		CS	IMODES30	# RESET IMU AND PIPA FAIL BITS.
// slot 9825
                    if slot <> 9825 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9826 {
// IMU_MODE_SWITCHING_ROUTINES.agc:368
//		MASK	BIT10
// slot 9826
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
// IMU_MODE_SWITCHING_ROUTINES.agc:369
//		ADS	IMODES30
// slot 9827
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
// IMU_MODE_SWITCHING_ROUTINES.agc:370
//
// IMU_MODE_SWITCHING_ROUTINES.agc:371
//		CS	IMODES33
// slot 9828
                    if slot <> 9828 or instruction <> 17105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 721).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9829 {
// IMU_MODE_SWITCHING_ROUTINES.agc:372
//		MASK	BIT13
// slot 9829
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
// IMU_MODE_SWITCHING_ROUTINES.agc:373
//		ADS	IMODES33
// slot 9830
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
// IMU_MODE_SWITCHING_ROUTINES.agc:374
//
// IMU_MODE_SWITCHING_ROUTINES.agc:375
//		CS	BIT5
// slot 9831
                        if slot <> 9831 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:376
//		TCF	PFAILOK2
// slot 9832
                        if slot <> 9832 or instruction <> 5722 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5722, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9833 {
// IMU_MODE_SWITCHING_ROUTINES.agc:377
//
// IMU_MODE_SWITCHING_ROUTINES.agc:378
//NOATTOFF	CS	OCT40010	# SUBROUTINE TO TURN OFF NO ATT LAMP.
// slot 9833
                        if slot <> 9833 or instruction <> 17978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1594), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:379
//		MASK	DSPTAB +11D
// slot 9834
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
// IMU_MODE_SWITCHING_ROUTINES.agc:380
//		AD	BIT15
// slot 9835
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
// IMU_MODE_SWITCHING_ROUTINES.agc:381
//		TS	DSPTAB +11D
// slot 9836
                        if slot <> 9836 or instruction <> 23070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:382
//		TC	Q
// slot 9837
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
// IMU_MODE_SWITCHING_ROUTINES.agc:383
//
// IMU_MODE_SWITCHING_ROUTINES.agc:384
//# Page 1429
// IMU_MODE_SWITCHING_ROUTINES.agc:385
//# ROUTINES TO INITIATE AND TERMINATE PROGRAM USE OF THE PIPAS.  NO IMUSTALL REQUIRED IN EITHER CASE.
// IMU_MODE_SWITCHING_ROUTINES.agc:386
//
// IMU_MODE_SWITCHING_ROUTINES.agc:387
//PIPUSE		CS	ZERO
// slot 9838
                        if slot <> 9838 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:388
//		TS	PIPAX
// slot 9839
                        if slot <> 9839 or instruction <> 22559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9840 {
// IMU_MODE_SWITCHING_ROUTINES.agc:389
//		TS	PIPAY
// slot 9840
                        if slot <> 9840 or instruction <> 22560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:390
//		TS	PIPAZ
// slot 9841
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
// IMU_MODE_SWITCHING_ROUTINES.agc:391
//
// IMU_MODE_SWITCHING_ROUTINES.agc:392
//PIPUSE1		TC	CAGETSTQ	# DO NOT ENABLE PIPA FAIL IF IMU IS CAGED
// slot 9842
                    if slot <> 9842 or instruction <> 1881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1881, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9843 {
// IMU_MODE_SWITCHING_ROUTINES.agc:393
//		TCF	SWRETURN
// slot 9843
                        if slot <> 9843 or instruction <> 6589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:394
//
// IMU_MODE_SWITCHING_ROUTINES.agc:395
//		INHINT
// slot 9844
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
// IMU_MODE_SWITCHING_ROUTINES.agc:396
//		CS	BIT1		# IF PIPA FAILS FROM NOW ON (UNTIL
// slot 9845
                        if slot <> 9845 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:397
//		MASK	IMODES30	# PIPFREE), LIGHT ISS WARNING.
// slot 9846
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
// IMU_MODE_SWITCHING_ROUTINES.agc:398
//		TS	IMODES30
// slot 9847
                        if slot <> 9847 or instruction <> 23248 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23248, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:399
//
// IMU_MODE_SWITCHING_ROUTINES.agc:400
//PIPFREE2	TC	IBNKCALL	# ISS WARNING MIGHT COME ON NOW.
// slot 9848
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
// IMU_MODE_SWITCHING_ROUTINES.agc:401
//		CADR	SETISSW		# (OR GO OFF ON PIPFREE).
// slot 9849
    9849, 13162
)).

// bank 07, slots 9850-9858
function agcAotUnit598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9853 {
        if slot <= 9851 {
            if slot <= 9850 {
// IMU_MODE_SWITCHING_ROUTINES.agc:402
//
// IMU_MODE_SWITCHING_ROUTINES.agc:403
//		TCF	MODEEXIT
// slot 9850
                if slot <> 9850 or instruction <> 5536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:404
//
// IMU_MODE_SWITCHING_ROUTINES.agc:405
//PIPFREE		INHINT			# PROGRAM DONE WITH PIPAS.  DONT LIGHT
// slot 9851
                if slot <> 9851 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9852 {
// IMU_MODE_SWITCHING_ROUTINES.agc:406
//		CS	IMODES30	# ISS WARNING.
// slot 9852
                if slot <> 9852 or instruction <> 17104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 720).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:407
//		MASK	BIT1
// slot 9853
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
// IMU_MODE_SWITCHING_ROUTINES.agc:408
//		ADS	IMODES30
// slot 9854
                if slot <> 9854 or instruction <> 11984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 720).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:409
//
// IMU_MODE_SWITCHING_ROUTINES.agc:410
//		MASK	BIT10		# IF PIP FAIL ON, DO PROG ALSRM AND RESET
// slot 9855
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
// IMU_MODE_SWITCHING_ROUTINES.agc:411
//		CCS	A		# ISS WARNING.
// slot 9856
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
// IMU_MODE_SWITCHING_ROUTINES.agc:412
//		TCF	MODEEXIT
// slot 9857
                    if slot <> 9857 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:413
//
// IMU_MODE_SWITCHING_ROUTINES.agc:414
//		TC	ALARM
// slot 9858
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
// IMU_MODE_SWITCHING_ROUTINES.agc:415
//		OCT	212
// slot 9859
    9859, 276
)).

// bank 07, slots 9860-9871
function agcAotUnit599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9865 {
        if slot <= 9862 {
            if slot <= 9860 {
// IMU_MODE_SWITCHING_ROUTINES.agc:416
//
// IMU_MODE_SWITCHING_ROUTINES.agc:417
//		INHINT
// slot 9860
                if slot <> 9860 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9861 {
// IMU_MODE_SWITCHING_ROUTINES.agc:418
//
// IMU_MODE_SWITCHING_ROUTINES.agc:419
//		TCF	PIPFREE2
// slot 9861
                    if slot <> 9861 or instruction <> 5752 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5752, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:420
//
// IMU_MODE_SWITCHING_ROUTINES.agc:421
//# Page 1430
// IMU_MODE_SWITCHING_ROUTINES.agc:422
//# 	THE FOLLOWING ROUTINE TORQUES THE IRIGS ACCORDING TO DOUBLE PRECISION INPUTS IN THE SIX REGISTERS
// IMU_MODE_SWITCHING_ROUTINES.agc:423
//# BEGINNING AT THE ECADR ARRIVING IN A.  THE MINIMUM SIZE OF ANY PULSE TRAIN IS 16 PULSES (.25 CDU COUNTS).  THE
// IMU_MODE_SWITCHING_ROUTINES.agc:424
//# UNSENT PORTION OF THE COMMAND IS LEFT INTACT IN THE INPUT COMMAND REGISTERS.
// IMU_MODE_SWITCHING_ROUTINES.agc:425
//
// IMU_MODE_SWITCHING_ROUTINES.agc:426
//		EBANK=	1400		# VARIABLE, ACTUALLY.
// IMU_MODE_SWITCHING_ROUTINES.agc:427
//
// IMU_MODE_SWITCHING_ROUTINES.agc:428
//IMUPULSE	TS	MPAC +5		# SAVE ARRIVING ECADR.
// slot 9862
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
// IMU_MODE_SWITCHING_ROUTINES.agc:429
//		TC	CAGETSTJ	# DONT PROCEED IF IMU BEING CAGED.
// slot 9863
                if slot <> 9863 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9864 {
// IMU_MODE_SWITCHING_ROUTINES.agc:430
//
// IMU_MODE_SWITCHING_ROUTINES.agc:431
//		CCS	LGYRO		# SEE IF GYROS BUSY.
// slot 9864
                    if slot <> 9864 or instruction <> 4804 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:432
//		TC	GYROBUSY	# SLEEP.
// slot 9865
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
// IMU_MODE_SWITCHING_ROUTINES.agc:433
//
// IMU_MODE_SWITCHING_ROUTINES.agc:434
//		TS	MPAC +2
// slot 9866
                if slot <> 9866 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9867 {
// IMU_MODE_SWITCHING_ROUTINES.agc:435
//		CAF	BIT6		# ENABLE THE POWER SUPPLY.
// slot 9867
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
// IMU_MODE_SWITCHING_ROUTINES.agc:436
//		EXTEND
// slot 9868
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
// IMU_MODE_SWITCHING_ROUTINES.agc:437
//		WOR	CHAN14
// slot 9869
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
// IMU_MODE_SWITCHING_ROUTINES.agc:438
//
// IMU_MODE_SWITCHING_ROUTINES.agc:439
//		CAF	FOUR
// slot 9870
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
// IMU_MODE_SWITCHING_ROUTINES.agc:440
//GWAKE2		TC	WAITLIST	# (IF A JOB WAS PUT TO SLEEP, THE POWER
// slot 9871
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
// IMU_MODE_SWITCHING_ROUTINES.agc:441
//		EBANK=	CDUIND		# SUPPLY IS LEFT ON BY THE WAKING JOB).
// IMU_MODE_SWITCHING_ROUTINES.agc:442
//		2CADR	STRTGYRO
// slot 9872 9873
    9872, 3440, 9873, 14438
)).

// bank 07, slots 9874-9884
function agcAotUnit600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9878 {
        if slot <= 9875 {
            if slot <= 9874 {
// IMU_MODE_SWITCHING_ROUTINES.agc:443
//
// IMU_MODE_SWITCHING_ROUTINES.agc:444
//		CA	MPAC +5		# SET UP EBANK, SAVING CALLER'S EBANK FOR
// slot 9874
                if slot <> 9874 or instruction <> 12401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 113).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:445
//		XCH	EBANK		# RESTORATION ON RETURN.
// slot 9875
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
// IMU_MODE_SWITCHING_ROUTINES.agc:446
//		XCH	MPAC +5
// slot 9876
                if slot <> 9876 or instruction <> 23665 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 113, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9877 {
// IMU_MODE_SWITCHING_ROUTINES.agc:447
//		TS	LGYRO		# RESERVES GYROS.
// slot 9877
                    if slot <> 9877 or instruction <> 23236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23236, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:448
//		MASK	LOW8
// slot 9878
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
// IMU_MODE_SWITCHING_ROUTINES.agc:449
//		TS	ITEMP1
// slot 9879
                if slot <> 9879 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9880 {
// IMU_MODE_SWITCHING_ROUTINES.agc:450
//
// IMU_MODE_SWITCHING_ROUTINES.agc:451
//		CAF	TWO		# FORCE SIGN AGREEMENT ON INPUTS.
// slot 9880
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
// IMU_MODE_SWITCHING_ROUTINES.agc:452
//GYROAGRE	TS	MPAC +3
// slot 9881
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
// IMU_MODE_SWITCHING_ROUTINES.agc:453
//		DOUBLE
// slot 9882
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
// IMU_MODE_SWITCHING_ROUTINES.agc:454
//		AD	ITEMP1
// slot 9883
                    if slot <> 9883 or instruction <> 24625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:455
//		TS	MPAC +4
// slot 9884
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

// bank 07, slots 9885-9886
function agcAotUnit601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9885 {
// IMU_MODE_SWITCHING_ROUTINES.agc:456
//		EXTEND
// slot 9885
        if slot <> 9885 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:457
//		INDEX	A
// slot 9886
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
// IMU_MODE_SWITCHING_ROUTINES.agc:458
//		DCA	1400
// slot 9887
    9887, 26114
)).

// bank 07, slots 9888-9891
function agcAotUnit602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9889 {
        if slot <= 9888 {
// IMU_MODE_SWITCHING_ROUTINES.agc:459
//		DXCH	MPAC
// slot 9888
            if slot <> 9888 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:460
//		TC	TPAGREE
// slot 9889
            if slot <> 9889 or instruction <> 3734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9890 {
// IMU_MODE_SWITCHING_ROUTINES.agc:461
//		DXCH	MPAC
// slot 9890
            if slot <> 9890 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:462
//		INDEX	MPAC +4
// slot 9891
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
// IMU_MODE_SWITCHING_ROUTINES.agc:463
//		DXCH	1400
// slot 9892
    9892, 44546
)).

// bank 07, slots 9893-9910
function agcAotUnit603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9901 {
        if slot <= 9896 {
            if slot <= 9894 {
                if slot <= 9893 {
// IMU_MODE_SWITCHING_ROUTINES.agc:464
//
// IMU_MODE_SWITCHING_ROUTINES.agc:465
//		CCS	MPAC +3
// slot 9893
                    if slot <> 9893 or instruction <> 4207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 111).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:466
//		TCF	GYROAGRE
// slot 9894
                    if slot <> 9894 or instruction <> 5785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5785, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9895 {
// IMU_MODE_SWITCHING_ROUTINES.agc:467
//
// IMU_MODE_SWITCHING_ROUTINES.agc:468
//		CA	MPAC +5		# RESTORE CALLER'S EBANK.
// slot 9895
                    if slot <> 9895 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:469
//		TS	EBANK
// slot 9896
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
// IMU_MODE_SWITCHING_ROUTINES.agc:470
//		TCF	MODEEXIT
// slot 9897
                    if slot <> 9897 or instruction <> 5536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:471
//
// IMU_MODE_SWITCHING_ROUTINES.agc:472
//# Page 1431
// IMU_MODE_SWITCHING_ROUTINES.agc:473
//# ROUTINES TO ALLOW TORQUING BY ONLY ONE JOB AT A TIME.
// IMU_MODE_SWITCHING_ROUTINES.agc:474
//
// IMU_MODE_SWITCHING_ROUTINES.agc:475
//GYROBUSY	EXTEND			# SAVE RETURN 2FCADR.
// slot 9898
                    if slot <> 9898 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9899 {
// IMU_MODE_SWITCHING_ROUTINES.agc:476
//		DCA	BUF2
// slot 9899
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
// IMU_MODE_SWITCHING_ROUTINES.agc:477
//		DXCH	MPAC
// slot 9900
                        if slot <> 9900 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:478
//REGSLEEP	CAF	LGWAKE
// slot 9901
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
// IMU_MODE_SWITCHING_ROUTINES.agc:479
//		TCF	JOBSLEEP
// slot 9902
                    if slot <> 9902 or instruction <> 6781 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6781, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:480
//
// IMU_MODE_SWITCHING_ROUTINES.agc:481
//GWAKE		CCS	LGYRO		# WHEN AWAKENED, SEE IF GYROS STILL BUSY.
// slot 9903
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
// IMU_MODE_SWITCHING_ROUTINES.agc:482
//		TCF	REGSLEEP	# IF SO, SLEEP SOME MORE.
// slot 9904
                    if slot <> 9904 or instruction <> 5805 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5805, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:483
//
// IMU_MODE_SWITCHING_ROUTINES.agc:484
//		TS	MPAC +2
// slot 9905
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
// IMU_MODE_SWITCHING_ROUTINES.agc:485
//		EXTEND
// slot 9906
                    if slot <> 9906 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:486
//		DCA	MPAC
// slot 9907
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
// IMU_MODE_SWITCHING_ROUTINES.agc:487
//		DXCH	BUF2		# RESTORE SWRETURN INFO.
// slot 9908
                    if slot <> 9908 or instruction <> 21596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9909 {
// IMU_MODE_SWITCHING_ROUTINES.agc:488
//		CAF	ONE
// slot 9909
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
// IMU_MODE_SWITCHING_ROUTINES.agc:489
//		TCF	GWAKE2
// slot 9910
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
// IMU_MODE_SWITCHING_ROUTINES.agc:490
//
// IMU_MODE_SWITCHING_ROUTINES.agc:491
//LGWAKE		CADR	GWAKE
// slot 9911
    9911, 15710
)).

// bank 07, slots 9912-9919
function agcAotUnit604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9915 {
        if slot <= 9913 {
            if slot <= 9912 {
// IMU_MODE_SWITCHING_ROUTINES.agc:492
//
// IMU_MODE_SWITCHING_ROUTINES.agc:493
//# Page 1432
// IMU_MODE_SWITCHING_ROUTINES.agc:494
//# GYRO-TORQUING WAITLIST TASKS.
// IMU_MODE_SWITCHING_ROUTINES.agc:495
//
// IMU_MODE_SWITCHING_ROUTINES.agc:496
//STRTGYRO	CS	GDESELCT	# DE-SELECT LAST GYRO.
// slot 9912
                if slot <> 9912 or instruction <> 18249 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1865), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:497
//		EXTEND
// slot 9913
                if slot <> 9913 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9914 {
// IMU_MODE_SWITCHING_ROUTINES.agc:498
//		WAND	CHAN14
// slot 9914
                if slot <> 9914 or instruction <> 1548 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:499
//
// IMU_MODE_SWITCHING_ROUTINES.agc:500
//		TC	CAGETEST
// slot 9915
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
// IMU_MODE_SWITCHING_ROUTINES.agc:501
//
// IMU_MODE_SWITCHING_ROUTINES.agc:502
//STRTGYR2	CA	LGYRO		# JUMP ON PHASE COUNTER IN BITS 13-14.
// slot 9916
                if slot <> 9916 or instruction <> 12996 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:503
//		EXTEND
// slot 9917
                if slot <> 9917 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9918 {
// IMU_MODE_SWITCHING_ROUTINES.agc:504
//		MP	BIT4
// slot 9918
                if slot <> 9918 or instruction <> 31244 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:505
//		INDEX	A
// slot 9919
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
// IMU_MODE_SWITCHING_ROUTINES.agc:506
//		TCF	+1
// slot 9920
    9920, 11650
)).

// bank 07, slots 9921-9921
function agcAotUnit605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:507
//		TC	GSELECT		# =0.  DO Y GYRO.
// slot 9921
    if slot <> 9921 or instruction <> 1742 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1742, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[605] to agcAotUnit605@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:508
//		OCT	00202
// slot 9922
    9922, 260
)).

// bank 07, slots 9923-9923
function agcAotUnit606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:509
//
// IMU_MODE_SWITCHING_ROUTINES.agc:510
//		TC	GSELECT		# =1.  DO Z GYRO.
// slot 9923
    if slot <> 9923 or instruction <> 1742 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1742, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[606] to agcAotUnit606@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:511
//		OCT	00302
// slot 9924
    9924, 388
)).

// bank 07, slots 9925-9925
function agcAotUnit607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:512
//
// IMU_MODE_SWITCHING_ROUTINES.agc:513
//		TC	GSELECT -2	# =2.  DO X GYRO.
// slot 9925
    if slot <> 9925 or instruction <> 1740 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1740, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[607] to agcAotUnit607@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:514
//		OCT	00100
// slot 9926
    9926, 128
)).

// bank 07, slots 9927-9934
function agcAotUnit608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9930 {
        if slot <= 9928 {
            if slot <= 9927 {
// IMU_MODE_SWITCHING_ROUTINES.agc:515
//
// IMU_MODE_SWITCHING_ROUTINES.agc:516
//		CAF	ZERO		# =3.  DONE
// slot 9927
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
// IMU_MODE_SWITCHING_ROUTINES.agc:517
//		TS	LGYRO
// slot 9928
                if slot <> 9928 or instruction <> 23236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23236, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9929 {
// IMU_MODE_SWITCHING_ROUTINES.agc:518
//		CAF	LGWAKE		# WAKE A POSSIBLE SLEEPING JOB.
// slot 9929
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
// IMU_MODE_SWITCHING_ROUTINES.agc:519
//		TC	JOBWAKE
// slot 9930
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
// IMU_MODE_SWITCHING_ROUTINES.agc:520
//
// IMU_MODE_SWITCHING_ROUTINES.agc:521
//NORESET		TCF	IMUFINED	# DO NOT RESET POWER SUPPLY
// slot 9931
                if slot <> 9931 or instruction <> 5709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5709, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:522
//# Page 1433
// IMU_MODE_SWITCHING_ROUTINES.agc:523
//	-2	CS	FOUR		# SPECIAL ENTRY TO REGRESS LGYRO FOR X.
// slot 9932
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
// IMU_MODE_SWITCHING_ROUTINES.agc:524
//		ADS	LGYRO
// slot 9933
                if slot <> 9933 or instruction <> 11972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:525
//
// IMU_MODE_SWITCHING_ROUTINES.agc:526
//GSELECT		INDEX	Q		# SELECT GYRO.
// slot 9934
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
// IMU_MODE_SWITCHING_ROUTINES.agc:527
//		CAF	0		# PACKED WORD CONTAINS GYRO SELECT BITS
// slot 9935
    9935, 24576
)).

// bank 07, slots 9936-9947
function agcAotUnit609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9941 {
        if slot <= 9938 {
            if slot <= 9936 {
// IMU_MODE_SWITCHING_ROUTINES.agc:528
//		TS	ITEMP4		# AND INCREMENT TO LGYRO.
// slot 9936
                if slot <> 9936 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9937 {
// IMU_MODE_SWITCHING_ROUTINES.agc:529
//		MASK	SEVEN
// slot 9937
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
// IMU_MODE_SWITCHING_ROUTINES.agc:530
//		AD	BIT13
// slot 9938
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
// IMU_MODE_SWITCHING_ROUTINES.agc:531
//		ADS	LGYRO
// slot 9939
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
// IMU_MODE_SWITCHING_ROUTINES.agc:532
//		TS	EBANK
// slot 9940
                    if slot <> 9940 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:533
//		MASK	LOW8
// slot 9941
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
// IMU_MODE_SWITCHING_ROUTINES.agc:534
//		TS	ITEMP1
// slot 9942
                if slot <> 9942 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9943 {
// IMU_MODE_SWITCHING_ROUTINES.agc:535
//
// IMU_MODE_SWITCHING_ROUTINES.agc:536
//		CS	SEVEN
// slot 9943
                    if slot <> 9943 or instruction <> 18963 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:537
//		MASK	ITEMP4
// slot 9944
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
// IMU_MODE_SWITCHING_ROUTINES.agc:538
//		TS	ITEMP4
// slot 9945
                if slot <> 9945 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9946 {
// IMU_MODE_SWITCHING_ROUTINES.agc:539
//
// IMU_MODE_SWITCHING_ROUTINES.agc:540
//		EXTEND			# MOVE DP COMMAND TO RUPTREGS FOR TESTING.
// slot 9946
                    if slot <> 9946 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:541
//		INDEX	ITEMP1
// slot 9947
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
// IMU_MODE_SWITCHING_ROUTINES.agc:542
//		DCA	1400
// slot 9948
    9948, 26114
)).

// bank 07, slots 9949-9986
function agcAotUnit610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9967 {
        if slot <= 9957 {
            if slot <= 9952 {
                if slot <= 9950 {
                    if slot <= 9949 {
// IMU_MODE_SWITCHING_ROUTINES.agc:543
//		DXCH	RUPTREG1
// slot 9949
                        if slot <> 9949 or instruction <> 21561 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:544
//
// IMU_MODE_SWITCHING_ROUTINES.agc:545
//		CCS	RUPTREG1
// slot 9950
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
// IMU_MODE_SWITCHING_ROUTINES.agc:546
//		TCF	MAJ+
// slot 9951
                        if slot <> 9951 or instruction <> 5866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5866, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:547
//		TCF	+2
// slot 9952
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
// IMU_MODE_SWITCHING_ROUTINES.agc:548
//		TCF	MAJ-
// slot 9953
                        if slot <> 9953 or instruction <> 5946 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5946, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:549
//
// IMU_MODE_SWITCHING_ROUTINES.agc:550
//		CCS	RUPTREG2
// slot 9954
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
// IMU_MODE_SWITCHING_ROUTINES.agc:551
//		TCF	MIN+
// slot 9955
                        if slot <> 9955 or instruction <> 5863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5863, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9956 {
// IMU_MODE_SWITCHING_ROUTINES.agc:552
//		TCF	STRTGYR2
// slot 9956
                            if slot <> 9956 or instruction <> 5820 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5820, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:553
//		TCF	MIN-
// slot 9957
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
// IMU_MODE_SWITCHING_ROUTINES.agc:554
//		TCF	STRTGYR2
// slot 9958
                        if slot <> 9958 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:555
//
// IMU_MODE_SWITCHING_ROUTINES.agc:556
//# Page 1434
// IMU_MODE_SWITCHING_ROUTINES.agc:557
//MIN+		AD	-GYROMIN	# SMALL POSITIVE COMMAND.  SEE IF AT LEAST
// slot 9959
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
// IMU_MODE_SWITCHING_ROUTINES.agc:558
//		EXTEND			# 16 GYRO PULSES.
// slot 9960
                        if slot <> 9960 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9961 {
// IMU_MODE_SWITCHING_ROUTINES.agc:559
//		BZMF	STRTGYR2
// slot 9961
                            if slot <> 9961 or instruction <> 26300 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26300, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:560
//
// IMU_MODE_SWITCHING_ROUTINES.agc:561
//MAJ+		EXTEND			# DEFINITE POSITIVE OUTPUT.
// slot 9962
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
// IMU_MODE_SWITCHING_ROUTINES.agc:562
//		DCA	GYROFRAC
// slot 9963
                        if slot <> 9963 or instruction <> 14155 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1867, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:563
//		DAS	RUPTREG1
// slot 9964
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
// IMU_MODE_SWITCHING_ROUTINES.agc:564
//
// IMU_MODE_SWITCHING_ROUTINES.agc:565
//		CA	ITEMP4		# SELECT POSITIVE TORQUING FOR THIS GYRO.
// slot 9965
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
// IMU_MODE_SWITCHING_ROUTINES.agc:566
//		EXTEND
// slot 9966
                            if slot <> 9966 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:567
//		WOR	CHAN14
// slot 9967
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
// IMU_MODE_SWITCHING_ROUTINES.agc:568
//
// IMU_MODE_SWITCHING_ROUTINES.agc:569
//		CAF	LOW7		# LEAVE NUMBER OF POSSIBLE 8192 AUGMENTS
// slot 9968
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
// IMU_MODE_SWITCHING_ROUTINES.agc:570
//		MASK	RUPTREG2	# TO INITIAL COMMAND IN MAJOR PART OF LONG
// slot 9969
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
// IMU_MODE_SWITCHING_ROUTINES.agc:571
//		XCH	RUPTREG2	# TERM STORAGE AND TRUNCATED FRACTION
// slot 9970
                        if slot <> 9970 or instruction <> 23609 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 57, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:572
//GMERGE		EXTEND			# IN MINOR PART.  THE MAJOR PART WILL BE
// slot 9971
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
// IMU_MODE_SWITCHING_ROUTINES.agc:573
//		MP	BIT8		# COUNTED DOWN TO ZERO IN THE COURSE OF
// slot 9972
                        if slot <> 9972 or instruction <> 31240 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:574
//		TS	ITEMP2		# PUTTING OUT THE ENTIRE COMMAND.
// slot 9973
                        if slot <> 9973 or instruction <> 22578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9974 {
// IMU_MODE_SWITCHING_ROUTINES.agc:575
//		CA	RUPTREG1
// slot 9974
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
// IMU_MODE_SWITCHING_ROUTINES.agc:576
//		EXTEND
// slot 9975
                            if slot <> 9975 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:577
//		MP	BIT9
// slot 9976
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
// IMU_MODE_SWITCHING_ROUTINES.agc:578
//		TS	RUPTREG1
// slot 9977
                        if slot <> 9977 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:579
//		CA	L
// slot 9978
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
// IMU_MODE_SWITCHING_ROUTINES.agc:580
//		EXTEND
// slot 9979
                        if slot <> 9979 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9980 {
// IMU_MODE_SWITCHING_ROUTINES.agc:581
//		MP	BIT14
// slot 9980
                            if slot <> 9980 or instruction <> 31234 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:582
//		ADS	ITEMP2		# INITIAL COMMAND.
// slot 9981
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
// IMU_MODE_SWITCHING_ROUTINES.agc:583
//
// IMU_MODE_SWITCHING_ROUTINES.agc:584
//		EXTEND			# SEE IF MORE THAN ONE PULSE TRAIN NEEDED
// slot 9982
                        if slot <> 9982 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:585
//		DCA	RUPTREG1	# (MORE THAN 16383 PULSES).
// slot 9983
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
// IMU_MODE_SWITCHING_ROUTINES.agc:586
//		AD	MINUS1
// slot 9984
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
// IMU_MODE_SWITCHING_ROUTINES.agc:587
//		CCS	A
// slot 9985
                            if slot <> 9985 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:588
//		TCF	LONGGYRO
// slot 9986
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
// IMU_MODE_SWITCHING_ROUTINES.agc:589
//-GYROMIN	OCT	-176		# MAY BE ADJUSTED TO SPECIFY MINIMUM CMD
// slot 9987
    9987, 65282
)).

// bank 07, slots 9988-9992
function agcAotUnit611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9989 {
        if slot <= 9988 {
// IMU_MODE_SWITCHING_ROUTINES.agc:590
//		TCF	+4
// slot 9988
            if slot <> 9988 or instruction <> 5896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5896, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:591
//
// IMU_MODE_SWITCHING_ROUTINES.agc:592
//		CAF	BIT14
// slot 9989
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
// IMU_MODE_SWITCHING_ROUTINES.agc:593
//		ADS	ITEMP2
// slot 9990
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
// IMU_MODE_SWITCHING_ROUTINES.agc:594
//		CAF	ZERO
// slot 9991
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
// IMU_MODE_SWITCHING_ROUTINES.agc:595
//
// IMU_MODE_SWITCHING_ROUTINES.agc:596
//	+4	INDEX	ITEMP1
// slot 9992
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
// IMU_MODE_SWITCHING_ROUTINES.agc:597
//		DXCH	1400
// slot 9993
    9993, 44546
)).

// bank 07, slots 9994-9999
function agcAotUnit612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9996 {
        if slot <= 9994 {
// IMU_MODE_SWITCHING_ROUTINES.agc:598
//# Page 1435
// IMU_MODE_SWITCHING_ROUTINES.agc:599
//		CA	ITEMP2		# ENTIRE COMMAND.
// slot 9994
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
// IMU_MODE_SWITCHING_ROUTINES.agc:600
//LASTSEG		TS	GYROCMD
// slot 9995
                if slot <> 9995 or instruction <> 22567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:601
//		EXTEND
// slot 9996
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
// IMU_MODE_SWITCHING_ROUTINES.agc:602
//		MP	BIT10		# WAITLIST DT
// slot 9997
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
// IMU_MODE_SWITCHING_ROUTINES.agc:603
//		AD	THREE		# TRUNCATION AND PHASE UNCERTAINTIES.
// slot 9998
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
// IMU_MODE_SWITCHING_ROUTINES.agc:604
//		TC	WAITLIST
// slot 9999
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
// IMU_MODE_SWITCHING_ROUTINES.agc:605
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:606
//		2CADR	STRTGYRO
// slot 10000 10001
    10000, 3440, 10001, 14438
)).

// bank 07, slots 10002-10006
function agcAotUnit613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10003 {
        if slot <= 10002 {
// IMU_MODE_SWITCHING_ROUTINES.agc:607
//
// IMU_MODE_SWITCHING_ROUTINES.agc:608
//GYROEXIT	CAF	BIT10
// slot 10002
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
// IMU_MODE_SWITCHING_ROUTINES.agc:609
//		EXTEND
// slot 10003
            if slot <> 10003 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10004 {
// IMU_MODE_SWITCHING_ROUTINES.agc:610
//		WOR	CHAN14
// slot 10004
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
// IMU_MODE_SWITCHING_ROUTINES.agc:611
//		TCF	TASKOVER
// slot 10005
                if slot <> 10005 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:612
//
// IMU_MODE_SWITCHING_ROUTINES.agc:613
//LONGGYRO	INDEX	ITEMP1
// slot 10006
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
// IMU_MODE_SWITCHING_ROUTINES.agc:614
//		DXCH	1400		# INITIAL COMMAND OUT PLUS N AUGMENTS OF
// slot 10007
    10007, 44546
)).

// bank 07, slots 10008-10014
function agcAotUnit614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10010 {
        if slot <= 10008 {
// IMU_MODE_SWITCHING_ROUTINES.agc:615
//		CAF	BIT14		# 8192.  INITIAL COMMAND IS AT LEAST 8192.
// slot 10008
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
// IMU_MODE_SWITCHING_ROUTINES.agc:616
//		AD	ITEMP2
// slot 10009
                if slot <> 10009 or instruction <> 24626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:617
//		TS	GYROCMD
// slot 10010
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
// IMU_MODE_SWITCHING_ROUTINES.agc:618
//
// IMU_MODE_SWITCHING_ROUTINES.agc:619
//AUG3		EXTEND			# GET WAITLIST DT TO TIME WHEN TRAIN IS
// slot 10011
                if slot <> 10011 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:620
//		MP	BIT10		# ALMOST OUT.
// slot 10012
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
// IMU_MODE_SWITCHING_ROUTINES.agc:621
//		AD	NEG3
// slot 10013
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
// IMU_MODE_SWITCHING_ROUTINES.agc:622
//		TC	WAITLIST
// slot 10014
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
// IMU_MODE_SWITCHING_ROUTINES.agc:623
//		EBANK=	CDUIND
// IMU_MODE_SWITCHING_ROUTINES.agc:624
//		2CADR	8192AUG
// slot 10015 10016
    10015, 3652, 10016, 14438
)).

// bank 07, slots 10017-10028
function agcAotUnit615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10022 {
        if slot <= 10019 {
            if slot <= 10017 {
// IMU_MODE_SWITCHING_ROUTINES.agc:625
//
// IMU_MODE_SWITCHING_ROUTINES.agc:626
//		TCF	GYROEXIT
// slot 10017
                if slot <> 10017 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10018 {
// IMU_MODE_SWITCHING_ROUTINES.agc:627
//
// IMU_MODE_SWITCHING_ROUTINES.agc:628
//8192AUG		TC	CAGETEST
// slot 10018
                    if slot <> 10018 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:629
//
// IMU_MODE_SWITCHING_ROUTINES.agc:630
//		CAF	BIT4
// slot 10019
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
// IMU_MODE_SWITCHING_ROUTINES.agc:631
//		EXTEND
// slot 10020
                if slot <> 10020 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10021 {
// IMU_MODE_SWITCHING_ROUTINES.agc:632
//		RAND	CHAN12
// slot 10021
                    if slot <> 10021 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:633
//		CCS	A
// slot 10022
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
// IMU_MODE_SWITCHING_ROUTINES.agc:634
//		TCF	IMUBAD
// slot 10023
                if slot <> 10023 or instruction <> 5970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10024 {
// IMU_MODE_SWITCHING_ROUTINES.agc:635
//		CA	LGYRO		# ADD 8192 PULSES TO GYROCMD
// slot 10024
                    if slot <> 10024 or instruction <> 12996 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:636
//		TS	EBANK
// slot 10025
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
// IMU_MODE_SWITCHING_ROUTINES.agc:637
//		MASK	LOW8
// slot 10026
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
// IMU_MODE_SWITCHING_ROUTINES.agc:638
//		TS	ITEMP1
// slot 10027
                    if slot <> 10027 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:639
//
// IMU_MODE_SWITCHING_ROUTINES.agc:640
//		INDEX	ITEMP1		# SEE IF THIS IS THE LAST AUG.
// slot 10028
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
// IMU_MODE_SWITCHING_ROUTINES.agc:641
//		CCS	1400
// slot 10029
    10029, 9728
)).

// bank 07, slots 10030-10034
function agcAotUnit616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10031 {
        if slot <= 10030 {
// IMU_MODE_SWITCHING_ROUTINES.agc:642
//		TCF	AUG2		# MORE TO COME.
// slot 10030
            if slot <> 10030 or instruction <> 5938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5938, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:643
//
// IMU_MODE_SWITCHING_ROUTINES.agc:644
//		CAF	BIT14
// slot 10031
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
// IMU_MODE_SWITCHING_ROUTINES.agc:645
//		ADS	GYROCMD
// slot 10032
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
// IMU_MODE_SWITCHING_ROUTINES.agc:646
//		TCF	LASTSEG +1
// slot 10033
                if slot <> 10033 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:647
//
// IMU_MODE_SWITCHING_ROUTINES.agc:648
//# Page 1436
// IMU_MODE_SWITCHING_ROUTINES.agc:649
//AUG2		INDEX	ITEMP1
// slot 10034
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
// IMU_MODE_SWITCHING_ROUTINES.agc:650
//		TS	1400
// slot 10035
    10035, 46592
)).

// bank 07, slots 10036-10056
function agcAotUnit617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10045 {
        if slot <= 10040 {
            if slot <= 10037 {
                if slot <= 10036 {
// IMU_MODE_SWITCHING_ROUTINES.agc:651
//		CAF	BIT14
// slot 10036
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
// IMU_MODE_SWITCHING_ROUTINES.agc:652
//		ADS	GYROCMD
// slot 10037
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
// IMU_MODE_SWITCHING_ROUTINES.agc:653
//		TCF	AUG3		# COMPUTE DT.
// slot 10038
                    if slot <> 10038 or instruction <> 5915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5915, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10039 {
// IMU_MODE_SWITCHING_ROUTINES.agc:654
//
// IMU_MODE_SWITCHING_ROUTINES.agc:655
//# Page 1437
// IMU_MODE_SWITCHING_ROUTINES.agc:656
//MIN-		AD	-GYROMIN	# POSSIBLE NEGATIVE OUTPUT.
// slot 10039
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
// IMU_MODE_SWITCHING_ROUTINES.agc:657
//		EXTEND
// slot 10040
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
// IMU_MODE_SWITCHING_ROUTINES.agc:658
//		BZMF	STRTGYR2
// slot 10041
                    if slot <> 10041 or instruction <> 26300 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26300, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:659
//
// IMU_MODE_SWITCHING_ROUTINES.agc:660
//MAJ-		EXTEND			# DEFINITE NEGATIVE OUTPUT.
// slot 10042
                    if slot <> 10042 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10043 {
// IMU_MODE_SWITCHING_ROUTINES.agc:661
//		DCS	GYROFRAC
// slot 10043
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
// IMU_MODE_SWITCHING_ROUTINES.agc:662
//		DAS	RUPTREG1
// slot 10044
                        if slot <> 10044 or instruction <> 8249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 57) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:663
//
// IMU_MODE_SWITCHING_ROUTINES.agc:664
//		CA	ITEMP4		# SELECT NEGATIVE TORQUING FOR THIS GYRO.
// slot 10045
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
// IMU_MODE_SWITCHING_ROUTINES.agc:665
//		AD	BIT9
// slot 10046
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
// IMU_MODE_SWITCHING_ROUTINES.agc:666
//		EXTEND
// slot 10047
                    if slot <> 10047 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10048 {
// IMU_MODE_SWITCHING_ROUTINES.agc:667
//		WOR	CHAN14
// slot 10048
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
// IMU_MODE_SWITCHING_ROUTINES.agc:668
//
// IMU_MODE_SWITCHING_ROUTINES.agc:669
//		CS	RUPTREG1	# SET UP RUPTREGS TO FALL INTO GMERGE.
// slot 10049
                        if slot <> 10049 or instruction <> 16440 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 56).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:670
//		TS	RUPTREG1	# ALL NUMBERS PUT INTO GYROCMD ARE
// slot 10050
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
// IMU_MODE_SWITCHING_ROUTINES.agc:671
//		CS	RUPTREG2	# POSITIVE - BIT9 OF CHAN 14 DETERMINES
// slot 10051
                    if slot <> 10051 or instruction <> 16441 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 57).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10052 {
// IMU_MODE_SWITCHING_ROUTINES.agc:672
//		MASK	LOW7		# THE SIGN OF THE COMMAND.
// slot 10052
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
// IMU_MODE_SWITCHING_ROUTINES.agc:673
//		COM
// slot 10053
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
// IMU_MODE_SWITCHING_ROUTINES.agc:674
//		XCH	RUPTREG2
// slot 10054
                    if slot <> 10054 or instruction <> 23609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 57, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10055 {
// IMU_MODE_SWITCHING_ROUTINES.agc:675
//		COM
// slot 10055
                        if slot <> 10055 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:676
//		TCF	GMERGE
// slot 10056
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
// IMU_MODE_SWITCHING_ROUTINES.agc:677
//
// IMU_MODE_SWITCHING_ROUTINES.agc:678
//GDESELCT	OCT	1700		# TURN OFF SELECT AND ACTIVITY BITS.
// slot 10057
    10057, 1920,
// IMU_MODE_SWITCHING_ROUTINES.agc:679
//
// IMU_MODE_SWITCHING_ROUTINES.agc:680
//GYROFRAC	2DEC	.215 B-21
// slot 10058 10059
    10058, 0, 10059, 56
)).

// bank 07, slots 10060-10091
function agcAotUnit618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10075 {
        if slot <= 10067 {
            if slot <= 10063 {
                if slot <= 10061 {
                    if slot <= 10060 {
// IMU_MODE_SWITCHING_ROUTINES.agc:681
//
// IMU_MODE_SWITCHING_ROUTINES.agc:682
//# Page 1438
// IMU_MODE_SWITCHING_ROUTINES.agc:683
//# IMU MODE SWITCHING ROUTINES COME HERE WHEN ACTION COMPLETE.
// IMU_MODE_SWITCHING_ROUTINES.agc:684
//
// IMU_MODE_SWITCHING_ROUTINES.agc:685
//ENDIMU		EXTEND			# MODE IS BAD IF CAGE HAS OCCURRED OR IF
// slot 10060
                        if slot <> 10060 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:686
//		READ	DSALMOUT	# ISS WARNING IS ON.
// slot 10061
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
// IMU_MODE_SWITCHING_ROUTINES.agc:687
//		MASK	BIT1
// slot 10062
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
// IMU_MODE_SWITCHING_ROUTINES.agc:688
//		CCS	A
// slot 10063
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
// IMU_MODE_SWITCHING_ROUTINES.agc:689
//		TCF	IMUBAD
// slot 10064
                        if slot <> 10064 or instruction <> 5970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5970, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:690
//
// IMU_MODE_SWITCHING_ROUTINES.agc:691
//IMUGOOD		TCF	GOODEND		# WITH C(A) = 0.
// slot 10065
                        if slot <> 10065 or instruction <> 5992 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5992, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10066 {
// IMU_MODE_SWITCHING_ROUTINES.agc:692
//
// IMU_MODE_SWITCHING_ROUTINES.agc:693
//IMUBAD		CAF	ZERO
// slot 10066
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
// IMU_MODE_SWITCHING_ROUTINES.agc:694
//		TCF	BADEND
// slot 10067
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
// IMU_MODE_SWITCHING_ROUTINES.agc:695
//
// IMU_MODE_SWITCHING_ROUTINES.agc:696
//CAGETEST	CAF	BIT6		# SUBROUTINE TO TERMINATE IMU MODE
// slot 10068
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
// IMU_MODE_SWITCHING_ROUTINES.agc:697
//		MASK	IMODES30	# SWITCH IF IMU HAS BEEN CAGED.
// slot 10069
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
// IMU_MODE_SWITCHING_ROUTINES.agc:698
//		CCS	A
// slot 10070
                        if slot <> 10070 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:699
//		TCF	IMUBAD		# DIRECTLY.
// slot 10071
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
// IMU_MODE_SWITCHING_ROUTINES.agc:700
//		TC	Q		# WITH C(A) = +0.
// slot 10072
                        if slot <> 10072 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:701
//
// IMU_MODE_SWITCHING_ROUTINES.agc:702
//CAGETSTQ	CS	IMODES30	# SKIP IF IMU NOT BEING CAGED.
// slot 10073
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
// IMU_MODE_SWITCHING_ROUTINES.agc:703
//		MASK	BIT6
// slot 10074
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
// IMU_MODE_SWITCHING_ROUTINES.agc:704
//		CCS	A
// slot 10075
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
// IMU_MODE_SWITCHING_ROUTINES.agc:705
//		INCR	Q
// slot 10076
                        if slot <> 10076 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:706
//		TC	Q
// slot 10077
                        if slot <> 10077 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10078 {
// IMU_MODE_SWITCHING_ROUTINES.agc:707
//
// IMU_MODE_SWITCHING_ROUTINES.agc:708
//CAGETSTJ	CS	IMODES30	# IF DURING MODE SWITCH INITIALIZATION.
// slot 10078
                        if slot <> 10078 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:709
//		MASK	BIT6		# IT IS FOUND THAT THE IMU IS BEING CAGED.
// slot 10079
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
// IMU_MODE_SWITCHING_ROUTINES.agc:710
//		CCS	A		# SET IMUCADR TO -0 TO INDICATE OPERATION
// slot 10080
                        if slot <> 10080 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:711
//		TC	Q		# COMPLETE BUT FAILED.  RETURN IMMEDIATELY
// slot 10081
                        if slot <> 10081 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10082 {
// IMU_MODE_SWITCHING_ROUTINES.agc:712
//
// IMU_MODE_SWITCHING_ROUTINES.agc:713
//		CS	ZERO		# TO SWRETURN.
// slot 10082
                        if slot <> 10082 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:714
//		TS	IMUCADR
// slot 10083
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
// IMU_MODE_SWITCHING_ROUTINES.agc:715
//		TCF	MODEEXIT
// slot 10084
                        if slot <> 10084 or instruction <> 5536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5536, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:716
//
// IMU_MODE_SWITCHING_ROUTINES.agc:717
//# Page 1439
// IMU_MODE_SWITCHING_ROUTINES.agc:718
//# 	GENERALIZED MODE SWITCHING TERMINATION.  ENTER AT GOODEND FOR SUCCESSFUL COMPLETION OF AN I/O OPERATION
// IMU_MODE_SWITCHING_ROUTINES.agc:719
//# OR AT BADEND FOR AN UNSUCCESSFUL ONE.  C(A) OR ARRIVAL =0 FOR IMU, 1 FOR OPTICS.
// IMU_MODE_SWITCHING_ROUTINES.agc:720
//
// IMU_MODE_SWITCHING_ROUTINES.agc:721
//BADEND		TS	RUPTREG2	# DEVICE INDEX.
// slot 10085
                        if slot <> 10085 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10086 {
// IMU_MODE_SWITCHING_ROUTINES.agc:722
//		CS	ZERO		# FOR FAILURE.
// slot 10086
                        if slot <> 10086 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:723
//		TCF	GOODEND +2
// slot 10087
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
// IMU_MODE_SWITCHING_ROUTINES.agc:724
//
// IMU_MODE_SWITCHING_ROUTINES.agc:725
//GOODEND		TS	RUPTREG2
// slot 10088
                        if slot <> 10088 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:726
//		CS	ONE		# FOR SUCCESS.
// slot 10089
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
// IMU_MODE_SWITCHING_ROUTINES.agc:727
//
// IMU_MODE_SWITCHING_ROUTINES.agc:728
//		TS	RUPTREG3
// slot 10090
                        if slot <> 10090 or instruction <> 22586 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22586, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:729
//		INDEX	RUPTREG2	# SEE IF USING PROGRAM ASLEEP.
// slot 10091
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
// IMU_MODE_SWITCHING_ROUTINES.agc:730
//		CCS	MODECADR
// slot 10092
    10092, 9636
)).

// bank 07, slots 10093-10096
function agcAotUnit619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10094 {
        if slot <= 10093 {
// IMU_MODE_SWITCHING_ROUTINES.agc:731
//		TCF	+2		# YES - WAKE IT UP.
// slot 10093
            if slot <> 10093 or instruction <> 5999 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5999, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:732
//		TCF	ENDMODE		# IF 0, PROGRAM NOT IN YET.
// slot 10094
            if slot <> 10094 or instruction <> 6007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10095 {
// IMU_MODE_SWITCHING_ROUTINES.agc:733
//
// IMU_MODE_SWITCHING_ROUTINES.agc:734
//		CAF	ZERO		# WAKE SLEEPING PROGRAM.
// slot 10095
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
// IMU_MODE_SWITCHING_ROUTINES.agc:735
//		INDEX	RUPTREG2
// slot 10096
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
// IMU_MODE_SWITCHING_ROUTINES.agc:736
//		XCH	MODECADR
// slot 10097
    10097, 48548
)).

// bank 07, slots 10098-10100
function agcAotUnit620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10098 {
// IMU_MODE_SWITCHING_ROUTINES.agc:737
//		TC	JOBWAKE
// slot 10098
        if slot <> 10098 or instruction <> 2689 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2689, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10099 {
// IMU_MODE_SWITCHING_ROUTINES.agc:738
//
// IMU_MODE_SWITCHING_ROUTINES.agc:739
//		CS	RUPTREG3	# ADVANCE LOC IF SUCCESSFUL.
// slot 10099
            if slot <> 10099 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:740
//		INDEX	LOCCTR
// slot 10100
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
// IMU_MODE_SWITCHING_ROUTINES.agc:741
//		ADS	LOC
// slot 10101
    10101, 22760
)).

// bank 07, slots 10102-10104
function agcAotUnit621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10102 {
// IMU_MODE_SWITCHING_ROUTINES.agc:742
//
// IMU_MODE_SWITCHING_ROUTINES.agc:743
//		TCF	TASKOVER
// slot 10102
        if slot <> 10102 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10103 {
// IMU_MODE_SWITCHING_ROUTINES.agc:744
//
// IMU_MODE_SWITCHING_ROUTINES.agc:745
//ENDMODE		CA	RUPTREG3	# -0 INDICATES OPERATION COMPLETE BUT
// slot 10103
            if slot <> 10103 or instruction <> 12346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 58).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:746
//		INDEX	RUPTREG2	# UNSUCCESSFUL - -1 INDICATES COMPLETE AND
// slot 10104
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
// IMU_MODE_SWITCHING_ROUTINES.agc:747
//		TS	MODECADR	# SUCCESSFUL.
// slot 10105
    10105, 46500
)).

// bank 07, slots 10106-10114
function agcAotUnit622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10109 {
        if slot <= 10107 {
            if slot <= 10106 {
// IMU_MODE_SWITCHING_ROUTINES.agc:748
//		TCF	TASKOVER
// slot 10106
                if slot <> 10106 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:749
//
// IMU_MODE_SWITCHING_ROUTINES.agc:750
//# Page 1440
// IMU_MODE_SWITCHING_ROUTINES.agc:751
//# 	GENERAL STALLING ROUTINE.  USING PROGRAMS COME HERE TO WAIT FOR I/O COMPLETION.
// IMU_MODE_SWITCHING_ROUTINES.agc:752
//
// IMU_MODE_SWITCHING_ROUTINES.agc:753
//# PROGRAM DESCRIPTION					DATE- 21 FEB 1967
// IMU_MODE_SWITCHING_ROUTINES.agc:754
//#						LOG SECTION IMU MODE SWITCHING
// IMU_MODE_SWITCHING_ROUTINES.agc:755
//# MOD BY- MELANSON KERMAN TO ADD DOCUMENTATION		ASSEMBLY SUNDISK REV. 82
// IMU_MODE_SWITCHING_ROUTINES.agc:756
//
// IMU_MODE_SWITCHING_ROUTINES.agc:757
//# FUNCTIONAL DESCRIPTION-
// IMU_MODE_SWITCHING_ROUTINES.agc:758
//#	TO DELAY FURTHER EXECUTION OF THE CALLING ROUTINE UNTIL ITS SELECTED
// IMU_MODE_SWITCHING_ROUTINES.agc:759
//#	I/O FUNCTION IS COMPLETE.  THE FOLLOWING CHECKS ON THE CALLING ROUTINES
// IMU_MODE_SWITCHING_ROUTINES.agc:760
//#	MODECADR ARE MADE AND ACTED UPON.
// IMU_MODE_SWITCHING_ROUTINES.agc:761
//#	1) +0 INDICATES INCOMPLETE I/O OPERATION.CALLING ROUTINE IS PUT TO
// IMU_MODE_SWITCHING_ROUTINES.agc:762
//#	   SLEEP.
// IMU_MODE_SWITCHING_ROUTINES.agc:763
//#	2) -1 INDICATES COMPLETED I/O OPERATION.  STALL BYPASSES JOBSLEEP
// IMU_MODE_SWITCHING_ROUTINES.agc:764
//#	   CALL AND RETURNS TO CALLING ROUTINE AT L+3
// IMU_MODE_SWITCHING_ROUTINES.agc:765
//#	3) -0 INDICATES COMPLETED I/O WITH FAILURE.  STALL CLEARS MODECADR
// IMU_MODE_SWITCHING_ROUTINES.agc:766
//#	   AND RETURNS TO CALLING ROUTINE AT L+2.
// IMU_MODE_SWITCHING_ROUTINES.agc:767
//#	4) VALUE GREATER THAN 0 INDICATES TWO ROUTINES CALLING FOR USE OF
// IMU_MODE_SWITCHING_ROUTINES.agc:768
//#	   SAME DEVICE.  STALL EXITS TO ABORT WHICH EXECUTES A PROGRAM
// IMU_MODE_SWITCHING_ROUTINES.agc:769
//#	   RESTART WHICH IN TURN CLEARS ALL MODECADR REGISTERS.
// IMU_MODE_SWITCHING_ROUTINES.agc:770
//
// IMU_MODE_SWITCHING_ROUTINES.agc:771
//# CALLING SEQUENCE-
// IMU_MODE_SWITCHING_ROUTINES.agc:772
//# L 	TC	BANKCALL
// IMU_MODE_SWITCHING_ROUTINES.agc:773
//# L+1	CADR	(ONE OF 5 STALL ADDRESSES I.E. IMUSTALL,OPTSTALL,RADSTALL,
// IMU_MODE_SWITCHING_ROUTINES.agc:774
//#		AOTSTALL,OR ATTSTALL)
// IMU_MODE_SWITCHING_ROUTINES.agc:775
//
// IMU_MODE_SWITCHING_ROUTINES.agc:776
//# NORMAL-EXIT MODE-
// IMU_MODE_SWITCHING_ROUTINES.agc:777
//# TCF	JOBSLEEP OR TCF	MODEXIT
// IMU_MODE_SWITCHING_ROUTINES.agc:778
//
// IMU_MODE_SWITCHING_ROUTINES.agc:779
//# ALARM OR ABORT EXIT MODE-
// IMU_MODE_SWITCHING_ROUTINES.agc:780
//# TC	ABORT
// IMU_MODE_SWITCHING_ROUTINES.agc:781
//
// IMU_MODE_SWITCHING_ROUTINES.agc:782
//# OUTPUT-
// IMU_MODE_SWITCHING_ROUTINES.agc:783
//#	MODECADR= CADR 	IF JOBSLEEP
// IMU_MODE_SWITCHING_ROUTINES.agc:784
//#	MODECADR=+0	IF I/O COMPLETE
// IMU_MODE_SWITCHING_ROUTINES.agc:785
//#	BUF2=L+3	IF I/O COMPLETE AND GOOD.
// IMU_MODE_SWITCHING_ROUTINES.agc:786
//#	BUF2=L+2 IF I/O COMPLETE BUT FAILED.
// IMU_MODE_SWITCHING_ROUTINES.agc:787
//
// IMU_MODE_SWITCHING_ROUTINES.agc:788
//# ERASABLE INITIALIZATION-
// IMU_MODE_SWITCHING_ROUTINES.agc:789
//#	BUF2 CONTAINS RETURN ADDRESS PLUS 1,(L+2)
// IMU_MODE_SWITCHING_ROUTINES.agc:790
//#	BUF2+1 CONTAINS FBANK VALUE OF CALLING ROUTINE.
// IMU_MODE_SWITCHING_ROUTINES.agc:791
//#	MODECADR OF CALLING ROUTINE CONTAINS +0,-1,-0 OR CADR RETURN ADDRESS.
// IMU_MODE_SWITCHING_ROUTINES.agc:792
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:793
//# DEBRIS-
// IMU_MODE_SWITCHING_ROUTINES.agc:794
//#	RUPTREG2 AND CALLING ROUTINE MODECADR.
// IMU_MODE_SWITCHING_ROUTINES.agc:795
//
// IMU_MODE_SWITCHING_ROUTINES.agc:796
//AOTSTALL	CAF	ONE		# AOT.
// slot 10107
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
// IMU_MODE_SWITCHING_ROUTINES.agc:797
//		TC	STALL
// slot 10108
                if slot <> 10108 or instruction <> 1920 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1920, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:798
//
// IMU_MODE_SWITCHING_ROUTINES.agc:799
//RADSTALL	CAF	TWO
// slot 10109
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
// IMU_MODE_SWITCHING_ROUTINES.agc:800
//		TCF	STALL
// slot 10110
                if slot <> 10110 or instruction <> 6016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:801
//
// IMU_MODE_SWITCHING_ROUTINES.agc:802
//# Page 1441
// IMU_MODE_SWITCHING_ROUTINES.agc:803
//OPTSTALL	EQUALS	AOTSTALL
// IMU_MODE_SWITCHING_ROUTINES.agc:804
//
// IMU_MODE_SWITCHING_ROUTINES.agc:805
//IMUSTALL	CAF	ZERO		# IMU.
// slot 10111
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
// IMU_MODE_SWITCHING_ROUTINES.agc:806
//
// IMU_MODE_SWITCHING_ROUTINES.agc:807
//STALL		INHINT
// slot 10112
                if slot <> 10112 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10113 {
// IMU_MODE_SWITCHING_ROUTINES.agc:808
//		TS	RUPTREG2	# SAVE DEVICE INDEX.
// slot 10113
                    if slot <> 10113 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:809
//		INDEX	A		# SEE IF OPERATION COMPLETE.
// slot 10114
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
// IMU_MODE_SWITCHING_ROUTINES.agc:810
//		CCS	MODECADR
// slot 10115
    10115, 9636
)).

// bank 07, slots 10116-10119
function agcAotUnit623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10117 {
        if slot <= 10116 {
// IMU_MODE_SWITCHING_ROUTINES.agc:811
//		TCF	MODABORT	# ALLOWABLE STATES ARE +0, -1, AND -0.
// slot 10116
            if slot <> 10116 or instruction <> 6034 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6034, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:812
//		TCF	MODESLP		# OPERATION INCOMPLETE.
// slot 10117
            if slot <> 10117 or instruction <> 6030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10118 {
// IMU_MODE_SWITCHING_ROUTINES.agc:813
//		TCF	MODEGOOD	# COMPLETE AND GOOD IF = -1.
// slot 10118
            if slot <> 10118 or instruction <> 6026 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6026, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:814
//
// IMU_MODE_SWITCHING_ROUTINES.agc:815
//MG2		INDEX	RUPTREG2	# COMPLETE FAILED IF -0.  RESET TO +0.
// slot 10119
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
// IMU_MODE_SWITCHING_ROUTINES.agc:816
//		TS	MODECADR	# RETURN TO CALLER.
// slot 10120
    10120, 46500
)).

// bank 07, slots 10121-10127
function agcAotUnit624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10123 {
        if slot <= 10121 {
// IMU_MODE_SWITCHING_ROUTINES.agc:817
//		TCF	MODEEXIT
// slot 10121
            if slot <> 10121 or instruction <> 5536 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5536, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10122 {
// IMU_MODE_SWITCHING_ROUTINES.agc:818
//
// IMU_MODE_SWITCHING_ROUTINES.agc:819
//MODEGOOD	CCS	A		# MAKE SURE INITIAL STATE -1.
// slot 10122
                if slot <> 10122 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:820
//		TCF	MODABORT
// slot 10123
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
// IMU_MODE_SWITCHING_ROUTINES.agc:821
//
// IMU_MODE_SWITCHING_ROUTINES.agc:822
//		INCR	BUF2		# IF SO, INCREMENT RETURN ADDRESS AND
// slot 10124
                if slot <> 10124 or instruction <> 10331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:823
//		TCF	MG2		# RETURN IMMEDIATELY, SETTIN CADR = +0.
// slot 10125
                if slot <> 10125 or instruction <> 6023 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6023, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10126 {
// IMU_MODE_SWITCHING_ROUTINES.agc:824
//
// IMU_MODE_SWITCHING_ROUTINES.agc:825
//MODESLP		TC	MAKECADR	# CALL FROM SWITCHABLE FIXED ONLY.
// slot 10126
                if slot <> 10126 or instruction <> 2505 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2505, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:826
//		INDEX	RUPTREG2
// slot 10127
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
// IMU_MODE_SWITCHING_ROUTINES.agc:827
//		TS	MODECADR
// slot 10128
    10128, 46500
)).

// bank 07, slots 10129-10130
function agcAotUnit625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10129 {
// IMU_MODE_SWITCHING_ROUTINES.agc:828
//		TCF	JOBSLEEP
// slot 10129
        if slot <> 10129 or instruction <> 6781 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6781, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:829
//
// IMU_MODE_SWITCHING_ROUTINES.agc:830
//MODABORT	TC	POODOO		# TWO PROGRAMS USING THE SAME DEVICE.
// slot 10130
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
// IMU_MODE_SWITCHING_ROUTINES.agc:831
//		OCT	1210
// slot 10131
    10131, 1296,
// IMU_MODE_SWITCHING_ROUTINES.agc:832
//
// IMU_MODE_SWITCHING_ROUTINES.agc:833
//# Page 1442
// IMU_MODE_SWITCHING_ROUTINES.agc:834
//# CONSTANTS FOR MODE SWITCHING ROUTINES
// IMU_MODE_SWITCHING_ROUTINES.agc:835
//
// IMU_MODE_SWITCHING_ROUTINES.agc:836
//BITS3&4		=	OCT14
// IMU_MODE_SWITCHING_ROUTINES.agc:837
//BITS4&6		=	OCT50
// IMU_MODE_SWITCHING_ROUTINES.agc:838
//BITS4-5		EQUALS	BITS4&5
// IMU_MODE_SWITCHING_ROUTINES.agc:839
//IMUSEFLG	EQUALS	BIT8		# INTERPRETER SWITCH 7.
// IMU_MODE_SWITCHING_ROUTINES.agc:840
//-COMMAX		DEC	-191
// slot 10132
    10132, 65152,
// IMU_MODE_SWITCHING_ROUTINES.agc:841
//-COMMAX-	DEC	-192
// slot 10133
    10133, 65150,
// IMU_MODE_SWITCHING_ROUTINES.agc:842
//600MS		DEC	60
// slot 10134
    10134, 120
)).

// bank 07, slots 10135-10138
function agcAotUnit626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10136 {
        if slot <= 10135 {
// IMU_MODE_SWITCHING_ROUTINES.agc:843
//IMUFIN20	=	IMUFINE
// IMU_MODE_SWITCHING_ROUTINES.agc:844
//GOMANUR		CA	ATTCADR		# IS KALCMANU FREE
// slot 10135
            if slot <> 10135 or instruction <> 13013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 725).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:845
//		EXTEND
// slot 10136
            if slot <> 10136 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10137 {
// IMU_MODE_SWITCHING_ROUTINES.agc:846
//		BZF	+3
// slot 10137
            if slot <> 10137 or instruction <> 6044 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:847
//		TC	POODOO		# NO
// slot 10138
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
// IMU_MODE_SWITCHING_ROUTINES.agc:848
//		OCT	1210		# 2 TRYING TO USE SAME DEVICE
// slot 10139
    10139, 1296
)).

// bank 07, slots 10140-10151
function agcAotUnit627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10145 {
        if slot <= 10142 {
            if slot <= 10140 {
// IMU_MODE_SWITCHING_ROUTINES.agc:849
//
// IMU_MODE_SWITCHING_ROUTINES.agc:850
//	+3	EXTEND
// slot 10140
                if slot <> 10140 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10141 {
// IMU_MODE_SWITCHING_ROUTINES.agc:851
//		DCA	BUF2
// slot 10141
                    if slot <> 10141 or instruction <> 12380 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:852
//		DXCH	ATTCADR		# SAVE FINAL RETURN FOR KALCMAN3
// slot 10142
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
// IMU_MODE_SWITCHING_ROUTINES.agc:853
//
// IMU_MODE_SWITCHING_ROUTINES.agc:854
//		CA	BBANK
// slot 10143
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
// IMU_MODE_SWITCHING_ROUTINES.agc:855
//		MASK	SEVEN
// slot 10144
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
// IMU_MODE_SWITCHING_ROUTINES.agc:856
//		ADS	ATTCADR +1
// slot 10145
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
// IMU_MODE_SWITCHING_ROUTINES.agc:857
//
// IMU_MODE_SWITCHING_ROUTINES.agc:858
//		CA	PRIORITY
// slot 10146
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
// IMU_MODE_SWITCHING_ROUTINES.agc:859
//		MASK	PRIO37
// slot 10147
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
// IMU_MODE_SWITCHING_ROUTINES.agc:860
//		TS	ATTPRIO		# SAVE USERS PRIO
// slot 10148
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
// IMU_MODE_SWITCHING_ROUTINES.agc:861
//
// IMU_MODE_SWITCHING_ROUTINES.agc:862
//		CAF	KALEBCON	# SET EBANK FOR KALCMAN3
// slot 10149
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
// IMU_MODE_SWITCHING_ROUTINES.agc:863
//		TS	EBANK
// slot 10150
                    if slot <> 10150 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:864
//		TC	POSTJUMP
// slot 10151
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
// IMU_MODE_SWITCHING_ROUTINES.agc:865
//		CADR	KALCMAN3
// slot 10152
    10152, 36864,
// IMU_MODE_SWITCHING_ROUTINES.agc:866
//KALEBCON	ECADR	BCDU
// slot 10153
    10153, 3426,
// IMU_MODE_SWITCHING_ROUTINES.agc:867
//
// IMU_MODE_SWITCHING_ROUTINES.agc:868
//# Page 1443
// IMU_MODE_SWITCHING_ROUTINES.agc:869
//# PROGRAM DESCRIPTION
// IMU_MODE_SWITCHING_ROUTINES.agc:870
//# IMU STATUS CHECK ROUTINE R02 (SUBROUTINE UTILITY)
// IMU_MODE_SWITCHING_ROUTINES.agc:871
//# MOD NO - 1
// IMU_MODE_SWITCHING_ROUTINES.agc:872
//# MOD BY - BRODEUR KERMAN
// IMU_MODE_SWITCHING_ROUTINES.agc:873
//# FUNCTIONAL DESCRIPTION
// IMU_MODE_SWITCHING_ROUTINES.agc:874
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:875
//# TO CHECK WHETHER IMU IS ON AND IF ON WHETHER IT IS ALIGNED TO AN
// IMU_MODE_SWITCHING_ROUTINES.agc:876
//# ORIENTATION KNOWN BY THE CMC.  TO REQUEST SELECTION OF THE APPROPRIATE
// IMU_MODE_SWITCHING_ROUTINES.agc:877
//# PROGRAM IF THE IMU IS OFF OR NOT ALIGNED TO AN ORIENTATION KNOWN BY THE
// IMU_MODE_SWITCHING_ROUTINES.agc:878
//# CMC.  CALLED THROUGH BANKCALL
// IMU_MODE_SWITCHING_ROUTINES.agc:879
//# CALLING SEQUENCE-
// IMU_MODE_SWITCHING_ROUTINES.agc:880
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:881
//# L	TC	BANKCALL
// IMU_MODE_SWITCHING_ROUTINES.agc:882
//# L+1	CADR	R02BOTH
// IMU_MODE_SWITCHING_ROUTINES.agc:883
//# SUBROUTINES CALLED
// IMU_MODE_SWITCHING_ROUTINES.agc:884
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:885
//#	VARALARM
// IMU_MODE_SWITCHING_ROUTINES.agc:886
//#	FLAGUP
// IMU_MODE_SWITCHING_ROUTINES.agc:887
//# NORMAL EXIT MODES
// IMU_MODE_SWITCHING_ROUTINES.agc:888
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:889
//# AT L+2 OF CALLING SEQUENCE
// IMU_MODE_SWITCHING_ROUTINES.agc:890
//# ALARM OR ABORT EXIT MODES
// IMU_MODE_SWITCHING_ROUTINES.agc:891
//#	GOTOPOOH, WITH ALARM
// IMU_MODE_SWITCHING_ROUTINES.agc:892
//# ERASABLE INITIALIZATION REQUIRED
// IMU_MODE_SWITCHING_ROUTINES.agc:893
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:894
//# NONE
// IMU_MODE_SWITCHING_ROUTINES.agc:895
//# DEBRIS
// IMU_MODE_SWITCHING_ROUTINES.agc:896
//#
// IMU_MODE_SWITCHING_ROUTINES.agc:897
//# CENTRALS-A,Q,L
// IMU_MODE_SWITCHING_ROUTINES.agc:898
//
// IMU_MODE_SWITCHING_ROUTINES.agc:899
//		BANK	34
// IMU_MODE_SWITCHING_ROUTINES.agc:900
//		SETLOC	R02
// IMU_MODE_SWITCHING_ROUTINES.agc:901
//		BANK
// IMU_MODE_SWITCHING_ROUTINES.agc:902
//		COUNT	04/R02		# COUNT*
// IMU_MODE_SWITCHING_ROUTINES.agc:903
//
// IMU_MODE_SWITCHING_ROUTINES.agc:904
//DEC51		DEC	51
// slot 10154
    10154, 102
)).

// bank 07, slots 10155-10167
function agcAotUnit628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10160 {
        if slot <= 10157 {
            if slot <= 10155 {
// IMU_MODE_SWITCHING_ROUTINES.agc:905
//R02BOTH		CAF	BIT13
// slot 10155
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
// IMU_MODE_SWITCHING_ROUTINES.agc:906
//		MASK	STATE +3	# REFSMFLG
// slot 10156
                    if slot <> 10156 or instruction <> 28735 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:907
//		CCS	A
// slot 10157
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
// IMU_MODE_SWITCHING_ROUTINES.agc:908
//		TC	R02ZERO		# ZERO IMUS
// slot 10158
                if slot <> 10158 or instruction <> 1975 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1975, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10159 {
// IMU_MODE_SWITCHING_ROUTINES.agc:909
//
// IMU_MODE_SWITCHING_ROUTINES.agc:910
//		CA	IMODES30
// slot 10159
                    if slot <> 10159 or instruction <> 13008 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:911
//		MASK	BIT9		# IS ISS INITIALIZED
// slot 10160
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
// IMU_MODE_SWITCHING_ROUTINES.agc:912
//		EXTEND
// slot 10161
                if slot <> 10161 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10162 {
// IMU_MODE_SWITCHING_ROUTINES.agc:913
//		BZF	+2
// slot 10162
                    if slot <> 10162 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:914
//		CS	BIT4		# SEND IMU ALARM CODE 210
// slot 10163
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
// IMU_MODE_SWITCHING_ROUTINES.agc:915
//		AD	OCT220		# SEND REFSMM ALARM
// slot 10164
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
// IMU_MODE_SWITCHING_ROUTINES.agc:916
//		TC	VARALARM
// slot 10165
                    if slot <> 10165 or instruction <> 3060 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3060, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10166 {
// IMU_MODE_SWITCHING_ROUTINES.agc:917
//
// IMU_MODE_SWITCHING_ROUTINES.agc:918
//		TC	GOTOPOOH
// slot 10166
                    if slot <> 10166 or instruction <> 2118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:919
//
// IMU_MODE_SWITCHING_ROUTINES.agc:920
//# Page 1444
// IMU_MODE_SWITCHING_ROUTINES.agc:921
//R02ZERO		TC	UPFLAG
// slot 10167
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
// IMU_MODE_SWITCHING_ROUTINES.agc:922
//		ADRES	IMUSE
// slot 10168
    10168, 14
)).

// bank 07, slots 10169-10169
function agcAotUnit629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:923
//		TCF	SWRETURN
// slot 10169
    if slot <> 10169 or instruction <> 6589 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6589, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[629] to agcAotUnit629@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:924
//OCT220		OCT	220
// slot 10170
    10170, 288
)).

// bank 26, slots 25520-25520
function agcAotUnit1475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:925
//
// IMU_MODE_SWITCHING_ROUTINES.agc:926
//# Page 1445
// IMU_MODE_SWITCHING_ROUTINES.agc:927
//# PROGRAM DESCRIPTION	P06	10FEB67
// IMU_MODE_SWITCHING_ROUTINES.agc:928
//
// IMU_MODE_SWITCHING_ROUTINES.agc:929
//# TRANSFER THE ISS/CMC FROM THE OPERATE TO THE STANDBY CONDITION.
// IMU_MODE_SWITCHING_ROUTINES.agc:930
//
// IMU_MODE_SWITCHING_ROUTINES.agc:931
//# THE NORMAL CONDITION OF READINESS OF THE GNCS WHEN NOT IN USE IS STANDBY.  IN THIS CONDITION THE IMU
// IMU_MODE_SWITCHING_ROUTINES.agc:932
//# HEATER POWER IS ON.  THE IMU OPERATE POWER IS OFF.  THE COMPUTER POWER IS ON.  THE OPTICS POWER IS OFF.  THE
// IMU_MODE_SWITCHING_ROUTINES.agc:933
//# CMC STANDBY ON THE MAIN AND LEB DISKYS IS ON.
// IMU_MODE_SWITCHING_ROUTINES.agc:934
//
// IMU_MODE_SWITCHING_ROUTINES.agc:935
//# CALLING SEQUENCE:
// IMU_MODE_SWITCHING_ROUTINES.agc:936
//#	VAL REQUEST THROUGH DSKY	V37E 06E.
// IMU_MODE_SWITCHING_ROUTINES.agc:937
//
// IMU_MODE_SWITCHING_ROUTINES.agc:938
//# SUBROUTINES CALLED:
// IMU_MODE_SWITCHING_ROUTINES.agc:939
//#	GOPERF1
// IMU_MODE_SWITCHING_ROUTINES.agc:940
//#	BANKCALL
// IMU_MODE_SWITCHING_ROUTINES.agc:941
//#	FLAGDOWN
// IMU_MODE_SWITCHING_ROUTINES.agc:942
//
// IMU_MODE_SWITCHING_ROUTINES.agc:943
//# Page 1446
// IMU_MODE_SWITCHING_ROUTINES.agc:944
//# PRESTAND PREPARES FOR STANDBY BY SNAPSHOTTING THE SCALER AND TIME1 TIME2
// IMU_MODE_SWITCHING_ROUTINES.agc:945
//# THE LOW 5 BITS OF THE SCALER ARE INSPECTED TO INSURE COMPATABILITY
// IMU_MODE_SWITCHING_ROUTINES.agc:946
//# BETWEEN THE SCALER READING AND THE TIME1 TIME2 READING.
// IMU_MODE_SWITCHING_ROUTINES.agc:947
//
// IMU_MODE_SWITCHING_ROUTINES.agc:948
//		SETLOC	P05P06
// IMU_MODE_SWITCHING_ROUTINES.agc:949
//		BANK
// IMU_MODE_SWITCHING_ROUTINES.agc:950
//
// IMU_MODE_SWITCHING_ROUTINES.agc:951
//		EBANK=	TIME2SAV
// IMU_MODE_SWITCHING_ROUTINES.agc:952
//		COUNT*	$$/P06
// IMU_MODE_SWITCHING_ROUTINES.agc:953
//
// IMU_MODE_SWITCHING_ROUTINES.agc:954
//P06		TC	UPFLAG		# SET NODOV37 BIT
// slot 25520
    if slot <> 25520 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1475] to agcAotUnit1475@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:955
//		ADRES	NODOFLAG
// slot 25521
    25521, 88
)).

// bank 26, slots 25522-25531
function agcAotUnit1476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25526 {
        if slot <= 25523 {
            if slot <= 25522 {
// IMU_MODE_SWITCHING_ROUTINES.agc:956
//
// IMU_MODE_SWITCHING_ROUTINES.agc:957
//PRESTAND	INHINT
// slot 25522
                if slot <> 25522 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:958
//		EXTEND
// slot 25523
                if slot <> 25523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25524 {
// IMU_MODE_SWITCHING_ROUTINES.agc:959
//		DCA	TIME2		# SNAPSHOT TIME1TIME2
// slot 25524
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
// IMU_MODE_SWITCHING_ROUTINES.agc:960
//		DXCH	TIME2SAV
// slot 25525
                    if slot <> 25525 or instruction <> 22121 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 617, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:961
//		TC	SCALPREP
// slot 25526
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
// IMU_MODE_SWITCHING_ROUTINES.agc:962
//		TC	PRESTAND	# T1,T2,SCALER NOT COMPATIBLE
// slot 25527
                if slot <> 25527 or instruction <> 1970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:963
//		DXCH	MPAC		# T1,T2 AND SCALER OK
// slot 25528
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
// IMU_MODE_SWITCHING_ROUTINES.agc:964
//		DXCH	SCALSAVE	# STORE SCALER
// slot 25529
                if slot <> 25529 or instruction <> 22123 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 619, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25530 {
// IMU_MODE_SWITCHING_ROUTINES.agc:965
//		INHINT
// slot 25530
                    if slot <> 25530 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:966
//		TC	BANKCALL
// slot 25531
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
// IMU_MODE_SWITCHING_ROUTINES.agc:967
//		CADR	RNDREFDR	# REFSMM, DRIFT, TRACK FLAGS DOWN
// slot 25532
    25532, 15456
)).

// bank 26, slots 25533-25533
function agcAotUnit1477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:968
//
// IMU_MODE_SWITCHING_ROUTINES.agc:969
//		TC	DOWNFLAG
// slot 25533
    if slot <> 25533 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1477] to agcAotUnit1477@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:970
//		ADRES	IMUSE		# IMUSE DOWN
// slot 25534
    25534, 14
)).

// bank 26, slots 25535-25535
function agcAotUnit1478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:971
//		TC	DOWNFLAG
// slot 25535
    if slot <> 25535 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1478] to agcAotUnit1478@.

agcAotInstallSourceRope(list(
// IMU_MODE_SWITCHING_ROUTINES.agc:972
//		ADRES	RNDVZFLG	# RNDVZFLG DOWN
// slot 25536
    25536, 16
)).

// bank 26, slots 25537-25540
function agcAotUnit1479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25538 {
        if slot <= 25537 {
// IMU_MODE_SWITCHING_ROUTINES.agc:973
//
// IMU_MODE_SWITCHING_ROUTINES.agc:974
//		CAF	BIT11
// slot 25537
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
// IMU_MODE_SWITCHING_ROUTINES.agc:975
//		EXTEND
// slot 25538
            if slot <> 25538 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25539 {
// IMU_MODE_SWITCHING_ROUTINES.agc:976
//		WOR	CHAN13		# SET STANDBY ENABLE BIT
// slot 25539
            if slot <> 25539 or instruction <> 2571 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:977
//
// IMU_MODE_SWITCHING_ROUTINES.agc:978
//		TC	PHASCHNG	# SET RESTART TO POSTAND WHEN STANDBY
// slot 25540
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
// IMU_MODE_SWITCHING_ROUTINES.agc:979
//		OCT	07024		#	RECOVERS
// slot 25541
    25541, 7208,
// IMU_MODE_SWITCHING_ROUTINES.agc:980
//		OCT	20000
// slot 25542
    25542, 16384,
// IMU_MODE_SWITCHING_ROUTINES.agc:981
//		EBANK=	SCALSAVE
// IMU_MODE_SWITCHING_ROUTINES.agc:982
//		2CADR	POSTAND
// slot 25543 25544
    25543, 4030, 25544, 45156
)).

// bank 26, slots 25545-25546
function agcAotUnit1480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25545 {
// IMU_MODE_SWITCHING_ROUTINES.agc:983
//
// IMU_MODE_SWITCHING_ROUTINES.agc:984
//		CAF	OCT62
// slot 25545
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
// IMU_MODE_SWITCHING_ROUTINES.agc:985
//		TC	BANKCALL
// slot 25546
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
// IMU_MODE_SWITCHING_ROUTINES.agc:986
//		CADR	GOPERF1
// slot 25547
    25547, 17482
)).

// bank 26, slots 25548-25596
function agcAotUnit1481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25571 {
        if slot <= 25559 {
            if slot <= 25553 {
                if slot <= 25550 {
                    if slot <= 25548 {
// IMU_MODE_SWITCHING_ROUTINES.agc:987
//		TCF	-3
// slot 25548
                        if slot <> 25548 or instruction <> 6089 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6089, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25549 {
// IMU_MODE_SWITCHING_ROUTINES.agc:988
//		TCF	-4
// slot 25549
                            if slot <> 25549 or instruction <> 6089 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6089, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:989
//		TCF	-5
// slot 25550
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
// IMU_MODE_SWITCHING_ROUTINES.agc:990
//
// IMU_MODE_SWITCHING_ROUTINES.agc:991
//OCT62		EQUALS	.5SEC		# DEC 50 = OCT 62
// IMU_MODE_SWITCHING_ROUTINES.agc:992
//
// IMU_MODE_SWITCHING_ROUTINES.agc:993
//# THE LOW 5 BITS OF THE SCALER READS 10000 FOR THE FIRST INTERVAL AFTER A
// IMU_MODE_SWITCHING_ROUTINES.agc:994
//# Page 1447.
// IMU_MODE_SWITCHING_ROUTINES.agc:995
//# T1 INCREMENT.  IF SCALPREP DETECTS THIS INTERVAL THE T1,T2 AND SCALER
// IMU_MODE_SWITCHING_ROUTINES.agc:996
//# DATA ARE NOT COMPATABLE AND RETURN IS TO L+1 FOR ANOTHER READING OF THE
// IMU_MODE_SWITCHING_ROUTINES.agc:997
//# DATA.  OTHERWISE, THE RETURN IS TO L+2 TO PROCEED.  ROUTINE ALSO PREPARES
// IMU_MODE_SWITCHING_ROUTINES.agc:998
//# THE SCALER READING FOR COMPUTATION OF THE INCREMENT TO UPDATE T1T2.  (THE
// IMU_MODE_SWITCHING_ROUTINES.agc:999
//# 10 MS BIT (BIT 6) OF THE SCALER IS INCREMENTED 5 MS OUT OF PHASE FROM
// IMU_MODE_SWITCHING_ROUTINES.agc:1000
//# T1.) ADDITION OF 5 MS (BIT 5) TO THE SCALER READING HAS THE EFFECT OF
// IMU_MODE_SWITCHING_ROUTINES.agc:1001
//# ADJUSTING BIT 6 IN THE SCALER TO BE IN PHASE WITH BIT 1 OF T1.  THE LOW 5
// IMU_MODE_SWITCHING_ROUTINES.agc:1002
//# BITS OF THE SCALER READING ARE THEN SET TO ZERO, TO TRUNCATE THE SCALER
// IMU_MODE_SWITCHING_ROUTINES.agc:1003
//# DATA TO 10 MS.  RESULTS ARE STORED IN MPAC, +1.
// IMU_MODE_SWITCHING_ROUTINES.agc:1004
//
// IMU_MODE_SWITCHING_ROUTINES.agc:1005
//SCALPREP	EXTEND
// slot 25551
                        if slot <> 25551 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25552 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1006
//		QXCH	MPAC +2
// slot 25552
                            if slot <> 25552 or instruction <> 9326 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 110, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1007
//		TC	FINETIME +1
// slot 25553
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1008
//		RELINT
// slot 25554
                        if slot <> 25554 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25555 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1009
//		DXCH	MPAC
// slot 25555
                            if slot <> 25555 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1010
//		CA	BIT5		# ADD 5 MS TO THE SCALER READING.
// slot 25556
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1011
//		TS	L
// slot 25557
                        if slot <> 25557 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25558 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1012
//		CA	ZERO
// slot 25558
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1013
//		DAS	MPAC
// slot 25559
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1014
//		CS	LOW5		# SET LOW 5 BITS OF (SCALER+5MS) TO ZERO
// slot 25560
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1015
//		MASK 	MPAC +1		# AND STORE RESULTS IN MPAC,+1.
// slot 25561
                            if slot <> 25561 or instruction <> 28781 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1016
//		XCH	MPAC +1
// slot 25562
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1017
//		MASK	LOW5		# TEST LOW 5 BITS OF SCALER FOR THE FIRST
// slot 25563
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1018
//					# INTERVAL AFTER THE T1 INCREMENT
// IMU_MODE_SWITCHING_ROUTINES.agc:1019
//					# (NOW = 00000, SINCE BIT 5 ADDED).
// IMU_MODE_SWITCHING_ROUTINES.agc:1020
//		CCS	A		# IS IT 1ST INTERVAL AFTER T1 INCREMENT
// slot 25564
                            if slot <> 25564 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1021
//		INCR	MPAC +2		# NO
// slot 25565
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1022
//		TC	MPAC +2		# YES
// slot 25566
                        if slot <> 25566 or instruction <> 110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 110, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25567 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1023
//
// IMU_MODE_SWITCHING_ROUTINES.agc:1024
//# POSTAND RECOVERS TIME AFTER STANDBY.THE SCALER IS SNAPSHOTTED AND THE
// IMU_MODE_SWITCHING_ROUTINES.agc:1025
//# TIME1 TIME2 COUNTER IS SET TO ZERO.  THE LOW 5 BITS OF THE SCALER ARE
// IMU_MODE_SWITCHING_ROUTINES.agc:1026
//# INSPECTED TO INSURE COMPATABILITY BETWEEN THE SCALER READING AND THE
// IMU_MODE_SWITCHING_ROUTINES.agc:1027
//# CLEARING OF THE TIME COUNTER.  IT THEN COMPUTES THE DIFFERENCE IN SCALER
// IMU_MODE_SWITCHING_ROUTINES.agc:1028
//# VALUES (IN DP) AND ADDS THIS TO THE PREVIOUSLY SNAPSHOTTED VALUES OF
// IMU_MODE_SWITCHING_ROUTINES.agc:1029
//# TIME1 TIME2 AND PLACES THIS NEW TIME INTO THE TIME1 TIME2 COUNTER.
// IMU_MODE_SWITCHING_ROUTINES.agc:1030
//
// IMU_MODE_SWITCHING_ROUTINES.agc:1031
//		COUNT*	$$/P05
// IMU_MODE_SWITCHING_ROUTINES.agc:1032
//
// IMU_MODE_SWITCHING_ROUTINES.agc:1033
//POSTAND		CS	BIT11		# RECOVER TIME AFTER STANDBY.
// slot 25567
                            if slot <> 25567 or instruction <> 18949 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1034
//		EXTEND
// slot 25568
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1035
//		WAND	CHAN13		# CLEAR STANDBY ENABLE BIT
// slot 25569
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1036
//		INHINT
// slot 25570
                            if slot <> 25570 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1037
//		CA	ZERO
// slot 25571
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1038
//		TS	L
// slot 25572
                        if slot <> 25572 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25573 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1039
//		DXCH	TIME2		# CLEAR TIME1 TIME2
// slot 25573
                            if slot <> 25573 or instruction <> 21525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1040
//		TC	SCALPREP	# STORE SCALER IN MPAC, MPAC+1
// slot 25574
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1041
//		TC	POSTAND +3	# T1,T2,SCALER NOT COMPATIBLE
// slot 25575
                        if slot <> 25575 or instruction <> 2018 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2018, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25576 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1042
//		EXTEND			# T1,T2 AND SCALER OK
// slot 25576
                            if slot <> 25576 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1043
//		DCS	SCALSAVE
// slot 25577
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1044
//		DAS	MPAC		# FORM DP DIFFERENCE OF POSTSTANDBY SCALER
// slot 25578
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1045
//# Page 1448
// IMU_MODE_SWITCHING_ROUTINES.agc:1046
//		CAF	BIT10		# MINUS PRESTANDBY SCALER AND SHIFT RIGHT
// slot 25579
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1047
//		TC	SHORTMP		# 5 TO ALIGN BITS WITH TIME1TIME2.
// slot 25580
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1048
//		CAF	ZERO
// slot 25581
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1049
//		TS	MPAC +2		# NEEDED FOR TP AGREE
// slot 25582
                            if slot <> 25582 or instruction <> 22638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1050
//		TC	TPAGREE		# MAKE DP DIFF AGREE
// slot 25583
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1051
//		CCS	MPAC
// slot 25584
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1052
//		TC	POSTCOM		# IF DP DIFF NET +, NO SCALER OVERFLOW
// slot 25585
                            if slot <> 25585 or instruction <> 2038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1053
//		TC	POSTCOM		# BETWEEN PRE AND POST STANDBY.
// slot 25586
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1054
//		TC	+1		# IF DP DIFF NET -, SCALER OVERFLOWED.  ADD
// slot 25587
                        if slot <> 25587 or instruction <> 2036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25588 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1055
//		CAF	BIT10		# BIT 10 TO HIGH DIFF TO CORRECT.
// slot 25588
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1056
//		ADS	MPAC
// slot 25589
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1057
//POSTCOM		EXTEND			# C(MPAC,+1) IS MAGNITUDE OF DELTA SCALER.
// slot 25590
                        if slot <> 25590 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 25591 {
// IMU_MODE_SWITCHING_ROUTINES.agc:1058
//		DCA	TIME2SAV	# PRE-STANDBY TIME1TIME2
// slot 25591
                            if slot <> 25591 or instruction <> 12905 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 617, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1059
//		DAS	MPAC
// slot 25592
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1060
//		TC	TPAGREE		# FORCE SIGN AGREEMENT
// slot 25593
                            if slot <> 25593 or instruction <> 3734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3734, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1061
//		DXCH	MPAC		# UPDATED VALUE FOR T1,T2.
// slot 25594
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1062
//		DAS	TIME2		# LOAD UPDATED VALUE INTO T1,T2, WITH
// slot 25595
                            if slot <> 25595 or instruction <> 8213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 21) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// IMU_MODE_SWITCHING_ROUTINES.agc:1063
//		TC	DOWNFLAG	# CLEAR NODOFLAG
// slot 25596
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
// IMU_MODE_SWITCHING_ROUTINES.agc:1064
//		ADRES	NODOFLAG
// slot 25597
    25597, 88
)).

// bank 26, slots 25598-25598
function agcAotUnit1482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_MODE_SWITCHING_ROUTINES.agc:1065
//
// IMU_MODE_SWITCHING_ROUTINES.agc:1066
//		TC	GOTOPOOH
// slot 25598
    if slot <> 25598 or instruction <> 2118 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2118, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1482] to agcAotUnit1482@.

