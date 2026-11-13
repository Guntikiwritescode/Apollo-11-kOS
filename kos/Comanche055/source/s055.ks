// PORT: Original source unit R30.agc.
// PORT: Physical bank 23. Shared continuation entries, slots 21722–21722.
function agcAotUnit1226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R30.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE R30.agc:2
//# Filename:     R30.agc
// PORT: SOURCE R30.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE R30.agc:4
//#               It is part of the source code for the Command Module's (CM)
// PORT: SOURCE R30.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE R30.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE R30.agc:7
//# Contact:      Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE R30.agc:8
//# Website:      www.ibiblio.org/apollo.
// PORT: SOURCE R30.agc:9
//# Pages:	514-524
// PORT: SOURCE R30.agc:10
//# Mod history:  2009-05-09 HG    Started adapting from the Colossus249/ file
// PORT: SOURCE R30.agc:11
//#               of the same name, using Comanche055 page
// PORT: SOURCE R30.agc:12
//#               images 0514.jpg - 0524.jpg.
// PORT: SOURCE R30.agc:13
//#
// PORT: SOURCE R30.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE R30.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE R30.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE R30.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE R30.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE R30.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE R30.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE R30.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE R30.agc:22
//#
// PORT: SOURCE R30.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE R30.agc:24
//#
// PORT: SOURCE R30.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE R30.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE R30.agc:27
//#
// PORT: SOURCE R30.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE R30.agc:29
//#            Colossus 2A
// PORT: SOURCE R30.agc:30
//
// PORT: SOURCE R30.agc:31
//# Page 514
// PORT: SOURCE R30.agc:32
//# SUBROUTINE NAME:  V82CALL
// PORT: SOURCE R30.agc:33
//# MOD NO: 0					DATE: 16 FEB 67
// PORT: SOURCE R30.agc:34
//# MOD BY: R. R. BAIRNSFATHER			LOG SECTION:  R30
// PORT: SOURCE R30.agc:35
//# MOD NO: 1	MOD BY:  R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// PORT: SOURCE R30.agc:36
//# MOD NO: 2	MOD BY:  ALONSO			DATE: 11 DEC 67		VB82 PROGRAM REWRITTEN
// PORT: SOURCE R30.agc:37
//# MOD NO: 3	MOD BY:  ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
// PORT: SOURCE R30.agc:38
//#
// PORT: SOURCE R30.agc:39
//# NEW FUNCTIONAL DESCRIPTION:	CALLED BY VERB 82 ENTER.  PRIORITY 10.
// PORT: SOURCE R30.agc:40
//# USED THROUGHOUT.		CALCULATE AND DISPLAY ORBITAL PARAMETERS
// PORT: SOURCE R30.agc:41
//#
// PORT: SOURCE R30.agc:42
//# 1.	IF AVERAGE G IS OFF:
// PORT: SOURCE R30.agc:43
//#		FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
// PORT: SOURCE R30.agc:44
//#			TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2=1).  ASTRONAUT
// PORT: SOURCE R30.agc:45
//#			CAN CHANGE TO OTHER SHIP BY V22EXE. WHERE X IS NOT EQ 1.
// PORT: SOURCE R30.agc:46
//#		SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
// PORT: SOURCE R30.agc:47
//#		CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
// PORT: SOURCE R30.agc:48
//#			RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
// PORT: SOURCE R30.agc:49
//#			HEIGHT ABOVE LAUNCH PAD OR LAUNAR LANDING SITE), HARD (APOGEE
// PORT: SOURCE R30.agc:50
//#			HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
// PORT: SOURCE R30.agc:51
//#			INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// PORT: SOURCE R30.agc:52
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59MS59S IF IT WAS
// PORT: SOURCE R30.agc:53
//#			NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
// PORT: SOURCE R30.agc:54
//#			ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
// PORT: SOURCE R30.agc:55
//#			DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
// PORT: SOURCE R30.agc:56
//#			ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
// PORT: SOURCE R30.agc:57
//# 2.	IF AVERAGE G IS ON:
// PORT: SOURCE R30.agc:58
//#		CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
// PORT: SOURCE R30.agc:59
//#			FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
// PORT: SOURCE R30.agc:60
//#			OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
// PORT: SOURCE R30.agc:61
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).
// PORT: SOURCE R30.agc:62
//#			IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
// PORT: SOURCE R30.agc:63
//#			RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
// PORT: SOURCE R30.agc:64
//
// PORT: SOURCE R30.agc:65
//# ADDENDUM:  HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// PORT: SOURCE R30.agc:66
//#	     ABOVE REMARKS.
// PORT: SOURCE R30.agc:67
//#
// PORT: SOURCE R30.agc:68
//# CALLING SEQUENCE: VERB 82 ENTER.
// PORT: SOURCE R30.agc:69
//#
// PORT: SOURCE R30.agc:70
//# SUBROUTINES CALLED:	SR30.1, GOXDSPF
// PORT: SOURCE R30.agc:71
//#			MAYBE -- THISPREC, OTHPREC, LOADTIME, DELRSPL
// PORT: SOURCE R30.agc:72
//#
// PORT: SOURCE R30.agc:73
//# NORMAL EXIT MODES:  TC ENDEXT
// PORT: SOURCE R30.agc:74
//#
// PORT: SOURCE R30.agc:75
//# ALARMS:  NONE
// PORT: SOURCE R30.agc:76
//#
// PORT: SOURCE R30.agc:77
//# OUTPUT:	HAPOX	(-29) M
// PORT: SOURCE R30.agc:78
//#		HPERX	(-29) M
// PORT: SOURCE R30.agc:79
//#		RAPO	(-29) M EARTH
// PORT: SOURCE R30.agc:80
//#			(-27) M MOON
// PORT: SOURCE R30.agc:81
//# Page 515
// PORT: SOURCE R30.agc:82
//#		RPER	(-29) M EARTH
// PORT: SOURCE R30.agc:83
//#			(-27) M MOON
// PORT: SOURCE R30.agc:84
//#		TFF	(-28) CS	CONTAINS NEGATIVE QUANTITY
// PORT: SOURCE R30.agc:85
//#		-TPER	(-28) CS	CONTAINS NEGATIVE QUANTITY
// PORT: SOURCE R30.agc:86
//#		RSP-RREC(-29) M		IF DELRSPL CALLED
// PORT: SOURCE R30.agc:87
//#
// PORT: SOURCE R30.agc:88
//# ERASABLE INITIALIZATION REQUIRED: STATE VECTOR.
// PORT: SOURCE R30.agc:89
//#
// PORT: SOURCE R30.agc:90
//# DEBRIS:	QPRET, RONE, VONE,TFF/RTMU, HPERMIN, RPADTEM, V82EMFLG.
// PORT: SOURCE R30.agc:91
//#		MAYBE:  TSTART82, V82FLAGS, TDEC1.
// PORT: SOURCE R30.agc:92
//
// PORT: SOURCE R30.agc:93
//		EBANK=	HAPOX
// PORT: SOURCE R30.agc:94
//		BANK	31
// PORT: SOURCE R30.agc:95
//		SETLOC	R30LOC
// PORT: SOURCE R30.agc:96
//		BANK
// PORT: SOURCE R30.agc:97
//		COUNT*	$$/R30
// PORT: SOURCE R30.agc:98
//
// PORT: SOURCE R30.agc:99
//V82CALL		TC	INTPRET
// PORT: Fixed ROM slots 21722.
    if slot <> 21722 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1226] to agcAotUnit1226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:100
//		BON	GOTO
// PORT: Fixed ROM slots 21723.
    21723, 43032,
// PORT: SOURCE R30.agc:101
//			AVEGFLAG
// PORT: Fixed ROM slots 21724.
    21724, 924,
// PORT: SOURCE R30.agc:102
//			V82GON		# IF AVERAGE G ON
// PORT: Fixed ROM slots 21725.
    21725, 39660,
// PORT: SOURCE R30.agc:103
//			V82GOFF		# IF AVERAGE G OFF
// PORT: Fixed ROM slots 21726.
    21726, 39358,
// PORT: SOURCE R30.agc:104
//
// PORT: SOURCE R30.agc:105
//V82GOFF		EXIT			# ALLOW ASTRONAUT TO SELECT VEHICLE
// PORT: Fixed ROM slots 21727.
    21727, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21728–21733.
function agcAotUnit1227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21730 {
        if slot <= 21728 {
// PORT: SOURCE R30.agc:106
//		CAF	TWO		# DESIRED FOR ORBITAL PARAMETERS
// PORT: Fixed ROM slots 21728.
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
// PORT: SOURCE R30.agc:107
//		TS	OPTIONX
// PORT: Fixed ROM slots 21729.
                if slot <> 21729 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:108
//		CAF	ONE
// PORT: Fixed ROM slots 21730.
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
// PORT: SOURCE R30.agc:109
//		TS	OPTIONX +1
// PORT: Fixed ROM slots 21731.
            if slot <> 21731 or instruction <> 23082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21732 {
// PORT: SOURCE R30.agc:110
//		CAF	OPTIONVN	# V 04 N 06
// PORT: Fixed ROM slots 21732.
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
// PORT: SOURCE R30.agc:111
//		TC	BANKCALL
// PORT: Fixed ROM slots 21733.
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
// PORT: SOURCE R30.agc:112
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 21734.
    21734, 17122
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21735–21739.
function agcAotUnit1228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21736 {
        if slot <= 21735 {
// PORT: SOURCE R30.agc:113
//		TC	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 21735.
            if slot <> 21735 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:114
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 21736.
            if slot <> 21736 or instruction <> 1258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21737 {
// PORT: SOURCE R30.agc:115
//		TC	-5		# DATA IN.  OPTIONX +1 = 1 FOR THIS VEHIC.
// PORT: Fixed ROM slots 21737.
            if slot <> 21737 or instruction <> 1252 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1252, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21738 {
// PORT: SOURCE R30.agc:116
//					#		 UNEQ 1 FOR OTHER VEHICLE.
// PORT: SOURCE R30.agc:117
//		CAF	BIT4		# 80 MS
// PORT: Fixed ROM slots 21738.
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
// PORT: SOURCE R30.agc:118
//		TC	WAITLIST
// PORT: Fixed ROM slots 21739.
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
// PORT: SOURCE R30.agc:119
//		EBANK=	TFF
// PORT: SOURCE R30.agc:120
//		2CADR	TICKTEST
// PORT: Fixed ROM slots 21740 21741.
    21740, 2738, 21741, 39016
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21742–21748.
function agcAotUnit1229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21744 {
        if slot <= 21742 {
// PORT: SOURCE R30.agc:121
//
// PORT: SOURCE R30.agc:122
//		RELINT
// PORT: Fixed ROM slots 21742.
            if slot <> 21742 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21743 {
// PORT: SOURCE R30.agc:123
//V82GOFLP	CAF	TFFBANK		# MAJOR RECYCLE LOOP ENTRY
// PORT: Fixed ROM slots 21743.
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
// PORT: SOURCE R30.agc:124
//		TS	EBANK
// PORT: Fixed ROM slots 21744.
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
// PORT: SOURCE R30.agc:125
//		CAF	ZERO
// PORT: Fixed ROM slots 21745.
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
// PORT: SOURCE R30.agc:126
//		TS	V82FLAGS	# ZERO FLAGS FOR TICKTEST, INHIBITS
// PORT: Fixed ROM slots 21746.
                if slot <> 21746 or instruction <> 23522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23522, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21747 {
// PORT: SOURCE R30.agc:127
//					# DECREMENTING OF TFF AND -TPER.
// PORT: SOURCE R30.agc:128
//		CAF	PRIO7
// PORT: Fixed ROM slots 21747.
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
// PORT: SOURCE R30.agc:129
//		TC	FINDVAC		# V82GOFF1 WILL EXECUTE STATE VECTOR
// PORT: Fixed ROM slots 21748.
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
// PORT: SOURCE R30.agc:130
//# Page 516
// PORT: SOURCE R30.agc:131
//		EBANK=	TFF		# UPDATE AND ORBIT CALCULATIONS FOR
// PORT: SOURCE R30.agc:132
//		2CADR	V82GOFF1	# SELECTED VEHICLE ABOUT PROPER BODY.
// PORT: Fixed ROM slots 21749 21750.
    21749, 2578, 21750, 39016
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21751–21757.
function agcAotUnit1230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21753 {
        if slot <= 21751 {
// PORT: SOURCE R30.agc:133
//
// PORT: SOURCE R30.agc:134
//		RELINT
// PORT: Fixed ROM slots 21751.
            if slot <> 21751 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21752 {
// PORT: SOURCE R30.agc:135
//V82STALL	CAF	THREE		# STALL IN THIS LOOP AND WITHOLD V 16 N 44
// PORT: Fixed ROM slots 21752.
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
// PORT: SOURCE R30.agc:136
//		MASK	V82FLAGS	# UNTIL STATE VECTOR UPDATE SETS ONE OF
// PORT: Fixed ROM slots 21753.
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
// PORT: SOURCE R30.agc:137
//		CCS	A		# OUR FLAG BITS.
// PORT: Fixed ROM slots 21754.
                if slot <> 21754 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:138
//		TC	FLAGGON		# EXIT FROM STALL LOOP.
// PORT: Fixed ROM slots 21755.
                if slot <> 21755 or instruction <> 1280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21756 {
// PORT: SOURCE R30.agc:139
//		CAF	1SEC
// PORT: Fixed ROM slots 21756.
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
// PORT: SOURCE R30.agc:140
//		TC	BANKCALL
// PORT: Fixed ROM slots 21757.
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
// PORT: SOURCE R30.agc:141
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 21758.
    21758, 1972
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21759–21761.
function agcAotUnit1231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21759 {
// PORT: SOURCE R30.agc:142
//		TC	V82STALL
// PORT: Fixed ROM slots 21759.
        if slot <> 21759 or instruction <> 1272 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1272, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21760 {
// PORT: SOURCE R30.agc:143
//
// PORT: SOURCE R30.agc:144
//FLAGGON		CAF	V16N44		# MONITOR HAPO,HPER,TFF.
// PORT: Fixed ROM slots 21760.
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
// PORT: SOURCE R30.agc:145
//		TC	BANKCALL
// PORT: Fixed ROM slots 21761.
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
// PORT: SOURCE R30.agc:146
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 21762.
    21762, 17122
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21763–21765.
function agcAotUnit1232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21763 {
// PORT: SOURCE R30.agc:147
//		TC	B5OFF		# TERM  THIS TELLS TICKTEST TO KILL ITSELF
// PORT: Fixed ROM slots 21763.
        if slot <> 21763 or instruction <> 2965 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2965, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21764 {
// PORT: SOURCE R30.agc:148
//		TC	B5OFF		# PROCEED  DITTO
// PORT: Fixed ROM slots 21764.
            if slot <> 21764 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:149
//		TC	V82GOFLP	# RECYCLE  RECOMPUTE STATE VECT + DISPLAY
// PORT: Fixed ROM slots 21765.
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
// PORT: SOURCE R30.agc:150
//
// PORT: SOURCE R30.agc:151
//OPTIONVN	VN	0412
// PORT: Fixed ROM slots 21766.
    21766, 1048,
// PORT: SOURCE R30.agc:152
//V16N44		VN	1644
// PORT: Fixed ROM slots 21767.
    21767, 4184,
// PORT: SOURCE R30.agc:153
//TFFBANK		ECADR	TFF
// PORT: Fixed ROM slots 21768.
    21768, 2502
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21769–21769.
function agcAotUnit1233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R30.agc:154
//
// PORT: SOURCE R30.agc:155
//V82GOFF1	TC	INTPRET
// PORT: Fixed ROM slots 21769.
    if slot <> 21769 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1233] to agcAotUnit1233@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:156
//		RTB
// PORT: Fixed ROM slots 21770.
    21770, 65336,
// PORT: SOURCE R30.agc:157
//			LOADTIME
// PORT: Fixed ROM slots 21771.
    21771, 38544,
// PORT: SOURCE R30.agc:158
//		STORE	TDEC1		# TIME FOR STATE VECTOR UPDATE.
// PORT: Fixed ROM slots 21772.
    21772, 66,
// PORT: SOURCE R30.agc:159
//		STORE	TSTART82	# TIME FOR INTERNAL USE.
// PORT: Fixed ROM slots 21773.
    21773, 2474,
// PORT: SOURCE R30.agc:160
//		EXIT
// PORT: Fixed ROM slots 21774.
    21774, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21775–21779.
function agcAotUnit1234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21776 {
        if slot <= 21775 {
// PORT: SOURCE R30.agc:161
//		CS	OPTIONX +1	# 1 FOR THIS VEHICLE, NOT 1 FOR OTHER
// PORT: Fixed ROM slots 21775.
            if slot <> 21775 or instruction <> 16938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 554).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:162
//		AD	ONE
// PORT: Fixed ROM slots 21776.
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
// PORT: SOURCE R30.agc:163
//		EXTEND
// PORT: Fixed ROM slots 21777.
            if slot <> 21777 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21778 {
// PORT: SOURCE R30.agc:164
//		BZF	THISSHIP
// PORT: Fixed ROM slots 21778.
                if slot <> 21778 or instruction <> 5414 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5414, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:165
//OTHSHIP		TC	INTPRET
// PORT: Fixed ROM slots 21779.
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
// PORT: SOURCE R30.agc:166
//		CALL			# CALL STATE VECTOR UPDATE FOR OTHER SHIP.
// PORT: Fixed ROM slots 21780.
    21780, 65320,
// PORT: SOURCE R30.agc:167
//			OTHPREC
// PORT: Fixed ROM slots 21781.
    21781, 23690,
// PORT: SOURCE R30.agc:168
//BOTHSHIP	VLOAD			# MOVE RESULTS INTO TFFCONIC STORAGE AREAS
// PORT: Fixed ROM slots 21782.
    21782, 65530,
// PORT: SOURCE R30.agc:169
//			RATT		# TO BE CALLED BY SR30.1.
// PORT: Fixed ROM slots 21783.
    21783, 2,
// PORT: SOURCE R30.agc:170
//		STOVL	RONE		# RATT AT (-29)M FOR EARTH OR MOON
// PORT: Fixed ROM slots 21784.
    21784, 22958,
// PORT: SOURCE R30.agc:171
//			VATT
// PORT: Fixed ROM slots 21785.
    21785, 14,
// PORT: SOURCE R30.agc:172
//		STORE	VONE		# VATT AT (-7)M/CS FOR EARTH OR MOON
// PORT: Fixed ROM slots 21786.
    21786, 2490,
// PORT: SOURCE R30.agc:173
//		DLOAD*
// PORT: Fixed ROM slots 21787.
    21787, 65478,
// PORT: SOURCE R30.agc:174
//			1/RTMUE,2	# X2 IS 0 FOR EARTH CENTERED STATE VEC
// PORT: Fixed ROM slots 21788.
    21788, 58786,
// PORT: SOURCE R30.agc:175
//		STORE	TFF/RTMU	# X2 IS 2 FOR MOON
// PORT: Fixed ROM slots 21789.
    21789, 62,
// PORT: SOURCE R30.agc:176
//		DLOAD*			# AS LEFT BY THISPREC OR OTHPREC.
// PORT: Fixed ROM slots 21790.
    21790, 65478,
// PORT: SOURCE R30.agc:177
//			MINPERE,2
// PORT: Fixed ROM slots 21791.
    21791, 58778,
// PORT: SOURCE R30.agc:178
//		STORE	HPERMIN		# TFFRTMU, HPERMIN, AND RPADTEM ARE ALL
// PORT: Fixed ROM slots 21792.
    21792, 2466,
// PORT: SOURCE R30.agc:179
//		SLOAD	BHIZ		# EARTH/MOON PARAMETERS AS SET HERE.
// PORT: Fixed ROM slots 21793.
    21793, 39098,
// PORT: SOURCE R30.agc:180
//# Page 517
// PORT: SOURCE R30.agc:181
//			X2
// PORT: Fixed ROM slots 21794.
    21794, 80,
// PORT: SOURCE R30.agc:182
//			EARTHPAD
// PORT: Fixed ROM slots 21795.
    21795, 39526,
// PORT: SOURCE R30.agc:183
//		GOTO
// PORT: Fixed ROM slots 21796.
    21796, 65360,
// PORT: SOURCE R30.agc:184
//			MOONPAD
// PORT: Fixed ROM slots 21797.
    21797, 39534
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21798–21798.
function agcAotUnit1235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R30.agc:185
//THISSHIP	TC	INTPRET
// PORT: Fixed ROM slots 21798.
    if slot <> 21798 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1235] to agcAotUnit1235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:186
//		CALL			# CALL STATE VECTOR UPDATE FOR THIS SHIP.
// PORT: Fixed ROM slots 21799.
    21799, 65320,
// PORT: SOURCE R30.agc:187
//			THISPREC
// PORT: Fixed ROM slots 21800.
    21800, 23666,
// PORT: SOURCE R30.agc:188
//		GOTO
// PORT: Fixed ROM slots 21801.
    21801, 65360,
// PORT: SOURCE R30.agc:189
//			BOTHSHIP
// PORT: Fixed ROM slots 21802.
    21802, 39468,
// PORT: SOURCE R30.agc:190
//
// PORT: SOURCE R30.agc:191
//# THE FOLLOWING CONSTANTS ARE PAIRWISE INDEXED.  DO NOT SEPARATE PAIRS.
// PORT: SOURCE R30.agc:192
//
// PORT: SOURCE R30.agc:193
//1/RTMUM		2DEC*	.45162595 E-4 B14*
// PORT: Fixed ROM slots 21803 21804.
    21803, 24246, 21804, 7922,
// PORT: SOURCE R30.agc:194
//1/RTMUE		2DEC*	.50087529 E-5 B17*
// PORT: Fixed ROM slots 21805 21806.
    21805, 21512, 21806, 7044,
// PORT: SOURCE R30.agc:195
//
// PORT: SOURCE R30.agc:196
//MINPERM		2DEC	10668 B-27	# 35 KFT MIN PERIGEE HEIGHT FOR MOON(-27)M
// PORT: Fixed ROM slots 21807 21808.
    21807, 2, 21808, 9904,
// PORT: SOURCE R30.agc:197
//MINPERE		2DEC	91440 B-29	# 300 KFT (-29)M FOR EARTH
// PORT: Fixed ROM slots 21809 21810.
    21809, 4, 21810, 25904,
// PORT: SOURCE R30.agc:198
//
// PORT: SOURCE R30.agc:199
//EARTHPAD	DLOAD	CLRGO		# PAD 37-B RADIUS.  SCALED AT (-29)M.
// PORT: Fixed ROM slots 21811.
    21811, 36042,
// PORT: SOURCE R30.agc:200
//			RPAD
// PORT: Fixed ROM slots 21812.
    21812, 5332,
// PORT: SOURCE R30.agc:201
//			V82EMFLG	# INDICATE EARTH SCALING FOR SR30.1
// PORT: Fixed ROM slots 21813.
    21813, 4900,
// PORT: SOURCE R30.agc:202
//			BOTHPAD
// PORT: Fixed ROM slots 21814.
    21814, 39542,
// PORT: SOURCE R30.agc:203
//
// PORT: SOURCE R30.agc:204
//MOONPAD		VLOAD	ABVAL		# COMPUTE MOON PAD RADIUS FROM RLS VECTOR.
// PORT: Fixed ROM slots 21815.
    21815, 42746,
// PORT: SOURCE R30.agc:205
//			RLS		# SCALED AT (-27)M.
// PORT: Fixed ROM slots 21816.
    21816, 2092,
// PORT: SOURCE R30.agc:206
//		SET
// PORT: Fixed ROM slots 21817.
    21817, 65304,
// PORT: SOURCE R30.agc:207
//			V82EMFLG	# INDICATE MOON SCALING FOR SR30.1
// PORT: Fixed ROM slots 21818.
    21818, 4708,
// PORT: SOURCE R30.agc:208
//BOTHPAD		STCALL	RPADTEM
// PORT: Fixed ROM slots 21819.
    21819, 31142,
// PORT: SOURCE R30.agc:209
//			SR30.1		# CALCULATE ORBITAL PARAMETERS
// PORT: Fixed ROM slots 21820.
    21820, 39790,
// PORT: SOURCE R30.agc:210
//		EXIT
// PORT: Fixed ROM slots 21821.
    21821, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21822–21825.
function agcAotUnit1236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21823 {
        if slot <= 21822 {
// PORT: SOURCE R30.agc:211
//		CA	MODREG		# ARE WE IN P00
// PORT: Fixed ROM slots 21822.
            if slot <> 21822 or instruction <> 12809 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:212
//		EXTEND
// PORT: Fixed ROM slots 21823.
            if slot <> 21823 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21824 {
// PORT: SOURCE R30.agc:213
//		BZF	CANDEL		# YES, DO DELRSPL
// PORT: Fixed ROM slots 21824.
            if slot <> 21824 or instruction <> 5541 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5541, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:214
//SPLRET1		TC	INTPRET
// PORT: Fixed ROM slots 21825.
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
// PORT: SOURCE R30.agc:215
//		RTB	DSU
// PORT: Fixed ROM slots 21826.
    21826, 38200,
// PORT: SOURCE R30.agc:216
//			LOADTIME
// PORT: Fixed ROM slots 21827.
    21827, 38544,
// PORT: SOURCE R30.agc:217
//			TSTART82	# PRESENT TIME - TIME V82GOFF1 BEGAN
// PORT: Fixed ROM slots 21828.
    21828, 2474,
// PORT: SOURCE R30.agc:218
//		STORE	TSTART82	#                SAVE IT
// PORT: Fixed ROM slots 21829.
    21829, 2474,
// PORT: SOURCE R30.agc:219
//		DLOAD	BZE		# SR30.1 SETS -TPER=0 IF HPER L/
// PORT: Fixed ROM slots 21830.
    21830, 44234,
// PORT: SOURCE R30.agc:220
//			-TPER		# HPERMIN (300 OR 35) KFT.
// PORT: Fixed ROM slots 21831.
    21831, 2508,
// PORT: SOURCE R30.agc:221
//			TICKTFF		# (-TPER = 0)
// PORT: Fixed ROM slots 21832.
    21832, 39586,
// PORT: SOURCE R30.agc:222
//TICKTPER	DLOAD	DAD		# (-TPER NON ZERO)  TFF WAS NOT COMPUTED,
// PORT: Fixed ROM slots 21833.
    21833, 36298,
// PORT: SOURCE R30.agc:223
//			-TPER		# BUT WAS SET TO 59M59S.DON'T DICK TFF, DO
// PORT: Fixed ROM slots 21834.
    21834, 2508,
// PORT: SOURCE R30.agc:224
//			TSTART82	# TICK -TPER. DISPLAY BOTH.
// PORT: Fixed ROM slots 21835.
    21835, 2474,
// PORT: SOURCE R30.agc:225
//		STORE	-TPER           # -TPER CORRECTED FOR TIME SINCE V82GOFF1
// PORT: Fixed ROM slots 21836.
    21836, 2508,
// PORT: SOURCE R30.agc:226
//		EXIT                    # BEGAN.
// PORT: Fixed ROM slots 21837.
    21837, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21838–21840.
function agcAotUnit1237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21838 {
// PORT: SOURCE R30.agc:227
//
// PORT: SOURCE R30.agc:228
//# Page 518
// PORT: SOURCE R30.agc:229
//		CAF	BIT1
// PORT: Fixed ROM slots 21838.
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
// PORT: SOURCE R30.agc:230
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY -TPER
// PORT: Fixed ROM slots 21839.
            if slot <> 21839 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:231
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 21840.
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
// PORT: SOURCE R30.agc:232
//
// PORT: SOURCE R30.agc:233
//TICKTFF		DLOAD	DAD		# (-TPER=0)  TFF WAS COMPUTED.TICK TFF.
// PORT: Fixed ROM slots 21841.
    21841, 36298,
// PORT: SOURCE R30.agc:234
//			TFF		# DO NOT TICK -TPER.DISPLAY TFF, BUT NOT
// PORT: Fixed ROM slots 21842.
    21842, 2504,
// PORT: SOURCE R30.agc:235
//			TSTART82	# -TPER.
// PORT: Fixed ROM slots 21843.
    21843, 2474,
// PORT: SOURCE R30.agc:236
//		STORE	TFF		# TFF CORRECTED FOR TIME SINCE V82GOFF1
// PORT: Fixed ROM slots 21844.
    21844, 2504,
// PORT: SOURCE R30.agc:237
//		EXIT			# BEGAN.
// PORT: Fixed ROM slots 21845.
    21845, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21846–21854.
function agcAotUnit1238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21849 {
        if slot <= 21847 {
            if slot <= 21846 {
// PORT: SOURCE R30.agc:238
//		CAF	BIT2
// PORT: Fixed ROM slots 21846.
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
// PORT: SOURCE R30.agc:239
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY TFF.
// PORT: Fixed ROM slots 21847.
                if slot <> 21847 or instruction <> 23522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23522, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21848 {
// PORT: SOURCE R30.agc:240
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 21848.
                if slot <> 21848 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:241
//
// PORT: SOURCE R30.agc:242
//TICKTEST	CAF	BIT5		# THIS WAITLIST PROGRAM PERPETUATES ITSELF
// PORT: Fixed ROM slots 21849.
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
// PORT: SOURCE R30.agc:243
//		MASK	EXTVBACT	# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// PORT: Fixed ROM slots 21850.
                if slot <> 21850 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:244
//		CCS	A
// PORT: Fixed ROM slots 21851.
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
// PORT: SOURCE R30.agc:245
//		TC	DOTICK
// PORT: Fixed ROM slots 21852.
                if slot <> 21852 or instruction <> 1378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21853 {
// PORT: SOURCE R30.agc:246
//		CAF	PRIO25
// PORT: Fixed ROM slots 21853.
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
// PORT: SOURCE R30.agc:247
//		TC	NOVAC		# TERMINATE V 82.CAN'T CALL ENDEXT IN RUPT.
// PORT: Fixed ROM slots 21854.
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
// PORT: SOURCE R30.agc:248
//		EBANK=	EXTVBACT
// PORT: SOURCE R30.agc:249
//		2CADR	ENDEXT
// PORT: Fixed ROM slots 21855 21856.
    21855, 5816, 21856, 4196
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21857–21859.
function agcAotUnit1239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21857 {
// PORT: SOURCE R30.agc:250
//
// PORT: SOURCE R30.agc:251
//		TC	TASKOVER
// PORT: Fixed ROM slots 21857.
        if slot <> 21857 or instruction <> 2772 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2772, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21858 {
// PORT: SOURCE R30.agc:252
//DOTICK		CAF	1SEC		# RE-REQUEST TICKTEST.
// PORT: Fixed ROM slots 21858.
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
// PORT: SOURCE R30.agc:253
//		TC	WAITLIST
// PORT: Fixed ROM slots 21859.
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
// PORT: SOURCE R30.agc:254
//		EBANK=	TFF
// PORT: SOURCE R30.agc:255
//		2CADR	TICKTEST
// PORT: Fixed ROM slots 21860 21861.
    21860, 2738, 21861, 39016
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21862–21864.
function agcAotUnit1240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21862 {
// PORT: SOURCE R30.agc:256
//
// PORT: SOURCE R30.agc:257
//		CAF	THREE
// PORT: Fixed ROM slots 21862.
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
// PORT: SOURCE R30.agc:258
//		MASK	V82FLAGS
// PORT: Fixed ROM slots 21863.
            if slot <> 21863 or instruction <> 29666 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 994).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:259
//		INDEX	A
// PORT: Fixed ROM slots 21864.
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
// PORT: SOURCE R30.agc:260
//		TC	+1
// PORT: Fixed ROM slots 21865.
    21865, 2772
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21866–21877.
function agcAotUnit1241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21871 {
        if slot <= 21868 {
            if slot <= 21866 {
// PORT: SOURCE R30.agc:261
//		TC	TASKOVER	# IF NO FLAGBITS SET DONT CHANGE TFF OR
// PORT: Fixed ROM slots 21866.
                if slot <> 21866 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21867 {
// PORT: SOURCE R30.agc:262
//					# -TPER, BUT CONTINUE LOOP.
// PORT: SOURCE R30.agc:263
//		TC	TPERTICK	# ONLY BIT 1 SET. INCR -TPER BY 1 SEC.
// PORT: Fixed ROM slots 21867.
                    if slot <> 21867 or instruction <> 1393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1393, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R30.agc:264
//TFFTICK		CAF	1SEC		# ONLY BIT 2 SET. INCR TFF BY 1 SEC.
// PORT: Fixed ROM slots 21868.
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
// PORT: SOURCE R30.agc:265
//		TS	L
// PORT: Fixed ROM slots 21869.
                if slot <> 21869 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21870 {
// PORT: SOURCE R30.agc:266
//		CAF	ZERO
// PORT: Fixed ROM slots 21870.
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
// PORT: SOURCE R30.agc:267
//		DAS	TFF
// PORT: Fixed ROM slots 21871.
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
// PORT: SOURCE R30.agc:268
//		TC	TASKOVER
// PORT: Fixed ROM slots 21872.
                if slot <> 21872 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21873 {
// PORT: SOURCE R30.agc:269
//TPERTICK	CAF	1SEC
// PORT: Fixed ROM slots 21873.
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
// PORT: SOURCE R30.agc:270
//		TS	L
// PORT: Fixed ROM slots 21874.
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
// PORT: SOURCE R30.agc:271
//		CAF	ZERO
// PORT: Fixed ROM slots 21875.
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
// PORT: SOURCE R30.agc:272
//		DAS	-TPER
// PORT: Fixed ROM slots 21876.
                    if slot <> 21876 or instruction <> 9190 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 998) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R30.agc:273
//		TC	TASKOVER
// PORT: Fixed ROM slots 21877.
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
// PORT: SOURCE R30.agc:274
//# Page 519
// PORT: SOURCE R30.agc:275
//V82GON		EXIT			# AVERAGE G ON. USE CURRENT STATE VECTOR
// PORT: Fixed ROM slots 21878.
    21878, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21879–21880.
function agcAotUnit1242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21879 {
// PORT: SOURCE R30.agc:276
//					# FOR ORBITAL PARAMETER CALCULATIONS.
// PORT: SOURCE R30.agc:277
//		CAF	PRIO7		# LESS THAN LAMBERT
// PORT: Fixed ROM slots 21879.
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
// PORT: SOURCE R30.agc:278
//		TC	FINDVAC		# V82GON1 WILL PERFORM ORBIT CALCULATIONS
// PORT: Fixed ROM slots 21880.
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
// PORT: SOURCE R30.agc:279
//		EBANK=	TFF		# ABOUT PROPER BODY APPROX ONCE PER SEC.
// PORT: SOURCE R30.agc:280
//		2CADR	V82GON1
// PORT: Fixed ROM slots 21881 21882.
    21881, 2824, 21882, 39016
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21883–21887.
function agcAotUnit1243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21884 {
        if slot <= 21883 {
// PORT: SOURCE R30.agc:281
//
// PORT: SOURCE R30.agc:282
//		RELINT
// PORT: Fixed ROM slots 21883.
            if slot <> 21883 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:283
//		CCS	NEWJOB		# WITHOLD V16 N44 UNTIL FIRST ORBIT CALC
// PORT: Fixed ROM slots 21884.
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
// PORT: SOURCE R30.agc:284
//		TC	CHANG1		# IS DONE. NOTE: V82GON1 (PRIO7, FINDVAC
// PORT: Fixed ROM slots 21885.
            if slot <> 21885 or instruction <> 2676 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2676, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21886 {
// PORT: SOURCE R30.agc:285
//					# JOB) IS COMPLETED BEFORE V82GON (PRIO7,
// PORT: SOURCE R30.agc:286
//					# NOVAC JOB).
// PORT: SOURCE R30.agc:287
//V82REDSP	CAF	V16N44		# MONITOR HAPO, HPER, TFF
// PORT: Fixed ROM slots 21886.
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
// PORT: SOURCE R30.agc:288
//		TC	BANKCALL
// PORT: Fixed ROM slots 21887.
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
// PORT: SOURCE R30.agc:289
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 21888.
    21888, 17122
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21889–21892.
function agcAotUnit1244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21890 {
        if slot <= 21889 {
// PORT: SOURCE R30.agc:290
//		TC	B5OFF		# TERM THIS TELLS V82GON1 TO KILL ITSELF.
// PORT: Fixed ROM slots 21889.
            if slot <> 21889 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:291
//		TC	B5OFF		# PROC DITTO.
// PORT: Fixed ROM slots 21890.
            if slot <> 21890 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21891 {
// PORT: SOURCE R30.agc:292
//		TC	V82REDSP	# RECYCLE
// PORT: Fixed ROM slots 21891.
            if slot <> 21891 or instruction <> 1406 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1406, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R30.agc:293
//
// PORT: SOURCE R30.agc:294
//V82GON1		TC	INTPRET		# THIS EXEC PROGRAM PERPETUATES ITSELF
// PORT: Fixed ROM slots 21892.
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
// PORT: SOURCE R30.agc:295
//					# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// PORT: SOURCE R30.agc:296
//		VLOAD	GOTO		# HOLDS OFF CCS NEWJOB BETWEEN RN AND
// PORT: Fixed ROM slots 21893.
    21893, 43258,
// PORT: SOURCE R30.agc:297
//			RN		# VN FETCH SO RN , VN ARE FROM SAME
// PORT: Fixed ROM slots 21894.
    21894, 1266,
// PORT: SOURCE R30.agc:298
//			NEXTLINE	# STATE VECTOR UPDATE.
// PORT: Fixed ROM slots 21895.
    21895, 39696,
// PORT: SOURCE R30.agc:299
//NEXTLINE	STOVL	RONE		# RN AT (-29)M FOR EARTH OR MOON
// PORT: Fixed ROM slots 21896.
    21896, 22958,
// PORT: SOURCE R30.agc:300
//			VN
// PORT: Fixed ROM slots 21897.
    21897, 1278,
// PORT: SOURCE R30.agc:301
//		STORE	VONE		# VN AT (-7)M/CS FOR EARTH OR MOON
// PORT: Fixed ROM slots 21898.
    21898, 2490,
// PORT: SOURCE R30.agc:302
//		BON	GOTO
// PORT: Fixed ROM slots 21899.
    21899, 43032,
// PORT: SOURCE R30.agc:303
//			AMOONFLG	# FLAG INDICATES BODY ABOUT WHICH ORBITAL
// PORT: Fixed ROM slots 21900.
    21900, 410,
// PORT: SOURCE R30.agc:304
//			MOONGON		# CALCULATIONS ARE TO BE PERFORMED.
// PORT: Fixed ROM slots 21901.
    21901, 39710,
// PORT: SOURCE R30.agc:305
//			EARTHGON	# IF SET - MOON , IF RESET - EARTH.
// PORT: Fixed ROM slots 21902.
    21902, 39728,
// PORT: SOURCE R30.agc:306
//
// PORT: SOURCE R30.agc:307
//MOONGON		SET	DLOAD
// PORT: Fixed ROM slots 21903.
    21903, 58648,
// PORT: SOURCE R30.agc:308
//			V82EMFLG	# INDICATE MOON SCALING FOR SR30.1
// PORT: Fixed ROM slots 21904.
    21904, 4708,
// PORT: SOURCE R30.agc:309
//			1/RTMUM		# LUNAR PARAMETERS LOADED HERE FOR SR30.1
// PORT: Fixed ROM slots 21905.
    21905, 6744,
// PORT: SOURCE R30.agc:310
//		STODL	TFF/RTMU
// PORT: Fixed ROM slots 21906.
    21906, 12350,
// PORT: SOURCE R30.agc:311
//			MINPERM
// PORT: Fixed ROM slots 21907.
    21907, 6752,
// PORT: SOURCE R30.agc:312
//		STOVL	HPERMIN
// PORT: Fixed ROM slots 21908.
    21908, 22946,
// PORT: SOURCE R30.agc:313
//			RLS		# SCALED AT (-27)M
// PORT: Fixed ROM slots 21909.
    21909, 2092,
// PORT: SOURCE R30.agc:314
//		ABVAL	GOTO
// PORT: Fixed ROM slots 21910.
    21910, 43084,
// PORT: SOURCE R30.agc:315
//			V82GON2
// PORT: Fixed ROM slots 21911.
    21911, 39742,
// PORT: SOURCE R30.agc:316
//EARTHGON	CLEAR	DLOAD
// PORT: Fixed ROM slots 21912.
    21912, 58648,
// PORT: SOURCE R30.agc:317
//			V82EMFLG	# INDICATE EARTH SCALING FOR SR30.1
// PORT: Fixed ROM slots 21913.
    21913, 4964,
// PORT: SOURCE R30.agc:318
//			1/RTMUE		# EARTH PARAMETERS LOADED HERE FOR SR30.1
// PORT: Fixed ROM slots 21914.
    21914, 6748,
// PORT: SOURCE R30.agc:319
//		STODL	TFF/RTMU
// PORT: Fixed ROM slots 21915.
    21915, 12350,
// PORT: SOURCE R30.agc:320
//			MINPERE
// PORT: Fixed ROM slots 21916.
    21916, 6756,
// PORT: SOURCE R30.agc:321
//		STODL	HPERMIN
// PORT: Fixed ROM slots 21917.
    21917, 14754,
// PORT: SOURCE R30.agc:322
//			RPAD
// PORT: Fixed ROM slots 21918.
    21918, 5332,
// PORT: SOURCE R30.agc:323
//V82GON2		STCALL	RPADTEM		# COMMON CODE FOR EARTH & MOON.
// PORT: Fixed ROM slots 21919.
    21919, 31142,
// PORT: SOURCE R30.agc:324
//			SR30.1
// PORT: Fixed ROM slots 21920.
    21920, 39790,
// PORT: SOURCE R30.agc:325
//# Page 520
// PORT: SOURCE R30.agc:326
//		EXIT
// PORT: Fixed ROM slots 21921.
    21921, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21922–21922.
function agcAotUnit1245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R30.agc:327
//		TC	CHECKMM
// PORT: Fixed ROM slots 21922.
    if slot <> 21922 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1245] to agcAotUnit1245@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:328
//		DEC	11
// PORT: Fixed ROM slots 21923.
    21923, 22
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21924–21925.
function agcAotUnit1246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21924 {
// PORT: SOURCE R30.agc:329
//		TC	V82GON3		# NOT IN MODE 11.
// PORT: Fixed ROM slots 21924.
        if slot <> 21924 or instruction <> 1455 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1455, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R30.agc:330
//CANDEL		TC	INTPRET		# IN MODE 11 OR 00
// PORT: Fixed ROM slots 21925.
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
// PORT: SOURCE R30.agc:331
//		CALL
// PORT: Fixed ROM slots 21926.
    21926, 65320,
// PORT: SOURCE R30.agc:332
//			INTSTALL	# DELRSPL DOES INTWAKE
// PORT: Fixed ROM slots 21927.
    21927, 24132,
// PORT: SOURCE R30.agc:333
//		DLOAD	CALL
// PORT: Fixed ROM slots 21928.
    21928, 38090,
// PORT: SOURCE R30.agc:334
//			TFF
// PORT: Fixed ROM slots 21929.
    21929, 2504,
// PORT: SOURCE R30.agc:335
//			DELRSPL		# RETURN IS TO NEXT LINE ( SPLRET ).
// PORT: Fixed ROM slots 21930.
    21930, 53278,
// PORT: SOURCE R30.agc:336
//SPLRET		EXIT
// PORT: Fixed ROM slots 21931.
    21931, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21932–21940.
function agcAotUnit1247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21935 {
        if slot <= 21933 {
            if slot <= 21932 {
// PORT: SOURCE R30.agc:337
//
// PORT: SOURCE R30.agc:338
//		CA	MODREG
// PORT: Fixed ROM slots 21932.
                if slot <> 21932 or instruction <> 12809 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:339
//		EXTEND
// PORT: Fixed ROM slots 21933.
                if slot <> 21933 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21934 {
// PORT: SOURCE R30.agc:340
//		BZF	SPLRET1
// PORT: Fixed ROM slots 21934.
                if slot <> 21934 or instruction <> 5441 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5441, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:341
//V82GON3		CAF	BIT5
// PORT: Fixed ROM slots 21935.
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
// PORT: SOURCE R30.agc:342
//		MASK	EXTVBACT	# SEE IF ASTRONAUT HAS SIGNALLED TERMINATE
// PORT: Fixed ROM slots 21936.
                if slot <> 21936 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R30.agc:343
//		EXTEND
// PORT: Fixed ROM slots 21937.
                if slot <> 21937 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21938 {
// PORT: SOURCE R30.agc:344
//		BZF	ENDEXT		# YES, TERMINATE VB 82 LOOP
// PORT: Fixed ROM slots 21938.
                if slot <> 21938 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21939 {
// PORT: SOURCE R30.agc:345
//		CAF	1SEC
// PORT: Fixed ROM slots 21939.
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
// PORT: SOURCE R30.agc:346
//		TC	BANKCALL	# WAIT ONE SECOND BEFORE REPEATING
// PORT: Fixed ROM slots 21940.
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
// PORT: SOURCE R30.agc:347
//		CADR	DELAYJOB	# ORBITAL PARAMETER COMPUTATION.
// PORT: Fixed ROM slots 21941.
    21941, 1972
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21942–21942.
function agcAotUnit1248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R30.agc:348
//		TC	V82GON1
// PORT: Fixed ROM slots 21942.
    if slot <> 21942 or instruction <> 1412 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1412, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1248] to agcAotUnit1248@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:349
//
// PORT: SOURCE R30.agc:350
//# Page 521
// PORT: SOURCE R30.agc:351
//# SUBROUTINE NAME: SR30.1
// PORT: SOURCE R30.agc:352
//# MOD NO: 0								DATE: 		16 FEB 67
// PORT: SOURCE R30.agc:353
//# MOD BY: R. R. BAIRNSFATHER						LOG SECTION:	R32
// PORT: SOURCE R30.agc:354
//# MOD NO: 1	MOD BY: R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// PORT: SOURCE R30.agc:355
//# MOD NO: 2	MOD BY: R. R. BAIRNSFATHER	DATE: 14 APR 67		ADD OVFL CK FOR RAPO
// PORT: SOURCE R30.agc:356
//# MOD NO: 3	MOD BY ALONSO			DATE: 11 DEC 67		SUBROUTINE REWRITTEN
// PORT: SOURCE R30.agc:357
//# MOD NO: 4	MOD BY ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
// PORT: SOURCE R30.agc:358
//# MOD NO: 5	MOD BY: RR BAIRNSFATHER		DATE: 6 AUG 68		OVFL CK FOR HAPO & HPER. VOIDS MOD #2.
// PORT: SOURCE R30.agc:359
//#
// PORT: SOURCE R30.agc:360
//# NEW FUNCTIONAL DESCRIPTION:  ORBITAL PARAMETERS DISPLAY FOR NOUNS 32 AND 44.
// PORT: SOURCE R30.agc:361
//# SR30.1 CALLS TFFCONMU AND TFFRP/RA TO CALCULATE RPER (PERIGEE RADIUS),
// PORT: SOURCE R30.agc:362
//# RAPO (APOGEE RADIUS), HPER (PERIGEE HEIGHT ABOVE LAUNCH PAD OR LUNAR
// PORT: SOURCE R30.agc:363
//# LANDING SITE), HAPO (APOGEE HEIGHT AS ABOVE), TPER (TIME TO PERIGEE),
// PORT: SOURCE R30.agc:364
//# TFF (TIME TO INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// PORT: SOURCE R30.agc:365
//# IF HPER IS GREATER THAN OR EQUAL TO HPERMIN, CALCULATES TPER AND STORES
// PORT: SOURCE R30.agc:366
//# NEGATIVE   IN -TPER.  OTHERWISE STORES +0 IN -TPER.  WHENEVER TPER IS
// PORT: SOURCE R30.agc:367
//# CALCULATED, TFF IS NOT COMPUTABLE AND DEFAULTS TO -59MIN 59SEC. IF HAPO
// PORT: SOURCE R30.agc:368
//# WOULD EXCEED 9999.9 NM, IT IS LIMITED TO THAT VALUE FOR DISPLAY.
// PORT: SOURCE R30.agc:369
//#
// PORT: SOURCE R30.agc:370
//# ADDENDUM:	HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// PORT: SOURCE R30.agc:371
//#		ABOVE REMARKS.
// PORT: SOURCE R30.agc:372
//#
// PORT: SOURCE R30.agc:373
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE R30.agc:374
//#				SR30.1
// PORT: SOURCE R30.agc:375
//#
// PORT: SOURCE R30.agc:376
//# SUBROUTINES CALLED:	TFFCONMU, TFFRP/RA, CALCTPER, CALCTFF
// PORT: SOURCE R30.agc:377
//# NORMAL EXIT MODE:	CALLING LINE +1 (STILL IN INTERPRETIVE MODE)
// PORT: SOURCE R30.agc:378
//# ALARMS:	NONE
// PORT: SOURCE R30.agc:379
//# OUTPUT:       RAPO	(-29) M EARTH	APOGEE RADIUS	EARTH CENTERED COORD.
// PORT: SOURCE R30.agc:380
//#			(-27) M MOON			MOON CENTERED COORD.
// PORT: SOURCE R30.agc:381
//#		RPER	(-29) M EARTH	PERIGEE RADIUS	EARTH CENTERED COORD.
// PORT: SOURCE R30.agc:382
//#			(-27) M MOON			MOON CENTERED COORD.
// PORT: SOURCE R30.agc:383
//#		HAPOX	(-29) M		APOGEE ALTITUDE ABOVE PAD OR LAND. SITE MAX VALUE LIMITED TO 9999.9 NM.
// PORT: SOURCE R30.agc:384
//#		HPERX	(-29) M		PERIGEE ALT. ABOVE PAD OR LAND. SITE    MAX VALUE LIMITED TO 9999.9 NM.
// PORT: SOURCE R30.agc:385
//#		TFF	(-28) CS	TIME TO 300KFT OR 35KFT ALTITUDE
// PORT: SOURCE R30.agc:386
//#		-TPER	(-28) CS	TIME TO PERIGEE
// PORT: SOURCE R30.agc:387
//# ERASABLE INITIALIZATION REQUIRED -
// PORT: SOURCE R30.agc:388
//#	TFF/RTMU	(+17) EARTH	RECIPROCAL OF PROPER GRAV CONSTANT FOR
// PORT: SOURCE R30.agc:389
//#			(+14) MOON	EARTH OR MOON = 1/SQRT(MU).
// PORT: SOURCE R30.agc:390
//#	RONE		(-29) M		STATE VECTOR
// PORT: SOURCE R30.agc:391
//#	VONE		(-7)  M/CS	STATE VECTOR
// PORT: SOURCE R30.agc:392
//#	RPADTEM		(-29) M EARTH	RADIUS OF LAUNCH PAD OR LUNAR LANDING
// PORT: SOURCE R30.agc:393
//#			(-27) M MOON	SITE.
// PORT: SOURCE R30.agc:394
//#	HPERMIN		(-29) M EARTH	(300 OR 35) KFT MINIMUM PERIGEE ALTITUDE
// PORT: SOURCE R30.agc:395
//#			(-27) M MOON	ABOVE LAUNCH PAD OR LUNAR LANDING SITE.
// PORT: SOURCE R30.agc:396
//#	V82EMFLG	(INT SW BIT)	RESET FOR EARTH, SET FOR MOON.
// PORT: SOURCE R30.agc:397
//#
// PORT: SOURCE R30.agc:398
//# DEBRIS:	QPRET, PDL, S2
// PORT: SOURCE R30.agc:399
//
// PORT: SOURCE R30.agc:400
//# Page 522
// PORT: SOURCE R30.agc:401
//		COUNT*	$$/SR30S
// PORT: SOURCE R30.agc:402
//
// PORT: SOURCE R30.agc:403
//SR30.1		SETPD	STQ		# INITIALIZE PUSHDOWN LIST.
// PORT: Fixed ROM slots 21943.
    21943, 36866,
// PORT: SOURCE R30.agc:404
//			0
// PORT: Fixed ROM slots 21944.
    21944, 2,
// PORT: SOURCE R30.agc:405
//			S2
// PORT: Fixed ROM slots 21945.
    21945, 82,
// PORT: SOURCE R30.agc:406
//					# SR30.1 INPUT:	RONE AT (-29)M EARTH/MOON
// PORT: SOURCE R30.agc:407
//					#		VONE AT (-7)M/CS
// PORT: SOURCE R30.agc:408
//					# TFFCONMU,TFFRP/RA,CALCTPER,AND CALCTFF
// PORT: SOURCE R30.agc:409
//					# CALLS REQUIRE:
// PORT: SOURCE R30.agc:410
//					# EARTH CENTERED (NO RESCALING REQUIRED)
// PORT: SOURCE R30.agc:411
//					#	RONE SCALED TO B-29 M
// PORT: SOURCE R30.agc:412
//					#	VONE SCALED TO B-7 M/CS
// PORT: SOURCE R30.agc:413
//					# MOON CENTERED (RESCALING REQUIRED)
// PORT: SOURCE R30.agc:414
//					#	RONE SCALED TO B-27 M
// PORT: SOURCE R30.agc:415
//					#	VONE SCALED TO B-5 M/CS
// PORT: SOURCE R30.agc:416
//		BOFF	VLOAD
// PORT: Fixed ROM slots 21946.
    21946, 64792,
// PORT: SOURCE R30.agc:417
//			V82EMFLG	# OFF FOR EARTH , ON FOR MOON.
// PORT: Fixed ROM slots 21947.
    21947, 5060,
// PORT: SOURCE R30.agc:418
//			TFFCALLS
// PORT: Fixed ROM slots 21948.
    21948, 39814,
// PORT: SOURCE R30.agc:419
//			RONE
// PORT: Fixed ROM slots 21949.
    21949, 2478,
// PORT: SOURCE R30.agc:420
//		VSL2
// PORT: Fixed ROM slots 21950.
    21950, 65492,
// PORT: SOURCE R30.agc:421
//		STOVL	RONE
// PORT: Fixed ROM slots 21951.
    21951, 22958,
// PORT: SOURCE R30.agc:422
//			VONE
// PORT: Fixed ROM slots 21952.
    21952, 2490,
// PORT: SOURCE R30.agc:423
//		VSL2
// PORT: Fixed ROM slots 21953.
    21953, 65492,
// PORT: SOURCE R30.agc:424
//		STORE	VONE
// PORT: Fixed ROM slots 21954.
    21954, 2490,
// PORT: SOURCE R30.agc:425
//TFFCALLS	CALL
// PORT: Fixed ROM slots 21955.
    21955, 65320,
// PORT: SOURCE R30.agc:426
//			TFFCONMU
// PORT: Fixed ROM slots 21956.
    21956, 48096,
// PORT: SOURCE R30.agc:427
//		CALL			# TFFRP/RA COMPUTES RAPO,RPER.
// PORT: Fixed ROM slots 21957.
    21957, 65320,
// PORT: SOURCE R30.agc:428
//			TFFRP/RA
// PORT: Fixed ROM slots 21958.
    21958, 48172,
// PORT: SOURCE R30.agc:429
//					# RETURNS WITH RAPO IN D(MPAC).
// PORT: SOURCE R30.agc:430
//		DSU
// PORT: Fixed ROM slots 21959.
    21959, 65322,
// PORT: SOURCE R30.agc:431
//			RPADTEM
// PORT: Fixed ROM slots 21960.
    21960, 2470,
// PORT: SOURCE R30.agc:432
//		BOFF	SR2R		# NEED HAPO AT (-29)M FOR DISPLAY.
// PORT: Fixed ROM slots 21961.
    21961, 53784,
// PORT: SOURCE R30.agc:433
//					# IF MOON CENTERED, RESCALE FROM (-27)M.
// PORT: SOURCE R30.agc:434
//					# IF EARTH CENTERED ALREADY AT (-29)M.
// PORT: SOURCE R30.agc:435
//			V82EMFLG        # OFF FOR EARTH , ON FOR MOON.
// PORT: Fixed ROM slots 21962.
    21962, 5060,
// PORT: SOURCE R30.agc:436
//			+1
// PORT: Fixed ROM slots 21963.
    21963, 39832,
// PORT: SOURCE R30.agc:437
//		CALL			# IF HAPO > MAXNM, SET HAPO =9999.9 NM.
// PORT: Fixed ROM slots 21964.
    21964, 65320,
// PORT: SOURCE R30.agc:438
//			MAXCHK		# OTHERWISE STORE (RAPO-RPADTEM) IN HAPO.
// PORT: Fixed ROM slots 21965.
    21965, 39896,
// PORT: SOURCE R30.agc:439
//STORHAPO	STODL	HAPOX
// PORT: Fixed ROM slots 21966.
    21966, 14804,
// PORT: SOURCE R30.agc:440
//			RPER
// PORT: Fixed ROM slots 21967.
    21967, 30,
// PORT: SOURCE R30.agc:441
//		DSU
// PORT: Fixed ROM slots 21968.
    21968, 65322,
// PORT: SOURCE R30.agc:442
//			RPADTEM		# GIVES HPER AT (-29)M EARTH, (-27)M MOON.
// PORT: Fixed ROM slots 21969.
    21969, 2470,
// PORT: SOURCE R30.agc:443
//		STORE	MPAC +4		# SAVE THIS FOR COMPARISON TO HPERMIN.
// PORT: Fixed ROM slots 21970.
    21970, 226,
// PORT: SOURCE R30.agc:444
//		BOFF	SR2R		# NEED HPER AT (-29)M FOR DISPLAY.
// PORT: Fixed ROM slots 21971.
    21971, 53784,
// PORT: SOURCE R30.agc:445
//					# IF MOON CENTERED, RESCALE FROM (-27)M.
// PORT: SOURCE R30.agc:446
//					# IF EARTH CENTERED ALREADY AT (-29)M.
// PORT: SOURCE R30.agc:447
//			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
// PORT: Fixed ROM slots 21972.
    21972, 5060,
// PORT: SOURCE R30.agc:448
//			+1
// PORT: Fixed ROM slots 21973.
    21973, 39852,
// PORT: SOURCE R30.agc:449
//		CALL			# IF HPER > MAXNM, SET HPER = 9999.9 NM.
// PORT: Fixed ROM slots 21974.
    21974, 65320,
// PORT: SOURCE R30.agc:450
//			MAXCHK
// PORT: Fixed ROM slots 21975.
    21975, 39896,
// PORT: SOURCE R30.agc:451
//# Page 523
// PORT: SOURCE R30.agc:452
//STORHPER	STODL	HPERX		# STORE (RPER - RPADTEM) INTO HPERX.
// PORT: Fixed ROM slots 21976.
    21976, 14808,
// PORT: SOURCE R30.agc:453
//			MPAC +4
// PORT: Fixed ROM slots 21977.
    21977, 226,
// PORT: SOURCE R30.agc:454
//		DSU	BPL		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
// PORT: Fixed ROM slots 21978.
    21978, 42026,
// PORT: SOURCE R30.agc:455
//			HPERMIN		# IF HPER L/ HPERMIN (300 OR 35) KFT,
// PORT: Fixed ROM slots 21979.
    21979, 2466,
// PORT: SOURCE R30.agc:456
//			DOTPER		# THEN ZERO INTO -TPER.
// PORT: Fixed ROM slots 21980.
    21980, 39872,
// PORT: SOURCE R30.agc:457
//		DLOAD	GOTO		# OTHERWISE CALCULATE TPER.
// PORT: Fixed ROM slots 21981.
    21981, 43210,
// PORT: SOURCE R30.agc:458
//			HI6ZEROS
// PORT: Fixed ROM slots 21982.
    21982, 13754,
// PORT: SOURCE R30.agc:459
//			SKIPTPER
// PORT: Fixed ROM slots 21983.
    21983, 39880,
// PORT: SOURCE R30.agc:460
//DOTPER		DLOAD	CALL
// PORT: Fixed ROM slots 21984.
    21984, 38090,
// PORT: SOURCE R30.agc:461
//			RPER
// PORT: Fixed ROM slots 21985.
    21985, 30,
// PORT: SOURCE R30.agc:462
//			CALCTPER
// PORT: Fixed ROM slots 21986.
    21986, 48232,
// PORT: SOURCE R30.agc:463
//		DCOMP			# TPER IS PUT NEG INTO -TPER.
// PORT: Fixed ROM slots 21987.
    21987, 65404,
// PORT: SOURCE R30.agc:464
//SKIPTPER	STODL	-TPER
// PORT: Fixed ROM slots 21988.
    21988, 14796,
// PORT: SOURCE R30.agc:465
//			HPERMIN		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
// PORT: Fixed ROM slots 21989.
    21989, 2466,
// PORT: SOURCE R30.agc:466
//		DAD	CALL
// PORT: Fixed ROM slots 21990.
    21990, 37914,
// PORT: SOURCE R30.agc:467
//			RPADTEM		# RPADTEM AT (-29)M FOR EARTH, (-27)M MOON
// PORT: Fixed ROM slots 21991.
    21991, 2470,
// PORT: SOURCE R30.agc:468
//			CALCTFF		# GIVES 59M59S FOR TFF IF RPER G/
// PORT: Fixed ROM slots 21992.
    21992, 48238,
// PORT: SOURCE R30.agc:469
//		DCOMP			# HPERMIN + RPADTEM.  (TPER WAS NON ZERO)
// PORT: Fixed ROM slots 21993.
    21993, 65404,
// PORT: SOURCE R30.agc:470
//		STCALL	TFF		# OTHERWISE COMPUTES TFF.	(GOTO)
// PORT: Fixed ROM slots 21994.
    21994, 31176,
// PORT: SOURCE R30.agc:471
//			S2
// PORT: Fixed ROM slots 21995.
    21995, 82,
// PORT: SOURCE R30.agc:472
//
// PORT: SOURCE R30.agc:473
//MAXCHK		DSU	BPL		# IF C(MPAC) > 9999.9 NM. MPAC = 9999.9 NM.
// PORT: Fixed ROM slots 21996.
    21996, 42026,
// PORT: SOURCE R30.agc:474
//			MAXNM
// PORT: Fixed ROM slots 21997.
    21997, 7144,
// PORT: SOURCE R30.agc:475
//			+3		# OTHERWISE C(MPAC) = B(MPAC).
// PORT: Fixed ROM slots 21998.
    21998, 39906,
// PORT: SOURCE R30.agc:476
//		DAD	RVQ
// PORT: Fixed ROM slots 21999.
    21999, 36378
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE R30.agc:477
//			MAXNM
// PORT: Fixed ROM slots 22000.
    22000, 7144,
// PORT: SOURCE R30.agc:478
// +3		DLOAD	RVQ		# (USED BY P30 - P37 ALSO)
// PORT: Fixed ROM slots 22001.
    22001, 36554,
// PORT: SOURCE R30.agc:479
// 			MAXNM
// PORT: Fixed ROM slots 22002.
    22002, 7144,
// PORT: SOURCE R30.agc:480
//
// PORT: SOURCE R30.agc:481
//MAXNM		2OCT	0106505603
// PORT: Fixed ROM slots 22003 22004.
    22003, 1130, 22004, 5894
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE R30.agc:482
//
// PORT: SOURCE R30.agc:483
//# Page 524
// PORT: SOURCE R30.agc:484
//
// PORT: SOURCE R30.agc:485
//# There is no source code on this page --- HG 2009
