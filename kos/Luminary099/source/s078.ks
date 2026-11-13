// PORT: Original source unit STABLE_ORBIT.agc.
// PORT: Physical bank 34. Shared continuation entries, slots 31417–31417.
function agcAotUnit1986 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE STABLE_ORBIT.agc:2
//# Filename:	STABLE_ORBIT.agc
// PORT: SOURCE STABLE_ORBIT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE STABLE_ORBIT.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE STABLE_ORBIT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE STABLE_ORBIT.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE STABLE_ORBIT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE STABLE_ORBIT.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE STABLE_ORBIT.agc:9
//# Pages:	723-730
// PORT: SOURCE STABLE_ORBIT.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// PORT: SOURCE STABLE_ORBIT.agc:11
//#				Colossus249 file (there being no corresponding
// PORT: SOURCE STABLE_ORBIT.agc:12
//#				Luminary131 source-code file), using page
// PORT: SOURCE STABLE_ORBIT.agc:13
//#				images from Luminary 1A.
// PORT: SOURCE STABLE_ORBIT.agc:14
//#		2009-06-07 RSB	Eliminated an extraneous instruction.
// PORT: SOURCE STABLE_ORBIT.agc:15
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE STABLE_ORBIT.agc:16
//#
// PORT: SOURCE STABLE_ORBIT.agc:17
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE STABLE_ORBIT.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE STABLE_ORBIT.agc:19
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE STABLE_ORBIT.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE STABLE_ORBIT.agc:21
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE STABLE_ORBIT.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE STABLE_ORBIT.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE STABLE_ORBIT.agc:24
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE STABLE_ORBIT.agc:25
//# actually created.
// PORT: SOURCE STABLE_ORBIT.agc:26
//#
// PORT: SOURCE STABLE_ORBIT.agc:27
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE STABLE_ORBIT.agc:28
//#
// PORT: SOURCE STABLE_ORBIT.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE STABLE_ORBIT.agc:30
//#	16:27 JULY 14, 1969
// PORT: SOURCE STABLE_ORBIT.agc:31
//
// PORT: SOURCE STABLE_ORBIT.agc:32
//# Page 723
// PORT: SOURCE STABLE_ORBIT.agc:33
//# STABLE ORBIT RENDEZVOUS PROGRAMS (P38 AND P78)
// PORT: SOURCE STABLE_ORBIT.agc:34
//#
// PORT: SOURCE STABLE_ORBIT.agc:35
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// PORT: SOURCE STABLE_ORBIT.agc:36
//# MOD BY RUDNICKI.S	DATE 25JAN68
// PORT: SOURCE STABLE_ORBIT.agc:37
//#
// PORT: SOURCE STABLE_ORBIT.agc:38
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE STABLE_ORBIT.agc:39
//#
// PORT: SOURCE STABLE_ORBIT.agc:40
//#	P38 AND P78 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// PORT: SOURCE STABLE_ORBIT.agc:41
//#	CONDITIONS REQUIRED BY THE AGC TO (1) PUT THE ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:42
//#	ON A TRANSFER TRAJECTORY THAT INTERCEPTS THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:43
//#	ORBIT A GIVEN DISTANCE, DELTA R, EITHER AHEAD OF OR BEHIND THE
// PORT: SOURCE STABLE_ORBIT.agc:44
//#	PASSIVE VEHICLE AND (2) ACTUALLY PLACE THE ACTIVE VEHICLE IN THE
// PORT: SOURCE STABLE_ORBIT.agc:45
//#	PASSIVE VEHICLE ORBIT WITH A DELTA R SEPARATION BETWEEN THE TWO
// PORT: SOURCE STABLE_ORBIT.agc:46
//#	VEHICLES
// PORT: SOURCE STABLE_ORBIT.agc:47
//#
// PORT: SOURCE STABLE_ORBIT.agc:48
//# CALLING SEQUENCE
// PORT: SOURCE STABLE_ORBIT.agc:49
//#
// PORT: SOURCE STABLE_ORBIT.agc:50
//#	ASTRONAUT REQUEST THRU DSKY
// PORT: SOURCE STABLE_ORBIT.agc:51
//#
// PORT: SOURCE STABLE_ORBIT.agc:52
//#	V37E38E		IF THIS VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:53
//#	V37E78E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:54
//#
// PORT: SOURCE STABLE_ORBIT.agc:55
//# INPUT
// PORT: SOURCE STABLE_ORBIT.agc:56
//#
// PORT: SOURCE STABLE_ORBIT.agc:57
//#	(1)	SOI MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:58
//#
// PORT: SOURCE STABLE_ORBIT.agc:59
//#		(A)  TIG	TIME OF SOI MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:60
//#		(B)  CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:61
//#				DURING THE TRANSFER FROM TIG TO TIME OF INTERCEPT
// PORT: SOURCE STABLE_ORBIT.agc:62
//#		(C)  DELTAR	THE DESIRED SEPARATION OF THE TWO VEHICLES
// PORT: SOURCE STABLE_ORBIT.agc:63
//#				SPECIFIED AS A DISTANCE ALONG THE PASSIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:64
//#				ORBIT
// PORT: SOURCE STABLE_ORBIT.agc:65
//#		(D)  OPTION	EQUALS 1 FOR SOI
// PORT: SOURCE STABLE_ORBIT.agc:66
//#
// PORT: SOURCE STABLE_ORBIT.agc:67
//#	(2)	SOR MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:68
//#
// PORT: SOURCE STABLE_ORBIT.agc:69
//#		(A)  TIG	TIME OF SOR MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:70
//#		(B)  CENTANG	AN OPTIONAL RESPECIFICATION OF 1 (B) ABOVE
// PORT: SOURCE STABLE_ORBIT.agc:71
//#		(C)  OPTION	EQUALS 2 FOR SOR
// PORT: SOURCE STABLE_ORBIT.agc:72
//#		(D)  DELTTIME	THE TIME REQUIRED TO TRAVERSE DELTA R WHEN
// PORT: SOURCE STABLE_ORBIT.agc:73
//#				TRAVELING AT A VELOCITY EQUAL TO THE HORIZONTAL
// PORT: SOURCE STABLE_ORBIT.agc:74
//#				VELOCITY OF THE PASSIVE VEHICLE - SAVED FROM
// PORT: SOURCE STABLE_ORBIT.agc:75
//#				SOI PHASE
// PORT: SOURCE STABLE_ORBIT.agc:76
//#		(E)  TINT	TIME OF INTERCEPT (SOI) - SAVED FROM SOI PHASE
// PORT: SOURCE STABLE_ORBIT.agc:77
//#
// PORT: SOURCE STABLE_ORBIT.agc:78
//# OUTPUT
// PORT: SOURCE STABLE_ORBIT.agc:79
//#
// PORT: SOURCE STABLE_ORBIT.agc:80
//#	(1)  TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE STABLE_ORBIT.agc:81
//#	(2)  TTOGO	TIME TO GO
// PORT: SOURCE STABLE_ORBIT.agc:82
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE STABLE_ORBIT.agc:83
//# Page 724
// PORT: SOURCE STABLE_ORBIT.agc:84
//#	(4)  DSPTEM1	TIME OF INTERCEPT OF PASSIVE VEHICLE ORBIT
// PORT: SOURCE STABLE_ORBIT.agc:85
//#			(FOR SOI ONLY)
// PORT: SOURCE STABLE_ORBIT.agc:86
//#	(5)  POSTTPI	PERIGEE ALTITUDE OF ACTIVE VEHICLE ORBIT AFTER
// PORT: SOURCE STABLE_ORBIT.agc:87
//#			THE SOI (SOR) MANEUVER
// PORT: SOURCE STABLE_ORBIT.agc:88
//#	(6)  DELVTPI	MAGNITUDE OF DELTA V AT SOI (SOR) TIME
// PORT: SOURCE STABLE_ORBIT.agc:89
//#	(7)  DELVTPF	MAGNITUDE OF DELTA V AT INTERCEPT TIME
// PORT: SOURCE STABLE_ORBIT.agc:90
//#	(8)  DELVLVC	DELTA VELOCITY AT SOI (AND SOR) - LOCAL VERTICAL
// PORT: SOURCE STABLE_ORBIT.agc:91
//#			COORDINATES
// PORT: SOURCE STABLE_ORBIT.agc:92
//#
// PORT: SOURCE STABLE_ORBIT.agc:93
//# SUBROUTINE USED
// PORT: SOURCE STABLE_ORBIT.agc:94
//#
// PORT: SOURCE STABLE_ORBIT.agc:95
//#	AVFLAGA
// PORT: SOURCE STABLE_ORBIT.agc:96
//#	AVFLAGP
// PORT: SOURCE STABLE_ORBIT.agc:97
//#	VNDSPLY
// PORT: SOURCE STABLE_ORBIT.agc:98
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:99
//#	GOFLASHR
// PORT: SOURCE STABLE_ORBIT.agc:100
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:101
//#	BLANKET
// PORT: SOURCE STABLE_ORBIT.agc:102
//#	ENDOFJOB
// PORT: SOURCE STABLE_ORBIT.agc:103
//#	PREC/TT
// PORT: SOURCE STABLE_ORBIT.agc:104
//#	SELECTMU
// PORT: SOURCE STABLE_ORBIT.agc:105
//#	INTRPVP
// PORT: SOURCE STABLE_ORBIT.agc:106
//#	MAINRTNE
// PORT: SOURCE STABLE_ORBIT.agc:107
//
// PORT: SOURCE STABLE_ORBIT.agc:108
//		BANK	04
// PORT: SOURCE STABLE_ORBIT.agc:109
//		SETLOC	STBLEORB
// PORT: SOURCE STABLE_ORBIT.agc:110
//		BANK
// PORT: SOURCE STABLE_ORBIT.agc:111
//
// PORT: SOURCE STABLE_ORBIT.agc:112
//		EBANK=	SUBEXIT
// PORT: SOURCE STABLE_ORBIT.agc:113
//		COUNT*	$$/P3879
// PORT: SOURCE STABLE_ORBIT.agc:114
//
// PORT: SOURCE STABLE_ORBIT.agc:115
//P38		TC	BANKCALL
// PORT: Fixed ROM slots 31417.
    if slot <> 31417 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1986] to agcAotUnit1986@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:116
//		CADR	AVFLAGA		# THIS VEHICLE ACTIVE
// PORT: Fixed ROM slots 31418.
    31418, 59854
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31419–31420.
function agcAotUnit1987 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31419 {
// PORT: SOURCE STABLE_ORBIT.agc:117
//		TC	+3
// PORT: Fixed ROM slots 31419.
        if slot <> 31419 or instruction <> 1726 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1726, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE STABLE_ORBIT.agc:118
//P78		TC	BANKCALL
// PORT: Fixed ROM slots 31420.
        if slot <> 31420 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1987] to agcAotUnit1987@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:119
//		CADR	AVFLAGP		# OTHER VEHICLE ACTIVE
// PORT: Fixed ROM slots 31421.
    31421, 59864
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31422–31422.
function agcAotUnit1988 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:120
//		TC	BANKCALL
// PORT: Fixed ROM slots 31422.
    if slot <> 31422 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1988] to agcAotUnit1988@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:121
//		CADR	P20FLGON	# SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 31423.
    31423, 59874
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31424–31429.
function agcAotUnit1989 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31426 {
        if slot <= 31424 {
// PORT: SOURCE STABLE_ORBIT.agc:122
//		CAF	DECTWO
// PORT: Fixed ROM slots 31424.
            if slot <> 31424 or instruction <> 14241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1953), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31425 {
// PORT: SOURCE STABLE_ORBIT.agc:123
//		TS	NN
// PORT: Fixed ROM slots 31425.
                if slot <> 31425 or instruction <> 23350 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23350, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:124
//		CAF	V06N33SR	# DISPLAY TIG
// PORT: Fixed ROM slots 31426.
                if slot <> 31426 or instruction <> 14234 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1946), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31427 {
// PORT: SOURCE STABLE_ORBIT.agc:125
//		TC	VNDSPLY
// PORT: Fixed ROM slots 31427.
            if slot <> 31427 or instruction <> 1937 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1937, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31428 {
// PORT: SOURCE STABLE_ORBIT.agc:126
//		CAF	V06N55SR	# DISPLAY CENTANG
// PORT: Fixed ROM slots 31428.
                if slot <> 31428 or instruction <> 14235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1947), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:127
//		TCR	BANKCALL
// PORT: Fixed ROM slots 31429.
                if slot <> 31429 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1989] to agcAotUnit1989@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:128
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 31430.
    31430, 17210
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31431–31442.
function agcAotUnit1990 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31436 {
        if slot <= 31433 {
            if slot <= 31431 {
// PORT: SOURCE STABLE_ORBIT.agc:129
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 31431.
                if slot <> 31431 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31432 {
// PORT: SOURCE STABLE_ORBIT.agc:130
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 31432.
                    if slot <> 31432 or instruction <> 5837 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5837, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:131
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 31433.
                    if slot <> 31433 or instruction <> 5828 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5828, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31434 {
// PORT: SOURCE STABLE_ORBIT.agc:132
//		CAF	THREE		# IMMEDIATE RETURN - BLANK R1, R2
// PORT: Fixed ROM slots 31434.
                if slot <> 31434 or instruction <> 15525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31435 {
// PORT: SOURCE STABLE_ORBIT.agc:133
//		TCR	BLANKET
// PORT: Fixed ROM slots 31435.
                    if slot <> 31435 or instruction <> 2868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:134
//# Page 725
// PORT: SOURCE STABLE_ORBIT.agc:135
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 31436.
                    if slot <> 31436 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31439 {
            if slot <= 31437 {
// PORT: SOURCE STABLE_ORBIT.agc:136
//		CAF	FIVE
// PORT: Fixed ROM slots 31437.
                if slot <> 31437 or instruction <> 14830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31438 {
// PORT: SOURCE STABLE_ORBIT.agc:137
//		TS	OPTION1
// PORT: Fixed ROM slots 31438.
                    if slot <> 31438 or instruction <> 23140 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23140, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:138
//		CAF	ONE
// PORT: Fixed ROM slots 31439.
                    if slot <> 31439 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31440 {
// PORT: SOURCE STABLE_ORBIT.agc:139
//		TS	OPTION2		# OPTION CODE IS SET TO 1
// PORT: Fixed ROM slots 31440.
                if slot <> 31440 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31441 {
// PORT: SOURCE STABLE_ORBIT.agc:140
//		CAF	V04N06SR	# DISPLAY OPTION CODE - 1 = SOI, 2 = SOR
// PORT: Fixed ROM slots 31441.
                    if slot <> 31441 or instruction <> 14236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1948), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:141
//		TCR	BANKCALL
// PORT: Fixed ROM slots 31442.
                    if slot <> 31442 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1990] to agcAotUnit1990@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:142
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 31443.
    31443, 17210
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31444–31450.
function agcAotUnit1991 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31446 {
        if slot <= 31444 {
// PORT: SOURCE STABLE_ORBIT.agc:143
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 31444.
            if slot <> 31444 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31445 {
// PORT: SOURCE STABLE_ORBIT.agc:144
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 31445.
                if slot <> 31445 or instruction <> 5850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5850, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:145
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 31446.
                if slot <> 31446 or instruction <> 5841 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5841, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31448 {
            if slot <= 31447 {
// PORT: SOURCE STABLE_ORBIT.agc:146
//		CAF	BIT3		# IMMEDIATE RETURN - BLANK R3
// PORT: Fixed ROM slots 31447.
                if slot <> 31447 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:147
//		TCR	BLANKET
// PORT: Fixed ROM slots 31448.
                if slot <> 31448 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31449 {
// PORT: SOURCE STABLE_ORBIT.agc:148
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 31449.
                if slot <> 31449 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:149
//		TC	INTPRET
// PORT: Fixed ROM slots 31450.
                if slot <> 31450 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1991] to agcAotUnit1991@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:150
//		SLOAD	SR1
// PORT: Fixed ROM slots 31451.
    31451, 58042,
// PORT: SOURCE STABLE_ORBIT.agc:151
//			OPTION2
// PORT: Fixed ROM slots 31452.
    31452, 1228,
// PORT: SOURCE STABLE_ORBIT.agc:152
//		BHIZ	DLOAD
// PORT: Fixed ROM slots 31453.
    31453, 58672,
// PORT: SOURCE STABLE_ORBIT.agc:153
//			OPTN1
// PORT: Fixed ROM slots 31454.
    31454, 58824,
// PORT: SOURCE STABLE_ORBIT.agc:154
//			TINT
// PORT: Fixed ROM slots 31455.
    31455, 3890,
// PORT: SOURCE STABLE_ORBIT.agc:155
//		STORE	TINTSOI		# STORE FOR SOR PHASE
// PORT: Fixed ROM slots 31456.
    31456, 2438,
// PORT: SOURCE STABLE_ORBIT.agc:156
//		CLRGO
// PORT: Fixed ROM slots 31457.
    31457, 65304,
// PORT: SOURCE STABLE_ORBIT.agc:157
//			OPTNSW		# OPTNSW: ON = SOI, OFF = SOR
// PORT: Fixed ROM slots 31458.
    31458, 1328,
// PORT: SOURCE STABLE_ORBIT.agc:158
//			JUNCTN1
// PORT: Fixed ROM slots 31459.
    31459, 58874,
// PORT: SOURCE STABLE_ORBIT.agc:159
//OPTN1		SET	CLEAR		# SOI
// PORT: Fixed ROM slots 31460.
    31460, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:160
//			OPTNSW
// PORT: Fixed ROM slots 31461.
    31461, 1136,
// PORT: SOURCE STABLE_ORBIT.agc:161
//			UPDATFLG
// PORT: Fixed ROM slots 31462.
    31462, 880,
// PORT: SOURCE STABLE_ORBIT.agc:162
//		CALL
// PORT: Fixed ROM slots 31463.
    31463, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:163
//			PREC/TT
// PORT: Fixed ROM slots 31464.
    31464, 59096,
// PORT: SOURCE STABLE_ORBIT.agc:164
//		DAD	SET
// PORT: Fixed ROM slots 31465.
    31465, 35866,
// PORT: SOURCE STABLE_ORBIT.agc:165
//			TIG
// PORT: Fixed ROM slots 31466.
    31466, 3652,
// PORT: SOURCE STABLE_ORBIT.agc:166
//			UPDATFLG
// PORT: Fixed ROM slots 31467.
    31467, 624,
// PORT: SOURCE STABLE_ORBIT.agc:167
//		STORE	TINT		# TI = TIG + TF
// PORT: Fixed ROM slots 31468.
    31468, 3890,
// PORT: SOURCE STABLE_ORBIT.agc:168
//		EXIT
// PORT: Fixed ROM slots 31469.
    31469, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31470–31471.
function agcAotUnit1992 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31470 {
// PORT: SOURCE STABLE_ORBIT.agc:169
//		CAF	V06N57SR	# DISPLAY DELTA R
// PORT: Fixed ROM slots 31470.
        if slot <> 31470 or instruction <> 14237 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1949), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE STABLE_ORBIT.agc:170
//		TCR	BANKCALL
// PORT: Fixed ROM slots 31471.
        if slot <> 31471 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1992] to agcAotUnit1992@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:171
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 31472.
    31472, 17210
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31473–31484.
function agcAotUnit1993 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31478 {
        if slot <= 31475 {
            if slot <= 31473 {
// PORT: SOURCE STABLE_ORBIT.agc:172
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 31473.
                if slot <> 31473 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31474 {
// PORT: SOURCE STABLE_ORBIT.agc:173
//		TCF	+5		# PROCEED
// PORT: Fixed ROM slots 31474.
                    if slot <> 31474 or instruction <> 5879 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5879, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:174
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 31475.
                    if slot <> 31475 or instruction <> 5870 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5870, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31476 {
// PORT: SOURCE STABLE_ORBIT.agc:175
//		CAF	SIX		# IMMEDIATE RETURN - BLANK R2, R3
// PORT: Fixed ROM slots 31476.
                if slot <> 31476 or instruction <> 15522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31477 {
// PORT: SOURCE STABLE_ORBIT.agc:176
//		TCR	BLANKET
// PORT: Fixed ROM slots 31477.
                    if slot <> 31477 or instruction <> 2868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:177
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 31478.
                    if slot <> 31478 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31481 {
            if slot <= 31479 {
// PORT: SOURCE STABLE_ORBIT.agc:178
// +5		EXTEND
// PORT: Fixed ROM slots 31479.
                if slot <> 31479 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31480 {
// PORT: SOURCE STABLE_ORBIT.agc:179
//		DCA	TINT
// PORT: Fixed ROM slots 31480.
                    if slot <> 31480 or instruction <> 13209 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 921, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:180
//		DXCH	DSPTEM1		# FOR DISPLAY
// PORT: Fixed ROM slots 31481.
                    if slot <> 31481 or instruction <> 22054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31482 {
// PORT: SOURCE STABLE_ORBIT.agc:181
//		CAF	V06N34SR	# DISPLAY TIME OF INTERCEPT
// PORT: Fixed ROM slots 31482.
                if slot <> 31482 or instruction <> 14238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1950), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31483 {
// PORT: SOURCE STABLE_ORBIT.agc:182
//		TC	VNDSPLY
// PORT: Fixed ROM slots 31483.
                    if slot <> 31483 or instruction <> 1937 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1937, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE STABLE_ORBIT.agc:183
//		TC	INTPRET
// PORT: Fixed ROM slots 31484.
                    if slot <> 31484 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1993] to agcAotUnit1993@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:184
//JUNCTN1		CLEAR	CALL
// PORT: Fixed ROM slots 31485.
    31485, 37912,
// PORT: SOURCE STABLE_ORBIT.agc:185
//# Page 726
// PORT: SOURCE STABLE_ORBIT.agc:186
//			P39/79SW
// PORT: Fixed ROM slots 31486.
    31486, 4460,
// PORT: SOURCE STABLE_ORBIT.agc:187
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// PORT: Fixed ROM slots 31487.
    31487, 16384,
// PORT: SOURCE STABLE_ORBIT.agc:188
//RECYCLE		CALL
// PORT: Fixed ROM slots 31488.
    31488, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:189
//			PREC/TT
// PORT: Fixed ROM slots 31489.
    31489, 59096,
// PORT: SOURCE STABLE_ORBIT.agc:190
//		BOFF	DLOAD
// PORT: Fixed ROM slots 31490.
    31490, 58648,
// PORT: SOURCE STABLE_ORBIT.agc:191
//			OPTNSW
// PORT: Fixed ROM slots 31491.
    31491, 1488,
// PORT: SOURCE STABLE_ORBIT.agc:192
//			OPTN2
// PORT: Fixed ROM slots 31492.
    31492, 58920,
// PORT: SOURCE STABLE_ORBIT.agc:193
//			TINT
// PORT: Fixed ROM slots 31493.
    31493, 3890,
// PORT: SOURCE STABLE_ORBIT.agc:194
//		STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 31494.
    31494, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:195
//			INTRPVP		# 	INTERCEPT TIME
// PORT: Fixed ROM slots 31495.
    31495, 59146,
// PORT: SOURCE STABLE_ORBIT.agc:196
//		VLOAD	UNIT
// PORT: Fixed ROM slots 31496.
    31496, 44794,
// PORT: SOURCE STABLE_ORBIT.agc:197
//			RATT		# RP/(RP)
// PORT: Fixed ROM slots 31497.
    31497, 2,
// PORT: SOURCE STABLE_ORBIT.agc:198
//		PDVL	VXV
// PORT: Fixed ROM slots 31498.
    31498, 40346,
// PORT: SOURCE STABLE_ORBIT.agc:199
//			VATT
// PORT: Fixed ROM slots 31499.
    31499, 14,
// PORT: SOURCE STABLE_ORBIT.agc:200
//		ABVAL	NORM		# (VP X RP/(RP))
// PORT: Fixed ROM slots 31500.
    31500, 49484,
// PORT: SOURCE STABLE_ORBIT.agc:201
//			X1
// PORT: Fixed ROM slots 31501.
    31501, 78,
// PORT: SOURCE STABLE_ORBIT.agc:202
//		PDDL	DDV
// PORT: Fixed ROM slots 31502.
    31502, 47530,
// PORT: SOURCE STABLE_ORBIT.agc:203
//			DELTAR
// PORT: Fixed ROM slots 31503.
    31503, 2438,
// PORT: SOURCE STABLE_ORBIT.agc:204
//		SL*			# DELTA R / (VP X RP/RP)
// PORT: Fixed ROM slots 31504.
    31504, 65374,
// PORT: SOURCE STABLE_ORBIT.agc:205
//			0 	-7,1
// PORT: Fixed ROM slots 31505.
    31505, 16628,
// PORT: SOURCE STABLE_ORBIT.agc:206
//		STCALL	DELTTIME	# DELTA T = (RP) DELTA R / (VP X RP)
// PORT: Fixed ROM slots 31506.
    31506, 31114,
// PORT: SOURCE STABLE_ORBIT.agc:207
//			JUNCTN2
// PORT: Fixed ROM slots 31507.
    31507, 58928,
// PORT: SOURCE STABLE_ORBIT.agc:208
//OPTN2		DLOAD	DAD
// PORT: Fixed ROM slots 31508.
    31508, 36298,
// PORT: SOURCE STABLE_ORBIT.agc:209
//			TINTSOI
// PORT: Fixed ROM slots 31509.
    31509, 2438,
// PORT: SOURCE STABLE_ORBIT.agc:210
//			T
// PORT: Fixed ROM slots 31510.
    31510, 62,
// PORT: SOURCE STABLE_ORBIT.agc:211
//		STORE	TINT		# TI = TI + TF
// PORT: Fixed ROM slots 31511.
    31511, 3890,
// PORT: SOURCE STABLE_ORBIT.agc:212
//JUNCTN2		DLOAD	DSU
// PORT: Fixed ROM slots 31512.
    31512, 38346,
// PORT: SOURCE STABLE_ORBIT.agc:213
//			TINT
// PORT: Fixed ROM slots 31513.
    31513, 3890,
// PORT: SOURCE STABLE_ORBIT.agc:214
//			DELTTIME
// PORT: Fixed ROM slots 31514.
    31514, 2442,
// PORT: SOURCE STABLE_ORBIT.agc:215
//		STORE	TARGTIME	# TT = TI - DELTA T
// PORT: Fixed ROM slots 31515.
    31515, 2446,
// PORT: SOURCE STABLE_ORBIT.agc:216
//
// PORT: SOURCE STABLE_ORBIT.agc:217
//# .... MAINRTNE ....
// PORT: SOURCE STABLE_ORBIT.agc:218
//# SUBROUTINES USED:
// PORT: SOURCE STABLE_ORBIT.agc:219
//#
// PORT: SOURCE STABLE_ORBIT.agc:220
//#	S3435.25
// PORT: SOURCE STABLE_ORBIT.agc:221
//#	PERIAPO1
// PORT: SOURCE STABLE_ORBIT.agc:222
//#	SHIFTR1
// PORT: SOURCE STABLE_ORBIT.agc:223
//#	VNDSPLY
// PORT: SOURCE STABLE_ORBIT.agc:224
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:225
//#	GOFLASH
// PORT: SOURCE STABLE_ORBIT.agc:226
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:227
//#	VN1645
// PORT: SOURCE STABLE_ORBIT.agc:228
//
// PORT: SOURCE STABLE_ORBIT.agc:229
//MAINRTNE	STCALL	TDEC1		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 31516.
    31516, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:230
//			INTRPVP		#	TARGET TIME
// PORT: Fixed ROM slots 31517.
    31517, 59146,
// PORT: SOURCE STABLE_ORBIT.agc:231
//		DLOAD
// PORT: Fixed ROM slots 31518.
    31518, 65482,
// PORT: SOURCE STABLE_ORBIT.agc:232
//			TIG
// PORT: Fixed ROM slots 31519.
    31519, 3652,
// PORT: SOURCE STABLE_ORBIT.agc:233
//		STORE	INTIME
// PORT: Fixed ROM slots 31520.
    31520, 3856,
// PORT: SOURCE STABLE_ORBIT.agc:234
//		SSP	VLOAD
// PORT: Fixed ROM slots 31521.
    31521, 64946,
// PORT: SOURCE STABLE_ORBIT.agc:235
//			SUBEXIT
// PORT: Fixed ROM slots 31522.
    31522, 3698,
// PORT: SOURCE STABLE_ORBIT.agc:236
//			TEST3979
// PORT: Fixed ROM slots 31523.
    31523, 58958,
// PORT: SOURCE STABLE_ORBIT.agc:237
//# Page 727
// PORT: SOURCE STABLE_ORBIT.agc:238
//			RATT
// PORT: Fixed ROM slots 31524.
    31524, 2,
// PORT: SOURCE STABLE_ORBIT.agc:239
//		CALL
// PORT: Fixed ROM slots 31525.
    31525, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:240
//			S3435.25
// PORT: Fixed ROM slots 31526.
    31526, 60846,
// PORT: SOURCE STABLE_ORBIT.agc:241
//TEST3979	BOFF	BON
// PORT: Fixed ROM slots 31527.
    31527, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:242
//			P39/79SW
// PORT: Fixed ROM slots 31528.
    31528, 4556,
// PORT: SOURCE STABLE_ORBIT.agc:243
//			MAINRTN1
// PORT: Fixed ROM slots 31529.
    31529, 58976,
// PORT: SOURCE STABLE_ORBIT.agc:244
//			FINALFLG
// PORT: Fixed ROM slots 31530.
    31530, 1426,
// PORT: SOURCE STABLE_ORBIT.agc:245
//			P39P79
// PORT: Fixed ROM slots 31531.
    31531, 58972,
// PORT: SOURCE STABLE_ORBIT.agc:246
//		SET
// PORT: Fixed ROM slots 31532.
    31532, 65304,
// PORT: SOURCE STABLE_ORBIT.agc:247
//			UPDATFLG
// PORT: Fixed ROM slots 31533.
    31533, 624,
// PORT: SOURCE STABLE_ORBIT.agc:248
//P39P79		EXIT
// PORT: Fixed ROM slots 31534.
    31534, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31535–31535.
function agcAotUnit1994 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:249
//		TC	DSPLY81		# FOR P39 AND P79
// PORT: Fixed ROM slots 31535.
    if slot <> 31535 or instruction <> 1861 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1861, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1994] to agcAotUnit1994@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:250
//MAINRTN1	VLOAD	ABVAL
// PORT: Fixed ROM slots 31536.
    31536, 42746,
// PORT: SOURCE STABLE_ORBIT.agc:251
//			DELVEET3
// PORT: Fixed ROM slots 31537.
    31537, 2540,
// PORT: SOURCE STABLE_ORBIT.agc:252
//		STOVL	DELVTPI		# DELTA V
// PORT: Fixed ROM slots 31538.
    31538, 24316,
// PORT: SOURCE STABLE_ORBIT.agc:253
//			VPASS4
// PORT: Fixed ROM slots 31539.
    31539, 3724,
// PORT: SOURCE STABLE_ORBIT.agc:254
//		VSU	ABVAL
// PORT: Fixed ROM slots 31540.
    31540, 42578,
// PORT: SOURCE STABLE_ORBIT.agc:255
//			VTPRIME
// PORT: Fixed ROM slots 31541.
    31541, 3820,
// PORT: SOURCE STABLE_ORBIT.agc:256
//		STOVL	DELVTPF		# DELTA V (FINAL) = V'T - VT
// PORT: Fixed ROM slots 31542.
    31542, 22992,
// PORT: SOURCE STABLE_ORBIT.agc:257
//			RACT3
// PORT: Fixed ROM slots 31543.
    31543, 3772,
// PORT: SOURCE STABLE_ORBIT.agc:258
//		PDVL	CALL
// PORT: Fixed ROM slots 31544.
    31544, 38042,
// PORT: SOURCE STABLE_ORBIT.agc:259
//			VIPRIME
// PORT: Fixed ROM slots 31545.
    31545, 2494,
// PORT: SOURCE STABLE_ORBIT.agc:260
//			PERIAPO1	# GET PERIGEE ALTITUDE
// PORT: Fixed ROM slots 31546.
    31546, 39324,
// PORT: SOURCE STABLE_ORBIT.agc:261
//		CALL
// PORT: Fixed ROM slots 31547.
    31547, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:262
//			SHIFTR1
// PORT: Fixed ROM slots 31548.
    31548, 39468,
// PORT: SOURCE STABLE_ORBIT.agc:263
//		STORE	POSTTPI
// PORT: Fixed ROM slots 31549.
    31549, 3852,
// PORT: SOURCE STABLE_ORBIT.agc:264
//		BON	SET
// PORT: Fixed ROM slots 31550.
    31550, 35864,
// PORT: SOURCE STABLE_ORBIT.agc:265
//			FINALFLG
// PORT: Fixed ROM slots 31551.
    31551, 1426,
// PORT: SOURCE STABLE_ORBIT.agc:266
//			DSPLY58
// PORT: Fixed ROM slots 31552.
    31552, 59012,
// PORT: SOURCE STABLE_ORBIT.agc:267
//			UPDATFLG
// PORT: Fixed ROM slots 31553.
    31553, 624,
// PORT: SOURCE STABLE_ORBIT.agc:268
//DSPLY58		EXIT
// PORT: Fixed ROM slots 31554.
    31554, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31555–31559.
function agcAotUnit1995 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31556 {
        if slot <= 31555 {
// PORT: SOURCE STABLE_ORBIT.agc:269
//		CAF	V06N58SR	# DISPLAY HP, DELTA V, DELTA V (FINAL)
// PORT: Fixed ROM slots 31555.
            if slot <> 31555 or instruction <> 14239 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1951), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:270
//		TC	VNDSPLY
// PORT: Fixed ROM slots 31556.
            if slot <> 31556 or instruction <> 1937 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1937, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31557 {
// PORT: SOURCE STABLE_ORBIT.agc:271
//DSPLY81		CAF	V06N81SR	# DISPLAY DELTA V (LV)
// PORT: Fixed ROM slots 31557.
            if slot <> 31557 or instruction <> 14240 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1952), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31558 {
// PORT: SOURCE STABLE_ORBIT.agc:272
//		TC	VNDSPLY
// PORT: Fixed ROM slots 31558.
                if slot <> 31558 or instruction <> 1937 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1937, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:273
//		TC	INTPRET
// PORT: Fixed ROM slots 31559.
                if slot <> 31559 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1995] to agcAotUnit1995@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:274
//		CLEAR	VLOAD
// PORT: Fixed ROM slots 31560.
    31560, 64792,
// PORT: SOURCE STABLE_ORBIT.agc:275
//			XDELVFLG
// PORT: Fixed ROM slots 31561.
    31561, 1390,
// PORT: SOURCE STABLE_ORBIT.agc:276
//			DELVEET3
// PORT: Fixed ROM slots 31562.
    31562, 2540,
// PORT: SOURCE STABLE_ORBIT.agc:277
//		STCALL	DELVSIN
// PORT: Fixed ROM slots 31563.
    31563, 32604,
// PORT: SOURCE STABLE_ORBIT.agc:278
//			VN1645		# DISPLAY TRKMKCNT, TTOGO, +MGA
// PORT: Fixed ROM slots 31564.
    31564, 61196,
// PORT: SOURCE STABLE_ORBIT.agc:279
//		BON	GOTO
// PORT: Fixed ROM slots 31565.
    31565, 43032,
// PORT: SOURCE STABLE_ORBIT.agc:280
//			P39/79SW
// PORT: Fixed ROM slots 31566.
    31566, 4492,
// PORT: SOURCE STABLE_ORBIT.agc:281
//			P39/P79B
// PORT: Fixed ROM slots 31567.
    31567, 59074,
// PORT: SOURCE STABLE_ORBIT.agc:282
//			RECYCLE
// PORT: Fixed ROM slots 31568.
    31568, 58880
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31569–31569.
function agcAotUnit1996 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:283
//
// PORT: SOURCE STABLE_ORBIT.agc:284
//# STABLE ORBIT MIDCOURSE PROGRAM (P39 AND P79)
// PORT: SOURCE STABLE_ORBIT.agc:285
//#
// PORT: SOURCE STABLE_ORBIT.agc:286
//# MOD NO -1		LOG SECTION - STABLE ORBIT - P38-P39
// PORT: SOURCE STABLE_ORBIT.agc:287
//# MOD BY RUDNICKI.S	DATE 25JAN68
// PORT: SOURCE STABLE_ORBIT.agc:288
//#
// PORT: SOURCE STABLE_ORBIT.agc:289
//# Page 728
// PORT: SOURCE STABLE_ORBIT.agc:290
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE STABLE_ORBIT.agc:291
//#
// PORT: SOURCE STABLE_ORBIT.agc:292
//#	P39 AND P79 CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL
// PORT: SOURCE STABLE_ORBIT.agc:293
//#	CONDITIONS REQUIRED BY THE AGC TO MAKE A MIDCOURSE CORRECTION
// PORT: SOURCE STABLE_ORBIT.agc:294
//#	MANEUVER AFTER COMPLETING THE SOI MANEUVER BUT BEFORE MAKING
// PORT: SOURCE STABLE_ORBIT.agc:295
//#	THE SOR MANEUVER.
// PORT: SOURCE STABLE_ORBIT.agc:296
//#
// PORT: SOURCE STABLE_ORBIT.agc:297
//# CALLING SEQUENCE
// PORT: SOURCE STABLE_ORBIT.agc:298
//#
// PORT: SOURCE STABLE_ORBIT.agc:299
//#	ASTRONAUT REQUEST THRU DSKY
// PORT: SOURCE STABLE_ORBIT.agc:300
//#
// PORT: SOURCE STABLE_ORBIT.agc:301
//#	V37E39E		IF THIS VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:302
//#	V37E79E		IF OTHER VEHICLE IS ACTIVE VEHICLE
// PORT: SOURCE STABLE_ORBIT.agc:303
//#
// PORT: SOURCE STABLE_ORBIT.agc:304
//# INPUT
// PORT: SOURCE STABLE_ORBIT.agc:305
//#
// PORT: SOURCE STABLE_ORBIT.agc:306
//#	(1)  TPASS4	TIME OF INTERCEPT - SAVED FROM P38/P78
// PORT: SOURCE STABLE_ORBIT.agc:307
//#	(2)  TARGTIME	TIME THAT PASSIVE VEHICLE IS AT INTERCEPT POINT -
// PORT: SOURCE STABLE_ORBIT.agc:308
//#			SAVED FROM P38/P78
// PORT: SOURCE STABLE_ORBIT.agc:309
//#
// PORT: SOURCE STABLE_ORBIT.agc:310
//# OUTPUT
// PORT: SOURCE STABLE_ORBIT.agc:311
//#
// PORT: SOURCE STABLE_ORBIT.agc:312
//#	(1)  TRKMKCNT	NUMBER OF MARKS.
// PORT: SOURCE STABLE_ORBIT.agc:313
//#	(2)  TTOGO	TIME TO GO
// PORT: SOURCE STABLE_ORBIT.agc:314
//#	(3)  +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE STABLE_ORBIT.agc:315
//#	(4)  DELVLVC	DELTA VELOCITY AT MID - LOCAL VERTICAL COORDINATES
// PORT: SOURCE STABLE_ORBIT.agc:316
//#
// PORT: SOURCE STABLE_ORBIT.agc:317
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:318
//#
// PORT: SOURCE STABLE_ORBIT.agc:319
//#	AVFLAGA
// PORT: SOURCE STABLE_ORBIT.agc:320
//#	AVFLAGP
// PORT: SOURCE STABLE_ORBIT.agc:321
//#	LOADTIME
// PORT: SOURCE STABLE_ORBIT.agc:322
//#	SELECTMU
// PORT: SOURCE STABLE_ORBIT.agc:323
//#	PRECSET
// PORT: SOURCE STABLE_ORBIT.agc:324
//#	S34/35.1
// PORT: SOURCE STABLE_ORBIT.agc:325
//#	MAINRTNE
// PORT: SOURCE STABLE_ORBIT.agc:326
//
// PORT: SOURCE STABLE_ORBIT.agc:327
//P39		TC	BANKCALL
// PORT: Fixed ROM slots 31569.
    if slot <> 31569 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1996] to agcAotUnit1996@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:328
//		CADR	AVFLAGA		# THIS VEHICLE ACTIVE
// PORT: Fixed ROM slots 31570.
    31570, 59854
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31571–31574.
function agcAotUnit1997 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31572 {
        if slot <= 31571 {
// PORT: SOURCE STABLE_ORBIT.agc:329
//		EXTEND
// PORT: Fixed ROM slots 31571.
            if slot <> 31571 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:330
//		DCA	ATIGINC
// PORT: Fixed ROM slots 31572.
            if slot <> 31572 or instruction <> 13057 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 769, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31573 {
// PORT: SOURCE STABLE_ORBIT.agc:331
//		TC	P39/P79A
// PORT: Fixed ROM slots 31573.
            if slot <> 31573 or instruction <> 1882 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1882, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:332
//P79		TC	BANKCALL
// PORT: Fixed ROM slots 31574.
            if slot <> 31574 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1997] to agcAotUnit1997@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:333
//		CADR	AVFLAGP		# OTHER VEHICLE ACTIVE
// PORT: Fixed ROM slots 31575.
    31575, 59864
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31576–31579.
function agcAotUnit1998 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31577 {
        if slot <= 31576 {
// PORT: SOURCE STABLE_ORBIT.agc:334
//		EXTEND
// PORT: Fixed ROM slots 31576.
            if slot <> 31576 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:335
//		DCA	PTIGINC
// PORT: Fixed ROM slots 31577.
            if slot <> 31577 or instruction <> 13059 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 771, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31578 {
// PORT: SOURCE STABLE_ORBIT.agc:336
//P39/P79A	DXCH	KT		# TIME TO PREPARE FOR BURN
// PORT: Fixed ROM slots 31578.
            if slot <> 31578 or instruction <> 22398 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 894, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:337
//		TC	BANKCALL
// PORT: Fixed ROM slots 31579.
            if slot <> 31579 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1998] to agcAotUnit1998@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:338
//		CADR	P20FLGON	# SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 31580.
    31580, 59874
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31581–31581.
function agcAotUnit1999 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE STABLE_ORBIT.agc:339
//		TC	INTPRET
// PORT: Fixed ROM slots 31581.
    if slot <> 31581 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1999] to agcAotUnit1999@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:340
//# Page 729
// PORT: SOURCE STABLE_ORBIT.agc:341
//		SET	CALL
// PORT: Fixed ROM slots 31582.
    31582, 37912,
// PORT: SOURCE STABLE_ORBIT.agc:342
//			P39/79SW
// PORT: Fixed ROM slots 31583.
    31583, 4204,
// PORT: SOURCE STABLE_ORBIT.agc:343
//			SELECTMU	# SELECT MU, CLEAR FINALFLG, GO TO VN1645
// PORT: Fixed ROM slots 31584.
    31584, 16384,
// PORT: SOURCE STABLE_ORBIT.agc:344
//P39/P79B	RTB	DAD
// PORT: Fixed ROM slots 31585.
    31585, 36152,
// PORT: SOURCE STABLE_ORBIT.agc:345
//			LOADTIME
// PORT: Fixed ROM slots 31586.
    31586, 18166,
// PORT: SOURCE STABLE_ORBIT.agc:346
//			KT
// PORT: Fixed ROM slots 31587.
    31587, 3836,
// PORT: SOURCE STABLE_ORBIT.agc:347
//		STORE	TIG		# TIG = T (PRESENT) + PREPARATION TIME
// PORT: Fixed ROM slots 31588.
    31588, 3652,
// PORT: SOURCE STABLE_ORBIT.agc:348
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// PORT: Fixed ROM slots 31589.
    31589, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:349
//			PRECSET		# 	VEHICLES TO TIG
// PORT: Fixed ROM slots 31590.
    31590, 39392,
// PORT: SOURCE STABLE_ORBIT.agc:350
//		CALL
// PORT: Fixed ROM slots 31591.
    31591, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:351
//			S34/35.1	# GET UNIT NORMAL
// PORT: Fixed ROM slots 31592.
    31592, 60792,
// PORT: SOURCE STABLE_ORBIT.agc:352
//		DLOAD	GOTO
// PORT: Fixed ROM slots 31593.
    31593, 43210,
// PORT: SOURCE STABLE_ORBIT.agc:353
//			TARGTIME
// PORT: Fixed ROM slots 31594.
    31594, 2446,
// PORT: SOURCE STABLE_ORBIT.agc:354
//			MAINRTNE	# CALCULATE DELTA V AND DELTA V (LV)
// PORT: Fixed ROM slots 31595.
    31595, 58936,
// PORT: SOURCE STABLE_ORBIT.agc:355
//
// PORT: SOURCE STABLE_ORBIT.agc:356
//# .... PREC/TT ....
// PORT: SOURCE STABLE_ORBIT.agc:357
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:358
//#
// PORT: SOURCE STABLE_ORBIT.agc:359
//#	PRECSET
// PORT: SOURCE STABLE_ORBIT.agc:360
//#	TIMETHET
// PORT: SOURCE STABLE_ORBIT.agc:361
//#	S34/35.1
// PORT: SOURCE STABLE_ORBIT.agc:362
//
// PORT: SOURCE STABLE_ORBIT.agc:363
//PREC/TT		STQ	DLOAD
// PORT: Fixed ROM slots 31596.
    31596, 58656,
// PORT: SOURCE STABLE_ORBIT.agc:364
//			RTRN
// PORT: Fixed ROM slots 31597.
    31597, 3690,
// PORT: SOURCE STABLE_ORBIT.agc:365
//			TIG
// PORT: Fixed ROM slots 31598.
    31598, 3652,
// PORT: SOURCE STABLE_ORBIT.agc:366
//		STCALL	TDEC1		# PRECISION UPDATE ACTIVE AND PASSIVE
// PORT: Fixed ROM slots 31599.
    31599, 28738,
// PORT: SOURCE STABLE_ORBIT.agc:367
//			PRECSET		#	VEHICLES TO TIG
// PORT: Fixed ROM slots 31600.
    31600, 39392,
// PORT: SOURCE STABLE_ORBIT.agc:368
//		VLOAD	VSR*
// PORT: Fixed ROM slots 31601.
    31601, 45050,
// PORT: SOURCE STABLE_ORBIT.agc:369
//			RPASS3
// PORT: Fixed ROM slots 31602.
    31602, 3796,
// PORT: SOURCE STABLE_ORBIT.agc:370
//			0,2
// PORT: Fixed ROM slots 31603.
    31603, 48380,
// PORT: SOURCE STABLE_ORBIT.agc:371
//		STODL	RVEC
// PORT: Fixed ROM slots 31604.
    31604, 15194,
// PORT: SOURCE STABLE_ORBIT.agc:372
//			CENTANG
// PORT: Fixed ROM slots 31605.
    31605, 3874,
// PORT: SOURCE STABLE_ORBIT.agc:373
//		PUSH	COS
// PORT: Fixed ROM slots 31606.
    31606, 58892,
// PORT: SOURCE STABLE_ORBIT.agc:374
//		STODL	CSTH
// PORT: Fixed ROM slots 31607.
    31607, 15284,
// PORT: SOURCE STABLE_ORBIT.agc:375
//		SIN	SET
// PORT: Fixed ROM slots 31608.
    31608, 36060,
// PORT: SOURCE STABLE_ORBIT.agc:376
//			RVSW
// PORT: Fixed ROM slots 31609.
    31609, 3692,
// PORT: SOURCE STABLE_ORBIT.agc:377
//		STOVL	SNTH
// PORT: Fixed ROM slots 31610.
    31610, 23472,
// PORT: SOURCE STABLE_ORBIT.agc:378
//			VPASS3
// PORT: Fixed ROM slots 31611.
    31611, 3808,
// PORT: SOURCE STABLE_ORBIT.agc:379
//		VSR*
// PORT: Fixed ROM slots 31612.
    31612, 65374,
// PORT: SOURCE STABLE_ORBIT.agc:380
//			0,2
// PORT: Fixed ROM slots 31613.
    31613, 48380,
// PORT: SOURCE STABLE_ORBIT.agc:381
//		STCALL	VVEC		# GET TRANSFER TIME BASED ON CENTANG OF
// PORT: Fixed ROM slots 31614.
    31614, 31688,
// PORT: SOURCE STABLE_ORBIT.agc:382
//			TIMETHET	#	PASSIVE VEHICLE
// PORT: Fixed ROM slots 31615.
    31615, 21428,
// PORT: SOURCE STABLE_ORBIT.agc:383
//		CALL
// PORT: Fixed ROM slots 31616.
    31616, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:384
//			S34/35.1	# GET UNIT NORMAL
// PORT: Fixed ROM slots 31617.
    31617, 60792,
// PORT: SOURCE STABLE_ORBIT.agc:385
//		DLOAD	GOTO
// PORT: Fixed ROM slots 31618.
    31618, 43210,
// PORT: SOURCE STABLE_ORBIT.agc:386
//			T
// PORT: Fixed ROM slots 31619.
    31619, 62,
// PORT: SOURCE STABLE_ORBIT.agc:387
//			RTRN
// PORT: Fixed ROM slots 31620.
    31620, 3690,
// PORT: SOURCE STABLE_ORBIT.agc:388
//
// PORT: SOURCE STABLE_ORBIT.agc:389
//# .... INTRPVP ....
// PORT: SOURCE STABLE_ORBIT.agc:390
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:391
//#
// PORT: SOURCE STABLE_ORBIT.agc:392
//#	CSMPREC
// PORT: SOURCE STABLE_ORBIT.agc:393
//# Page 730
// PORT: SOURCE STABLE_ORBIT.agc:394
//#	LEMPREC
// PORT: SOURCE STABLE_ORBIT.agc:395
//
// PORT: SOURCE STABLE_ORBIT.agc:396
//INTRPVP		STQ	BOFF		# PRECISION UPDATE PASSIVE VEHICLE TO
// PORT: Fixed ROM slots 31621.
    31621, 35872,
// PORT: SOURCE STABLE_ORBIT.agc:397
//			RTRN		#	TDEC1
// PORT: Fixed ROM slots 31622.
    31622, 3690,
// PORT: SOURCE STABLE_ORBIT.agc:398
//			AVFLAG
// PORT: Fixed ROM slots 31623.
    31623, 1492,
// PORT: SOURCE STABLE_ORBIT.agc:399
//			OTHERV
// PORT: Fixed ROM slots 31624.
    31624, 59162,
// PORT: SOURCE STABLE_ORBIT.agc:400
//		CALL
// PORT: Fixed ROM slots 31625.
    31625, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:401
//			CSMPREC
// PORT: Fixed ROM slots 31626.
    31626, 23622,
// PORT: SOURCE STABLE_ORBIT.agc:402
//		GOTO
// PORT: Fixed ROM slots 31627.
    31627, 65360,
// PORT: SOURCE STABLE_ORBIT.agc:403
//			RTRN
// PORT: Fixed ROM slots 31628.
    31628, 3690,
// PORT: SOURCE STABLE_ORBIT.agc:404
//OTHERV		CALL
// PORT: Fixed ROM slots 31629.
    31629, 65320,
// PORT: SOURCE STABLE_ORBIT.agc:405
//			LEMPREC
// PORT: Fixed ROM slots 31630.
    31630, 23646,
// PORT: SOURCE STABLE_ORBIT.agc:406
//		GOTO
// PORT: Fixed ROM slots 31631.
    31631, 65360,
// PORT: SOURCE STABLE_ORBIT.agc:407
//			RTRN
// PORT: Fixed ROM slots 31632.
    31632, 3690
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31633–31637.
function agcAotUnit2000 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31634 {
        if slot <= 31633 {
// PORT: SOURCE STABLE_ORBIT.agc:408
//
// PORT: SOURCE STABLE_ORBIT.agc:409
//# .... VNDSPLY ....
// PORT: SOURCE STABLE_ORBIT.agc:410
//# SUBROUTINES USED
// PORT: SOURCE STABLE_ORBIT.agc:411
//#
// PORT: SOURCE STABLE_ORBIT.agc:412
//#	BANKCALL
// PORT: SOURCE STABLE_ORBIT.agc:413
//#	GOFLASH
// PORT: SOURCE STABLE_ORBIT.agc:414
//#	GOTOPOOH
// PORT: SOURCE STABLE_ORBIT.agc:415
//
// PORT: SOURCE STABLE_ORBIT.agc:416
//VNDSPLY		EXTEND			# FLASH DISPLAY
// PORT: Fixed ROM slots 31633.
            if slot <> 31633 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:417
//		QXCH	RTRN
// PORT: Fixed ROM slots 31634.
            if slot <> 31634 or instruction <> 10037 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 821, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31635 {
// PORT: SOURCE STABLE_ORBIT.agc:418
//		TS	VERBNOUN
// PORT: Fixed ROM slots 31635.
            if slot <> 31635 or instruction <> 23437 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23437, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31636 {
// PORT: SOURCE STABLE_ORBIT.agc:419
//		CA	VERBNOUN
// PORT: Fixed ROM slots 31636.
                if slot <> 31636 or instruction <> 13197 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 909).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE STABLE_ORBIT.agc:420
//		TCR	BANKCALL
// PORT: Fixed ROM slots 31637.
                if slot <> 31637 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2000] to agcAotUnit2000@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:421
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31638.
    31638, 17020
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31639–31641.
function agcAotUnit2001 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31639 {
// PORT: SOURCE STABLE_ORBIT.agc:422
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 31639.
        if slot <> 31639 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31640 {
// PORT: SOURCE STABLE_ORBIT.agc:423
//		TC	RTRN		# PROCEED
// PORT: Fixed ROM slots 31640.
            if slot <> 31640 or instruction <> 821 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 821, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE STABLE_ORBIT.agc:424
//		TCF	-5		# RECYCLE
// PORT: Fixed ROM slots 31641.
            if slot <> 31641 or instruction <> 6036 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6036, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2001] to agcAotUnit2001@.

agcAotInstallSourceRope(list(
// PORT: SOURCE STABLE_ORBIT.agc:425
//V06N33SR	VN	0633
// PORT: Fixed ROM slots 31642.
    31642, 1602,
// PORT: SOURCE STABLE_ORBIT.agc:426
//V06N55SR	VN	0655
// PORT: Fixed ROM slots 31643.
    31643, 1646,
// PORT: SOURCE STABLE_ORBIT.agc:427
//V04N06SR	VN	0406
// PORT: Fixed ROM slots 31644.
    31644, 1036,
// PORT: SOURCE STABLE_ORBIT.agc:428
//V06N57SR	VN	0657
// PORT: Fixed ROM slots 31645.
    31645, 1650,
// PORT: SOURCE STABLE_ORBIT.agc:429
//V06N34SR	VN	0634
// PORT: Fixed ROM slots 31646.
    31646, 1604,
// PORT: SOURCE STABLE_ORBIT.agc:430
//V06N58SR	VN	0658
// PORT: Fixed ROM slots 31647.
    31647, 1652,
// PORT: SOURCE STABLE_ORBIT.agc:431
//V06N81SR	VN	0681
// PORT: Fixed ROM slots 31648.
    31648, 1698,
// PORT: SOURCE STABLE_ORBIT.agc:432
//DECTWO		OCT	2
// PORT: Fixed ROM slots 31649.
    31649, 4
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE STABLE_ORBIT.agc:433
//
// PORT: SOURCE STABLE_ORBIT.agc:434
//# *** END OF KISSING  .050 ***
// PORT: SOURCE STABLE_ORBIT.agc:435
//
// PORT: SOURCE STABLE_ORBIT.agc:436
//
