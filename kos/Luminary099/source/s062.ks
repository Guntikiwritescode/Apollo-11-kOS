// POWERED_FLIGHT_SUBROUTINES.agc
agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:1
//# Copyright:	Public domain.
// POWERED_FLIGHT_SUBROUTINES.agc:2
//# Filename:	POWERED_FLIGHT_SUBROUTINES.agc
// POWERED_FLIGHT_SUBROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// POWERED_FLIGHT_SUBROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// POWERED_FLIGHT_SUBROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// POWERED_FLIGHT_SUBROUTINES.agc:6
//# Assembler:	yaYUL
// POWERED_FLIGHT_SUBROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// POWERED_FLIGHT_SUBROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// POWERED_FLIGHT_SUBROUTINES.agc:9
//# Pages:	1259-1267
// POWERED_FLIGHT_SUBROUTINES.agc:10
//# Mod history:	2009-05-26 RSB	Adapted from the corresponding
// POWERED_FLIGHT_SUBROUTINES.agc:11
//#				Luminary131 file, using page
// POWERED_FLIGHT_SUBROUTINES.agc:12
//#				images from Luminary 1A.
// POWERED_FLIGHT_SUBROUTINES.agc:13
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// POWERED_FLIGHT_SUBROUTINES.agc:14
//#
// POWERED_FLIGHT_SUBROUTINES.agc:15
//# This source code has been transcribed or otherwise adapted from
// POWERED_FLIGHT_SUBROUTINES.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// POWERED_FLIGHT_SUBROUTINES.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// POWERED_FLIGHT_SUBROUTINES.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// POWERED_FLIGHT_SUBROUTINES.agc:19
//# in storage size and consequent reduction in image quality as well) are
// POWERED_FLIGHT_SUBROUTINES.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// POWERED_FLIGHT_SUBROUTINES.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// POWERED_FLIGHT_SUBROUTINES.agc:22
//# about getting access to the (much) higher-quality images which Paul
// POWERED_FLIGHT_SUBROUTINES.agc:23
//# actually created.
// POWERED_FLIGHT_SUBROUTINES.agc:24
//#
// POWERED_FLIGHT_SUBROUTINES.agc:25
//# Notations on the hardcopy document read, in part:
// POWERED_FLIGHT_SUBROUTINES.agc:26
//#
// POWERED_FLIGHT_SUBROUTINES.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// POWERED_FLIGHT_SUBROUTINES.agc:28
//#	16:27 JULY 14, 1969
// POWERED_FLIGHT_SUBROUTINES.agc:29
//
// POWERED_FLIGHT_SUBROUTINES.agc:30
//# Page 1259
// POWERED_FLIGHT_SUBROUTINES.agc:31
//		BANK	14		# SAME FBANK AS THE FINDCDUD SUB-PROGRAM
// POWERED_FLIGHT_SUBROUTINES.agc:32
//		SETLOC	POWFLITE
// POWERED_FLIGHT_SUBROUTINES.agc:33
//		BANK
// POWERED_FLIGHT_SUBROUTINES.agc:34
//
// POWERED_FLIGHT_SUBROUTINES.agc:35
//		EBANK=	DEXDEX
// POWERED_FLIGHT_SUBROUTINES.agc:36
//		COUNT*	$$/POWFL
// POWERED_FLIGHT_SUBROUTINES.agc:37
//
// POWERED_FLIGHT_SUBROUTINES.agc:38
//# CDUTRIG, CDUTRIG1, CDUTRIG2, AND CD*TR*GS ALL COMPUTE THE SINES AND
// POWERED_FLIGHT_SUBROUTINES.agc:39
//# COSINES OF THREE 2'S COMPLEMENT ANGLES AND PLACE THE RESULT, DOUBLE
// POWERED_FLIGHT_SUBROUTINES.agc:40
//# PRECISION, IN THE SAME ORDER AS THE INPUTS, AT SINCDU AND COSCDU.  AN
// POWERED_FLIGHT_SUBROUTINES.agc:41
//# ADDITIONAL OUTPUT IS THE 1'S COMPLEMENT ANGLES AT CDUSPOT.  THESE
// POWERED_FLIGHT_SUBROUTINES.agc:42
//# ROUTINES GO OUT OF THEIR WAY TO LEAVE THE MPAC AREA AS THEY FIND IT.
// POWERED_FLIGHT_SUBROUTINES.agc:43
//# EXCEPT FOR THE GENERALLY UNIMPORTANT MPAC +2.  THEY DIFFER ONLY IN
// POWERED_FLIGHT_SUBROUTINES.agc:44
//# WHERE THEY GET THE ANGLES, AND IN METHOD OF CALLING.
// POWERED_FLIGHT_SUBROUTINES.agc:45
//#
// POWERED_FLIGHT_SUBROUTINES.agc:46
//# CDUTRIG (AND CDUTRIG1, WHICH CAN BE CALLED IN BASIC) COMPUTE THE
// POWERED_FLIGHT_SUBROUTINES.agc:47
//# SINES AND COSINES FROM THE CURRENT CONTENTS OF THE CDU REGISTERS.
// POWERED_FLIGHT_SUBROUTINES.agc:48
//# THE CONTENTS OF CDUTEMP, ETC., ARE NOT TOUCHED SO THAT THEY MAY
// POWERED_FLIGHT_SUBROUTINES.agc:49
//# CONTINUE TO FORM A CONSISTENT SET WITH THE LATEST PIPA READINGS.
// POWERED_FLIGHT_SUBROUTINES.agc:50
//#
// POWERED_FLIGHT_SUBROUTINES.agc:51
//# CDUTRIG1 IS LIKE CDUTRIG EXCEPT THAT IT CAN BE CALLED IN BASIC.
// POWERED_FLIGHT_SUBROUTINES.agc:52
//#
// POWERED_FLIGHT_SUBROUTINES.agc:53
//# CD*TR*GS FINDS CDU VALUES IN CDUSPOT RATHER THAN IN CDUTEMP.  THIS
// POWERED_FLIGHT_SUBROUTINES.agc:54
//# ALLOWS USERS TO MAKE TRANSFORMATIONS USING ARBITRARY ANGLES, OR REAL
// POWERED_FLIGHT_SUBROUTINES.agc:55
//# ANGLES IN AN ORDER OTHER THAN X Y Z.  A CALL TO THIS ROUTINE IS
// POWERED_FLIGHT_SUBROUTINES.agc:56
//# NECESSARY IN PREPARATION FOR A CALL TO AX*SR*T IN EITHER OF ITS TWO
// POWERED_FLIGHT_SUBROUTINES.agc:57
//# MODES (SMNB OR NBSM).  SINCE AX*SR*T EXPECTS TO FIND THE SINES AND
// POWERED_FLIGHT_SUBROUTINES.agc:58
//# COSINES IN THE ORDER Y Z X THE ANGLES MUST HAVE BEEN PLACED IN CDUSPOT
// POWERED_FLIGHT_SUBROUTINES.agc:59
//# IN THIS ORDER.  CD*TR*GS NEED NOT BE REPEATED WHEN AX*SR*T IS CALLED
// POWERED_FLIGHT_SUBROUTINES.agc:60
//# MORE THAN ONCE, PROVIDED THE ANGLES HAVE NOT CHANGED.  NOTE THAT SINCE
// POWERED_FLIGHT_SUBROUTINES.agc:61
//# IT CLOBBERS BUF2 (IN THE SINE AND COSINE ROUTINES) CD*TR*GS CANNOT BE
// POWERED_FLIGHT_SUBROUTINES.agc:62
//# CALLED USING BANKCALL.  SORRY.
// POWERED_FLIGHT_SUBROUTINES.agc:63
//#
// POWERED_FLIGHT_SUBROUTINES.agc:64
//# CD*TR*G IS LIKE CD*TR*GS EXCEPT THAT IT CAN BE CALLED IN
// POWERED_FLIGHT_SUBROUTINES.agc:65
//# INTERPRETIVE.
// POWERED_FLIGHT_SUBROUTINES.agc:66
//
// POWERED_FLIGHT_SUBROUTINES.agc:67
//CDUTRIG		EXIT
// slot 22367
    22367, 65532
)).

// bank 23, slots 22368-22369
function agcAotUnit1369 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22368 {
// POWERED_FLIGHT_SUBROUTINES.agc:68
//		TC	CDUTRIGS
// slot 22368
        if slot <> 22368 or instruction <> 1895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1895, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:69
//		TC	INTPRET
// slot 22369
        if slot <> 22369 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1369] to agcAotUnit1369@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:70
//		RVQ
// slot 22370
    22370, 65308,
// POWERED_FLIGHT_SUBROUTINES.agc:71
//
// POWERED_FLIGHT_SUBROUTINES.agc:72
//CD*TR*G		EXIT
// slot 22371
    22371, 65532
)).

// bank 23, slots 22372-22373
function agcAotUnit1370 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22372 {
// POWERED_FLIGHT_SUBROUTINES.agc:73
//		TC	CD*TR*GS
// slot 22372
        if slot <> 22372 or instruction <> 1901 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1901, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:74
//		TC	INTPRET
// slot 22373
        if slot <> 22373 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1370] to agcAotUnit1370@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:75
//		RVQ
// slot 22374
    22374, 65308
)).

// bank 23, slots 22375-22386
function agcAotUnit1371 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22380 {
        if slot <= 22377 {
            if slot <= 22375 {
// POWERED_FLIGHT_SUBROUTINES.agc:76
//
// POWERED_FLIGHT_SUBROUTINES.agc:77
//CDUTRIGS	CA	CDUX
// slot 22375
                if slot <> 22375 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22376 {
// POWERED_FLIGHT_SUBROUTINES.agc:78
//		TS	CDUSPOT +4
// slot 22376
                    if slot <> 22376 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:79
//		CA	CDUY
// slot 22377
                    if slot <> 22377 or instruction <> 12315 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 27).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22378 {
// POWERED_FLIGHT_SUBROUTINES.agc:80
//		TS	CDUSPOT
// slot 22378
                if slot <> 22378 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22379 {
// POWERED_FLIGHT_SUBROUTINES.agc:81
//# Page 1260
// POWERED_FLIGHT_SUBROUTINES.agc:82
//		CA	CDUZ
// slot 22379
                    if slot <> 22379 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:83
//		TS	CDUSPOT +2
// slot 22380
                    if slot <> 22380 or instruction <> 23032 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23032, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22383 {
            if slot <= 22381 {
// POWERED_FLIGHT_SUBROUTINES.agc:84
//
// POWERED_FLIGHT_SUBROUTINES.agc:85
//CD*TR*GS	EXTEND
// slot 22381
                if slot <> 22381 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22382 {
// POWERED_FLIGHT_SUBROUTINES.agc:86
//		QXCH	TEM2
// slot 22382
                    if slot <> 22382 or instruction <> 9314 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 98, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:87
//		CAF	FOUR
// slot 22383
                    if slot <> 22383 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22384 {
// POWERED_FLIGHT_SUBROUTINES.agc:88
//TR*GL**P	MASK	SIX		# MAKE IT EVEN AND SMALLER
// slot 22384
                if slot <> 22384 or instruction <> 31906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    if fixedOperand = 6 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22385 {
// POWERED_FLIGHT_SUBROUTINES.agc:89
//		TS	TEM3
// slot 22385
                    if slot <> 22385 or instruction <> 22627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:90
//		INDEX	TEM3
// slot 22386
                    if slot <> 22386 or instruction <> 20579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20579, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1371] to agcAotUnit1371@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:91
//		CA	CDUSPOT
// slot 22387
    22387, 25580
)).

// bank 23, slots 22388-22390
function agcAotUnit1372 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22388 {
// POWERED_FLIGHT_SUBROUTINES.agc:92
//		DXCH	MPAC		# STORING 2'S COMP ANGLE, LOADING MPAC
// slot 22388
        if slot <> 22388 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22389 {
// POWERED_FLIGHT_SUBROUTINES.agc:93
//		DXCH	VBUF 	+4	# STORING MPAC FOR LATER RESTORATION
// slot 22389
            if slot <> 22389 or instruction <> 21591 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:94
//		TC	USPRCADR
// slot 22390
            if slot <> 22390 or instruction <> 2507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1372] to agcAotUnit1372@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:95
//		CADR	CDULOGIC
// slot 22391
    22391, 18172
)).

// bank 23, slots 22392-22394
function agcAotUnit1373 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22392 {
// POWERED_FLIGHT_SUBROUTINES.agc:96
//		EXTEND
// slot 22392
        if slot <> 22392 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22393 {
// POWERED_FLIGHT_SUBROUTINES.agc:97
//		DCA	MPAC
// slot 22393
            if slot <> 22393 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:98
//		INDEX	TEM3
// slot 22394
            if slot <> 22394 or instruction <> 20579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20579, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1373] to agcAotUnit1373@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:99
//		DXCH	CDUSPOT		# STORING 1'S COMPLEMENT ANGLE
// slot 22395
    22395, 44014
)).

// bank 23, slots 22396-22396
function agcAotUnit1374 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:100
//		TC	USPRCADR
// slot 22396
    if slot <> 22396 or instruction <> 2507 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2507, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1374] to agcAotUnit1374@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:101
//		CADR	COSINE
// slot 22397
    22397, 1694
)).

// bank 23, slots 22398-22399
function agcAotUnit1375 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22398 {
// POWERED_FLIGHT_SUBROUTINES.agc:102
//		DXCH	MPAC
// slot 22398
        if slot <> 22398 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:103
//		INDEX	TEM3
// slot 22399
        if slot <> 22399 or instruction <> 20579 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20579, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20579, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1375] to agcAotUnit1375@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:104
//		DXCH	COSCDU		# STORING COSINE
// slot 22400
    22400, 43978
)).

// bank 23, slots 22401-22402
function agcAotUnit1376 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22401 {
// POWERED_FLIGHT_SUBROUTINES.agc:105
//		EXTEND
// slot 22401
        if slot <> 22401 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:106
//		INDEX	TEM3
// slot 22402
        if slot <> 22402 or instruction <> 20579 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20579, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20579, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1376] to agcAotUnit1376@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:107
//		DCA	CDUSPOT		# LOADING 1'S COMPLEMENT ANGLE
// slot 22403
    22403, 25582
)).

// bank 23, slots 22404-22404
function agcAotUnit1377 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:108
//		TC	USPRCADR
// slot 22404
    if slot <> 22404 or instruction <> 2507 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2507, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1377] to agcAotUnit1377@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:109
//		CADR	SINE 	+1	# SINE +1 EXPECTS ARGUMENT IN A AND L
// slot 22405
    22405, 1714
)).

// bank 23, slots 22406-22408
function agcAotUnit1378 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22406 {
// POWERED_FLIGHT_SUBROUTINES.agc:110
//		DXCH	VBUF 	+4	# BRINGING UP PRIOR MPAC TO BE RESTORED
// slot 22406
        if slot <> 22406 or instruction <> 21591 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22407 {
// POWERED_FLIGHT_SUBROUTINES.agc:111
//		DXCH	MPAC
// slot 22407
            if slot <> 22407 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:112
//		INDEX	TEM3
// slot 22408
            if slot <> 22408 or instruction <> 20579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20579, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1378] to agcAotUnit1378@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:113
//		DXCH	SINCDU
// slot 22409
    22409, 43966
)).

// bank 23, slots 22410-22419
function agcAotUnit1379 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22414 {
        if slot <= 22411 {
            if slot <= 22410 {
// POWERED_FLIGHT_SUBROUTINES.agc:114
//		CCS	TEM3
// slot 22410
                if slot <> 22410 or instruction <> 4195 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 99).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:115
//		TCF	TR*GL**P
// slot 22411
                if slot <> 22411 or instruction <> 6000 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6000, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22412 {
// POWERED_FLIGHT_SUBROUTINES.agc:116
//		TC	TEM2
// slot 22412
                if slot <> 22412 or instruction <> 98 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 98, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22413 {
// POWERED_FLIGHT_SUBROUTINES.agc:117
//# Page 1261
// POWERED_FLIGHT_SUBROUTINES.agc:118
//# *******************************************************************************************************
// POWERED_FLIGHT_SUBROUTINES.agc:119
//# QUICTRIG, INTENDED FOR QUIDANCE CYCLE USE WHERE TIME IS CRITICAL, IS A MUCH FASTER VERSION OF CD*TR*GS.
// POWERED_FLIGHT_SUBROUTINES.agc:120
//# QUICTRIG COMPUTES AND STORES THE SINES AND COSINES OF THE 2'S COMPLEMENT ANGLES AT CDUSPOT, CDUSPOT +2,
// POWERED_FLIGHT_SUBROUTINES.agc:121
//# AND CDUSPOT +4.  UNLIKE CD*TR*GS, QUICTRIG DOES NOT LEAVE THE 1'S COMPLEMENT VERSIONS OF THE ANGLES IN
// POWERED_FLIGHT_SUBROUTINES.agc:122
//# CDUSPOT.  QUICTRIG'S EXECUTION TIME IS 4.1 MS;  THIS IS 10 TIMES AS FAST AS CD*TR*GS.  QUICTRIG MAY BE
// POWERED_FLIGHT_SUBROUTINES.agc:123
//# CALLED FROM INTERPRETIVE AS AN RTB OP-CODE, OR FROM BASIC VIA BANKCALL OR IBNKCALL.
// POWERED_FLIGHT_SUBROUTINES.agc:124
//
// POWERED_FLIGHT_SUBROUTINES.agc:125
//QUICTRIG	INHINT			# INHINT SINCE DAP USES THE SAME TEMPS
// slot 22413
                    if slot <> 22413 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:126
//		EXTEND
// slot 22414
                    if slot <> 22414 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22416 {
            if slot <= 22415 {
// POWERED_FLIGHT_SUBROUTINES.agc:127
//		QXCH	ITEMP1
// slot 22415
                if slot <> 22415 or instruction <> 9265 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 49, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:128
//		CAF	FOUR
// slot 22416
                if slot <> 22416 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22417 {
// POWERED_FLIGHT_SUBROUTINES.agc:129
// +4		MASK	SIX
// slot 22417
                if slot <> 22417 or instruction <> 31906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    if fixedOperand = 6 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22418 {
// POWERED_FLIGHT_SUBROUTINES.agc:130
//		TS	ITEMP2
// slot 22418
                    if slot <> 22418 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:131
//		INDEX	ITEMP2
// slot 22419
                    if slot <> 22419 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1379] to agcAotUnit1379@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:132
//		CA	CDUSPOT
// slot 22420
    22420, 25580
)).

// bank 23, slots 22421-22424
function agcAotUnit1380 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22422 {
        if slot <= 22421 {
// POWERED_FLIGHT_SUBROUTINES.agc:133
//		TC	SPSIN
// slot 22421
            if slot <> 22421 or instruction <> 2587 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2587, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:134
//		EXTEND
// slot 22422
            if slot <> 22422 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22423 {
// POWERED_FLIGHT_SUBROUTINES.agc:135
//		MP	BIT14		# SCALE DOWN TO MATCH INTERPRETER OUTPUTS
// slot 22423
            if slot <> 22423 or instruction <> 31198 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:136
//		INDEX	ITEMP2
// slot 22424
            if slot <> 22424 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1380] to agcAotUnit1380@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:137
//		DXCH	SINCDU
// slot 22425
    22425, 43966
)).

// bank 23, slots 22426-22426
function agcAotUnit1381 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:138
//		INDEX	ITEMP2
// slot 22426
    if slot <> 22426 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1381] to agcAotUnit1381@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:139
//		CA	CDUSPOT
// slot 22427
    22427, 25580
)).

// bank 23, slots 22428-22431
function agcAotUnit1382 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22429 {
        if slot <= 22428 {
// POWERED_FLIGHT_SUBROUTINES.agc:140
//		TC	SPCOS
// slot 22428
            if slot <> 22428 or instruction <> 2586 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2586, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:141
//		EXTEND
// slot 22429
            if slot <> 22429 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22430 {
// POWERED_FLIGHT_SUBROUTINES.agc:142
//		MP	BIT14
// slot 22430
            if slot <> 22430 or instruction <> 31198 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:143
//		INDEX	ITEMP2
// slot 22431
            if slot <> 22431 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1382] to agcAotUnit1382@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:144
//		DXCH	COSCDU
// slot 22432
    22432, 43978
)).

// bank 23, slots 22433-22437
function agcAotUnit1383 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22434 {
        if slot <= 22433 {
// POWERED_FLIGHT_SUBROUTINES.agc:145
//		CCS	ITEMP2
// slot 22433
            if slot <> 22433 or instruction <> 4146 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:146
//		TCF	QUICTRIG +4
// slot 22434
            if slot <> 22434 or instruction <> 6033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6033, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22435 {
// POWERED_FLIGHT_SUBROUTINES.agc:147
//		CA	ITEMP1
// slot 22435
            if slot <> 22435 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22436 {
// POWERED_FLIGHT_SUBROUTINES.agc:148
//		RELINT
// slot 22436
                if slot <> 22436 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:149
//		TC	A
// slot 22437
                if slot <> 22437 or instruction <> 0 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 0, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1383] to agcAotUnit1383@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:150
//
// POWERED_FLIGHT_SUBROUTINES.agc:151
//# Page 1262
// POWERED_FLIGHT_SUBROUTINES.agc:152
//#****************************************************************************
// POWERED_FLIGHT_SUBROUTINES.agc:153
//# THESE INTERFACE ROUTINES MAKE IT POSSIBLE TO CALL AX*SR*T, ETC., IN
// POWERED_FLIGHT_SUBROUTINES.agc:154
//# INTERPRETIVE.  LATER, WHERE POSSIBLE, THEY WILL BE ELIMINATED.
// POWERED_FLIGHT_SUBROUTINES.agc:155
//#
// POWERED_FLIGHT_SUBROUTINES.agc:156
//# THESE INTERFACE ROUTINES ARE PERMANENT.  ALL RESTORE USER'S EBANK
// POWERED_FLIGHT_SUBROUTINES.agc:157
//# SETTING. ALL ARE STRICT INTERPRETIVE SUBROUTINES, CALLED USING "CALL",
// POWERED_FLIGHT_SUBROUTINES.agc:158
//# RETURNING VIA QPRET.  ALL EXPECT AND RETURN THE VECTOR TO BE TRANSFORMED
// POWERED_FLIGHT_SUBROUTINES.agc:159
//# INTERPRETER-STYLE IN MPAC; COMPONENTS AT MPAC, MPAC +3, AND MPAC +5.
// POWERED_FLIGHT_SUBROUTINES.agc:160
//#
// POWERED_FLIGHT_SUBROUTINES.agc:161
//# TRG*SMNB AND TRG*NBSM BOTH EXPECT TO SEE THE 2'S COMPLEMENT ANGLES
// POWERED_FLIGHT_SUBROUTINES.agc:162
//# AT CDUSPOT (ORDER Y Z X, AT CDUSPOT, CDUSPOT +2, AND CDUSPOT +4; ODD
// POWERED_FLIGHT_SUBROUTINES.agc:163
//# LOCATIONS NEED NOT BE ZEROED).  TRG*NBSM DOES THE NB TO SM TRANSFORMATION;
// POWERED_FLIGHT_SUBROUTINES.agc:164
//# TRG*SMNB, VICE VERSA.
// POWERED_FLIGHT_SUBROUTINES.agc:165
//#
// POWERED_FLIGHT_SUBROUTINES.agc:166
//# CDU*NBSM DOES ITS TRANSFORMATION USING THE PRESENT CONTENTS OF
// POWERED_FLIGHT_SUBROUTINES.agc:167
//# THE CDL COUNTERS.  OTHERWISE IT IS LIKE TRG*NBSM.
// POWERED_FLIGHT_SUBROUTINES.agc:168
//#
// POWERED_FLIGHT_SUBROUTINES.agc:169
//# CDU*SMNB IS THE COMPLEMENT OF CDU*NBSM.
// POWERED_FLIGHT_SUBROUTINES.agc:170
//
// POWERED_FLIGHT_SUBROUTINES.agc:171
//CDU*SMNB	EXIT
// slot 22438
    22438, 65532
)).

// bank 23, slots 22439-22440
function agcAotUnit1384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22439 {
// POWERED_FLIGHT_SUBROUTINES.agc:172
//		TC	CDUTRIGS
// slot 22439
        if slot <> 22439 or instruction <> 1895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1895, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:173
//		TCF	C*MM*N1
// slot 22440
        if slot <> 22440 or instruction <> 6059 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6059, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1384] to agcAotUnit1384@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:174
//
// POWERED_FLIGHT_SUBROUTINES.agc:175
//TRG*SMNB	EXIT
// slot 22441
    22441, 65532
)).

// bank 23, slots 22442-22446
function agcAotUnit1385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22443 {
        if slot <= 22442 {
// POWERED_FLIGHT_SUBROUTINES.agc:176
//		TC	CD*TR*GS
// slot 22442
            if slot <> 22442 or instruction <> 1901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1901, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:177
//C*MM*N1		TC	MPACVBUF	# AX*SR*T EXPECTS VECTOR IN VBUF
// slot 22443
            if slot <> 22443 or instruction <> 3930 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3930, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22444 {
// POWERED_FLIGHT_SUBROUTINES.agc:178
//		CS	THREE		# SIGNAL FOR SM TO NB TRANSFORMATION.
// slot 22444
            if slot <> 22444 or instruction <> 19621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22445 {
// POWERED_FLIGHT_SUBROUTINES.agc:179
//C*MM*N2		TC	AX*SR*T
// slot 22445
                if slot <> 22445 or instruction <> 1981 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1981, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:180
//		TC	INTPRET
// slot 22446
                if slot <> 22446 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1385] to agcAotUnit1385@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:181
//		VLOAD	RVQ
// slot 22447
    22447, 36602,
// POWERED_FLIGHT_SUBROUTINES.agc:182
//			VBUF
// slot 22448
    22448, 166,
// POWERED_FLIGHT_SUBROUTINES.agc:183
//
// POWERED_FLIGHT_SUBROUTINES.agc:184
//CDU*NBSM	EXIT
// slot 22449
    22449, 65532
)).

// bank 23, slots 22450-22451
function agcAotUnit1386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22450 {
// POWERED_FLIGHT_SUBROUTINES.agc:185
//		TC	CDUTRIGS
// slot 22450
        if slot <> 22450 or instruction <> 1895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1895, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:186
//		TCF	C*MM*N3
// slot 22451
        if slot <> 22451 or instruction <> 6070 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6070, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1386] to agcAotUnit1386@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:187
//
// POWERED_FLIGHT_SUBROUTINES.agc:188
//TRG*NBSM	EXIT
// slot 22452
    22452, 65532
)).

// bank 23, slots 22453-22456
function agcAotUnit1387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22454 {
        if slot <= 22453 {
// POWERED_FLIGHT_SUBROUTINES.agc:189
//		TC	CD*TR*GS
// slot 22453
            if slot <> 22453 or instruction <> 1901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1901, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:190
//C*MM*N3		TC	MPACVBUF	# FOR AX*SR*T
// slot 22454
            if slot <> 22454 or instruction <> 3930 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3930, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22455 {
// POWERED_FLIGHT_SUBROUTINES.agc:191
//		CA	THREE		# SIGNAL FOR NB TO SM TRANSFORMATION
// slot 22455
            if slot <> 22455 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:192
//		TCF	C*MM*N2
// slot 22456
            if slot <> 22456 or instruction <> 6061 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6061, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1387] to agcAotUnit1387@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:193
//
// POWERED_FLIGHT_SUBROUTINES.agc:194
//# *NBSM* AND *SMNB* EXPECT TO SEE THE SINES AND COSINES (AT SINCDU
// POWERED_FLIGHT_SUBROUTINES.agc:195
//# AND COSCDU) RATHER THAN THE ANGLES THEMSELVES.  OTHERWISE THEY ARE
// POWERED_FLIGHT_SUBROUTINES.agc:196
//# LIKE TRG*NBSM AND TRG*SMNB.
// POWERED_FLIGHT_SUBROUTINES.agc:197
//#
// POWERED_FLIGHT_SUBROUTINES.agc:198
//# NOTE THAT JUST AS CD*TR*GS NEED BE CALLED ONLY ONCE FOR EACH SERIES
// POWERED_FLIGHT_SUBROUTINES.agc:199
//# OF TRANSFORMATIONS USING THE SAME ANGLES, SO TOO ONLY ONE OF TRG*NBSM
// POWERED_FLIGHT_SUBROUTINES.agc:200
//# Page 1263
// POWERED_FLIGHT_SUBROUTINES.agc:201
//# AND TRG*SMNB NEED BE CALLED FOR EACH SERIES.  FOR SUBSEQUENT TRANFOR-
// POWERED_FLIGHT_SUBROUTINES.agc:202
//# MATIONS USE *NBSM* AND *SMNB*.
// POWERED_FLIGHT_SUBROUTINES.agc:203
//
// POWERED_FLIGHT_SUBROUTINES.agc:204
//*SMNB*		EXIT
// slot 22457
    22457, 65532
)).

// bank 23, slots 22458-22458
function agcAotUnit1388 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:205
//		TCF	C*MM*N1
// slot 22458
    if slot <> 22458 or instruction <> 6059 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6059, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1388] to agcAotUnit1388@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:206
//
// POWERED_FLIGHT_SUBROUTINES.agc:207
//*NBSM*		EXIT
// slot 22459
    22459, 65532
)).

// bank 23, slots 22460-22468
function agcAotUnit1389 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22463 {
        if slot <= 22461 {
            if slot <= 22460 {
// POWERED_FLIGHT_SUBROUTINES.agc:208
//		TCF	C*MM*N3
// slot 22460
                if slot <> 22460 or instruction <> 6070 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6070, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:209
//
// POWERED_FLIGHT_SUBROUTINES.agc:210
//# AX*SR*T COMBINES THE OLD SMNB AND NBSM.  FOR THE NB TO SM
// POWERED_FLIGHT_SUBROUTINES.agc:211
//# TRANSFORMATION, ENTER WITH +3 IN A.  FOR SM TO NB, ENTER WITH -3.
// POWERED_FLIGHT_SUBROUTINES.agc:212
//# THE VECTOR TO BE TRANSFORMED ARRIVES, AND IS RETURNED, IN VBUF.
// POWERED_FLIGHT_SUBROUTINES.agc:213
//# AX*SR*T EXPECTS TO FIND THE SINES AND COSINES OF THE ANGLES OF ROTATION
// POWERED_FLIGHT_SUBROUTINES.agc:214
//# AT SINCDU AND COSCDU, IN THE ORDER Y Z X.  A CALL TO CD*TR*GS, WITH
// POWERED_FLIGHT_SUBROUTINES.agc:215
//# THE 2'S COMPLEMENT ANGLES (ORDER Y Z X) AT CDUSPOT, WILL TAKE CARE OF
// POWERED_FLIGHT_SUBROUTINES.agc:216
//# THIS.  HERE IS A SAMPLE CALLING SEQUENCE:--
// POWERED_FLIGHT_SUBROUTINES.agc:217
//#		TC	CDUTRIGS
// POWERED_FLIGHT_SUBROUTINES.agc:218
//#		CS	THREE		# ("CA THREE" FOR NBSM)
// POWERED_FLIGHT_SUBROUTINES.agc:219
//#		TC	AX*SR*T
// POWERED_FLIGHT_SUBROUTINES.agc:220
//# THE CALL TO CD*TR*GS NEED NOT BE REPEATED, WHEN AX*SR*T IS CALLED MORE
// POWERED_FLIGHT_SUBROUTINES.agc:221
//# THAN ONCE, UNLESS THE ANGLES HAVE CHANGED.
// POWERED_FLIGHT_SUBROUTINES.agc:222
//#
// POWERED_FLIGHT_SUBROUTINES.agc:223
//# AX*SR*T IS GUARANTEED SAFE ONLY FOR VECTORS OF MAGNITUDE LESS THAN
// POWERED_FLIGHT_SUBROUTINES.agc:224
//# UNITY.  A LOOK AT THE CASE IN WHICH A VECTOR OF GREATER MAGNITUDE
// POWERED_FLIGHT_SUBROUTINES.agc:225
//# HAPPENS TO LIE ALONG AN AXIS OF THE SYSTEM TO WHICH IT IS TO BE TRANS-
// POWERED_FLIGHT_SUBROUTINES.agc:226
//# FORMED CONVINCES ONE THAT THIS IS A RESTRICTION WHICH MUST BE ACCEPTED.
// POWERED_FLIGHT_SUBROUTINES.agc:227
//
// POWERED_FLIGHT_SUBROUTINES.agc:228
//AX*SR*T		TS	DEXDEX		# WHERE IT BECOMES THE INDEX OF INDEXES.
// slot 22461
                if slot <> 22461 or instruction <> 22626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22626, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22462 {
// POWERED_FLIGHT_SUBROUTINES.agc:229
//		EXTEND
// slot 22462
                if slot <> 22462 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:230
//		QXCH	RTNSAVER
// slot 22463
                if slot <> 22463 or instruction <> 9317 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 101, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22465 {
            if slot <= 22464 {
// POWERED_FLIGHT_SUBROUTINES.agc:231
//
// POWERED_FLIGHT_SUBROUTINES.agc:232
//R*TL**P		CCS	DEXDEX		#       	+3 --> 0	-3 --> 2
// slot 22464
                if slot <> 22464 or instruction <> 4194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 98).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:233
//		CS	DEXDEX		# THUS:		+2 --> 1	-2 --> 1
// slot 22465
                if slot <> 22465 or instruction <> 16482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 98).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22466 {
// POWERED_FLIGHT_SUBROUTINES.agc:234
//		AD	THREE		#		+1 --> 2	-1 --> 0
// slot 22466
                if slot <> 22466 or instruction <> 27813 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22467 {
// POWERED_FLIGHT_SUBROUTINES.agc:235
//		EXTEND
// slot 22467
                    if slot <> 22467 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:236
//		INDEX	A
// slot 22468
                    if slot <> 22468 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1389] to agcAotUnit1389@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:237
//		DCA	INDEXI
// slot 22469
    22469, 28648
)).

// bank 23, slots 22470-22474
function agcAotUnit1390 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22471 {
        if slot <= 22470 {
// POWERED_FLIGHT_SUBROUTINES.agc:238
//		DXCH	DEXI
// slot 22470
            if slot <> 22470 or instruction <> 21604 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 100, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:239
//
// POWERED_FLIGHT_SUBROUTINES.agc:240
//		CA	ONE
// slot 22471
            if slot <> 22471 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22472 {
// POWERED_FLIGHT_SUBROUTINES.agc:241
//		TS	BUF
// slot 22472
            if slot <> 22472 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22473 {
// POWERED_FLIGHT_SUBROUTINES.agc:242
//		EXTEND
// slot 22473
                if slot <> 22473 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:243
//		INDEX	DEX1
// slot 22474
                if slot <> 22474 or instruction <> 20579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20579, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1390] to agcAotUnit1390@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:244
//		DCS	VBUF
// slot 22475
    22475, 32934
)).

// bank 23, slots 22476-22492
function agcAotUnit1391 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22483 {
        if slot <= 22479 {
            if slot <= 22477 {
                if slot <= 22476 {
// POWERED_FLIGHT_SUBROUTINES.agc:245
//		TCF	LOOP1		# REALLY BE A SUBTRACT, AND VICE VERSA
// slot 22476
                    if slot <> 22476 or instruction <> 6094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6094, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:246
//
// POWERED_FLIGHT_SUBROUTINES.agc:247
//LOOP2		DXCH	BUF		# LOADING VECTOR COMPONENT, STORING INDEX
// slot 22477
                    if slot <> 22477 or instruction <> 21593 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22478 {
// POWERED_FLIGHT_SUBROUTINES.agc:248
//# Page 1264
// POWERED_FLIGHT_SUBROUTINES.agc:249
//LOOP1		DXCH	MPAC
// slot 22478
                    if slot <> 22478 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:250
//		CA	SINSLOC
// slot 22479
                    if slot <> 22479 or instruction <> 14322 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2034), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22481 {
                if slot <= 22480 {
// POWERED_FLIGHT_SUBROUTINES.agc:251
//		AD	DEX1
// slot 22480
                    if slot <> 22480 or instruction <> 24675 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 99).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:252
//		TS	ADDRWD
// slot 22481
                    if slot <> 22481 or instruction <> 22606 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22606, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22482 {
// POWERED_FLIGHT_SUBROUTINES.agc:253
//
// POWERED_FLIGHT_SUBROUTINES.agc:254
//		TC	DMPSUB		# MULTIPLY AT SIN(CDUANGLE)
// slot 22482
                    if slot <> 22482 or instruction <> 3655 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3655, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:255
//		CCS	DEXDEX
// slot 22483
                    if slot <> 22483 or instruction <> 4194 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 98).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22487 {
            if slot <= 22485 {
                if slot <= 22484 {
// POWERED_FLIGHT_SUBROUTINES.agc:256
//		DXCH	MPAC		# NBSM CASE
// slot 22484
                    if slot <> 22484 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:257
//		TCF	+3
// slot 22485
                    if slot <> 22485 or instruction <> 6104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22486 {
// POWERED_FLIGHT_SUBROUTINES.agc:258
//		EXTEND			# SMNB CASE
// slot 22486
                    if slot <> 22486 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:259
//		DCS	MPAC
// slot 22487
                    if slot <> 22487 or instruction <> 16493 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22489 {
                if slot <= 22488 {
// POWERED_FLIGHT_SUBROUTINES.agc:260
//		DXCH	TERM1TMP
// slot 22488
                    if slot <> 22488 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:261
//
// POWERED_FLIGHT_SUBROUTINES.agc:262
//		CA	SIX		# SINCDU AND COSCDU (EACH 6 WORDS) MUST
// slot 22489
                    if slot <> 22489 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22490 {
// POWERED_FLIGHT_SUBROUTINES.agc:263
//		ADS	ADDRWD		#	BE CONSECUTIVE AND IN THAT ORDER
// slot 22490
                    if slot <> 22490 or instruction <> 11342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 78).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22491 {
// POWERED_FLIGHT_SUBROUTINES.agc:264
//
// POWERED_FLIGHT_SUBROUTINES.agc:265
//		EXTEND
// slot 22491
                        if slot <> 22491 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// POWERED_FLIGHT_SUBROUTINES.agc:266
//		INDEX	BUF
// slot 22492
                        if slot <> 22492 or instruction <> 20568 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20568, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20568, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1391] to agcAotUnit1391@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:267
//		INDEX	DEX1
// slot 22493
    22493, 41158,
// POWERED_FLIGHT_SUBROUTINES.agc:268
//		DCA	VBUF
// slot 22494
    22494, 24742
)).

// bank 23, slots 22495-22501
function agcAotUnit1392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22497 {
        if slot <= 22495 {
// POWERED_FLIGHT_SUBROUTINES.agc:269
//		DXCH	MPAC
// slot 22495
            if slot <> 22495 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22496 {
// POWERED_FLIGHT_SUBROUTINES.agc:270
//		TC	DMPSUB		# MULTIPLY BY COS(CDUANGLE)
// slot 22496
                if slot <> 22496 or instruction <> 3655 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3655, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:271
//		DXCH	MPAC
// slot 22497
                if slot <> 22497 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22499 {
            if slot <= 22498 {
// POWERED_FLIGHT_SUBROUTINES.agc:272
//		DAS	TERM1TMP
// slot 22498
                if slot <> 22498 or instruction <> 8304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 112) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:273
//		DXCH	TERM1TMP
// slot 22499
                if slot <> 22499 or instruction <> 21616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22500 {
// POWERED_FLIGHT_SUBROUTINES.agc:274
//		DDOUBL
// slot 22500
                if slot <> 22500 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:275
//		INDEX	BUF
// slot 22501
                if slot <> 22501 or instruction <> 20568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1392] to agcAotUnit1392@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:276
//		INDEX	DEX1
// slot 22502
    22502, 41158,
// POWERED_FLIGHT_SUBROUTINES.agc:277
//		DXCH	VBUF
// slot 22503
    22503, 43174
)).

// bank 23, slots 22504-22513
function agcAotUnit1393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22508 {
        if slot <= 22505 {
            if slot <= 22504 {
// POWERED_FLIGHT_SUBROUTINES.agc:278
//		DXCH	BUF		# LOADING INDEX, STORING VECTOR COMPONENT
// slot 22504
                if slot <> 22504 or instruction <> 21593 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:279
//
// POWERED_FLIGHT_SUBROUTINES.agc:280
//		CCS	A		# 'CAUSE THAT'S WHERE THE INDEX NOW IS
// slot 22505
                if slot <> 22505 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22506 {
// POWERED_FLIGHT_SUBROUTINES.agc:281
//		TCF	LOOP2
// slot 22506
                if slot <> 22506 or instruction <> 6093 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6093, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22507 {
// POWERED_FLIGHT_SUBROUTINES.agc:282
//
// POWERED_FLIGHT_SUBROUTINES.agc:283
//		EXTEND
// slot 22507
                    if slot <> 22507 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:284
//		DIM	DEXDEX		# DECREMENT MAGNITUDE PRESERVING SIGN
// slot 22508
                    if slot <> 22508 or instruction <> 11362 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDIM(words, 98).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22510 {
            if slot <= 22509 {
// POWERED_FLIGHT_SUBROUTINES.agc:285
//
// POWERED_FLIGHT_SUBROUTINES.agc:286
//TSTPOINT	CCS	DEXDEX		# ONLY THE BRANCHING FUNCTION IS USED
// slot 22509
                if slot <> 22509 or instruction <> 4194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 98).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:287
//		TCF	R*TL**P
// slot 22510
                if slot <> 22510 or instruction <> 6080 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6080, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22511 {
// POWERED_FLIGHT_SUBROUTINES.agc:288
//		TC	RTNSAVER
// slot 22511
                if slot <> 22511 or instruction <> 101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22512 {
// POWERED_FLIGHT_SUBROUTINES.agc:289
//		TCF	R*TL**P
// slot 22512
                    if slot <> 22512 or instruction <> 6080 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6080, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:290
//		TC	RTNSAVER
// slot 22513
                    if slot <> 22513 or instruction <> 101 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 101, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1393] to agcAotUnit1393@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:291
//
// POWERED_FLIGHT_SUBROUTINES.agc:292
//SINSLOC		ADRES	SINCDU		# FOR USE IN SETTING ADDRWD
// slot 22514
    22514, 956,
// POWERED_FLIGHT_SUBROUTINES.agc:293
//
// POWERED_FLIGHT_SUBROUTINES.agc:294
//INDEXI		DEC	4		# **********   DON'T   ***********
// slot 22515
    22515, 8,
// POWERED_FLIGHT_SUBROUTINES.agc:295
//		DEC	2		# **********   TOUCH   ***********
// slot 22516
    22516, 4,
// POWERED_FLIGHT_SUBROUTINES.agc:296
//		DEC	0		# **********   THESE   ***********
// slot 22517
    22517, 0,
// POWERED_FLIGHT_SUBROUTINES.agc:297
//# Page 1265
// POWERED_FLIGHT_SUBROUTINES.agc:298
//		DEC	4		# ********** CONSTANTS ***********
// slot 22518
    22518, 8,
// POWERED_FLIGHT_SUBROUTINES.agc:299
//
// POWERED_FLIGHT_SUBROUTINES.agc:300
//# ******************************************************************************
// POWERED_FLIGHT_SUBROUTINES.agc:301
//
// POWERED_FLIGHT_SUBROUTINES.agc:302
//		BANK	10
// POWERED_FLIGHT_SUBROUTINES.agc:303
//		SETLOC	FLESHLOC
// POWERED_FLIGHT_SUBROUTINES.agc:304
//		BANK
// POWERED_FLIGHT_SUBROUTINES.agc:305
//		COUNT*	$$/POWFL
// POWERED_FLIGHT_SUBROUTINES.agc:306
//
// POWERED_FLIGHT_SUBROUTINES.agc:307
//# ROUTINE FLESHPOT COMPUTES THE BODY-STABLE MEMBER TRANSFORMATION MATRIX (COMMONLY CALLED XNB) AND STORES
// POWERED_FLIGHT_SUBROUTINES.agc:308
//# IT IN THE LOCATIONS SPECIFIED BY THE ECADR ENTERING IN A.
// POWERED_FLIGHT_SUBROUTINES.agc:309
//
// POWERED_FLIGHT_SUBROUTINES.agc:310
//CALCSMSC	EXIT
// slot 10264
    10264, 65532
)).

// bank 10, slots 10265-10265
function agcAotUnit640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:311
//		TC	BANKCALL
// slot 10265
    if slot <> 10265 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[640] to agcAotUnit640@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:312
//		CADR	FLESHPOT -1
// slot 10266
    10266, 16444
)).

// bank 10, slots 10267-10267
function agcAotUnit641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// POWERED_FLIGHT_SUBROUTINES.agc:313
//		TC	INTPRET
// slot 10267
    if slot <> 10267 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[641] to agcAotUnit641@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:314
//		RVQ
// slot 10268
    10268, 65308,
// POWERED_FLIGHT_SUBROUTINES.agc:315
//
// POWERED_FLIGHT_SUBROUTINES.agc:316
//XNBECADR	ECADR	XNB
// slot 10269
    10269, 2920
)).

// bank 10, slots 10270-10280
function agcAotUnit642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10274 {
        if slot <= 10271 {
            if slot <= 10270 {
// POWERED_FLIGHT_SUBROUTINES.agc:317
//
// POWERED_FLIGHT_SUBROUTINES.agc:318
// -1		CAF	XNBECADR
// slot 10270
                if slot <> 10270 or instruction <> 13341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1053), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:319
//
// POWERED_FLIGHT_SUBROUTINES.agc:320
//FLESHPOT	TS	TEM2
// slot 10271
                if slot <> 10271 or instruction <> 22626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22626, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10272 {
// POWERED_FLIGHT_SUBROUTINES.agc:321
//		XCH	EBANK
// slot 10272
                if slot <> 10272 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10273 {
// POWERED_FLIGHT_SUBROUTINES.agc:322
//		XCH	TEM2
// slot 10273
                    if slot <> 10273 or instruction <> 23650 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 98, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:323
//		MASK	LOW8
// slot 10274
                    if slot <> 10274 or instruction <> 30959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                        if fixedOperand = 255 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
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
        if slot <= 10277 {
            if slot <= 10275 {
// POWERED_FLIGHT_SUBROUTINES.agc:324
//		AD	OCT1400
// slot 10275
                if slot <> 10275 or instruction <> 27143 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10276 {
// POWERED_FLIGHT_SUBROUTINES.agc:325
//		TS	TEM1
// slot 10276
                    if slot <> 10276 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:326
//
// POWERED_FLIGHT_SUBROUTINES.agc:327
//		EXTEND
// slot 10277
                    if slot <> 10277 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10278 {
// POWERED_FLIGHT_SUBROUTINES.agc:328
//		DCA	COSCDUY
// slot 10278
                if slot <> 10278 or instruction <> 12773 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 485, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10279 {
// POWERED_FLIGHT_SUBROUTINES.agc:329
//		DXCH	MPAC
// slot 10279
                    if slot <> 10279 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:330
//		TC	DMP
// slot 10280
                    if slot <> 10280 or instruction <> 3651 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3651, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[642] to agcAotUnit642@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:331
//		ADRES	COSCDUZ
// slot 10281
    10281, 972
)).

// bank 10, slots 10282-10284
function agcAotUnit643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10282 {
// POWERED_FLIGHT_SUBROUTINES.agc:332
//		DXCH	MPAC
// slot 10282
        if slot <> 10282 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10283 {
// POWERED_FLIGHT_SUBROUTINES.agc:333
//		DDOUBL
// slot 10283
            if slot <> 10283 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:334
//		INDEX	TEM1
// slot 10284
            if slot <> 10284 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[643] to agcAotUnit643@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:335
//		DXCH	0		# = COSY COSZ
// slot 10285
    10285, 43010
)).

// bank 10, slots 10286-10288
function agcAotUnit644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10286 {
// POWERED_FLIGHT_SUBROUTINES.agc:336
//
// POWERED_FLIGHT_SUBROUTINES.agc:337
//		EXTEND
// slot 10286
        if slot <> 10286 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10287 {
// POWERED_FLIGHT_SUBROUTINES.agc:338
//		DCA	SINCDUZ
// slot 10287
            if slot <> 10287 or instruction <> 12769 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 481, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:339
//		INDEX	TEM1
// slot 10288
            if slot <> 10288 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[644] to agcAotUnit644@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:340
//		DXCH	2		# = SINZ
// slot 10289
    10289, 43014
)).

// bank 10, slots 10290-10296
function agcAotUnit645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10292 {
        if slot <= 10290 {
// POWERED_FLIGHT_SUBROUTINES.agc:341
//
// POWERED_FLIGHT_SUBROUTINES.agc:342
//		EXTEND
// slot 10290
            if slot <> 10290 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10291 {
// POWERED_FLIGHT_SUBROUTINES.agc:343
//		DCS	SINCDUY
// slot 10291
                if slot <> 10291 or instruction <> 16863 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 479, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:344
//		DXCH	MPAC
// slot 10292
                if slot <> 10292 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10294 {
            if slot <= 10293 {
// POWERED_FLIGHT_SUBROUTINES.agc:345
//		TC	DMPSUB		# ADDRWD SET TO COSCDUZ
// slot 10293
                if slot <> 10293 or instruction <> 3655 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3655, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:346
//# Page 1266
// POWERED_FLIGHT_SUBROUTINES.agc:347
//		DXCH	MPAC
// slot 10294
                if slot <> 10294 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10295 {
// POWERED_FLIGHT_SUBROUTINES.agc:348
//		DDOUBL
// slot 10295
                if slot <> 10295 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:349
//		INDEX	TEM1
// slot 10296
                if slot <> 10296 or instruction <> 20577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20577, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[645] to agcAotUnit645@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:350
//		DXCH	4		# = - SINY COSZ
// slot 10297
    10297, 43018
)).

// bank 10, slots 10298-10308
function agcAotUnit646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10302 {
        if slot <= 10299 {
            if slot <= 10298 {
// POWERED_FLIGHT_SUBROUTINES.agc:351
//
// POWERED_FLIGHT_SUBROUTINES.agc:352
//		EXTEND
// slot 10298
                if slot <> 10298 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:353
//		DCS	SINCDUX
// slot 10299
                if slot <> 10299 or instruction <> 16867 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 483, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10300 {
// POWERED_FLIGHT_SUBROUTINES.agc:354
//		DXCH	MPAC
// slot 10300
                if slot <> 10300 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10301 {
// POWERED_FLIGHT_SUBROUTINES.agc:355
//		TC	DMPSUB		# ADDRWD SET TO COSCDUZ STILL
// slot 10301
                    if slot <> 10301 or instruction <> 3655 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3655, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:356
//		DXCH	MPAC
// slot 10302
                    if slot <> 10302 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10305 {
            if slot <= 10303 {
// POWERED_FLIGHT_SUBROUTINES.agc:357
//		DDOUBL
// slot 10303
                if slot <> 10303 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10304 {
// POWERED_FLIGHT_SUBROUTINES.agc:358
//		DXCH	MPAC	+3
// slot 10304
                    if slot <> 10304 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:359
//
// POWERED_FLIGHT_SUBROUTINES.agc:360
//		EXTEND
// slot 10305
                    if slot <> 10305 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10306 {
// POWERED_FLIGHT_SUBROUTINES.agc:361
//		DCS	SINCDUX
// slot 10306
                if slot <> 10306 or instruction <> 16867 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 483, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10307 {
// POWERED_FLIGHT_SUBROUTINES.agc:362
//		DXCH	MPAC
// slot 10307
                    if slot <> 10307 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:363
//		TC	DMP
// slot 10308
                    if slot <> 10308 or instruction <> 3651 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3651, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[646] to agcAotUnit646@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:364
//		ADRES	SINCDUZ
// slot 10309
    10309, 960
)).

// bank 10, slots 10310-10313
function agcAotUnit647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10311 {
        if slot <= 10310 {
// POWERED_FLIGHT_SUBROUTINES.agc:365
//		EXTEND
// slot 10310
            if slot <> 10310 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:366
//		DCS	MPAC
// slot 10311
            if slot <> 10311 or instruction <> 16493 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCS", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10312 {
// POWERED_FLIGHT_SUBROUTINES.agc:367
//		DXCH	MPAC 	+5
// slot 10312
            if slot <> 10312 or instruction <> 21618 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:368
//		TC	DMP
// slot 10313
            if slot <> 10313 or instruction <> 3651 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3651, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[647] to agcAotUnit647@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:369
//		ADRES	SINCDUY
// slot 10314
    10314, 956
)).

// bank 10, slots 10315-10320
function agcAotUnit648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10317 {
        if slot <= 10315 {
// POWERED_FLIGHT_SUBROUTINES.agc:370
//		DXCH	MPAC
// slot 10315
            if slot <> 10315 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10316 {
// POWERED_FLIGHT_SUBROUTINES.agc:371
//		DDOUBL
// slot 10316
                if slot <> 10316 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:372
//		DDOUBL
// slot 10317
                if slot <> 10317 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10318 {
// POWERED_FLIGHT_SUBROUTINES.agc:373
//		DXCH	MPAC 	+5
// slot 10318
            if slot <> 10318 or instruction <> 21618 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10319 {
// POWERED_FLIGHT_SUBROUTINES.agc:374
//
// POWERED_FLIGHT_SUBROUTINES.agc:375
//		DXCH	MPAC
// slot 10319
                if slot <> 10319 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:376
//		TC	DMP
// slot 10320
                if slot <> 10320 or instruction <> 3651 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3651, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[648] to agcAotUnit648@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:377
//		ADRES	COSCDUY
// slot 10321
    10321, 968
)).

// bank 10, slots 10322-10329
function agcAotUnit649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10325 {
        if slot <= 10323 {
            if slot <= 10322 {
// POWERED_FLIGHT_SUBROUTINES.agc:378
//		DXCH	MPAC
// slot 10322
                if slot <> 10322 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:379
//		DDOUBL
// slot 10323
                if slot <> 10323 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10324 {
// POWERED_FLIGHT_SUBROUTINES.agc:380
//		DDOUBL
// slot 10324
                if slot <> 10324 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:381
//		DXCH	BUF
// slot 10325
                if slot <> 10325 or instruction <> 21593 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10327 {
            if slot <= 10326 {
// POWERED_FLIGHT_SUBROUTINES.agc:382
//
// POWERED_FLIGHT_SUBROUTINES.agc:383
//		EXTEND
// slot 10326
                if slot <> 10326 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:384
//		DCA	COSCDUY
// slot 10327
                if slot <> 10327 or instruction <> 12773 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 485, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10328 {
// POWERED_FLIGHT_SUBROUTINES.agc:385
//		DXCH	MPAC
// slot 10328
                if slot <> 10328 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// POWERED_FLIGHT_SUBROUTINES.agc:386
//		TC	DMP
// slot 10329
                if slot <> 10329 or instruction <> 3651 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3651, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[649] to agcAotUnit649@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:387
//		ADRES	COSCDUX
// slot 10330
    10330, 976
)).

// bank 10, slots 10331-10345
function agcAotUnit650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10337 {
        if slot <= 10333 {
            if slot <= 10331 {
// POWERED_FLIGHT_SUBROUTINES.agc:388
//		DXCH	MPAC
// slot 10331
                if slot <> 10331 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10332 {
// POWERED_FLIGHT_SUBROUTINES.agc:389
//		DDOUBL
// slot 10332
                    if slot <> 10332 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:390
//		DAS	MPAC 	+5
// slot 10333
                    if slot <> 10333 or instruction <> 8306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 114) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10335 {
                if slot <= 10334 {
// POWERED_FLIGHT_SUBROUTINES.agc:391
//
// POWERED_FLIGHT_SUBROUTINES.agc:392
//		EXTEND
// slot 10334
                    if slot <> 10334 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:393
//		DCA	SINCDUY
// slot 10335
                    if slot <> 10335 or instruction <> 12767 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 479, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10336 {
// POWERED_FLIGHT_SUBROUTINES.agc:394
//		DXCH	MPAC
// slot 10336
                    if slot <> 10336 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:395
//		TC	DMPSUB		# ADDRWD SET TO COSCDUX
// slot 10337
                    if slot <> 10337 or instruction <> 3655 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3655, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10341 {
            if slot <= 10339 {
                if slot <= 10338 {
// POWERED_FLIGHT_SUBROUTINES.agc:396
//		DXCH	MPAC
// slot 10338
                    if slot <> 10338 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:397
//
// POWERED_FLIGHT_SUBROUTINES.agc:398
//# Page 1267
// POWERED_FLIGHT_SUBROUTINES.agc:399
//		DDOUBL
// slot 10339
                    if slot <> 10339 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10340 {
// POWERED_FLIGHT_SUBROUTINES.agc:400
//		DAS 	BUF
// slot 10340
                    if slot <> 10340 or instruction <> 8281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 89) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:401
//
// POWERED_FLIGHT_SUBROUTINES.agc:402
//		DXCH	BUF
// slot 10341
                    if slot <> 10341 or instruction <> 21593 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10343 {
                if slot <= 10342 {
// POWERED_FLIGHT_SUBROUTINES.agc:403
//		DXCH	MPAC
// slot 10342
                    if slot <> 10342 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:404
//
// POWERED_FLIGHT_SUBROUTINES.agc:405
//		EXTEND
// slot 10343
                    if slot <> 10343 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10344 {
// POWERED_FLIGHT_SUBROUTINES.agc:406
//		DCA	MPAC
// slot 10344
                    if slot <> 10344 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:407
//		INDEX	TEM1
// slot 10345
                    if slot <> 10345 or instruction <> 20577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20577, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[650] to agcAotUnit650@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:408
//		DXCH	14		# = - SINY COSX + SINX SINZ COSY
// slot 10346
    10346, 43034
)).

// bank 10, slots 10347-10349
function agcAotUnit651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10347 {
// POWERED_FLIGHT_SUBROUTINES.agc:409
//
// POWERED_FLIGHT_SUBROUTINES.agc:410
//		EXTEND
// slot 10347
        if slot <> 10347 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10348 {
// POWERED_FLIGHT_SUBROUTINES.agc:411
//		DCA	MPAC 	+3
// slot 10348
            if slot <> 10348 or instruction <> 12400 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 112, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:412
//		INDEX	TEM1
// slot 10349
            if slot <> 10349 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[651] to agcAotUnit651@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:413
//		DXCH	16		# = - SINX COSZ
// slot 10350
    10350, 43038
)).

// bank 10, slots 10351-10353
function agcAotUnit652 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10351 {
// POWERED_FLIGHT_SUBROUTINES.agc:414
//
// POWERED_FLIGHT_SUBROUTINES.agc:415
//		EXTEND
// slot 10351
        if slot <> 10351 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10352 {
// POWERED_FLIGHT_SUBROUTINES.agc:416
//		DCA	MPAC 	+5
// slot 10352
            if slot <> 10352 or instruction <> 12402 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 114, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:417
//		INDEX	TEM1
// slot 10353
            if slot <> 10353 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[652] to agcAotUnit652@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:418
//		DXCH	20		# = COSX COSY - SINX SINY SINZ
// slot 10354
    10354, 43042
)).

// bank 10, slots 10355-10366
function agcAotUnit653 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10360 {
        if slot <= 10357 {
            if slot <= 10355 {
// POWERED_FLIGHT_SUBROUTINES.agc:419
//
// POWERED_FLIGHT_SUBROUTINES.agc:420
//		CA	TEM1
// slot 10355
                if slot <> 10355 or instruction <> 12385 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 97).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10356 {
// POWERED_FLIGHT_SUBROUTINES.agc:421
//		TS	ADDRWD
// slot 10356
                    if slot <> 10356 or instruction <> 22606 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22606, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:422
//		EXTEND
// slot 10357
                    if slot <> 10357 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10358 {
// POWERED_FLIGHT_SUBROUTINES.agc:423
//		DCA	Z
// slot 10358
                if slot <> 10358 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10359 {
// POWERED_FLIGHT_SUBROUTINES.agc:424
//		AD	FOUR
// slot 10359
                    if slot <> 10359 or instruction <> 27113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:425
//		DXCH	LOC
// slot 10360
                    if slot <> 10360 or instruction <> 21621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10363 {
            if slot <= 10361 {
// POWERED_FLIGHT_SUBROUTINES.agc:426
//		CAF	BIT8
// slot 10361
                if slot <> 10361 or instruction <> 14820 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10362 {
// POWERED_FLIGHT_SUBROUTINES.agc:427
//		TS	EDOP
// slot 10362
                    if slot <> 10362 or instruction <> 22547 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22547, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:428
//		TCF	VXV
// slot 10363
                    if slot <> 10363 or instruction <> 7984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7984, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10364 {
// POWERED_FLIGHT_SUBROUTINES.agc:429
//		DXCH	MPAC
// slot 10364
                if slot <> 10364 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10365 {
// POWERED_FLIGHT_SUBROUTINES.agc:430
//		DDOUBL
// slot 10365
                    if slot <> 10365 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// POWERED_FLIGHT_SUBROUTINES.agc:431
//		INDEX	TEM1
// slot 10366
                    if slot <> 10366 or instruction <> 20577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20577, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[653] to agcAotUnit653@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:432
//		DXCH	6
// slot 10367
    10367, 43022
)).

// bank 10, slots 10368-10370
function agcAotUnit654 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10368 {
// POWERED_FLIGHT_SUBROUTINES.agc:433
//
// POWERED_FLIGHT_SUBROUTINES.agc:434
//		DXCH	MPAC 	+3
// slot 10368
        if slot <> 10368 or instruction <> 21616 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10369 {
// POWERED_FLIGHT_SUBROUTINES.agc:435
//		DDOUBL
// slot 10369
            if slot <> 10369 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:436
//		INDEX 	TEM1
// slot 10370
            if slot <> 10370 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[654] to agcAotUnit654@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:437
//		DXCH	10
// slot 10371
    10371, 43026
)).

// bank 10, slots 10372-10374
function agcAotUnit655 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10372 {
// POWERED_FLIGHT_SUBROUTINES.agc:438
//
// POWERED_FLIGHT_SUBROUTINES.agc:439
//		DXCH	MPAC 	+5
// slot 10372
        if slot <> 10372 or instruction <> 21618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10373 {
// POWERED_FLIGHT_SUBROUTINES.agc:440
//		DDOUBL
// slot 10373
            if slot <> 10373 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:441
//		INDEX 	TEM1
// slot 10374
            if slot <> 10374 or instruction <> 20577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[655] to agcAotUnit655@.

agcAotInstallSourceRope(list(
// POWERED_FLIGHT_SUBROUTINES.agc:442
//		DXCH	12
// slot 10375
    10375, 43030
)).

// bank 10, slots 10376-10378
function agcAotUnit656 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10376 {
// POWERED_FLIGHT_SUBROUTINES.agc:443
//
// POWERED_FLIGHT_SUBROUTINES.agc:444
//		CA	TEM2
// slot 10376
        if slot <> 10376 or instruction <> 12386 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 98).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10377 {
// POWERED_FLIGHT_SUBROUTINES.agc:445
//		TS	EBANK
// slot 10377
            if slot <> 10377 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// POWERED_FLIGHT_SUBROUTINES.agc:446
//		TCF	SWRETURN
// slot 10378
            if slot <> 10378 or instruction <> 6553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6553, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[656] to agcAotUnit656@.

// no code for the lines below
// POWERED_FLIGHT_SUBROUTINES.agc:447
//
