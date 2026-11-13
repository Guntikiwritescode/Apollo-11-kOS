// KALMAN_FILTER.agc
// bank 16, slots 17313-17317
function agcAotUnit1026 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17314 {
        if slot <= 17313 {
// KALMAN_FILTER.agc:1
//# Copyright:	Public domain.
// KALMAN_FILTER.agc:2
//# Filename:	KALMAN_FILTER.agc
// KALMAN_FILTER.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// KALMAN_FILTER.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// KALMAN_FILTER.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// KALMAN_FILTER.agc:6
//# Assembler:	yaYUL
// KALMAN_FILTER.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// KALMAN_FILTER.agc:8
//# Website:	www.ibiblio.org/apollo.
// KALMAN_FILTER.agc:9
//# Pages:	1470-1471
// KALMAN_FILTER.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// KALMAN_FILTER.agc:11
//#				Luminary131 file, using page
// KALMAN_FILTER.agc:12
//#				images from Luminary 1A.
// KALMAN_FILTER.agc:13
//#
// KALMAN_FILTER.agc:14
//# This source code has been transcribed or otherwise adapted from
// KALMAN_FILTER.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// KALMAN_FILTER.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// KALMAN_FILTER.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// KALMAN_FILTER.agc:18
//# in storage size and consequent reduction in image quality as well) are
// KALMAN_FILTER.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// KALMAN_FILTER.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// KALMAN_FILTER.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// KALMAN_FILTER.agc:22
//# actually created.
// KALMAN_FILTER.agc:23
//#
// KALMAN_FILTER.agc:24
//# Notations on the hardcopy document read, in part:
// KALMAN_FILTER.agc:25
//#
// KALMAN_FILTER.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// KALMAN_FILTER.agc:27
//#	16:27 JULY 14, 1969
// KALMAN_FILTER.agc:28
//
// KALMAN_FILTER.agc:29
//# Page 1470
// KALMAN_FILTER.agc:30
//		EBANK=	NO.UJETS
// KALMAN_FILTER.agc:31
//		BANK	16
// KALMAN_FILTER.agc:32
//		SETLOC	DAPS1
// KALMAN_FILTER.agc:33
//		BANK
// KALMAN_FILTER.agc:34
//
// KALMAN_FILTER.agc:35
//		COUNT*	$$/DAP
// KALMAN_FILTER.agc:36
//
// KALMAN_FILTER.agc:37
//RATELOOP	CA	TWO
// slot 17313
            if slot <> 17313 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:38
//		TS	DAPTEMP6
// slot 17314
            if slot <> 17314 or instruction <> 23524 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23524, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17315 {
// KALMAN_FILTER.agc:39
//		DOUBLE
// slot 17315
            if slot <> 17315 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17316 {
// KALMAN_FILTER.agc:40
//		TS	Q
// slot 17316
                if slot <> 17316 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:41
//		INDEX	DAPTEMP6
// slot 17317
                if slot <> 17317 or instruction <> 21476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1026] to agcAotUnit1026@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:42
//		CCS	TJP
// slot 17318
    17318, 9896
)).

// bank 16, slots 17319-17324
function agcAotUnit1027 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17321 {
        if slot <= 17319 {
// KALMAN_FILTER.agc:43
//		TCF	+2
// slot 17319
            if slot <> 17319 or instruction <> 6057 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6057, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17320 {
// KALMAN_FILTER.agc:44
//		TCF	LOOPRATE
// slot 17320
                if slot <> 17320 or instruction <> 6072 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6072, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:45
//		AD	-100MST6
// slot 17321
                if slot <> 17321 or instruction <> 26585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2009), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17322 {
// KALMAN_FILTER.agc:46
//		EXTEND
// slot 17322
            if slot <> 17322 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17323 {
// KALMAN_FILTER.agc:47
//		BZMF	SMALLTJU
// slot 17323
                if slot <> 17323 or instruction <> 26567 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26567, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:48
//		INDEX	DAPTEMP6
// slot 17324
                if slot <> 17324 or instruction <> 21476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1027] to agcAotUnit1027@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:49
//		CCS	TJP
// slot 17325
    17325, 9896
)).

// bank 16, slots 17326-17329
function agcAotUnit1028 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17327 {
        if slot <= 17326 {
// KALMAN_FILTER.agc:50
//		CA	-100MST6
// slot 17326
            if slot <> 17326 or instruction <> 14297 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2009), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:51
//		TCF	+2
// slot 17327
            if slot <> 17327 or instruction <> 6065 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6065, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17328 {
// KALMAN_FILTER.agc:52
//		CS	-100MST6
// slot 17328
            if slot <> 17328 or instruction <> 18393 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2009), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:53
//		INDEX	DAPTEMP6
// slot 17329
            if slot <> 17329 or instruction <> 21476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1028] to agcAotUnit1028@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:54
//		ADS	TJP
// slot 17330
    17330, 24232
)).

// bank 16, slots 17331-17331
function agcAotUnit1029 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KALMAN_FILTER.agc:55
//		INDEX	DAPTEMP6
// slot 17331
    if slot <> 17331 or instruction <> 21476 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21476, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21476, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1029] to agcAotUnit1029@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:56
//		CCS	TJP
// slot 17332
    17332, 9896
)).

// bank 16, slots 17333-17337
function agcAotUnit1030 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17334 {
        if slot <= 17333 {
// KALMAN_FILTER.agc:57
//		CS	-100MS		# 0.1 AT 1
// slot 17333
            if slot <> 17333 or instruction <> 18317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1933), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:58
//		TCF	+2
// slot 17334
            if slot <> 17334 or instruction <> 6072 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6072, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17335 {
// KALMAN_FILTER.agc:59
//		CA	-100MS
// slot 17335
            if slot <> 17335 or instruction <> 14221 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1933), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17336 {
// KALMAN_FILTER.agc:60
//LOOPRATE	EXTEND
// slot 17336
                if slot <> 17336 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:61
//		INDEX	DAPTEMP6
// slot 17337
                if slot <> 17337 or instruction <> 21476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1030] to agcAotUnit1030@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:62
//		MP	NO.PJETS
// slot 17338
    17338, 59042
)).

// bank 16, slots 17339-17340
function agcAotUnit1031 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17339 {
// KALMAN_FILTER.agc:63
//		CA	L
// slot 17339
        if slot <> 17339 or instruction <> 12289 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// KALMAN_FILTER.agc:64
//		INDEX	DAPTEMP6
// slot 17340
        if slot <> 17340 or instruction <> 21476 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21476, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21476, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1031] to agcAotUnit1031@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:65
//		TS	DAPTEMP1	# SIGNED TORQUE AT 1 JET-SEC FOR FILTER
// slot 17341
    17341, 47038
)).

// bank 16, slots 17342-17346
function agcAotUnit1032 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17343 {
        if slot <= 17342 {
// KALMAN_FILTER.agc:66
//		EXTEND
// slot 17342
            if slot <> 17342 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:67
//		MP	BIT10		# RESCALE TO 32; ONE BIT ABOUT 2 JET-MSEC
// slot 17343
            if slot <> 17343 or instruction <> 31202 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17344 {
// KALMAN_FILTER.agc:68
//		EXTEND
// slot 17344
            if slot <> 17344 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17345 {
// KALMAN_FILTER.agc:69
//		BZMF	NEGTORK
// slot 17345
                if slot <> 17345 or instruction <> 26586 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26586, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:70
//STORTORK	INDEX	Q		# INCREMENT DOWNLIST REGISTER.
// slot 17346
                if slot <> 17346 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1032] to agcAotUnit1032@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:71
//		ADS	DOWNTORK	#   NOTE: NOT INITIALIZED; OVERFLOWS.
// slot 17347
    17347, 24214
)).

// bank 16, slots 17348-17352
function agcAotUnit1033 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17349 {
        if slot <= 17348 {
// KALMAN_FILTER.agc:72
//
// KALMAN_FILTER.agc:73
//		CCS	DAPTEMP6
// slot 17348
            if slot <> 17348 or instruction <> 5092 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 996).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:74
//		TCF	RATELOOP +1
// slot 17349
            if slot <> 17349 or instruction <> 6050 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6050, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17350 {
// KALMAN_FILTER.agc:75
//		TCF	ROTORQUE
// slot 17350
            if slot <> 17350 or instruction <> 6094 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6094, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17351 {
// KALMAN_FILTER.agc:76
//SMALLTJU	CA	ZERO
// slot 17351
                if slot <> 17351 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// KALMAN_FILTER.agc:77
//		INDEX	DAPTEMP6
// slot 17352
                if slot <> 17352 or instruction <> 21476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1033] to agcAotUnit1033@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:78
//		XCH	TJP
// slot 17353
    17353, 48808
)).

// bank 16, slots 17354-17368
function agcAotUnit1034 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17360 {
        if slot <= 17356 {
            if slot <= 17354 {
// KALMAN_FILTER.agc:79
//		EXTEND
// slot 17354
                if slot <> 17354 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17355 {
// KALMAN_FILTER.agc:80
//# Page 1471
// KALMAN_FILTER.agc:81
//		MP	ELEVEN		# 10.24 PLUS
// slot 17355
                    if slot <> 17355 or instruction <> 31216 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2544, readEffective:call(words, 2544)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:82
//		CA	L
// slot 17356
                    if slot <> 17356 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17358 {
                if slot <= 17357 {
// KALMAN_FILTER.agc:83
//		TCF	LOOPRATE
// slot 17357
                    if slot <> 17357 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:84
//ROTORQUE	CA	DAPTEMP2
// slot 17358
                    if slot <> 17358 or instruction <> 13280 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 992).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17359 {
// KALMAN_FILTER.agc:85
//		AD	DAPTEMP3
// slot 17359
                    if slot <> 17359 or instruction <> 25569 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 993).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:86
//		EXTEND
// slot 17360
                    if slot <> 17360 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17364 {
            if slot <= 17362 {
                if slot <= 17361 {
// KALMAN_FILTER.agc:87
//		MP	1JACCR
// slot 17361
                    if slot <> 17361 or instruction <> 29530 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 858, readEffective:call(words, 858)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:88
//		TS	JETRATER
// slot 17362
                    if slot <> 17362 or instruction <> 23527 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17363 {
// KALMAN_FILTER.agc:89
//		CS	DAPTEMP3
// slot 17363
                    if slot <> 17363 or instruction <> 17377 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 993).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:90
//		AD	DAPTEMP2
// slot 17364
                    if slot <> 17364 or instruction <> 25568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 992).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17366 {
                if slot <= 17365 {
// KALMAN_FILTER.agc:91
//		EXTEND
// slot 17365
                    if slot <> 17365 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:92
//		MP	1JACCQ
// slot 17366
                    if slot <> 17366 or instruction <> 29529 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 857, readEffective:call(words, 857)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17367 {
// KALMAN_FILTER.agc:93
//		TS	JETRATEQ
// slot 17367
                    if slot <> 17367 or instruction <> 23526 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23526, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALMAN_FILTER.agc:94
//		TCF	BACKP
// slot 17368
                    if slot <> 17368 or instruction <> 5326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5326, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1034] to agcAotUnit1034@.

agcAotInstallSourceRope(list(
// KALMAN_FILTER.agc:95
//-100MST6	DEC	-160
// slot 17369
    17369, 65214
)).

// bank 16, slots 17370-17372
function agcAotUnit1035 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17370 {
// KALMAN_FILTER.agc:96
//
// KALMAN_FILTER.agc:97
//NEGTORK		COM
// slot 17370
        if slot <> 17370 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17371 {
// KALMAN_FILTER.agc:98
//		INCR	Q
// slot 17371
            if slot <> 17371 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALMAN_FILTER.agc:99
//		TCF	STORTORK
// slot 17372
            if slot <> 17372 or instruction <> 6082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1035] to agcAotUnit1035@.

// no code for the lines below
// KALMAN_FILTER.agc:100
//
// KALMAN_FILTER.agc:101
//
