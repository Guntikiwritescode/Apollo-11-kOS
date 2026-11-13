// R30.agc
// bank 23, slots 21722-21722
function agcAotUnit1226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:1
//# Copyright:    Public domain.
// R30.agc:2
//# Filename:     R30.agc
// R30.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// R30.agc:4
//#               It is part of the source code for the Command Module's (CM)
// R30.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// R30.agc:6
//# Assembler:    yaYUL
// R30.agc:7
//# Contact:      Gutsche Kerman <hgutsche@xplornet.com>.
// R30.agc:8
//# Website:      www.ibiblio.org/apollo.
// R30.agc:9
//# Pages:	514-524
// R30.agc:10
//# Mod history:  2009-05-09 HG    Started adapting from the Colossus249/ file
// R30.agc:11
//#               of the same name, using Comanche055 page
// R30.agc:12
//#               images 0514.jpg - 0524.jpg.
// R30.agc:13
//#
// R30.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// R30.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// R30.agc:16
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// R30.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// R30.agc:18
//# consequent reduction in image quality as well) are available online at
// R30.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// R30.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// R30.agc:21
//# (much) higher-quality images which Fjeld Kerman actually created.
// R30.agc:22
//#
// R30.agc:23
//# Notations on the hardcopy document read, in part:
// R30.agc:24
//#
// R30.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// R30.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// R30.agc:27
//#
// R30.agc:28
//#    This AGC program shall also be referred to as
// R30.agc:29
//#            Colossus 2A
// R30.agc:30
//
// R30.agc:31
//# Page 514
// R30.agc:32
//# SUBROUTINE NAME:  V82CALL
// R30.agc:33
//# MOD NO: 0					DATE: 16 FEB 67
// R30.agc:34
//# MOD BY: BAIRNSFATHER KERMAN			LOG SECTION:  R30
// R30.agc:35
//# MOD NO: 1	MOD BY:  BAIRNSFATHER KERMAN	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// R30.agc:36
//# MOD NO: 2	MOD BY:  ALONSO KERMAN			DATE: 11 DEC 67		VB82 PROGRAM REWRITTEN
// R30.agc:37
//# MOD NO: 3	MOD BY:  ALONSO KERMAN			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF KERBIN/MUN SCALE
// R30.agc:38
//#
// R30.agc:39
//# NEW FUNCTIONAL DESCRIPTION:	CALLED BY VERB 82 ENTER.  PRIORITY 10.
// R30.agc:40
//# USED THROUGHOUT.		CALCULATE AND DISPLAY ORBITAL PARAMETERS
// R30.agc:41
//#
// R30.agc:42
//# 1.	IF AVERAGE G IS OFF:
// R30.agc:43
//#		FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
// R30.agc:44
//#			TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2=1).  VAL
// R30.agc:45
//#			CAN CHANGE TO OTHER SHIP BY V22EXE. WHERE X IS NOT EQ 1.
// R30.agc:46
//#		SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
// R30.agc:47
//#		CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
// R30.agc:48
//#			RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
// R30.agc:49
//#			HEIGHT ABOVE LAUNCH PAD OR LAUNAR LANDING SITE), HARD (APOGEE
// R30.agc:50
//#			HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
// R30.agc:51
//#			INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// R30.agc:52
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59MS59S IF IT WAS
// R30.agc:53
//#			NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
// R30.agc:54
//#			VAL HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
// R30.agc:55
//#			DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
// R30.agc:56
//#			ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
// R30.agc:57
//# 2.	IF AVERAGE G IS ON:
// R30.agc:58
//#		CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
// R30.agc:59
//#			FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
// R30.agc:60
//#			OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
// R30.agc:61
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).
// R30.agc:62
//#			IF MODE IS P11, THEN CALL DELRSPL SO VAL CAN MONITOR
// R30.agc:63
//#			RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
// R30.agc:64
//
// R30.agc:65
//# ADDENDUM:  HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// R30.agc:66
//#	     ABOVE REMARKS.
// R30.agc:67
//#
// R30.agc:68
//# CALLING SEQUENCE: VERB 82 ENTER.
// R30.agc:69
//#
// R30.agc:70
//# SUBROUTINES CALLED:	SR30.1, GOXDSPF
// R30.agc:71
//#			MAYBE -- THISPREC, OTHPREC, LOADTIME, DELRSPL
// R30.agc:72
//#
// R30.agc:73
//# NORMAL EXIT MODES:  TC ENDEXT
// R30.agc:74
//#
// R30.agc:75
//# ALARMS:  NONE
// R30.agc:76
//#
// R30.agc:77
//# OUTPUT:	HAPOX	(-29) M
// R30.agc:78
//#		HPERX	(-29) M
// R30.agc:79
//#		RAPO	(-29) M KERBIN
// R30.agc:80
//#			(-27) M MUN
// R30.agc:81
//# Page 515
// R30.agc:82
//#		RPER	(-29) M KERBIN
// R30.agc:83
//#			(-27) M MUN
// R30.agc:84
//#		TFF	(-28) CS	CONTAINS NEGATIVE QUANTITY
// R30.agc:85
//#		-TPER	(-28) CS	CONTAINS NEGATIVE QUANTITY
// R30.agc:86
//#		RSP-RREC(-29) M		IF DELRSPL CALLED
// R30.agc:87
//#
// R30.agc:88
//# ERASABLE INITIALIZATION REQUIRED: STATE VECTOR.
// R30.agc:89
//#
// R30.agc:90
//# DEBRIS:	QPRET, RONE, VONE,TFF/RTMU, HPERMIN, RPADTEM, V82EMFLG.
// R30.agc:91
//#		MAYBE:  TSTART82, V82FLAGS, TDEC1.
// R30.agc:92
//
// R30.agc:93
//		EBANK=	HAPOX
// R30.agc:94
//		BANK	31
// R30.agc:95
//		SETLOC	R30LOC
// R30.agc:96
//		BANK
// R30.agc:97
//		COUNT*	$$/R30
// R30.agc:98
//
// R30.agc:99
//V82CALL		TC	INTPRET
// slot 21722
    if slot <> 21722 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1226] to agcAotUnit1226@.

agcAotInstallSourceRope(list(
// R30.agc:100
//		BON	GOTO
// slot 21723
    21723, 43032,
// R30.agc:101
//			AVEGFLAG
// slot 21724
    21724, 924,
// R30.agc:102
//			V82GON		# IF AVERAGE G ON
// slot 21725
    21725, 39660,
// R30.agc:103
//			V82GOFF		# IF AVERAGE G OFF
// slot 21726
    21726, 39358,
// R30.agc:104
//
// R30.agc:105
//V82GOFF		EXIT			# ALLOW VAL TO SELECT VEHICLE
// slot 21727
    21727, 65532
)).

// bank 23, slots 21728-21733
function agcAotUnit1227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21730 {
        if slot <= 21728 {
// R30.agc:106
//		CAF	TWO		# DESIRED FOR ORBITAL PARAMETERS
// slot 21728
            if slot <> 21728 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21729 {
// R30.agc:107
//		TS	OPTIONX
// slot 21729
                if slot <> 21729 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:108
//		CAF	ONE
// slot 21730
                if slot <> 21730 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
        if slot <= 21731 {
// R30.agc:109
//		TS	OPTIONX +1
// slot 21731
            if slot <> 21731 or instruction <> 23082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21732 {
// R30.agc:110
//		CAF	OPTIONVN	# V 04 N 06
// slot 21732
                if slot <> 21732 or instruction <> 13574 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1286), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:111
//		TC	BANKCALL
// slot 21733
                if slot <> 21733 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1227] to agcAotUnit1227@.

agcAotInstallSourceRope(list(
// R30.agc:112
//		CADR	GOXDSPF
// slot 21734
    21734, 17122
)).

// bank 23, slots 21735-21739
function agcAotUnit1228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21736 {
        if slot <= 21735 {
// R30.agc:113
//		TC	ENDEXT		# TERMINATE
// slot 21735
            if slot <> 21735 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:114
//		TC	+2		# PROCEED
// slot 21736
            if slot <> 21736 or instruction <> 1258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21737 {
// R30.agc:115
//		TC	-5		# DATA IN.  OPTIONX +1 = 1 FOR THIS VEHIC.
// slot 21737
            if slot <> 21737 or instruction <> 1252 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1252, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21738 {
// R30.agc:116
//					#		 UNEQ 1 FOR OTHER VEHICLE.
// R30.agc:117
//		CAF	BIT4		# 80 MS
// slot 21738
                if slot <> 21738 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:118
//		TC	WAITLIST
// slot 21739
                if slot <> 21739 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1228] to agcAotUnit1228@.

agcAotInstallSourceRope(list(
// R30.agc:119
//		EBANK=	TFF
// R30.agc:120
//		2CADR	TICKTEST
// slot 21740 21741
    21740, 2738, 21741, 39016
)).

// bank 23, slots 21742-21748
function agcAotUnit1229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21744 {
        if slot <= 21742 {
// R30.agc:121
//
// R30.agc:122
//		RELINT
// slot 21742
            if slot <> 21742 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21743 {
// R30.agc:123
//V82GOFLP	CAF	TFFBANK		# MAJOR RECYCLE LOOP ENTRY
// slot 21743
                if slot <> 21743 or instruction <> 13576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1288), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:124
//		TS	EBANK
// slot 21744
                if slot <> 21744 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21746 {
            if slot <= 21745 {
// R30.agc:125
//		CAF	ZERO
// slot 21745
                if slot <> 21745 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:126
//		TS	V82FLAGS	# ZERO FLAGS FOR TICKTEST, INHIBITS
// slot 21746
                if slot <> 21746 or instruction <> 23522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23522, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21747 {
// R30.agc:127
//					# DECREMENTING OF TFF AND -TPER.
// R30.agc:128
//		CAF	PRIO7
// slot 21747
                if slot <> 21747 or instruction <> 14899 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:129
//		TC	FINDVAC		# V82GOFF1 WILL EXECUTE STATE VECTOR
// slot 21748
                if slot <> 21748 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1229] to agcAotUnit1229@.

agcAotInstallSourceRope(list(
// R30.agc:130
//# Page 516
// R30.agc:131
//		EBANK=	TFF		# UPDATE AND ORBIT CALCULATIONS FOR
// R30.agc:132
//		2CADR	V82GOFF1	# SELECTED VEHICLE ABOUT PROPER BODY.
// slot 21749 21750
    21749, 2578, 21750, 39016
)).

// bank 23, slots 21751-21757
function agcAotUnit1230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21753 {
        if slot <= 21751 {
// R30.agc:133
//
// R30.agc:134
//		RELINT
// slot 21751
            if slot <> 21751 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21752 {
// R30.agc:135
//V82STALL	CAF	THREE		# STALL IN THIS LOOP AND WITHOLD V 16 N 44
// slot 21752
                if slot <> 21752 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:136
//		MASK	V82FLAGS	# UNTIL STATE VECTOR UPDATE SETS ONE OF
// slot 21753
                if slot <> 21753 or instruction <> 29666 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 994).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21755 {
            if slot <= 21754 {
// R30.agc:137
//		CCS	A		# OUR FLAG BITS.
// slot 21754
                if slot <> 21754 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:138
//		TC	FLAGGON		# EXIT FROM STALL LOOP.
// slot 21755
                if slot <> 21755 or instruction <> 1280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21756 {
// R30.agc:139
//		CAF	1SEC
// slot 21756
                if slot <> 21756 or instruction <> 14881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:140
//		TC	BANKCALL
// slot 21757
                if slot <> 21757 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1230] to agcAotUnit1230@.

agcAotInstallSourceRope(list(
// R30.agc:141
//		CADR	DELAYJOB
// slot 21758
    21758, 1972
)).

// bank 23, slots 21759-21761
function agcAotUnit1231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21759 {
// R30.agc:142
//		TC	V82STALL
// slot 21759
        if slot <> 21759 or instruction <> 1272 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1272, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21760 {
// R30.agc:143
//
// R30.agc:144
//FLAGGON		CAF	V16N44		# MONITOR HAPO,HPER,TFF.
// slot 21760
            if slot <> 21760 or instruction <> 13575 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1287), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:145
//		TC	BANKCALL
// slot 21761
            if slot <> 21761 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1231] to agcAotUnit1231@.

agcAotInstallSourceRope(list(
// R30.agc:146
//		CADR	GOXDSPF
// slot 21762
    21762, 17122
)).

// bank 23, slots 21763-21765
function agcAotUnit1232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21763 {
// R30.agc:147
//		TC	B5OFF		# TERM  THIS TELLS TICKTEST TO KILL ITSELF
// slot 21763
        if slot <> 21763 or instruction <> 2965 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2965, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21764 {
// R30.agc:148
//		TC	B5OFF		# PROCEED  DITTO
// slot 21764
            if slot <> 21764 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:149
//		TC	V82GOFLP	# RECYCLE  RECOMPUTE STATE VECT + DISPLAY
// slot 21765
            if slot <> 21765 or instruction <> 1263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1263, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1232] to agcAotUnit1232@.

agcAotInstallSourceRope(list(
// R30.agc:150
//
// R30.agc:151
//OPTIONVN	VN	0412
// slot 21766
    21766, 1048,
// R30.agc:152
//V16N44		VN	1644
// slot 21767
    21767, 4184,
// R30.agc:153
//TFFBANK		ECADR	TFF
// slot 21768
    21768, 2502
)).

// bank 23, slots 21769-21769
function agcAotUnit1233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:154
//
// R30.agc:155
//V82GOFF1	TC	INTPRET
// slot 21769
    if slot <> 21769 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1233] to agcAotUnit1233@.

agcAotInstallSourceRope(list(
// R30.agc:156
//		RTB
// slot 21770
    21770, 65336,
// R30.agc:157
//			LOADTIME
// slot 21771
    21771, 38544,
// R30.agc:158
//		STORE	TDEC1		# TIME FOR STATE VECTOR UPDATE.
// slot 21772
    21772, 66,
// R30.agc:159
//		STORE	TSTART82	# TIME FOR INTERNAL USE.
// slot 21773
    21773, 2474,
// R30.agc:160
//		EXIT
// slot 21774
    21774, 65532
)).

// bank 23, slots 21775-21779
function agcAotUnit1234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21776 {
        if slot <= 21775 {
// R30.agc:161
//		CS	OPTIONX +1	# 1 FOR THIS VEHICLE, NOT 1 FOR OTHER
// slot 21775
            if slot <> 21775 or instruction <> 16938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 554).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:162
//		AD	ONE
// slot 21776
            if slot <> 21776 or instruction <> 27151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21777 {
// R30.agc:163
//		EXTEND
// slot 21777
            if slot <> 21777 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21778 {
// R30.agc:164
//		BZF	THISSHIP
// slot 21778
                if slot <> 21778 or instruction <> 5414 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5414, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:165
//OTHSHIP		TC	INTPRET
// slot 21779
                if slot <> 21779 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1234] to agcAotUnit1234@.

agcAotInstallSourceRope(list(
// R30.agc:166
//		CALL			# CALL STATE VECTOR UPDATE FOR OTHER SHIP.
// slot 21780
    21780, 65320,
// R30.agc:167
//			OTHPREC
// slot 21781
    21781, 23690,
// R30.agc:168
//BOTHSHIP	VLOAD			# MOVE RESULTS INTO TFFCONIC STORAGE AREAS
// slot 21782
    21782, 65530,
// R30.agc:169
//			RATT		# TO BE CALLED BY SR30.1.
// slot 21783
    21783, 2,
// R30.agc:170
//		STOVL	RONE		# RATT AT (-29)M FOR KERBIN OR MUN
// slot 21784
    21784, 22958,
// R30.agc:171
//			VATT
// slot 21785
    21785, 14,
// R30.agc:172
//		STORE	VONE		# VATT AT (-7)M/CS FOR KERBIN OR MUN
// slot 21786
    21786, 2490,
// R30.agc:173
//		DLOAD*
// slot 21787
    21787, 65478,
// R30.agc:174
//			1/RTMUE,2	# X2 IS 0 FOR KERBIN CENTERED STATE VEC
// slot 21788
    21788, 58786,
// R30.agc:175
//		STORE	TFF/RTMU	# X2 IS 2 FOR MUN
// slot 21789
    21789, 62,
// R30.agc:176
//		DLOAD*			# AS LEFT BY THISPREC OR OTHPREC.
// slot 21790
    21790, 65478,
// R30.agc:177
//			MINPERE,2
// slot 21791
    21791, 58778,
// R30.agc:178
//		STORE	HPERMIN		# TFFRTMU, HPERMIN, AND RPADTEM ARE ALL
// slot 21792
    21792, 2466,
// R30.agc:179
//		SLOAD	BHIZ		# KERBIN/MUN PARAMETERS AS SET HERE.
// slot 21793
    21793, 39098,
// R30.agc:180
//# Page 517
// R30.agc:181
//			X2
// slot 21794
    21794, 80,
// R30.agc:182
//			EARTHPAD
// slot 21795
    21795, 39526,
// R30.agc:183
//		GOTO
// slot 21796
    21796, 65360,
// R30.agc:184
//			MOONPAD
// slot 21797
    21797, 39534
)).

// bank 23, slots 21798-21798
function agcAotUnit1235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:185
//THISSHIP	TC	INTPRET
// slot 21798
    if slot <> 21798 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1235] to agcAotUnit1235@.

agcAotInstallSourceRope(list(
// R30.agc:186
//		CALL			# CALL STATE VECTOR UPDATE FOR THIS SHIP.
// slot 21799
    21799, 65320,
// R30.agc:187
//			THISPREC
// slot 21800
    21800, 23666,
// R30.agc:188
//		GOTO
// slot 21801
    21801, 65360,
// R30.agc:189
//			BOTHSHIP
// slot 21802
    21802, 39468,
// R30.agc:190
//
// R30.agc:191
//# THE FOLLOWING CONSTANTS ARE PAIRWISE INDEXED.  DO NOT SEPARATE PAIRS.
// R30.agc:192
//
// R30.agc:193
//1/RTMUM		2DEC*	.45162595 E-4 B14*
// slot 21803 21804
    21803, 24246, 21804, 7922,
// R30.agc:194
//1/RTMUE		2DEC*	.50087529 E-5 B17*
// slot 21805 21806
    21805, 21512, 21806, 7044,
// R30.agc:195
//
// R30.agc:196
//MINPERM		2DEC	10668 B-27	# 35 KFT MIN PERIGEE HEIGHT FOR MUN(-27)M
// slot 21807 21808
    21807, 2, 21808, 9904,
// R30.agc:197
//MINPERE		2DEC	91440 B-29	# 300 KFT (-29)M FOR KERBIN
// slot 21809 21810
    21809, 4, 21810, 25904,
// R30.agc:198
//
// R30.agc:199
//EARTHPAD	DLOAD	CLRGO		# PAD 37-B RADIUS.  SCALED AT (-29)M.
// slot 21811
    21811, 36042,
// R30.agc:200
//			RPAD
// slot 21812
    21812, 5332,
// R30.agc:201
//			V82EMFLG	# INDICATE KERBIN SCALING FOR SR30.1
// slot 21813
    21813, 4900,
// R30.agc:202
//			BOTHPAD
// slot 21814
    21814, 39542,
// R30.agc:203
//
// R30.agc:204
//MOONPAD		VLOAD	ABVAL		# COMPUTE MUN PAD RADIUS FROM RLS VECTOR.
// slot 21815
    21815, 42746,
// R30.agc:205
//			RLS		# SCALED AT (-27)M.
// slot 21816
    21816, 2092,
// R30.agc:206
//		SET
// slot 21817
    21817, 65304,
// R30.agc:207
//			V82EMFLG	# INDICATE MUN SCALING FOR SR30.1
// slot 21818
    21818, 4708,
// R30.agc:208
//BOTHPAD		STCALL	RPADTEM
// slot 21819
    21819, 31142,
// R30.agc:209
//			SR30.1		# CALCULATE ORBITAL PARAMETERS
// slot 21820
    21820, 39790,
// R30.agc:210
//		EXIT
// slot 21821
    21821, 65532
)).

// bank 23, slots 21822-21825
function agcAotUnit1236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21823 {
        if slot <= 21822 {
// R30.agc:211
//		CA	MODREG		# ARE WE IN P00
// slot 21822
            if slot <> 21822 or instruction <> 12809 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:212
//		EXTEND
// slot 21823
            if slot <> 21823 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21824 {
// R30.agc:213
//		BZF	CANDEL		# YES, DO DELRSPL
// slot 21824
            if slot <> 21824 or instruction <> 5541 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5541, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:214
//SPLRET1		TC	INTPRET
// slot 21825
            if slot <> 21825 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1236] to agcAotUnit1236@.

agcAotInstallSourceRope(list(
// R30.agc:215
//		RTB	DSU
// slot 21826
    21826, 38200,
// R30.agc:216
//			LOADTIME
// slot 21827
    21827, 38544,
// R30.agc:217
//			TSTART82	# PRESENT TIME - TIME V82GOFF1 BEGAN
// slot 21828
    21828, 2474,
// R30.agc:218
//		STORE	TSTART82	#                SAVE IT
// slot 21829
    21829, 2474,
// R30.agc:219
//		DLOAD	BZE		# SR30.1 SETS -TPER=0 IF HPER L/
// slot 21830
    21830, 44234,
// R30.agc:220
//			-TPER		# HPERMIN (300 OR 35) KFT.
// slot 21831
    21831, 2508,
// R30.agc:221
//			TICKTFF		# (-TPER = 0)
// slot 21832
    21832, 39586,
// R30.agc:222
//TICKTPER	DLOAD	DAD		# (-TPER NON ZERO)  TFF WAS NOT COMPUTED,
// slot 21833
    21833, 36298,
// R30.agc:223
//			-TPER		# BUT WAS SET TO 59M59S.DON'T DICK TFF, DO
// slot 21834
    21834, 2508,
// R30.agc:224
//			TSTART82	# TICK -TPER. DISPLAY BOTH.
// slot 21835
    21835, 2474,
// R30.agc:225
//		STORE	-TPER           # -TPER CORRECTED FOR TIME SINCE V82GOFF1
// slot 21836
    21836, 2508,
// R30.agc:226
//		EXIT                    # BEGAN.
// slot 21837
    21837, 65532
)).

// bank 23, slots 21838-21840
function agcAotUnit1237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21838 {
// R30.agc:227
//
// R30.agc:228
//# Page 518
// R30.agc:229
//		CAF	BIT1
// slot 21838
        if slot <> 21838 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21839 {
// R30.agc:230
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY -TPER
// slot 21839
            if slot <> 21839 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:231
//		TC	ENDOFJOB
// slot 21840
            if slot <> 21840 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1237] to agcAotUnit1237@.

agcAotInstallSourceRope(list(
// R30.agc:232
//
// R30.agc:233
//TICKTFF		DLOAD	DAD		# (-TPER=0)  TFF WAS COMPUTED.TICK TFF.
// slot 21841
    21841, 36298,
// R30.agc:234
//			TFF		# DO NOT TICK -TPER.DISPLAY TFF, BUT NOT
// slot 21842
    21842, 2504,
// R30.agc:235
//			TSTART82	# -TPER.
// slot 21843
    21843, 2474,
// R30.agc:236
//		STORE	TFF		# TFF CORRECTED FOR TIME SINCE V82GOFF1
// slot 21844
    21844, 2504,
// R30.agc:237
//		EXIT			# BEGAN.
// slot 21845
    21845, 65532
)).

// bank 23, slots 21846-21854
function agcAotUnit1238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21849 {
        if slot <= 21847 {
            if slot <= 21846 {
// R30.agc:238
//		CAF	BIT2
// slot 21846
                if slot <> 21846 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:239
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY TFF.
// slot 21847
                if slot <> 21847 or instruction <> 23522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23522, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21848 {
// R30.agc:240
//		TC	ENDOFJOB
// slot 21848
                if slot <> 21848 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:241
//
// R30.agc:242
//TICKTEST	CAF	BIT5		# THIS WAITLIST PROGRAM PERPETUATES ITSELF
// slot 21849
                if slot <> 21849 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21851 {
            if slot <= 21850 {
// R30.agc:243
//		MASK	EXTVBACT	# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// slot 21850
                if slot <> 21850 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:244
//		CCS	A
// slot 21851
                if slot <> 21851 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21852 {
// R30.agc:245
//		TC	DOTICK
// slot 21852
                if slot <> 21852 or instruction <> 1378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21853 {
// R30.agc:246
//		CAF	PRIO25
// slot 21853
                    if slot <> 21853 or instruction <> 16306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4018), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:247
//		TC	NOVAC		# TERMINATE V 82.CAN'T CALL ENDEXT IN RUPT.
// slot 21854
                    if slot <> 21854 or instruction <> 2652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2652, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1238] to agcAotUnit1238@.

agcAotInstallSourceRope(list(
// R30.agc:248
//		EBANK=	EXTVBACT
// R30.agc:249
//		2CADR	ENDEXT
// slot 21855 21856
    21855, 5816, 21856, 4196
)).

// bank 23, slots 21857-21859
function agcAotUnit1239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21857 {
// R30.agc:250
//
// R30.agc:251
//		TC	TASKOVER
// slot 21857
        if slot <> 21857 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21858 {
// R30.agc:252
//DOTICK		CAF	1SEC		# RE-REQUEST TICKTEST.
// slot 21858
            if slot <> 21858 or instruction <> 14881 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:253
//		TC	WAITLIST
// slot 21859
            if slot <> 21859 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1239] to agcAotUnit1239@.

agcAotInstallSourceRope(list(
// R30.agc:254
//		EBANK=	TFF
// R30.agc:255
//		2CADR	TICKTEST
// slot 21860 21861
    21860, 2738, 21861, 39016
)).

// bank 23, slots 21862-21864
function agcAotUnit1240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21862 {
// R30.agc:256
//
// R30.agc:257
//		CAF	THREE
// slot 21862
        if slot <> 21862 or instruction <> 15500 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21863 {
// R30.agc:258
//		MASK	V82FLAGS
// slot 21863
            if slot <> 21863 or instruction <> 29666 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 994).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:259
//		INDEX	A
// slot 21864
            if slot <> 21864 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1240] to agcAotUnit1240@.

agcAotInstallSourceRope(list(
// R30.agc:260
//		TC	+1
// slot 21865
    21865, 2772
)).

// bank 23, slots 21866-21877
function agcAotUnit1241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21871 {
        if slot <= 21868 {
            if slot <= 21866 {
// R30.agc:261
//		TC	TASKOVER	# IF NO FLAGBITS SET DONT CHANGE TFF OR
// slot 21866
                if slot <> 21866 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21867 {
// R30.agc:262
//					# -TPER, BUT CONTINUE LOOP.
// R30.agc:263
//		TC	TPERTICK	# ONLY BIT 1 SET. INCR -TPER BY 1 SEC.
// slot 21867
                    if slot <> 21867 or instruction <> 1393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1393, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:264
//TFFTICK		CAF	1SEC		# ONLY BIT 2 SET. INCR TFF BY 1 SEC.
// slot 21868
                    if slot <> 21868 or instruction <> 14881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21869 {
// R30.agc:265
//		TS	L
// slot 21869
                if slot <> 21869 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21870 {
// R30.agc:266
//		CAF	ZERO
// slot 21870
                    if slot <> 21870 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:267
//		DAS	TFF
// slot 21871
                    if slot <> 21871 or instruction <> 9188 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 996) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21874 {
            if slot <= 21872 {
// R30.agc:268
//		TC	TASKOVER
// slot 21872
                if slot <> 21872 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21873 {
// R30.agc:269
//TPERTICK	CAF	1SEC
// slot 21873
                    if slot <> 21873 or instruction <> 14881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:270
//		TS	L
// slot 21874
                    if slot <> 21874 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21875 {
// R30.agc:271
//		CAF	ZERO
// slot 21875
                if slot <> 21875 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21876 {
// R30.agc:272
//		DAS	-TPER
// slot 21876
                    if slot <> 21876 or instruction <> 9190 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 998) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:273
//		TC	TASKOVER
// slot 21877
                    if slot <> 21877 or instruction <> 2772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2772, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1241] to agcAotUnit1241@.

agcAotInstallSourceRope(list(
// R30.agc:274
//# Page 519
// R30.agc:275
//V82GON		EXIT			# AVERAGE G ON. USE CURRENT STATE VECTOR
// slot 21878
    21878, 65532
)).

// bank 23, slots 21879-21880
function agcAotUnit1242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21879 {
// R30.agc:276
//					# FOR ORBITAL PARAMETER CALCULATIONS.
// R30.agc:277
//		CAF	PRIO7		# LESS THAN LAMBERT
// slot 21879
        if slot <> 21879 or instruction <> 14899 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2611), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R30.agc:278
//		TC	FINDVAC		# V82GON1 WILL PERFORM ORBIT CALCULATIONS
// slot 21880
        if slot <> 21880 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1242] to agcAotUnit1242@.

agcAotInstallSourceRope(list(
// R30.agc:279
//		EBANK=	TFF		# ABOUT PROPER BODY APPROX ONCE PER SEC.
// R30.agc:280
//		2CADR	V82GON1
// slot 21881 21882
    21881, 2824, 21882, 39016
)).

// bank 23, slots 21883-21887
function agcAotUnit1243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21884 {
        if slot <= 21883 {
// R30.agc:281
//
// R30.agc:282
//		RELINT
// slot 21883
            if slot <> 21883 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:283
//		CCS	NEWJOB		# WITHOLD V16 N44 UNTIL FIRST ORBIT CALC
// slot 21884
            if slot <> 21884 or instruction <> 4151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 55).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21885 {
// R30.agc:284
//		TC	CHANG1		# IS DONE. NOTE: V82GON1 (PRIO7, FINDVAC
// slot 21885
            if slot <> 21885 or instruction <> 2676 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2676, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21886 {
// R30.agc:285
//					# JOB) IS COMPLETED BEFORE V82GON (PRIO7,
// R30.agc:286
//					# NOVAC JOB).
// R30.agc:287
//V82REDSP	CAF	V16N44		# MONITOR HAPO, HPER, TFF
// slot 21886
                if slot <> 21886 or instruction <> 13575 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1287), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:288
//		TC	BANKCALL
// slot 21887
                if slot <> 21887 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1243] to agcAotUnit1243@.

agcAotInstallSourceRope(list(
// R30.agc:289
//		CADR	GOXDSPF
// slot 21888
    21888, 17122
)).

// bank 23, slots 21889-21892
function agcAotUnit1244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21890 {
        if slot <= 21889 {
// R30.agc:290
//		TC	B5OFF		# TERM THIS TELLS V82GON1 TO KILL ITSELF.
// slot 21889
            if slot <> 21889 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:291
//		TC	B5OFF		# PROC DITTO.
// slot 21890
            if slot <> 21890 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21891 {
// R30.agc:292
//		TC	V82REDSP	# RECYCLE
// slot 21891
            if slot <> 21891 or instruction <> 1406 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1406, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:293
//
// R30.agc:294
//V82GON1		TC	INTPRET		# THIS EXEC PROGRAM PERPETUATES ITSELF
// slot 21892
            if slot <> 21892 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1244] to agcAotUnit1244@.

agcAotInstallSourceRope(list(
// R30.agc:295
//					# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// R30.agc:296
//		VLOAD	GOTO		# HOLDS OFF CCS NEWJOB BETWEEN RN AND
// slot 21893
    21893, 43258,
// R30.agc:297
//			RN		# VN FETCH SO RN , VN ARE FROM SAME
// slot 21894
    21894, 1266,
// R30.agc:298
//			NEXTLINE	# STATE VECTOR UPDATE.
// slot 21895
    21895, 39696,
// R30.agc:299
//NEXTLINE	STOVL	RONE		# RN AT (-29)M FOR KERBIN OR MUN
// slot 21896
    21896, 22958,
// R30.agc:300
//			VN
// slot 21897
    21897, 1278,
// R30.agc:301
//		STORE	VONE		# VN AT (-7)M/CS FOR KERBIN OR MUN
// slot 21898
    21898, 2490,
// R30.agc:302
//		BON	GOTO
// slot 21899
    21899, 43032,
// R30.agc:303
//			AMOONFLG	# FLAG INDICATES BODY ABOUT WHICH ORBITAL
// slot 21900
    21900, 410,
// R30.agc:304
//			MOONGON		# CALCULATIONS ARE TO BE PERFORMED.
// slot 21901
    21901, 39710,
// R30.agc:305
//			EARTHGON	# IF SET - MUN , IF RESET - KERBIN.
// slot 21902
    21902, 39728,
// R30.agc:306
//
// R30.agc:307
//MOONGON		SET	DLOAD
// slot 21903
    21903, 58648,
// R30.agc:308
//			V82EMFLG	# INDICATE MUN SCALING FOR SR30.1
// slot 21904
    21904, 4708,
// R30.agc:309
//			1/RTMUM		# MUN PARAMETERS LOADED HERE FOR SR30.1
// slot 21905
    21905, 6744,
// R30.agc:310
//		STODL	TFF/RTMU
// slot 21906
    21906, 12350,
// R30.agc:311
//			MINPERM
// slot 21907
    21907, 6752,
// R30.agc:312
//		STOVL	HPERMIN
// slot 21908
    21908, 22946,
// R30.agc:313
//			RLS		# SCALED AT (-27)M
// slot 21909
    21909, 2092,
// R30.agc:314
//		ABVAL	GOTO
// slot 21910
    21910, 43084,
// R30.agc:315
//			V82GON2
// slot 21911
    21911, 39742,
// R30.agc:316
//EARTHGON	CLEAR	DLOAD
// slot 21912
    21912, 58648,
// R30.agc:317
//			V82EMFLG	# INDICATE KERBIN SCALING FOR SR30.1
// slot 21913
    21913, 4964,
// R30.agc:318
//			1/RTMUE		# KERBIN PARAMETERS LOADED HERE FOR SR30.1
// slot 21914
    21914, 6748,
// R30.agc:319
//		STODL	TFF/RTMU
// slot 21915
    21915, 12350,
// R30.agc:320
//			MINPERE
// slot 21916
    21916, 6756,
// R30.agc:321
//		STODL	HPERMIN
// slot 21917
    21917, 14754,
// R30.agc:322
//			RPAD
// slot 21918
    21918, 5332,
// R30.agc:323
//V82GON2		STCALL	RPADTEM		# COMMON CODE FOR KERBIN & MUN.
// slot 21919
    21919, 31142,
// R30.agc:324
//			SR30.1
// slot 21920
    21920, 39790,
// R30.agc:325
//# Page 520
// R30.agc:326
//		EXIT
// slot 21921
    21921, 65532
)).

// bank 23, slots 21922-21922
function agcAotUnit1245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:327
//		TC	CHECKMM
// slot 21922
    if slot <> 21922 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1245] to agcAotUnit1245@.

agcAotInstallSourceRope(list(
// R30.agc:328
//		DEC	11
// slot 21923
    21923, 22
)).

// bank 23, slots 21924-21925
function agcAotUnit1246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21924 {
// R30.agc:329
//		TC	V82GON3		# NOT IN MODE 11.
// slot 21924
        if slot <> 21924 or instruction <> 1455 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1455, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R30.agc:330
//CANDEL		TC	INTPRET		# IN MODE 11 OR 00
// slot 21925
        if slot <> 21925 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1246] to agcAotUnit1246@.

agcAotInstallSourceRope(list(
// R30.agc:331
//		CALL
// slot 21926
    21926, 65320,
// R30.agc:332
//			INTSTALL	# DELRSPL DOES INTWAKE
// slot 21927
    21927, 24132,
// R30.agc:333
//		DLOAD	CALL
// slot 21928
    21928, 38090,
// R30.agc:334
//			TFF
// slot 21929
    21929, 2504,
// R30.agc:335
//			DELRSPL		# RETURN IS TO NEXT LINE ( SPLRET ).
// slot 21930
    21930, 53278,
// R30.agc:336
//SPLRET		EXIT
// slot 21931
    21931, 65532
)).

// bank 23, slots 21932-21940
function agcAotUnit1247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21935 {
        if slot <= 21933 {
            if slot <= 21932 {
// R30.agc:337
//
// R30.agc:338
//		CA	MODREG
// slot 21932
                if slot <> 21932 or instruction <> 12809 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:339
//		EXTEND
// slot 21933
                if slot <> 21933 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21934 {
// R30.agc:340
//		BZF	SPLRET1
// slot 21934
                if slot <> 21934 or instruction <> 5441 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5441, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:341
//V82GON3		CAF	BIT5
// slot 21935
                if slot <> 21935 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21937 {
            if slot <= 21936 {
// R30.agc:342
//		MASK	EXTVBACT	# SEE IF VAL HAS SIGNALLED TERMINATE
// slot 21936
                if slot <> 21936 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:343
//		EXTEND
// slot 21937
                if slot <> 21937 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21938 {
// R30.agc:344
//		BZF	ENDEXT		# YES, TERMINATE VB 82 LOOP
// slot 21938
                if slot <> 21938 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21939 {
// R30.agc:345
//		CAF	1SEC
// slot 21939
                    if slot <> 21939 or instruction <> 14881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:346
//		TC	BANKCALL	# WAIT ONE SECOND BEFORE REPEATING
// slot 21940
                    if slot <> 21940 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1247] to agcAotUnit1247@.

agcAotInstallSourceRope(list(
// R30.agc:347
//		CADR	DELAYJOB	# ORBITAL PARAMETER COMPUTATION.
// slot 21941
    21941, 1972
)).

// bank 23, slots 21942-21942
function agcAotUnit1248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:348
//		TC	V82GON1
// slot 21942
    if slot <> 21942 or instruction <> 1412 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1412, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1248] to agcAotUnit1248@.

agcAotInstallSourceRope(list(
// R30.agc:349
//
// R30.agc:350
//# Page 521
// R30.agc:351
//# SUBROUTINE NAME: SR30.1
// R30.agc:352
//# MOD NO: 0								DATE: 		16 FEB 67
// R30.agc:353
//# MOD BY: BAIRNSFATHER KERMAN						LOG SECTION:	R32
// R30.agc:354
//# MOD NO: 1	MOD BY: BAIRNSFATHER KERMAN	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// R30.agc:355
//# MOD NO: 2	MOD BY: BAIRNSFATHER KERMAN	DATE: 14 APR 67		ADD OVFL CK FOR RAPO
// R30.agc:356
//# MOD NO: 3	MOD BY ALONSO KERMAN			DATE: 11 DEC 67		SUBROUTINE REWRITTEN
// R30.agc:357
//# MOD NO: 4	MOD BY ALONSO KERMAN			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF KERBIN/MUN SCALE
// R30.agc:358
//# MOD NO: 5	MOD BY: BAIRNSFATHER KERMAN		DATE: 6 AUG 68		OVFL CK FOR HAPO & HPER. VOIDS MOD #2.
// R30.agc:359
//#
// R30.agc:360
//# NEW FUNCTIONAL DESCRIPTION:  ORBITAL PARAMETERS DISPLAY FOR NOUNS 32 AND 44.
// R30.agc:361
//# SR30.1 CALLS TFFCONMU AND TFFRP/RA TO CALCULATE RPER (PERIGEE RADIUS),
// R30.agc:362
//# RAPO (APOGEE RADIUS), HPER (PERIGEE HEIGHT ABOVE LAUNCH PAD OR MUN
// R30.agc:363
//# LANDING SITE), HAPO (APOGEE HEIGHT AS ABOVE), TPER (TIME TO PERIGEE),
// R30.agc:364
//# TFF (TIME TO INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// R30.agc:365
//# IF HPER IS GREATER THAN OR EQUAL TO HPERMIN, CALCULATES TPER AND STORES
// R30.agc:366
//# NEGATIVE   IN -TPER.  OTHERWISE STORES +0 IN -TPER.  WHENEVER TPER IS
// R30.agc:367
//# CALCULATED, TFF IS NOT COMPUTABLE AND DEFAULTS TO -59MIN 59SEC. IF HAPO
// R30.agc:368
//# WOULD EXCEED 9999.9 NM, IT IS LIMITED TO THAT VALUE FOR DISPLAY.
// R30.agc:369
//#
// R30.agc:370
//# ADDENDUM:	HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// R30.agc:371
//#		ABOVE REMARKS.
// R30.agc:372
//#
// R30.agc:373
//# CALLING SEQUENCE:	CALL
// R30.agc:374
//#				SR30.1
// R30.agc:375
//#
// R30.agc:376
//# SUBROUTINES CALLED:	TFFCONMU, TFFRP/RA, CALCTPER, CALCTFF
// R30.agc:377
//# NORMAL EXIT MODE:	CALLING LINE +1 (STILL IN INTERPRETIVE MODE)
// R30.agc:378
//# ALARMS:	NONE
// R30.agc:379
//# OUTPUT:       RAPO	(-29) M KERBIN	APOGEE RADIUS	KERBIN CENTERED COORD.
// R30.agc:380
//#			(-27) M MUN			MUN CENTERED COORD.
// R30.agc:381
//#		RPER	(-29) M KERBIN	PERIGEE RADIUS	KERBIN CENTERED COORD.
// R30.agc:382
//#			(-27) M MUN			MUN CENTERED COORD.
// R30.agc:383
//#		HAPOX	(-29) M		APOGEE ALTITUDE ABOVE PAD OR LAND. SITE MAX VALUE LIMITED TO 9999.9 NM.
// R30.agc:384
//#		HPERX	(-29) M		PERIGEE ALT. ABOVE PAD OR LAND. SITE    MAX VALUE LIMITED TO 9999.9 NM.
// R30.agc:385
//#		TFF	(-28) CS	TIME TO 300KFT OR 35KFT ALTITUDE
// R30.agc:386
//#		-TPER	(-28) CS	TIME TO PERIGEE
// R30.agc:387
//# ERASABLE INITIALIZATION REQUIRED -
// R30.agc:388
//#	TFF/RTMU	(+17) KERBIN	RECIPROCAL OF PROPER GRAV CONSTANT FOR
// R30.agc:389
//#			(+14) MUN	KERBIN OR MUN = 1/SQRT(MU).
// R30.agc:390
//#	RONE		(-29) M		STATE VECTOR
// R30.agc:391
//#	VONE		(-7)  M/CS	STATE VECTOR
// R30.agc:392
//#	RPADTEM		(-29) M KERBIN	RADIUS OF LAUNCH PAD OR MUN LANDING
// R30.agc:393
//#			(-27) M MUN	SITE.
// R30.agc:394
//#	HPERMIN		(-29) M KERBIN	(300 OR 35) KFT MINIMUM PERIGEE ALTITUDE
// R30.agc:395
//#			(-27) M MUN	ABOVE LAUNCH PAD OR MUN LANDING SITE.
// R30.agc:396
//#	V82EMFLG	(INT SW BIT)	RESET FOR KERBIN, SET FOR MUN.
// R30.agc:397
//#
// R30.agc:398
//# DEBRIS:	QPRET, PDL, S2
// R30.agc:399
//
// R30.agc:400
//# Page 522
// R30.agc:401
//		COUNT*	$$/SR30S
// R30.agc:402
//
// R30.agc:403
//SR30.1		SETPD	STQ		# INITIALIZE PUSHDOWN LIST.
// slot 21943
    21943, 36866,
// R30.agc:404
//			0
// slot 21944
    21944, 2,
// R30.agc:405
//			S2
// slot 21945
    21945, 82,
// R30.agc:406
//					# SR30.1 INPUT:	RONE AT (-29)M KERBIN/MUN
// R30.agc:407
//					#		VONE AT (-7)M/CS
// R30.agc:408
//					# TFFCONMU,TFFRP/RA,CALCTPER,AND CALCTFF
// R30.agc:409
//					# CALLS REQUIRE:
// R30.agc:410
//					# KERBIN CENTERED (NO RESCALING REQUIRED)
// R30.agc:411
//					#	RONE SCALED TO B-29 M
// R30.agc:412
//					#	VONE SCALED TO B-7 M/CS
// R30.agc:413
//					# MUN CENTERED (RESCALING REQUIRED)
// R30.agc:414
//					#	RONE SCALED TO B-27 M
// R30.agc:415
//					#	VONE SCALED TO B-5 M/CS
// R30.agc:416
//		BOFF	VLOAD
// slot 21946
    21946, 64792,
// R30.agc:417
//			V82EMFLG	# OFF FOR KERBIN , ON FOR MUN.
// slot 21947
    21947, 5060,
// R30.agc:418
//			TFFCALLS
// slot 21948
    21948, 39814,
// R30.agc:419
//			RONE
// slot 21949
    21949, 2478,
// R30.agc:420
//		VSL2
// slot 21950
    21950, 65492,
// R30.agc:421
//		STOVL	RONE
// slot 21951
    21951, 22958,
// R30.agc:422
//			VONE
// slot 21952
    21952, 2490,
// R30.agc:423
//		VSL2
// slot 21953
    21953, 65492,
// R30.agc:424
//		STORE	VONE
// slot 21954
    21954, 2490,
// R30.agc:425
//TFFCALLS	CALL
// slot 21955
    21955, 65320,
// R30.agc:426
//			TFFCONMU
// slot 21956
    21956, 48096,
// R30.agc:427
//		CALL			# TFFRP/RA COMPUTES RAPO,RPER.
// slot 21957
    21957, 65320,
// R30.agc:428
//			TFFRP/RA
// slot 21958
    21958, 48172,
// R30.agc:429
//					# RETURNS WITH RAPO IN D(MPAC).
// R30.agc:430
//		DSU
// slot 21959
    21959, 65322,
// R30.agc:431
//			RPADTEM
// slot 21960
    21960, 2470,
// R30.agc:432
//		BOFF	SR2R		# NEED HAPO AT (-29)M FOR DISPLAY.
// slot 21961
    21961, 53784,
// R30.agc:433
//					# IF MUN CENTERED, RESCALE FROM (-27)M.
// R30.agc:434
//					# IF KERBIN CENTERED ALREADY AT (-29)M.
// R30.agc:435
//			V82EMFLG        # OFF FOR KERBIN , ON FOR MUN.
// slot 21962
    21962, 5060,
// R30.agc:436
//			+1
// slot 21963
    21963, 39832,
// R30.agc:437
//		CALL			# IF HAPO > MAXNM, SET HAPO =9999.9 NM.
// slot 21964
    21964, 65320,
// R30.agc:438
//			MAXCHK		# OTHERWISE STORE (RAPO-RPADTEM) IN HAPO.
// slot 21965
    21965, 39896,
// R30.agc:439
//STORHAPO	STODL	HAPOX
// slot 21966
    21966, 14804,
// R30.agc:440
//			RPER
// slot 21967
    21967, 30,
// R30.agc:441
//		DSU
// slot 21968
    21968, 65322,
// R30.agc:442
//			RPADTEM		# GIVES HPER AT (-29)M KERBIN, (-27)M MUN.
// slot 21969
    21969, 2470,
// R30.agc:443
//		STORE	MPAC +4		# SAVE THIS FOR COMPARISON TO HPERMIN.
// slot 21970
    21970, 226,
// R30.agc:444
//		BOFF	SR2R		# NEED HPER AT (-29)M FOR DISPLAY.
// slot 21971
    21971, 53784,
// R30.agc:445
//					# IF MUN CENTERED, RESCALE FROM (-27)M.
// R30.agc:446
//					# IF KERBIN CENTERED ALREADY AT (-29)M.
// R30.agc:447
//			V82EMFLG	# OFF FOR KERBIN, ON FOR MUN.
// slot 21972
    21972, 5060,
// R30.agc:448
//			+1
// slot 21973
    21973, 39852,
// R30.agc:449
//		CALL			# IF HPER > MAXNM, SET HPER = 9999.9 NM.
// slot 21974
    21974, 65320,
// R30.agc:450
//			MAXCHK
// slot 21975
    21975, 39896,
// R30.agc:451
//# Page 523
// R30.agc:452
//STORHPER	STODL	HPERX		# STORE (RPER - RPADTEM) INTO HPERX.
// slot 21976
    21976, 14808,
// R30.agc:453
//			MPAC +4
// slot 21977
    21977, 226,
// R30.agc:454
//		DSU	BPL		# HPERMIN AT (-29)M FOR KERBIN, (-27)M MUN
// slot 21978
    21978, 42026,
// R30.agc:455
//			HPERMIN		# IF HPER L/ HPERMIN (300 OR 35) KFT,
// slot 21979
    21979, 2466,
// R30.agc:456
//			DOTPER		# THEN ZERO INTO -TPER.
// slot 21980
    21980, 39872,
// R30.agc:457
//		DLOAD	GOTO		# OTHERWISE CALCULATE TPER.
// slot 21981
    21981, 43210,
// R30.agc:458
//			HI6ZEROS
// slot 21982
    21982, 13754,
// R30.agc:459
//			SKIPTPER
// slot 21983
    21983, 39880,
// R30.agc:460
//DOTPER		DLOAD	CALL
// slot 21984
    21984, 38090,
// R30.agc:461
//			RPER
// slot 21985
    21985, 30,
// R30.agc:462
//			CALCTPER
// slot 21986
    21986, 48232,
// R30.agc:463
//		DCOMP			# TPER IS PUT NEG INTO -TPER.
// slot 21987
    21987, 65404,
// R30.agc:464
//SKIPTPER	STODL	-TPER
// slot 21988
    21988, 14796,
// R30.agc:465
//			HPERMIN		# HPERMIN AT (-29)M FOR KERBIN, (-27)M MUN
// slot 21989
    21989, 2466,
// R30.agc:466
//		DAD	CALL
// slot 21990
    21990, 37914,
// R30.agc:467
//			RPADTEM		# RPADTEM AT (-29)M FOR KERBIN, (-27)M MUN
// slot 21991
    21991, 2470,
// R30.agc:468
//			CALCTFF		# GIVES 59M59S FOR TFF IF RPER G/
// slot 21992
    21992, 48238,
// R30.agc:469
//		DCOMP			# HPERMIN + RPADTEM.  (TPER WAS NON ZERO)
// slot 21993
    21993, 65404,
// R30.agc:470
//		STCALL	TFF		# OTHERWISE COMPUTES TFF.	(GOTO)
// slot 21994
    21994, 31176,
// R30.agc:471
//			S2
// slot 21995
    21995, 82,
// R30.agc:472
//
// R30.agc:473
//MAXCHK		DSU	BPL		# IF C(MPAC) > 9999.9 NM. MPAC = 9999.9 NM.
// slot 21996
    21996, 42026,
// R30.agc:474
//			MAXNM
// slot 21997
    21997, 7144,
// R30.agc:475
//			+3		# OTHERWISE C(MPAC) = B(MPAC).
// slot 21998
    21998, 39906,
// R30.agc:476
//		DAD	RVQ
// slot 21999
    21999, 36378
)).

agcAotInstallSourceRope(list(
// R30.agc:477
//			MAXNM
// slot 22000
    22000, 7144,
// R30.agc:478
// +3		DLOAD	RVQ		# (USED BY P30 - P37 ALSO)
// slot 22001
    22001, 36554,
// R30.agc:479
// 			MAXNM
// slot 22002
    22002, 7144,
// R30.agc:480
//
// R30.agc:481
//MAXNM		2OCT	0106505603
// slot 22003 22004
    22003, 1130, 22004, 5894
)).

// no code for the lines below
// R30.agc:482
//
// R30.agc:483
//# Page 524
// R30.agc:484
//
// R30.agc:485
//# There is no source code on this page --- HG 2009
