// P30-P37.agc
agcAotInstallSourceRope(list(
// P30-P37.agc:1
//# Copyright:	Public domain.
// P30-P37.agc:2
//# Filename:	P30-P37.agc
// P30-P37.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// P30-P37.agc:4
//#		It is part of the source code for the Command Module's (CM)
// P30-P37.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P30-P37.agc:6
//# Assembler:	yaYUL
// P30-P37.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// P30-P37.agc:8
//# Website:	www.ibiblio.org/apollo.
// P30-P37.agc:9
//# Pages:	635-648
// P30-P37.agc:10
//# Mod history:	2009-05-10 RSB	Adapted from the Colossus249/ file
// P30-P37.agc:11
//#				of the same name, using Comanche055 page
// P30-P37.agc:12
//#				images.
// P30-P37.agc:13
//#		2009-05-20 RSB	Corrected BDV -> BOV.
// P30-P37.agc:14
//#
// P30-P37.agc:15
//# This source code has been transcribed or otherwise adapted from digitized
// P30-P37.agc:16
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// P30-P37.agc:17
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// P30-P37.agc:18
//# thanks to both.  The images (with suitable reduction in storage size and
// P30-P37.agc:19
//# consequent reduction in image quality as well) are available online at
// P30-P37.agc:20
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// P30-P37.agc:21
//# illegible, contact me at info@sandroid.org about getting access to the
// P30-P37.agc:22
//# (much) higher-quality images which Fjeld Kerman actually created.
// P30-P37.agc:23
//#
// P30-P37.agc:24
//# Notations on the hardcopy document read, in part:
// P30-P37.agc:25
//#
// P30-P37.agc:26
//#	Assemble revision 055 of AGC program Comanche by NASA
// P30-P37.agc:27
//#	2021113-051.  10:28 APR. 1, 1969
// P30-P37.agc:28
//#
// P30-P37.agc:29
//#	This AGC program shall also be referred to as
// P30-P37.agc:30
//#			Colossus 2A
// P30-P37.agc:31
//
// P30-P37.agc:32
//# Page 635
// P30-P37.agc:33
//		BANK	32
// P30-P37.agc:34
//
// P30-P37.agc:35
//		SETLOC	P30S1
// P30-P37.agc:36
//		BANK
// P30-P37.agc:37
//
// P30-P37.agc:38
//		EBANK=	+MGA
// P30-P37.agc:39
//
// P30-P37.agc:40
//		COUNT	35/P34
// P30-P37.agc:41
//
// P30-P37.agc:42
//DISPMGA		STQ	EXIT		# USED IN P30
// slot 32436
    32436, 65056,
// P30-P37.agc:43
//
// P30-P37.agc:44
//			RGEXIT
// slot 32437
    32437, 2544
)).

// bank 35, slots 32438-32440
function agcAotUnit1834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32438 {
// P30-P37.agc:45
//		TC	COMPTGO
// slot 32438
        if slot <> 32438 or instruction <> 1732 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1732, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32439 {
// P30-P37.agc:46
//
// P30-P37.agc:47
//DISP45		CAF	V16N45
// slot 32439
            if slot <> 32439 or instruction <> 14737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2449), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:48
//		TC	BANKCALL
// slot 32440
            if slot <> 32440 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1834] to agcAotUnit1834@.

agcAotInstallSourceRope(list(
// P30-P37.agc:49
//		CADR	GOFLASHR
// slot 32441
    32441, 17502
)).

// bank 35, slots 32442-32445
function agcAotUnit1835 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32443 {
        if slot <= 32442 {
// P30-P37.agc:50
//		TC	GOTOPOOH
// slot 32442
            if slot <> 32442 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:51
//		TC	END45
// slot 32443
            if slot <> 32443 or instruction <> 1728 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1728, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32444 {
// P30-P37.agc:52
//		TC	DISP45
// slot 32444
            if slot <> 32444 or instruction <> 1719 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1719, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:53
//P30PHSI		TC	PHASCHNG
// slot 32445
            if slot <> 32445 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1835] to agcAotUnit1835@.

agcAotInstallSourceRope(list(
// P30-P37.agc:54
//		OCT	14
// slot 32446
    32446, 24
)).

// bank 35, slots 32447-32448
function agcAotUnit1836 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32447 {
// P30-P37.agc:55
//		TCR	ENDOFJOB
// slot 32447
        if slot <> 32447 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P30-P37.agc:56
//END45		TC	INTPRET
// slot 32448
        if slot <> 32448 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1836] to agcAotUnit1836@.

agcAotInstallSourceRope(list(
// P30-P37.agc:57
//		CLEAR	GOTO
// slot 32449
    32449, 43032,
// P30-P37.agc:58
//			TIMRFLAG
// slot 32450
    32450, 3944,
// P30-P37.agc:59
//			RGEXIT
// slot 32451
    32451, 2544
)).

// bank 35, slots 32452-32454
function agcAotUnit1837 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32452 {
// P30-P37.agc:60
//
// P30-P37.agc:61
//COMPTGO		EXTEND			# USED TO COMPUTE TTOGO
// slot 32452
        if slot <> 32452 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32453 {
// P30-P37.agc:62
//		QXCH	PHSPRDT6	# ** GROUP 6 TEMPORARY USED .. BEWARE **
// slot 32453
            if slot <> 32453 or instruction <> 9782 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 566, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:63
//
// P30-P37.agc:64
//		TC	UPFLAG		# SET TIMRFLAG
// slot 32454
            if slot <> 32454 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1837] to agcAotUnit1837@.

agcAotInstallSourceRope(list(
// P30-P37.agc:65
//		ADRES	TIMRFLAG	# BIT 11 FLAG 7
// slot 32455
    32455, 218
)).

// bank 35, slots 32456-32459
function agcAotUnit1838 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32457 {
        if slot <= 32456 {
// P30-P37.agc:66
//		CAF	ZERO
// slot 32456
            if slot <> 32456 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:67
//		TS	NVWORD1
// slot 32457
            if slot <> 32457 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32458 {
// P30-P37.agc:68
//
// P30-P37.agc:69
//		CAF	ONE
// slot 32458
            if slot <> 32458 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:70
//		TC	WAITLIST
// slot 32459
            if slot <> 32459 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1838] to agcAotUnit1838@.

agcAotInstallSourceRope(list(
// P30-P37.agc:71
//		EBANK=	TIG
// P30-P37.agc:72
//		2CADR	CLOKTASK
// slot 32460 32461
    32460, 3424, 32461, 41070
)).

// bank 35, slots 32462-32462
function agcAotUnit1839 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:73
//
// P30-P37.agc:74
//		TC	2PHSCHNG
// slot 32462
    if slot <> 32462 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1839] to agcAotUnit1839@.

agcAotInstallSourceRope(list(
// P30-P37.agc:75
//		OCT	40036		# 6.3SPOT FOR CLOKTASK
// slot 32463
    32463, 32828,
// P30-P37.agc:76
//		OCT	05024		# GROUP 4 CONTINUES HERE
// slot 32464
    32464, 5160,
// P30-P37.agc:77
//		OCT	13000
// slot 32465
    32465, 11264
)).

// bank 35, slots 32466-32469
function agcAotUnit1840 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32467 {
        if slot <= 32466 {
// P30-P37.agc:78
//
// P30-P37.agc:79
//		TC	PHSPRDT6
// slot 32466
            if slot <> 32466 or instruction <> 566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 566, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:80
//# Page 636
// P30-P37.agc:81
//# PROGRAM DESCRIPTION P30	DATE 3-6-67
// P30-P37.agc:82
//
// P30-P37.agc:83
//# MOD.I BY ZELDIN KERMAN-  TO ADD P31 AND AD APT P30 FOR P31 USE.	22DEC67
// P30-P37.agc:84
//# FUNCTIONAL DESCRIPTION
// P30-P37.agc:85
//# +30(EXTERNAL DELTA-V TARGETTING PROGRAM)
// P30-P37.agc:86
//#	ACCEPTS VAL INPUTS OF TIG,DELV(LV) AND COMPUTES,FOR DISPLAY,
// P30-P37.agc:87
//#	APOGEE,PERIGEE,DELV(MAG),MGA ASSOCIATED WITH DESIRED MANEUVER
// P30-P37.agc:88
//
// P30-P37.agc:89
//# P31(GENERAL LAMBERT AIMPOINT GUIDANCE)
// P30-P37.agc:90
//# A GROUND RULE FOR P31 IS THE ANGLE BETWEEN THE TARGET VECTOR AND
// P30-P37.agc:91
//# POSITION VECTOR AT TIG IS NOT 165-195 DEGREES APART
// P30-P37.agc:92
//#	BASED ON STORED INPUT OF OFFSET TARGET(B+29) AND DELTA T TRANS,AND
// P30-P37.agc:93
//#	VAL ENTRY OF TIG,P31 COMPUTES REQUIRED VELOCITY FOR MANEUVER
// P30-P37.agc:94
//#	AND,FOR DISPLAY,APOGEE,PERIGEE,DELV(7AG),+MGA ASSOCIATED WITH
// P30-P37.agc:95
//#	DESIRED MANEUVER
// P30-P37.agc:96
//
// P30-P37.agc:97
//# THE FOLLOWING SUBROUTINES ARE USED IN P30 AND P31
// P30-P37.agc:98
//#	S30.1 (P30 ONLY)
// P30-P37.agc:99
//#	S31.1 (P31 ONLY)
// P30-P37.agc:100
//#	P30/P31 - DISPLAYS TIG
// P30-P37.agc:101
//#	CNTUP30 - DISPLAYS DELV(LV)
// P30-P37.agc:102
//#	PARAM30 - DISPLAYS APOGEE,PERIGEE,DELV(MAG),MGA,TIME FROM TIG,
// P30-P37.agc:103
//#		  MARKS SINCE LAST THRUSTING MANEUVER
// P30-P37.agc:104
//
// P30-P37.agc:105
//# CALLING SEQUENCE VIA JOB FROM V37
// P30-P37.agc:106
//
// P30-P37.agc:107
//# EXIT VIA V37 OR GOTOPOOH
// P30-P37.agc:108
//
// P30-P37.agc:109
//# OUTPUT FOR POWERED FLIGHT
// P30-P37.agc:110
//#	VTIG	X
// P30-P37.agc:111
//#	RTIG	 XSEE S30.1
// P30-P37.agc:112
//#	DELVSIN	 X
// P30-P37.agc:113
//#	VGDISP
// P30-P37.agc:114
//#	RTARG	X
// P30-P37.agc:115
//#	TPASS4	 X SEE S31.1
// P30-P37.agc:116
//#		X
// P30-P37.agc:117
//
// P30-P37.agc:118
//
// P30-P37.agc:119
//		COUNT	35/P30
// P30-P37.agc:120
//
// P30-P37.agc:121
//P30		TC	P30/P31
// slot 32467
            if slot <> 32467 or instruction <> 1773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32468 {
// P30-P37.agc:122
//		TC	CNTNUP30
// slot 32468
            if slot <> 32468 or instruction <> 1788 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1788, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:123
//		TC	DOWNFLAG	# RESET UPDATFLG
// slot 32469
            if slot <> 32469 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1840] to agcAotUnit1840@.

agcAotInstallSourceRope(list(
// P30-P37.agc:124
//		ADRES	UPDATFLG	# BIT 7  FLAG 1
// slot 32470
    32470, 46
)).

// bank 35, slots 32471-32471
function agcAotUnit1841 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:125
//		TC	INTPRET
// slot 32471
    if slot <> 32471 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1841] to agcAotUnit1841@.

agcAotInstallSourceRope(list(
// P30-P37.agc:126
//		CALL
// slot 32472
    32472, 65320,
// P30-P37.agc:127
//			S30.1
// slot 32473
    32473, 52858,
// P30-P37.agc:128
//		EXIT
// slot 32474
    32474, 65532
)).

// bank 35, slots 32475-32476
function agcAotUnit1842 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32475 {
// P30-P37.agc:129
//		TC	PARAM30
// slot 32475
        if slot <> 32475 or instruction <> 1796 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1796, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P30-P37.agc:130
//		TC	UPFLAG
// slot 32476
        if slot <> 32476 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1842] to agcAotUnit1842@.

agcAotInstallSourceRope(list(
// P30-P37.agc:131
//# Page 637
// P30-P37.agc:132
//		ADRES	XDELVFLG	# SET XDELVFLG BIT 8 FLAG 2
// slot 32477
    32477, 74
)).

// bank 35, slots 32478-32480
function agcAotUnit1843 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32478 {
// P30-P37.agc:133
//		TCF	GOTOPOOH
// slot 32478
        if slot <> 32478 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32479 {
// P30-P37.agc:134
//
// P30-P37.agc:135
//P31		TC	P30/P31
// slot 32479
            if slot <> 32479 or instruction <> 1773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:136
//		TC	DOWNFLAG
// slot 32480
            if slot <> 32480 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1843] to agcAotUnit1843@.

agcAotInstallSourceRope(list(
// P30-P37.agc:137
//		ADRES	UPDATFLG	# RESET UPDATFLG BIT 7 FLAG 1
// slot 32481
    32481, 46
)).

// bank 35, slots 32482-32482
function agcAotUnit1844 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:138
//		TC	DOWNFLAG
// slot 32482
    if slot <> 32482 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1844] to agcAotUnit1844@.

agcAotInstallSourceRope(list(
// P30-P37.agc:139
//		ADRES	NORMSW		# RESET NORMSW 		BIT 10 FLAG 7
// slot 32483
    32483, 220
)).

// bank 35, slots 32484-32484
function agcAotUnit1845 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:140
//		TC	INTPRET
// slot 32484
    if slot <> 32484 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1845] to agcAotUnit1845@.

agcAotInstallSourceRope(list(
// P30-P37.agc:141
//		CALL
// slot 32485
    32485, 65320,
// P30-P37.agc:142
//			S31.1
// slot 32486
    32486, 52942,
// P30-P37.agc:143
//		EXIT
// slot 32487
    32487, 65532
)).

// bank 35, slots 32488-32490
function agcAotUnit1846 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32488 {
// P30-P37.agc:144
//		TC	CNTNUP30
// slot 32488
        if slot <> 32488 or instruction <> 1788 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1788, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32489 {
// P30-P37.agc:145
//		TC	PARAM30
// slot 32489
            if slot <> 32489 or instruction <> 1796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:146
//		TC	DOWNFLAG
// slot 32490
            if slot <> 32490 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1846] to agcAotUnit1846@.

agcAotInstallSourceRope(list(
// P30-P37.agc:147
//		ADRES	XDELVFLG	# BIT 8 FLAG 2
// slot 32491
    32491, 74
)).

// bank 35, slots 32492-32495
function agcAotUnit1847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32493 {
        if slot <= 32492 {
// P30-P37.agc:148
//		TCF	GOTOPOOH
// slot 32492
            if slot <> 32492 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:149
//
// P30-P37.agc:150
//P30/P31		XCH	Q
// slot 32493
            if slot <> 32493 or instruction <> 23554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 2, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32494 {
// P30-P37.agc:151
//		TS	P30/31RT
// slot 32494
            if slot <> 32494 or instruction <> 23476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:152
//		TC	UPFLAG
// slot 32495
            if slot <> 32495 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1847] to agcAotUnit1847@.

agcAotInstallSourceRope(list(
// P30-P37.agc:153
//		ADRES	UPDATFLG	# SET UPDATFLG BIT 7 FLAG 1
// slot 32496
    32496, 46
)).

// bank 35, slots 32497-32497
function agcAotUnit1848 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:154
//		TC	UPFLAG
// slot 32497
    if slot <> 32497 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1848] to agcAotUnit1848@.

agcAotInstallSourceRope(list(
// P30-P37.agc:155
//		ADRES	TRACKFLG	# SET TRACKFLG BIT 5 FLAG 1
// slot 32498
    32498, 50
)).

// bank 35, slots 32499-32500
function agcAotUnit1849 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32499 {
// P30-P37.agc:156
//		CAF	V06N33		# T OF IGN
// slot 32499
        if slot <> 32499 or instruction <> 14113 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1825), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P30-P37.agc:157
//		TC	BANKCALL
// slot 32500
        if slot <> 32500 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1849] to agcAotUnit1849@.

agcAotInstallSourceRope(list(
// P30-P37.agc:158
//		CADR	GOFLASHR
// slot 32501
    32501, 17502
)).

// bank 35, slots 32502-32505
function agcAotUnit1850 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32503 {
        if slot <= 32502 {
// P30-P37.agc:159
//		TCF	GOTOPOOH
// slot 32502
            if slot <> 32502 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:160
//		TC	P30/31RT
// slot 32503
            if slot <> 32503 or instruction <> 948 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 948, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32504 {
// P30-P37.agc:161
//		TCF	P30/P31 +4
// slot 32504
            if slot <> 32504 or instruction <> 5873 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5873, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:162
//		TC	PHASCHNG
// slot 32505
            if slot <> 32505 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1850] to agcAotUnit1850@.

agcAotInstallSourceRope(list(
// P30-P37.agc:163
//		OCT	00014
// slot 32506
    32506, 24
)).

// bank 35, slots 32507-32511
function agcAotUnit1851 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32508 {
        if slot <= 32507 {
// P30-P37.agc:164
//		TC	ENDOFJOB
// slot 32507
            if slot <> 32507 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:165
//
// P30-P37.agc:166
//CNTNUP30	XCH	Q
// slot 32508
            if slot <> 32508 or instruction <> 23554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 2, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32509 {
// P30-P37.agc:167
//		TS	P30/RET
// slot 32509
            if slot <> 32509 or instruction <> 23127 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23127, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32510 {
// P30-P37.agc:168
//		CAF	V06N81
// slot 32510
                if slot <> 32510 or instruction <> 14736 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2448), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:169
//		TC	BANKCALL
// slot 32511
                if slot <> 32511 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1851] to agcAotUnit1851@.

agcAotInstallSourceRope(list(
// P30-P37.agc:170
//		CADR	GOFLASH
// slot 32512
    32512, 17312
)).

// bank 35, slots 32513-32519
function agcAotUnit1852 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32515 {
        if slot <= 32513 {
// P30-P37.agc:171
//		TCF	GOTOPOOH
// slot 32513
            if slot <> 32513 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32514 {
// P30-P37.agc:172
//		TC	P30/RET
// slot 32514
                if slot <> 32514 or instruction <> 599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:173
//		TCF	CNTNUP30 +2
// slot 32515
                if slot <> 32515 or instruction <> 5886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32517 {
            if slot <= 32516 {
// P30-P37.agc:174
//PARAM30		XCH	Q
// slot 32516
                if slot <> 32516 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:175
//		TS	P30/31RT
// slot 32517
                if slot <> 32517 or instruction <> 23476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32518 {
// P30-P37.agc:176
//		CAF	V06N42
// slot 32518
                if slot <> 32518 or instruction <> 14114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1826), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:177
//		TC	BANKCALL
// slot 32519
                if slot <> 32519 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1852] to agcAotUnit1852@.

agcAotInstallSourceRope(list(
// P30-P37.agc:178
//		CADR	GOFLASH
// slot 32520
    32520, 17312
)).

// bank 35, slots 32521-32528
function agcAotUnit1853 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32524 {
        if slot <= 32522 {
            if slot <= 32521 {
// P30-P37.agc:179
//		TC	GOTOPOOH	# ON TERMINATION GOTOPOOH
// slot 32521
                if slot <> 32521 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:180
//		TCF	REFTEST		# ON PROCEED GO DO REFTEST
// slot 32522
                if slot <> 32522 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32523 {
// P30-P37.agc:181
//# Page 638
// P30-P37.agc:182
//		TCF	PARAM30 +2
// slot 32523
                if slot <> 32523 or instruction <> 5894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:183
//REFTEST		CAF	BIT13
// slot 32524
                if slot <> 32524 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32526 {
            if slot <= 32525 {
// P30-P37.agc:184
//		MASK	STATE +3	# REFSMFLAG
// slot 32525
                if slot <> 32525 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:185
//		EXTEND
// slot 32526
                if slot <> 32526 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32527 {
// P30-P37.agc:186
//		BZF	NOTSET		# REFSMFLAG =0 , THEN BRANCH TO NOTSET
// slot 32527
                if slot <> 32527 or instruction <> 5911 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5911, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:187
//		TC	INTPRET
// slot 32528
                if slot <> 32528 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1853] to agcAotUnit1853@.

agcAotInstallSourceRope(list(
// P30-P37.agc:188
//		VLOAD	PUSH
// slot 32529
    32529, 34554,
// P30-P37.agc:189
//			DELVSIN
// slot 32530
    32530, 3916,
// P30-P37.agc:190
//		CALL
// slot 32531
    32531, 65320,
// P30-P37.agc:191
//			GET+MGA
// slot 32532
    32532, 9048,
// P30-P37.agc:192
//		GOTO
// slot 32533
    32533, 65360,
// P30-P37.agc:193
//			FLASHMGA
// slot 32534
    32534, 60982
)).

// bank 35, slots 32535-32538
function agcAotUnit1854 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32536 {
        if slot <= 32535 {
// P30-P37.agc:194
//NOTSET		EXTEND
// slot 32535
            if slot <> 32535 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:195
//		DCS	MARSDP
// slot 32536
            if slot <> 32536 or instruction <> 18208 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCS", 1824, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32537 {
// P30-P37.agc:196
//		DXCH	+MGA		# +MGA, +MGA+1 CONTAINS (-00001)
// slot 32537
            if slot <> 32537 or instruction <> 22422 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 918, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:197
//		TC	INTPRET
// slot 32538
            if slot <> 32538 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1854] to agcAotUnit1854@.

agcAotInstallSourceRope(list(
// P30-P37.agc:198
//FLASHMGA	CALL
// slot 32539
    32539, 65320,
// P30-P37.agc:199
//			DISPMGA
// slot 32540
    32540, 60776,
// P30-P37.agc:200
//		EXIT
// slot 32541
    32541, 65532
)).

// bank 35, slots 32542-32542
function agcAotUnit1855 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:201
//		TC	P30/31RT
// slot 32542
    if slot <> 32542 or instruction <> 948 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 948, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1855] to agcAotUnit1855@.

agcAotInstallSourceRope(list(
// P30-P37.agc:202
//MARSDP		OCT	00000		# (00000) (16440) = (+00001)
// slot 32543
    32543, 0,
// P30-P37.agc:203
//		OCT	35100
// slot 32544
    32544, 29824,
// P30-P37.agc:204
//					# ( .01 ) DEGREES IN THE LOW ORDER REGISTE
// P30-P37.agc:205
//
// P30-P37.agc:206
//V06N33		VN	0633
// slot 32545
    32545, 1602,
// P30-P37.agc:207
//V06N42		VN	0642
// slot 32546
    32546, 1620,
// P30-P37.agc:208
//V16N35		VN	1635
// slot 32547
    32547, 4166,
// P30-P37.agc:209
//V06N45		VN	0645
// slot 32548
    32548, 1626,
// P30-P37.agc:210
//
// P30-P37.agc:211
//# Page 639
// P30-P37.agc:212
//# PROGRAM DESCRIPTION S30.1	DATE 9NOV66
// P30-P37.agc:213
//
// P30-P37.agc:214
//# MOD NO 1			LOG SECTION P30,P37
// P30-P37.agc:215
//# MOD BY AIYAWAR KERMAN **
// P30-P37.agc:216
//# MOD.2 BY ZELDIN KERMAN - TO CORRECT MOD.1 FOR COLOSSUS		29DEC67
// P30-P37.agc:217
//# FUNCTIONAL DESCRIPTION
// P30-P37.agc:218
//#	BASED ON STORED TARGET PARAMETERS(R OF IGNITION(RTIG),V OF
// P30-P37.agc:219
//# IGNITION(VTIG),TIME OF IGNITION(TIG),DELV(LV),COMPUTE PERIGEE ALTITUDE
// P30-P37.agc:220
//# A+OGEE ALTITUDE AND DELTA-V REQUIRED IN REF. COORDS.(DELVSIN)
// P30-P37.agc:221
//# CALLING SEQUENCE
// P30-P37.agc:222
//#	L	CALL
// P30-P37.agc:223
//#	L+1		S30.1
// P30-P37.agc:224
//# NORMAL EXIT MODE
// P30-P37.agc:225
//#	AT L+2 OR CALLING SEQUENCE (GOTO L+2)
// P30-P37.agc:226
//# SUBROUTINES CALLED
// P30-P37.agc:227
//#	THISPREC
// P30-P37.agc:228
//#	PERIAPO
// P30-P37.agc:229
//# ALARM OR ABORT EXIT MODES
// P30-P37.agc:230
//#		NONE
// P30-P37.agc:231
//# ERASABLE INITIALIZATION REQUIRED
// P30-P37.agc:232
//#	TIG		TIME OF IGNITION	DP	B28CS
// P30-P37.agc:233
//#	DELVSLV		SPECIFIED DELTA-V IN LOCAL VERT.
// P30-P37.agc:234
//#			COORDS. OF ACTIVE VEHICLE AT
// P30-P37.agc:235
//#	TIME OF IGNITION			VCT.	B+7M/CS
// P30-P37.agc:236
//#
// P30-P37.agc:237
//# OUTPUT
// P30-P37.agc:238
//#	RTIG		POSITION AT TIG		VCT. 	B+29M
// P30-P37.agc:239
//#	VTIG		VELOCITY AT TIG		VCT. 	B+7M
// P30-P37.agc:240
//#	HAPO		APOGEE ALT.		DP 	B+29M
// P30-P37.agc:241
//#	HPER		PERIGEE ALT.		DP 	B+29M
// P30-P37.agc:242
//#	DELVSIN		DELVSLV IN REF COORDS	VCT. 	B+7M/CS
// P30-P37.agc:243
//#	VGDISP		MAG. OF DELVSIN		DP 	B+7M/CS
// P30-P37.agc:244
//# DEBRIS	QTEMP	TEMP. ERASABLE
// P30-P37.agc:245
//#		QPRET,MPAC
// P30-P37.agc:246
//#		PUSHLIST
// P30-P37.agc:247
//
// P30-P37.agc:248
//		SETLOC	P30S1A
// P30-P37.agc:249
//		BANK
// P30-P37.agc:250
//
// P30-P37.agc:251
//		COUNT	35/S30S
// P30-P37.agc:252
//
// P30-P37.agc:253
//S30.1		STQ	DLOAD
// slot 28477
    28477, 58656,
// P30-P37.agc:254
//			QTEMP
// slot 28478
    28478, 3934,
// P30-P37.agc:255
//			TIG		# TIME IGNITION SCALED AT 2(+28)CS
// slot 28479
    28479, 3606,
// P30-P37.agc:256
//		STCALL	TDEC1
// slot 28480
    28480, 28738,
// P30-P37.agc:257
//			THISPREC	# ENCKE ROUTINE FOR
// slot 28481
    28481, 23666,
// P30-P37.agc:258
//
// P30-P37.agc:259
//		VLOAD	SXA,2
// slot 28482
    28482, 56570,
// P30-P37.agc:260
//			VATT
// slot 28483
    28483, 14,
// P30-P37.agc:261
//			RTX2
// slot 28484
    28484, 4044,
// P30-P37.agc:262
//		STOVL	VTIG
// slot 28485
    28485, 24384,
// P30-P37.agc:263
//# Page 640
// P30-P37.agc:264
//			RATT
// slot 28486
    28486, 2,
// P30-P37.agc:265
//		STORE	RTIG
// slot 28487
    28487, 3892,
// P30-P37.agc:266
//		STORE	RACT3
// slot 28488
    28488, 3776,
// P30-P37.agc:267
//		VXV	UNIT
// slot 28489
    28489, 44602,
// P30-P37.agc:268
//			VTIG
// slot 28490
    28490, 3904,
// P30-P37.agc:269
//		STCALL	UNRM
// slot 28491
    28491, 31518,
// P30-P37.agc:270
//			LOMAT
// slot 28492
    28492, 60268,
// P30-P37.agc:271
//		VLOAD	VXM
// slot 28493
    28493, 50682,
// P30-P37.agc:272
//			DELVSLV
// slot 28494
    28494, 3594,
// P30-P37.agc:273
//			0
// slot 28495
    28495, 2,
// P30-P37.agc:274
//		VSL1	SXA,1
// slot 28496
    28496, 55540,
// P30-P37.agc:275
//			RTX1
// slot 28497
    28497, 4042,
// P30-P37.agc:276
//		STORE	DELVSIN
// slot 28498
    28498, 3916,
// P30-P37.agc:277
//		ABVAL
// slot 28499
    28499, 65356,
// P30-P37.agc:278
//		STOVL	VGDISP		# MAG DELV
// slot 28500
    28500, 24566,
// P30-P37.agc:279
//			RTIG
// slot 28501
    28501, 3892,
// P30-P37.agc:280
//		PDVL	VAD
// slot 28502
    28502, 44442,
// P30-P37.agc:281
//			DELVSIN
// slot 28503
    28503, 3916,
// P30-P37.agc:282
//			VTIG
// slot 28504
    28504, 3904,
// P30-P37.agc:283
//		CALL
// slot 28505
    28505, 65320,
// P30-P37.agc:284
//			PERIAPO1
// slot 28506
    28506, 38102,
// P30-P37.agc:285
//		CALL
// slot 28507
    28507, 65320,
// P30-P37.agc:286
//			SHIFTR1
// slot 28508
    28508, 38246,
// P30-P37.agc:287
//		CALL
// slot 28509
    28509, 65320,
// P30-P37.agc:288
//			MAXCHK
// slot 28510
    28510, 39896,
// P30-P37.agc:289
//		STODL	HPER		# PERIGEE ALT B+29
// slot 28511
    28511, 14828,
// P30-P37.agc:290
//			4D
// slot 28512
    28512, 10,
// P30-P37.agc:291
//		CALL
// slot 28513
    28513, 65320,
// P30-P37.agc:292
//			SHIFTR1
// slot 28514
    28514, 38246,
// P30-P37.agc:293
//		CALL
// slot 28515
    28515, 65320,
// P30-P37.agc:294
//			MAXCHK
// slot 28516
    28516, 39896,
// P30-P37.agc:295
//		STCALL	HAPO		# APOGEE ALT B+29
// slot 28517
    28517, 31208,
// P30-P37.agc:296
//			QTEMP
// slot 28518
    28518, 3934,
// P30-P37.agc:297
//
// P30-P37.agc:298
//# Page 641
// P30-P37.agc:299
//# S31.1 PROGRAM DESCRIPTION		28DEC67
// P30-P37.agc:300
//# MOD.1 BY ZELDIN KERMAN
// P30-P37.agc:301
//
// P30-P37.agc:302
//# S31.1 COMPUTES DELV IN REF AND LV COORDS,MAG OF DELV,INTERCEPT TIME,
// P30-P37.agc:303
//# APOGEE AND PERIGEE ALT FOR REQUIRED MANEUVER
// P30-P37.agc:304
//
// P30-P37.agc:305
//# CALLING SEQUENCE
// P30-P37.agc:306
//#	L	CALL
// P30-P37.agc:307
//#	L+1		S31.1
// P30-P37.agc:308
//
// P30-P37.agc:309
//# NORMAL EXIT MODE
// P30-P37.agc:310
//#	AT L +2 OF CALLING SEQUENCE(GOTO L+2)
// P30-P37.agc:311
//# SUBROUTINES CALLED
// P30-P37.agc:312
//#	AGAIN
// P30-P37.agc:313
//#	PERIAPO1
// P30-P37.agc:314
//#	SHIFTR1
// P30-P37.agc:315
//#	MIDGIM
// P30-P37.agc:316
//# NO ALARM OR ABORT MODES
// P30-P37.agc:317
//# INPUT
// P30-P37.agc:318
//#	DELLT4		DP	+28
// P30-P37.agc:319
//#	TIG		DP     +28
// P30-P37.agc:320
//#	RTARG		VCT	+29
// P30-P37.agc:321
//# OUTPUT
// P30-P37.agc:322
//#	DELVLVC		VCT	+7
// P30-P37.agc:323
//#	VGDISP		DP	+7
// P30-P37.agc:324
//#	HAPO		DP	+29
// P30-P37.agc:325
//#	HPER		DP	+29
// P30-P37.agc:326
//#	TPASS4		DP	+28
// P30-P37.agc:327
//# DEBRIS - QTEMP
// P30-P37.agc:328
//
// P30-P37.agc:329
//S31.1		STQ	DLOAD
// slot 28519
    28519, 58656
)).

agcAotInstallSourceRope(list(
// P30-P37.agc:330
//			QTEMP
// slot 28520
    28520, 3934,
// P30-P37.agc:331
//			TIG
// slot 28521
    28521, 3606,
// P30-P37.agc:332
//		STCALL	TDEC1
// slot 28522
    28522, 28738,
// P30-P37.agc:333
//			AGAIN		# RETURNS RTX2,RTX1,RATT,VATT,VIPRIME
// slot 28523
    28523, 51026,
// P30-P37.agc:334
//		VLOAD	PDVL		# DELUEET3
// slot 28524
    28524, 52730,
// P30-P37.agc:335
//			RTIG
// slot 28525
    28525, 3892,
// P30-P37.agc:336
//			VIPRIME
// slot 28526
    28526, 3860,
// P30-P37.agc:337
//		CALL
// slot 28527
    28527, 65320,
// P30-P37.agc:338
//			PERIAPO1
// slot 28528
    28528, 38102,
// P30-P37.agc:339
//		CALL
// slot 28529
    28529, 65320,
// P30-P37.agc:340
//			SHIFTR1
// slot 28530
    28530, 38246,
// P30-P37.agc:341
//		CALL
// slot 28531
    28531, 65320,
// P30-P37.agc:342
//			MAXCHK
// slot 28532
    28532, 39896,
// P30-P37.agc:343
//		STODL	HPER		# B29
// slot 28533
    28533, 14828,
// P30-P37.agc:344
//			4D
// slot 28534
    28534, 10,
// P30-P37.agc:345
//		CALL
// slot 28535
    28535, 65320,
// P30-P37.agc:346
//			SHIFTR1
// slot 28536
    28536, 38246,
// P30-P37.agc:347
//		CALL
// slot 28537
    28537, 65320,
// P30-P37.agc:348
//			MAXCHK
// slot 28538
    28538, 39896,
// P30-P37.agc:349
//		STOVL	HAPO		# B29
// slot 28539
    28539, 23016,
// P30-P37.agc:350
//# Page 642
// P30-P37.agc:351
//			DELVEET3
// slot 28540
    28540, 3916,
// P30-P37.agc:352
//		STORE	0
// slot 28541
    28541, 2,
// P30-P37.agc:353
//		SET	CALL
// slot 28542
    28542, 37912,
// P30-P37.agc:354
//			AVFLAG
// slot 28543
    28543, 1140,
// P30-P37.agc:355
//			MIDGIM		# GET DELVLVC B7 FORDISPLAY
// slot 28544
    28544, 9038,
// P30-P37.agc:356
//		ABVAL
// slot 28545
    28545, 65356,
// P30-P37.agc:357
//		STODL	VGDISP		# B+7 FOR DISPLAY
// slot 28546
    28546, 16374,
// P30-P37.agc:358
//			DELLT4
// slot 28547
    28547, 3622,
// P30-P37.agc:359
//		DAD
// slot 28548
    28548, 65306,
// P30-P37.agc:360
//			TIG
// slot 28549
    28549, 3606,
// P30-P37.agc:361
//		STCALL	TPASS4		# FOR S40.1
// slot 28550
    28550, 32604,
// P30-P37.agc:362
//			QTEMP
// slot 28551
    28551, 3934,
// P30-P37.agc:363
//
// P30-P37.agc:364
//# Page 643
// P30-P37.agc:365
//# SUBROUTINE NAME:	DELRSPL		(CONTINUATION OF V 82 IN CSM IF P11 ACTI
// P30-P37.agc:366
//# TRANSFERRED COMPLETELY FROM SUNDISK, P30S REV 33.  9 SEPT 67.
// P30-P37.agc:367
//# MOD NO: 0		MOD BY: ZELDIN KERMAN		DATE:
// P30-P37.agc:368
//# MOD NO: 1		MOD BY: BAIRNSFATHER KERMAN	DATE:  11 APR 67
// P30-P37.agc:369
//# MOD NO: 2		MOD BY: BAIRNSFATHER KERMAN	DATE:  12 MAY 67	ADD UR.RT CALC WHEN BELOW 300K FT
// P30-P37.agc:370
//# MOD NO: 2.1		MOD BY: BAIRNSFATHER KERMAN	DATE: 5 JULY 67		FIX ERROR ON MOD. 2.
// P30-P37.agc:371
//# MOD NO: 3		MOD BY: BAIRNSFATHER KERMAN	DATE:  12 JUL 67	CHANGE SIGN OF DISPLAYED ERROR.
// P30-P37.agc:372
//# MOD 4			MOD BY  ZELDIN KERMAN	DATE  3 APRIL 68	CHANGE EQUATIONS FOR L/D=.18 WHICH REPLA
// P30-P37.agc:373
//# FUNCTION:		CALCULATE (FOR DISPLAY ON CALL) AN APPROXIMATE MEASURE OF IN-PLANE SPLASH DOWN
// P30-P37.agc:374
//#			ERROR.  IF THE FREE-FALL TRANSFER ANGLE TO 300K FT ABOVE PAD RADIUS IS POSITIVE:
// P30-P37.agc:375
//#			SPLASH ERROR= -RANGE TO TARGET + FREE-FALL TRANSFER ANGLE + ESTIMATED ENTRY ANGLE.
// P30-P37.agc:376
//#			THE TARGET LOCATION AT ESTIMATED TIME OF IMPACT IS USED.  IF THE FREE-FALL TRANSFER
// P30-P37.agc:377
//#			ANGLE IS NEGATIVE:  SPASH ERROR= -RANGE TO TARGET
// P30-P37.agc:378
//#			THE PRESENT TARGET LOCATION IS USED.
// P30-P37.agc:379
//# CALLING SEQUENCE	CALLED AFTER SR30.1 IF IN CSM AND IF P11 OPERATING (UNDER CONTROL OF V82)
// P30-P37.agc:380
//# SUBROUTINES CALLED:  VGAMCALC, TFF/TRIG, LALOTORV.
// P30-P37.agc:381
//# EXIT:			RETURN DIRECTLY TO V 82 PROG. AT SPLRET
// P30-P37.agc:382
//# ERASABLE INITIALIZATION  LEFT BY SR30.1 AND V82GON1
// P30-P37.agc:383
//# OUTPUT:	RSP-RREC RANGE IN REVOLUTIONS.  			DSKY DISPLAY IN N. MI.
// P30-P37.agc:384
//# DEBRIS:	QPRET, PDL0 ...PDL7 ,PDL10
// P30-P37.agc:385
//
// P30-P37.agc:386
//# 		THETA(1)
// P30-P37.agc:387
//
// P30-P37.agc:388
//		BANK	32
// P30-P37.agc:389
//		SETLOC	DELRSPL1
// P30-P37.agc:390
//		BANK
// P30-P37.agc:391
//		COUNT*	$$/P30		# PROGRAMS: P30 EXTERNAL DELTA V
// P30-P37.agc:392
//
// P30-P37.agc:393
//DELRSPL		STORE	8D
// slot 28687
    28687, 18,
// P30-P37.agc:394
//		BPL	DSU
// slot 28688
    28688, 38216,
// P30-P37.agc:395
//			CANTDO		# GONE PAST 300K FT ALT
// slot 28689
    28689, 53358,
// P30-P37.agc:396
//			1BITDP
// slot 28690
    28690, 14764,
// P30-P37.agc:397
//		BOV	CALL
// slot 28691
    28691, 37888,
// P30-P37.agc:398
//			CANTDO		# POSMAX INDICATES NO 300K FT SOLUTION.
// slot 28692
    28692, 53358,
// P30-P37.agc:399
//			VGAMCALC	# +GAMMA(REV) IN PMAC,V300 MAG(B-7)=PDL 0
// slot 28693
    28693, 46162,
// P30-P37.agc:400
//		PUSH	CALL
// slot 28694
    28694, 37900,
// P30-P37.agc:401
//			TFF/TRIG
// slot 28695
    28695, 47922,
// P30-P37.agc:402
//		CALL
// slot 28696
    28696, 65320,
// P30-P37.agc:403
//			AUGEKUGL
// slot 28697
    28697, 53370,
// P30-P37.agc:404
//		PDDL	ACOS		# T ENTRY PDL 6
// slot 28698
    28698, 54954,
// P30-P37.agc:405
//			CDELF/2
// slot 28699
    28699, 30,
// P30-P37.agc:406
//		DAD
// slot 28700
    28700, 65306,
// P30-P37.agc:407
//			4
// slot 28701
    28701, 10,
// P30-P37.agc:408
//GETARG		STOVL	THETA(1)
// slot 28702
    28702, 22992,
// P30-P37.agc:409
//			LAT(SPL)
// slot 28703
    28703, 3586,
// P30-P37.agc:410
//		STODL	LAT
// slot 28704
    28704, 13448,
// P30-P37.agc:411
//			HI6ZEROS
// slot 28705
    28705, 13754,
// P30-P37.agc:412
//		STODL	ALT		# ALT=0 = LAT +4
// slot 28706
    28706, 13456,
// P30-P37.agc:413
//			PIPTIME
// slot 28707
    28707, 1290,
// P30-P37.agc:414
//# Page 644
// P30-P37.agc:415
//		BON	DLOAD
// slot 28708
    28708, 58648,
// P30-P37.agc:416
//			V37FLAG
// slot 28709
    28709, 3986,
// P30-P37.agc:417
//			+2
// slot 28710
    28710, 53328,
// P30-P37.agc:418
//			TSTART82
// slot 28711
    28711, 2474,
// P30-P37.agc:419
//		DSU	DAD
// slot 28712
    28712, 36138,
// P30-P37.agc:420
//			8D
// slot 28713
    28713, 18,
// P30-P37.agc:421
//		CLEAR	CALL
// slot 28714
    28714, 37912,
// P30-P37.agc:422
//			ERADFLAG
// slot 28715
    28715, 868,
// P30-P37.agc:423
//			LALOTORV	# R RECOV. IN ALPHAV AND MPAC
// slot 28716
    28716, 23106,
// P30-P37.agc:424
//
// P30-P37.agc:425
//		UNIT	PDVL
// slot 28717
    28717, 52572,
// P30-P37.agc:426
//			RONE
// slot 28718
    28718, 2478,
// P30-P37.agc:427
//		UNIT	DOT
// slot 28719
    28719, 41308,
// P30-P37.agc:428
//		SL1	ARCCOS
// slot 28720
    28720, 54996,
// P30-P37.agc:429
//		BDSU			# ERROR = THETA EST - THETA TARG
// slot 28721
    28721, 65314,
// P30-P37.agc:430
//					# NEGATIVE NUMBER SIGNIFIES THAT WILL FALL SHORT.
// P30-P37.agc:431
//					# POSITIVE NUMBER SIGNIFIES THAT WILL OVERSHOOT.
// P30-P37.agc:432
//			THETA(1)
// slot 28722
    28722, 2512,
// P30-P37.agc:433
//DELRDONE	STCALL	RSP-RREC	# DOWNRANGE RECOVERY RANGE ERROR	/360
// slot 28723
    28723, 31196,
// P30-P37.agc:434
//			INTWAKE0
// slot 28724
    28724, 24154,
// P30-P37.agc:435
//		CALL
// slot 28725
    28725, 65320,
// P30-P37.agc:436
//			SPLRET
// slot 28726
    28726, 39766,
// P30-P37.agc:437
//CANTDO		DLOAD	PDDL		# INITIALIZE ERASE TO DOT TARGET AND UR
// slot 28727
    28727, 54730,
// P30-P37.agc:438
//					# FOR RANGE ANGLE.
// P30-P37.agc:439
//			HIDPHALF	# TO PDL 0 FOR DEN IN DDV.
// slot 28728
    28728, 13750,
// P30-P37.agc:440
//			HI6ZEROS
// slot 28729
    28729, 13754,
// P30-P37.agc:441
//		PUSH			# ZERO TO PDL 2 FOR PHI ENTRY
// slot 28730
    28730, 65292,
// P30-P37.agc:442
//		STCALL	8D
// slot 28731
    28731, 28690,
// P30-P37.agc:443
//			GETARG		# GO SET RSP-RREC =0
// slot 28732
    28732, 53308,
// P30-P37.agc:444
//
// P30-P37.agc:445
//AUGEKUGL	VLOAD
// slot 28733
    28733, 65530,
// P30-P37.agc:446
//			X1CON -2
// slot 28734
    28734, 20828,
// P30-P37.agc:447
//		STODL	X1 -2
// slot 28735
    28735, 12362,
// P30-P37.agc:448
//			0
// slot 28736
    28736, 2,
// P30-P37.agc:449
//		DSU	BMN
// slot 28737
    28737, 41002,
// P30-P37.agc:450
//			V(21K)
// slot 28738
    28738, 20816,
// P30-P37.agc:451
//			LOOPSET
// slot 28739
    28739, 53424,
// P30-P37.agc:452
//		XSU,1	XCHX,2
// slot 28740
    28740, 54368,
// P30-P37.agc:453
//			S1
// slot 28741
    28741, 80,
// P30-P37.agc:454
//			X1
// slot 28742
    28742, 76,
// P30-P37.agc:455
//		XCHX,2	DSU
// slot 28743
    28743, 38312,
// P30-P37.agc:456
//			S1
// slot 28744
    28744, 80,
// P30-P37.agc:457
//			V(3K)
// slot 28745
    28745, 20796
)).

agcAotInstallSourceRope(list(
// P30-P37.agc:458
//		BMN	XCHX,2
// slot 28746
    28746, 54336,
// P30-P37.agc:459
//			LOOPSET
// slot 28747
    28747, 53424,
// P30-P37.agc:460
//			S1
// slot 28748
    28748, 80,
// P30-P37.agc:461
//		DSU	BMN
// slot 28749
    28749, 41002,
// P30-P37.agc:462
//			V(4K)
// slot 28750
    28750, 20812,
// P30-P37.agc:463
//			LOOPSET
// slot 28751
    28751, 53424,
// P30-P37.agc:464
//		XCHX,2	XCHX,2
// slot 28752
    28752, 54440,
// P30-P37.agc:465
//# Page 645
// P30-P37.agc:466
//			S1
// slot 28753
    28753, 80,
// P30-P37.agc:467
//			X1
// slot 28754
    28754, 76,
// P30-P37.agc:468
//		DSU	BMN
// slot 28755
    28755, 41002,
// P30-P37.agc:469
//			V(400)
// slot 28756
    28756, 20788,
// P30-P37.agc:470
//			LOOPSET
// slot 28757
    28757, 53424,
// P30-P37.agc:471
//		SXA,1
// slot 28758
    28758, 65456,
// P30-P37.agc:472
//			S1
// slot 28759
    28759, 80,
// P30-P37.agc:473
//LOOPSET		INCR,1	GOTO
// slot 28760
    28760, 43152,
// P30-P37.agc:474
//		DEC	1
// slot 28761
    28761, 2,
// P30-P37.agc:475
//			K1K2LOOP
// slot 28762
    28762, 53434,
// P30-P37.agc:476
//K2CALC		SXA,1
// slot 28763
    28763, 65456,
// P30-P37.agc:477
//			S1
// slot 28764
    28764, 80,
// P30-P37.agc:478
//K1K2LOOP	DLOAD	DSU*
// slot 28765
    28765, 37834,
// P30-P37.agc:479
//			0
// slot 28766
    28766, 2,
// P30-P37.agc:480
//			V(32K) +1,1
// slot 28767
    28767, 20810,
// P30-P37.agc:481
//		DMP*	DAD*
// slot 28768
    28768, 35590,
// P30-P37.agc:482
//			YK1K2 +1,1
// slot 28769
    28769, 20786,
// P30-P37.agc:483
//			CK1K2 +1,1
// slot 28770
    28770, 20762,
// P30-P37.agc:484
//		PDDL	TIX,1
// slot 28771
    28771, 49322,
// P30-P37.agc:485
//			2
// slot 28772
    28772, 6,
// P30-P37.agc:486
//			K2CALC
// slot 28773
    28773, 53430,
// P30-P37.agc:487
//		DSU	BDDV
// slot 28774
    28774, 46378,
// P30-P37.agc:488
//		PUSH	BOV
// slot 28775
    28775, 32780,
// P30-P37.agc:489
//			MAXPHI
// slot 28776
    28776, 53494,
// P30-P37.agc:490
//		BMN	DSU
// slot 28777
    28777, 38208,
// P30-P37.agc:491
//			MAXPHI
// slot 28778
    28778, 53494,
// P30-P37.agc:492
//			MAXPHIC
// slot 28779
    28779, 20736,
// P30-P37.agc:493
//		BPL
// slot 28780
    28780, 65352,
// P30-P37.agc:494
//			MAXPHI
// slot 28781
    28781, 53494,
// P30-P37.agc:495
//PHICALC		DLOAD	DSU		# PHI ENTRY PDL 4D
// slot 28782
    28782, 38346,
// P30-P37.agc:496
//			0
// slot 28783
    28783, 2,
// P30-P37.agc:497
//			V(26K)
// slot 28784
    28784, 20828,
// P30-P37.agc:498
//		BPL	DLOAD
// slot 28785
    28785, 58696,
// P30-P37.agc:499
//			TGR26
// slot 28786
    28786, 53488,
// P30-P37.agc:500
//			TLESS26
// slot 28787
    28787, 20820,
// P30-P37.agc:501
//		DDV
// slot 28788
    28788, 65394,
// P30-P37.agc:502
//			0
// slot 28789
    28789, 2,
// P30-P37.agc:503
//TENT		DMP	RVQ
// slot 28790
    28790, 36362,
// P30-P37.agc:504
//			4D
// slot 28791
    28791, 10,
// P30-P37.agc:505
//TGR26		DLOAD	GOTO
// slot 28792
    28792, 43210,
// P30-P37.agc:506
//			TGR26CON
// slot 28793
    28793, 20824,
// P30-P37.agc:507
//			TENT
// slot 28794
    28794, 53484,
// P30-P37.agc:508
//
// P30-P37.agc:509
//MAXPHI		DLOAD	PDDL
// slot 28795
    28795, 54730,
// P30-P37.agc:510
//			MAXPHIC
// slot 28796
    28796, 20736,
// P30-P37.agc:511
//		GOTO
// slot 28797
    28797, 65360,
// P30-P37.agc:512
//			PHICALC
// slot 28798
    28798, 53468,
// P30-P37.agc:513
//MAXPHIC		2DEC	.09259298	# 2000 NM FOR MAXIMUM PHI ENTRY
// slot 28799 28800
    28799, 3034, 28800, 1422,
// P30-P37.agc:514
//
// P30-P37.agc:515
//# Page 646
// P30-P37.agc:516
//
// P30-P37.agc:517
//		COUNT*	$$/P30
// P30-P37.agc:518
//
// P30-P37.agc:519
//					# 		BELOW
// P30-P37.agc:520
//					# <<<< TABLE IS INDEXED. KEEP IN ORDER >>>>
// P30-P37.agc:521
//
// P30-P37.agc:522
//		2DEC	7.07304526 E-4	# 5500
// slot 28801 28802
    28801, 22, 28802, 19284,
// P30-P37.agc:523
//
// P30-P37.agc:524
//		2DEC	3.08641975 E-4	# 2400
// slot 28803 28804
    28803, 10, 28804, 1860,
// P30-P37.agc:525
//
// P30-P37.agc:526
//		2DEC	3.08641975 E-4	# 2400
// slot 28805 28806
    28805, 10, 28806, 1860,
// P30-P37.agc:527
//
// P30-P37.agc:528
//		2DEC	-8.8888888 E-3	# -3.2
// slot 28807 28808
    28807, 65244, 28808, 44708,
// P30-P37.agc:529
//
// P30-P37.agc:530
//		2DEC	2.7777777 E-3	# 1
// slot 28809 28810
    28809, 90, 28810, 16748,
// P30-P37.agc:531
//
// P30-P37.agc:532
//CK1K2		2DEC	6.6666666 E-3	# 2.4
// slot 28811 28812
    28811, 218, 28812, 7428,
// P30-P37.agc:533
//
// P30-P37.agc:534
//		2DEC	0		# 0
// slot 28813 28814
    28813, 0, 28814, 0,
// P30-P37.agc:535
//
// P30-P37.agc:536
//		2DEC*	-1.86909989 E-5 B7* 	# -.443
// slot 28815 28816
    28815, 65456, 28816, 59050,
// P30-P37.agc:537
//
// P30-P37.agc:538
//		2DEC	0
// slot 28817 28818
    28817, 0, 28818, 0,
// P30-P37.agc:539
//
// P30-P37.agc:540
//		2DEC*	1.11639691 E-3 B7*	# .001225
// slot 28819 28820
    28819, 4682, 28820, 8324,
// P30-P37.agc:541
//
// P30-P37.agc:542
//		2DEC*	9.56911636 E-4 B7*	# .00105
// slot 28821 28822
    28821, 4012, 28822, 25858,
// P30-P37.agc:543
//
// P30-P37.agc:544
//YK1K2		2DEC*	2.59733157 E-4 B7*	# 	.000285
// slot 28823 28824
    28823, 1088, 28824, 22934,
// P30-P37.agc:545
//
// P30-P37.agc:546
//V(400)		2DEC	1.2192 B-7
// slot 28825 28826
    28825, 312, 28826, 1888,
// P30-P37.agc:547
//
// P30-P37.agc:548
//V(28K)		2DEC	85.344 B-7
// slot 28827 28828
    28827, 21848, 28828, 1048,
// P30-P37.agc:549
//
// P30-P37.agc:550
//V(3K)		2DEC	9.144 B-7
// slot 28829 28830
    28829, 2340, 28830, 14156,
// P30-P37.agc:551
//
// P30-P37.agc:552
//V(24K)		2DEC	73.152 B-7
// slot 28831 28832
    28831, 18726, 28832, 14942,
// P30-P37.agc:553
//
// P30-P37.agc:554
//		2DEC	85.344 B-7
// slot 28833 28834
    28833, 21848, 28834, 1048,
// P30-P37.agc:555
//
// P30-P37.agc:556
//V(32K)		2DEC	97.536 B-7
// slot 28835 28836
    28835, 24968, 28836, 19922,
// P30-P37.agc:557
//
// P30-P37.agc:558
//V(4K)		2DEC	12.192 B-7
// slot 28837 28838
    28837, 3120, 28838, 18874,
// P30-P37.agc:559
//
// P30-P37.agc:560
//V(21K)		2DEC	64.000 B-7
// slot 28839 28840
    28839, 16384, 28840, 0,
// P30-P37.agc:561
//
// P30-P37.agc:562
//TLESS26		2DEC*	5.70146688 E7 B-35*	# 8660PHI/V
// slot 28841 28842
    28841, 54, 28842, 6118,
// P30-P37.agc:563
//
// P30-P37.agc:564
//TGR26CON	2DEC	7.2 E5 B-28	# PHI/3
// slot 28843 28844
    28843, 86, 28844, 30976,
// P30-P37.agc:565
//
// P30-P37.agc:566
//V(26K)		2DEC	79.248 B-7	# 26000
// slot 28845 28846
    28845, 20286, 28846, 24380,
// P30-P37.agc:567
//
// P30-P37.agc:568
//# Page 647
// P30-P37.agc:569
//
// P30-P37.agc:570
//X1CON		DEC	10
// slot 28847
    28847, 20,
// P30-P37.agc:571
//
// P30-P37.agc:572
//		DEC	8
// slot 28848
    28848, 16,
// P30-P37.agc:573
//
// P30-P37.agc:574
//		DEC	6
// slot 28849
    28849, 12
)).

// bank 02, slots 4503-4505
function agcAotUnit169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4503 {
// P30-P37.agc:575
//					# <<<< TABLE IS INDEXED.  KEEP IN ORDER >>>>
// P30-P37.agc:576
//					#		ABOVE
// P30-P37.agc:577
//# Page 648
// P30-P37.agc:578
//# ***** AVFLAGA/P *****
// P30-P37.agc:579
//
// P30-P37.agc:580
//# SUBROUTINES USED
// P30-P37.agc:581
//
// P30-P37.agc:582
//#	UPFLAG
// P30-P37.agc:583
//#	DOWNFLAG
// P30-P37.agc:584
//		SETLOC	P30SUBS
// P30-P37.agc:585
//		BANK
// P30-P37.agc:586
//		EBANK=	SUBEXIT
// P30-P37.agc:587
//AVFLAGA		EXTEND			# AVFLAG = CSM
// slot 4503
        if slot <> 4503 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4504 {
// P30-P37.agc:588
//		QXCH	SUBEXIT
// slot 4504
            if slot <> 4504 or instruction <> 10232 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1016, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:589
//		TC	DOWNFLAG
// slot 4505
            if slot <> 4505 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[169] to agcAotUnit169@.

agcAotInstallSourceRope(list(
// P30-P37.agc:590
//		ADRES	AVFLAG		# BIT 5 FLAG 2
// slot 4506
    4506, 80
)).

// bank 02, slots 4507-4516
function agcAotUnit170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4511 {
        if slot <= 4508 {
            if slot <= 4507 {
// P30-P37.agc:591
//		CAF	EBANK7
// slot 4507
                if slot <> 4507 or instruction <> 14896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:592
//		TS	EBANK
// slot 4508
                if slot <> 4508 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4509 {
// P30-P37.agc:593
//		EBANK=	ECSTEER
// P30-P37.agc:594
//		CAF	BIT13
// slot 4509
                if slot <> 4509 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4510 {
// P30-P37.agc:595
//		TS	ECSTEER		# SET ECSTEER = 1
// slot 4510
                    if slot <> 4510 or instruction <> 23316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23316, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P30-P37.agc:596
//		CAF	EBANK4
// slot 4511
                    if slot <> 4511 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4513 {
            if slot <= 4512 {
// P30-P37.agc:597
//		TS	EBANK
// slot 4512
                if slot <> 4512 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30-P37.agc:598
//		EBANK=	SUBEXIT
// P30-P37.agc:599
//		TC	SUBEXIT
// slot 4513
                if slot <> 4513 or instruction <> 1016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4514 {
// P30-P37.agc:600
//AVFLAGP		EXTEND			# AVFLAG = LEM
// slot 4514
                if slot <> 4514 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4515 {
// P30-P37.agc:601
//		QXCH	SUBEXIT
// slot 4515
                    if slot <> 4515 or instruction <> 10232 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 1016, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P30-P37.agc:602
//		TC	UPFLAG
// slot 4516
                    if slot <> 4516 or instruction <> 2918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[170] to agcAotUnit170@.

agcAotInstallSourceRope(list(
// P30-P37.agc:603
//		ADRES	AVFLAG		# BIT 5 FLAG 2
// slot 4517
    4517, 80
)).

// bank 02, slots 4518-4521
function agcAotUnit171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4519 {
        if slot <= 4518 {
// P30-P37.agc:604
//		TC	SUBEXIT
// slot 4518
            if slot <> 4518 or instruction <> 1016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:605
//P20FLGON	EXTEND
// slot 4519
            if slot <> 4519 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4520 {
// P30-P37.agc:606
//		QXCH	SUBEXIT
// slot 4520
            if slot <> 4520 or instruction <> 10232 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1016, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30-P37.agc:607
//		TC	UPFLAG
// slot 4521
            if slot <> 4521 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[171] to agcAotUnit171@.

agcAotInstallSourceRope(list(
// P30-P37.agc:608
//		ADRES	TRACKFLG
// slot 4522
    4522, 50
)).

// bank 02, slots 4523-4523
function agcAotUnit172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:609
//		TC	UPFLAG
// slot 4523
    if slot <> 4523 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[172] to agcAotUnit172@.

agcAotInstallSourceRope(list(
// P30-P37.agc:610
//		ADRES	UPDATFLG
// slot 4524
    4524, 46
)).

// bank 02, slots 4525-4525
function agcAotUnit173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30-P37.agc:611
//		TC	SUBEXIT		# DP	B4
// slot 4525
    if slot <> 4525 or instruction <> 1016 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1016, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[173] to agcAotUnit173@.

