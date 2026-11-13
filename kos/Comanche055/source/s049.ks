// PORT: Original source unit P76.agc.
// PORT: Physical bank 13. Shared continuation entries, slots 13369–13369.
function agcAotUnit730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE P76.agc:2
//# Filename:     P76.agc
// PORT: SOURCE P76.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P76.agc:4
//#               It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P76.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P76.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE P76.agc:7
//# Contact:      Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE P76.agc:8
//# Website:      www.ibiblio.org/apollo.
// PORT: SOURCE P76.agc:9
//# Pages:	pp  511-513
// PORT: SOURCE P76.agc:10
//# Mod history:  2009-05-08 HG    Adapting from the Luminary131/ file
// PORT: SOURCE P76.agc:11
//#               of the same name, using Comanche055 page
// PORT: SOURCE P76.agc:12
//#               images 0511.jpg - 0513.jpg.
// PORT: SOURCE P76.agc:13
//#
// PORT: SOURCE P76.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P76.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P76.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P76.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P76.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P76.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P76.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P76.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P76.agc:22
//#
// PORT: SOURCE P76.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P76.agc:24
//#
// PORT: SOURCE P76.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P76.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P76.agc:27
//#
// PORT: SOURCE P76.agc:28
//#    This AGC program shall also be referred to as
// PORT: SOURCE P76.agc:29
//#            Colossus 2A
// PORT: SOURCE P76.agc:30
//
// PORT: SOURCE P76.agc:31
//# Page 511
// PORT: SOURCE P76.agc:32
//# 1)	PROGRAM NAME - TARGET DELTA V PROGRAM (P76).
// PORT: SOURCE P76.agc:33
//# 2)	FUNCTIONAL DESCRIPTION - UPON ENTRY BY ASTRONAUT ACTION, P76 FLASHES DSKY REQUESTS TO THE ASTRONAUT
// PORT: SOURCE P76.agc:34
//#	TO PROVIDE VIA DSKY (1) THE DELTA V TO BE APPLIED TO THE OTHER VEHICLE STATE VECTOR AND (2) THE
// PORT: SOURCE P76.agc:35
//#	TIME (TIG) AT WHICH THE OTHER VEHICLE VELOCITY WAS CHANGED BY EXECUTION OF A THRUSTING MANEUVER. THE
// PORT: SOURCE P76.agc:36
//#	OTHER VEHICLE STATE VECTOR IS INTEGRATED TO TIG AND UPDATED BY THE ADDITION OF DELTA V (DELTA V HAVING
// PORT: SOURCE P76.agc:37
//#	BEEN TRANSFORMED FROM LV TO REF COSYS).  USING INTEGRVS, THE PROGRAM THEN INTEGRATES THE OTHER
// PORT: SOURCE P76.agc:38
//#	VEHICLE STATE VECTOR TO THE STATE VECTOR OF THIS VEHICLE, THUS INSURING THAT THE W-MATRIX AND BOTH VEHICLE
// PORT: SOURCE P76.agc:39
//#	STATES CORRESPOND TO THE SAME TIME.
// PORT: SOURCE P76.agc:40
//# 3)	ERASABLE INITIALIZATION REQUIRED - NONE.
// PORT: SOURCE P76.agc:41
//# 4)	CALLING SEQUENCES AND EXIT MODES - CALLED BY ASTRONAUT REQUEST THRU DSKY V 37 E 76 E.
// PORT: SOURCE P76.agc:42
//#	EXITS BY TCF ENDOFJOB.
// PORT: SOURCE P76.agc:43
//# 5)	OUTPUT - OTHER VEHICLE STATE VECTOR INTEGRATED TO TIG AND INCREMENTED BY DELTA V IN REF COSYS.
// PORT: SOURCE P76.agc:44
//#	THE PUSHLIST CONTAINS THE MATRIX BY WHICH THE INPUT DELTA V MUST BE POST-MULTIPLIED TO CONVERT FROM LV
// PORT: SOURCE P76.agc:45
//#	TO REF COSYS.
// PORT: SOURCE P76.agc:46
//# 6)	DEBRIS - OTHER VEHICLE STATE VECTOR.
// PORT: SOURCE P76.agc:47
//# 7)	SUBROUTINES CALLED - BANKCALL,GOXDSPF,CSMPREC (OR LEMPREC),ATOPCSM (OR ATOPLEM),INTSTALL,INTWAKE, PHASCHNG
// PORT: SOURCE P76.agc:48
//#	INTPRET, INTEGRVS, AND MINIRECT.
// PORT: SOURCE P76.agc:49
//# 8)	FLAG USE - MOONFLAG,CMOONFLG,INTYPFLG,RASFLAG, AND MARKCTR.
// PORT: SOURCE P76.agc:50
//
// PORT: SOURCE P76.agc:51
//		BANK	30
// PORT: SOURCE P76.agc:52
//		SETLOC	P76LOC
// PORT: SOURCE P76.agc:53
//		BANK
// PORT: SOURCE P76.agc:54
//
// PORT: SOURCE P76.agc:55
//		COUNT*	$$/P76
// PORT: SOURCE P76.agc:56
//
// PORT: SOURCE P76.agc:57
//		EBANK=	TIG
// PORT: SOURCE P76.agc:58
//
// PORT: SOURCE P76.agc:59
//P76		TC	UPFLAG
// PORT: Fixed ROM slots 13369.
    if slot <> 13369 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[730] to agcAotUnit730@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:60
//		ADRES	TRACKFLG
// PORT: Fixed ROM slots 13370.
    13370, 50
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13371–13372.
function agcAotUnit731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13371 {
// PORT: SOURCE P76.agc:61
//
// PORT: SOURCE P76.agc:62
//		CAF	V06N84          # FLASH LAST DELTA V.
// PORT: Fixed ROM slots 13371.
        if slot <> 13371 or instruction <> 13456 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1168), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P76.agc:63
//		TC      BANKCALL        # AND WAIT FOR KEYBOARD ACTION.
// PORT: Fixed ROM slots 13372.
        if slot <> 13372 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[731] to agcAotUnit731@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:64
//	        CADR    GOFLASH
// PORT: Fixed ROM slots 13373.
    13373, 17312
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13374–13378.
function agcAotUnit732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13375 {
        if slot <= 13374 {
// PORT: SOURCE P76.agc:65
//		TCF     ENDP76
// PORT: Fixed ROM slots 13374.
            if slot <> 13374 or instruction <> 5258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:66
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 13375.
            if slot <> 13375 or instruction <> 1089 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1089, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13376 {
// PORT: SOURCE P76.agc:67
//		TC	-5		# STORE DATA AND REPEAT FLASHING
// PORT: Fixed ROM slots 13376.
            if slot <> 13376 or instruction <> 1083 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1083, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13377 {
// PORT: SOURCE P76.agc:68
//		CAF	V06N84 +1	# FLASH VERB 06 NOUN 33, DISPLAY LAST TIG,
// PORT: Fixed ROM slots 13377.
                if slot <> 13377 or instruction <> 13457 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1169), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P76.agc:69
//		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
// PORT: Fixed ROM slots 13378.
                if slot <> 13378 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[732] to agcAotUnit732@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:70
//		CADR	GOFLASH
// PORT: Fixed ROM slots 13379.
    13379, 17312
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13380–13383.
function agcAotUnit733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13381 {
        if slot <= 13380 {
// PORT: SOURCE P76.agc:71
//		TCF	ENDP76
// PORT: Fixed ROM slots 13380.
            if slot <> 13380 or instruction <> 5258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:72
//		TC	+2
// PORT: Fixed ROM slots 13381.
            if slot <> 13381 or instruction <> 1095 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1095, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13382 {
// PORT: SOURCE P76.agc:73
//		TC	-5
// PORT: Fixed ROM slots 13382.
            if slot <> 13382 or instruction <> 1089 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1089, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:74
//		TC	INTPRET		# RETURN TO INTERPRETIVE CODE
// PORT: Fixed ROM slots 13383.
            if slot <> 13383 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[733] to agcAotUnit733@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:75
//		DLOAD	                # SET D(MPAC)=TIG IN CSEC B28
// PORT: Fixed ROM slots 13384.
    13384, 65482,
// PORT: SOURCE P76.agc:76
//			TIG
// PORT: Fixed ROM slots 13385.
    13385, 3606,
// PORT: SOURCE P76.agc:77
//		STCALL	TDEC1		# SET TDEC1=TIG FOR ORBITAL INTEGRATION
// PORT: Fixed ROM slots 13386.
    13386, 28738,
// PORT: SOURCE P76.agc:78
//			OTHPREC
// PORT: Fixed ROM slots 13387.
    13387, 23690,
// PORT: SOURCE P76.agc:79
//COMPMAT		VLOAD	UNIT
// PORT: Fixed ROM slots 13388.
    13388, 44794,
// PORT: SOURCE P76.agc:80
//			RATT
// PORT: Fixed ROM slots 13389.
    13389, 2,
// PORT: SOURCE P76.agc:81
//# Page 512
// PORT: SOURCE P76.agc:82
//		VCOMP			# U(-R)
// PORT: Fixed ROM slots 13390.
    13390, 65404,
// PORT: SOURCE P76.agc:83
//		STORE	24D		# U(-R) TO 24D
// PORT: Fixed ROM slots 13391.
    13391, 50,
// PORT: SOURCE P76.agc:84
//		VXV	UNIT		# U(-R) X V = U(V X R)
// PORT: Fixed ROM slots 13392.
    13392, 44602,
// PORT: SOURCE P76.agc:85
//			VATT
// PORT: Fixed ROM slots 13393.
    13393, 14,
// PORT: SOURCE P76.agc:86
//		STORE	18D
// PORT: Fixed ROM slots 13394.
    13394, 38,
// PORT: SOURCE P76.agc:87
//		VXV	UNIT		# U(V X R) X U(-R) = U((R X V) X R)
// PORT: Fixed ROM slots 13395.
    13395, 44602,
// PORT: SOURCE P76.agc:88
//			24D
// PORT: Fixed ROM slots 13396.
    13396, 50,
// PORT: SOURCE P76.agc:89
//		STOVL	12D
// PORT: Fixed ROM slots 13397.
    13397, 20506,
// PORT: SOURCE P76.agc:90
//			DELVOV
// PORT: Fixed ROM slots 13398.
    13398, 3776,
// PORT: SOURCE P76.agc:91
//		VXM	VSL1		# V(MPAC)=DELTA V IN REFCOSYS
// PORT: Fixed ROM slots 13399.
    13399, 64138,
// PORT: SOURCE P76.agc:92
//			12D
// PORT: Fixed ROM slots 13400.
    13400, 26,
// PORT: SOURCE P76.agc:93
//		VAD
// PORT: Fixed ROM slots 13401.
    13401, 65370,
// PORT: SOURCE P76.agc:94
//			VATT
// PORT: Fixed ROM slots 13402.
    13402, 14,
// PORT: SOURCE P76.agc:95
//		STORE	6		# V(PD6)=VATT + DELTA V
// PORT: Fixed ROM slots 13403.
    13403, 14,
// PORT: SOURCE P76.agc:96
//		CALL			# PREVENT WOULD-BE USER OF ORBITAL
// PORT: Fixed ROM slots 13404.
    13404, 65320,
// PORT: SOURCE P76.agc:97
//			INTSTALL	# INTEG FROM INTERFERING WITH UPDATING
// PORT: Fixed ROM slots 13405.
    13405, 24132,
// PORT: SOURCE P76.agc:98
//		CALL
// PORT: Fixed ROM slots 13406.
    13406, 65320,
// PORT: SOURCE P76.agc:99
//			P76SUB1
// PORT: Fixed ROM slots 13407.
    13407, 22820,
// PORT: SOURCE P76.agc:100
//		VLOAD	VSR*
// PORT: Fixed ROM slots 13408.
    13408, 45050,
// PORT: SOURCE P76.agc:101
//			6
// PORT: Fixed ROM slots 13409.
    13409, 14,
// PORT: SOURCE P76.agc:102
//			0,2
// PORT: Fixed ROM slots 13410.
    13410, 48380,
// PORT: SOURCE P76.agc:103
//		STOVL	VCV
// PORT: Fixed ROM slots 13411.
    13411, 22214,
// PORT: SOURCE P76.agc:104
//			RATT
// PORT: Fixed ROM slots 13412.
    13412, 2,
// PORT: SOURCE P76.agc:105
//		VSR*
// PORT: Fixed ROM slots 13413.
    13413, 65374,
// PORT: SOURCE P76.agc:106
//			0,2
// PORT: Fixed ROM slots 13414.
    13414, 48380,
// PORT: SOURCE P76.agc:107
//		STODL	RCV
// PORT: Fixed ROM slots 13415.
    13415, 14010,
// PORT: SOURCE P76.agc:108
//			TIG
// PORT: Fixed ROM slots 13416.
    13416, 3606,
// PORT: SOURCE P76.agc:109
//		STORE	TET
// PORT: Fixed ROM slots 13417.
    13417, 1694,
// PORT: SOURCE P76.agc:110
//		CLEAR	DLOAD
// PORT: Fixed ROM slots 13418.
    13418, 58648,
// PORT: SOURCE P76.agc:111
//			INTYPFLG
// PORT: Fixed ROM slots 13419.
    13419, 1910,
// PORT: SOURCE P76.agc:112
//			TETTHIS
// PORT: Fixed ROM slots 13420.
    13420, 1778,
// PORT: SOURCE P76.agc:113
//INTOTHIS	STCALL	TDEC1
// PORT: Fixed ROM slots 13421.
    13421, 28738,
// PORT: SOURCE P76.agc:114
//			INTEGRVS
// PORT: Fixed ROM slots 13422.
    13422, 23738,
// PORT: SOURCE P76.agc:115
//		CALL
// PORT: Fixed ROM slots 13423.
    13423, 65320,
// PORT: SOURCE P76.agc:116
//			INTSTALL
// PORT: Fixed ROM slots 13424.
    13424, 24132,
// PORT: SOURCE P76.agc:117
//		CALL
// PORT: Fixed ROM slots 13425.
    13425, 65320,
// PORT: SOURCE P76.agc:118
//		        P76SUB1         # SET/CLEAR MOONFLAG
// PORT: Fixed ROM slots 13426.
    13426, 22820,
// PORT: SOURCE P76.agc:119
//		VLOAD
// PORT: Fixed ROM slots 13427.
    13427, 65530,
// PORT: SOURCE P76.agc:120
//			RATT1
// PORT: Fixed ROM slots 13428.
    13428, 30,
// PORT: SOURCE P76.agc:121
//		STORE	RRECT
// PORT: Fixed ROM slots 13429.
    13429, 1670,
// PORT: SOURCE P76.agc:122
//		STODL	RCV
// PORT: Fixed ROM slots 13430.
    13430, 14010,
// PORT: SOURCE P76.agc:123
//			TAT
// PORT: Fixed ROM slots 13431.
    13431, 26,
// PORT: SOURCE P76.agc:124
//		STOVL	TET
// PORT: Fixed ROM slots 13432.
    13432, 22174,
// PORT: SOURCE P76.agc:125
//			VATT1
// PORT: Fixed ROM slots 13433.
    13433, 42,
// PORT: SOURCE P76.agc:126
//		CALL
// PORT: Fixed ROM slots 13434.
    13434, 65320,
// PORT: SOURCE P76.agc:127
//			MINIRECT
// PORT: Fixed ROM slots 13435.
    13435, 20026,
// PORT: SOURCE P76.agc:128
//		EXIT
// PORT: Fixed ROM slots 13436.
    13436, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13437–13437.
function agcAotUnit734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:129
//		TC	PHASCHNG
// PORT: Fixed ROM slots 13437.
    if slot <> 13437 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[734] to agcAotUnit734@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:130
//		OCT	04024
// PORT: Fixed ROM slots 13438.
    13438, 4136
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13439–13439.
function agcAotUnit735 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:131
//# Page 513
// PORT: SOURCE P76.agc:132
//		TC	UPFLAG
// PORT: Fixed ROM slots 13439.
    if slot <> 13439 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[735] to agcAotUnit735@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:133
//		ADRES	REINTFLG
// PORT: Fixed ROM slots 13440.
    13440, 316
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13441–13441.
function agcAotUnit736 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:134
//
// PORT: SOURCE P76.agc:135
//		TC	INTPRET
// PORT: Fixed ROM slots 13441.
    if slot <> 13441 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[736] to agcAotUnit736@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:136
//		CALL
// PORT: Fixed ROM slots 13442.
    13442, 65320,
// PORT: SOURCE P76.agc:137
//			ATOPOTH
// PORT: Fixed ROM slots 13443.
    13443, 23520,
// PORT: SOURCE P76.agc:138
//		SSP     EXIT
// PORT: Fixed ROM slots 13444.
    13444, 65202,
// PORT: SOURCE P76.agc:139
//		        QPRET
// PORT: Fixed ROM slots 13445.
    13445, 86,
// PORT: SOURCE P76.agc:140
//		        OUT
// PORT: Fixed ROM slots 13446.
    13446, 22802
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13447–13447.
function agcAotUnit737 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:141
//		TC      BANKCALL        # PERMIT USE OF ORBITAL INTEGRATION
// PORT: Fixed ROM slots 13447.
    if slot <> 13447 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[737] to agcAotUnit737@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:142
//		CADR    INTWAKE1
// PORT: Fixed ROM slots 13448.
    13448, 24190,
// PORT: SOURCE P76.agc:143
//OUT		EXIT
// PORT: Fixed ROM slots 13449.
    13449, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13450–13455.
function agcAotUnit738 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13452 {
        if slot <= 13450 {
// PORT: SOURCE P76.agc:144
//ENDP76		CAF	ZERO
// PORT: Fixed ROM slots 13450.
            if slot <> 13450 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13451 {
// PORT: SOURCE P76.agc:145
//		TS	MARKCTR		# CLEAR RR TRACKING MARK COUNTER
// PORT: Fixed ROM slots 13451.
                if slot <> 13451 or instruction <> 23126 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23126, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P76.agc:146
//		TS      VHFCNT
// PORT: Fixed ROM slots 13452.
                if slot <> 13452 or instruction <> 23125 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23125, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 13453 {
// PORT: SOURCE P76.agc:147
//
// PORT: SOURCE P76.agc:148
//		CAF     NEGONE
// PORT: Fixed ROM slots 13453.
            if slot <> 13453 or instruction <> 16334 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13454 {
// PORT: SOURCE P76.agc:149
//		TS      MRKBUF2         # INVALIDATE MARK BUFFER
// PORT: Fixed ROM slots 13454.
                if slot <> 13454 or instruction <> 23516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23516, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P76.agc:150
//
// PORT: SOURCE P76.agc:151
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 13455.
                if slot <> 13455 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[738] to agcAotUnit738@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:152
//
// PORT: SOURCE P76.agc:153
//V06N84		NV	0684
// PORT: Fixed ROM slots 13456.
    13456, 1704,
// PORT: SOURCE P76.agc:154
//		NV	0633
// PORT: Fixed ROM slots 13457.
    13457, 1602,
// PORT: SOURCE P76.agc:155
//P76SUB1		CLEAR   SLOAD
// PORT: Fixed ROM slots 13458.
    13458, 56600,
// PORT: SOURCE P76.agc:156
//			MOONFLAG
// PORT: Fixed ROM slots 13459.
    13459, 358,
// PORT: SOURCE P76.agc:157
//                        X2
// PORT: Fixed ROM slots 13460.
    13460, 80,
// PORT: SOURCE P76.agc:158
//                BHIZ    SET             # X2=0...CLEAR MOONFLAG
// PORT: Fixed ROM slots 13461.
    13461, 35888,
// PORT: SOURCE P76.agc:159
//                        +2              #   =2.....SET MOONFLAG
// PORT: Fixed ROM slots 13462.
    13462, 22832,
// PORT: SOURCE P76.agc:160
//                        MOONFLAG
// PORT: Fixed ROM slots 13463.
    13463, 102,
// PORT: SOURCE P76.agc:161
//                RVQ
// PORT: Fixed ROM slots 13464.
    13464, 65308
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P76.agc:162
//
