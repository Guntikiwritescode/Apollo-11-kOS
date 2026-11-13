// P76.agc
// bank 13, slots 13447-13447
function agcAotUnit752 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:1
//# Copyright:	Public domain.
// P76.agc:2
//# Filename:	P76.agc
// P76.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P76.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// P76.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P76.agc:6
//# Assembler:	yaYUL
// P76.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// P76.agc:8
//# Website:	www.ibiblio.org/apollo.
// P76.agc:9
//# Pages:	709-711
// P76.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// P76.agc:11
//#				Luminary131 file, using page
// P76.agc:12
//#				images from Luminary 1A.
// P76.agc:13
//#
// P76.agc:14
//# This source code has been transcribed or otherwise adapted from
// P76.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P76.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// P76.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P76.agc:18
//# in storage size and consequent reduction in image quality as well) are
// P76.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P76.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// P76.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// P76.agc:22
//# actually created.
// P76.agc:23
//#
// P76.agc:24
//# Notations on the hardcopy document read, in part:
// P76.agc:25
//#
// P76.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P76.agc:27
//#	16:27 JULY 14, 1969
// P76.agc:28
//
// P76.agc:29
//# Page 709
// P76.agc:30
//# 1) PROGRAM NAME - TARGET DELTA V PROGRAM (P76).
// P76.agc:31
//# 2) FUNCTIONAL DESCRIPTION - UPON ENTRY BY BOB ACTION, P76 FLASHES DSKY REQUESTS TO BOB
// P76.agc:32
//#    TO PROVIDE VIA DSKY (1) THE DELTA V TO BE APPLIED TO THE OTHER VEHICLE STATE VECTOR AND (2) THE
// P76.agc:33
//#    TIME (TIG) AT WHICH THE OTHER VEHICLE VELOCITY WAS CHANGED BY EXECUTION OF A THRUSTING MANEUVER. THE
// P76.agc:34
//#    OTHER VEHICLE STATE VECTOR IS INTEGRATED TO TIG AND UPDATED BY THE ADDITION OF DELTA V (DELTA V HAVING
// P76.agc:35
//#    BEEN TRANSFORMED FROM LV TO REF COSYS).  USING INTEGRVS, THE PROGRAM THEN INTEGRATES THE OTHER
// P76.agc:36
//#    VEHICLE STATE VECTOR TO THE STATE VECTOR OF THIS VEHICLE, THUS INSURING THAT THE W-MATRIX AND BOTH VEHICLE
// P76.agc:37
//#    STATES CORRESPOND TO THE SAME TIME.
// P76.agc:38
//# 3) ERASABLE INIITIALIZATION REQUIRED - NONE.
// P76.agc:39
//# 4) CALLING SEQUENCES AND EXIT MODES - CALLED BY BOB REQUEST THRU DSKY V 37 E 76 E.
// P76.agc:40
//#    EXITS BY TCF ENDOFJOB.
// P76.agc:41
//# 5) OUTPUT -- OTHER VEHICLE STATE VECTOR INTEGRATED TO TIG AND INCREMENTED BY DELTA V IN REF COSYS.
// P76.agc:42
//#    THE PUSHLIST CONTAINS THE MATRIX BY WHICH THE INPUT DELTA V MUST BE POST-MULTIPLIED TO CONVERT FROM LV
// P76.agc:43
//#    TO REF COSYS.
// P76.agc:44
//# 6) DEBRIS - OTHER VEHICLE STATE VECTOR.
// P76.agc:45
//# 7) SUBROUTINES CALLED - BANKCALL, GOXDSPF, CSMPREC (OR LEMPREC), ATOPCSM (OR ATOPLEM), INTSTALL, INTWAKE, PHASCHNG
// P76.agc:46
//#    INTPRET, INTEGRVS, AND MINIRECT.
// P76.agc:47
//# 8) FLAG USE - MOONFLAG, CMOONFLG, INTYPFLG, RASFLAG, AND MARKCTR.
// P76.agc:48
//
// P76.agc:49
//		BANK	30
// P76.agc:50
//		SETLOC	P76LOC
// P76.agc:51
//		BANK
// P76.agc:52
//
// P76.agc:53
//		COUNT*	$$/P76
// P76.agc:54
//
// P76.agc:55
//		EBANK=	TIG
// P76.agc:56
//
// P76.agc:57
//P76		TC	UPFLAG
// slot 13447
    if slot <> 13447 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[752] to agcAotUnit752@.

agcAotInstallSourceRope(list(
// P76.agc:58
//		ADRES	TRACKFLG
// slot 13448
    13448, 50
)).

// bank 13, slots 13449-13449
function agcAotUnit753 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:59
//
// P76.agc:60
//		TC	INTPRET
// slot 13449
    if slot <> 13449 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[753] to agcAotUnit753@.

agcAotInstallSourceRope(list(
// P76.agc:61
//		VLOAD
// slot 13450
    13450, 65530,
// P76.agc:62
//			DELVLVC
// slot 13451
    13451, 3640,
// P76.agc:63
//		STORE	DELVOV
// slot 13452
    13452, 2342,
// P76.agc:64
//		EXIT
// slot 13453
    13453, 65532
)).

// bank 13, slots 13454-13455
function agcAotUnit754 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13454 {
// P76.agc:65
//
// P76.agc:66
//		CAF	V06N84		# FLASH LAST DELTA V,
// slot 13454
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
// P76.agc:67
//		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
// slot 13455
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
// P76.agc:68
//		CADR	GOFLASH
// slot 13456
    13456, 17020
)).

// bank 13, slots 13457-13461
function agcAotUnit755 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13458 {
        if slot <= 13457 {
// P76.agc:69
//		TCF	ENDP76
// slot 13457
            if slot <> 13457 or instruction <> 5339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5339, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P76.agc:70
//		TC	+2		# PROCEED
// slot 13458
            if slot <> 13458 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13459 {
// P76.agc:71
//		TC	-5		# STORE DATA AND REPEAT FLASHING
// slot 13459
            if slot <> 13459 or instruction <> 1166 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1166, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13460 {
// P76.agc:72
//		CAF	V06N84 +1	# FLASH VERB 06 NOUN 33, DISPLAY LAST TIG,
// slot 13460
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
// P76.agc:73
//		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
// slot 13461
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
// P76.agc:74
//		CADR	GOFLASH
// slot 13462
    13462, 17020
)).

// bank 13, slots 13463-13466
function agcAotUnit756 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13464 {
        if slot <= 13463 {
// P76.agc:75
//		TCF	ENDP76
// slot 13463
            if slot <> 13463 or instruction <> 5339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5339, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P76.agc:76
//		TC	+2
// slot 13464
            if slot <> 13464 or instruction <> 1178 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1178, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13465 {
// P76.agc:77
//		TC	-5
// slot 13465
            if slot <> 13465 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P76.agc:78
//		TC	INTPRET		# RETURN TO INTERPRETIVE CODE
// slot 13466
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
// P76.agc:79
//# Page 710
// P76.agc:80
//		DLOAD			# SET D(MPAC)=TIG IN CSEC B28
// slot 13467
    13467, 65482,
// P76.agc:81
//			TIG
// slot 13468
    13468, 3652,
// P76.agc:82
//		STCALL	TDEC1		# SET TDEC1=TIG FOR ORBITAL INTEGRATION
// slot 13469
    13469, 28738,
// P76.agc:83
//			OTHPREC
// slot 13470
    13470, 23622,
// P76.agc:84
//COMPMAT		VLOAD	UNIT
// slot 13471
    13471, 44794,
// P76.agc:85
//			RATT
// slot 13472
    13472, 2,
// P76.agc:86
//		VCOMP			# U(-R)
// slot 13473
    13473, 65404,
// P76.agc:87
//		STORE	24D		# U(-R) TO 24D
// slot 13474
    13474, 50,
// P76.agc:88
//		VXV	UNIT		# U(-R) XV = U(VXR)
// slot 13475
    13475, 44602,
// P76.agc:89
//			VATT
// slot 13476
    13476, 14,
// P76.agc:90
//		STORE	18D
// slot 13477
    13477, 38,
// P76.agc:91
//		VXV	UNIT		# U(VXR)XU(-R) = U((RXV)XR)
// slot 13478
    13478, 44602,
// P76.agc:92
//			24D
// slot 13479
    13479, 50,
// P76.agc:93
//		STOVL	12D
// slot 13480
    13480, 20506,
// P76.agc:94
//			DELVOV
// slot 13481
    13481, 2342,
// P76.agc:95
//		VXM	VSL1		# V(MPAC)=DELTA V IN REFCOSYS
// slot 13482
    13482, 64138,
// P76.agc:96
//			12D
// slot 13483
    13483, 26,
// P76.agc:97
//		VAD
// slot 13484
    13484, 65370,
// P76.agc:98
//			VATT
// slot 13485
    13485, 14,
// P76.agc:99
//		STORE	6		# V(PD6)=VATT + DELTA V
// slot 13486
    13486, 14,
// P76.agc:100
//		CALL			# PRESENT WOULD-BE USER OF ORBITAL
// slot 13487
    13487, 65320,
// P76.agc:101
//			INTSTALL	# INTEG FROM INTERFERING WITH UPDATING
// slot 13488
    13488, 24088,
// P76.agc:102
//		CALL
// slot 13489
    13489, 65320,
// P76.agc:103
//			P76SUB1
// slot 13490
    13490, 22976,
// P76.agc:104
//		VLOAD	VSR*
// slot 13491
    13491, 45050,
// P76.agc:105
//			6
// slot 13492
    13492, 14,
// P76.agc:106
//			0,2
// slot 13493
    13493, 48380,
// P76.agc:107
//		STOVL	VCV
// slot 13494
    13494, 22214,
// P76.agc:108
//			RATT
// slot 13495
    13495, 2,
// P76.agc:109
//		VSR*
// slot 13496
    13496, 65374,
// P76.agc:110
//			0,2
// slot 13497
    13497, 48380,
// P76.agc:111
//		STODL	RCV
// slot 13498
    13498, 14010,
// P76.agc:112
//			TIG
// slot 13499
    13499, 3652,
// P76.agc:113
//		STORE	TET
// slot 13500
    13500, 1694,
// P76.agc:114
//		CLEAR	DLOAD
// slot 13501
    13501, 58648,
// P76.agc:115
//			INTYPFLG
// slot 13502
    13502, 1910,
// P76.agc:116
//			TETTHIS
// slot 13503
    13503, 1862,
// P76.agc:117
//INTOTHIS	STCALL	TDEC1
// slot 13504
    13504, 28738,
// P76.agc:118
//			INTEGRVS
// slot 13505
    13505, 23694,
// P76.agc:119
//		CALL
// slot 13506
    13506, 65320,
// P76.agc:120
//			INTSTALL
// slot 13507
    13507, 24088,
// P76.agc:121
//		VLOAD
// slot 13508
    13508, 65530,
// P76.agc:122
//			RATT1
// slot 13509
    13509, 30,
// P76.agc:123
//		STORE	RRECT
// slot 13510
    13510, 1670,
// P76.agc:124
//		STODL	RCV
// slot 13511
    13511, 14010,
// P76.agc:125
//			TAT
// slot 13512
    13512, 26,
// P76.agc:126
//		STOVL	TET
// slot 13513
    13513, 22174,
// P76.agc:127
//			VATT1
// slot 13514
    13514, 42,
// P76.agc:128
//		CALL
// slot 13515
    13515, 65320,
// P76.agc:129
//			MINIRECT
// slot 13516
    13516, 20058,
// P76.agc:130
//# Page 711
// P76.agc:131
//		EXIT
// slot 13517
    13517, 65532
)).

// bank 13, slots 13518-13518
function agcAotUnit757 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:132
//		TC	PHASCHNG
// slot 13518
    if slot <> 13518 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[757] to agcAotUnit757@.

agcAotInstallSourceRope(list(
// P76.agc:133
//		OCT	04024
// slot 13519
    13519, 4136
)).

// bank 13, slots 13520-13520
function agcAotUnit758 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:134
//
// P76.agc:135
//		TC	UPFLAG
// slot 13520
    if slot <> 13520 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[758] to agcAotUnit758@.

agcAotInstallSourceRope(list(
// P76.agc:136
//		ADRES	REINTFLG
// slot 13521
    13521, 316
)).

// bank 13, slots 13522-13522
function agcAotUnit759 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:137
//
// P76.agc:138
//		TC	INTPRET
// slot 13522
    if slot <> 13522 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[759] to agcAotUnit759@.

agcAotInstallSourceRope(list(
// P76.agc:139
//		CALL
// slot 13523
    13523, 65320,
// P76.agc:140
//			ATOPOTH
// slot 13524
    13524, 23394,
// P76.agc:141
//		SSP	EXIT
// slot 13525
    13525, 65202,
// P76.agc:142
//			QPRET
// slot 13526
    13526, 86,
// P76.agc:143
//			OUT
// slot 13527
    13527, 22964
)).

// bank 13, slots 13528-13528
function agcAotUnit760 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P76.agc:144
//		TC	BANKCALL	# PERMIT USE OF ORBITAL INTEGRATION
// slot 13528
    if slot <> 13528 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[760] to agcAotUnit760@.

agcAotInstallSourceRope(list(
// P76.agc:145
//		CADR	INTWAKE1
// slot 13529
    13529, 24138,
// P76.agc:146
//OUT		EXIT
// slot 13530
    13530, 65532
)).

// bank 13, slots 13531-13533
function agcAotUnit761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13531 {
// P76.agc:147
//ENDP76		CAF	ZERO
// slot 13531
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
// P76.agc:148
//		TS	MARKCTR		# CLEAR RR TRACKING MARK COUNTER
// slot 13532
            if slot <> 13532 or instruction <> 23346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23346, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P76.agc:149
//		TCF	GOTOPOOH
// slot 13533
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
// P76.agc:150
//
// P76.agc:151
//V06N84		NV	0684
// slot 13534
    13534, 1704,
// P76.agc:152
//		NV	0633
// slot 13535
    13535, 1602,
// P76.agc:153
//P76SUB1		AXT,2	SET
// slot 13536
    13536, 36088,
// P76.agc:154
//			2
// slot 13537
    13537, 4,
// P76.agc:155
//			MOONFLAG	# SET MEANS MUN IS SPHERE OF INFLUENCE.
// slot 13538
    13538, 102,
// P76.agc:156
//		BON	AXT,2
// slot 13539
    13539, 64536,
// P76.agc:157
//			CMOONFLG	# SET MEANS PERM CM STATE IN MUN SPHERE.
// slot 13540
    13540, 4486,
// P76.agc:158
//			QPRET
// slot 13541
    13541, 84,
// P76.agc:159
//			0
// slot 13542
    13542, 0,
// P76.agc:160
//		CLEAR	RVQ
// slot 13543
    13543, 36376,
// P76.agc:161
//			MOONFLAG
// slot 13544
    13544, 358
)).

