// PORT: Original source unit RADAR_LEADIN_ROUTINES.agc.
// PORT: Physical bank 25. Shared continuation entries, slots 23555–23558.
function agcAotUnit1543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23556 {
        if slot <= 23555 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:2
//# Filename:	RADAR_LEADIN_ROUTINES.agc
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:9
//# Pages:	490-491
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:13
//#
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:22
//# actually created.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:23
//#
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:25
//#
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:28
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:29
//# Page 490
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:30
//		BANK	25
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:31
//		SETLOC	RRLEADIN
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:32
//		BANK
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:33
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:34
//		EBANK=	RSTACK
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:35
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:36
//# RADAR SAMPLING LOOP.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:37
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:38
//		COUNT*	$$/RLEAD
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:39
//RADSAMP		CCS	RSAMPDT		# TIMES NORMAL ONCE-PER-SECOND SAMPLING.
// PORT: Fixed ROM slots 23555.
            if slot <> 23555 or instruction <> 5101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 1005).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:40
//		TCF	+2
// PORT: Fixed ROM slots 23556.
            if slot <> 23556 or instruction <> 5126 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5126, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23557 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:41
//		TCF	TASKOVER	# +0 INSERTED MANUALLY TERMINATES TEST.
// PORT: Fixed ROM slots 23557.
            if slot <> 23557 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:42
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:43
//		TC	WAITLIST
// PORT: Fixed ROM slots 23558.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:44
//		EBANK=	RSTACK
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:45
//		2CADR	RADSAMP
// PORT: Fixed ROM slots 23559 23560.
    23559, 2054, 23560, 43112
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23561–23562.
function agcAotUnit1544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23561 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:46
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:47
//		CAF	PRIO25
// PORT: Fixed ROM slots 23561.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:48
//		TC	NOVAC
// PORT: Fixed ROM slots 23562.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:49
//		EBANK=	RSTACK
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:50
//		2CADR	DORSAMP
// PORT: Fixed ROM slots 23563 23564.
    23563, 2086, 23564, 43112
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23565–23572.
function agcAotUnit1545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23568 {
        if slot <= 23566 {
            if slot <= 23565 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:51
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:52
//		CAF	BIT14		# FOR CYCLIC SAMPLING, RTSTDEX =
// PORT: Fixed ROM slots 23565.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:53
//		EXTEND			# RTSTLOC/2 + RTSTBASE
// PORT: Fixed ROM slots 23566.
                if slot <> 23566 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23567 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:54
//		MP	RTSTLOC
// PORT: Fixed ROM slots 23567.
                if slot <> 23567 or instruction <> 29676 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1004, readEffective:call(words, 1004)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:55
//		AD	RTSTBASE	# 0 FOR RR, 2 FOR LR.
// PORT: Fixed ROM slots 23568.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:56
//		TS	RTSTDEX
// PORT: Fixed ROM slots 23569.
                if slot <> 23569 or instruction <> 23529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:57
//		TCF	TASKOVER
// PORT: Fixed ROM slots 23570.
                if slot <> 23570 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23571 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:58
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:59
//# DO THE ACTUAL RADAR SAMPLE.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:60
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:61
//DORSAMP		TC	VARADAR		# SELECTS VARIABLE RADAR CHANNEL.
// PORT: Fixed ROM slots 23571.
                if slot <> 23571 or instruction <> 1063 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1063, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:62
//		TC	BANKCALL
// PORT: Fixed ROM slots 23572.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:63
//		CADR	RADSTALL
// PORT: Fixed ROM slots 23573.
    23573, 16280
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23574–23581.
function agcAotUnit1546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23577 {
        if slot <= 23575 {
            if slot <= 23574 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:64
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:65
//		INCR	RFAILCNT	# ADVANCE FAIL COUNTER BUT ACCEPT BAD DATA
// PORT: Fixed ROM slots 23574.
                if slot <> 23574 or instruction <> 11246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 1006).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:66
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:67
//DORSAMP2	INHINT
// PORT: Fixed ROM slots 23575.
                if slot <> 23575 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23576 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:68
//		CA	FLAGWRD5	# DON'T UPDATE RSTACK IF IN R77.
// PORT: Fixed ROM slots 23576.
                if slot <> 23576 or instruction <> 12353 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:69
//		MASK	R77FLBIT
// PORT: Fixed ROM slots 23577.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:70
//		CCS	A
// PORT: Fixed ROM slots 23578.
                if slot <> 23578 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:71
//		TCF	+4
// PORT: Fixed ROM slots 23579.
                if slot <> 23579 or instruction <> 5151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5151, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23580 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:72
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:73
//		DXCH	SAMPLSUM
// PORT: Fixed ROM slots 23580.
                if slot <> 23580 or instruction <> 22082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 578, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:74
//		INDEX	RTSTLOC
// PORT: Fixed ROM slots 23581.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:75
//		DXCH	RSTACK
// PORT: Fixed ROM slots 23582.
    23582, 44802
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23583–23593.
function agcAotUnit1547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23587 {
        if slot <= 23584 {
            if slot <= 23583 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:76
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:77
//		CS	RTSTLOC		# CYCLE RTSTLOC.
// PORT: Fixed ROM slots 23583.
                if slot <> 23583 or instruction <> 17388 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 1004).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:78
//		AD	RTSTMAX
// PORT: Fixed ROM slots 23584.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:79
//		EXTEND
// PORT: Fixed ROM slots 23585.
                if slot <> 23585 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23586 {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:80
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:81
//# Page 491
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:82
//		BZF	+3
// PORT: Fixed ROM slots 23586.
                    if slot <> 23586 or instruction <> 5157 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5157, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:83
//		CA	RTSTLOC
// PORT: Fixed ROM slots 23587.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:84
//		AD	TWO		# STORAGE IS DP
// PORT: Fixed ROM slots 23588.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:85
//		TS	RTSTLOC
// PORT: Fixed ROM slots 23589.
                    if slot <> 23589 or instruction <> 23532 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23532, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:86
//		TCF	ENDOFJOB	# CONTINUOUS SAMPLING AND 2N TRIES - GONE.
// PORT: Fixed ROM slots 23590.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:87
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:88
//# VARIABLE RADAR DATA CALLER FOR ONE MEASUREMENT ONLY.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:89
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:90
//VARADAR		CAF	ONE		# WILL BE SENT TO RADAR ROUTINE IN A BY
// PORT: Fixed ROM slots 23591.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:91
//		TS	BUF2		# SWCALL.
// PORT: Fixed ROM slots 23592.
                    if slot <> 23592 or instruction <> 22619 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22619, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:92
//		INDEX	RTSTDEX
// PORT: Fixed ROM slots 23593.
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
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:93
//		CAF	RDRLOCS
// PORT: Fixed ROM slots 23594.
    23594, 26712
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23595–23595.
function agcAotUnit1548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:94
//		TCF	SWCALL		# NOT TOUCHING Q.
// PORT: Fixed ROM slots 23595.
    if slot <> 23595 or instruction <> 6546 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6546, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1548] to agcAotUnit1548@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:95
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:96
//RDRLOCS		CADR	RRRANGE		# =0
// PORT: Fixed ROM slots 23596.
    23596, 44170,
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:97
//		CADR	RRRDOT		# =1
// PORT: Fixed ROM slots 23597.
    23597, 44166,
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:98
//		CADR	LRVELX		# =2
// PORT: Fixed ROM slots 23598.
    23598, 44162,
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:99
//		CADR	LRVELY		# =3
// PORT: Fixed ROM slots 23599.
    23599, 44158,
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:100
//		CADR	LRVELZ		# =4
// PORT: Fixed ROM slots 23600.
    23600, 44154,
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:101
//		CADR	LRALT		# =5
// PORT: Fixed ROM slots 23601.
    23601, 44150
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:102
//
// PORT: SOURCE RADAR_LEADIN_ROUTINES.agc:103
//
