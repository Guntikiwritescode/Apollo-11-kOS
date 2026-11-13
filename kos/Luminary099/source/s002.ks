// PORT: Original source unit ALARM_AND_ABORT.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4983–4986.
function agcAotUnit230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4984 {
        if slot <= 4983 {
// PORT: SOURCE ALARM_AND_ABORT.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE ALARM_AND_ABORT.agc:2
//# Filename:	ALARM_AND_ABORT.agc
// PORT: SOURCE ALARM_AND_ABORT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE ALARM_AND_ABORT.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE ALARM_AND_ABORT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE ALARM_AND_ABORT.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE ALARM_AND_ABORT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE ALARM_AND_ABORT.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE ALARM_AND_ABORT.agc:9
//# Pages:	1381-1385
// PORT: SOURCE ALARM_AND_ABORT.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE ALARM_AND_ABORT.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE ALARM_AND_ABORT.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE ALARM_AND_ABORT.agc:13
//#		2009-06-05 RSB	Fixed a type.
// PORT: SOURCE ALARM_AND_ABORT.agc:14
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE ALARM_AND_ABORT.agc:15
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE ALARM_AND_ABORT.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE ALARM_AND_ABORT.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE ALARM_AND_ABORT.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE ALARM_AND_ABORT.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE ALARM_AND_ABORT.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE ALARM_AND_ABORT.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE ALARM_AND_ABORT.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE ALARM_AND_ABORT.agc:24
//# actually created.
// PORT: SOURCE ALARM_AND_ABORT.agc:25
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE ALARM_AND_ABORT.agc:27
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE ALARM_AND_ABORT.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE ALARM_AND_ABORT.agc:30
//
// PORT: SOURCE ALARM_AND_ABORT.agc:31
//# Page 1381
// PORT: SOURCE ALARM_AND_ABORT.agc:32
//# THE FOLLOWING SUBROUTINE MAY BE CALLED TO DISPLAY A NON-ABORTIVE ALARM CONDITION.  IT MAY BE CALLED
// PORT: SOURCE ALARM_AND_ABORT.agc:33
//# EITHER IN INTERRUPT OR UNDER EXECUTIVE CONTROL.
// PORT: SOURCE ALARM_AND_ABORT.agc:34
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:35
//# CALLING SEQUENCE IS AS FOLLOWS:
// PORT: SOURCE ALARM_AND_ABORT.agc:36
//#		TC	ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:37
//#		OCT	AAANN		# ALARM NO. NN IN GENERAL AREA AAA.
// PORT: SOURCE ALARM_AND_ABORT.agc:38
//#					# (RETURNS HERE)
// PORT: SOURCE ALARM_AND_ABORT.agc:39
//
// PORT: SOURCE ALARM_AND_ABORT.agc:40
//		BLOCK	02
// PORT: SOURCE ALARM_AND_ABORT.agc:41
//		SETLOC	FFTAG7
// PORT: SOURCE ALARM_AND_ABORT.agc:42
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:43
//
// PORT: SOURCE ALARM_AND_ABORT.agc:44
//		EBANK=	FAILREG
// PORT: SOURCE ALARM_AND_ABORT.agc:45
//
// PORT: SOURCE ALARM_AND_ABORT.agc:46
//		COUNT*	$$/ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:47
//
// PORT: SOURCE ALARM_AND_ABORT.agc:48
//# ALARM TURNS ON THE PROGRAM ALARM LIGHT, BUT DOES NOT DISPLAY.
// PORT: SOURCE ALARM_AND_ABORT.agc:49
//
// PORT: SOURCE ALARM_AND_ABORT.agc:50
//ALARM		INHINT
// PORT: Fixed ROM slots 4983.
            if slot <> 4983 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:51
//
// PORT: SOURCE ALARM_AND_ABORT.agc:52
//		CA	Q
// PORT: Fixed ROM slots 4984.
            if slot <> 4984 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4985 {
// PORT: SOURCE ALARM_AND_ABORT.agc:53
//ALARM2		TS	ALMCADR
// PORT: Fixed ROM slots 4985.
            if slot <> 4985 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:54
//		INDEX	Q
// PORT: Fixed ROM slots 4986.
            if slot <> 4986 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[230] to agcAotUnit230@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:55
//		CA	0
// PORT: Fixed ROM slots 4987.
    4987, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4988–5014.
function agcAotUnit231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5000 {
        if slot <= 4993 {
            if slot <= 4990 {
                if slot <= 4988 {
// PORT: SOURCE ALARM_AND_ABORT.agc:56
//BORTENT		TS	L
// PORT: Fixed ROM slots 4988.
                    if slot <> 4988 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4989 {
// PORT: SOURCE ALARM_AND_ABORT.agc:57
//
// PORT: SOURCE ALARM_AND_ABORT.agc:58
//PRIOENT		CA	BBANK
// PORT: Fixed ROM slots 4989.
                        if slot <> 4989 or instruction <> 12294 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 6).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:59
// +1		EXTEND
// PORT: Fixed ROM slots 4990.
                        if slot <> 4990 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4991 {
// PORT: SOURCE ALARM_AND_ABORT.agc:60
//		ROR	SUPERBNK	# ADD SUPER BITS.
// PORT: Fixed ROM slots 4991.
                    if slot <> 4991 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4992 {
// PORT: SOURCE ALARM_AND_ABORT.agc:61
//		TS	ALMCADR +1
// PORT: Fixed ROM slots 4992.
                        if slot <> 4992 or instruction <> 23284 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23284, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:62
//
// PORT: SOURCE ALARM_AND_ABORT.agc:63
//LARMENT		CA	Q		# STORE RETURN FOR ALARM
// PORT: Fixed ROM slots 4993.
                        if slot <> 4993 or instruction <> 12290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4996 {
                if slot <= 4994 {
// PORT: SOURCE ALARM_AND_ABORT.agc:64
//		TS	ITEMP1
// PORT: Fixed ROM slots 4994.
                    if slot <> 4994 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4995 {
// PORT: SOURCE ALARM_AND_ABORT.agc:65
//
// PORT: SOURCE ALARM_AND_ABORT.agc:66
//CHKFAIL1	CCS	FAILREG		# IS ANYTHING IN FAILREG
// PORT: Fixed ROM slots 4995.
                        if slot <> 4995 or instruction <> 4349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 253).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:67
//		TCF	CHKFAIL2	# YES TRY NEXT REG
// PORT: Fixed ROM slots 4996.
                        if slot <> 4996 or instruction <> 7047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4998 {
                    if slot <= 4997 {
// PORT: SOURCE ALARM_AND_ABORT.agc:68
//		LXCH	FAILREG
// PORT: Fixed ROM slots 4997.
                        if slot <> 4997 or instruction <> 9469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 253, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:69
//		TCF	PROGLARM	# TURN ALARM LIGHT ON FOR FIRST ALARM
// PORT: Fixed ROM slots 4998.
                        if slot <> 4998 or instruction <> 7057 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7057, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4999 {
// PORT: SOURCE ALARM_AND_ABORT.agc:70
//
// PORT: SOURCE ALARM_AND_ABORT.agc:71
//CHKFAIL2	CCS	FAILREG +1
// PORT: Fixed ROM slots 4999.
                        if slot <> 4999 or instruction <> 4350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 254).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:72
//		TCF	FAIL3
// PORT: Fixed ROM slots 5000.
                        if slot <> 5000 or instruction <> 7051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7051, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 5007 {
            if slot <= 5003 {
                if slot <= 5001 {
// PORT: SOURCE ALARM_AND_ABORT.agc:73
//		LXCH	FAILREG +1
// PORT: Fixed ROM slots 5001.
                    if slot <> 5001 or instruction <> 9470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 254, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5002 {
// PORT: SOURCE ALARM_AND_ABORT.agc:74
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5002.
                        if slot <> 5002 or instruction <> 7060 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7060, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:75
//
// PORT: SOURCE ALARM_AND_ABORT.agc:76
//FAIL3		CA	FAILREG +2
// PORT: Fixed ROM slots 5003.
                        if slot <> 5003 or instruction <> 12543 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 255).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5005 {
                    if slot <= 5004 {
// PORT: SOURCE ALARM_AND_ABORT.agc:77
//		MASK	POSMAX
// PORT: Fixed ROM slots 5004.
                        if slot <> 5004 or instruction <> 31195 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE ALARM_AND_ABORT.agc:78
//		CCS	A
// PORT: Fixed ROM slots 5005.
                        if slot <> 5005 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5006 {
// PORT: SOURCE ALARM_AND_ABORT.agc:79
//		TCF	MULTFAIL
// PORT: Fixed ROM slots 5006.
                        if slot <> 5006 or instruction <> 7064 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7064, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:80
//		LXCH	FAILREG +2
// PORT: Fixed ROM slots 5007.
                        if slot <> 5007 or instruction <> 9471 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 255, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 5010 {
                if slot <= 5008 {
// PORT: SOURCE ALARM_AND_ABORT.agc:81
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5008.
                    if slot <> 5008 or instruction <> 7060 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7060, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5009 {
// PORT: SOURCE ALARM_AND_ABORT.agc:82
//
// PORT: SOURCE ALARM_AND_ABORT.agc:83
//# Page 1382
// PORT: SOURCE ALARM_AND_ABORT.agc:84
//
// PORT: SOURCE ALARM_AND_ABORT.agc:85
//PROGLARM	CS	DSPTAB +11D
// PORT: Fixed ROM slots 5009.
                        if slot <> 5009 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:86
//		MASK	OCT40400
// PORT: Fixed ROM slots 5010.
                        if slot <> 5010 or instruction <> 31650 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2978), 32768).
                            if fixedOperand = 16640 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256 + mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5012 {
                    if slot <= 5011 {
// PORT: SOURCE ALARM_AND_ABORT.agc:87
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 5011.
                        if slot <> 5011 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:88
//
// PORT: SOURCE ALARM_AND_ABORT.agc:89
//
// PORT: SOURCE ALARM_AND_ABORT.agc:90
//MULTEXIT	XCH	ITEMP1		# OBTAIN RETURN ADDRESS IN A
// PORT: Fixed ROM slots 5012.
                        if slot <> 5012 or instruction <> 23601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 49, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5013 {
// PORT: SOURCE ALARM_AND_ABORT.agc:91
//		RELINT
// PORT: Fixed ROM slots 5013.
                        if slot <> 5013 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:92
//		INDEX	A
// PORT: Fixed ROM slots 5014.
                        if slot <> 5014 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[231] to agcAotUnit231@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:93
//		TC	1
// PORT: Fixed ROM slots 5015.
    5015, 2
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5016–5019.
function agcAotUnit232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5017 {
        if slot <= 5016 {
// PORT: SOURCE ALARM_AND_ABORT.agc:94
//
// PORT: SOURCE ALARM_AND_ABORT.agc:95
//MULTFAIL	CA	L
// PORT: Fixed ROM slots 5016.
            if slot <> 5016 or instruction <> 12289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:96
//		AD	BIT15
// PORT: Fixed ROM slots 5017.
            if slot <> 5017 or instruction <> 27101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5018 {
// PORT: SOURCE ALARM_AND_ABORT.agc:97
//		TS	FAILREG +2
// PORT: Fixed ROM slots 5018.
            if slot <> 5018 or instruction <> 22783 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22783, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:98
//
// PORT: SOURCE ALARM_AND_ABORT.agc:99
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5019.
            if slot <> 5019 or instruction <> 7060 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7060, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[232] to agcAotUnit232@.

// PORT: Physical bank 10. Shared continuation entries, slots 11122–11127.
function agcAotUnit719 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11124 {
        if slot <= 11122 {
// PORT: SOURCE ALARM_AND_ABORT.agc:100
//
// PORT: SOURCE ALARM_AND_ABORT.agc:101
//# PRIOLARM DISPLAYS V05N09 VIA PRIODSPR WITH 3 RETURNS TO THE USER FROM THE ASTRONAUT AT CALL LOC +1,+2,+3 AND
// PORT: SOURCE ALARM_AND_ABORT.agc:102
//# AN IMMEDIATE RETURN TO THE USER AT CALL LOC +4.  EXAMPLE FOLLOWS,
// PORT: SOURCE ALARM_AND_ABORT.agc:103
//#		CAF	OCTXX		# ALARM CODE
// PORT: SOURCE ALARM_AND_ABORT.agc:104
//#		TC	BANKCALL
// PORT: SOURCE ALARM_AND_ABORT.agc:105
//#		CADR	PRIOLARM
// PORT: SOURCE ALARM_AND_ABORT.agc:106
//#		...	...
// PORT: SOURCE ALARM_AND_ABORT.agc:107
//#		...	...
// PORT: SOURCE ALARM_AND_ABORT.agc:108
//#		...	...		# ASTRONAUT RETURN
// PORT: SOURCE ALARM_AND_ABORT.agc:109
//#		TC	PHASCHNG	# IMMEDIATE RETURN TO USER.  RESTART
// PORT: SOURCE ALARM_AND_ABORT.agc:110
//#		OCT	X.1		# PHASE CHANGE FOR PRIO DISPLAY
// PORT: SOURCE ALARM_AND_ABORT.agc:111
//
// PORT: SOURCE ALARM_AND_ABORT.agc:112
//		BANK	10
// PORT: SOURCE ALARM_AND_ABORT.agc:113
//		SETLOC	DISPLAYS
// PORT: SOURCE ALARM_AND_ABORT.agc:114
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:115
//
// PORT: SOURCE ALARM_AND_ABORT.agc:116
//		COUNT*	$$/DSPLA
// PORT: SOURCE ALARM_AND_ABORT.agc:117
//PRIOLARM	INHINT			# * * * KEEP IN DISPLAY ROUTINES BANK
// PORT: Fixed ROM slots 11122.
            if slot <> 11122 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11123 {
// PORT: SOURCE ALARM_AND_ABORT.agc:118
//		TS	L		# SAVE ALARM CODE
// PORT: Fixed ROM slots 11123.
                if slot <> 11123 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:119
//
// PORT: SOURCE ALARM_AND_ABORT.agc:120
//		CA	BUF2		# 2 CADR OF PRIOLARM USER
// PORT: Fixed ROM slots 11124.
                if slot <> 11124 or instruction <> 12379 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 11125 {
// PORT: SOURCE ALARM_AND_ABORT.agc:121
//		TS	ALMCADR
// PORT: Fixed ROM slots 11125.
            if slot <> 11125 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11126 {
// PORT: SOURCE ALARM_AND_ABORT.agc:122
//		CA	BUF2 +1
// PORT: Fixed ROM slots 11126.
                if slot <> 11126 or instruction <> 12380 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 92).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:123
//		TC	PRIOENT +1	# * LEAVE L ALONE
// PORT: Fixed ROM slots 11127.
                if slot <> 11127 or instruction <> 2942 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2942, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[719] to agcAotUnit719@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:124
//-2SEC		DEC	-200		# *** DONT MOVE
// PORT: Fixed ROM slots 11128.
    11128, 65134
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11129–11130.
function agcAotUnit720 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11129 {
// PORT: SOURCE ALARM_AND_ABORT.agc:125
//		CAF	V05N09
// PORT: Fixed ROM slots 11129.
        if slot <> 11129 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:126
//		TCF	PRIODSPR
// PORT: Fixed ROM slots 11130.
        if slot <> 11130 or instruction <> 5444 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5444, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[720] to agcAotUnit720@.

// PORT: Physical bank 02. Shared continuation entries, slots 5020–5023.
function agcAotUnit233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5021 {
        if slot <= 5020 {
// PORT: SOURCE ALARM_AND_ABORT.agc:127
//
// PORT: SOURCE ALARM_AND_ABORT.agc:128
//		BLOCK	02
// PORT: SOURCE ALARM_AND_ABORT.agc:129
//		SETLOC	FFTAG7
// PORT: SOURCE ALARM_AND_ABORT.agc:130
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:131
//
// PORT: SOURCE ALARM_AND_ABORT.agc:132
//		COUNT*	$$/ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:133
//BAILOUT		INHINT
// PORT: Fixed ROM slots 5020.
            if slot <> 5020 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:134
//		CA	Q
// PORT: Fixed ROM slots 5021.
            if slot <> 5021 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5022 {
// PORT: SOURCE ALARM_AND_ABORT.agc:135
//# Page 1383
// PORT: SOURCE ALARM_AND_ABORT.agc:136
//		TS	ALMCADR
// PORT: Fixed ROM slots 5022.
            if slot <> 5022 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:137
//
// PORT: SOURCE ALARM_AND_ABORT.agc:138
//		INDEX	Q
// PORT: Fixed ROM slots 5023.
            if slot <> 5023 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[233] to agcAotUnit233@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:139
//		CAF	0
// PORT: Fixed ROM slots 5024.
    5024, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5025–5025.
function agcAotUnit234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:140
//		TC	BORTENT
// PORT: Fixed ROM slots 5025.
    if slot <> 5025 or instruction <> 2940 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2940, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[234] to agcAotUnit234@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:141
//OCT40400	OCT	40400
// PORT: Fixed ROM slots 5026.
    5026, 33280
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5027–5032.
function agcAotUnit235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5029 {
        if slot <= 5027 {
// PORT: SOURCE ALARM_AND_ABORT.agc:142
//
// PORT: SOURCE ALARM_AND_ABORT.agc:143
//		INHINT
// PORT: Fixed ROM slots 5027.
            if slot <> 5027 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5028 {
// PORT: SOURCE ALARM_AND_ABORT.agc:144
//WHIMPER		CA	TWO
// PORT: Fixed ROM slots 5028.
                if slot <> 5028 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:145
//		AD	Z
// PORT: Fixed ROM slots 5029.
                if slot <> 5029 or instruction <> 24581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 5).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5030 {
// PORT: SOURCE ALARM_AND_ABORT.agc:146
//		TS	BRUPT
// PORT: Fixed ROM slots 5030.
            if slot <> 5030 or instruction <> 22543 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22543, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5031 {
// PORT: SOURCE ALARM_AND_ABORT.agc:147
//		RESUME
// PORT: Fixed ROM slots 5031.
                if slot <> 5031 or instruction <> 20495 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20495, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:148
//		TC	POSTJUMP	# RESUME SENDS CONTROL HERE
// PORT: Fixed ROM slots 5032.
                if slot <> 5032 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[235] to agcAotUnit235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:149
//		CADR	ENEMA
// PORT: Fixed ROM slots 5033.
    5033, 11242
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5034–5037.
function agcAotUnit236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5035 {
        if slot <= 5034 {
// PORT: SOURCE ALARM_AND_ABORT.agc:150
//POODOO		INHINT
// PORT: Fixed ROM slots 5034.
            if slot <> 5034 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:151
//		CA	Q
// PORT: Fixed ROM slots 5035.
            if slot <> 5035 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5036 {
// PORT: SOURCE ALARM_AND_ABORT.agc:152
//ABORT2		TS	ALMCADR
// PORT: Fixed ROM slots 5036.
            if slot <> 5036 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:153
//		INDEX	Q
// PORT: Fixed ROM slots 5037.
            if slot <> 5037 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[236] to agcAotUnit236@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:154
//		CAF	0
// PORT: Fixed ROM slots 5038.
    5038, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5039–5039.
function agcAotUnit237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:155
//		TC	BORTENT
// PORT: Fixed ROM slots 5039.
    if slot <> 5039 or instruction <> 2940 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2940, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[237] to agcAotUnit237@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:156
//OCT77770	OCT	77770		# DON'T MOVE
// PORT: Fixed ROM slots 5040.
    5040, 65520
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5041–5046.
function agcAotUnit238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5043 {
        if slot <= 5041 {
// PORT: SOURCE ALARM_AND_ABORT.agc:157
//
// PORT: SOURCE ALARM_AND_ABORT.agc:158
//		CAF	OCT35		# 4.35SPOT FOR GOPOODOO
// PORT: Fixed ROM slots 5041.
            if slot <> 5041 or instruction <> 14837 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2549), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5042 {
// PORT: SOURCE ALARM_AND_ABORT.agc:159
//		TS	L
// PORT: Fixed ROM slots 5042.
                if slot <> 5042 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:160
//		COM
// PORT: Fixed ROM slots 5043.
                if slot <> 5043 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5044 {
// PORT: SOURCE ALARM_AND_ABORT.agc:161
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 5044.
            if slot <> 5044 or instruction <> 22001 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5045 {
// PORT: SOURCE ALARM_AND_ABORT.agc:162
//GOPOODOO	INHINT
// PORT: Fixed ROM slots 5045.
                if slot <> 5045 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:163
//		TC	BANKCALL	# RESET STATEFLG, REINTFLG, AND NODOFLAG.
// PORT: Fixed ROM slots 5046.
                if slot <> 5046 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[238] to agcAotUnit238@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:164
//		CADR	FLAGS
// PORT: Fixed ROM slots 5047.
    5047, 24538
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5048–5052.
function agcAotUnit239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5049 {
        if slot <= 5048 {
// PORT: SOURCE ALARM_AND_ABORT.agc:165
//		CA	FLAGWRD7	# IS SERVICER CURRENTLY IN OPERATION?
// PORT: Fixed ROM slots 5048.
            if slot <> 5048 or instruction <> 12355 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 67).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:166
//		MASK	V37FLBIT
// PORT: Fixed ROM slots 5049.
            if slot <> 5049 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 5050 {
// PORT: SOURCE ALARM_AND_ABORT.agc:167
//		CCS	A
// PORT: Fixed ROM slots 5050.
            if slot <> 5050 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5051 {
// PORT: SOURCE ALARM_AND_ABORT.agc:168
//		TCF	STRTIDLE
// PORT: Fixed ROM slots 5051.
                if slot <> 5051 or instruction <> 7105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:169
//		TC	BANKCALL	# TERMINATE GRPS 1, 3, 5, AND 6
// PORT: Fixed ROM slots 5052.
                if slot <> 5052 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[239] to agcAotUnit239@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:170
//		CADR	V37KLEAN
// PORT: Fixed ROM slots 5053.
    5053, 11092
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5054–5054.
function agcAotUnit240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:171
//		TC	BANKCALL	# TERMINATE GRPS 2, 4, 1, 3, 5, AND 6
// PORT: Fixed ROM slots 5054.
    if slot <> 5054 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[240] to agcAotUnit240@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:172
//		CADR	MR.KLEAN	#	(I.E., GRP 4 LAST)
// PORT: Fixed ROM slots 5055.
    5055, 11078
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5056–5059.
function agcAotUnit241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5057 {
        if slot <= 5056 {
// PORT: SOURCE ALARM_AND_ABORT.agc:173
//		TCF	WHIMPER
// PORT: Fixed ROM slots 5056.
            if slot <> 5056 or instruction <> 7076 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7076, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:174
//STRTIDLE	CAF	BBSERVDL
// PORT: Fixed ROM slots 5057.
            if slot <> 5057 or instruction <> 15331 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3043), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5058 {
// PORT: SOURCE ALARM_AND_ABORT.agc:175
//		TC	SUPERSW
// PORT: Fixed ROM slots 5058.
            if slot <> 5058 or instruction <> 2519 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2519, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:176
//		TC	BANKCALL	# PUT SERVICER INTO ITS "GROUND" STATE
// PORT: Fixed ROM slots 5059.
            if slot <> 5059 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[241] to agcAotUnit241@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:177
//		CADR	SERVIDLE	# AND PROCED TO GOTOPOOH.
// PORT: Fixed ROM slots 5060.
    5060, 48546
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5061–5063.
function agcAotUnit242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5061 {
// PORT: SOURCE ALARM_AND_ABORT.agc:178
//CCSHOLE		INHINT
// PORT: Fixed ROM slots 5061.
        if slot <> 5061 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5062 {
// PORT: SOURCE ALARM_AND_ABORT.agc:179
//		CA	Q
// PORT: Fixed ROM slots 5062.
            if slot <> 5062 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:180
//		TC	ABORT2
// PORT: Fixed ROM slots 5063.
            if slot <> 5063 or instruction <> 2988 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2988, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[242] to agcAotUnit242@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:181
//OCT1103		OCT	1103
// PORT: Fixed ROM slots 5064.
    5064, 1158
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5065–5067.
function agcAotUnit243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5065 {
// PORT: SOURCE ALARM_AND_ABORT.agc:182
//CURTAINS	INHINT
// PORT: Fixed ROM slots 5065.
        if slot <> 5065 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5066 {
// PORT: SOURCE ALARM_AND_ABORT.agc:183
//		CA	Q
// PORT: Fixed ROM slots 5066.
            if slot <> 5066 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:184
//		TC	ALARM2
// PORT: Fixed ROM slots 5067.
            if slot <> 5067 or instruction <> 2937 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2937, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[243] to agcAotUnit243@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:185
//OCT217		OCT	00217
// PORT: Fixed ROM slots 5068.
    5068, 286
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5069–5074.
function agcAotUnit244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5071 {
        if slot <= 5069 {
// PORT: SOURCE ALARM_AND_ABORT.agc:186
//# Page 1384
// PORT: SOURCE ALARM_AND_ABORT.agc:187
//		TC	ALMCADR		# RETURN TO USER
// PORT: Fixed ROM slots 5069.
            if slot <> 5069 or instruction <> 755 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 755, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5070 {
// PORT: SOURCE ALARM_AND_ABORT.agc:188
//
// PORT: SOURCE ALARM_AND_ABORT.agc:189
//BAILOUT1	INHINT
// PORT: Fixed ROM slots 5070.
                if slot <> 5070 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:190
//		DXCH	ALMCADR
// PORT: Fixed ROM slots 5071.
                if slot <> 5071 or instruction <> 22260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 756, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5072 {
// PORT: SOURCE ALARM_AND_ABORT.agc:191
//		CAF	ADR40400
// PORT: Fixed ROM slots 5072.
            if slot <> 5072 or instruction <> 15330 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3042), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5073 {
// PORT: SOURCE ALARM_AND_ABORT.agc:192
//BOTHABRT	TS	ITEMP1
// PORT: Fixed ROM slots 5073.
                if slot <> 5073 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:193
//		INDEX	Q
// PORT: Fixed ROM slots 5074.
                if slot <> 5074 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[244] to agcAotUnit244@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:194
//		CAF	0
// PORT: Fixed ROM slots 5075.
    5075, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5076–5085.
function agcAotUnit245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5080 {
        if slot <= 5077 {
            if slot <= 5076 {
// PORT: SOURCE ALARM_AND_ABORT.agc:195
//		TS	L
// PORT: Fixed ROM slots 5076.
                if slot <> 5076 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:196
//		TCF	CHKFAIL1
// PORT: Fixed ROM slots 5077.
                if slot <> 5077 or instruction <> 7043 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7043, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5078 {
// PORT: SOURCE ALARM_AND_ABORT.agc:197
//POODOO1		INHINT
// PORT: Fixed ROM slots 5078.
                if slot <> 5078 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 5079 {
// PORT: SOURCE ALARM_AND_ABORT.agc:198
//		DXCH	ALMCADR
// PORT: Fixed ROM slots 5079.
                    if slot <> 5079 or instruction <> 22260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 756, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:199
//		CAF	ADR77770
// PORT: Fixed ROM slots 5080.
                    if slot <> 5080 or instruction <> 15329 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3041), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 5082 {
            if slot <= 5081 {
// PORT: SOURCE ALARM_AND_ABORT.agc:200
//		TCF	BOTHABRT
// PORT: Fixed ROM slots 5081.
                if slot <> 5081 or instruction <> 7121 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7121, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:201
//
// PORT: SOURCE ALARM_AND_ABORT.agc:202
//ALARM1		INHINT
// PORT: Fixed ROM slots 5082.
                if slot <> 5082 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5083 {
// PORT: SOURCE ALARM_AND_ABORT.agc:203
//		DXCH	ALMCADR
// PORT: Fixed ROM slots 5083.
                if slot <> 5083 or instruction <> 22260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 756, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 5084 {
// PORT: SOURCE ALARM_AND_ABORT.agc:204
//ALMNCADR	INHINT
// PORT: Fixed ROM slots 5084.
                    if slot <> 5084 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:205
//		INDEX	Q
// PORT: Fixed ROM slots 5085.
                    if slot <> 5085 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[245] to agcAotUnit245@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:206
//		CA	0
// PORT: Fixed ROM slots 5086.
    5086, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5087–5090.
function agcAotUnit246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5088 {
        if slot <= 5087 {
// PORT: SOURCE ALARM_AND_ABORT.agc:207
//		TS	L
// PORT: Fixed ROM slots 5087.
            if slot <> 5087 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:208
//		TCF	LARMENT
// PORT: Fixed ROM slots 5088.
            if slot <> 5088 or instruction <> 7041 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7041, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5089 {
// PORT: SOURCE ALARM_AND_ABORT.agc:209
//
// PORT: SOURCE ALARM_AND_ABORT.agc:210
//ADR77770	TCF	OCT77770
// PORT: Fixed ROM slots 5089.
            if slot <> 5089 or instruction <> 7088 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7088, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:211
//ADR40400	TCF	OCT40400
// PORT: Fixed ROM slots 5090.
            if slot <> 5090 or instruction <> 7074 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7074, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[246] to agcAotUnit246@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:212
//DOALARM		EQUALS	ENDOFJOB
// PORT: SOURCE ALARM_AND_ABORT.agc:213
//		EBANK=	DVCNTR
// PORT: SOURCE ALARM_AND_ABORT.agc:214
//BBSERVDL	BBCON	SERVIDLE
// PORT: Fixed ROM slots 5091.
    5091, 47214
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5092–5096.
function agcAotUnit247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5093 {
        if slot <= 5092 {
// PORT: SOURCE ALARM_AND_ABORT.agc:215
//
// PORT: SOURCE ALARM_AND_ABORT.agc:216
//# CALLING SEQUENCE FOR VARALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:217
//#		CAF	(ALARM)
// PORT: SOURCE ALARM_AND_ABORT.agc:218
//#		TC	VARALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:219
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:220
//# VARALARM TURNS ON PROGRAM ALARM LIGHT BUT DOES NOT DISPLAY
// PORT: SOURCE ALARM_AND_ABORT.agc:221
//
// PORT: SOURCE ALARM_AND_ABORT.agc:222
//VARALARM	INHINT
// PORT: Fixed ROM slots 5092.
            if slot <> 5092 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:223
//
// PORT: SOURCE ALARM_AND_ABORT.agc:224
//		TS	L		# SAVE USERS ALARM CODE
// PORT: Fixed ROM slots 5093.
            if slot <> 5093 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5094 {
// PORT: SOURCE ALARM_AND_ABORT.agc:225
//
// PORT: SOURCE ALARM_AND_ABORT.agc:226
//		CA	Q		# SAVE USERS Q
// PORT: Fixed ROM slots 5094.
            if slot <> 5094 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5095 {
// PORT: SOURCE ALARM_AND_ABORT.agc:227
//		TS	ALMCADR
// PORT: Fixed ROM slots 5095.
                if slot <> 5095 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:228
//
// PORT: SOURCE ALARM_AND_ABORT.agc:229
//		TC	PRIOENT
// PORT: Fixed ROM slots 5096.
                if slot <> 5096 or instruction <> 2941 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2941, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[247] to agcAotUnit247@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:230
//OCT14		OCT	14		# DONT MOVE
// PORT: Fixed ROM slots 5097.
    5097, 24
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5098–5098.
function agcAotUnit248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:231
//
// PORT: SOURCE ALARM_AND_ABORT.agc:232
//		TC	ALMCADR		# RETURN TO USER
// PORT: Fixed ROM slots 5098.
    if slot <> 5098 or instruction <> 755 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 755, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[248] to agcAotUnit248@.

// PORT: Physical bank 13. Shared continuation entries, slots 14317–14326.
function agcAotUnit798 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14321 {
        if slot <= 14318 {
            if slot <= 14317 {
// PORT: SOURCE ALARM_AND_ABORT.agc:233
//
// PORT: SOURCE ALARM_AND_ABORT.agc:234
//ABORT		EQUALS	WHIMPER
// PORT: SOURCE ALARM_AND_ABORT.agc:235
//		BANK	13
// PORT: SOURCE ALARM_AND_ABORT.agc:236
//		SETLOC	ABTFLGS
// PORT: SOURCE ALARM_AND_ABORT.agc:237
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:238
//# Page 1385
// PORT: SOURCE ALARM_AND_ABORT.agc:239
//		COUNT*	$$/ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:240
//
// PORT: SOURCE ALARM_AND_ABORT.agc:241
//FLAGS		CS	STATEBIT
// PORT: Fixed ROM slots 14317.
                if slot <> 14317 or instruction <> 18919 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:242
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 14318.
                if slot <> 14318 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14319 {
// PORT: SOURCE ALARM_AND_ABORT.agc:243
//		TS	FLAGWRD3
// PORT: Fixed ROM slots 14319.
                if slot <> 14319 or instruction <> 22591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22591, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14320 {
// PORT: SOURCE ALARM_AND_ABORT.agc:244
//		CS	REINTBIT
// PORT: Fixed ROM slots 14320.
                    if slot <> 14320 or instruction <> 18917 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:245
//		MASK	FLGWRD10
// PORT: Fixed ROM slots 14321.
                    if slot <> 14321 or instruction <> 28742 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 70).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14323 {
            if slot <= 14322 {
// PORT: SOURCE ALARM_AND_ABORT.agc:246
//		TS	FLGWRD10
// PORT: Fixed ROM slots 14322.
                if slot <> 14322 or instruction <> 22598 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22598, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:247
//		CS	NODOBIT
// PORT: Fixed ROM slots 14323.
                if slot <> 14323 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14324 {
// PORT: SOURCE ALARM_AND_ABORT.agc:248
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 14324.
                if slot <> 14324 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14325 {
// PORT: SOURCE ALARM_AND_ABORT.agc:249
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 14325.
                    if slot <> 14325 or instruction <> 22590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22590, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:250
//		TC	Q
// PORT: Fixed ROM slots 14326.
                    if slot <> 14326 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[798] to agcAotUnit798@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE ALARM_AND_ABORT.agc:251
//
