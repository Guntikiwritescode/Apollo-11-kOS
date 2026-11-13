// PORT: Original source unit THROTTLE_CONTROL_ROUTINES.agc.
// PORT: Physical bank 31. Shared continuation entries, slots 27790–27907.
function agcAotUnit1761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27848 {
        if slot <= 27818 {
            if slot <= 27803 {
                if slot <= 27796 {
                    if slot <= 27792 {
                        if slot <= 27790 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:2
//# Filename:	THROTTLE_CONTROL_ROUTINES.agc
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:7
//# Contact:	HARTMUTH GUTSCHE <hgutsche@xplornet.com>.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:9
//# Pages:	793-797
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:10
//# Mod history:	2009-05-20 HG	Transcribed from page images.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:11
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:12
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:16
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:19
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:20
//# actually created.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:21
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:23
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:25
//#	16:27 JULY 14, 1969
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:26
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:27
//# Page 793
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:28
//		BANK	31
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:29
//		SETLOC	FTHROT
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:30
//		BANK
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:31
//		EBANK=	PIF
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:32
//		COUNT*	$$/THROT
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:33
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:34
//# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:35
//# HERE FC, DESIRED THRUST, AND FP, PRESENT THRUST, UNWEIGHTED, ARE COMPUTED.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:36
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:37
//THROTTLE	CA	ABDELV		# COMPUTE PRESENT ACCELERATION IN UNITS OF
// PORT: Fixed ROM slots 27790.
                            if slot <> 27790 or instruction <> 12966 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 678).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27791 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:38
//		EXTEND			# 2(-4) M/CS/CS, SAVING SERVICER TROUBLE
// PORT: Fixed ROM slots 27791.
                                if slot <> 27791 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:39
//		MP	/AF/CNST
// PORT: Fixed ROM slots 27792.
                                if slot <> 27792 or instruction <> 29967 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1295, readEffective:call(words, 1295)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27794 {
                            if slot <= 27793 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:40
// +3		EXTEND
// PORT: Fixed ROM slots 27793.
                                if slot <> 27793 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:41
// 		QXCH	RTNHOLD
// PORT: Fixed ROM slots 27794.
                                if slot <> 27794 or instruction <> 10119 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 903, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27795 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:42
//AFDUMP		TC	MASSMULT
// PORT: Fixed ROM slots 27795.
                                if slot <> 27795 or instruction <> 1280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:43
//		DXCH	FP		# FP = PRESENT THRUST
// PORT: Fixed ROM slots 27796.
                                if slot <> 27796 or instruction <> 22328 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 824, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27799 {
                        if slot <= 27797 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:44
//		EXTEND
// PORT: Fixed ROM slots 27797.
                            if slot <> 27797 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27798 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:45
//		DCA	/AFC/
// PORT: Fixed ROM slots 27798.
                                if slot <> 27798 or instruction <> 13108 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 820, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:46
//		TC	MASSMULT
// PORT: Fixed ROM slots 27799.
                                if slot <> 27799 or instruction <> 1280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27801 {
                            if slot <= 27800 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:47
//		TS	FC		# FC = THRUST DESIRED BY GUIDANCE
// PORT: Fixed ROM slots 27800.
                                if slot <> 27800 or instruction <> 23437 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23437, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:48
//		DXCH	FCODD		# FCODD = WHAT IT IS GOING TO GET
// PORT: Fixed ROM slots 27801.
                                if slot <> 27801 or instruction <> 22326 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 822, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27802 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:49
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:50
//# IF IT HAS BEEN LESS THAN 3 SECONDS SINCE THE LAST THROTTLING, AUGMENT FP USING THE FWEIGHT CALCULATED THEN.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:51
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:52
//		CS	TTHROT		# THIS CODING ASSUMES A FLATOUT WITHIN
// PORT: Fixed ROM slots 27802.
                                if slot <> 27802 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:53
//		AD	TIME1		#   80 SECONDS BEFORE FIRST THROTTLE CALL
// PORT: Fixed ROM slots 27803.
                                if slot <> 27803 or instruction <> 24597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 21).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 27810 {
                    if slot <= 27806 {
                        if slot <= 27804 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:54
//		MASK	POSMAX
// PORT: Fixed ROM slots 27804.
                            if slot <> 27804 or instruction <> 31195 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                if fixedOperand = 16383 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 16384) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27805 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:55
//		COM
// PORT: Fixed ROM slots 27805.
                                if slot <> 27805 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:56
//		AD	3SECS
// PORT: Fixed ROM slots 27806.
                                if slot <> 27806 or instruction <> 27138 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27808 {
                            if slot <= 27807 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:57
//		EXTEND
// PORT: Fixed ROM slots 27807.
                                if slot <> 27807 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:58
//		BZMF	WHERETO		# BRANCH IF (TIME1-TTHROT +1) > 3 SECONDS
// PORT: Fixed ROM slots 27808.
                                if slot <> 27808 or instruction <> 25764 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25764, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27809 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:59
//		EXTEND
// PORT: Fixed ROM slots 27809.
                                if slot <> 27809 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:60
//		DCA	FWEIGHT
// PORT: Fixed ROM slots 27810.
                                if slot <> 27810 or instruction <> 13193 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 905, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27814 {
                        if slot <= 27812 {
                            if slot <= 27811 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:61
//		DAS	FP
// PORT: Fixed ROM slots 27811.
                                if slot <> 27811 or instruction <> 9016 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 824) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:62
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:63
//# THIS LOGIC DETERMINES THE THROTTLING IN THE REGION 10% - 94%.  THE MANUAL THROTTLE, NOMINALLY SET AT
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:64
//# MINIMUM BY ASTRONAUT OR MISSION CONTROL PROGRAMS, PROVIDES THE LOWER BOUND.  A STOP IN THE THROTTLE HARDWARE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:65
//# PROVIDES THE UPPER.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:66
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:67
//WHERETO		CA	EBANK5		# INITIALIZE L*WCR*T AND H*GHCR*T FROM
// PORT: Fixed ROM slots 27812.
                                if slot <> 27812 or instruction <> 14860 { return choose false if checkOnly else -1. }
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
                            if slot <= 27813 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:68
//		TS	EBANK		#   PAD LOADED ERASABLES IN W-MATRIX
// PORT: Fixed ROM slots 27813.
                                if slot <> 27813 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:69
//# Page 794
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:70
//		EBANK=	LOWCRIT
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:71
//		EXTEND
// PORT: Fixed ROM slots 27814.
                                if slot <> 27814 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27816 {
                            if slot <= 27815 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:72
//		DCA	LOWCRIT
// PORT: Fixed ROM slots 27815.
                                if slot <> 27815 or instruction <> 13127 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 839, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:73
//		DXCH	L*WCR*T
// PORT: Fixed ROM slots 27816.
                                if slot <> 27816 or instruction <> 21593 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27817 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:74
//		CA	EBANK7
// PORT: Fixed ROM slots 27817.
                                if slot <> 27817 or instruction <> 14862 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:75
//		TS	EBANK
// PORT: Fixed ROM slots 27818.
                                if slot <> 27818 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 27833 {
                if slot <= 27825 {
                    if slot <= 27821 {
                        if slot <= 27819 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:76
//		EBANK=	PIF
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:77
//		CS	ZERO		# INITIALIZE PIFPSET
// PORT: Fixed ROM slots 27819.
                            if slot <> 27819 or instruction <> 18925 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27820 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:78
//		TS	PIFPSET
// PORT: Fixed ROM slots 27820.
                                if slot <> 27820 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:79
//		CS	H*GHCR*T
// PORT: Fixed ROM slots 27821.
                                if slot <> 27821 or instruction <> 16473 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 89).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27823 {
                            if slot <= 27822 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:80
//		AD	FCOLD
// PORT: Fixed ROM slots 27822.
                                if slot <> 27822 or instruction <> 25488 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 912).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:81
//		EXTEND
// PORT: Fixed ROM slots 27823.
                                if slot <> 27823 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27824 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:82
//		BZMF	LOWFCOLD	# BRANCH IF FCOLD < OR = HIGHCRIT
// PORT: Fixed ROM slots 27824.
                                if slot <> 27824 or instruction <> 25786 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25786, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:83
//		CS	L*WCR*T
// PORT: Fixed ROM slots 27825.
                                if slot <> 27825 or instruction <> 16472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 88).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27829 {
                        if slot <= 27827 {
                            if slot <= 27826 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:84
//		AD	FCODD
// PORT: Fixed ROM slots 27826.
                                if slot <> 27826 or instruction <> 25397 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 821).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:85
//		EXTEND
// PORT: Fixed ROM slots 27827.
                                if slot <> 27827 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27828 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:86
//		BZMF	FCOMPSET	# BRANCH IF FC < OR = LOWCRIT
// PORT: Fixed ROM slots 27828.
                                if slot <> 27828 or instruction <> 25783 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25783, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:87
//		CA	FP		# SEE NOTE 1
// PORT: Fixed ROM slots 27829.
                                if slot <> 27829 or instruction <> 13111 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 823).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27831 {
                            if slot <= 27830 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:88
//		TCF	FLATOUT1
// PORT: Fixed ROM slots 27830.
                                if slot <> 27830 or instruction <> 5311 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5311, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:89
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:90
//FCOMPSET	CS	FMAXODD		# SEE NOTE 2
// PORT: Fixed ROM slots 27831.
                                if slot <> 27831 or instruction <> 17410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1026), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27832 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:91
//		AD	FP
// PORT: Fixed ROM slots 27832.
                                if slot <> 27832 or instruction <> 25399 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 823).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:92
//		TCF	FLATOUT2
// PORT: Fixed ROM slots 27833.
                                if slot <> 27833 or instruction <> 5313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 27840 {
                    if slot <= 27836 {
                        if slot <= 27834 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:93
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:94
//LOWFCOLD	CS	H*GHCR*T
// PORT: Fixed ROM slots 27834.
                            if slot <> 27834 or instruction <> 16473 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 89).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27835 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:95
//		AD	FCODD
// PORT: Fixed ROM slots 27835.
                                if slot <> 27835 or instruction <> 25397 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 821).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:96
//		EXTEND
// PORT: Fixed ROM slots 27836.
                                if slot <> 27836 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27838 {
                            if slot <= 27837 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:97
//		BZMF	DOPIF		# BRANCH IF FC < OR = HIGHCRIT
// PORT: Fixed ROM slots 27837.
                                if slot <> 27837 or instruction <> 25794 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25794, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:98
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:99
//		CA	FMAXPOS		# NO:  THROTTLE-UP
// PORT: Fixed ROM slots 27838.
                                if slot <> 27838 or instruction <> 13315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1027), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27839 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:100
//FLATOUT1	DXCH	FCODD
// PORT: Fixed ROM slots 27839.
                                if slot <> 27839 or instruction <> 22326 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 822, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:101
//		CA	FEXTRA
// PORT: Fixed ROM slots 27840.
                                if slot <> 27840 or instruction <> 14815 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27844 {
                        if slot <= 27842 {
                            if slot <= 27841 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:102
//FLATOUT2	TS	PIFPSET
// PORT: Fixed ROM slots 27841.
                                if slot <> 27841 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:103
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:104
//# NOTE 1	FC IS SET EQUAL TO FP SO PIF WILL BE ZERO.  THIS IS DESIRABLE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:105
//#		AS THERE IS ACTUALLY NO THROTTLE CHANGE.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:106
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:107
//# NOTE 2	HERE, SINCE WE ARE ABOUT TO RETURN TO THE THROTTLEABLE REGION
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:108
//#		(BELOW 55%) THE QUANTITY -(FMAXODD - FP) IS COMPUTED AND PUT
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:109
//#		INTO PIFPSET TO COMPENSATE FOR THE DIFFERENCE BETWEEN THE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:110
//#		NUMBER OF BITS CORRESPONDING TO FULL THROTTLE (FMAXODD) AND THE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:111
//#		NUMBER CORRESPONDING TO ACTUAL THRUST (FP).  THUS THE TOTAL
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:112
//#		THROTTLE COMMAND PIF = FC - FP - (FMAXODD - FP) = FC - FMAXODD.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:113
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:114
//DOPIF		TC	FASTCHNG
// PORT: Fixed ROM slots 27842.
                                if slot <> 27842 or instruction <> 2016 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2016, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27843 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:115
//		EXTEND
// PORT: Fixed ROM slots 27843.
                                if slot <> 27843 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:116
//		DCA	FCODD
// PORT: Fixed ROM slots 27844.
                                if slot <> 27844 or instruction <> 13110 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 822, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27846 {
                            if slot <= 27845 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:117
//		TS	FCOLD
// PORT: Fixed ROM slots 27845.
                                if slot <> 27845 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:118
//		DXCH	PIF
// PORT: Fixed ROM slots 27846.
                                if slot <> 27846 or instruction <> 22411 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 907, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27847 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:119
//		EXTEND
// PORT: Fixed ROM slots 27847.
                                if slot <> 27847 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:120
//# Page 795
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:121
//		DCS	FP
// PORT: Fixed ROM slots 27848.
                                if slot <> 27848 or instruction <> 17208 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 824, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 27877 {
            if slot <= 27862 {
                if slot <= 27855 {
                    if slot <= 27851 {
                        if slot <= 27849 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:122
//		DAS	PIF		# PIF = FC - FP, NEVER EQUALS +0
// PORT: Fixed ROM slots 27849.
                            if slot <> 27849 or instruction <> 9099 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 907) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27850 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:123
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:124
//DOIT		CA	PIF
// PORT: Fixed ROM slots 27850.
                                if slot <> 27850 or instruction <> 13194 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 906).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:125
//		AD	PIFPSET		# ADD IN PIFPSET, WITHOUT CHANGING PIF
// PORT: Fixed ROM slots 27851.
                                if slot <> 27851 or instruction <> 25478 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 902).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27853 {
                            if slot <= 27852 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:126
//		TS	PSEUDO55
// PORT: Fixed ROM slots 27852.
                                if slot <> 27852 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:127
//		TS	THRUST
// PORT: Fixed ROM slots 27853.
                                if slot <> 27853 or instruction <> 22573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22573, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27854 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:128
//		CAF	BIT4
// PORT: Fixed ROM slots 27854.
                                if slot <> 27854 or instruction <> 14824 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:129
//		EXTEND
// PORT: Fixed ROM slots 27855.
                                if slot <> 27855 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27858 {
                        if slot <= 27856 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:130
//		WOR	CHAN14
// PORT: Fixed ROM slots 27856.
                            if slot <> 27856 or instruction <> 2572 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27857 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:131
//		CA	TIME1
// PORT: Fixed ROM slots 27857.
                                if slot <> 27857 or instruction <> 12309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 21).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:132
//		TS	TTHROT
// PORT: Fixed ROM slots 27858.
                                if slot <> 27858 or instruction <> 23439 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23439, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27860 {
                            if slot <= 27859 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:133
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:134
//# SINCE /AF/ IS NOT AN INSTANTANEOUS ACCELERATION, BUT RATHER AN "AVERAGE" OF THE ACCELERATION LEVELS DURING
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:135
//# THE PRECEEDING PIPA INTERVAL, AND SINCE FP IS COMPUTED DIRECTLY FROM /AF/, FP IN ORDER TO CORRESPOND TO THE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:136
//# ACTUAL THRUST LEVEL AT THE END OF THE INTERVAL MUST BE WEIGHTED BY
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:137
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:138
//# 	          PIF(PPROCESS + TL)     PIF /PIF/
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:139
//#	FWEIGHT = ------------------ + -------------
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:140
//#		       PGUID           2 PGUID FRATE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:141
//#
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:142
//# WHERE PPROCESS IS THE TIME BETWEEN PIPA READING AND THE START OF THROTTLING, PGUID IS THE GUIDANCE PERIOD, AND
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:143
//# FRATE IS THE THROTTLING RATE (32 UNITS PER CENTISECOND).  PGUID IS EITHER 1 OR 2 SECONDS.  THE "TL" IN THE
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:144
//# FIRST TERM REPRESENTS THE ENGINE'S RESPONSE LAG.  HERE FWEIGHT IS COMPUTED FOR USE NEXT PASS.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:145
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:146
//		CA	THISTPIP +1		# INITIALIZE FWEIGHT COMP AS IF FOR P66
// PORT: Fixed ROM slots 27859.
                                if slot <> 27859 or instruction <> 13298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1010).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:147
//		TS	BUF
// PORT: Fixed ROM slots 27860.
                                if slot <> 27860 or instruction <> 22616 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27861 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:148
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:149
//		CS	MODREG			# ARE WE IN FACT IN P66?
// PORT: Fixed ROM slots 27861.
                                if slot <> 27861 or instruction <> 16905 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 521).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:150
//		AD	DEC66
// PORT: Fixed ROM slots 27862.
                                if slot <> 27862 or instruction <> 25921 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1345), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 27869 {
                    if slot <= 27865 {
                        if slot <= 27863 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:151
//		EXTEND
// PORT: Fixed ROM slots 27863.
                            if slot <> 27863 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27864 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:152
//		BZF	FWCOMP			# YES
// PORT: Fixed ROM slots 27864.
                                if slot <> 27864 or instruction <> 5341 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5341, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:153
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:154
//		CA	PIPTIME +1		# NO:  INITIALIZE FOR TWO SECOND PERIOD
// PORT: Fixed ROM slots 27865.
                                if slot <> 27865 or instruction <> 12957 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 669).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27867 {
                            if slot <= 27866 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:155
//		TS	BUF
// PORT: Fixed ROM slots 27866.
                                if slot <> 27866 or instruction <> 22616 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:156
//		CAF	4SECS
// PORT: Fixed ROM slots 27867.
                                if slot <> 27867 or instruction <> 14851 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27868 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:157
//		TCF	FWCOMP +1
// PORT: Fixed ROM slots 27868.
                                if slot <> 27868 or instruction <> 5342 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5342, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:158
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:159
//FWCOMP		CAF	2SECS
// PORT: Fixed ROM slots 27869.
                                if slot <> 27869 or instruction <> 14848 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27873 {
                        if slot <= 27871 {
                            if slot <= 27870 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:160
// +1		TS	Q
// PORT: Fixed ROM slots 27870.
                                if slot <> 27870 or instruction <> 22530 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:161
// 		EXTEND
// PORT: Fixed ROM slots 27871.
                                if slot <> 27871 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27872 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:162
//		MP	BIT6
// PORT: Fixed ROM slots 27872.
                                if slot <> 27872 or instruction <> 31206 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2534, readEffective:call(words, 2534)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:163
//		LXCH	BUF +1
// PORT: Fixed ROM slots 27873.
                                if slot <> 27873 or instruction <> 9305 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 89, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27875 {
                            if slot <= 27874 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:164
//		CS	BUF		# TIME OF LAST PIPA READING.
// PORT: Fixed ROM slots 27874.
                                if slot <> 27874 or instruction <> 16472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 88).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:165
//		AD	TIME1
// PORT: Fixed ROM slots 27875.
                                if slot <> 27875 or instruction <> 24597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 21).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27876 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:166
//		AD	THROTLAG	# COMPENSATE FOR ENGINE RESPONSE LAG
// PORT: Fixed ROM slots 27876.
                                if slot <> 27876 or instruction <> 25604 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1028), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:167
//		MASK	LOW8		# MAKE SURE SMALL AND POSITIVE
// PORT: Fixed ROM slots 27877.
                                if slot <> 27877 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 27892 {
                if slot <= 27884 {
                    if slot <= 27880 {
                        if slot <= 27878 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:168
//		ZL
// PORT: Fixed ROM slots 27878.
                            if slot <> 27878 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27879 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:169
//		EXTEND
// PORT: Fixed ROM slots 27879.
                                if slot <> 27879 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:170
//# Page 796
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:171
//		DV	Q
// PORT: Fixed ROM slots 27880.
                                if slot <> 27880 or instruction <> 4098 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 2, words[2]).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27882 {
                            if slot <= 27881 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:172
//		EXTEND
// PORT: Fixed ROM slots 27881.
                                if slot <> 27881 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:173
//		MP	PIF
// PORT: Fixed ROM slots 27882.
                                if slot <> 27882 or instruction <> 29578 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 906, readEffective:call(words, 906)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27883 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:174
//		DOUBLE
// PORT: Fixed ROM slots 27883.
                                if slot <> 27883 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:175
//		DXCH	FWEIGHT
// PORT: Fixed ROM slots 27884.
                                if slot <> 27884 or instruction <> 22409 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 905, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27888 {
                        if slot <= 27886 {
                            if slot <= 27885 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:176
//		CCS	PIF
// PORT: Fixed ROM slots 27885.
                                if slot <> 27885 or instruction <> 5002 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 906).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:177
//		AD	ONE
// PORT: Fixed ROM slots 27886.
                                if slot <> 27886 or instruction <> 27115 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27887 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:178
//		TCF	+2
// PORT: Fixed ROM slots 27887.
                                if slot <> 27887 or instruction <> 5361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:179
//		AD	ONE
// PORT: Fixed ROM slots 27888.
                                if slot <> 27888 or instruction <> 27115 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27890 {
                            if slot <= 27889 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:180
//		EXTEND
// PORT: Fixed ROM slots 27889.
                                if slot <> 27889 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:181
//		MP	PIF
// PORT: Fixed ROM slots 27890.
                                if slot <> 27890 or instruction <> 29578 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 906, readEffective:call(words, 906)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27891 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:182
//		EXTEND
// PORT: Fixed ROM slots 27891.
                                if slot <> 27891 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:183
//		DV	BUF +1
// PORT: Fixed ROM slots 27892.
                                if slot <> 27892 or instruction <> 4185 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 89, readEffective:call(words, 89)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 27899 {
                    if slot <= 27895 {
                        if slot <= 27893 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:184
//		ZL
// PORT: Fixed ROM slots 27893.
                            if slot <> 27893 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27894 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:185
//		DAS	FWEIGHT
// PORT: Fixed ROM slots 27894.
                                if slot <> 27894 or instruction <> 9097 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 905) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:186
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:187
//THDUMP		TC	RTNHOLD
// PORT: Fixed ROM slots 27895.
                                if slot <> 27895 or instruction <> 903 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 903, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27897 {
                            if slot <= 27896 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:188
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:189
//# FLATOUT THROTTLES UP THE DESCENT ENGINE, AND IS CALLED AS A BASIC SUBROUTINE.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:190
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:191
//FLATOUT		CAF	BIT13		# 4096 PULSES
// PORT: Fixed ROM slots 27896.
                                if slot <> 27896 or instruction <> 14815 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:192
//WHATOUT		TS	PIFPSET		# USE PIFPSET SO FWEIGHT WILL BE ZERO
// PORT: Fixed ROM slots 27897.
                                if slot <> 27897 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27898 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:193
//		CS	ZERO
// PORT: Fixed ROM slots 27898.
                                if slot <> 27898 or instruction <> 18925 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:194
//		TS	FCOLD
// PORT: Fixed ROM slots 27899.
                                if slot <> 27899 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 27903 {
                        if slot <= 27901 {
                            if slot <= 27900 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:195
//		TS	PIF
// PORT: Fixed ROM slots 27900.
                                if slot <> 27900 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:196
//		EXTEND
// PORT: Fixed ROM slots 27901.
                                if slot <> 27901 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27902 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:197
//		QXCH	RTNHOLD
// PORT: Fixed ROM slots 27902.
                                if slot <> 27902 or instruction <> 10119 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 903, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:198
//		TCF	DOIT
// PORT: Fixed ROM slots 27903.
                                if slot <> 27903 or instruction <> 5322 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5322, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 27905 {
                            if slot <= 27904 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:199
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:200
//# MASSMULT SCALES ACCELERATION, ARRIVING IN A AND L IN UNITS OF 2(-4) M/CS/CS, TO FORCE IN PULSE UNITS.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:201
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:202
//MASSMULT	EXTEND
// PORT: Fixed ROM slots 27904.
                                if slot <> 27904 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:203
//		QXCH	BUF
// PORT: Fixed ROM slots 27905.
                                if slot <> 27905 or instruction <> 9304 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 88, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27906 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:204
//		DXCH	MPAC
// PORT: Fixed ROM slots 27906.
                                if slot <> 27906 or instruction <> 21613 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:205
//		TC	DMP
// PORT: Fixed ROM slots 27907.
                                if slot <> 27907 or instruction <> 3651 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 3651, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1761] to agcAotUnit1761@.

agcAotInstallSourceRope(list(
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:206
//		ADRES	MASS
// PORT: Fixed ROM slots 27908.
    27908, 1352
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27909–27909.
function agcAotUnit1762 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:207
//		TC	DMP		# LEAVES PROPERLY SCALED FORCE IN MPAC
// PORT: Fixed ROM slots 27909.
    if slot <> 27909 or instruction <> 3651 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3651, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1762] to agcAotUnit1762@.

agcAotInstallSourceRope(list(
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:208
//		ADRES	SCALEFAC
// PORT: Fixed ROM slots 27910.
    27910, 2058
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27911–27918.
function agcAotUnit1763 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27914 {
        if slot <= 27912 {
            if slot <= 27911 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:209
//		TC	TPAGREE
// PORT: Fixed ROM slots 27911.
                if slot <> 27911 or instruction <> 3759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3759, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:210
//		CA	MPAC
// PORT: Fixed ROM slots 27912.
                if slot <> 27912 or instruction <> 12396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27913 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:211
//		EXTEND
// PORT: Fixed ROM slots 27913.
                if slot <> 27913 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:212
//		BZF	+3
// PORT: Fixed ROM slots 27914.
                if slot <> 27914 or instruction <> 5389 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5389, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27916 {
            if slot <= 27915 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:213
//		CAF	POSMAX
// PORT: Fixed ROM slots 27915.
                if slot <> 27915 or instruction <> 14811 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:214
//		TC	BUF
// PORT: Fixed ROM slots 27916.
                if slot <> 27916 or instruction <> 88 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 88, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27917 {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:215
//		DXCH	MPAC +1
// PORT: Fixed ROM slots 27917.
                if slot <> 27917 or instruction <> 21614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:216
//		TC	BUF
// PORT: Fixed ROM slots 27918.
                if slot <> 27918 or instruction <> 88 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 88, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1763] to agcAotUnit1763@.

agcAotInstallSourceRope(list(
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:217
//# Page 797
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:218
//# CONSTANTS:-
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:219
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:220
//FEXTRA		=	BIT13		# FEXT +5.13309020E+ 4
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:221
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:222
///AF/CNST	DEC	.13107
// PORT: Fixed ROM slots 27919.
    27919, 4294
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:223
//
// PORT: SOURCE THROTTLE_CONTROL_ROUTINES.agc:224
//# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
