// RADAR_LEADIN_ROUTINES.agc
// bank 25, slots 23555-23558
function agcAotUnit1543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23556 {
        if slot <= 23555 {
// RADAR_LEADIN_ROUTINES.agc:1
//# Copyright:	Public domain.
// RADAR_LEADIN_ROUTINES.agc:2
//# Filename:	RADAR_LEADIN_ROUTINES.agc
// RADAR_LEADIN_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// RADAR_LEADIN_ROUTINES.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// RADAR_LEADIN_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RADAR_LEADIN_ROUTINES.agc:6
//# Assembler:	yaYUL
// RADAR_LEADIN_ROUTINES.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// RADAR_LEADIN_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// RADAR_LEADIN_ROUTINES.agc:9
//# Pages:	490-491
// RADAR_LEADIN_ROUTINES.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// RADAR_LEADIN_ROUTINES.agc:11
//#				Luminary131 file, using page
// RADAR_LEADIN_ROUTINES.agc:12
//#				images from Luminary 1A.
// RADAR_LEADIN_ROUTINES.agc:13
//#
// RADAR_LEADIN_ROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from
// RADAR_LEADIN_ROUTINES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// RADAR_LEADIN_ROUTINES.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// RADAR_LEADIN_ROUTINES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// RADAR_LEADIN_ROUTINES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// RADAR_LEADIN_ROUTINES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// RADAR_LEADIN_ROUTINES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// RADAR_LEADIN_ROUTINES.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// RADAR_LEADIN_ROUTINES.agc:22
//# actually created.
// RADAR_LEADIN_ROUTINES.agc:23
//#
// RADAR_LEADIN_ROUTINES.agc:24
//# Notations on the hardcopy document read, in part:
// RADAR_LEADIN_ROUTINES.agc:25
//#
// RADAR_LEADIN_ROUTINES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// RADAR_LEADIN_ROUTINES.agc:27
//#	16:27 JULY 14, 1969
// RADAR_LEADIN_ROUTINES.agc:28
//
// RADAR_LEADIN_ROUTINES.agc:29
//# Page 490
// RADAR_LEADIN_ROUTINES.agc:30
//		BANK	25
// RADAR_LEADIN_ROUTINES.agc:31
//		SETLOC	RRLEADIN
// RADAR_LEADIN_ROUTINES.agc:32
//		BANK
// RADAR_LEADIN_ROUTINES.agc:33
//
// RADAR_LEADIN_ROUTINES.agc:34
//		EBANK=	RSTACK
// RADAR_LEADIN_ROUTINES.agc:35
//
// RADAR_LEADIN_ROUTINES.agc:36
//# RADAR SAMPLING LOOP.
// RADAR_LEADIN_ROUTINES.agc:37
//
// RADAR_LEADIN_ROUTINES.agc:38
//		COUNT*	$$/RLEAD
// RADAR_LEADIN_ROUTINES.agc:39
//RADSAMP		CCS	RSAMPDT		# TIMES NORMAL ONCE-PER-SECOND SAMPLING.
// slot 23555
            if slot <> 23555 or instruction <> 5101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 1005).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RADAR_LEADIN_ROUTINES.agc:40
//		TCF	+2
// slot 23556
            if slot <> 23556 or instruction <> 5126 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5126, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23557 {
// RADAR_LEADIN_ROUTINES.agc:41
//		TCF	TASKOVER	# +0 INSERTED MANUALLY TERMINATES TEST.
// slot 23557
            if slot <> 23557 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RADAR_LEADIN_ROUTINES.agc:42
//
// RADAR_LEADIN_ROUTINES.agc:43
//		TC	WAITLIST
// slot 23558
            if slot <> 23558 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1543] to agcAotUnit1543@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:44
//		EBANK=	RSTACK
// RADAR_LEADIN_ROUTINES.agc:45
//		2CADR	RADSAMP
// slot 23559 23560
    23559, 2054, 23560, 43112
)).

// bank 25, slots 23561-23562
function agcAotUnit1544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23561 {
// RADAR_LEADIN_ROUTINES.agc:46
//
// RADAR_LEADIN_ROUTINES.agc:47
//		CAF	PRIO25
// slot 23561
        if slot <> 23561 or instruction <> 16331 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4043), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// RADAR_LEADIN_ROUTINES.agc:48
//		TC	NOVAC
// slot 23562
        if slot <> 23562 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1544] to agcAotUnit1544@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:49
//		EBANK=	RSTACK
// RADAR_LEADIN_ROUTINES.agc:50
//		2CADR	DORSAMP
// slot 23563 23564
    23563, 2086, 23564, 43112
)).

// bank 25, slots 23565-23572
function agcAotUnit1545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23568 {
        if slot <= 23566 {
            if slot <= 23565 {
// RADAR_LEADIN_ROUTINES.agc:51
//
// RADAR_LEADIN_ROUTINES.agc:52
//		CAF	BIT14		# FOR CYCLIC SAMPLING, RTSTDEX =
// slot 23565
                if slot <> 23565 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:53
//		EXTEND			# RTSTLOC/2 + RTSTBASE
// slot 23566
                if slot <> 23566 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23567 {
// RADAR_LEADIN_ROUTINES.agc:54
//		MP	RTSTLOC
// slot 23567
                if slot <> 23567 or instruction <> 29676 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1004, readEffective:call(words, 1004)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:55
//		AD	RTSTBASE	# 0 FOR RR, 2 FOR LR.
// slot 23568
                if slot <> 23568 or instruction <> 25579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1003).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23570 {
            if slot <= 23569 {
// RADAR_LEADIN_ROUTINES.agc:56
//		TS	RTSTDEX
// slot 23569
                if slot <> 23569 or instruction <> 23529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:57
//		TCF	TASKOVER
// slot 23570
                if slot <> 23570 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23571 {
// RADAR_LEADIN_ROUTINES.agc:58
//
// RADAR_LEADIN_ROUTINES.agc:59
//# DO THE ACTUAL RADAR SAMPLE.
// RADAR_LEADIN_ROUTINES.agc:60
//
// RADAR_LEADIN_ROUTINES.agc:61
//DORSAMP		TC	VARADAR		# SELECTS VARIABLE RADAR CHANNEL.
// slot 23571
                if slot <> 23571 or instruction <> 1063 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1063, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:62
//		TC	BANKCALL
// slot 23572
                if slot <> 23572 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1545] to agcAotUnit1545@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:63
//		CADR	RADSTALL
// slot 23573
    23573, 16280
)).

// bank 25, slots 23574-23581
function agcAotUnit1546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23577 {
        if slot <= 23575 {
            if slot <= 23574 {
// RADAR_LEADIN_ROUTINES.agc:64
//
// RADAR_LEADIN_ROUTINES.agc:65
//		INCR	RFAILCNT	# ADVANCE FAIL COUNTER BUT ACCEPT BAD DATA
// slot 23574
                if slot <> 23574 or instruction <> 11246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 1006).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:66
//
// RADAR_LEADIN_ROUTINES.agc:67
//DORSAMP2	INHINT
// slot 23575
                if slot <> 23575 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23576 {
// RADAR_LEADIN_ROUTINES.agc:68
//		CA	FLAGWRD5	# DON'T UPDATE RSTACK IF IN R77.
// slot 23576
                if slot <> 23576 or instruction <> 12353 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:69
//		MASK	R77FLBIT
// slot 23577
                if slot <> 23577 or instruction <> 31201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    if fixedOperand = 1024 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23579 {
            if slot <= 23578 {
// RADAR_LEADIN_ROUTINES.agc:70
//		CCS	A
// slot 23578
                if slot <> 23578 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:71
//		TCF	+4
// slot 23579
                if slot <> 23579 or instruction <> 5151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5151, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23580 {
// RADAR_LEADIN_ROUTINES.agc:72
//
// RADAR_LEADIN_ROUTINES.agc:73
//		DXCH	SAMPLSUM
// slot 23580
                if slot <> 23580 or instruction <> 22082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 578, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:74
//		INDEX	RTSTLOC
// slot 23581
                if slot <> 23581 or instruction <> 21484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21484, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21484, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1546] to agcAotUnit1546@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:75
//		DXCH	RSTACK
// slot 23582
    23582, 44802
)).

// bank 25, slots 23583-23593
function agcAotUnit1547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23587 {
        if slot <= 23584 {
            if slot <= 23583 {
// RADAR_LEADIN_ROUTINES.agc:76
//
// RADAR_LEADIN_ROUTINES.agc:77
//		CS	RTSTLOC		# CYCLE RTSTLOC.
// slot 23583
                if slot <> 23583 or instruction <> 17388 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 1004).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RADAR_LEADIN_ROUTINES.agc:78
//		AD	RTSTMAX
// slot 23584
                if slot <> 23584 or instruction <> 25578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23585 {
// RADAR_LEADIN_ROUTINES.agc:79
//		EXTEND
// slot 23585
                if slot <> 23585 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23586 {
// RADAR_LEADIN_ROUTINES.agc:80
//
// RADAR_LEADIN_ROUTINES.agc:81
//# Page 491
// RADAR_LEADIN_ROUTINES.agc:82
//		BZF	+3
// slot 23586
                    if slot <> 23586 or instruction <> 5157 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5157, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RADAR_LEADIN_ROUTINES.agc:83
//		CA	RTSTLOC
// slot 23587
                    if slot <> 23587 or instruction <> 13292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1004).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23590 {
            if slot <= 23588 {
// RADAR_LEADIN_ROUTINES.agc:84
//		AD	TWO		# STORAGE IS DP
// slot 23588
                if slot <> 23588 or instruction <> 27114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23589 {
// RADAR_LEADIN_ROUTINES.agc:85
//		TS	RTSTLOC
// slot 23589
                    if slot <> 23589 or instruction <> 23532 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23532, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RADAR_LEADIN_ROUTINES.agc:86
//		TCF	ENDOFJOB	# CONTINUOUS SAMPLING AND 2N TRIES - GONE.
// slot 23590
                    if slot <> 23590 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23591 {
// RADAR_LEADIN_ROUTINES.agc:87
//
// RADAR_LEADIN_ROUTINES.agc:88
//# VARIABLE RADAR DATA CALLER FOR ONE MEASUREMENT ONLY.
// RADAR_LEADIN_ROUTINES.agc:89
//
// RADAR_LEADIN_ROUTINES.agc:90
//VARADAR		CAF	ONE		# WILL BE SENT TO RADAR ROUTINE IN A BY
// slot 23591
                if slot <> 23591 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23592 {
// RADAR_LEADIN_ROUTINES.agc:91
//		TS	BUF2		# SWCALL.
// slot 23592
                    if slot <> 23592 or instruction <> 22619 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22619, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RADAR_LEADIN_ROUTINES.agc:92
//		INDEX	RTSTDEX
// slot 23593
                    if slot <> 23593 or instruction <> 21481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21481, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1547] to agcAotUnit1547@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:93
//		CAF	RDRLOCS
// slot 23594
    23594, 26712
)).

// bank 25, slots 23595-23595
function agcAotUnit1548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RADAR_LEADIN_ROUTINES.agc:94
//		TCF	SWCALL		# NOT TOUCHING Q.
// slot 23595
    if slot <> 23595 or instruction <> 6546 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6546, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1548] to agcAotUnit1548@.

agcAotInstallSourceRope(list(
// RADAR_LEADIN_ROUTINES.agc:95
//
// RADAR_LEADIN_ROUTINES.agc:96
//RDRLOCS		CADR	RRRANGE		# =0
// slot 23596
    23596, 44170,
// RADAR_LEADIN_ROUTINES.agc:97
//		CADR	RRRDOT		# =1
// slot 23597
    23597, 44166,
// RADAR_LEADIN_ROUTINES.agc:98
//		CADR	LRVELX		# =2
// slot 23598
    23598, 44162,
// RADAR_LEADIN_ROUTINES.agc:99
//		CADR	LRVELY		# =3
// slot 23599
    23599, 44158,
// RADAR_LEADIN_ROUTINES.agc:100
//		CADR	LRVELZ		# =4
// slot 23600
    23600, 44154,
// RADAR_LEADIN_ROUTINES.agc:101
//		CADR	LRALT		# =5
// slot 23601
    23601, 44150
)).

// no code for the lines below
// RADAR_LEADIN_ROUTINES.agc:102
//
// RADAR_LEADIN_ROUTINES.agc:103
//
