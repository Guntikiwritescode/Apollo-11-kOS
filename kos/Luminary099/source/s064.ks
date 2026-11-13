// R30.agc
// bank 22, slots 21154-21154
function agcAotUnit1304 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:1
//# Copyright:	Public domain.
// R30.agc:2
//# Filename:	R30.agc
// R30.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// R30.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// R30.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// R30.agc:6
//# Assembler:	yaYUL
// R30.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// R30.agc:8
//# Website:	www.ibiblio.org/apollo.
// R30.agc:9
//# Pages:	712-722
// R30.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// R30.agc:11
//#				Luminary131 file, using page
// R30.agc:12
//#				images from Luminary 1A.
// R30.agc:13
//#		2009-06-07 RSB	Removed a space between two components of
// R30.agc:14
//#				a 2OCT that isn't legal in yaYUL.
// R30.agc:15
//#
// R30.agc:16
//# This source code has been transcribed or otherwise adapted from
// R30.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// R30.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// R30.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// R30.agc:20
//# in storage size and consequent reduction in image quality as well) are
// R30.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// R30.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// R30.agc:23
//# about getting access to the (much) higher-quality images which Paul
// R30.agc:24
//# actually created.
// R30.agc:25
//#
// R30.agc:26
//# Notations on the hardcopy document read, in part:
// R30.agc:27
//#
// R30.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// R30.agc:29
//#	16:27 JULY 14, 1969
// R30.agc:30
//
// R30.agc:31
//# Page 712
// R30.agc:32
//# SUBROUTINE NAME:  V82CALL
// R30.agc:33
//# MOD NO: 0								DATE: 16 FEB 67
// R30.agc:34
//# MOD BY: R. R. BAIRNSFATHER						LOG SECTION:  R30
// R30.agc:35
//# MOD NO: 1	MOD BY:  R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// R30.agc:36
//# MOD NO: 2	MOD BY:  ALONSO			DATE: 11 DEC 67		VB82 PROGRAM REWRITTEN
// R30.agc:37
//# MOD NO: 3	MOD BY:  ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
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
//#		FLASH DISPLAY V04N06. R2 INDICATES WHICH SHIP'S STATE VECTOR IS
// R30.agc:44
//#		 TO BE UPDATED. INITIAL CHOICE IS THIS SHIP (R2=1). ASTRONAUT
// R30.agc:45
//#		 CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ 1.
// R30.agc:46
//#		SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
// R30.agc:47
//#		CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
// R30.agc:48
//#		 RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
// R30.agc:49
//#		 HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HARD (APOGEE
// R30.agc:50
//#		 HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
// R30.agc:51
//#		 INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// R30.agc:52
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).TFF IS -59M59S IF IT WAS
// R30.agc:53
//#		 NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
// R30.agc:54
//#		 ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
// R30.agc:55
//#		 DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
// R30.agc:56
//#		 ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
// R30.agc:57
//#
// R30.agc:58
//# 2.	IF AVERAGE G IS ON:
// R30.agc:59
//#		CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
// R30.agc:60
//#		 FOR THIS VEHICLE. V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
// R30.agc:61
//#		 OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
// R30.agc:62
//#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).
// R30.agc:63
//# ADDENDUM: HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// R30.agc:64
//#		 ABOVE REMARKS.
// R30.agc:65
//#
// R30.agc:66
//# CALLING SEQUENCE:  VERB 82 ENTER.
// R30.agc:67
//#
// R30.agc:68
//# SUBROUTINES CALLED:  SR30.1, GOXDSPF
// R30.agc:69
//#			MAYBE - THISPREC , OTHPREC, LOADTIME, DELRSPL
// R30.agc:70
//# NORMAL EXIT MODES:  TC ENDEXT
// R30.agc:71
//#
// R30.agc:72
//# ALARMS:  NONE
// R30.agc:73
//#
// R30.agc:74
//# OUTPUT:  HAPOX	(-29) M
// R30.agc:75
//#	   HPERX	(-29) M
// R30.agc:76
//#	   RAPO		(-29) M EARTH
// R30.agc:77
//#			(-27) M MOON
// R30.agc:78
//#	   RPER		(-29) M EARTH
// R30.agc:79
//#			(-27) M MOON
// R30.agc:80
//#	   TFF		(-28) CS	CONTAINS NEGATIVE QUANTITY
// R30.agc:81
//#	   -TPER	(-28) CS	CONTAINS NEGATIVE QUANTITY
// R30.agc:82
//# Page 713
// R30.agc:83
//#
// R30.agc:84
//# ERASABLE INITIALIZATION REQUIRED: STATE VECTOR.
// R30.agc:85
//#
// R30.agc:86
//# DEBRIS:	QPRET, RONE, VONE,TFF/RTMU, HPERMIN, RPADTEM, V82EMFLG.
// R30.agc:87
//#		MAYBE: TSTART82, V82FLAGS, TDEC1.
// R30.agc:88
//
// R30.agc:89
//		EBANK=	HAPOX
// R30.agc:90
//		BANK	31
// R30.agc:91
//		SETLOC	R30LOC
// R30.agc:92
//		BANK
// R30.agc:93
//		COUNT*	$$/R30
// R30.agc:94
//
// R30.agc:95
//V82CALL		TC	INTPRET
// slot 21154
    if slot <> 21154 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1304] to agcAotUnit1304@.

agcAotInstallSourceRope(list(
// R30.agc:96
//		BON	GOTO
// slot 21155
    21155, 43032,
// R30.agc:97
//			AVEGFLAG
// slot 21156
    21156, 3988,
// R30.agc:98
//			V82GON		# IF AVERAGE G ON
// slot 21157
    21157, 38506,
// R30.agc:99
//			V82GOFF		# IF AVERAGE G OFF
// slot 21158
    21158, 38222,
// R30.agc:100
//
// R30.agc:101
//V82GOFF		EXIT			# ALLOW ASTRONAUT TO SELECT VEHICLE
// slot 21159
    21159, 65532
)).

// bank 22, slots 21160-21165
function agcAotUnit1305 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21162 {
        if slot <= 21160 {
// R30.agc:102
//		CAF	TWO		# DESIRED FOR ORBITAL PARAMETERS
// slot 21160
            if slot <> 21160 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21161 {
// R30.agc:103
//		TS	OPTIONX		# CALCULATION AND DISPLAY.
// slot 21161
                if slot <> 21161 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:104
//		CAF	ONE
// slot 21162
                if slot <> 21162 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        if slot <= 21163 {
// R30.agc:105
//		TS	OPTIONX +1
// slot 21163
            if slot <> 21163 or instruction <> 23082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21164 {
// R30.agc:106
//		CAF	OPTIONVN	# V 04 N 06
// slot 21164
                if slot <> 21164 or instruction <> 14030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1742), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:107
//		TC	BANKCALL
// slot 21165
                if slot <> 21165 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1305] to agcAotUnit1305@.

agcAotInstallSourceRope(list(
// R30.agc:108
//		CADR	GOXDSPF
// slot 21166
    21166, 16824
)).

// bank 22, slots 21167-21171
function agcAotUnit1306 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21168 {
        if slot <= 21167 {
// R30.agc:109
//		TC	ENDEXT		# TERMINATE
// slot 21167
            if slot <> 21167 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:110
//		TC	+2		# PROCEED
// slot 21168
            if slot <> 21168 or instruction <> 1714 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1714, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21169 {
// R30.agc:111
//		TC	-5		# DATA IN. OPTION1+1 = 1 FOR THIS VEHICLE.
// slot 21169
            if slot <> 21169 or instruction <> 1708 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1708, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21170 {
// R30.agc:112
//					#		UNEQ 1 FOR OTHER VEHICLE.
// R30.agc:113
//		CAF	BIT4		# 80 MS
// slot 21170
                if slot <> 21170 or instruction <> 14824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:114
//		TC	WAITLIST
// slot 21171
                if slot <> 21171 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1306] to agcAotUnit1306@.

agcAotInstallSourceRope(list(
// R30.agc:115
//		EBANK=	TFF
// R30.agc:116
//		2CADR	TICKTEST
// slot 21172 21173
    21172, 3632, 21173, 36968
)).

// bank 22, slots 21174-21180
function agcAotUnit1307 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21176 {
        if slot <= 21174 {
// R30.agc:117
//
// R30.agc:118
//		RELINT
// slot 21174
            if slot <> 21174 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21175 {
// R30.agc:119
//V82GOFLP	CAF	TFFBANK		# MAJOR RECYCLE LOOP ENTRY
// slot 21175
                if slot <> 21175 or instruction <> 14032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1744), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:120
//		TS	EBANK
// slot 21176
                if slot <> 21176 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21178 {
            if slot <= 21177 {
// R30.agc:121
//		CAF	ZERO
// slot 21177
                if slot <> 21177 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:122
//		TS	V82FLAGS	# ZERO FLAGS FOR TICKTEST, INHIBITS
// slot 21178
                if slot <> 21178 or instruction <> 23391 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23391, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21179 {
// R30.agc:123
//					# DECREMENTING OF TFF AND -TPER.
// R30.agc:124
//		CAF	PRIO7
// slot 21179
                if slot <> 21179 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:125
//		TC	FINDVAC		# V82GOFF1 WILL EXECUTE STATE VECTOR
// slot 21180
                if slot <> 21180 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1307] to agcAotUnit1307@.

agcAotInstallSourceRope(list(
// R30.agc:126
//		EBANK=	TFF		# UPDATE AND ORBIT CALCULATIONS FOR
// R30.agc:127
//		2CADR	V82GOFF1	# SELECTED VEHICLE ABOUT PROPER BODY.
// slot 21181 21182
    21181, 3490, 21182, 36968
)).

// bank 22, slots 21183-21189
function agcAotUnit1308 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21185 {
        if slot <= 21183 {
// R30.agc:128
//
// R30.agc:129
//		RELINT
// slot 21183
            if slot <> 21183 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21184 {
// R30.agc:130
//V82STALL	CAF	THREE		# STALL IN THIS LOOP AND WITHOLD V 16 N 44
// slot 21184
                if slot <> 21184 or instruction <> 15525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:131
//# Page 714
// R30.agc:132
//		MASK	V82FLAGS	# UNTIL STATE VECTOR UPDATE SETS ONE OF
// slot 21185
                if slot <> 21185 or instruction <> 29535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 863).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21187 {
            if slot <= 21186 {
// R30.agc:133
//		CCS	A		# OUR FLAG BITS.
// slot 21186
                if slot <> 21186 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:134
//		TC	FLAGGON		# EXIT FROM STALL LOOP.
// slot 21187
                if slot <> 21187 or instruction <> 1736 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1736, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21188 {
// R30.agc:135
//		CAF	1SEC
// slot 21188
                if slot <> 21188 or instruction <> 14847 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:136
//		TC	BANKCALL
// slot 21189
                if slot <> 21189 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1308] to agcAotUnit1308@.

agcAotInstallSourceRope(list(
// R30.agc:137
//		CADR	DELAYJOB
// slot 21190
    21190, 1978
)).

// bank 22, slots 21191-21193
function agcAotUnit1309 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21191 {
// R30.agc:138
//		TC	V82STALL
// slot 21191
        if slot <> 21191 or instruction <> 1728 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1728, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21192 {
// R30.agc:139
//
// R30.agc:140
//FLAGGON		CAF	V16N44		# MONITOR HAPO,HPER,TFF.
// slot 21192
            if slot <> 21192 or instruction <> 14031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1743), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:141
//		TC	BANKCALL
// slot 21193
            if slot <> 21193 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1309] to agcAotUnit1309@.

agcAotInstallSourceRope(list(
// R30.agc:142
//		CADR	GOXDSPF
// slot 21194
    21194, 16824
)).

// bank 22, slots 21195-21197
function agcAotUnit1310 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21195 {
// R30.agc:143
//		TC	B5OFF		# TERM  THIS TELLS TICKTEST TO KILL ITSELF
// slot 21195
        if slot <> 21195 or instruction <> 2931 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2931, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21196 {
// R30.agc:144
//		TC	B5OFF		# PROCEED  DITTO
// slot 21196
            if slot <> 21196 or instruction <> 2931 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2931, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:145
//		TC	V82GOFLP	# RECYCLE  RECOMPUTE STATE VECT + DISPLAY
// slot 21197
            if slot <> 21197 or instruction <> 1719 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1719, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1310] to agcAotUnit1310@.

agcAotInstallSourceRope(list(
// R30.agc:146
//
// R30.agc:147
//OPTIONVN	VN	412
// slot 21198
    21198, 1048,
// R30.agc:148
//V16N44		VN	1644
// slot 21199
    21199, 4184,
// R30.agc:149
//TFFBANK		ECADR	TFF
// slot 21200
    21200, 2240
)).

// bank 22, slots 21201-21201
function agcAotUnit1311 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:150
//
// R30.agc:151
//V82GOFF1	TC	INTPRET
// slot 21201
    if slot <> 21201 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1311] to agcAotUnit1311@.

agcAotInstallSourceRope(list(
// R30.agc:152
//		RTB
// slot 21202
    21202, 65336,
// R30.agc:153
//			LOADTIME
// slot 21203
    21203, 18166,
// R30.agc:154
//		STORE	TDEC1		# TIME FOR STATE VECTOR UPDATE.
// slot 21204
    21204, 66,
// R30.agc:155
//		STORE	TSTART82	# TIME FOR INTERNAL USE.
// slot 21205
    21205, 2314,
// R30.agc:156
//		EXIT
// slot 21206
    21206, 65532
)).

// bank 22, slots 21207-21211
function agcAotUnit1312 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21208 {
        if slot <= 21207 {
// R30.agc:157
//		CS	OPTIONX +1	# 1 FOR THIS VEHICLE, NOT 1 FOR OTHER.
// slot 21207
            if slot <> 21207 or instruction <> 16938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 554).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:158
//		AD	ONE
// slot 21208
            if slot <> 21208 or instruction <> 27115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21209 {
// R30.agc:159
//		EXTEND
// slot 21209
            if slot <> 21209 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21210 {
// R30.agc:160
//		BZF	THISSHIP
// slot 21210
                if slot <> 21210 or instruction <> 5870 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5870, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:161
//OTHSHIP		TC	INTPRET
// slot 21211
                if slot <> 21211 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1312] to agcAotUnit1312@.

agcAotInstallSourceRope(list(
// R30.agc:162
//		CALL			# CALL STATE VECTOR UPDATE FOR OTHER SHIP.
// slot 21212
    21212, 65320,
// R30.agc:163
//			OTHPREC
// slot 21213
    21213, 23622,
// R30.agc:164
//BOTHSHIP	VLOAD			# MOVE RESULTS INTO TFFCONIC STORAGE AREAS
// slot 21214
    21214, 65530,
// R30.agc:165
//			RATT		#  TO BE CALLED BY SR30.1.
// slot 21215
    21215, 2,
// R30.agc:166
//		STOVL	RONE		# RATT AT (-29)M FOR EARTH OR MOON
// slot 21216
    21216, 22798,
// R30.agc:167
//			VATT
// slot 21217
    21217, 14,
// R30.agc:168
//		STORE	VONE		#  VATT AT (-7)M/CS FOR EARTH OR MOON
// slot 21218
    21218, 2330,
// R30.agc:169
//		DLOAD*
// slot 21219
    21219, 65478,
// R30.agc:170
//			1/RTMUE,2	#  X2 IS 0 FOR EARTH CENTERED STATE VEC
// slot 21220
    21220, 61432,
// R30.agc:171
//		STORE	TFF/RTMU	#  X2 IS 2 FOR MOON
// slot 21221
    21221, 62,
// R30.agc:172
//		DLOAD*			# AS LEFT BY THISPREC OR OTHPREC.
// slot 21222
    21222, 65478,
// R30.agc:173
//			MINPERE,2
// slot 21223
    21223, 59922,
// R30.agc:174
//		STORE	HPERMIN		#   TFFRTMU, HPERMIN AND RPADTEM ARE ALL
// slot 21224
    21224, 2306,
// R30.agc:175
//		SLOAD	BHIZ		# EARTH/MOON PARAMETERS AS SET HERE.
// slot 21225
    21225, 39098,
// R30.agc:176
//			X2
// slot 21226
    21226, 80,
// R30.agc:177
//			EARTHPAD
// slot 21227
    21227, 38382,
// R30.agc:178
//		GOTO
// slot 21228
    21228, 65360,
// R30.agc:179
//			MOONPAD
// slot 21229
    21229, 38390
)).

// bank 22, slots 21230-21230
function agcAotUnit1313 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:180
//# Page 715
// R30.agc:181
//THISSHIP	TC	INTPRET
// slot 21230
    if slot <> 21230 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1313] to agcAotUnit1313@.

agcAotInstallSourceRope(list(
// R30.agc:182
//		CALL			# CALL STATE VECTOR UPDATE FOR THIS SHIP.
// slot 21231
    21231, 65320,
// R30.agc:183
//			THISPREC
// slot 21232
    21232, 23646,
// R30.agc:184
//		GOTO
// slot 21233
    21233, 65360,
// R30.agc:185
//			BOTHSHIP
// slot 21234
    21234, 38332,
// R30.agc:186
//
// R30.agc:187
//# THE FOLLOWING CONSTANTS ARE PAIRWISE INDEXED. DO NOT SEPARATE PAIRS.
// R30.agc:188
//
// R30.agc:189
//MINPERM		2DEC	10668 B-27	# 35 KFT MIN PERIGEE HEIGHT FOR MOON(-27)M
// slot 21235 21236
    21235, 2, 21236, 9904,
// R30.agc:190
//
// R30.agc:191
//MINPERE		2DEC	91440 B-29	# 300 KFT (-29)M FOR EARTH
// slot 21237 21238
    21237, 4, 21238, 25904,
// R30.agc:192
//
// R30.agc:193
//EARTHPAD	DLOAD	CLRGO		#  PAD 37-B RADIUS.  SCALED AT (-29)M.
// slot 21239
    21239, 36042,
// R30.agc:194
//			RPAD
// slot 21240
    21240, 6554,
// R30.agc:195
//			V82EMFLG	#  INDICATE EARTH SCALING FOR SR30.1
// slot 21241
    21241, 3898,
// R30.agc:196
//			BOTHPAD
// slot 21242
    21242, 38398,
// R30.agc:197
//
// R30.agc:198
//MOONPAD		VLOAD	ABVAL		# COMPUTE MOON PAD RADIUS FROM RLS VECTOR.
// slot 21243
    21243, 42746,
// R30.agc:199
//			RLS		#  SCALED AT (-27)M.
// slot 21244
    21244, 2086,
// R30.agc:200
//		SET
// slot 21245
    21245, 65304,
// R30.agc:201
//			V82EMFLG	#  INDICATE MOON SCALING FOR SR30.1
// slot 21246
    21246, 3706,
// R30.agc:202
//BOTHPAD		STCALL	RPADTEM
// slot 21247
    21247, 30982,
// R30.agc:203
//			SR30.1		# CALCULATE ORBITAL PARAMETERS
// slot 21248
    21248, 38610,
// R30.agc:204
//		RTB	DSU
// slot 21249
    21249, 38200,
// R30.agc:205
//			LOADTIME
// slot 21250
    21250, 18166,
// R30.agc:206
//			TSTART82	# PRESENT TIME - TIME V82GOFF1 BEGAN
// slot 21251
    21251, 2314,
// R30.agc:207
//		STORE	TSTART82	#                SAVE IT
// slot 21252
    21252, 2314,
// R30.agc:208
//		DLOAD	BZE		# SR30.1 SETS -TPER=0 IF HPER L/
// slot 21253
    21253, 44234,
// R30.agc:209
//			-TPER		#  HPERMIN (300 OR 35) KFT.
// slot 21254
    21254, 2246,
// R30.agc:210
//			TICKTIFF	# (-TPER = 0)
// slot 21255
    21255, 38432,
// R30.agc:211
//TICKTPER	DLOAD	DAD		# (-TPER NON ZERO)  TFF WAS NOT COMPUTED.
// slot 21256
    21256, 36298,
// R30.agc:212
//			-TPER		# BUT WAS SET TO 59M59S.DONT TICK TFF, DO
// slot 21257
    21257, 2246,
// R30.agc:213
//			TSTART82	# TICK -TPER. DISPLAY BOTH.
// slot 21258
    21258, 2314,
// R30.agc:214
//		STORE	-TPER		# -TPER CORRECTED FOR TIME SINCE V82GOFF1
// slot 21259
    21259, 2246,
// R30.agc:215
//		EXIT			# BEGAN.
// slot 21260
    21260, 65532
)).

// bank 22, slots 21261-21263
function agcAotUnit1314 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21261 {
// R30.agc:216
//		CAF	BIT1
// slot 21261
        if slot <> 21261 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21262 {
// R30.agc:217
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY -TPER
// slot 21262
            if slot <> 21262 or instruction <> 23391 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23391, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:218
//		TC	ENDOFJOB
// slot 21263
            if slot <> 21263 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1314] to agcAotUnit1314@.

agcAotInstallSourceRope(list(
// R30.agc:219
//
// R30.agc:220
//TICKTIFF	DLOAD	DAD		# (-TPER=0)  TFF WAS COMPUTED.TICK TFF.
// slot 21264
    21264, 36298,
// R30.agc:221
//			TFF		# DO NOT TICK -TPER.DISPLAY TFF, BUT NOT
// slot 21265
    21265, 2242,
// R30.agc:222
//			TSTART82	# -TPER.
// slot 21266
    21266, 2314,
// R30.agc:223
//		STORE	TFF		# TFF CORRECTED FOR TIME SINCE V82GOFF1
// slot 21267
    21267, 2242,
// R30.agc:224
//		EXIT			# BEGAN.
// slot 21268
    21268, 65532
)).

// bank 22, slots 21269-21277
function agcAotUnit1315 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21272 {
        if slot <= 21270 {
            if slot <= 21269 {
// R30.agc:225
//		CAF	BIT2
// slot 21269
                if slot <> 21269 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:226
//		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY TFF.
// slot 21270
                if slot <> 21270 or instruction <> 23391 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23391, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21271 {
// R30.agc:227
//		TC	ENDOFJOB
// slot 21271
                if slot <> 21271 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:228
//
// R30.agc:229
//# Page 716
// R30.agc:230
//TICKTEST	CAF	BIT5		# THIS WAITLIST PROGRAM PERPETUATES ITSELF
// slot 21272
                if slot <> 21272 or instruction <> 14823 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21274 {
            if slot <= 21273 {
// R30.agc:231
//		MASK	EXTVBACT	# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// slot 21273
                if slot <> 21273 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:232
//		CCS	A
// slot 21274
                if slot <> 21274 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21275 {
// R30.agc:233
//		TC	DOTICK
// slot 21275
                if slot <> 21275 or instruction <> 1825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1825, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21276 {
// R30.agc:234
//		CAF	PRIO25
// slot 21276
                    if slot <> 21276 or instruction <> 16331 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:235
//		TC	NOVAC		# TERMINATE V 82.CANT CALL ENDEXT IN RUPT.
// slot 21277
                    if slot <> 21277 or instruction <> 2618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1315] to agcAotUnit1315@.

agcAotInstallSourceRope(list(
// R30.agc:236
//		EBANK=	EXTVBACT
// R30.agc:237
//		2CADR	ENDEXT
// slot 21278 21279
    21278, 5748, 21279, 4196
)).

// bank 22, slots 21280-21282
function agcAotUnit1316 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21280 {
// R30.agc:238
//
// R30.agc:239
//		TC	TASKOVER
// slot 21280
        if slot <> 21280 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21281 {
// R30.agc:240
//DOTICK		CAF	1SEC		# RE-REQUEST TICKTEST.
// slot 21281
            if slot <> 21281 or instruction <> 14847 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:241
//		TC	WAITLIST
// slot 21282
            if slot <> 21282 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1316] to agcAotUnit1316@.

agcAotInstallSourceRope(list(
// R30.agc:242
//		EBANK=	TFF
// R30.agc:243
//		2CADR	TICKTEST
// slot 21283 21284
    21283, 3632, 21284, 36968
)).

// bank 22, slots 21285-21287
function agcAotUnit1317 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21285 {
// R30.agc:244
//
// R30.agc:245
//		CAF	THREE
// slot 21285
        if slot <> 21285 or instruction <> 15525 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3237), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21286 {
// R30.agc:246
//		MASK	V82FLAGS
// slot 21286
            if slot <> 21286 or instruction <> 29535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 863).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:247
//		INDEX	A
// slot 21287
            if slot <> 21287 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1317] to agcAotUnit1317@.

agcAotInstallSourceRope(list(
// R30.agc:248
//		TC	+1
// slot 21288
    21288, 3666
)).

// bank 22, slots 21289-21300
function agcAotUnit1318 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21294 {
        if slot <= 21291 {
            if slot <= 21289 {
// R30.agc:249
//		TC	TASKOVER	# IF NO FLAGBITS SET DONT CHANGE TFF OR
// slot 21289
                if slot <> 21289 or instruction <> 2737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21290 {
// R30.agc:250
//					# -TPER, BUT CONTINUE LOOP.
// R30.agc:251
//		TC	TPERTICK	# ONLY BIT 1 SET. INCR -TPER BY 1 SEC.
// slot 21290
                    if slot <> 21290 or instruction <> 1840 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1840, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:252
//TFFTICK		CAF	1SEC		# ONLY BIT 2 SET. INCR TFF BY 1 SEC.
// slot 21291
                    if slot <> 21291 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21292 {
// R30.agc:253
//		TS	L
// slot 21292
                if slot <> 21292 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21293 {
// R30.agc:254
//		CAF	ZERO
// slot 21293
                    if slot <> 21293 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:255
//		DAS	TFF
// slot 21294
                    if slot <> 21294 or instruction <> 9057 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 865) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21297 {
            if slot <= 21295 {
// R30.agc:256
//		TC	TASKOVER
// slot 21295
                if slot <> 21295 or instruction <> 2737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21296 {
// R30.agc:257
//TPERTICK	CAF	1SEC
// slot 21296
                    if slot <> 21296 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:258
//		TS	L
// slot 21297
                    if slot <> 21297 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21298 {
// R30.agc:259
//		CAF	ZERO
// slot 21298
                if slot <> 21298 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21299 {
// R30.agc:260
//		DAS	-TPER
// slot 21299
                    if slot <> 21299 or instruction <> 9059 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 867) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R30.agc:261
//		TC	TASKOVER
// slot 21300
                    if slot <> 21300 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1318] to agcAotUnit1318@.

agcAotInstallSourceRope(list(
// R30.agc:262
//
// R30.agc:263
//# Page 717
// R30.agc:264
//V82GON		EXIT			#  AVERAGE G ON. USE CURRENT STATE VECTOR
// slot 21301
    21301, 65532
)).

// bank 22, slots 21302-21303
function agcAotUnit1319 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21302 {
// R30.agc:265
//					# FOR ORBITAL PARAMETER CALCULATIONS.
// R30.agc:266
//		CAF	PRIO7		# LESS THAN LAMBERT
// slot 21302
        if slot <> 21302 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
//		TC	FINDVAC		# V82GON1 WILL PERFORM ORBIT CALCULATIONS
// slot 21303
        if slot <> 21303 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1319] to agcAotUnit1319@.

agcAotInstallSourceRope(list(
// R30.agc:268
//		EBANK=	TFF		# ABOUT PROPER BODY APPROX ONCE PER SEC.
// R30.agc:269
//		2CADR	V82GON1
// slot 21304 21305
    21304, 3718, 21305, 36968
)).

// bank 22, slots 21306-21310
function agcAotUnit1320 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21307 {
        if slot <= 21306 {
// R30.agc:270
//
// R30.agc:271
//		RELINT
// slot 21306
            if slot <> 21306 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:272
//		CCS	NEWJOB		# WITHOLD V16 N44 UNTIL FIRST ORBIT CALC
// slot 21307
            if slot <> 21307 or instruction <> 4151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 55).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21308 {
// R30.agc:273
//		TC	CHANG1		# IS DONE. NOTE: V82GON1 (PRIO7, FINDVAC
// slot 21308
            if slot <> 21308 or instruction <> 2642 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2642, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21309 {
// R30.agc:274
//					# JOB) IS COMPLETED BEFORE V82GON (PRIO7,
// R30.agc:275
//					# NOVAC JOB).
// R30.agc:276
//V82REDSP	CAF	V16N44		# MONITOR HAPO, HPER, TFF
// slot 21309
                if slot <> 21309 or instruction <> 14031 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1743), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:277
//		TC	BANKCALL
// slot 21310
                if slot <> 21310 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1320] to agcAotUnit1320@.

agcAotInstallSourceRope(list(
// R30.agc:278
//		CADR	GOXDSPF
// slot 21311
    21311, 16824
)).

// bank 22, slots 21312-21315
function agcAotUnit1321 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21313 {
        if slot <= 21312 {
// R30.agc:279
//		TC	B5OFF		# TERM THIS TELLS V82GON1 TO KILL ITSELF.
// slot 21312
            if slot <> 21312 or instruction <> 2931 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2931, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:280
//		TC	B5OFF		# PROC DITTO.
// slot 21313
            if slot <> 21313 or instruction <> 2931 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2931, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21314 {
// R30.agc:281
//		TC	V82REDSP	# RECYCLE
// slot 21314
            if slot <> 21314 or instruction <> 1853 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1853, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R30.agc:282
//
// R30.agc:283
//V82GON1		TC	INTPRET		# THIS EXEC PROGRAM PERPETUATES ITSELF
// slot 21315
            if slot <> 21315 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1321] to agcAotUnit1321@.

agcAotInstallSourceRope(list(
// R30.agc:284
//					# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
// R30.agc:285
//		VLOAD	GOTO		# HOLDS OFF CCS NEWJOB BETWEEN RN AND
// slot 21316
    21316, 43258,
// R30.agc:286
//			RN		#   VN FETCH SO RN , VN ARE FROM SAME
// slot 21317
    21317, 1314,
// R30.agc:287
//			NEXTLINE	#   STATE VECTOR UPDATE.
// slot 21318
    21318, 38542,
// R30.agc:288
//NEXTLINE	STOVL	RONE		#  RN AT (-29)M FOR EARTH OR MOON
// slot 21319
    21319, 22798,
// R30.agc:289
//			VN
// slot 21320
    21320, 1326,
// R30.agc:290
//		STORE	VONE		# VN AT (-7)M/CS FOR EARTH OR MOON
// slot 21321
    21321, 2330,
// R30.agc:291
//		BON	GOTO
// slot 21322
    21322, 43032,
// R30.agc:292
//			MOONTHIS	# FLAG INDICATES BODY ABOUT WHICH ORBITAL
// slot 21323
    21323, 4488,
// R30.agc:293
//			MOONGON		#    CALCULATIONS ARE TO BE PERFORMED.
// slot 21324
    21324, 38556,
// R30.agc:294
//			EARTHGON	#   IF SET - MOON , IF RESET - EARTH.
// slot 21325
    21325, 38574,
// R30.agc:295
//
// R30.agc:296
//MOONGON		SET	DLOAD
// slot 21326
    21326, 58648,
// R30.agc:297
//			V82EMFLG	# INDICATE MOON SCALING FOR SR30.1
// slot 21327
    21327, 3706,
// R30.agc:298
//			1/RTMUM		# LUNAR PARAMETERS LOADED HERE FOR SR30.1
// slot 21328
    21328, 4098,
// R30.agc:299
//		STODL	TFF/RTMU
// slot 21329
    21329, 12350,
// R30.agc:300
//			MINPERM
// slot 21330
    21330, 5608,
// R30.agc:301
//		STOVL	HPERMIN
// slot 21331
    21331, 22786,
// R30.agc:302
//			RLS		#  SCALED AT (-27)M.
// slot 21332
    21332, 2086,
// R30.agc:303
//		ABVAL	GOTO
// slot 21333
    21333, 43084,
// R30.agc:304
//			V82GON2
// slot 21334
    21334, 38588,
// R30.agc:305
//EARTHGON	CLEAR	DLOAD
// slot 21335
    21335, 58648,
// R30.agc:306
//			V82EMFLG	# INDICATE EARTH SCALING FOR SR30.1
// slot 21336
    21336, 3962,
// R30.agc:307
//			1/RTMUE		# EARTH PARAMETERS LOADED HERE FOR SR30.1
// slot 21337
    21337, 4102,
// R30.agc:308
//		STODL	TFF/RTMU
// slot 21338
    21338, 12350,
// R30.agc:309
//			MINPERE
// slot 21339
    21339, 5612,
// R30.agc:310
//		STODL	HPERMIN
// slot 21340
    21340, 14594,
// R30.agc:311
//			RPAD
// slot 21341
    21341, 6554,
// R30.agc:312
//V82GON2		STCALL	RPADTEM		# COMMON CODE FOR EARTH & MOON.
// slot 21342
    21342, 30982,
// R30.agc:313
//			SR30.1
// slot 21343
    21343, 38610,
// R30.agc:314
//# Page 718
// R30.agc:315
//		EXIT
// slot 21344
    21344, 65532
)).

// bank 22, slots 21345-21350
function agcAotUnit1322 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21347 {
        if slot <= 21345 {
// R30.agc:316
//V82GON3		CAF	BIT5
// slot 21345
            if slot <> 21345 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21346 {
// R30.agc:317
//		MASK	EXTVBACT	# SEE IF ASTRONAUT HAS SIGNALLED TERMINATE
// slot 21346
                if slot <> 21346 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:318
//		EXTEND
// slot 21347
                if slot <> 21347 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21348 {
// R30.agc:319
//		BZF	ENDEXT		# YES, TERMINATE VB 82 LOOP
// slot 21348
            if slot <> 21348 or instruction <> 6970 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6970, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21349 {
// R30.agc:320
//		CAF	1SEC
// slot 21349
                if slot <> 21349 or instruction <> 14847 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R30.agc:321
//		TC	BANKCALL	# WAIT ONE SECOND BEFORE REPEATING
// slot 21350
                if slot <> 21350 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1322] to agcAotUnit1322@.

agcAotInstallSourceRope(list(
// R30.agc:322
//		CADR	DELAYJOB	#   ORBITAL PARAMETER COMPUTATION.
// slot 21351
    21351, 1978
)).

// bank 22, slots 21352-21352
function agcAotUnit1323 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R30.agc:323
//		TC	V82GON1
// slot 21352
    if slot <> 21352 or instruction <> 1859 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1859, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1323] to agcAotUnit1323@.

agcAotInstallSourceRope(list(
// R30.agc:324
//
// R30.agc:325
//SPLRET		=	V82GON3
// R30.agc:326
//
// R30.agc:327
//# Page 719
// R30.agc:328
//# SUBROUTINE NAME: SR30.1
// R30.agc:329
//# MOD NO: 0								DATE: 16 FEB 67
// R30.agc:330
//# MOD BY: R. R. BAIRNSFATHER						LOG SECTION: R32
// R30.agc:331
//# MOD NO: 1	MOD BY: R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
// R30.agc:332
//# MOD NO: 2	MOD BY: R. R. BAIRNSFATHER	DATE: 14 APR 67		ADD OVFL CK FOR RAPO
// R30.agc:333
//# MOD NO: 3	MOD BY ALONSO			DATE: 11 DEC 67		SUBROUTINE REWRITTEN
// R30.agc:334
//# MOD NO: 4	MOD BY ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
// R30.agc:335
//# MOD NO: 5	MOD BY: R. R. BAIRNSFATHER	DATE: 6 AUG 68		OVFL CK FOR HAPO & HPER. VOIDS MOD #2.
// R30.agc:336
//#
// R30.agc:337
//# NEW FUNCTIONAL DESCRIPTION:  ORBITAL PARAMETERS DISPLAY FOR NOUNS 32 AND 44.
// R30.agc:338
//# SR30.1 CALLS TFFCONMU AND TFFRP/RA TO CALCULATE RPER (PERIGEE RADIUS),
// R30.agc:339
//# RAPO (APOGEE RADIUS), HPER (PERIGEE HEIGHT ABOVE LAUNCH PAD OR LUNAR
// R30.agc:340
//# LANDING SITE), HAPO (APOGEE HEIGHT AS ABOVE), TPER (TIME TO PERIGEE),
// R30.agc:341
//# TFF (TIME TO INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// R30.agc:342
//# IF HPER IS GREATER THAN OR EQUAL TO HPERMIN, CALCULATES TPER AND STORES
// R30.agc:343
//# NEGATIVE IN -TPER.  OTHERWISE STORES +0 IN -TPER.  WHENEVER TPER IS
// R30.agc:344
//# CALCULATED, TFF IS NOT COMPUTABLE AND DEFAULTS TO -59MIN 59SEC.  IF HAPO
// R30.agc:345
//# WOULD EXCEED 9999.9 NM, IT IS LIMITED TO THAT VALUE FOR DISPLAY.
// R30.agc:346
//#
// R30.agc:347
//# ADDENDUM:	HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// R30.agc:348
//#		ABOVE REMARKS.
// R30.agc:349
//#
// R30.agc:350
//# CALLING SEQUENCE:	CALL
// R30.agc:351
//#				SR30.1
// R30.agc:352
//#
// R30.agc:353
//# SUBROUTINES CALLED:	TFFCONMU, TFFRP/RA, CALCTPER, CALCTFF
// R30.agc:354
//#
// R30.agc:355
//# NORMAL EXIT MODE:	CALLING LINE +1 (STILL IN INTERPRETIVE MODE)
// R30.agc:356
//#
// R30.agc:357
//# ALARMS:	NONE
// R30.agc:358
//#
// R30.agc:359
//# OUTPUT:	RAPO	(-29) M EARTH	APOGEE RADIUS	EARTH CENTERED COORD.
// R30.agc:360
//#			(-27) M MOON			MOON CENTERED COORD.
// R30.agc:361
//#		RPER	(-29) M EARTH	PERIGEE RADIUS	EARTH CENTERED COORD.
// R30.agc:362
//#			(-27) M MOON			MOON CENTERED COORD.
// R30.agc:363
//#		HAPOX	(-29) M		APOGEE ALTITUDE ABOVE PAD OR LAND. SITE MAX VALUE LIMITED TO 9999.9 NM.
// R30.agc:364
//#		HPERX	(-29) M		PERIGEE ALT. ABOVE PAD OR LAND. SITE    MAX VALUE LIMITED TO 9999.9 NM.
// R30.agc:365
//#		TFF	(-28) CS	TIME TO 300KFT OR 35KFT ALTITUDE
// R30.agc:366
//#		-TPER	(-28) CS	TIME TO PERIGEE
// R30.agc:367
//#
// R30.agc:368
//# ERASABLE INITIALIZATION REQUIRED --
// R30.agc:369
//#	TFF/RTMU	(+17) EARTH	RECIPROCAL OF PROPER GRAV CONSTANT FOR
// R30.agc:370
//#			(+14) MOON	EARTH OR MOON = 1/SQRT(MU).
// R30.agc:371
//#	RONE		(-29) M		STATE VECTOR
// R30.agc:372
//#	VONE		(-7)  M/CS	STATE VECTOR
// R30.agc:373
//#	RPADTEM		(-29) M EARTH	RADIUS OF LAUNCH PAD OR LUNAR LANDING
// R30.agc:374
//#			(-27) M MOON	SITE.
// R30.agc:375
//#	HPERMIN		(-29) M EARTH	(300 OR 35) KFT MINIMUM PERIGEE ALTITUDE
// R30.agc:376
//#			(-27) M MOON	ABOVE LAUNCH PAD OR LUNAR LANDING SITE.
// R30.agc:377
//#	V82EMFLG	(INT SW BIT)	RESET FOR EARTH, SET FOR MOON.
// R30.agc:378
//#
// R30.agc:379
//# DEBRIS:	QPREG, PDL, S2
// R30.agc:380
//
// R30.agc:381
//# Page 720
// R30.agc:382
//		COUNT*	$$/SR30S
// R30.agc:383
//
// R30.agc:384
//SR30.1		SETPD	STQ		# INITIALIZE PUSHDOWN LIST.
// slot 21353
    21353, 36866,
// R30.agc:385
//			0
// slot 21354
    21354, 2,
// R30.agc:386
//			S2
// slot 21355
    21355, 82,
// R30.agc:387
//					# SR30.1 INPUT:	RONE AT (-29)M EARTH/MOON
// R30.agc:388
//					#		VONE AT (-7)M/CS
// R30.agc:389
//					# TFFCONMU, TFFRP/RA, CALCTPER, AND CALCTFF
// R30.agc:390
//					# CALLS REQUIRE:
// R30.agc:391
//					# EARTH CENTERED (NO RESCALING REQUIRED)
// R30.agc:392
//					#	RONE SCALED TO B-29 M
// R30.agc:393
//					#	VONE SCALED TO B-7  M/CS
// R30.agc:394
//					# MOON CENTERED (RESCALING REQUIRED)
// R30.agc:395
//					#	RONE SCALED TO B-27 M
// R30.agc:396
//					#	VONE SCALED TO B-5  M/CS
// R30.agc:397
//		BOFF	VLOAD
// slot 21356
    21356, 64792,
// R30.agc:398
//			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
// slot 21357
    21357, 4058,
// R30.agc:399
//			TFFCALLS
// slot 21358
    21358, 38634,
// R30.agc:400
//			RONE
// slot 21359
    21359, 2318,
// R30.agc:401
//		VSL2
// slot 21360
    21360, 65492,
// R30.agc:402
//		STOVL	RONE
// slot 21361
    21361, 22798,
// R30.agc:403
//			VONE
// slot 21362
    21362, 2330,
// R30.agc:404
//		VSL2
// slot 21363
    21363, 65492,
// R30.agc:405
//		STORE	VONE
// slot 21364
    21364, 2330,
// R30.agc:406
//TFFCALLS	CALL
// slot 21365
    21365, 65320,
// R30.agc:407
//			TFFCONMU
// slot 21366
    21366, 48610,
// R30.agc:408
//		CALL			# TFFRP/RA COMPUTES RAPO,RPER.
// slot 21367
    21367, 65320,
// R30.agc:409
//			TFFRP/RA
// slot 21368
    21368, 48686,
// R30.agc:410
//					# RETURNS WITH RAPO IN D(MPAC).
// R30.agc:411
//		DSU
// slot 21369
    21369, 65322,
// R30.agc:412
//			RPADTEM
// slot 21370
    21370, 2310,
// R30.agc:413
//		BOFF	SR2R		# NEED HAPO AT (-29)M FOR DISPLAY.
// slot 21371
    21371, 53784,
// R30.agc:414
//					# IF MOON CENTERED, RESCALE FROM (-27)M.
// R30.agc:415
//					# IF EARTH CENTERED ALREADY AT (-29)M.
// R30.agc:416
//			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
// slot 21372
    21372, 4058,
// R30.agc:417
//			+1
// slot 21373
    21373, 38652,
// R30.agc:418
//		CALL			# IF RAPO > MAXNM, SET RAPO =9999.9 NM.
// slot 21374
    21374, 65320,
// R30.agc:419
//			MAXCHK		# OTHERWISE STORE (RAPO-RPADTEM) IN HAPO.
// slot 21375
    21375, 38716,
// R30.agc:420
//STORHAPO	STODL	HAPOX
// slot 21376
    21376, 14496,
// R30.agc:421
//			RPER
// slot 21377
    21377, 30,
// R30.agc:422
//		DSU
// slot 21378
    21378, 65322,
// R30.agc:423
//			RPADTEM		# GIVES HPER AT (-29)M EARTH, (-27)M MOON.
// slot 21379
    21379, 2310,
// R30.agc:424
//		STORE	MPAC +4		# SAVE THIS FOR COMPARISON TO HPERMIN.
// slot 21380
    21380, 226,
// R30.agc:425
//		BOFF	SR2R		# NEED HPER AT (-29)M FOR DISPLAY.
// slot 21381
    21381, 53784,
// R30.agc:426
//					# IF MOON CENTERED, RESCALE FROM (-27)M.
// R30.agc:427
//					# IF EARTH CENTERED ALREADY AT (-29)M.
// R30.agc:428
//			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
// slot 21382
    21382, 4058,
// R30.agc:429
//			+1
// slot 21383
    21383, 38672,
// R30.agc:430
//		CALL			# IF HPER > MAXNM, SET HPER = 9999.9 NM.
// slot 21384
    21384, 65320,
// R30.agc:431
//			MAXCHK
// slot 21385
    21385, 38716,
// R30.agc:432
//# Page 721
// R30.agc:433
//STORHPER	STODL	HPERX		# STORE (RPER - RPADTEM) INTO HPERX.
// slot 21386
    21386, 14500,
// R30.agc:434
//			MPAC 	+4
// slot 21387
    21387, 226,
// R30.agc:435
//		DSU	BPL		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
// slot 21388
    21388, 42026,
// R30.agc:436
//			HPERMIN		# IF HPER L/   HPERMIN (300 OR 35)KFT,
// slot 21389
    21389, 2306,
// R30.agc:437
//			DOTPER		#  THEN ZERO INTO -TPER.
// slot 21390
    21390, 38692,
// R30.agc:438
//		DLOAD	GOTO		#   OTHERWISE CALCULATE TPER.
// slot 21391
    21391, 43210,
// R30.agc:439
//			HI6ZEROS
// slot 21392
    21392, 6820,
// R30.agc:440
//			SKIPTPER
// slot 21393
    21393, 38700,
// R30.agc:441
//DOTPER		DLOAD	CALL
// slot 21394
    21394, 38090,
// R30.agc:442
//			RPER
// slot 21395
    21395, 30,
// R30.agc:443
//			CALCTPER
// slot 21396
    21396, 48746,
// R30.agc:444
//		DCOMP			# TPER IS PUT NEG INTO -TPER.
// slot 21397
    21397, 65404,
// R30.agc:445
//SKIPTPER	STODL	-TPER
// slot 21398
    21398, 14534,
// R30.agc:446
//			HPERMIN		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
// slot 21399
    21399, 2306,
// R30.agc:447
//		DAD	CALL
// slot 21400
    21400, 37914,
// R30.agc:448
//			RPADTEM		# RPADTEM AT (-29)M FOR EARTH, (-27)M MOON
// slot 21401
    21401, 2310,
// R30.agc:449
//			CALCTFF		# GIVES 59M59S FOR TFF IF HPER G/
// slot 21402
    21402, 48752,
// R30.agc:450
//		DCOMP			#   HPERMIN + RPADTEM. (TPER WAS NON ZERO)
// slot 21403
    21403, 65404,
// R30.agc:451
//		STCALL	TFF		# OTHERWISE COMPUTES TFF.	(GOTO)
// slot 21404
    21404, 30914
)).

agcAotInstallSourceRope(list(
// R30.agc:452
//			S2
// slot 21405
    21405, 82,
// R30.agc:453
//
// R30.agc:454
//MAXCHK		DSU	BPL		# IF C(MPAC) > 9999.9 NM. MPAC = 9999.9 NM.
// slot 21406
    21406, 42026,
// R30.agc:455
//			MAXNM
// slot 21407
    21407, 5964,
// R30.agc:456
//			+3		# OTHERWISE C(MPAC) = B(MPAC).
// slot 21408
    21408, 38726,
// R30.agc:457
//		DAD	RVQ
// slot 21409
    21409, 36378,
// R30.agc:458
//			MAXNM
// slot 21410
    21410, 5964,
// R30.agc:459
// +3		DLOAD	RVQ		# (USED BY P30 - P37 ALSO)
// slot 21411
    21411, 36554,
// R30.agc:460
//			MAXNM
// slot 21412
    21412, 5964,
// R30.agc:461
//
// R30.agc:462
//MAXNM		2OCT	0106505603
// slot 21413 21414
    21413, 1130, 21414, 5894
)).

// no code for the lines below
// R30.agc:463
//
// R30.agc:464
//# Page 722 (empty page)
