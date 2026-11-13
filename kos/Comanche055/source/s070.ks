// SXTMARK.agc
// bank 07, slots 9218-9227
function agcAotUnit531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9222 {
        if slot <= 9219 {
            if slot <= 9218 {
// SXTMARK.agc:1
//# Copyright:	Public domain.
// SXTMARK.agc:2
//# Filename:	SXTMARK.agc
// SXTMARK.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// SXTMARK.agc:4
//#		is part of the source code for the Command Module's
// SXTMARK.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// SXTMARK.agc:6
//# Assembler:	yaYUL
// SXTMARK.agc:7
//# Reference:	pp. 222-235
// SXTMARK.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// SXTMARK.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// SXTMARK.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// SXTMARK.agc:11
//# Mod history:	16/05/09 FB	Transcription Batch 2 Assignment.
// SXTMARK.agc:12
//#
// SXTMARK.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// SXTMARK.agc:14
//# from scanned documents.
// SXTMARK.agc:15
//#
// SXTMARK.agc:16
//#	Assemble revision 055 of AGC program Comanche by NASA
// SXTMARK.agc:17
//#	2021113-051.  April 1, 1969.
// SXTMARK.agc:18
//#
// SXTMARK.agc:19
//#	This AGC program shall also be referred to as Colossus 2A
// SXTMARK.agc:20
//#
// SXTMARK.agc:21
//#	Prepared by
// SXTMARK.agc:22
//#			Massachusetts Institute of Technology
// SXTMARK.agc:23
//#			75 Cambridge Parkway
// SXTMARK.agc:24
//#			Cambridge, Massachusetts
// SXTMARK.agc:25
//#
// SXTMARK.agc:26
//#	under NASA contract NAS 9-4065.
// SXTMARK.agc:27
//#
// SXTMARK.agc:28
//# Refer directly to the online document mentioned above for further
// SXTMARK.agc:29
//# information.  Please report any errors to info@sandroid.org.
// SXTMARK.agc:30
//
// SXTMARK.agc:31
//# Page 222
// SXTMARK.agc:32
//# PROGRAM NAME - SXTMARK					DATE- 5 APRIL 1967
// SXTMARK.agc:33
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS		       LOG SECTION SXTMARK
// SXTMARK.agc:34
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// SXTMARK.agc:35
//
// SXTMARK.agc:36
//# FUNCTIONAL DESCRIPTION-
// SXTMARK.agc:37
//#	SXTMARK IS CALLED FROM INTERNAL ROUTINES WHICH MAY REQUIRE STAR OR LANDMARK MARKINGS BY THE ASTRONAUT.  IF
// SXTMARK.agc:38
//#	THE MARK SYSTEM IS NOT IN USE, SXTMARK RESERVES A VAC AREA FOR MARKING AND REQUESTS EXECUTION OF THE MKVB51
// SXTMARK.agc:39
//#	ROUTINE VIA THE EXECUTIVE JOB PRIORITY LIST.  R21 USES THIS ROUTINE TO DETERMINE IF THE MARK SYSTEM CAN BE
// SXTMARK.agc:40
//#	USED.  IF YES, SXTMARK RETURNS TO R21 TO PERFORM ITS OWN MARK REQUESTS VIA THE V51 FLASH.
// SXTMARK.agc:41
//
// SXTMARK.agc:42
//# CALLING SEQUENCE-
// SXTMARK.agc:43
//
// SXTMARK.agc:44
//#	CAF	(NO. MARK REQUESTS IN BITS 1-3 OF A)
// SXTMARK.agc:45
//#	TC	BANKCALL
// SXTMARK.agc:46
//#	CADR	SXTMARK
// SXTMARK.agc:47
//
// SXTMARK.agc:48
//# NORMAL EXIT MODE-
// SXTMARK.agc:49
//#	SWRETURN
// SXTMARK.agc:50
//
// SXTMARK.agc:51
//# ALARM OR ABORT EXIT MODE-
// SXTMARK.agc:52
//#	ABORT
// SXTMARK.agc:53
//
// SXTMARK.agc:54
//# OUTPUT-
// SXTMARK.agc:55
//#	1) MARKSTAT CONTAINS MARK VALUE (BITS 14-12) AND VAC AREA ADDRESS
// SXTMARK.agc:56
//#	2) QPRET = VAC AREA POINTER VALUE
// SXTMARK.agc:57
//#	3) 1ST WORD OF RESERVED VAC AREA SET TO +0
// SXTMARK.agc:58
//#	4) PRIO32 PLACED IN A REGISTER
// SXTMARK.agc:59
//
// SXTMARK.agc:60
//# ERASABLE INITIALIZATION-
// SXTMARK.agc:61
//#	1) BITS 1-3 OF A = NO. MARKS REQUESTED
// SXTMARK.agc:62
//#	2) BITS 2,3 OF EXTVBACT =0
// SXTMARK.agc:63
//#	3) A VAC AREA MUST BE AVAILABLE (WORD 1 = ADDRESS OF VAC AREA)
// SXTMARK.agc:64
//
// SXTMARK.agc:65
//# DEBRIS-
// SXTMARK.agc:66
//#	A,Q,L,RUPTREG1,MARKSTAT,QPRET,BIT2 OF EXTVBACT
// SXTMARK.agc:67
//
// SXTMARK.agc:68
//		BANK	13
// SXTMARK.agc:69
//		SETLOC	SXTMARKE
// SXTMARK.agc:70
//		BANK
// SXTMARK.agc:71
//
// SXTMARK.agc:72
//		EBANK=	MRKBUF1
// SXTMARK.agc:73
//		COUNT	07/SXTMK
// SXTMARK.agc:74
//
// SXTMARK.agc:75
//SXTMARK		INHINT
// slot 9218
                if slot <> 9218 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:76
//		TS	RUPTREG1		# NUMBER OF MARKS WANTED
// slot 9219
                if slot <> 9219 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9220 {
// SXTMARK.agc:77
//
// SXTMARK.agc:78
//		CAF	SIX			# BIT2 = MARKING SYSTEM IN USE
// slot 9220
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
// SXTMARK.agc:79
//		MASK	EXTVBACT		# BIT3 = EXTENDED VERB IN PROGRESS
// slot 9221
                    if slot <> 9221 or instruction <> 29220 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:80
//		CCS	A
// slot 9222
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
// SXTMARK.agc:81
//		TC	MKABORT			# SET THEREFORE ABORT
// slot 9223
                if slot <> 9223 or instruction <> 1035 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1035, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:82
//# Page 223
// SXTMARK.agc:83
//		CAF	BIT2			# NOT SET
// slot 9224
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
// SXTMARK.agc:84
//		ADS	EXTVBACT		# SET IT, RESET IN ENDMARK
// slot 9225
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
// SXTMARK.agc:85
//		TC	MARKOK			# YES, FIND VAC AREA
// slot 9226
                    if slot <> 9226 or instruction <> 1037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:86
//
// SXTMARK.agc:87
//MKABORT		TC	BAILOUT
// slot 9227
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
// SXTMARK.agc:88
//		OCT	01211
// slot 9228
    9228, 1298
)).

// bank 07, slots 9229-9239
function agcAotUnit532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9233 {
        if slot <= 9230 {
            if slot <= 9229 {
// SXTMARK.agc:89
//MARKOK		CCS	VAC1USE			# FIND VAC AREA
// slot 9229
                if slot <> 9229 or instruction <> 4352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 256).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:90
//		TC	MKVACFND
// slot 9230
                if slot <> 9230 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9231 {
// SXTMARK.agc:91
//		CCS	VAC2USE
// slot 9231
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
// SXTMARK.agc:92
//		TC	MKVACFND
// slot 9232
                    if slot <> 9232 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:93
//		CCS	VAC3USE
// slot 9233
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
// SXTMARK.agc:94
//		TC	MKVACFND
// slot 9234
                if slot <> 9234 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9235 {
// SXTMARK.agc:95
//		CCS	VAC4USE
// slot 9235
                    if slot <> 9235 or instruction <> 4484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 388).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:96
//		TC	MKVACFND
// slot 9236
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
// SXTMARK.agc:97
//		CCS	VAC5USE
// slot 9237
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
// SXTMARK.agc:98
//		TC	MKVACFND
// slot 9238
                    if slot <> 9238 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:99
//		TC	BAILOUT
// slot 9239
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
// SXTMARK.agc:100
//		OCT	01207
// slot 9240
    9240, 1294
)).

// bank 07, slots 9241-9243
function agcAotUnit533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9241 {
// SXTMARK.agc:101
//
// SXTMARK.agc:102
//MKVACFND	AD	TWO			# ADDRESS OF VAC AREA
// slot 9241
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
// SXTMARK.agc:103
//		TS	MARKSTAT
// slot 9242
            if slot <> 9242 or instruction <> 23256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:104
//		INDEX	A
// slot 9243
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
// SXTMARK.agc:105
//		TS	QPRET			# STORE NEXT AVAILABLE MARK SLOT
// slot 9244
    9244, 45140
)).

// bank 07, slots 9245-9246
function agcAotUnit534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9245 {
// SXTMARK.agc:106
//
// SXTMARK.agc:107
//		CAF	ZERO			# STORE VAC AREA OCCUPIED
// slot 9245
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
// SXTMARK.agc:108
//		INDEX	MARKSTAT
// slot 9246
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
// SXTMARK.agc:109
//		TS	0	-1
// slot 9247
    9247, 45054
)).

// bank 07, slots 9248-9248
function agcAotUnit535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SXTMARK.agc:110
//
// SXTMARK.agc:111
//		TC	CHECKMM			# BACKUP MARK ROUTINE USES SXTMARK
// slot 9248
    if slot <> 9248 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[535] to agcAotUnit535@.

agcAotInstallSourceRope(list(
// SXTMARK.agc:112
//		MM	53
// slot 9249
    9249, 106
)).

// bank 07, slots 9250-9252
function agcAotUnit536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9250 {
// SXTMARK.agc:113
//		TCF	+2
// slot 9250
        if slot <> 9250 or instruction <> 5156 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5156, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9251 {
// SXTMARK.agc:114
//		TCF	SWRETURN
// slot 9251
            if slot <> 9251 or instruction <> 6589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6589, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:115
//		TC	CHECKMM
// slot 9252
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
// SXTMARK.agc:116
//		MM	54
// slot 9253
    9253, 108
)).

// bank 07, slots 9254-9262
function agcAotUnit537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9257 {
        if slot <= 9255 {
            if slot <= 9254 {
// SXTMARK.agc:117
//		TCF	+2
// slot 9254
                if slot <> 9254 or instruction <> 5160 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5160, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:118
//		TCF	SWRETURN
// slot 9255
                if slot <> 9255 or instruction <> 6589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9256 {
// SXTMARK.agc:119
//		CAF	BIT12			# DESIRED NUMBER OF MARKS IN 12-14
// slot 9256
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
// SXTMARK.agc:120
//		EXTEND
// slot 9257
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
// SXTMARK.agc:121
//		MP	RUPTREG1
// slot 9258
                if slot <> 9258 or instruction <> 28728 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 56, readEffective:call(words, 56)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:122
//		XCH	L
// slot 9259
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
// SXTMARK.agc:123
//		ADS	MARKSTAT
// slot 9260
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
// SXTMARK.agc:124
//
// SXTMARK.agc:125
//		CAF	PRIO32			# ENTER MARK JOB
// slot 9261
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
// SXTMARK.agc:126
//		TC	NOVAC
// slot 9262
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
// SXTMARK.agc:127
//		EBANK=	MARKSTAT
// SXTMARK.agc:128
//		2CADR	MKVB51
// slot 9263 9264
    9263, 2510, 9264, 14436
)).

// bank 07, slots 9265-9271
function agcAotUnit538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9267 {
        if slot <= 9265 {
// SXTMARK.agc:129
//
// SXTMARK.agc:130
//		RELINT
// slot 9265
            if slot <> 9265 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9266 {
// SXTMARK.agc:131
//		TCF	SWRETURN		# SAME AS MODEEXIT
// slot 9266
                if slot <> 9266 or instruction <> 6589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:132
//
// SXTMARK.agc:133
//# Page 224
// SXTMARK.agc:134
//# PROGRAM NAME - MKRELEAS					DATE- 5 APRIL 1967
// SXTMARK.agc:135
//# PROGRAM MODIFIED BY 248/278 PROGRAMMERS		       LOG SECTION SXTMARK
// SXTMARK.agc:136
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// SXTMARK.agc:137
//
// SXTMARK.agc:138
//# FUNCTIONAL DESCRIPTION-
// SXTMARK.agc:139
//#	MKRELEAS IS EXECUTED BY INTERNAL ROUTINES TO RELEASE THE MARK SYSTEM TO MAKE IT AVAILABLE TO OTHER INTERNAL
// SXTMARK.agc:140
//#	SYSTEM ROUTINES.  IT ALSO CLEARS THE COARSE OPTICS FLAG BIT AND DISABLES THE OPTICS ERROR COUNTER.
// SXTMARK.agc:141
//
// SXTMARK.agc:142
//# CALLING SEQUENCE-
// SXTMARK.agc:143
//
// SXTMARK.agc:144
//#	TC	BANKCALL
// SXTMARK.agc:145
//#	CADR	MKRELEAS
// SXTMARK.agc:146
//
// SXTMARK.agc:147
//# NORMAL EXIT MODE-
// SXTMARK.agc:148
//#	SWRETURN
// SXTMARK.agc:149
//
// SXTMARK.agc:150
//# ALARM OR ABORT EXIT MODE- NONE
// SXTMARK.agc:151
//
// SXTMARK.agc:152
//# OUTPUT-
// SXTMARK.agc:153
//#	1) BIT9 OPTMODES SET TO 0
// SXTMARK.agc:154
//#	2) OPTIND SET TO -1
// SXTMARK.agc:155
//#	3) 1ST WORD OF VAC AREA SET TO VAC ADDRESS TO SIGNIFY AVAILABILITY.
// SXTMARK.agc:156
//#	4) MARKSTAT CLEARED
// SXTMARK.agc:157
//#	5) BIT2 CHANNEL 12 SET TO 0
// SXTMARK.agc:158
//
// SXTMARK.agc:159
//# ERASABLE INITIALIZATION- NONE
// SXTMARK.agc:160
//
// SXTMARK.agc:161
//# DEBRIS-
// SXTMARK.agc:162
//#	A,MARKSTAT,BIT9,OPTMODES OPTIND,BIT2 CHANNEL 12
// SXTMARK.agc:163
//
// SXTMARK.agc:164
//MKRELEAS	CAF	ZERO			# SHOW MARK SYSTEM NOW AVAILABLE
// slot 9267
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
// SXTMARK.agc:165
//		XCH	MARKSTAT
// slot 9268
                if slot <> 9268 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:166
//		MASK	LOW9
// slot 9269
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
// SXTMARK.agc:167
//		CCS	A
// slot 9270
                if slot <> 9270 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:168
//		INDEX	A
// slot 9271
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
// SXTMARK.agc:169
//		TS	0
// slot 9272
    9272, 45056
)).

// bank 07, slots 9273-9318
function agcAotUnit539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9295 {
        if slot <= 9283 {
            if slot <= 9277 {
                if slot <= 9274 {
                    if slot <= 9273 {
// SXTMARK.agc:170
//MKRLEES		INHINT
// slot 9273
                        if slot <> 9273 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SXTMARK.agc:171
//		CS	BIT9			# COARSE OPTICS RETURN FLAG.
// slot 9274
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
// SXTMARK.agc:172
//		MASK	OPTMODES
// slot 9275
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
// SXTMARK.agc:173
//		TS	OPTMODES
// slot 9276
                            if slot <> 9276 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:174
//
// SXTMARK.agc:175
//		CA	NEGONE
// slot 9277
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
// SXTMARK.agc:176
//		TS	OPTIND			# KILL COARSE OPTICS
// slot 9278
                        if slot <> 9278 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9279 {
// SXTMARK.agc:177
//
// SXTMARK.agc:178
//		CS	BIT2			# DISABLE OPTICS ERROR COUNTER
// slot 9279
                            if slot <> 9279 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:179
//		EXTEND
// slot 9280
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
// SXTMARK.agc:180
//		WAND	CHAN12
// slot 9281
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
// SXTMARK.agc:181
//
// SXTMARK.agc:182
//		RELINT
// slot 9282
                            if slot <> 9282 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:183
//		TC	SWRETURN
// slot 9283
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
// SXTMARK.agc:184
//# Page 225
// SXTMARK.agc:185
//# PROGRAM NAME - MARKRUPT					DATE- 5 APRIL 1967
// SXTMARK.agc:186
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS		       LOG SECTION SXTMARK
// SXTMARK.agc:187
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// SXTMARK.agc:188
//
// SXTMARK.agc:189
//# FUNCTIONAL DESCRIPTION-
// SXTMARK.agc:190
//#	MARKRUPT STORES CDUS,OPTICS AND TIME AND TRANSFERS CONTROL TO THE MARKIT,MARK REJECT OR KEYCOM ROUTINES IF
// SXTMARK.agc:191
//#	BITS IN CHANNEL 16 ARE SET AS REQUIRED.
// SXTMARK.agc:192
//
// SXTMARK.agc:193
//# CALLING SEQUENCE-
// SXTMARK.agc:194
//#	ROUTINE ENTERED VIA KEYRUPT2 WHEN MARK,MARK REJECT OR DSKY KEYS DEPRESSED BY THE OPERATOR.
// SXTMARK.agc:195
//
// SXTMARK.agc:196
//# NORMAL EXIT MODE-
// SXTMARK.agc:197
//#	MARKIT, MKREJECT, OR POSTJUMP ROUTINES (MARK,MARK REJECT, OR DSKY CODE)
// SXTMARK.agc:198
//
// SXTMARK.agc:199
//# ALARM OR ABORT EXIT MODE-
// SXTMARK.agc:200
//#	ALARM AND RESUME
// SXTMARK.agc:201
//
// SXTMARK.agc:202
//# OUTPUT-
// SXTMARK.agc:203
//#	RUPTSTOR+5 = CDUT, RUPTSTOR+3 = CDUS, RUPTSTOR+2 = CDUY,
// SXTMARK.agc:204
//#	RUPTREG3 = CDUZ, RUPTSTOR+6 = CDUX, RUPTSTOR+1 AND SAMPTIME+1 =TIME1,
// SXTMARK.agc:205
//#	RUPTSTOR AND SAMPTIME = TIME2
// SXTMARK.agc:206
//
// SXTMARK.agc:207
//# ERASABLE INITIALIZATION-
// SXTMARK.agc:208
//#	CDUT,CDUS,CDUY,CDUZ,CDUX,TIME2,TIME1,CHANNEL 16 BITS 6,7 OR 1-5
// SXTMARK.agc:209
//
// SXTMARK.agc:210
//# DEBRIS-
// SXTMARK.agc:211
//#	A,QRUPT,RUPTREG3,SAMPTIME,SAMPTIME+1,RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4 (LOCATION 67)
// SXTMARK.agc:212
//
// SXTMARK.agc:213
//MARKRUPT	TS	BANKRUPT		# STORE CDUS AND OPTICS NOW
// slot 9284
                        if slot <> 9284 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9285 {
// SXTMARK.agc:214
//		CA	CDUT
// slot 9285
                            if slot <> 9285 or instruction <> 12317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 29).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:215
//		TS	MKCDUT
// slot 9286
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
// SXTMARK.agc:216
//		CA	CDUS
// slot 9287
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
// SXTMARK.agc:217
//		TS	MKCDUS
// slot 9288
                            if slot <> 9288 or instruction <> 22768 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22768, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:218
//		CA	CDUY
// slot 9289
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
// SXTMARK.agc:219
//		TS	MKCDUY
// slot 9290
                        if slot <> 9290 or instruction <> 22767 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22767, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9291 {
// SXTMARK.agc:220
//		CA	CDUZ
// slot 9291
                            if slot <> 9291 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:221
//		TS	MKCDUZ
// slot 9292
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
// SXTMARK.agc:222
//		CA	CDUX
// slot 9293
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
// SXTMARK.agc:223
//		TS	MKCDUX
// slot 9294
                            if slot <> 9294 or instruction <> 22771 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22771, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:224
//		EXTEND
// slot 9295
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
// SXTMARK.agc:225
//		DCA	TIME2			# GET TIME
// slot 9296
                        if slot <> 9296 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SXTMARK.agc:226
//		DXCH	MKT2T1
// slot 9297
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
// SXTMARK.agc:227
//		EXTEND
// slot 9298
                        if slot <> 9298 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9299 {
// SXTMARK.agc:228
//		DCA	MKT2T1
// slot 9299
                            if slot <> 9299 or instruction <> 12526 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 238, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:229
//		DXCH	SAMPTIME		# RUPT TIME FOR NOUN 65.
// slot 9300
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
// SXTMARK.agc:230
//
// SXTMARK.agc:231
//		XCH	Q
// slot 9301
                        if slot <> 9301 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9302 {
// SXTMARK.agc:232
//		TS	QRUPT
// slot 9302
                            if slot <> 9302 or instruction <> 22538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:233
//
// SXTMARK.agc:234
//		CAF	BIT6			# SEE IF MARK OR MKREJECT
// slot 9303
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
// SXTMARK.agc:235
//# Page 226
// SXTMARK.agc:236
//		EXTEND
// slot 9304
                        if slot <> 9304 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9305 {
// SXTMARK.agc:237
//		RAND	NAVKEYIN
// slot 9305
                            if slot <> 9305 or instruction <> 1038 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:238
//		CCS	A
// slot 9306
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
// SXTMARK.agc:239
//		TC	MARKIT			# ITS A MARK
// slot 9307
                        if slot <> 9307 or instruction <> 1304 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1304, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9308 {
// SXTMARK.agc:240
//
// SXTMARK.agc:241
//		CAF	BIT7			# NOT A MARK, SEE IF MKREJECT
// slot 9308
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
// SXTMARK.agc:242
//		EXTEND
// slot 9309
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
// SXTMARK.agc:243
//		RAND	NAVKEYIN
// slot 9310
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
// SXTMARK.agc:244
//		CCS	A
// slot 9311
                            if slot <> 9311 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:245
//		TC	MKREJECT		# ITS A MARK REJECT
// slot 9312
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
// SXTMARK.agc:246
//
// SXTMARK.agc:247
//KEYCALL		CAF	OCT37			# NOT MARK OR MKREJECT, SEE IF KEYCODE
// slot 9313
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
// SXTMARK.agc:248
//		EXTEND
// slot 9314
                            if slot <> 9314 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:249
//		RAND	NAVKEYIN
// slot 9315
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
// SXTMARK.agc:250
//		EXTEND
// slot 9316
                        if slot <> 9316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9317 {
// SXTMARK.agc:251
//		BZF	+3			# IF NO INBITS
// slot 9317
                            if slot <> 9317 or instruction <> 5224 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5224, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SXTMARK.agc:252
//		TC	POSTJUMP
// slot 9318
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
// SXTMARK.agc:253
//		CADR	KEYCOM			# IT,S A KEY CODE, NOT A MARK.
// slot 9319
    9319, 16260
)).

// bank 07, slots 9320-9320
function agcAotUnit540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SXTMARK.agc:254
//
// SXTMARK.agc:255
//	+3	TC	ALARM			# ALARM IF NO INBITS
// slot 9320
    if slot <> 9320 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[540] to agcAotUnit540@.

agcAotInstallSourceRope(list(
// SXTMARK.agc:256
//		OCT	113
// slot 9321
    9321, 150
)).

// bank 07, slots 9322-9328
function agcAotUnit541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9324 {
        if slot <= 9322 {
// SXTMARK.agc:257
//		TC	RESUME
// slot 9322
            if slot <> 9322 or instruction <> 2779 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2779, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9323 {
// SXTMARK.agc:258
//
// SXTMARK.agc:259
//# Page 227
// SXTMARK.agc:260
//# PROGRAM NAME - MARKCONT				DATE- 19 SEPT 1967
// SXTMARK.agc:261
//
// SXTMARK.agc:262
//# PROGRAM MODIFIED BY 258/278 PROGRAMMERS	       LOG SECTION SXTMARK
// SXTMARK.agc:263
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION	 ASSEMBLY SUNDISK REV. 116
// SXTMARK.agc:264
//
// SXTMARK.agc:265
//# FUNCTIONAL DESCRIPTION-
// SXTMARK.agc:266
//#	MARKCONT IS USED TO PERFORM A SPECIAL MARK FUNCTION FOR R21, TO EXECUTE A SPECIAL DISPLAY OF OPTICS AND TIME OR
// SXTMARK.agc:267
//#	 TO PERFORM A MARK OF THE STAR OR LAND SIGHTING BASED UPON FLASHING V-N.
// SXTMARK.agc:268
//
// SXTMARK.agc:269
//# CALLING SEQUENCE-
// SXTMARK.agc:270
//#	FROM MARKDIF
// SXTMARK.agc:271
//
// SXTMARK.agc:272
//# NORMAL EXIT MODE-
// SXTMARK.agc:273
//#	TASKOVER
// SXTMARK.agc:274
//
// SXTMARK.agc:275
//# ALARM OR ABORT EXIT MODE-
// SXTMARK.agc:276
//#	ALARM AND TASKOVER
// SXTMARK.agc:277
//
// SXTMARK.agc:278
//# OUTPUT-
// SXTMARK.agc:279
//#	1) FOR R21-
// SXTMARK.agc:280
//#	   EBANK=EBANK7
// SXTMARK.agc:281
//#	   MRKBUF1 TO MRKBUF1+6 = TIME2,TIME1,CDUY,OPTICX,CDUZ,OPTICSY,CDUX OF CURRENT R21 MARK FUNCTION.
// SXTMARK.agc:282
//#	   MRKBUF2 TO MRKBUF2+6 CONTAINS PREVIOUS R21 MARK VALUES.
// SXTMARK.agc:283
//#	2) FOR SPECIAL DISPLAY JOB-
// SXTMARK.agc:284
//#	   RUPTREG1 AND MRKBUF1 = CDUS,RUPTREG2 AND MRKBUF1 +1 = CDUT.
// SXTMARK.agc:285
//#	   RUPTREG3 AND MRKBUF1 +2 = TIME2,RUPTREG4 AND MRKBUF1 +3 = TIME1
// SXTMARK.agc:286
//#	3) FOR NORMAL MARKING-
// SXTMARK.agc:287
//#	   DECREMENT BITS14-12 OF MARKSTAT BY 1,
// SXTMARK.agc:288
//#	   BIT10 MARKSTAT SET TO 1,INCREMENT QPRET BY 7,
// SXTMARK.agc:289
//#	   STORE TIME2,TIME1,CDUY,CDUS,CDUZ,CDUT AND CDUX IN VAC+1 TO VAC+7
// SXTMARK.agc:290
//
// SXTMARK.agc:291
//# ERASABLE INITIALIZATION-
// SXTMARK.agc:292
//#	1) FOR R21-
// SXTMARK.agc:293
//#	   BIT14 OF STATE+2 =1, MRKBUF1 TO MRKBUF1+6, ITEMP1, RUPTREG3,
// SXTMARK.agc:294
//#	   RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4
// SXTMARK.agc:295
//#	2) FOR SPECIAL DISPLAY JOB-
// SXTMARK.agc:296
//#	   BIT14 OF STATE+2 =0,MARKSTAT =+0,RUPTREG1,RUPTREG2,RUPTREG3
// SXTMARK.agc:297
//#	   RUPTREG4,RUPTSTOR,RUPTSTOR+1,RUPTSTOR+3,RUPTSTOR+5,
// SXTMARK.agc:298
//#	   BIT12 OF STATE+5 (V59 FLAG),MRKBUF1 THRU MRKBUF1+3
// SXTMARK.agc:299
//#	3) FOR NORMAL MARKING-
// SXTMARK.agc:300
//#	   BIT14 OF STATE+2 =0,MARKSTAE =VAC ADDRESS, A REG, ITEMP1, RUPTREG3,
// SXTMARK.agc:301
//#	   RUPTSTOR TO RUPTSTOR+6 EXCEPT RUPTSTOR+4.
// SXTMARK.agc:302
//
// SXTMARK.agc:303
//# DEBRIS-
// SXTMARK.agc:304
//#	1) FOR R21-
// SXTMARK.agc:305
//#	   A,ITEMP1,MRKBUF1,MRKBUF2
// SXTMARK.agc:306
//#	2) FOR SPECIAL DISPLAY JOB-
// SXTMARK.agc:307
//#	   A,RUPTREG1,RUPTREG2,RUPTREG3,RUPTREG4,MPAC TO MPAC+3
// SXTMARK.agc:308
//#	3) FOR NORMAL MARKING-
// SXTMARK.agc:309
//#	   A,MARKSTAT,ITEMP1,QPRET,VAC+1 TO VAC+7 OF VAC AREA IN USE
// SXTMARK.agc:310
//
// SXTMARK.agc:311
//# Page 228
// SXTMARK.agc:312
//MARKCONT	CAF	BIT14
// slot 9323
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
// SXTMARK.agc:313
//		MASK	STATE	+2		# R21 MARK (SPECIAL MARKING FOR R21)
// slot 9324
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
// SXTMARK.agc:314
//		EXTEND
// slot 9325
                if slot <> 9325 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:315
//		BZF	MARKET			# NOT SET THEREFORE REGULAR MARKING
// slot 9326
                if slot <> 9326 or instruction <> 5240 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5240, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9327 {
// SXTMARK.agc:316
//MARKIT1		CAF	SIX			# SPECIAL FOR R21
// slot 9327
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
// SXTMARK.agc:317
//		TC	GENTRAN			# TRANSFER MRKBUF1 TO MRKBUF2
// slot 9328
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
// SXTMARK.agc:318
//		ADRES	MRKBUF1
// slot 9329
    9329, 1962,
// SXTMARK.agc:319
//		ADRES	MRKBUF2
// slot 9330
    9330, 1976
)).

// bank 07, slots 9331-9332
function agcAotUnit542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9331 {
// SXTMARK.agc:320
//
// SXTMARK.agc:321
//		CAF	SIX			# TRANSFER CURRENT MARK DATA TO MARKBUF1
// slot 9331
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
// SXTMARK.agc:322
//		TC	GENTRAN
// slot 9332
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
// SXTMARK.agc:323
//		ADRES	MKT2T1
// slot 9333
    9333, 474,
// SXTMARK.agc:324
//		ADRES	MRKBUF1
// slot 9334
    9334, 1962
)).

// bank 07, slots 9335-9347
function agcAotUnit543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9340 {
        if slot <= 9337 {
            if slot <= 9335 {
// SXTMARK.agc:325
//
// SXTMARK.agc:326
//		TCF	TASKOVER
// slot 9335
                if slot <> 9335 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9336 {
// SXTMARK.agc:327
//
// SXTMARK.agc:328
//MARKET		CCS	MARKSTAT		# SEE IF MARKS CALLED FOR
// slot 9336
                    if slot <> 9336 or instruction <> 4824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 728).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:329
//		TC	MARK2			# COLLECT MARKS
// slot 9337
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
// SXTMARK.agc:330
//
// SXTMARK.agc:331
//		CAF	TWO			# IS MARKING SYSTEM IN USE (BIT2)
// slot 9338
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
// SXTMARK.agc:332
//		MASK	EXTVBACT
// slot 9339
                    if slot <> 9339 or instruction <> 29220 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:333
//		EXTEND
// slot 9340
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
// SXTMARK.agc:334
//		BZF	MARKET3			# MARKING NOT CALLED FOR
// slot 9341
                if slot <> 9341 or instruction <> 5263 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5263, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9342 {
// SXTMARK.agc:335
//		CAF	BIT12
// slot 9342
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
// SXTMARK.agc:336
//		MASK	STATE	+5		# V59FLAG
// slot 9343
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
// SXTMARK.agc:337
//		EXTEND
// slot 9344
                    if slot <> 9344 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:338
//		BZF	MARKET3			# IF V59FLAG NOT SET-MARK UNCALLED FOR
// slot 9345
                    if slot <> 9345 or instruction <> 5263 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5263, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9346 {
// SXTMARK.agc:339
//		CAF	PRIO5			# CALIBRATION MARK (SET) FOR P23
// slot 9346
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
// SXTMARK.agc:340
//		TC	NOVAC			# SPECIAL DISPLAY JOB
// slot 9347
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
// SXTMARK.agc:341
//		EBANK=	MRKBUF1
// SXTMARK.agc:342
//		2CADR	MARKDISP
// slot 9348 9349
    9348, 2604, 9349, 63598
)).

// bank 07, slots 9350-9351
function agcAotUnit544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9350 {
// SXTMARK.agc:343
//
// SXTMARK.agc:344
//		CAF	SIX
// slot 9350
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
// SXTMARK.agc:345
//		TC	GENTRAN			# TRANSFER MARK DATE TO MARKDOWN
// slot 9351
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
// SXTMARK.agc:346
//		ADRES	MKT2T1
// slot 9352
    9352, 474,
// SXTMARK.agc:347
//		ADRES	MARKDOWN
// slot 9353
    9353, 1912
)).

// bank 07, slots 9354-9355
function agcAotUnit545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9354 {
// SXTMARK.agc:348
//		CAF	SIX
// slot 9354
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
// SXTMARK.agc:349
//		TC	GENTRAN			# TRANSFER MARK DATA TO MRKBUF1 FOR
// slot 9355
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
// SXTMARK.agc:350
//		ADRES	MKT2T1			# SPECIAL DISPLAY OF SHAFT AND TRUNNION
// slot 9356
    9356, 474,
// SXTMARK.agc:351
//		ADRES	MRKBUF1			# IF V59 ACTING
// slot 9357
    9357, 1962
)).

// bank 07, slots 9358-9359
function agcAotUnit546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9358 {
// SXTMARK.agc:352
//		TCF	TASKOVER
// slot 9358
        if slot <> 9358 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:353
//MARKET3		TC	ALARM
// slot 9359
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
// SXTMARK.agc:354
//		OCT	122			# MARKING NOT CALLED FOR
// slot 9360
    9360, 164
)).

// bank 07, slots 9361-9362
function agcAotUnit547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9361 {
// SXTMARK.agc:355
//		TCF	TASKOVER
// slot 9361
        if slot <> 9361 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:356
//114ALM		TC	ALARM			# MARK NOT WANTED
// slot 9362
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
// SXTMARK.agc:357
//		OCT	114
// slot 9363
    9363, 152
)).

// bank 07, slots 9364-9368
function agcAotUnit548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9365 {
        if slot <= 9364 {
// SXTMARK.agc:358
//		TCF	TASKOVER
// slot 9364
            if slot <> 9364 or instruction <> 6868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:359
//
// SXTMARK.agc:360
//# Page 229
// SXTMARK.agc:361
//# STORE MARK DATA IN MKVAC AND INCREMENT POINTER
// SXTMARK.agc:362
//
// SXTMARK.agc:363
//MARK2		AD	74K			# SEE IF MARKS WANTED-REDUCE MARKS WANTED
// slot 9365
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
// SXTMARK.agc:364
//		EXTEND
// slot 9366
            if slot <> 9366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9367 {
// SXTMARK.agc:365
//		BZMF	114ALM			# MARK NOT WANTED-ALARM
// slot 9367
                if slot <> 9367 or instruction <> 25746 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25746, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:366
//		TS	MARKSTAT
// slot 9368
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

// bank 07, slots 9369-9374
function agcAotUnit549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9371 {
        if slot <= 9369 {
// SXTMARK.agc:367
//		COM
// slot 9369
            if slot <> 9369 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9370 {
// SXTMARK.agc:368
//		MASK	BIT10			# SET BIT10 TO ENABLE REJECT
// slot 9370
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
// SXTMARK.agc:369
//		ADS	MARKSTAT
// slot 9371
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
// SXTMARK.agc:370
//
// SXTMARK.agc:371
//		MASK	LOW9
// slot 9372
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
// SXTMARK.agc:372
//		TS	ITEMP1
// slot 9373
                if slot <> 9373 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:373
//		INDEX	A
// slot 9374
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
// SXTMARK.agc:374
//		XCH	QPRET			# PICK UP MARK SLOT-POINTER
// slot 9375
    9375, 47188
)).

// bank 07, slots 9376-9378
function agcAotUnit550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9376 {
// SXTMARK.agc:375
//		TS	ITEMP2			# SAVE CURRENT POINTER
// slot 9376
        if slot <> 9376 or instruction <> 22578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22578, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9377 {
// SXTMARK.agc:376
//		AD	SEVEN			# INCREMENT POINTER
// slot 9377
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
// SXTMARK.agc:377
//		INDEX	ITEMP1
// slot 9378
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
// SXTMARK.agc:378
//		TS	QPRET			# STORE ADVANCED POINTER
// slot 9379
    9379, 45140
)).

// bank 07, slots 9380-9382
function agcAotUnit551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9380 {
// SXTMARK.agc:379
//
// SXTMARK.agc:380
//VACSTOR		EXTEND
// slot 9380
        if slot <> 9380 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9381 {
// SXTMARK.agc:381
//		DCA	MKT2T1
// slot 9381
            if slot <> 9381 or instruction <> 12526 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 238, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:382
//		INDEX	ITEMP2
// slot 9382
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
// SXTMARK.agc:383
//		DXCH	0
// slot 9383
    9383, 43010
)).

// bank 07, slots 9384-9385
function agcAotUnit552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9384 {
// SXTMARK.agc:384
//		CA	MKCDUY
// slot 9384
        if slot <> 9384 or instruction <> 12527 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 239).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:385
//		INDEX	ITEMP2
// slot 9385
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
// SXTMARK.agc:386
//		TS	2
// slot 9386
    9386, 45060
)).

// bank 07, slots 9387-9388
function agcAotUnit553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9387 {
// SXTMARK.agc:387
//		CA	MKCDUS
// slot 9387
        if slot <> 9387 or instruction <> 12528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 240).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:388
//		INDEX	ITEMP2
// slot 9388
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
// SXTMARK.agc:389
//		TS	3
// slot 9389
    9389, 45062
)).

// bank 07, slots 9390-9391
function agcAotUnit554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9390 {
// SXTMARK.agc:390
//		CA	MKCDUZ
// slot 9390
        if slot <> 9390 or instruction <> 12529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 241).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:391
//		INDEX	ITEMP2
// slot 9391
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
// SXTMARK.agc:392
//		TS	4
// slot 9392
    9392, 45064
)).

// bank 07, slots 9393-9394
function agcAotUnit555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9393 {
// SXTMARK.agc:393
//		CA	MKCDUT
// slot 9393
        if slot <> 9393 or instruction <> 12530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 242).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:394
//		INDEX	ITEMP2
// slot 9394
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
// SXTMARK.agc:395
//		TS	5
// slot 9395
    9395, 45066
)).

// bank 07, slots 9396-9397
function agcAotUnit556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9396 {
// SXTMARK.agc:396
//		CA	MKCDUX
// slot 9396
        if slot <> 9396 or instruction <> 12531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 243).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:397
//		INDEX	ITEMP2
// slot 9397
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
// SXTMARK.agc:398
//		TS	6
// slot 9398
    9398, 45068
)).

// bank 07, slots 9399-9405
function agcAotUnit557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9401 {
        if slot <= 9399 {
// SXTMARK.agc:399
//
// SXTMARK.agc:400
//		CAF	PRIO34			# IF ALL MARKS MADE FLASH VB50
// slot 9399
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
// SXTMARK.agc:401
//		MASK	MARKSTAT
// slot 9400
                if slot <> 9400 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:402
//		EXTEND
// slot 9401
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
// SXTMARK.agc:403
//		BZF	+2
// slot 9402
                if slot <> 9402 or instruction <> 5308 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5308, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:404
//		TCF	TASKOVER
// slot 9403
                if slot <> 9403 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9404 {
// SXTMARK.agc:405
//		CAF	PRIO32
// slot 9404
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
// SXTMARK.agc:406
//		TC	NOVAC
// slot 9405
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
// SXTMARK.agc:407
//		EBANK=	MARKSTAT
// SXTMARK.agc:408
//		2CADR	MKVB50
// slot 9406 9407
    9406, 2596, 9407, 14436
)).

// bank 07, slots 9408-9418
function agcAotUnit558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9412 {
        if slot <= 9409 {
            if slot <= 9408 {
// SXTMARK.agc:409
//
// SXTMARK.agc:410
//		TCF	TASKOVER
// slot 9408
                if slot <> 9408 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:411
//
// SXTMARK.agc:412
//# Page 230
// SXTMARK.agc:413
//# PROGRAM NAME - MKREJECT					DATE- 5 APRIL 1967
// SXTMARK.agc:414
//# PROGRAM MODIFIED BY 258/276 PROGRAMMERS		       LOG SECTION SXTMARK
// SXTMARK.agc:415
//# MOD BY- R. MELANSON TO ADD DOCUMENTATION		 ASSEMBLY SUNDISK REV. 116
// SXTMARK.agc:416
//
// SXTMARK.agc:417
//# FUNCTIONAL DESCRIPTION-
// SXTMARK.agc:418
//#	ROUTINE ALLOWS OPEATOR TO REJECT MARK MADE PRIOR TO ACCEPTANCE AND ALLOWS A NEW MARK TO BE MADE BY ASTRONAUT
// SXTMARK.agc:419
//
// SXTMARK.agc:420
//# CALLING SEQUENCE-
// SXTMARK.agc:421
//#	FROM MARKRUPT IF BIT7 OF CHANNEL 16 IS 1.
// SXTMARK.agc:422
//
// SXTMARK.agc:423
//# NORMAL EXIT MODE-
// SXTMARK.agc:424
//#	RESUME
// SXTMARK.agc:425
//
// SXTMARK.agc:426
//# ALARM OR ABORT EXIT MODE-
// SXTMARK.agc:427
//#	ALARM AND RESUME
// SXTMARK.agc:428
//
// SXTMARK.agc:429
//# OUTPUT-
// SXTMARK.agc:430
//#	1) FOR R21-
// SXTMARK.agc:431
//#	  MRKRUP1 SET TO -1
// SXTMARK.agc:432
//#	2) FOR NORMAL MARKING-
// SXTMARK.agc:433
//#	   BIT10 MARKSTAT =0,INCREMENT NO. MARKS BY 1,DECREMENT QPRET BY 7
// SXTMARK.agc:434
//
// SXTMARK.agc:435
//# ERASABLE INITIALIZATION-
// SXTMARK.agc:436
//#	1) FOR R21-
// SXTMARK.agc:437
//#	   BIT14 OF STATE+2 SET TO 1
// SXTMARK.agc:438
//#	2) FOR NORMAL MARKING-
// SXTMARK.agc:439
//#	   BIT14 OF STATE+2 SET TO 0, MARKSTAT,QPRET
// SXTMARK.agc:440
//
// SXTMARK.agc:441
//# DEBRIS-
// SXTMARK.agc:442
//#	1) FOR R21-
// SXTMARK.agc:443
//#	   A,MARKSTAT,EBANK
// SXTMARK.agc:444
//#	2) FOR NORMAL MARKING-
// SXTMARK.agc:445
//#	   A,MARKSTAT,ITEMP1,QPRET
// SXTMARK.agc:446
//
// SXTMARK.agc:447
//MKREJECT	CAF	BIT14
// slot 9409
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
// SXTMARK.agc:448
//		MASK	STATE	+2		# R21 MARK (SPECIAL MARKING FOR R21)
// slot 9410
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
// SXTMARK.agc:449
//		EXTEND
// slot 9411
                    if slot <> 9411 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:450
//		BZF	MRKREJCT		# NOT SET THEREFORE REGULAR REJECT
// slot 9412
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
// SXTMARK.agc:451
//		CA	NEGONE			# -1 (FOR R22)
// slot 9413
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
// SXTMARK.agc:452
//		TS	MRKBUF1			# -0 IN TIME IS FLAG TO R22 SIGNIFYING A
// slot 9414
                    if slot <> 9414 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:453
//		TC	RESUME			# REJECTED MARK
// slot 9415
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
// SXTMARK.agc:454
//MRKREJCT	CCS	MARKSTAT		# SEE IF MARKS BEING ACCEPTED
// slot 9416
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
// SXTMARK.agc:455
//		TC	REJECT2
// slot 9417
                    if slot <> 9417 or instruction <> 1229 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1229, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:456
//		TC	ALARM			# MARKS NOT BEING ACCEPTED
// slot 9418
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
// SXTMARK.agc:457
//		OCT	112
// slot 9419
    9419, 148
)).

// bank 07, slots 9420-9427
function agcAotUnit559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9423 {
        if slot <= 9421 {
            if slot <= 9420 {
// SXTMARK.agc:458
//		TC	RESUME
// slot 9420
                if slot <> 9420 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:459
//
// SXTMARK.agc:460
//REJECT2		CS	BIT10			# SEE IF MARK HAD BEEN MADE SINCE LAST
// slot 9421
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
// SXTMARK.agc:461
//		MASK	MARKSTAT		# REJECT, AND SET BIT10 TO ZERO TO
// slot 9422
                if slot <> 9422 or instruction <> 29400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:462
//		XCH	MARKSTAT		# SHOW MARK REJECT
// slot 9423
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
// SXTMARK.agc:463
//# Page 231
// SXTMARK.agc:464
//		MASK	BIT10
// slot 9424
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
// SXTMARK.agc:465
//		CCS	A
// slot 9425
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
// SXTMARK.agc:466
//		TC	REJECT3
// slot 9426
                if slot <> 9426 or instruction <> 1238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1238, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:467
//
// SXTMARK.agc:468
//		TC	ALARM			# DONT ACCEPT TWO REJECTS TOGETHER
// slot 9427
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
// SXTMARK.agc:469
//		OCT	110
// slot 9428
    9428, 144
)).

// bank 07, slots 9429-9434
function agcAotUnit560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9431 {
        if slot <= 9429 {
// SXTMARK.agc:470
//		TC	RESUME
// slot 9429
            if slot <> 9429 or instruction <> 2779 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2779, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9430 {
// SXTMARK.agc:471
//
// SXTMARK.agc:472
//REJECT3		CAF	LOW9			# DECREMENT POINTER TO REJECT MARK
// slot 9430
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
// SXTMARK.agc:473
//		MASK	MARKSTAT
// slot 9431
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
// SXTMARK.agc:474
//		TS	ITEMP1
// slot 9432
            if slot <> 9432 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9433 {
// SXTMARK.agc:475
//		CS	SEVEN
// slot 9433
                if slot <> 9433 or instruction <> 18963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:476
//		INDEX	ITEMP1
// slot 9434
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
// SXTMARK.agc:477
//		ADS	QPRET			# NEW POINTER
// slot 9435
    9435, 22612
)).

// bank 07, slots 9436-9443
function agcAotUnit561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9439 {
        if slot <= 9437 {
            if slot <= 9436 {
// SXTMARK.agc:478
//
// SXTMARK.agc:479
//		CAF	BIT12			# INCREMENT MARKS WANTED AND IF FIELD
// slot 9436
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
// SXTMARK.agc:480
//		AD	MARKSTAT		# IS NOW NON-ZERO, CHANGE TO VB51 TO
// slot 9437
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
// SXTMARK.agc:481
//		XCH	MARKSTAT		# INDICATE MORE MARKS WANTED
// slot 9438
                if slot <> 9438 or instruction <> 24280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 728, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:482
//		MASK	PRIO34			# INDICATE MORE MARKS WANTED
// slot 9439
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
// SXTMARK.agc:483
//		CCS	A
// slot 9440
                if slot <> 9440 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:484
//		TC	RESUME
// slot 9441
                if slot <> 9441 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9442 {
// SXTMARK.agc:485
//		CAF	PRIO32
// slot 9442
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
// SXTMARK.agc:486
//		TC	NOVAC
// slot 9443
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
// SXTMARK.agc:487
//		EBANK=	MARKSTAT
// SXTMARK.agc:488
//		2CADR	MKVB51
// slot 9444 9445
    9444, 2510, 9445, 14436
)).

// bank 07, slots 9446-9447
function agcAotUnit562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9446 {
// SXTMARK.agc:489
//
// SXTMARK.agc:490
//		TC	RESUME
// slot 9446
        if slot <> 9446 or instruction <> 2779 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2779, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SXTMARK.agc:491
//
// SXTMARK.agc:492
//# Page 232
// SXTMARK.agc:493
//# PROGRAM DESCRIPTION MKVB51 AND MKVB50
// SXTMARK.agc:494
//
// SXTMARK.agc:495
//# AUTHOR-BARNERT DATE-2-15-67 MOD-0
// SXTMARK.agc:496
//# PURPOSE	FLASH V51N70,V51N43, OR V51 TO REQUEST MARKING,
// SXTMARK.agc:497
//#		AND V50N25 R1=16 TO REQUEST TERMINATE MARKING.
// SXTMARK.agc:498
//
// SXTMARK.agc:499
//# CALLING SEQUENCE	AS JOB WITHIN SXTMARK
// SXTMARK.agc:500
//
// SXTMARK.agc:501
//# EXIT TO ENDMARK UPON RECEIPT OF V33, V34 CAUSES GOTOPOOH, ENTER
// SXTMARK.agc:502
//#		RECYCLES THE DISPLAY
// SXTMARK.agc:503
//
// SXTMARK.agc:504
//# NOTE- SXTMARK AUTOMATICALLY CHANGES FROM CALLING MKVB51 TO MKVB50 WHEN
// SXTMARK.agc:505
//#		SUFFICIENT MARKS HAVE BEEN MADE, AND THE REVERSE WHEN A MARK
// SXTMARK.agc:506
//#		REJECT REDUCES THE NUMBER MADE BELOW THAT REQUIRED
// SXTMARK.agc:507
//
// SXTMARK.agc:508
//# SUBROUTINES CALLED- BANKCALL, GOMARK2,GOODEND,ENDMARK,WAITLIST
// SXTMARK.agc:509
//
// SXTMARK.agc:510
//# ALARM OR ABORT MODES - NONE
// SXTMARK.agc:511
//
// SXTMARK.agc:512
//# ERASABLE USED-VERBREG,MARKSTAT,QPRET,DSPTEM1
// SXTMARK.agc:513
//
// SXTMARK.agc:514
//# OUTPUT MARKSTAT=VAC ADDRESS
// SXTMARK.agc:515
//
// SXTMARK.agc:516
//# 	 QPRET=	NO.MARKS
// SXTMARK.agc:517
//MKVB51		TC	BANKCALL		# CLEAR DISPLAY FOR MARK VERB
// slot 9447
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
// SXTMARK.agc:518
//		CADR	KLEENEX
// slot 9448
    9448, 17120
)).

// bank 07, slots 9449-9450
function agcAotUnit563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9449 {
// SXTMARK.agc:519
//		CAF	VB51			# DISPLAY MARK VB51
// slot 9449
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
// SXTMARK.agc:520
//		TC	BANKCALL
// slot 9450
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
// SXTMARK.agc:521
//		CADR	GOMARK4
// slot 9451
    9451, 17140
)).

// bank 07, slots 9452-9456
function agcAotUnit564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9453 {
        if slot <= 9452 {
// SXTMARK.agc:522
//		TCF	TERMSXT			# VB34-TERMINATE
// slot 9452
            if slot <> 9452 or instruction <> 5359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5359, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:523
//		TCF	ENTANSWR		# V33-PROCEED-MARKING DONE
// slot 9453
            if slot <> 9453 or instruction <> 5368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5368, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9454 {
// SXTMARK.agc:524
//		TCF	MKVB5X			# ENTER-RECYCLE TO INITIAL MARK DISPLAY
// slot 9454
            if slot <> 9454 or instruction <> 5390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9455 {
// SXTMARK.agc:525
//
// SXTMARK.agc:526
//TERMSXT		TC	CLEARMRK		# CLEAR MARK ACTIVITY.
// slot 9455
                if slot <> 9455 or instruction <> 2910 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2910, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:527
//
// SXTMARK.agc:528
//		TC	CHECKMM
// slot 9456
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
// SXTMARK.agc:529
//		MM	03
// slot 9457
    9457, 6
)).

// bank 07, slots 9458-9460
function agcAotUnit565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9458 {
// SXTMARK.agc:530
//		TCF	+2
// slot 9458
        if slot <> 9458 or instruction <> 5364 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5364, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9459 {
// SXTMARK.agc:531
//		TC	TERMP03
// slot 9459
            if slot <> 9459 or instruction <> 1270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1270, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:532
//		TC	POSTJUMP
// slot 9460
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
// SXTMARK.agc:533
//		CADR	TERM52
// slot 9461
    9461, 24842
)).

// bank 07, slots 9462-9462
function agcAotUnit566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SXTMARK.agc:534
//
// SXTMARK.agc:535
//TERMP03		TC	UPFLAG
// slot 9462
    if slot <> 9462 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[566] to agcAotUnit566@.

agcAotInstallSourceRope(list(
// SXTMARK.agc:536
//		ADRES	TRM03FLG
// slot 9463
    9463, 52
)).

// bank 07, slots 9464-9468
function agcAotUnit567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9465 {
        if slot <= 9464 {
// SXTMARK.agc:537
//ENTANSWR	CAF	LOW9			# PUT VAC ADR IN MARKSTAT AND NO. OF
// slot 9464
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
// SXTMARK.agc:538
//		MASK	MARKSTAT		# MARKS MADE IN QPRET BEFORE LEAVING
// slot 9465
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
// SXTMARK.agc:539
//		TS	MARKSTAT		# SXTMARK
// slot 9466
            if slot <> 9466 or instruction <> 23256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9467 {
// SXTMARK.agc:540
//		COM
// slot 9467
                if slot <> 9467 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:541
//		INDEX	MARKSTAT
// slot 9468
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
// SXTMARK.agc:542
//		AD	QPRET
// slot 9469
    9469, 49236
)).

// bank 07, slots 9470-9475
function agcAotUnit568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9472 {
        if slot <= 9470 {
// SXTMARK.agc:543
//# Page 233
// SXTMARK.agc:544
//		EXTEND
// slot 9470
            if slot <> 9470 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9471 {
// SXTMARK.agc:545
//		BZMF	JAMIT			# NO MARKS MADE, SHOW IT IN QPRET, R53
// slot 9471
                if slot <> 9471 or instruction <> 25859 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:546
//		EXTEND				#	WILL PICK IT UP AND RECYCLE
// slot 9472
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
// SXTMARK.agc:547
//		MP	BIT12			# THIS PUTS NUMBER MARKS-1 IN A
// slot 9473
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
// SXTMARK.agc:548
//		AD	ONE
// slot 9474
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
// SXTMARK.agc:549
//JAMIT		INDEX	MARKSTAT		# STORE NO OF MARKS MADE
// slot 9475
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
// SXTMARK.agc:550
//		TS	QPRET
// slot 9476
    9476, 45140
)).

// bank 07, slots 9477-9479
function agcAotUnit569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9477 {
// SXTMARK.agc:551
//		INHINT				# SERVICE OPTSTALL INTERFACE WITH
// slot 9477
        if slot <> 9477 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9478 {
// SXTMARK.agc:552
//		CAF	FIVE
// slot 9478
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
// SXTMARK.agc:553
//		TC	WAITLIST
// slot 9479
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
// SXTMARK.agc:554
//		EBANK=	MARKSTAT
// SXTMARK.agc:555
//		2CADR	ENDMARKS
// slot 9480 9481
    9480, 2582, 9481, 14436
)).

// bank 07, slots 9482-9484
function agcAotUnit570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9482 {
// SXTMARK.agc:556
//
// SXTMARK.agc:557
//		TC	ENDMARK			# KNOCKS DOWN MARKING FLAG + DOES ENDOFJOB
// slot 9482
        if slot <> 9482 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9483 {
// SXTMARK.agc:558
//
// SXTMARK.agc:559
//ENDMARKS	CAF	ONE
// slot 9483
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
// SXTMARK.agc:560
//		TC	IBNKCALL
// slot 9484
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
// SXTMARK.agc:561
//		CADR	GOODEND
// slot 9485
    9485, 16080
)).

// bank 07, slots 9486-9493
function agcAotUnit571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9489 {
        if slot <= 9487 {
            if slot <= 9486 {
// SXTMARK.agc:562
//MKVB5X		CAF	PRIO34
// slot 9486
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
// SXTMARK.agc:563
//		MASK	MARKSTAT		# RE-DISPLAY VB51 IF MORE MARKS WANTED
// slot 9487
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
// SXTMARK.agc:564
//		CCS	A			# AND VB50 IF ALL IN
// slot 9488
                if slot <> 9488 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:565
//		TCF	MKVB51
// slot 9489
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
// SXTMARK.agc:566
//MKVB50		CAF	R1D1			# OCT 16
// slot 9490
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
// SXTMARK.agc:567
//		TS	DSPTEM1
// slot 9491
                if slot <> 9491 or instruction <> 23077 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23077, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9492 {
// SXTMARK.agc:568
//		CAF	V50N25
// slot 9492
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
// SXTMARK.agc:569
//		TCF	MKVB51	+3
// slot 9493
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
// SXTMARK.agc:570
//
// SXTMARK.agc:571
//V50N25		VN	5025
// slot 9494
    9494, 12850,
// SXTMARK.agc:572
//VB51		VN	5100
// slot 9495
    9495, 13056
)).

// bank 07, slots 9496-9501
function agcAotUnit572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9498 {
        if slot <= 9496 {
// SXTMARK.agc:573
//OCT37		=	LOW5
// SXTMARK.agc:574
//
// SXTMARK.agc:575
//# PROGRAM NAME - MARKIT				DATE- 19 SEPT 1967
// SXTMARK.agc:576
//
// SXTMARK.agc:577
//# CALLING SEQUENCE
// SXTMARK.agc:578
//#	FROM MARKRUPT IF CHAN 16 BIT 6 = 1
// SXTMARK.agc:579
//
// SXTMARK.agc:580
//# EXIT
// SXTMARK.agc:581
//#	RESUME
// SXTMARK.agc:582
//
// SXTMARK.agc:583
//# INPUT
// SXTMARK.agc:584
//#	CDUCHKWD.  ALSO ALL INITIALIZATION FOR MARKCONT
// SXTMARK.agc:585
//
// SXTMARK.agc:586
//# OUTPUT
// SXTMARK.agc:587
//#	MKT2T1,MKCDUX,MKCDUY,MKCDUZ,MKCDUS,MKCDUT
// SXTMARK.agc:588
//
// SXTMARK.agc:589
//# ALARM EXIT
// SXTMARK.agc:590
//#	NONE
// SXTMARK.agc:591
//
// SXTMARK.agc:592
//MARKIT		CCS	CDUCHKWD
// slot 9496
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
// SXTMARK.agc:593
//		TCF	+3			# DELAY OF CDUCHKWD CS IF PNZ
// slot 9497
                if slot <> 9497 or instruction <> 5404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5404, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:594
//# Page 234
// SXTMARK.agc:595
//		TCF	+2
// slot 9498
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
// SXTMARK.agc:596
//		CAF	ZERO
// slot 9499
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
// SXTMARK.agc:597
//		AD	ONE			# 10 MS IF NO CHECK
// slot 9500
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
// SXTMARK.agc:598
//		TC	WAITLIST
// slot 9501
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
// SXTMARK.agc:599
//		EBANK=	MRKBUF1
// SXTMARK.agc:600
//		2CADR	MARKDIF
// slot 9502 9503
    9502, 2310, 9503, 16494
)).

// bank 07, slots 9504-9504
function agcAotUnit573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SXTMARK.agc:601
//
// SXTMARK.agc:602
//		TCF	RESUME
// slot 9504
    if slot <> 9504 or instruction <> 6875 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6875, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[573] to agcAotUnit573@.

// bank 10, slots 10371-10382
function agcAotUnit642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10376 {
        if slot <= 10373 {
            if slot <= 10371 {
// SXTMARK.agc:603
//
// SXTMARK.agc:604
//		SETLOC	SXTMARK1
// SXTMARK.agc:605
//		BANK
// SXTMARK.agc:606
//
// SXTMARK.agc:607
//		COUNT	20/SXTMK
// SXTMARK.agc:608
//
// SXTMARK.agc:609
//# PROGRAM NAME - MARKDIF			DATE- 19 SEPT 1967
// SXTMARK.agc:610
//
// SXTMARK.agc:611
//# CALLING SEQUENCE
// SXTMARK.agc:612
//#	WAITLIST FROM MARKIT
// SXTMARK.agc:613
//
// SXTMARK.agc:614
//# EXIT
// SXTMARK.agc:615
//#	TASKOVER TO IBNKCALL TO MARKCONT
// SXTMARK.agc:616
//
// SXTMARK.agc:617
//# INPUT
// SXTMARK.agc:618
//# 	OUTPUT FROM MARKIT, INPUT TO MARKCONT, CDUCHKWD
// SXTMARK.agc:619
//
// SXTMARK.agc:620
//# OUTPUT
// SXTMARK.agc:621
//#	RUPTSTOR - RUPTSTOR+3,RUPTREG3,RUPTSTOR+5 - RUPTSTOR+6
// SXTMARK.agc:622
//
// SXTMARK.agc:623
//# ALARM EXIT
// SXTMARK.agc:624
//#	ALARM AND TASKOVER
// SXTMARK.agc:625
//
// SXTMARK.agc:626
//MARKDIF		CA	CDUCHKWD		# IF DELAY CHECK IS ZERO OR NEG,ACP MARK
// slot 10371
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
// SXTMARK.agc:627
//		EXTEND
// slot 10372
                    if slot <> 10372 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:628
//		BZMF	MKACPT
// slot 10373
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
// SXTMARK.agc:629
//		CS	BIT1
// slot 10374
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
// SXTMARK.agc:630
//		TS	MKNDX			# SET INDEX -1
// slot 10375
                    if slot <> 10375 or instruction <> 22764 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22764, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:631
//		CA	MKCDUX
// slot 10376
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
// SXTMARK.agc:632
//		TC	DIFCHK			# SEE IF VEHICLE RATE TO MUCH AT MARK
// slot 10377
                if slot <> 10377 or instruction <> 1168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1168, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10378 {
// SXTMARK.agc:633
//		CA	MKCDUY
// slot 10378
                    if slot <> 10378 or instruction <> 12527 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 239).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:634
//		TC	DIFCHK
// slot 10379
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
// SXTMARK.agc:635
//		CA	MKCDUZ
// slot 10380
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
// SXTMARK.agc:636
//		TC	DIFCHK
// slot 10381
                    if slot <> 10381 or instruction <> 1168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1168, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:637
//
// SXTMARK.agc:638
//MKACPT		TC	IBNKCALL
// slot 10382
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
// SXTMARK.agc:639
//		CADR	MARKCONT		# MARK DATA OK, WHAT DO WE DO WITH IT
// slot 10383
    10383, 14550
)).

// bank 10, slots 10384-10386
function agcAotUnit643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10384 {
// SXTMARK.agc:640
//
// SXTMARK.agc:641
//DIFCHK		INCR	MKNDX			# INCREMENT INDEX
// slot 10384
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
// SXTMARK.agc:642
//
// SXTMARK.agc:643
//		EXTEND
// slot 10385
            if slot <> 10385 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SXTMARK.agc:644
//		INDEX	MKNDX
// slot 10386
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
// SXTMARK.agc:645
//# Page 235
// SXTMARK.agc:646
//		MSU	CDUX			# GET MARK(ICDU) - CURRENT(ICDU)
// slot 10387
    10387, 16436
)).

// bank 10, slots 10388-10396
function agcAotUnit644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10391 {
        if slot <= 10389 {
            if slot <= 10388 {
// SXTMARK.agc:647
//		CCS	A
// slot 10388
                if slot <> 10388 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:648
//		TCF	+4
// slot 10389
                if slot <> 10389 or instruction <> 5273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10390 {
// SXTMARK.agc:649
//		TC	Q
// slot 10390
                if slot <> 10390 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:650
//		TCF	+2
// slot 10391
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
// SXTMARK.agc:651
//		TC	Q
// slot 10392
                if slot <> 10392 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SXTMARK.agc:652
//		AD	NEG2			# SEE IF DIFFERENCE GREATER THAN 3 BITS
// slot 10393
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
// SXTMARK.agc:653
//		EXTEND
// slot 10394
                if slot <> 10394 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10395 {
// SXTMARK.agc:654
//		BZMF	-3			# NOT GREATER
// slot 10395
                    if slot <> 10395 or instruction <> 25752 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25752, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SXTMARK.agc:655
//
// SXTMARK.agc:656
//		TC	ALARM			# COUPLED WITH PROGRAM ALARM
// slot 10396
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
// SXTMARK.agc:657
//		OCT	00121
// slot 10397
    10397, 162
)).

// bank 10, slots 10398-10398
function agcAotUnit645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SXTMARK.agc:658
//
// SXTMARK.agc:659
//		TCF	TASKOVER		# DO NOT ACCEPT
// slot 10398
    if slot <> 10398 or instruction <> 6868 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6868, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[645] to agcAotUnit645@.

