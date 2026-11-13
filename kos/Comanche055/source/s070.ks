// PORT: Original source unit SXTMARK.agc.
// PORT: Physical bank 07. Shared continuation entries, slots 9218–9227.
function agcAotUnit531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9222 {
        if slot <= 9219 {
            if slot <= 9218 {
// PORT: SOURCE SXTMARK.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE SXTMARK.agc:2
//# Filename:	SXTMARK.agc
// PORT: SOURCE SXTMARK.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// PORT: SOURCE SXTMARK.agc:4
//#		is part of the source code for the Command Module's
// PORT: SOURCE SXTMARK.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE SXTMARK.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE SXTMARK.agc:7
//# Reference:	pp. 222-235
// PORT: SOURCE SXTMARK.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE SXTMARK.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE SXTMARK.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE SXTMARK.agc:11
//# Mod history:	16/05/09 FB	Transcription Batch 2 Assignment.
// PORT: SOURCE SXTMARK.agc:12
//#
// PORT: SOURCE SXTMARK.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE SXTMARK.agc:14
//# from scanned documents.
// PORT: SOURCE SXTMARK.agc:15
//#
// PORT: SOURCE SXTMARK.agc:16
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE SXTMARK.agc:17
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE SXTMARK.agc:18
//#
// PORT: SOURCE SXTMARK.agc:19
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE SXTMARK.agc:20
//#
// PORT: SOURCE SXTMARK.agc:21
//#	Prepared by
// PORT: SOURCE SXTMARK.agc:22
//#			Massachusetts Institute of Technology
// PORT: SOURCE SXTMARK.agc:23
//#			75 Cambridge Parkway
// PORT: SOURCE SXTMARK.agc:24
//#			Cambridge, Massachusetts
// PORT: SOURCE SXTMARK.agc:25
//#
// PORT: SOURCE SXTMARK.agc:26
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE SXTMARK.agc:27
//#
// PORT: SOURCE SXTMARK.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE SXTMARK.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE SXTMARK.agc:30
//
// PORT: SOURCE SXTMARK.agc:31
//# Page 222
// PORT: SOURCE SXTMARK.agc:32
//# PROGRAM NAME - SXTMARK					DATE- 5 APRIL 1967
// PORT: SOURCE SXTMARK.agc:33
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS		       LOG SECTION SXTMARK
// PORT: SOURCE SXTMARK.agc:34
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// PORT: SOURCE SXTMARK.agc:35
//
// PORT: SOURCE SXTMARK.agc:36
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE SXTMARK.agc:37
//#	SXTMARK IS CALLED FROM INTERNAL ROUTINES WHICH MAY REQUIRE STAR OR LANDMARK MARKINGS BY THE ASTRONAUT.  IF
// PORT: SOURCE SXTMARK.agc:38
//#	THE MARK SYSTEM IS NOT IN USE, SXTMARK RESERVES A VAC AREA FOR MARKING AND REQUESTS EXECUTION OF THE MKVB51
// PORT: SOURCE SXTMARK.agc:39
//#	ROUTINE VIA THE EXECUTIVE JOB PRIORITY LIST.  R21 USES THIS ROUTINE TO DETERMINE IF THE MARK SYSTEM CAN BE
// PORT: SOURCE SXTMARK.agc:40
//#	USED.  IF YES, SXTMARK RETURNS TO R21 TO PERFORM ITS OWN MARK REQUESTS VIA THE V51 FLASH.
// PORT: SOURCE SXTMARK.agc:41
//
// PORT: SOURCE SXTMARK.agc:42
//# CALLING SEQUENCE-
// PORT: SOURCE SXTMARK.agc:43
//
// PORT: SOURCE SXTMARK.agc:44
//#	CAF	(NO. MARK REQUESTS IN BITS 1-3 OF A)
// PORT: SOURCE SXTMARK.agc:45
//#	TC	BANKCALL
// PORT: SOURCE SXTMARK.agc:46
//#	CADR	SXTMARK
// PORT: SOURCE SXTMARK.agc:47
//
// PORT: SOURCE SXTMARK.agc:48
//# NORMAL EXIT MODE-
// PORT: SOURCE SXTMARK.agc:49
//#	SWRETURN
// PORT: SOURCE SXTMARK.agc:50
//
// PORT: SOURCE SXTMARK.agc:51
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE SXTMARK.agc:52
//#	ABORT
// PORT: SOURCE SXTMARK.agc:53
//
// PORT: SOURCE SXTMARK.agc:54
//# OUTPUT-
// PORT: SOURCE SXTMARK.agc:55
//#	1) MARKSTAT CONTAINS MARK VALUE (BITS 14-12) AND VAC AREA ADDRESS
// PORT: SOURCE SXTMARK.agc:56
//#	2) QPRET = VAC AREA POINTER VALUE
// PORT: SOURCE SXTMARK.agc:57
//#	3) 1ST WORD OF RESERVED VAC AREA SET TO +0
// PORT: SOURCE SXTMARK.agc:58
//#	4) PRIO32 PLACED IN A REGISTER
// PORT: SOURCE SXTMARK.agc:59
//
// PORT: SOURCE SXTMARK.agc:60
//# ERASABLE INITIALIZATION-
// PORT: SOURCE SXTMARK.agc:61
//#	1) BITS 1-3 OF A = NO. MARKS REQUESTED
// PORT: SOURCE SXTMARK.agc:62
//#	2) BITS 2,3 OF EXTVBACT =0
// PORT: SOURCE SXTMARK.agc:63
//#	3) A VAC AREA MUST BE AVAILABLE (WORD 1 = ADDRESS OF VAC AREA)
// PORT: SOURCE SXTMARK.agc:64
//
// PORT: SOURCE SXTMARK.agc:65
//# DEBRIS-
// PORT: SOURCE SXTMARK.agc:66
//#	A,Q,L,RUPTREG1,MARKSTAT,QPRET,BIT2 OF EXTVBACT
// PORT: SOURCE SXTMARK.agc:67
//
// PORT: SOURCE SXTMARK.agc:68
//		BANK	13
// PORT: SOURCE SXTMARK.agc:69
//		SETLOC	SXTMARKE
// PORT: SOURCE SXTMARK.agc:70
//		BANK
// PORT: SOURCE SXTMARK.agc:71
//
// PORT: SOURCE SXTMARK.agc:72
//		EBANK=	MRKBUF1
// PORT: SOURCE SXTMARK.agc:73
//		COUNT	07/SXTMK
// PORT: SOURCE SXTMARK.agc:74
//
// PORT: SOURCE SXTMARK.agc:75
//SXTMARK		INHINT
// PORT: Fixed ROM slots 9218.
                if slot <> 9218 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:76
//		TS	RUPTREG1		# NUMBER OF MARKS WANTED
// PORT: Fixed ROM slots 9219.
                if slot <> 9219 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9220 {
// PORT: SOURCE SXTMARK.agc:77
//
// PORT: SOURCE SXTMARK.agc:78
//		CAF	SIX			# BIT2 = MARKING SYSTEM IN USE
// PORT: Fixed ROM slots 9220.
                if slot <> 9220 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9221 {
// PORT: SOURCE SXTMARK.agc:79
//		MASK	EXTVBACT		# BIT3 = EXTENDED VERB IN PROGRESS
// PORT: Fixed ROM slots 9221.
                    if slot <> 9221 or instruction <> 29220 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:80
//		CCS	A
// PORT: Fixed ROM slots 9222.
                    if slot <> 9222 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 9224 {
            if slot <= 9223 {
// PORT: SOURCE SXTMARK.agc:81
//		TC	MKABORT			# SET THEREFORE ABORT
// PORT: Fixed ROM slots 9223.
                if slot <> 9223 or instruction <> 1035 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1035, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:82
//# Page 223
// PORT: SOURCE SXTMARK.agc:83
//		CAF	BIT2			# NOT SET
// PORT: Fixed ROM slots 9224.
                if slot <> 9224 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
            if slot <= 9225 {
// PORT: SOURCE SXTMARK.agc:84
//		ADS	EXTVBACT		# SET IT, RESET IN ENDMARK
// PORT: Fixed ROM slots 9225.
                if slot <> 9225 or instruction <> 11812 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9226 {
// PORT: SOURCE SXTMARK.agc:85
//		TC	MARKOK			# YES, FIND VAC AREA
// PORT: Fixed ROM slots 9226.
                    if slot <> 9226 or instruction <> 1037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:86
//
// PORT: SOURCE SXTMARK.agc:87
//MKABORT		TC	BAILOUT
// PORT: Fixed ROM slots 9227.
                    if slot <> 9227 or instruction <> 4077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[531] to agcAotUnit531@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:88
//		OCT	01211
// PORT: Fixed ROM slots 9228.
    9228, 1298
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9229–9239.
function agcAotUnit532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9233 {
        if slot <= 9230 {
            if slot <= 9229 {
// PORT: SOURCE SXTMARK.agc:89
//MARKOK		CCS	VAC1USE			# FIND VAC AREA
// PORT: Fixed ROM slots 9229.
                if slot <> 9229 or instruction <> 4352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 256).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:90
//		TC	MKVACFND
// PORT: Fixed ROM slots 9230.
                if slot <> 9230 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9231 {
// PORT: SOURCE SXTMARK.agc:91
//		CCS	VAC2USE
// PORT: Fixed ROM slots 9231.
                if slot <> 9231 or instruction <> 4396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 300).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9232 {
// PORT: SOURCE SXTMARK.agc:92
//		TC	MKVACFND
// PORT: Fixed ROM slots 9232.
                    if slot <> 9232 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:93
//		CCS	VAC3USE
// PORT: Fixed ROM slots 9233.
                    if slot <> 9233 or instruction <> 4440 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 344).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9236 {
            if slot <= 9234 {
// PORT: SOURCE SXTMARK.agc:94
//		TC	MKVACFND
// PORT: Fixed ROM slots 9234.
                if slot <> 9234 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9235 {
// PORT: SOURCE SXTMARK.agc:95
//		CCS	VAC4USE
// PORT: Fixed ROM slots 9235.
                    if slot <> 9235 or instruction <> 4484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 388).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:96
//		TC	MKVACFND
// PORT: Fixed ROM slots 9236.
                    if slot <> 9236 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9237 {
// PORT: SOURCE SXTMARK.agc:97
//		CCS	VAC5USE
// PORT: Fixed ROM slots 9237.
                if slot <> 9237 or instruction <> 4528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 432).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9238 {
// PORT: SOURCE SXTMARK.agc:98
//		TC	MKVACFND
// PORT: Fixed ROM slots 9238.
                    if slot <> 9238 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:99
//		TC	BAILOUT
// PORT: Fixed ROM slots 9239.
                    if slot <> 9239 or instruction <> 4077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[532] to agcAotUnit532@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:100
//		OCT	01207
// PORT: Fixed ROM slots 9240.
    9240, 1294
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9241–9243.
function agcAotUnit533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9241 {
// PORT: SOURCE SXTMARK.agc:101
//
// PORT: SOURCE SXTMARK.agc:102
//MKVACFND	AD	TWO			# ADDRESS OF VAC AREA
// PORT: Fixed ROM slots 9241.
        if slot <> 9241 or instruction <> 27150 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9242 {
// PORT: SOURCE SXTMARK.agc:103
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9242.
            if slot <> 9242 or instruction <> 23256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:104
//		INDEX	A
// PORT: Fixed ROM slots 9243.
            if slot <> 9243 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[533] to agcAotUnit533@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:105
//		TS	QPRET			# STORE NEXT AVAILABLE MARK SLOT
// PORT: Fixed ROM slots 9244.
    9244, 45140
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9245–9246.
function agcAotUnit534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9245 {
// PORT: SOURCE SXTMARK.agc:106
//
// PORT: SOURCE SXTMARK.agc:107
//		CAF	ZERO			# STORE VAC AREA OCCUPIED
// PORT: Fixed ROM slots 9245.
        if slot <> 9245 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:108
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 9246.
        if slot <> 9246 or instruction <> 21208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[534] to agcAotUnit534@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:109
//		TS	0	-1
// PORT: Fixed ROM slots 9247.
    9247, 45054
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9248–9248.
function agcAotUnit535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SXTMARK.agc:110
//
// PORT: SOURCE SXTMARK.agc:111
//		TC	CHECKMM			# BACKUP MARK ROUTINE USES SXTMARK
// PORT: Fixed ROM slots 9248.
    if slot <> 9248 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[535] to agcAotUnit535@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:112
//		MM	53
// PORT: Fixed ROM slots 9249.
    9249, 106
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9250–9252.
function agcAotUnit536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9250 {
// PORT: SOURCE SXTMARK.agc:113
//		TCF	+2
// PORT: Fixed ROM slots 9250.
        if slot <> 9250 or instruction <> 5156 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5156, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9251 {
// PORT: SOURCE SXTMARK.agc:114
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9251.
            if slot <> 9251 or instruction <> 6589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6589, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:115
//		TC	CHECKMM
// PORT: Fixed ROM slots 9252.
            if slot <> 9252 or instruction <> 2804 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2804, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[536] to agcAotUnit536@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:116
//		MM	54
// PORT: Fixed ROM slots 9253.
    9253, 108
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9254–9262.
function agcAotUnit537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9257 {
        if slot <= 9255 {
            if slot <= 9254 {
// PORT: SOURCE SXTMARK.agc:117
//		TCF	+2
// PORT: Fixed ROM slots 9254.
                if slot <> 9254 or instruction <> 5160 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5160, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:118
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9255.
                if slot <> 9255 or instruction <> 6589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9256 {
// PORT: SOURCE SXTMARK.agc:119
//		CAF	BIT12			# DESIRED NUMBER OF MARKS IN 12-14
// PORT: Fixed ROM slots 9256.
                if slot <> 9256 or instruction <> 14852 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:120
//		EXTEND
// PORT: Fixed ROM slots 9257.
                if slot <> 9257 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9259 {
            if slot <= 9258 {
// PORT: SOURCE SXTMARK.agc:121
//		MP	RUPTREG1
// PORT: Fixed ROM slots 9258.
                if slot <> 9258 or instruction <> 28728 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 56, readEffective:call(words, 56)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:122
//		XCH	L
// PORT: Fixed ROM slots 9259.
                if slot <> 9259 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9260 {
// PORT: SOURCE SXTMARK.agc:123
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9260.
                if slot <> 9260 or instruction <> 11992 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9261 {
// PORT: SOURCE SXTMARK.agc:124
//
// PORT: SOURCE SXTMARK.agc:125
//		CAF	PRIO32			# ENTER MARK JOB
// PORT: Fixed ROM slots 9261.
                    if slot <> 9261 or instruction <> 16311 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4023), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:126
//		TC	NOVAC
// PORT: Fixed ROM slots 9262.
                    if slot <> 9262 or instruction <> 2652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2652, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[537] to agcAotUnit537@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:127
//		EBANK=	MARKSTAT
// PORT: SOURCE SXTMARK.agc:128
//		2CADR	MKVB51
// PORT: Fixed ROM slots 9263 9264.
    9263, 2510, 9264, 14436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9265–9271.
function agcAotUnit538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9267 {
        if slot <= 9265 {
// PORT: SOURCE SXTMARK.agc:129
//
// PORT: SOURCE SXTMARK.agc:130
//		RELINT
// PORT: Fixed ROM slots 9265.
            if slot <> 9265 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9266 {
// PORT: SOURCE SXTMARK.agc:131
//		TCF	SWRETURN		# SAME AS MODEEXIT
// PORT: Fixed ROM slots 9266.
                if slot <> 9266 or instruction <> 6589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:132
//
// PORT: SOURCE SXTMARK.agc:133
//# Page 224
// PORT: SOURCE SXTMARK.agc:134
//# PROGRAM NAME - MKRELEAS					DATE- 5 APRIL 1967
// PORT: SOURCE SXTMARK.agc:135
//# PROGRAM MODIFIED BY 248/278 PROGRAMMERS		       LOG SECTION SXTMARK
// PORT: SOURCE SXTMARK.agc:136
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// PORT: SOURCE SXTMARK.agc:137
//
// PORT: SOURCE SXTMARK.agc:138
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE SXTMARK.agc:139
//#	MKRELEAS IS EXECUTED BY INTERNAL ROUTINES TO RELEASE THE MARK SYSTEM TO MAKE IT AVAILABLE TO OTHER INTERNAL
// PORT: SOURCE SXTMARK.agc:140
//#	SYSTEM ROUTINES.  IT ALSO CLEARS THE COARSE OPTICS FLAG BIT AND DISABLES THE OPTICS ERROR COUNTER.
// PORT: SOURCE SXTMARK.agc:141
//
// PORT: SOURCE SXTMARK.agc:142
//# CALLING SEQUENCE-
// PORT: SOURCE SXTMARK.agc:143
//
// PORT: SOURCE SXTMARK.agc:144
//#	TC	BANKCALL
// PORT: SOURCE SXTMARK.agc:145
//#	CADR	MKRELEAS
// PORT: SOURCE SXTMARK.agc:146
//
// PORT: SOURCE SXTMARK.agc:147
//# NORMAL EXIT MODE-
// PORT: SOURCE SXTMARK.agc:148
//#	SWRETURN
// PORT: SOURCE SXTMARK.agc:149
//
// PORT: SOURCE SXTMARK.agc:150
//# ALARM OR ABORT EXIT MODE- NONE
// PORT: SOURCE SXTMARK.agc:151
//
// PORT: SOURCE SXTMARK.agc:152
//# OUTPUT-
// PORT: SOURCE SXTMARK.agc:153
//#	1) BIT9 OPTMODES SET TO 0
// PORT: SOURCE SXTMARK.agc:154
//#	2) OPTIND SET TO -1
// PORT: SOURCE SXTMARK.agc:155
//#	3) 1ST WORD OF VAC AREA SET TO VAC ADDRESS TO SIGNIFY AVAILABILITY.
// PORT: SOURCE SXTMARK.agc:156
//#	4) MARKSTAT CLEARED
// PORT: SOURCE SXTMARK.agc:157
//#	5) BIT2 CHANNEL 12 SET TO 0
// PORT: SOURCE SXTMARK.agc:158
//
// PORT: SOURCE SXTMARK.agc:159
//# ERASABLE INITIALIZATION- NONE
// PORT: SOURCE SXTMARK.agc:160
//
// PORT: SOURCE SXTMARK.agc:161
//# DEBRIS-
// PORT: SOURCE SXTMARK.agc:162
//#	A,MARKSTAT,BIT9,OPTMODES OPTIND,BIT2 CHANNEL 12
// PORT: SOURCE SXTMARK.agc:163
//
// PORT: SOURCE SXTMARK.agc:164
//MKRELEAS	CAF	ZERO			# SHOW MARK SYSTEM NOW AVAILABLE
// PORT: Fixed ROM slots 9267.
                if slot <> 9267 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 9269 {
            if slot <= 9268 {
// PORT: SOURCE SXTMARK.agc:165
//		XCH	MARKSTAT
// PORT: Fixed ROM slots 9268.
                if slot <> 9268 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:166
//		MASK	LOW9
// PORT: Fixed ROM slots 9269.
                if slot <> 9269 or instruction <> 31270 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                    if fixedOperand = 511 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9270 {
// PORT: SOURCE SXTMARK.agc:167
//		CCS	A
// PORT: Fixed ROM slots 9270.
                if slot <> 9270 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:168
//		INDEX	A
// PORT: Fixed ROM slots 9271.
                if slot <> 9271 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[538] to agcAotUnit538@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:169
//		TS	0
// PORT: Fixed ROM slots 9272.
    9272, 45056
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9273–9318.
function agcAotUnit539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9295 {
        if slot <= 9283 {
            if slot <= 9277 {
                if slot <= 9274 {
                    if slot <= 9273 {
// PORT: SOURCE SXTMARK.agc:170
//MKRLEES		INHINT
// PORT: Fixed ROM slots 9273.
                        if slot <> 9273 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SXTMARK.agc:171
//		CS	BIT9			# COARSE OPTICS RETURN FLAG.
// PORT: Fixed ROM slots 9274.
                        if slot <> 9274 or instruction <> 18951 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9275 {
// PORT: SOURCE SXTMARK.agc:172
//		MASK	OPTMODES
// PORT: Fixed ROM slots 9275.
                        if slot <> 9275 or instruction <> 29401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9276 {
// PORT: SOURCE SXTMARK.agc:173
//		TS	OPTMODES
// PORT: Fixed ROM slots 9276.
                            if slot <> 9276 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:174
//
// PORT: SOURCE SXTMARK.agc:175
//		CA	NEGONE
// PORT: Fixed ROM slots 9277.
                            if slot <> 9277 or instruction <> 16334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9280 {
                    if slot <= 9278 {
// PORT: SOURCE SXTMARK.agc:176
//		TS	OPTIND			# KILL COARSE OPTICS
// PORT: Fixed ROM slots 9278.
                        if slot <> 9278 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9279 {
// PORT: SOURCE SXTMARK.agc:177
//
// PORT: SOURCE SXTMARK.agc:178
//		CS	BIT2			# DISABLE OPTICS ERROR COUNTER
// PORT: Fixed ROM slots 9279.
                            if slot <> 9279 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:179
//		EXTEND
// PORT: Fixed ROM slots 9280.
                            if slot <> 9280 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9281 {
// PORT: SOURCE SXTMARK.agc:180
//		WAND	CHAN12
// PORT: Fixed ROM slots 9281.
                        if slot <> 9281 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9282 {
// PORT: SOURCE SXTMARK.agc:181
//
// PORT: SOURCE SXTMARK.agc:182
//		RELINT
// PORT: Fixed ROM slots 9282.
                            if slot <> 9282 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:183
//		TC	SWRETURN
// PORT: Fixed ROM slots 9283.
                            if slot <> 9283 or instruction <> 2493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2493, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9289 {
                if slot <= 9286 {
                    if slot <= 9284 {
// PORT: SOURCE SXTMARK.agc:184
//# Page 225
// PORT: SOURCE SXTMARK.agc:185
//# PROGRAM NAME - MARKRUPT					DATE- 5 APRIL 1967
// PORT: SOURCE SXTMARK.agc:186
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS		       LOG SECTION SXTMARK
// PORT: SOURCE SXTMARK.agc:187
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// PORT: SOURCE SXTMARK.agc:188
//
// PORT: SOURCE SXTMARK.agc:189
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE SXTMARK.agc:190
//#	MARKRUPT STORES CDUS,OPTICS AND TIME AND TRANSFERS CONTROL TO THE MARKIT,MARK REJECT OR KEYCOM ROUTINES IF
// PORT: SOURCE SXTMARK.agc:191
//#	BITS IN CHANNEL 16 ARE SET AS REQUIRED.
// PORT: SOURCE SXTMARK.agc:192
//
// PORT: SOURCE SXTMARK.agc:193
//# CALLING SEQUENCE-
// PORT: SOURCE SXTMARK.agc:194
//#	ROUTINE ENTERED VIA KEYRUPT2 WHEN MARK,MARK REJECT OR DSKY KEYS DEPRESSED BY THE OPERATOR.
// PORT: SOURCE SXTMARK.agc:195
//
// PORT: SOURCE SXTMARK.agc:196
//# NORMAL EXIT MODE-
// PORT: SOURCE SXTMARK.agc:197
//#	MARKIT, MKREJECT, OR POSTJUMP ROUTINES (MARK,MARK REJECT, OR DSKY CODE)
// PORT: SOURCE SXTMARK.agc:198
//
// PORT: SOURCE SXTMARK.agc:199
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE SXTMARK.agc:200
//#	ALARM AND RESUME
// PORT: SOURCE SXTMARK.agc:201
//
// PORT: SOURCE SXTMARK.agc:202
//# OUTPUT-
// PORT: SOURCE SXTMARK.agc:203
//#	RUPTSTOR+5 = CDUT, RUPTSTOR+3 = CDUS, RUPTSTOR+2 = CDUY,
// PORT: SOURCE SXTMARK.agc:204
//#	RUPTREG3 = CDUZ, RUPTSTOR+6 = CDUX, RUPTSTOR+1 AND SAMPTIME+1 =TIME1,
// PORT: SOURCE SXTMARK.agc:205
//#	RUPTSTOR AND SAMPTIME = TIME2
// PORT: SOURCE SXTMARK.agc:206
//
// PORT: SOURCE SXTMARK.agc:207
//# ERASABLE INITIALIZATION-
// PORT: SOURCE SXTMARK.agc:208
//#	CDUT,CDUS,CDUY,CDUZ,CDUX,TIME2,TIME1,CHANNEL 16 BITS 6,7 OR 1-5
// PORT: SOURCE SXTMARK.agc:209
//
// PORT: SOURCE SXTMARK.agc:210
//# DEBRIS-
// PORT: SOURCE SXTMARK.agc:211
//#	A,QRUPT,RUPTREG3,SAMPTIME,SAMPTIME+1,RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4 (LOCATION 67)
// PORT: SOURCE SXTMARK.agc:212
//
// PORT: SOURCE SXTMARK.agc:213
//MARKRUPT	TS	BANKRUPT		# STORE CDUS AND OPTICS NOW
// PORT: Fixed ROM slots 9284.
                        if slot <> 9284 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9285 {
// PORT: SOURCE SXTMARK.agc:214
//		CA	CDUT
// PORT: Fixed ROM slots 9285.
                            if slot <> 9285 or instruction <> 12317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 29).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:215
//		TS	MKCDUT
// PORT: Fixed ROM slots 9286.
                            if slot <> 9286 or instruction <> 22770 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22770, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9287 {
// PORT: SOURCE SXTMARK.agc:216
//		CA	CDUS
// PORT: Fixed ROM slots 9287.
                        if slot <> 9287 or instruction <> 12318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 30).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9288 {
// PORT: SOURCE SXTMARK.agc:217
//		TS	MKCDUS
// PORT: Fixed ROM slots 9288.
                            if slot <> 9288 or instruction <> 22768 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22768, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:218
//		CA	CDUY
// PORT: Fixed ROM slots 9289.
                            if slot <> 9289 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9292 {
                    if slot <= 9290 {
// PORT: SOURCE SXTMARK.agc:219
//		TS	MKCDUY
// PORT: Fixed ROM slots 9290.
                        if slot <> 9290 or instruction <> 22767 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22767, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9291 {
// PORT: SOURCE SXTMARK.agc:220
//		CA	CDUZ
// PORT: Fixed ROM slots 9291.
                            if slot <> 9291 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:221
//		TS	MKCDUZ
// PORT: Fixed ROM slots 9292.
                            if slot <> 9292 or instruction <> 22769 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22769, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9293 {
// PORT: SOURCE SXTMARK.agc:222
//		CA	CDUX
// PORT: Fixed ROM slots 9293.
                        if slot <> 9293 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9294 {
// PORT: SOURCE SXTMARK.agc:223
//		TS	MKCDUX
// PORT: Fixed ROM slots 9294.
                            if slot <> 9294 or instruction <> 22771 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22771, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:224
//		EXTEND
// PORT: Fixed ROM slots 9295.
                            if slot <> 9295 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 9306 {
            if slot <= 9300 {
                if slot <= 9297 {
                    if slot <= 9296 {
// PORT: SOURCE SXTMARK.agc:225
//		DCA	TIME2			# GET TIME
// PORT: Fixed ROM slots 9296.
                        if slot <> 9296 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SXTMARK.agc:226
//		DXCH	MKT2T1
// PORT: Fixed ROM slots 9297.
                        if slot <> 9297 or instruction <> 21742 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 238, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9298 {
// PORT: SOURCE SXTMARK.agc:227
//		EXTEND
// PORT: Fixed ROM slots 9298.
                        if slot <> 9298 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9299 {
// PORT: SOURCE SXTMARK.agc:228
//		DCA	MKT2T1
// PORT: Fixed ROM slots 9299.
                            if slot <> 9299 or instruction <> 12526 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 238, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:229
//		DXCH	SAMPTIME		# RUPT TIME FOR NOUN 65.
// PORT: Fixed ROM slots 9300.
                            if slot <> 9300 or instruction <> 21516 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 12, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9303 {
                    if slot <= 9301 {
// PORT: SOURCE SXTMARK.agc:230
//
// PORT: SOURCE SXTMARK.agc:231
//		XCH	Q
// PORT: Fixed ROM slots 9301.
                        if slot <> 9301 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9302 {
// PORT: SOURCE SXTMARK.agc:232
//		TS	QRUPT
// PORT: Fixed ROM slots 9302.
                            if slot <> 9302 or instruction <> 22538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:233
//
// PORT: SOURCE SXTMARK.agc:234
//		CAF	BIT6			# SEE IF MARK OR MKREJECT
// PORT: Fixed ROM slots 9303.
                            if slot <> 9303 or instruction <> 14858 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9304 {
// PORT: SOURCE SXTMARK.agc:235
//# Page 226
// PORT: SOURCE SXTMARK.agc:236
//		EXTEND
// PORT: Fixed ROM slots 9304.
                        if slot <> 9304 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9305 {
// PORT: SOURCE SXTMARK.agc:237
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9305.
                            if slot <> 9305 or instruction <> 1038 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:238
//		CCS	A
// PORT: Fixed ROM slots 9306.
                            if slot <> 9306 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 9312 {
                if slot <= 9309 {
                    if slot <= 9307 {
// PORT: SOURCE SXTMARK.agc:239
//		TC	MARKIT			# ITS A MARK
// PORT: Fixed ROM slots 9307.
                        if slot <> 9307 or instruction <> 1304 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1304, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9308 {
// PORT: SOURCE SXTMARK.agc:240
//
// PORT: SOURCE SXTMARK.agc:241
//		CAF	BIT7			# NOT A MARK, SEE IF MKREJECT
// PORT: Fixed ROM slots 9308.
                            if slot <> 9308 or instruction <> 14857 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:242
//		EXTEND
// PORT: Fixed ROM slots 9309.
                            if slot <> 9309 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9310 {
// PORT: SOURCE SXTMARK.agc:243
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9310.
                        if slot <> 9310 or instruction <> 1038 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9311 {
// PORT: SOURCE SXTMARK.agc:244
//		CCS	A
// PORT: Fixed ROM slots 9311.
                            if slot <> 9311 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:245
//		TC	MKREJECT		# ITS A MARK REJECT
// PORT: Fixed ROM slots 9312.
                            if slot <> 9312 or instruction <> 1217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1217, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 9315 {
                    if slot <= 9313 {
// PORT: SOURCE SXTMARK.agc:246
//
// PORT: SOURCE SXTMARK.agc:247
//KEYCALL		CAF	OCT37			# NOT MARK OR MKREJECT, SEE IF KEYCODE
// PORT: Fixed ROM slots 9313.
                        if slot <> 9313 or instruction <> 14578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9314 {
// PORT: SOURCE SXTMARK.agc:248
//		EXTEND
// PORT: Fixed ROM slots 9314.
                            if slot <> 9314 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:249
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9315.
                            if slot <> 9315 or instruction <> 1038 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 9316 {
// PORT: SOURCE SXTMARK.agc:250
//		EXTEND
// PORT: Fixed ROM slots 9316.
                        if slot <> 9316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9317 {
// PORT: SOURCE SXTMARK.agc:251
//		BZF	+3			# IF NO INBITS
// PORT: Fixed ROM slots 9317.
                            if slot <> 9317 or instruction <> 5224 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5224, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SXTMARK.agc:252
//		TC	POSTJUMP
// PORT: Fixed ROM slots 9318.
                            if slot <> 9318 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[539] to agcAotUnit539@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:253
//		CADR	KEYCOM			# IT,S A KEY CODE, NOT A MARK.
// PORT: Fixed ROM slots 9319.
    9319, 16260
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9320–9320.
function agcAotUnit540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SXTMARK.agc:254
//
// PORT: SOURCE SXTMARK.agc:255
//	+3	TC	ALARM			# ALARM IF NO INBITS
// PORT: Fixed ROM slots 9320.
    if slot <> 9320 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[540] to agcAotUnit540@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:256
//		OCT	113
// PORT: Fixed ROM slots 9321.
    9321, 150
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9322–9328.
function agcAotUnit541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9324 {
        if slot <= 9322 {
// PORT: SOURCE SXTMARK.agc:257
//		TC	RESUME
// PORT: Fixed ROM slots 9322.
            if slot <> 9322 or instruction <> 2779 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2779, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9323 {
// PORT: SOURCE SXTMARK.agc:258
//
// PORT: SOURCE SXTMARK.agc:259
//# Page 227
// PORT: SOURCE SXTMARK.agc:260
//# PROGRAM NAME - MARKCONT				DATE- 19 SEPT 1967
// PORT: SOURCE SXTMARK.agc:261
//
// PORT: SOURCE SXTMARK.agc:262
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS	       LOG SECTION SXTMARK
// PORT: SOURCE SXTMARK.agc:263
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION	 ASSEMBLY SUNDISK REV. 116
// PORT: SOURCE SXTMARK.agc:264
//
// PORT: SOURCE SXTMARK.agc:265
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE SXTMARK.agc:266
//#	MARKCONT IS USED TO PERFORM A SPECIAL MARK FUNCTION FOR R21, TO EXECUTE A SPECIAL DISPLAY OF OPTICS AND TIME OR
// PORT: SOURCE SXTMARK.agc:267
//#	 TO PERFORM A MARK OF THE STAR OR LAND SIGHTING BASED UPON FLASHING V-N.
// PORT: SOURCE SXTMARK.agc:268
//
// PORT: SOURCE SXTMARK.agc:269
//# CALLING SEQUENCE-
// PORT: SOURCE SXTMARK.agc:270
//#	FROM MARKDIF
// PORT: SOURCE SXTMARK.agc:271
//
// PORT: SOURCE SXTMARK.agc:272
//# NORMAL EXIT MODE-
// PORT: SOURCE SXTMARK.agc:273
//#	TASKOVER
// PORT: SOURCE SXTMARK.agc:274
//
// PORT: SOURCE SXTMARK.agc:275
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE SXTMARK.agc:276
//#	ALARM AND TASKOVER
// PORT: SOURCE SXTMARK.agc:277
//
// PORT: SOURCE SXTMARK.agc:278
//# OUTPUT-
// PORT: SOURCE SXTMARK.agc:279
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:280
//#	   EBANK=EBANK7
// PORT: SOURCE SXTMARK.agc:281
//#	   MRKBUF1 TO MRKBUF1+6 = TIME2,TIME1,CDUY,OPTICX,CDUZ,OPTICSY,CDUX OF CURRENT R21 MARK FUNCTION.
// PORT: SOURCE SXTMARK.agc:282
//#	   MRKBUF2 TO MRKBUF2+6 CONTAINS PREVIOUS R21 MARK VALUES.
// PORT: SOURCE SXTMARK.agc:283
//#	2) FOR SPECIAL DISPLAY JOB-
// PORT: SOURCE SXTMARK.agc:284
//#	   RUPTREG1 AND MRKBUF1 = CDUS,RUPTREG2 AND MRKBUF1 +1 = CDUT.
// PORT: SOURCE SXTMARK.agc:285
//#	   RUPTREG3 AND MRKBUF1 +2 = TIME2,RUPTREG4 AND MRKBUF1 +3 = TIME1
// PORT: SOURCE SXTMARK.agc:286
//#	3) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:287
//#	   DECREMENT BITS14-12 OF MARKSTAT BY 1,
// PORT: SOURCE SXTMARK.agc:288
//#	   BIT10 MARKSTAT SET TO 1,INCREMENT QPRET BY 7,
// PORT: SOURCE SXTMARK.agc:289
//#	   STORE TIME2,TIME1,CDUY,CDUS,CDUZ,CDUT AND CDUX IN VAC+1 TO VAC+7
// PORT: SOURCE SXTMARK.agc:290
//
// PORT: SOURCE SXTMARK.agc:291
//# ERASABLE INITIALIZATION-
// PORT: SOURCE SXTMARK.agc:292
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:293
//#	   BIT14 OF STATE+2 =1, MRKBUF1 TO MRKBUF1+6, ITEMP1, RUPTREG3,
// PORT: SOURCE SXTMARK.agc:294
//#	   RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4
// PORT: SOURCE SXTMARK.agc:295
//#	2) FOR SPECIAL DISPLAY JOB-
// PORT: SOURCE SXTMARK.agc:296
//#	   BIT14 OF STATE+2 =0,MARKSTAT =+0,RUPTREG1,RUPTREG2,RUPTREG3
// PORT: SOURCE SXTMARK.agc:297
//#	   RUPTREG4,RUPTSTOR,RUPTSTOR+1,RUPTSTOR+3,RUPTSTOR+5,
// PORT: SOURCE SXTMARK.agc:298
//#	   BIT12 OF STATE+5 (V59 FLAG),MRKBUF1 THRU MRKBUF1+3
// PORT: SOURCE SXTMARK.agc:299
//#	3) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:300
//#	   BIT14 OF STATE+2 =0,MARKSTAE =VAC ADDRESS, A REG, ITEMP1, RUPTREG3,
// PORT: SOURCE SXTMARK.agc:301
//#	   RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4.
// PORT: SOURCE SXTMARK.agc:302
//
// PORT: SOURCE SXTMARK.agc:303
//# DEBRIS-
// PORT: SOURCE SXTMARK.agc:304
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:305
//#	   A,ITEMP1,MRKBUF1,MRKBUF2
// PORT: SOURCE SXTMARK.agc:306
//#	2) FOR SPECIAL DISPLAY JOB-
// PORT: SOURCE SXTMARK.agc:307
//#	   A,RUPTREG1,RUPTREG2,RUPTREG3,RUPTREG4,MPAC TO MPAC+3
// PORT: SOURCE SXTMARK.agc:308
//#	3) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:309
//#	   A,MARKSTAT,ITEMP1,QPRET,VAC+1 TO VAC+7 OF VAC AREA IN USE
// PORT: SOURCE SXTMARK.agc:310
//
// PORT: SOURCE SXTMARK.agc:311
//# Page 228
// PORT: SOURCE SXTMARK.agc:312
//MARKCONT	CAF	BIT14
// PORT: Fixed ROM slots 9323.
                if slot <> 9323 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:313
//		MASK	STATE	+2		# R21 MARK (SPECIAL MARKING FOR R21)
// PORT: Fixed ROM slots 9324.
                if slot <> 9324 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9326 {
            if slot <= 9325 {
// PORT: SOURCE SXTMARK.agc:314
//		EXTEND
// PORT: Fixed ROM slots 9325.
                if slot <> 9325 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:315
//		BZF	MARKET			# NOT SET THEREFORE REGULAR MARKING
// PORT: Fixed ROM slots 9326.
                if slot <> 9326 or instruction <> 5240 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5240, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9327 {
// PORT: SOURCE SXTMARK.agc:316
//MARKIT1		CAF	SIX			# SPECIAL FOR R21
// PORT: Fixed ROM slots 9327.
                if slot <> 9327 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:317
//		TC	GENTRAN			# TRANSFER MRKBUF1 TO MRKBUF2
// PORT: Fixed ROM slots 9328.
                if slot <> 9328 or instruction <> 2950 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2950, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[541] to agcAotUnit541@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:318
//		ADRES	MRKBUF1
// PORT: Fixed ROM slots 9329.
    9329, 1962,
// PORT: SOURCE SXTMARK.agc:319
//		ADRES	MRKBUF2
// PORT: Fixed ROM slots 9330.
    9330, 1976
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9331–9332.
function agcAotUnit542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9331 {
// PORT: SOURCE SXTMARK.agc:320
//
// PORT: SOURCE SXTMARK.agc:321
//		CAF	SIX			# TRANSFER CURRENT MARK DATA TO MARKBUF1
// PORT: Fixed ROM slots 9331.
        if slot <> 9331 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:322
//		TC	GENTRAN
// PORT: Fixed ROM slots 9332.
        if slot <> 9332 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[542] to agcAotUnit542@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:323
//		ADRES	MKT2T1
// PORT: Fixed ROM slots 9333.
    9333, 474,
// PORT: SOURCE SXTMARK.agc:324
//		ADRES	MRKBUF1
// PORT: Fixed ROM slots 9334.
    9334, 1962
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9335–9347.
function agcAotUnit543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9340 {
        if slot <= 9337 {
            if slot <= 9335 {
// PORT: SOURCE SXTMARK.agc:325
//
// PORT: SOURCE SXTMARK.agc:326
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9335.
                if slot <> 9335 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9336 {
// PORT: SOURCE SXTMARK.agc:327
//
// PORT: SOURCE SXTMARK.agc:328
//MARKET		CCS	MARKSTAT		# SEE IF MARKS CALLED FOR
// PORT: Fixed ROM slots 9336.
                    if slot <> 9336 or instruction <> 4824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 728).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:329
//		TC	MARK2			# COLLECT MARKS
// PORT: Fixed ROM slots 9337.
                    if slot <> 9337 or instruction <> 1173 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1173, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9338 {
// PORT: SOURCE SXTMARK.agc:330
//
// PORT: SOURCE SXTMARK.agc:331
//		CAF	TWO			# IS MARKING SYSTEM IN USE (BIT2)
// PORT: Fixed ROM slots 9338.
                if slot <> 9338 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9339 {
// PORT: SOURCE SXTMARK.agc:332
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 9339.
                    if slot <> 9339 or instruction <> 29220 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:333
//		EXTEND
// PORT: Fixed ROM slots 9340.
                    if slot <> 9340 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9343 {
            if slot <= 9341 {
// PORT: SOURCE SXTMARK.agc:334
//		BZF	MARKET3			# MARKING NOT CALLED FOR
// PORT: Fixed ROM slots 9341.
                if slot <> 9341 or instruction <> 5263 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5263, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9342 {
// PORT: SOURCE SXTMARK.agc:335
//		CAF	BIT12
// PORT: Fixed ROM slots 9342.
                    if slot <> 9342 or instruction <> 14852 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:336
//		MASK	STATE	+5		# V59FLAG
// PORT: Fixed ROM slots 9343.
                    if slot <> 9343 or instruction <> 28737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9345 {
                if slot <= 9344 {
// PORT: SOURCE SXTMARK.agc:337
//		EXTEND
// PORT: Fixed ROM slots 9344.
                    if slot <> 9344 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:338
//		BZF	MARKET3			# IF V59FLAG NOT SET-MARK UNCALLED FOR
// PORT: Fixed ROM slots 9345.
                    if slot <> 9345 or instruction <> 5263 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5263, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9346 {
// PORT: SOURCE SXTMARK.agc:339
//		CAF	PRIO5			# CALIBRATION MARK (SET) FOR P23
// PORT: Fixed ROM slots 9346.
                    if slot <> 9346 or instruction <> 14897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:340
//		TC	NOVAC			# SPECIAL DISPLAY JOB
// PORT: Fixed ROM slots 9347.
                    if slot <> 9347 or instruction <> 2652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2652, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[543] to agcAotUnit543@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:341
//		EBANK=	MRKBUF1
// PORT: SOURCE SXTMARK.agc:342
//		2CADR	MARKDISP
// PORT: Fixed ROM slots 9348 9349.
    9348, 2604, 9349, 63598
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9350–9351.
function agcAotUnit544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9350 {
// PORT: SOURCE SXTMARK.agc:343
//
// PORT: SOURCE SXTMARK.agc:344
//		CAF	SIX
// PORT: Fixed ROM slots 9350.
        if slot <> 9350 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:345
//		TC	GENTRAN			# TRANSFER MARK DATE TO MARKDOWN
// PORT: Fixed ROM slots 9351.
        if slot <> 9351 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[544] to agcAotUnit544@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:346
//		ADRES	MKT2T1
// PORT: Fixed ROM slots 9352.
    9352, 474,
// PORT: SOURCE SXTMARK.agc:347
//		ADRES	MARKDOWN
// PORT: Fixed ROM slots 9353.
    9353, 1912
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9354–9355.
function agcAotUnit545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9354 {
// PORT: SOURCE SXTMARK.agc:348
//		CAF	SIX
// PORT: Fixed ROM slots 9354.
        if slot <> 9354 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:349
//		TC	GENTRAN			# TRANSFER MARK DATA TO MRKBUF1 FOR
// PORT: Fixed ROM slots 9355.
        if slot <> 9355 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[545] to agcAotUnit545@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:350
//		ADRES	MKT2T1			# SPECIAL DISPLAY OF SHAFT AND TRUNNION
// PORT: Fixed ROM slots 9356.
    9356, 474,
// PORT: SOURCE SXTMARK.agc:351
//		ADRES	MRKBUF1			# IF V59 ACTING
// PORT: Fixed ROM slots 9357.
    9357, 1962
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9358–9359.
function agcAotUnit546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9358 {
// PORT: SOURCE SXTMARK.agc:352
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9358.
        if slot <> 9358 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:353
//MARKET3		TC	ALARM
// PORT: Fixed ROM slots 9359.
        if slot <> 9359 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[546] to agcAotUnit546@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:354
//		OCT	122			# MARKING NOT CALLED FOR
// PORT: Fixed ROM slots 9360.
    9360, 164
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9361–9362.
function agcAotUnit547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9361 {
// PORT: SOURCE SXTMARK.agc:355
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9361.
        if slot <> 9361 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:356
//114ALM		TC	ALARM			# MARK NOT WANTED
// PORT: Fixed ROM slots 9362.
        if slot <> 9362 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[547] to agcAotUnit547@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:357
//		OCT	114
// PORT: Fixed ROM slots 9363.
    9363, 152
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9364–9368.
function agcAotUnit548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9365 {
        if slot <= 9364 {
// PORT: SOURCE SXTMARK.agc:358
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9364.
            if slot <> 9364 or instruction <> 6868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:359
//
// PORT: SOURCE SXTMARK.agc:360
//# Page 229
// PORT: SOURCE SXTMARK.agc:361
//# STORE MARK DATA IN MKVAC AND INCREMENT POINTER
// PORT: SOURCE SXTMARK.agc:362
//
// PORT: SOURCE SXTMARK.agc:363
//MARK2		AD	74K			# SEE IF MARKS WANTED-REDUCE MARKS WANTED
// PORT: Fixed ROM slots 9365.
            if slot <> 9365 or instruction <> 28617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 4041), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9366 {
// PORT: SOURCE SXTMARK.agc:364
//		EXTEND
// PORT: Fixed ROM slots 9366.
            if slot <> 9366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9367 {
// PORT: SOURCE SXTMARK.agc:365
//		BZMF	114ALM			# MARK NOT WANTED-ALARM
// PORT: Fixed ROM slots 9367.
                if slot <> 9367 or instruction <> 25746 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25746, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:366
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9368.
                if slot <> 9368 or instruction <> 23256 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23256, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[548] to agcAotUnit548@.

// PORT: Physical bank 07. Shared continuation entries, slots 9369–9374.
function agcAotUnit549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9371 {
        if slot <= 9369 {
// PORT: SOURCE SXTMARK.agc:367
//		COM
// PORT: Fixed ROM slots 9369.
            if slot <> 9369 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9370 {
// PORT: SOURCE SXTMARK.agc:368
//		MASK	BIT10			# SET BIT10 TO ENABLE REJECT
// PORT: Fixed ROM slots 9370.
                if slot <> 9370 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SXTMARK.agc:369
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9371.
                if slot <> 9371 or instruction <> 11992 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9372 {
// PORT: SOURCE SXTMARK.agc:370
//
// PORT: SOURCE SXTMARK.agc:371
//		MASK	LOW9
// PORT: Fixed ROM slots 9372.
            if slot <> 9372 or instruction <> 31270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                if fixedOperand = 511 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9373 {
// PORT: SOURCE SXTMARK.agc:372
//		TS	ITEMP1
// PORT: Fixed ROM slots 9373.
                if slot <> 9373 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:373
//		INDEX	A
// PORT: Fixed ROM slots 9374.
                if slot <> 9374 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[549] to agcAotUnit549@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:374
//		XCH	QPRET			# PICK UP MARK SLOT-POINTER
// PORT: Fixed ROM slots 9375.
    9375, 47188
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9376–9378.
function agcAotUnit550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9376 {
// PORT: SOURCE SXTMARK.agc:375
//		TS	ITEMP2			# SAVE CURRENT POINTER
// PORT: Fixed ROM slots 9376.
        if slot <> 9376 or instruction <> 22578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22578, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9377 {
// PORT: SOURCE SXTMARK.agc:376
//		AD	SEVEN			# INCREMENT POINTER
// PORT: Fixed ROM slots 9377.
            if slot <> 9377 or instruction <> 27155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:377
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 9378.
            if slot <> 9378 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[550] to agcAotUnit550@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:378
//		TS	QPRET			# STORE ADVANCED POINTER
// PORT: Fixed ROM slots 9379.
    9379, 45140
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9380–9382.
function agcAotUnit551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9380 {
// PORT: SOURCE SXTMARK.agc:379
//
// PORT: SOURCE SXTMARK.agc:380
//VACSTOR		EXTEND
// PORT: Fixed ROM slots 9380.
        if slot <> 9380 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9381 {
// PORT: SOURCE SXTMARK.agc:381
//		DCA	MKT2T1
// PORT: Fixed ROM slots 9381.
            if slot <> 9381 or instruction <> 12526 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 238, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:382
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9382.
            if slot <> 9382 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[551] to agcAotUnit551@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:383
//		DXCH	0
// PORT: Fixed ROM slots 9383.
    9383, 43010
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9384–9385.
function agcAotUnit552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9384 {
// PORT: SOURCE SXTMARK.agc:384
//		CA	MKCDUY
// PORT: Fixed ROM slots 9384.
        if slot <> 9384 or instruction <> 12527 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 239).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:385
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9385.
        if slot <> 9385 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[552] to agcAotUnit552@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:386
//		TS	2
// PORT: Fixed ROM slots 9386.
    9386, 45060
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9387–9388.
function agcAotUnit553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9387 {
// PORT: SOURCE SXTMARK.agc:387
//		CA	MKCDUS
// PORT: Fixed ROM slots 9387.
        if slot <> 9387 or instruction <> 12528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 240).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:388
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9388.
        if slot <> 9388 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[553] to agcAotUnit553@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:389
//		TS	3
// PORT: Fixed ROM slots 9389.
    9389, 45062
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9390–9391.
function agcAotUnit554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9390 {
// PORT: SOURCE SXTMARK.agc:390
//		CA	MKCDUZ
// PORT: Fixed ROM slots 9390.
        if slot <> 9390 or instruction <> 12529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 241).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:391
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9391.
        if slot <> 9391 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[554] to agcAotUnit554@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:392
//		TS	4
// PORT: Fixed ROM slots 9392.
    9392, 45064
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9393–9394.
function agcAotUnit555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9393 {
// PORT: SOURCE SXTMARK.agc:393
//		CA	MKCDUT
// PORT: Fixed ROM slots 9393.
        if slot <> 9393 or instruction <> 12530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 242).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:394
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9394.
        if slot <> 9394 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[555] to agcAotUnit555@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:395
//		TS	5
// PORT: Fixed ROM slots 9395.
    9395, 45066
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9396–9397.
function agcAotUnit556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9396 {
// PORT: SOURCE SXTMARK.agc:396
//		CA	MKCDUX
// PORT: Fixed ROM slots 9396.
        if slot <> 9396 or instruction <> 12531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 243).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:397
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 9397.
        if slot <> 9397 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[556] to agcAotUnit556@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:398
//		TS	6
// PORT: Fixed ROM slots 9398.
    9398, 45068
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9399–9405.
function agcAotUnit557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9401 {
        if slot <= 9399 {
// PORT: SOURCE SXTMARK.agc:399
//
// PORT: SOURCE SXTMARK.agc:400
//		CAF	PRIO34			# IF ALL MARKS MADE FLASH VB50
// PORT: Fixed ROM slots 9399.
            if slot <> 9399 or instruction <> 16313 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9400 {
// PORT: SOURCE SXTMARK.agc:401
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9400.
                if slot <> 9400 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:402
//		EXTEND
// PORT: Fixed ROM slots 9401.
                if slot <> 9401 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9403 {
            if slot <= 9402 {
// PORT: SOURCE SXTMARK.agc:403
//		BZF	+2
// PORT: Fixed ROM slots 9402.
                if slot <> 9402 or instruction <> 5308 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:404
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9403.
                if slot <> 9403 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9404 {
// PORT: SOURCE SXTMARK.agc:405
//		CAF	PRIO32
// PORT: Fixed ROM slots 9404.
                if slot <> 9404 or instruction <> 16311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4023), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:406
//		TC	NOVAC
// PORT: Fixed ROM slots 9405.
                if slot <> 9405 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[557] to agcAotUnit557@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:407
//		EBANK=	MARKSTAT
// PORT: SOURCE SXTMARK.agc:408
//		2CADR	MKVB50
// PORT: Fixed ROM slots 9406 9407.
    9406, 2596, 9407, 14436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9408–9418.
function agcAotUnit558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9412 {
        if slot <= 9409 {
            if slot <= 9408 {
// PORT: SOURCE SXTMARK.agc:409
//
// PORT: SOURCE SXTMARK.agc:410
//		TCF	TASKOVER
// PORT: Fixed ROM slots 9408.
                if slot <> 9408 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:411
//
// PORT: SOURCE SXTMARK.agc:412
//# Page 230
// PORT: SOURCE SXTMARK.agc:413
//# PROGRAM NAME - MKREJECT					DATE- 5 APRIL 1967
// PORT: SOURCE SXTMARK.agc:414
//# PROGRAM MODIFIED BY 258/276 PROGRAMMERS		       LOG SECTION SXTMARK
// PORT: SOURCE SXTMARK.agc:415
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// PORT: SOURCE SXTMARK.agc:416
//
// PORT: SOURCE SXTMARK.agc:417
//# FUNCTIONAL DESCRIPTION-
// PORT: SOURCE SXTMARK.agc:418
//#	ROUTINE ALLOWS OPEATOR TO REJECT MARK MADE PRIOR TO ACCEPTANCE AND ALLOWS A NEW MARK TO BE MADE BY ASTRONAUT
// PORT: SOURCE SXTMARK.agc:419
//
// PORT: SOURCE SXTMARK.agc:420
//# CALLING SEQUENCE-
// PORT: SOURCE SXTMARK.agc:421
//#	FROM MARKRUPT IF BIT7 OF CHANNEL 16 IS 1.
// PORT: SOURCE SXTMARK.agc:422
//
// PORT: SOURCE SXTMARK.agc:423
//# NORMAL EXIT MODE-
// PORT: SOURCE SXTMARK.agc:424
//#	RESUME
// PORT: SOURCE SXTMARK.agc:425
//
// PORT: SOURCE SXTMARK.agc:426
//# ALARM OR ABORT EXIT MODE-
// PORT: SOURCE SXTMARK.agc:427
//#	ALARM AND RESUME
// PORT: SOURCE SXTMARK.agc:428
//
// PORT: SOURCE SXTMARK.agc:429
//# OUTPUT-
// PORT: SOURCE SXTMARK.agc:430
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:431
//#	  MRKRUP1 SET TO -1
// PORT: SOURCE SXTMARK.agc:432
//#	2) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:433
//#	   BIT10 MARKSTAT =0,INCREMENT NO. MARKS BY 1,DECREMENT QPRET BY 7
// PORT: SOURCE SXTMARK.agc:434
//
// PORT: SOURCE SXTMARK.agc:435
//# ERASABLE INITIALIZATION-
// PORT: SOURCE SXTMARK.agc:436
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:437
//#	   BIT14 OF STATE+2 SET TO 1
// PORT: SOURCE SXTMARK.agc:438
//#	2) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:439
//#	   BIT14 OF STATE+2 SET TO 0, MARKSTAT,QPRET
// PORT: SOURCE SXTMARK.agc:440
//
// PORT: SOURCE SXTMARK.agc:441
//# DEBRIS-
// PORT: SOURCE SXTMARK.agc:442
//#	1) FOR R21-
// PORT: SOURCE SXTMARK.agc:443
//#	   A,MARKSTAT,EBANK
// PORT: SOURCE SXTMARK.agc:444
//#	2) FOR NORMAL MARKING-
// PORT: SOURCE SXTMARK.agc:445
//#	   A,MARKSTAT,ITEMP1,QPRET
// PORT: SOURCE SXTMARK.agc:446
//
// PORT: SOURCE SXTMARK.agc:447
//MKREJECT	CAF	BIT14
// PORT: Fixed ROM slots 9409.
                if slot <> 9409 or instruction <> 14850 { return choose false if checkOnly else -1. }
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
            if slot <= 9410 {
// PORT: SOURCE SXTMARK.agc:448
//		MASK	STATE	+2		# R21 MARK (SPECIAL MARKING FOR R21)
// PORT: Fixed ROM slots 9410.
                if slot <> 9410 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9411 {
// PORT: SOURCE SXTMARK.agc:449
//		EXTEND
// PORT: Fixed ROM slots 9411.
                    if slot <> 9411 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:450
//		BZF	MRKREJCT		# NOT SET THEREFORE REGULAR REJECT
// PORT: Fixed ROM slots 9412.
                    if slot <> 9412 or instruction <> 5320 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5320, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9415 {
            if slot <= 9413 {
// PORT: SOURCE SXTMARK.agc:451
//		CA	NEGONE			# -1 (FOR R22)
// PORT: Fixed ROM slots 9413.
                if slot <> 9413 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9414 {
// PORT: SOURCE SXTMARK.agc:452
//		TS	MRKBUF1			# -0 IN TIME IS FLAG TO R22 SIGNIFYING A
// PORT: Fixed ROM slots 9414.
                    if slot <> 9414 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:453
//		TC	RESUME			# REJECTED MARK
// PORT: Fixed ROM slots 9415.
                    if slot <> 9415 or instruction <> 2779 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2779, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9416 {
// PORT: SOURCE SXTMARK.agc:454
//MRKREJCT	CCS	MARKSTAT		# SEE IF MARKS BEING ACCEPTED
// PORT: Fixed ROM slots 9416.
                if slot <> 9416 or instruction <> 4824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9417 {
// PORT: SOURCE SXTMARK.agc:455
//		TC	REJECT2
// PORT: Fixed ROM slots 9417.
                    if slot <> 9417 or instruction <> 1229 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1229, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:456
//		TC	ALARM			# MARKS NOT BEING ACCEPTED
// PORT: Fixed ROM slots 9418.
                    if slot <> 9418 or instruction <> 2984 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[558] to agcAotUnit558@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:457
//		OCT	112
// PORT: Fixed ROM slots 9419.
    9419, 148
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9420–9427.
function agcAotUnit559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9423 {
        if slot <= 9421 {
            if slot <= 9420 {
// PORT: SOURCE SXTMARK.agc:458
//		TC	RESUME
// PORT: Fixed ROM slots 9420.
                if slot <> 9420 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:459
//
// PORT: SOURCE SXTMARK.agc:460
//REJECT2		CS	BIT10			# SEE IF MARK HAD BEEN MADE SINCE LAST
// PORT: Fixed ROM slots 9421.
                if slot <> 9421 or instruction <> 18950 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9422 {
// PORT: SOURCE SXTMARK.agc:461
//		MASK	MARKSTAT		# REJECT, AND SET BIT10 TO ZERO TO
// PORT: Fixed ROM slots 9422.
                if slot <> 9422 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:462
//		XCH	MARKSTAT		# SHOW MARK REJECT
// PORT: Fixed ROM slots 9423.
                if slot <> 9423 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9425 {
            if slot <= 9424 {
// PORT: SOURCE SXTMARK.agc:463
//# Page 231
// PORT: SOURCE SXTMARK.agc:464
//		MASK	BIT10
// PORT: Fixed ROM slots 9424.
                if slot <> 9424 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SXTMARK.agc:465
//		CCS	A
// PORT: Fixed ROM slots 9425.
                if slot <> 9425 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9426 {
// PORT: SOURCE SXTMARK.agc:466
//		TC	REJECT3
// PORT: Fixed ROM slots 9426.
                if slot <> 9426 or instruction <> 1238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1238, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:467
//
// PORT: SOURCE SXTMARK.agc:468
//		TC	ALARM			# DONT ACCEPT TWO REJECTS TOGETHER
// PORT: Fixed ROM slots 9427.
                if slot <> 9427 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[559] to agcAotUnit559@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:469
//		OCT	110
// PORT: Fixed ROM slots 9428.
    9428, 144
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9429–9434.
function agcAotUnit560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9431 {
        if slot <= 9429 {
// PORT: SOURCE SXTMARK.agc:470
//		TC	RESUME
// PORT: Fixed ROM slots 9429.
            if slot <> 9429 or instruction <> 2779 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2779, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9430 {
// PORT: SOURCE SXTMARK.agc:471
//
// PORT: SOURCE SXTMARK.agc:472
//REJECT3		CAF	LOW9			# DECREMENT POINTER TO REJECT MARK
// PORT: Fixed ROM slots 9430.
                if slot <> 9430 or instruction <> 14886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:473
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9431.
                if slot <> 9431 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9432 {
// PORT: SOURCE SXTMARK.agc:474
//		TS	ITEMP1
// PORT: Fixed ROM slots 9432.
            if slot <> 9432 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9433 {
// PORT: SOURCE SXTMARK.agc:475
//		CS	SEVEN
// PORT: Fixed ROM slots 9433.
                if slot <> 9433 or instruction <> 18963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:476
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 9434.
                if slot <> 9434 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[560] to agcAotUnit560@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:477
//		ADS	QPRET			# NEW POINTER
// PORT: Fixed ROM slots 9435.
    9435, 22612
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9436–9443.
function agcAotUnit561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9439 {
        if slot <= 9437 {
            if slot <= 9436 {
// PORT: SOURCE SXTMARK.agc:478
//
// PORT: SOURCE SXTMARK.agc:479
//		CAF	BIT12			# INCREMENT MARKS WANTED AND IF FIELD
// PORT: Fixed ROM slots 9436.
                if slot <> 9436 or instruction <> 14852 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:480
//		AD	MARKSTAT		# IS NOW NON-ZERO, CHANGE TO VB51 TO
// PORT: Fixed ROM slots 9437.
                if slot <> 9437 or instruction <> 25304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9438 {
// PORT: SOURCE SXTMARK.agc:481
//		XCH	MARKSTAT		# INDICATE MORE MARKS WANTED
// PORT: Fixed ROM slots 9438.
                if slot <> 9438 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:482
//		MASK	PRIO34			# INDICATE MORE MARKS WANTED
// PORT: Fixed ROM slots 9439.
                if slot <> 9439 or instruction <> 32697 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                    if fixedOperand = 14336 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 8) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9441 {
            if slot <= 9440 {
// PORT: SOURCE SXTMARK.agc:483
//		CCS	A
// PORT: Fixed ROM slots 9440.
                if slot <> 9440 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:484
//		TC	RESUME
// PORT: Fixed ROM slots 9441.
                if slot <> 9441 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9442 {
// PORT: SOURCE SXTMARK.agc:485
//		CAF	PRIO32
// PORT: Fixed ROM slots 9442.
                if slot <> 9442 or instruction <> 16311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4023), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:486
//		TC	NOVAC
// PORT: Fixed ROM slots 9443.
                if slot <> 9443 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[561] to agcAotUnit561@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:487
//		EBANK=	MARKSTAT
// PORT: SOURCE SXTMARK.agc:488
//		2CADR	MKVB51
// PORT: Fixed ROM slots 9444 9445.
    9444, 2510, 9445, 14436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9446–9447.
function agcAotUnit562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9446 {
// PORT: SOURCE SXTMARK.agc:489
//
// PORT: SOURCE SXTMARK.agc:490
//		TC	RESUME
// PORT: Fixed ROM slots 9446.
        if slot <> 9446 or instruction <> 2779 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2779, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:491
//
// PORT: SOURCE SXTMARK.agc:492
//# Page 232
// PORT: SOURCE SXTMARK.agc:493
//# PROGRAM DESCRIPTION MKVB51 AND MKVB50
// PORT: SOURCE SXTMARK.agc:494
//
// PORT: SOURCE SXTMARK.agc:495
//# AUTHOR-BARNERT DATE-2-15-67 MOD-0
// PORT: SOURCE SXTMARK.agc:496
//# PURPOSE	FLASH V51N70,V51N43, OR V51 TO REQUEST MARKING,
// PORT: SOURCE SXTMARK.agc:497
//#		AND V50N25 R1=16 TO REQUEST TERMINATE MARKING.
// PORT: SOURCE SXTMARK.agc:498
//
// PORT: SOURCE SXTMARK.agc:499
//# CALLING SEQUENCE	AS JOB WITHIN SXTMARK
// PORT: SOURCE SXTMARK.agc:500
//
// PORT: SOURCE SXTMARK.agc:501
//# EXIT TO ENDMARK UPON RECEIPT OF V33, V34 CAUSES GOTOPOOH, ENTER
// PORT: SOURCE SXTMARK.agc:502
//#		RECYCLES THE DISPLAY
// PORT: SOURCE SXTMARK.agc:503
//
// PORT: SOURCE SXTMARK.agc:504
//# NOTE- SXTMARK AUTOMATICALLY CHANGES FROM CALLING MKVB51 TO MKVB50 WHEN
// PORT: SOURCE SXTMARK.agc:505
//#		SUFFICIENT MARKS HAVE BEEN MADE, AND THE REVERSE WHEN A MARK
// PORT: SOURCE SXTMARK.agc:506
//#		REJECT REDUCES THE NUMBER MADE BELOW THAT REQUIRED
// PORT: SOURCE SXTMARK.agc:507
//
// PORT: SOURCE SXTMARK.agc:508
//# SUBROUTINES CALLED- BANKCALL, GOMARK2,GOODEND,ENDMARK,WAITLIST
// PORT: SOURCE SXTMARK.agc:509
//
// PORT: SOURCE SXTMARK.agc:510
//# ALARM OR ABORT MODES - NONE
// PORT: SOURCE SXTMARK.agc:511
//
// PORT: SOURCE SXTMARK.agc:512
//# ERASABLE USED-VERBREG,MARKSTAT,QPRET,DSPTEM1
// PORT: SOURCE SXTMARK.agc:513
//
// PORT: SOURCE SXTMARK.agc:514
//# OUTPUT MARKSTAT=VAC ADDRESS
// PORT: SOURCE SXTMARK.agc:515
//
// PORT: SOURCE SXTMARK.agc:516
//# 	 QPRET=	NO.MARKS
// PORT: SOURCE SXTMARK.agc:517
//MKVB51		TC	BANKCALL		# CLEAR DISPLAY FOR MARK VERB
// PORT: Fixed ROM slots 9447.
        if slot <> 9447 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[562] to agcAotUnit562@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:518
//		CADR	KLEENEX
// PORT: Fixed ROM slots 9448.
    9448, 17120
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9449–9450.
function agcAotUnit563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9449 {
// PORT: SOURCE SXTMARK.agc:519
//		CAF	VB51			# DISPLAY MARK VB51
// PORT: Fixed ROM slots 9449.
        if slot <> 9449 or instruction <> 13591 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1303), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SXTMARK.agc:520
//		TC	BANKCALL
// PORT: Fixed ROM slots 9450.
        if slot <> 9450 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[563] to agcAotUnit563@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:521
//		CADR	GOMARK4
// PORT: Fixed ROM slots 9451.
    9451, 17140
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9452–9456.
function agcAotUnit564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9453 {
        if slot <= 9452 {
// PORT: SOURCE SXTMARK.agc:522
//		TCF	TERMSXT			# VB34-TERMINATE
// PORT: Fixed ROM slots 9452.
            if slot <> 9452 or instruction <> 5359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5359, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:523
//		TCF	ENTANSWR		# V33-PROCEED-MARKING DONE
// PORT: Fixed ROM slots 9453.
            if slot <> 9453 or instruction <> 5368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5368, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9454 {
// PORT: SOURCE SXTMARK.agc:524
//		TCF	MKVB5X			# ENTER-RECYCLE TO INITIAL MARK DISPLAY
// PORT: Fixed ROM slots 9454.
            if slot <> 9454 or instruction <> 5390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9455 {
// PORT: SOURCE SXTMARK.agc:525
//
// PORT: SOURCE SXTMARK.agc:526
//TERMSXT		TC	CLEARMRK		# CLEAR MARK ACTIVITY.
// PORT: Fixed ROM slots 9455.
                if slot <> 9455 or instruction <> 2910 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2910, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:527
//
// PORT: SOURCE SXTMARK.agc:528
//		TC	CHECKMM
// PORT: Fixed ROM slots 9456.
                if slot <> 9456 or instruction <> 2804 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2804, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[564] to agcAotUnit564@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:529
//		MM	03
// PORT: Fixed ROM slots 9457.
    9457, 6
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9458–9460.
function agcAotUnit565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9458 {
// PORT: SOURCE SXTMARK.agc:530
//		TCF	+2
// PORT: Fixed ROM slots 9458.
        if slot <> 9458 or instruction <> 5364 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5364, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9459 {
// PORT: SOURCE SXTMARK.agc:531
//		TC	TERMP03
// PORT: Fixed ROM slots 9459.
            if slot <> 9459 or instruction <> 1270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1270, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:532
//		TC	POSTJUMP
// PORT: Fixed ROM slots 9460.
            if slot <> 9460 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[565] to agcAotUnit565@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:533
//		CADR	TERM52
// PORT: Fixed ROM slots 9461.
    9461, 24842
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9462–9462.
function agcAotUnit566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SXTMARK.agc:534
//
// PORT: SOURCE SXTMARK.agc:535
//TERMP03		TC	UPFLAG
// PORT: Fixed ROM slots 9462.
    if slot <> 9462 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[566] to agcAotUnit566@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:536
//		ADRES	TRM03FLG
// PORT: Fixed ROM slots 9463.
    9463, 52
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9464–9468.
function agcAotUnit567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9465 {
        if slot <= 9464 {
// PORT: SOURCE SXTMARK.agc:537
//ENTANSWR	CAF	LOW9			# PUT VAC ADR IN MARKSTAT AND NO. OF
// PORT: Fixed ROM slots 9464.
            if slot <> 9464 or instruction <> 14886 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:538
//		MASK	MARKSTAT		# MARKS MADE IN QPRET BEFORE LEAVING
// PORT: Fixed ROM slots 9465.
            if slot <> 9465 or instruction <> 29400 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 728).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9466 {
// PORT: SOURCE SXTMARK.agc:539
//		TS	MARKSTAT		# SXTMARK
// PORT: Fixed ROM slots 9466.
            if slot <> 9466 or instruction <> 23256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9467 {
// PORT: SOURCE SXTMARK.agc:540
//		COM
// PORT: Fixed ROM slots 9467.
                if slot <> 9467 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:541
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 9468.
                if slot <> 9468 or instruction <> 21208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21208, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[567] to agcAotUnit567@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:542
//		AD	QPRET
// PORT: Fixed ROM slots 9469.
    9469, 49236
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9470–9475.
function agcAotUnit568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9472 {
        if slot <= 9470 {
// PORT: SOURCE SXTMARK.agc:543
//# Page 233
// PORT: SOURCE SXTMARK.agc:544
//		EXTEND
// PORT: Fixed ROM slots 9470.
            if slot <> 9470 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9471 {
// PORT: SOURCE SXTMARK.agc:545
//		BZMF	JAMIT			# NO MARKS MADE, SHOW IT IN QPRET, R53
// PORT: Fixed ROM slots 9471.
                if slot <> 9471 or instruction <> 25859 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:546
//		EXTEND				#	WILL PICK IT UP AND RECYCLE
// PORT: Fixed ROM slots 9472.
                if slot <> 9472 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9473 {
// PORT: SOURCE SXTMARK.agc:547
//		MP	BIT12			# THIS PUTS NUMBER MARKS-1 IN A
// PORT: Fixed ROM slots 9473.
            if slot <> 9473 or instruction <> 31236 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2564, readEffective:call(words, 2564)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9474 {
// PORT: SOURCE SXTMARK.agc:548
//		AD	ONE
// PORT: Fixed ROM slots 9474.
                if slot <> 9474 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SXTMARK.agc:549
//JAMIT		INDEX	MARKSTAT		# STORE NO OF MARKS MADE
// PORT: Fixed ROM slots 9475.
                if slot <> 9475 or instruction <> 21208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21208, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[568] to agcAotUnit568@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:550
//		TS	QPRET
// PORT: Fixed ROM slots 9476.
    9476, 45140
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9477–9479.
function agcAotUnit569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9477 {
// PORT: SOURCE SXTMARK.agc:551
//		INHINT				# SERVICE OPTSTALL INTERFACE WITH
// PORT: Fixed ROM slots 9477.
        if slot <> 9477 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9478 {
// PORT: SOURCE SXTMARK.agc:552
//		CAF	FIVE
// PORT: Fixed ROM slots 9478.
            if slot <> 9478 or instruction <> 14866 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:553
//		TC	WAITLIST
// PORT: Fixed ROM slots 9479.
            if slot <> 9479 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[569] to agcAotUnit569@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:554
//		EBANK=	MARKSTAT
// PORT: SOURCE SXTMARK.agc:555
//		2CADR	ENDMARKS
// PORT: Fixed ROM slots 9480 9481.
    9480, 2582, 9481, 14436
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9482–9484.
function agcAotUnit570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9482 {
// PORT: SOURCE SXTMARK.agc:556
//
// PORT: SOURCE SXTMARK.agc:557
//		TC	ENDMARK			# KNOCKS DOWN MARKING FLAG + DOES ENDOFJOB
// PORT: Fixed ROM slots 9482.
        if slot <> 9482 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9483 {
// PORT: SOURCE SXTMARK.agc:558
//
// PORT: SOURCE SXTMARK.agc:559
//ENDMARKS	CAF	ONE
// PORT: Fixed ROM slots 9483.
            if slot <> 9483 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:560
//		TC	IBNKCALL
// PORT: Fixed ROM slots 9484.
            if slot <> 9484 or instruction <> 2528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[570] to agcAotUnit570@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:561
//		CADR	GOODEND
// PORT: Fixed ROM slots 9485.
    9485, 16080
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9486–9493.
function agcAotUnit571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9489 {
        if slot <= 9487 {
            if slot <= 9486 {
// PORT: SOURCE SXTMARK.agc:562
//MKVB5X		CAF	PRIO34
// PORT: Fixed ROM slots 9486.
                if slot <> 9486 or instruction <> 16313 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:563
//		MASK	MARKSTAT		# RE-DISPLAY VB51 IF MORE MARKS WANTED
// PORT: Fixed ROM slots 9487.
                if slot <> 9487 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9488 {
// PORT: SOURCE SXTMARK.agc:564
//		CCS	A			# AND VB50 IF ALL IN
// PORT: Fixed ROM slots 9488.
                if slot <> 9488 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:565
//		TCF	MKVB51
// PORT: Fixed ROM slots 9489.
                if slot <> 9489 or instruction <> 5351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5351, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9491 {
            if slot <= 9490 {
// PORT: SOURCE SXTMARK.agc:566
//MKVB50		CAF	R1D1			# OCT 16
// PORT: Fixed ROM slots 9490.
                if slot <> 9490 or instruction <> 14555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2267), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:567
//		TS	DSPTEM1
// PORT: Fixed ROM slots 9491.
                if slot <> 9491 or instruction <> 23077 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23077, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9492 {
// PORT: SOURCE SXTMARK.agc:568
//		CAF	V50N25
// PORT: Fixed ROM slots 9492.
                if slot <> 9492 or instruction <> 13590 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1302), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:569
//		TCF	MKVB51	+3
// PORT: Fixed ROM slots 9493.
                if slot <> 9493 or instruction <> 5354 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5354, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[571] to agcAotUnit571@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:570
//
// PORT: SOURCE SXTMARK.agc:571
//V50N25		VN	5025
// PORT: Fixed ROM slots 9494.
    9494, 12850,
// PORT: SOURCE SXTMARK.agc:572
//VB51		VN	5100
// PORT: Fixed ROM slots 9495.
    9495, 13056
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9496–9501.
function agcAotUnit572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9498 {
        if slot <= 9496 {
// PORT: SOURCE SXTMARK.agc:573
//OCT37		=	LOW5
// PORT: SOURCE SXTMARK.agc:574
//
// PORT: SOURCE SXTMARK.agc:575
//# PROGRAM NAME - MARKIT				DATE- 19 SEPT 1967
// PORT: SOURCE SXTMARK.agc:576
//
// PORT: SOURCE SXTMARK.agc:577
//# CALLING SEQUENCE
// PORT: SOURCE SXTMARK.agc:578
//#	FROM MARKRUPT IF CHAN 16 BIT 6 = 1
// PORT: SOURCE SXTMARK.agc:579
//
// PORT: SOURCE SXTMARK.agc:580
//# EXIT
// PORT: SOURCE SXTMARK.agc:581
//#	RESUME
// PORT: SOURCE SXTMARK.agc:582
//
// PORT: SOURCE SXTMARK.agc:583
//# INPUT
// PORT: SOURCE SXTMARK.agc:584
//#	CDUCHKWD.  ALSO ALL INITIALIZATION FOR MARKCONT
// PORT: SOURCE SXTMARK.agc:585
//
// PORT: SOURCE SXTMARK.agc:586
//# OUTPUT
// PORT: SOURCE SXTMARK.agc:587
//#	MKT2T1,MKCDUX,MKCDUY,MKCDUZ,MKCDUS,MKCDUT
// PORT: SOURCE SXTMARK.agc:588
//
// PORT: SOURCE SXTMARK.agc:589
//# ALARM EXIT
// PORT: SOURCE SXTMARK.agc:590
//#	NONE
// PORT: SOURCE SXTMARK.agc:591
//
// PORT: SOURCE SXTMARK.agc:592
//MARKIT		CCS	CDUCHKWD
// PORT: Fixed ROM slots 9496.
            if slot <> 9496 or instruction <> 4833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 737).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9497 {
// PORT: SOURCE SXTMARK.agc:593
//		TCF	+3			# DELAY OF CDUCHKWD CS IF PNZ
// PORT: Fixed ROM slots 9497.
                if slot <> 9497 or instruction <> 5404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5404, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:594
//# Page 234
// PORT: SOURCE SXTMARK.agc:595
//		TCF	+2
// PORT: Fixed ROM slots 9498.
                if slot <> 9498 or instruction <> 5404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5404, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9499 {
// PORT: SOURCE SXTMARK.agc:596
//		CAF	ZERO
// PORT: Fixed ROM slots 9499.
            if slot <> 9499 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9500 {
// PORT: SOURCE SXTMARK.agc:597
//		AD	ONE			# 10 MS IF NO CHECK
// PORT: Fixed ROM slots 9500.
                if slot <> 9500 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SXTMARK.agc:598
//		TC	WAITLIST
// PORT: Fixed ROM slots 9501.
                if slot <> 9501 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[572] to agcAotUnit572@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:599
//		EBANK=	MRKBUF1
// PORT: SOURCE SXTMARK.agc:600
//		2CADR	MARKDIF
// PORT: Fixed ROM slots 9502 9503.
    9502, 2310, 9503, 16494
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9504–9504.
function agcAotUnit573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SXTMARK.agc:601
//
// PORT: SOURCE SXTMARK.agc:602
//		TCF	RESUME
// PORT: Fixed ROM slots 9504.
    if slot <> 9504 or instruction <> 6875 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6875, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[573] to agcAotUnit573@.

// PORT: Physical bank 10. Shared continuation entries, slots 10371–10382.
function agcAotUnit642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10376 {
        if slot <= 10373 {
            if slot <= 10371 {
// PORT: SOURCE SXTMARK.agc:603
//
// PORT: SOURCE SXTMARK.agc:604
//		SETLOC	SXTMARK1
// PORT: SOURCE SXTMARK.agc:605
//		BANK
// PORT: SOURCE SXTMARK.agc:606
//
// PORT: SOURCE SXTMARK.agc:607
//		COUNT	20/SXTMK
// PORT: SOURCE SXTMARK.agc:608
//
// PORT: SOURCE SXTMARK.agc:609
//# PROGRAM NAME - MARKDIF			DATE- 19 SEPT 1967
// PORT: SOURCE SXTMARK.agc:610
//
// PORT: SOURCE SXTMARK.agc:611
//# CALLING SEQUENCE
// PORT: SOURCE SXTMARK.agc:612
//#	WAITLIST FROM MARKIT
// PORT: SOURCE SXTMARK.agc:613
//
// PORT: SOURCE SXTMARK.agc:614
//# EXIT
// PORT: SOURCE SXTMARK.agc:615
//#	TASKOVER TO IBNKCALL TO MARKCONT
// PORT: SOURCE SXTMARK.agc:616
//
// PORT: SOURCE SXTMARK.agc:617
//# INPUT
// PORT: SOURCE SXTMARK.agc:618
//# 	OUTPUT FROM MARKIT, INPUT TO MARKCONT, CDUCHKWD
// PORT: SOURCE SXTMARK.agc:619
//
// PORT: SOURCE SXTMARK.agc:620
//# OUTPUT
// PORT: SOURCE SXTMARK.agc:621
//#	RUPTSTOR - RUPTSTOR+3,RUPTREG3,RUPTSTOR+5 - RUPTSTOR+6
// PORT: SOURCE SXTMARK.agc:622
//
// PORT: SOURCE SXTMARK.agc:623
//# ALARM EXIT
// PORT: SOURCE SXTMARK.agc:624
//#	ALARM AND TASKOVER
// PORT: SOURCE SXTMARK.agc:625
//
// PORT: SOURCE SXTMARK.agc:626
//MARKDIF		CA	CDUCHKWD		# IF DELAY CHECK IS ZERO OR NEG,ACP MARK
// PORT: Fixed ROM slots 10371.
                if slot <> 10371 or instruction <> 13025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 737).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10372 {
// PORT: SOURCE SXTMARK.agc:627
//		EXTEND
// PORT: Fixed ROM slots 10372.
                    if slot <> 10372 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:628
//		BZMF	MKACPT
// PORT: Fixed ROM slots 10373.
                    if slot <> 10373 or instruction <> 25742 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25742, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10374 {
// PORT: SOURCE SXTMARK.agc:629
//		CS	BIT1
// PORT: Fixed ROM slots 10374.
                if slot <> 10374 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10375 {
// PORT: SOURCE SXTMARK.agc:630
//		TS	MKNDX			# SET INDEX -1
// PORT: Fixed ROM slots 10375.
                    if slot <> 10375 or instruction <> 22764 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22764, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:631
//		CA	MKCDUX
// PORT: Fixed ROM slots 10376.
                    if slot <> 10376 or instruction <> 12531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 243).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10379 {
            if slot <= 10377 {
// PORT: SOURCE SXTMARK.agc:632
//		TC	DIFCHK			# SEE IF VEHICLE RATE TO MUCH AT MARK
// PORT: Fixed ROM slots 10377.
                if slot <> 10377 or instruction <> 1168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1168, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10378 {
// PORT: SOURCE SXTMARK.agc:633
//		CA	MKCDUY
// PORT: Fixed ROM slots 10378.
                    if slot <> 10378 or instruction <> 12527 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 239).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:634
//		TC	DIFCHK
// PORT: Fixed ROM slots 10379.
                    if slot <> 10379 or instruction <> 1168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1168, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10380 {
// PORT: SOURCE SXTMARK.agc:635
//		CA	MKCDUZ
// PORT: Fixed ROM slots 10380.
                if slot <> 10380 or instruction <> 12529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 241).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10381 {
// PORT: SOURCE SXTMARK.agc:636
//		TC	DIFCHK
// PORT: Fixed ROM slots 10381.
                    if slot <> 10381 or instruction <> 1168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1168, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:637
//
// PORT: SOURCE SXTMARK.agc:638
//MKACPT		TC	IBNKCALL
// PORT: Fixed ROM slots 10382.
                    if slot <> 10382 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[642] to agcAotUnit642@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:639
//		CADR	MARKCONT		# MARK DATA OK, WHAT DO WE DO WITH IT
// PORT: Fixed ROM slots 10383.
    10383, 14550
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10384–10386.
function agcAotUnit643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10384 {
// PORT: SOURCE SXTMARK.agc:640
//
// PORT: SOURCE SXTMARK.agc:641
//DIFCHK		INCR	MKNDX			# INCREMENT INDEX
// PORT: Fixed ROM slots 10384.
        if slot <> 10384 or instruction <> 10476 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 236).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10385 {
// PORT: SOURCE SXTMARK.agc:642
//
// PORT: SOURCE SXTMARK.agc:643
//		EXTEND
// PORT: Fixed ROM slots 10385.
            if slot <> 10385 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SXTMARK.agc:644
//		INDEX	MKNDX
// PORT: Fixed ROM slots 10386.
            if slot <> 10386 or instruction <> 20716 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20716, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20716, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[643] to agcAotUnit643@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:645
//# Page 235
// PORT: SOURCE SXTMARK.agc:646
//		MSU	CDUX			# GET MARK(ICDU) - CURRENT(ICDU)
// PORT: Fixed ROM slots 10387.
    10387, 16436
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10388–10396.
function agcAotUnit644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10391 {
        if slot <= 10389 {
            if slot <= 10388 {
// PORT: SOURCE SXTMARK.agc:647
//		CCS	A
// PORT: Fixed ROM slots 10388.
                if slot <> 10388 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:648
//		TCF	+4
// PORT: Fixed ROM slots 10389.
                if slot <> 10389 or instruction <> 5273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10390 {
// PORT: SOURCE SXTMARK.agc:649
//		TC	Q
// PORT: Fixed ROM slots 10390.
                if slot <> 10390 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:650
//		TCF	+2
// PORT: Fixed ROM slots 10391.
                if slot <> 10391 or instruction <> 5273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10393 {
            if slot <= 10392 {
// PORT: SOURCE SXTMARK.agc:651
//		TC	Q
// PORT: Fixed ROM slots 10392.
                if slot <> 10392 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SXTMARK.agc:652
//		AD	NEG2			# SEE IF DIFFERENCE GREATER THAN 3 BITS
// PORT: Fixed ROM slots 10393.
                if slot <> 10393 or instruction <> 28621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10394 {
// PORT: SOURCE SXTMARK.agc:653
//		EXTEND
// PORT: Fixed ROM slots 10394.
                if slot <> 10394 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10395 {
// PORT: SOURCE SXTMARK.agc:654
//		BZMF	-3			# NOT GREATER
// PORT: Fixed ROM slots 10395.
                    if slot <> 10395 or instruction <> 25752 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25752, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SXTMARK.agc:655
//
// PORT: SOURCE SXTMARK.agc:656
//		TC	ALARM			# COUPLED WITH PROGRAM ALARM
// PORT: Fixed ROM slots 10396.
                    if slot <> 10396 or instruction <> 2984 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[644] to agcAotUnit644@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SXTMARK.agc:657
//		OCT	00121
// PORT: Fixed ROM slots 10397.
    10397, 162
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10398–10398.
function agcAotUnit645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SXTMARK.agc:658
//
// PORT: SOURCE SXTMARK.agc:659
//		TCF	TASKOVER		# DO NOT ACCEPT
// PORT: Fixed ROM slots 10398.
    if slot <> 10398 or instruction <> 6868 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6868, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[645] to agcAotUnit645@.

