// PORT: Original source unit DAP_INTERFACE_SUBROUTINES.agc.
// PORT: Physical bank 20. Shared continuation entries, slots 18515–18524.
function agcAotUnit1118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18519 {
        if slot <= 18516 {
            if slot <= 18515 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:2
//# Filename:	DAP_INTERFACE_SUBROUTINES.agc
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:9
//# Pages:	1406-1409
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:13
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:22
//# actually created.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:23
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:25
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:28
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:29
//# Page 1406
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:30
//		BANK	20
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:31
//		SETLOC	DAPS3
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:32
//		BANK
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:33
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:34
//		EBANK=	CDUXD
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:35
//		COUNT*	$$/DAPIF
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:36
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:37
//# MOD 0		DATE	11/15/66	BY GEORGE W. CHERRY
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:38
//# MOD 1			 1/23/67	MODIFICATION BY PETER ADLER
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:39
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:40
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:41
//#	HEREIN ARE A COLLECTION OF SUBROUTINES WHICH ALLOW MISSION CONTROL PROGRAMS TO CONTROL THE MODE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:42
//#	AND INTERFACE WITH THE DAP.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:43
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:44
//# CALLING SEQUENCES
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:45
//#	IN INTERRUPT OR WITH INTERRUPT INHIBITED
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:46
//#		TC	IBNKCALL
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:47
//#		FCADR	ROUTINE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:48
//#	IN A JOB WITHOUT INTERRUPT INHIBITED
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:49
//#		INHINT
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:50
//#		TC	IBNKCALL
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:51
//#		FCADR	ROUTINE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:52
//#		RELINT
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:53
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:54
//# OUTPUT
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:55
//#	SEE INDIVIDUAL ROUTINES BELOW
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:56
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:57
//# DEBRIS
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:58
//#	A, L, AND SOMETIMES MDUETEMP			ODE	NOT IN PULSES MODE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:59
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:60
//# Page 1407
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:61
//# SUBROUTINE NAMES:
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:62
//#	SETMAXDB, SETMINDB, RESTORDB, PFLITEDB
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:63
//# MODIFIED:	30 JANUARY 1968 BY P S WEISSMAN TO CREATE RESTORDB.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:64
//# MODIFIED:	1 MARCH 1968 BY P S WEISSMAN TO SAVE EBANK AND CREATE PFLITEDB
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:65
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:66
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:67
//#	SETMAXDB -- SET DEADBAND TO 5.0 DEGREES
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:68
//#	SETMINDB -- SET DEADBAND TO 0.3 DEGREE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:69
//#	RESTORDB -- SET DEADBAND TO MAX OR MIN ACCORDING TO SETTINGS OF DBSELECT BIT OF DAPBOOLS
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:70
//#	PFLITEDB -- SET DEADBAND TO 1.0 DEGREE AND ZERO THE COMMANDED ATTITUDE CHANGE AND COMMANDED RATE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:71
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:72
//#	ALL ENTRIES SET UP A NOVAC JOB TO DO 1/ACCS SO THAT THE TJETLAW SWITCH CURVES ARE POSITIONED TO
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:73
//#	REFLECT THE NEW DEADBAND.  IT SHOULD BE NOTED THAT THE DEADBAND REFERS TO THE ATTITUDE IN THE P-, U-, AND V-AXES.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:74
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:75
//# SUBROUTINE CALLED:	NOVAC
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:76
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:77
//# CALLING SEQUENCE:	SAME AS ABOVE
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:78
//#			OR	TC RESTORDB +1    FROM ALLCOAST
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:79
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:80
//# DEBRIS:		A, L, Q, RUPTREG1, (ITEMPS IN NOVAC)
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:81
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:82
//RESTORDB	CAE	DAPBOOLS	# DETERMINE CREW-SELECTED DEADBAND.
// PORT: Fixed ROM slots 18515.
                if slot <> 18515 or instruction <> 12361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 73).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:83
//		MASK	DBSELECT
// PORT: Fixed ROM slots 18516.
                if slot <> 18516 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 18517 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:84
//		EXTEND
// PORT: Fixed ROM slots 18517.
                if slot <> 18517 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18518 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:85
//		BZF	SETMINDB
// PORT: Fixed ROM slots 18518.
                    if slot <> 18518 or instruction <> 5216 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5216, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:86
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:87
//SETMAXDB	CAF	WIDEDB		# SET 5 DEGREE DEADBAND.
// PORT: Fixed ROM slots 18519.
                    if slot <> 18519 or instruction <> 13417 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1129), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18521 {
            if slot <= 18520 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:88
// +1		TS	DB
// PORT: Fixed ROM slots 18520.
                if slot <> 18520 or instruction <> 23270 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23270, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:89
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:90
//		EXTEND			# SET UP JOB TO RE-POSITION SWITCH CURVES.
// PORT: Fixed ROM slots 18521.
                if slot <> 18521 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18522 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:91
//		QXCH	RUPTREG1
// PORT: Fixed ROM slots 18522.
                if slot <> 18522 or instruction <> 9272 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 56, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18523 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:92
//CALLACCS	CAF	PRIO27
// PORT: Fixed ROM slots 18523.
                    if slot <> 18523 or instruction <> 16333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:93
//		TC	NOVAC
// PORT: Fixed ROM slots 18524.
                    if slot <> 18524 or instruction <> 2618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1118] to agcAotUnit1118@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:94
//		EBANK=	AOSQ
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:95
//		2CADR	1/ACCJOB
// PORT: Fixed ROM slots 18525 18526.
    18525, 2648, 18526, 32908
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18527–18535.
function agcAotUnit1119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18530 {
        if slot <= 18528 {
            if slot <= 18527 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:96
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:97
//		TC	RUPTREG1	# RETURN TO CALLER.
// PORT: Fixed ROM slots 18527.
                if slot <> 18527 or instruction <> 56 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 56, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:98
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:99
//SETMINDB	CAF	NARROWDB	# SET 0.3 DEGREE DEADBAND.
// PORT: Fixed ROM slots 18528.
                if slot <> 18528 or instruction <> 13416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1128), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18529 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:100
//		TCF	SETMAXDB +1
// PORT: Fixed ROM slots 18529.
                if slot <> 18529 or instruction <> 5208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:101
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:102
//PFLITEDB	EXTEND			# THE RETURN FROM CALLACCS IS TO RUPTREG1.
// PORT: Fixed ROM slots 18530.
                if slot <> 18530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18532 {
            if slot <= 18531 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:103
//		QXCH	RUPTREG1
// PORT: Fixed ROM slots 18531.
                if slot <> 18531 or instruction <> 9272 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 56, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:104
//		TC	ZATTEROR	# ZERO THE ERRORS AND COMMANDED RATES.
// PORT: Fixed ROM slots 18532.
                if slot <> 18532 or instruction <> 1131 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1131, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18533 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:105
//		CAF	POWERDB		# SET DB TO 1.0 DEG.
// PORT: Fixed ROM slots 18533.
                if slot <> 18533 or instruction <> 13418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1130), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18534 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:106
//		TS	DB
// PORT: Fixed ROM slots 18534.
                    if slot <> 18534 or instruction <> 23270 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23270, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:107
//		TCF	CALLACCS	# SET UP 1/ACCS AND RETURN TO CALLER.
// PORT: Fixed ROM slots 18535.
                    if slot <> 18535 or instruction <> 5211 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5211, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1119] to agcAotUnit1119@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:108
//NARROWDB	OCTAL	00155		# 0.3 DEGREE SCALED AT 45.
// PORT: Fixed ROM slots 18536.
    18536, 218,
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:109
//# Page 1408
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:110
//WIDEDB		OCTAL	03434		# 5.0 DEGREES SCALED AT 45.
// PORT: Fixed ROM slots 18537.
    18537, 3640,
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:111
//POWERDB		DEC	.02222		# 1.0 DEGREE SCALED AT 45.
// PORT: Fixed ROM slots 18538.
    18538, 728
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18539–18581.
function agcAotUnit1120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18559 {
        if slot <= 18548 {
            if slot <= 18543 {
                if slot <= 18540 {
                    if slot <= 18539 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:112
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:113
//ZATTEROR	CAF	EBANK6
// PORT: Fixed ROM slots 18539.
                        if slot <> 18539 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:114
//		XCH	EBANK
// PORT: Fixed ROM slots 18540.
                        if slot <> 18540 or instruction <> 23555 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 3, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18541 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:115
//		TS	L		# SAVE CALLERS EBANK IN L.
// PORT: Fixed ROM slots 18541.
                        if slot <> 18541 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18542 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:116
//		CAE	CDUX
// PORT: Fixed ROM slots 18542.
                            if slot <> 18542 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:117
//		TS	CDUXD
// PORT: Fixed ROM slots 18543.
                            if slot <> 18543 or instruction <> 23453 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23453, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18545 {
                    if slot <= 18544 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:118
//		CAE	CDUY
// PORT: Fixed ROM slots 18544.
                        if slot <> 18544 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:119
//		TS	CDUYD
// PORT: Fixed ROM slots 18545.
                        if slot <> 18545 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18546 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:120
//		CAE	CDUZ
// PORT: Fixed ROM slots 18546.
                        if slot <> 18546 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 28).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18547 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:121
//		TS	CDUZD
// PORT: Fixed ROM slots 18547.
                            if slot <> 18547 or instruction <> 23455 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23455, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:122
//		TCF	STOPRATE +3
// PORT: Fixed ROM slots 18548.
                            if slot <> 18548 or instruction <> 5240 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5240, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18553 {
                if slot <= 18550 {
                    if slot <= 18549 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:123
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:124
//STOPRATE	CAF	EBANK6
// PORT: Fixed ROM slots 18549.
                        if slot <> 18549 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:125
//		XCH	EBANK
// PORT: Fixed ROM slots 18550.
                        if slot <> 18550 or instruction <> 23555 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 3, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18551 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:126
//		TS	L		# SAVE CALLERS EBANK IN L.
// PORT: Fixed ROM slots 18551.
                        if slot <> 18551 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18552 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:127
// +3		CAF	ZERO
// PORT: Fixed ROM slots 18552.
                            if slot <> 18552 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:128
//		TS	OMEGAPD
// PORT: Fixed ROM slots 18553.
                            if slot <> 18553 or instruction <> 23459 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23459, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18556 {
                    if slot <= 18554 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:129
//		TS	OMEGAQD
// PORT: Fixed ROM slots 18554.
                        if slot <> 18554 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18555 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:130
//		TS	OMEGARD
// PORT: Fixed ROM slots 18555.
                            if slot <> 18555 or instruction <> 23461 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23461, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:131
//		TS	DELCDUX
// PORT: Fixed ROM slots 18556.
                            if slot <> 18556 or instruction <> 23456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23456, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18557 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:132
//		TS	DELCDUY
// PORT: Fixed ROM slots 18557.
                        if slot <> 18557 or instruction <> 23457 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23457, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18558 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:133
//		TS	DELCDUZ
// PORT: Fixed ROM slots 18558.
                            if slot <> 18558 or instruction <> 23458 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23458, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:134
//		TS	DELPEROR
// PORT: Fixed ROM slots 18559.
                            if slot <> 18559 or instruction <> 23231 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23231, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18570 {
            if slot <= 18564 {
                if slot <= 18561 {
                    if slot <= 18560 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:135
//		TS	DELQEROR
// PORT: Fixed ROM slots 18560.
                        if slot <> 18560 or instruction <> 23232 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:136
//		TS	DELREROR
// PORT: Fixed ROM slots 18561.
                        if slot <> 18561 or instruction <> 23233 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23233, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18562 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:137
//		LXCH	EBANK		# RESTORE CALLERS EBANK.
// PORT: Fixed ROM slots 18562.
                        if slot <> 18562 or instruction <> 9219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 3, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18563 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:138
//		TC	Q
// PORT: Fixed ROM slots 18563.
                            if slot <> 18563 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:139
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:140
//# SUBROUTINE NAME:	ALLCOAST
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:141
//# WILL BE CALLED BY FRESH STARTS AND ENGINE OFF ROUTINES.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:142
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:143
//# CALLING SEQUENCE:	(SAME AS ABOVE)
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:144
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:145
//# EXIT:			RETURN TO Q.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:146
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:147
//# SUBROUTINES CALLED:	STOPRATE, RESTORDB, NOVAC
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:148
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:149
//# ZERO:			(FOR ALL AXES) AOS, ALPHA, AOSTERM, OMEGAD, DELCDU, DELEROR
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:150
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:151
//# OUTPUT:		DRIFTBIT/DAPBOOLS, OE, JOB TO DO 1/ACCS
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:152
//#
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:153
//# DEBRIS:		A, L, Q, RUPTREG1, RUPTREG2, (ITEMPS IN NOVAC)
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:154
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:155
//ALLCOAST	EXTEND			# SAVE Q FOR RETURN
// PORT: Fixed ROM slots 18564.
                            if slot <> 18564 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18567 {
                    if slot <= 18565 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:156
//		QXCH	RUPTREG2
// PORT: Fixed ROM slots 18565.
                        if slot <> 18565 or instruction <> 9273 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 57, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18566 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:157
//# Page 1409
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:158
//		TC	STOPRATE	# CLEAR RATE INTERFACE.  RETURN WITH A=0
// PORT: Fixed ROM slots 18566.
                            if slot <> 18566 or instruction <> 1141 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1141, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:159
//		LXCH	EBANK		#   AND L=EBANK6.  SAVE CALLER'S EBANK.
// PORT: Fixed ROM slots 18567.
                            if slot <> 18567 or instruction <> 9219 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 3, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18568 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:160
//		TS	AOSQ
// PORT: Fixed ROM slots 18568.
                        if slot <> 18568 or instruction <> 23391 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23391, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18569 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:161
//		TS	AOSQ +1
// PORT: Fixed ROM slots 18569.
                            if slot <> 18569 or instruction <> 23392 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23392, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:162
//		TS	AOSR
// PORT: Fixed ROM slots 18570.
                            if slot <> 18570 or instruction <> 23393 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23393, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18575 {
                if slot <= 18572 {
                    if slot <= 18571 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:163
//		TS	AOSR +1
// PORT: Fixed ROM slots 18571.
                        if slot <> 18571 or instruction <> 23394 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23394, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:164
//		TS	ALPHAQ		# FOR DOWNLIST.
// PORT: Fixed ROM slots 18572.
                        if slot <> 18572 or instruction <> 23316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23316, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18573 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:165
//		TS	ALPHAR
// PORT: Fixed ROM slots 18573.
                        if slot <> 18573 or instruction <> 23317 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23317, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18574 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:166
//		TS	AOSQTERM
// PORT: Fixed ROM slots 18574.
                            if slot <> 18574 or instruction <> 23397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23397, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:167
//		TS	AOSRTERM
// PORT: Fixed ROM slots 18575.
                            if slot <> 18575 or instruction <> 23398 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23398, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18578 {
                    if slot <= 18576 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:168
//		LXCH	EBANK		# RESTORE EBANK (EBANK6 NO LONGER NEEDED)
// PORT: Fixed ROM slots 18576.
                        if slot <> 18576 or instruction <> 9219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 3, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18577 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:169
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:170
//		CS	DAPBOOLS	# SET UP DRIFTBIT
// PORT: Fixed ROM slots 18577.
                            if slot <> 18577 or instruction <> 16457 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 73).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:171
//		MASK	DRIFTBIT
// PORT: Fixed ROM slots 18578.
                            if slot <> 18578 or instruction <> 31204 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                if fixedOperand = 128 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18579 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:172
//		ADS	DAPBOOLS
// PORT: Fixed ROM slots 18579.
                        if slot <> 18579 or instruction <> 11337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18580 {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:173
//		TC	RESTORDB +1	# RESTORE DEADBANK TO CREW-SELECTED VALUE.
// PORT: Fixed ROM slots 18580.
                            if slot <> 18580 or instruction <> 1108 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1108, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:174
//
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:175
//		TC	RUPTREG2	# RETURN.
// PORT: Fixed ROM slots 18581.
                            if slot <> 18581 or instruction <> 57 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 57, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1120] to agcAotUnit1120@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE DAP_INTERFACE_SUBROUTINES.agc:176
//
