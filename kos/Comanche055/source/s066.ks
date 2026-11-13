// PORT: Original source unit SERVICE_ROUTINES.agc.
// PORT: Physical bank 03. Shared continuation entries, slots 6098–6104.
function agcAotUnit348 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6100 {
        if slot <= 6098 {
// PORT: SOURCE SERVICE_ROUTINES.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE SERVICE_ROUTINES.agc:2
//# Filename:     SERVICE_ROUTINES.agc
// PORT: SOURCE SERVICE_ROUTINES.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE SERVICE_ROUTINES.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE SERVICE_ROUTINES.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE SERVICE_ROUTINES.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE SERVICE_ROUTINES.agc:7
//# Reference:    pp. 1485-1492
// PORT: SOURCE SERVICE_ROUTINES.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE SERVICE_ROUTINES.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE SERVICE_ROUTINES.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE SERVICE_ROUTINES.agc:11
//#				name, and page images. Corrected various
// PORT: SOURCE SERVICE_ROUTINES.agc:12
//#				typos in the transcription of program
// PORT: SOURCE SERVICE_ROUTINES.agc:13
//#				comments, and these should be back-ported
// PORT: SOURCE SERVICE_ROUTINES.agc:14
//#				to Colossus249.
// PORT: SOURCE SERVICE_ROUTINES.agc:15
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE SERVICE_ROUTINES.agc:17
//# from scanned documents.
// PORT: SOURCE SERVICE_ROUTINES.agc:18
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE SERVICE_ROUTINES.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE SERVICE_ROUTINES.agc:21
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE SERVICE_ROUTINES.agc:23
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:24
//#       Prepared by
// PORT: SOURCE SERVICE_ROUTINES.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE SERVICE_ROUTINES.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE SERVICE_ROUTINES.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE SERVICE_ROUTINES.agc:28
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE SERVICE_ROUTINES.agc:30
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE SERVICE_ROUTINES.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE SERVICE_ROUTINES.agc:33
//
// PORT: SOURCE SERVICE_ROUTINES.agc:34
//# Page 1485
// PORT: SOURCE SERVICE_ROUTINES.agc:35
//		BLOCK	3
// PORT: SOURCE SERVICE_ROUTINES.agc:36
//		SETLOC	FFTAG6
// PORT: SOURCE SERVICE_ROUTINES.agc:37
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:38
//		COUNT	03/FLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:39
//
// PORT: SOURCE SERVICE_ROUTINES.agc:40
//UPENT2		TS	L		# WHICH FLAGWORD IS IT
// PORT: Fixed ROM slots 6098.
            if slot <> 6098 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6099 {
// PORT: SOURCE SERVICE_ROUTINES.agc:41
//		MASK	OCT7
// PORT: Fixed ROM slots 6099.
                if slot <> 6099 or instruction <> 31251 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SERVICE_ROUTINES.agc:42
//		XCH	L		# SAVE IN L FOR INDEXING
// PORT: Fixed ROM slots 6100.
                if slot <> 6100 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6102 {
            if slot <= 6101 {
// PORT: SOURCE SERVICE_ROUTINES.agc:43
//
// PORT: SOURCE SERVICE_ROUTINES.agc:44
//		MASK	OCT77770	# OBTAIN THE BIT INFORMATION
// PORT: Fixed ROM slots 6101.
                if slot <> 6101 or instruction <> 31705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3033), 32768).
                    if fixedOperand = 32760 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4096) * 8).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:45
//		INHINT			# PREVENT INTERUPTS
// PORT: Fixed ROM slots 6102.
                if slot <> 6102 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6103 {
// PORT: SOURCE SERVICE_ROUTINES.agc:46
//		TS	ITEMP1		# STORE THE BIT INFORMATION TEMPORARIALY
// PORT: Fixed ROM slots 6103.
                if slot <> 6103 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:47
//
// PORT: SOURCE SERVICE_ROUTINES.agc:48
//		NDX	L
// PORT: Fixed ROM slots 6104.
                if slot <> 6104 or instruction <> 20481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[348] to agcAotUnit348@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:49
//		CS	FLAGWRD0
// PORT: Fixed ROM slots 6105.
    6105, 32888
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6106–6107.
function agcAotUnit349 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6106 {
// PORT: SOURCE SERVICE_ROUTINES.agc:50
//		MASK	ITEMP1
// PORT: Fixed ROM slots 6106.
        if slot <> 6106 or instruction <> 28721 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 49).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:51
//		NDX	L
// PORT: Fixed ROM slots 6107.
        if slot <> 6107 or instruction <> 20481 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20481, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20481, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[349] to agcAotUnit349@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:52
//		ADS	FLAGWRD0
// PORT: Fixed ROM slots 6108.
    6108, 22648
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6109–6118.
function agcAotUnit350 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6113 {
        if slot <= 6110 {
            if slot <= 6109 {
// PORT: SOURCE SERVICE_ROUTINES.agc:53
//		RELINT			# RELEASE INTERUPT INHIBIT
// PORT: Fixed ROM slots 6109.
                if slot <> 6109 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:54
//
// PORT: SOURCE SERVICE_ROUTINES.agc:55
//		INCR	Q		# OBTAIN THE CORRECT RETURN ADDRESS
// PORT: Fixed ROM slots 6110.
                if slot <> 6110 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6111 {
// PORT: SOURCE SERVICE_ROUTINES.agc:56
//		TC	Q		# RETURN
// PORT: Fixed ROM slots 6111.
                if slot <> 6111 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6112 {
// PORT: SOURCE SERVICE_ROUTINES.agc:57
//
// PORT: SOURCE SERVICE_ROUTINES.agc:58
//DOWNENT2	TS	L		# WHICH FLAGWORD IS IT
// PORT: Fixed ROM slots 6112.
                    if slot <> 6112 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:59
//		MASK	OCT7
// PORT: Fixed ROM slots 6113.
                    if slot <> 6113 or instruction <> 31251 { return choose false if checkOnly else -1. }
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
                }
            }
        }
    } else {
        if slot <= 6115 {
            if slot <= 6114 {
// PORT: SOURCE SERVICE_ROUTINES.agc:60
//		XCH	L		# SAVE IN L FOR INDEXING
// PORT: Fixed ROM slots 6114.
                if slot <> 6114 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:61
//
// PORT: SOURCE SERVICE_ROUTINES.agc:62
//		MASK	OCT77770	# OBTAIN THE BIT INFORMATION
// PORT: Fixed ROM slots 6115.
                if slot <> 6115 or instruction <> 31705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3033), 32768).
                    if fixedOperand = 32760 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4096) * 8).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6116 {
// PORT: SOURCE SERVICE_ROUTINES.agc:63
//		COM			# START TO PROCESS THE INFORMATION
// PORT: Fixed ROM slots 6116.
                if slot <> 6116 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6117 {
// PORT: SOURCE SERVICE_ROUTINES.agc:64
//
// PORT: SOURCE SERVICE_ROUTINES.agc:65
//		INHINT			# PREVENT INTERUPTS
// PORT: Fixed ROM slots 6117.
                    if slot <> 6117 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:66
//		NDX	L
// PORT: Fixed ROM slots 6118.
                    if slot <> 6118 or instruction <> 20481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[350] to agcAotUnit350@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:67
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6119.
    6119, 57464
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6120–6120.
function agcAotUnit351 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:68
//		NDX	L
// PORT: Fixed ROM slots 6120.
    if slot <> 6120 or instruction <> 20481 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20481, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20481, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[351] to agcAotUnit351@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:69
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 6121.
    6121, 45176
)).

// PORT: Physical bank 03. Shared continuation entries, slots 6122–6124.
function agcAotUnit352 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6122 {
// PORT: SOURCE SERVICE_ROUTINES.agc:70
//		RELINT			# RELEASE INTERUPT INHIBIT
// PORT: Fixed ROM slots 6122.
        if slot <> 6122 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6123 {
// PORT: SOURCE SERVICE_ROUTINES.agc:71
//
// PORT: SOURCE SERVICE_ROUTINES.agc:72
//		INCR	Q		# OBTAIN THE CORRECT RETURN ADDRESS
// PORT: Fixed ROM slots 6123.
            if slot <> 6123 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:73
//		TC	Q		# RETURN
// PORT: Fixed ROM slots 6124.
            if slot <> 6124 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[352] to agcAotUnit352@.

// PORT: Physical bank 02. Shared continuation entries, slots 4966–4971.
function agcAotUnit220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4968 {
        if slot <= 4966 {
// PORT: SOURCE SERVICE_ROUTINES.agc:74
//
// PORT: SOURCE SERVICE_ROUTINES.agc:75
//OCT7		EQUALS	SEVEN
// PORT: SOURCE SERVICE_ROUTINES.agc:76
//		BANK	10
// PORT: SOURCE SERVICE_ROUTINES.agc:77
//
// PORT: SOURCE SERVICE_ROUTINES.agc:78
//# Page 1486
// PORT: SOURCE SERVICE_ROUTINES.agc:79
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:80
//#	UPFLAG AND DOWNFLAG ARE ENTIRELY GENERAL FLAG SETTING AND CLEARING SUBROUTINES.  USING THEM, WHETHER OR
// PORT: SOURCE SERVICE_ROUTINES.agc:81
//# NOT IN INTERRUPT, ONE MAY SET OR CLEAR ANY SINGLE, NAMED BIT IN ANY ERASABLE REGISTER, SUBJECT OF COURSE TO
// PORT: SOURCE SERVICE_ROUTINES.agc:82
//# EBANK SETTING.  A "NAMED" BIT, AS THE WORD IS USED HERE, IS ANY BIT WITH A NAME FORMALLY ASSIGNED BY THE YUL
// PORT: SOURCE SERVICE_ROUTINES.agc:83
//# ASSEMBLER.
// PORT: SOURCE SERVICE_ROUTINES.agc:84
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:85
//#	AT PRESENT THE ONLY NAMED BITS ARE THOSE IN THE FLAGWORDS.  ASSEMBLER CHANGES WILL MAKE IT POSSIBLE TO
// PORT: SOURCE SERVICE_ROUTINES.agc:86
//# NAME ANY BIT IN ERASABLE MEMORY.
// PORT: SOURCE SERVICE_ROUTINES.agc:87
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:88
//#	CALLING SEQUENCES ARE AS FOLLOWS:-
// PORT: SOURCE SERVICE_ROUTINES.agc:89
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:90
//#			TC	UPFLAG			TC	DOWNFLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:91
//#			ADRES	NAME OF FLAG		ADRES	NAME OF FLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:92
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:93
//#	RETURN IS TO THE LOCATION FOLLOWING THE "ADRES" ABOUT .58 MS AFTER THE "TC".
// PORT: SOURCE SERVICE_ROUTINES.agc:94
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:95
//#	UPON RETURN A CONTAINS THE CURRENT FLAGWRD SETTING.
// PORT: SOURCE SERVICE_ROUTINES.agc:96
//
// PORT: SOURCE SERVICE_ROUTINES.agc:97
//		BLOCK	02
// PORT: SOURCE SERVICE_ROUTINES.agc:98
//		SETLOC	FFTAG1
// PORT: SOURCE SERVICE_ROUTINES.agc:99
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:100
//		COUNT*	$$/FLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:101
//
// PORT: SOURCE SERVICE_ROUTINES.agc:102
//UPFLAG		CA	Q
// PORT: Fixed ROM slots 4966.
            if slot <> 4966 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4967 {
// PORT: SOURCE SERVICE_ROUTINES.agc:103
//		TC	DEBIT
// PORT: Fixed ROM slots 4967.
                if slot <> 4967 or instruction <> 2932 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2932, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:104
//		COM			# +(15 - BIT)
// PORT: Fixed ROM slots 4968.
                if slot <> 4968 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4969 {
// PORT: SOURCE SERVICE_ROUTINES.agc:105
//		EXTEND
// PORT: Fixed ROM slots 4969.
            if slot <> 4969 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4970 {
// PORT: SOURCE SERVICE_ROUTINES.agc:106
//		ROR	LCHAN		# SET BIT
// PORT: Fixed ROM slots 4970.
                if slot <> 4970 or instruction <> 2049 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:107
//COMFLAG		INDEX	ITEMP1
// PORT: Fixed ROM slots 4971.
                if slot <> 4971 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[220] to agcAotUnit220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:108
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 4972.
    4972, 45176
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4973–4985.
function agcAotUnit221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4978 {
        if slot <= 4975 {
            if slot <= 4973 {
// PORT: SOURCE SERVICE_ROUTINES.agc:109
//		LXCH	ITEMP3
// PORT: Fixed ROM slots 4973.
                if slot <> 4973 or instruction <> 9267 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 51, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4974 {
// PORT: SOURCE SERVICE_ROUTINES.agc:110
//		RELINT
// PORT: Fixed ROM slots 4974.
                    if slot <> 4974 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:111
//		TC	L
// PORT: Fixed ROM slots 4975.
                    if slot <> 4975 or instruction <> 1 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4976 {
// PORT: SOURCE SERVICE_ROUTINES.agc:112
//
// PORT: SOURCE SERVICE_ROUTINES.agc:113
//
// PORT: SOURCE SERVICE_ROUTINES.agc:114
//DOWNFLAG	CA	Q
// PORT: Fixed ROM slots 4976.
                if slot <> 4976 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4977 {
// PORT: SOURCE SERVICE_ROUTINES.agc:115
//		TC	DEBIT
// PORT: Fixed ROM slots 4977.
                    if slot <> 4977 or instruction <> 2932 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2932, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:116
//		MASK	L		# RESET BIT
// PORT: Fixed ROM slots 4978.
                    if slot <> 4978 or instruction <> 28673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4981 {
            if slot <= 4979 {
// PORT: SOURCE SERVICE_ROUTINES.agc:117
//		TCF	COMFLAG
// PORT: Fixed ROM slots 4979.
                if slot <> 4979 or instruction <> 7019 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7019, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4980 {
// PORT: SOURCE SERVICE_ROUTINES.agc:118
//
// PORT: SOURCE SERVICE_ROUTINES.agc:119
//
// PORT: SOURCE SERVICE_ROUTINES.agc:120
//DEBIT		AD	ONE		# GET DE BITS
// PORT: Fixed ROM slots 4980.
                    if slot <> 4980 or instruction <> 27151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:121
//		INHINT
// PORT: Fixed ROM slots 4981.
                    if slot <> 4981 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4983 {
                if slot <= 4982 {
// PORT: SOURCE SERVICE_ROUTINES.agc:122
//		TS	ITEMP3
// PORT: Fixed ROM slots 4982.
                    if slot <> 4982 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:123
//		CA	LOW4		# DEC15
// PORT: Fixed ROM slots 4983.
                    if slot <> 4983 or instruction <> 14870 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4984 {
// PORT: SOURCE SERVICE_ROUTINES.agc:124
//		TS	ITEMP1
// PORT: Fixed ROM slots 4984.
                    if slot <> 4984 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:125
//		INDEX	ITEMP3
// PORT: Fixed ROM slots 4985.
                    if slot <> 4985 or instruction <> 20531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20531, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[221] to agcAotUnit221@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:126
//		CA	0 -1		# ADRES
// PORT: Fixed ROM slots 4986.
    4986, 24574
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4987–4992.
function agcAotUnit222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4989 {
        if slot <= 4987 {
// PORT: SOURCE SERVICE_ROUTINES.agc:127
//		TS	L
// PORT: Fixed ROM slots 4987.
            if slot <> 4987 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4988 {
// PORT: SOURCE SERVICE_ROUTINES.agc:128
//		CA	ZERO
// PORT: Fixed ROM slots 4988.
                if slot <> 4988 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:129
//# Page 1487
// PORT: SOURCE SERVICE_ROUTINES.agc:130
//		EXTEND
// PORT: Fixed ROM slots 4989.
                if slot <> 4989 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4990 {
// PORT: SOURCE SERVICE_ROUTINES.agc:131
//		DV	ITEMP1		# A = FLAGWRD, L = (15 - BIT)
// PORT: Fixed ROM slots 4990.
            if slot <> 4990 or instruction <> 4145 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreDv(words, 49, readEffective:call(words, 49)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4991 {
// PORT: SOURCE SERVICE_ROUTINES.agc:132
//		DXCH	ITEMP1
// PORT: Fixed ROM slots 4991.
                if slot <> 4991 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:133
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 4992.
                if slot <> 4992 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[222] to agcAotUnit222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:134
//		CA	FLAGWRD0
// PORT: Fixed ROM slots 4993.
    4993, 24696
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4994–4995.
function agcAotUnit223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4994 {
// PORT: SOURCE SERVICE_ROUTINES.agc:135
//		TS	L		# CURRENT STATE
// PORT: Fixed ROM slots 4994.
        if slot <> 4994 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:136
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 4995.
        if slot <> 4995 or instruction <> 20530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20530, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20530, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[223] to agcAotUnit223@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:137
//		CS	BIT15		# -(15 - BIT)
// PORT: Fixed ROM slots 4996.
    4996, 37890
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4997–4997.
function agcAotUnit224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:138
//		TC	Q
// PORT: Fixed ROM slots 4997.
    if slot <> 4997 or instruction <> 2 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[224] to agcAotUnit224@.

// PORT: Physical bank 00. Shared continuation entries, slots 3034–3038.
function agcAotUnit45 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3035 {
        if slot <= 3034 {
// PORT: SOURCE SERVICE_ROUTINES.agc:139
//
// PORT: SOURCE SERVICE_ROUTINES.agc:140
//# Page 1488
// PORT: SOURCE SERVICE_ROUTINES.agc:141
//# DELAYJOB- A GENERAL ROUTINE TO DELAY A JOB A SPECIFIC AMOUNT OF TIME BEFORE PICKING UP AGAIN.
// PORT: SOURCE SERVICE_ROUTINES.agc:142
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:143
//# ENTRANCE REQUIREMENTS...
// PORT: SOURCE SERVICE_ROUTINES.agc:144
//#		CAF	DT		# DELAY JOB FOR DT CENTISECS
// PORT: SOURCE SERVICE_ROUTINES.agc:145
//#		TC	BANKCALL
// PORT: SOURCE SERVICE_ROUTINES.agc:146
//#		CADR	DELAYJOB
// PORT: SOURCE SERVICE_ROUTINES.agc:147
//
// PORT: SOURCE SERVICE_ROUTINES.agc:148
//		BANK	06
// PORT: SOURCE SERVICE_ROUTINES.agc:149
//		SETLOC	DLAYJOB
// PORT: SOURCE SERVICE_ROUTINES.agc:150
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:151
//
// PORT: SOURCE SERVICE_ROUTINES.agc:152
//# THIS MUST REMAIN IN BANK 0 ****************************************
// PORT: SOURCE SERVICE_ROUTINES.agc:153
//
// PORT: SOURCE SERVICE_ROUTINES.agc:154
//		COUNT	00/DELAY
// PORT: SOURCE SERVICE_ROUTINES.agc:155
//
// PORT: SOURCE SERVICE_ROUTINES.agc:156
//DELAYJOB	INHINT
// PORT: Fixed ROM slots 3034.
            if slot <> 3034 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:157
//		TS	Q		# STORE DELAY DT IN Q FOR DLY -1 IN
// PORT: Fixed ROM slots 3035.
            if slot <> 3035 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3036 {
// PORT: SOURCE SERVICE_ROUTINES.agc:158
//
// PORT: SOURCE SERVICE_ROUTINES.agc:159
//		CAF	DELAYNUM	# WAITLIST
// PORT: Fixed ROM slots 3036.
            if slot <> 3036 or instruction <> 15500 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3037 {
// PORT: SOURCE SERVICE_ROUTINES.agc:160
//DELLOOP		TS	RUPTREG1
// PORT: Fixed ROM slots 3037.
                if slot <> 3037 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:161
//		INDEX	A
// PORT: Fixed ROM slots 3038.
                if slot <> 3038 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[45] to agcAotUnit45@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:162
//		CA	DELAYLOC	# IS THIS DELAYLOC AVAILABLE
// PORT: Fixed ROM slots 3039.
    3039, 25794
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3040–3044.
function agcAotUnit46 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3041 {
        if slot <= 3040 {
// PORT: SOURCE SERVICE_ROUTINES.agc:163
//		EXTEND
// PORT: Fixed ROM slots 3040.
            if slot <> 3040 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:164
//		BZF	OK2DELAY	# YES
// PORT: Fixed ROM slots 3041.
            if slot <> 3041 or instruction <> 6118 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3042 {
// PORT: SOURCE SERVICE_ROUTINES.agc:165
//
// PORT: SOURCE SERVICE_ROUTINES.agc:166
//		CCS	RUPTREG1	# NO, TRY NEXT DELAYLOC
// PORT: Fixed ROM slots 3042.
            if slot <> 3042 or instruction <> 4152 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 56).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3043 {
// PORT: SOURCE SERVICE_ROUTINES.agc:167
//		TCF	DELLOOP
// PORT: Fixed ROM slots 3043.
                if slot <> 3043 or instruction <> 6109 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6109, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:168
//
// PORT: SOURCE SERVICE_ROUTINES.agc:169
//		TC	BAILOUT		# NO AVAILABLE LOCS AVAILABLE.
// PORT: Fixed ROM slots 3044.
                if slot <> 3044 or instruction <> 4077 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4077, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[46] to agcAotUnit46@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:170
//		OCT	1104
// PORT: Fixed ROM slots 3045.
    3045, 1160
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3046–3054.
function agcAotUnit47 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3049 {
        if slot <= 3047 {
            if slot <= 3046 {
// PORT: SOURCE SERVICE_ROUTINES.agc:171
//
// PORT: SOURCE SERVICE_ROUTINES.agc:172
//OK2DELAY	CA	TCSLEEP		# SET WAITLIST IMMEDIATE RETURN
// PORT: Fixed ROM slots 3046.
                if slot <> 3046 or instruction <> 14326 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2038), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:173
//		TS	WAITEXIT
// PORT: Fixed ROM slots 3047.
                if slot <> 3047 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3048 {
// PORT: SOURCE SERVICE_ROUTINES.agc:174
//
// PORT: SOURCE SERVICE_ROUTINES.agc:175
//		CA	FBANK
// PORT: Fixed ROM slots 3048.
                if slot <> 3048 or instruction <> 12292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 4).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:176
//		AD	RUPTREG1	# STORE BBANK FOR TASK CALL
// PORT: Fixed ROM slots 3049.
                if slot <> 3049 or instruction <> 24632 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3051 {
            if slot <= 3050 {
// PORT: SOURCE SERVICE_ROUTINES.agc:177
//		TS	L
// PORT: Fixed ROM slots 3050.
                if slot <> 3050 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:178
//
// PORT: SOURCE SERVICE_ROUTINES.agc:179
//		CAF	WAKECAD		# STORE CADR FOR TASK CALL
// PORT: Fixed ROM slots 3051.
                if slot <> 3051 or instruction <> 14327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2039), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3052 {
// PORT: SOURCE SERVICE_ROUTINES.agc:180
//		TCF	DLY2 -1		# DLY IS IN WAITLIST ROUTINE
// PORT: Fixed ROM slots 3052.
                if slot <> 3052 or instruction <> 6829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6829, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3053 {
// PORT: SOURCE SERVICE_ROUTINES.agc:181
//
// PORT: SOURCE SERVICE_ROUTINES.agc:182
//TCGETCAD	TC	MAKECADR	# GET CALLERS FCADR
// PORT: Fixed ROM slots 3053.
                    if slot <> 3053 or instruction <> 2505 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:183
//
// PORT: SOURCE SERVICE_ROUTINES.agc:184
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 3054.
                    if slot <> 3054 or instruction <> 20536 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20536, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20536, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[47] to agcAotUnit47@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:185
//		TS	DELAYLOC	# SAVE DELAY CADRS
// PORT: Fixed ROM slots 3055.
    3055, 46274
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3056–3058.
function agcAotUnit48 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3056 {
// PORT: SOURCE SERVICE_ROUTINES.agc:186
//
// PORT: SOURCE SERVICE_ROUTINES.agc:187
//		TC	JOBSLEEP
// PORT: Fixed ROM slots 3056.
        if slot <> 3056 or instruction <> 2685 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2685, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3057 {
// PORT: SOURCE SERVICE_ROUTINES.agc:188
//
// PORT: SOURCE SERVICE_ROUTINES.agc:189
//WAKER		CAF	ZERO
// PORT: Fixed ROM slots 3057.
            if slot <> 3057 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:190
//		INDEX	BBANK
// PORT: Fixed ROM slots 3058.
            if slot <> 3058 or instruction <> 20486 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20486, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20486, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[48] to agcAotUnit48@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:191
//		XCH	DELAYLOC	# MAKE DELAYLOC AVAILABLE
// PORT: Fixed ROM slots 3059.
    3059, 48322
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3060–3061.
function agcAotUnit49 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3060 {
// PORT: SOURCE SERVICE_ROUTINES.agc:192
//# Page 1489
// PORT: SOURCE SERVICE_ROUTINES.agc:193
//		TC	JOBWAKE
// PORT: Fixed ROM slots 3060.
        if slot <> 3060 or instruction <> 2689 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2689, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:194
//
// PORT: SOURCE SERVICE_ROUTINES.agc:195
//		TC	TASKOVER
// PORT: Fixed ROM slots 3061.
        if slot <> 3061 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[49] to agcAotUnit49@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:196
//
// PORT: SOURCE SERVICE_ROUTINES.agc:197
//TCSLEEP		GENADR	TCGETCAD -2
// PORT: Fixed ROM slots 3062.
    3062, 4054,
// PORT: SOURCE SERVICE_ROUTINES.agc:198
//WAKECAD		GENADR	WAKER
// PORT: Fixed ROM slots 3063.
    3063, 4066
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4998–5000.
function agcAotUnit225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4998 {
// PORT: SOURCE SERVICE_ROUTINES.agc:199
//
// PORT: SOURCE SERVICE_ROUTINES.agc:200
//# Page 1490
// PORT: SOURCE SERVICE_ROUTINES.agc:201
//# GENTRAN, A BLOCK TRANSFER ROUTINE.
// PORT: SOURCE SERVICE_ROUTINES.agc:202
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:203
//# WRITTEN BY D. EYLES
// PORT: SOURCE SERVICE_ROUTINES.agc:204
//# MOD 1 BY KERNAN				UTILITYM REV 17 11/18/67
// PORT: SOURCE SERVICE_ROUTINES.agc:205
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:206
//# MOD 2 BY SCHULENBERG (REMOVE RELINT)	SKIPPER REV 4 2/28/68
// PORT: SOURCE SERVICE_ROUTINES.agc:207
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:208
//#	THIS ROUTINE IS USEFULL FOR TRANSFERING N CONSECUTIVE ERASABLE OR FIXED QUANTITIES TO SOME OTHER N
// PORT: SOURCE SERVICE_ROUTINES.agc:209
//# CONSECUTIVE ERASABLE LOCATIONS.  IF BOTH BLOCKS OF DATA ARE IN SWITCHABLE EBANKS, THEY MUST BE IN THE SAME ONE.
// PORT: SOURCE SERVICE_ROUTINES.agc:210
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:211
//#	GENTRAN IS CALLABLE IN A JOB AS WELL AS A RUPT.  THE CALLING SEQUENCE IS:
// PORT: SOURCE SERVICE_ROUTINES.agc:212
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:213
//#					I	CA	N-1		# # OF QUANTITIES MINUS ONE.
// PORT: SOURCE SERVICE_ROUTINES.agc:214
//#					I +1	TC	GENTRAN		# IN FIXED-FIXED.
// PORT: SOURCE SERVICE_ROUTINES.agc:215
//#					I +2	ADRES	L		# STARTING ADRES OF DATA TO BE MOVED.
// PORT: SOURCE SERVICE_ROUTINES.agc:216
//#					I +3	ADRES	M		# STARTING ADRES OF DUPLICATION BLOCK.
// PORT: SOURCE SERVICE_ROUTINES.agc:217
//#					I +4				# RETURNS HERE.
// PORT: SOURCE SERVICE_ROUTINES.agc:218
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:219
//#	GENTRAN TAKES 25 MCT'S (300 MICROSECONDS) PER ITEM + 5 MCT'S (60 MICS) FOR ENTERING AND EXITING.
// PORT: SOURCE SERVICE_ROUTINES.agc:220
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:221
//#	A, L AND ITEMP1 ARE NOT PRESERVED.
// PORT: SOURCE SERVICE_ROUTINES.agc:222
//
// PORT: SOURCE SERVICE_ROUTINES.agc:223
//		BLOCK	02
// PORT: SOURCE SERVICE_ROUTINES.agc:224
//		SETLOC	FFTAG4
// PORT: SOURCE SERVICE_ROUTINES.agc:225
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:226
//
// PORT: SOURCE SERVICE_ROUTINES.agc:227
//		EBANK=	ITEMP1
// PORT: SOURCE SERVICE_ROUTINES.agc:228
//
// PORT: SOURCE SERVICE_ROUTINES.agc:229
//		COUNT*	$$/TRAN
// PORT: SOURCE SERVICE_ROUTINES.agc:230
//
// PORT: SOURCE SERVICE_ROUTINES.agc:231
//GENTRAN		INHINT
// PORT: Fixed ROM slots 4998.
        if slot <> 4998 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4999 {
// PORT: SOURCE SERVICE_ROUTINES.agc:232
//		TS	ITEMP1		# SAVE N-1.
// PORT: Fixed ROM slots 4999.
            if slot <> 4999 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:233
//		INDEX	Q		# C(Q) = ADRES L.
// PORT: Fixed ROM slots 5000.
            if slot <> 5000 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[225] to agcAotUnit225@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:234
//		AD	0		# ADRES (L + N - 1).
// PORT: Fixed ROM slots 5001.
    5001, 49152
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5002–5002.
function agcAotUnit226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:235
//		INDEX	A
// PORT: Fixed ROM slots 5002.
    if slot <> 5002 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[226] to agcAotUnit226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:236
//		CA	0		# C(ABOVE).
// PORT: Fixed ROM slots 5003.
    5003, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5004–5006.
function agcAotUnit227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5004 {
// PORT: SOURCE SERVICE_ROUTINES.agc:237
//		TS	L		# SAVE DATA.
// PORT: Fixed ROM slots 5004.
        if slot <> 5004 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5005 {
// PORT: SOURCE SERVICE_ROUTINES.agc:238
//		CA	ITEMP1
// PORT: Fixed ROM slots 5005.
            if slot <> 5005 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:239
//		INDEX	Q
// PORT: Fixed ROM slots 5006.
            if slot <> 5006 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[227] to agcAotUnit227@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:240
//		AD	1		# ADRES (M + N - 1).
// PORT: Fixed ROM slots 5007.
    5007, 49154
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5008–5008.
function agcAotUnit228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:241
//		INDEX	A
// PORT: Fixed ROM slots 5008.
    if slot <> 5008 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[228] to agcAotUnit228@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:242
//		LXCH	0		# STUFF IT.
// PORT: Fixed ROM slots 5009.
    5009, 18432
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5010–5031.
function agcAotUnit229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5020 {
        if slot <= 5014 {
            if slot <= 5011 {
                if slot <= 5010 {
// PORT: SOURCE SERVICE_ROUTINES.agc:243
//		CCS	ITEMP1		# LOOP UNTIL N-1 = 0.
// PORT: Fixed ROM slots 5010.
                    if slot <> 5010 or instruction <> 4145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:244
//		TCF	GENTRAN +1
// PORT: Fixed ROM slots 5011.
                    if slot <> 5011 or instruction <> 7047 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7047, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5012 {
// PORT: SOURCE SERVICE_ROUTINES.agc:245
//		TCF	Q+2		# RETURN TO CALLER.
// PORT: Fixed ROM slots 5012.
                    if slot <> 5012 or instruction <> 7624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5013 {
// PORT: SOURCE SERVICE_ROUTINES.agc:246
//
// PORT: SOURCE SERVICE_ROUTINES.agc:247
//# Page 1491
// PORT: SOURCE SERVICE_ROUTINES.agc:248
//# B5OFF		ZERO BIT 5 OF EXTVBACT, WHICH IS SET BY TESTXACT.
// PORT: SOURCE SERVICE_ROUTINES.agc:249
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:250
//#		MAY BE USED AS NEEDED BY ANY EXTENDED VERB WHICH HAS DONE TESTXACT
// PORT: SOURCE SERVICE_ROUTINES.agc:251
//
// PORT: SOURCE SERVICE_ROUTINES.agc:252
//		COUNT*	$$/EXTVB
// PORT: SOURCE SERVICE_ROUTINES.agc:253
//
// PORT: SOURCE SERVICE_ROUTINES.agc:254
//B5OFF		CS	BIT5
// PORT: Fixed ROM slots 5013.
                        if slot <> 5013 or instruction <> 18955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:255
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 5014.
                        if slot <> 5014 or instruction <> 29220 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 548).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 5017 {
                if slot <= 5015 {
// PORT: SOURCE SERVICE_ROUTINES.agc:256
//		TS	EXTVBACT
// PORT: Fixed ROM slots 5015.
                    if slot <> 5015 or instruction <> 23076 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23076, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5016 {
// PORT: SOURCE SERVICE_ROUTINES.agc:257
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 5016.
                        if slot <> 5016 or instruction <> 2703 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2703, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:258
//
// PORT: SOURCE SERVICE_ROUTINES.agc:259
//# Page 1492
// PORT: SOURCE SERVICE_ROUTINES.agc:260
//# SUBROUTINES TO TURN OFF AND TURN ON TRACKER FAIL LIGHT.
// PORT: SOURCE SERVICE_ROUTINES.agc:261
//
// PORT: SOURCE SERVICE_ROUTINES.agc:262
//
// PORT: SOURCE SERVICE_ROUTINES.agc:263
//TRFAILOF	INHINT
// PORT: Fixed ROM slots 5017.
                        if slot <> 5017 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5018 {
// PORT: SOURCE SERVICE_ROUTINES.agc:264
//		CS	OCT40200	# TURN OFF TRACKER LIGHT
// PORT: Fixed ROM slots 5018.
                    if slot <> 5018 or instruction <> 20420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 4036), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5019 {
// PORT: SOURCE SERVICE_ROUTINES.agc:265
//		MASK	DSPTAB +11D
// PORT: Fixed ROM slots 5019.
                        if slot <> 5019 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:266
//		AD	BIT15
// PORT: Fixed ROM slots 5020.
                        if slot <> 5020 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
                }
            }
        }
    } else {
        if slot <= 5025 {
            if slot <= 5022 {
                if slot <= 5021 {
// PORT: SOURCE SERVICE_ROUTINES.agc:267
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 5021.
                    if slot <> 5021 or instruction <> 23070 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23070, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:268
//		CS	OPTMODES	# TO INSURE THAT OCDU FAIL WILL GO ON
// PORT: Fixed ROM slots 5022.
                    if slot <> 5022 or instruction <> 17113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 729).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5023 {
// PORT: SOURCE SERVICE_ROUTINES.agc:269
//		MASK	BIT7		# AGAIN IF IT WAS ON IN ADDITION TO
// PORT: Fixed ROM slots 5023.
                    if slot <> 5023 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5024 {
// PORT: SOURCE SERVICE_ROUTINES.agc:270
//		ADS	OPTMODES	# TRACKER FAIL.
// PORT: Fixed ROM slots 5024.
                        if slot <> 5024 or instruction <> 11993 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:271
//
// PORT: SOURCE SERVICE_ROUTINES.agc:272
//REQ		RELINT
// PORT: Fixed ROM slots 5025.
                        if slot <> 5025 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 5028 {
                if slot <= 5026 {
// PORT: SOURCE SERVICE_ROUTINES.agc:273
//		TC	Q
// PORT: Fixed ROM slots 5026.
                    if slot <> 5026 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5027 {
// PORT: SOURCE SERVICE_ROUTINES.agc:274
//
// PORT: SOURCE SERVICE_ROUTINES.agc:275
//TRFAILON	INHINT
// PORT: Fixed ROM slots 5027.
                        if slot <> 5027 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:276
//		CS	DSPTAB	+11D	# TURN ON
// PORT: Fixed ROM slots 5028.
                        if slot <> 5028 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 5029 {
// PORT: SOURCE SERVICE_ROUTINES.agc:277
//		MASK	OCT40200
// PORT: Fixed ROM slots 5029.
                    if slot <> 5029 or instruction <> 32708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4036), 32768).
                        if fixedOperand = 16512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128 + mod(floor(words[0] / 16384), 2) * 16384).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5030 {
// PORT: SOURCE SERVICE_ROUTINES.agc:278
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 5030.
                        if slot <> 5030 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:279
//		TCF	REQ
// PORT: Fixed ROM slots 5031.
                        if slot <> 5031 or instruction <> 7073 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7073, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[229] to agcAotUnit229@.

