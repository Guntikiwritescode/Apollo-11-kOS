// STABLE_ORBIT.agc
// bank 04, slots 6626-6633
function agcAotUnit396 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6629 {
        if slot <= 6627 {
            if slot <= 6626 {
// STABLE_ORBIT.agc:1
//# Copyright:    Public domain.
// STABLE_ORBIT.agc:2
//# Filename:     STABLE_ORBIT.agc
// STABLE_ORBIT.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// STABLE_ORBIT.agc:4
//#               It is part of the source code for the Command Module's (CM)
// STABLE_ORBIT.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// STABLE_ORBIT.agc:6
//# Assembler:    yaYUL
// STABLE_ORBIT.agc:7
//# Contact:      Hartmuth Gutsche <hgutsche@xplornet.com>.
// STABLE_ORBIT.agc:8
//# Website:      www.ibiblio.org/apollo.
// STABLE_ORBIT.agc:9
//# Pages:	525-532
// STABLE_ORBIT.agc:10
//# Mod history:  2009-05-10 HG    Started adapting from the Colossus249/ file
// STABLE_ORBIT.agc:11
//#                of the same name, using Comanche055 page
// STABLE_ORBIT.agc:12
//#                images 0525.jpg - 0532.jpg.
// STABLE_ORBIT.agc:13
//#
// STABLE_ORBIT.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// STABLE_ORBIT.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// STABLE_ORBIT.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// STABLE_ORBIT.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// STABLE_ORBIT.agc:18
//# consequent reduction in image quality as well) are available online at
// STABLE_ORBIT.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// STABLE_ORBIT.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// STABLE_ORBIT.agc:21
//# (much) higher-quality images which Paul actually created.
// STABLE_ORBIT.agc:22
//#
// STABLE_ORBIT.agc:23
//# Notations on the hardcopy document read, in part:
// STABLE_ORBIT.agc:24
//#
// STABLE_ORBIT.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// STABLE_ORBIT.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// STABLE_ORBIT.agc:27
//#
// STABLE_ORBIT.agc:28
//#    This AGC program shall also be referred to as
// STABLE_ORBIT.agc:29
//#            Colossus 2A
// STABLE_ORBIT.agc:30
//# Page 525
// STABLE_ORBIT.agc:31
//# STABLE ORBIT RENDEZVOUS PROGRAMS (P38 AND P78)
// STABLE_ORBIT.agc:32
//#
// STABLE_ORBIT.agc:33
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// STABLE_ORBIT.agc:34
//# MOD BY RUDNICKI.S	DATE 25JAN68
// STABLE_ORBIT.agc:35
//#
// STABLE_ORBIT.agc:36
//# FUNCTIONAL DESCRIPTION
// STABLE_ORBIT.agc:37
//#
// STABLE_ORBIT.agc:38
//#	P38 AND P78 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// STABLE_ORBIT.agc:39
//#	CONDITIONS REQUIRED BY THE AGC TO (1) PUT THE ACTIVE VEHICLE
// STABLE_ORBIT.agc:40
//#	ON A TRANSFER TRAJECTORY THAT INTERCEPTS THE PASSIVE VEHICLE
// STABLE_ORBIT.agc:41
//#	ORBIT A GIVEN DISTANCE, DELTA R, EITHER AHEAD OF OR BEHIND THE
// STABLE_ORBIT.agc:42
//#	PASSIVE VEHICLE AND (2) ACTUALLY PLACE THE ACTIVE VEHICLE IN THE
// STABLE_ORBIT.agc:43
//#	PASSIVE VEHICLE ORBIT WITH A DELTA R SEPARATION BETWEEN THE TWO
// STABLE_ORBIT.agc:44
//#	VEHICLES
// STABLE_ORBIT.agc:45
//#
// STABLE_ORBIT.agc:46
//# CALLING SEQUENCE
// STABLE_ORBIT.agc:47
//#
// STABLE_ORBIT.agc:48
//#	ASTRONAUT REQUEST THRU DSKY
// STABLE_ORBIT.agc:49
//#
// STABLE_ORBIT.agc:50
//#	V37E38E		IF THIS VEHICLE IS ACTIVE VEHICLE
// STABLE_ORBIT.agc:51
//#	V37E78E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// STABLE_ORBIT.agc:52
//#
// STABLE_ORBIT.agc:53
//# INPUT
// STABLE_ORBIT.agc:54
//#
// STABLE_ORBIT.agc:55
//#	(1)	SOI MANEUVER
// STABLE_ORBIT.agc:56
//#
// STABLE_ORBIT.agc:57
//#		(A)  TIG	TIME OF SOI MANEUVER
// STABLE_ORBIT.agc:58
//#		(B)  CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE
// STABLE_ORBIT.agc:59
//#				DURING TRANSFER FROM TIG TO TIME OF INTERCEPT
// STABLE_ORBIT.agc:60
//#		(C)  DELTAR	THE DESIRED SEPARATION OF THE TWO VEHICLES
// STABLE_ORBIT.agc:61
//#				SPECIFIED AS A DISTANCE ALONG THE PASSIVE VEHICLE
// STABLE_ORBIT.agc:62
//#				ORBIT
// STABLE_ORBIT.agc:63
//#		(D)  OPTION	EQUALS 1 FOR SOI
// STABLE_ORBIT.agc:64
//#
// STABLE_ORBIT.agc:65
//#	(2)	SOR MANEUVER
// STABLE_ORBIT.agc:66
//#
// STABLE_ORBIT.agc:67
//#		(A)  TIG	TIME OF SOR MANEUVER
// STABLE_ORBIT.agc:68
//#		(B)  CENTANG	AN OPTIONAL RESPECIFICATION OF 1 (B) ABOVE
// STABLE_ORBIT.agc:69
//#		(C)  OPTION	EQUALS 2 FOR SOR
// STABLE_ORBIT.agc:70
//#		(D)  DELTTIME	THE TIME REQUIRED TO TRAVERSE DELTA R WHEN
// STABLE_ORBIT.agc:71
//#				TRAVELING AT A VELOCITY EQUAL TO THE HORIZONTAL
// STABLE_ORBIT.agc:72
//#				VELOCITY OF THE PASSIVE VEHICLE - SAVED FROM
// STABLE_ORBIT.agc:73
//#				SOI PHASE
// STABLE_ORBIT.agc:74
//#		(E)  TINT	TIME OF INTERCEPT (SOI) - SAVED FROM SOI PHASE
// STABLE_ORBIT.agc:75
//#
// STABLE_ORBIT.agc:76
//# OUTPUT
// STABLE_ORBIT.agc:77
//#
// STABLE_ORBIT.agc:78
//#	(1)  TRKMKCNT	NUMBER OF MARKS
// STABLE_ORBIT.agc:79
//#	(2)  TTOGO	TIME TO GO
// STABLE_ORBIT.agc:80
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// STABLE_ORBIT.agc:81
//# Page 526
// STABLE_ORBIT.agc:82
//#	(4)  DSPTEM1	TIME OF INTERCEPT OF PASSIVE VEHICLE ORBIT
// STABLE_ORBIT.agc:83
//#			(FOR SOI ONLY)
// STABLE_ORBIT.agc:84
//#	(5)  POSTTPI	PERIGEE ALTITUDE OF ACTIVE VEHICLE ORBIT AFTER
// STABLE_ORBIT.agc:85
//#			THE SOI (SOR) MANEUVER
// STABLE_ORBIT.agc:86
//#	(6)  DELVTPI	MAGNITUDE OF DELTA V AT SOI (SOR) TIME
// STABLE_ORBIT.agc:87
//#	(7)  DELVTPF	MAGNITUDE OF DELTA V AT INTERCEPT TIME
// STABLE_ORBIT.agc:88
//#	(8)  DELVLVC	DELTA VELOCITY AT SOI (AND SOR) - LOCAL VERTICAL
// STABLE_ORBIT.agc:89
//#			COORDINATES
// STABLE_ORBIT.agc:90
//#
// STABLE_ORBIT.agc:91
//# SUBROUTINES USED
// STABLE_ORBIT.agc:92
//#
// STABLE_ORBIT.agc:93
//#	AVFLAGA
// STABLE_ORBIT.agc:94
//#	AVFLAGP
// STABLE_ORBIT.agc:95
//#	VNDSPLY
// STABLE_ORBIT.agc:96
//#	BANKCALL
// STABLE_ORBIT.agc:97
//#	GOFLASHR
// STABLE_ORBIT.agc:98
//#	GOTOPOOH
// STABLE_ORBIT.agc:99
//#	BLANKET
// STABLE_ORBIT.agc:100
//#	ENDOFJOB
// STABLE_ORBIT.agc:101
//#	PREC/TT
// STABLE_ORBIT.agc:102
//#	SELECTMU
// STABLE_ORBIT.agc:103
//#	INTRPVP
// STABLE_ORBIT.agc:104
//#	MAINRTNE
// STABLE_ORBIT.agc:105
//
// STABLE_ORBIT.agc:106
//		BANK	04
// STABLE_ORBIT.agc:107
//		SETLOC	STBLEORB
// STABLE_ORBIT.agc:108
//		BANK
// STABLE_ORBIT.agc:109
//
// STABLE_ORBIT.agc:110
//		EBANK=	SUBEXIT
// STABLE_ORBIT.agc:111
//		COUNT*	$$/P3879
// STABLE_ORBIT.agc:112
//
// STABLE_ORBIT.agc:113
//P38		TC	AVFLAGA         # THIS VEHICLE ACTIVE
// slot 6626
                if slot <> 6626 or instruction <> 2455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:114
//		TC      +2
// slot 6627
                if slot <> 6627 or instruction <> 1509 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1509, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6628 {
// STABLE_ORBIT.agc:115
//P78		TC	AVFLAGP         # OTHER VEHICLE ACTIVE
// slot 6628
                if slot <> 6628 or instruction <> 2466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:116
//		TC      P20FLGON        # SET UPDATFLG, TRACKFLG
// slot 6629
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
// STABLE_ORBIT.agc:117
//		CAF	V06N33SR	# DISPLAY TIG
// slot 6630
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
// STABLE_ORBIT.agc:118
//		TC	VNDSPLY
// slot 6631
                if slot <> 6631 or instruction <> 1715 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6632 {
// STABLE_ORBIT.agc:119
//		CAF	V06N55SR	# DISPLAY CENTANG
// slot 6632
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
// STABLE_ORBIT.agc:120
//		TCR	BANKCALL
// slot 6633
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
// STABLE_ORBIT.agc:121
//		CADR	GOFLASHR
// slot 6634
    6634, 17502
)).

// bank 04, slots 6635-6646
function agcAotUnit397 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6640 {
        if slot <= 6637 {
            if slot <= 6635 {
// STABLE_ORBIT.agc:122
//		TCF	GOTOPOOH	# TERMINATE
// slot 6635
                if slot <> 6635 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6636 {
// STABLE_ORBIT.agc:123
//		TCF	+5		# PROCEED
// slot 6636
                    if slot <> 6636 or instruction <> 5617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5617, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:124
//		TCF	-5		# RECYCLE
// slot 6637
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
// STABLE_ORBIT.agc:125
//		CAF	THREE		# IMMEDIATE RETURN - BLANK R1, R2
// slot 6638
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
// STABLE_ORBIT.agc:126
//		TCR	BLANKET
// slot 6639
                    if slot <> 6639 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:127
//		TCF	ENDOFJOB
// slot 6640
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
// STABLE_ORBIT.agc:128
//		CAF	FIVE
// slot 6641
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
// STABLE_ORBIT.agc:129
//		TS	OPTION1
// slot 6642
                    if slot <> 6642 or instruction <> 23129 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23129, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:130
//		CAF	ONE
// slot 6643
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
// STABLE_ORBIT.agc:131
//		TS	OPTION2		# OPTION CODE IS SET TO 1
// slot 6644
                if slot <> 6644 or instruction <> 23130 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23130, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6645 {
// STABLE_ORBIT.agc:132
//# Page 527
// STABLE_ORBIT.agc:133
//		CAF	V04N06SR	# DISPLAY OPTION CODE - 1 = SOI, 2 = SOR
// slot 6645
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
// STABLE_ORBIT.agc:134
//		TCR	BANKCALL
// slot 6646
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
// STABLE_ORBIT.agc:135
//		CADR	GOFLASHR
// slot 6647
    6647, 17502
)).

// bank 04, slots 6648-6654
function agcAotUnit398 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6650 {
        if slot <= 6648 {
// STABLE_ORBIT.agc:136
//		TCF	GOTOPOOH	# TERMINATE
// slot 6648
            if slot <> 6648 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6649 {
// STABLE_ORBIT.agc:137
//		TCF	+5		# PROCEED
// slot 6649
                if slot <> 6649 or instruction <> 5630 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5630, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:138
//		TCF	-5		# RECYCLE
// slot 6650
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
// STABLE_ORBIT.agc:139
//		CAF	BIT3		# IMMEDIATE RETURN - BLANK R3
// slot 6651
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
// STABLE_ORBIT.agc:140
//		TCR	BLANKET
// slot 6652
                if slot <> 6652 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6653 {
// STABLE_ORBIT.agc:141
//		TCF	ENDOFJOB
// slot 6653
                if slot <> 6653 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:142
//		TC	INTPRET
// slot 6654
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
// STABLE_ORBIT.agc:143
//		SSP
// slot 6655
    6655, 65458,
// STABLE_ORBIT.agc:144
//		        NN
// slot 6656
    6656, 4076,
// STABLE_ORBIT.agc:145
//		        2
// slot 6657
    6657, 4,
// STABLE_ORBIT.agc:146
//		SLOAD   SR1
// slot 6658
    6658, 58042,
// STABLE_ORBIT.agc:147
//			OPTION2
// slot 6659
    6659, 1206,
// STABLE_ORBIT.agc:148
//		BHIZ	DLOAD
// slot 6660
    6660, 58672,
// STABLE_ORBIT.agc:149
//			OPTN1
// slot 6661
    6661, 9238,
// STABLE_ORBIT.agc:150
//			TINT
// slot 6662
    6662, 3932,
// STABLE_ORBIT.agc:151
//		STORE	TINTSOI		# STORE FOR SOR PHASE
// slot 6663
    6663, 2834,
// STABLE_ORBIT.agc:152
//		CLRGO
// slot 6664
    6664, 65304,
// STABLE_ORBIT.agc:153
//			OPTNSW		# OPTNSW; ON = SOI, OFF = SOR
// slot 6665
    6665, 1328,
// STABLE_ORBIT.agc:154
//			JUNCTN1
// slot 6666
    6666, 9284,
// STABLE_ORBIT.agc:155
//OPTN1		SET	CLEAR		# SOI
// slot 6667
    6667, 35864,
// STABLE_ORBIT.agc:156
//			OPTNSW
// slot 6668
    6668, 1136,
// STABLE_ORBIT.agc:157
//			UPDATFLG
// slot 6669
    6669, 880,
// STABLE_ORBIT.agc:158
//		CALL
// slot 6670
    6670, 65320,
// STABLE_ORBIT.agc:159
//			PREC/TT
// slot 6671
    6671, 9500,
// STABLE_ORBIT.agc:160
//		SET	DAD
// slot 6672
    6672, 36120,
// STABLE_ORBIT.agc:161
//			UPDATFLG
// slot 6673
    6673, 624,
// STABLE_ORBIT.agc:162
//			TIG
// slot 6674
    6674, 3606,
// STABLE_ORBIT.agc:163
//		STORE	TINT		# TI = TIG + TF
// slot 6675
    6675, 3932,
// STABLE_ORBIT.agc:164
//		STORE	DSPTEM1		# FOR DISPLAY
// slot 6676
    6676, 1100,
// STABLE_ORBIT.agc:165
//		EXIT
// slot 6677
    6677, 65532
)).

// bank 04, slots 6678-6679
function agcAotUnit399 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6678 {
// STABLE_ORBIT.agc:166
//		CAF	V06N57SR	# DISPLAY DELTA R
// slot 6678
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
// STABLE_ORBIT.agc:167
//		TCR	BANKCALL
// slot 6679
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
// STABLE_ORBIT.agc:168
//		CADR	GOFLASHR
// slot 6680
    6680, 17502
)).

// bank 04, slots 6681-6689
function agcAotUnit400 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6684 {
        if slot <= 6682 {
            if slot <= 6681 {
// STABLE_ORBIT.agc:169
//		TCF	GOTOPOOH	# TERMINATE
// slot 6681
                if slot <> 6681 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:170
//		TCF	+5		# PROCEED
// slot 6682
                if slot <> 6682 or instruction <> 5663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6683 {
// STABLE_ORBIT.agc:171
//		TCF	-5		# RECYCLE
// slot 6683
                if slot <> 6683 or instruction <> 5654 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5654, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:172
//		CAF	SIX		# IMMEDIATE RETURN - BLANK R2, R3
// slot 6684
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
// STABLE_ORBIT.agc:173
//		TCR	BLANKET
// slot 6685
                if slot <> 6685 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:174
//		TCF	ENDOFJOB
// slot 6686
                if slot <> 6686 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6687 {
// STABLE_ORBIT.agc:175
//		CAF	V06N34SR	# DISPLAY TIME OF INTERCEPT
// slot 6687
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
// STABLE_ORBIT.agc:176
//		TC	VNDSPLY
// slot 6688
                    if slot <> 6688 or instruction <> 1715 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1715, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:177
//		TC	INTPRET
// slot 6689
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
// STABLE_ORBIT.agc:178
//JUNCTN1		CLEAR	CALL
// slot 6690
    6690, 37912,
// STABLE_ORBIT.agc:179
//			P39/79SW
// slot 6691
    6691, 4460,
// STABLE_ORBIT.agc:180
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// slot 6692
    6692, 9108,
// STABLE_ORBIT.agc:181
//RECYCLE		CALL
// slot 6693
    6693, 65320,
// STABLE_ORBIT.agc:182
//			PREC/TT
// slot 6694
    6694, 9500,
// STABLE_ORBIT.agc:183
//# Page 528
// STABLE_ORBIT.agc:184
//		BOFF	DLOAD
// slot 6695
    6695, 58648,
// STABLE_ORBIT.agc:185
//			OPTNSW
// slot 6696
    6696, 1488,
// STABLE_ORBIT.agc:186
//			OPTN2
// slot 6697
    6697, 9330,
// STABLE_ORBIT.agc:187
//			TINT
// slot 6698
    6698, 3932,
// STABLE_ORBIT.agc:188
//		STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// slot 6699
    6699, 28738,
// STABLE_ORBIT.agc:189
//			INTRPVP		#	INTERCEPT TIME
// slot 6700
    6700, 9550,
// STABLE_ORBIT.agc:190
//		VLOAD	UNIT
// slot 6701
    6701, 44794,
// STABLE_ORBIT.agc:191
//			RATT		# RP/(RP)
// slot 6702
    6702, 2,
// STABLE_ORBIT.agc:192
//		PDVL	VXV
// slot 6703
    6703, 40346,
// STABLE_ORBIT.agc:193
//			VATT
// slot 6704
    6704, 14,
// STABLE_ORBIT.agc:194
//		ABVAL	NORM		# (VP X RP/(RP))
// slot 6705
    6705, 49484,
// STABLE_ORBIT.agc:195
//			X1
// slot 6706
    6706, 78,
// STABLE_ORBIT.agc:196
//		PDDL	DDV
// slot 6707
    6707, 47530,
// STABLE_ORBIT.agc:197
//			DELTAR
// slot 6708
    6708, 2834,
// STABLE_ORBIT.agc:198
//		SL*			# DELTA R / (VP X RP/RP)
// slot 6709
    6709, 65374,
// STABLE_ORBIT.agc:199
//			0 -7,1
// slot 6710
    6710, 16628,
// STABLE_ORBIT.agc:200
//		STCALL	DELTTIME	# DELTA T = (RP) DELTA R / (VP X RP)
// slot 6711
    6711, 31510,
// STABLE_ORBIT.agc:201
//			JUNCTN2
// slot 6712
    6712, 9338,
// STABLE_ORBIT.agc:202
//OPTN2		DLOAD	DAD
// slot 6713
    6713, 36298,
// STABLE_ORBIT.agc:203
//			TINTSOI
// slot 6714
    6714, 2834,
// STABLE_ORBIT.agc:204
//			T
// slot 6715
    6715, 62,
// STABLE_ORBIT.agc:205
//		STORE	TINT		# TI = TI + TF
// slot 6716
    6716, 3932,
// STABLE_ORBIT.agc:206
//JUNCTN2		DLOAD	DSU
// slot 6717
    6717, 38346,
// STABLE_ORBIT.agc:207
//			TINT
// slot 6718
    6718, 3932,
// STABLE_ORBIT.agc:208
//			DELTTIME
// slot 6719
    6719, 2838,
// STABLE_ORBIT.agc:209
//		STORE	TARGTIME	# TT = TI - DELTA T
// slot 6720
    6720, 2842,
// STABLE_ORBIT.agc:210
//
// STABLE_ORBIT.agc:211
//# .... MAINRTNE ....
// STABLE_ORBIT.agc:212
//# SUBROUTINES USED
// STABLE_ORBIT.agc:213
//#
// STABLE_ORBIT.agc:214
//#	S3435.25
// STABLE_ORBIT.agc:215
//#	PERIAPO1
// STABLE_ORBIT.agc:216
//#	SHIFTR1
// STABLE_ORBIT.agc:217
//#	VNDSPLY
// STABLE_ORBIT.agc:218
//#	BANKCALL
// STABLE_ORBIT.agc:219
//#	GOFLASH
// STABLE_ORBIT.agc:220
//#	GOTOPOOH
// STABLE_ORBIT.agc:221
//#	VN1645
// STABLE_ORBIT.agc:222
//
// STABLE_ORBIT.agc:223
//MAINRTNE	STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// slot 6721
    6721, 28738,
// STABLE_ORBIT.agc:224
//			INTRPVP		#	TARGET TIME
// slot 6722
    6722, 9550,
// STABLE_ORBIT.agc:225
//		DLOAD
// slot 6723
    6723, 65482,
// STABLE_ORBIT.agc:226
//			TIG
// slot 6724
    6724, 3606,
// STABLE_ORBIT.agc:227
//		STORE	INTIME
// slot 6725
    6725, 3718,
// STABLE_ORBIT.agc:228
//		SSP	VLOAD
// slot 6726
    6726, 64946,
// STABLE_ORBIT.agc:229
//			SUBEXIT
// slot 6727
    6727, 2546,
// STABLE_ORBIT.agc:230
//			TEST3979
// slot 6728
    6728, 9368,
// STABLE_ORBIT.agc:231
//			RATT
// slot 6729
    6729, 2,
// STABLE_ORBIT.agc:232
//		CALL
// slot 6730
    6730, 65320,
// STABLE_ORBIT.agc:233
//			S3435.25
// slot 6731
    6731, 60108,
// STABLE_ORBIT.agc:234
//TEST3979	BOFF	BON
// slot 6732
    6732, 35864,
// STABLE_ORBIT.agc:235
//# Page 529
// STABLE_ORBIT.agc:236
//			P39/79SW
// slot 6733
    6733, 4556,
// STABLE_ORBIT.agc:237
//			MAINRTN1
// slot 6734
    6734, 9386,
// STABLE_ORBIT.agc:238
//			FINALFLG
// slot 6735
    6735, 1426,
// STABLE_ORBIT.agc:239
//			P39P79
// slot 6736
    6736, 9382,
// STABLE_ORBIT.agc:240
//		SET
// slot 6737
    6737, 65304,
// STABLE_ORBIT.agc:241
//			UPDATFLG
// slot 6738
    6738, 624,
// STABLE_ORBIT.agc:242
//P39P79		EXIT
// slot 6739
    6739, 65532
)).

// bank 04, slots 6740-6740
function agcAotUnit401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// STABLE_ORBIT.agc:243
//		TC	DSPLY81		# FOR P39 AND P79
// slot 6740
    if slot <> 6740 or instruction <> 1642 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1642, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[401] to agcAotUnit401@.

agcAotInstallSourceRope(list(
// STABLE_ORBIT.agc:244
//MAINRTN1	VLOAD	ABVAL
// slot 6741
    6741, 42746,
// STABLE_ORBIT.agc:245
//			DELVEET3
// slot 6742
    6742, 3916,
// STABLE_ORBIT.agc:246
//		STOVL	DELVTPI		# DELTA V
// slot 6743
    6743, 23354,
// STABLE_ORBIT.agc:247
//			VPASS4
// slot 6744
    6744, 3904,
// STABLE_ORBIT.agc:248
//		VSU	ABVAL
// slot 6745
    6745, 42578,
// STABLE_ORBIT.agc:249
//			VTPRIME
// slot 6746
    6746, 3872,
// STABLE_ORBIT.agc:250
//		STOVL	DELVTPF		# DELTA V (FINAL) = V'T - VT
// slot 6747
    6747, 23358,
// STABLE_ORBIT.agc:251
//			RACT3
// slot 6748
    6748, 3776,
// STABLE_ORBIT.agc:252
//		PDVL	CALL
// slot 6749
    6749, 38042,
// STABLE_ORBIT.agc:253
//			VIPRIME
// slot 6750
    6750, 3860,
// STABLE_ORBIT.agc:254
//			PERIAPO1	# GET PERIGEE ALTITUDE
// slot 6751
    6751, 38102,
// STABLE_ORBIT.agc:255
//		CALL
// slot 6752
    6752, 65320,
// STABLE_ORBIT.agc:256
//			SHIFTR1
// slot 6753
    6753, 38246,
// STABLE_ORBIT.agc:257
//		STORE	POSTTPI
// slot 6754
    6754, 2882,
// STABLE_ORBIT.agc:258
//		BON	SET
// slot 6755
    6755, 35864,
// STABLE_ORBIT.agc:259
//			FINALFLG
// slot 6756
    6756, 1426,
// STABLE_ORBIT.agc:260
//			DSPLY58
// slot 6757
    6757, 9422,
// STABLE_ORBIT.agc:261
//			UPDATFLG
// slot 6758
    6758, 624,
// STABLE_ORBIT.agc:262
//DSPLY58		EXIT
// slot 6759
    6759, 65532
)).

// bank 04, slots 6760-6764
function agcAotUnit402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6761 {
        if slot <= 6760 {
// STABLE_ORBIT.agc:263
//		CAF	V06N58SR	# DISPLAY HP, DELTA V, DELTA V (FINAL)
// slot 6760
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
// STABLE_ORBIT.agc:264
//		TC	VNDSPLY
// slot 6761
            if slot <> 6761 or instruction <> 1715 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1715, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6762 {
// STABLE_ORBIT.agc:265
//DSPLY81		CAF	V06N81SR	# DISPLAY DELTA V (LV)
// slot 6762
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
// STABLE_ORBIT.agc:266
//		TC	VNDSPLY
// slot 6763
                if slot <> 6763 or instruction <> 1715 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:267
//		TC	INTPRET
// slot 6764
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
// STABLE_ORBIT.agc:268
//		CLEAR	VLOAD
// slot 6765
    6765, 64792,
// STABLE_ORBIT.agc:269
//			XDELVFLG
// slot 6766
    6766, 1390,
// STABLE_ORBIT.agc:270
//			DELVEET3
// slot 6767
    6767, 3916,
// STABLE_ORBIT.agc:271
//		STCALL	DELVSIN
// slot 6768
    6768, 32588,
// STABLE_ORBIT.agc:272
//			VN1645		# DISPLAY TRKMKCNT, TTOGO, +MGA
// slot 6769
    6769, 60420,
// STABLE_ORBIT.agc:273
//		BON	GOTO
// slot 6770
    6770, 43032,
// STABLE_ORBIT.agc:274
//			P39/79SW
// slot 6771
    6771, 4492,
// STABLE_ORBIT.agc:275
//			P39/P79B
// slot 6772
    6772, 9478,
// STABLE_ORBIT.agc:276
//			RECYCLE
// slot 6773
    6773, 9290
)).

// bank 04, slots 6774-6783
function agcAotUnit403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6778 {
        if slot <= 6775 {
            if slot <= 6774 {
// STABLE_ORBIT.agc:277
//
// STABLE_ORBIT.agc:278
//# STABLE ORBIT MIDCOURSE PROGRAM (P39 AND P79)
// STABLE_ORBIT.agc:279
//#
// STABLE_ORBIT.agc:280
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// STABLE_ORBIT.agc:281
//# MOD BY RUDNICKI, S	DATE 25JAN68
// STABLE_ORBIT.agc:282
//#
// STABLE_ORBIT.agc:283
//# FUNCTIONAL DESCRIPTION
// STABLE_ORBIT.agc:284
//#
// STABLE_ORBIT.agc:285
//#	P39 AND P79 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// STABLE_ORBIT.agc:286
//#	CONDITIONS REQUIRED BY THE AGC TO MAKE A MIDCOURSE CORRECTION
// STABLE_ORBIT.agc:287
//# Page 530
// STABLE_ORBIT.agc:288
//#	MANEUVER AFTER COMPLETING THE SOI MANEUVER BUT BEFORE MAKING
// STABLE_ORBIT.agc:289
//#	THE SOR MANEUVER
// STABLE_ORBIT.agc:290
//#
// STABLE_ORBIT.agc:291
//# CALLING SEQUENCE
// STABLE_ORBIT.agc:292
//#
// STABLE_ORBIT.agc:293
//#	ASTRONAUT REQUEST THRU DSKY
// STABLE_ORBIT.agc:294
//#
// STABLE_ORBIT.agc:295
//#	V37E39E		IF THIS VEHICLE IS ACTIVE VEHICLE
// STABLE_ORBIT.agc:296
//#	V37E79E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// STABLE_ORBIT.agc:297
//#
// STABLE_ORBIT.agc:298
//# INPUT
// STABLE_ORBIT.agc:299
//#
// STABLE_ORBIT.agc:300
//#	(1)  TPASS4	TIME OF INTERCEPT - SAVED FROM P38/P78
// STABLE_ORBIT.agc:301
//#	(2)  TARGTIME	TIME THAT PASSIVE VEHICLE IS AT INTERCEPT POINT -
// STABLE_ORBIT.agc:302
//#			SAVED FROM P38/P78
// STABLE_ORBIT.agc:303
//#
// STABLE_ORBIT.agc:304
//# OUTPUT
// STABLE_ORBIT.agc:305
//#
// STABLE_ORBIT.agc:306
//#	(1)  TRKMKCNT	NUMBER OF MARKS
// STABLE_ORBIT.agc:307
//#	(2)  TTOGO	TIME TO GO
// STABLE_ORBIT.agc:308
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// STABLE_ORBIT.agc:309
//#	(4)  DELVLVC	DELTA VELOCITY AT MID - LOCAL VERTICAL COORDINATES
// STABLE_ORBIT.agc:310
//#
// STABLE_ORBIT.agc:311
//# SUBROUTINES USED
// STABLE_ORBIT.agc:312
//#
// STABLE_ORBIT.agc:313
//#	AVFLAGA
// STABLE_ORBIT.agc:314
//#	AVFLAGP
// STABLE_ORBIT.agc:315
//#	LOADTIME
// STABLE_ORBIT.agc:316
//#	SELECTMU
// STABLE_ORBIT.agc:317
//#	PRECSET
// STABLE_ORBIT.agc:318
//#	S34/35.1
// STABLE_ORBIT.agc:319
//#	MAINRTNE
// STABLE_ORBIT.agc:320
//
// STABLE_ORBIT.agc:321
//P39		TC	AVFLAGA		# THIS VEHICLE ACTIVE
// slot 6774
                if slot <> 6774 or instruction <> 2455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2455, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:322
//		EXTEND
// slot 6775
                if slot <> 6775 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6776 {
// STABLE_ORBIT.agc:323
//		DCA	ATIGINC
// slot 6776
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
// STABLE_ORBIT.agc:324
//		TC	P39/P79A
// slot 6777
                    if slot <> 6777 or instruction <> 1661 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1661, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:325
//P79		TC	AVFLAGP		# OTHER VEHICLE ACTIVE
// slot 6778
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
// STABLE_ORBIT.agc:326
//		EXTEND
// slot 6779
                if slot <> 6779 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:327
//		DCA	PTIGINC
// slot 6780
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
// STABLE_ORBIT.agc:328
//P39/P79A	DXCH	KT		# TIME TO PREPARE FOR BURN
// slot 6781
                if slot <> 6781 or instruction <> 22516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6782 {
// STABLE_ORBIT.agc:329
//		TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// slot 6782
                    if slot <> 6782 or instruction <> 2471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// STABLE_ORBIT.agc:330
//		TC	INTPRET
// slot 6783
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
// STABLE_ORBIT.agc:331
//		SET	CALL
// slot 6784
    6784, 37912,
// STABLE_ORBIT.agc:332
//			P39/79SW
// slot 6785
    6785, 4204,
// STABLE_ORBIT.agc:333
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// slot 6786
    6786, 9108,
// STABLE_ORBIT.agc:334
//P39/P79B	RTB	DAD
// slot 6787
    6787, 36152,
// STABLE_ORBIT.agc:335
//			LOADTIME
// slot 6788
    6788, 38544,
// STABLE_ORBIT.agc:336
//			KT
// slot 6789
    6789, 2536,
// STABLE_ORBIT.agc:337
//		STORE	TIG		# TIG = T (PRESENT) + PREPARATION TIME
// slot 6790
    6790, 3606,
// STABLE_ORBIT.agc:338
//# Page531
// STABLE_ORBIT.agc:339
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// slot 6791
    6791, 28738,
// STABLE_ORBIT.agc:340
//			PRECSET		#	VEHICLES TO TIG
// slot 6792
    6792, 38170,
// STABLE_ORBIT.agc:341
//		CALL
// slot 6793
    6793, 65320,
// STABLE_ORBIT.agc:342
//			S34/35.1	# GET UNIT NORMAL
// slot 6794
    6794, 61440,
// STABLE_ORBIT.agc:343
//		DLOAD	GOTO
// slot 6795
    6795, 43210,
// STABLE_ORBIT.agc:344
//			TARGTIME
// slot 6796
    6796, 2842,
// STABLE_ORBIT.agc:345
//			MAINRTNE	# CALCULATE DELTA V AND DELTA V (LV)
// slot 6797
    6797, 9346,
// STABLE_ORBIT.agc:346
//
// STABLE_ORBIT.agc:347
//# .... PREC/TT ....
// STABLE_ORBIT.agc:348
//# SUBROUTINES USED
// STABLE_ORBIT.agc:349
//#
// STABLE_ORBIT.agc:350
//#	PRECSET
// STABLE_ORBIT.agc:351
//#	TIMETHET
// STABLE_ORBIT.agc:352
//#	S34/35.1
// STABLE_ORBIT.agc:353
//
// STABLE_ORBIT.agc:354
//PREC/TT		STQ	DLOAD
// slot 6798
    6798, 58656,
// STABLE_ORBIT.agc:355
//			RTRN
// slot 6799
    6799, 2542,
// STABLE_ORBIT.agc:356
//			TIG
// slot 6800
    6800, 3606,
// STABLE_ORBIT.agc:357
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// slot 6801
    6801, 28738,
// STABLE_ORBIT.agc:358
//			PRECSET		#	VEHICLES TO TIG
// slot 6802
    6802, 38170,
// STABLE_ORBIT.agc:359
//		VLOAD	VSR*
// slot 6803
    6803, 45050,
// STABLE_ORBIT.agc:360
//			RPASS3
// slot 6804
    6804, 3800,
// STABLE_ORBIT.agc:361
//			0,2
// slot 6805
    6805, 48380,
// STABLE_ORBIT.agc:362
//		STODL	RVEC
// slot 6806
    6806, 15198,
// STABLE_ORBIT.agc:363
//			CENTANG
// slot 6807
    6807, 4056,
// STABLE_ORBIT.agc:364
//		PUSH	COS
// slot 6808
    6808, 58892,
// STABLE_ORBIT.agc:365
//		STODL	CSTH
// slot 6809
    6809, 15288,
// STABLE_ORBIT.agc:366
//		SIN	SET
// slot 6810
    6810, 36060,
// STABLE_ORBIT.agc:367
//			RVSW
// slot 6811
    6811, 3692,
// STABLE_ORBIT.agc:368
//		STOVL	SNTH
// slot 6812
    6812, 23476,
// STABLE_ORBIT.agc:369
//			VPASS3
// slot 6813
    6813, 3812,
// STABLE_ORBIT.agc:370
//		VSR*
// slot 6814
    6814, 65374,
// STABLE_ORBIT.agc:371
//			0,2
// slot 6815
    6815, 48380,
// STABLE_ORBIT.agc:372
//		STCALL	VVEC		# GET TRANSFER TIME BASED ON CENTANG OF
// slot 6816
    6816, 31692,
// STABLE_ORBIT.agc:373
//			TIMETHET	#	PASSIVE VEHICLE
// slot 6817
    6817, 21448,
// STABLE_ORBIT.agc:374
//		CALL
// slot 6818
    6818, 65320,
// STABLE_ORBIT.agc:375
//			S34/35.1	# GET UNIT NORMAL
// slot 6819
    6819, 61440,
// STABLE_ORBIT.agc:376
//		DLOAD	GOTO
// slot 6820
    6820, 43210,
// STABLE_ORBIT.agc:377
//			T
// slot 6821
    6821, 62,
// STABLE_ORBIT.agc:378
//			RTRN
// slot 6822
    6822, 2542,
// STABLE_ORBIT.agc:379
//# .... INTRPVP ....
// STABLE_ORBIT.agc:380
//# SUBROUTINES USED
// STABLE_ORBIT.agc:381
//#
// STABLE_ORBIT.agc:382
//#	CSMPREC
// STABLE_ORBIT.agc:383
//#	LEMPREC
// STABLE_ORBIT.agc:384
//
// STABLE_ORBIT.agc:385
//INTRPVP		STQ	BOFF		# PRECISION UPDATE PASSIVE VEHICLE TO
// slot 6823
    6823, 35872,
// STABLE_ORBIT.agc:386
//			RTRN		#	TDEC1
// slot 6824
    6824, 2542,
// STABLE_ORBIT.agc:387
//			AVFLAG
// slot 6825
    6825, 1492,
// STABLE_ORBIT.agc:388
//			OTHERV
// slot 6826
    6826, 9566,
// STABLE_ORBIT.agc:389
//		CALL
// slot 6827
    6827, 65320,
// STABLE_ORBIT.agc:390
//# Page 532
// STABLE_ORBIT.agc:391
//			CSMPREC
// slot 6828
    6828, 23666,
// STABLE_ORBIT.agc:392
//		GOTO
// slot 6829
    6829, 65360,
// STABLE_ORBIT.agc:393
//			RTRN
// slot 6830
    6830, 2542,
// STABLE_ORBIT.agc:394
//OTHERV		CALL
// slot 6831
    6831, 65320,
// STABLE_ORBIT.agc:395
//			LEMPREC
// slot 6832
    6832, 23690,
// STABLE_ORBIT.agc:396
//		GOTO
// slot 6833
    6833, 65360,
// STABLE_ORBIT.agc:397
//			RTRN
// slot 6834
    6834, 2542
)).

// bank 04, slots 6835-6839
function agcAotUnit404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6836 {
        if slot <= 6835 {
// STABLE_ORBIT.agc:398
//# .... VNDSPLY ....
// STABLE_ORBIT.agc:399
//# SUBROUTINES USED
// STABLE_ORBIT.agc:400
//#
// STABLE_ORBIT.agc:401
//#	BANKCALL
// STABLE_ORBIT.agc:402
//#	GOFLASH
// STABLE_ORBIT.agc:403
//#	GOTOPOOH
// STABLE_ORBIT.agc:404
//
// STABLE_ORBIT.agc:405
//VNDSPLY		EXTEND			# FLASH DISPLAY
// slot 6835
            if slot <> 6835 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// STABLE_ORBIT.agc:406
//		QXCH	RTRN
// slot 6836
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
// STABLE_ORBIT.agc:407
//		TS	VERBNOUN
// slot 6837
            if slot <> 6837 or instruction <> 23541 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23541, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6838 {
// STABLE_ORBIT.agc:408
//		CA	VERBNOUN
// slot 6838
                if slot <> 6838 or instruction <> 13301 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1013).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// STABLE_ORBIT.agc:409
//		TCR	BANKCALL
// slot 6839
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
// STABLE_ORBIT.agc:410
//		CADR	GOFLASH
// slot 6840
    6840, 17312
)).

// bank 04, slots 6841-6843
function agcAotUnit405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6841 {
// STABLE_ORBIT.agc:411
//		TCF	GOTOPOOH	# TERMINATE
// slot 6841
        if slot <> 6841 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6842 {
// STABLE_ORBIT.agc:412
//		TC	RTRN		# PROCEED
// slot 6842
            if slot <> 6842 or instruction <> 1015 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1015, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// STABLE_ORBIT.agc:413
//		TCF	-5		# RECYCLE
// slot 6843
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
// STABLE_ORBIT.agc:414
//V06N33SR	VN	0633
// slot 6844
    6844, 1602,
// STABLE_ORBIT.agc:415
//V06N55SR	VN	0655
// slot 6845
    6845, 1646,
// STABLE_ORBIT.agc:416
//V04N06SR	VN	0406
// slot 6846
    6846, 1036,
// STABLE_ORBIT.agc:417
//V06N57SR	VN	0657
// slot 6847
    6847, 1650,
// STABLE_ORBIT.agc:418
//V06N34SR	VN	0634
// slot 6848
    6848, 1604,
// STABLE_ORBIT.agc:419
//V06N58SR	VN	0658
// slot 6849
    6849, 1652,
// STABLE_ORBIT.agc:420
//V06N81SR	VN	0681
// slot 6850
    6850, 1698
)).

// no code for the lines below
// STABLE_ORBIT.agc:421
//
// STABLE_ORBIT.agc:422
//# *** END OF COMEKISS.020 ***
