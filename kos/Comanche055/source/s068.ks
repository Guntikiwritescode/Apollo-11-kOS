// PORT: Original source unit STABLE_ORBIT.agc.
// PORT: Physical bank 04. Shared continuation entries, slots 6626–6633.
function agcAotUnit396 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6629 {
        if slot <= 6627 {
            if slot <= 6626 {
// PORT: SOURCE STABLE_ORBIT.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE STABLE_ORBIT.agc:2
//# Filename:     STABLE_ORBIT.agc
// PORT: SOURCE STABLE_ORBIT.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE STABLE_ORBIT.agc:4
//#               It is part of the source code for the Command Module's (CM)
// PORT: SOURCE STABLE_ORBIT.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE STABLE_ORBIT.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE STABLE_ORBIT.agc:7
//# Contact:      Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE STABLE_ORBIT.agc:8
//# Website:      www.ibiblio.org/apollo.
// PORT: SOURCE STABLE_ORBIT.agc:9
//# Pages:	525-532
// PORT: SOURCE STABLE_ORBIT.agc:10
//# Mod history:  2009-05-10 HG    Started adapting from the Colossus249/ file
// PORT: SOURCE STABLE_ORBIT.agc:11
//#                of the same name, using Comanche055 page
// PORT: SOURCE STABLE_ORBIT.agc:12
//#                images 0525.jpg - 0532.jpg.
// PORT: SOURCE STABLE_ORBIT.agc:13
//#
// PORT: SOURCE STABLE_ORBIT.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE STABLE_ORBIT.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE STABLE_ORBIT.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE STABLE_ORBIT.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE STABLE_ORBIT.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE STABLE_ORBIT.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE STABLE_ORBIT.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE STABLE_ORBIT.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE STABLE_ORBIT.agc:22
//#
// PORT: SOURCE STABLE_ORBIT.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE STABLE_ORBIT.agc:24
//#
// PORT: SOURCE STABLE_ORBIT.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE STABLE_ORBIT.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE STABLE_ORBIT.agc:27
//#
// PORT: SOURCE STABLE_ORBIT.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE STABLE_ORBIT.agc:29
//#            Colossus 2A
// PORT: SOURCE STABLE_ORBIT.agc:30
//# Page 525
// PORT: SOURCE STABLE_ORBIT.agc:31
//# STABLE ORBIT RENDEZVOUS PROGRAMS (P38 AND P78)
// PORT: SOURCE STABLE_ORBIT.agc:32
//#
// PORT: SOURCE STABLE_ORBIT.agc:33
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// PORT: SOURCE STABLE_ORBIT.agc:34
//# MOD BY RUDNICKI.S	DATE 25JAN68
// PORT: SOURCE STABLE_ORBIT.agc:35
//#
// PORT: SOURCE STABLE_ORBIT.agc:36
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE STABLE_ORBIT.agc:37
//#
// PORT: SOURCE STABLE_ORBIT.agc:38
//#	P38 AND P78 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// PORT: SOURCE STABLE_ORBIT.agc:39
//#	CONDITIONS REQUIRED BY THE AGC TO (1) PUT THE ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:40
//#	ON A TRANSFER TRAJECTORY THAT INTERCEPTS THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:41
//#	ORBIT A GIVEN DISTANCE, DELTA R, EITHER AHEAD OF OR BEHIND THE
// PORT: SOURCE STABLE_ORBIT.agc:42
//#	PASSIVE VEHICLE AND (2) ACTUALLY PLACE THE ACTIVE VEHICLE IN THE
// PORT: SOURCE STABLE_ORBIT.agc:43
//#	PASSIVE VEHICLE ORBIT WITH A DELTA R SEPARATION BETWEEN THE TWO
// PORT: SOURCE STABLE_ORBIT.agc:44
//#	VEHICLES
// PORT: SOURCE STABLE_ORBIT.agc:45
//#
// PORT: SOURCE STABLE_ORBIT.agc:46
//# CALLING SEQUENCE
// PORT: SOURCE STABLE_ORBIT.agc:47
//#
// PORT: SOURCE STABLE_ORBIT.agc:48
//#	ASTRONAUT REQUEST THRU DSKY
// PORT: SOURCE STABLE_ORBIT.agc:49
//#
// PORT: SOURCE STABLE_ORBIT.agc:50
//#	V37E38E		IF THIS VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:51
//#	V37E78E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:52
//#
// PORT: SOURCE STABLE_ORBIT.agc:53
//# INPUT
// PORT: SOURCE STABLE_ORBIT.agc:54
//#
// PORT: SOURCE STABLE_ORBIT.agc:55
//#	(1)	SOI MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:56
//#
// PORT: SOURCE STABLE_ORBIT.agc:57
//#		(A)  TIG	TIME OF SOI MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:58
//#		(B)  CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:59
//#				DURING TRANSFER FROM TIG TO TIME OF INTERCEPT
// PORT: SOURCE STABLE_ORBIT.agc:60
//#		(C)  DELTAR	THE DESIRED SEPARATION OF THE TWO VEHICLES
// PORT: SOURCE STABLE_ORBIT.agc:61
//#				SPECIFIED AS A DISTANCE ALONG THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:62
//#				ORBIT
// PORT: SOURCE STABLE_ORBIT.agc:63
//#		(D)  OPTION	EQUALS 1 FOR SOI
// PORT: SOURCE STABLE_ORBIT.agc:64
//#
// PORT: SOURCE STABLE_ORBIT.agc:65
//#	(2)	SOR MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:66
//#
// PORT: SOURCE STABLE_ORBIT.agc:67
//#		(A)  TIG	TIME OF SOR MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:68
//#		(B)  CENTANG	AN OPTIONAL RESPECIFICATION OF 1 (B) ABOVE
// PORT: SOURCE STABLE_ORBIT.agc:69
//#		(C)  OPTION	EQUALS 2 FOR SOR
// PORT: SOURCE STABLE_ORBIT.agc:70
//#		(D)  DELTTIME	THE TIME REQUIRED TO TRAVERSE DELTA R WHEN
// PORT: SOURCE STABLE_ORBIT.agc:71
//#				TRAVELING AT A VELOCITY EQUAL TO THE HORIZONTAL
// PORT: SOURCE STABLE_ORBIT.agc:72
//#				VELOCITY OF THE PASSIVE VEHICLE - SAVED FROM
// PORT: SOURCE STABLE_ORBIT.agc:73
//#				SOI PHASE
// PORT: SOURCE STABLE_ORBIT.agc:74
//#		(E)  TINT	TIME OF INTERCEPT (SOI) - SAVED FROM SOI PHASE
// PORT: SOURCE STABLE_ORBIT.agc:75
//#
// PORT: SOURCE STABLE_ORBIT.agc:76
//# OUTPUT
// PORT: SOURCE STABLE_ORBIT.agc:77
//#
// PORT: SOURCE STABLE_ORBIT.agc:78
//#	(1)  TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE STABLE_ORBIT.agc:79
//#	(2)  TTOGO	TIME TO GO
// PORT: SOURCE STABLE_ORBIT.agc:80
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE STABLE_ORBIT.agc:81
//# Page 526
// PORT: SOURCE STABLE_ORBIT.agc:82
//#	(4)  DSPTEM1	TIME OF INTERCEPT OF PASSIVE VEHICLE ORBIT
// PORT: SOURCE STABLE_ORBIT.agc:83
//#			(FOR SOI ONLY)
// PORT: SOURCE STABLE_ORBIT.agc:84
//#	(5)  POSTTPI	PERIGEE ALTITUDE OF ACTIVE VEHICLE ORBIT AFTER
// PORT: SOURCE STABLE_ORBIT.agc:85
//#			THE SOI (SOR) MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:86
//#	(6)  DELVTPI	MAGNITUDE OF DELTA V AT SOI (SOR) TIME
// PORT: SOURCE STABLE_ORBIT.agc:87
//#	(7)  DELVTPF	MAGNITUDE OF DELTA V AT INTERCEPT TIME
// PORT: SOURCE STABLE_ORBIT.agc:88
//#	(8)  DELVLVC	DELTA VELOCITY AT SOI (AND SOR) - LOCAL VERTICAL
// PORT: SOURCE STABLE_ORBIT.agc:89
//#			COORDINATES
// PORT: SOURCE STABLE_ORBIT.agc:90
//#
// PORT: SOURCE STABLE_ORBIT.agc:91
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:92
//#
// PORT: SOURCE STABLE_ORBIT.agc:93
//#	AVFLAGA
// PORT: SOURCE STABLE_ORBIT.agc:94
//#	AVFLAGP
// PORT: SOURCE STABLE_ORBIT.agc:95
//#	VNDSPLY
// PORT: SOURCE STABLE_ORBIT.agc:96
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:97
//#	GOFLASHR
// PORT: SOURCE STABLE_ORBIT.agc:98
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:99
//#	BLANKET
// PORT: SOURCE STABLE_ORBIT.agc:100
//#	ENDOFJOB
// PORT: SOURCE STABLE_ORBIT.agc:101
//#	PREC/TT
// PORT: SOURCE STABLE_ORBIT.agc:102
//#	SELECTMU
// PORT: SOURCE STABLE_ORBIT.agc:103
//#	INTRPVP
// PORT: SOURCE STABLE_ORBIT.agc:104
//#	MAINRTNE
// PORT: SOURCE STABLE_ORBIT.agc:105
//
// PORT: SOURCE STABLE_ORBIT.agc:106
//		BANK	04
// PORT: SOURCE STABLE_ORBIT.agc:107
//		SETLOC	STBLEORB
// PORT: SOURCE STABLE_ORBIT.agc:108
//		BANK
// PORT: SOURCE STABLE_ORBIT.agc:109
//
// PORT: SOURCE STABLE_ORBIT.agc:110
//		EBANK=	SUBEXIT
// PORT: SOURCE STABLE_ORBIT.agc:111
//		COUNT*	$$/P3879
// PORT: SOURCE STABLE_ORBIT.agc:112
//
// PORT: SOURCE STABLE_ORBIT.agc:113
//P38		TC	AVFLAGA         # THIS VEHICLE ACTIVE
// PORT: Fixed ROM slots 6626.
                if slot <> 6626 or instruction <> 2455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:114
//		TC      +2
// PORT: Fixed ROM slots 6627.
                if slot <> 6627 or instruction <> 1509 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1509, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6628 {
// PORT: SOURCE STABLE_ORBIT.agc:115
//P78		TC	AVFLAGP         # OTHER VEHICLE ACTIVE
// PORT: Fixed ROM slots 6628.
                if slot <> 6628 or instruction <> 2466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:116
//		TC      P20FLGON        # SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 6629.
                if slot <> 6629 or instruction <> 2471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6631 {
            if slot <= 6630 {
// PORT: SOURCE STABLE_ORBIT.agc:117
//		CAF	V06N33SR	# DISPLAY TIG
// PORT: Fixed ROM slots 6630.
                if slot <> 6630 or instruction <> 14012 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1724), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:118
//		TC	VNDSPLY
// PORT: Fixed ROM slots 6631.
                if slot <> 6631 or instruction <> 1715 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6632 {
// PORT: SOURCE STABLE_ORBIT.agc:119
//		CAF	V06N55SR	# DISPLAY CENTANG
// PORT: Fixed ROM slots 6632.
                if slot <> 6632 or instruction <> 14013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1725), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:120
//		TCR	BANKCALL
// PORT: Fixed ROM slots 6633.
                if slot <> 6633 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[396] to agcAotUnit396@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:121
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 6634.
    6634, 17502
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6635–6646.
function agcAotUnit397 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6640 {
        if slot <= 6637 {
            if slot <= 6635 {
// PORT: SOURCE STABLE_ORBIT.agc:122
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 6635.
                if slot <> 6635 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6636 {
// PORT: SOURCE STABLE_ORBIT.agc:123
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 6636.
                    if slot <> 6636 or instruction <> 5617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5617, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:124
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 6637.
                    if slot <> 6637 or instruction <> 5608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5608, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6638 {
// PORT: SOURCE STABLE_ORBIT.agc:125
//		CAF	THREE		# IMMEDIATE RETURN - BLANK R1, R2
// PORT: Fixed ROM slots 6638.
                if slot <> 6638 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6639 {
// PORT: SOURCE STABLE_ORBIT.agc:126
//		TCR	BLANKET
// PORT: Fixed ROM slots 6639.
                    if slot <> 6639 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:127
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 6640.
                    if slot <> 6640 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6643 {
            if slot <= 6641 {
// PORT: SOURCE STABLE_ORBIT.agc:128
//		CAF	FIVE
// PORT: Fixed ROM slots 6641.
                if slot <> 6641 or instruction <> 14866 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6642 {
// PORT: SOURCE STABLE_ORBIT.agc:129
//		TS	OPTION1
// PORT: Fixed ROM slots 6642.
                    if slot <> 6642 or instruction <> 23129 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23129, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:130
//		CAF	ONE
// PORT: Fixed ROM slots 6643.
                    if slot <> 6643 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6644 {
// PORT: SOURCE STABLE_ORBIT.agc:131
//		TS	OPTION2		# OPTION CODE IS SET TO 1
// PORT: Fixed ROM slots 6644.
                if slot <> 6644 or instruction <> 23130 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23130, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6645 {
// PORT: SOURCE STABLE_ORBIT.agc:132
//# Page 527
// PORT: SOURCE STABLE_ORBIT.agc:133
//		CAF	V04N06SR	# DISPLAY OPTION CODE - 1 = SOI, 2 = SOR
// PORT: Fixed ROM slots 6645.
                    if slot <> 6645 or instruction <> 14014 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1726), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:134
//		TCR	BANKCALL
// PORT: Fixed ROM slots 6646.
                    if slot <> 6646 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[397] to agcAotUnit397@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:135
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 6647.
    6647, 17502
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6648–6654.
function agcAotUnit398 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6650 {
        if slot <= 6648 {
// PORT: SOURCE STABLE_ORBIT.agc:136
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 6648.
            if slot <> 6648 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6649 {
// PORT: SOURCE STABLE_ORBIT.agc:137
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 6649.
                if slot <> 6649 or instruction <> 5630 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5630, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:138
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 6650.
                if slot <> 6650 or instruction <> 5621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5621, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6652 {
            if slot <= 6651 {
// PORT: SOURCE STABLE_ORBIT.agc:139
//		CAF	BIT3		# IMMEDIATE RETURN - BLANK R3
// PORT: Fixed ROM slots 6651.
                if slot <> 6651 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:140
//		TCR	BLANKET
// PORT: Fixed ROM slots 6652.
                if slot <> 6652 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6653 {
// PORT: SOURCE STABLE_ORBIT.agc:141
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 6653.
                if slot <> 6653 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:142
//		TC	INTPRET
// PORT: Fixed ROM slots 6654.
                if slot <> 6654 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[398] to agcAotUnit398@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:143
//		SSP
// PORT: Fixed ROM slots 6655.
    6655, 65458,
// PORT: SOURCE STABLE_ORBIT.agc:144
//		        NN
// PORT: Fixed ROM slots 6656.
    6656, 4076,
// PORT: SOURCE STABLE_ORBIT.agc:145
//		        2
// PORT: Fixed ROM slots 6657.
    6657, 4,
// PORT: SOURCE STABLE_ORBIT.agc:146
//		SLOAD   SR1
// PORT: Fixed ROM slots 6658.
    6658, 58042,
// PORT: SOURCE STABLE_ORBIT.agc:147
//			OPTION2
// PORT: Fixed ROM slots 6659.
    6659, 1206,
// PORT: SOURCE STABLE_ORBIT.agc:148
//		BHIZ	DLOAD
// PORT: Fixed ROM slots 6660.
    6660, 58672,
// PORT: SOURCE STABLE_ORBIT.agc:149
//			OPTN1
// PORT: Fixed ROM slots 6661.
    6661, 9238,
// PORT: SOURCE STABLE_ORBIT.agc:150
//			TINT
// PORT: Fixed ROM slots 6662.
    6662, 3932,
// PORT: SOURCE STABLE_ORBIT.agc:151
//		STORE	TINTSOI		# STORE FOR SOR PHASE
// PORT: Fixed ROM slots 6663.
    6663, 2834,
// PORT: SOURCE STABLE_ORBIT.agc:152
//		CLRGO
// PORT: Fixed ROM slots 6664.
    6664, 65304,
// PORT: SOURCE STABLE_ORBIT.agc:153
//			OPTNSW		# OPTNSW; ON = SOI, OFF = SOR
// PORT: Fixed ROM slots 6665.
    6665, 1328,
// PORT: SOURCE STABLE_ORBIT.agc:154
//			JUNCTN1
// PORT: Fixed ROM slots 6666.
    6666, 9284,
// PORT: SOURCE STABLE_ORBIT.agc:155
//OPTN1		SET	CLEAR		# SOI
// PORT: Fixed ROM slots 6667.
    6667, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:156
//			OPTNSW
// PORT: Fixed ROM slots 6668.
    6668, 1136,
// PORT: SOURCE STABLE_ORBIT.agc:157
//			UPDATFLG
// PORT: Fixed ROM slots 6669.
    6669, 880,
// PORT: SOURCE STABLE_ORBIT.agc:158
//		CALL
// PORT: Fixed ROM slots 6670.
    6670, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:159
//			PREC/TT
// PORT: Fixed ROM slots 6671.
    6671, 9500,
// PORT: SOURCE STABLE_ORBIT.agc:160
//		SET	DAD
// PORT: Fixed ROM slots 6672.
    6672, 36120,
// PORT: SOURCE STABLE_ORBIT.agc:161
//			UPDATFLG
// PORT: Fixed ROM slots 6673.
    6673, 624,
// PORT: SOURCE STABLE_ORBIT.agc:162
//			TIG
// PORT: Fixed ROM slots 6674.
    6674, 3606,
// PORT: SOURCE STABLE_ORBIT.agc:163
//		STORE	TINT		# TI = TIG + TF
// PORT: Fixed ROM slots 6675.
    6675, 3932,
// PORT: SOURCE STABLE_ORBIT.agc:164
//		STORE	DSPTEM1		# FOR DISPLAY
// PORT: Fixed ROM slots 6676.
    6676, 1100,
// PORT: SOURCE STABLE_ORBIT.agc:165
//		EXIT
// PORT: Fixed ROM slots 6677.
    6677, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6678–6679.
function agcAotUnit399 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6678 {
// PORT: SOURCE STABLE_ORBIT.agc:166
//		CAF	V06N57SR	# DISPLAY DELTA R
// PORT: Fixed ROM slots 6678.
        if slot <> 6678 or instruction <> 14015 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1727), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE STABLE_ORBIT.agc:167
//		TCR	BANKCALL
// PORT: Fixed ROM slots 6679.
        if slot <> 6679 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[399] to agcAotUnit399@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:168
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 6680.
    6680, 17502
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6681–6689.
function agcAotUnit400 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6684 {
        if slot <= 6682 {
            if slot <= 6681 {
// PORT: SOURCE STABLE_ORBIT.agc:169
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 6681.
                if slot <> 6681 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:170
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 6682.
                if slot <> 6682 or instruction <> 5663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6683 {
// PORT: SOURCE STABLE_ORBIT.agc:171
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 6683.
                if slot <> 6683 or instruction <> 5654 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5654, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:172
//		CAF	SIX		# IMMEDIATE RETURN - BLANK R2, R3
// PORT: Fixed ROM slots 6684.
                if slot <> 6684 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6686 {
            if slot <= 6685 {
// PORT: SOURCE STABLE_ORBIT.agc:173
//		TCR	BLANKET
// PORT: Fixed ROM slots 6685.
                if slot <> 6685 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:174
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 6686.
                if slot <> 6686 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6687 {
// PORT: SOURCE STABLE_ORBIT.agc:175
//		CAF	V06N34SR	# DISPLAY TIME OF INTERCEPT
// PORT: Fixed ROM slots 6687.
                if slot <> 6687 or instruction <> 14016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1728), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6688 {
// PORT: SOURCE STABLE_ORBIT.agc:176
//		TC	VNDSPLY
// PORT: Fixed ROM slots 6688.
                    if slot <> 6688 or instruction <> 1715 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1715, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:177
//		TC	INTPRET
// PORT: Fixed ROM slots 6689.
                    if slot <> 6689 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[400] to agcAotUnit400@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:178
//JUNCTN1		CLEAR	CALL
// PORT: Fixed ROM slots 6690.
    6690, 37912,
// PORT: SOURCE STABLE_ORBIT.agc:179
//			P39/79SW
// PORT: Fixed ROM slots 6691.
    6691, 4460,
// PORT: SOURCE STABLE_ORBIT.agc:180
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// PORT: Fixed ROM slots 6692.
    6692, 9108,
// PORT: SOURCE STABLE_ORBIT.agc:181
//RECYCLE		CALL
// PORT: Fixed ROM slots 6693.
    6693, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:182
//			PREC/TT
// PORT: Fixed ROM slots 6694.
    6694, 9500,
// PORT: SOURCE STABLE_ORBIT.agc:183
//# Page 528
// PORT: SOURCE STABLE_ORBIT.agc:184
//		BOFF	DLOAD
// PORT: Fixed ROM slots 6695.
    6695, 58648,
// PORT: SOURCE STABLE_ORBIT.agc:185
//			OPTNSW
// PORT: Fixed ROM slots 6696.
    6696, 1488,
// PORT: SOURCE STABLE_ORBIT.agc:186
//			OPTN2
// PORT: Fixed ROM slots 6697.
    6697, 9330,
// PORT: SOURCE STABLE_ORBIT.agc:187
//			TINT
// PORT: Fixed ROM slots 6698.
    6698, 3932,
// PORT: SOURCE STABLE_ORBIT.agc:188
//		STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 6699.
    6699, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:189
//			INTRPVP		#	INTERCEPT TIME
// PORT: Fixed ROM slots 6700.
    6700, 9550,
// PORT: SOURCE STABLE_ORBIT.agc:190
//		VLOAD	UNIT
// PORT: Fixed ROM slots 6701.
    6701, 44794,
// PORT: SOURCE STABLE_ORBIT.agc:191
//			RATT		# RP/(RP)
// PORT: Fixed ROM slots 6702.
    6702, 2,
// PORT: SOURCE STABLE_ORBIT.agc:192
//		PDVL	VXV
// PORT: Fixed ROM slots 6703.
    6703, 40346,
// PORT: SOURCE STABLE_ORBIT.agc:193
//			VATT
// PORT: Fixed ROM slots 6704.
    6704, 14,
// PORT: SOURCE STABLE_ORBIT.agc:194
//		ABVAL	NORM		# (VP X RP/(RP))
// PORT: Fixed ROM slots 6705.
    6705, 49484,
// PORT: SOURCE STABLE_ORBIT.agc:195
//			X1
// PORT: Fixed ROM slots 6706.
    6706, 78,
// PORT: SOURCE STABLE_ORBIT.agc:196
//		PDDL	DDV
// PORT: Fixed ROM slots 6707.
    6707, 47530,
// PORT: SOURCE STABLE_ORBIT.agc:197
//			DELTAR
// PORT: Fixed ROM slots 6708.
    6708, 2834,
// PORT: SOURCE STABLE_ORBIT.agc:198
//		SL*			# DELTA R / (VP X RP/RP)
// PORT: Fixed ROM slots 6709.
    6709, 65374,
// PORT: SOURCE STABLE_ORBIT.agc:199
//			0 -7,1
// PORT: Fixed ROM slots 6710.
    6710, 16628,
// PORT: SOURCE STABLE_ORBIT.agc:200
//		STCALL	DELTTIME	# DELTA T = (RP) DELTA R / (VP X RP)
// PORT: Fixed ROM slots 6711.
    6711, 31510,
// PORT: SOURCE STABLE_ORBIT.agc:201
//			JUNCTN2
// PORT: Fixed ROM slots 6712.
    6712, 9338,
// PORT: SOURCE STABLE_ORBIT.agc:202
//OPTN2		DLOAD	DAD
// PORT: Fixed ROM slots 6713.
    6713, 36298,
// PORT: SOURCE STABLE_ORBIT.agc:203
//			TINTSOI
// PORT: Fixed ROM slots 6714.
    6714, 2834,
// PORT: SOURCE STABLE_ORBIT.agc:204
//			T
// PORT: Fixed ROM slots 6715.
    6715, 62,
// PORT: SOURCE STABLE_ORBIT.agc:205
//		STORE	TINT		# TI = TI + TF
// PORT: Fixed ROM slots 6716.
    6716, 3932,
// PORT: SOURCE STABLE_ORBIT.agc:206
//JUNCTN2		DLOAD	DSU
// PORT: Fixed ROM slots 6717.
    6717, 38346,
// PORT: SOURCE STABLE_ORBIT.agc:207
//			TINT
// PORT: Fixed ROM slots 6718.
    6718, 3932,
// PORT: SOURCE STABLE_ORBIT.agc:208
//			DELTTIME
// PORT: Fixed ROM slots 6719.
    6719, 2838,
// PORT: SOURCE STABLE_ORBIT.agc:209
//		STORE	TARGTIME	# TT = TI - DELTA T
// PORT: Fixed ROM slots 6720.
    6720, 2842,
// PORT: SOURCE STABLE_ORBIT.agc:210
//
// PORT: SOURCE STABLE_ORBIT.agc:211
//# .... MAINRTNE ....
// PORT: SOURCE STABLE_ORBIT.agc:212
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:213
//#
// PORT: SOURCE STABLE_ORBIT.agc:214
//#	S3435.25
// PORT: SOURCE STABLE_ORBIT.agc:215
//#	PERIAPO1
// PORT: SOURCE STABLE_ORBIT.agc:216
//#	SHIFTR1
// PORT: SOURCE STABLE_ORBIT.agc:217
//#	VNDSPLY
// PORT: SOURCE STABLE_ORBIT.agc:218
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:219
//#	GOFLASH
// PORT: SOURCE STABLE_ORBIT.agc:220
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:221
//#	VN1645
// PORT: SOURCE STABLE_ORBIT.agc:222
//
// PORT: SOURCE STABLE_ORBIT.agc:223
//MAINRTNE	STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 6721.
    6721, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:224
//			INTRPVP		#	TARGET TIME
// PORT: Fixed ROM slots 6722.
    6722, 9550,
// PORT: SOURCE STABLE_ORBIT.agc:225
//		DLOAD
// PORT: Fixed ROM slots 6723.
    6723, 65482,
// PORT: SOURCE STABLE_ORBIT.agc:226
//			TIG
// PORT: Fixed ROM slots 6724.
    6724, 3606,
// PORT: SOURCE STABLE_ORBIT.agc:227
//		STORE	INTIME
// PORT: Fixed ROM slots 6725.
    6725, 3718,
// PORT: SOURCE STABLE_ORBIT.agc:228
//		SSP	VLOAD
// PORT: Fixed ROM slots 6726.
    6726, 64946,
// PORT: SOURCE STABLE_ORBIT.agc:229
//			SUBEXIT
// PORT: Fixed ROM slots 6727.
    6727, 2546,
// PORT: SOURCE STABLE_ORBIT.agc:230
//			TEST3979
// PORT: Fixed ROM slots 6728.
    6728, 9368,
// PORT: SOURCE STABLE_ORBIT.agc:231
//			RATT
// PORT: Fixed ROM slots 6729.
    6729, 2,
// PORT: SOURCE STABLE_ORBIT.agc:232
//		CALL
// PORT: Fixed ROM slots 6730.
    6730, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:233
//			S3435.25
// PORT: Fixed ROM slots 6731.
    6731, 60108,
// PORT: SOURCE STABLE_ORBIT.agc:234
//TEST3979	BOFF	BON
// PORT: Fixed ROM slots 6732.
    6732, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:235
//# Page 529
// PORT: SOURCE STABLE_ORBIT.agc:236
//			P39/79SW
// PORT: Fixed ROM slots 6733.
    6733, 4556,
// PORT: SOURCE STABLE_ORBIT.agc:237
//			MAINRTN1
// PORT: Fixed ROM slots 6734.
    6734, 9386,
// PORT: SOURCE STABLE_ORBIT.agc:238
//			FINALFLG
// PORT: Fixed ROM slots 6735.
    6735, 1426,
// PORT: SOURCE STABLE_ORBIT.agc:239
//			P39P79
// PORT: Fixed ROM slots 6736.
    6736, 9382,
// PORT: SOURCE STABLE_ORBIT.agc:240
//		SET
// PORT: Fixed ROM slots 6737.
    6737, 65304,
// PORT: SOURCE STABLE_ORBIT.agc:241
//			UPDATFLG
// PORT: Fixed ROM slots 6738.
    6738, 624,
// PORT: SOURCE STABLE_ORBIT.agc:242
//P39P79		EXIT
// PORT: Fixed ROM slots 6739.
    6739, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6740–6740.
function agcAotUnit401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:243
//		TC	DSPLY81		# FOR P39 AND P79
// PORT: Fixed ROM slots 6740.
    if slot <> 6740 or instruction <> 1642 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1642, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[401] to agcAotUnit401@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:244
//MAINRTN1	VLOAD	ABVAL
// PORT: Fixed ROM slots 6741.
    6741, 42746,
// PORT: SOURCE STABLE_ORBIT.agc:245
//			DELVEET3
// PORT: Fixed ROM slots 6742.
    6742, 3916,
// PORT: SOURCE STABLE_ORBIT.agc:246
//		STOVL	DELVTPI		# DELTA V
// PORT: Fixed ROM slots 6743.
    6743, 23354,
// PORT: SOURCE STABLE_ORBIT.agc:247
//			VPASS4
// PORT: Fixed ROM slots 6744.
    6744, 3904,
// PORT: SOURCE STABLE_ORBIT.agc:248
//		VSU	ABVAL
// PORT: Fixed ROM slots 6745.
    6745, 42578,
// PORT: SOURCE STABLE_ORBIT.agc:249
//			VTPRIME
// PORT: Fixed ROM slots 6746.
    6746, 3872,
// PORT: SOURCE STABLE_ORBIT.agc:250
//		STOVL	DELVTPF		# DELTA V (FINAL) = V'T - VT
// PORT: Fixed ROM slots 6747.
    6747, 23358,
// PORT: SOURCE STABLE_ORBIT.agc:251
//			RACT3
// PORT: Fixed ROM slots 6748.
    6748, 3776,
// PORT: SOURCE STABLE_ORBIT.agc:252
//		PDVL	CALL
// PORT: Fixed ROM slots 6749.
    6749, 38042,
// PORT: SOURCE STABLE_ORBIT.agc:253
//			VIPRIME
// PORT: Fixed ROM slots 6750.
    6750, 3860,
// PORT: SOURCE STABLE_ORBIT.agc:254
//			PERIAPO1	# GET PERIGEE ALTITUDE
// PORT: Fixed ROM slots 6751.
    6751, 38102,
// PORT: SOURCE STABLE_ORBIT.agc:255
//		CALL
// PORT: Fixed ROM slots 6752.
    6752, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:256
//			SHIFTR1
// PORT: Fixed ROM slots 6753.
    6753, 38246,
// PORT: SOURCE STABLE_ORBIT.agc:257
//		STORE	POSTTPI
// PORT: Fixed ROM slots 6754.
    6754, 2882,
// PORT: SOURCE STABLE_ORBIT.agc:258
//		BON	SET
// PORT: Fixed ROM slots 6755.
    6755, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:259
//			FINALFLG
// PORT: Fixed ROM slots 6756.
    6756, 1426,
// PORT: SOURCE STABLE_ORBIT.agc:260
//			DSPLY58
// PORT: Fixed ROM slots 6757.
    6757, 9422,
// PORT: SOURCE STABLE_ORBIT.agc:261
//			UPDATFLG
// PORT: Fixed ROM slots 6758.
    6758, 624,
// PORT: SOURCE STABLE_ORBIT.agc:262
//DSPLY58		EXIT
// PORT: Fixed ROM slots 6759.
    6759, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6760–6764.
function agcAotUnit402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6761 {
        if slot <= 6760 {
// PORT: SOURCE STABLE_ORBIT.agc:263
//		CAF	V06N58SR	# DISPLAY HP, DELTA V, DELTA V (FINAL)
// PORT: Fixed ROM slots 6760.
            if slot <> 6760 or instruction <> 14017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1729), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:264
//		TC	VNDSPLY
// PORT: Fixed ROM slots 6761.
            if slot <> 6761 or instruction <> 1715 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1715, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6762 {
// PORT: SOURCE STABLE_ORBIT.agc:265
//DSPLY81		CAF	V06N81SR	# DISPLAY DELTA V (LV)
// PORT: Fixed ROM slots 6762.
            if slot <> 6762 or instruction <> 14018 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1730), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6763 {
// PORT: SOURCE STABLE_ORBIT.agc:266
//		TC	VNDSPLY
// PORT: Fixed ROM slots 6763.
                if slot <> 6763 or instruction <> 1715 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:267
//		TC	INTPRET
// PORT: Fixed ROM slots 6764.
                if slot <> 6764 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[402] to agcAotUnit402@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:268
//		CLEAR	VLOAD
// PORT: Fixed ROM slots 6765.
    6765, 64792,
// PORT: SOURCE STABLE_ORBIT.agc:269
//			XDELVFLG
// PORT: Fixed ROM slots 6766.
    6766, 1390,
// PORT: SOURCE STABLE_ORBIT.agc:270
//			DELVEET3
// PORT: Fixed ROM slots 6767.
    6767, 3916,
// PORT: SOURCE STABLE_ORBIT.agc:271
//		STCALL	DELVSIN
// PORT: Fixed ROM slots 6768.
    6768, 32588,
// PORT: SOURCE STABLE_ORBIT.agc:272
//			VN1645		# DISPLAY TRKMKCNT, TTOGO, +MGA
// PORT: Fixed ROM slots 6769.
    6769, 60420,
// PORT: SOURCE STABLE_ORBIT.agc:273
//		BON	GOTO
// PORT: Fixed ROM slots 6770.
    6770, 43032,
// PORT: SOURCE STABLE_ORBIT.agc:274
//			P39/79SW
// PORT: Fixed ROM slots 6771.
    6771, 4492,
// PORT: SOURCE STABLE_ORBIT.agc:275
//			P39/P79B
// PORT: Fixed ROM slots 6772.
    6772, 9478,
// PORT: SOURCE STABLE_ORBIT.agc:276
//			RECYCLE
// PORT: Fixed ROM slots 6773.
    6773, 9290
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6774–6783.
function agcAotUnit403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6778 {
        if slot <= 6775 {
            if slot <= 6774 {
// PORT: SOURCE STABLE_ORBIT.agc:277
//
// PORT: SOURCE STABLE_ORBIT.agc:278
//# STABLE ORBIT MIDCOURSE PROGRAM (P39 AND P79)
// PORT: SOURCE STABLE_ORBIT.agc:279
//#
// PORT: SOURCE STABLE_ORBIT.agc:280
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// PORT: SOURCE STABLE_ORBIT.agc:281
//# MOD BY RUDNICKI, S	DATE 25JAN68
// PORT: SOURCE STABLE_ORBIT.agc:282
//#
// PORT: SOURCE STABLE_ORBIT.agc:283
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE STABLE_ORBIT.agc:284
//#
// PORT: SOURCE STABLE_ORBIT.agc:285
//#	P39 AND P79 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// PORT: SOURCE STABLE_ORBIT.agc:286
//#	CONDITIONS REQUIRED BY THE AGC TO MAKE A MIDCOURSE CORRECTION
// PORT: SOURCE STABLE_ORBIT.agc:287
//# Page 530
// PORT: SOURCE STABLE_ORBIT.agc:288
//#	MANEUVER AFTER COMPLETING THE SOI MANEUVER BUT BEFORE MAKING
// PORT: SOURCE STABLE_ORBIT.agc:289
//#	THE SOR MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:290
//#
// PORT: SOURCE STABLE_ORBIT.agc:291
//# CALLING SEQUENCE
// PORT: SOURCE STABLE_ORBIT.agc:292
//#
// PORT: SOURCE STABLE_ORBIT.agc:293
//#	ASTRONAUT REQUEST THRU DSKY
// PORT: SOURCE STABLE_ORBIT.agc:294
//#
// PORT: SOURCE STABLE_ORBIT.agc:295
//#	V37E39E		IF THIS VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:296
//#	V37E79E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:297
//#
// PORT: SOURCE STABLE_ORBIT.agc:298
//# INPUT
// PORT: SOURCE STABLE_ORBIT.agc:299
//#
// PORT: SOURCE STABLE_ORBIT.agc:300
//#	(1)  TPASS4	TIME OF INTERCEPT - SAVED FROM P38/P78
// PORT: SOURCE STABLE_ORBIT.agc:301
//#	(2)  TARGTIME	TIME THAT PASSIVE VEHICLE IS AT INTERCEPT POINT -
// PORT: SOURCE STABLE_ORBIT.agc:302
//#			SAVED FROM P38/P78
// PORT: SOURCE STABLE_ORBIT.agc:303
//#
// PORT: SOURCE STABLE_ORBIT.agc:304
//# OUTPUT
// PORT: SOURCE STABLE_ORBIT.agc:305
//#
// PORT: SOURCE STABLE_ORBIT.agc:306
//#	(1)  TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE STABLE_ORBIT.agc:307
//#	(2)  TTOGO	TIME TO GO
// PORT: SOURCE STABLE_ORBIT.agc:308
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE STABLE_ORBIT.agc:309
//#	(4)  DELVLVC	DELTA VELOCITY AT MID - LOCAL VERTICAL COORDINATES
// PORT: SOURCE STABLE_ORBIT.agc:310
//#
// PORT: SOURCE STABLE_ORBIT.agc:311
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:312
//#
// PORT: SOURCE STABLE_ORBIT.agc:313
//#	AVFLAGA
// PORT: SOURCE STABLE_ORBIT.agc:314
//#	AVFLAGP
// PORT: SOURCE STABLE_ORBIT.agc:315
//#	LOADTIME
// PORT: SOURCE STABLE_ORBIT.agc:316
//#	SELECTMU
// PORT: SOURCE STABLE_ORBIT.agc:317
//#	PRECSET
// PORT: SOURCE STABLE_ORBIT.agc:318
//#	S34/35.1
// PORT: SOURCE STABLE_ORBIT.agc:319
//#	MAINRTNE
// PORT: SOURCE STABLE_ORBIT.agc:320
//
// PORT: SOURCE STABLE_ORBIT.agc:321
//P39		TC	AVFLAGA		# THIS VEHICLE ACTIVE
// PORT: Fixed ROM slots 6774.
                if slot <> 6774 or instruction <> 2455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:322
//		EXTEND
// PORT: Fixed ROM slots 6775.
                if slot <> 6775 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6776 {
// PORT: SOURCE STABLE_ORBIT.agc:323
//		DCA	ATIGINC
// PORT: Fixed ROM slots 6776.
                if slot <> 6776 or instruction <> 13074 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 786, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6777 {
// PORT: SOURCE STABLE_ORBIT.agc:324
//		TC	P39/P79A
// PORT: Fixed ROM slots 6777.
                    if slot <> 6777 or instruction <> 1661 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1661, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:325
//P79		TC	AVFLAGP		# OTHER VEHICLE ACTIVE
// PORT: Fixed ROM slots 6778.
                    if slot <> 6778 or instruction <> 2466 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2466, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6780 {
            if slot <= 6779 {
// PORT: SOURCE STABLE_ORBIT.agc:326
//		EXTEND
// PORT: Fixed ROM slots 6779.
                if slot <> 6779 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:327
//		DCA	PTIGINC
// PORT: Fixed ROM slots 6780.
                if slot <> 6780 or instruction <> 13076 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 788, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6781 {
// PORT: SOURCE STABLE_ORBIT.agc:328
//P39/P79A	DXCH	KT		# TIME TO PREPARE FOR BURN
// PORT: Fixed ROM slots 6781.
                if slot <> 6781 or instruction <> 22516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6782 {
// PORT: SOURCE STABLE_ORBIT.agc:329
//		TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 6782.
                    if slot <> 6782 or instruction <> 2471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:330
//		TC	INTPRET
// PORT: Fixed ROM slots 6783.
                    if slot <> 6783 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[403] to agcAotUnit403@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:331
//		SET	CALL
// PORT: Fixed ROM slots 6784.
    6784, 37912,
// PORT: SOURCE STABLE_ORBIT.agc:332
//			P39/79SW
// PORT: Fixed ROM slots 6785.
    6785, 4204,
// PORT: SOURCE STABLE_ORBIT.agc:333
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// PORT: Fixed ROM slots 6786.
    6786, 9108,
// PORT: SOURCE STABLE_ORBIT.agc:334
//P39/P79B	RTB	DAD
// PORT: Fixed ROM slots 6787.
    6787, 36152,
// PORT: SOURCE STABLE_ORBIT.agc:335
//			LOADTIME
// PORT: Fixed ROM slots 6788.
    6788, 38544,
// PORT: SOURCE STABLE_ORBIT.agc:336
//			KT
// PORT: Fixed ROM slots 6789.
    6789, 2536,
// PORT: SOURCE STABLE_ORBIT.agc:337
//		STORE	TIG		# TIG = T (PRESENT) + PREPARATION TIME
// PORT: Fixed ROM slots 6790.
    6790, 3606,
// PORT: SOURCE STABLE_ORBIT.agc:338
//# Page531
// PORT: SOURCE STABLE_ORBIT.agc:339
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// PORT: Fixed ROM slots 6791.
    6791, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:340
//			PRECSET		#	VEHICLES TO TIG
// PORT: Fixed ROM slots 6792.
    6792, 38170,
// PORT: SOURCE STABLE_ORBIT.agc:341
//		CALL
// PORT: Fixed ROM slots 6793.
    6793, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:342
//			S34/35.1	# GET UNIT NORMAL
// PORT: Fixed ROM slots 6794.
    6794, 61440,
// PORT: SOURCE STABLE_ORBIT.agc:343
//		DLOAD	GOTO
// PORT: Fixed ROM slots 6795.
    6795, 43210,
// PORT: SOURCE STABLE_ORBIT.agc:344
//			TARGTIME
// PORT: Fixed ROM slots 6796.
    6796, 2842,
// PORT: SOURCE STABLE_ORBIT.agc:345
//			MAINRTNE	# CALCULATE DELTA V AND DELTA V (LV)
// PORT: Fixed ROM slots 6797.
    6797, 9346,
// PORT: SOURCE STABLE_ORBIT.agc:346
//
// PORT: SOURCE STABLE_ORBIT.agc:347
//# .... PREC/TT ....
// PORT: SOURCE STABLE_ORBIT.agc:348
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:349
//#
// PORT: SOURCE STABLE_ORBIT.agc:350
//#	PRECSET
// PORT: SOURCE STABLE_ORBIT.agc:351
//#	TIMETHET
// PORT: SOURCE STABLE_ORBIT.agc:352
//#	S34/35.1
// PORT: SOURCE STABLE_ORBIT.agc:353
//
// PORT: SOURCE STABLE_ORBIT.agc:354
//PREC/TT		STQ	DLOAD
// PORT: Fixed ROM slots 6798.
    6798, 58656,
// PORT: SOURCE STABLE_ORBIT.agc:355
//			RTRN
// PORT: Fixed ROM slots 6799.
    6799, 2542,
// PORT: SOURCE STABLE_ORBIT.agc:356
//			TIG
// PORT: Fixed ROM slots 6800.
    6800, 3606,
// PORT: SOURCE STABLE_ORBIT.agc:357
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// PORT: Fixed ROM slots 6801.
    6801, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:358
//			PRECSET		#	VEHICLES TO TIG
// PORT: Fixed ROM slots 6802.
    6802, 38170,
// PORT: SOURCE STABLE_ORBIT.agc:359
//		VLOAD	VSR*
// PORT: Fixed ROM slots 6803.
    6803, 45050,
// PORT: SOURCE STABLE_ORBIT.agc:360
//			RPASS3
// PORT: Fixed ROM slots 6804.
    6804, 3800,
// PORT: SOURCE STABLE_ORBIT.agc:361
//			0,2
// PORT: Fixed ROM slots 6805.
    6805, 48380,
// PORT: SOURCE STABLE_ORBIT.agc:362
//		STODL	RVEC
// PORT: Fixed ROM slots 6806.
    6806, 15198,
// PORT: SOURCE STABLE_ORBIT.agc:363
//			CENTANG
// PORT: Fixed ROM slots 6807.
    6807, 4056,
// PORT: SOURCE STABLE_ORBIT.agc:364
//		PUSH	COS
// PORT: Fixed ROM slots 6808.
    6808, 58892,
// PORT: SOURCE STABLE_ORBIT.agc:365
//		STODL	CSTH
// PORT: Fixed ROM slots 6809.
    6809, 15288,
// PORT: SOURCE STABLE_ORBIT.agc:366
//		SIN	SET
// PORT: Fixed ROM slots 6810.
    6810, 36060,
// PORT: SOURCE STABLE_ORBIT.agc:367
//			RVSW
// PORT: Fixed ROM slots 6811.
    6811, 3692,
// PORT: SOURCE STABLE_ORBIT.agc:368
//		STOVL	SNTH
// PORT: Fixed ROM slots 6812.
    6812, 23476,
// PORT: SOURCE STABLE_ORBIT.agc:369
//			VPASS3
// PORT: Fixed ROM slots 6813.
    6813, 3812,
// PORT: SOURCE STABLE_ORBIT.agc:370
//		VSR*
// PORT: Fixed ROM slots 6814.
    6814, 65374,
// PORT: SOURCE STABLE_ORBIT.agc:371
//			0,2
// PORT: Fixed ROM slots 6815.
    6815, 48380,
// PORT: SOURCE STABLE_ORBIT.agc:372
//		STCALL	VVEC		# GET TRANSFER TIME BASED ON CENTANG OF
// PORT: Fixed ROM slots 6816.
    6816, 31692,
// PORT: SOURCE STABLE_ORBIT.agc:373
//			TIMETHET	#	PASSIVE VEHICLE
// PORT: Fixed ROM slots 6817.
    6817, 21448,
// PORT: SOURCE STABLE_ORBIT.agc:374
//		CALL
// PORT: Fixed ROM slots 6818.
    6818, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:375
//			S34/35.1	# GET UNIT NORMAL
// PORT: Fixed ROM slots 6819.
    6819, 61440,
// PORT: SOURCE STABLE_ORBIT.agc:376
//		DLOAD	GOTO
// PORT: Fixed ROM slots 6820.
    6820, 43210,
// PORT: SOURCE STABLE_ORBIT.agc:377
//			T
// PORT: Fixed ROM slots 6821.
    6821, 62,
// PORT: SOURCE STABLE_ORBIT.agc:378
//			RTRN
// PORT: Fixed ROM slots 6822.
    6822, 2542,
// PORT: SOURCE STABLE_ORBIT.agc:379
//# .... INTRPVP ....
// PORT: SOURCE STABLE_ORBIT.agc:380
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:381
//#
// PORT: SOURCE STABLE_ORBIT.agc:382
//#	CSMPREC
// PORT: SOURCE STABLE_ORBIT.agc:383
//#	LEMPREC
// PORT: SOURCE STABLE_ORBIT.agc:384
//
// PORT: SOURCE STABLE_ORBIT.agc:385
//INTRPVP		STQ	BOFF		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 6823.
    6823, 35872,
// PORT: SOURCE STABLE_ORBIT.agc:386
//			RTRN		#	TDEC1
// PORT: Fixed ROM slots 6824.
    6824, 2542,
// PORT: SOURCE STABLE_ORBIT.agc:387
//			AVFLAG
// PORT: Fixed ROM slots 6825.
    6825, 1492,
// PORT: SOURCE STABLE_ORBIT.agc:388
//			OTHERV
// PORT: Fixed ROM slots 6826.
    6826, 9566,
// PORT: SOURCE STABLE_ORBIT.agc:389
//		CALL
// PORT: Fixed ROM slots 6827.
    6827, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:390
//# Page 532
// PORT: SOURCE STABLE_ORBIT.agc:391
//			CSMPREC
// PORT: Fixed ROM slots 6828.
    6828, 23666,
// PORT: SOURCE STABLE_ORBIT.agc:392
//		GOTO
// PORT: Fixed ROM slots 6829.
    6829, 65360,
// PORT: SOURCE STABLE_ORBIT.agc:393
//			RTRN
// PORT: Fixed ROM slots 6830.
    6830, 2542,
// PORT: SOURCE STABLE_ORBIT.agc:394
//OTHERV		CALL
// PORT: Fixed ROM slots 6831.
    6831, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:395
//			LEMPREC
// PORT: Fixed ROM slots 6832.
    6832, 23690,
// PORT: SOURCE STABLE_ORBIT.agc:396
//		GOTO
// PORT: Fixed ROM slots 6833.
    6833, 65360,
// PORT: SOURCE STABLE_ORBIT.agc:397
//			RTRN
// PORT: Fixed ROM slots 6834.
    6834, 2542
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6835–6839.
function agcAotUnit404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6836 {
        if slot <= 6835 {
// PORT: SOURCE STABLE_ORBIT.agc:398
//# .... VNDSPLY ....
// PORT: SOURCE STABLE_ORBIT.agc:399
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:400
//#
// PORT: SOURCE STABLE_ORBIT.agc:401
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:402
//#	GOFLASH
// PORT: SOURCE STABLE_ORBIT.agc:403
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:404
//
// PORT: SOURCE STABLE_ORBIT.agc:405
//VNDSPLY		EXTEND			# FLASH DISPLAY
// PORT: Fixed ROM slots 6835.
            if slot <> 6835 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:406
//		QXCH	RTRN
// PORT: Fixed ROM slots 6836.
            if slot <> 6836 or instruction <> 10231 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1015, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6837 {
// PORT: SOURCE STABLE_ORBIT.agc:407
//		TS	VERBNOUN
// PORT: Fixed ROM slots 6837.
            if slot <> 6837 or instruction <> 23541 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23541, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6838 {
// PORT: SOURCE STABLE_ORBIT.agc:408
//		CA	VERBNOUN
// PORT: Fixed ROM slots 6838.
                if slot <> 6838 or instruction <> 13301 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1013).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:409
//		TCR	BANKCALL
// PORT: Fixed ROM slots 6839.
                if slot <> 6839 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[404] to agcAotUnit404@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:410
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6840.
    6840, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6841–6843.
function agcAotUnit405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6841 {
// PORT: SOURCE STABLE_ORBIT.agc:411
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 6841.
        if slot <> 6841 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6842 {
// PORT: SOURCE STABLE_ORBIT.agc:412
//		TC	RTRN		# PROCEED
// PORT: Fixed ROM slots 6842.
            if slot <> 6842 or instruction <> 1015 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1015, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:413
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 6843.
            if slot <> 6843 or instruction <> 5814 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5814, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[405] to agcAotUnit405@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:414
//V06N33SR	VN	0633
// PORT: Fixed ROM slots 6844.
    6844, 1602,
// PORT: SOURCE STABLE_ORBIT.agc:415
//V06N55SR	VN	0655
// PORT: Fixed ROM slots 6845.
    6845, 1646,
// PORT: SOURCE STABLE_ORBIT.agc:416
//V04N06SR	VN	0406
// PORT: Fixed ROM slots 6846.
    6846, 1036,
// PORT: SOURCE STABLE_ORBIT.agc:417
//V06N57SR	VN	0657
// PORT: Fixed ROM slots 6847.
    6847, 1650,
// PORT: SOURCE STABLE_ORBIT.agc:418
//V06N34SR	VN	0634
// PORT: Fixed ROM slots 6848.
    6848, 1604,
// PORT: SOURCE STABLE_ORBIT.agc:419
//V06N58SR	VN	0658
// PORT: Fixed ROM slots 6849.
    6849, 1652,
// PORT: SOURCE STABLE_ORBIT.agc:420
//V06N81SR	VN	0681
// PORT: Fixed ROM slots 6850.
    6850, 1698
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE STABLE_ORBIT.agc:421
//
// PORT: SOURCE STABLE_ORBIT.agc:422
//# *** END OF COMEKISS.020 ***
