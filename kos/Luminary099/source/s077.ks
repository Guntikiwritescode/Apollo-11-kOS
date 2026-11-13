// PORT: Original source unit SPS_BACK-UP_RCS_CONTROL.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:2
//# Filename:	SPS_BACK-UP_RCS_CONTROL.agc
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:9
//# Pages:	1507-1510
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:13
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:22
//# actually created.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:23
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:25
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:28
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:29
//# Page 1507
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:30
//# PROGRAM NAME:		SPSRCS
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:31
//# AUTHOR:		EDGAR M. OSHIKA (AC ELECTRONICS)
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:32
//# MODIFIED:		TO RETURN TO ALL AXES VIA Q BY P. S. WEISSMAN, OCT 7, 1968
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:33
//# MODIFIED TO IMPROVE BENDING STABILITY BY G. KALAN, FEB. 14, 1969
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:34
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:35
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:36
//#	THE PROGRAM CONTROLS THE FIRING OF ALL RCS JETS IN THE DOCKED CONFIGURATION ACCORDING TO THE FOLLOWING PHASE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:37
//#	PLANE LOGIC.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:38
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:39
//#	1. JET SENSE TEST (SPSRCS)
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:40
//#		IF JETS ARE FIRING NEGATIVELY, SET OLDSENSE NEGATIVE AND CONTINUE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:41
//#		IF JETS ARE FIRING POSITIVELY, SET OLDSENSE POSITIVE AND CONTINUE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:42
//#		IF JETS ARE NOT FIRING, SET OLDSENSE TO ZERO AND GO TO OUTER RATE LIMIT TEST
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:43
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:44
//# 	2. RATE DEAD BAND TEST
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:45
//#		IF JETS ARE FIRING NEGATIVELY AND RATE IS GREATER THAN TARGET RATE, LEAVE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:46
//#			JETS ON AND GO TO INHIBITION LOGIC.  OTHERWISE, CONTINUE.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:47
//#		IF JETS ARE FIRING POSITIVELY AND RATE IS   LESS  THAN TARGET RATE, LEAVE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:48
//#			JETS ON AND GO TO INHIBITION LOGIC.  OTHERWISE, CONTINUE.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:49
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:50
//#	3. OUTER RATE LIMIT TEST (SPSSTART)
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:51
//#		IF MAGNITUDE OF EDOT IS GREATER THAN 1.73 DEG/SEC SET JET FIRING TIME
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:52
//#			TO REDUCE RATE AND GO TO INHIBITION LOGIC.  OTHERWISE, CONTINUE.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:53
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:54
//#	4. COAST ZONE TEST
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:55
//#		IF STATE (E,EDOT) IS BELOW LINE E + 4 X EDOT > -1.4 DEG AND EDOT IS LESS THAN 1.30 DEG/SEC SET JET TIME
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:56
//#		 	POSITIVE AND CONTINUE.  OTHERWISE, SET JET FIRING TIME TO ZERO AND CONTINUE.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:57
//#		IF STATE IS ABOVE LINE E + 4 X EDOT > +1.4 DEG AND EDOT IS GREATER THAN -1.30 DEG/SEC, SET JET TIME NEGATIVE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:58
//#		 	AND CONTINUE.  OTHERWISE, SET JET FIRING TIME TO ZERO AND CONTINUE.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:59
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:60
//#	5. INHIBITION LOGIC
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:61
//#		IF OLDSENSE IS NON-ZERO:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:62
//#			A) RETURN IF JET TIME AS THE SAME SIGN AS OLDSENSE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:63
//#			B) SET INHIBITION COUNTER* AND RETURN IF JET TIME IS ZERO
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:64
//#			C) SET INHIBITION COUNTER,* SET JET TIME TO ZERO AND RETURN IF SIGN
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:65
//#			   OF JET TIME IS OPPOSITE TO THAT OF OLDSENSE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:66
//#		IF OLDSENSE IS ZERO:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:67
//#			A) RETURN IF INHIBITION COUNTER IS NOT POSITIVE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:68
//#			B) SET JET TIME TO ZERO AND RETURN IF INHIBITION COUNTER IS POSITIVE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:69
//#		*NOTE: INHIBITION COUNTERS CAN BE SET TO 4 OR 10 FOR THE P AND UV AXES,
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:70
//#		RESPECTIVELY, IN SPSRCS.  THEY ARE DECREMENTED BY ONE AT THE BEGINNING OF
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:71
//# Page 1508
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:72
//#		EACH DAP PASS.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:73
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:74
//#	THE MINIMUM PULSE WIDTH OF THIS CONTROLLER IS DETERMINED BY THE REPETITION RATE AT WHICH THIS ROUTINE IS CALLED
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:75
//#	AND IS NOMINALLY 100 MS FOR ALL AXES IN DRIFTING FLIGHT.  DURING POWERED FLIGHT THE MINIMUM IS 100 MS FOR THE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:76
//#	P AXIS AND 200 MS FOR THE CONTROL OF THE U AND V AXES.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:77
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:78
//# CALLING SEQUENCE:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:79
//#		INHINT
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:80
//#		TC	IBNKCALL
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:81
//#		CADR	SPSRCE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:82
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:83
//# EXIT:
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:84
//#		TC	Q
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:85
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:86
//# ALARM/ABORT MODE:	NONE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:87
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:88
//# SUBROUTINES CALLED:	NONE
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:89
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:90
//# INPUT:		E, EDOT
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:91
//#			TJP, TJV, TJU		TJ MUST NOT BE NEGATIVE ZERO
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:92
//#
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:93
//# OUTPUT:		TJP, TJV, TJU
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:94
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:95
//		BANK	21
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:96
//		SETLOC	DAPS4
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:97
//		BANK
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:98
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:99
//		COUNT*	$$/DAPBU
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:100
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:101
//		EBANK=	TJU
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:102
//RATELIM2	OCT	00632		# 1.125 DEG/SEC
// PORT: Fixed ROM slots 20390.
    20390, 820
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20391–20392.
function agcAotUnit1257 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20391 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:103
//POSTHRST	CA	HALF
// PORT: Fixed ROM slots 20391.
        if slot <> 20391 or instruction <> 14814 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:104
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:105
//		NDX	AXISCTR
// PORT: Fixed ROM slots 20392.
        if slot <> 20392 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1257] to agcAotUnit1257@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:106
//		TS	TJU
// PORT: Fixed ROM slots 20393.
    20393, 46762
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20394–20397.
function agcAotUnit1258 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20395 {
        if slot <= 20394 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:107
//		CCS	OLDSENSE
// PORT: Fixed ROM slots 20394.
            if slot <> 20394 or instruction <> 5093 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 997).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:108
//		TCF	POSCHECK	# JETS FIRING POSITIVELY
// PORT: Fixed ROM slots 20395.
            if slot <> 20395 or instruction <> 6075 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6075, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20396 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:109
//		TCF	CTRCHECK	# JETS OFF.  CHECK INHIBITION CTR
// PORT: Fixed ROM slots 20396.
            if slot <> 20396 or instruction <> 6078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:110
//NEGCHECK	INDEX	AXISCTR		# JETS FIRING NEGATIVELY
// PORT: Fixed ROM slots 20397.
            if slot <> 20397 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1258] to agcAotUnit1258@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:111
//		CS	TJU
// PORT: Fixed ROM slots 20398.
    20398, 34474
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20399–20403.
function agcAotUnit1259 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20400 {
        if slot <= 20399 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:112
//		CCS	A
// PORT: Fixed ROM slots 20399.
            if slot <> 20399 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:113
//		TC	Q		# RETURN
// PORT: Fixed ROM slots 20400.
            if slot <> 20400 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20401 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:114
//		TCF	+2
// PORT: Fixed ROM slots 20401.
            if slot <> 20401 or instruction <> 6067 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6067, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20402 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:115
//		TCF	+1		# JETS COMMANDED OFF.  SET CTR AND RETURN
// PORT: Fixed ROM slots 20402.
                if slot <> 20402 or instruction <> 6067 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6067, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:116
//SETCTR		INDEX	AXISCTR		# JET FIRING REVERSAL COMMANDED.  SET CTR,
// PORT: Fixed ROM slots 20403.
                if slot <> 20403 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1259] to agcAotUnit1259@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:117
//		CA	UTIME		# SET JET TIME TO ZERO, AND RETURN
// PORT: Fixed ROM slots 20404.
    20404, 28554
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20405–20405.
function agcAotUnit1260 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:118
//# Page 1509
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:119
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 20405.
    if slot <> 20405 or instruction <> 21317 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21317, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21317, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1260] to agcAotUnit1260@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:120
//		TS	UJETCTR
// PORT: Fixed ROM slots 20406.
    20406, 47088
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20407–20408.
function agcAotUnit1261 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20407 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:121
//ZAPTJ		CA	ZERO
// PORT: Fixed ROM slots 20407.
        if slot <> 20407 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:122
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 20408.
        if slot <> 20408 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1261] to agcAotUnit1261@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:123
//		TS	TJU
// PORT: Fixed ROM slots 20409.
    20409, 46762
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20410–20411.
function agcAotUnit1262 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20410 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:124
//		TC	Q
// PORT: Fixed ROM slots 20410.
        if slot <> 20410 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:125
//POSCHECK	INDEX	AXISCTR
// PORT: Fixed ROM slots 20411.
        if slot <> 20411 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1262] to agcAotUnit1262@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:126
//		CA	TJU
// PORT: Fixed ROM slots 20412.
    20412, 26282
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20413–20414.
function agcAotUnit1263 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20413 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:127
//		TCF	NEGCHECK +2
// PORT: Fixed ROM slots 20413.
        if slot <> 20413 or instruction <> 6063 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6063, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:128
//CTRCHECK	INDEX	AXISCTR		# CHECK JET INHIBITION COUNTER
// PORT: Fixed ROM slots 20414.
        if slot <> 20414 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1263] to agcAotUnit1263@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:129
//		CCS	UJETCTR
// PORT: Fixed ROM slots 20415.
    20415, 10224
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20416–20419.
function agcAotUnit1264 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20417 {
        if slot <= 20416 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:130
//		TCF	+2
// PORT: Fixed ROM slots 20416.
            if slot <> 20416 or instruction <> 6082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:131
//		TC	Q		# CTR IS NOT POSITIVE.  RETURN
// PORT: Fixed ROM slots 20417.
            if slot <> 20417 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20418 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:132
//		TCF	ZAPTJ		# CTR IS POSITIVE.  INHIBIT FIRINGS
// PORT: Fixed ROM slots 20418.
            if slot <> 20418 or instruction <> 6071 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6071, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:133
//		TC	Q		# CTR IS NOT POSITIVE.  RETURN
// PORT: Fixed ROM slots 20419.
            if slot <> 20419 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1264] to agcAotUnit1264@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:134
//		OCT	00004
// PORT: Fixed ROM slots 20420.
    20420, 8,
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:135
//UTIME		OCT	00012
// PORT: Fixed ROM slots 20421.
    20421, 20,
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:136
//		OCT	00012
// PORT: Fixed ROM slots 20422.
    20422, 20
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20423–20439.
function agcAotUnit1265 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20430 {
        if slot <= 20426 {
            if slot <= 20424 {
                if slot <= 20423 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:137
//OLDSENSE	EQUALS	DAPTREG1
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:138
//NEGFIRE		CS	ONE		# JETS FIRING NEGATIVELY
// PORT: Fixed ROM slots 20423.
                    if slot <> 20423 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:139
//		TS	OLDSENSE
// PORT: Fixed ROM slots 20424.
                    if slot <> 20424 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20425 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:140
//		CA	EDOT
// PORT: Fixed ROM slots 20425.
                    if slot <> 20425 or instruction <> 13079 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 791).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:141
//		TCF	+4
// PORT: Fixed ROM slots 20426.
                    if slot <> 20426 or instruction <> 6094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6094, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20428 {
                if slot <= 20427 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:142
//PLUSFIRE	CA	ONE
// PORT: Fixed ROM slots 20427.
                    if slot <> 20427 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:143
//		TS	OLDSENSE
// PORT: Fixed ROM slots 20428.
                    if slot <> 20428 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20429 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:144
//		CS	EDOT		# RATE DEAD BAND TEST
// PORT: Fixed ROM slots 20429.
                    if slot <> 20429 or instruction <> 17175 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 791).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:145
//		LXCH	A
// PORT: Fixed ROM slots 20430.
                    if slot <> 20430 or instruction <> 9216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 0, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20434 {
            if slot <= 20432 {
                if slot <= 20431 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:146
//		CS	DAPBOOLS	# IF DRIFTBIT = 1, USE ZERO TARGET RATE
// PORT: Fixed ROM slots 20431.
                    if slot <> 20431 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:147
//		MASK	DRIFTBIT	# IF DRIFTBIT = 0, USE 0.10 RATE TARGET
// PORT: Fixed ROM slots 20432.
                    if slot <> 20432 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        if fixedOperand = 128 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20433 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:148
//		CCS	A
// PORT: Fixed ROM slots 20433.
                    if slot <> 20433 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:149
//		CA	RATEDB1
// PORT: Fixed ROM slots 20434.
                    if slot <> 20434 or instruction <> 14839 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2551), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20436 {
                if slot <= 20435 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:150
//		AD	L
// PORT: Fixed ROM slots 20435.
                    if slot <> 20435 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:151
//		EXTEND
// PORT: Fixed ROM slots 20436.
                    if slot <> 20436 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20437 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:152
//		BZMF	SPSSTART
// PORT: Fixed ROM slots 20437.
                    if slot <> 20437 or instruction <> 26589 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26589, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20438 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:153
//		TCF	POSTHRST +3
// PORT: Fixed ROM slots 20438.
                        if slot <> 20438 or instruction <> 6058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6058, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:154
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:155
//SPSRCS		INDEX	AXISCTR		# JET SENSE TEST
// PORT: Fixed ROM slots 20439.
                        if slot <> 20439 or instruction <> 21317 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21317, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21317, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1265] to agcAotUnit1265@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:156
//		CCS	TJU
// PORT: Fixed ROM slots 20440.
    20440, 9898
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20441–20471.
function agcAotUnit1266 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20455 {
        if slot <= 20447 {
            if slot <= 20443 {
                if slot <= 20441 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:157
//		TCF	PLUSFIRE	# JETS FIRING POSITIVELY
// PORT: Fixed ROM slots 20441.
                    if slot <> 20441 or instruction <> 6091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6091, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20442 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:158
//		TCF	+2
// PORT: Fixed ROM slots 20442.
                        if slot <> 20442 or instruction <> 6108 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6108, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:159
//		TCF	NEGFIRE		# JETS FIRING NEGATIVELY
// PORT: Fixed ROM slots 20443.
                        if slot <> 20443 or instruction <> 6087 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6087, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20445 {
                    if slot <= 20444 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:160
//		TS	OLDSENSE	# JETS OFF
// PORT: Fixed ROM slots 20444.
                        if slot <> 20444 or instruction <> 23525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23525, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:161
//SPSSTART	CA	EDOT		# OUTER RATE LIMIT TEST
// PORT: Fixed ROM slots 20445.
                        if slot <> 20445 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20446 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:162
//		EXTEND
// PORT: Fixed ROM slots 20446.
                        if slot <> 20446 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:163
//		MP	RATELIM1
// PORT: Fixed ROM slots 20447.
                        if slot <> 20447 or instruction <> 31222 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2550, readEffective:call(words, 2550)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20451 {
                if slot <= 20449 {
                    if slot <= 20448 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:164
//		CCS	A
// PORT: Fixed ROM slots 20448.
                        if slot <> 20448 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:165
//		TCF	NEGTHRST	# OUTER RATE LIMIT EXCEEDED
// PORT: Fixed ROM slots 20449.
                        if slot <> 20449 or instruction <> 6128 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6128, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20450 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:166
//		TCF	+2
// PORT: Fixed ROM slots 20450.
                        if slot <> 20450 or instruction <> 6116 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6116, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:167
//		TCF	POSTHRST	# OUTER RATE LIMIT EXCEEDED
// PORT: Fixed ROM slots 20451.
                        if slot <> 20451 or instruction <> 6055 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6055, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20453 {
                    if slot <= 20452 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:168
//		CA	EDOT		# COAST ZONE TEST
// PORT: Fixed ROM slots 20452.
                        if slot <> 20452 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:169
//# Page 1510
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:170
//		AD	E
// PORT: Fixed ROM slots 20453.
                        if slot <> 20453 or instruction <> 25578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20454 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:171
//		EXTEND
// PORT: Fixed ROM slots 20454.
                        if slot <> 20454 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:172
//		MP	DKDB		# PAD LOADED DEADBAND.  FRESHSTART: 1.4 DEG
// PORT: Fixed ROM slots 20455.
                        if slot <> 20455 or instruction <> 29449 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 777, readEffective:call(words, 777)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20463 {
            if slot <= 20459 {
                if slot <= 20457 {
                    if slot <= 20456 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:173
//		EXTEND
// PORT: Fixed ROM slots 20456.
                        if slot <> 20456 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:174
//		BZF	TJZERO
// PORT: Fixed ROM slots 20457.
                        if slot <> 20457 or instruction <> 6134 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6134, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20458 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:175
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:176
//		EXTEND
// PORT: Fixed ROM slots 20458.
                        if slot <> 20458 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:177
//		BZMF	+7
// PORT: Fixed ROM slots 20459.
                        if slot <> 20459 or instruction <> 26610 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26610, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20461 {
                    if slot <= 20460 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:178
//		CA	EDOT
// PORT: Fixed ROM slots 20460.
                        if slot <> 20460 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:179
//		AD	RATELIM2
// PORT: Fixed ROM slots 20461.
                        if slot <> 20461 or instruction <> 26534 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1958), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20462 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:180
//		EXTEND
// PORT: Fixed ROM slots 20462.
                        if slot <> 20462 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:181
//		BZMF	TJZERO
// PORT: Fixed ROM slots 20463.
                        if slot <> 20463 or instruction <> 26614 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26614, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20467 {
                if slot <= 20465 {
                    if slot <= 20464 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:182
//NEGTHRST	CS	HALF
// PORT: Fixed ROM slots 20464.
                        if slot <> 20464 or instruction <> 18910 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:183
//		TCF	POSTHRST +1
// PORT: Fixed ROM slots 20465.
                        if slot <> 20465 or instruction <> 6056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6056, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20466 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:184
// +7		CS	RATELIM2
// PORT: Fixed ROM slots 20466.
                        if slot <> 20466 or instruction <> 18342 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1958), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:185
//		AD	EDOT
// PORT: Fixed ROM slots 20467.
                        if slot <> 20467 or instruction <> 25367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20469 {
                    if slot <= 20468 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:186
//		EXTEND
// PORT: Fixed ROM slots 20468.
                        if slot <> 20468 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:187
//		BZMF	POSTHRST
// PORT: Fixed ROM slots 20469.
                        if slot <> 20469 or instruction <> 26535 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26535, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20470 {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:188
//TJZERO		CA	ZERO
// PORT: Fixed ROM slots 20470.
                        if slot <> 20470 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:189
//		TCF	POSTHRST +1
// PORT: Fixed ROM slots 20471.
                        if slot <> 20471 or instruction <> 6056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6056, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1266] to agcAotUnit1266@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:190
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:191
//RATELIM1	=	CALLCODE	# = 00032, CORRESPONDING TO 1.73 DEG/SEC
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:192
//RATEDB1		=	TBUILDFX	# = 00045, CORRESPONDS TO 0.101 DEG/SEC
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:193
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:194
//# *** END OF LMDAP  .015 ***
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:195
//
// PORT: SOURCE SPS_BACK-UP_RCS_CONTROL.agc:196
//
