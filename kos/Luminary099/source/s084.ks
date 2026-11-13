// THROTTLE_CONTROL_ROUTINES.agc
// bank 31, slots 27790-27907
function agcAotUnit1761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27848 {
        if slot <= 27818 {
            if slot <= 27803 {
                if slot <= 27796 {
                    if slot <= 27792 {
                        if slot <= 27790 {
// THROTTLE_CONTROL_ROUTINES.agc:1
//# Copyright:	Public domain.
// THROTTLE_CONTROL_ROUTINES.agc:2
//# Filename:	THROTTLE_CONTROL_ROUTINES.agc
// THROTTLE_CONTROL_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// THROTTLE_CONTROL_ROUTINES.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// THROTTLE_CONTROL_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// THROTTLE_CONTROL_ROUTINES.agc:6
//# Assembler:	yaYUL
// THROTTLE_CONTROL_ROUTINES.agc:7
//# Contact:	HARTMUTH GUTSCHE <hgutsche@xplornet.com>.
// THROTTLE_CONTROL_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// THROTTLE_CONTROL_ROUTINES.agc:9
//# Pages:	793-797
// THROTTLE_CONTROL_ROUTINES.agc:10
//# Mod history:	2009-05-20 HG	Transcribed from page images.
// THROTTLE_CONTROL_ROUTINES.agc:11
//#
// THROTTLE_CONTROL_ROUTINES.agc:12
//# This source code has been transcribed or otherwise adapted from
// THROTTLE_CONTROL_ROUTINES.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// THROTTLE_CONTROL_ROUTINES.agc:14
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// THROTTLE_CONTROL_ROUTINES.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// THROTTLE_CONTROL_ROUTINES.agc:16
//# in storage size and consequent reduction in image quality as well) are
// THROTTLE_CONTROL_ROUTINES.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// THROTTLE_CONTROL_ROUTINES.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// THROTTLE_CONTROL_ROUTINES.agc:19
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// THROTTLE_CONTROL_ROUTINES.agc:20
//# actually created.
// THROTTLE_CONTROL_ROUTINES.agc:21
//#
// THROTTLE_CONTROL_ROUTINES.agc:22
//# Notations on the hardcopy document read, in part:
// THROTTLE_CONTROL_ROUTINES.agc:23
//#
// THROTTLE_CONTROL_ROUTINES.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// THROTTLE_CONTROL_ROUTINES.agc:25
//#	16:27 JULY 14, 1969
// THROTTLE_CONTROL_ROUTINES.agc:26
//
// THROTTLE_CONTROL_ROUTINES.agc:27
//# Page 793
// THROTTLE_CONTROL_ROUTINES.agc:28
//		BANK	31
// THROTTLE_CONTROL_ROUTINES.agc:29
//		SETLOC	FTHROT
// THROTTLE_CONTROL_ROUTINES.agc:30
//		BANK
// THROTTLE_CONTROL_ROUTINES.agc:31
//		EBANK=	PIF
// THROTTLE_CONTROL_ROUTINES.agc:32
//		COUNT*	$$/THROT
// THROTTLE_CONTROL_ROUTINES.agc:33
//
// THROTTLE_CONTROL_ROUTINES.agc:34
//# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// THROTTLE_CONTROL_ROUTINES.agc:35
//# HERE FC, DESIRED THRUST, AND FP, PRESENT THRUST, UNWEIGHTED, ARE COMPUTED.
// THROTTLE_CONTROL_ROUTINES.agc:36
//
// THROTTLE_CONTROL_ROUTINES.agc:37
//THROTTLE	CA	ABDELV		# COMPUTE PRESENT ACCELERATION IN UNITS OF
// slot 27790
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
// THROTTLE_CONTROL_ROUTINES.agc:38
//		EXTEND			# 2(-4) M/CS/CS, SAVING SERVICER TROUBLE
// slot 27791
                                if slot <> 27791 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:39
//		MP	/AF/CNST
// slot 27792
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
// THROTTLE_CONTROL_ROUTINES.agc:40
// +3		EXTEND
// slot 27793
                                if slot <> 27793 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:41
// 		QXCH	RTNHOLD
// slot 27794
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
// THROTTLE_CONTROL_ROUTINES.agc:42
//AFDUMP		TC	MASSMULT
// slot 27795
                                if slot <> 27795 or instruction <> 1280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:43
//		DXCH	FP		# FP = PRESENT THRUST
// slot 27796
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
// THROTTLE_CONTROL_ROUTINES.agc:44
//		EXTEND
// slot 27797
                            if slot <> 27797 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27798 {
// THROTTLE_CONTROL_ROUTINES.agc:45
//		DCA	/AFC/
// slot 27798
                                if slot <> 27798 or instruction <> 13108 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 820, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:46
//		TC	MASSMULT
// slot 27799
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
// THROTTLE_CONTROL_ROUTINES.agc:47
//		TS	FC		# FC = THRUST DESIRED BY GUIDANCE
// slot 27800
                                if slot <> 27800 or instruction <> 23437 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23437, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:48
//		DXCH	FCODD		# FCODD = WHAT IT IS GOING TO GET
// slot 27801
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
// THROTTLE_CONTROL_ROUTINES.agc:49
//
// THROTTLE_CONTROL_ROUTINES.agc:50
//# IF IT HAS BEEN LESS THAN 3 SECONDS SINCE THE LAST THROTTLING, AUGMENT FP USING THE FWEIGHT CALCULATED THEN.
// THROTTLE_CONTROL_ROUTINES.agc:51
//
// THROTTLE_CONTROL_ROUTINES.agc:52
//		CS	TTHROT		# THIS CODING ASSUMES A FLATOUT WITHIN
// slot 27802
                                if slot <> 27802 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:53
//		AD	TIME1		#   80 SECONDS BEFORE FIRST THROTTLE CALL
// slot 27803
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
// THROTTLE_CONTROL_ROUTINES.agc:54
//		MASK	POSMAX
// slot 27804
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
// THROTTLE_CONTROL_ROUTINES.agc:55
//		COM
// slot 27805
                                if slot <> 27805 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:56
//		AD	3SECS
// slot 27806
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
// THROTTLE_CONTROL_ROUTINES.agc:57
//		EXTEND
// slot 27807
                                if slot <> 27807 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:58
//		BZMF	WHERETO		# BRANCH IF (TIME1-TTHROT +1) > 3 SECONDS
// slot 27808
                                if slot <> 27808 or instruction <> 25764 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25764, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27809 {
// THROTTLE_CONTROL_ROUTINES.agc:59
//		EXTEND
// slot 27809
                                if slot <> 27809 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:60
//		DCA	FWEIGHT
// slot 27810
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
// THROTTLE_CONTROL_ROUTINES.agc:61
//		DAS	FP
// slot 27811
                                if slot <> 27811 or instruction <> 9016 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 824) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:62
//
// THROTTLE_CONTROL_ROUTINES.agc:63
//# THIS LOGIC DETERMINES THE THROTTLING IN THE REGION 10% - 94%.  THE MANUAL THROTTLE, NOMINALLY SET AT
// THROTTLE_CONTROL_ROUTINES.agc:64
//# MINIMUM BY JEB OR MISSION CONTROL PROGRAMS, PROVIDES THE LOWER BOUND.  A STOP IN THE THROTTLE HARDWARE
// THROTTLE_CONTROL_ROUTINES.agc:65
//# PROVIDES THE UPPER.
// THROTTLE_CONTROL_ROUTINES.agc:66
//
// THROTTLE_CONTROL_ROUTINES.agc:67
//WHERETO		CA	EBANK5		# INITIALIZE L*WCR*T AND H*GHCR*T FROM
// slot 27812
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
// THROTTLE_CONTROL_ROUTINES.agc:68
//		TS	EBANK		#   PAD LOADED ERASABLES IN W-MATRIX
// slot 27813
                                if slot <> 27813 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:69
//# Page 794
// THROTTLE_CONTROL_ROUTINES.agc:70
//		EBANK=	LOWCRIT
// THROTTLE_CONTROL_ROUTINES.agc:71
//		EXTEND
// slot 27814
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
// THROTTLE_CONTROL_ROUTINES.agc:72
//		DCA	LOWCRIT
// slot 27815
                                if slot <> 27815 or instruction <> 13127 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 839, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:73
//		DXCH	L*WCR*T
// slot 27816
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
// THROTTLE_CONTROL_ROUTINES.agc:74
//		CA	EBANK7
// slot 27817
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
// THROTTLE_CONTROL_ROUTINES.agc:75
//		TS	EBANK
// slot 27818
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
// THROTTLE_CONTROL_ROUTINES.agc:76
//		EBANK=	PIF
// THROTTLE_CONTROL_ROUTINES.agc:77
//		CS	ZERO		# INITIALIZE PIFPSET
// slot 27819
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
// THROTTLE_CONTROL_ROUTINES.agc:78
//		TS	PIFPSET
// slot 27820
                                if slot <> 27820 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:79
//		CS	H*GHCR*T
// slot 27821
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
// THROTTLE_CONTROL_ROUTINES.agc:80
//		AD	FCOLD
// slot 27822
                                if slot <> 27822 or instruction <> 25488 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 912).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:81
//		EXTEND
// slot 27823
                                if slot <> 27823 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27824 {
// THROTTLE_CONTROL_ROUTINES.agc:82
//		BZMF	LOWFCOLD	# BRANCH IF FCOLD < OR = HIGHCRIT
// slot 27824
                                if slot <> 27824 or instruction <> 25786 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25786, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:83
//		CS	L*WCR*T
// slot 27825
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
// THROTTLE_CONTROL_ROUTINES.agc:84
//		AD	FCODD
// slot 27826
                                if slot <> 27826 or instruction <> 25397 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 821).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:85
//		EXTEND
// slot 27827
                                if slot <> 27827 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27828 {
// THROTTLE_CONTROL_ROUTINES.agc:86
//		BZMF	FCOMPSET	# BRANCH IF FC < OR = LOWCRIT
// slot 27828
                                if slot <> 27828 or instruction <> 25783 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25783, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:87
//		CA	FP		# SEE NOTE 1
// slot 27829
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
// THROTTLE_CONTROL_ROUTINES.agc:88
//		TCF	FLATOUT1
// slot 27830
                                if slot <> 27830 or instruction <> 5311 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5311, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:89
//
// THROTTLE_CONTROL_ROUTINES.agc:90
//FCOMPSET	CS	FMAXODD		# SEE NOTE 2
// slot 27831
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
// THROTTLE_CONTROL_ROUTINES.agc:91
//		AD	FP
// slot 27832
                                if slot <> 27832 or instruction <> 25399 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 823).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:92
//		TCF	FLATOUT2
// slot 27833
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
// THROTTLE_CONTROL_ROUTINES.agc:93
//
// THROTTLE_CONTROL_ROUTINES.agc:94
//LOWFCOLD	CS	H*GHCR*T
// slot 27834
                            if slot <> 27834 or instruction <> 16473 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 89).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27835 {
// THROTTLE_CONTROL_ROUTINES.agc:95
//		AD	FCODD
// slot 27835
                                if slot <> 27835 or instruction <> 25397 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 821).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:96
//		EXTEND
// slot 27836
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
// THROTTLE_CONTROL_ROUTINES.agc:97
//		BZMF	DOPIF		# BRANCH IF FC < OR = HIGHCRIT
// slot 27837
                                if slot <> 27837 or instruction <> 25794 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25794, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:98
//
// THROTTLE_CONTROL_ROUTINES.agc:99
//		CA	FMAXPOS		# NO:  THROTTLE-UP
// slot 27838
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
// THROTTLE_CONTROL_ROUTINES.agc:100
//FLATOUT1	DXCH	FCODD
// slot 27839
                                if slot <> 27839 or instruction <> 22326 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 822, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:101
//		CA	FEXTRA
// slot 27840
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
// THROTTLE_CONTROL_ROUTINES.agc:102
//FLATOUT2	TS	PIFPSET
// slot 27841
                                if slot <> 27841 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:103
//
// THROTTLE_CONTROL_ROUTINES.agc:104
//# NOTE 1	FC IS SET EQUAL TO FP SO PIF WILL BE ZERO.  THIS IS DESIRABLE
// THROTTLE_CONTROL_ROUTINES.agc:105
//#		AS THERE IS ACTUALLY NO THROTTLE CHANGE.
// THROTTLE_CONTROL_ROUTINES.agc:106
//#
// THROTTLE_CONTROL_ROUTINES.agc:107
//# NOTE 2	HERE, SINCE WE ARE ABOUT TO RETURN TO THE THROTTLEABLE REGION
// THROTTLE_CONTROL_ROUTINES.agc:108
//#		(BELOW 55%) THE QUANTITY -(FMAXODD - FP) IS COMPUTED AND PUT
// THROTTLE_CONTROL_ROUTINES.agc:109
//#		INTO PIFPSET TO COMPENSATE FOR THE DIFFERENCE BETWEEN THE
// THROTTLE_CONTROL_ROUTINES.agc:110
//#		NUMBER OF BITS CORRESPONDING TO FULL THROTTLE (FMAXODD) AND THE
// THROTTLE_CONTROL_ROUTINES.agc:111
//#		NUMBER CORRESPONDING TO ACTUAL THRUST (FP).  THUS THE TOTAL
// THROTTLE_CONTROL_ROUTINES.agc:112
//#		THROTTLE COMMAND PIF = FC - FP - (FMAXODD - FP) = FC - FMAXODD.
// THROTTLE_CONTROL_ROUTINES.agc:113
//
// THROTTLE_CONTROL_ROUTINES.agc:114
//DOPIF		TC	FASTCHNG
// slot 27842
                                if slot <> 27842 or instruction <> 2016 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2016, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27843 {
// THROTTLE_CONTROL_ROUTINES.agc:115
//		EXTEND
// slot 27843
                                if slot <> 27843 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:116
//		DCA	FCODD
// slot 27844
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
// THROTTLE_CONTROL_ROUTINES.agc:117
//		TS	FCOLD
// slot 27845
                                if slot <> 27845 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:118
//		DXCH	PIF
// slot 27846
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
// THROTTLE_CONTROL_ROUTINES.agc:119
//		EXTEND
// slot 27847
                                if slot <> 27847 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:120
//# Page 795
// THROTTLE_CONTROL_ROUTINES.agc:121
//		DCS	FP
// slot 27848
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
// THROTTLE_CONTROL_ROUTINES.agc:122
//		DAS	PIF		# PIF = FC - FP, NEVER EQUALS +0
// slot 27849
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
// THROTTLE_CONTROL_ROUTINES.agc:123
//
// THROTTLE_CONTROL_ROUTINES.agc:124
//DOIT		CA	PIF
// slot 27850
                                if slot <> 27850 or instruction <> 13194 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 906).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:125
//		AD	PIFPSET		# ADD IN PIFPSET, WITHOUT CHANGING PIF
// slot 27851
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
// THROTTLE_CONTROL_ROUTINES.agc:126
//		TS	PSEUDO55
// slot 27852
                                if slot <> 27852 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:127
//		TS	THRUST
// slot 27853
                                if slot <> 27853 or instruction <> 22573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22573, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27854 {
// THROTTLE_CONTROL_ROUTINES.agc:128
//		CAF	BIT4
// slot 27854
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
// THROTTLE_CONTROL_ROUTINES.agc:129
//		EXTEND
// slot 27855
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
// THROTTLE_CONTROL_ROUTINES.agc:130
//		WOR	CHAN14
// slot 27856
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
// THROTTLE_CONTROL_ROUTINES.agc:131
//		CA	TIME1
// slot 27857
                                if slot <> 27857 or instruction <> 12309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 21).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:132
//		TS	TTHROT
// slot 27858
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
// THROTTLE_CONTROL_ROUTINES.agc:133
//
// THROTTLE_CONTROL_ROUTINES.agc:134
//# SINCE /AF/ IS NOT AN INSTANTANEOUS ACCELERATION, BUT RATHER AN "AVERAGE" OF THE ACCELERATION LEVELS DURING
// THROTTLE_CONTROL_ROUTINES.agc:135
//# THE PRECEEDING PIPA INTERVAL, AND SINCE FP IS COMPUTED DIRECTLY FROM /AF/, FP IN ORDER TO CORRESPOND TO THE
// THROTTLE_CONTROL_ROUTINES.agc:136
//# ACTUAL THRUST LEVEL AT THE END OF THE INTERVAL MUST BE WEIGHTED BY
// THROTTLE_CONTROL_ROUTINES.agc:137
//#
// THROTTLE_CONTROL_ROUTINES.agc:138
//# 	          PIF(PPROCESS + TL)     PIF /PIF/
// THROTTLE_CONTROL_ROUTINES.agc:139
//#	FWEIGHT = ------------------ + -------------
// THROTTLE_CONTROL_ROUTINES.agc:140
//#		       PGUID           2 PGUID FRATE
// THROTTLE_CONTROL_ROUTINES.agc:141
//#
// THROTTLE_CONTROL_ROUTINES.agc:142
//# WHERE PPROCESS IS THE TIME BETWEEN PIPA READING AND THE START OF THROTTLING, PGUID IS THE GUIDANCE PERIOD, AND
// THROTTLE_CONTROL_ROUTINES.agc:143
//# FRATE IS THE THROTTLING RATE (32 UNITS PER CENTISECOND).  PGUID IS EITHER 1 OR 2 SECONDS.  THE "TL" IN THE
// THROTTLE_CONTROL_ROUTINES.agc:144
//# FIRST TERM REPRESENTS THE ENGINE'S RESPONSE LAG.  HERE FWEIGHT IS COMPUTED FOR USE NEXT PASS.
// THROTTLE_CONTROL_ROUTINES.agc:145
//
// THROTTLE_CONTROL_ROUTINES.agc:146
//		CA	THISTPIP +1		# INITIALIZE FWEIGHT COMP AS IF FOR P66
// slot 27859
                                if slot <> 27859 or instruction <> 13298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1010).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:147
//		TS	BUF
// slot 27860
                                if slot <> 27860 or instruction <> 22616 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27861 {
// THROTTLE_CONTROL_ROUTINES.agc:148
//
// THROTTLE_CONTROL_ROUTINES.agc:149
//		CS	MODREG			# ARE WE IN FACT IN P66?
// slot 27861
                                if slot <> 27861 or instruction <> 16905 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 521).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:150
//		AD	DEC66
// slot 27862
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
// THROTTLE_CONTROL_ROUTINES.agc:151
//		EXTEND
// slot 27863
                            if slot <> 27863 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 27864 {
// THROTTLE_CONTROL_ROUTINES.agc:152
//		BZF	FWCOMP			# YES
// slot 27864
                                if slot <> 27864 or instruction <> 5341 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5341, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:153
//
// THROTTLE_CONTROL_ROUTINES.agc:154
//		CA	PIPTIME +1		# NO:  INITIALIZE FOR TWO SECOND PERIOD
// slot 27865
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
// THROTTLE_CONTROL_ROUTINES.agc:155
//		TS	BUF
// slot 27866
                                if slot <> 27866 or instruction <> 22616 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:156
//		CAF	4SECS
// slot 27867
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
// THROTTLE_CONTROL_ROUTINES.agc:157
//		TCF	FWCOMP +1
// slot 27868
                                if slot <> 27868 or instruction <> 5342 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5342, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:158
//
// THROTTLE_CONTROL_ROUTINES.agc:159
//FWCOMP		CAF	2SECS
// slot 27869
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
// THROTTLE_CONTROL_ROUTINES.agc:160
// +1		TS	Q
// slot 27870
                                if slot <> 27870 or instruction <> 22530 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:161
// 		EXTEND
// slot 27871
                                if slot <> 27871 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27872 {
// THROTTLE_CONTROL_ROUTINES.agc:162
//		MP	BIT6
// slot 27872
                                if slot <> 27872 or instruction <> 31206 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2534, readEffective:call(words, 2534)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:163
//		LXCH	BUF +1
// slot 27873
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
// THROTTLE_CONTROL_ROUTINES.agc:164
//		CS	BUF		# TIME OF LAST PIPA READING.
// slot 27874
                                if slot <> 27874 or instruction <> 16472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 88).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:165
//		AD	TIME1
// slot 27875
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
// THROTTLE_CONTROL_ROUTINES.agc:166
//		AD	THROTLAG	# COMPENSATE FOR ENGINE RESPONSE LAG
// slot 27876
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
// THROTTLE_CONTROL_ROUTINES.agc:167
//		MASK	LOW8		# MAKE SURE SMALL AND POSITIVE
// slot 27877
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
// THROTTLE_CONTROL_ROUTINES.agc:168
//		ZL
// slot 27878
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
// THROTTLE_CONTROL_ROUTINES.agc:169
//		EXTEND
// slot 27879
                                if slot <> 27879 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:170
//# Page 796
// THROTTLE_CONTROL_ROUTINES.agc:171
//		DV	Q
// slot 27880
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
// THROTTLE_CONTROL_ROUTINES.agc:172
//		EXTEND
// slot 27881
                                if slot <> 27881 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:173
//		MP	PIF
// slot 27882
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
// THROTTLE_CONTROL_ROUTINES.agc:174
//		DOUBLE
// slot 27883
                                if slot <> 27883 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:175
//		DXCH	FWEIGHT
// slot 27884
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
// THROTTLE_CONTROL_ROUTINES.agc:176
//		CCS	PIF
// slot 27885
                                if slot <> 27885 or instruction <> 5002 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 906).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:177
//		AD	ONE
// slot 27886
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
// THROTTLE_CONTROL_ROUTINES.agc:178
//		TCF	+2
// slot 27887
                                if slot <> 27887 or instruction <> 5361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:179
//		AD	ONE
// slot 27888
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
// THROTTLE_CONTROL_ROUTINES.agc:180
//		EXTEND
// slot 27889
                                if slot <> 27889 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:181
//		MP	PIF
// slot 27890
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
// THROTTLE_CONTROL_ROUTINES.agc:182
//		EXTEND
// slot 27891
                                if slot <> 27891 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:183
//		DV	BUF +1
// slot 27892
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
// THROTTLE_CONTROL_ROUTINES.agc:184
//		ZL
// slot 27893
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
// THROTTLE_CONTROL_ROUTINES.agc:185
//		DAS	FWEIGHT
// slot 27894
                                if slot <> 27894 or instruction <> 9097 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 905) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:186
//
// THROTTLE_CONTROL_ROUTINES.agc:187
//THDUMP		TC	RTNHOLD
// slot 27895
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
// THROTTLE_CONTROL_ROUTINES.agc:188
//
// THROTTLE_CONTROL_ROUTINES.agc:189
//# FLATOUT THROTTLES UP THE DESCENT ENGINE, AND IS CALLED AS A BASIC SUBROUTINE.
// THROTTLE_CONTROL_ROUTINES.agc:190
//
// THROTTLE_CONTROL_ROUTINES.agc:191
//FLATOUT		CAF	BIT13		# 4096 PULSES
// slot 27896
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
// THROTTLE_CONTROL_ROUTINES.agc:192
//WHATOUT		TS	PIFPSET		# USE PIFPSET SO FWEIGHT WILL BE ZERO
// slot 27897
                                if slot <> 27897 or instruction <> 23430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27898 {
// THROTTLE_CONTROL_ROUTINES.agc:193
//		CS	ZERO
// slot 27898
                                if slot <> 27898 or instruction <> 18925 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:194
//		TS	FCOLD
// slot 27899
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
// THROTTLE_CONTROL_ROUTINES.agc:195
//		TS	PIF
// slot 27900
                                if slot <> 27900 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:196
//		EXTEND
// slot 27901
                                if slot <> 27901 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 27902 {
// THROTTLE_CONTROL_ROUTINES.agc:197
//		QXCH	RTNHOLD
// slot 27902
                                if slot <> 27902 or instruction <> 10119 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 903, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:198
//		TCF	DOIT
// slot 27903
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
// THROTTLE_CONTROL_ROUTINES.agc:199
//
// THROTTLE_CONTROL_ROUTINES.agc:200
//# MASSMULT SCALES ACCELERATION, ARRIVING IN A AND L IN UNITS OF 2(-4) M/CS/CS, TO FORCE IN PULSE UNITS.
// THROTTLE_CONTROL_ROUTINES.agc:201
//
// THROTTLE_CONTROL_ROUTINES.agc:202
//MASSMULT	EXTEND
// slot 27904
                                if slot <> 27904 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:203
//		QXCH	BUF
// slot 27905
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
// THROTTLE_CONTROL_ROUTINES.agc:204
//		DXCH	MPAC
// slot 27906
                                if slot <> 27906 or instruction <> 21613 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// THROTTLE_CONTROL_ROUTINES.agc:205
//		TC	DMP
// slot 27907
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
// THROTTLE_CONTROL_ROUTINES.agc:206
//		ADRES	MASS
// slot 27908
    27908, 1352
)).

// bank 31, slots 27909-27909
function agcAotUnit1762 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THROTTLE_CONTROL_ROUTINES.agc:207
//		TC	DMP		# LEAVES PROPERLY SCALED FORCE IN MPAC
// slot 27909
    if slot <> 27909 or instruction <> 3651 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3651, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1762] to agcAotUnit1762@.

agcAotInstallSourceRope(list(
// THROTTLE_CONTROL_ROUTINES.agc:208
//		ADRES	SCALEFAC
// slot 27910
    27910, 2058
)).

// bank 31, slots 27911-27918
function agcAotUnit1763 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27914 {
        if slot <= 27912 {
            if slot <= 27911 {
// THROTTLE_CONTROL_ROUTINES.agc:209
//		TC	TPAGREE
// slot 27911
                if slot <> 27911 or instruction <> 3759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3759, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// THROTTLE_CONTROL_ROUTINES.agc:210
//		CA	MPAC
// slot 27912
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
// THROTTLE_CONTROL_ROUTINES.agc:211
//		EXTEND
// slot 27913
                if slot <> 27913 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// THROTTLE_CONTROL_ROUTINES.agc:212
//		BZF	+3
// slot 27914
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
// THROTTLE_CONTROL_ROUTINES.agc:213
//		CAF	POSMAX
// slot 27915
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
// THROTTLE_CONTROL_ROUTINES.agc:214
//		TC	BUF
// slot 27916
                if slot <> 27916 or instruction <> 88 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 88, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27917 {
// THROTTLE_CONTROL_ROUTINES.agc:215
//		DXCH	MPAC +1
// slot 27917
                if slot <> 27917 or instruction <> 21614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// THROTTLE_CONTROL_ROUTINES.agc:216
//		TC	BUF
// slot 27918
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
// THROTTLE_CONTROL_ROUTINES.agc:217
//# Page 797
// THROTTLE_CONTROL_ROUTINES.agc:218
//# CONSTANTS:-
// THROTTLE_CONTROL_ROUTINES.agc:219
//
// THROTTLE_CONTROL_ROUTINES.agc:220
//FEXTRA		=	BIT13		# FEXT +5.13309020E+ 4
// THROTTLE_CONTROL_ROUTINES.agc:221
//
// THROTTLE_CONTROL_ROUTINES.agc:222
///AF/CNST	DEC	.13107
// slot 27919
    27919, 4294
)).

// no code for the lines below
// THROTTLE_CONTROL_ROUTINES.agc:223
//
// THROTTLE_CONTROL_ROUTINES.agc:224
//# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
