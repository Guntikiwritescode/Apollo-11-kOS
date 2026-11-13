// R60_62.agc
// bank 26, slots 24659-24665
function agcAotUnit1629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24661 {
        if slot <= 24659 {
// R60_62.agc:1
//# Copyright:	Public domain.
// R60_62.agc:2
//# Filename:	R60_R62.agc
// R60_62.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// R60_62.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// R60_62.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// R60_62.agc:6
//# Assembler:	yaYUL
// R60_62.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// R60_62.agc:8
//# Website:	www.ibiblio.org/apollo.
// R60_62.agc:9
//# Pages:	472-485
// R60_62.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// R60_62.agc:11
//#				Luminary131 file, using page
// R60_62.agc:12
//#				images from Luminary 1A.
// R60_62.agc:13
//#
// R60_62.agc:14
//# This source code has been transcribed or otherwise adapted from
// R60_62.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// R60_62.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// R60_62.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// R60_62.agc:18
//# in storage size and consequent reduction in image quality as well) are
// R60_62.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// R60_62.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// R60_62.agc:21
//# about getting access to the (much) higher-quality images which Paul
// R60_62.agc:22
//# actually created.
// R60_62.agc:23
//#
// R60_62.agc:24
//# Notations on the hardcopy document read, in part:
// R60_62.agc:25
//#
// R60_62.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// R60_62.agc:27
//#	16:27 JULY 14, 1969
// R60_62.agc:28
//
// R60_62.agc:29
//# Page 472
// R60_62.agc:30
//# MOD NO: 0			DATE: 1 MAY 1968
// R60_62.agc:31
//# MOD BY: DIGITAL DEVEL GROUP	LOG SECTION R60,R62
// R60_62.agc:32
//#
// R60_62.agc:33
//# FUNCTIONAL DESCRIPTION:
// R60_62.agc:34
//#
// R60_62.agc:35
//# CALLED AS A GENERAL SUBROUTINE TO MANEUVER THE LM TO A SPECIFIED
// R60_62.agc:36
//# ATTITUDE.
// R60_62.agc:37
//#
// R60_62.agc:38
//# 1. IF THE 3-AXIS FLAG IS NOT SET THE FINAL CDU ANGLES ARE
// R60_62.agc:39
//# CALCULATED (VECPOINT).
// R60_62.agc:40
//#
// R60_62.agc:41
//# 2. THE FDAI BALL ANGLES (NOUN 18) ARE CALCULATED (BALLANGS).
// R60_62.agc:42
//#
// R60_62.agc:43
//# 3. REQUEST FLASHING DISPLAY V50 N18 PLEASE PERFORM AUTO MANEUVER.
// R60_62.agc:44
//#
// R60_62.agc:45
//# 4. IF PRIORITY DISPLAY FLAG IS SET DO A PHASECHANGE. THEN AWAIT
// R60_62.agc:46
//# ASTRONAUT RESPONSE.
// R60_62.agc:47
//#
// R60_62.agc:48
//# 5. DISPLAY RESPONSE RETURNS:
// R60_62.agc:49
//#
// R60_62.agc:50
//#     A. ENTER - RESET 3-AXIS FLAG AND RETURN TO CLIENT.
// R60_62.agc:51
//#
// R60_62.agc:52
//#     B. TERMINATE - IF IN P00 GO TO STEP 5A. OTHERWISE CHECK IF R61 IS
// R60_62.agc:53
//#	 THE CALLING PROGRAM. IF IN R61 AN EXIT IS MADE TO GOTOV56. IF
// R60_62.agc:54
//#	 NOT IN R61 AN EXIT IS DONE VIA GOTOPOOH.
// R60_62.agc:55
//#
// R60_62.agc:56
//#     C. PROCEED - CONTINUE WITH PROGRAM AT STEP 6.
// R60_62.agc:57
//#
// R60_62.agc:58
//# 6. IF THE 3-AXISFLAG IS NOT SET, THE FINAL CDU ANGLES ARE CALCULATED
// R60_62.agc:59
//#    (VECPOINT).
// R60_62.agc:60
//#
// R60_62.agc:61
//# 7. THE FDAI BALL ANGLES (NOUN 18) ARE CALCULATED (BALLANGS).
// R60_62.agc:62
//#
// R60_62.agc:63
//# 8. IF THE G+N SWITCH IS NOT SET GO BACK TO STEP 3.
// R60_62.agc:64
//#
// R60_62.agc:65
//# 9. IF THE AUTO SWITCH IS NOT SET GO BACK TO STEP 3.
// R60_62.agc:66
//#
// R60_62.agc:67
//# 10. NONFLASHING DISPLAY V06N18 (FDAI ANGLES).
// R60_62.agc:68
//#
// R60_62.agc:69
//# 11. DO A PHASECHANGE.
// R60_62.agc:70
//#
// R60_62.agc:71
//# 12. DO A MANEUVER CALCULATION AND ICDU DRIVE ROUTINE TO ACHIEVE FINAL
// R60_62.agc:72
//#
// R60_62.agc:73
//#     GIMBAL ANGLES (GOMANUR).
// R60_62.agc:74
//# 13. AT END OF MANEUVER GO TO STEP 3.
// R60_62.agc:75
//#
// R60_62.agc:76
//#	   IF SATISFACTORY MANEUVER STEP 5A EXITS R60.
// R60_62.agc:77
//#	   FOR FURTHER ADJUSTMENT OF THE VEHICLE ATTITUDE ABOUT THE
// R60_62.agc:78
//#	   DESIRED VECTOR, THE ROUTINE MAY BE PERFORMED AGAIN STARTING AT
// R60_62.agc:79
//# Page 473
// R60_62.agc:80
//#	   STEP 5C.
// R60_62.agc:81
//#
// R60_62.agc:82
//# CALLING SEQUENCE:  TC BANKCALL
// R60_62.agc:83
//#		     CADR R60LEM
// R60_62.agc:84
//#
// R60_62.agc:85
//# ERASABLE INITIALIZATION REQUIRED : SCAXIS, POINTVSM (FOR VECPOINT)
// R60_62.agc:86
//#				     3AXISFLG.
// R60_62.agc:87
//#
// R60_62.agc:88
//# SUBROUTINES CALLED: VECPOINT, BALLANGS, GOPERF2R, LINUS, GODSPER,
// R60_62.agc:89
//#		     GOMANUR, DOWNFLAG, PHASCHNG, UPFLAG
// R60_62.agc:90
//#
// R60_62.agc:91
//# NORMAL EXIT MODES: CAE TEMPR60   (CALLERS RETURN ADDRESS)
// R60_62.agc:92
//#		     TC  BANKJUMP
// R60_62.agc:93
//#
// R60_62.agc:94
//# ALARMS: NONE
// R60_62.agc:95
//#
// R60_62.agc:96
//# OUTPUT: NONE
// R60_62.agc:97
//#
// R60_62.agc:98
//# DEBRIS: CPHI, CTHETA, CPSI, 3AXISFLG, TBASE2
// R60_62.agc:99
//
// R60_62.agc:100
//		BANK	34
// R60_62.agc:101
//		SETLOC	MANUVER
// R60_62.agc:102
//		BANK
// R60_62.agc:103
//
// R60_62.agc:104
//		EBANK=	TEMPR60
// R60_62.agc:105
//
// R60_62.agc:106
//		COUNT*	$$/R06
// R60_62.agc:107
//R60LEM		TC	MAKECADR
// slot 24659
            if slot <> 24659 or instruction <> 2469 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2469, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24660 {
// R60_62.agc:108
//		TS	TEMPR60
// slot 24660
                if slot <> 24660 or instruction <> 23156 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23156, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:109
//
// R60_62.agc:110
//REDOMANN	CAF	3AXISBIT
// slot 24661
                if slot <> 24661 or instruction <> 14822 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24663 {
            if slot <= 24662 {
// R60_62.agc:111
//		MASK	FLAGWRD5	# IS 3-AXIS FLAG SET
// slot 24662
                if slot <> 24662 or instruction <> 28737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:112
//		CCS	A
// slot 24663
                if slot <> 24663 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24664 {
// R60_62.agc:113
//		TCF	TOBALL		# YES
// slot 24664
                if slot <> 24664 or instruction <> 5214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:114
//		TC	INTPRET
// slot 24665
                if slot <> 24665 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1629] to agcAotUnit1629@.

agcAotInstallSourceRope(list(
// R60_62.agc:115
//		CALL
// slot 24666
    24666, 65320,
// R60_62.agc:116
//			VECPOINT	# TO COMPUTE FINAL ANGLES
// slot 24667
    24667, 47168,
// R60_62.agc:117
//		STORE	CPHI		# STORE FINAL ANGLES - CPHI,CTHETA,CPSI
// slot 24668
    24668, 420,
// R60_62.agc:118
//		EXIT
// slot 24669
    24669, 65532
)).

// bank 26, slots 24670-24670
function agcAotUnit1630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R60_62.agc:119
//
// R60_62.agc:120
//TOBALL		TC	BANKCALL
// slot 24670
    if slot <> 24670 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1630] to agcAotUnit1630@.

agcAotInstallSourceRope(list(
// R60_62.agc:121
//		CADR	BALLANGS	# TO CONVERT ANGLES TO FDAI
// slot 24671
    24671, 45420
)).

// bank 26, slots 24672-24673
function agcAotUnit1631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24672 {
// R60_62.agc:122
//TOBALLA		CAF	V06N18
// slot 24672
        if slot <> 24672 or instruction <> 13484 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1196), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:123
//		TC	BANKCALL
// slot 24673
        if slot <> 24673 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1631] to agcAotUnit1631@.

agcAotInstallSourceRope(list(
// R60_62.agc:124
//		CADR	GOPERF2R	# DISPLAY PLEASE PERFORM AUTO MANEUVER
// slot 24674
    24674, 17296
)).

// bank 26, slots 24675-24684
function agcAotUnit1632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24679 {
        if slot <= 24676 {
            if slot <= 24675 {
// R60_62.agc:125
//		TC	R61TEST
// slot 24675
                if slot <> 24675 or instruction <> 1186 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1186, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:126
//		TC	REDOMANC	# PROCEED
// slot 24676
                if slot <> 24676 or instruction <> 1128 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1128, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24677 {
// R60_62.agc:127
//		TC	ENDMANU1	# ENTER I.E. FINISHED WITH R60
// slot 24677
                if slot <> 24677 or instruction <> 1149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1149, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24678 {
// R60_62.agc:128
//# Page 474
// R60_62.agc:129
//		TC	CHKLINUS	# TO CHECK FOR PRIORITY DISPLAYS
// slot 24678
                    if slot <> 24678 or instruction <> 1153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1153, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:130
//		TC	ENDOFJOB
// slot 24679
                    if slot <> 24679 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24681 {
            if slot <= 24680 {
// R60_62.agc:131
//
// R60_62.agc:132
//REDOMANC	CAF	3AXISBIT
// slot 24680
                if slot <> 24680 or instruction <> 14822 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:133
//		MASK	FLAGWRD5	# IS 3-AXIS FLAG SET
// slot 24681
                if slot <> 24681 or instruction <> 28737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24682 {
// R60_62.agc:134
//		CCS	A
// slot 24682
                if slot <> 24682 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24683 {
// R60_62.agc:135
//		TCF	TOBALLC		# YES
// slot 24683
                    if slot <> 24683 or instruction <> 5233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5233, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:136
//		TC	INTPRET
// slot 24684
                    if slot <> 24684 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1632] to agcAotUnit1632@.

agcAotInstallSourceRope(list(
// R60_62.agc:137
//		CALL
// slot 24685
    24685, 65320,
// R60_62.agc:138
//			VECPOINT	# TO COMPUTE FINAL ANGLES
// slot 24686
    24686, 47168,
// R60_62.agc:139
//		STORE	CPHI		# STORE ANGLES
// slot 24687
    24687, 420,
// R60_62.agc:140
//		EXIT
// slot 24688
    24688, 65532
)).

// bank 26, slots 24689-24689
function agcAotUnit1633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R60_62.agc:141
//
// R60_62.agc:142
//TOBALLC		TC	BANKCALL
// slot 24689
    if slot <> 24689 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1633] to agcAotUnit1633@.

agcAotInstallSourceRope(list(
// R60_62.agc:143
//		CADR	BALLANGS	# TO CONVERT ANGLES TO FDAI
// slot 24690
    24690, 45420
)).

// bank 26, slots 24691-24695
function agcAotUnit1634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24692 {
        if slot <= 24691 {
// R60_62.agc:144
//		TC	G+N,AUTO	# CHECK AUTO MODE
// slot 24691
            if slot <> 24691 or instruction <> 1197 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1197, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R60_62.agc:145
//		CCS	A
// slot 24692
            if slot <> 24692 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24693 {
// R60_62.agc:146
//		TCF	TOBALLA		# NOT AUTO, GO REREQUEST AUTO MANEUVER.
// slot 24693
            if slot <> 24693 or instruction <> 5216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5216, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24694 {
// R60_62.agc:147
//
// R60_62.agc:148
//AUTOMANV	CAF	V06N18		# STATIC DISPLAY DURING AUTO MANEUVER
// slot 24694
                if slot <> 24694 or instruction <> 13484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1196), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:149
//		TC	BANKCALL
// slot 24695
                if slot <> 24695 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1634] to agcAotUnit1634@.

agcAotInstallSourceRope(list(
// R60_62.agc:150
//		CADR	GODSPR
// slot 24696
    24696, 16978
)).

// bank 26, slots 24697-24698
function agcAotUnit1635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24697 {
// R60_62.agc:151
//		TC	CHKLINUS	# TO CHECK FOR PRIORITY DISPLAYS
// slot 24697
        if slot <> 24697 or instruction <> 1153 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1153, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:152
//
// R60_62.agc:153
//STARTMNV	TC	BANKCALL	# PERFORM MANEUVER VIA KALCMANU
// slot 24698
        if slot <> 24698 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1635] to agcAotUnit1635@.

agcAotInstallSourceRope(list(
// R60_62.agc:154
//		CADR	GOMANUR
// slot 24699
    24699, 16336
)).

// bank 26, slots 24700-24701
function agcAotUnit1636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24700 {
// R60_62.agc:155
//
// R60_62.agc:156
//ENDMANUV	TCF	TOBALLA		# FINISHED MANEUVER.
// slot 24700
        if slot <> 24700 or instruction <> 5216 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5216, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:157
//ENDMANU1	TC	DOWNFLAG	# RESET 3-AXIS FLAG
// slot 24701
        if slot <> 24701 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1636] to agcAotUnit1636@.

agcAotInstallSourceRope(list(
// R60_62.agc:158
//		ADRES	3AXISFLG
// slot 24702
    24702, 168
)).

// bank 26, slots 24703-24714
function agcAotUnit1637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24708 {
        if slot <= 24705 {
            if slot <= 24703 {
// R60_62.agc:159
//		CAE	TEMPR60
// slot 24703
                if slot <> 24703 or instruction <> 12916 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 628).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24704 {
// R60_62.agc:160
//		TC	BANKJUMP
// slot 24704
                    if slot <> 24704 or instruction <> 2464 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2464, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:161
//
// R60_62.agc:162
//CHKLINUS	CS	FLAGWRD4
// slot 24705
                    if slot <> 24705 or instruction <> 16448 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 64).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24706 {
// R60_62.agc:163
//		MASK	PDSPFBIT	# IS PRIORITY DISPLAY FLAG SET?
// slot 24706
                if slot <> 24706 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
                if slot <= 24707 {
// R60_62.agc:164
//		CCS	A
// slot 24707
                    if slot <> 24707 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:165
//		TC	Q		# NO - EXIT
// slot 24708
                    if slot <> 24708 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24711 {
            if slot <= 24709 {
// R60_62.agc:166
//		CA	Q
// slot 24709
                if slot <> 24709 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24710 {
// R60_62.agc:167
//		TS	MPAC +2		# SAVE RETURN
// slot 24710
                    if slot <> 24710 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:168
//		CS	THREE		# OBTAIN LOCATION FOR RESTART
// slot 24711
                    if slot <> 24711 or instruction <> 19621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24712 {
// R60_62.agc:169
//		AD	BUF2		# HOLDS Q OF LAST DISPLAY
// slot 24712
                if slot <> 24712 or instruction <> 24667 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24713 {
// R60_62.agc:170
//		TS	TBASE2
// slot 24713
                    if slot <> 24713 or instruction <> 23085 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23085, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:171
//
// R60_62.agc:172
//		TC	PHASCHNG
// slot 24714
                    if slot <> 24714 or instruction <> 2795 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2795, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1637] to agcAotUnit1637@.

agcAotInstallSourceRope(list(
// R60_62.agc:173
//		OCT	00132
// slot 24715
    24715, 180
)).

// bank 26, slots 24716-24729
function agcAotUnit1638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24722 {
        if slot <= 24718 {
            if slot <= 24716 {
// R60_62.agc:174
//
// R60_62.agc:175
//		CAF	BIT7
// slot 24716
                if slot <> 24716 or instruction <> 14821 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24717 {
// R60_62.agc:176
//		TC	LINUS		# GO SET BITS FOR PRIORITY DISPLAY
// slot 24717
                    if slot <> 24717 or instruction <> 2868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:177
//		TC	MPAC +2
// slot 24718
                    if slot <> 24718 or instruction <> 110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 110, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24720 {
                if slot <= 24719 {
// R60_62.agc:178
//
// R60_62.agc:179
//# Page 475
// R60_62.agc:180
//RELINUS		CAF	PRIO26		# RESTORE ORIGINAL PRIORITY
// slot 24719
                    if slot <> 24719 or instruction <> 16332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:181
//		TC	PRIOCHNG
// slot 24720
                    if slot <> 24720 or instruction <> 2662 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2662, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24721 {
// R60_62.agc:182
//
// R60_62.agc:183
//		CAF	TRACKBIT	# DON'T CONTINUE R60 UNLESS TRACKFLAG ON.
// slot 24721
                    if slot <> 24721 or instruction <> 14823 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:184
//		MASK	FLAGWRD1
// slot 24722
                    if slot <> 24722 or instruction <> 28733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24725 {
            if slot <= 24723 {
// R60_62.agc:185
//		CCS	A
// slot 24723
                if slot <> 24723 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24724 {
// R60_62.agc:186
//		TCF	RER60
// slot 24724
                    if slot <> 24724 or instruction <> 5279 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5279, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:187
//
// R60_62.agc:188
//		CAF	RNDVZBIT	# IS IT P20?
// slot 24725
                    if slot <> 24725 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24727 {
                if slot <= 24726 {
// R60_62.agc:189
//		MASK	FLAGWRD0
// slot 24726
                    if slot <> 24726 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:190
//		CCS	A
// slot 24727
                    if slot <> 24727 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24728 {
// R60_62.agc:191
//		TC	+4		# YES
// slot 24728
                    if slot <> 24728 or instruction <> 1180 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1180, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:192
//		TC	PHASCHNG	# NO, MUST BE P25, SET 2.11 SPOT
// slot 24729
                    if slot <> 24729 or instruction <> 2795 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2795, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1638] to agcAotUnit1638@.

agcAotInstallSourceRope(list(
// R60_62.agc:193
//		OCT	40112
// slot 24730
    24730, 32916
)).

// bank 26, slots 24731-24732
function agcAotUnit1639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24731 {
// R60_62.agc:194
//
// R60_62.agc:195
//		TC	ENDOFJOB
// slot 24731
        if slot <> 24731 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:196
//
// R60_62.agc:197
//		TC	PHASCHNG	# SET 2.7 SPOT FOR P20
// slot 24732
        if slot <> 24732 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1639] to agcAotUnit1639@.

agcAotInstallSourceRope(list(
// R60_62.agc:198
//		OCT	40072
// slot 24733
    24733, 32884
)).

// bank 26, slots 24734-24735
function agcAotUnit1640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24734 {
// R60_62.agc:199
//
// R60_62.agc:200
//		TC 	ENDOFJOB
// slot 24734
        if slot <> 24734 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:201
//
// R60_62.agc:202
//RER60		TC	UPFLAG		# SET PRIO DISPLAY FLAG AFTER RESTART
// slot 24735
        if slot <> 24735 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1640] to agcAotUnit1640@.

agcAotInstallSourceRope(list(
// R60_62.agc:203
//		ADRES	PDSPFLAG
// slot 24736
    24736, 126
)).

// bank 26, slots 24737-24745
function agcAotUnit1641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24740 {
        if slot <= 24738 {
            if slot <= 24737 {
// R60_62.agc:204
//
// R60_62.agc:205
//		TC	TBASE2
// slot 24737
                if slot <> 24737 or instruction <> 557 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 557, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:206
//
// R60_62.agc:207
//R61TEST		CA	MODREG		# IF WE ARE IN P00 IT MUST BE V49 OR V89
// slot 24738
                if slot <> 24738 or instruction <> 12809 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24739 {
// R60_62.agc:208
//		EXTEND
// slot 24739
                if slot <> 24739 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:209
//		BZF	ENDMANU1	# THUS WE GO TO ENDEXT VIA USER
// slot 24740
                if slot <> 24740 or instruction <> 5245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5245, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24742 {
            if slot <= 24741 {
// R60_62.agc:210
//
// R60_62.agc:211
//		CA	FLAGWRD4	# ARE WE IN R61  (P20 OR P25)
// slot 24741
                if slot <> 24741 or instruction <> 12352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 64).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R60_62.agc:212
//		MASK	PDSPFBIT
// slot 24742
                if slot <> 24742 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 24743 {
// R60_62.agc:213
//		EXTEND
// slot 24743
                if slot <> 24743 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24744 {
// R60_62.agc:214
//		BZF	GOTOPOOH	# NO
// slot 24744
                    if slot <> 24744 or instruction <> 7169 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7169, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:215
//		TC	GOTOV56		# YES
// slot 24745
                    if slot <> 24745 or instruction <> 3090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1641] to agcAotUnit1641@.

agcAotInstallSourceRope(list(
// R60_62.agc:216
//
// R60_62.agc:217
//BIT14+7		OCT	20100
// slot 24746
    24746, 16512,
// R60_62.agc:218
//OCT203		OCT	203
// slot 24747
    24747, 262,
// R60_62.agc:219
//V06N18		VN	0618
// slot 24748
    24748, 1572
)).

// bank 26, slots 24749-24766
function agcAotUnit1642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24757 {
        if slot <= 24752 {
            if slot <= 24750 {
                if slot <= 24749 {
// R60_62.agc:220
//
// R60_62.agc:221
//# SUBROUTINE TO CHECK FOR G+N CONTROL. AUTO STABILIZATION
// R60_62.agc:222
//#
// R60_62.agc:223
//# RETURNS WITH C(A) = +  IF NOT SET FOR G+N, AUTO
// R60_62.agc:224
//# RETURNS WITH C(A) = +0 IF SWITCHES ARE SET
// R60_62.agc:225
//
// R60_62.agc:226
//G+N,AUTO	EXTEND
// slot 24749
                    if slot <> 24749 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:227
//		READ	CHAN30
// slot 24750
                    if slot <> 24750 or instruction <> 24 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 24, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24751 {
// R60_62.agc:228
//		MASK	BIT10
// slot 24751
                    if slot <> 24751 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:229
//		CCS	A
// slot 24752
                    if slot <> 24752 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24754 {
                if slot <= 24753 {
// R60_62.agc:230
//		TC	Q		# NOT IN G+N  C(A) = +
// slot 24753
                    if slot <> 24753 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:231
//# Page 476
// R60_62.agc:232
//ISITAUTO	EXTEND			# CHECK FOR AUTO MODE
// slot 24754
                    if slot <> 24754 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24755 {
// R60_62.agc:233
//		READ	CHAN31
// slot 24755
                    if slot <> 24755 or instruction <> 25 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24756 {
// R60_62.agc:234
//		MASK	BIT14
// slot 24756
                        if slot <> 24756 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            if fixedOperand = 8192 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// R60_62.agc:235
//		TC	Q		# (+) = NOT IN AUTO,  (+0) = AOK
// slot 24757
                        if slot <> 24757 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 24761 {
            if slot <= 24759 {
                if slot <= 24758 {
// R60_62.agc:236
//
// R60_62.agc:237
//# Page 477
// R60_62.agc:238
//# PROGRAM DESCRIPTION BALLANGS
// R60_62.agc:239
//# MOD NO.	  LOG SECTION  R60,R62
// R60_62.agc:240
//#
// R60_62.agc:241
//# WRITTEN BY RAMA M.AIYAWAR
// R60_62.agc:242
//# FUNCTIONAL DESCRIPTION
// R60_62.agc:243
//#
// R60_62.agc:244
//# COMPUTES LM FDAI BALL DISPLAY ANGLES
// R60_62.agc:245
//# CALLING SEQUENCE
// R60_62.agc:246
//#
// R60_62.agc:247
//#		TC	BALLANGS
// R60_62.agc:248
//# NORMAL EXIT MODE
// R60_62.agc:249
//#
// R60_62.agc:250
//#		TC	BALLEXIT	# (SAVED Q)
// R60_62.agc:251
//#
// R60_62.agc:252
//# ALARM OR EXIT MODE  NIL
// R60_62.agc:253
//# SUBROUTINES CALLED
// R60_62.agc:254
//#		CD*TR*G
// R60_62.agc:255
//#		ARCTAN
// R60_62.agc:256
//#
// R60_62.agc:257
//# INPUT
// R60_62.agc:258
//#
// R60_62.agc:259
//# CPHI,CTHETA,CPSI  ARE  THE ANGLES CORRESPONDING TO AOG,AIG,AMG. THEY ARE
// R60_62.agc:260
//# SP,2S COMPLIMENT SCALED TO HALF REVOLUTION.
// R60_62.agc:261
//# OUTPUT
// R60_62.agc:262
//#
// R60_62.agc:263
//# FDAIX,FDAIY,FDAIZ ARE THE REQUIRED BALL ANGLES SCALED TO HALF REVOLUTION
// R60_62.agc:264
//# SP,2S COMPLIMENT.
// R60_62.agc:265
//# THESE ANGLES WILL BE DISPLAYED AS DEGREES AND HUNDREDTHS. IN THE ORDER  ROLL, PITCH, YAW, USING NOUNS 18 & 19.
// R60_62.agc:266
//#
// R60_62.agc:267
//# ERASABLE INITIALIZATION REQUIRED
// R60_62.agc:268
//#
// R60_62.agc:269
//# CPHI,CTHETA,CPSI EACH A SP REGISTER
// R60_62.agc:270
//# DEBRIS
// R60_62.agc:271
//#
// R60_62.agc:272
//# A,L,Q,MPAC,SINCDU,COSCDU,PUSHLIS,BALLEXIT
// R60_62.agc:273
//#
// R60_62.agc:274
//#
// R60_62.agc:275
//# NOMENCLATURE:	 CPHI, CTHETA, & CPSI REPRESENT THE OUTER, INNER, & MIDDLE GIMBAL ANGLES, RESPECTIVELY; OR
// R60_62.agc:276
//# EQUIVALENTLY, CDUX, CDUY, & CDUZ.
// R60_62.agc:277
//#
// R60_62.agc:278
//# NOTE:  ARCTAN CHECKS FOR OVERFLOW AND SHOULD BE ABLE TO HANDLE ANY SINGULARITIES.
// R60_62.agc:279
//
// R60_62.agc:280
//		SETLOC	BAWLANGS
// R60_62.agc:281
//		BANK
// R60_62.agc:282
//
// R60_62.agc:283
//		COUNT*	$$/BALL
// R60_62.agc:284
//BALLANGS	TC	MAKECADR
// slot 24758
                    if slot <> 24758 or instruction <> 2469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:285
//		TS	BALLEXIT
// slot 24759
                    if slot <> 24759 or instruction <> 23266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23266, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24760 {
// R60_62.agc:286
//		CA	CPHI
// slot 24760
                    if slot <> 24760 or instruction <> 12497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 209).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:287
//# Page 478
// R60_62.agc:288
//		TS	CDUSPOT +4
// slot 24761
                    if slot <> 24761 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24763 {
                if slot <= 24762 {
// R60_62.agc:289
//		CA	CTHETA
// slot 24762
                    if slot <> 24762 or instruction <> 12498 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 210).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R60_62.agc:290
//		TS	CDUSPOT
// slot 24763
                    if slot <> 24763 or instruction <> 23030 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23030, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24764 {
// R60_62.agc:291
//		CA	CPSI
// slot 24764
                    if slot <> 24764 or instruction <> 12499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 211).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24765 {
// R60_62.agc:292
//		TS	CDUSPOT +2
// slot 24765
                        if slot <> 24765 or instruction <> 23032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// R60_62.agc:293
//
// R60_62.agc:294
//		TC	INTPRET
// slot 24766
                        if slot <> 24766 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1642] to agcAotUnit1642@.

agcAotInstallSourceRope(list(
// R60_62.agc:295
//		SETPD	CALL
// slot 24767
    24767, 37890,
// R60_62.agc:296
//			0D
// slot 24768
    24768, 2,
// R60_62.agc:297
//			CD*TR*G
// slot 24769
    24769, 40646,
// R60_62.agc:298
//
// R60_62.agc:299
//		DLOAD	DMP
// slot 24770
    24770, 34250,
// R60_62.agc:300
//			SINCDUX		# SIN (OGA)
// slot 24771
    24771, 966,
// R60_62.agc:301
//			COSCDUZ		# COS (MGA)
// slot 24772
    24772, 974,
// R60_62.agc:302
//
// R60_62.agc:303
//		SL1	DCOMP		# SCALE
// slot 24773
    24773, 48852,
// R60_62.agc:304
//		ARCSIN	PDDL		# YAW = ARCSIN(-SXCZ) INTO 0 PD
// slot 24774
    24774, 54716,
// R60_62.agc:305
//			SINCDUZ
// slot 24775
    24775, 962,
// R60_62.agc:306
//		STODL	SINTH		# (SINTH = 18D IN PD)
// slot 24776
    24776, 12326,
// R60_62.agc:307
//			COSCDUZ
// slot 24777
    24777, 974,
// R60_62.agc:308
//		DMP	SL1		# RESCALE
// slot 24778
    24778, 59914,
// R60_62.agc:309
//			COSCDUX
// slot 24779
    24779, 978,
// R60_62.agc:310
//		STCALL	COSTH		# (COSTH= 16D IN PD)
// slot 24780
    24780, 28706,
// R60_62.agc:311
//			ARCTAN
// slot 24781
    24781, 23184,
// R60_62.agc:312
//		PDDL	DMP		# ROLL = ARCTAN(SZ/CZCX) INTO 2 PD
// slot 24782
    24782, 34218,
// R60_62.agc:313
//			SINCDUZ
// slot 24783
    24783, 962,
// R60_62.agc:314
//			SINCDUX
// slot 24784
    24784, 966,
// R60_62.agc:315
//		SL2	PUSH		# SXSZ INTO 4 PD
// slot 24785
    24785, 34452,
// R60_62.agc:316
//		DMP	PDDL		# SXSZCY INTO 4 PD
// slot 24786
    24786, 54538,
// R60_62.agc:317
//			COSCDUY
// slot 24787
    24787, 970,
// R60_62.agc:318
//		DMP	PDDL		# SXSZSY INTO 6 PD
// slot 24788
    24788, 54538,
// R60_62.agc:319
//			SINCDUY
// slot 24789
    24789, 958,
// R60_62.agc:320
//			COSCDUX
// slot 24790
    24790, 978,
// R60_62.agc:321
//		DMP	SL1		# CXCY
// slot 24791
    24791, 59914,
// R60_62.agc:322
//			COSCDUY
// slot 24792
    24792, 970,
// R60_62.agc:323
//		DSU	STADR		# PULL UP FROM 6 PD
// slot 24793
    24793, 38442,
// R60_62.agc:324
//		STODL	COSTH		# COSTH = CXCY - SXSZSY
// slot 24794
    24794, 53212,
// R60_62.agc:325
//			SINCDUY
// slot 24795
    24795, 958,
// R60_62.agc:326
//		DMP	SL1
// slot 24796
    24796, 59914,
// R60_62.agc:327
//			COSCDUX		# CXSY
// slot 24797
    24797, 978,
// R60_62.agc:328
//		DAD	STADR		# PULL UP FROM 4 PD
// slot 24798
    24798, 38426,
// R60_62.agc:329
//		STCALL	SINTH		# SINTH = CXSY + SXSZCY
// slot 24799
    24799, 36824,
// R60_62.agc:330
//			ARCTAN		# RETURNS WITH D(MPAC) = PITCH
// slot 24800
    24800, 23184,
// R60_62.agc:331
//		PDDL	VDEF		# PITCH INTO 2 PD, ROLL INTO MPAC FROM 2PD
// slot 24801
    24801, 46762,
// R60_62.agc:332
//		RTB			# VDEF MAKES V(MPAC) = ROLL, PITCH, YAW
// slot 24802
    24802, 65336,
// R60_62.agc:333
//			V1STO2S
// slot 24803
    24803, 18208,
// R60_62.agc:334
//		STORE	FDAIX		# MODE IS TP
// slot 24804
    24804, 2506,
// R60_62.agc:335
//		EXIT
// slot 24805
    24805, 65532
)).

// bank 26, slots 24806-24807
function agcAotUnit1643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24806 {
// R60_62.agc:336
//
// R60_62.agc:337
//ENDBALL		CA	BALLEXIT
// slot 24806
        if slot <> 24806 or instruction <> 13026 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 738).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:338
//
// R60_62.agc:339
//# Page 479
// R60_62.agc:340
//		TC	BANKJUMP
// slot 24807
        if slot <> 24807 or instruction <> 2464 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2464, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1643] to agcAotUnit1643@.

agcAotInstallSourceRope(list(
// R60_62.agc:341
//
// R60_62.agc:342
//# Page 480
// R60_62.agc:343
//# PROGRAM DESCRIPTION - VECPOINT
// R60_62.agc:344
//#
// R60_62.agc:345
//#
// R60_62.agc:346
//#	   THIS INTERPRETIVE SUBROUTINE MAY BE USED TO POINT A SPACECRAFT AXIS IN A DESIRED DIRECTION.  THE AXIS
// R60_62.agc:347
//# TO BE POINTED MUST APPEAR AS A HALF UNIT DOUBLE PRECISION VECTOR IN SUCCESSIVE LOCATIONS OF ERASABLE MEMORY
// R60_62.agc:348
//# BEGINNING WITH THE LOCATION CALLED SCAXIS.  THE COMPONENTS OF THIS VECTOR ARE GIVEN IN SPACECRAFT COORDINATES.
// R60_62.agc:349
//# THE DIRECTION IN WHICH THIS AXIS IS TO BE POINTED MUST APPEAR AS A HALF UNIT DOUBLE PRECISION VECTOR IN
// R60_62.agc:350
//# SUCCESSIVE LOCATIONS OF ERASABLE MEMORY BEGINNING WITH THE ADDRESS CALLED POINTVSM.  THE COMPONENTS OF THIS
// R60_62.agc:351
//# VECTOR ARE GIVEN IN STABLE MEMBER COORDINATES.  WITH THIS INFORMATION VECPOINT COMPUTES A SET OF THREE GIMBAL
// R60_62.agc:352
//# ANGLES (2S COMPLEMENT) CORESPONDING TO THE CROSS-PRODUCT ROTATION BETWE EN SCAXIS AND POINTVSM AND STORES THEM
// R60_62.agc:353
//# IN T(MPAC) BEFORE RETURNING TO THE CALLER.
// R60_62.agc:354
//#	   THIS ROTATION, HOWEVER, MAY BRING THE S/C INTO GIMBAL LOCK.  WHEN POINTING A VECTOR IN THE Y-Z PLANE,
// R60_62.agc:355
//# THE TRANSPONDER AXIS, OR THE AOT FOR THE LEM, THE PROGRAM WILL CORRECT THIS PROBLEM BY ROTATING THE CROSS-
// R60_62.agc:356
//# PRODUCT ATTITUDE ABOUT POINTVSM BY A FIXED AMOUNT SUFFICIENT TO ROTATE THE DESIRED S/C ATTITUDE OUT OF GIMBAL
// R60_62.agc:357
//# LOCK.  IF THE AXIS TO BE POINTED IS MORE THAN 40.6 DEGREES BUT LESS THAN 60.5 DEG FROM THE +X (OR-X) AXIS,
// R60_62.agc:358
//# THE ADDITIONAL ROTATION TO AVOID GIMAL LOCK IS 35 DEGREES.  IF THE AXIS IS MORE THAN 60.5 DEGEES FROM +X (OR -X)
// R60_62.agc:359
//# THE ADDITIONAL ROTATION IS 35 DEGREES.  THE GIMBAL ANGLES CORRESPONDING TO THIS ATTITUDE ARE THEN COMPUTED AND
// R60_62.agc:360
//# STORED AS 2S COMPLIMENT ANGLES IN T(MPAC) BEFORE RETURNING TO THE CALLER.
// R60_62.agc:361
//#	   WHEN POINTING THE X-AXIS, OR THE THRUST VECTOR, OR ANY VECTOR WITHIN 40.6 DEG OF THE X-AXIS, VECPOINT
// R60_62.agc:362
//# CANNOT CORRECT FOR A CROSS-PRODUCT ROTATION INTO GIMBAL LOCK.  IN THIS CASE A PLATFORM REALIGNMENT WOULD BE
// R60_62.agc:363
//# REQUIRED TO POINT THE VECTOR IN THE DESIRED DIRECTION.  AT PRESENT NO INDICATION IS GIVEN FOR THIS SITUATION
// R60_62.agc:364
//# EXCEPT THAT THE FINAL MIDDLE GIMBAL ANGLE IN MPAC +2 IS GREATER THAN 59 DEGREES.
// R60_62.agc:365
//#
// R60_62.agc:366
//#	   CALLING SEQUENCE -
// R60_62.agc:367
//#	       1) LOAD SCAXIS, POINTVSM
// R60_62.agc:368
//#	       2) CALL
// R60_62.agc:369
//#		       VECPOINT
// R60_62.agc:370
//#
// R60_62.agc:371
//#	   RETURNS WITH
// R60_62.agc:372
//#
// R60_62.agc:373
//#	       1) DESIRED OUTER  GIMBAL ANGLE IN MPAC
// R60_62.agc:374
//#	       2) DESIRED INNER  GIMBAL ANGLE IN MPAC +1
// R60_62.agc:375
//#	       3) DESIRED MIDDLE GIMBAL ANGLE IN MPAC +2
// R60_62.agc:376
//#
// R60_62.agc:377
//#	   ERASABLES USED -
// R60_62.agc:378
//#
// R60_62.agc:379
//#	       1) SCAXIS	   6
// R60_62.agc:380
//#	       2) POINTVSM	   6
// R60_62.agc:381
//#	       3) MIS		  18
// R60_62.agc:382
//#	       4) DEL		  18
// R60_62.agc:383
//#	       5) COF		   6
// R60_62.agc:384
//#	       6) VECQTEMP	   1
// R60_62.agc:385
//#	       7) ALL OF VAC AREA 43
// R60_62.agc:386
//#
// R60_62.agc:387
//#			TOTAL	  99
// R60_62.agc:388
//
// R60_62.agc:389
//		SETLOC	VECPT
// R60_62.agc:390
//		BANK
// R60_62.agc:391
//# Page 481
// R60_62.agc:392
//		COUNT*	$$/VECPT
// R60_62.agc:393
//
// R60_62.agc:394
//		EBANK=	BCDU
// R60_62.agc:395
//
// R60_62.agc:396
//VECPNT1		STQ	BOV		# THIS ENTRY USES DESIRED CDUS
// slot 25626
    25626, 32800,
// R60_62.agc:397
//			VECQTEMP	# NOT PRESENT-ENTER WITH CDUD'S IN MPAC
// slot 25627
    25627, 3498,
// R60_62.agc:398
//			VECPNT2
// slot 25628
    25628, 47162,
// R60_62.agc:399
//VECPNT2		AXC,2	GOTO
// slot 25629
    25629, 43240,
// R60_62.agc:400
//			MIS
// slot 25630
    25630, 3404,
// R60_62.agc:401
//			STORANG
// slot 25631
    25631, 47180,
// R60_62.agc:402
//VECPOINT	STQ	BOV		# SAVE RETURN ADDRESS
// slot 25632
    25632, 32800,
// R60_62.agc:403
//			VECQTEMP
// slot 25633
    25633, 3498,
// R60_62.agc:404
//			VECLEAR		# AND CLEAR OVFIND
// slot 25634
    25634, 47174,
// R60_62.agc:405
//VECLEAR		AXC,2	RTB
// slot 25635
    25635, 40168,
// R60_62.agc:406
//			MIS		# READ THE PRESENT CDU ANGLES AND
// slot 25636
    25636, 3404,
// R60_62.agc:407
//			READCDUK	# STORE THEM IN PD25, 26, 27
// slot 25637
    25637, 37382,
// R60_62.agc:408
//STORANG		STCALL	25D
// slot 25638
    25638, 28724,
// R60_62.agc:409
//			CDUTODCM	# S/C AXES TO STABLE MEMBER AXES (MIS)
// slot 25639
    25639, 37392,
// R60_62.agc:410
//		VLOAD	VXM
// slot 25640
    25640, 50682,
// R60_62.agc:411
//			POINTVSM	# RESOLVE THE POINTING DIRECTION VF INTO
// slot 25641
    25641, 4086,
// R60_62.agc:412
//			MIS		# INITIAL S/C AXES ( VF = POINTVSM)
// slot 25642
    25642, 3406,
// R60_62.agc:413
//		UNIT
// slot 25643
    25643, 65372,
// R60_62.agc:414
//		STORE	28D
// slot 25644
    25644, 58,
// R60_62.agc:415
//					# PD 28 29 30 31 32 33
// R60_62.agc:416
//		VXV	UNIT		# TAKE THE CROSS PRODUCT VF X VI
// slot 25645
    25645, 44602,
// R60_62.agc:417
//			SCAXIS		# WHERE VI = SCAXIS
// slot 25646
    25646, 4074,
// R60_62.agc:418
//		BOV	VCOMP
// slot 25647
    25647, 48640,
// R60_62.agc:419
//			PICKAXIS
// slot 25648
    25648, 47344,
// R60_62.agc:420
//		STODL	COF		# CHECK MAGNITUDE
// slot 25649
    25649, 15730,
// R60_62.agc:421
//			36D		# OF CROSS PRODUCT
// slot 25650
    25650, 74,
// R60_62.agc:422
//		DSU	BMN		# VECTOR, IF LESS
// slot 25651
    25651, 41002,
// R60_62.agc:423
//			DPB-14		# THAN B-14 ASSUME
// slot 25652
    25652, 12818,
// R60_62.agc:424
//			PICKAXIS	# UNIT OPERATION
// slot 25653
    25653, 47344,
// R60_62.agc:425
//		VLOAD	DOT		#	   INVALID.
// slot 25654
    25654, 41466,
// R60_62.agc:426
//			SCAXIS
// slot 25655
    25655, 4074,
// R60_62.agc:427
//			28D
// slot 25656
    25656, 58,
// R60_62.agc:428
//		SL1	ARCCOS
// slot 25657
    25657, 54996,
// R60_62.agc:429
//COMPMATX	CALL			# NOW COMPUTE THE TRANSFORMATION FROM
// slot 25658
    25658, 65320,
// R60_62.agc:430
//			DELCOMP		# FINAL S/C AXES TO INITIAL S/C AXES  MFI
// slot 25659
    25659, 37550,
// R60_62.agc:431
//		AXC,1	AXC,2
// slot 25660
    25660, 62688,
// R60_62.agc:432
//			MIS		# COMPUTE THE TRANSFORMATION FROM FINAL
// slot 25661
    25661, 3404,
// R60_62.agc:433
//			KEL		# S/C AXES TO STABLE MEMBER AXES
// slot 25662
    25662, 2352,
// R60_62.agc:434
//		CALL			# MFS = MIS MFI
// slot 25663
    25663, 65320,
// R60_62.agc:435
//			MXM3		# (IN PD LIST)
// slot 25664
    25664, 37268,
// R60_62.agc:436
//
// R60_62.agc:437
//		DLOAD	ABS
// slot 25665
    25665, 42698,
// R60_62.agc:438
//			6		# MFS6 = SIN(CPSI)		       $2
// slot 25666
    25666, 14,
// R60_62.agc:439
//		DSU	BMN
// slot 25667
    25667, 41002,
// R60_62.agc:440
//			SINGIMLC	# = SIN(59 DEGS)		       $2
// slot 25668
    25668, 12796,
// R60_62.agc:441
//			FINDGIMB	# /CPSI/ LESS THAN 59 DEGS
// slot 25669
    25669, 47328,
// R60_62.agc:442
//# Page 482
// R60_62.agc:443
//					# I.E. DESIRED ATTITUDE NOT IN GIMBAL LOCK
// R60_62.agc:444
//
// R60_62.agc:445
//		DLOAD	ABS		# CHECK TO SEE IF WE ARE POINTING
// slot 25670
    25670, 42698,
// R60_62.agc:446
//			SCAXIS		# THE THRUST AXIS
// slot 25671
    25671, 4074,
// R60_62.agc:447
//		DSU	BPL
// slot 25672
    25672, 42026,
// R60_62.agc:448
//			SINVEC1		# SIN 49.4 DEGS			       $2
// slot 25673
    25673, 12800,
// R60_62.agc:449
//			FINDGIMB	# IF SO, WE ARE TRYING TO POINT IT INTO
// slot 25674
    25674, 47328,
// R60_62.agc:450
//		VLOAD			# GIMBAL LOCK, ABORT COULD GO HERE
// slot 25675
    25675, 65530,
// R60_62.agc:451
//		STADR
// slot 25676
    25676, 65324,
// R60_62.agc:452
//		STOVL	MIS +12D
// slot 25677
    25677, 41624,
// R60_62.agc:453
//		STADR			# STORE MFS (IN PD LIST) IN MIS
// slot 25678
    25678, 65324,
// R60_62.agc:454
//		STOVL	MIS +6
// slot 25679
    25679, 41636,
// R60_62.agc:455
//		STADR
// slot 25680
    25680, 65324,
// R60_62.agc:456
//		STOVL	MIS
// slot 25681
    25681, 41648,
// R60_62.agc:457
//			MIS +6		# INNER GIMBAL AXIS IN FINAL S/C AXES
// slot 25682
    25682, 3418,
// R60_62.agc:458
//		BPL	VCOMP		# LOCATE THE IG AXIS DIRECTION CLOSEST TO
// slot 25683
    25683, 48712,
// R60_62.agc:459
//			IGSAMEX		# FINAL X S/C AXIS
// slot 25684
    25684, 47274,
// R60_62.agc:460
//
// R60_62.agc:461
//IGSAMEX		VXV	BMN		# FIND THE SHORTEST WAY OF ROTATING THE
// slot 25685
    25685, 41018,
// R60_62.agc:462
//			SCAXIS		# S/C OUT OF GIMBAL LOCK BY A ROTATION
// slot 25686
    25686, 4074,
// R60_62.agc:463
//			U=SCAXIS	# ABOUT +- SCAXIS, I.E. IF (IG (SGN MFS3)
// slot 25687
    25687, 47288,
// R60_62.agc:464
//					# X SCAXIS . XF) LESS THAN 0, U = SCAXIS
// R60_62.agc:465
//					# OTHERWISE U = -SCAXIS
// R60_62.agc:466
//
// R60_62.agc:467
//		VLOAD	VCOMP
// slot 25688
    25688, 48890,
// R60_62.agc:468
//			SCAXIS
// slot 25689
    25689, 4074
)).

agcAotInstallSourceRope(list(
// R60_62.agc:469
//		STCALL	COF		# ROTATE ABOUT -SCAXIS
// slot 25690
    25690, 32114,
// R60_62.agc:470
//			CHEKAXIS
// slot 25691
    25691, 47294,
// R60_62.agc:471
//U=SCAXIS	VLOAD
// slot 25692
    25692, 65530,
// R60_62.agc:472
//			SCAXIS
// slot 25693
    25693, 4074,
// R60_62.agc:473
//		STORE	COF		# ROTATE ABOUT + SCAXIS
// slot 25694
    25694, 3442,
// R60_62.agc:474
//CHEKAXIS	DLOAD	ABS
// slot 25695
    25695, 42698,
// R60_62.agc:475
//			SCAXIS		# SEE IF WE ARE POINTING THE AOT
// slot 25696
    25696, 4074,
// R60_62.agc:476
//		DSU	BPL
// slot 25697
    25697, 42026,
// R60_62.agc:477
//			SINVEC2		# SIN 29.5 DEGS			       $2
// slot 25698
    25698, 12804,
// R60_62.agc:478
//			PICKANG1	# IF SO, ROTATE 50 DEGS ABOUT +- SCAXIS
// slot 25699
    25699, 47310,
// R60_62.agc:479
//		DLOAD	GOTO		# IF NOT, MUST BE POINTING THE TRANSPONDER
// slot 25700
    25700, 43210,
// R60_62.agc:480
//			VECANG2		# OR SOME VECTOR IN THE Y, OR Z PLANE
// slot 25701
    25701, 12812,
// R60_62.agc:481
//			COMPMFSN	# IN THIS CASE ROTATE 35 DEGS TO GET OUT
// slot 25702
    25702, 47314,
// R60_62.agc:482
//					# OF GIMBAL LOCK (VECANG2  $360)
// R60_62.agc:483
//PICKANG1	DLOAD
// slot 25703
    25703, 65482,
// R60_62.agc:484
//			VECANG1		# = 50 DEGS			     $ 360
// slot 25704
    25704, 12808,
// R60_62.agc:485
//COMPMFSN	CALL
// slot 25705
    25705, 65320,
// R60_62.agc:486
//			DELCOMP		# COMPUTE THE ROTATION ABOUT SCAXIS TO
// slot 25706
    25706, 37550,
// R60_62.agc:487
//		AXC,1	AXC,2		# BRING MFS OUT OF GIMBAL LOCK
// slot 25707
    25707, 62688,
// R60_62.agc:488
//			MIS
// slot 25708
    25708, 3404,
// R60_62.agc:489
//			KEL
// slot 25709
    25709, 2352,
// R60_62.agc:490
//		CALL			# COMPUTE THE NEW TRANSFORMATION FROM
// slot 25710
    25710, 65320,
// R60_62.agc:491
//			MXM3		# DESIRED S/C AXES TO STABLE MEMBER AXES
// slot 25711
    25711, 37268,
// R60_62.agc:492
//					# WHICH WILL ALIGN VI WITH VF AND AVOID
// R60_62.agc:493
//# Page 483
// R60_62.agc:494
//					# GIMBAL LOCK
// R60_62.agc:495
//FINDGIMB	AXC,1	CALL
// slot 25712
    25712, 38112,
// R60_62.agc:496
//			0		# EXTRACT THE COMMANDED CDU ANGLES FROM
// slot 25713
    25713, 0,
// R60_62.agc:497
//			DCMTOCDU	# THIS MATRIX
// slot 25714
    25714, 37720,
// R60_62.agc:498
//		RTB	SETPD
// slot 25715
    25715, 33080,
// R60_62.agc:499
//			V1STO2S		# CONVERT TO 2:S COMPLEMENT
// slot 25716
    25716, 18208,
// R60_62.agc:500
//			0
// slot 25717
    25717, 2,
// R60_62.agc:501
//		GOTO
// slot 25718
    25718, 65360,
// R60_62.agc:502
//			VECQTEMP	# RETURN TO CALLER
// slot 25719
    25719, 3498,
// R60_62.agc:503
//
// R60_62.agc:504
//PICKAXIS	VLOAD	DOT		# IF VF X VI = 0,  FIND VF . VI
// slot 25720
    25720, 41466,
// R60_62.agc:505
//			28D
// slot 25721
    25721, 58,
// R60_62.agc:506
//			SCAXIS
// slot 25722
    25722, 4074,
// R60_62.agc:507
//		BMN	TLOAD
// slot 25723
    25723, 59712,
// R60_62.agc:508
//			ROT180
// slot 25724
    25724, 45520,
// R60_62.agc:509
//			25D
// slot 25725
    25725, 52,
// R60_62.agc:510
//		GOTO			# IF VF = VI, CDU DESIRED = PRESENT CDU
// slot 25726
    25726, 65360,
// R60_62.agc:511
//			VECQTEMP	# PRESENT CDU ANGLES
// slot 25727
    25727, 3498,
// R60_62.agc:512
//
// R60_62.agc:513
//		BANK	35
// R60_62.agc:514
//		SETLOC	MANUVER1
// R60_62.agc:515
//		BANK
// R60_62.agc:516
//ROT180		VLOAD	VXV		# IF VF, VI ANTIPARALLEL, 180 DEG ROTATION
// slot 24808
    24808, 40442,
// R60_62.agc:517
//			MIS 	+6	# IS REQUIRED. Y STABLE MEMBER AXIS IN
// slot 24809
    24809, 3418,
// R60_62.agc:518
//			HIDPHALF	# INITIAL S/C AXES.
// slot 24810
    24810, 6816,
// R60_62.agc:519
//		UNIT	VXV		# FIND Y(SM) X X(I)
// slot 24811
    24811, 40284,
// R60_62.agc:520
//			SCAXIS		# FIND UNIT(VI X UNIT(Y(SM) X X(I)))
// slot 24812
    24812, 4074,
// R60_62.agc:521
//		UNIT	BOV		# I.E. PICK A VECTOR IN THE PLANE OF X(I),
// slot 24813
    24813, 32860,
// R60_62.agc:522
//			PICKX		# Y(SM) PERPENDICULAR TO VI
// slot 24814
    24814, 45556,
// R60_62.agc:523
//		STODL	COF
// slot 24815
    24815, 15730,
// R60_62.agc:524
//			36D		# CHECK MAGNITUDE
// slot 24816
    24816, 74,
// R60_62.agc:525
//		DSU	BMN		# OF THIS VECTOR.
// slot 24817
    24817, 41002,
// R60_62.agc:526
//			DPB-14		# IF LESS THAN B-14,
// slot 24818
    24818, 12818,
// R60_62.agc:527
//			PICKX		# PICK X-AXIS.
// slot 24819
    24819, 45556,
// R60_62.agc:528
//		VLOAD
// slot 24820
    24820, 65530,
// R60_62.agc:529
//			COF
// slot 24821
    24821, 3442,
// R60_62.agc:530
//XROT		STODL	COF
// slot 24822
    24822, 15730,
// R60_62.agc:531
//			HIDPHALF
// slot 24823
    24823, 6816,
// R60_62.agc:532
//		GOTO
// slot 24824
    24824, 65360,
// R60_62.agc:533
//			COMPMATX
// slot 24825
    24825, 47220,
// R60_62.agc:534
//PICKX		VLOAD	GOTO		# PICK THE XAXIS IN THIS CASE
// slot 24826
    24826, 43258,
// R60_62.agc:535
//			HIDPHALF
// slot 24827
    24827, 6816,
// R60_62.agc:536
//			XROT
// slot 24828
    24828, 45548,
// R60_62.agc:537
//SINGIMLC	2DEC	.4285836003	# =SIN(59)		  $2
// slot 24829 24830
    24829, 14042, 24830, 29940,
// R60_62.agc:538
//
// R60_62.agc:539
//SINVEC1		2DEC	.3796356537	# =SIN(49.4)		  $2
// slot 24831 24832
    24831, 12438, 24832, 31148,
// R60_62.agc:540
//
// R60_62.agc:541
//SINVEC2		2DEC	.2462117800	# =SIN(29.5)		  $2
// slot 24833 24834
    24833, 8066, 24834, 30598,
// R60_62.agc:542
//
// R60_62.agc:543
//VECANG1		2DEC	.1388888889	# = 50 DEGREES			      $360
// slot 24835 24836
    24835, 4550, 24836, 18204,
// R60_62.agc:544
//# Page 484
// R60_62.agc:545
//VECANG2		2DEC	.09722222222	# = 35 DEGREES			      $360
// slot 24837 24838
    24837, 3184, 24838, 29128,
// R60_62.agc:546
//
// R60_62.agc:547
//1BITDP		OCT	0		# KEEP THIS BEFORE DPB(-14)	 *********
// slot 24839
    24839, 0,
// R60_62.agc:548
//DPB-14		OCT	00001
// slot 24840
    24840, 2,
// R60_62.agc:549
//		OCT	00000
// slot 24841
    24841, 0
)).

// bank 23, slots 21571-21572
function agcAotUnit1335 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21571 {
// R60_62.agc:550
//
// R60_62.agc:551
//# Page 485
// R60_62.agc:552
//# ROUTINE FOR INITIATING AUTOMATIC MANEUVER VIA KEYBOARD (V49)
// R60_62.agc:553
//
// R60_62.agc:554
//		BANK	34
// R60_62.agc:555
//		SETLOC	R62
// R60_62.agc:556
//		BANK
// R60_62.agc:557
//		EBANK=	BCDU
// R60_62.agc:558
//
// R60_62.agc:559
//		COUNT*	$$/R62
// R60_62.agc:560
//
// R60_62.agc:561
//R62DISP		EQUALS	R62FLASH
// R60_62.agc:562
//
// R60_62.agc:563
//R62FLASH	CAF	V06N22		# FLASH V06N22 AND
// slot 21571
        if slot <> 21571 or instruction <> 14856 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R60_62.agc:564
//		TC	BANKCALL	# ICDU ANGLES
// slot 21572
        if slot <> 21572 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1335] to agcAotUnit1335@.

agcAotInstallSourceRope(list(
// R60_62.agc:565
//		CADR	GOFLASH
// slot 21573
    21573, 17020
)).

// bank 23, slots 21574-21577
function agcAotUnit1336 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21575 {
        if slot <= 21574 {
// R60_62.agc:566
//		TCF	ENDEXT		# TERMINATE
// slot 21574
            if slot <> 21574 or instruction <> 6970 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6970, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R60_62.agc:567
//		TCF	GOMOVE		# PROCEED
// slot 21575
            if slot <> 21575 or instruction <> 5193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5193, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21576 {
// R60_62.agc:568
//		TCF	R62FLASH	# ENTER
// slot 21576
            if slot <> 21576 or instruction <> 5187 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5187, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R60_62.agc:569
//
// R60_62.agc:570
//					# ASTRONAUT MAY LOAD NEW ICDUS AT THIS
// R60_62.agc:571
//					# POINT
// R60_62.agc:572
//GOMOVE		TC	UPFLAG		# SET FOR 3-AXIS MANEUVER
// slot 21577
            if slot <> 21577 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1336] to agcAotUnit1336@.

agcAotInstallSourceRope(list(
// R60_62.agc:573
//		ADRES	3AXISFLG
// slot 21578
    21578, 168
)).

// bank 23, slots 21579-21579
function agcAotUnit1337 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R60_62.agc:574
//
// R60_62.agc:575
//		TC	BANKCALL
// slot 21579
    if slot <> 21579 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1337] to agcAotUnit1337@.

agcAotInstallSourceRope(list(
// R60_62.agc:576
//		CADR	R60LEM
// slot 21580
    21580, 45222
)).

// bank 23, slots 21581-21581
function agcAotUnit1338 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R60_62.agc:577
//		TCF	ENDEXT		# END R62
// slot 21581
    if slot <> 21581 or instruction <> 6970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1338] to agcAotUnit1338@.

