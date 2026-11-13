// ALARM_AND_ABORT.agc
// bank 02, slots 5032-5035
function agcAotUnit230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5033 {
        if slot <= 5032 {
// ALARM_AND_ABORT.agc:1
//# Copyright:    Public domain.
// ALARM_AND_ABORT.agc:2
//# Filename:     ALARM_AND_ABORT.agc
// ALARM_AND_ABORT.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// ALARM_AND_ABORT.agc:4
//#               is part of the source code for the Command Module's
// ALARM_AND_ABORT.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// ALARM_AND_ABORT.agc:6
//# Assembler:    yaYUL
// ALARM_AND_ABORT.agc:7
//# Reference:    pp. 1493-1496
// ALARM_AND_ABORT.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// ALARM_AND_ABORT.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// ALARM_AND_ABORT.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249 file of the same
// ALARM_AND_ABORT.agc:11
//#				name, and page images. Corrected various
// ALARM_AND_ABORT.agc:12
//#				typos in the transcription of program
// ALARM_AND_ABORT.agc:13
//#				comments, and these should be back-ported
// ALARM_AND_ABORT.agc:14
//#				to Colossus249.
// ALARM_AND_ABORT.agc:15
//#
// ALARM_AND_ABORT.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// ALARM_AND_ABORT.agc:17
//# from scanned documents.
// ALARM_AND_ABORT.agc:18
//#
// ALARM_AND_ABORT.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// ALARM_AND_ABORT.agc:20
//#       2021113-051.  April 1, 1969.
// ALARM_AND_ABORT.agc:21
//#
// ALARM_AND_ABORT.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// ALARM_AND_ABORT.agc:23
//#
// ALARM_AND_ABORT.agc:24
//#       Prepared by
// ALARM_AND_ABORT.agc:25
//#                       Massachusetts Institute of Technology
// ALARM_AND_ABORT.agc:26
//#                       75 Cambridge Parkway
// ALARM_AND_ABORT.agc:27
//#                       Cambridge, Massachusetts
// ALARM_AND_ABORT.agc:28
//#
// ALARM_AND_ABORT.agc:29
//#       under NASA contract NAS 9-4065.
// ALARM_AND_ABORT.agc:30
//#
// ALARM_AND_ABORT.agc:31
//# Refer directly to the online document mentioned above for further
// ALARM_AND_ABORT.agc:32
//# information.  Please report any errors to info@sandroid.org.
// ALARM_AND_ABORT.agc:33
//
// ALARM_AND_ABORT.agc:34
//# Page 1493
// ALARM_AND_ABORT.agc:35
//# 	THE FOLLOWING SUBROUTINE MAY BE CALLED TO DISPLAY A NON-ABORTIVE ALARM CONDITION. IT MAY BE CALLED
// ALARM_AND_ABORT.agc:36
//# EITHER IN INTERRUPT OR UNDER EXECUTIVE CONTROL.
// ALARM_AND_ABORT.agc:37
//#
// ALARM_AND_ABORT.agc:38
//# 	CALLING SEQUENCE IS AS FOLLOWS:
// ALARM_AND_ABORT.agc:39
//#
// ALARM_AND_ABORT.agc:40
//#		TC	ALARM
// ALARM_AND_ABORT.agc:41
//#		OCT	NNNNN
// ALARM_AND_ABORT.agc:42
//#					# (RETURNS HERE)
// ALARM_AND_ABORT.agc:43
//		BLOCK	02
// ALARM_AND_ABORT.agc:44
//		SETLOC	FFTAG7
// ALARM_AND_ABORT.agc:45
//		BANK
// ALARM_AND_ABORT.agc:46
//
// ALARM_AND_ABORT.agc:47
//		EBANK=	FAILREG
// ALARM_AND_ABORT.agc:48
//
// ALARM_AND_ABORT.agc:49
//		COUNT	02/ALARM
// ALARM_AND_ABORT.agc:50
//
// ALARM_AND_ABORT.agc:51
//# ALARM TURNS ON THE PROGRAM ALARM LIGHT, BUT DOES NOT DISPLAY.
// ALARM_AND_ABORT.agc:52
//
// ALARM_AND_ABORT.agc:53
//ALARM		INHINT
// slot 5032
            if slot <> 5032 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:54
//
// ALARM_AND_ABORT.agc:55
//		CA	Q
// slot 5033
            if slot <> 5033 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5034 {
// ALARM_AND_ABORT.agc:56
//ALARM2		TS	ALMCADR
// slot 5034
            if slot <> 5034 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:57
//		INDEX	Q
// slot 5035
            if slot <> 5035 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// ALARM_AND_ABORT.agc:58
//		CA	0
// slot 5036
    5036, 24576
)).

// bank 02, slots 5037-5067
function agcAotUnit231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5051 {
        if slot <= 5043 {
            if slot <= 5039 {
                if slot <= 5037 {
// ALARM_AND_ABORT.agc:59
//BORTENT		TS	L
// slot 5037
                    if slot <> 5037 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5038 {
// ALARM_AND_ABORT.agc:60
//
// ALARM_AND_ABORT.agc:61
//PRIOENT		CA	BBANK
// slot 5038
                        if slot <> 5038 or instruction <> 12294 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 6).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:62
// +1		EXTEND
// slot 5039
                        if slot <> 5039 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5041 {
                    if slot <= 5040 {
// ALARM_AND_ABORT.agc:63
//		ROR	SUPERBNK	# ADD SUPER BITS.
// slot 5040
                        if slot <> 5040 or instruction <> 2055 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:64
//		TS	ALMCADR +1
// slot 5041
                        if slot <> 5041 or instruction <> 23284 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23284, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5042 {
// ALARM_AND_ABORT.agc:65
//
// ALARM_AND_ABORT.agc:66
//LARMENT		CA	Q		# STORE RETURN FOR ALARM
// slot 5042
                        if slot <> 5042 or instruction <> 12290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:67
//		TS	ITEMP1
// slot 5043
                        if slot <> 5043 or instruction <> 22577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22577, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 5047 {
                if slot <= 5045 {
                    if slot <= 5044 {
// ALARM_AND_ABORT.agc:68
//
// ALARM_AND_ABORT.agc:69
//		CA	LOC
// slot 5044
                        if slot <> 5044 or instruction <> 12404 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 116).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:70
//		TS	LOCALARM
// slot 5045
                        if slot <> 5045 or instruction <> 22575 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22575, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5046 {
// ALARM_AND_ABORT.agc:71
//		CA	BANKSET
// slot 5046
                        if slot <> 5046 or instruction <> 12405 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 117).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:72
//		TS	BANKALRM
// slot 5047
                        if slot <> 5047 or instruction <> 22576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22576, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5049 {
                    if slot <= 5048 {
// ALARM_AND_ABORT.agc:73
//
// ALARM_AND_ABORT.agc:74
//CHKFAIL1	CCS	FAILREG		# IS ANYTHING IN FAILREG
// slot 5048
                        if slot <> 5048 or instruction <> 4349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 253).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:75
//		TCF	CHKFAIL2	# YES TRY NEXT REG
// slot 5049
                        if slot <> 5049 or instruction <> 7100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7100, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5050 {
// ALARM_AND_ABORT.agc:76
//		LXCH	FAILREG
// slot 5050
                        if slot <> 5050 or instruction <> 9469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 253, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:77
//		TCF	PROGLARM	# TURN ALARM LIGHT ON FOR FIRST ALARM
// slot 5051
                        if slot <> 5051 or instruction <> 7110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7110, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 5059 {
            if slot <= 5055 {
                if slot <= 5053 {
                    if slot <= 5052 {
// ALARM_AND_ABORT.agc:78
//
// ALARM_AND_ABORT.agc:79
//CHKFAIL2	CCS	FAILREG +1
// slot 5052
                        if slot <> 5052 or instruction <> 4350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 254).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:80
//		TCF	FAIL3
// slot 5053
                        if slot <> 5053 or instruction <> 7104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5054 {
// ALARM_AND_ABORT.agc:81
//		LXCH	FAILREG +1
// slot 5054
                        if slot <> 5054 or instruction <> 9470 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 254, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:82
//		TCF	MULTEXIT
// slot 5055
                        if slot <> 5055 or instruction <> 7113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5057 {
                    if slot <= 5056 {
// ALARM_AND_ABORT.agc:83
//
// ALARM_AND_ABORT.agc:84
//FAIL3		CA	FAILREG +2
// slot 5056
                        if slot <> 5056 or instruction <> 12543 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 255).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:85
//# Page 1494
// ALARM_AND_ABORT.agc:86
//		MASK	POSMAX
// slot 5057
                        if slot <> 5057 or instruction <> 31231 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            if fixedOperand = 16383 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 16384) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5058 {
// ALARM_AND_ABORT.agc:87
//		CCS	A
// slot 5058
                        if slot <> 5058 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:88
//		TCF	MULTFAIL
// slot 5059
                        if slot <> 5059 or instruction <> 7117 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7117, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 5063 {
                if slot <= 5061 {
                    if slot <= 5060 {
// ALARM_AND_ABORT.agc:89
//		LXCH	FAILREG +2
// slot 5060
                        if slot <> 5060 or instruction <> 9471 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 255, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:90
//		TCF	MULTEXIT
// slot 5061
                        if slot <> 5061 or instruction <> 7113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5062 {
// ALARM_AND_ABORT.agc:91
//
// ALARM_AND_ABORT.agc:92
//PROGLARM	CS	DSPTAB +11D
// slot 5062
                        if slot <> 5062 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:93
//		MASK	OCT40400
// slot 5063
                        if slot <> 5063 or instruction <> 32757 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 4085), 32768).
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
                if slot <= 5065 {
                    if slot <= 5064 {
// ALARM_AND_ABORT.agc:94
//		ADS	DSPTAB +11D
// slot 5064
                        if slot <> 5064 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:95
//
// ALARM_AND_ABORT.agc:96
//MULTEXIT	XCH	ITEMP1		# OBTAIN RETURN ADDRESS IN A
// slot 5065
                        if slot <> 5065 or instruction <> 23601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 49, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5066 {
// ALARM_AND_ABORT.agc:97
//		RELINT
// slot 5066
                        if slot <> 5066 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// ALARM_AND_ABORT.agc:98
//		INDEX	A
// slot 5067
                        if slot <> 5067 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
// ALARM_AND_ABORT.agc:99
//		TC	1
// slot 5068
    5068, 2
)).

// bank 02, slots 5069-5072
function agcAotUnit232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5070 {
        if slot <= 5069 {
// ALARM_AND_ABORT.agc:100
//
// ALARM_AND_ABORT.agc:101
//MULTFAIL	CA	L
// slot 5069
            if slot <> 5069 or instruction <> 12289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:102
//		AD	BIT15
// slot 5070
            if slot <> 5070 or instruction <> 27137 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5071 {
// ALARM_AND_ABORT.agc:103
//		TS	FAILREG +2
// slot 5071
            if slot <> 5071 or instruction <> 22783 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22783, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:104
//
// ALARM_AND_ABORT.agc:105
//		TCF	MULTEXIT
// slot 5072
            if slot <> 5072 or instruction <> 7113 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7113, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[232] to agcAotUnit232@.

// bank 10, slots 11254-11259
function agcAotUnit708 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11256 {
        if slot <= 11254 {
// ALARM_AND_ABORT.agc:106
//
// ALARM_AND_ABORT.agc:107
//# PRIOLARM DISPLAYS V05N09 VIA PRIODSPR WITH 3 RETURNS TO THE USER FROM THE ASTRONAUT AT CALL LOC +1,+2,+3 AND
// ALARM_AND_ABORT.agc:108
//# AN IMMEDIATE RETURN TO THE USER AT CALL LOC +4. EXAMPLE FOLLOWS,
// ALARM_AND_ABORT.agc:109
//#		CAF	OCTXX		# ALARM CODE
// ALARM_AND_ABORT.agc:110
//#		TC	BANKCALL
// ALARM_AND_ABORT.agc:111
//#		CADR	PRIOLARM
// ALARM_AND_ABORT.agc:112
//#
// ALARM_AND_ABORT.agc:113
//#		...	...
// ALARM_AND_ABORT.agc:114
//#		...	...
// ALARM_AND_ABORT.agc:115
//#		...	...		# ASTRONAUT RETURN
// ALARM_AND_ABORT.agc:116
//#		TC	PHASCHNG	# IMMEDIATE RETURN TO USER. RESTART
// ALARM_AND_ABORT.agc:117
//#		OCT	X.1		# PHASE CHANGE FOR PRIO DISPLAY
// ALARM_AND_ABORT.agc:118
//
// ALARM_AND_ABORT.agc:119
//		BANK	10
// ALARM_AND_ABORT.agc:120
//		SETLOC	DISPLAYS
// ALARM_AND_ABORT.agc:121
//		BANK
// ALARM_AND_ABORT.agc:122
//
// ALARM_AND_ABORT.agc:123
//		COUNT	10/DSPLA
// ALARM_AND_ABORT.agc:124
//
// ALARM_AND_ABORT.agc:125
//PRIOLARM	INHINT			# * * * KEEP IN DISPLAY ROUTINES BANK
// slot 11254
            if slot <> 11254 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11255 {
// ALARM_AND_ABORT.agc:126
//		TS	L		# SAVE ALARM CODE
// slot 11255
                if slot <> 11255 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:127
//
// ALARM_AND_ABORT.agc:128
//		CA	BUF2		# 2 CADR OF PRIOLARM USER
// slot 11256
                if slot <> 11256 or instruction <> 12379 { return choose false if checkOnly else -1. }
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
        if slot <= 11257 {
// ALARM_AND_ABORT.agc:129
//		TS	ALMCADR
// slot 11257
            if slot <> 11257 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11258 {
// ALARM_AND_ABORT.agc:130
//		CA	BUF2 +1
// slot 11258
                if slot <> 11258 or instruction <> 12380 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 92).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:131
//		TC	PRIOENT +1	# * LEAVE L ALONE
// slot 11259
                if slot <> 11259 or instruction <> 2991 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2991, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[708] to agcAotUnit708@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:132
//-2SEC		DEC	-200		# *** DONT MOVE
// slot 11260
    11260, 65134
)).

// bank 10, slots 11261-11262
function agcAotUnit709 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11261 {
// ALARM_AND_ABORT.agc:133
//		CAF	V05N09
// slot 11261
        if slot <> 11261 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// ALARM_AND_ABORT.agc:134
//		TCF	PRIODSPR
// slot 11262
        if slot <> 11262 or instruction <> 5590 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5590, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[709] to agcAotUnit709@.

// bank 03, slots 6125-6128
function agcAotUnit353 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6126 {
        if slot <= 6125 {
// ALARM_AND_ABORT.agc:135
//
// ALARM_AND_ABORT.agc:136
//# Page 1495
// ALARM_AND_ABORT.agc:137
//		BLOCK	02
// ALARM_AND_ABORT.agc:138
//		SETLOC	FFTAG13
// ALARM_AND_ABORT.agc:139
//		BANK
// ALARM_AND_ABORT.agc:140
//
// ALARM_AND_ABORT.agc:141
//		COUNT	02/ALARM
// ALARM_AND_ABORT.agc:142
//
// ALARM_AND_ABORT.agc:143
//BAILOUT		INHINT
// slot 6125
            if slot <> 6125 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:144
//		CA	Q
// slot 6126
            if slot <> 6126 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6127 {
// ALARM_AND_ABORT.agc:145
//		TS	ALMCADR
// slot 6127
            if slot <> 6127 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:146
//
// ALARM_AND_ABORT.agc:147
//		TC	BANKCALL
// slot 6128
            if slot <> 6128 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[353] to agcAotUnit353@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:148
//		CADR	VAC5STOR
// slot 6129
    6129, 32768
)).

// bank 03, slots 6130-6130
function agcAotUnit354 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:149
//
// ALARM_AND_ABORT.agc:150
//		INDEX	ALMCADR
// slot 6130
    if slot <> 6130 or instruction <> 21235 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21235, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21235, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[354] to agcAotUnit354@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:151
//		CAF	0
// slot 6131
    6131, 24576
)).

// bank 03, slots 6132-6132
function agcAotUnit355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:152
//		TC	BORTENT
// slot 6132
    if slot <> 6132 or instruction <> 2989 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2989, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[355] to agcAotUnit355@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:153
//OCT40400	OCT	40400
// slot 6133
    6133, 33280
)).

// bank 03, slots 6134-6139
function agcAotUnit356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6136 {
        if slot <= 6134 {
// ALARM_AND_ABORT.agc:154
//
// ALARM_AND_ABORT.agc:155
//		INHINT
// slot 6134
            if slot <> 6134 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6135 {
// ALARM_AND_ABORT.agc:156
//WHIMPER		CA	TWO
// slot 6135
                if slot <> 6135 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:157
//		AD	Z
// slot 6136
                if slot <> 6136 or instruction <> 24581 { return choose false if checkOnly else -1. }
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
        if slot <= 6137 {
// ALARM_AND_ABORT.agc:158
//		TS	BRUPT
// slot 6137
            if slot <> 6137 or instruction <> 22543 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22543, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6138 {
// ALARM_AND_ABORT.agc:159
//		RESUME
// slot 6138
                if slot <> 6138 or instruction <> 20495 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20495, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:160
//		TC	POSTJUMP	# RESUME SENDS CONTROL HERE
// slot 6139
                if slot <> 6139 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[356] to agcAotUnit356@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:161
//		CADR	ENEMA
// slot 6140
    6140, 11090
)).

// bank 02, slots 5073-5076
function agcAotUnit233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5074 {
        if slot <= 5073 {
// ALARM_AND_ABORT.agc:162
//
// ALARM_AND_ABORT.agc:163
//		SETLOC	FFTAG7
// ALARM_AND_ABORT.agc:164
//		BANK
// ALARM_AND_ABORT.agc:165
//
// ALARM_AND_ABORT.agc:166
//POODOO		INHINT
// slot 5073
            if slot <> 5073 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:167
//		CA	Q
// slot 5074
            if slot <> 5074 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5075 {
// ALARM_AND_ABORT.agc:168
//		TS	ALMCADR
// slot 5075
            if slot <> 5075 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:169
//
// ALARM_AND_ABORT.agc:170
//		TC	BANKCALL
// slot 5076
            if slot <> 5076 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[233] to agcAotUnit233@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:171
//		CADR	VAC5STOR	# STORE ERASABLES FOR DEBUGGING PURPOSES.
// slot 5077
    5077, 32768
)).

// bank 02, slots 5078-5078
function agcAotUnit234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:172
//
// ALARM_AND_ABORT.agc:173
//		INDEX	ALMCADR
// slot 5078
    if slot <> 5078 or instruction <> 21235 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21235, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21235, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[234] to agcAotUnit234@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:174
//		CAF	0
// slot 5079
    5079, 24576
)).

// bank 02, slots 5080-5080
function agcAotUnit235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:175
//ABORT2		TC	BORTENT
// slot 5080
    if slot <> 5080 or instruction <> 2989 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2989, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[235] to agcAotUnit235@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:176
//
// ALARM_AND_ABORT.agc:177
//OCT77770	OCT	77770		# DONT MOVE
// slot 5081
    5081, 65520
)).

// bank 02, slots 5082-5086
function agcAotUnit236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5083 {
        if slot <= 5082 {
// ALARM_AND_ABORT.agc:178
//		CA	V37FLBIT	# IS AVERAGE G ON
// slot 5082
            if slot <> 5082 or instruction <> 14858 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:179
//		MASK	FLAGWRD7
// slot 5083
            if slot <> 5083 or instruction <> 28739 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 67).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5084 {
// ALARM_AND_ABORT.agc:180
//		CCS	A
// slot 5084
            if slot <> 5084 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5085 {
// ALARM_AND_ABORT.agc:181
//		TC	WHIMPER -1	# YES.  DONT DO POODOO.  DO BAILOUT.
// slot 5085
                if slot <> 5085 or instruction <> 4086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:182
//
// ALARM_AND_ABORT.agc:183
//		TC	DOWNFLAG
// slot 5086
                if slot <> 5086 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[236] to agcAotUnit236@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:184
//		ADRES	STATEFLG
// slot 5087
    5087, 110
)).

// bank 02, slots 5088-5088
function agcAotUnit237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:185
//
// ALARM_AND_ABORT.agc:186
//		TC	DOWNFLAG
// slot 5088
    if slot <> 5088 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[237] to agcAotUnit237@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:187
//# Page 1496
// ALARM_AND_ABORT.agc:188
//		ADRES	REINTFLG
// slot 5089
    5089, 316
)).

// bank 02, slots 5090-5090
function agcAotUnit238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:189
//
// ALARM_AND_ABORT.agc:190
//		TC	DOWNFLAG
// slot 5090
    if slot <> 5090 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[238] to agcAotUnit238@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:191
//		ADRES	NODOFLAG
// slot 5091
    5091, 88
)).

// bank 02, slots 5092-5092
function agcAotUnit239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:192
//
// ALARM_AND_ABORT.agc:193
//		TC	BANKCALL
// slot 5092
    if slot <> 5092 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[239] to agcAotUnit239@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:194
//		CADR	MR.KLEAN
// slot 5093
    5093, 10882
)).

// bank 02, slots 5094-5098
function agcAotUnit240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5095 {
        if slot <= 5094 {
// ALARM_AND_ABORT.agc:195
//		TC	WHIMPER
// slot 5094
            if slot <> 5094 or instruction <> 4087 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4087, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:196
//
// ALARM_AND_ABORT.agc:197
//CCSHOLE		INHINT
// slot 5095
            if slot <> 5095 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5096 {
// ALARM_AND_ABORT.agc:198
//		CA	Q
// slot 5096
            if slot <> 5096 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5097 {
// ALARM_AND_ABORT.agc:199
//		TS	ALMCADR
// slot 5097
                if slot <> 5097 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:200
//		TC	BANKCALL
// slot 5098
                if slot <> 5098 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[240] to agcAotUnit240@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:201
//		CADR	VAC5STOR
// slot 5099
    5099, 32768
)).

// bank 02, slots 5100-5101
function agcAotUnit241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5100 {
// ALARM_AND_ABORT.agc:202
//		CA	OCT1103
// slot 5100
        if slot <> 5100 or instruction <> 15342 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3054), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// ALARM_AND_ABORT.agc:203
//		TC	ABORT2
// slot 5101
        if slot <> 5101 or instruction <> 3032 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3032, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[241] to agcAotUnit241@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:204
//OCT1103		OCT	1103
// slot 5102
    5102, 1158
)).

// bank 02, slots 5103-5105
function agcAotUnit242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5103 {
// ALARM_AND_ABORT.agc:205
//CURTAINS	INHINT
// slot 5103
        if slot <> 5103 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5104 {
// ALARM_AND_ABORT.agc:206
//		CA	Q
// slot 5104
            if slot <> 5104 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// ALARM_AND_ABORT.agc:207
//		TC	ALARM2
// slot 5105
            if slot <> 5105 or instruction <> 2986 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2986, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[242] to agcAotUnit242@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:208
//OCT217		OCT	00217
// slot 5106
    5106, 286
)).

// bank 02, slots 5107-5112
function agcAotUnit243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5109 {
        if slot <= 5107 {
// ALARM_AND_ABORT.agc:209
//		TC	ALMCADR		# RETURN TO USER
// slot 5107
            if slot <> 5107 or instruction <> 755 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 755, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5108 {
// ALARM_AND_ABORT.agc:210
//
// ALARM_AND_ABORT.agc:211
//DOALARM		EQUALS	ENDOFJOB
// ALARM_AND_ABORT.agc:212
//# CALLING SEQUENCE FOR VARALARM
// ALARM_AND_ABORT.agc:213
//#
// ALARM_AND_ABORT.agc:214
//#		CAF	(ALARM)
// ALARM_AND_ABORT.agc:215
//#		TC	VARALARM
// ALARM_AND_ABORT.agc:216
//#
// ALARM_AND_ABORT.agc:217
//# VARALARM TURNS ON PROGRAM ALARM LIGHT BUT DOES NOT DISPLAY
// ALARM_AND_ABORT.agc:218
//VARALARM	INHINT
// slot 5108
                if slot <> 5108 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:219
//
// ALARM_AND_ABORT.agc:220
//		TS	L		# SAVE USERS ALARM CODE
// slot 5109
                if slot <> 5109 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5110 {
// ALARM_AND_ABORT.agc:221
//
// ALARM_AND_ABORT.agc:222
//		CA	Q		# SAVE USERS Q
// slot 5110
            if slot <> 5110 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5111 {
// ALARM_AND_ABORT.agc:223
//		TS	ALMCADR
// slot 5111
                if slot <> 5111 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ALARM_AND_ABORT.agc:224
//
// ALARM_AND_ABORT.agc:225
//		TC	PRIOENT
// slot 5112
                if slot <> 5112 or instruction <> 2990 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2990, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[243] to agcAotUnit243@.

agcAotInstallSourceRope(list(
// ALARM_AND_ABORT.agc:226
//OCT14		OCT	14		# DONT MOVE
// slot 5113
    5113, 24
)).

// bank 02, slots 5114-5114
function agcAotUnit244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ALARM_AND_ABORT.agc:227
//
// ALARM_AND_ABORT.agc:228
//		TC	ALMCADR		# RETURN TO USER
// slot 5114
    if slot <> 5114 or instruction <> 755 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 755, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[244] to agcAotUnit244@.

// no code for the lines below
// ALARM_AND_ABORT.agc:229
//
// ALARM_AND_ABORT.agc:230
//ABORT		EQUALS	BAILOUT		# *** TEMPORARY UNTIL ABORT CALLS OUT
