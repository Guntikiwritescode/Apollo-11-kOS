// TVCINITIALIZE.agc
// bank 17, slots 17511-17519
function agcAotUnit1003 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17514 {
        if slot <= 17512 {
            if slot <= 17511 {
// TVCINITIALIZE.agc:1
//# Copyright:	Public domain.
// TVCINITIALIZE.agc:2
//# Filename:	TVCINITIALIZE.agc
// TVCINITIALIZE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// TVCINITIALIZE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// TVCINITIALIZE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TVCINITIALIZE.agc:6
//# Assembler:	yaYUL
// TVCINITIALIZE.agc:7
//# Contact:	Lawton Kerman <jim.lawton@gmail.com>.
// TVCINITIALIZE.agc:8
//# Website:	www.ibiblio.org/apollo.
// TVCINITIALIZE.agc:9
//# Pages:	936-944
// TVCINITIALIZE.agc:10
//# Mod history:	2009-05-11 JVL	Adapted from the Colossus249/ file
// TVCINITIALIZE.agc:11
//#				of the same name, using Comanche055 page
// TVCINITIALIZE.agc:12
//#				images.
// TVCINITIALIZE.agc:13
//#		2009-05-20 RSB	Corrections:  +80 -> +8D, added 4 missing
// TVCINITIALIZE.agc:14
//#				lines in TVCINIT1, changed the capitalization
// TVCINITIALIZE.agc:15
//#				of a couple of the "Page N" comments,
// TVCINITIALIZE.agc:16
//#				corrected a couple of lines in LOADCOEFF.
// TVCINITIALIZE.agc:17
//#		2009-05-22 RSB	In LOADCOEF, DXCH N10 +14D corrected to
// TVCINITIALIZE.agc:18
//#				TS N10 +14D.  Also, various comment-marks
// TVCINITIALIZE.agc:19
//#				were added to comments following this
// TVCINITIALIZE.agc:20
//#				change.
// TVCINITIALIZE.agc:21
//#
// TVCINITIALIZE.agc:22
//# This source code has been transcribed or otherwise adapted from digitized
// TVCINITIALIZE.agc:23
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// TVCINITIALIZE.agc:24
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// TVCINITIALIZE.agc:25
//# thanks to both.  The images (with suitable reduction in storage size and
// TVCINITIALIZE.agc:26
//# consequent reduction in image quality as well) are available online at
// TVCINITIALIZE.agc:27
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// TVCINITIALIZE.agc:28
//# illegible, contact me at info@sandroid.org about getting access to the
// TVCINITIALIZE.agc:29
//# (much) higher-quality images which Fjeld Kerman actually created.
// TVCINITIALIZE.agc:30
//#
// TVCINITIALIZE.agc:31
//# Notations on the hardcopy document read, in part:
// TVCINITIALIZE.agc:32
//#
// TVCINITIALIZE.agc:33
//#    Assemble revision 055 of AGC program Comanche by NASA
// TVCINITIALIZE.agc:34
//#    2021113-051.  10:28 APR. 1, 1969
// TVCINITIALIZE.agc:35
//#
// TVCINITIALIZE.agc:36
//#    This AGC program shall also be referred to as
// TVCINITIALIZE.agc:37
//#            Colossus 2A
// TVCINITIALIZE.agc:38
//
// TVCINITIALIZE.agc:39
//# Page 937
// TVCINITIALIZE.agc:40
//# NAME		TVCDAPON (TVC DAP INITIALIZATION AND STARTUP CALL)
// TVCINITIALIZE.agc:41
//# LOG SECTION...TVCINITIALIZE			SUBROUTINE...DAPCSM
// TVCINITIALIZE.agc:42
//# MODIFIED BY SCHLUNDT KERMAN				21 OCTOBER 1968
// TVCINITIALIZE.agc:43
//# FUNCTIONAL DESCRIPTION
// TVCINITIALIZE.agc:44
//#	PERFORMS TVCDAP INITIALIZATION (GAINS, TIMING PARAMETERS, FILTER VARIABLES, ETC.)
// TVCINITIALIZE.agc:45
//#	COMPUTES STEERING (S40.8) GAIN KPRIMEDT, AND ZEROES PASTDELV,+1 VARIABLE
// TVCINITIALIZE.agc:46
//#	MAKES INITIALIZATION CALL TO "NEEDLER" FOR TVC DAP NEEDLES-SETUP
// TVCINITIALIZE.agc:47
//#	PERFORMS INITIALIZATION FOR ROLL DAP
// TVCINITIALIZE.agc:48
//#	CALLS TVCEXECUTIVE AT TVCEXEC, VIA WAITLIST
// TVCINITIALIZE.agc:49
//#	CALLS TVCDAP CDU-RATE INITIALIZATION PKG AT DAPINIT  VIA T5
// TVCINITIALIZE.agc:50
//#	PROVIDES FOR LOADING OF LOW-BANDWIDTH COEFFS AND GAINS AT SWICHOVR
// TVCINITIALIZE.agc:51
//# CALLING SEQUENCE - T5LOC=2CADR(TVCDAPON,EBANK=BZERO), T5=.6SECT5
// TVCINITIALIZE.agc:52
//#	IN PARTICULAR, CALLED BY "DOTVCON" IN P40
// TVCINITIALIZE.agc:53
//#	MRCLEAN AND TVCINIT4 ARE POSSIBLE TVC-RESTART ENTRY POINTS
// TVCINITIALIZE.agc:54
//# NORMAL EXIT MODE
// TVCINITIALIZE.agc:55
//#	TCF RESUME
// TVCINITIALIZE.agc:56
//# SUBROUTINES CALLED
// TVCINITIALIZE.agc:57
//#	NEEDLER, MASSPROP
// TVCINITIALIZE.agc:58
//# ALARM OR ABORT EXIT MODES
// TVCINITIALIZE.agc:59
//#	NONE
// TVCINITIALIZE.agc:60
//# ERASABLE INITIALIZATION REQUIRED
// TVCINITIALIZE.agc:61
//#	CSMMASS, LEMMASS, DAPDATR1 (FOR MASSPROP SUBROUTINE)
// TVCINITIALIZE.agc:62
//#	TVC PAD LOADS (SEE EBANK6 IN ERASABLE ASSIGNMENTS)
// TVCINITIALIZE.agc:63
//#	PACTOFF, YACTOFF, CDUX
// TVCINITIALIZE.agc:64
//#	TVCPHASE AND THE T5 BITS OF FLAGWRD6 (SET AT DOTVCON IN P40)
// TVCINITIALIZE.agc:65
//# OUTPUT
// TVCINITIALIZE.agc:66
//#	ALL TVC AND ROLL DAP ERASABLES, FLAGWRD6 (BITS 13,14), T5, WAITLIST
// TVCINITIALIZE.agc:67
//# DEBRIS
// TVCINITIALIZE.agc:68
//#	NONE
// TVCINITIALIZE.agc:69
//
// TVCINITIALIZE.agc:70
//		COUNT*	$$/INIT
// TVCINITIALIZE.agc:71
//		BANK	17
// TVCINITIALIZE.agc:72
//		SETLOC	DAPS7
// TVCINITIALIZE.agc:73
//		BANK
// TVCINITIALIZE.agc:74
//
// TVCINITIALIZE.agc:75
//		EBANK=	BZERO
// TVCINITIALIZE.agc:76
//
// TVCINITIALIZE.agc:77
//TVCDAPON	LXCH	BANKRUPT	# T5 RUPT ARRIVAL (CALL BY DOTVCON - P40)
// slot 17511
                if slot <> 17511 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:78
//		EXTEND			# SAVE Q REQUIRED IN RESTARTS (MRCLEAN AND
// slot 17512
                if slot <> 17512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17513 {
// TVCINITIALIZE.agc:79
//		QXCH	QRUPT		#	TVCINIT4 ARE ENTRIES)
// slot 17513
                if slot <> 17513 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:80
//MRCLEAN		CAF	NZERO		# NUMBER TO ZERO, LESS ONE  (MUST BE ODD)
// slot 17514
                if slot <> 17514 or instruction <> 13660 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1372), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17516 {
            if slot <= 17515 {
// TVCINITIALIZE.agc:81
//					#	TVC RESTARTS ENTER HERE  (NEW BANK)
// TVCINITIALIZE.agc:82
//	+1	CCS	A
// slot 17515
                if slot <> 17515 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:83
//		TS	CNTR
// slot 17516
                if slot <> 17516 or instruction <> 23335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17517 {
// TVCINITIALIZE.agc:84
//		CAF	ZERO
// slot 17517
                if slot <> 17517 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17518 {
// TVCINITIALIZE.agc:85
//		TS	L
// slot 17518
                    if slot <> 17518 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:86
//		INDEX	CNTR
// slot 17519
                    if slot <> 17519 or instruction <> 21287 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1003] to agcAotUnit1003@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:87
//		DXCH	OMEGAYC		# FIRST (LAST) TWO LOCATIONS
// slot 17520
    17520, 44720
)).

// bank 17, slots 17521-17532
function agcAotUnit1004 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17526 {
        if slot <= 17523 {
            if slot <= 17521 {
// TVCINITIALIZE.agc:88
//		CCS	CNTR
// slot 17521
                if slot <> 17521 or instruction <> 4903 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 807).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17522 {
// TVCINITIALIZE.agc:89
//		TCF	MRCLEAN +1
// slot 17522
                    if slot <> 17522 or instruction <> 5227 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5227, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:90
//# Page 938
// TVCINITIALIZE.agc:91
//		EXTEND			# SET UP ANOTHER T5 RUPT TO CONTINUE
// slot 17523
                    if slot <> 17523 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17524 {
// TVCINITIALIZE.agc:92
//		DCA	INITLOC2	#	INITIALIZATION AT TVCINIT1
// slot 17524
                if slot <> 17524 or instruction <> 13673 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1385, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17525 {
// TVCINITIALIZE.agc:93
//		DXCH	T5LOC		# THE PHSCHK2 ENTRY  (REDOTVC) AT TVCDAPON
// slot 17525
                    if slot <> 17525 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:94
//		CAF	POSMAX		#	+3 IS IN ANOTHER BANK. MUST RESET
// slot 17526
                    if slot <> 17526 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17529 {
            if slot <= 17527 {
// TVCINITIALIZE.agc:95
//		TS	TIME5		#	BBCON TOO (FULL 2CADR), FOR THAT
// slot 17527
                if slot <> 17527 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17528 {
// TVCINITIALIZE.agc:96
//ENDMRC		TCF	RESUME		#	ENTRY.
// slot 17528
                    if slot <> 17528 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:97
//
// TVCINITIALIZE.agc:98
//TVCINIT1	LXCH	BANKRUPT
// slot 17529
                    if slot <> 17529 or instruction <> 9230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 14, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17530 {
// TVCINITIALIZE.agc:99
//		EXTEND
// slot 17530
                if slot <> 17530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17531 {
// TVCINITIALIZE.agc:100
//		QXCH	QRUPT
// slot 17531
                    if slot <> 17531 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:101
//
// TVCINITIALIZE.agc:102
//		TC	IBNKCALL	# UPDATE IXX, IAVG/TLX FOR DAP GAINS (R03
// slot 17532
                    if slot <> 17532 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1004] to agcAotUnit1004@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:103
//		CADR	MASSPROP	#	OR NOUNS 46 AND 47 MUST BE CORRECT)
// slot 17533
    17533, 11756
)).

// bank 17, slots 17534-17546
function agcAotUnit1005 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17539 {
        if slot <= 17536 {
            if slot <= 17534 {
// TVCINITIALIZE.agc:104
//
// TVCINITIALIZE.agc:105
//		CAE	EMDOT		# SPS FLOW RATE, SCALED B+3 KG/CS
// slot 17534
                if slot <> 17534 or instruction <> 12360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17535 {
// TVCINITIALIZE.agc:106
//		EXTEND
// slot 17535
                    if slot <> 17535 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:107
//		MP	ONETHOU
// slot 17536
                    if slot <> 17536 or instruction <> 30053 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1381, readEffective:call(words, 1381)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17537 {
// TVCINITIALIZE.agc:108
//		TS	TENMDOT		# 10-SEC MASS LOSS B+16 KG
// slot 17537
                if slot <> 17537 or instruction <> 23455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17538 {
// TVCINITIALIZE.agc:109
//		COM
// slot 17538
                    if slot <> 17538 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:110
//		AD	CSMMASS
// slot 17539
                    if slot <> 17539 or instruction <> 25404 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 828).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17542 {
            if slot <= 17540 {
// TVCINITIALIZE.agc:111
//		TS	MASSTMP		# DECREMENT FOR FIRST 10 SEC OF BURN
// slot 17540
                if slot <> 17540 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17541 {
// TVCINITIALIZE.agc:112
//
// TVCINITIALIZE.agc:113
//		CAE	DAPDATR1	# CHECK LEM-ON/OFF
// slot 17541
                    if slot <> 17541 or instruction <> 13110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:114
//		MASK	BIT14
// slot 17542
                    if slot <> 17542 or instruction <> 31234 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        if fixedOperand = 8192 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17544 {
                if slot <= 17543 {
// TVCINITIALIZE.agc:115
//		CCS	A
// slot 17543
                    if slot <> 17543 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:116
//		CAF	BIT1		# LEM-ON (BIT1)
// slot 17544
                    if slot <> 17544 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17545 {
// TVCINITIALIZE.agc:117
//		TS	CNTR		# LEM-OFF (ZERO)
// slot 17545
                    if slot <> 17545 or instruction <> 23335 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23335, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:118
//
// TVCINITIALIZE.agc:119
//		INDEX	CNTR		# LOAD THE FILTER COEFFICIENTS
// slot 17546
                    if slot <> 17546 or instruction <> 21287 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1005] to agcAotUnit1005@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:120
//		CAF	CSMCFADR
// slot 17547
    17547, 27314
)).

// bank 17, slots 17548-17550
function agcAotUnit1006 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17548 {
// TVCINITIALIZE.agc:121
//		TS	COEFFADR
// slot 17548
        if slot <> 17548 or instruction <> 23506 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23506, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17549 {
// TVCINITIALIZE.agc:122
//		TC	LOADCOEF
// slot 17549
            if slot <> 17549 or instruction <> 1298 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1298, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:123
//
// TVCINITIALIZE.agc:124
//		INDEX	CNTR		# PICK UP LM-OFF,-ON KTLX/I
// slot 17550
            if slot <> 17550 or instruction <> 21287 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21287, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21287, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1006] to agcAotUnit1006@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:125
//		CAE	EKTLX/I		# SCALED AT 1/(8 ASCREV) OF ACTUAL VALUE
// slot 17551
    17551, 26140
)).

// bank 17, slots 17552-17555
function agcAotUnit1007 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17553 {
        if slot <= 17552 {
// TVCINITIALIZE.agc:126
//		TS	KTLX/I
// slot 17552
            if slot <> 17552 or instruction <> 23454 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23454, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:127
//
// TVCINITIALIZE.agc:128
//		TCR	S40.15		# COMPUTE 1/CONACC , VARK
// slot 17553
            if slot <> 17553 or instruction <> 1330 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1330, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17554 {
// TVCINITIALIZE.agc:129
//
// TVCINITIALIZE.agc:130
//TVCINIT2	CS	CNTR		# PICK LM-OFF,-ON VALUE FOR FILTER PERIOD
// slot 17554
            if slot <> 17554 or instruction <> 17191 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 807).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:131
//		INDEX	A		# DETERMINATION:
// slot 17555
            if slot <> 17555 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1007] to agcAotUnit1007@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:132
//		CAF	BIT2		# 	BIT2 FOR CSM ONLY 40MS FILTER
// slot 17556
    17556, 29724
)).

// bank 17, slots 17557-17565
function agcAotUnit1008 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17560 {
        if slot <= 17558 {
            if slot <= 17557 {
// TVCINITIALIZE.agc:133
//		TS	KPRIMEDT	# 	BIT3 FOR CSM/LM 80MS FILTER
// slot 17557
                if slot <> 17557 or instruction <> 23452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23452, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:134
//
// TVCINITIALIZE.agc:135
//		COM			# PREPARE T5TVCDT
// slot 17558
                if slot <> 17558 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17559 {
// TVCINITIALIZE.agc:136
//		AD	POSMAX
// slot 17559
                if slot <> 17559 or instruction <> 27135 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:137
//		AD	BIT1
// slot 17560
                if slot <> 17560 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17562 {
            if slot <= 17561 {
// TVCINITIALIZE.agc:138
//		TS	T5TVCDT
// slot 17561
                if slot <> 17561 or instruction <> 23445 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23445, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:139
//
// TVCINITIALIZE.agc:140
//		CS	BIT15		# RESET SWTOVER FLAG
// slot 17562
                if slot <> 17562 or instruction <> 18945 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17563 {
// TVCINITIALIZE.agc:141
//# Page 939
// TVCINITIALIZE.agc:142
//		MASK	FLAGWRD9
// slot 17563
                if slot <> 17563 or instruction <> 28741 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17564 {
// TVCINITIALIZE.agc:143
//		TS	FLAGWRD9
// slot 17564
                    if slot <> 17564 or instruction <> 22597 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22597, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:144
//
// TVCINITIALIZE.agc:145
//		INDEX	CNTR		# PICK UP LEM-OFF,-ON KPRIME
// slot 17565
                    if slot <> 17565 or instruction <> 21287 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21287, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1008] to agcAotUnit1008@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:146
//		CAE	EKPRIME		#	SCALED (100 PI)/16
// slot 17566
    17566, 26136
)).

// bank 17, slots 17567-17571
function agcAotUnit1009 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17568 {
        if slot <= 17567 {
// TVCINITIALIZE.agc:147
//		EXTEND
// slot 17567
            if slot <> 17567 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:148
//		MP	KPRIMEDT	# (TVCDT/2, SC.AT B+14CS)
// slot 17568
            if slot <> 17568 or instruction <> 29596 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 924, readEffective:call(words, 924)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17569 {
// TVCINITIALIZE.agc:149
//		LXCH	A		#	SC.AT PI/8	(DIMENSIONLESS)
// slot 17569
            if slot <> 17569 or instruction <> 9216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 0, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17570 {
// TVCINITIALIZE.agc:150
//		DXCH	KPRIMEDT
// slot 17570
                if slot <> 17570 or instruction <> 22429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:151
//
// TVCINITIALIZE.agc:152
//		INDEX	CNTR		# PICK UP LEM-OFF,-ON REPFRAC
// slot 17571
                if slot <> 17571 or instruction <> 21287 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21287, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21287, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1009] to agcAotUnit1009@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:153
//		CAE	EREPFRAC
// slot 17572
    17572, 26146
)).

// bank 17, slots 17573-17574
function agcAotUnit1010 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17573 {
// TVCINITIALIZE.agc:154
//		TS	REPFRAC
// slot 17573
        if slot <> 17573 or instruction <> 23458 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23458, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// TVCINITIALIZE.agc:155
//
// TVCINITIALIZE.agc:156
//		INDEX	CNTR		# PICK UP ONE-SHOT CORRECTION TIME
// slot 17574
        if slot <> 17574 or instruction <> 21287 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21287, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21287, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1010] to agcAotUnit1010@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:157
//		CAF	TCORR
// slot 17575
    17575, 27328
)).

// bank 17, slots 17576-17596
function agcAotUnit1011 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17585 {
        if slot <= 17580 {
            if slot <= 17577 {
                if slot <= 17576 {
// TVCINITIALIZE.agc:158
//		TS	CNTR
// slot 17576
                    if slot <> 17576 or instruction <> 23335 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23335, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:159
//
// TVCINITIALIZE.agc:160
//		CAF	NEGONE		# PREVENT STROKE TEST UNTIL CALLED
// slot 17577
                    if slot <> 17577 or instruction <> 16334 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17578 {
// TVCINITIALIZE.agc:161
//		TS	STRKTIME
// slot 17578
                    if slot <> 17578 or instruction <> 23468 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17579 {
// TVCINITIALIZE.agc:162
//
// TVCINITIALIZE.agc:163
//		CAF	NINETEEN	# SET VCNTR FOR VARIABLE-GAIN UPDATES IN
// slot 17579
                        if slot <> 17579 or instruction <> 14588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:164
//		TS	VCNTR		#	10 SECONDS (TVCEXEC 1/2 SEC RATE)
// slot 17580
                        if slot <> 17580 or instruction <> 23459 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23459, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17582 {
                if slot <= 17581 {
// TVCINITIALIZE.agc:165
//		TS	V97VCNTR	# FOR ENGFAIL (R41) LOGIC
// slot 17581
                    if slot <> 17581 or instruction <> 23332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23332, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:166
//
// TVCINITIALIZE.agc:167
//TVCINIT3	CAE	PACTOFF		# TRIM VALUES TO TRIM-TRACKERS, OUTPUT
// slot 17582
                    if slot <> 17582 or instruction <> 13075 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 787).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17583 {
// TVCINITIALIZE.agc:168
//		TS	PDELOFF		#	TRACKERS, OFFSET-UPDATES, AND
// slot 17583
                    if slot <> 17583 or instruction <> 23429 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23429, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17584 {
// TVCINITIALIZE.agc:169
//		TS	PCMD		#	OFFSET-TRACKER FILTERS
// slot 17584
                        if slot <> 17584 or instruction <> 23443 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23443, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:170
//		TS	DELPBAR		#	NOTE, LO-ORDER DELOFF,DELBAR ZEROED
// slot 17585
                        if slot <> 17585 or instruction <> 23425 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23425, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17590 {
            if slot <= 17587 {
                if slot <= 17586 {
// TVCINITIALIZE.agc:171
//
// TVCINITIALIZE.agc:172
//		CAE	YACTOFF
// slot 17586
                    if slot <> 17586 or instruction <> 13076 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 788).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:173
//		TS	YDELOFF
// slot 17587
                    if slot <> 17587 or instruction <> 23431 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23431, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17588 {
// TVCINITIALIZE.agc:174
//		TS	YCMD
// slot 17588
                    if slot <> 17588 or instruction <> 23444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23444, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17589 {
// TVCINITIALIZE.agc:175
//		TS	DELYBAR
// slot 17589
                        if slot <> 17589 or instruction <> 23427 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23427, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:176
//
// TVCINITIALIZE.agc:177
//ATTINIT		CAE	DAPDATR1	# ATTITUDE-ERROR INITIALIZATION LOGIC
// slot 17590
                        if slot <> 17590 or instruction <> 13110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17593 {
                if slot <= 17591 {
// TVCINITIALIZE.agc:178
//		MASK	BIT13		#	TEST FOR CSM OR CSM/LM
// slot 17591
                    if slot <> 17591 or instruction <> 31235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        if fixedOperand = 4096 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17592 {
// TVCINITIALIZE.agc:179
//		EXTEND
// slot 17592
                        if slot <> 17592 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:180
//		BZF	NEEDLEIN	#	BYPASS INITIALIZATION FOR CSM/LM
// slot 17593
                        if slot <> 17593 or instruction <> 5327 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17594 {
// TVCINITIALIZE.agc:181
//
// TVCINITIALIZE.agc:182
//		CAF	BIT1		#	SET UP TEMPORARY COUNTER
// slot 17594
                    if slot <> 17594 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17595 {
// TVCINITIALIZE.agc:183
//	+5	TS	TTMP1
// slot 17595
                        if slot <> 17595 or instruction <> 23433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23433, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:184
//
// TVCINITIALIZE.agc:185
//		INDEX	TTMP1
// slot 17596
                        if slot <> 17596 or instruction <> 21385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21385, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21385, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1011] to agcAotUnit1011@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:186
//		CA	ERRBTMP		# ERRBTMP CONTAINS RCS ATTITUDE ERRORS
// slot 17597
    17597, 26500
)).

// bank 17, slots 17598-17607
function agcAotUnit1012 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17602 {
        if slot <= 17599 {
            if slot <= 17598 {
// TVCINITIALIZE.agc:187
//		EXTEND			#	ERRORY & ERRORZ (P40 AT DOTVCON)
// slot 17598
                if slot <> 17598 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:188
//		MP	1/ATTLIM	# .007325(ERROR) = 0 IF ERROR < 1.5 DEG
// slot 17599
                if slot <> 17599 or instruction <> 30047 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1375, readEffective:call(words, 1375)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17600 {
// TVCINITIALIZE.agc:189
//		EXTEND
// slot 17600
                if slot <> 17600 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17601 {
// TVCINITIALIZE.agc:190
//		BZF	+8D		#	|ERROR| LESS THAN 1.5 DEG
// slot 17601
                    if slot <> 17601 or instruction <> 5321 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5321, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:191
//		EXTEND
// slot 17602
                    if slot <> 17602 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17604 {
            if slot <= 17603 {
// TVCINITIALIZE.agc:192
//# Page 940
// TVCINITIALIZE.agc:193
//		BZMF	+3		#	|ERROR| > 1.5 DEG, AND NEG
// slot 17603
                if slot <> 17603 or instruction <> 25798 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:194
//		CA	ATTLIM		#	|ERROR| > 1.5 DEG, AND POS
// slot 17604
                if slot <> 17604 or instruction <> 13662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1374), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17605 {
// TVCINITIALIZE.agc:195
//		TCF	+2
// slot 17605
                if slot <> 17605 or instruction <> 5319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17606 {
// TVCINITIALIZE.agc:196
//	+3	CS	ATTLIM
// slot 17606
                    if slot <> 17606 or instruction <> 17758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1374), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:197
//	+2	INDEX	TTMP1
// slot 17607
                    if slot <> 17607 or instruction <> 21385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21385, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21385, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1012] to agcAotUnit1012@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:198
//		TS	ERRBTMP
// slot 17608
    17608, 46980
)).

// bank 17, slots 17609-17618
function agcAotUnit1013 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17613 {
        if slot <= 17610 {
            if slot <= 17609 {
// TVCINITIALIZE.agc:199
//	+8	CCS 	TTMP1		#	TEST TEMPORARY COUNTER
// slot 17609
                if slot <> 17609 or instruction <> 5001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 905).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:200
//		TCF	ATTINIT +5	#	BACK TO REPEAT FOR PITCH ERROR
// slot 17610
                if slot <> 17610 or instruction <> 5307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5307, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17611 {
// TVCINITIALIZE.agc:201
//
// TVCINITIALIZE.agc:202
//		CA	ERRBTMP		# ERRORS ESTABLISHED AND LIMITED
// slot 17611
                if slot <> 17611 or instruction <> 13250 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 962).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17612 {
// TVCINITIALIZE.agc:203
//		TS	PERRB
// slot 17612
                    if slot <> 17612 or instruction <> 23421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:204
//		CA	ERRBTMP +1
// slot 17613
                    if slot <> 17613 or instruction <> 13251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 963).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17615 {
            if slot <= 17614 {
// TVCINITIALIZE.agc:205
//		TS	YERRB
// slot 17614
                if slot <> 17614 or instruction <> 23423 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23423, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:206
//
// TVCINITIALIZE.agc:207
//NEEDLEIN	CS	RCSFLAGS	# SET BIT 3 FOR INITIALIZATION PASS AND GO
// slot 17615
                if slot <> 17615 or instruction <> 17217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 833).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17616 {
// TVCINITIALIZE.agc:208
//		MASK	BIT3		# 	TO NEEDLER.  WILL CLEAR FOR TVC DAP
// slot 17616
                if slot <> 17616 or instruction <> 31245 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    if fixedOperand = 4 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17617 {
// TVCINITIALIZE.agc:209
//		ADS	RCSFLAGS	# 	(RETURNS AFTER CADR)
// slot 17617
                    if slot <> 17617 or instruction <> 12097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 833).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:210
//		TC	IBNKCALL
// slot 17618
                    if slot <> 17618 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1013] to agcAotUnit1013@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:211
//		CADR	NEEDLER
// slot 17619
    17619, 35360
)).

// bank 17, slots 17620-17632
function agcAotUnit1014 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17625 {
        if slot <= 17622 {
            if slot <= 17620 {
// TVCINITIALIZE.agc:212
//
// TVCINITIALIZE.agc:213
//TVCINIT4	CAF	ZERO		# SET TVCPHASE TO INDICATE TVCDAPON-THRU-
// slot 17620
                if slot <> 17620 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17621 {
// TVCINITIALIZE.agc:214
//		TS	TVCPHASE	#	NEEDLEIN INITIALIZATION FINISHED.
// slot 17621
                    if slot <> 17621 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:215
//					#	(POSSIBLE TVC-RESTART ENTRY)
// TVCINITIALIZE.agc:216
//
// TVCINITIALIZE.agc:217
//		CAE	CDUX		# PREPARE ROLL DAP
// slot 17622
                    if slot <> 17622 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17623 {
// TVCINITIALIZE.agc:218
//		TS	OGANOW
// slot 17623
                if slot <> 17623 or instruction <> 23474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23474, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17624 {
// TVCINITIALIZE.agc:219
//
// TVCINITIALIZE.agc:220
//		CAF	BIT13		# IF ENGINE IS ALREADY OFF, ENGINOFF HAS
// slot 17624
                    if slot <> 17624 or instruction <> 14851 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:221
//		EXTEND			#	ALREADY ESTABLISHED THE POST-BURN
// slot 17625
                    if slot <> 17625 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17628 {
            if slot <= 17626 {
// TVCINITIALIZE.agc:222
//		RAND	DSALMOUT	#	CSMMASS (MASSBACK DOES IT). DONT
// slot 17626
                if slot <> 17626 or instruction <> 1033 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17627 {
// TVCINITIALIZE.agc:223
//		EXTEND			# 	TOUCH CSMMASS.  IF ENGINE IS ON,
// slot 17627
                    if slot <> 17627 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:224
//		BZF	+3		#	THEN ITS OK TO DO THE COPYCYCLE
// slot 17628
                    if slot <> 17628 or instruction <> 5343 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5343, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17630 {
                if slot <= 17629 {
// TVCINITIALIZE.agc:225
//					#	EVEN BURNS LESS THAN 0.4 SEC ARE AOK
// TVCINITIALIZE.agc:226
//
// TVCINITIALIZE.agc:227
//		CAE	MASSTMP		# COPYCYCLE
// slot 17629
                    if slot <> 17629 or instruction <> 13226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 938).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:228
//		TS	CSMMASS
// slot 17630
                    if slot <> 17630 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17631 {
// TVCINITIALIZE.agc:229
//
// TVCINITIALIZE.agc:230
//	+3	CAF	.5SEC		# CALL TVCEXECUTIVE (ROLLDAP CALL, ETC)
// slot 17631
                    if slot <> 17631 or instruction <> 14878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:231
//		TC	WAITLIST
// slot 17632
                    if slot <> 17632 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1014] to agcAotUnit1014@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:232
//		EBANK=	BZERO
// TVCINITIALIZE.agc:233
//		2CADR	TVCEXEC
// slot 17633 17634
    17633, 2976, 17634, 28780
)).

// bank 17, slots 17635-17642
function agcAotUnit1015 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17638 {
        if slot <= 17636 {
            if slot <= 17635 {
// TVCINITIALIZE.agc:234
//
// TVCINITIALIZE.agc:235
//		EXTEND			# CALL FOR DAPINIT
// slot 17635
                if slot <> 17635 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:236
//		DCA	DAPINIT5
// slot 17636
                if slot <> 17636 or instruction <> 13671 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1383, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17637 {
// TVCINITIALIZE.agc:237
//		DXCH	T5LOC
// slot 17637
                if slot <> 17637 or instruction <> 22219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:238
//		CAE	T5TVCDT		# (ALLOW TIME FOR RESTART COMPUTATIONS)
// slot 17638
                if slot <> 17638 or instruction <> 13205 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 917).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17640 {
            if slot <= 17639 {
// TVCINITIALIZE.agc:239
//		TS	TIME5
// slot 17639
                if slot <> 17639 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:240
//# Page 941
// TVCINITIALIZE.agc:241
//ENDTVCIN	TCF	RESUME
// slot 17640
                if slot <> 17640 or instruction <> 6875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17641 {
// TVCINITIALIZE.agc:242
//
// TVCINITIALIZE.agc:243
//PRESWTCH	TCR	SWICHOVR	# ENTRY FROM V46
// slot 17641
                if slot <> 17641 or instruction <> 1260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1260, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:244
//
// TVCINITIALIZE.agc:245
//		TC	POSTJUMP	# THIS PROVIDES AN EXIT FROM SWITCH-OVER
// slot 17642
                if slot <> 17642 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1015] to agcAotUnit1015@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:246
//		CADR	PINBRNCH	#	(PINBRNCH DOES A RELINT)
// slot 17643
    17643, 17780
)).

// bank 17, slots 17644-17652
function agcAotUnit1016 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17647 {
        if slot <= 17645 {
            if slot <= 17644 {
// TVCINITIALIZE.agc:247
//
// TVCINITIALIZE.agc:248
//SWICHOVR	INHINT
// slot 17644
                if slot <> 17644 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:249
//		CA	TVCPHASE	# SAVE TVCPHASE
// slot 17645
                if slot <> 17645 or instruction <> 13220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 932).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17646 {
// TVCINITIALIZE.agc:250
//		TS	PHASETMP
// slot 17646
                if slot <> 17646 or instruction <> 23433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:251
//		CS	BIT2		# SET TVCPHASE = -2 (INDICATES SWITCH-OVER
// slot 17647
                if slot <> 17647 or instruction <> 18958 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17649 {
            if slot <= 17648 {
// TVCINITIALIZE.agc:252
//		TS	TVCPHASE	#	TO RESTART LOGIC)
// slot 17648
                if slot <> 17648 or instruction <> 23460 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23460, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCINITIALIZE.agc:253
//
// TVCINITIALIZE.agc:254
//	+5	EXTEND			# SAVE Q FOR RETURN (RESTART ENTRY POINT,
// slot 17649
                if slot <> 17649 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17650 {
// TVCINITIALIZE.agc:255
//		QXCH	RTRNLOC		#	TVCPHASE AND PHASETMP ALREADY SET)
// slot 17650
                if slot <> 17650 or instruction <> 10123 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 907, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17651 {
// TVCINITIALIZE.agc:256
//
// TVCINITIALIZE.agc:257
//		CAF	NZEROJR		# ZEROING LOOP FOR FILTER STORAGE LOCS
// slot 17651
                    if slot <> 17651 or instruction <> 13661 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1373), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:258
//	+8	TS	CNTRTMP
// slot 17652
                    if slot <> 17652 or instruction <> 23486 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23486, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1016] to agcAotUnit1016@.

// bank 17, slots 17653-17655
function agcAotUnit1017 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17653 {
// TVCINITIALIZE.agc:259
//
// TVCINITIALIZE.agc:260
//MCLEANJR	CA	ZERO
// slot 17653
        if slot <> 17653 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17654 {
// TVCINITIALIZE.agc:261
//		TS	L
// slot 17654
            if slot <> 17654 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:262
//		INDEX	CNTRTMP
// slot 17655
            if slot <> 17655 or instruction <> 21438 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21438, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21438, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1017] to agcAotUnit1017@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:263
//		DXCH	PTMP1 -1
// slot 17656
    17656, 44738
)).

// bank 17, slots 17657-17683
function agcAotUnit1018 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17669 {
        if slot <= 17662 {
            if slot <= 17659 {
                if slot <= 17657 {
// TVCINITIALIZE.agc:264
//		CCS	CNTRTMP
// slot 17657
                    if slot <> 17657 or instruction <> 5054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 958).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17658 {
// TVCINITIALIZE.agc:265
//		CCS	A
// slot 17658
                        if slot <> 17658 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:266
//		TCF	SWICHOVR +8D
// slot 17659
                        if slot <> 17659 or instruction <> 5364 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5364, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17660 {
// TVCINITIALIZE.agc:267
//
// TVCINITIALIZE.agc:268
//		CS	FLAGWRD9	# SET SWITCHOVER FLAG FOR DOWNLINK
// slot 17660
                    if slot <> 17660 or instruction <> 16453 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 69).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17661 {
// TVCINITIALIZE.agc:269
//		MASK	BIT15
// slot 17661
                        if slot <> 17661 or instruction <> 31233 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            if fixedOperand = 16384 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:270
//		ADS	FLAGWRD9
// slot 17662
                        if slot <> 17662 or instruction <> 11333 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 69).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17665 {
                if slot <= 17663 {
// TVCINITIALIZE.agc:271
//
// TVCINITIALIZE.agc:272
//		CAE	EKTLX/I +2	# LOW BANDWIDTH GAINS 	- DAP
// slot 17663
                    if slot <> 17663 or instruction <> 13072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 784).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17664 {
// TVCINITIALIZE.agc:273
//		TS	KTLX/I
// slot 17664
                        if slot <> 17664 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:274
//		TCR	S40.15 	+7
// slot 17665
                        if slot <> 17665 or instruction <> 1337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17667 {
                    if slot <= 17666 {
// TVCINITIALIZE.agc:275
//
// TVCINITIALIZE.agc:276
//		CAF	FKPRIMDT	#			- STEERING
// slot 17666
                        if slot <> 17666 or instruction <> 13666 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1378), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:277
//		TS	KPRIMEDT
// slot 17667
                        if slot <> 17667 or instruction <> 23452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17668 {
// TVCINITIALIZE.agc:278
//
// TVCINITIALIZE.agc:279
//		CAF	FREPFRAC	#			- TMC LOOP
// slot 17668
                        if slot <> 17668 or instruction <> 13667 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1379), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:280
//		TS	REPFRAC
// slot 17669
                        if slot <> 17669 or instruction <> 23458 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23458, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17676 {
            if slot <= 17672 {
                if slot <= 17670 {
// TVCINITIALIZE.agc:281
//
// TVCINITIALIZE.agc:282
//		EXTEND			# UPDATE TRIM ESTIMATES
// slot 17670
                    if slot <> 17670 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17671 {
// TVCINITIALIZE.agc:283
//		DCA	DELPBAR
// slot 17671
                        if slot <> 17671 or instruction <> 13186 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 898, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:284
//		DXCH	PDELOFF
// slot 17672
                        if slot <> 17672 or instruction <> 22406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 902, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17674 {
                    if slot <= 17673 {
// TVCINITIALIZE.agc:285
//		EXTEND
// slot 17673
                        if slot <> 17673 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:286
//		DCA	DELYBAR
// slot 17674
                        if slot <> 17674 or instruction <> 13188 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 900, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17675 {
// TVCINITIALIZE.agc:287
//		DXCH	YDELOFF
// slot 17675
                        if slot <> 17675 or instruction <> 22408 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 904, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:288
//
// TVCINITIALIZE.agc:289
//		CA	LBCFADR
// slot 17676
                        if slot <> 17676 or instruction <> 13659 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1371), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17679 {
                if slot <= 17677 {
// TVCINITIALIZE.agc:290
//# Page 942
// TVCINITIALIZE.agc:291
//		TS	COEFFADR
// slot 17677
                    if slot <> 17677 or instruction <> 23506 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23506, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17678 {
// TVCINITIALIZE.agc:292
//		TC	LOADCOEF
// slot 17678
                        if slot <> 17678 or instruction <> 1298 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1298, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:293
//
// TVCINITIALIZE.agc:294
//		CAE	PHASETMP	# RESTORE TVCPHASE
// slot 17679
                        if slot <> 17679 or instruction <> 13193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 905).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17681 {
                    if slot <= 17680 {
// TVCINITIALIZE.agc:295
//		TS	TVCPHASE
// slot 17680
                        if slot <> 17680 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:296
//
// TVCINITIALIZE.agc:297
//		TC	RTRNLOC		# BACK TO PRESWTCH OR TVCRESTARTS
// slot 17681
                        if slot <> 17681 or instruction <> 907 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 907, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17682 {
// TVCINITIALIZE.agc:298
//
// TVCINITIALIZE.agc:299
//LOADCOEF	EXTEND			# LOAD DAP FILTER COEFFICIENTS
// slot 17682
                        if slot <> 17682 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCINITIALIZE.agc:300
//		INDEX	COEFFADR	#   FROM: ERASABLE FOR CSM/LM HB
// slot 17683
                        if slot <> 17683 or instruction <> 21458 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21458, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21458, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1018] to agcAotUnit1018@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:301
//		DCA	0		#         FIXED    FOR CSM/LM LB
// slot 17684
    17684, 24578
)).

// bank 17, slots 17685-17687
function agcAotUnit1019 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17685 {
// TVCINITIALIZE.agc:302
//		DXCH	N10		#         FIXED    FOR CSM
// slot 17685
        if slot <> 17685 or instruction <> 22484 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 980, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17686 {
// TVCINITIALIZE.agc:303
//
// TVCINITIALIZE.agc:304
//		EXTEND			# NOTE: FOR CSM/LM, NORMAL COEFFICIENT
// slot 17686
            if slot <> 17686 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:305
//		INDEX	COEFFADR	# LOAD WILL BE HIGH BANDWIDTH PAD LOAD
// slot 17687
            if slot <> 17687 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1019] to agcAotUnit1019@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:306
//		DCA	2		# ERASABLES. DURING CSM/LM SWITCHOVER,
// slot 17688
    17688, 24582
)).

// bank 17, slots 17689-17691
function agcAotUnit1020 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17689 {
// TVCINITIALIZE.agc:307
//		DXCH	N10 +2		# THIS LOGIC IS USED TO LOAD LOW BANDWIDTH
// slot 17689
        if slot <> 17689 or instruction <> 22486 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 982, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17690 {
// TVCINITIALIZE.agc:308
//					# COEFFICIENTS FROM FIXED MEMORY.
// TVCINITIALIZE.agc:309
//
// TVCINITIALIZE.agc:310
//		EXTEND
// slot 17690
            if slot <> 17690 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:311
//		INDEX	COEFFADR
// slot 17691
            if slot <> 17691 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1020] to agcAotUnit1020@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:312
//		DCA	4
// slot 17692
    17692, 24586
)).

// bank 17, slots 17693-17695
function agcAotUnit1021 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17693 {
// TVCINITIALIZE.agc:313
//		DXCH	N10 +4
// slot 17693
        if slot <> 17693 or instruction <> 22488 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 984, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17694 {
// TVCINITIALIZE.agc:314
//
// TVCINITIALIZE.agc:315
//		EXTEND
// slot 17694
            if slot <> 17694 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:316
//		INDEX	COEFFADR
// slot 17695
            if slot <> 17695 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1021] to agcAotUnit1021@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:317
//		DCA	6
// slot 17696
    17696, 24590
)).

// bank 17, slots 17697-17699
function agcAotUnit1022 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17697 {
// TVCINITIALIZE.agc:318
//		DXCH	N10 +6
// slot 17697
        if slot <> 17697 or instruction <> 22490 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 986, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17698 {
// TVCINITIALIZE.agc:319
//
// TVCINITIALIZE.agc:320
//		EXTEND
// slot 17698
            if slot <> 17698 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:321
//		INDEX	COEFFADR
// slot 17699
            if slot <> 17699 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1022] to agcAotUnit1022@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:322
//		DCA	8D
// slot 17700
    17700, 24594
)).

// bank 17, slots 17701-17703
function agcAotUnit1023 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17701 {
// TVCINITIALIZE.agc:323
//		DXCH	N10 +8D
// slot 17701
        if slot <> 17701 or instruction <> 22492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 988, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17702 {
// TVCINITIALIZE.agc:324
//
// TVCINITIALIZE.agc:325
//		EXTEND
// slot 17702
            if slot <> 17702 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:326
//		INDEX	COEFFADR
// slot 17703
            if slot <> 17703 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1023] to agcAotUnit1023@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:327
//		DCA	10D
// slot 17704
    17704, 24598
)).

// bank 17, slots 17705-17707
function agcAotUnit1024 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17705 {
// TVCINITIALIZE.agc:328
//		DXCH	N10 +10D
// slot 17705
        if slot <> 17705 or instruction <> 22494 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 990, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17706 {
// TVCINITIALIZE.agc:329
//
// TVCINITIALIZE.agc:330
//		EXTEND
// slot 17706
            if slot <> 17706 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCINITIALIZE.agc:331
//		INDEX	COEFFADR
// slot 17707
            if slot <> 17707 or instruction <> 21458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1024] to agcAotUnit1024@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:332
//		DCA	12D
// slot 17708
    17708, 24602
)).

// bank 17, slots 17709-17710
function agcAotUnit1025 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17709 {
// TVCINITIALIZE.agc:333
//		DXCH	N10 +12D
// slot 17709
        if slot <> 17709 or instruction <> 22496 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 992, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// TVCINITIALIZE.agc:334
//
// TVCINITIALIZE.agc:335
//		INDEX	COEFFADR
// slot 17710
        if slot <> 17710 or instruction <> 21458 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21458, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21458, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1025] to agcAotUnit1025@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:336
//		CA	14D
// slot 17711
    17711, 24604
)).

// bank 17, slots 17712-17727
function agcAotUnit1026 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17719 {
        if slot <= 17715 {
            if slot <= 17713 {
                if slot <= 17712 {
// TVCINITIALIZE.agc:337
//		TS	N10 +14D
// slot 17712
                    if slot <> 17712 or instruction <> 23521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:338
//
// TVCINITIALIZE.agc:339
//		TC	Q
// slot 17713
                    if slot <> 17713 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17714 {
// TVCINITIALIZE.agc:340
//# Page 943
// TVCINITIALIZE.agc:341
//S40.15		CAE	IXX		# GAIN COMPUTATIONS (1/CONACC, VARK)
// slot 17714
                    if slot <> 17714 or instruction <> 13112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 824).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:342
//		EXTEND			# ENTERED FROM TVCINITIALIZE AND TVCEXEC
// slot 17715
                    if slot <> 17715 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17717 {
                if slot <= 17716 {
// TVCINITIALIZE.agc:343
//		MP	2PI/M		#	2PI/M SCALED 1/(B+8 N M)
// slot 17716
                    if slot <> 17716 or instruction <> 30052 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1380, readEffective:call(words, 1380)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:344
//		DDOUBL			#	IXX   SCALED B+20 KG-MSQ
// slot 17717
                    if slot <> 17717 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17718 {
// TVCINITIALIZE.agc:345
//		DDOUBL
// slot 17718
                    if slot <> 17718 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:346
//		DDOUBL
// slot 17719
                    if slot <> 17719 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17723 {
            if slot <= 17721 {
                if slot <= 17720 {
// TVCINITIALIZE.agc:347
//		TS	1/CONACC	#	     SCALED B+9 SEC-SQ/REV
// slot 17720
                    if slot <> 17720 or instruction <> 23456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23456, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:348
//
// TVCINITIALIZE.agc:349
//	+7	CAE	KTLX/I		# ENTRY FROM CSM/LM V46 SWITCH-OVER
// slot 17721
                    if slot <> 17721 or instruction <> 13214 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 926).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17722 {
// TVCINITIALIZE.agc:350
//		EXTEND			#            SCALED (B+3 ASCREV)  1/SECSQ
// slot 17722
                    if slot <> 17722 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:351
//		MP	IAVG/TLX	#            SCALED B+2 SECSQ
// slot 17723
                    if slot <> 17723 or instruction <> 29498 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 826, readEffective:call(words, 826)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17725 {
                if slot <= 17724 {
// TVCINITIALIZE.agc:352
//		DDOUBL
// slot 17724
                    if slot <> 17724 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:353
//		DDOUBL
// slot 17725
                    if slot <> 17725 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17726 {
// TVCINITIALIZE.agc:354
//		TS	VARK		#            SCALED (B+3 ASCREV)
// slot 17726
                    if slot <> 17726 or instruction <> 23457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23457, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCINITIALIZE.agc:355
//		TC	Q
// slot 17727
                    if slot <> 17727 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1026] to agcAotUnit1026@.

agcAotInstallSourceRope(list(
// TVCINITIALIZE.agc:356
//
// TVCINITIALIZE.agc:357
//CSMN10		DEC	.99999		# N10	CSM ONLY FILTER COEFFICIENTS
// slot 17728
    17728, 32766,
// TVCINITIALIZE.agc:358
//		DEC	-.2549		# N11/2
// slot 17729
    17729, 57182,
// TVCINITIALIZE.agc:359
//		DEC	.0588		# N12
// slot 17730
    17730, 1926,
// TVCINITIALIZE.agc:360
//		DEC	-.7620		# D11/2
// slot 17731
    17731, 40564,
// TVCINITIALIZE.agc:361
//		DEC	.7450		# D12
// slot 17732
    17732, 24412,
// TVCINITIALIZE.agc:362
//
// TVCINITIALIZE.agc:363
//		DEC	.99999		# N20
// slot 17733
    17733, 32766,
// TVCINITIALIZE.agc:364
//		DEC	-.4852		# N21/2
// slot 17734
    17734, 49634,
// TVCINITIALIZE.agc:365
//		DEC	0		# N22
// slot 17735
    17735, 0,
// TVCINITIALIZE.agc:366
//		DEC	-.2692		# D22/2
// slot 17736
    17736, 56712,
// TVCINITIALIZE.agc:367
//		DEC	0		# D22
// slot 17737
    17737, 0,
// TVCINITIALIZE.agc:368
//
// TVCINITIALIZE.agc:369
//LBN10		DEC	+.99999		# N10	LOW BANDWIDTH FILTER COEFFICIENTS
// slot 17738
    17738, 32766,
// TVCINITIALIZE.agc:370
//		DEC	-.3285		# N11/2
// slot 17739
    17739, 54770,
// TVCINITIALIZE.agc:371
//		DEC	-.3301		# N12
// slot 17740
    17740, 54718,
// TVCINITIALIZE.agc:372
//		DEC	-.9101		# D11/2
// slot 17741
    17741, 35712,
// TVCINITIALIZE.agc:373
//		DEC	+.8460		# D12
// slot 17742
    17742, 27722,
// TVCINITIALIZE.agc:374
//
// TVCINITIALIZE.agc:375
//		DEC	+.03125		# N20
// slot 17743
    17743, 1024,
// TVCINITIALIZE.agc:376
//		DEC	0		# N21/2
// slot 17744
    17744, 0,
// TVCINITIALIZE.agc:377
//		DEC	0		# N22
// slot 17745
    17745, 0,
// TVCINITIALIZE.agc:378
//		DEC	-.9101		# D21/2
// slot 17746
    17746, 35712,
// TVCINITIALIZE.agc:379
//		DEC	+.8460		# D22
// slot 17747
    17747, 27722,
// TVCINITIALIZE.agc:380
//
// TVCINITIALIZE.agc:381
//		DEC	+.5000		# N30
// slot 17748
    17748, 16384,
// TVCINITIALIZE.agc:382
//		DEC	-.47115		# N31/2
// slot 17749
    17749, 50096,
// TVCINITIALIZE.agc:383
//		DEC	+.4749		# N32
// slot 17750
    17750, 15562,
// TVCINITIALIZE.agc:384
//		DEC	-.9558		# D31/2
// slot 17751
    17751, 34214,
// TVCINITIALIZE.agc:385
//		DEC	+.9372		# D32
// slot 17752
    17752, 30710,
// TVCINITIALIZE.agc:386
//
// TVCINITIALIZE.agc:387
//CSMCFADR	GENADR	CSMN10		# CSM ONLY COEFFICIENTS ADDRESS
// slot 17753
    17753, 2688,
// TVCINITIALIZE.agc:388
//HBCFADR		GENADR	HBN10		# HIGH BANDWIDTH COEFFICIENTS ADDRESS
// slot 17754
    17754, 1578,
// TVCINITIALIZE.agc:389
//# Page 944
// TVCINITIALIZE.agc:390
//LBCFADR		GENADR	LBN10		# LOW BANDWIDTH COEFFICIENTS ADDRESS
// slot 17755
    17755, 2708,
// TVCINITIALIZE.agc:391
//
// TVCINITIALIZE.agc:392
//NZERO		DEC	51		# MUST BE ODD FOR MRCLEAN
// slot 17756
    17756, 102,
// TVCINITIALIZE.agc:393
//NZEROJR		DEC	23		# MUST BE ODD FOR MCLEANJR
// slot 17757
    17757, 46,
// TVCINITIALIZE.agc:394
//
// TVCINITIALIZE.agc:395
//ATTLIM		DEC	0.00833		# INITIAL ATTITUDE ERROR LIMIT (1.5 DEG)
// slot 17758
    17758, 272,
// TVCINITIALIZE.agc:396
//1/ATTLIM	DEC	0.007325	# .007325(ERROR) = 0 IF ERROR < 1.5 DEG
// slot 17759
    17759, 240,
// TVCINITIALIZE.agc:397
//
// TVCINITIALIZE.agc:398
//TCORR		OCT	00005		# CSM
// slot 17760
    17760, 10,
// TVCINITIALIZE.agc:399
//	+1	OCT	00000		# CSM/LM (HB,LB)
// slot 17761
    17761, 0,
// TVCINITIALIZE.agc:400
//
// TVCINITIALIZE.agc:401
//FKPRIMDT	DEC	.0102		# CSM/LM (LB), (.05 X .08) SCALED AT PI/8
// slot 17762
    17762, 334,
// TVCINITIALIZE.agc:402
//FREPFRAC	DEC	.0375 B-2	# CSM/LM (LB), 0.0375 SCALED AT B+2
// slot 17763
    17763, 308,
// TVCINITIALIZE.agc:403
//
// TVCINITIALIZE.agc:404
//NINETEEN	=	VD1
// TVCINITIALIZE.agc:405
//2PI/M		DEC	.00331017 B+8	# 2PI/M, SCALED AT 1/(B+8 N-M)
// slot 17764
    17764, 27768,
// TVCINITIALIZE.agc:406
//
// TVCINITIALIZE.agc:407
//ONETHOU		DEC	1000 B-13	# KG/CS B3 TO KG/10SEC B16 CONVERSION
// slot 17765
    17765, 4000,
// TVCINITIALIZE.agc:408
//
// TVCINITIALIZE.agc:409
//		EBANK=	BZERO
// TVCINITIALIZE.agc:410
//DAPINIT5	2CADR	DAPINIT
// slot 17766 17767
    17766, 3214, 17767, 32876,
// TVCINITIALIZE.agc:411
//
// TVCINITIALIZE.agc:412
//		EBANK=	BZERO
// TVCINITIALIZE.agc:413
//INITLOC2	2CADR	TVCINIT1
// slot 17768 17769
    17768, 2290, 17769, 30828
)).

// no code for the lines below
// TVCINITIALIZE.agc:414
//
