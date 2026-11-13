// PORT: Original source unit P30-P37.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P30-P37.agc:2
//# Filename:	P30-P37.agc
// PORT: SOURCE P30-P37.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P30-P37.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P30-P37.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P30-P37.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P30-P37.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P30-P37.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P30-P37.agc:9
//# Pages:	635-648
// PORT: SOURCE P30-P37.agc:10
//# Mod history:	2009-05-10 RSB	Adapted from the Colossus249/ file
// PORT: SOURCE P30-P37.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE P30-P37.agc:12
//#				images.
// PORT: SOURCE P30-P37.agc:13
//#		2009-05-20 RSB	Corrected BDV -> BOV.
// PORT: SOURCE P30-P37.agc:14
//#
// PORT: SOURCE P30-P37.agc:15
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P30-P37.agc:16
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P30-P37.agc:17
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P30-P37.agc:18
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P30-P37.agc:19
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P30-P37.agc:20
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P30-P37.agc:21
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P30-P37.agc:22
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P30-P37.agc:23
//#
// PORT: SOURCE P30-P37.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P30-P37.agc:25
//#
// PORT: SOURCE P30-P37.agc:26
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P30-P37.agc:27
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P30-P37.agc:28
//#
// PORT: SOURCE P30-P37.agc:29
//#	This AGC program shall also be referred to as
// PORT: SOURCE P30-P37.agc:30
//#			Colossus 2A
// PORT: SOURCE P30-P37.agc:31
//
// PORT: SOURCE P30-P37.agc:32
//# Page 635
// PORT: SOURCE P30-P37.agc:33
//		BANK	32
// PORT: SOURCE P30-P37.agc:34
//
// PORT: SOURCE P30-P37.agc:35
//		SETLOC	P30S1
// PORT: SOURCE P30-P37.agc:36
//		BANK
// PORT: SOURCE P30-P37.agc:37
//
// PORT: SOURCE P30-P37.agc:38
//		EBANK=	+MGA
// PORT: SOURCE P30-P37.agc:39
//
// PORT: SOURCE P30-P37.agc:40
//		COUNT	35/P34
// PORT: SOURCE P30-P37.agc:41
//
// PORT: SOURCE P30-P37.agc:42
//DISPMGA		STQ	EXIT		# USED IN P30
// PORT: Fixed ROM slots 32436.
    32436, 65056,
// PORT: SOURCE P30-P37.agc:43
//
// PORT: SOURCE P30-P37.agc:44
//			RGEXIT
// PORT: Fixed ROM slots 32437.
    32437, 2544
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32438–32440.
function agcAotUnit1834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32438 {
// PORT: SOURCE P30-P37.agc:45
//		TC	COMPTGO
// PORT: Fixed ROM slots 32438.
        if slot <> 32438 or instruction <> 1732 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1732, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32439 {
// PORT: SOURCE P30-P37.agc:46
//
// PORT: SOURCE P30-P37.agc:47
//DISP45		CAF	V16N45
// PORT: Fixed ROM slots 32439.
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
// PORT: SOURCE P30-P37.agc:48
//		TC	BANKCALL
// PORT: Fixed ROM slots 32440.
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
// PORT: SOURCE P30-P37.agc:49
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 32441.
    32441, 17502
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32442–32445.
function agcAotUnit1835 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32443 {
        if slot <= 32442 {
// PORT: SOURCE P30-P37.agc:50
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 32442.
            if slot <> 32442 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:51
//		TC	END45
// PORT: Fixed ROM slots 32443.
            if slot <> 32443 or instruction <> 1728 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1728, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32444 {
// PORT: SOURCE P30-P37.agc:52
//		TC	DISP45
// PORT: Fixed ROM slots 32444.
            if slot <> 32444 or instruction <> 1719 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1719, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:53
//P30PHSI		TC	PHASCHNG
// PORT: Fixed ROM slots 32445.
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
// PORT: SOURCE P30-P37.agc:54
//		OCT	14
// PORT: Fixed ROM slots 32446.
    32446, 24
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32447–32448.
function agcAotUnit1836 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32447 {
// PORT: SOURCE P30-P37.agc:55
//		TCR	ENDOFJOB
// PORT: Fixed ROM slots 32447.
        if slot <> 32447 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P30-P37.agc:56
//END45		TC	INTPRET
// PORT: Fixed ROM slots 32448.
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
// PORT: SOURCE P30-P37.agc:57
//		CLEAR	GOTO
// PORT: Fixed ROM slots 32449.
    32449, 43032,
// PORT: SOURCE P30-P37.agc:58
//			TIMRFLAG
// PORT: Fixed ROM slots 32450.
    32450, 3944,
// PORT: SOURCE P30-P37.agc:59
//			RGEXIT
// PORT: Fixed ROM slots 32451.
    32451, 2544
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32452–32454.
function agcAotUnit1837 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32452 {
// PORT: SOURCE P30-P37.agc:60
//
// PORT: SOURCE P30-P37.agc:61
//COMPTGO		EXTEND			# USED TO COMPUTE TTOGO
// PORT: Fixed ROM slots 32452.
        if slot <> 32452 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32453 {
// PORT: SOURCE P30-P37.agc:62
//		QXCH	PHSPRDT6	# ** GROUP 6 TEMPORARY USED .. BEWARE **
// PORT: Fixed ROM slots 32453.
            if slot <> 32453 or instruction <> 9782 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 566, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:63
//
// PORT: SOURCE P30-P37.agc:64
//		TC	UPFLAG		# SET TIMRFLAG
// PORT: Fixed ROM slots 32454.
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
// PORT: SOURCE P30-P37.agc:65
//		ADRES	TIMRFLAG	# BIT 11 FLAG 7
// PORT: Fixed ROM slots 32455.
    32455, 218
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32456–32459.
function agcAotUnit1838 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32457 {
        if slot <= 32456 {
// PORT: SOURCE P30-P37.agc:66
//		CAF	ZERO
// PORT: Fixed ROM slots 32456.
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
// PORT: SOURCE P30-P37.agc:67
//		TS	NVWORD1
// PORT: Fixed ROM slots 32457.
            if slot <> 32457 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32458 {
// PORT: SOURCE P30-P37.agc:68
//
// PORT: SOURCE P30-P37.agc:69
//		CAF	ONE
// PORT: Fixed ROM slots 32458.
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
// PORT: SOURCE P30-P37.agc:70
//		TC	WAITLIST
// PORT: Fixed ROM slots 32459.
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
// PORT: SOURCE P30-P37.agc:71
//		EBANK=	TIG
// PORT: SOURCE P30-P37.agc:72
//		2CADR	CLOKTASK
// PORT: Fixed ROM slots 32460 32461.
    32460, 3424, 32461, 41070
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32462–32462.
function agcAotUnit1839 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:73
//
// PORT: SOURCE P30-P37.agc:74
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 32462.
    if slot <> 32462 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1839] to agcAotUnit1839@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:75
//		OCT	40036		# 6.3SPOT FOR CLOKTASK
// PORT: Fixed ROM slots 32463.
    32463, 32828,
// PORT: SOURCE P30-P37.agc:76
//		OCT	05024		# GROUP 4 CONTINUES HERE
// PORT: Fixed ROM slots 32464.
    32464, 5160,
// PORT: SOURCE P30-P37.agc:77
//		OCT	13000
// PORT: Fixed ROM slots 32465.
    32465, 11264
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32466–32469.
function agcAotUnit1840 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32467 {
        if slot <= 32466 {
// PORT: SOURCE P30-P37.agc:78
//
// PORT: SOURCE P30-P37.agc:79
//		TC	PHSPRDT6
// PORT: Fixed ROM slots 32466.
            if slot <> 32466 or instruction <> 566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 566, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:80
//# Page 636
// PORT: SOURCE P30-P37.agc:81
//# PROGRAM DESCRIPTION P30	DATE 3-6-67
// PORT: SOURCE P30-P37.agc:82
//
// PORT: SOURCE P30-P37.agc:83
//# MOD.I BY S. ZELDIN-  TO ADD P31 AND AD APT P30 FOR P31 USE.	22DEC67
// PORT: SOURCE P30-P37.agc:84
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P30-P37.agc:85
//# +30(EXTERNAL DELTA-V TARGETTING PROGRAM)
// PORT: SOURCE P30-P37.agc:86
//#	ACCEPTS ASTRONAUT INPUTS OF TIG,DELV(LV) AND COMPUTES,FOR DISPLAY,
// PORT: SOURCE P30-P37.agc:87
//#	APOGEE,PERIGEE,DELV(MAG),MGA ASSOCIATED WITH DESIRED MANEUVER
// PORT: SOURCE P30-P37.agc:88
//
// PORT: SOURCE P30-P37.agc:89
//# P31(GENERAL LAMBERT AIMPOINT GUIDANCE)
// PORT: SOURCE P30-P37.agc:90
//# A GROUND RULE FOR P31 IS THE ANGLE BETWEEN THE TARGET VECTOR AND
// PORT: SOURCE P30-P37.agc:91
//# POSITION VECTOR AT TIG IS NOT 165-195 DEGREES APART
// PORT: SOURCE P30-P37.agc:92
//#	BASED ON STORED INPUT OF OFFSET TARGET(B+29) AND DELTA T TRANS,AND
// PORT: SOURCE P30-P37.agc:93
//#	ASTRONAUT ENTRY OF TIG,P31 COMPUTES REQUIRED VELOCITY FOR MANEUVER
// PORT: SOURCE P30-P37.agc:94
//#	AND,FOR DISPLAY,APOGEE,PERIGEE,DELV(7AG),+MGA ASSOCIATED WITH
// PORT: SOURCE P30-P37.agc:95
//#	DESIRED MANEUVER
// PORT: SOURCE P30-P37.agc:96
//
// PORT: SOURCE P30-P37.agc:97
//# THE FOLLOWING SUBROUTINES ARE USED IN P30 AND P31
// PORT: SOURCE P30-P37.agc:98
//#	S30.1 (P30 ONLY)
// PORT: SOURCE P30-P37.agc:99
//#	S31.1 (P31 ONLY)
// PORT: SOURCE P30-P37.agc:100
//#	P30/P31 - DISPLAYS TIG
// PORT: SOURCE P30-P37.agc:101
//#	CNTUP30 - DISPLAYS DELV(LV)
// PORT: SOURCE P30-P37.agc:102
//#	PARAM30 - DISPLAYS APOGEE,PERIGEE,DELV(MAG),MGA,TIME FROM TIG,
// PORT: SOURCE P30-P37.agc:103
//#		  MARKS SINCE LAST THRUSTING MANEUVER
// PORT: SOURCE P30-P37.agc:104
//
// PORT: SOURCE P30-P37.agc:105
//# CALLING SEQUENCE VIA JOB FROM V37
// PORT: SOURCE P30-P37.agc:106
//
// PORT: SOURCE P30-P37.agc:107
//# EXIT VIA V37 OR GOTOPOOH
// PORT: SOURCE P30-P37.agc:108
//
// PORT: SOURCE P30-P37.agc:109
//# OUTPUT FOR POWERED FLIGHT
// PORT: SOURCE P30-P37.agc:110
//#	VTIG	X
// PORT: SOURCE P30-P37.agc:111
//#	RTIG	 XSEE S30.1
// PORT: SOURCE P30-P37.agc:112
//#	DELVSIN	 X
// PORT: SOURCE P30-P37.agc:113
//#	VGDISP
// PORT: SOURCE P30-P37.agc:114
//#	RTARG	X
// PORT: SOURCE P30-P37.agc:115
//#	TPASS4	 X SEE S31.1
// PORT: SOURCE P30-P37.agc:116
//#		X
// PORT: SOURCE P30-P37.agc:117
//
// PORT: SOURCE P30-P37.agc:118
//
// PORT: SOURCE P30-P37.agc:119
//		COUNT	35/P30
// PORT: SOURCE P30-P37.agc:120
//
// PORT: SOURCE P30-P37.agc:121
//P30		TC	P30/P31
// PORT: Fixed ROM slots 32467.
            if slot <> 32467 or instruction <> 1773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32468 {
// PORT: SOURCE P30-P37.agc:122
//		TC	CNTNUP30
// PORT: Fixed ROM slots 32468.
            if slot <> 32468 or instruction <> 1788 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1788, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:123
//		TC	DOWNFLAG	# RESET UPDATFLG
// PORT: Fixed ROM slots 32469.
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
// PORT: SOURCE P30-P37.agc:124
//		ADRES	UPDATFLG	# BIT 7  FLAG 1
// PORT: Fixed ROM slots 32470.
    32470, 46
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32471–32471.
function agcAotUnit1841 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:125
//		TC	INTPRET
// PORT: Fixed ROM slots 32471.
    if slot <> 32471 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1841] to agcAotUnit1841@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:126
//		CALL
// PORT: Fixed ROM slots 32472.
    32472, 65320,
// PORT: SOURCE P30-P37.agc:127
//			S30.1
// PORT: Fixed ROM slots 32473.
    32473, 52858,
// PORT: SOURCE P30-P37.agc:128
//		EXIT
// PORT: Fixed ROM slots 32474.
    32474, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32475–32476.
function agcAotUnit1842 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32475 {
// PORT: SOURCE P30-P37.agc:129
//		TC	PARAM30
// PORT: Fixed ROM slots 32475.
        if slot <> 32475 or instruction <> 1796 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1796, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P30-P37.agc:130
//		TC	UPFLAG
// PORT: Fixed ROM slots 32476.
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
// PORT: SOURCE P30-P37.agc:131
//# Page 637
// PORT: SOURCE P30-P37.agc:132
//		ADRES	XDELVFLG	# SET XDELVFLG BIT 8 FLAG 2
// PORT: Fixed ROM slots 32477.
    32477, 74
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32478–32480.
function agcAotUnit1843 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32478 {
// PORT: SOURCE P30-P37.agc:133
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32478.
        if slot <> 32478 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32479 {
// PORT: SOURCE P30-P37.agc:134
//
// PORT: SOURCE P30-P37.agc:135
//P31		TC	P30/P31
// PORT: Fixed ROM slots 32479.
            if slot <> 32479 or instruction <> 1773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:136
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 32480.
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
// PORT: SOURCE P30-P37.agc:137
//		ADRES	UPDATFLG	# RESET UPDATFLG BIT 7 FLAG 1
// PORT: Fixed ROM slots 32481.
    32481, 46
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32482–32482.
function agcAotUnit1844 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:138
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 32482.
    if slot <> 32482 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1844] to agcAotUnit1844@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:139
//		ADRES	NORMSW		# RESET NORMSW 		BIT 10 FLAG 7
// PORT: Fixed ROM slots 32483.
    32483, 220
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32484–32484.
function agcAotUnit1845 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:140
//		TC	INTPRET
// PORT: Fixed ROM slots 32484.
    if slot <> 32484 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1845] to agcAotUnit1845@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:141
//		CALL
// PORT: Fixed ROM slots 32485.
    32485, 65320,
// PORT: SOURCE P30-P37.agc:142
//			S31.1
// PORT: Fixed ROM slots 32486.
    32486, 52942,
// PORT: SOURCE P30-P37.agc:143
//		EXIT
// PORT: Fixed ROM slots 32487.
    32487, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32488–32490.
function agcAotUnit1846 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32488 {
// PORT: SOURCE P30-P37.agc:144
//		TC	CNTNUP30
// PORT: Fixed ROM slots 32488.
        if slot <> 32488 or instruction <> 1788 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1788, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32489 {
// PORT: SOURCE P30-P37.agc:145
//		TC	PARAM30
// PORT: Fixed ROM slots 32489.
            if slot <> 32489 or instruction <> 1796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:146
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 32490.
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
// PORT: SOURCE P30-P37.agc:147
//		ADRES	XDELVFLG	# BIT 8 FLAG 2
// PORT: Fixed ROM slots 32491.
    32491, 74
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32492–32495.
function agcAotUnit1847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32493 {
        if slot <= 32492 {
// PORT: SOURCE P30-P37.agc:148
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32492.
            if slot <> 32492 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:149
//
// PORT: SOURCE P30-P37.agc:150
//P30/P31		XCH	Q
// PORT: Fixed ROM slots 32493.
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
// PORT: SOURCE P30-P37.agc:151
//		TS	P30/31RT
// PORT: Fixed ROM slots 32494.
            if slot <> 32494 or instruction <> 23476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:152
//		TC	UPFLAG
// PORT: Fixed ROM slots 32495.
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
// PORT: SOURCE P30-P37.agc:153
//		ADRES	UPDATFLG	# SET UPDATFLG BIT 7 FLAG 1
// PORT: Fixed ROM slots 32496.
    32496, 46
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32497–32497.
function agcAotUnit1848 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:154
//		TC	UPFLAG
// PORT: Fixed ROM slots 32497.
    if slot <> 32497 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1848] to agcAotUnit1848@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:155
//		ADRES	TRACKFLG	# SET TRACKFLG BIT 5 FLAG 1
// PORT: Fixed ROM slots 32498.
    32498, 50
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32499–32500.
function agcAotUnit1849 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32499 {
// PORT: SOURCE P30-P37.agc:156
//		CAF	V06N33		# T OF IGN
// PORT: Fixed ROM slots 32499.
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
// PORT: SOURCE P30-P37.agc:157
//		TC	BANKCALL
// PORT: Fixed ROM slots 32500.
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
// PORT: SOURCE P30-P37.agc:158
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 32501.
    32501, 17502
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32502–32505.
function agcAotUnit1850 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32503 {
        if slot <= 32502 {
// PORT: SOURCE P30-P37.agc:159
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32502.
            if slot <> 32502 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:160
//		TC	P30/31RT
// PORT: Fixed ROM slots 32503.
            if slot <> 32503 or instruction <> 948 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 948, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32504 {
// PORT: SOURCE P30-P37.agc:161
//		TCF	P30/P31 +4
// PORT: Fixed ROM slots 32504.
            if slot <> 32504 or instruction <> 5873 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5873, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:162
//		TC	PHASCHNG
// PORT: Fixed ROM slots 32505.
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
// PORT: SOURCE P30-P37.agc:163
//		OCT	00014
// PORT: Fixed ROM slots 32506.
    32506, 24
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32507–32511.
function agcAotUnit1851 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32508 {
        if slot <= 32507 {
// PORT: SOURCE P30-P37.agc:164
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 32507.
            if slot <> 32507 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:165
//
// PORT: SOURCE P30-P37.agc:166
//CNTNUP30	XCH	Q
// PORT: Fixed ROM slots 32508.
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
// PORT: SOURCE P30-P37.agc:167
//		TS	P30/RET
// PORT: Fixed ROM slots 32509.
            if slot <> 32509 or instruction <> 23127 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23127, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32510 {
// PORT: SOURCE P30-P37.agc:168
//		CAF	V06N81
// PORT: Fixed ROM slots 32510.
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
// PORT: SOURCE P30-P37.agc:169
//		TC	BANKCALL
// PORT: Fixed ROM slots 32511.
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
// PORT: SOURCE P30-P37.agc:170
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32512.
    32512, 17312
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32513–32519.
function agcAotUnit1852 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32515 {
        if slot <= 32513 {
// PORT: SOURCE P30-P37.agc:171
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32513.
            if slot <> 32513 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32514 {
// PORT: SOURCE P30-P37.agc:172
//		TC	P30/RET
// PORT: Fixed ROM slots 32514.
                if slot <> 32514 or instruction <> 599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:173
//		TCF	CNTNUP30 +2
// PORT: Fixed ROM slots 32515.
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
// PORT: SOURCE P30-P37.agc:174
//PARAM30		XCH	Q
// PORT: Fixed ROM slots 32516.
                if slot <> 32516 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:175
//		TS	P30/31RT
// PORT: Fixed ROM slots 32517.
                if slot <> 32517 or instruction <> 23476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32518 {
// PORT: SOURCE P30-P37.agc:176
//		CAF	V06N42
// PORT: Fixed ROM slots 32518.
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
// PORT: SOURCE P30-P37.agc:177
//		TC	BANKCALL
// PORT: Fixed ROM slots 32519.
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
// PORT: SOURCE P30-P37.agc:178
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32520.
    32520, 17312
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32521–32528.
function agcAotUnit1853 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32524 {
        if slot <= 32522 {
            if slot <= 32521 {
// PORT: SOURCE P30-P37.agc:179
//		TC	GOTOPOOH	# ON TERMINATION GOTOPOOH
// PORT: Fixed ROM slots 32521.
                if slot <> 32521 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:180
//		TCF	REFTEST		# ON PROCEED GO DO REFTEST
// PORT: Fixed ROM slots 32522.
                if slot <> 32522 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32523 {
// PORT: SOURCE P30-P37.agc:181
//# Page 638
// PORT: SOURCE P30-P37.agc:182
//		TCF	PARAM30 +2
// PORT: Fixed ROM slots 32523.
                if slot <> 32523 or instruction <> 5894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:183
//REFTEST		CAF	BIT13
// PORT: Fixed ROM slots 32524.
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
// PORT: SOURCE P30-P37.agc:184
//		MASK	STATE +3	# REFSMFLAG
// PORT: Fixed ROM slots 32525.
                if slot <> 32525 or instruction <> 28735 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:185
//		EXTEND
// PORT: Fixed ROM slots 32526.
                if slot <> 32526 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32527 {
// PORT: SOURCE P30-P37.agc:186
//		BZF	NOTSET		# REFSMFLAG =0 , THEN BRANCH TO NOTSET
// PORT: Fixed ROM slots 32527.
                if slot <> 32527 or instruction <> 5911 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5911, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:187
//		TC	INTPRET
// PORT: Fixed ROM slots 32528.
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
// PORT: SOURCE P30-P37.agc:188
//		VLOAD	PUSH
// PORT: Fixed ROM slots 32529.
    32529, 34554,
// PORT: SOURCE P30-P37.agc:189
//			DELVSIN
// PORT: Fixed ROM slots 32530.
    32530, 3916,
// PORT: SOURCE P30-P37.agc:190
//		CALL
// PORT: Fixed ROM slots 32531.
    32531, 65320,
// PORT: SOURCE P30-P37.agc:191
//			GET+MGA
// PORT: Fixed ROM slots 32532.
    32532, 9048,
// PORT: SOURCE P30-P37.agc:192
//		GOTO
// PORT: Fixed ROM slots 32533.
    32533, 65360,
// PORT: SOURCE P30-P37.agc:193
//			FLASHMGA
// PORT: Fixed ROM slots 32534.
    32534, 60982
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32535–32538.
function agcAotUnit1854 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32536 {
        if slot <= 32535 {
// PORT: SOURCE P30-P37.agc:194
//NOTSET		EXTEND
// PORT: Fixed ROM slots 32535.
            if slot <> 32535 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:195
//		DCS	MARSDP
// PORT: Fixed ROM slots 32536.
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
// PORT: SOURCE P30-P37.agc:196
//		DXCH	+MGA		# +MGA, +MGA+1 CONTAINS (-00001)
// PORT: Fixed ROM slots 32537.
            if slot <> 32537 or instruction <> 22422 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 918, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:197
//		TC	INTPRET
// PORT: Fixed ROM slots 32538.
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
// PORT: SOURCE P30-P37.agc:198
//FLASHMGA	CALL
// PORT: Fixed ROM slots 32539.
    32539, 65320,
// PORT: SOURCE P30-P37.agc:199
//			DISPMGA
// PORT: Fixed ROM slots 32540.
    32540, 60776,
// PORT: SOURCE P30-P37.agc:200
//		EXIT
// PORT: Fixed ROM slots 32541.
    32541, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32542–32542.
function agcAotUnit1855 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:201
//		TC	P30/31RT
// PORT: Fixed ROM slots 32542.
    if slot <> 32542 or instruction <> 948 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 948, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1855] to agcAotUnit1855@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:202
//MARSDP		OCT	00000		# (00000) (16440) = (+00001)
// PORT: Fixed ROM slots 32543.
    32543, 0,
// PORT: SOURCE P30-P37.agc:203
//		OCT	35100
// PORT: Fixed ROM slots 32544.
    32544, 29824,
// PORT: SOURCE P30-P37.agc:204
//					# ( .01 ) DEGREES IN THE LOW ORDER REGISTE
// PORT: SOURCE P30-P37.agc:205
//
// PORT: SOURCE P30-P37.agc:206
//V06N33		VN	0633
// PORT: Fixed ROM slots 32545.
    32545, 1602,
// PORT: SOURCE P30-P37.agc:207
//V06N42		VN	0642
// PORT: Fixed ROM slots 32546.
    32546, 1620,
// PORT: SOURCE P30-P37.agc:208
//V16N35		VN	1635
// PORT: Fixed ROM slots 32547.
    32547, 4166,
// PORT: SOURCE P30-P37.agc:209
//V06N45		VN	0645
// PORT: Fixed ROM slots 32548.
    32548, 1626,
// PORT: SOURCE P30-P37.agc:210
//
// PORT: SOURCE P30-P37.agc:211
//# Page 639
// PORT: SOURCE P30-P37.agc:212
//# PROGRAM DESCRIPTION S30.1	DATE 9NOV66
// PORT: SOURCE P30-P37.agc:213
//
// PORT: SOURCE P30-P37.agc:214
//# MOD NO 1			LOG SECTION P30,P37
// PORT: SOURCE P30-P37.agc:215
//# MOD BY RAMA AIYAWAR **
// PORT: SOURCE P30-P37.agc:216
//# MOD.2 BY S.ZELDIN - TO CORRECT MOD.1 FOR COLOSSUS		29DEC67
// PORT: SOURCE P30-P37.agc:217
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P30-P37.agc:218
//#	BASED ON STORED TARGET PARAMETERS(R OF IGNITION(RTIG),V OF
// PORT: SOURCE P30-P37.agc:219
//# IGNITION(VTIG),TIME OF IGNITION(TIG),DELV(LV),COMPUTE PERIGEE ALTITUDE
// PORT: SOURCE P30-P37.agc:220
//# A+OGEE ALTITUDE AND DELTA-V REQUIRED IN REF. COORDS.(DELVSIN)
// PORT: SOURCE P30-P37.agc:221
//# CALLING SEQUENCE
// PORT: SOURCE P30-P37.agc:222
//#	L	CALL
// PORT: SOURCE P30-P37.agc:223
//#	L+1		S30.1
// PORT: SOURCE P30-P37.agc:224
//# NORMAL EXIT MODE
// PORT: SOURCE P30-P37.agc:225
//#	AT L+2 OR CALLING SEQUENCE (GOTO L+2)
// PORT: SOURCE P30-P37.agc:226
//# SUBROUTINES CALLED
// PORT: SOURCE P30-P37.agc:227
//#	THISPREC
// PORT: SOURCE P30-P37.agc:228
//#	PERIAPO
// PORT: SOURCE P30-P37.agc:229
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P30-P37.agc:230
//#		NONE
// PORT: SOURCE P30-P37.agc:231
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P30-P37.agc:232
//#	TIG		TIME OF IGNITION	DP	B28CS
// PORT: SOURCE P30-P37.agc:233
//#	DELVSLV		SPECIFIED DELTA-V IN LOCAL VERT.
// PORT: SOURCE P30-P37.agc:234
//#			COORDS. OF ACTIVE VEHICLE AT
// PORT: SOURCE P30-P37.agc:235
//#	TIME OF IGNITION			VCT.	B+7M/CS
// PORT: SOURCE P30-P37.agc:236
//#
// PORT: SOURCE P30-P37.agc:237
//# OUTPUT
// PORT: SOURCE P30-P37.agc:238
//#	RTIG		POSITION AT TIG		VCT. 	B+29M
// PORT: SOURCE P30-P37.agc:239
//#	VTIG		VELOCITY AT TIG		VCT. 	B+7M
// PORT: SOURCE P30-P37.agc:240
//#	HAPO		APOGEE ALT.		DP 	B+29M
// PORT: SOURCE P30-P37.agc:241
//#	HPER		PERIGEE ALT.		DP 	B+29M
// PORT: SOURCE P30-P37.agc:242
//#	DELVSIN		DELVSLV IN REF COORDS	VCT. 	B+7M/CS
// PORT: SOURCE P30-P37.agc:243
//#	VGDISP		MAG. OF DELVSIN		DP 	B+7M/CS
// PORT: SOURCE P30-P37.agc:244
//# DEBRIS	QTEMP	TEMP. ERASABLE
// PORT: SOURCE P30-P37.agc:245
//#		QPRET,MPAC
// PORT: SOURCE P30-P37.agc:246
//#		PUSHLIST
// PORT: SOURCE P30-P37.agc:247
//
// PORT: SOURCE P30-P37.agc:248
//		SETLOC	P30S1A
// PORT: SOURCE P30-P37.agc:249
//		BANK
// PORT: SOURCE P30-P37.agc:250
//
// PORT: SOURCE P30-P37.agc:251
//		COUNT	35/S30S
// PORT: SOURCE P30-P37.agc:252
//
// PORT: SOURCE P30-P37.agc:253
//S30.1		STQ	DLOAD
// PORT: Fixed ROM slots 28477.
    28477, 58656,
// PORT: SOURCE P30-P37.agc:254
//			QTEMP
// PORT: Fixed ROM slots 28478.
    28478, 3934,
// PORT: SOURCE P30-P37.agc:255
//			TIG		# TIME IGNITION SCALED AT 2(+28)CS
// PORT: Fixed ROM slots 28479.
    28479, 3606,
// PORT: SOURCE P30-P37.agc:256
//		STCALL	TDEC1
// PORT: Fixed ROM slots 28480.
    28480, 28738,
// PORT: SOURCE P30-P37.agc:257
//			THISPREC	# ENCKE ROUTINE FOR
// PORT: Fixed ROM slots 28481.
    28481, 23666,
// PORT: SOURCE P30-P37.agc:258
//
// PORT: SOURCE P30-P37.agc:259
//		VLOAD	SXA,2
// PORT: Fixed ROM slots 28482.
    28482, 56570,
// PORT: SOURCE P30-P37.agc:260
//			VATT
// PORT: Fixed ROM slots 28483.
    28483, 14,
// PORT: SOURCE P30-P37.agc:261
//			RTX2
// PORT: Fixed ROM slots 28484.
    28484, 4044,
// PORT: SOURCE P30-P37.agc:262
//		STOVL	VTIG
// PORT: Fixed ROM slots 28485.
    28485, 24384,
// PORT: SOURCE P30-P37.agc:263
//# Page 640
// PORT: SOURCE P30-P37.agc:264
//			RATT
// PORT: Fixed ROM slots 28486.
    28486, 2,
// PORT: SOURCE P30-P37.agc:265
//		STORE	RTIG
// PORT: Fixed ROM slots 28487.
    28487, 3892,
// PORT: SOURCE P30-P37.agc:266
//		STORE	RACT3
// PORT: Fixed ROM slots 28488.
    28488, 3776,
// PORT: SOURCE P30-P37.agc:267
//		VXV	UNIT
// PORT: Fixed ROM slots 28489.
    28489, 44602,
// PORT: SOURCE P30-P37.agc:268
//			VTIG
// PORT: Fixed ROM slots 28490.
    28490, 3904,
// PORT: SOURCE P30-P37.agc:269
//		STCALL	UNRM
// PORT: Fixed ROM slots 28491.
    28491, 31518,
// PORT: SOURCE P30-P37.agc:270
//			LOMAT
// PORT: Fixed ROM slots 28492.
    28492, 60268,
// PORT: SOURCE P30-P37.agc:271
//		VLOAD	VXM
// PORT: Fixed ROM slots 28493.
    28493, 50682,
// PORT: SOURCE P30-P37.agc:272
//			DELVSLV
// PORT: Fixed ROM slots 28494.
    28494, 3594,
// PORT: SOURCE P30-P37.agc:273
//			0
// PORT: Fixed ROM slots 28495.
    28495, 2,
// PORT: SOURCE P30-P37.agc:274
//		VSL1	SXA,1
// PORT: Fixed ROM slots 28496.
    28496, 55540,
// PORT: SOURCE P30-P37.agc:275
//			RTX1
// PORT: Fixed ROM slots 28497.
    28497, 4042,
// PORT: SOURCE P30-P37.agc:276
//		STORE	DELVSIN
// PORT: Fixed ROM slots 28498.
    28498, 3916,
// PORT: SOURCE P30-P37.agc:277
//		ABVAL
// PORT: Fixed ROM slots 28499.
    28499, 65356,
// PORT: SOURCE P30-P37.agc:278
//		STOVL	VGDISP		# MAG DELV
// PORT: Fixed ROM slots 28500.
    28500, 24566,
// PORT: SOURCE P30-P37.agc:279
//			RTIG
// PORT: Fixed ROM slots 28501.
    28501, 3892,
// PORT: SOURCE P30-P37.agc:280
//		PDVL	VAD
// PORT: Fixed ROM slots 28502.
    28502, 44442,
// PORT: SOURCE P30-P37.agc:281
//			DELVSIN
// PORT: Fixed ROM slots 28503.
    28503, 3916,
// PORT: SOURCE P30-P37.agc:282
//			VTIG
// PORT: Fixed ROM slots 28504.
    28504, 3904,
// PORT: SOURCE P30-P37.agc:283
//		CALL
// PORT: Fixed ROM slots 28505.
    28505, 65320,
// PORT: SOURCE P30-P37.agc:284
//			PERIAPO1
// PORT: Fixed ROM slots 28506.
    28506, 38102,
// PORT: SOURCE P30-P37.agc:285
//		CALL
// PORT: Fixed ROM slots 28507.
    28507, 65320,
// PORT: SOURCE P30-P37.agc:286
//			SHIFTR1
// PORT: Fixed ROM slots 28508.
    28508, 38246,
// PORT: SOURCE P30-P37.agc:287
//		CALL
// PORT: Fixed ROM slots 28509.
    28509, 65320,
// PORT: SOURCE P30-P37.agc:288
//			MAXCHK
// PORT: Fixed ROM slots 28510.
    28510, 39896,
// PORT: SOURCE P30-P37.agc:289
//		STODL	HPER		# PERIGEE ALT B+29
// PORT: Fixed ROM slots 28511.
    28511, 14828,
// PORT: SOURCE P30-P37.agc:290
//			4D
// PORT: Fixed ROM slots 28512.
    28512, 10,
// PORT: SOURCE P30-P37.agc:291
//		CALL
// PORT: Fixed ROM slots 28513.
    28513, 65320,
// PORT: SOURCE P30-P37.agc:292
//			SHIFTR1
// PORT: Fixed ROM slots 28514.
    28514, 38246,
// PORT: SOURCE P30-P37.agc:293
//		CALL
// PORT: Fixed ROM slots 28515.
    28515, 65320,
// PORT: SOURCE P30-P37.agc:294
//			MAXCHK
// PORT: Fixed ROM slots 28516.
    28516, 39896,
// PORT: SOURCE P30-P37.agc:295
//		STCALL	HAPO		# APOGEE ALT B+29
// PORT: Fixed ROM slots 28517.
    28517, 31208,
// PORT: SOURCE P30-P37.agc:296
//			QTEMP
// PORT: Fixed ROM slots 28518.
    28518, 3934,
// PORT: SOURCE P30-P37.agc:297
//
// PORT: SOURCE P30-P37.agc:298
//# Page 641
// PORT: SOURCE P30-P37.agc:299
//# S31.1 PROGRAM DESCRIPTION		28DEC67
// PORT: SOURCE P30-P37.agc:300
//# MOD.1 BY S.ZELDIN
// PORT: SOURCE P30-P37.agc:301
//
// PORT: SOURCE P30-P37.agc:302
//# S31.1 COMPUTES DELV IN REF AND LV COORDS,MAG OF DELV,INTERCEPT TIME,
// PORT: SOURCE P30-P37.agc:303
//# APOGEE AND PERIGEE ALT FOR REQUIRED MANEUVER
// PORT: SOURCE P30-P37.agc:304
//
// PORT: SOURCE P30-P37.agc:305
//# CALLING SEQUENCE
// PORT: SOURCE P30-P37.agc:306
//#	L	CALL
// PORT: SOURCE P30-P37.agc:307
//#	L+1		S31.1
// PORT: SOURCE P30-P37.agc:308
//
// PORT: SOURCE P30-P37.agc:309
//# NORMAL EXIT MODE
// PORT: SOURCE P30-P37.agc:310
//#	AT L +2 OF CALLING SEQUENCE(GOTO L+2)
// PORT: SOURCE P30-P37.agc:311
//# SUBROUTINES CALLED
// PORT: SOURCE P30-P37.agc:312
//#	AGAIN
// PORT: SOURCE P30-P37.agc:313
//#	PERIAPO1
// PORT: SOURCE P30-P37.agc:314
//#	SHIFTR1
// PORT: SOURCE P30-P37.agc:315
//#	MIDGIM
// PORT: SOURCE P30-P37.agc:316
//# NO ALARM OR ABORT MODES
// PORT: SOURCE P30-P37.agc:317
//# INPUT
// PORT: SOURCE P30-P37.agc:318
//#	DELLT4		DP	+28
// PORT: SOURCE P30-P37.agc:319
//#	TIG		DP     +28
// PORT: SOURCE P30-P37.agc:320
//#	RTARG		VCT	+29
// PORT: SOURCE P30-P37.agc:321
//# OUTPUT
// PORT: SOURCE P30-P37.agc:322
//#	DELVLVC		VCT	+7
// PORT: SOURCE P30-P37.agc:323
//#	VGDISP		DP	+7
// PORT: SOURCE P30-P37.agc:324
//#	HAPO		DP	+29
// PORT: SOURCE P30-P37.agc:325
//#	HPER		DP	+29
// PORT: SOURCE P30-P37.agc:326
//#	TPASS4		DP	+28
// PORT: SOURCE P30-P37.agc:327
//# DEBRIS - QTEMP
// PORT: SOURCE P30-P37.agc:328
//
// PORT: SOURCE P30-P37.agc:329
//S31.1		STQ	DLOAD
// PORT: Fixed ROM slots 28519.
    28519, 58656
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:330
//			QTEMP
// PORT: Fixed ROM slots 28520.
    28520, 3934,
// PORT: SOURCE P30-P37.agc:331
//			TIG
// PORT: Fixed ROM slots 28521.
    28521, 3606,
// PORT: SOURCE P30-P37.agc:332
//		STCALL	TDEC1
// PORT: Fixed ROM slots 28522.
    28522, 28738,
// PORT: SOURCE P30-P37.agc:333
//			AGAIN		# RETURNS RTX2,RTX1,RATT,VATT,VIPRIME
// PORT: Fixed ROM slots 28523.
    28523, 51026,
// PORT: SOURCE P30-P37.agc:334
//		VLOAD	PDVL		# DELUEET3
// PORT: Fixed ROM slots 28524.
    28524, 52730,
// PORT: SOURCE P30-P37.agc:335
//			RTIG
// PORT: Fixed ROM slots 28525.
    28525, 3892,
// PORT: SOURCE P30-P37.agc:336
//			VIPRIME
// PORT: Fixed ROM slots 28526.
    28526, 3860,
// PORT: SOURCE P30-P37.agc:337
//		CALL
// PORT: Fixed ROM slots 28527.
    28527, 65320,
// PORT: SOURCE P30-P37.agc:338
//			PERIAPO1
// PORT: Fixed ROM slots 28528.
    28528, 38102,
// PORT: SOURCE P30-P37.agc:339
//		CALL
// PORT: Fixed ROM slots 28529.
    28529, 65320,
// PORT: SOURCE P30-P37.agc:340
//			SHIFTR1
// PORT: Fixed ROM slots 28530.
    28530, 38246,
// PORT: SOURCE P30-P37.agc:341
//		CALL
// PORT: Fixed ROM slots 28531.
    28531, 65320,
// PORT: SOURCE P30-P37.agc:342
//			MAXCHK
// PORT: Fixed ROM slots 28532.
    28532, 39896,
// PORT: SOURCE P30-P37.agc:343
//		STODL	HPER		# B29
// PORT: Fixed ROM slots 28533.
    28533, 14828,
// PORT: SOURCE P30-P37.agc:344
//			4D
// PORT: Fixed ROM slots 28534.
    28534, 10,
// PORT: SOURCE P30-P37.agc:345
//		CALL
// PORT: Fixed ROM slots 28535.
    28535, 65320,
// PORT: SOURCE P30-P37.agc:346
//			SHIFTR1
// PORT: Fixed ROM slots 28536.
    28536, 38246,
// PORT: SOURCE P30-P37.agc:347
//		CALL
// PORT: Fixed ROM slots 28537.
    28537, 65320,
// PORT: SOURCE P30-P37.agc:348
//			MAXCHK
// PORT: Fixed ROM slots 28538.
    28538, 39896,
// PORT: SOURCE P30-P37.agc:349
//		STOVL	HAPO		# B29
// PORT: Fixed ROM slots 28539.
    28539, 23016,
// PORT: SOURCE P30-P37.agc:350
//# Page 642
// PORT: SOURCE P30-P37.agc:351
//			DELVEET3
// PORT: Fixed ROM slots 28540.
    28540, 3916,
// PORT: SOURCE P30-P37.agc:352
//		STORE	0
// PORT: Fixed ROM slots 28541.
    28541, 2,
// PORT: SOURCE P30-P37.agc:353
//		SET	CALL
// PORT: Fixed ROM slots 28542.
    28542, 37912,
// PORT: SOURCE P30-P37.agc:354
//			AVFLAG
// PORT: Fixed ROM slots 28543.
    28543, 1140,
// PORT: SOURCE P30-P37.agc:355
//			MIDGIM		# GET DELVLVC B7 FORDISPLAY
// PORT: Fixed ROM slots 28544.
    28544, 9038,
// PORT: SOURCE P30-P37.agc:356
//		ABVAL
// PORT: Fixed ROM slots 28545.
    28545, 65356,
// PORT: SOURCE P30-P37.agc:357
//		STODL	VGDISP		# B+7 FOR DISPLAY
// PORT: Fixed ROM slots 28546.
    28546, 16374,
// PORT: SOURCE P30-P37.agc:358
//			DELLT4
// PORT: Fixed ROM slots 28547.
    28547, 3622,
// PORT: SOURCE P30-P37.agc:359
//		DAD
// PORT: Fixed ROM slots 28548.
    28548, 65306,
// PORT: SOURCE P30-P37.agc:360
//			TIG
// PORT: Fixed ROM slots 28549.
    28549, 3606,
// PORT: SOURCE P30-P37.agc:361
//		STCALL	TPASS4		# FOR S40.1
// PORT: Fixed ROM slots 28550.
    28550, 32604,
// PORT: SOURCE P30-P37.agc:362
//			QTEMP
// PORT: Fixed ROM slots 28551.
    28551, 3934,
// PORT: SOURCE P30-P37.agc:363
//
// PORT: SOURCE P30-P37.agc:364
//# Page 643
// PORT: SOURCE P30-P37.agc:365
//# SUBROUTINE NAME:	DELRSPL		(CONTINUATION OF V 82 IN CSM IF P11 ACTI
// PORT: SOURCE P30-P37.agc:366
//# TRANSFERRED COMPLETELY FROM SUNDISK, P30S REV 33.  9 SEPT 67.
// PORT: SOURCE P30-P37.agc:367
//# MOD NO: 0		MOD BY: ZELDIN		DATE:
// PORT: SOURCE P30-P37.agc:368
//# MOD NO: 1		MOD BY: RR BAIRNSFATHER	DATE:  11 APR 67
// PORT: SOURCE P30-P37.agc:369
//# MOD NO: 2		MOD BY: RR BAIRNSFATHER	DATE:  12 MAY 67	ADD UR.RT CALC WHEN BELOW 300K FT
// PORT: SOURCE P30-P37.agc:370
//# MOD NO: 2.1		MOD BY: RR BAIRNSFATHER	DATE: 5 JULY 67		FIX ERROR ON MOD. 2.
// PORT: SOURCE P30-P37.agc:371
//# MOD NO: 3		MOD BY: RR BAIRNSFATHER	DATE:  12 JUL 67	CHANGE SIGN OF DISPLAYED ERROR.
// PORT: SOURCE P30-P37.agc:372
//# MOD 4			MOD BY  S.ZELDIN	DATE  3 APRIL 68	CHANGE EQUATIONS FOR L/D=.18 WHICH REPLA
// PORT: SOURCE P30-P37.agc:373
//# FUNCTION:		CALCULATE (FOR DISPLAY ON CALL) AN APPROXIMATE MEASURE OF IN-PLANE SPLASH DOWN
// PORT: SOURCE P30-P37.agc:374
//#			ERROR.  IF THE FREE-FALL TRANSFER ANGLE TO 300K FT ABOVE PAD RADIUS IS POSITIVE:
// PORT: SOURCE P30-P37.agc:375
//#			SPLASH ERROR= -RANGE TO TARGET + FREE-FALL TRANSFER ANGLE + ESTIMATED ENTRY ANGLE.
// PORT: SOURCE P30-P37.agc:376
//#			THE TARGET LOCATION AT ESTIMATED TIME OF IMPACT IS USED.  IF THE FREE-FALL TRANSFER
// PORT: SOURCE P30-P37.agc:377
//#			ANGLE IS NEGATIVE:  SPASH ERROR= -RANGE TO TARGET
// PORT: SOURCE P30-P37.agc:378
//#			THE PRESENT TARGET LOCATION IS USED.
// PORT: SOURCE P30-P37.agc:379
//# CALLING SEQUENCE	CALLED AFTER SR30.1 IF IN CSM AND IF P11 OPERATING (UNDER CONTROL OF V82)
// PORT: SOURCE P30-P37.agc:380
//# SUBROUTINES CALLED:  VGAMCALC, TFF/TRIG, LALOTORV.
// PORT: SOURCE P30-P37.agc:381
//# EXIT:			RETURN DIRECTLY TO V 82 PROG. AT SPLRET
// PORT: SOURCE P30-P37.agc:382
//# ERASABLE INITIALIZATION  LEFT BY SR30.1 AND V82GON1
// PORT: SOURCE P30-P37.agc:383
//# OUTPUT:	RSP-RREC RANGE IN REVOLUTIONS.  			DSKY DISPLAY IN N. MI.
// PORT: SOURCE P30-P37.agc:384
//# DEBRIS:	QPRET, PDL0 ...PDL7 ,PDL10
// PORT: SOURCE P30-P37.agc:385
//
// PORT: SOURCE P30-P37.agc:386
//# 		THETA(1)
// PORT: SOURCE P30-P37.agc:387
//
// PORT: SOURCE P30-P37.agc:388
//		BANK	32
// PORT: SOURCE P30-P37.agc:389
//		SETLOC	DELRSPL1
// PORT: SOURCE P30-P37.agc:390
//		BANK
// PORT: SOURCE P30-P37.agc:391
//		COUNT*	$$/P30		# PROGRAMS: P30 EXTERNAL DELTA V
// PORT: SOURCE P30-P37.agc:392
//
// PORT: SOURCE P30-P37.agc:393
//DELRSPL		STORE	8D
// PORT: Fixed ROM slots 28687.
    28687, 18,
// PORT: SOURCE P30-P37.agc:394
//		BPL	DSU
// PORT: Fixed ROM slots 28688.
    28688, 38216,
// PORT: SOURCE P30-P37.agc:395
//			CANTDO		# GONE PAST 300K FT ALT
// PORT: Fixed ROM slots 28689.
    28689, 53358,
// PORT: SOURCE P30-P37.agc:396
//			1BITDP
// PORT: Fixed ROM slots 28690.
    28690, 14764,
// PORT: SOURCE P30-P37.agc:397
//		BOV	CALL
// PORT: Fixed ROM slots 28691.
    28691, 37888,
// PORT: SOURCE P30-P37.agc:398
//			CANTDO		# POSMAX INDICATES NO 300K FT SOLUTION.
// PORT: Fixed ROM slots 28692.
    28692, 53358,
// PORT: SOURCE P30-P37.agc:399
//			VGAMCALC	# +GAMMA(REV) IN PMAC,V300 MAG(B-7)=PDL 0
// PORT: Fixed ROM slots 28693.
    28693, 46162,
// PORT: SOURCE P30-P37.agc:400
//		PUSH	CALL
// PORT: Fixed ROM slots 28694.
    28694, 37900,
// PORT: SOURCE P30-P37.agc:401
//			TFF/TRIG
// PORT: Fixed ROM slots 28695.
    28695, 47922,
// PORT: SOURCE P30-P37.agc:402
//		CALL
// PORT: Fixed ROM slots 28696.
    28696, 65320,
// PORT: SOURCE P30-P37.agc:403
//			AUGEKUGL
// PORT: Fixed ROM slots 28697.
    28697, 53370,
// PORT: SOURCE P30-P37.agc:404
//		PDDL	ACOS		# T ENTRY PDL 6
// PORT: Fixed ROM slots 28698.
    28698, 54954,
// PORT: SOURCE P30-P37.agc:405
//			CDELF/2
// PORT: Fixed ROM slots 28699.
    28699, 30,
// PORT: SOURCE P30-P37.agc:406
//		DAD
// PORT: Fixed ROM slots 28700.
    28700, 65306,
// PORT: SOURCE P30-P37.agc:407
//			4
// PORT: Fixed ROM slots 28701.
    28701, 10,
// PORT: SOURCE P30-P37.agc:408
//GETARG		STOVL	THETA(1)
// PORT: Fixed ROM slots 28702.
    28702, 22992,
// PORT: SOURCE P30-P37.agc:409
//			LAT(SPL)
// PORT: Fixed ROM slots 28703.
    28703, 3586,
// PORT: SOURCE P30-P37.agc:410
//		STODL	LAT
// PORT: Fixed ROM slots 28704.
    28704, 13448,
// PORT: SOURCE P30-P37.agc:411
//			HI6ZEROS
// PORT: Fixed ROM slots 28705.
    28705, 13754,
// PORT: SOURCE P30-P37.agc:412
//		STODL	ALT		# ALT=0 = LAT +4
// PORT: Fixed ROM slots 28706.
    28706, 13456,
// PORT: SOURCE P30-P37.agc:413
//			PIPTIME
// PORT: Fixed ROM slots 28707.
    28707, 1290,
// PORT: SOURCE P30-P37.agc:414
//# Page 644
// PORT: SOURCE P30-P37.agc:415
//		BON	DLOAD
// PORT: Fixed ROM slots 28708.
    28708, 58648,
// PORT: SOURCE P30-P37.agc:416
//			V37FLAG
// PORT: Fixed ROM slots 28709.
    28709, 3986,
// PORT: SOURCE P30-P37.agc:417
//			+2
// PORT: Fixed ROM slots 28710.
    28710, 53328,
// PORT: SOURCE P30-P37.agc:418
//			TSTART82
// PORT: Fixed ROM slots 28711.
    28711, 2474,
// PORT: SOURCE P30-P37.agc:419
//		DSU	DAD
// PORT: Fixed ROM slots 28712.
    28712, 36138,
// PORT: SOURCE P30-P37.agc:420
//			8D
// PORT: Fixed ROM slots 28713.
    28713, 18,
// PORT: SOURCE P30-P37.agc:421
//		CLEAR	CALL
// PORT: Fixed ROM slots 28714.
    28714, 37912,
// PORT: SOURCE P30-P37.agc:422
//			ERADFLAG
// PORT: Fixed ROM slots 28715.
    28715, 868,
// PORT: SOURCE P30-P37.agc:423
//			LALOTORV	# R RECOV. IN ALPHAV AND MPAC
// PORT: Fixed ROM slots 28716.
    28716, 23106,
// PORT: SOURCE P30-P37.agc:424
//
// PORT: SOURCE P30-P37.agc:425
//		UNIT	PDVL
// PORT: Fixed ROM slots 28717.
    28717, 52572,
// PORT: SOURCE P30-P37.agc:426
//			RONE
// PORT: Fixed ROM slots 28718.
    28718, 2478,
// PORT: SOURCE P30-P37.agc:427
//		UNIT	DOT
// PORT: Fixed ROM slots 28719.
    28719, 41308,
// PORT: SOURCE P30-P37.agc:428
//		SL1	ARCCOS
// PORT: Fixed ROM slots 28720.
    28720, 54996,
// PORT: SOURCE P30-P37.agc:429
//		BDSU			# ERROR = THETA EST - THETA TARG
// PORT: Fixed ROM slots 28721.
    28721, 65314,
// PORT: SOURCE P30-P37.agc:430
//					# NEGATIVE NUMBER SIGNIFIES THAT WILL FALL SHORT.
// PORT: SOURCE P30-P37.agc:431
//					# POSITIVE NUMBER SIGNIFIES THAT WILL OVERSHOOT.
// PORT: SOURCE P30-P37.agc:432
//			THETA(1)
// PORT: Fixed ROM slots 28722.
    28722, 2512,
// PORT: SOURCE P30-P37.agc:433
//DELRDONE	STCALL	RSP-RREC	# DOWNRANGE RECOVERY RANGE ERROR	/360
// PORT: Fixed ROM slots 28723.
    28723, 31196,
// PORT: SOURCE P30-P37.agc:434
//			INTWAKE0
// PORT: Fixed ROM slots 28724.
    28724, 24154,
// PORT: SOURCE P30-P37.agc:435
//		CALL
// PORT: Fixed ROM slots 28725.
    28725, 65320,
// PORT: SOURCE P30-P37.agc:436
//			SPLRET
// PORT: Fixed ROM slots 28726.
    28726, 39766,
// PORT: SOURCE P30-P37.agc:437
//CANTDO		DLOAD	PDDL		# INITIALIZE ERASE TO DOT TARGET AND UR
// PORT: Fixed ROM slots 28727.
    28727, 54730,
// PORT: SOURCE P30-P37.agc:438
//					# FOR RANGE ANGLE.
// PORT: SOURCE P30-P37.agc:439
//			HIDPHALF	# TO PDL 0 FOR DEN IN DDV.
// PORT: Fixed ROM slots 28728.
    28728, 13750,
// PORT: SOURCE P30-P37.agc:440
//			HI6ZEROS
// PORT: Fixed ROM slots 28729.
    28729, 13754,
// PORT: SOURCE P30-P37.agc:441
//		PUSH			# ZERO TO PDL 2 FOR PHI ENTRY
// PORT: Fixed ROM slots 28730.
    28730, 65292,
// PORT: SOURCE P30-P37.agc:442
//		STCALL	8D
// PORT: Fixed ROM slots 28731.
    28731, 28690,
// PORT: SOURCE P30-P37.agc:443
//			GETARG		# GO SET RSP-RREC =0
// PORT: Fixed ROM slots 28732.
    28732, 53308,
// PORT: SOURCE P30-P37.agc:444
//
// PORT: SOURCE P30-P37.agc:445
//AUGEKUGL	VLOAD
// PORT: Fixed ROM slots 28733.
    28733, 65530,
// PORT: SOURCE P30-P37.agc:446
//			X1CON -2
// PORT: Fixed ROM slots 28734.
    28734, 20828,
// PORT: SOURCE P30-P37.agc:447
//		STODL	X1 -2
// PORT: Fixed ROM slots 28735.
    28735, 12362,
// PORT: SOURCE P30-P37.agc:448
//			0
// PORT: Fixed ROM slots 28736.
    28736, 2,
// PORT: SOURCE P30-P37.agc:449
//		DSU	BMN
// PORT: Fixed ROM slots 28737.
    28737, 41002,
// PORT: SOURCE P30-P37.agc:450
//			V(21K)
// PORT: Fixed ROM slots 28738.
    28738, 20816,
// PORT: SOURCE P30-P37.agc:451
//			LOOPSET
// PORT: Fixed ROM slots 28739.
    28739, 53424,
// PORT: SOURCE P30-P37.agc:452
//		XSU,1	XCHX,2
// PORT: Fixed ROM slots 28740.
    28740, 54368,
// PORT: SOURCE P30-P37.agc:453
//			S1
// PORT: Fixed ROM slots 28741.
    28741, 80,
// PORT: SOURCE P30-P37.agc:454
//			X1
// PORT: Fixed ROM slots 28742.
    28742, 76,
// PORT: SOURCE P30-P37.agc:455
//		XCHX,2	DSU
// PORT: Fixed ROM slots 28743.
    28743, 38312,
// PORT: SOURCE P30-P37.agc:456
//			S1
// PORT: Fixed ROM slots 28744.
    28744, 80,
// PORT: SOURCE P30-P37.agc:457
//			V(3K)
// PORT: Fixed ROM slots 28745.
    28745, 20796
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:458
//		BMN	XCHX,2
// PORT: Fixed ROM slots 28746.
    28746, 54336,
// PORT: SOURCE P30-P37.agc:459
//			LOOPSET
// PORT: Fixed ROM slots 28747.
    28747, 53424,
// PORT: SOURCE P30-P37.agc:460
//			S1
// PORT: Fixed ROM slots 28748.
    28748, 80,
// PORT: SOURCE P30-P37.agc:461
//		DSU	BMN
// PORT: Fixed ROM slots 28749.
    28749, 41002,
// PORT: SOURCE P30-P37.agc:462
//			V(4K)
// PORT: Fixed ROM slots 28750.
    28750, 20812,
// PORT: SOURCE P30-P37.agc:463
//			LOOPSET
// PORT: Fixed ROM slots 28751.
    28751, 53424,
// PORT: SOURCE P30-P37.agc:464
//		XCHX,2	XCHX,2
// PORT: Fixed ROM slots 28752.
    28752, 54440,
// PORT: SOURCE P30-P37.agc:465
//# Page 645
// PORT: SOURCE P30-P37.agc:466
//			S1
// PORT: Fixed ROM slots 28753.
    28753, 80,
// PORT: SOURCE P30-P37.agc:467
//			X1
// PORT: Fixed ROM slots 28754.
    28754, 76,
// PORT: SOURCE P30-P37.agc:468
//		DSU	BMN
// PORT: Fixed ROM slots 28755.
    28755, 41002,
// PORT: SOURCE P30-P37.agc:469
//			V(400)
// PORT: Fixed ROM slots 28756.
    28756, 20788,
// PORT: SOURCE P30-P37.agc:470
//			LOOPSET
// PORT: Fixed ROM slots 28757.
    28757, 53424,
// PORT: SOURCE P30-P37.agc:471
//		SXA,1
// PORT: Fixed ROM slots 28758.
    28758, 65456,
// PORT: SOURCE P30-P37.agc:472
//			S1
// PORT: Fixed ROM slots 28759.
    28759, 80,
// PORT: SOURCE P30-P37.agc:473
//LOOPSET		INCR,1	GOTO
// PORT: Fixed ROM slots 28760.
    28760, 43152,
// PORT: SOURCE P30-P37.agc:474
//		DEC	1
// PORT: Fixed ROM slots 28761.
    28761, 2,
// PORT: SOURCE P30-P37.agc:475
//			K1K2LOOP
// PORT: Fixed ROM slots 28762.
    28762, 53434,
// PORT: SOURCE P30-P37.agc:476
//K2CALC		SXA,1
// PORT: Fixed ROM slots 28763.
    28763, 65456,
// PORT: SOURCE P30-P37.agc:477
//			S1
// PORT: Fixed ROM slots 28764.
    28764, 80,
// PORT: SOURCE P30-P37.agc:478
//K1K2LOOP	DLOAD	DSU*
// PORT: Fixed ROM slots 28765.
    28765, 37834,
// PORT: SOURCE P30-P37.agc:479
//			0
// PORT: Fixed ROM slots 28766.
    28766, 2,
// PORT: SOURCE P30-P37.agc:480
//			V(32K) +1,1
// PORT: Fixed ROM slots 28767.
    28767, 20810,
// PORT: SOURCE P30-P37.agc:481
//		DMP*	DAD*
// PORT: Fixed ROM slots 28768.
    28768, 35590,
// PORT: SOURCE P30-P37.agc:482
//			YK1K2 +1,1
// PORT: Fixed ROM slots 28769.
    28769, 20786,
// PORT: SOURCE P30-P37.agc:483
//			CK1K2 +1,1
// PORT: Fixed ROM slots 28770.
    28770, 20762,
// PORT: SOURCE P30-P37.agc:484
//		PDDL	TIX,1
// PORT: Fixed ROM slots 28771.
    28771, 49322,
// PORT: SOURCE P30-P37.agc:485
//			2
// PORT: Fixed ROM slots 28772.
    28772, 6,
// PORT: SOURCE P30-P37.agc:486
//			K2CALC
// PORT: Fixed ROM slots 28773.
    28773, 53430,
// PORT: SOURCE P30-P37.agc:487
//		DSU	BDDV
// PORT: Fixed ROM slots 28774.
    28774, 46378,
// PORT: SOURCE P30-P37.agc:488
//		PUSH	BOV
// PORT: Fixed ROM slots 28775.
    28775, 32780,
// PORT: SOURCE P30-P37.agc:489
//			MAXPHI
// PORT: Fixed ROM slots 28776.
    28776, 53494,
// PORT: SOURCE P30-P37.agc:490
//		BMN	DSU
// PORT: Fixed ROM slots 28777.
    28777, 38208,
// PORT: SOURCE P30-P37.agc:491
//			MAXPHI
// PORT: Fixed ROM slots 28778.
    28778, 53494,
// PORT: SOURCE P30-P37.agc:492
//			MAXPHIC
// PORT: Fixed ROM slots 28779.
    28779, 20736,
// PORT: SOURCE P30-P37.agc:493
//		BPL
// PORT: Fixed ROM slots 28780.
    28780, 65352,
// PORT: SOURCE P30-P37.agc:494
//			MAXPHI
// PORT: Fixed ROM slots 28781.
    28781, 53494,
// PORT: SOURCE P30-P37.agc:495
//PHICALC		DLOAD	DSU		# PHI ENTRY PDL 4D
// PORT: Fixed ROM slots 28782.
    28782, 38346,
// PORT: SOURCE P30-P37.agc:496
//			0
// PORT: Fixed ROM slots 28783.
    28783, 2,
// PORT: SOURCE P30-P37.agc:497
//			V(26K)
// PORT: Fixed ROM slots 28784.
    28784, 20828,
// PORT: SOURCE P30-P37.agc:498
//		BPL	DLOAD
// PORT: Fixed ROM slots 28785.
    28785, 58696,
// PORT: SOURCE P30-P37.agc:499
//			TGR26
// PORT: Fixed ROM slots 28786.
    28786, 53488,
// PORT: SOURCE P30-P37.agc:500
//			TLESS26
// PORT: Fixed ROM slots 28787.
    28787, 20820,
// PORT: SOURCE P30-P37.agc:501
//		DDV
// PORT: Fixed ROM slots 28788.
    28788, 65394,
// PORT: SOURCE P30-P37.agc:502
//			0
// PORT: Fixed ROM slots 28789.
    28789, 2,
// PORT: SOURCE P30-P37.agc:503
//TENT		DMP	RVQ
// PORT: Fixed ROM slots 28790.
    28790, 36362,
// PORT: SOURCE P30-P37.agc:504
//			4D
// PORT: Fixed ROM slots 28791.
    28791, 10,
// PORT: SOURCE P30-P37.agc:505
//TGR26		DLOAD	GOTO
// PORT: Fixed ROM slots 28792.
    28792, 43210,
// PORT: SOURCE P30-P37.agc:506
//			TGR26CON
// PORT: Fixed ROM slots 28793.
    28793, 20824,
// PORT: SOURCE P30-P37.agc:507
//			TENT
// PORT: Fixed ROM slots 28794.
    28794, 53484,
// PORT: SOURCE P30-P37.agc:508
//
// PORT: SOURCE P30-P37.agc:509
//MAXPHI		DLOAD	PDDL
// PORT: Fixed ROM slots 28795.
    28795, 54730,
// PORT: SOURCE P30-P37.agc:510
//			MAXPHIC
// PORT: Fixed ROM slots 28796.
    28796, 20736,
// PORT: SOURCE P30-P37.agc:511
//		GOTO
// PORT: Fixed ROM slots 28797.
    28797, 65360,
// PORT: SOURCE P30-P37.agc:512
//			PHICALC
// PORT: Fixed ROM slots 28798.
    28798, 53468,
// PORT: SOURCE P30-P37.agc:513
//MAXPHIC		2DEC	.09259298	# 2000 NM FOR MAXIMUM PHI ENTRY
// PORT: Fixed ROM slots 28799 28800.
    28799, 3034, 28800, 1422,
// PORT: SOURCE P30-P37.agc:514
//
// PORT: SOURCE P30-P37.agc:515
//# Page 646
// PORT: SOURCE P30-P37.agc:516
//
// PORT: SOURCE P30-P37.agc:517
//		COUNT*	$$/P30
// PORT: SOURCE P30-P37.agc:518
//
// PORT: SOURCE P30-P37.agc:519
//					# 		BELOW
// PORT: SOURCE P30-P37.agc:520
//					# <<<< TABLE IS INDEXED. KEEP IN ORDER >>>>
// PORT: SOURCE P30-P37.agc:521
//
// PORT: SOURCE P30-P37.agc:522
//		2DEC	7.07304526 E-4	# 5500
// PORT: Fixed ROM slots 28801 28802.
    28801, 22, 28802, 19284,
// PORT: SOURCE P30-P37.agc:523
//
// PORT: SOURCE P30-P37.agc:524
//		2DEC	3.08641975 E-4	# 2400
// PORT: Fixed ROM slots 28803 28804.
    28803, 10, 28804, 1860,
// PORT: SOURCE P30-P37.agc:525
//
// PORT: SOURCE P30-P37.agc:526
//		2DEC	3.08641975 E-4	# 2400
// PORT: Fixed ROM slots 28805 28806.
    28805, 10, 28806, 1860,
// PORT: SOURCE P30-P37.agc:527
//
// PORT: SOURCE P30-P37.agc:528
//		2DEC	-8.8888888 E-3	# -3.2
// PORT: Fixed ROM slots 28807 28808.
    28807, 65244, 28808, 44708,
// PORT: SOURCE P30-P37.agc:529
//
// PORT: SOURCE P30-P37.agc:530
//		2DEC	2.7777777 E-3	# 1
// PORT: Fixed ROM slots 28809 28810.
    28809, 90, 28810, 16748,
// PORT: SOURCE P30-P37.agc:531
//
// PORT: SOURCE P30-P37.agc:532
//CK1K2		2DEC	6.6666666 E-3	# 2.4
// PORT: Fixed ROM slots 28811 28812.
    28811, 218, 28812, 7428,
// PORT: SOURCE P30-P37.agc:533
//
// PORT: SOURCE P30-P37.agc:534
//		2DEC	0		# 0
// PORT: Fixed ROM slots 28813 28814.
    28813, 0, 28814, 0,
// PORT: SOURCE P30-P37.agc:535
//
// PORT: SOURCE P30-P37.agc:536
//		2DEC*	-1.86909989 E-5 B7* 	# -.443
// PORT: Fixed ROM slots 28815 28816.
    28815, 65456, 28816, 59050,
// PORT: SOURCE P30-P37.agc:537
//
// PORT: SOURCE P30-P37.agc:538
//		2DEC	0
// PORT: Fixed ROM slots 28817 28818.
    28817, 0, 28818, 0,
// PORT: SOURCE P30-P37.agc:539
//
// PORT: SOURCE P30-P37.agc:540
//		2DEC*	1.11639691 E-3 B7*	# .001225
// PORT: Fixed ROM slots 28819 28820.
    28819, 4682, 28820, 8324,
// PORT: SOURCE P30-P37.agc:541
//
// PORT: SOURCE P30-P37.agc:542
//		2DEC*	9.56911636 E-4 B7*	# .00105
// PORT: Fixed ROM slots 28821 28822.
    28821, 4012, 28822, 25858,
// PORT: SOURCE P30-P37.agc:543
//
// PORT: SOURCE P30-P37.agc:544
//YK1K2		2DEC*	2.59733157 E-4 B7*	# 	.000285
// PORT: Fixed ROM slots 28823 28824.
    28823, 1088, 28824, 22934,
// PORT: SOURCE P30-P37.agc:545
//
// PORT: SOURCE P30-P37.agc:546
//V(400)		2DEC	1.2192 B-7
// PORT: Fixed ROM slots 28825 28826.
    28825, 312, 28826, 1888,
// PORT: SOURCE P30-P37.agc:547
//
// PORT: SOURCE P30-P37.agc:548
//V(28K)		2DEC	85.344 B-7
// PORT: Fixed ROM slots 28827 28828.
    28827, 21848, 28828, 1048,
// PORT: SOURCE P30-P37.agc:549
//
// PORT: SOURCE P30-P37.agc:550
//V(3K)		2DEC	9.144 B-7
// PORT: Fixed ROM slots 28829 28830.
    28829, 2340, 28830, 14156,
// PORT: SOURCE P30-P37.agc:551
//
// PORT: SOURCE P30-P37.agc:552
//V(24K)		2DEC	73.152 B-7
// PORT: Fixed ROM slots 28831 28832.
    28831, 18726, 28832, 14942,
// PORT: SOURCE P30-P37.agc:553
//
// PORT: SOURCE P30-P37.agc:554
//		2DEC	85.344 B-7
// PORT: Fixed ROM slots 28833 28834.
    28833, 21848, 28834, 1048,
// PORT: SOURCE P30-P37.agc:555
//
// PORT: SOURCE P30-P37.agc:556
//V(32K)		2DEC	97.536 B-7
// PORT: Fixed ROM slots 28835 28836.
    28835, 24968, 28836, 19922,
// PORT: SOURCE P30-P37.agc:557
//
// PORT: SOURCE P30-P37.agc:558
//V(4K)		2DEC	12.192 B-7
// PORT: Fixed ROM slots 28837 28838.
    28837, 3120, 28838, 18874,
// PORT: SOURCE P30-P37.agc:559
//
// PORT: SOURCE P30-P37.agc:560
//V(21K)		2DEC	64.000 B-7
// PORT: Fixed ROM slots 28839 28840.
    28839, 16384, 28840, 0,
// PORT: SOURCE P30-P37.agc:561
//
// PORT: SOURCE P30-P37.agc:562
//TLESS26		2DEC*	5.70146688 E7 B-35*	# 8660PHI/V
// PORT: Fixed ROM slots 28841 28842.
    28841, 54, 28842, 6118,
// PORT: SOURCE P30-P37.agc:563
//
// PORT: SOURCE P30-P37.agc:564
//TGR26CON	2DEC	7.2 E5 B-28	# PHI/3
// PORT: Fixed ROM slots 28843 28844.
    28843, 86, 28844, 30976,
// PORT: SOURCE P30-P37.agc:565
//
// PORT: SOURCE P30-P37.agc:566
//V(26K)		2DEC	79.248 B-7	# 26000
// PORT: Fixed ROM slots 28845 28846.
    28845, 20286, 28846, 24380,
// PORT: SOURCE P30-P37.agc:567
//
// PORT: SOURCE P30-P37.agc:568
//# Page 647
// PORT: SOURCE P30-P37.agc:569
//
// PORT: SOURCE P30-P37.agc:570
//X1CON		DEC	10
// PORT: Fixed ROM slots 28847.
    28847, 20,
// PORT: SOURCE P30-P37.agc:571
//
// PORT: SOURCE P30-P37.agc:572
//		DEC	8
// PORT: Fixed ROM slots 28848.
    28848, 16,
// PORT: SOURCE P30-P37.agc:573
//
// PORT: SOURCE P30-P37.agc:574
//		DEC	6
// PORT: Fixed ROM slots 28849.
    28849, 12
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4503–4505.
function agcAotUnit169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4503 {
// PORT: SOURCE P30-P37.agc:575
//					# <<<< TABLE IS INDEXED.  KEEP IN ORDER >>>>
// PORT: SOURCE P30-P37.agc:576
//					#		ABOVE
// PORT: SOURCE P30-P37.agc:577
//# Page 648
// PORT: SOURCE P30-P37.agc:578
//# ***** AVFLAGA/P *****
// PORT: SOURCE P30-P37.agc:579
//
// PORT: SOURCE P30-P37.agc:580
//# SUBROUTINES USED
// PORT: SOURCE P30-P37.agc:581
//
// PORT: SOURCE P30-P37.agc:582
//#	UPFLAG
// PORT: SOURCE P30-P37.agc:583
//#	DOWNFLAG
// PORT: SOURCE P30-P37.agc:584
//		SETLOC	P30SUBS
// PORT: SOURCE P30-P37.agc:585
//		BANK
// PORT: SOURCE P30-P37.agc:586
//		EBANK=	SUBEXIT
// PORT: SOURCE P30-P37.agc:587
//AVFLAGA		EXTEND			# AVFLAG = CSM
// PORT: Fixed ROM slots 4503.
        if slot <> 4503 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4504 {
// PORT: SOURCE P30-P37.agc:588
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 4504.
            if slot <> 4504 or instruction <> 10232 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1016, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:589
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 4505.
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
// PORT: SOURCE P30-P37.agc:590
//		ADRES	AVFLAG		# BIT 5 FLAG 2
// PORT: Fixed ROM slots 4506.
    4506, 80
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4507–4516.
function agcAotUnit170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4511 {
        if slot <= 4508 {
            if slot <= 4507 {
// PORT: SOURCE P30-P37.agc:591
//		CAF	EBANK7
// PORT: Fixed ROM slots 4507.
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
// PORT: SOURCE P30-P37.agc:592
//		TS	EBANK
// PORT: Fixed ROM slots 4508.
                if slot <> 4508 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4509 {
// PORT: SOURCE P30-P37.agc:593
//		EBANK=	ECSTEER
// PORT: SOURCE P30-P37.agc:594
//		CAF	BIT13
// PORT: Fixed ROM slots 4509.
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
// PORT: SOURCE P30-P37.agc:595
//		TS	ECSTEER		# SET ECSTEER = 1
// PORT: Fixed ROM slots 4510.
                    if slot <> 4510 or instruction <> 23316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23316, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P30-P37.agc:596
//		CAF	EBANK4
// PORT: Fixed ROM slots 4511.
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
// PORT: SOURCE P30-P37.agc:597
//		TS	EBANK
// PORT: Fixed ROM slots 4512.
                if slot <> 4512 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P30-P37.agc:598
//		EBANK=	SUBEXIT
// PORT: SOURCE P30-P37.agc:599
//		TC	SUBEXIT
// PORT: Fixed ROM slots 4513.
                if slot <> 4513 or instruction <> 1016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4514 {
// PORT: SOURCE P30-P37.agc:600
//AVFLAGP		EXTEND			# AVFLAG = LEM
// PORT: Fixed ROM slots 4514.
                if slot <> 4514 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4515 {
// PORT: SOURCE P30-P37.agc:601
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 4515.
                    if slot <> 4515 or instruction <> 10232 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 1016, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P30-P37.agc:602
//		TC	UPFLAG
// PORT: Fixed ROM slots 4516.
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
// PORT: SOURCE P30-P37.agc:603
//		ADRES	AVFLAG		# BIT 5 FLAG 2
// PORT: Fixed ROM slots 4517.
    4517, 80
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4518–4521.
function agcAotUnit171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4519 {
        if slot <= 4518 {
// PORT: SOURCE P30-P37.agc:604
//		TC	SUBEXIT
// PORT: Fixed ROM slots 4518.
            if slot <> 4518 or instruction <> 1016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:605
//P20FLGON	EXTEND
// PORT: Fixed ROM slots 4519.
            if slot <> 4519 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4520 {
// PORT: SOURCE P30-P37.agc:606
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 4520.
            if slot <> 4520 or instruction <> 10232 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1016, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P30-P37.agc:607
//		TC	UPFLAG
// PORT: Fixed ROM slots 4521.
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
// PORT: SOURCE P30-P37.agc:608
//		ADRES	TRACKFLG
// PORT: Fixed ROM slots 4522.
    4522, 50
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4523–4523.
function agcAotUnit172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:609
//		TC	UPFLAG
// PORT: Fixed ROM slots 4523.
    if slot <> 4523 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[172] to agcAotUnit172@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P30-P37.agc:610
//		ADRES	UPDATFLG
// PORT: Fixed ROM slots 4524.
    4524, 46
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4525–4525.
function agcAotUnit173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P30-P37.agc:611
//		TC	SUBEXIT		# DP	B4
// PORT: Fixed ROM slots 4525.
    if slot <> 4525 or instruction <> 1016 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1016, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[173] to agcAotUnit173@.

