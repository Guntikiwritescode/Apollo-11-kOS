// R31.agc
// bank 40, slots 35772-35773
function agcAotUnit2389 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 35772 {
// R31.agc:1
//# Copyright:	Public domain.
// R31.agc:2
//# Filename:	R31.agc
// R31.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// R31.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// R31.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// R31.agc:6
//# Assembler:	yaYUL
// R31.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// R31.agc:8
//# Website:	www.ibiblio.org/apollo.
// R31.agc:9
//# Pages:	703-708
// R31.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// R31.agc:11
//#				Luminary131 file, using page
// R31.agc:12
//#				images from Luminary 1A.
// R31.agc:13
//#
// R31.agc:14
//# This source code has been transcribed or otherwise adapted from
// R31.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// R31.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// R31.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// R31.agc:18
//# in storage size and consequent reduction in image quality as well) are
// R31.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// R31.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// R31.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// R31.agc:22
//# actually created.
// R31.agc:23
//#
// R31.agc:24
//# Notations on the hardcopy document read, in part:
// R31.agc:25
//#
// R31.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// R31.agc:27
//#	16:27 JULY 14, 1969
// R31.agc:28
//
// R31.agc:29
//# Page 703
// R31.agc:30
//		BANK	40
// R31.agc:31
//		SETLOC	R31LOC
// R31.agc:32
//		BANK
// R31.agc:33
//
// R31.agc:34
//		COUNT*	$$/R31
// R31.agc:35
//
// R31.agc:36
//R31CALL		CAF	PRIO3
// slot 35772
        if slot <> 35772 or instruction <> 14861 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R31.agc:37
//		TC	FINDVAC
// slot 35773
        if slot <> 35773 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2389] to agcAotUnit2389@.

agcAotInstallSourceRope(list(
// R31.agc:38
//		EBANK=	SUBEXIT
// R31.agc:39
//		2CADR	V83CALL
// slot 35774 35775
    35774, 3234, 35775, 63598
)).

// bank 40, slots 35776-35776
function agcAotUnit2390 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R31.agc:40
//
// R31.agc:41
//DSPDELAY	TC	FIXDELAY
// slot 35776
    if slot <> 35776 or instruction <> 2705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2390] to agcAotUnit2390@.

agcAotInstallSourceRope(list(
// R31.agc:42
//		DEC	100
// slot 35777
    35777, 200
)).

// bank 40, slots 35778-35783
function agcAotUnit2391 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 35780 {
        if slot <= 35778 {
// R31.agc:43
//		CA	EXTVBACT
// slot 35778
            if slot <> 35778 or instruction <> 12836 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 548).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 35779 {
// R31.agc:44
//		MASK	BIT12
// slot 35779
                if slot <> 35779 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:45
//		EXTEND
// slot 35780
                if slot <> 35780 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 35781 {
// R31.agc:46
//		BZF	DSPDELAY
// slot 35781
            if slot <> 35781 or instruction <> 6080 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6080, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 35782 {
// R31.agc:47
//
// R31.agc:48
//		CAF	PRIO5
// slot 35782
                if slot <> 35782 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:49
//		TC	NOVAC
// slot 35783
                if slot <> 35783 or instruction <> 2618 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2618, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2391] to agcAotUnit2391@.

agcAotInstallSourceRope(list(
// R31.agc:50
//		EBANK=	TSTRT
// R31.agc:51
//		2CADR	DISPN5X
// slot 35784 35785
    35784, 3222, 35785, 63598
)).

// bank 40, slots 35786-35786
function agcAotUnit2392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R31.agc:52
//
// R31.agc:53
//		TCF	TASKOVER
// slot 35786
    if slot <> 35786 or instruction <> 6833 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6833, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2392] to agcAotUnit2392@.

// bank 37, slots 34379-34380
function agcAotUnit2274 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34379 {
// R31.agc:54
//
// R31.agc:55
//		BANK	37
// R31.agc:56
//		SETLOC	R31
// R31.agc:57
//		BANK
// R31.agc:58
//		COUNT*	$$/R31
// R31.agc:59
//
// R31.agc:60
//DISPN5X		CAF	V16N54
// slot 34379
        if slot <> 34379 or instruction <> 14087 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1799), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R31.agc:61
//		TC	BANKCALL
// slot 34380
        if slot <> 34380 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2274] to agcAotUnit2274@.

agcAotInstallSourceRope(list(
// R31.agc:62
//		CADR	GOMARKF
// slot 34381
    34381, 16824
)).

// bank 37, slots 34382-34393
function agcAotUnit2275 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34387 {
        if slot <= 34384 {
            if slot <= 34382 {
// R31.agc:63
//		TC	B5OFF
// slot 34382
                if slot <> 34382 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34383 {
// R31.agc:64
//		TC	B5OFF
// slot 34383
                    if slot <> 34383 or instruction <> 2931 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:65
//		TCF	DISPN5X
// slot 34384
                    if slot <> 34384 or instruction <> 5707 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5707, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34385 {
// R31.agc:66
//
// R31.agc:67
//V83CALL		CS	FLAGWRD7	# TEST AVERAGE G FLAG
// slot 34385
                if slot <> 34385 or instruction <> 16451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 67).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34386 {
// R31.agc:68
//		MASK	AVEGFBIT
// slot 34386
                    if slot <> 34386 or instruction <> 31207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        if fixedOperand = 16 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:69
//		EXTEND
// slot 34387
                    if slot <> 34387 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34390 {
            if slot <= 34388 {
// R31.agc:70
//		BZF	MUNG?		# ON - TEST MUNFLAG
// slot 34388
                if slot <> 34388 or instruction <> 5887 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5887, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34389 {
// R31.agc:71
//
// R31.agc:72
//		CS	FLAGWRD8
// slot 34389
                    if slot <> 34389 or instruction <> 16452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 68).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:73
//		MASK	SURFFBIT
// slot 34390
                    if slot <> 34390 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
            if slot <= 34391 {
// R31.agc:74
//		EXTEND
// slot 34391
                if slot <> 34391 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34392 {
// R31.agc:75
//		BZF	ONEBASE		# ON SURFACE - BYPASS LEMPREC
// slot 34392
                    if slot <> 34392 or instruction <> 5891 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5891, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:76
//
// R31.agc:77
//		TC	INTPRET		# EXTRAPOLATE BOTH STATE VECTORS
// slot 34393
                    if slot <> 34393 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2275] to agcAotUnit2275@.

agcAotInstallSourceRope(list(
// R31.agc:78
//		RTB
// slot 34394
    34394, 65336,
// R31.agc:79
//# Page 704
// R31.agc:80
//			LOADTIME
// slot 34395
    34395, 18166,
// R31.agc:81
//		STCALL	TDEC1
// slot 34396
    34396, 28738,
// R31.agc:82
//			LEMPREC		# PRECISION BASE VECTOR FOR LM
// slot 34397
    34397, 23646,
// R31.agc:83
//		VLOAD
// slot 34398
    34398, 65530,
// R31.agc:84
//			RATT1
// slot 34399
    34399, 30,
// R31.agc:85
//		STOVL	BASETHP
// slot 34400
    34400, 22768,
// R31.agc:86
//			VATT1
// slot 34401
    34401, 42,
// R31.agc:87
//		STODL	BASETHV
// slot 34402
    34402, 14474,
// R31.agc:88
//			TAT
// slot 34403
    34403, 26,
// R31.agc:89
//DOCMBASE	STORE	BASETIME	# PRECISION BASE VECTOR FOR CM
// slot 34404
    34404, 2200,
// R31.agc:90
//		STCALL	TDEC1
// slot 34405
    34405, 28738,
// R31.agc:91
//			CSMPREC
// slot 34406
    34406, 23622,
// R31.agc:92
//		VLOAD
// slot 34407
    34407, 65530,
// R31.agc:93
//			RATT1
// slot 34408
    34408, 30,
// R31.agc:94
//		STOVL	BASEOTP
// slot 34409
    34409, 22720,
// R31.agc:95
//			VATT1
// slot 34410
    34410, 42,
// R31.agc:96
//		STORE	BASEOTV
// slot 34411
    34411, 2208,
// R31.agc:97
//		EXIT
// slot 34412
    34412, 65532
)).

// bank 37, slots 34413-34421
function agcAotUnit2276 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34416 {
        if slot <= 34414 {
            if slot <= 34413 {
// R31.agc:98
//
// R31.agc:99
//REV83		CS	FLAGWRD7
// slot 34413
                if slot <> 34413 or instruction <> 16451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 67).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:100
//		MASK	AVEGFBIT
// slot 34414
                if slot <> 34414 or instruction <> 31207 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    if fixedOperand = 16 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34415 {
// R31.agc:101
//		EXTEND
// slot 34415
                if slot <> 34415 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:102
//		BZF	GETRVN		# IF AVEGFLAG SET, USE RN,VN
// slot 34416
                if slot <> 34416 or instruction <> 5846 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5846, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34418 {
            if slot <= 34417 {
// R31.agc:103
//
// R31.agc:104
//		CS	FLAGWRD8
// slot 34417
                if slot <> 34417 or instruction <> 16452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 68).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:105
//		MASK	SURFFBIT
// slot 34418
                if slot <> 34418 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 34419 {
// R31.agc:106
//		EXTEND
// slot 34419
                if slot <> 34419 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34420 {
// R31.agc:107
//		BZF	R31SURF		# IF ON SURFACE,USE LEMAREC
// slot 34420
                    if slot <> 34420 or instruction <> 5880 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5880, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:108
//
// R31.agc:109
//		TC	INTPRET		# DO CONIC EXTRAPOLATION FOR BOTH VEHICLES
// slot 34421
                    if slot <> 34421 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2276] to agcAotUnit2276@.

agcAotInstallSourceRope(list(
// R31.agc:110
//		RTB
// slot 34422
    34422, 65336,
// R31.agc:111
//			LOADTIME
// slot 34423
    34423, 18166,
// R31.agc:112
//		STCALL	TDEC1
// slot 34424
    34424, 28738,
// R31.agc:113
//			INTSTALL
// slot 34425
    34425, 24088,
// R31.agc:114
//		VLOAD	CLEAR
// slot 34426
    34426, 36090,
// R31.agc:115
//			BASETHP
// slot 34427
    34427, 2288,
// R31.agc:116
//			MOONFLAG
// slot 34428
    34428, 358,
// R31.agc:117
//		STOVL	RCV
// slot 34429
    34429, 22202,
// R31.agc:118
//			BASETHV
// slot 34430
    34430, 2186,
// R31.agc:119
//		STODL	VCV
// slot 34431
    34431, 14022,
// R31.agc:120
//			BASETIME
// slot 34432
    34432, 2200,
// R31.agc:121
//		BOF	SET		# GET APPROPRIATE MOONFLAG SETTING
// slot 34433
    34433, 35864,
// R31.agc:122
//			MOONTHIS
// slot 34434
    34434, 4552,
// R31.agc:123
//			+2
// slot 34435
    34435, 64778,
// R31.agc:124
//			MOONFLAG
// slot 34436
    34436, 102,
// R31.agc:125
//		SET
// slot 34437
    34437, 65304,
// R31.agc:126
//			INTYPFLG	# CONIC EXTRAP.
// slot 34438
    34438, 1654,
// R31.agc:127
//		STCALL	TET
// slot 34439
    34439, 30366,
// R31.agc:128
//			INTEGRVS	# INTEGRATION --- AT LAST---
// slot 34440
    34440, 23694,
// R31.agc:129
//OTHCONIC	VLOAD
// slot 34441
    34441, 65530,
// R31.agc:130
//# Page 705
// R31.agc:131
//			RATT
// slot 34442
    34442, 2,
// R31.agc:132
//		STOVL	RONE
// slot 34443
    34443, 22798,
// R31.agc:133
//			VATT
// slot 34444
    34444, 14,
// R31.agc:134
//		STCALL	VONE		# GET SET FOR CONIC EXTRAP.,OTHER.
// slot 34445
    34445, 31002,
// R31.agc:135
//			INTSTALL
// slot 34446
    34446, 24088,
// R31.agc:136
//		SET	DLOAD
// slot 34447
    34447, 58648,
// R31.agc:137
//			INTYPFLG
// slot 34448
    34448, 1654,
// R31.agc:138
//			TAT
// slot 34449
    34449, 26,
// R31.agc:139
//OTHINT		STORE	TDEC1
// slot 34450
    34450, 66,
// R31.agc:140
//		VLOAD	CLEAR
// slot 34451
    34451, 36090,
// R31.agc:141
//			BASEOTP
// slot 34452
    34452, 2240,
// R31.agc:142
//			MOONFLAG
// slot 34453
    34453, 358,
// R31.agc:143
//		STOVL	RCV
// slot 34454
    34454, 22202,
// R31.agc:144
//			BASEOTV
// slot 34455
    34455, 2208,
// R31.agc:145
//		STODL	VCV
// slot 34456
    34456, 14022,
// R31.agc:146
//			BASETIME
// slot 34457
    34457, 2200,
// R31.agc:147
//		BOF	SET
// slot 34458
    34458, 35864,
// R31.agc:148
//			MOONTHIS
// slot 34459
    34459, 4552,
// R31.agc:149
//			+2
// slot 34460
    34460, 64828,
// R31.agc:150
//			MOONFLAG
// slot 34461
    34461, 102,
// R31.agc:151
//		STCALL	TET
// slot 34462
    34462, 30366,
// R31.agc:152
//			INTEGRVS
// slot 34463
    34463, 23694,
// R31.agc:153
//COMPDISP	VLOAD	VSU
// slot 34464
    34464, 43514,
// R31.agc:154
//			RATT
// slot 34465
    34465, 2,
// R31.agc:155
//			RONE
// slot 34466
    34466, 2318,
// R31.agc:156
//		RTB	PDDL
// slot 34467
    34467, 54584,
// R31.agc:157
//			NORMUNX1	# UNIT(RANGE) TO PD 0-5
// slot 34468
    34468, 18344,
// R31.agc:158
//			36D
// slot 34469
    34469, 74,
// R31.agc:159
//		SL*			# RESCALE AFTER NORMUNIT
// slot 34470
    34470, 65374,
// R31.agc:160
//			0,1
// slot 34471
    34471, 16642,
// R31.agc:161
//		STOVL	RANGE		# SCALED 2(29)M
// slot 34472
    34472, 22786,
// R31.agc:162
//			VATT
// slot 34473
    34473, 14,
// R31.agc:163
//		VSU	DOT		# (VCM- VLM).UNIT(LOS). PD=0
// slot 34474
    34474, 41298,
// R31.agc:164
//			VONE
// slot 34475
    34475, 2330,
// R31.agc:165
//		SL1			# SCALED 2(7)M/CS
// slot 34476
    34476, 65492,
// R31.agc:166
//		STOVL	RRATE
// slot 34477
    34477, 22790,
// R31.agc:167
//			RONE
// slot 34478
    34478, 2318,
// R31.agc:168
//		UNIT	PDVL		# UNIT(R) TO PD 0-5
// slot 34479
    34479, 52572,
// R31.agc:169
//			UNITZ
// slot 34480
    34480, 6808,
// R31.agc:170
//		CALL
// slot 34481
    34481, 65320,
// R31.agc:171
//			CDU*NBSM
// slot 34482
    34482, 40802,
// R31.agc:172
//		VXM	PUSH		# UNIT (Z)/4 TO PD 6-11
// slot 34483
    34483, 34442,
// R31.agc:173
//			REFSMMAT
// slot 34484
    34484, 1976,
// R31.agc:174
//		VPROJ	VSL2		# UNIT(P)=UNIT(UZ -(UZ)PROJ(UR))
// slot 34485
    34485, 59954,
// R31.agc:175
//			0D
// slot 34486
    34486, 2,
// R31.agc:176
//		BVSU	UNIT
// slot 34487
    34487, 44618,
// R31.agc:177
//			6D
// slot 34488
    34488, 14,
// R31.agc:178
//		PDVL	VXV		# UNIT(P) TO PD 12-17
// slot 34489
    34489, 40346,
// R31.agc:179
//			0D		# UNIT(RL)
// slot 34490
    34490, 2,
// R31.agc:180
//			VONE
// slot 34491
    34491, 2330,
// R31.agc:181
//# Page 706
// R31.agc:182
//		VXV	DOT		# (UR * VL)*UR . U(P)
// slot 34492
    34492, 41274,
// R31.agc:183
//			0D
// slot 34493
    34493, 2,
// R31.agc:184
//			12D
// slot 34494
    34494, 26,
// R31.agc:185
//		PDVL			# SIGN TO 12-13 , LOAD U(P)
// slot 34495
    34495, 65434,
// R31.agc:186
//		DOT	SIGN
// slot 34496
    34496, 62786,
// R31.agc:187
//			6D
// slot 34497
    34497, 14,
// R31.agc:188
//			12D
// slot 34498
    34498, 26,
// R31.agc:189
//		SL2	ACOS		# ARCCOS(UP.UZ(SIGN))
// slot 34499
    34499, 54932,
// R31.agc:190
//		STOVL	RTHETA
// slot 34500
    34500, 22794,
// R31.agc:191
//			0D
// slot 34501
    34501, 2,
// R31.agc:192
//		DOT	BPL		# IF UR.UZ NEG,
// slot 34502
    34502, 42050,
// R31.agc:193
//			6D		#   RTHETA = 1 - RTHETA
// slot 34503
    34503, 14,
// R31.agc:194
//			+5
// slot 34504
    34504, 64922,
// R31.agc:195
//		DLOAD	DSU
// slot 34505
    34505, 38346,
// R31.agc:196
//			DPPOSMAX
// slot 34506
    34506, 6832,
// R31.agc:197
//			RTHETA
// slot 34507
    34507, 2314,
// R31.agc:198
//		STORE	RTHETA
// slot 34508
    34508, 2314,
// R31.agc:199
//		EXIT
// slot 34509
    34509, 65532
)).

// bank 37, slots 34510-34520
function agcAotUnit2277 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34514 {
        if slot <= 34511 {
            if slot <= 34510 {
// R31.agc:200
//
// R31.agc:201
//		CA	BIT5
// slot 34510
                if slot <> 34510 or instruction <> 14823 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:202
//		MASK	EXTVBACT
// slot 34511
                if slot <> 34511 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34512 {
// R31.agc:203
//		EXTEND			# IF ANSWERED,
// slot 34512
                if slot <> 34512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34513 {
// R31.agc:204
//		BZF	ENDEXT		#	 TERMINATE
// slot 34513
                    if slot <> 34513 or instruction <> 6970 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6970, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:205
//
// R31.agc:206
//		CS	EXTVBACT
// slot 34514
                    if slot <> 34514 or instruction <> 16932 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 548).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34517 {
            if slot <= 34515 {
// R31.agc:207
//		MASK	BIT12
// slot 34515
                if slot <> 34515 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34516 {
// R31.agc:208
//		ADS	EXTVBACT	# SET BIT 12
// slot 34516
                    if slot <> 34516 or instruction <> 11812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:209
//		TCF	REV83		# AND START AGAIN.
// slot 34517
                    if slot <> 34517 or instruction <> 5741 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5741, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34518 {
// R31.agc:210
//
// R31.agc:211
//GETRVN		CA	PRIO22		# INHIBIT SERVICER
// slot 34518
                if slot <> 34518 or instruction <> 16328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34519 {
// R31.agc:212
//		TC	PRIOCHNG
// slot 34519
                    if slot <> 34519 or instruction <> 2662 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2662, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:213
//		TC	INTPRET
// slot 34520
                    if slot <> 34520 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2277] to agcAotUnit2277@.

agcAotInstallSourceRope(list(
// R31.agc:214
//		VLOAD	SETPD
// slot 34521
    34521, 33274,
// R31.agc:215
//			RN		# LM STATE VECTOR IN RN,VN
// slot 34522
    34522, 1314,
// R31.agc:216
//			0
// slot 34523
    34523, 2,
// R31.agc:217
//		STOVL	RONE
// slot 34524
    34524, 22798,
// R31.agc:218
//			VN
// slot 34525
    34525, 1326,
// R31.agc:219
//		STOVL	VONE		# LOAD R(CSM),V(CSM) IN CASE MUNFLAG SET
// slot 34526
    34526, 22810,
// R31.agc:220
//			V(CSM)		# (TO INSURE TIME COMPATABILITY)
// slot 34527
    34527, 1964,
// R31.agc:221
//		PDVL	PDDL
// slot 34528
    34528, 54682,
// R31.agc:222
//			R(CSM)
// slot 34529
    34529, 1952,
// R31.agc:223
//			PIPTIME
// slot 34530
    34530, 1338,
// R31.agc:224
//		EXIT
// slot 34531
    34531, 65532
)).

// bank 37, slots 34532-34534
function agcAotUnit2278 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34532 {
// R31.agc:225
//		CA	PRIO3
// slot 34532
        if slot <> 34532 or instruction <> 14861 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34533 {
// R31.agc:226
//		TC	PRIOCHNG
// slot 34533
            if slot <> 34533 or instruction <> 2662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:227
//		TC	INTPRET
// slot 34534
            if slot <> 34534 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2278] to agcAotUnit2278@.

agcAotInstallSourceRope(list(
// R31.agc:228
//		BOFF	VLOAD
// slot 34535
    34535, 64792,
// R31.agc:229
//			MUNFLAG
// slot 34536
    34536, 3534,
// R31.agc:230
//			GETRVN2		# IF MUNFLAG RESET, DO CM DELTA PRECISION
// slot 34537
    34537, 64998,
// R31.agc:231
//# Page 707
// R31.agc:232
//		VXM	VSR4		# CHANGE TO REFERENCE SYSTEM AND RESCALE
// slot 34538
    34538, 49802,
// R31.agc:233
//			REFSMMAT
// slot 34539
    34539, 1976,
// R31.agc:234
//		PDVL			# R TO PD 0-5
// slot 34540
    34540, 65434,
// R31.agc:235
//		VXM	VSL1
// slot 34541
    34541, 64138,
// R31.agc:236
//			REFSMMAT
// slot 34542
    34542, 1976,
// R31.agc:237
//		PUSH	SETPD		# V TO PD 5-11
// slot 34543
    34543, 33036,
// R31.agc:238
//			0
// slot 34544
    34544, 2,
// R31.agc:239
//		GOTO
// slot 34545
    34545, 65360,
// R31.agc:240
//			COMPDISP
// slot 34546
    34546, 64832,
// R31.agc:241
//
// R31.agc:242
//GETRVN2		CALL
// slot 34547
    34547, 65320,
// R31.agc:243
//			INTSTALL
// slot 34548
    34548, 24088,
// R31.agc:244
//		CLEAR	GOTO
// slot 34549
    34549, 43032,
// R31.agc:245
//			INTYPFLG	# PREC EXTRAP FOR OTHER
// slot 34550
    34550, 1910,
// R31.agc:246
//			OTHINT
// slot 34551
    34551, 64804
)).

// bank 37, slots 34552-34552
function agcAotUnit2279 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R31.agc:247
//R31SURF		TC	INTPRET
// slot 34552
    if slot <> 34552 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2279] to agcAotUnit2279@.

agcAotInstallSourceRope(list(
// R31.agc:248
//		RTB			# LM IS ON SURFACE, SO PRECISION
// slot 34553
    34553, 65336,
// R31.agc:249
//			LOADTIME	# INTEGRATION USES PLANETARY INERTIAL
// slot 34554
    34554, 18166,
// R31.agc:250
//		STCALL	TDEC1		# ORIENTATION SUBROUTINE
// slot 34555
    34555, 28738,
// R31.agc:251
//			LEMPREC
// slot 34556
    34556, 23646,
// R31.agc:252
//		GOTO			# DO CSM CONIC
// slot 34557
    34557, 65360,
// R31.agc:253
//			OTHCONIC
// slot 34558
    34558, 64786
)).

// bank 37, slots 34559-34563
function agcAotUnit2280 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34560 {
        if slot <= 34559 {
// R31.agc:254
//MUNG?		CS	FLAGWRD6
// slot 34559
            if slot <> 34559 or instruction <> 16450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 66).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:255
//		MASK	MUNFLBIT
// slot 34560
            if slot <> 34560 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 34561 {
// R31.agc:256
//		EXTEND
// slot 34561
            if slot <> 34561 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34562 {
// R31.agc:257
//		BZF	GETRVN		# IF MUNFLAG SET, CSM BASE NOT NEEDED
// slot 34562
                if slot <> 34562 or instruction <> 5846 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5846, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:258
//
// R31.agc:259
//ONEBASE		TC	INTPRET		# GET CSM BASE VECTOR
// slot 34563
                if slot <> 34563 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2280] to agcAotUnit2280@.

agcAotInstallSourceRope(list(
// R31.agc:260
//		RTB	GOTO
// slot 34564
    34564, 43064,
// R31.agc:261
//			LOADTIME
// slot 34565
    34565, 18166,
// R31.agc:262
//			DOCMBASE
// slot 34566
    34566, 64712,
// R31.agc:263
//
// R31.agc:264
//V16N54		VN	1654
// slot 34567
    34567, 4204
)).

// no code for the lines below
// R31.agc:265
//
// R31.agc:266
//# Page 708 (empty page)
