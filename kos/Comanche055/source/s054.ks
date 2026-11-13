// PORT: Original source unit POWERED_FLIGHT_SUBROUTINES.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:2
//# Filename:	POWERED_FLIGHT_SUBROUTINES.agc
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:9
//# Pages:	1365-1372
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:11
//#                               from the Colossus249/ file of the same
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:12
//#                               name, using Comanche055 page images.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:13
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:22
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:24
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:27
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:29
//#            Colossus 2A
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:30
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:31
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:32
//# Page 1365
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:33
//		BANK	14		# SAME FBANK AS THE FINDCDUD SUB-PROGRAM
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:34
//		SETLOC	POWFLITE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:35
//		BANK
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:36
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:37
//		EBANK=	DEXDEX
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:38
//		COUNT*	$$/POWFL
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:39
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:40
//# 	CDUTRIG, CDUTRIG1, CDUTRIG2, AND CD*GR*GS ALL COMPUTE THE SINES AND
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:41
//# COSINES OF THREE 2'S COMPLEMENT ANGLES AND PLACE THE RESULT, DOUBLE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:42
//# PRECISION, IN THE SAME ORDER AS THE INPUTS, AT SINCDU AND COSCDU.  AN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:43
//# ADDITIONAL OUTPUT IS THE 1'S COMPLEMENT ANGLES AT CDUSPOT.  THESE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:44
//# ROUTINES GO OUT OF THEIR WAY TO LEAVE THE MPAC AREA AS THEY FIND IT,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:45
//# EXCEPT FOR THE GENERALLY UNIMPORTANT MPAC +2.  THEY DIFFER ONLY IN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:46
//# WHERE THEY GET THE ANGLES, AND IN METHOD OF CALLING.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:47
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:48
//# 	CDUTRIG (AND CDUTRIG1, WHICH CAN BE CALLED IN BASIC) COMPUTE THE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:49
//# SINES AND COSINES FROM THE CURRENT CONTENTS OF THE CDU REGISTERS.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:50
//# THE CONTENTS OF CDUTEMP, ETC., ARE NOT TOUCHED SO THAT THEY MAY
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:51
//# CONTINUE TO FORM A CONSISTENT SET WITH THE LATEST PIPA READINGS.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:52
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:53
//# 	CDUTRIG1 IS LIKE CDUTRIG EXCEPT THAT IT CAN BE CALLED IN BASIC.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:54
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:55
//# 	CD*TR*GS FINDS CDU VALUES IN CDUSPOT RATHER THAN IN CDUTEMP.  THIS
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:56
//# ALLOWS USERS TO MAKE TRANSFORMATIONS USING ARBITRARY ANGLES, OR REAL
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:57
//# ANGLES IN AN ORDER OTHER THAN X Y Z.  A CALL TO THIS ROUTINE IS
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:58
//# NECESSARY IN PREPARATION FOR A CALL TO AX*SR*T IN EITHER OF ITS TWO
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:59
//# MODES (SMNB OR NBSM).  SINCE AX*SR*T EXPECTS TO FIND THE SINES AND
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:60
//# COSINES IN THE ORDER Y Z X THE ANGLES MUST HAVE BEEN PLACED IN CDUSPOT
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:61
//# IN THIS ORDER.  CD*TR*GS NEED NOT BE REPEATED WHEN AX*SR*T IS CALLED
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:62
//# MORE THAN ONCE, PROVIDED THE ANGLES HAVE NOT CHANGED.  NOTE THAT SINCE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:63
//# IT CLOBBERS BUF2 (IN THE SINE AND COSINE ROUTINES) CD*TR*GS CANNOT BE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:64
//# CALLED USING BANKCALL.  SORRY.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:65
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:66
//# 	CD*TR*G IS LIKE CD*TR*GS EXCEPT THAT IT CAN BE CALLED IN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:67
//# INTERPRETIVE.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:68
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:69
//CDUTRIG		EXIT
// PORT: Fixed ROM slots 22335.
    22335, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22336–22337.
function agcAotUnit1259 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22336 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:70
//		TC	CDUTRIGS
// PORT: Fixed ROM slots 22336.
        if slot <> 22336 or instruction <> 1863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1863, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:71
//		TC	INTPRET
// PORT: Fixed ROM slots 22337.
        if slot <> 22337 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1259] to agcAotUnit1259@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:72
//		RVQ
// PORT: Fixed ROM slots 22338.
    22338, 65308,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:73
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:74
//CD*TR*G		EXIT
// PORT: Fixed ROM slots 22339.
    22339, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22340–22341.
function agcAotUnit1260 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22340 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:75
//		TC	CD*TR*GS
// PORT: Fixed ROM slots 22340.
        if slot <> 22340 or instruction <> 1869 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1869, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:76
//		TC	INTPRET
// PORT: Fixed ROM slots 22341.
        if slot <> 22341 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1260] to agcAotUnit1260@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:77
//		RVQ
// PORT: Fixed ROM slots 22342.
    22342, 65308
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22343–22354.
function agcAotUnit1261 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22348 {
        if slot <= 22345 {
            if slot <= 22343 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:78
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:79
//CDUTRIGS	CA	CDUX
// PORT: Fixed ROM slots 22343.
                if slot <> 22343 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22344 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:80
//		TS	CDUSPOT +4
// PORT: Fixed ROM slots 22344.
                    if slot <> 22344 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:81
//		CA	CDUY
// PORT: Fixed ROM slots 22345.
                    if slot <> 22345 or instruction <> 12315 { return choose false if checkOnly else -1. }
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
            if slot <= 22346 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:82
//		TS	CDUSPOT
// PORT: Fixed ROM slots 22346.
                if slot <> 22346 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22347 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:83
//# Page 1366
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:84
//		CA	CDUZ
// PORT: Fixed ROM slots 22347.
                    if slot <> 22347 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:85
//		TS	CDUSPOT +2
// PORT: Fixed ROM slots 22348.
                    if slot <> 22348 or instruction <> 23032 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23032, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22351 {
            if slot <= 22349 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:86
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:87
//CD*TR*GS	EXTEND
// PORT: Fixed ROM slots 22349.
                if slot <> 22349 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22350 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:88
//		QXCH	TEM2
// PORT: Fixed ROM slots 22350.
                    if slot <> 22350 or instruction <> 9314 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 98, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:89
//		CAF	FOUR
// PORT: Fixed ROM slots 22351.
                    if slot <> 22351 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22352 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:90
//TR*GL**P	MASK	SIX		# MAKE IT EVEN AND SMALLER
// PORT: Fixed ROM slots 22352.
                if slot <> 22352 or instruction <> 31881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    if fixedOperand = 6 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22353 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:91
//		TS	TEM3
// PORT: Fixed ROM slots 22353.
                    if slot <> 22353 or instruction <> 22627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:92
//		INDEX	TEM3
// PORT: Fixed ROM slots 22354.
                    if slot <> 22354 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1261] to agcAotUnit1261@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:93
//		CA	CDUSPOT
// PORT: Fixed ROM slots 22355.
    22355, 25580
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22356–22358.
function agcAotUnit1262 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22356 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:94
//		DXCH	MPAC		# STORING 2'S COMP ANGLE, LOADING MPAC
// PORT: Fixed ROM slots 22356.
        if slot <> 22356 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22357 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:95
//		DXCH	VBUF +4		# STORING MPAC FOR LATER RESTORATION
// PORT: Fixed ROM slots 22357.
            if slot <> 22357 or instruction <> 21591 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:96
//		TC	USPRCADR
// PORT: Fixed ROM slots 22358.
            if slot <> 22358 or instruction <> 2543 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2543, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1262] to agcAotUnit1262@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:97
//		CADR	CDULOGIC
// PORT: Fixed ROM slots 22359.
    22359, 38550
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22360–22362.
function agcAotUnit1263 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22360 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:98
//		EXTEND
// PORT: Fixed ROM slots 22360.
        if slot <> 22360 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22361 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:99
//		DCA	MPAC
// PORT: Fixed ROM slots 22361.
            if slot <> 22361 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:100
//		INDEX	TEM3
// PORT: Fixed ROM slots 22362.
            if slot <> 22362 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1263] to agcAotUnit1263@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:101
//		DXCH	CDUSPOT		# STORING 1'S COMPLEMENT ANGLE
// PORT: Fixed ROM slots 22363.
    22363, 44014
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22364–22364.
function agcAotUnit1264 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:102
//		TC	USPRCADR
// PORT: Fixed ROM slots 22364.
    if slot <> 22364 or instruction <> 2543 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2543, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1264] to agcAotUnit1264@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:103
//		CADR	COSINE
// PORT: Fixed ROM slots 22365.
    22365, 1692
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22366–22367.
function agcAotUnit1265 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22366 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:104
//		DXCH	MPAC
// PORT: Fixed ROM slots 22366.
        if slot <> 22366 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:105
//		INDEX	TEM3
// PORT: Fixed ROM slots 22367.
        if slot <> 22367 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1265] to agcAotUnit1265@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:106
//		DXCH	COSCDU		# STORING COSINE
// PORT: Fixed ROM slots 22368.
    22368, 43978
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22369–22370.
function agcAotUnit1266 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22369 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:107
//		EXTEND
// PORT: Fixed ROM slots 22369.
        if slot <> 22369 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:108
//		INDEX	TEM3
// PORT: Fixed ROM slots 22370.
        if slot <> 22370 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1266] to agcAotUnit1266@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:109
//		DCA	CDUSPOT		# LOADING 1'S COMPLEMENT ANGLE
// PORT: Fixed ROM slots 22371.
    22371, 25582
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22372–22372.
function agcAotUnit1267 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:110
//		TC	USPRCADR
// PORT: Fixed ROM slots 22372.
    if slot <> 22372 or instruction <> 2543 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2543, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1267] to agcAotUnit1267@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:111
//		CADR	SINE +1		# SINE +1 EXPECTS ARGUMENT IN A AND L
// PORT: Fixed ROM slots 22373.
    22373, 1712
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22374–22376.
function agcAotUnit1268 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22374 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:112
//		DXCH	VBUF +4		# BRINGING UP PRIOR MPAC TO BE RESTORED
// PORT: Fixed ROM slots 22374.
        if slot <> 22374 or instruction <> 21591 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22375 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:113
//		DXCH	MPAC
// PORT: Fixed ROM slots 22375.
            if slot <> 22375 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:114
//		INDEX	TEM3
// PORT: Fixed ROM slots 22376.
            if slot <> 22376 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1268] to agcAotUnit1268@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:115
//		DXCH	SINCDU
// PORT: Fixed ROM slots 22377.
    22377, 43966
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22378–22387.
function agcAotUnit1269 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22382 {
        if slot <= 22379 {
            if slot <= 22378 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:116
//		CCS	TEM3
// PORT: Fixed ROM slots 22378.
                if slot <> 22378 or instruction <> 4195 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 99).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:117
//		TCF	TR*GL**P
// PORT: Fixed ROM slots 22379.
                if slot <> 22379 or instruction <> 5968 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5968, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22380 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:118
//		TC	TEM2
// PORT: Fixed ROM slots 22380.
                if slot <> 22380 or instruction <> 98 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 98, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22381 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:119
//# Page 1367
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:120
//# *******************************************************************************************************
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:121
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:122
//# 	QUICTRIG, INTENDED FOR GUIDANCE CYCLE USE WHERE TIME IS CRITICAL, IS A MUCH FASTER VERSION OF CD*TR*GS.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:123
//# QUICTRIG COMPUTES AND STORES THE SINES AND COSINES OF THE 2'S COMPLEMENT ANGLES AT CDUSPOT, CDUSPOT +2,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:124
//# AND CDUSPOT +4.  UNLIKE CD*TR*GS, QUICTRIG DOES NOT LEAVE THE 1'S COMPLEMENT VERSIONS OF THE ANGLES IN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:125
//# CDUSPOT.  QUICTRIG'S EXECUTION TIME IS 4.1 MS; THIS IS 10 TIMES AS FAST AS CD*TR*GS.  QUICTRIG MAY BE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:126
//# CALLED FROM INTERPRETIVE AS AN RTB OP-CODE, OR FROM BASIC VIA BANKCALL OR IBNKCALL.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:127
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:128
//QUICTRIG	INHINT			# INHINT SINCE DAP USES THE SAME TEMPS
// PORT: Fixed ROM slots 22381.
                    if slot <> 22381 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:129
//		EXTEND
// PORT: Fixed ROM slots 22382.
                    if slot <> 22382 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22384 {
            if slot <= 22383 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:130
//		QXCH	ITEMP1
// PORT: Fixed ROM slots 22383.
                if slot <> 22383 or instruction <> 9265 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 49, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:131
//		CAF	FOUR
// PORT: Fixed ROM slots 22384.
                if slot <> 22384 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22385 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:132
//	+4	MASK	SIX
// PORT: Fixed ROM slots 22385.
                if slot <> 22385 or instruction <> 31881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    if fixedOperand = 6 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22386 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:133
//		TS	ITEMP2
// PORT: Fixed ROM slots 22386.
                    if slot <> 22386 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:134
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 22387.
                    if slot <> 22387 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1269] to agcAotUnit1269@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:135
//		CA	CDUSPOT
// PORT: Fixed ROM slots 22388.
    22388, 25580
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22389–22392.
function agcAotUnit1270 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22390 {
        if slot <= 22389 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:136
//		TC	SPSIN
// PORT: Fixed ROM slots 22389.
            if slot <> 22389 or instruction <> 2621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2621, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:137
//		EXTEND
// PORT: Fixed ROM slots 22390.
            if slot <> 22390 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22391 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:138
//		MP	BIT14		# SCALE DOWN TO MATCH INTERPRETER OUTPUTS
// PORT: Fixed ROM slots 22391.
            if slot <> 22391 or instruction <> 31234 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:139
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 22392.
            if slot <> 22392 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1270] to agcAotUnit1270@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:140
//		DXCH	SINCDU
// PORT: Fixed ROM slots 22393.
    22393, 43966
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22394–22394.
function agcAotUnit1271 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:141
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 22394.
    if slot <> 22394 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1271] to agcAotUnit1271@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:142
//		CA	CDUSPOT
// PORT: Fixed ROM slots 22395.
    22395, 25580
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22396–22399.
function agcAotUnit1272 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22397 {
        if slot <= 22396 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:143
//		TC	SPCOS
// PORT: Fixed ROM slots 22396.
            if slot <> 22396 or instruction <> 2620 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2620, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:144
//		EXTEND
// PORT: Fixed ROM slots 22397.
            if slot <> 22397 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22398 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:145
//		MP	BIT14
// PORT: Fixed ROM slots 22398.
            if slot <> 22398 or instruction <> 31234 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:146
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 22399.
            if slot <> 22399 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1272] to agcAotUnit1272@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:147
//		DXCH	COSCDU
// PORT: Fixed ROM slots 22400.
    22400, 43978
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22401–22405.
function agcAotUnit1273 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22402 {
        if slot <= 22401 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:148
//		CCS	ITEMP2
// PORT: Fixed ROM slots 22401.
            if slot <> 22401 or instruction <> 4146 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:149
//		TCF	QUICTRIG +4
// PORT: Fixed ROM slots 22402.
            if slot <> 22402 or instruction <> 6001 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6001, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22403 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:150
//		CA	ITEMP1
// PORT: Fixed ROM slots 22403.
            if slot <> 22403 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22404 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:151
//		RELINT
// PORT: Fixed ROM slots 22404.
                if slot <> 22404 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:152
//		TC	A
// PORT: Fixed ROM slots 22405.
                if slot <> 22405 or instruction <> 0 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 0, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1273] to agcAotUnit1273@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:153
//# Page 1368
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:154
//#****************************************************************************
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:155
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:156
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:157
//# 	THESE INTERFACE ROUTINES MAKE IT POSSIBLE TO CALL AX*SR*T, ETC., IN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:158
//# INTERPRETIVE.  LATER, WHERE POSSIBLE, THEY WILL BE ELIMINATED.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:159
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:160
//# 	NBSM WILL BE THE FIRST TO GO.  IT SHOULD NOT BE USED.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:161
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:162
//NBSM		STQ
// PORT: Fixed ROM slots 22406.
    22406, 65312,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:163
//			X2
// PORT: Fixed ROM slots 22407.
    22407, 78,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:164
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 22408.
    22408, 64448,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:165
//			S1		# BASE ADDRESS OF THE CDU ANGLES IS IN S1
// PORT: Fixed ROM slots 22409.
    22409, 80,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:166
//			0,1
// PORT: Fixed ROM slots 22410.
    22410, 2,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:167
//		STOVL	CDUSPOT
// PORT: Fixed ROM slots 22411.
    22411, 21486,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:168
//			32D		# VECTOR TO BE TRANSFORMED IS IN 32D
// PORT: Fixed ROM slots 22412.
    22412, 66,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:169
//		CALL
// PORT: Fixed ROM slots 22413.
    22413, 65320,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:170
//			TRG*NBSM
// PORT: Fixed ROM slots 22414.
    22414, 40766,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:171
//		STCALL	32D		# SINCE THERE'S NO STGOTO
// PORT: Fixed ROM slots 22415.
    22415, 28738,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:172
//			X2
// PORT: Fixed ROM slots 22416.
    22416, 78,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:173
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:174
//# 	THESE INTERFACE ROUTINES ARE PERMANENT.  ALL RESTORE USER'S EBANK
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:175
//# SETTING.  ALL ARE STRICT INTERPRETIVE SUBROUTINES, CALLED USING "CALL",
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:176
//# RETURNING VIA QPRET.  ALL EXPECT AND RETURN THE VECTOR TO BE TRANSFOR-
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:177
//# MED INTERPRETER-STYLE IN MPAC; COMPONENTS AT MPAC, MPAC +3, AND MPAC +5.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:178
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:179
//# 	TRG*SMNB AND TRG*NBSM BOTH EXPECT TO SEE THE 2'S COMPLEMENT ANGLES
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:180
//# AT CDUSPOT (ORDER Y Z X, AT CDUSPOT, CDUSPOT +2, AND CDUSPOT +4; ODD
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:181
//# LOCATIONS NEED NOT BE ZEROED).  TRG*NBSM DOES THE NB TO SM TRANSFOR-
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:182
//# MATION; TRG*SMNB, VICE VERSA.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:183
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:184
//# 	CDU*NBSM DOES ITS TRANSFORMATION USING THE PRESENT CONTENTS OF
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:185
//# THE CDL COUNTERS.  OTHERWISE IT IS LIKE TRG*NBSM.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:186
//#
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:187
//# 	CDU*SMNB IS THE COMPLEMENT OF CDU*NBSM.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:188
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:189
//CDU*SMNB	EXIT
// PORT: Fixed ROM slots 22417.
    22417, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22418–22419.
function agcAotUnit1274 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22418 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:190
//		TC	CDUTRIGS
// PORT: Fixed ROM slots 22418.
        if slot <> 22418 or instruction <> 1863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1863, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:191
//		TCF	C*MM*N1
// PORT: Fixed ROM slots 22419.
        if slot <> 22419 or instruction <> 6038 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6038, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1274] to agcAotUnit1274@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:192
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:193
//TRG*SMNB	EXIT
// PORT: Fixed ROM slots 22420.
    22420, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22421–22425.
function agcAotUnit1275 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22422 {
        if slot <= 22421 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:194
//		TC	CD*TR*GS
// PORT: Fixed ROM slots 22421.
            if slot <> 22421 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:195
//C*MM*N1		TC	MPACVBUF	# AX*SR*T EXPECTS VECTOR IN VBUF
// PORT: Fixed ROM slots 22422.
            if slot <> 22422 or instruction <> 3905 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3905, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22423 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:196
//		CS	THREE		# SIGNAL FOR SM TO NB TRANSFORMATION.
// PORT: Fixed ROM slots 22423.
            if slot <> 22423 or instruction <> 19596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22424 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:197
//C*MM*N2		TC	AX*SR*T
// PORT: Fixed ROM slots 22424.
                if slot <> 22424 or instruction <> 1960 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1960, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:198
//		TC	INTPRET
// PORT: Fixed ROM slots 22425.
                if slot <> 22425 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1275] to agcAotUnit1275@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:199
//		VLOAD	RVQ
// PORT: Fixed ROM slots 22426.
    22426, 36602,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:200
//			VBUF
// PORT: Fixed ROM slots 22427.
    22427, 166,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:201
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:202
//CDU*NBSM	EXIT
// PORT: Fixed ROM slots 22428.
    22428, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22429–22430.
function agcAotUnit1276 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22429 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:203
//		TC	CDUTRIGS
// PORT: Fixed ROM slots 22429.
        if slot <> 22429 or instruction <> 1863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1863, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:204
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:205
//# Page 1369
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:206
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:207
//		TCF	C*MM*N3
// PORT: Fixed ROM slots 22430.
        if slot <> 22430 or instruction <> 6049 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6049, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1276] to agcAotUnit1276@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:208
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:209
//TRG*NBSM	EXIT
// PORT: Fixed ROM slots 22431.
    22431, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22432–22435.
function agcAotUnit1277 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22433 {
        if slot <= 22432 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:210
//		TC	CD*TR*GS
// PORT: Fixed ROM slots 22432.
            if slot <> 22432 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:211
//C*MM*N3		TC	MPACVBUF	# FOR AX*SR*T
// PORT: Fixed ROM slots 22433.
            if slot <> 22433 or instruction <> 3905 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3905, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22434 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:212
//		CA	THREE		# SIGNAL FOR NB TO SM TRANSFORMATION
// PORT: Fixed ROM slots 22434.
            if slot <> 22434 or instruction <> 15500 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:213
//		TCF	C*MM*N2
// PORT: Fixed ROM slots 22435.
            if slot <> 22435 or instruction <> 6040 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6040, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1277] to agcAotUnit1277@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:214
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:215
//# 	*NBSM* AND *SMNB* EXPECT TO SEE THE SINES AND COSINES (AT SINCDU
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:216
//# AND COSCDU) RATHER THAN THE ANGLES THEMSELVES.  OTHERWISE THEY ARE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:217
//# LIKE TRG*NBSM AND TRG*SMNB.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:218
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:219
//# 	NOTE THAT JUST AS CD*TR*GS NEED BE CALLED ONLY ONCE FOR EACH SERIES
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:220
//# OF TRANSFORMATIONS USING THE SAME ANGLES, SO TOO ONLY ONE OF TRG*NBSM
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:221
//# AND TRG*SMNB NEED BE CALLED FOR EACH SERIES.  FOR SUBSEQUENT TRANFOR-
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:222
//# MATIONS USE *NBSM* AND *SMNB*.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:223
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:224
//*SMNB*		EXIT
// PORT: Fixed ROM slots 22436.
    22436, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22437–22437.
function agcAotUnit1278 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:225
//		TCF	C*MM*N1
// PORT: Fixed ROM slots 22437.
    if slot <> 22437 or instruction <> 6038 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6038, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1278] to agcAotUnit1278@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:226
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:227
//*NBSM*		EXIT
// PORT: Fixed ROM slots 22438.
    22438, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22439–22447.
function agcAotUnit1279 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22442 {
        if slot <= 22440 {
            if slot <= 22439 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:228
//		TCF	C*MM*N3
// PORT: Fixed ROM slots 22439.
                if slot <> 22439 or instruction <> 6049 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:229
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:230
//# 	AX*SR*T COMBINES THE OLD SMNB AND NBSM.  FOR THE NB TO SM
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:231
//# TRANSFORMATION, ENTER WITH +3 IN A.  FOR SM TO NB, ENTER WITH -3.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:232
//# THE VECTOR TO BE TRANSFORMED ARRIVES, AND IS RETURNED, IN VBUF.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:233
//# AX*SR*T EXPECTS TO FIND THE SINES AND COSINES OF THE ANGLES OF ROTATION
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:234
//# AT SINCDU AND COSCDU, IN THE ORDER Y Z X.  A CALL TO CD*TR*GS, WITH
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:235
//# THE 2'S COMPLEMENT ANGLES (ORDER Y Z X) AT CDUSPOT, WILL TAKE CARE OF
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:236
//# THIS.  HERE IS A SAMPLE CALLING SEQUENCE:-
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:237
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:238
//#			TC	CDUTRIGS
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:239
//#			CS	THREE		("CA THREE" FOR NBSM)
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:240
//#			TC	AX*SR*T
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:241
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:242
//# THE CALL TO CD*TR*GS NEED NOT BE REPEATED, WHEN AX*SR*T IS CALLED MORE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:243
//# THAN ONCE, UNLESS THE ANGLES HAVE CHANGED.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:244
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:245
//# 	AX*SR*T IS GUARANTEED SAFE ONLY FOR VECTORS OF MAGNITUDE LESS THAN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:246
//# UNITY.  A LOOK AT THE CASE IN WHICH A VECTOR OF GREATER MAGNITUDE
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:247
//# HAPPENS TO LIE ALONG AN AXIS OF THE SYSTEM TO WHICH IT IS TO BE TRANS-
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:248
//# FORMED CONVINCES ONE THAT THIS IS A RESTRICTION WHICH MUST BE ACCEPTED.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:249
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:250
//AX*SR*T		TS	DEXDEX		# WHERE IT BECOMES THE INDEX OF INDEXES
// PORT: Fixed ROM slots 22440.
                if slot <> 22440 or instruction <> 22626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22626, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22441 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:251
//		EXTEND
// PORT: Fixed ROM slots 22441.
                if slot <> 22441 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:252
//		QXCH	RTNSAVER
// PORT: Fixed ROM slots 22442.
                if slot <> 22442 or instruction <> 9317 { return choose false if checkOnly else -1. }
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
        if slot <= 22444 {
            if slot <= 22443 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:253
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:254
//R*TL**P		CCS	DEXDEX		#       	+3 --> 0	-3 --> 2
// PORT: Fixed ROM slots 22443.
                if slot <> 22443 or instruction <> 4194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 98).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:255
//		CS	DEXDEX		# THUS:		+2 --> 1	-2 --> 1
// PORT: Fixed ROM slots 22444.
                if slot <> 22444 or instruction <> 16482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 98).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22445 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:256
//		AD	THREE		#		+1 --> 2	-1 --> 0
// PORT: Fixed ROM slots 22445.
                if slot <> 22445 or instruction <> 27788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22446 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:257
//# Page 1370
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:258
//		EXTEND
// PORT: Fixed ROM slots 22446.
                    if slot <> 22446 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:259
//		INDEX	A
// PORT: Fixed ROM slots 22447.
                    if slot <> 22447 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1279] to agcAotUnit1279@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:260
//		DCA	INDEXI
// PORT: Fixed ROM slots 22448.
    22448, 28606
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22449–22453.
function agcAotUnit1280 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22450 {
        if slot <= 22449 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:261
//		DXCH	DEXI
// PORT: Fixed ROM slots 22449.
            if slot <> 22449 or instruction <> 21604 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 100, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:262
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:263
//		CA	ONE
// PORT: Fixed ROM slots 22450.
            if slot <> 22450 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
        if slot <= 22451 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:264
//		TS	BUF
// PORT: Fixed ROM slots 22451.
            if slot <> 22451 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22452 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:265
//		EXTEND
// PORT: Fixed ROM slots 22452.
                if slot <> 22452 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:266
//		INDEX	DEX1
// PORT: Fixed ROM slots 22453.
                if slot <> 22453 or instruction <> 20579 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1280] to agcAotUnit1280@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:267
//		DCS	VBUF
// PORT: Fixed ROM slots 22454.
    22454, 32934
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22455–22471.
function agcAotUnit1281 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22462 {
        if slot <= 22458 {
            if slot <= 22456 {
                if slot <= 22455 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:268
//		TCF	LOOP1		# REALLY BE A SUBTRACT, AND VICE VERSA
// PORT: Fixed ROM slots 22455.
                    if slot <> 22455 or instruction <> 6073 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6073, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:269
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:270
//LOOP2		DXCH	BUF		# LOADING VECTOR COMPONENT, STORING INDEX
// PORT: Fixed ROM slots 22456.
                    if slot <> 22456 or instruction <> 21593 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22457 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:271
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:272
//LOOP1		DXCH	MPAC
// PORT: Fixed ROM slots 22457.
                    if slot <> 22457 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:273
//		CA	SINESLOC
// PORT: Fixed ROM slots 22458.
                    if slot <> 22458 or instruction <> 14301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2013), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22460 {
                if slot <= 22459 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:274
//		AD	DEX1
// PORT: Fixed ROM slots 22459.
                    if slot <> 22459 or instruction <> 24675 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 99).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:275
//		TS	ADDRWD
// PORT: Fixed ROM slots 22460.
                    if slot <> 22460 or instruction <> 22606 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22606, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22461 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:276
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:277
//		TC	DMPSUB		# MULTIPLY BY SIN(CDUANGLE)
// PORT: Fixed ROM slots 22461.
                    if slot <> 22461 or instruction <> 3630 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3630, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:278
//		CCS	DEXDEX
// PORT: Fixed ROM slots 22462.
                    if slot <> 22462 or instruction <> 4194 { return choose false if checkOnly else -1. }
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
        if slot <= 22466 {
            if slot <= 22464 {
                if slot <= 22463 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:279
//		DXCH	MPAC		# NBSM CASE
// PORT: Fixed ROM slots 22463.
                    if slot <> 22463 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:280
//		TCF	+3
// PORT: Fixed ROM slots 22464.
                    if slot <> 22464 or instruction <> 6083 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6083, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22465 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:281
//		EXTEND			# SMNB CASE
// PORT: Fixed ROM slots 22465.
                    if slot <> 22465 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:282
//		DCS	MPAC
// PORT: Fixed ROM slots 22466.
                    if slot <> 22466 or instruction <> 16493 { return choose false if checkOnly else -1. }
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
            if slot <= 22468 {
                if slot <= 22467 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:283
//		DXCH	TERM1TMP
// PORT: Fixed ROM slots 22467.
                    if slot <> 22467 or instruction <> 21596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:284
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:285
//		CA	SIX		# SINCDU AND COSCDU (EACH 6 WORDS) MUST
// PORT: Fixed ROM slots 22468.
                    if slot <> 22468 or instruction <> 15497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22469 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:286
//		ADS	ADDRWD		#	BE CONSECUTIVE AND IN THAT ORDER
// PORT: Fixed ROM slots 22469.
                    if slot <> 22469 or instruction <> 11342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 78).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22470 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:287
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:288
//		EXTEND
// PORT: Fixed ROM slots 22470.
                        if slot <> 22470 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:289
//		INDEX	BUF
// PORT: Fixed ROM slots 22471.
                        if slot <> 22471 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1281] to agcAotUnit1281@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:290
//		INDEX	DEX1
// PORT: Fixed ROM slots 22472.
    22472, 41158,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:291
//		DCA	VBUF
// PORT: Fixed ROM slots 22473.
    22473, 24742
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22474–22480.
function agcAotUnit1282 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22476 {
        if slot <= 22474 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:292
//		DXCH	MPAC
// PORT: Fixed ROM slots 22474.
            if slot <> 22474 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22475 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:293
//		TC	DMPSUB		# MULTIPLY BY COS(CDUANGLE)
// PORT: Fixed ROM slots 22475.
                if slot <> 22475 or instruction <> 3630 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3630, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:294
//		DXCH	MPAC
// PORT: Fixed ROM slots 22476.
                if slot <> 22476 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22478 {
            if slot <= 22477 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:295
//		DAS	TERM1TMP
// PORT: Fixed ROM slots 22477.
                if slot <> 22477 or instruction <> 8284 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 92) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:296
//		DXCH	TERM1TMP
// PORT: Fixed ROM slots 22478.
                if slot <> 22478 or instruction <> 21596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22479 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:297
//		DDOUBL
// PORT: Fixed ROM slots 22479.
                if slot <> 22479 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:298
//		INDEX	BUF
// PORT: Fixed ROM slots 22480.
                if slot <> 22480 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1282] to agcAotUnit1282@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:299
//		INDEX	DEX1
// PORT: Fixed ROM slots 22481.
    22481, 41158,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:300
//		DXCH	VBUF
// PORT: Fixed ROM slots 22482.
    22482, 43174
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22483–22492.
function agcAotUnit1283 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22487 {
        if slot <= 22484 {
            if slot <= 22483 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:301
//		DXCH	BUF		# LOADING INDEX, STORING VECTOR COMPONENT
// PORT: Fixed ROM slots 22483.
                if slot <> 22483 or instruction <> 21593 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:302
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:303
//		CCS	A		# 'CAUSE THAT'S WHERE THE INDEX NOW IS
// PORT: Fixed ROM slots 22484.
                if slot <> 22484 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22485 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:304
//		TCF	LOOP2
// PORT: Fixed ROM slots 22485.
                if slot <> 22485 or instruction <> 6072 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6072, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22486 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:305
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:306
//		EXTEND
// PORT: Fixed ROM slots 22486.
                    if slot <> 22486 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:307
//		DIM	DEXDEX		# DECREMENT MAGNITUDE PRESERVING SIGN
// PORT: Fixed ROM slots 22487.
                    if slot <> 22487 or instruction <> 11362 { return choose false if checkOnly else -1. }
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
        if slot <= 22489 {
            if slot <= 22488 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:308
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:309
//# Page 1371
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:310
//TSTPOINT	CCS	DEXDEX		# ONLY THE BRANCHING FUNCTION IS USED
// PORT: Fixed ROM slots 22488.
                if slot <> 22488 or instruction <> 4194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 98).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:311
//		TCF	R*TL**P
// PORT: Fixed ROM slots 22489.
                if slot <> 22489 or instruction <> 6059 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6059, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22490 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:312
//		TC	RTNSAVER
// PORT: Fixed ROM slots 22490.
                if slot <> 22490 or instruction <> 101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22491 {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:313
//		TCF	R*TL**P
// PORT: Fixed ROM slots 22491.
                    if slot <> 22491 or instruction <> 6059 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6059, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:314
//		TC	RTNSAVER
// PORT: Fixed ROM slots 22492.
                    if slot <> 22492 or instruction <> 101 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1283] to agcAotUnit1283@.

agcAotInstallSourceRope(list(
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:315
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:316
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:317
//SINESLOC	ADRES	SINCDU		# FOR USE IN SETTING ADDRWD
// PORT: Fixed ROM slots 22493.
    22493, 956,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:318
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:319
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:320
//INDEXI		DEC	4		# **********   DON'T   ***********
// PORT: Fixed ROM slots 22494.
    22494, 8,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:321
//		DEC	2		# **********   TOUCH   ***********
// PORT: Fixed ROM slots 22495.
    22495, 4,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:322
//		DEC	0		# **********   THESE   ***********
// PORT: Fixed ROM slots 22496.
    22496, 0,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:323
//		DEC	4		# ********** CONSTANTS ***********
// PORT: Fixed ROM slots 22497.
    22497, 8,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:324
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:325
//# ******************************************************************************
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:326
//# Page 1372
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:327
//# THIS SUBROUTINE COMPUTES INCREMENTAL CHANGES IN CDU(GIMBAL) ANGLES FROM INCREMENTAL CHANGES ABOUT SM AXES.  IT
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:328
//# REQUIRES SM INCREMENTS AS A DP VECTOR SCALED AT ONE REVOLUTION(DTHETASM,+2,+4).  SIN,COS(CDUY,Z,X) ARE IN
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:329
//# SINCDU,+2,+4 AND COSCDU,+2,+4 RESPECTIVELY,SCALED TO ONE HALF.  CDU INCREENTS ARE PLACED IN DCDU,+2,+4 SCALED TO
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:330
//# ONE REVOLUTION.
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:331
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:332
//#	*  COS(IGA)SEC(MGA)		0		-SIN(IGA)SEC(MGA) *
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:333
//#	*								  *
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:334
//#	* -COS(IGA)TAN(MGA)		1		 SIN(IGA)TAN(MGA) *
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:335
//#	*								  *
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:336
//#	*      SIN(IGA)			0		     COS(IGA)     *
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:337
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:338
//		BANK	14
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:339
//		SETLOC	POWFLIT1
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:340
//		BANK
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:341
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:342
//SMCDURES	DLOAD	DMP
// PORT: Fixed ROM slots 22498.
    22498, 34250,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:343
//			DTHETASM
// PORT: Fixed ROM slots 22499.
    22499, 3348,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:344
//			COSCDUY
// PORT: Fixed ROM slots 22500.
    22500, 970,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:345
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:346
//		PDDL	DMP
// PORT: Fixed ROM slots 22501.
    22501, 34218,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:347
//			DTHETASM +4
// PORT: Fixed ROM slots 22502.
    22502, 3356,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:348
//			SINCDUY
// PORT: Fixed ROM slots 22503.
    22503, 958,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:349
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:350
//		BDSU
// PORT: Fixed ROM slots 22504.
    22504, 65314,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:351
//		DDV
// PORT: Fixed ROM slots 22505.
    22505, 65394,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:352
//			COSCDUZ
// PORT: Fixed ROM slots 22506.
    22506, 974,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:353
//		STORE	DCDU
// PORT: Fixed ROM slots 22507.
    22507, 3336,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:354
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:355
//		DMP	SL1		# SCALE
// PORT: Fixed ROM slots 22508.
    22508, 59914,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:356
//			SINCDUZ
// PORT: Fixed ROM slots 22509.
    22509, 962,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:357
//		BDSU
// PORT: Fixed ROM slots 22510.
    22510, 65314,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:358
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:359
//			DTHETASM +2
// PORT: Fixed ROM slots 22511.
    22511, 3352,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:360
//		STODL	DCDU +2
// PORT: Fixed ROM slots 22512.
    22512, 15628,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:361
//			DTHETASM
// PORT: Fixed ROM slots 22513.
    22513, 3348,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:362
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:363
//		DMP	PDDL
// PORT: Fixed ROM slots 22514.
    22514, 54538,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:364
//			SINCDUY
// PORT: Fixed ROM slots 22515.
    22515, 958,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:365
//			DTHETASM +4
// PORT: Fixed ROM slots 22516.
    22516, 3356,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:366
//
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:367
//		DMP	DAD
// PORT: Fixed ROM slots 22517.
    22517, 36106,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:368
//			COSCDUY
// PORT: Fixed ROM slots 22518.
    22518, 970,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:369
//		SL1
// PORT: Fixed ROM slots 22519.
    22519, 65492,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:370
//		STORE	DCDU +4
// PORT: Fixed ROM slots 22520.
    22520, 3344,
// PORT: SOURCE POWERED_FLIGHT_SUBROUTINES.agc:371
//		RVQ
// PORT: Fixed ROM slots 22521.
    22521, 65308
)).

