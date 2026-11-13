// PORT: Original source unit ALARM_AND_ABORT.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 5032–5035.
function agcAotUnit230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5033 {
        if slot <= 5032 {
// PORT: SOURCE ALARM_AND_ABORT.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE ALARM_AND_ABORT.agc:2
//# Filename:     ALARM_AND_ABORT.agc
// PORT: SOURCE ALARM_AND_ABORT.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE ALARM_AND_ABORT.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE ALARM_AND_ABORT.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE ALARM_AND_ABORT.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE ALARM_AND_ABORT.agc:7
//# Reference:    pp. 1493-1496
// PORT: SOURCE ALARM_AND_ABORT.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE ALARM_AND_ABORT.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE ALARM_AND_ABORT.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE ALARM_AND_ABORT.agc:11
//#				name, and page images. Corrected various
// PORT: SOURCE ALARM_AND_ABORT.agc:12
//#				typos in the transcription of program
// PORT: SOURCE ALARM_AND_ABORT.agc:13
//#				comments, and these should be back-ported
// PORT: SOURCE ALARM_AND_ABORT.agc:14
//#				to Colossus249.
// PORT: SOURCE ALARM_AND_ABORT.agc:15
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE ALARM_AND_ABORT.agc:17
//# from scanned documents.
// PORT: SOURCE ALARM_AND_ABORT.agc:18
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE ALARM_AND_ABORT.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE ALARM_AND_ABORT.agc:21
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE ALARM_AND_ABORT.agc:23
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:24
//#       Prepared by
// PORT: SOURCE ALARM_AND_ABORT.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE ALARM_AND_ABORT.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE ALARM_AND_ABORT.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE ALARM_AND_ABORT.agc:28
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE ALARM_AND_ABORT.agc:30
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE ALARM_AND_ABORT.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE ALARM_AND_ABORT.agc:33
//
// PORT: SOURCE ALARM_AND_ABORT.agc:34
//# Page 1493
// PORT: SOURCE ALARM_AND_ABORT.agc:35
//# 	THE FOLLOWING SUBROUTINE MAY BE CALLED TO DISPLAY A NON-ABORTIVE ALARM CONDITION. IT MAY BE CALLED
// PORT: SOURCE ALARM_AND_ABORT.agc:36
//# EITHER IN INTERRUPT OR UNDER EXECUTIVE CONTROL.
// PORT: SOURCE ALARM_AND_ABORT.agc:37
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:38
//# 	CALLING SEQUENCE IS AS FOLLOWS:
// PORT: SOURCE ALARM_AND_ABORT.agc:39
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:40
//#		TC	ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:41
//#		OCT	NNNNN
// PORT: SOURCE ALARM_AND_ABORT.agc:42
//#					# (RETURNS HERE)
// PORT: SOURCE ALARM_AND_ABORT.agc:43
//		BLOCK	02
// PORT: SOURCE ALARM_AND_ABORT.agc:44
//		SETLOC	FFTAG7
// PORT: SOURCE ALARM_AND_ABORT.agc:45
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:46
//
// PORT: SOURCE ALARM_AND_ABORT.agc:47
//		EBANK=	FAILREG
// PORT: SOURCE ALARM_AND_ABORT.agc:48
//
// PORT: SOURCE ALARM_AND_ABORT.agc:49
//		COUNT	02/ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:50
//
// PORT: SOURCE ALARM_AND_ABORT.agc:51
//# ALARM TURNS ON THE PROGRAM ALARM LIGHT, BUT DOES NOT DISPLAY.
// PORT: SOURCE ALARM_AND_ABORT.agc:52
//
// PORT: SOURCE ALARM_AND_ABORT.agc:53
//ALARM		INHINT
// PORT: Fixed ROM slots 5032.
            if slot <> 5032 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:54
//
// PORT: SOURCE ALARM_AND_ABORT.agc:55
//		CA	Q
// PORT: Fixed ROM slots 5033.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:56
//ALARM2		TS	ALMCADR
// PORT: Fixed ROM slots 5034.
            if slot <> 5034 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:57
//		INDEX	Q
// PORT: Fixed ROM slots 5035.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:58
//		CA	0
// PORT: Fixed ROM slots 5036.
    5036, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5037–5067.
function agcAotUnit231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5051 {
        if slot <= 5043 {
            if slot <= 5039 {
                if slot <= 5037 {
// PORT: SOURCE ALARM_AND_ABORT.agc:59
//BORTENT		TS	L
// PORT: Fixed ROM slots 5037.
                    if slot <> 5037 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5038 {
// PORT: SOURCE ALARM_AND_ABORT.agc:60
//
// PORT: SOURCE ALARM_AND_ABORT.agc:61
//PRIOENT		CA	BBANK
// PORT: Fixed ROM slots 5038.
                        if slot <> 5038 or instruction <> 12294 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 6).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:62
// +1		EXTEND
// PORT: Fixed ROM slots 5039.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:63
//		ROR	SUPERBNK	# ADD SUPER BITS.
// PORT: Fixed ROM slots 5040.
                        if slot <> 5040 or instruction <> 2055 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:64
//		TS	ALMCADR +1
// PORT: Fixed ROM slots 5041.
                        if slot <> 5041 or instruction <> 23284 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23284, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5042 {
// PORT: SOURCE ALARM_AND_ABORT.agc:65
//
// PORT: SOURCE ALARM_AND_ABORT.agc:66
//LARMENT		CA	Q		# STORE RETURN FOR ALARM
// PORT: Fixed ROM slots 5042.
                        if slot <> 5042 or instruction <> 12290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:67
//		TS	ITEMP1
// PORT: Fixed ROM slots 5043.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:68
//
// PORT: SOURCE ALARM_AND_ABORT.agc:69
//		CA	LOC
// PORT: Fixed ROM slots 5044.
                        if slot <> 5044 or instruction <> 12404 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 116).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:70
//		TS	LOCALARM
// PORT: Fixed ROM slots 5045.
                        if slot <> 5045 or instruction <> 22575 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22575, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5046 {
// PORT: SOURCE ALARM_AND_ABORT.agc:71
//		CA	BANKSET
// PORT: Fixed ROM slots 5046.
                        if slot <> 5046 or instruction <> 12405 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 117).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:72
//		TS	BANKALRM
// PORT: Fixed ROM slots 5047.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:73
//
// PORT: SOURCE ALARM_AND_ABORT.agc:74
//CHKFAIL1	CCS	FAILREG		# IS ANYTHING IN FAILREG
// PORT: Fixed ROM slots 5048.
                        if slot <> 5048 or instruction <> 4349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 253).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:75
//		TCF	CHKFAIL2	# YES TRY NEXT REG
// PORT: Fixed ROM slots 5049.
                        if slot <> 5049 or instruction <> 7100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7100, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5050 {
// PORT: SOURCE ALARM_AND_ABORT.agc:76
//		LXCH	FAILREG
// PORT: Fixed ROM slots 5050.
                        if slot <> 5050 or instruction <> 9469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 253, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:77
//		TCF	PROGLARM	# TURN ALARM LIGHT ON FOR FIRST ALARM
// PORT: Fixed ROM slots 5051.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:78
//
// PORT: SOURCE ALARM_AND_ABORT.agc:79
//CHKFAIL2	CCS	FAILREG +1
// PORT: Fixed ROM slots 5052.
                        if slot <> 5052 or instruction <> 4350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 254).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:80
//		TCF	FAIL3
// PORT: Fixed ROM slots 5053.
                        if slot <> 5053 or instruction <> 7104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5054 {
// PORT: SOURCE ALARM_AND_ABORT.agc:81
//		LXCH	FAILREG +1
// PORT: Fixed ROM slots 5054.
                        if slot <> 5054 or instruction <> 9470 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 254, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:82
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5055.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:83
//
// PORT: SOURCE ALARM_AND_ABORT.agc:84
//FAIL3		CA	FAILREG +2
// PORT: Fixed ROM slots 5056.
                        if slot <> 5056 or instruction <> 12543 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 255).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:85
//# Page 1494
// PORT: SOURCE ALARM_AND_ABORT.agc:86
//		MASK	POSMAX
// PORT: Fixed ROM slots 5057.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:87
//		CCS	A
// PORT: Fixed ROM slots 5058.
                        if slot <> 5058 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:88
//		TCF	MULTFAIL
// PORT: Fixed ROM slots 5059.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:89
//		LXCH	FAILREG +2
// PORT: Fixed ROM slots 5060.
                        if slot <> 5060 or instruction <> 9471 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 255, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:90
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5061.
                        if slot <> 5061 or instruction <> 7113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 5062 {
// PORT: SOURCE ALARM_AND_ABORT.agc:91
//
// PORT: SOURCE ALARM_AND_ABORT.agc:92
//PROGLARM	CS	DSPTAB +11D
// PORT: Fixed ROM slots 5062.
                        if slot <> 5062 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:93
//		MASK	OCT40400
// PORT: Fixed ROM slots 5063.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:94
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 5064.
                        if slot <> 5064 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:95
//
// PORT: SOURCE ALARM_AND_ABORT.agc:96
//MULTEXIT	XCH	ITEMP1		# OBTAIN RETURN ADDRESS IN A
// PORT: Fixed ROM slots 5065.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:97
//		RELINT
// PORT: Fixed ROM slots 5066.
                        if slot <> 5066 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:98
//		INDEX	A
// PORT: Fixed ROM slots 5067.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:99
//		TC	1
// PORT: Fixed ROM slots 5068.
    5068, 2
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5069–5072.
function agcAotUnit232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5070 {
        if slot <= 5069 {
// PORT: SOURCE ALARM_AND_ABORT.agc:100
//
// PORT: SOURCE ALARM_AND_ABORT.agc:101
//MULTFAIL	CA	L
// PORT: Fixed ROM slots 5069.
            if slot <> 5069 or instruction <> 12289 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:102
//		AD	BIT15
// PORT: Fixed ROM slots 5070.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:103
//		TS	FAILREG +2
// PORT: Fixed ROM slots 5071.
            if slot <> 5071 or instruction <> 22783 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22783, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:104
//
// PORT: SOURCE ALARM_AND_ABORT.agc:105
//		TCF	MULTEXIT
// PORT: Fixed ROM slots 5072.
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

// PORT: Physical bank 10. Shared continuation entries, slots 11254–11259.
function agcAotUnit708 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11256 {
        if slot <= 11254 {
// PORT: SOURCE ALARM_AND_ABORT.agc:106
//
// PORT: SOURCE ALARM_AND_ABORT.agc:107
//# PRIOLARM DISPLAYS V05N09 VIA PRIODSPR WITH 3 RETURNS TO THE USER FROM THE ASTRONAUT AT CALL LOC +1,+2,+3 AND
// PORT: SOURCE ALARM_AND_ABORT.agc:108
//# AN IMMEDIATE RETURN TO THE USER AT CALL LOC +4. EXAMPLE FOLLOWS,
// PORT: SOURCE ALARM_AND_ABORT.agc:109
//#		CAF	OCTXX		# ALARM CODE
// PORT: SOURCE ALARM_AND_ABORT.agc:110
//#		TC	BANKCALL
// PORT: SOURCE ALARM_AND_ABORT.agc:111
//#		CADR	PRIOLARM
// PORT: SOURCE ALARM_AND_ABORT.agc:112
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:113
//#		...	...
// PORT: SOURCE ALARM_AND_ABORT.agc:114
//#		...	...
// PORT: SOURCE ALARM_AND_ABORT.agc:115
//#		...	...		# ASTRONAUT RETURN
// PORT: SOURCE ALARM_AND_ABORT.agc:116
//#		TC	PHASCHNG	# IMMEDIATE RETURN TO USER. RESTART
// PORT: SOURCE ALARM_AND_ABORT.agc:117
//#		OCT	X.1		# PHASE CHANGE FOR PRIO DISPLAY
// PORT: SOURCE ALARM_AND_ABORT.agc:118
//
// PORT: SOURCE ALARM_AND_ABORT.agc:119
//		BANK	10
// PORT: SOURCE ALARM_AND_ABORT.agc:120
//		SETLOC	DISPLAYS
// PORT: SOURCE ALARM_AND_ABORT.agc:121
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:122
//
// PORT: SOURCE ALARM_AND_ABORT.agc:123
//		COUNT	10/DSPLA
// PORT: SOURCE ALARM_AND_ABORT.agc:124
//
// PORT: SOURCE ALARM_AND_ABORT.agc:125
//PRIOLARM	INHINT			# * * * KEEP IN DISPLAY ROUTINES BANK
// PORT: Fixed ROM slots 11254.
            if slot <> 11254 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11255 {
// PORT: SOURCE ALARM_AND_ABORT.agc:126
//		TS	L		# SAVE ALARM CODE
// PORT: Fixed ROM slots 11255.
                if slot <> 11255 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:127
//
// PORT: SOURCE ALARM_AND_ABORT.agc:128
//		CA	BUF2		# 2 CADR OF PRIOLARM USER
// PORT: Fixed ROM slots 11256.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:129
//		TS	ALMCADR
// PORT: Fixed ROM slots 11257.
            if slot <> 11257 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 11258 {
// PORT: SOURCE ALARM_AND_ABORT.agc:130
//		CA	BUF2 +1
// PORT: Fixed ROM slots 11258.
                if slot <> 11258 or instruction <> 12380 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 92).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:131
//		TC	PRIOENT +1	# * LEAVE L ALONE
// PORT: Fixed ROM slots 11259.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:132
//-2SEC		DEC	-200		# *** DONT MOVE
// PORT: Fixed ROM slots 11260.
    11260, 65134
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11261–11262.
function agcAotUnit709 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11261 {
// PORT: SOURCE ALARM_AND_ABORT.agc:133
//		CAF	V05N09
// PORT: Fixed ROM slots 11261.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:134
//		TCF	PRIODSPR
// PORT: Fixed ROM slots 11262.
        if slot <> 11262 or instruction <> 5590 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5590, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[709] to agcAotUnit709@.

// PORT: Physical bank 03. Shared continuation entries, slots 6125–6128.
function agcAotUnit353 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6126 {
        if slot <= 6125 {
// PORT: SOURCE ALARM_AND_ABORT.agc:135
//
// PORT: SOURCE ALARM_AND_ABORT.agc:136
//# Page 1495
// PORT: SOURCE ALARM_AND_ABORT.agc:137
//		BLOCK	02
// PORT: SOURCE ALARM_AND_ABORT.agc:138
//		SETLOC	FFTAG13
// PORT: SOURCE ALARM_AND_ABORT.agc:139
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:140
//
// PORT: SOURCE ALARM_AND_ABORT.agc:141
//		COUNT	02/ALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:142
//
// PORT: SOURCE ALARM_AND_ABORT.agc:143
//BAILOUT		INHINT
// PORT: Fixed ROM slots 6125.
            if slot <> 6125 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:144
//		CA	Q
// PORT: Fixed ROM slots 6126.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:145
//		TS	ALMCADR
// PORT: Fixed ROM slots 6127.
            if slot <> 6127 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:146
//
// PORT: SOURCE ALARM_AND_ABORT.agc:147
//		TC	BANKCALL
// PORT: Fixed ROM slots 6128.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:148
//		CADR	VAC5STOR
// PORT: Fixed ROM slots 6129.
    6129, 32768
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6130–6130.
function agcAotUnit354 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:149
//
// PORT: SOURCE ALARM_AND_ABORT.agc:150
//		INDEX	ALMCADR
// PORT: Fixed ROM slots 6130.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:151
//		CAF	0
// PORT: Fixed ROM slots 6131.
    6131, 24576
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6132–6132.
function agcAotUnit355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:152
//		TC	BORTENT
// PORT: Fixed ROM slots 6132.
    if slot <> 6132 or instruction <> 2989 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2989, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[355] to agcAotUnit355@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:153
//OCT40400	OCT	40400
// PORT: Fixed ROM slots 6133.
    6133, 33280
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6134–6139.
function agcAotUnit356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6136 {
        if slot <= 6134 {
// PORT: SOURCE ALARM_AND_ABORT.agc:154
//
// PORT: SOURCE ALARM_AND_ABORT.agc:155
//		INHINT
// PORT: Fixed ROM slots 6134.
            if slot <> 6134 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6135 {
// PORT: SOURCE ALARM_AND_ABORT.agc:156
//WHIMPER		CA	TWO
// PORT: Fixed ROM slots 6135.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:157
//		AD	Z
// PORT: Fixed ROM slots 6136.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:158
//		TS	BRUPT
// PORT: Fixed ROM slots 6137.
            if slot <> 6137 or instruction <> 22543 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22543, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6138 {
// PORT: SOURCE ALARM_AND_ABORT.agc:159
//		RESUME
// PORT: Fixed ROM slots 6138.
                if slot <> 6138 or instruction <> 20495 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20495, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:160
//		TC	POSTJUMP	# RESUME SENDS CONTROL HERE
// PORT: Fixed ROM slots 6139.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:161
//		CADR	ENEMA
// PORT: Fixed ROM slots 6140.
    6140, 11090
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5073–5076.
function agcAotUnit233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5074 {
        if slot <= 5073 {
// PORT: SOURCE ALARM_AND_ABORT.agc:162
//
// PORT: SOURCE ALARM_AND_ABORT.agc:163
//		SETLOC	FFTAG7
// PORT: SOURCE ALARM_AND_ABORT.agc:164
//		BANK
// PORT: SOURCE ALARM_AND_ABORT.agc:165
//
// PORT: SOURCE ALARM_AND_ABORT.agc:166
//POODOO		INHINT
// PORT: Fixed ROM slots 5073.
            if slot <> 5073 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:167
//		CA	Q
// PORT: Fixed ROM slots 5074.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:168
//		TS	ALMCADR
// PORT: Fixed ROM slots 5075.
            if slot <> 5075 or instruction <> 23283 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23283, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:169
//
// PORT: SOURCE ALARM_AND_ABORT.agc:170
//		TC	BANKCALL
// PORT: Fixed ROM slots 5076.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:171
//		CADR	VAC5STOR	# STORE ERASABLES FOR DEBUGGING PURPOSES.
// PORT: Fixed ROM slots 5077.
    5077, 32768
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5078–5078.
function agcAotUnit234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:172
//
// PORT: SOURCE ALARM_AND_ABORT.agc:173
//		INDEX	ALMCADR
// PORT: Fixed ROM slots 5078.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:174
//		CAF	0
// PORT: Fixed ROM slots 5079.
    5079, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5080–5080.
function agcAotUnit235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:175
//ABORT2		TC	BORTENT
// PORT: Fixed ROM slots 5080.
    if slot <> 5080 or instruction <> 2989 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2989, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[235] to agcAotUnit235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:176
//
// PORT: SOURCE ALARM_AND_ABORT.agc:177
//OCT77770	OCT	77770		# DONT MOVE
// PORT: Fixed ROM slots 5081.
    5081, 65520
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5082–5086.
function agcAotUnit236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5083 {
        if slot <= 5082 {
// PORT: SOURCE ALARM_AND_ABORT.agc:178
//		CA	V37FLBIT	# IS AVERAGE G ON
// PORT: Fixed ROM slots 5082.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:179
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 5083.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:180
//		CCS	A
// PORT: Fixed ROM slots 5084.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:181
//		TC	WHIMPER -1	# YES.  DONT DO POODOO.  DO BAILOUT.
// PORT: Fixed ROM slots 5085.
                if slot <> 5085 or instruction <> 4086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:182
//
// PORT: SOURCE ALARM_AND_ABORT.agc:183
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 5086.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:184
//		ADRES	STATEFLG
// PORT: Fixed ROM slots 5087.
    5087, 110
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5088–5088.
function agcAotUnit237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:185
//
// PORT: SOURCE ALARM_AND_ABORT.agc:186
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 5088.
    if slot <> 5088 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[237] to agcAotUnit237@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:187
//# Page 1496
// PORT: SOURCE ALARM_AND_ABORT.agc:188
//		ADRES	REINTFLG
// PORT: Fixed ROM slots 5089.
    5089, 316
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5090–5090.
function agcAotUnit238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:189
//
// PORT: SOURCE ALARM_AND_ABORT.agc:190
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 5090.
    if slot <> 5090 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[238] to agcAotUnit238@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:191
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 5091.
    5091, 88
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5092–5092.
function agcAotUnit239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:192
//
// PORT: SOURCE ALARM_AND_ABORT.agc:193
//		TC	BANKCALL
// PORT: Fixed ROM slots 5092.
    if slot <> 5092 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[239] to agcAotUnit239@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ALARM_AND_ABORT.agc:194
//		CADR	MR.KLEAN
// PORT: Fixed ROM slots 5093.
    5093, 10882
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5094–5098.
function agcAotUnit240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5095 {
        if slot <= 5094 {
// PORT: SOURCE ALARM_AND_ABORT.agc:195
//		TC	WHIMPER
// PORT: Fixed ROM slots 5094.
            if slot <> 5094 or instruction <> 4087 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4087, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:196
//
// PORT: SOURCE ALARM_AND_ABORT.agc:197
//CCSHOLE		INHINT
// PORT: Fixed ROM slots 5095.
            if slot <> 5095 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5096 {
// PORT: SOURCE ALARM_AND_ABORT.agc:198
//		CA	Q
// PORT: Fixed ROM slots 5096.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:199
//		TS	ALMCADR
// PORT: Fixed ROM slots 5097.
                if slot <> 5097 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:200
//		TC	BANKCALL
// PORT: Fixed ROM slots 5098.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:201
//		CADR	VAC5STOR
// PORT: Fixed ROM slots 5099.
    5099, 32768
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5100–5101.
function agcAotUnit241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5100 {
// PORT: SOURCE ALARM_AND_ABORT.agc:202
//		CA	OCT1103
// PORT: Fixed ROM slots 5100.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:203
//		TC	ABORT2
// PORT: Fixed ROM slots 5101.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:204
//OCT1103		OCT	1103
// PORT: Fixed ROM slots 5102.
    5102, 1158
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5103–5105.
function agcAotUnit242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5103 {
// PORT: SOURCE ALARM_AND_ABORT.agc:205
//CURTAINS	INHINT
// PORT: Fixed ROM slots 5103.
        if slot <> 5103 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5104 {
// PORT: SOURCE ALARM_AND_ABORT.agc:206
//		CA	Q
// PORT: Fixed ROM slots 5104.
            if slot <> 5104 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:207
//		TC	ALARM2
// PORT: Fixed ROM slots 5105.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:208
//OCT217		OCT	00217
// PORT: Fixed ROM slots 5106.
    5106, 286
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5107–5112.
function agcAotUnit243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5109 {
        if slot <= 5107 {
// PORT: SOURCE ALARM_AND_ABORT.agc:209
//		TC	ALMCADR		# RETURN TO USER
// PORT: Fixed ROM slots 5107.
            if slot <> 5107 or instruction <> 755 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 755, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5108 {
// PORT: SOURCE ALARM_AND_ABORT.agc:210
//
// PORT: SOURCE ALARM_AND_ABORT.agc:211
//DOALARM		EQUALS	ENDOFJOB
// PORT: SOURCE ALARM_AND_ABORT.agc:212
//# CALLING SEQUENCE FOR VARALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:213
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:214
//#		CAF	(ALARM)
// PORT: SOURCE ALARM_AND_ABORT.agc:215
//#		TC	VARALARM
// PORT: SOURCE ALARM_AND_ABORT.agc:216
//#
// PORT: SOURCE ALARM_AND_ABORT.agc:217
//# VARALARM TURNS ON PROGRAM ALARM LIGHT BUT DOES NOT DISPLAY
// PORT: SOURCE ALARM_AND_ABORT.agc:218
//VARALARM	INHINT
// PORT: Fixed ROM slots 5108.
                if slot <> 5108 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:219
//
// PORT: SOURCE ALARM_AND_ABORT.agc:220
//		TS	L		# SAVE USERS ALARM CODE
// PORT: Fixed ROM slots 5109.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:221
//
// PORT: SOURCE ALARM_AND_ABORT.agc:222
//		CA	Q		# SAVE USERS Q
// PORT: Fixed ROM slots 5110.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:223
//		TS	ALMCADR
// PORT: Fixed ROM slots 5111.
                if slot <> 5111 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ALARM_AND_ABORT.agc:224
//
// PORT: SOURCE ALARM_AND_ABORT.agc:225
//		TC	PRIOENT
// PORT: Fixed ROM slots 5112.
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
// PORT: SOURCE ALARM_AND_ABORT.agc:226
//OCT14		OCT	14		# DONT MOVE
// PORT: Fixed ROM slots 5113.
    5113, 24
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5114–5114.
function agcAotUnit244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ALARM_AND_ABORT.agc:227
//
// PORT: SOURCE ALARM_AND_ABORT.agc:228
//		TC	ALMCADR		# RETURN TO USER
// PORT: Fixed ROM slots 5114.
    if slot <> 5114 or instruction <> 755 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 755, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[244] to agcAotUnit244@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE ALARM_AND_ABORT.agc:229
//
// PORT: SOURCE ALARM_AND_ABORT.agc:230
//ABORT		EQUALS	BAILOUT		# *** TEMPORARY UNTIL ABORT CALLS OUT
