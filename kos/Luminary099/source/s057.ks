// PORT: Original source unit P76.agc.
// PORT: Physical bank 13. Shared continuation entries, slots 13447–13447.
function agcAotUnit752 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P76.agc:2
//# Filename:	P76.agc
// PORT: SOURCE P76.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P76.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P76.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P76.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P76.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P76.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P76.agc:9
//# Pages:	709-711
// PORT: SOURCE P76.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// PORT: SOURCE P76.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE P76.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE P76.agc:13
//#
// PORT: SOURCE P76.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P76.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P76.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P76.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P76.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P76.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P76.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P76.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P76.agc:22
//# actually created.
// PORT: SOURCE P76.agc:23
//#
// PORT: SOURCE P76.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P76.agc:25
//#
// PORT: SOURCE P76.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P76.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE P76.agc:28
//
// PORT: SOURCE P76.agc:29
//# Page 709
// PORT: SOURCE P76.agc:30
//# 1) PROGRAM NAME - TARGET DELTA V PROGRAM (P76).
// PORT: SOURCE P76.agc:31
//# 2) FUNCTIONAL DESCRIPTION - UPON ENTRY BY ASTRONAUT ACTION, P76 FLASHES DSKY REQUESTS TO THE ASTRONAUT
// PORT: SOURCE P76.agc:32
//#    TO PROVIDE VIA DSKY (1) THE DELTA V TO BE APPLIED TO THE OTHER VEHICLE STATE VECTOR AND (2) THE
// PORT: SOURCE P76.agc:33
//#    TIME (TIG) AT WHICH THE OTHER VEHICLE VELOCITY WAS CHANGED BY EXECUTION OF A THRUSTING MANEUVER. THE
// PORT: SOURCE P76.agc:34
//#    OTHER VEHICLE STATE VECTOR IS INTEGRATED TO TIG AND UPDATED BY THE ADDITION OF DELTA V (DELTA V HAVING
// PORT: SOURCE P76.agc:35
//#    BEEN TRANSFORMED FROM LV TO REF COSYS).  USING INTEGRVS, THE PROGRAM THEN INTEGRATES THE OTHER
// PORT: SOURCE P76.agc:36
//#    VEHICLE STATE VECTOR TO THE STATE VECTOR OF THIS VEHICLE, THUS INSURING THAT THE W-MATRIX AND BOTH VEHICLE
// PORT: SOURCE P76.agc:37
//#    STATES CORRESPOND TO THE SAME TIME.
// PORT: SOURCE P76.agc:38
//# 3) ERASABLE INIITIALIZATION REQUIRED - NONE.
// PORT: SOURCE P76.agc:39
//# 4) CALLING SEQUENCES AND EXIT MODES - CALLED BY ASTRONAUT REQUEST THRU DSKY V 37 E 76 E.
// PORT: SOURCE P76.agc:40
//#    EXITS BY TCF ENDOFJOB.
// PORT: SOURCE P76.agc:41
//# 5) OUTPUT -- OTHER VEHICLE STATE VECTOR INTEGRATED TO TIG AND INCREMENTED BY DELTA V IN REF COSYS.
// PORT: SOURCE P76.agc:42
//#    THE PUSHLIST CONTAINS THE MATRIX BY WHICH THE INPUT DELTA V MUST BE POST-MULTIPLIED TO CONVERT FROM LV
// PORT: SOURCE P76.agc:43
//#    TO REF COSYS.
// PORT: SOURCE P76.agc:44
//# 6) DEBRIS - OTHER VEHICLE STATE VECTOR.
// PORT: SOURCE P76.agc:45
//# 7) SUBROUTINES CALLED - BANKCALL, GOXDSPF, CSMPREC (OR LEMPREC), ATOPCSM (OR ATOPLEM), INTSTALL, INTWAKE, PHASCHNG
// PORT: SOURCE P76.agc:46
//#    INTPRET, INTEGRVS, AND MINIRECT.
// PORT: SOURCE P76.agc:47
//# 8) FLAG USE - MOONFLAG, CMOONFLG, INTYPFLG, RASFLAG, AND MARKCTR.
// PORT: SOURCE P76.agc:48
//
// PORT: SOURCE P76.agc:49
//		BANK	30
// PORT: SOURCE P76.agc:50
//		SETLOC	P76LOC
// PORT: SOURCE P76.agc:51
//		BANK
// PORT: SOURCE P76.agc:52
//
// PORT: SOURCE P76.agc:53
//		COUNT*	$$/P76
// PORT: SOURCE P76.agc:54
//
// PORT: SOURCE P76.agc:55
//		EBANK=	TIG
// PORT: SOURCE P76.agc:56
//
// PORT: SOURCE P76.agc:57
//P76		TC	UPFLAG
// PORT: Fixed ROM slots 13447.
    if slot <> 13447 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[752] to agcAotUnit752@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:58
//		ADRES	TRACKFLG
// PORT: Fixed ROM slots 13448.
    13448, 50
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13449–13449.
function agcAotUnit753 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:59
//
// PORT: SOURCE P76.agc:60
//		TC	INTPRET
// PORT: Fixed ROM slots 13449.
    if slot <> 13449 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[753] to agcAotUnit753@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:61
//		VLOAD
// PORT: Fixed ROM slots 13450.
    13450, 65530,
// PORT: SOURCE P76.agc:62
//			DELVLVC
// PORT: Fixed ROM slots 13451.
    13451, 3640,
// PORT: SOURCE P76.agc:63
//		STORE	DELVOV
// PORT: Fixed ROM slots 13452.
    13452, 2342,
// PORT: SOURCE P76.agc:64
//		EXIT
// PORT: Fixed ROM slots 13453.
    13453, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13454–13455.
function agcAotUnit754 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13454 {
// PORT: SOURCE P76.agc:65
//
// PORT: SOURCE P76.agc:66
//		CAF	V06N84		# FLASH LAST DELTA V,
// PORT: Fixed ROM slots 13454.
        if slot <> 13454 or instruction <> 13534 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1246), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P76.agc:67
//		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
// PORT: Fixed ROM slots 13455.
        if slot <> 13455 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[754] to agcAotUnit754@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:68
//		CADR	GOFLASH
// PORT: Fixed ROM slots 13456.
    13456, 17020
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13457–13461.
function agcAotUnit755 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13458 {
        if slot <= 13457 {
// PORT: SOURCE P76.agc:69
//		TCF	ENDP76
// PORT: Fixed ROM slots 13457.
            if slot <> 13457 or instruction <> 5339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5339, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:70
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 13458.
            if slot <> 13458 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13459 {
// PORT: SOURCE P76.agc:71
//		TC	-5		# STORE DATA AND REPEAT FLASHING
// PORT: Fixed ROM slots 13459.
            if slot <> 13459 or instruction <> 1166 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1166, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13460 {
// PORT: SOURCE P76.agc:72
//		CAF	V06N84 +1	# FLASH VERB 06 NOUN 33, DISPLAY LAST TIG,
// PORT: Fixed ROM slots 13460.
                if slot <> 13460 or instruction <> 13535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1247), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P76.agc:73
//		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
// PORT: Fixed ROM slots 13461.
                if slot <> 13461 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[755] to agcAotUnit755@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:74
//		CADR	GOFLASH
// PORT: Fixed ROM slots 13462.
    13462, 17020
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13463–13466.
function agcAotUnit756 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13464 {
        if slot <= 13463 {
// PORT: SOURCE P76.agc:75
//		TCF	ENDP76
// PORT: Fixed ROM slots 13463.
            if slot <> 13463 or instruction <> 5339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5339, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:76
//		TC	+2
// PORT: Fixed ROM slots 13464.
            if slot <> 13464 or instruction <> 1178 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1178, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13465 {
// PORT: SOURCE P76.agc:77
//		TC	-5
// PORT: Fixed ROM slots 13465.
            if slot <> 13465 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:78
//		TC	INTPRET		# RETURN TO INTERPRETIVE CODE
// PORT: Fixed ROM slots 13466.
            if slot <> 13466 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[756] to agcAotUnit756@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:79
//# Page 710
// PORT: SOURCE P76.agc:80
//		DLOAD			# SET D(MPAC)=TIG IN CSEC B28
// PORT: Fixed ROM slots 13467.
    13467, 65482,
// PORT: SOURCE P76.agc:81
//			TIG
// PORT: Fixed ROM slots 13468.
    13468, 3652,
// PORT: SOURCE P76.agc:82
//		STCALL	TDEC1		# SET TDEC1=TIG FOR ORBITAL INTEGRATION
// PORT: Fixed ROM slots 13469.
    13469, 28738,
// PORT: SOURCE P76.agc:83
//			OTHPREC
// PORT: Fixed ROM slots 13470.
    13470, 23622,
// PORT: SOURCE P76.agc:84
//COMPMAT		VLOAD	UNIT
// PORT: Fixed ROM slots 13471.
    13471, 44794,
// PORT: SOURCE P76.agc:85
//			RATT
// PORT: Fixed ROM slots 13472.
    13472, 2,
// PORT: SOURCE P76.agc:86
//		VCOMP			# U(-R)
// PORT: Fixed ROM slots 13473.
    13473, 65404,
// PORT: SOURCE P76.agc:87
//		STORE	24D		# U(-R) TO 24D
// PORT: Fixed ROM slots 13474.
    13474, 50,
// PORT: SOURCE P76.agc:88
//		VXV	UNIT		# U(-R) XV = U(VXR)
// PORT: Fixed ROM slots 13475.
    13475, 44602,
// PORT: SOURCE P76.agc:89
//			VATT
// PORT: Fixed ROM slots 13476.
    13476, 14,
// PORT: SOURCE P76.agc:90
//		STORE	18D
// PORT: Fixed ROM slots 13477.
    13477, 38,
// PORT: SOURCE P76.agc:91
//		VXV	UNIT		# U(VXR)XU(-R) = U((RXV)XR)
// PORT: Fixed ROM slots 13478.
    13478, 44602,
// PORT: SOURCE P76.agc:92
//			24D
// PORT: Fixed ROM slots 13479.
    13479, 50,
// PORT: SOURCE P76.agc:93
//		STOVL	12D
// PORT: Fixed ROM slots 13480.
    13480, 20506,
// PORT: SOURCE P76.agc:94
//			DELVOV
// PORT: Fixed ROM slots 13481.
    13481, 2342,
// PORT: SOURCE P76.agc:95
//		VXM	VSL1		# V(MPAC)=DELTA V IN REFCOSYS
// PORT: Fixed ROM slots 13482.
    13482, 64138,
// PORT: SOURCE P76.agc:96
//			12D
// PORT: Fixed ROM slots 13483.
    13483, 26,
// PORT: SOURCE P76.agc:97
//		VAD
// PORT: Fixed ROM slots 13484.
    13484, 65370,
// PORT: SOURCE P76.agc:98
//			VATT
// PORT: Fixed ROM slots 13485.
    13485, 14,
// PORT: SOURCE P76.agc:99
//		STORE	6		# V(PD6)=VATT + DELTA V
// PORT: Fixed ROM slots 13486.
    13486, 14,
// PORT: SOURCE P76.agc:100
//		CALL			# PRESENT WOULD-BE USER OF ORBITAL
// PORT: Fixed ROM slots 13487.
    13487, 65320,
// PORT: SOURCE P76.agc:101
//			INTSTALL	# INTEG FROM INTERFERING WITH UPDATING
// PORT: Fixed ROM slots 13488.
    13488, 24088,
// PORT: SOURCE P76.agc:102
//		CALL
// PORT: Fixed ROM slots 13489.
    13489, 65320,
// PORT: SOURCE P76.agc:103
//			P76SUB1
// PORT: Fixed ROM slots 13490.
    13490, 22976,
// PORT: SOURCE P76.agc:104
//		VLOAD	VSR*
// PORT: Fixed ROM slots 13491.
    13491, 45050,
// PORT: SOURCE P76.agc:105
//			6
// PORT: Fixed ROM slots 13492.
    13492, 14,
// PORT: SOURCE P76.agc:106
//			0,2
// PORT: Fixed ROM slots 13493.
    13493, 48380,
// PORT: SOURCE P76.agc:107
//		STOVL	VCV
// PORT: Fixed ROM slots 13494.
    13494, 22214,
// PORT: SOURCE P76.agc:108
//			RATT
// PORT: Fixed ROM slots 13495.
    13495, 2,
// PORT: SOURCE P76.agc:109
//		VSR*
// PORT: Fixed ROM slots 13496.
    13496, 65374,
// PORT: SOURCE P76.agc:110
//			0,2
// PORT: Fixed ROM slots 13497.
    13497, 48380,
// PORT: SOURCE P76.agc:111
//		STODL	RCV
// PORT: Fixed ROM slots 13498.
    13498, 14010,
// PORT: SOURCE P76.agc:112
//			TIG
// PORT: Fixed ROM slots 13499.
    13499, 3652,
// PORT: SOURCE P76.agc:113
//		STORE	TET
// PORT: Fixed ROM slots 13500.
    13500, 1694,
// PORT: SOURCE P76.agc:114
//		CLEAR	DLOAD
// PORT: Fixed ROM slots 13501.
    13501, 58648,
// PORT: SOURCE P76.agc:115
//			INTYPFLG
// PORT: Fixed ROM slots 13502.
    13502, 1910,
// PORT: SOURCE P76.agc:116
//			TETTHIS
// PORT: Fixed ROM slots 13503.
    13503, 1862,
// PORT: SOURCE P76.agc:117
//INTOTHIS	STCALL	TDEC1
// PORT: Fixed ROM slots 13504.
    13504, 28738,
// PORT: SOURCE P76.agc:118
//			INTEGRVS
// PORT: Fixed ROM slots 13505.
    13505, 23694,
// PORT: SOURCE P76.agc:119
//		CALL
// PORT: Fixed ROM slots 13506.
    13506, 65320,
// PORT: SOURCE P76.agc:120
//			INTSTALL
// PORT: Fixed ROM slots 13507.
    13507, 24088,
// PORT: SOURCE P76.agc:121
//		VLOAD
// PORT: Fixed ROM slots 13508.
    13508, 65530,
// PORT: SOURCE P76.agc:122
//			RATT1
// PORT: Fixed ROM slots 13509.
    13509, 30,
// PORT: SOURCE P76.agc:123
//		STORE	RRECT
// PORT: Fixed ROM slots 13510.
    13510, 1670,
// PORT: SOURCE P76.agc:124
//		STODL	RCV
// PORT: Fixed ROM slots 13511.
    13511, 14010,
// PORT: SOURCE P76.agc:125
//			TAT
// PORT: Fixed ROM slots 13512.
    13512, 26,
// PORT: SOURCE P76.agc:126
//		STOVL	TET
// PORT: Fixed ROM slots 13513.
    13513, 22174,
// PORT: SOURCE P76.agc:127
//			VATT1
// PORT: Fixed ROM slots 13514.
    13514, 42,
// PORT: SOURCE P76.agc:128
//		CALL
// PORT: Fixed ROM slots 13515.
    13515, 65320,
// PORT: SOURCE P76.agc:129
//			MINIRECT
// PORT: Fixed ROM slots 13516.
    13516, 20058,
// PORT: SOURCE P76.agc:130
//# Page 711
// PORT: SOURCE P76.agc:131
//		EXIT
// PORT: Fixed ROM slots 13517.
    13517, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13518–13518.
function agcAotUnit757 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:132
//		TC	PHASCHNG
// PORT: Fixed ROM slots 13518.
    if slot <> 13518 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[757] to agcAotUnit757@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:133
//		OCT	04024
// PORT: Fixed ROM slots 13519.
    13519, 4136
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13520–13520.
function agcAotUnit758 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:134
//
// PORT: SOURCE P76.agc:135
//		TC	UPFLAG
// PORT: Fixed ROM slots 13520.
    if slot <> 13520 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[758] to agcAotUnit758@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:136
//		ADRES	REINTFLG
// PORT: Fixed ROM slots 13521.
    13521, 316
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13522–13522.
function agcAotUnit759 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:137
//
// PORT: SOURCE P76.agc:138
//		TC	INTPRET
// PORT: Fixed ROM slots 13522.
    if slot <> 13522 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[759] to agcAotUnit759@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:139
//		CALL
// PORT: Fixed ROM slots 13523.
    13523, 65320,
// PORT: SOURCE P76.agc:140
//			ATOPOTH
// PORT: Fixed ROM slots 13524.
    13524, 23394,
// PORT: SOURCE P76.agc:141
//		SSP	EXIT
// PORT: Fixed ROM slots 13525.
    13525, 65202,
// PORT: SOURCE P76.agc:142
//			QPRET
// PORT: Fixed ROM slots 13526.
    13526, 86,
// PORT: SOURCE P76.agc:143
//			OUT
// PORT: Fixed ROM slots 13527.
    13527, 22964
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13528–13528.
function agcAotUnit760 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P76.agc:144
//		TC	BANKCALL	# PERMIT USE OF ORBITAL INTEGRATION
// PORT: Fixed ROM slots 13528.
    if slot <> 13528 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[760] to agcAotUnit760@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:145
//		CADR	INTWAKE1
// PORT: Fixed ROM slots 13529.
    13529, 24138,
// PORT: SOURCE P76.agc:146
//OUT		EXIT
// PORT: Fixed ROM slots 13530.
    13530, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13531–13533.
function agcAotUnit761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13531 {
// PORT: SOURCE P76.agc:147
//ENDP76		CAF	ZERO
// PORT: Fixed ROM slots 13531.
        if slot <> 13531 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 13532 {
// PORT: SOURCE P76.agc:148
//		TS	MARKCTR		# CLEAR RR TRACKING MARK COUNTER
// PORT: Fixed ROM slots 13532.
            if slot <> 13532 or instruction <> 23346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23346, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P76.agc:149
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 13533.
            if slot <> 13533 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[761] to agcAotUnit761@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P76.agc:150
//
// PORT: SOURCE P76.agc:151
//V06N84		NV	0684
// PORT: Fixed ROM slots 13534.
    13534, 1704,
// PORT: SOURCE P76.agc:152
//		NV	0633
// PORT: Fixed ROM slots 13535.
    13535, 1602,
// PORT: SOURCE P76.agc:153
//P76SUB1		AXT,2	SET
// PORT: Fixed ROM slots 13536.
    13536, 36088,
// PORT: SOURCE P76.agc:154
//			2
// PORT: Fixed ROM slots 13537.
    13537, 4,
// PORT: SOURCE P76.agc:155
//			MOONFLAG	# SET MEANS MOON IS SPHERE OF INFLUENCE.
// PORT: Fixed ROM slots 13538.
    13538, 102,
// PORT: SOURCE P76.agc:156
//		BON	AXT,2
// PORT: Fixed ROM slots 13539.
    13539, 64536,
// PORT: SOURCE P76.agc:157
//			CMOONFLG	# SET MEANS PERM CM STATE IN LUNAR SPHERE.
// PORT: Fixed ROM slots 13540.
    13540, 4486,
// PORT: SOURCE P76.agc:158
//			QPRET
// PORT: Fixed ROM slots 13541.
    13541, 84,
// PORT: SOURCE P76.agc:159
//			0
// PORT: Fixed ROM slots 13542.
    13542, 0,
// PORT: SOURCE P76.agc:160
//		CLEAR	RVQ
// PORT: Fixed ROM slots 13543.
    13543, 36376,
// PORT: SOURCE P76.agc:161
//			MOONFLAG
// PORT: Fixed ROM slots 13544.
    13544, 358
)).

