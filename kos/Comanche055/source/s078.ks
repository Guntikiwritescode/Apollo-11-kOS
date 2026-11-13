// PORT: Original source unit TVCINITIALIZE.agc.
// PORT: Physical bank 17. Shared continuation entries, slots 17511–17519.
function agcAotUnit1003 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17514 {
        if slot <= 17512 {
            if slot <= 17511 {
// PORT: SOURCE TVCINITIALIZE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCINITIALIZE.agc:2
//# Filename:	TVCINITIALIZE.agc
// PORT: SOURCE TVCINITIALIZE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCINITIALIZE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCINITIALIZE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCINITIALIZE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCINITIALIZE.agc:7
//# Contact:	Jim Lawton <jim.lawton@gmail.com>.
// PORT: SOURCE TVCINITIALIZE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCINITIALIZE.agc:9
//# Pages:	936-944
// PORT: SOURCE TVCINITIALIZE.agc:10
//# Mod history:	2009-05-11 JVL	Adapted from the Colossus249/ file
// PORT: SOURCE TVCINITIALIZE.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE TVCINITIALIZE.agc:12
//#				images.
// PORT: SOURCE TVCINITIALIZE.agc:13
//#		2009-05-20 RSB	Corrections:  +80 -> +8D, added 4 missing
// PORT: SOURCE TVCINITIALIZE.agc:14
//#				lines in TVCINIT1, changed the capitalization
// PORT: SOURCE TVCINITIALIZE.agc:15
//#				of a couple of the "Page N" comments,
// PORT: SOURCE TVCINITIALIZE.agc:16
//#				corrected a couple of lines in LOADCOEFF.
// PORT: SOURCE TVCINITIALIZE.agc:17
//#		2009-05-22 RSB	In LOADCOEF, DXCH N10 +14D corrected to
// PORT: SOURCE TVCINITIALIZE.agc:18
//#				TS N10 +14D.  Also, various comment-marks
// PORT: SOURCE TVCINITIALIZE.agc:19
//#				were added to comments following this
// PORT: SOURCE TVCINITIALIZE.agc:20
//#				change.
// PORT: SOURCE TVCINITIALIZE.agc:21
//#
// PORT: SOURCE TVCINITIALIZE.agc:22
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCINITIALIZE.agc:23
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCINITIALIZE.agc:24
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCINITIALIZE.agc:25
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCINITIALIZE.agc:26
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCINITIALIZE.agc:27
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCINITIALIZE.agc:28
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCINITIALIZE.agc:29
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCINITIALIZE.agc:30
//#
// PORT: SOURCE TVCINITIALIZE.agc:31
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCINITIALIZE.agc:32
//#
// PORT: SOURCE TVCINITIALIZE.agc:33
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCINITIALIZE.agc:34
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCINITIALIZE.agc:35
//#
// PORT: SOURCE TVCINITIALIZE.agc:36
//#    This AGC program shall also be referred to as
// PORT: SOURCE TVCINITIALIZE.agc:37
//#            Colossus 2A
// PORT: SOURCE TVCINITIALIZE.agc:38
//
// PORT: SOURCE TVCINITIALIZE.agc:39
//# Page 937
// PORT: SOURCE TVCINITIALIZE.agc:40
//# NAME		TVCDAPON (TVC DAP INITIALIZATION AND STARTUP CALL)
// PORT: SOURCE TVCINITIALIZE.agc:41
//# LOG SECTION...TVCINITIALIZE			SUBROUTINE...DAPCSM
// PORT: SOURCE TVCINITIALIZE.agc:42
//# MODIFIED BY SCHLUNDT				21 OCTOBER 1968
// PORT: SOURCE TVCINITIALIZE.agc:43
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE TVCINITIALIZE.agc:44
//#	PERFORMS TVCDAP INITIALIZATION (GAINS, TIMING PARAMETERS, FILTER VARIABLES, ETC.)
// PORT: SOURCE TVCINITIALIZE.agc:45
//#	COMPUTES STEERING (S40.8) GAIN KPRIMEDT, AND ZEROES PASTDELV,+1 VARIABLE
// PORT: SOURCE TVCINITIALIZE.agc:46
//#	MAKES INITIALIZATION CALL TO "NEEDLER" FOR TVC DAP NEEDLES-SETUP
// PORT: SOURCE TVCINITIALIZE.agc:47
//#	PERFORMS INITIALIZATION FOR ROLL DAP
// PORT: SOURCE TVCINITIALIZE.agc:48
//#	CALLS TVCEXECUTIVE AT TVCEXEC, VIA WAITLIST
// PORT: SOURCE TVCINITIALIZE.agc:49
//#	CALLS TVCDAP CDU-RATE INITIALIZATION PKG AT DAPINIT  VIA T5
// PORT: SOURCE TVCINITIALIZE.agc:50
//#	PROVIDES FOR LOADING OF LOW-BANDWIDTH COEFFS AND GAINS AT SWICHOVR
// PORT: SOURCE TVCINITIALIZE.agc:51
//# CALLING SEQUENCE - T5LOC=2CADR(TVCDAPON,EBANK=BZERO), T5=.6SECT5
// PORT: SOURCE TVCINITIALIZE.agc:52
//#	IN PARTICULAR, CALLED BY "DOTVCON" IN P40
// PORT: SOURCE TVCINITIALIZE.agc:53
//#	MRCLEAN AND TVCINIT4 ARE POSSIBLE TVC-RESTART ENTRY POINTS
// PORT: SOURCE TVCINITIALIZE.agc:54
//# NORMAL EXIT MODE
// PORT: SOURCE TVCINITIALIZE.agc:55
//#	TCF RESUME
// PORT: SOURCE TVCINITIALIZE.agc:56
//# SUBROUTINES CALLED
// PORT: SOURCE TVCINITIALIZE.agc:57
//#	NEEDLER, MASSPROP
// PORT: SOURCE TVCINITIALIZE.agc:58
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE TVCINITIALIZE.agc:59
//#	NONE
// PORT: SOURCE TVCINITIALIZE.agc:60
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE TVCINITIALIZE.agc:61
//#	CSMMASS, LEMMASS, DAPDATR1 (FOR MASSPROP SUBROUTINE)
// PORT: SOURCE TVCINITIALIZE.agc:62
//#	TVC PAD LOADS (SEE EBANK6 IN ERASABLE ASSIGNMENTS)
// PORT: SOURCE TVCINITIALIZE.agc:63
//#	PACTOFF, YACTOFF, CDUX
// PORT: SOURCE TVCINITIALIZE.agc:64
//#	TVCPHASE AND THE T5 BITS OF FLAGWRD6 (SET AT DOTVCON IN P40)
// PORT: SOURCE TVCINITIALIZE.agc:65
//# OUTPUT
// PORT: SOURCE TVCINITIALIZE.agc:66
//#	ALL TVC AND ROLL DAP ERASABLES, FLAGWRD6 (BITS 13,14), T5, WAITLIST
// PORT: SOURCE TVCINITIALIZE.agc:67
//# DEBRIS
// PORT: SOURCE TVCINITIALIZE.agc:68
//#	NONE
// PORT: SOURCE TVCINITIALIZE.agc:69
//
// PORT: SOURCE TVCINITIALIZE.agc:70
//		COUNT*	$$/INIT
// PORT: SOURCE TVCINITIALIZE.agc:71
//		BANK	17
// PORT: SOURCE TVCINITIALIZE.agc:72
//		SETLOC	DAPS7
// PORT: SOURCE TVCINITIALIZE.agc:73
//		BANK
// PORT: SOURCE TVCINITIALIZE.agc:74
//
// PORT: SOURCE TVCINITIALIZE.agc:75
//		EBANK=	BZERO
// PORT: SOURCE TVCINITIALIZE.agc:76
//
// PORT: SOURCE TVCINITIALIZE.agc:77
//TVCDAPON	LXCH	BANKRUPT	# T5 RUPT ARRIVAL (CALL BY DOTVCON - P40)
// PORT: Fixed ROM slots 17511.
                if slot <> 17511 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:78
//		EXTEND			# SAVE Q REQUIRED IN RESTARTS (MRCLEAN AND
// PORT: Fixed ROM slots 17512.
                if slot <> 17512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17513 {
// PORT: SOURCE TVCINITIALIZE.agc:79
//		QXCH	QRUPT		#	TVCINIT4 ARE ENTRIES)
// PORT: Fixed ROM slots 17513.
                if slot <> 17513 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:80
//MRCLEAN		CAF	NZERO		# NUMBER TO ZERO, LESS ONE  (MUST BE ODD)
// PORT: Fixed ROM slots 17514.
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
// PORT: SOURCE TVCINITIALIZE.agc:81
//					#	TVC RESTARTS ENTER HERE  (NEW BANK)
// PORT: SOURCE TVCINITIALIZE.agc:82
//	+1	CCS	A
// PORT: Fixed ROM slots 17515.
                if slot <> 17515 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:83
//		TS	CNTR
// PORT: Fixed ROM slots 17516.
                if slot <> 17516 or instruction <> 23335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17517 {
// PORT: SOURCE TVCINITIALIZE.agc:84
//		CAF	ZERO
// PORT: Fixed ROM slots 17517.
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
// PORT: SOURCE TVCINITIALIZE.agc:85
//		TS	L
// PORT: Fixed ROM slots 17518.
                    if slot <> 17518 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:86
//		INDEX	CNTR
// PORT: Fixed ROM slots 17519.
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
// PORT: SOURCE TVCINITIALIZE.agc:87
//		DXCH	OMEGAYC		# FIRST (LAST) TWO LOCATIONS
// PORT: Fixed ROM slots 17520.
    17520, 44720
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17521–17532.
function agcAotUnit1004 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17526 {
        if slot <= 17523 {
            if slot <= 17521 {
// PORT: SOURCE TVCINITIALIZE.agc:88
//		CCS	CNTR
// PORT: Fixed ROM slots 17521.
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
// PORT: SOURCE TVCINITIALIZE.agc:89
//		TCF	MRCLEAN +1
// PORT: Fixed ROM slots 17522.
                    if slot <> 17522 or instruction <> 5227 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5227, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:90
//# Page 938
// PORT: SOURCE TVCINITIALIZE.agc:91
//		EXTEND			# SET UP ANOTHER T5 RUPT TO CONTINUE
// PORT: Fixed ROM slots 17523.
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
// PORT: SOURCE TVCINITIALIZE.agc:92
//		DCA	INITLOC2	#	INITIALIZATION AT TVCINIT1
// PORT: Fixed ROM slots 17524.
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
// PORT: SOURCE TVCINITIALIZE.agc:93
//		DXCH	T5LOC		# THE PHSCHK2 ENTRY  (REDOTVC) AT TVCDAPON
// PORT: Fixed ROM slots 17525.
                    if slot <> 17525 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:94
//		CAF	POSMAX		#	+3 IS IN ANOTHER BANK. MUST RESET
// PORT: Fixed ROM slots 17526.
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
// PORT: SOURCE TVCINITIALIZE.agc:95
//		TS	TIME5		#	BBCON TOO (FULL 2CADR), FOR THAT
// PORT: Fixed ROM slots 17527.
                if slot <> 17527 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17528 {
// PORT: SOURCE TVCINITIALIZE.agc:96
//ENDMRC		TCF	RESUME		#	ENTRY.
// PORT: Fixed ROM slots 17528.
                    if slot <> 17528 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:97
//
// PORT: SOURCE TVCINITIALIZE.agc:98
//TVCINIT1	LXCH	BANKRUPT
// PORT: Fixed ROM slots 17529.
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
// PORT: SOURCE TVCINITIALIZE.agc:99
//		EXTEND
// PORT: Fixed ROM slots 17530.
                if slot <> 17530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17531 {
// PORT: SOURCE TVCINITIALIZE.agc:100
//		QXCH	QRUPT
// PORT: Fixed ROM slots 17531.
                    if slot <> 17531 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:101
//
// PORT: SOURCE TVCINITIALIZE.agc:102
//		TC	IBNKCALL	# UPDATE IXX, IAVG/TLX FOR DAP GAINS (R03
// PORT: Fixed ROM slots 17532.
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
// PORT: SOURCE TVCINITIALIZE.agc:103
//		CADR	MASSPROP	#	OR NOUNS 46 AND 47 MUST BE CORRECT)
// PORT: Fixed ROM slots 17533.
    17533, 11756
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17534–17546.
function agcAotUnit1005 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17539 {
        if slot <= 17536 {
            if slot <= 17534 {
// PORT: SOURCE TVCINITIALIZE.agc:104
//
// PORT: SOURCE TVCINITIALIZE.agc:105
//		CAE	EMDOT		# SPS FLOW RATE, SCALED B+3 KG/CS
// PORT: Fixed ROM slots 17534.
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
// PORT: SOURCE TVCINITIALIZE.agc:106
//		EXTEND
// PORT: Fixed ROM slots 17535.
                    if slot <> 17535 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:107
//		MP	ONETHOU
// PORT: Fixed ROM slots 17536.
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
// PORT: SOURCE TVCINITIALIZE.agc:108
//		TS	TENMDOT		# 10-SEC MASS LOSS B+16 KG
// PORT: Fixed ROM slots 17537.
                if slot <> 17537 or instruction <> 23455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17538 {
// PORT: SOURCE TVCINITIALIZE.agc:109
//		COM
// PORT: Fixed ROM slots 17538.
                    if slot <> 17538 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:110
//		AD	CSMMASS
// PORT: Fixed ROM slots 17539.
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
// PORT: SOURCE TVCINITIALIZE.agc:111
//		TS	MASSTMP		# DECREMENT FOR FIRST 10 SEC OF BURN
// PORT: Fixed ROM slots 17540.
                if slot <> 17540 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17541 {
// PORT: SOURCE TVCINITIALIZE.agc:112
//
// PORT: SOURCE TVCINITIALIZE.agc:113
//		CAE	DAPDATR1	# CHECK LEM-ON/OFF
// PORT: Fixed ROM slots 17541.
                    if slot <> 17541 or instruction <> 13110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:114
//		MASK	BIT14
// PORT: Fixed ROM slots 17542.
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
// PORT: SOURCE TVCINITIALIZE.agc:115
//		CCS	A
// PORT: Fixed ROM slots 17543.
                    if slot <> 17543 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:116
//		CAF	BIT1		# LEM-ON (BIT1)
// PORT: Fixed ROM slots 17544.
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
// PORT: SOURCE TVCINITIALIZE.agc:117
//		TS	CNTR		# LEM-OFF (ZERO)
// PORT: Fixed ROM slots 17545.
                    if slot <> 17545 or instruction <> 23335 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23335, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:118
//
// PORT: SOURCE TVCINITIALIZE.agc:119
//		INDEX	CNTR		# LOAD THE FILTER COEFFICIENTS
// PORT: Fixed ROM slots 17546.
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
// PORT: SOURCE TVCINITIALIZE.agc:120
//		CAF	CSMCFADR
// PORT: Fixed ROM slots 17547.
    17547, 27314
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17548–17550.
function agcAotUnit1006 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17548 {
// PORT: SOURCE TVCINITIALIZE.agc:121
//		TS	COEFFADR
// PORT: Fixed ROM slots 17548.
        if slot <> 17548 or instruction <> 23506 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23506, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17549 {
// PORT: SOURCE TVCINITIALIZE.agc:122
//		TC	LOADCOEF
// PORT: Fixed ROM slots 17549.
            if slot <> 17549 or instruction <> 1298 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1298, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:123
//
// PORT: SOURCE TVCINITIALIZE.agc:124
//		INDEX	CNTR		# PICK UP LM-OFF,-ON KTLX/I
// PORT: Fixed ROM slots 17550.
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
// PORT: SOURCE TVCINITIALIZE.agc:125
//		CAE	EKTLX/I		# SCALED AT 1/(8 ASCREV) OF ACTUAL VALUE
// PORT: Fixed ROM slots 17551.
    17551, 26140
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17552–17555.
function agcAotUnit1007 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17553 {
        if slot <= 17552 {
// PORT: SOURCE TVCINITIALIZE.agc:126
//		TS	KTLX/I
// PORT: Fixed ROM slots 17552.
            if slot <> 17552 or instruction <> 23454 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23454, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:127
//
// PORT: SOURCE TVCINITIALIZE.agc:128
//		TCR	S40.15		# COMPUTE 1/CONACC , VARK
// PORT: Fixed ROM slots 17553.
            if slot <> 17553 or instruction <> 1330 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1330, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17554 {
// PORT: SOURCE TVCINITIALIZE.agc:129
//
// PORT: SOURCE TVCINITIALIZE.agc:130
//TVCINIT2	CS	CNTR		# PICK LM-OFF,-ON VALUE FOR FILTER PERIOD
// PORT: Fixed ROM slots 17554.
            if slot <> 17554 or instruction <> 17191 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 807).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:131
//		INDEX	A		# DETERMINATION:
// PORT: Fixed ROM slots 17555.
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
// PORT: SOURCE TVCINITIALIZE.agc:132
//		CAF	BIT2		# 	BIT2 FOR CSM ONLY 40MS FILTER
// PORT: Fixed ROM slots 17556.
    17556, 29724
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17557–17565.
function agcAotUnit1008 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17560 {
        if slot <= 17558 {
            if slot <= 17557 {
// PORT: SOURCE TVCINITIALIZE.agc:133
//		TS	KPRIMEDT	# 	BIT3 FOR CSM/LM 80MS FILTER
// PORT: Fixed ROM slots 17557.
                if slot <> 17557 or instruction <> 23452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23452, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:134
//
// PORT: SOURCE TVCINITIALIZE.agc:135
//		COM			# PREPARE T5TVCDT
// PORT: Fixed ROM slots 17558.
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
// PORT: SOURCE TVCINITIALIZE.agc:136
//		AD	POSMAX
// PORT: Fixed ROM slots 17559.
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
// PORT: SOURCE TVCINITIALIZE.agc:137
//		AD	BIT1
// PORT: Fixed ROM slots 17560.
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
// PORT: SOURCE TVCINITIALIZE.agc:138
//		TS	T5TVCDT
// PORT: Fixed ROM slots 17561.
                if slot <> 17561 or instruction <> 23445 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23445, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:139
//
// PORT: SOURCE TVCINITIALIZE.agc:140
//		CS	BIT15		# RESET SWTOVER FLAG
// PORT: Fixed ROM slots 17562.
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
// PORT: SOURCE TVCINITIALIZE.agc:141
//# Page 939
// PORT: SOURCE TVCINITIALIZE.agc:142
//		MASK	FLAGWRD9
// PORT: Fixed ROM slots 17563.
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
// PORT: SOURCE TVCINITIALIZE.agc:143
//		TS	FLAGWRD9
// PORT: Fixed ROM slots 17564.
                    if slot <> 17564 or instruction <> 22597 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22597, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:144
//
// PORT: SOURCE TVCINITIALIZE.agc:145
//		INDEX	CNTR		# PICK UP LEM-OFF,-ON KPRIME
// PORT: Fixed ROM slots 17565.
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
// PORT: SOURCE TVCINITIALIZE.agc:146
//		CAE	EKPRIME		#	SCALED (100 PI)/16
// PORT: Fixed ROM slots 17566.
    17566, 26136
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17567–17571.
function agcAotUnit1009 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17568 {
        if slot <= 17567 {
// PORT: SOURCE TVCINITIALIZE.agc:147
//		EXTEND
// PORT: Fixed ROM slots 17567.
            if slot <> 17567 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:148
//		MP	KPRIMEDT	# (TVCDT/2, SC.AT B+14CS)
// PORT: Fixed ROM slots 17568.
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
// PORT: SOURCE TVCINITIALIZE.agc:149
//		LXCH	A		#	SC.AT PI/8	(DIMENSIONLESS)
// PORT: Fixed ROM slots 17569.
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
// PORT: SOURCE TVCINITIALIZE.agc:150
//		DXCH	KPRIMEDT
// PORT: Fixed ROM slots 17570.
                if slot <> 17570 or instruction <> 22429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:151
//
// PORT: SOURCE TVCINITIALIZE.agc:152
//		INDEX	CNTR		# PICK UP LEM-OFF,-ON REPFRAC
// PORT: Fixed ROM slots 17571.
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
// PORT: SOURCE TVCINITIALIZE.agc:153
//		CAE	EREPFRAC
// PORT: Fixed ROM slots 17572.
    17572, 26146
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17573–17574.
function agcAotUnit1010 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17573 {
// PORT: SOURCE TVCINITIALIZE.agc:154
//		TS	REPFRAC
// PORT: Fixed ROM slots 17573.
        if slot <> 17573 or instruction <> 23458 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23458, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TVCINITIALIZE.agc:155
//
// PORT: SOURCE TVCINITIALIZE.agc:156
//		INDEX	CNTR		# PICK UP ONE-SHOT CORRECTION TIME
// PORT: Fixed ROM slots 17574.
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
// PORT: SOURCE TVCINITIALIZE.agc:157
//		CAF	TCORR
// PORT: Fixed ROM slots 17575.
    17575, 27328
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17576–17596.
function agcAotUnit1011 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17585 {
        if slot <= 17580 {
            if slot <= 17577 {
                if slot <= 17576 {
// PORT: SOURCE TVCINITIALIZE.agc:158
//		TS	CNTR
// PORT: Fixed ROM slots 17576.
                    if slot <> 17576 or instruction <> 23335 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23335, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:159
//
// PORT: SOURCE TVCINITIALIZE.agc:160
//		CAF	NEGONE		# PREVENT STROKE TEST UNTIL CALLED
// PORT: Fixed ROM slots 17577.
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
// PORT: SOURCE TVCINITIALIZE.agc:161
//		TS	STRKTIME
// PORT: Fixed ROM slots 17578.
                    if slot <> 17578 or instruction <> 23468 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17579 {
// PORT: SOURCE TVCINITIALIZE.agc:162
//
// PORT: SOURCE TVCINITIALIZE.agc:163
//		CAF	NINETEEN	# SET VCNTR FOR VARIABLE-GAIN UPDATES IN
// PORT: Fixed ROM slots 17579.
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
// PORT: SOURCE TVCINITIALIZE.agc:164
//		TS	VCNTR		#	10 SECONDS (TVCEXEC 1/2 SEC RATE)
// PORT: Fixed ROM slots 17580.
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
// PORT: SOURCE TVCINITIALIZE.agc:165
//		TS	V97VCNTR	# FOR ENGFAIL (R41) LOGIC
// PORT: Fixed ROM slots 17581.
                    if slot <> 17581 or instruction <> 23332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23332, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:166
//
// PORT: SOURCE TVCINITIALIZE.agc:167
//TVCINIT3	CAE	PACTOFF		# TRIM VALUES TO TRIM-TRACKERS, OUTPUT
// PORT: Fixed ROM slots 17582.
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
// PORT: SOURCE TVCINITIALIZE.agc:168
//		TS	PDELOFF		#	TRACKERS, OFFSET-UPDATES, AND
// PORT: Fixed ROM slots 17583.
                    if slot <> 17583 or instruction <> 23429 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23429, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17584 {
// PORT: SOURCE TVCINITIALIZE.agc:169
//		TS	PCMD		#	OFFSET-TRACKER FILTERS
// PORT: Fixed ROM slots 17584.
                        if slot <> 17584 or instruction <> 23443 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23443, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:170
//		TS	DELPBAR		#	NOTE, LO-ORDER DELOFF,DELBAR ZEROED
// PORT: Fixed ROM slots 17585.
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
// PORT: SOURCE TVCINITIALIZE.agc:171
//
// PORT: SOURCE TVCINITIALIZE.agc:172
//		CAE	YACTOFF
// PORT: Fixed ROM slots 17586.
                    if slot <> 17586 or instruction <> 13076 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 788).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:173
//		TS	YDELOFF
// PORT: Fixed ROM slots 17587.
                    if slot <> 17587 or instruction <> 23431 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23431, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17588 {
// PORT: SOURCE TVCINITIALIZE.agc:174
//		TS	YCMD
// PORT: Fixed ROM slots 17588.
                    if slot <> 17588 or instruction <> 23444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23444, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17589 {
// PORT: SOURCE TVCINITIALIZE.agc:175
//		TS	DELYBAR
// PORT: Fixed ROM slots 17589.
                        if slot <> 17589 or instruction <> 23427 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23427, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:176
//
// PORT: SOURCE TVCINITIALIZE.agc:177
//ATTINIT		CAE	DAPDATR1	# ATTITUDE-ERROR INITIALIZATION LOGIC
// PORT: Fixed ROM slots 17590.
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
// PORT: SOURCE TVCINITIALIZE.agc:178
//		MASK	BIT13		#	TEST FOR CSM OR CSM/LM
// PORT: Fixed ROM slots 17591.
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
// PORT: SOURCE TVCINITIALIZE.agc:179
//		EXTEND
// PORT: Fixed ROM slots 17592.
                        if slot <> 17592 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:180
//		BZF	NEEDLEIN	#	BYPASS INITIALIZATION FOR CSM/LM
// PORT: Fixed ROM slots 17593.
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
// PORT: SOURCE TVCINITIALIZE.agc:181
//
// PORT: SOURCE TVCINITIALIZE.agc:182
//		CAF	BIT1		#	SET UP TEMPORARY COUNTER
// PORT: Fixed ROM slots 17594.
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
// PORT: SOURCE TVCINITIALIZE.agc:183
//	+5	TS	TTMP1
// PORT: Fixed ROM slots 17595.
                        if slot <> 17595 or instruction <> 23433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23433, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:184
//
// PORT: SOURCE TVCINITIALIZE.agc:185
//		INDEX	TTMP1
// PORT: Fixed ROM slots 17596.
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
// PORT: SOURCE TVCINITIALIZE.agc:186
//		CA	ERRBTMP		# ERRBTMP CONTAINS RCS ATTITUDE ERRORS
// PORT: Fixed ROM slots 17597.
    17597, 26500
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17598–17607.
function agcAotUnit1012 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17602 {
        if slot <= 17599 {
            if slot <= 17598 {
// PORT: SOURCE TVCINITIALIZE.agc:187
//		EXTEND			#	ERRORY & ERRORZ (P40 AT DOTVCON)
// PORT: Fixed ROM slots 17598.
                if slot <> 17598 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:188
//		MP	1/ATTLIM	# .007325(ERROR) = 0 IF ERROR < 1.5 DEG
// PORT: Fixed ROM slots 17599.
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
// PORT: SOURCE TVCINITIALIZE.agc:189
//		EXTEND
// PORT: Fixed ROM slots 17600.
                if slot <> 17600 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17601 {
// PORT: SOURCE TVCINITIALIZE.agc:190
//		BZF	+8D		#	|ERROR| LESS THAN 1.5 DEG
// PORT: Fixed ROM slots 17601.
                    if slot <> 17601 or instruction <> 5321 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5321, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:191
//		EXTEND
// PORT: Fixed ROM slots 17602.
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
// PORT: SOURCE TVCINITIALIZE.agc:192
//# Page 940
// PORT: SOURCE TVCINITIALIZE.agc:193
//		BZMF	+3		#	|ERROR| > 1.5 DEG, AND NEG
// PORT: Fixed ROM slots 17603.
                if slot <> 17603 or instruction <> 25798 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:194
//		CA	ATTLIM		#	|ERROR| > 1.5 DEG, AND POS
// PORT: Fixed ROM slots 17604.
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
// PORT: SOURCE TVCINITIALIZE.agc:195
//		TCF	+2
// PORT: Fixed ROM slots 17605.
                if slot <> 17605 or instruction <> 5319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17606 {
// PORT: SOURCE TVCINITIALIZE.agc:196
//	+3	CS	ATTLIM
// PORT: Fixed ROM slots 17606.
                    if slot <> 17606 or instruction <> 17758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1374), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:197
//	+2	INDEX	TTMP1
// PORT: Fixed ROM slots 17607.
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
// PORT: SOURCE TVCINITIALIZE.agc:198
//		TS	ERRBTMP
// PORT: Fixed ROM slots 17608.
    17608, 46980
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17609–17618.
function agcAotUnit1013 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17613 {
        if slot <= 17610 {
            if slot <= 17609 {
// PORT: SOURCE TVCINITIALIZE.agc:199
//	+8	CCS 	TTMP1		#	TEST TEMPORARY COUNTER
// PORT: Fixed ROM slots 17609.
                if slot <> 17609 or instruction <> 5001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 905).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:200
//		TCF	ATTINIT +5	#	BACK TO REPEAT FOR PITCH ERROR
// PORT: Fixed ROM slots 17610.
                if slot <> 17610 or instruction <> 5307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5307, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17611 {
// PORT: SOURCE TVCINITIALIZE.agc:201
//
// PORT: SOURCE TVCINITIALIZE.agc:202
//		CA	ERRBTMP		# ERRORS ESTABLISHED AND LIMITED
// PORT: Fixed ROM slots 17611.
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
// PORT: SOURCE TVCINITIALIZE.agc:203
//		TS	PERRB
// PORT: Fixed ROM slots 17612.
                    if slot <> 17612 or instruction <> 23421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:204
//		CA	ERRBTMP +1
// PORT: Fixed ROM slots 17613.
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
// PORT: SOURCE TVCINITIALIZE.agc:205
//		TS	YERRB
// PORT: Fixed ROM slots 17614.
                if slot <> 17614 or instruction <> 23423 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23423, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:206
//
// PORT: SOURCE TVCINITIALIZE.agc:207
//NEEDLEIN	CS	RCSFLAGS	# SET BIT 3 FOR INITIALIZATION PASS AND GO
// PORT: Fixed ROM slots 17615.
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
// PORT: SOURCE TVCINITIALIZE.agc:208
//		MASK	BIT3		# 	TO NEEDLER.  WILL CLEAR FOR TVC DAP
// PORT: Fixed ROM slots 17616.
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
// PORT: SOURCE TVCINITIALIZE.agc:209
//		ADS	RCSFLAGS	# 	(RETURNS AFTER CADR)
// PORT: Fixed ROM slots 17617.
                    if slot <> 17617 or instruction <> 12097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 833).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:210
//		TC	IBNKCALL
// PORT: Fixed ROM slots 17618.
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
// PORT: SOURCE TVCINITIALIZE.agc:211
//		CADR	NEEDLER
// PORT: Fixed ROM slots 17619.
    17619, 35360
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17620–17632.
function agcAotUnit1014 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17625 {
        if slot <= 17622 {
            if slot <= 17620 {
// PORT: SOURCE TVCINITIALIZE.agc:212
//
// PORT: SOURCE TVCINITIALIZE.agc:213
//TVCINIT4	CAF	ZERO		# SET TVCPHASE TO INDICATE TVCDAPON-THRU-
// PORT: Fixed ROM slots 17620.
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
// PORT: SOURCE TVCINITIALIZE.agc:214
//		TS	TVCPHASE	#	NEEDLEIN INITIALIZATION FINISHED.
// PORT: Fixed ROM slots 17621.
                    if slot <> 17621 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:215
//					#	(POSSIBLE TVC-RESTART ENTRY)
// PORT: SOURCE TVCINITIALIZE.agc:216
//
// PORT: SOURCE TVCINITIALIZE.agc:217
//		CAE	CDUX		# PREPARE ROLL DAP
// PORT: Fixed ROM slots 17622.
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
// PORT: SOURCE TVCINITIALIZE.agc:218
//		TS	OGANOW
// PORT: Fixed ROM slots 17623.
                if slot <> 17623 or instruction <> 23474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23474, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17624 {
// PORT: SOURCE TVCINITIALIZE.agc:219
//
// PORT: SOURCE TVCINITIALIZE.agc:220
//		CAF	BIT13		# IF ENGINE IS ALREADY OFF, ENGINOFF HAS
// PORT: Fixed ROM slots 17624.
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
// PORT: SOURCE TVCINITIALIZE.agc:221
//		EXTEND			#	ALREADY ESTABLISHED THE POST-BURN
// PORT: Fixed ROM slots 17625.
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
// PORT: SOURCE TVCINITIALIZE.agc:222
//		RAND	DSALMOUT	#	CSMMASS (MASSBACK DOES IT). DONT
// PORT: Fixed ROM slots 17626.
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
// PORT: SOURCE TVCINITIALIZE.agc:223
//		EXTEND			# 	TOUCH CSMMASS.  IF ENGINE IS ON,
// PORT: Fixed ROM slots 17627.
                    if slot <> 17627 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:224
//		BZF	+3		#	THEN ITS OK TO DO THE COPYCYCLE
// PORT: Fixed ROM slots 17628.
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
// PORT: SOURCE TVCINITIALIZE.agc:225
//					#	EVEN BURNS LESS THAN 0.4 SEC ARE AOK
// PORT: SOURCE TVCINITIALIZE.agc:226
//
// PORT: SOURCE TVCINITIALIZE.agc:227
//		CAE	MASSTMP		# COPYCYCLE
// PORT: Fixed ROM slots 17629.
                    if slot <> 17629 or instruction <> 13226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 938).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:228
//		TS	CSMMASS
// PORT: Fixed ROM slots 17630.
                    if slot <> 17630 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17631 {
// PORT: SOURCE TVCINITIALIZE.agc:229
//
// PORT: SOURCE TVCINITIALIZE.agc:230
//	+3	CAF	.5SEC		# CALL TVCEXECUTIVE (ROLLDAP CALL, ETC)
// PORT: Fixed ROM slots 17631.
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
// PORT: SOURCE TVCINITIALIZE.agc:231
//		TC	WAITLIST
// PORT: Fixed ROM slots 17632.
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
// PORT: SOURCE TVCINITIALIZE.agc:232
//		EBANK=	BZERO
// PORT: SOURCE TVCINITIALIZE.agc:233
//		2CADR	TVCEXEC
// PORT: Fixed ROM slots 17633 17634.
    17633, 2976, 17634, 28780
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17635–17642.
function agcAotUnit1015 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17638 {
        if slot <= 17636 {
            if slot <= 17635 {
// PORT: SOURCE TVCINITIALIZE.agc:234
//
// PORT: SOURCE TVCINITIALIZE.agc:235
//		EXTEND			# CALL FOR DAPINIT
// PORT: Fixed ROM slots 17635.
                if slot <> 17635 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:236
//		DCA	DAPINIT5
// PORT: Fixed ROM slots 17636.
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
// PORT: SOURCE TVCINITIALIZE.agc:237
//		DXCH	T5LOC
// PORT: Fixed ROM slots 17637.
                if slot <> 17637 or instruction <> 22219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:238
//		CAE	T5TVCDT		# (ALLOW TIME FOR RESTART COMPUTATIONS)
// PORT: Fixed ROM slots 17638.
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
// PORT: SOURCE TVCINITIALIZE.agc:239
//		TS	TIME5
// PORT: Fixed ROM slots 17639.
                if slot <> 17639 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:240
//# Page 941
// PORT: SOURCE TVCINITIALIZE.agc:241
//ENDTVCIN	TCF	RESUME
// PORT: Fixed ROM slots 17640.
                if slot <> 17640 or instruction <> 6875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17641 {
// PORT: SOURCE TVCINITIALIZE.agc:242
//
// PORT: SOURCE TVCINITIALIZE.agc:243
//PRESWTCH	TCR	SWICHOVR	# ENTRY FROM V46
// PORT: Fixed ROM slots 17641.
                if slot <> 17641 or instruction <> 1260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1260, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:244
//
// PORT: SOURCE TVCINITIALIZE.agc:245
//		TC	POSTJUMP	# THIS PROVIDES AN EXIT FROM SWITCH-OVER
// PORT: Fixed ROM slots 17642.
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
// PORT: SOURCE TVCINITIALIZE.agc:246
//		CADR	PINBRNCH	#	(PINBRNCH DOES A RELINT)
// PORT: Fixed ROM slots 17643.
    17643, 17780
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17644–17652.
function agcAotUnit1016 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17647 {
        if slot <= 17645 {
            if slot <= 17644 {
// PORT: SOURCE TVCINITIALIZE.agc:247
//
// PORT: SOURCE TVCINITIALIZE.agc:248
//SWICHOVR	INHINT
// PORT: Fixed ROM slots 17644.
                if slot <> 17644 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:249
//		CA	TVCPHASE	# SAVE TVCPHASE
// PORT: Fixed ROM slots 17645.
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
// PORT: SOURCE TVCINITIALIZE.agc:250
//		TS	PHASETMP
// PORT: Fixed ROM slots 17646.
                if slot <> 17646 or instruction <> 23433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:251
//		CS	BIT2		# SET TVCPHASE = -2 (INDICATES SWITCH-OVER
// PORT: Fixed ROM slots 17647.
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
// PORT: SOURCE TVCINITIALIZE.agc:252
//		TS	TVCPHASE	#	TO RESTART LOGIC)
// PORT: Fixed ROM slots 17648.
                if slot <> 17648 or instruction <> 23460 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23460, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCINITIALIZE.agc:253
//
// PORT: SOURCE TVCINITIALIZE.agc:254
//	+5	EXTEND			# SAVE Q FOR RETURN (RESTART ENTRY POINT,
// PORT: Fixed ROM slots 17649.
                if slot <> 17649 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17650 {
// PORT: SOURCE TVCINITIALIZE.agc:255
//		QXCH	RTRNLOC		#	TVCPHASE AND PHASETMP ALREADY SET)
// PORT: Fixed ROM slots 17650.
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
// PORT: SOURCE TVCINITIALIZE.agc:256
//
// PORT: SOURCE TVCINITIALIZE.agc:257
//		CAF	NZEROJR		# ZEROING LOOP FOR FILTER STORAGE LOCS
// PORT: Fixed ROM slots 17651.
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
// PORT: SOURCE TVCINITIALIZE.agc:258
//	+8	TS	CNTRTMP
// PORT: Fixed ROM slots 17652.
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

// PORT: Physical bank 17. Shared continuation entries, slots 17653–17655.
function agcAotUnit1017 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17653 {
// PORT: SOURCE TVCINITIALIZE.agc:259
//
// PORT: SOURCE TVCINITIALIZE.agc:260
//MCLEANJR	CA	ZERO
// PORT: Fixed ROM slots 17653.
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
// PORT: SOURCE TVCINITIALIZE.agc:261
//		TS	L
// PORT: Fixed ROM slots 17654.
            if slot <> 17654 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:262
//		INDEX	CNTRTMP
// PORT: Fixed ROM slots 17655.
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
// PORT: SOURCE TVCINITIALIZE.agc:263
//		DXCH	PTMP1 -1
// PORT: Fixed ROM slots 17656.
    17656, 44738
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17657–17683.
function agcAotUnit1018 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17669 {
        if slot <= 17662 {
            if slot <= 17659 {
                if slot <= 17657 {
// PORT: SOURCE TVCINITIALIZE.agc:264
//		CCS	CNTRTMP
// PORT: Fixed ROM slots 17657.
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
// PORT: SOURCE TVCINITIALIZE.agc:265
//		CCS	A
// PORT: Fixed ROM slots 17658.
                        if slot <> 17658 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:266
//		TCF	SWICHOVR +8D
// PORT: Fixed ROM slots 17659.
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
// PORT: SOURCE TVCINITIALIZE.agc:267
//
// PORT: SOURCE TVCINITIALIZE.agc:268
//		CS	FLAGWRD9	# SET SWITCHOVER FLAG FOR DOWNLINK
// PORT: Fixed ROM slots 17660.
                    if slot <> 17660 or instruction <> 16453 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 69).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17661 {
// PORT: SOURCE TVCINITIALIZE.agc:269
//		MASK	BIT15
// PORT: Fixed ROM slots 17661.
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
// PORT: SOURCE TVCINITIALIZE.agc:270
//		ADS	FLAGWRD9
// PORT: Fixed ROM slots 17662.
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
// PORT: SOURCE TVCINITIALIZE.agc:271
//
// PORT: SOURCE TVCINITIALIZE.agc:272
//		CAE	EKTLX/I +2	# LOW BANDWIDTH GAINS 	- DAP
// PORT: Fixed ROM slots 17663.
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
// PORT: SOURCE TVCINITIALIZE.agc:273
//		TS	KTLX/I
// PORT: Fixed ROM slots 17664.
                        if slot <> 17664 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:274
//		TCR	S40.15 	+7
// PORT: Fixed ROM slots 17665.
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
// PORT: SOURCE TVCINITIALIZE.agc:275
//
// PORT: SOURCE TVCINITIALIZE.agc:276
//		CAF	FKPRIMDT	#			- STEERING
// PORT: Fixed ROM slots 17666.
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
// PORT: SOURCE TVCINITIALIZE.agc:277
//		TS	KPRIMEDT
// PORT: Fixed ROM slots 17667.
                        if slot <> 17667 or instruction <> 23452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17668 {
// PORT: SOURCE TVCINITIALIZE.agc:278
//
// PORT: SOURCE TVCINITIALIZE.agc:279
//		CAF	FREPFRAC	#			- TMC LOOP
// PORT: Fixed ROM slots 17668.
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
// PORT: SOURCE TVCINITIALIZE.agc:280
//		TS	REPFRAC
// PORT: Fixed ROM slots 17669.
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
// PORT: SOURCE TVCINITIALIZE.agc:281
//
// PORT: SOURCE TVCINITIALIZE.agc:282
//		EXTEND			# UPDATE TRIM ESTIMATES
// PORT: Fixed ROM slots 17670.
                    if slot <> 17670 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17671 {
// PORT: SOURCE TVCINITIALIZE.agc:283
//		DCA	DELPBAR
// PORT: Fixed ROM slots 17671.
                        if slot <> 17671 or instruction <> 13186 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 898, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:284
//		DXCH	PDELOFF
// PORT: Fixed ROM slots 17672.
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
// PORT: SOURCE TVCINITIALIZE.agc:285
//		EXTEND
// PORT: Fixed ROM slots 17673.
                        if slot <> 17673 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:286
//		DCA	DELYBAR
// PORT: Fixed ROM slots 17674.
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
// PORT: SOURCE TVCINITIALIZE.agc:287
//		DXCH	YDELOFF
// PORT: Fixed ROM slots 17675.
                        if slot <> 17675 or instruction <> 22408 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 904, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:288
//
// PORT: SOURCE TVCINITIALIZE.agc:289
//		CA	LBCFADR
// PORT: Fixed ROM slots 17676.
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
// PORT: SOURCE TVCINITIALIZE.agc:290
//# Page 942
// PORT: SOURCE TVCINITIALIZE.agc:291
//		TS	COEFFADR
// PORT: Fixed ROM slots 17677.
                    if slot <> 17677 or instruction <> 23506 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23506, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17678 {
// PORT: SOURCE TVCINITIALIZE.agc:292
//		TC	LOADCOEF
// PORT: Fixed ROM slots 17678.
                        if slot <> 17678 or instruction <> 1298 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1298, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:293
//
// PORT: SOURCE TVCINITIALIZE.agc:294
//		CAE	PHASETMP	# RESTORE TVCPHASE
// PORT: Fixed ROM slots 17679.
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
// PORT: SOURCE TVCINITIALIZE.agc:295
//		TS	TVCPHASE
// PORT: Fixed ROM slots 17680.
                        if slot <> 17680 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:296
//
// PORT: SOURCE TVCINITIALIZE.agc:297
//		TC	RTRNLOC		# BACK TO PRESWTCH OR TVCRESTARTS
// PORT: Fixed ROM slots 17681.
                        if slot <> 17681 or instruction <> 907 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 907, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17682 {
// PORT: SOURCE TVCINITIALIZE.agc:298
//
// PORT: SOURCE TVCINITIALIZE.agc:299
//LOADCOEF	EXTEND			# LOAD DAP FILTER COEFFICIENTS
// PORT: Fixed ROM slots 17682.
                        if slot <> 17682 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCINITIALIZE.agc:300
//		INDEX	COEFFADR	#   FROM: ERASABLE FOR CSM/LM HB
// PORT: Fixed ROM slots 17683.
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
// PORT: SOURCE TVCINITIALIZE.agc:301
//		DCA	0		#         FIXED    FOR CSM/LM LB
// PORT: Fixed ROM slots 17684.
    17684, 24578
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17685–17687.
function agcAotUnit1019 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17685 {
// PORT: SOURCE TVCINITIALIZE.agc:302
//		DXCH	N10		#         FIXED    FOR CSM
// PORT: Fixed ROM slots 17685.
        if slot <> 17685 or instruction <> 22484 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 980, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17686 {
// PORT: SOURCE TVCINITIALIZE.agc:303
//
// PORT: SOURCE TVCINITIALIZE.agc:304
//		EXTEND			# NOTE: FOR CSM/LM, NORMAL COEFFICIENT
// PORT: Fixed ROM slots 17686.
            if slot <> 17686 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:305
//		INDEX	COEFFADR	# LOAD WILL BE HIGH BANDWIDTH PAD LOAD
// PORT: Fixed ROM slots 17687.
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
// PORT: SOURCE TVCINITIALIZE.agc:306
//		DCA	2		# ERASABLES. DURING CSM/LM SWITCHOVER,
// PORT: Fixed ROM slots 17688.
    17688, 24582
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17689–17691.
function agcAotUnit1020 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17689 {
// PORT: SOURCE TVCINITIALIZE.agc:307
//		DXCH	N10 +2		# THIS LOGIC IS USED TO LOAD LOW BANDWIDTH
// PORT: Fixed ROM slots 17689.
        if slot <> 17689 or instruction <> 22486 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 982, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17690 {
// PORT: SOURCE TVCINITIALIZE.agc:308
//					# COEFFICIENTS FROM FIXED MEMORY.
// PORT: SOURCE TVCINITIALIZE.agc:309
//
// PORT: SOURCE TVCINITIALIZE.agc:310
//		EXTEND
// PORT: Fixed ROM slots 17690.
            if slot <> 17690 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:311
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17691.
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
// PORT: SOURCE TVCINITIALIZE.agc:312
//		DCA	4
// PORT: Fixed ROM slots 17692.
    17692, 24586
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17693–17695.
function agcAotUnit1021 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17693 {
// PORT: SOURCE TVCINITIALIZE.agc:313
//		DXCH	N10 +4
// PORT: Fixed ROM slots 17693.
        if slot <> 17693 or instruction <> 22488 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 984, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17694 {
// PORT: SOURCE TVCINITIALIZE.agc:314
//
// PORT: SOURCE TVCINITIALIZE.agc:315
//		EXTEND
// PORT: Fixed ROM slots 17694.
            if slot <> 17694 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:316
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17695.
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
// PORT: SOURCE TVCINITIALIZE.agc:317
//		DCA	6
// PORT: Fixed ROM slots 17696.
    17696, 24590
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17697–17699.
function agcAotUnit1022 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17697 {
// PORT: SOURCE TVCINITIALIZE.agc:318
//		DXCH	N10 +6
// PORT: Fixed ROM slots 17697.
        if slot <> 17697 or instruction <> 22490 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 986, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17698 {
// PORT: SOURCE TVCINITIALIZE.agc:319
//
// PORT: SOURCE TVCINITIALIZE.agc:320
//		EXTEND
// PORT: Fixed ROM slots 17698.
            if slot <> 17698 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:321
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17699.
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
// PORT: SOURCE TVCINITIALIZE.agc:322
//		DCA	8D
// PORT: Fixed ROM slots 17700.
    17700, 24594
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17701–17703.
function agcAotUnit1023 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17701 {
// PORT: SOURCE TVCINITIALIZE.agc:323
//		DXCH	N10 +8D
// PORT: Fixed ROM slots 17701.
        if slot <> 17701 or instruction <> 22492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 988, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17702 {
// PORT: SOURCE TVCINITIALIZE.agc:324
//
// PORT: SOURCE TVCINITIALIZE.agc:325
//		EXTEND
// PORT: Fixed ROM slots 17702.
            if slot <> 17702 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:326
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17703.
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
// PORT: SOURCE TVCINITIALIZE.agc:327
//		DCA	10D
// PORT: Fixed ROM slots 17704.
    17704, 24598
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17705–17707.
function agcAotUnit1024 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17705 {
// PORT: SOURCE TVCINITIALIZE.agc:328
//		DXCH	N10 +10D
// PORT: Fixed ROM slots 17705.
        if slot <> 17705 or instruction <> 22494 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 990, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17706 {
// PORT: SOURCE TVCINITIALIZE.agc:329
//
// PORT: SOURCE TVCINITIALIZE.agc:330
//		EXTEND
// PORT: Fixed ROM slots 17706.
            if slot <> 17706 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCINITIALIZE.agc:331
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17707.
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
// PORT: SOURCE TVCINITIALIZE.agc:332
//		DCA	12D
// PORT: Fixed ROM slots 17708.
    17708, 24602
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17709–17710.
function agcAotUnit1025 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17709 {
// PORT: SOURCE TVCINITIALIZE.agc:333
//		DXCH	N10 +12D
// PORT: Fixed ROM slots 17709.
        if slot <> 17709 or instruction <> 22496 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 992, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TVCINITIALIZE.agc:334
//
// PORT: SOURCE TVCINITIALIZE.agc:335
//		INDEX	COEFFADR
// PORT: Fixed ROM slots 17710.
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
// PORT: SOURCE TVCINITIALIZE.agc:336
//		CA	14D
// PORT: Fixed ROM slots 17711.
    17711, 24604
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17712–17727.
function agcAotUnit1026 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17719 {
        if slot <= 17715 {
            if slot <= 17713 {
                if slot <= 17712 {
// PORT: SOURCE TVCINITIALIZE.agc:337
//		TS	N10 +14D
// PORT: Fixed ROM slots 17712.
                    if slot <> 17712 or instruction <> 23521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:338
//
// PORT: SOURCE TVCINITIALIZE.agc:339
//		TC	Q
// PORT: Fixed ROM slots 17713.
                    if slot <> 17713 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17714 {
// PORT: SOURCE TVCINITIALIZE.agc:340
//# Page 943
// PORT: SOURCE TVCINITIALIZE.agc:341
//S40.15		CAE	IXX		# GAIN COMPUTATIONS (1/CONACC, VARK)
// PORT: Fixed ROM slots 17714.
                    if slot <> 17714 or instruction <> 13112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 824).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:342
//		EXTEND			# ENTERED FROM TVCINITIALIZE AND TVCEXEC
// PORT: Fixed ROM slots 17715.
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
// PORT: SOURCE TVCINITIALIZE.agc:343
//		MP	2PI/M		#	2PI/M SCALED 1/(B+8 N M)
// PORT: Fixed ROM slots 17716.
                    if slot <> 17716 or instruction <> 30052 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1380, readEffective:call(words, 1380)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:344
//		DDOUBL			#	IXX   SCALED B+20 KG-MSQ
// PORT: Fixed ROM slots 17717.
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
// PORT: SOURCE TVCINITIALIZE.agc:345
//		DDOUBL
// PORT: Fixed ROM slots 17718.
                    if slot <> 17718 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:346
//		DDOUBL
// PORT: Fixed ROM slots 17719.
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
// PORT: SOURCE TVCINITIALIZE.agc:347
//		TS	1/CONACC	#	     SCALED B+9 SEC-SQ/REV
// PORT: Fixed ROM slots 17720.
                    if slot <> 17720 or instruction <> 23456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23456, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:348
//
// PORT: SOURCE TVCINITIALIZE.agc:349
//	+7	CAE	KTLX/I		# ENTRY FROM CSM/LM V46 SWITCH-OVER
// PORT: Fixed ROM slots 17721.
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
// PORT: SOURCE TVCINITIALIZE.agc:350
//		EXTEND			#            SCALED (B+3 ASCREV)  1/SECSQ
// PORT: Fixed ROM slots 17722.
                    if slot <> 17722 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:351
//		MP	IAVG/TLX	#            SCALED B+2 SECSQ
// PORT: Fixed ROM slots 17723.
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
// PORT: SOURCE TVCINITIALIZE.agc:352
//		DDOUBL
// PORT: Fixed ROM slots 17724.
                    if slot <> 17724 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:353
//		DDOUBL
// PORT: Fixed ROM slots 17725.
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
// PORT: SOURCE TVCINITIALIZE.agc:354
//		TS	VARK		#            SCALED (B+3 ASCREV)
// PORT: Fixed ROM slots 17726.
                    if slot <> 17726 or instruction <> 23457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23457, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCINITIALIZE.agc:355
//		TC	Q
// PORT: Fixed ROM slots 17727.
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
// PORT: SOURCE TVCINITIALIZE.agc:356
//
// PORT: SOURCE TVCINITIALIZE.agc:357
//CSMN10		DEC	.99999		# N10	CSM ONLY FILTER COEFFICIENTS
// PORT: Fixed ROM slots 17728.
    17728, 32766,
// PORT: SOURCE TVCINITIALIZE.agc:358
//		DEC	-.2549		# N11/2
// PORT: Fixed ROM slots 17729.
    17729, 57182,
// PORT: SOURCE TVCINITIALIZE.agc:359
//		DEC	.0588		# N12
// PORT: Fixed ROM slots 17730.
    17730, 1926,
// PORT: SOURCE TVCINITIALIZE.agc:360
//		DEC	-.7620		# D11/2
// PORT: Fixed ROM slots 17731.
    17731, 40564,
// PORT: SOURCE TVCINITIALIZE.agc:361
//		DEC	.7450		# D12
// PORT: Fixed ROM slots 17732.
    17732, 24412,
// PORT: SOURCE TVCINITIALIZE.agc:362
//
// PORT: SOURCE TVCINITIALIZE.agc:363
//		DEC	.99999		# N20
// PORT: Fixed ROM slots 17733.
    17733, 32766,
// PORT: SOURCE TVCINITIALIZE.agc:364
//		DEC	-.4852		# N21/2
// PORT: Fixed ROM slots 17734.
    17734, 49634,
// PORT: SOURCE TVCINITIALIZE.agc:365
//		DEC	0		# N22
// PORT: Fixed ROM slots 17735.
    17735, 0,
// PORT: SOURCE TVCINITIALIZE.agc:366
//		DEC	-.2692		# D22/2
// PORT: Fixed ROM slots 17736.
    17736, 56712,
// PORT: SOURCE TVCINITIALIZE.agc:367
//		DEC	0		# D22
// PORT: Fixed ROM slots 17737.
    17737, 0,
// PORT: SOURCE TVCINITIALIZE.agc:368
//
// PORT: SOURCE TVCINITIALIZE.agc:369
//LBN10		DEC	+.99999		# N10	LOW BANDWIDTH FILTER COEFFICIENTS
// PORT: Fixed ROM slots 17738.
    17738, 32766,
// PORT: SOURCE TVCINITIALIZE.agc:370
//		DEC	-.3285		# N11/2
// PORT: Fixed ROM slots 17739.
    17739, 54770,
// PORT: SOURCE TVCINITIALIZE.agc:371
//		DEC	-.3301		# N12
// PORT: Fixed ROM slots 17740.
    17740, 54718,
// PORT: SOURCE TVCINITIALIZE.agc:372
//		DEC	-.9101		# D11/2
// PORT: Fixed ROM slots 17741.
    17741, 35712,
// PORT: SOURCE TVCINITIALIZE.agc:373
//		DEC	+.8460		# D12
// PORT: Fixed ROM slots 17742.
    17742, 27722,
// PORT: SOURCE TVCINITIALIZE.agc:374
//
// PORT: SOURCE TVCINITIALIZE.agc:375
//		DEC	+.03125		# N20
// PORT: Fixed ROM slots 17743.
    17743, 1024,
// PORT: SOURCE TVCINITIALIZE.agc:376
//		DEC	0		# N21/2
// PORT: Fixed ROM slots 17744.
    17744, 0,
// PORT: SOURCE TVCINITIALIZE.agc:377
//		DEC	0		# N22
// PORT: Fixed ROM slots 17745.
    17745, 0,
// PORT: SOURCE TVCINITIALIZE.agc:378
//		DEC	-.9101		# D21/2
// PORT: Fixed ROM slots 17746.
    17746, 35712,
// PORT: SOURCE TVCINITIALIZE.agc:379
//		DEC	+.8460		# D22
// PORT: Fixed ROM slots 17747.
    17747, 27722,
// PORT: SOURCE TVCINITIALIZE.agc:380
//
// PORT: SOURCE TVCINITIALIZE.agc:381
//		DEC	+.5000		# N30
// PORT: Fixed ROM slots 17748.
    17748, 16384,
// PORT: SOURCE TVCINITIALIZE.agc:382
//		DEC	-.47115		# N31/2
// PORT: Fixed ROM slots 17749.
    17749, 50096,
// PORT: SOURCE TVCINITIALIZE.agc:383
//		DEC	+.4749		# N32
// PORT: Fixed ROM slots 17750.
    17750, 15562,
// PORT: SOURCE TVCINITIALIZE.agc:384
//		DEC	-.9558		# D31/2
// PORT: Fixed ROM slots 17751.
    17751, 34214,
// PORT: SOURCE TVCINITIALIZE.agc:385
//		DEC	+.9372		# D32
// PORT: Fixed ROM slots 17752.
    17752, 30710,
// PORT: SOURCE TVCINITIALIZE.agc:386
//
// PORT: SOURCE TVCINITIALIZE.agc:387
//CSMCFADR	GENADR	CSMN10		# CSM ONLY COEFFICIENTS ADDRESS
// PORT: Fixed ROM slots 17753.
    17753, 2688,
// PORT: SOURCE TVCINITIALIZE.agc:388
//HBCFADR		GENADR	HBN10		# HIGH BANDWIDTH COEFFICIENTS ADDRESS
// PORT: Fixed ROM slots 17754.
    17754, 1578,
// PORT: SOURCE TVCINITIALIZE.agc:389
//# Page 944
// PORT: SOURCE TVCINITIALIZE.agc:390
//LBCFADR		GENADR	LBN10		# LOW BANDWIDTH COEFFICIENTS ADDRESS
// PORT: Fixed ROM slots 17755.
    17755, 2708,
// PORT: SOURCE TVCINITIALIZE.agc:391
//
// PORT: SOURCE TVCINITIALIZE.agc:392
//NZERO		DEC	51		# MUST BE ODD FOR MRCLEAN
// PORT: Fixed ROM slots 17756.
    17756, 102,
// PORT: SOURCE TVCINITIALIZE.agc:393
//NZEROJR		DEC	23		# MUST BE ODD FOR MCLEANJR
// PORT: Fixed ROM slots 17757.
    17757, 46,
// PORT: SOURCE TVCINITIALIZE.agc:394
//
// PORT: SOURCE TVCINITIALIZE.agc:395
//ATTLIM		DEC	0.00833		# INITIAL ATTITUDE ERROR LIMIT (1.5 DEG)
// PORT: Fixed ROM slots 17758.
    17758, 272,
// PORT: SOURCE TVCINITIALIZE.agc:396
//1/ATTLIM	DEC	0.007325	# .007325(ERROR) = 0 IF ERROR < 1.5 DEG
// PORT: Fixed ROM slots 17759.
    17759, 240,
// PORT: SOURCE TVCINITIALIZE.agc:397
//
// PORT: SOURCE TVCINITIALIZE.agc:398
//TCORR		OCT	00005		# CSM
// PORT: Fixed ROM slots 17760.
    17760, 10,
// PORT: SOURCE TVCINITIALIZE.agc:399
//	+1	OCT	00000		# CSM/LM (HB,LB)
// PORT: Fixed ROM slots 17761.
    17761, 0,
// PORT: SOURCE TVCINITIALIZE.agc:400
//
// PORT: SOURCE TVCINITIALIZE.agc:401
//FKPRIMDT	DEC	.0102		# CSM/LM (LB), (.05 X .08) SCALED AT PI/8
// PORT: Fixed ROM slots 17762.
    17762, 334,
// PORT: SOURCE TVCINITIALIZE.agc:402
//FREPFRAC	DEC	.0375 B-2	# CSM/LM (LB), 0.0375 SCALED AT B+2
// PORT: Fixed ROM slots 17763.
    17763, 308,
// PORT: SOURCE TVCINITIALIZE.agc:403
//
// PORT: SOURCE TVCINITIALIZE.agc:404
//NINETEEN	=	VD1
// PORT: SOURCE TVCINITIALIZE.agc:405
//2PI/M		DEC	.00331017 B+8	# 2PI/M, SCALED AT 1/(B+8 N-M)
// PORT: Fixed ROM slots 17764.
    17764, 27768,
// PORT: SOURCE TVCINITIALIZE.agc:406
//
// PORT: SOURCE TVCINITIALIZE.agc:407
//ONETHOU		DEC	1000 B-13	# KG/CS B3 TO KG/10SEC B16 CONVERSION
// PORT: Fixed ROM slots 17765.
    17765, 4000,
// PORT: SOURCE TVCINITIALIZE.agc:408
//
// PORT: SOURCE TVCINITIALIZE.agc:409
//		EBANK=	BZERO
// PORT: SOURCE TVCINITIALIZE.agc:410
//DAPINIT5	2CADR	DAPINIT
// PORT: Fixed ROM slots 17766 17767.
    17766, 3214, 17767, 32876,
// PORT: SOURCE TVCINITIALIZE.agc:411
//
// PORT: SOURCE TVCINITIALIZE.agc:412
//		EBANK=	BZERO
// PORT: SOURCE TVCINITIALIZE.agc:413
//INITLOC2	2CADR	TVCINIT1
// PORT: Fixed ROM slots 17768 17769.
    17768, 2290, 17769, 30828
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE TVCINITIALIZE.agc:414
//
