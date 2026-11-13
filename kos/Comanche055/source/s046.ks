// PORT: Original source unit P40-P47.agc.
// PORT: Physical bank 24. Shared continuation entries, slots 22587–22587.
function agcAotUnit1284 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P40-P47.agc:2
//# Filename:	P40-P47.agc
// PORT: SOURCE P40-P47.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P40-P47.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P40-P47.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P40-P47.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P40-P47.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P40-P47.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P40-P47.agc:9
//# Pages:	684-736
// PORT: SOURCE P40-P47.agc:10
//# Mod history:	2009-05-11 RSB	Adapted from the Colossus249/ file
// PORT: SOURCE P40-P47.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE P40-P47.agc:12
//#				images.
// PORT: SOURCE P40-P47.agc:13
//#		2009-05-20 RSB	In S20.1, a DMP DDV was corrected to DMPR DDV.
// PORT: SOURCE P40-P47.agc:14
//#		2009-05-22 RSB	In BESTTRIM, TC PACTOFF corrected to
// PORT: SOURCE P40-P47.agc:15
//#				TS PACTOFF.
// PORT: SOURCE P40-P47.agc:16
//#		2009-05-23 RSB	Prior to the 2CADR at T5IDLDAP, added an
// PORT: SOURCE P40-P47.agc:17
//#				SBANK.
// PORT: SOURCE P40-P47.agc:18
//#
// PORT: SOURCE P40-P47.agc:19
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P40-P47.agc:20
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P40-P47.agc:21
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P40-P47.agc:22
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P40-P47.agc:23
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P40-P47.agc:24
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P40-P47.agc:25
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P40-P47.agc:26
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P40-P47.agc:27
//#
// PORT: SOURCE P40-P47.agc:28
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P40-P47.agc:29
//#
// PORT: SOURCE P40-P47.agc:30
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P40-P47.agc:31
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P40-P47.agc:32
//#
// PORT: SOURCE P40-P47.agc:33
//#	This AGC program shall also be referred to as
// PORT: SOURCE P40-P47.agc:34
//#			Colossus 2A
// PORT: SOURCE P40-P47.agc:35
//
// PORT: SOURCE P40-P47.agc:36
//# Page 684
// PORT: SOURCE P40-P47.agc:37
//# PROGRAM DESCRIPTION ** P40CSM **
// PORT: SOURCE P40-P47.agc:38
//
// PORT: SOURCE P40-P47.agc:39
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:40
//		BANK	31
// PORT: SOURCE P40-P47.agc:41
//		SETLOC	P40S
// PORT: SOURCE P40-P47.agc:42
//		BANK
// PORT: SOURCE P40-P47.agc:43
//
// PORT: SOURCE P40-P47.agc:44
//		COUNT	24/P40
// PORT: SOURCE P40-P47.agc:45
//
// PORT: SOURCE P40-P47.agc:46
//P40CSM		TC	DOWNFLAG
// PORT: Fixed ROM slots 22587.
    if slot <> 22587 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1284] to agcAotUnit1284@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:47
//		ADRES	ENG2FLAG
// PORT: Fixed ROM slots 22588.
    22588, 38
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22589–22589.
function agcAotUnit1285 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:48
//
// PORT: SOURCE P40-P47.agc:49
//		TC	INTPRET
// PORT: Fixed ROM slots 22589.
    if slot <> 22589 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1285] to agcAotUnit1285@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:50
//		SLOAD	BOFF
// PORT: Fixed ROM slots 22590.
    22590, 36026,
// PORT: SOURCE P40-P47.agc:51
//			ECSTEER		# IS THIS AN EXTERNAL DELTA V BURN
// PORT: Fixed ROM slots 22591.
    22591, 3626,
// PORT: SOURCE P40-P47.agc:52
//			XDELVFLG
// PORT: Fixed ROM slots 22592.
    22592, 1486,
// PORT: SOURCE P40-P47.agc:53
//			P40S/C		# NO	CSTEER = ECSTEER
// PORT: Fixed ROM slots 22593.
    22593, 41096,
// PORT: SOURCE P40-P47.agc:54
//		DLOAD			# YES	CSTEER = ZERO
// PORT: Fixed ROM slots 22594.
    22594, 65482,
// PORT: SOURCE P40-P47.agc:55
//			HI6ZEROS
// PORT: Fixed ROM slots 22595.
    22595, 13754,
// PORT: SOURCE P40-P47.agc:56
//P40S/C		STODL	CSTEER
// PORT: Fixed ROM slots 22596.
    22596, 16262,
// PORT: SOURCE P40-P47.agc:57
//			FENG		# SET UP THRUST FOR P40 20,000 LBS
// PORT: Fixed ROM slots 22597.
    22597, 8722,
// PORT: SOURCE P40-P47.agc:58
//P40S/F		STODL	F		# P41 ENTERS HERE
// PORT: Fixed ROM slots 22598.
    22598, 16302,
// PORT: SOURCE P40-P47.agc:59
//			TIG		# ORIGINAL TIG MAY BE SLIPPED BY P40S/SV
// PORT: Fixed ROM slots 22599.
    22599, 3606,
// PORT: SOURCE P40-P47.agc:60
//		STORE	NOMTIG		# SET ORIGINAL TIME OF IGNITION FOR S40.9
// PORT: Fixed ROM slots 22600.
    22600, 3664,
// PORT: SOURCE P40-P47.agc:61
//
// PORT: SOURCE P40-P47.agc:62
//		EXIT
// PORT: Fixed ROM slots 22601.
    22601, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22602–22602.
function agcAotUnit1286 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:63
//		TC	BANKCALL
// PORT: Fixed ROM slots 22602.
    if slot <> 22602 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1286] to agcAotUnit1286@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:64
//		CADR	R02BOTH		# IMU STATUS CHECK
// PORT: Fixed ROM slots 22603.
    22603, 16214
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22604–22604.
function agcAotUnit1287 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:65
//
// PORT: SOURCE P40-P47.agc:66
//P40PVA		TC	INTPRET
// PORT: Fixed ROM slots 22604.
    if slot <> 22604 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1287] to agcAotUnit1287@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:67
//		CALL
// PORT: Fixed ROM slots 22605.
    22605, 65320,
// PORT: SOURCE P40-P47.agc:68
//			S40.1		# COMPUTE VGTIG,UT
// PORT: Fixed ROM slots 22606.
    22606, 28704,
// PORT: SOURCE P40-P47.agc:69
//		CALL
// PORT: Fixed ROM slots 22607.
    22607, 65320,
// PORT: SOURCE P40-P47.agc:70
//			S40.2,3		# COMPUTE PREFERRED ATTITUDE
// PORT: Fixed ROM slots 22608.
    22608, 42744,
// PORT: SOURCE P40-P47.agc:71
//		SET	EXIT
// PORT: Fixed ROM slots 22609.
    22609, 65048,
// PORT: SOURCE P40-P47.agc:72
//			PFRATFLG
// PORT: Fixed ROM slots 22610.
    22610, 1142
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22611–22613.
function agcAotUnit1288 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22611 {
// PORT: SOURCE P40-P47.agc:73
//P40SXTY		TCR	SETMINDB -1	# NARROW DEADBAND FOR MANEUVER (EBANK6)
// PORT: Fixed ROM slots 22611.
        if slot <> 22611 or instruction <> 1219 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1219, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22612 {
// PORT: SOURCE P40-P47.agc:74
//		RELINT
// PORT: Fixed ROM slots 22612.
            if slot <> 22612 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:75
//		TC	BANKCALL
// PORT: Fixed ROM slots 22613.
            if slot <> 22613 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1288] to agcAotUnit1288@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:76
//		CADR	R60CSM		# ATTITUDE MANEUVER
// PORT: Fixed ROM slots 22614.
    22614, 47104
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22615–22617.
function agcAotUnit1289 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22615 {
// PORT: SOURCE P40-P47.agc:77
//		CS	ONE		# FOR UPDATEVG
// PORT: Fixed ROM slots 22615.
        if slot <> 22615 or instruction <> 18959 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22616 {
// PORT: SOURCE P40-P47.agc:78
//		TS	NBRCYCLS
// PORT: Fixed ROM slots 22616.
            if slot <> 22616 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:79
//		TC	UPFLAG
// PORT: Fixed ROM slots 22617.
            if slot <> 22617 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1289] to agcAotUnit1289@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:80
//		ADRES	TIMRFLAG	# ALLOW CLOCKTASK
// PORT: Fixed ROM slots 22618.
    22618, 218
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22619–22623.
function agcAotUnit1290 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22620 {
        if slot <= 22619 {
// PORT: SOURCE P40-P47.agc:81
//
// PORT: SOURCE P40-P47.agc:82
//		TC	P41/P40
// PORT: Fixed ROM slots 22619.
            if slot <> 22619 or instruction <> 1238 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1238, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:83
//		TC	P41/DSP		# P41
// PORT: Fixed ROM slots 22620.
            if slot <> 22620 or instruction <> 1251 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1251, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22621 {
// PORT: SOURCE P40-P47.agc:84
//
// PORT: SOURCE P40-P47.agc:85
//P40TTOG		CAF	V06N40		# INITIALIZE FOR CLOCKTASK WHICH IS CALLED
// PORT: Fixed ROM slots 22621.
            if slot <> 22621 or instruction <> 13589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22622 {
// PORT: SOURCE P40-P47.agc:86
//# Page 685
// PORT: SOURCE P40-P47.agc:87
//		TS	NVWORD1		# BELOW
// PORT: Fixed ROM slots 22622.
                if slot <> 22622 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:88
//
// PORT: SOURCE P40-P47.agc:89
//		TC	INTPRET
// PORT: Fixed ROM slots 22623.
                if slot <> 22623 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1290] to agcAotUnit1290@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:90
//		VLOAD	ABVAL		# FOR R2
// PORT: Fixed ROM slots 22624.
    22624, 42746,
// PORT: SOURCE P40-P47.agc:91
//			VGTIG
// PORT: Fixed ROM slots 22625.
    22625, 4002,
// PORT: SOURCE P40-P47.agc:92
//		STODL	VGDISP
// PORT: Fixed ROM slots 22626.
    22626, 16374,
// PORT: SOURCE P40-P47.agc:93
//			HI6ZEROS
// PORT: Fixed ROM slots 22627.
    22627, 13754,
// PORT: SOURCE P40-P47.agc:94
//		STORE	DVTOTAL
// PORT: Fixed ROM slots 22628.
    22628, 3628,
// PORT: SOURCE P40-P47.agc:95
//		EXIT
// PORT: Fixed ROM slots 22629.
    22629, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22630–22634.
function agcAotUnit1291 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22631 {
        if slot <= 22630 {
// PORT: SOURCE P40-P47.agc:96
//
// PORT: SOURCE P40-P47.agc:97
//		EXTEND
// PORT: Fixed ROM slots 22630.
            if slot <> 22630 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:98
//		DCA	STEERADS	# SET FOR UPDATEVG AND TEST FOR STEERING
// PORT: Fixed ROM slots 22631.
            if slot <> 22631 or instruction <> 13873 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1585, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22632 {
// PORT: SOURCE P40-P47.agc:99
//		DXCH	AVEGEXIT	# AFTER AVERAGE G
// PORT: Fixed ROM slots 22632.
            if slot <> 22632 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22633 {
// PORT: SOURCE P40-P47.agc:100
//
// PORT: SOURCE P40-P47.agc:101
//P40GMB		CAF	P40CKLS2	# (4.1 PROTECTION)
// PORT: Fixed ROM slots 22633.
                if slot <> 22633 or instruction <> 13584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1296), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:102
//		TC	BANKCALL
// PORT: Fixed ROM slots 22634.
                if slot <> 22634 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1291] to agcAotUnit1291@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:103
//		CADR	GOPERF1
// PORT: Fixed ROM slots 22635.
    22635, 17482
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22636–22643.
function agcAotUnit1292 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22639 {
        if slot <= 22637 {
            if slot <= 22636 {
// PORT: SOURCE P40-P47.agc:104
//		TCF	POST41		# V34
// PORT: Fixed ROM slots 22636.
                if slot <> 22636 or instruction <> 5309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5309, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:105
//		TCF	TST,TRIM	# V33
// PORT: Fixed ROM slots 22637.
                if slot <> 22637 or instruction <> 5405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5405, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22638 {
// PORT: SOURCE P40-P47.agc:106
//TRIMONLY	CS	BIT1		# SET MRKRTEMP FOR GIMBAL TRIM (-1)
// PORT: Fixed ROM slots 22638.
                if slot <> 22638 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:107
//	+1	TS	MRKRTMP		# ENTRY FROM TST,TRIM
// PORT: Fixed ROM slots 22639.
                if slot <> 22639 or instruction <> 23333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23333, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22641 {
            if slot <= 22640 {
// PORT: SOURCE P40-P47.agc:108
//
// PORT: SOURCE P40-P47.agc:109
//		CAF	ZERO		# SET CNTR	+0 FOR RESTART LOGIC IN S40.6
// PORT: Fixed ROM slots 22640.
                if slot <> 22640 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:110
//		TS	CNTR		#	+0 SAYS NORMAL ENTRY
// PORT: Fixed ROM slots 22641.
                if slot <> 22641 or instruction <> 23335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22642 {
// PORT: SOURCE P40-P47.agc:111
//					#	+1 (PRE40.6) SAYS RESTART ENTRY
// PORT: SOURCE P40-P47.agc:112
//
// PORT: SOURCE P40-P47.agc:113
//		CAF	ONE
// PORT: Fixed ROM slots 22642.
                if slot <> 22642 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:114
//		TC	WAITLIST
// PORT: Fixed ROM slots 22643.
                if slot <> 22643 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1292] to agcAotUnit1292@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:115
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:116
//		2CADR	S40.6
// PORT: Fixed ROM slots 22644 22645.
    22644, 2388, 22645, 32876
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22646–22650.
function agcAotUnit1293 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22647 {
        if slot <= 22646 {
// PORT: SOURCE P40-P47.agc:117
//
// PORT: SOURCE P40-P47.agc:118
//		CCS	MRKRTMP		# TEST TO FIND TIME TO WAIT FOR GIMBAL TEST
// PORT: Fixed ROM slots 22646.
            if slot <> 22646 or instruction <> 4901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 805).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:119
//		CAF	18SEC		# PLUS, DELAY FOR 18 SECONDS
// PORT: Fixed ROM slots 22647.
            if slot <> 22647 or instruction <> 13583 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1295), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22648 {
// PORT: SOURCE P40-P47.agc:120
//		TCF	+2		# HOLE
// PORT: Fixed ROM slots 22648.
            if slot <> 22648 or instruction <> 5242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5242, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22649 {
// PORT: SOURCE P40-P47.agc:121
//		CAF	5SEC		# DELAY FOR TRIM ONLY TASK
// PORT: Fixed ROM slots 22649.
                if slot <> 22649 or instruction <> 13876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1588), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:122
//		TC	BANKCALL
// PORT: Fixed ROM slots 22650.
                if slot <> 22650 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1293] to agcAotUnit1293@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:123
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 22651.
    22651, 1972
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22652–22652.
function agcAotUnit1294 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:124
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 22652.
    if slot <> 22652 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1294] to agcAotUnit1294@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:125
//		OCT	40026		# 6.2 = PRE40.6(-0CS), CLOKTASK(100CS)
// PORT: Fixed ROM slots 22653.
    22653, 32812,
// PORT: SOURCE P40-P47.agc:126
//		OCT	00234		# 4.23 = P40S/SV (PRIO12)
// PORT: Fixed ROM slots 22654.
    22654, 312
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22655–22656.
function agcAotUnit1295 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22655 {
// PORT: SOURCE P40-P47.agc:127
//P40S/RS		CAF	ONE
// PORT: Fixed ROM slots 22655.
        if slot <> 22655 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:128
//		TC	WAITLIST	# P41/SDP
// PORT: Fixed ROM slots 22656.
        if slot <> 22656 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1295] to agcAotUnit1295@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:129
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:130
//		2CADR	CLOKTASK
// PORT: Fixed ROM slots 22657 22658.
    22657, 3424, 22658, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22659–22661.
function agcAotUnit1296 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22659 {
// PORT: SOURCE P40-P47.agc:131
//
// PORT: SOURCE P40-P47.agc:132
//		RELINT
// PORT: Fixed ROM slots 22659.
        if slot <> 22659 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22660 {
// PORT: SOURCE P40-P47.agc:133
//
// PORT: SOURCE P40-P47.agc:134
//P40S/SV		TCR	E7SETTER	# JOB, 4.23 PRETECTS, PREO12
// PORT: Fixed ROM slots 22660.
            if slot <> 22660 or instruction <> 1782 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1782, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:135
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:136
//# Page 686
// PORT: SOURCE P40-P47.agc:137
//		TC	INTPRET
// PORT: Fixed ROM slots 22661.
            if slot <> 22661 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1296] to agcAotUnit1296@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:138
//		DLOAD	DSU
// PORT: Fixed ROM slots 22662.
    22662, 38346,
// PORT: SOURCE P40-P47.agc:139
//			TIG
// PORT: Fixed ROM slots 22663.
    22663, 3606,
// PORT: SOURCE P40-P47.agc:140
//			SEC29.96
// PORT: Fixed ROM slots 22664.
    22664, 8732,
// PORT: SOURCE P40-P47.agc:141
//		STORE	TDEC1
// PORT: Fixed ROM slots 22665.
    22665, 66,
// PORT: SOURCE P40-P47.agc:142
//
// PORT: SOURCE P40-P47.agc:143
//		CALRB			# RETURN IN BASIC
// PORT: Fixed ROM slots 22666.
    22666, 65320,
// PORT: SOURCE P40-P47.agc:144
//			MIDTOAV1
// PORT: Fixed ROM slots 22667.
    22667, 24278
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22668–22678.
function agcAotUnit1297 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22672 {
        if slot <= 22669 {
            if slot <= 22668 {
// PORT: SOURCE P40-P47.agc:145
//		TCF	+2
// PORT: Fixed ROM slots 22668.
                if slot <> 22668 or instruction <> 5262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5262, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:146
//		TC	P40SNEWM	# INTEGRATION TIME GREATER THAN ALLOWED
// PORT: Fixed ROM slots 22669.
                if slot <> 22669 or instruction <> 1183 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1183, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22670 {
// PORT: SOURCE P40-P47.agc:147
//P40SET		EXTEND
// PORT: Fixed ROM slots 22670.
                if slot <> 22670 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22671 {
// PORT: SOURCE P40-P47.agc:148
//		DCA	MPAC		# DELTA TIME TO PREREAD (INT.INIT.)
// PORT: Fixed ROM slots 22671.
                    if slot <> 22671 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:149
//		DXCH	P40TMP
// PORT: Fixed ROM slots 22672.
                    if slot <> 22672 or instruction <> 22459 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 955, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22675 {
            if slot <= 22673 {
// PORT: SOURCE P40-P47.agc:150
//		EXTEND
// PORT: Fixed ROM slots 22673.
                if slot <> 22673 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22674 {
// PORT: SOURCE P40-P47.agc:151
//		DCS	5SECDP		# FOR TIGBLNK
// PORT: Fixed ROM slots 22674.
                    if slot <> 22674 or instruction <> 17972 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 1588, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:152
//		DAS	P40TMP
// PORT: Fixed ROM slots 22675.
                    if slot <> 22675 or instruction <> 9147 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 955) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22676 {
// PORT: SOURCE P40-P47.agc:153
//		EXTEND
// PORT: Fixed ROM slots 22676.
                if slot <> 22676 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22677 {
// PORT: SOURCE P40-P47.agc:154
//		DCA	P40TMP
// PORT: Fixed ROM slots 22677.
                    if slot <> 22677 or instruction <> 13243 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 955, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:155
//		TC	LONGCALL
// PORT: Fixed ROM slots 22678.
                    if slot <> 22678 or instruction <> 2786 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2786, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1297] to agcAotUnit1297@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:156
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:157
//		2CADR	TIGBLNK
// PORT: Fixed ROM slots 22679 22680.
    22679, 2622, 22680, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22681–22681.
function agcAotUnit1298 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:158
//
// PORT: SOURCE P40-P47.agc:159
//		TC	PHASCHNG
// PORT: Fixed ROM slots 22681.
    if slot <> 22681 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1298] to agcAotUnit1298@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:160
//		OCT	20214		# 4.21 = TIGBLNK (P40TMP CS)
// PORT: Fixed ROM slots 22682.
    22682, 16664
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22683–22684.
function agcAotUnit1299 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22683 {
// PORT: SOURCE P40-P47.agc:161
//
// PORT: SOURCE P40-P47.agc:162
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 22683.
        if slot <> 22683 or instruction <> 6799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:163
//P40BLNKR	TC	BANKCALL
// PORT: Fixed ROM slots 22684.
        if slot <> 22684 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1299] to agcAotUnit1299@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:164
//		CADR	CLEANDSP	# REMOVE RESIDUE
// PORT: Fixed ROM slots 22685.
    22685, 17286
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22686–22695.
function agcAotUnit1300 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22690 {
        if slot <= 22687 {
            if slot <= 22686 {
// PORT: SOURCE P40-P47.agc:165
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 22686.
                if slot <> 22686 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:166
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:167
//P40SNEWM	EXTEND
// PORT: Fixed ROM slots 22687.
                if slot <> 22687 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22688 {
// PORT: SOURCE P40-P47.agc:168
//		DCA	PIPTIME1
// PORT: Fixed ROM slots 22688.
                if slot <> 22688 or instruction <> 12966 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 678, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22689 {
// PORT: SOURCE P40-P47.agc:169
//		DXCH	TIG		# SET NEW TIG FOR 06 40
// PORT: Fixed ROM slots 22689.
                    if slot <> 22689 or instruction <> 22283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:170
//		EXTEND
// PORT: Fixed ROM slots 22690.
                    if slot <> 22690 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22692 {
            if slot <= 22691 {
// PORT: SOURCE P40-P47.agc:171
//		DCA	SEC29.96
// PORT: Fixed ROM slots 22691.
                if slot <> 22691 or instruction <> 13582 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1294, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:172
//		DAS	TIG
// PORT: Fixed ROM slots 22692.
                if slot <> 22692 or instruction <> 8971 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 779) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22693 {
// PORT: SOURCE P40-P47.agc:173
//		TCF	P40SET		# FOR LONGCALL OF TIG-30 (OR -35)
// PORT: Fixed ROM slots 22693.
                if slot <> 22693 or instruction <> 5262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5262, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22694 {
// PORT: SOURCE P40-P47.agc:174
//
// PORT: SOURCE P40-P47.agc:175
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:176
//POSTBURN	CAF	V16N40
// PORT: Fixed ROM slots 22694.
                    if slot <> 22694 or instruction <> 13590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1302), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:177
//		TC	BANKCALL
// PORT: Fixed ROM slots 22695.
                    if slot <> 22695 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1300] to agcAotUnit1300@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:178
//		CADR	REFLASH
// PORT: Fixed ROM slots 22696.
    22696, 17288
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22697–22704.
function agcAotUnit1301 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22700 {
        if slot <= 22698 {
            if slot <= 22697 {
// PORT: SOURCE P40-P47.agc:179
//		TCF	POST41		# V34 GO FINISH
// PORT: Fixed ROM slots 22697.
                if slot <> 22697 or instruction <> 5309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5309, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:180
//		TCF	P40RCS		# PROCEED
// PORT: Fixed ROM slots 22698.
                if slot <> 22698 or instruction <> 5292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5292, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22699 {
// PORT: SOURCE P40-P47.agc:181
//		TCF	POSTBURN	# RECYCLE
// PORT: Fixed ROM slots 22699.
                if slot <> 22699 or instruction <> 5286 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5286, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:182
//P40RCS		EXTEND			# V99N40 ENTERS HERE ON A P40 BYPASS SPS
// PORT: Fixed ROM slots 22700.
                if slot <> 22700 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22702 {
            if slot <= 22701 {
// PORT: SOURCE P40-P47.agc:183
//		DCA	ACADN85
// PORT: Fixed ROM slots 22701.
                if slot <> 22701 or instruction <> 13618 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1330, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:184
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 22702.
                if slot <> 22702 or instruction <> 22163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22703 {
// PORT: SOURCE P40-P47.agc:185
//		CAF	2SECS		# WAIT FOR CALCN85 VIA AVEGEXIT
// PORT: Fixed ROM slots 22703.
                if slot <> 22703 or instruction <> 14882 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2594), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:186
//		TC	BANKCALL
// PORT: Fixed ROM slots 22704.
                if slot <> 22704 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1301] to agcAotUnit1301@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:187
//# Page 687
// PORT: SOURCE P40-P47.agc:188
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 22705.
    22705, 1972
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22706–22708.
function agcAotUnit1302 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22706 {
// PORT: SOURCE P40-P47.agc:189
//
// PORT: SOURCE P40-P47.agc:190
//P40MINDB	TCR	SETMINDB -1
// PORT: Fixed ROM slots 22706.
        if slot <> 22706 or instruction <> 1219 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1219, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22707 {
// PORT: SOURCE P40-P47.agc:191
//		RELINT
// PORT: Fixed ROM slots 22707.
            if slot <> 22707 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:192
//TIGNOW		TC	PHASCHNG
// PORT: Fixed ROM slots 22708.
            if slot <> 22708 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1302] to agcAotUnit1302@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:193
//		OCT	05024		# TYPE C GROUP 4 BELOW FOR NOUN 85
// PORT: Fixed ROM slots 22709.
    22709, 5160,
// PORT: SOURCE P40-P47.agc:194
//		OCT	20000		# PRIO 20
// PORT: Fixed ROM slots 22710.
    22710, 16384
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22711–22712.
function agcAotUnit1303 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22711 {
// PORT: SOURCE P40-P47.agc:195
//		CAF	V16N85B
// PORT: Fixed ROM slots 22711.
        if slot <> 22711 or instruction <> 13588 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1300), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:196
//		TC	BANKCALL
// PORT: Fixed ROM slots 22712.
        if slot <> 22712 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1303] to agcAotUnit1303@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:197
//		CADR	REFLASH
// PORT: Fixed ROM slots 22713.
    22713, 17288
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22714–22720.
function agcAotUnit1304 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22716 {
        if slot <= 22714 {
// PORT: SOURCE P40-P47.agc:198
//		TCF	POST41		# FINISH P40/P41
// PORT: Fixed ROM slots 22714.
            if slot <> 22714 or instruction <> 5309 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5309, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22715 {
// PORT: SOURCE P40-P47.agc:199
//		TCF	POST41		# V03 PROCEED WITH REST OF THE CLEAN-UP
// PORT: Fixed ROM slots 22715.
                if slot <> 22715 or instruction <> 5309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5309, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:200
//		TCF	TIGNOW		# V32 NOT GSOP RESPONSE BUT REDISPLAY N85
// PORT: Fixed ROM slots 22716.
                if slot <> 22716 or instruction <> 5300 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5300, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22718 {
            if slot <= 22717 {
// PORT: SOURCE P40-P47.agc:201
//
// PORT: SOURCE P40-P47.agc:202
//POST41		EXTEND
// PORT: Fixed ROM slots 22717.
                if slot <> 22717 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:203
//		DCA	SERVCADR
// PORT: Fixed ROM slots 22718.
                if slot <> 22718 or instruction <> 13616 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1328, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22719 {
// PORT: SOURCE P40-P47.agc:204
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 22719.
                if slot <> 22719 or instruction <> 22163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:205
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 22720.
                if slot <> 22720 or instruction <> 6214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1304] to agcAotUnit1304@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:206
//
// PORT: SOURCE P40-P47.agc:207
//MINDB		DEC	46
// PORT: Fixed ROM slots 22721.
    22721, 92,
// PORT: SOURCE P40-P47.agc:208
//MAXDB		DEC	455
// PORT: Fixed ROM slots 22722.
    22722, 910
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22723–22741.
function agcAotUnit1305 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22731 {
        if slot <= 22726 {
            if slot <= 22724 {
                if slot <= 22723 {
// PORT: SOURCE P40-P47.agc:209
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:210
//	-1	INHINT
// PORT: Fixed ROM slots 22723.
                    if slot <> 22723 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:211
//SETMINDB	CA	CDUX		# ROUTINE FOR SETTING
// PORT: Fixed ROM slots 22724.
                    if slot <> 22724 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22725 {
// PORT: SOURCE P40-P47.agc:212
//		TS	THETADX		# THE MINIMUM DEADBAND
// PORT: Fixed ROM slots 22725.
                    if slot <> 22725 or instruction <> 23418 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23418, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:213
//		EXTEND			# IN AUTOPILOT
// PORT: Fixed ROM slots 22726.
                    if slot <> 22726 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22728 {
                if slot <= 22727 {
// PORT: SOURCE P40-P47.agc:214
//		DCA	CDUY
// PORT: Fixed ROM slots 22727.
                    if slot <> 22727 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 28, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:215
//		DXCH	THETADY
// PORT: Fixed ROM slots 22728.
                    if slot <> 22728 or instruction <> 22396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 892, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22729 {
// PORT: SOURCE P40-P47.agc:216
//		CA	MINDB		# SHOULD BE CALLED UNDER
// PORT: Fixed ROM slots 22729.
                    if slot <> 22729 or instruction <> 13505 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1217), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22730 {
// PORT: SOURCE P40-P47.agc:217
//		TS	ADB		# INTERRUPT INHIBITED
// PORT: Fixed ROM slots 22730.
                        if slot <> 22730 or instruction <> 23469 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23469, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:218
//		CS	BIT4		# EBANK = E6
// PORT: Fixed ROM slots 22731.
                        if slot <> 22731 or instruction <> 18956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 22736 {
            if slot <= 22733 {
                if slot <= 22732 {
// PORT: SOURCE P40-P47.agc:219
//		MASK	DAPDATR1
// PORT: Fixed ROM slots 22732.
                    if slot <> 22732 or instruction <> 29494 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:220
//		TS	DAPDATR1
// PORT: Fixed ROM slots 22733.
                    if slot <> 22733 or instruction <> 23350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23350, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22734 {
// PORT: SOURCE P40-P47.agc:221
//		TC	Q
// PORT: Fixed ROM slots 22734.
                    if slot <> 22734 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22735 {
// PORT: SOURCE P40-P47.agc:222
//
// PORT: SOURCE P40-P47.agc:223
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:224
//	-1	INHINT
// PORT: Fixed ROM slots 22735.
                        if slot <> 22735 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:225
//SETMAXDB	CA	MAXDB		# ROUTINE FOR SETTING
// PORT: Fixed ROM slots 22736.
                        if slot <> 22736 or instruction <> 13506 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1218), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22738 {
                if slot <= 22737 {
// PORT: SOURCE P40-P47.agc:226
//		TS	ADB		# THE MAXIMUM DEADBAND IN AUTOPILOT
// PORT: Fixed ROM slots 22737.
                    if slot <> 22737 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:227
//		CS	DAPDATR1
// PORT: Fixed ROM slots 22738.
                    if slot <> 22738 or instruction <> 17206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 822).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22739 {
// PORT: SOURCE P40-P47.agc:228
//		MASK	BIT4		# SHOULD BE CALLED UNDER
// PORT: Fixed ROM slots 22739.
                    if slot <> 22739 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        if fixedOperand = 8 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22740 {
// PORT: SOURCE P40-P47.agc:229
//		ADS	DAPDATR1	# INTERRUPT INHIBITED
// PORT: Fixed ROM slots 22740.
                        if slot <> 22740 or instruction <> 12086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:230
//		TC	Q		# EBANK = E6
// PORT: Fixed ROM slots 22741.
                        if slot <> 22741 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1305] to agcAotUnit1305@.

// PORT: Physical bank 27. Shared continuation entries, slots 25996–25996.
function agcAotUnit1509 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:231
//
// PORT: SOURCE P40-P47.agc:232
//# Page 688
// PORT: SOURCE P40-P47.agc:233
//# PROGRAM DESCRIPTION ** P41CSM **
// PORT: SOURCE P40-P47.agc:234
//
// PORT: SOURCE P40-P47.agc:235
//		SETLOC	P40S2
// PORT: SOURCE P40-P47.agc:236
//		BANK
// PORT: SOURCE P40-P47.agc:237
//
// PORT: SOURCE P40-P47.agc:238
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:239
//		COUNT	24/P41
// PORT: SOURCE P40-P47.agc:240
//
// PORT: SOURCE P40-P47.agc:241
//P41CSM		TC	UPFLAG
// PORT: Fixed ROM slots 25996.
    if slot <> 25996 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1509] to agcAotUnit1509@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:242
//		ADRES	ENG2FLAG	# SET FOR RCS
// PORT: Fixed ROM slots 25997.
    25997, 38
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25998–25998.
function agcAotUnit1510 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:243
//
// PORT: SOURCE P40-P47.agc:244
//		TC	INTPRET
// PORT: Fixed ROM slots 25998.
    if slot <> 25998 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1510] to agcAotUnit1510@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:245
//		DLOAD
// PORT: Fixed ROM slots 25999.
    25999, 65482,
// PORT: SOURCE P40-P47.agc:246
//			HI6ZEROS	# FOR P41 CSTEER =0
// PORT: Fixed ROM slots 26000.
    26000, 13754,
// PORT: SOURCE P40-P47.agc:247
//		STORE	CSTEER
// PORT: Fixed ROM slots 26001.
    26001, 3974,
// PORT: SOURCE P40-P47.agc:248
//
// PORT: SOURCE P40-P47.agc:249
//		DLOAD	BON
// PORT: Fixed ROM slots 26002.
    26002, 36042,
// PORT: SOURCE P40-P47.agc:250
//			FRCS2		# 2JET THRUST FOR S40.1
// PORT: Fixed ROM slots 26003.
    26003, 8726,
// PORT: SOURCE P40-P47.agc:251
//			NJETSFLG
// PORT: Fixed ROM slots 26004.
    26004, 896,
// PORT: SOURCE P40-P47.agc:252
//			P40S/F		# NJETS = 1 2-JET
// PORT: Fixed ROM slots 26005.
    26005, 41100,
// PORT: SOURCE P40-P47.agc:253
//		DAD	GOTO		# NJETS = 0 4-JET
// PORT: Fixed ROM slots 26006.
    26006, 43034,
// PORT: SOURCE P40-P47.agc:254
//			FRCS2
// PORT: Fixed ROM slots 26007.
    26007, 8726,
// PORT: SOURCE P40-P47.agc:255
//			P40S/F
// PORT: Fixed ROM slots 26008.
    26008, 41100
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22742–22749.
function agcAotUnit1306 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22745 {
        if slot <= 22743 {
            if slot <= 22742 {
// PORT: SOURCE P40-P47.agc:256
//
// PORT: SOURCE P40-P47.agc:257
//		SETLOC	P40S
// PORT: SOURCE P40-P47.agc:258
//		BANK
// PORT: SOURCE P40-P47.agc:259
//
// PORT: SOURCE P40-P47.agc:260
//P41/P40		CS	MODREG
// PORT: Fixed ROM slots 22742.
                if slot <> 22742 or instruction <> 16905 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 521).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:261
//		MASK	ONE		# P41EXITS AT CALL LOC +1
// PORT: Fixed ROM slots 22743.
                if slot <> 22743 or instruction <> 31247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22744 {
// PORT: SOURCE P40-P47.agc:262
//		EXTEND
// PORT: Fixed ROM slots 22744.
                if slot <> 22744 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:263
//		BZF	+2		# P41
// PORT: Fixed ROM slots 22745.
                if slot <> 22745 or instruction <> 5339 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5339, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22747 {
            if slot <= 22746 {
// PORT: SOURCE P40-P47.agc:264
//		INCR	Q		# P40 EXITS AT CALL LOC +2
// PORT: Fixed ROM slots 22746.
                if slot <> 22746 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:265
//		TC	Q
// PORT: Fixed ROM slots 22747.
                if slot <> 22747 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22748 {
// PORT: SOURCE P40-P47.agc:266
//
// PORT: SOURCE P40-P47.agc:267
//TTG/0		CAF	PRIO20		# TASK (4.4 PROTECTS IN P41)
// PORT: Fixed ROM slots 22748.
                if slot <> 22748 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:268
//		TC	NOVAC
// PORT: Fixed ROM slots 22749.
                if slot <> 22749 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1306] to agcAotUnit1306@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:269
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:270
//		2CADR	TIGNOW
// PORT: Fixed ROM slots 22750 22751.
    22750, 2408, 22751, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22752–22752.
function agcAotUnit1307 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:271
//
// PORT: SOURCE P40-P47.agc:272
//P40CLK		TC	DOWNFLAG
// PORT: Fixed ROM slots 22752.
    if slot <> 22752 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1307] to agcAotUnit1307@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:273
//		ADRES	TIMRFLAG
// PORT: Fixed ROM slots 22753.
    22753, 218
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22754–22757.
function agcAotUnit1308 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22755 {
        if slot <= 22754 {
// PORT: SOURCE P40-P47.agc:274
//
// PORT: SOURCE P40-P47.agc:275
//		TCF	TASKOVER
// PORT: Fixed ROM slots 22754.
            if slot <> 22754 or instruction <> 6868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:276
//
// PORT: SOURCE P40-P47.agc:277
//P41/DSP		CAF	V06N85B		# SET UP FOR NONFLASH V 06 N85 BY CLOCKJOB
// PORT: Fixed ROM slots 22755.
            if slot <> 22755 or instruction <> 13587 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1299), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22756 {
// PORT: SOURCE P40-P47.agc:278
//		TS	NVWORD1
// PORT: Fixed ROM slots 22756.
            if slot <> 22756 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:279
//
// PORT: SOURCE P40-P47.agc:280
//		TC	INTPRET
// PORT: Fixed ROM slots 22757.
            if slot <> 22757 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1308] to agcAotUnit1308@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:281
//# Page 689
// PORT: SOURCE P40-P47.agc:282
//		CALL			# COMPUTE
// PORT: Fixed ROM slots 22758.
    22758, 65320,
// PORT: SOURCE P40-P47.agc:283
//			P40CNV85	#	VGTIG IN CTRL COORDS
// PORT: Fixed ROM slots 22759.
    22759, 41456,
// PORT: SOURCE P40-P47.agc:284
//		EXIT
// PORT: Fixed ROM slots 22760.
    22760, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22761–22764.
function agcAotUnit1309 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22762 {
        if slot <= 22761 {
// PORT: SOURCE P40-P47.agc:285
//		EXTEND			# DO CONTROL COORD CALCULATION AFTER AVEG
// PORT: Fixed ROM slots 22761.
            if slot <> 22761 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:286
//		DCA	ACADN85
// PORT: Fixed ROM slots 22762.
            if slot <> 22762 or instruction <> 13618 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1330, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22763 {
// PORT: SOURCE P40-P47.agc:287
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 22763.
            if slot <> 22763 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:288
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 22764.
            if slot <> 22764 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1309] to agcAotUnit1309@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:289
//		OCT	40036		# 6.3=CLOKTASK(100CS)
// PORT: Fixed ROM slots 22765.
    22765, 32828,
// PORT: SOURCE P40-P47.agc:290
//		OCT	234		# 4.23=P40S/SV(PRIO12)
// PORT: Fixed ROM slots 22766.
    22766, 312
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22767–22771.
function agcAotUnit1310 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22768 {
        if slot <= 22767 {
// PORT: SOURCE P40-P47.agc:291
//
// PORT: SOURCE P40-P47.agc:292
//		TCF	P40S/RS
// PORT: Fixed ROM slots 22767.
            if slot <> 22767 or instruction <> 5247 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5247, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:293
//P41REDSP	CAF	V16N85B		# ENTER FROM P41 SIDE OF TIGAVEG
// PORT: Fixed ROM slots 22768.
            if slot <> 22768 or instruction <> 13588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1300), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22769 {
// PORT: SOURCE P40-P47.agc:294
//		TS	NVWORD1		# REDISPLAY NONFLASHING
// PORT: Fixed ROM slots 22769.
            if slot <> 22769 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22770 {
// PORT: SOURCE P40-P47.agc:295
//		CAF	SEC29.96 +1
// PORT: Fixed ROM slots 22770.
                if slot <> 22770 or instruction <> 13582 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1294), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:296
//		TC	WAITLIST
// PORT: Fixed ROM slots 22771.
                if slot <> 22771 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1310] to agcAotUnit1310@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:297
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:298
//		2CADR	TTG/0
// PORT: Fixed ROM slots 22772 22773.
    22772, 2488, 22773, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22774–22775.
function agcAotUnit1311 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22774 {
// PORT: SOURCE P40-P47.agc:299
//
// PORT: SOURCE P40-P47.agc:300
//		CS	BIT3
// PORT: Fixed ROM slots 22774.
        if slot <> 22774 or instruction <> 18957 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:301
//		TCF	TTGPHS
// PORT: Fixed ROM slots 22775.
        if slot <> 22775 or instruction <> 5494 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5494, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1311] to agcAotUnit1311@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:302
//P40CNV85	STQ	SETPD
// PORT: Fixed ROM slots 22776.
    22776, 33056,
// PORT: SOURCE P40-P47.agc:303
//			QTEMP1
// PORT: Fixed ROM slots 22777.
    22777, 4016,
// PORT: SOURCE P40-P47.agc:304
//			0
// PORT: Fixed ROM slots 22778.
    22778, 2,
// PORT: SOURCE P40-P47.agc:305
//		VLOAD	PUSH
// PORT: Fixed ROM slots 22779.
    22779, 34554,
// PORT: SOURCE P40-P47.agc:306
//			VGPREV		# EQUALS VGTIG (TARGETTING INPUT)
// PORT: Fixed ROM slots 22780.
    22780, 4002,
// PORT: SOURCE P40-P47.agc:307
//		CALL
// PORT: Fixed ROM slots 22781.
    22781, 65320,
// PORT: SOURCE P40-P47.agc:308
//			S41.1
// PORT: Fixed ROM slots 22782.
    22782, 38450,
// PORT: SOURCE P40-P47.agc:309
//		STCALL	VGBODY
// PORT: Fixed ROM slots 22783.
    22783, 32618,
// PORT: SOURCE P40-P47.agc:310
//			QTEMP1
// PORT: Fixed ROM slots 22784.
    22784, 4016
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22785–22785.
function agcAotUnit1312 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:311
//
// PORT: SOURCE P40-P47.agc:312
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:313
//CALCN85		TC	INTPRET
// PORT: Fixed ROM slots 22785.
    if slot <> 22785 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1312] to agcAotUnit1312@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:314
//		CALL
// PORT: Fixed ROM slots 22786.
    22786, 65320,
// PORT: SOURCE P40-P47.agc:315
//			UPDATEVG	# NEW VG, S40.8 (+MAYBE S40.9)
// PORT: Fixed ROM slots 22787.
    22787, 42120,
// PORT: SOURCE P40-P47.agc:316
//		CALL
// PORT: Fixed ROM slots 22788.
    22788, 65320,
// PORT: SOURCE P40-P47.agc:317
//			P40CNV85	# COMPUTE VGBODY
// PORT: Fixed ROM slots 22789.
    22789, 41456,
// PORT: SOURCE P40-P47.agc:318
//		EXIT
// PORT: Fixed ROM slots 22790.
    22790, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22791–22791.
function agcAotUnit1313 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:319
//		TC	SERVXT
// PORT: Fixed ROM slots 22791.
    if slot <> 22791 or instruction <> 1677 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1677, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1313] to agcAotUnit1313@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:320
//FENG		2DEC	9.1188544 B-7	# SPS THRUST (20500LBS), SC.AT B+7 NEWT/E4
// PORT: Fixed ROM slots 22792 22793.
    22792, 2334, 22793, 6992,
// PORT: SOURCE P40-P47.agc:321
//
// PORT: SOURCE P40-P47.agc:322
//FRCS2		2DEC	.087437837 B-7	# RCS ULLAGE (199.6COS10 LBS), SC.AT
// PORT: Fixed ROM slots 22794 22795.
    22794, 22, 22795, 6292,
// PORT: SOURCE P40-P47.agc:323
//
// PORT: SOURCE P40-P47.agc:324
//					#	B+7 NEWTONS/E+4
// PORT: SOURCE P40-P47.agc:325
//SEC24.96	DEC	2496
// PORT: Fixed ROM slots 22796.
    22796, 4992,
// PORT: SOURCE P40-P47.agc:326
//SEC29.96	2DEC	2996
// PORT: Fixed ROM slots 22797 22798.
    22797, 0, 22798, 5992,
// PORT: SOURCE P40-P47.agc:327
//
// PORT: SOURCE P40-P47.agc:328
//18SEC		DEC	1800
// PORT: Fixed ROM slots 22799.
    22799, 3600,
// PORT: SOURCE P40-P47.agc:329
//P40CKLS2	OCT	204
// PORT: Fixed ROM slots 22800.
    22800, 264,
// PORT: SOURCE P40-P47.agc:330
//40CST5		OCT	37730		# 40 CS FOR THE T5 CLOCK
// PORT: Fixed ROM slots 22801.
    22801, 32688,
// PORT: SOURCE P40-P47.agc:331
//OCT12		=	TEN
// PORT: SOURCE P40-P47.agc:332
//# Page 690
// PORT: SOURCE P40-P47.agc:333
//V1683		VN	1683
// PORT: Fixed ROM slots 22802.
    22802, 4262,
// PORT: SOURCE P40-P47.agc:334
//V06N85B		VN	0685
// PORT: Fixed ROM slots 22803.
    22803, 1706,
// PORT: SOURCE P40-P47.agc:335
//V16N85B		VN	1685
// PORT: Fixed ROM slots 22804.
    22804, 4266,
// PORT: SOURCE P40-P47.agc:336
//V06N40		VN	0640
// PORT: Fixed ROM slots 22805.
    22805, 1616,
// PORT: SOURCE P40-P47.agc:337
//V16N40		VN	1640
// PORT: Fixed ROM slots 22806.
    22806, 4176,
// PORT: SOURCE P40-P47.agc:338
//OCT27/24	OCT	27
// PORT: Fixed ROM slots 22807.
    22807, 46,
// PORT: SOURCE P40-P47.agc:339
//OCT53		OCT	53
// PORT: Fixed ROM slots 22808.
    22808, 86,
// PORT: SOURCE P40-P47.agc:340
//OCT35		OCT	35
// PORT: Fixed ROM slots 22809.
    22809, 58,
// PORT: SOURCE P40-P47.agc:341
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:342
//T5IDL24		2CADR	T5IDLOC
// PORT: Fixed ROM slots 22810 22811.
    22810, 3286, 22811, 10348,
// PORT: SOURCE P40-P47.agc:343
//
// PORT: SOURCE P40-P47.agc:344
//3MDOT		DEC	86.6175796 B-16	# 3SEC MASS LOSS (63.8 LBS/SEC), SC.AT
// PORT: Fixed ROM slots 22812.
    22812, 44
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22813–22816.
function agcAotUnit1314 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22814 {
        if slot <= 22813 {
// PORT: SOURCE P40-P47.agc:345
//					# B+16 KB/SEC (NOT, EMDOT IS PAD-LOADED,
// PORT: SOURCE P40-P47.agc:346
//					# BUT 3MDOT IS NOT A CRITICAL QUANTITY, SO
// PORT: SOURCE P40-P47.agc:347
//					# IT CAN REMAIN IN FIXED MEMORY)
// PORT: SOURCE P40-P47.agc:348
//TST,TRIM	CAF	BIT1		# SET UP FOR GIMB DRIVE TEST AND TRIM (+1)
// PORT: Fixed ROM slots 22813.
            if slot <> 22813 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:349
//		TCF	TRIMONLY +1
// PORT: Fixed ROM slots 22814.
            if slot <> 22814 or instruction <> 5231 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5231, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22815 {
// PORT: SOURCE P40-P47.agc:350
//TIGBLNK		CAF	5SEC		# CALL TIGAVEG IN FIVE SEC AT TIG-30
// PORT: Fixed ROM slots 22815.
            if slot <> 22815 or instruction <> 13876 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1588), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:351
//		TC	WAITLIST
// PORT: Fixed ROM slots 22816.
            if slot <> 22816 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1314] to agcAotUnit1314@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:352
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:353
//		2CADR	TIGAVEG
// PORT: Fixed ROM slots 22817 22818.
    22817, 2778, 22818, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22819–22822.
function agcAotUnit1315 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22820 {
        if slot <= 22819 {
// PORT: SOURCE P40-P47.agc:354
//
// PORT: SOURCE P40-P47.agc:355
//		CAF	ZERO		# DISABLE HERE, NOT IN P40BLNKR
// PORT: Fixed ROM slots 22819.
            if slot <> 22819 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:356
//		TS	NVWORD1
// PORT: Fixed ROM slots 22820.
            if slot <> 22820 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22821 {
// PORT: SOURCE P40-P47.agc:357
//
// PORT: SOURCE P40-P47.agc:358
//		CAF	PRIO14
// PORT: Fixed ROM slots 22821.
            if slot <> 22821 or instruction <> 14902 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:359
//		TC	NOVAC
// PORT: Fixed ROM slots 22822.
            if slot <> 22822 or instruction <> 2652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1315] to agcAotUnit1315@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:360
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:361
//		2CADR	P40BLNKR	# DON'T PROTECT -- RESTARTS BLANK DSKY
// PORT: Fixed ROM slots 22823 22824.
    22823, 2360, 22824, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22825–22826.
function agcAotUnit1316 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22825 {
// PORT: SOURCE P40-P47.agc:362
//
// PORT: SOURCE P40-P47.agc:363
//		CS	OCT37		# 4.37 = TIGAVEG (500CS)
// PORT: Fixed ROM slots 22825.
        if slot <> 22825 or instruction <> 18674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:364
//P40TSK		TC	NEWPHASE
// PORT: Fixed ROM slots 22826.
        if slot <> 22826 or instruction <> 2124 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2124, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1316] to agcAotUnit1316@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:365
//		OCT	4
// PORT: Fixed ROM slots 22827.
    22827, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22828–22828.
function agcAotUnit1317 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:366
//		TC	TASKOVER
// PORT: Fixed ROM slots 22828.
    if slot <> 22828 or instruction <> 2772 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2772, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1317] to agcAotUnit1317@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:367
//
// PORT: SOURCE P40-P47.agc:368
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:369
//ACADN83		2CADR	CALCN83
// PORT: Fixed ROM slots 22829 22830.
    22829, 2706, 22830, 41070,
// PORT: SOURCE P40-P47.agc:370
//
// PORT: SOURCE P40-P47.agc:371
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:372
//SERVCADR	2CADR	SERVEXIT
// PORT: Fixed ROM slots 22831 22832.
    22831, 3374, 22832, 63598,
// PORT: SOURCE P40-P47.agc:373
//
// PORT: SOURCE P40-P47.agc:374
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:375
//ACADN85		2CADR	CALCN85
// PORT: Fixed ROM slots 22833 22834.
    22833, 2562, 22834, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22835–22835.
function agcAotUnit1318 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:376
//
// PORT: SOURCE P40-P47.agc:377
//# Page 691
// PORT: SOURCE P40-P47.agc:378
//# PROGRAM DESCRIPTION ** P47CSM **
// PORT: SOURCE P40-P47.agc:379
//
// PORT: SOURCE P40-P47.agc:380
//		COUNT	24/P47
// PORT: SOURCE P40-P47.agc:381
//
// PORT: SOURCE P40-P47.agc:382
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:383
//P47CSM		TC	BANKCALL	# IMU STATUS CHECK
// PORT: Fixed ROM slots 22835.
    if slot <> 22835 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1318] to agcAotUnit1318@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:384
//		CADR	R02BOTH
// PORT: Fixed ROM slots 22836.
    22836, 16214
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22837–22837.
function agcAotUnit1319 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:385
//		TC	INTPRET
// PORT: Fixed ROM slots 22837.
    if slot <> 22837 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1319] to agcAotUnit1319@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:386
//		CALRB
// PORT: Fixed ROM slots 22838.
    22838, 65320,
// PORT: SOURCE P40-P47.agc:387
//			MIDTOAV2
// PORT: Fixed ROM slots 22839.
    22839, 24262
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22840–22842.
function agcAotUnit1320 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22840 {
// PORT: SOURCE P40-P47.agc:388
//		CA	MPAC +1		# DELTA TIME TO RPEREAD (LESS THAN 100
// PORT: Fixed ROM slots 22840.
        if slot <> 22840 or instruction <> 12397 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 109).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22841 {
// PORT: SOURCE P40-P47.agc:389
//		TS	P40TMP		#	CS, WITH A TPAGREE, INT.INIT.)
// PORT: Fixed ROM slots 22841.
            if slot <> 22841 or instruction <> 23482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:390
//		TC	WAITLIST
// PORT: Fixed ROM slots 22842.
            if slot <> 22842 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1320] to agcAotUnit1320@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:391
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:392
//		2CADR	TIGON		# TIGON IS REQUIRED TO MATHCHTAT AND AVEG
// PORT: Fixed ROM slots 22843 22844.
    22843, 2688, 22844, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22845–22845.
function agcAotUnit1321 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:393
//
// PORT: SOURCE P40-P47.agc:394
//		TC	PHASCHNG
// PORT: Fixed ROM slots 22845.
    if slot <> 22845 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1321] to agcAotUnit1321@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:395
//		OCT 	40574		# A, 4.57 = TIGON (P40TMP CS)
// PORT: Fixed ROM slots 22846.
    22846, 33528
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22847–22852.
function agcAotUnit1322 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22849 {
        if slot <= 22847 {
// PORT: SOURCE P40-P47.agc:396
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 22847.
            if slot <> 22847 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22848 {
// PORT: SOURCE P40-P47.agc:397
//
// PORT: SOURCE P40-P47.agc:398
//		EBANK=	P40TMP
// PORT: SOURCE P40-P47.agc:399
//TIGON		EXTEND
// PORT: Fixed ROM slots 22848.
                if slot <> 22848 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:400
//		DCA	ACADN83
// PORT: Fixed ROM slots 22849.
                if slot <> 22849 or instruction <> 13614 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1326, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22850 {
// PORT: SOURCE P40-P47.agc:401
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 22850.
            if slot <> 22850 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22851 {
// PORT: SOURCE P40-P47.agc:402
//		CAF	PRIO30		# FORCE ZEROING OF N83 BEFORE SERVICER
// PORT: Fixed ROM slots 22851.
                if slot <> 22851 or instruction <> 14585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:403
//		TC	NOVAC
// PORT: Fixed ROM slots 22852.
                if slot <> 22852 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1322] to agcAotUnit1322@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:404
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:405
//		2CADR	P47BODY
// PORT: Fixed ROM slots 22853 22854.
    22853, 2744, 22854, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22855–22857.
function agcAotUnit1323 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22855 {
// PORT: SOURCE P40-P47.agc:406
//
// PORT: SOURCE P40-P47.agc:407
//		CS	BIT2		# 4.2 = PRECHECK (-0CS), P47BODY (PRIO30)
// PORT: Fixed ROM slots 22855.
        if slot <> 22855 or instruction <> 18958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22856 {
// PORT: SOURCE P40-P47.agc:408
//		TCF	TTGPHS
// PORT: Fixed ROM slots 22856.
            if slot <> 22856 or instruction <> 5494 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5494, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:409
//
// PORT: SOURCE P40-P47.agc:410
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:411
//CALCN83		TC	INTPRET
// PORT: Fixed ROM slots 22857.
            if slot <> 22857 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1323] to agcAotUnit1323@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:412
//		SETPD			# SET UP PUSHLIST FOR S41.1
// PORT: Fixed ROM slots 22858.
    22858, 65282,
// PORT: SOURCE P40-P47.agc:413
//			0
// PORT: Fixed ROM slots 22859.
    22859, 2,
// PORT: SOURCE P40-P47.agc:414
//		VLOAD	VAD
// PORT: Fixed ROM slots 22860.
    22860, 44538,
// PORT: SOURCE P40-P47.agc:415
//			DELVCTL
// PORT: Fixed ROM slots 22861.
    22861, 3946,
// PORT: SOURCE P40-P47.agc:416
//			DELVREF
// PORT: Fixed ROM slots 22862.
    22862, 3638,
// PORT: SOURCE P40-P47.agc:417
//		STORE	DV47TEMP	# FOR COPYCYCLE BELOW
// PORT: Fixed ROM slots 22863.
    22863, 3680,
// PORT: SOURCE P40-P47.agc:418
//		PUSH	CALL
// PORT: Fixed ROM slots 22864.
    22864, 37900,
// PORT: SOURCE P40-P47.agc:419
//			S41.1
// PORT: Fixed ROM slots 22865.
    22865, 38450,
// PORT: SOURCE P40-P47.agc:420
//		STCALL	DELVIMU
// PORT: Fixed ROM slots 22866.
    22866, 32634,
// PORT: SOURCE P40-P47.agc:421
//			S11.1		# CALC. VI, H, HDOT FOR NOUN 62
// PORT: Fixed ROM slots 22867.
    22867, 58052,
// PORT: SOURCE P40-P47.agc:422
//		EXIT
// PORT: Fixed ROM slots 22868.
    22868, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22869–22869.
function agcAotUnit1324 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:423
//		TC	PHASCHNG
// PORT: Fixed ROM slots 22869.
    if slot <> 22869 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1324] to agcAotUnit1324@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:424
//		OCT	10035
// PORT: Fixed ROM slots 22870.
    22870, 8250
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22871–22872.
function agcAotUnit1325 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22871 {
// PORT: SOURCE P40-P47.agc:425
//# Page 692
// PORT: SOURCE P40-P47.agc:426
//		CAF	FIVE
// PORT: Fixed ROM slots 22871.
        if slot <> 22871 or instruction <> 14866 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:427
//		TC	GENTRAN
// PORT: Fixed ROM slots 22872.
        if slot <> 22872 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1325] to agcAotUnit1325@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:428
//		ADRES	DV47TEMP
// PORT: Fixed ROM slots 22873.
    22873, 1630,
// PORT: SOURCE P40-P47.agc:429
//		ADRES	DELVCTL
// PORT: Fixed ROM slots 22874.
    22874, 1896
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22875–22876.
function agcAotUnit1326 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22875 {
// PORT: SOURCE P40-P47.agc:430
//
// PORT: SOURCE P40-P47.agc:431
//		TC	SERVXT
// PORT: Fixed ROM slots 22875.
        if slot <> 22875 or instruction <> 1677 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1677, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:432
//P47BODY		TC	INTPRET
// PORT: Fixed ROM slots 22876.
        if slot <> 22876 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1326] to agcAotUnit1326@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:433
//		VLOAD
// PORT: Fixed ROM slots 22877.
    22877, 65530,
// PORT: SOURCE P40-P47.agc:434
//			HI6ZEROS
// PORT: Fixed ROM slots 22878.
    22878, 13754,
// PORT: SOURCE P40-P47.agc:435
//		STORE	DELVIMU		# CLEAR DISPLAY AND ACCUMULATOR STORAGE
// PORT: Fixed ROM slots 22879.
    22879, 3962,
// PORT: SOURCE P40-P47.agc:436
//		STORE	DELVCTL		# UPON INITIATION OR ENTER RESPONSE
// PORT: Fixed ROM slots 22880.
    22880, 3946,
// PORT: SOURCE P40-P47.agc:437
//		EXIT
// PORT: Fixed ROM slots 22881.
    22881, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22882–22884.
function agcAotUnit1327 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22882 {
// PORT: SOURCE P40-P47.agc:438
//P47BOD		CAF	PRIO15		# LOWER PRIO THAN CALCN83 (20)
// PORT: Fixed ROM slots 22882.
        if slot <> 22882 or instruction <> 14903 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2615), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22883 {
// PORT: SOURCE P40-P47.agc:439
//		TC	PRIOCHNG	#	TO PREVENT INTERRUPTION OF CALCN83
// PORT: Fixed ROM slots 22883.
            if slot <> 22883 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:440
//		TC	PHASCHNG
// PORT: Fixed ROM slots 22884.
            if slot <> 22884 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1327] to agcAotUnit1327@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:441
//		OCT	05024		# TYPE C GROUP 4 BELOW FOR NOUN 83
// PORT: Fixed ROM slots 22885.
    22885, 5160,
// PORT: SOURCE P40-P47.agc:442
//		OCT	15000		# PRIO 15
// PORT: Fixed ROM slots 22886.
    22886, 13312
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22887–22888.
function agcAotUnit1328 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22887 {
// PORT: SOURCE P40-P47.agc:443
//P47/DSP		CAF	V1683
// PORT: Fixed ROM slots 22887.
        if slot <> 22887 or instruction <> 13586 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1298), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:444
//		TC	BANKCALL
// PORT: Fixed ROM slots 22888.
        if slot <> 22888 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1328] to agcAotUnit1328@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:445
//		CADR	GOFLASH
// PORT: Fixed ROM slots 22889.
    22889, 17312
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22890–22898.
function agcAotUnit1329 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22893 {
        if slot <= 22891 {
            if slot <= 22890 {
// PORT: SOURCE P40-P47.agc:446
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 22890.
                if slot <> 22890 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:447
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 22891.
                if slot <> 22891 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22892 {
// PORT: SOURCE P40-P47.agc:448
//		TCF	P47BODY		# RECYCLE -- CLEAR ACCUMULATED VELOCITY
// PORT: Fixed ROM slots 22892.
                if slot <> 22892 or instruction <> 5468 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5468, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:449
//
// PORT: SOURCE P40-P47.agc:450
//# Page 693
// PORT: SOURCE P40-P47.agc:451
//# ROUTINE ** TIG-30 ** DESCRIPTION
// PORT: SOURCE P40-P47.agc:452
//
// PORT: SOURCE P40-P47.agc:453
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:454
//		COUNT	24/P40
// PORT: SOURCE P40-P47.agc:455
//
// PORT: SOURCE P40-P47.agc:456
//TIGAVEG		TC	P41/P40		# TASK (4.37 PROTECTS)
// PORT: Fixed ROM slots 22893.
                if slot <> 22893 or instruction <> 1238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1238, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22895 {
            if slot <= 22894 {
// PORT: SOURCE P40-P47.agc:457
//		TCF	P41REDSP
// PORT: Fixed ROM slots 22894.
                if slot <> 22894 or instruction <> 5360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5360, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:458
//
// PORT: SOURCE P40-P47.agc:459
//		CAF	V06N40		# UNBLANK DISPLAY
// PORT: Fixed ROM slots 22895.
                if slot <> 22895 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22896 {
// PORT: SOURCE P40-P47.agc:460
//		TS	NVWORD1
// PORT: Fixed ROM slots 22896.
                if slot <> 22896 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22897 {
// PORT: SOURCE P40-P47.agc:461
//
// PORT: SOURCE P40-P47.agc:462
//		CAF	SEC24.96
// PORT: Fixed ROM slots 22897.
                    if slot <> 22897 or instruction <> 13580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1292), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:463
//		TC	WAITLIST
// PORT: Fixed ROM slots 22898.
                    if slot <> 22898 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1329] to agcAotUnit1329@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:464
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:465
//		2CADR	TIG-5
// PORT: Fixed ROM slots 22899 22900.
    22899, 2808, 22900, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22901–22902.
function agcAotUnit1330 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22901 {
// PORT: SOURCE P40-P47.agc:466
//
// PORT: SOURCE P40-P47.agc:467
//		CS	SIX		# 4.6 = TIG-5 (2496CS), PRECHECK (-0CS)
// PORT: Fixed ROM slots 22901.
        if slot <> 22901 or instruction <> 19593 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:468
//TTGPHS		TC	NEWPHASE	# ENTRY FROM P41REDSP (P41) WITH A=-4, OR
// PORT: Fixed ROM slots 22902.
        if slot <> 22902 or instruction <> 2124 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2124, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1330] to agcAotUnit1330@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:469
//		OCT	4		#       FROM TIGON    (P47) WITH A=-1
// PORT: Fixed ROM slots 22903.
    22903, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22904–22906.
function agcAotUnit1331 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22904 {
// PORT: SOURCE P40-P47.agc:470
//
// PORT: SOURCE P40-P47.agc:471
//PRECHECK	CCS	PHASE5		# HAS SERVICER BEEN RESTARTED
// PORT: Fixed ROM slots 22904.
        if slot <> 22904 or instruction <> 4595 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 499).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22905 {
// PORT: SOURCE P40-P47.agc:472
//		TCF	TASKOVER	# YES, DON'T START ANOTHER ONE
// PORT: Fixed ROM slots 22905.
            if slot <> 22905 or instruction <> 6868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:473
//		TC	POSTJUMP
// PORT: Fixed ROM slots 22906.
            if slot <> 22906 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1331] to agcAotUnit1331@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:474
//		CADR	PREREAD
// PORT: Fixed ROM slots 22907.
    22907, 64386
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22908–22909.
function agcAotUnit1332 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22908 {
// PORT: SOURCE P40-P47.agc:475
//
// PORT: SOURCE P40-P47.agc:476
//# Page 694
// PORT: SOURCE P40-P47.agc:477
//# ROUTINE ** TIG-5 ** DESCRIPTION
// PORT: SOURCE P40-P47.agc:478
//
// PORT: SOURCE P40-P47.agc:479
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:480
//TIG-5		CAF	5SEC
// PORT: Fixed ROM slots 22908.
        if slot <> 22908 or instruction <> 13876 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1588), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:481
//		TC	WAITLIST
// PORT: Fixed ROM slots 22909.
        if slot <> 22909 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1332] to agcAotUnit1332@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:482
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:483
//		2CADR	TIG-0
// PORT: Fixed ROM slots 22910 22911.
    22910, 2836, 22911, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22912–22914.
function agcAotUnit1333 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22912 {
// PORT: SOURCE P40-P47.agc:484
//
// PORT: SOURCE P40-P47.agc:485
//		CS	BIT9		# WILL CAUSE V99 FLASH
// PORT: Fixed ROM slots 22912.
        if slot <> 22912 or instruction <> 18951 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22913 {
// PORT: SOURCE P40-P47.agc:486
//		TS	NVWORD1
// PORT: Fixed ROM slots 22913.
            if slot <> 22913 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:487
//
// PORT: SOURCE P40-P47.agc:488
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 22914.
            if slot <> 22914 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1333] to agcAotUnit1333@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:489
//		OCT	40074		# A, 4.7 = TIG-0 (500CS)
// PORT: Fixed ROM slots 22915.
    22915, 32888,
// PORT: SOURCE P40-P47.agc:490
//		OCT	00033		# A, 3.3 = S40.13 (PRIO20)
// PORT: Fixed ROM slots 22916.
    22916, 54
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22917–22918.
function agcAotUnit1334 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22917 {
// PORT: SOURCE P40-P47.agc:491
//
// PORT: SOURCE P40-P47.agc:492
//		CAF	PRIO20
// PORT: Fixed ROM slots 22917.
        if slot <> 22917 or instruction <> 14850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:493
//		TC	FINDVAC
// PORT: Fixed ROM slots 22918.
        if slot <> 22918 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1334] to agcAotUnit1334@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:494
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:495
//		2CADR	S40.13
// PORT: Fixed ROM slots 22919 22920.
    22919, 2606, 22920, 28782
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22921–22931.
function agcAotUnit1335 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22925 {
        if slot <= 22922 {
            if slot <= 22921 {
// PORT: SOURCE P40-P47.agc:496
//
// PORT: SOURCE P40-P47.agc:497
//		TCF	TASKOVER
// PORT: Fixed ROM slots 22921.
                if slot <> 22921 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:498
//
// PORT: SOURCE P40-P47.agc:499
//# Page 695
// PORT: SOURCE P40-P47.agc:500
//# ROUTINES ** TIG-0 ** AND ** IGNITION ** DESCRIPTION
// PORT: SOURCE P40-P47.agc:501
//
// PORT: SOURCE P40-P47.agc:502
//		EBANK=	DAPDATR1	# TASK, 4.7 PHASE, OR 4.77 (-0CS) IN R40
// PORT: SOURCE P40-P47.agc:503
//TIG-0		CS	FLAGWRD7	# SET IGN FLAG
// PORT: Fixed ROM slots 22922.
                if slot <> 22922 or instruction <> 16451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 67).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22923 {
// PORT: SOURCE P40-P47.agc:504
//		MASK	BIT13
// PORT: Fixed ROM slots 22923.
                if slot <> 22923 or instruction <> 31235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    if fixedOperand = 4096 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22924 {
// PORT: SOURCE P40-P47.agc:505
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 22924.
                    if slot <> 22924 or instruction <> 11331 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:506
//
// PORT: SOURCE P40-P47.agc:507
//		CAE	FLAGWRD7	# CHECK ASTN FLAG FOR V99 RESPONSE
// PORT: Fixed ROM slots 22925.
                    if slot <> 22925 or instruction <> 12355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22928 {
            if slot <= 22926 {
// PORT: SOURCE P40-P47.agc:508
//		MASK	BIT12
// PORT: Fixed ROM slots 22926.
                if slot <> 22926 or instruction <> 31236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22927 {
// PORT: SOURCE P40-P47.agc:509
//		EXTEND
// PORT: Fixed ROM slots 22927.
                    if slot <> 22927 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:510
//		BZF	TASKOVER	# WAIT FOR V99P
// PORT: Fixed ROM slots 22928.
                    if slot <> 22928 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22929 {
// PORT: SOURCE P40-P47.agc:511
//
// PORT: SOURCE P40-P47.agc:512
//		CAF	V06N40		# CLEAR THE V99 (IN CASE OF A RESTART
// PORT: Fixed ROM slots 22929.
                if slot <> 22929 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22930 {
// PORT: SOURCE P40-P47.agc:513
//		TS	NVWORD1		#	DURING THE V99 SEQUENCE)
// PORT: Fixed ROM slots 22930.
                    if slot <> 22930 or instruction <> 23141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23141, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:514
//
// PORT: SOURCE P40-P47.agc:515
//		TC	PHASCHNG	# V99P HAS COME ALREADY, DO IGNITION NOW
// PORT: Fixed ROM slots 22931.
                    if slot <> 22931 or instruction <> 2826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2826, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1335] to agcAotUnit1335@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:516
//		OCT	00614		# A, 4.61 = IGNITION (-0CS) TBASE OLD
// PORT: Fixed ROM slots 22932.
    22932, 792
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22933–22958.
function agcAotUnit1336 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22945 {
        if slot <= 22938 {
            if slot <= 22935 {
                if slot <= 22933 {
// PORT: SOURCE P40-P47.agc:517
//
// PORT: SOURCE P40-P47.agc:518
//IGNITION	CAE	CDUX		# SAVE FOR ROLL DAP REFERENCE OGAD
// PORT: Fixed ROM slots 22933.
                    if slot <> 22933 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22934 {
// PORT: SOURCE P40-P47.agc:519
//		TS	OGAD		#	V99PJOB (CLOCKJOB) SETS UP IGNITION
// PORT: Fixed ROM slots 22934.
                        if slot <> 22934 or instruction <> 23336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23336, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:520
//		EXTEND			# 	TASK (4.61 PROTECTION)
// PORT: Fixed ROM slots 22935.
                        if slot <> 22935 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22936 {
// PORT: SOURCE P40-P47.agc:521
//		DCA	TIME2		#	FOR RESTARTS
// PORT: Fixed ROM slots 22936.
                    if slot <> 22936 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22937 {
// PORT: SOURCE P40-P47.agc:522
//		DXCH	TEVENT
// PORT: Fixed ROM slots 22937.
                        if slot <> 22937 or instruction <> 22239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:523
//		CS	FLAGWRD5	# SET ENGONFLG
// PORT: Fixed ROM slots 22938.
                        if slot <> 22938 or instruction <> 16449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 65).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22941 {
                if slot <= 22939 {
// PORT: SOURCE P40-P47.agc:524
//		MASK	BIT7
// PORT: Fixed ROM slots 22939.
                    if slot <> 22939 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22940 {
// PORT: SOURCE P40-P47.agc:525
//		ADS	FLAGWRD5
// PORT: Fixed ROM slots 22940.
                        if slot <> 22940 or instruction <> 11329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:526
//SPSON		CAF	BIT13		# TURN ON SPS ENGINE
// PORT: Fixed ROM slots 22941.
                        if slot <> 22941 or instruction <> 14851 { return choose false if checkOnly else -1. }
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
                if slot <= 22943 {
                    if slot <= 22942 {
// PORT: SOURCE P40-P47.agc:527
//		EXTEND
// PORT: Fixed ROM slots 22942.
                        if slot <> 22942 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:528
//		WOR	DSALMOUT
// PORT: Fixed ROM slots 22943.
                        if slot <> 22943 or instruction <> 2569 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 22944 {
// PORT: SOURCE P40-P47.agc:529
//
// PORT: SOURCE P40-P47.agc:530
//IMPULCHK	CAF	BIT9		# CHECK FOR IMPULSIVE BURN
// PORT: Fixed ROM slots 22944.
                        if slot <> 22944 or instruction <> 14855 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:531
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 22945.
                        if slot <> 22945 or instruction <> 28734 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 22951 {
            if slot <= 22948 {
                if slot <= 22946 {
// PORT: SOURCE P40-P47.agc:532
//		CCS	A
// PORT: Fixed ROM slots 22946.
                    if slot <> 22946 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22947 {
// PORT: SOURCE P40-P47.agc:533
//		TCF	IMPLBURN	# IMPULSIVE
// PORT: Fixed ROM slots 22947.
                        if slot <> 22947 or instruction <> 5595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5595, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:534
//		CS	FLAGWRD6	# NON-IMPULSIVE, SET STRULLSW FOR STEERULL
// PORT: Fixed ROM slots 22948.
                        if slot <> 22948 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22949 {
// PORT: SOURCE P40-P47.agc:535
//		MASK	BIT13
// PORT: Fixed ROM slots 22949.
                    if slot <> 22949 or instruction <> 31235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        if fixedOperand = 4096 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22950 {
// PORT: SOURCE P40-P47.agc:536
//		ADS	FLAGWRD6
// PORT: Fixed ROM slots 22950.
                        if slot <> 22950 or instruction <> 11330 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:537
//
// PORT: SOURCE P40-P47.agc:538
//PREPTVC		CS	OCT60000	# RESET T5 BITS
// PORT: Fixed ROM slots 22951.
                        if slot <> 22951 or instruction <> 18501 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22954 {
                if slot <= 22952 {
// PORT: SOURCE P40-P47.agc:539
//		MASK	FLAGWRD6
// PORT: Fixed ROM slots 22952.
                    if slot <> 22952 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22953 {
// PORT: SOURCE P40-P47.agc:540
//		TS	FLAGWRD6
// PORT: Fixed ROM slots 22953.
                        if slot <> 22953 or instruction <> 22594 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22594, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:541
//
// PORT: SOURCE P40-P47.agc:542
//		EXTEND			# KILL RCS
// PORT: Fixed ROM slots 22954.
                        if slot <> 22954 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22956 {
                    if slot <= 22955 {
// PORT: SOURCE P40-P47.agc:543
//		DCA	T5IDL24
// PORT: Fixed ROM slots 22955.
                        if slot <> 22955 or instruction <> 13595 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1307, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:544
//		DXCH	T5LOC
// PORT: Fixed ROM slots 22956.
                        if slot <> 22956 or instruction <> 22219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 22957 {
// PORT: SOURCE P40-P47.agc:545
//
// PORT: SOURCE P40-P47.agc:546
//		CS	THREE		# 4.3 = DOTVCON (40CS)
// PORT: Fixed ROM slots 22957.
                        if slot <> 22957 or instruction <> 19596 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:547
//		TC	NEWPHASE
// PORT: Fixed ROM slots 22958.
                        if slot <> 22958 or instruction <> 2124 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2124, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1336] to agcAotUnit1336@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:548
//		OCT	4
// PORT: Fixed ROM slots 22959.
    22959, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22960–22960.
function agcAotUnit1337 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:549
//
// PORT: SOURCE P40-P47.agc:550
//# Page 696
// PORT: SOURCE P40-P47.agc:551
//		TC	FIXDELAY
// PORT: Fixed ROM slots 22960.
    if slot <> 22960 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1337] to agcAotUnit1337@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:552
//		DEC	40		# 0.4 SECOND DELAY FOR THRUST BUILDUP
// PORT: Fixed ROM slots 22961.
    22961, 80
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22962–22978.
function agcAotUnit1338 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22969 {
        if slot <= 22965 {
            if slot <= 22963 {
                if slot <= 22962 {
// PORT: SOURCE P40-P47.agc:553
//
// PORT: SOURCE P40-P47.agc:554
//DOTVCON		CS	BIT1		# SET TVCPHASE = TVCDAPON CALL (FRESHDAP)
// PORT: Fixed ROM slots 22962.
                    if slot <> 22962 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:555
//		TS	TVCPHASE
// PORT: Fixed ROM slots 22963.
                    if slot <> 22963 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22964 {
// PORT: SOURCE P40-P47.agc:556
//		CAF	ZERO		# SET TVCEXECUTIVE PHASE
// PORT: Fixed ROM slots 22964.
                    if slot <> 22964 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:557
//		TS	TVCEXPHS
// PORT: Fixed ROM slots 22965.
                    if slot <> 22965 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22967 {
                if slot <= 22966 {
// PORT: SOURCE P40-P47.agc:558
//		CS	OCT60000	# SET T5 BITS TO INDICATE TVC TAKEOVER ....
// PORT: Fixed ROM slots 22966.
                    if slot <> 22966 or instruction <> 18501 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:559
//		MASK	FLAGWRD6	#	BITS 15,14 = 10
// PORT: Fixed ROM slots 22967.
                    if slot <> 22967 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22968 {
// PORT: SOURCE P40-P47.agc:560
//		AD	BIT15
// PORT: Fixed ROM slots 22968.
                    if slot <> 22968 or instruction <> 27137 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:561
//		TS	FLAGWRD6
// PORT: Fixed ROM slots 22969.
                    if slot <> 22969 or instruction <> 22594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22594, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22973 {
            if slot <= 22971 {
                if slot <= 22970 {
// PORT: SOURCE P40-P47.agc:562
//
// PORT: SOURCE P40-P47.agc:563
//		CAF	THREE		# 6.3 = CLOKTASK (100CS), DROPPING PRE40.6
// PORT: Fixed ROM slots 22970.
                    if slot <> 22970 or instruction <> 15500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:564
//		TS	L		#	WHICH IS HANDLED NOW BY REDOTVC
// PORT: Fixed ROM slots 22971.
                    if slot <> 22971 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22972 {
// PORT: SOURCE P40-P47.agc:565
//		COM
// PORT: Fixed ROM slots 22972.
                    if slot <> 22972 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:566
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 22973.
                    if slot <> 22973 or instruction <> 22005 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22975 {
                if slot <= 22974 {
// PORT: SOURCE P40-P47.agc:567
//
// PORT: SOURCE P40-P47.agc:568
//		EXTEND			# STORE RCS ATTITUDE ERRORS FOR USE IN
// PORT: Fixed ROM slots 22974.
                    if slot <> 22974 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:569
//		DCS	ERRORY		# INITIALIZING TVC ATTITUDE ERRORS
// PORT: Fixed ROM slots 22975.
                    if slot <> 22975 or instruction <> 17273 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 889, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22976 {
// PORT: SOURCE P40-P47.agc:570
//		DXCH	ERRBTMP
// PORT: Fixed ROM slots 22976.
                    if slot <> 22976 or instruction <> 22467 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 963, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22977 {
// PORT: SOURCE P40-P47.agc:571
//
// PORT: SOURCE P40-P47.agc:572
//		CS	FIVE		# 4.5 = DOSTRULL (160 CS)
// PORT: Fixed ROM slots 22977.
                        if slot <> 22977 or instruction <> 18962 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:573
//		TC	NEWPHASE
// PORT: Fixed ROM slots 22978.
                        if slot <> 22978 or instruction <> 2124 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2124, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1338] to agcAotUnit1338@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:574
//		OCT	4
// PORT: Fixed ROM slots 22979.
    22979, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22980–22985.
function agcAotUnit1339 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22982 {
        if slot <= 22980 {
// PORT: SOURCE P40-P47.agc:575
//
// PORT: SOURCE P40-P47.agc:576
//		CAF	POSMAX		# SET TIME5 FOR STARTING RIGHT AWAY
// PORT: Fixed ROM slots 22980.
            if slot <> 22980 or instruction <> 14847 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22981 {
// PORT: SOURCE P40-P47.agc:577
//		TS	TIME5
// PORT: Fixed ROM slots 22981.
                if slot <> 22981 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:578
//		EXTEND
// PORT: Fixed ROM slots 22982.
                if slot <> 22982 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22983 {
// PORT: SOURCE P40-P47.agc:579
//		DCA	TVCON2C		# (TVCDAPON)
// PORT: Fixed ROM slots 22983.
            if slot <> 22983 or instruction <> 13879 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1591, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22984 {
// PORT: SOURCE P40-P47.agc:580
//		DXCH	T5LOC		# (KILLS RCS DAP)
// PORT: Fixed ROM slots 22984.
                if slot <> 22984 or instruction <> 22219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:581
//
// PORT: SOURCE P40-P47.agc:582
//		TC	FIXDELAY	# 0.4 + 1.6 = 2.0 SEC FOR ULLAGE-OFF AND
// PORT: Fixed ROM slots 22985.
                if slot <> 22985 or instruction <> 2743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2743, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1339] to agcAotUnit1339@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:583
//		DEC	160		# 	STEERING (IF NON-IMPULSIVE)
// PORT: Fixed ROM slots 22986.
    22986, 320
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22987–22996.
function agcAotUnit1340 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22991 {
        if slot <= 22988 {
            if slot <= 22987 {
// PORT: SOURCE P40-P47.agc:584
//
// PORT: SOURCE P40-P47.agc:585
//DOSTRULL	CAF	BIT13		# CHECK STRULLSW FOR IMPULSIVE BURN
// PORT: Fixed ROM slots 22987.
                if slot <> 22987 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:586
//		MASK	FLAGWRD6
// PORT: Fixed ROM slots 22988.
                if slot <> 22988 or instruction <> 28738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22989 {
// PORT: SOURCE P40-P47.agc:587
//		CCS	A
// PORT: Fixed ROM slots 22989.
                if slot <> 22989 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22990 {
// PORT: SOURCE P40-P47.agc:588
//		TCR	STEERULL	# NON-IMPULSIVE, STEERING AND ULLAGE OFF
// PORT: Fixed ROM slots 22990.
                    if slot <> 22990 or instruction <> 1492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:589
//		TCR	ULAGEOFF	# ULLAGE OFF (ONLY, OR AGAIN)
// PORT: Fixed ROM slots 22991.
                    if slot <> 22991 or instruction <> 1495 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1495, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22993 {
            if slot <= 22992 {
// PORT: SOURCE P40-P47.agc:590
//
// PORT: SOURCE P40-P47.agc:591
//		EXTEND
// PORT: Fixed ROM slots 22992.
                if slot <> 22992 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:592
//		DCA	NEG0		# KILL GROUP 4 (DP NEG0 = -0,+0)
// PORT: Fixed ROM slots 22993.
                if slot <> 22993 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22994 {
// PORT: SOURCE P40-P47.agc:593
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 22994.
                if slot <> 22994 or instruction <> 22001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22995 {
// PORT: SOURCE P40-P47.agc:594
//
// PORT: SOURCE P40-P47.agc:595
//ENDIGN		TCF	TASKOVER
// PORT: Fixed ROM slots 22995.
                    if slot <> 22995 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:596
//
// PORT: SOURCE P40-P47.agc:597
//STEERULL	CS	FLAGWRD2	# SET STEERSW
// PORT: Fixed ROM slots 22996.
                    if slot <> 22996 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1340] to agcAotUnit1340@.

// PORT: Physical bank 24. Shared continuation entries, slots 22997–23013.
function agcAotUnit1341 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23004 {
        if slot <= 23000 {
            if slot <= 22998 {
                if slot <= 22997 {
// PORT: SOURCE P40-P47.agc:598
//		MASK	BIT11
// PORT: Fixed ROM slots 22997.
                    if slot <> 22997 or instruction <> 31237 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        if fixedOperand = 1024 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:599
//		ADS	FLAGWRD2
// PORT: Fixed ROM slots 22998.
                    if slot <> 22998 or instruction <> 11326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22999 {
// PORT: SOURCE P40-P47.agc:600
//
// PORT: SOURCE P40-P47.agc:601
//# Page 697
// PORT: SOURCE P40-P47.agc:602
//
// PORT: SOURCE P40-P47.agc:603
//ULAGEOFF	CAF	ZERO
// PORT: Fixed ROM slots 22999.
                    if slot <> 22999 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:604
//		EXTEND
// PORT: Fixed ROM slots 23000.
                    if slot <> 23000 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23002 {
                if slot <= 23001 {
// PORT: SOURCE P40-P47.agc:605
//		WRITE	CHAN5		# ZERO CHANNEL 5
// PORT: Fixed ROM slots 23001.
                    if slot <> 23001 or instruction <> 517 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:606
//		TC	Q
// PORT: Fixed ROM slots 23002.
                    if slot <> 23002 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23003 {
// PORT: SOURCE P40-P47.agc:607
//
// PORT: SOURCE P40-P47.agc:608
//IMPLBURN	CS	BIT13		# RESET STRULLSW (COULD BE AN IMPULSIVE
// PORT: Fixed ROM slots 23003.
                    if slot <> 23003 or instruction <> 18947 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:609
//		MASK	FLAGWRD6	#	ENGINE FAIL)
// PORT: Fixed ROM slots 23004.
                    if slot <> 23004 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23008 {
            if slot <= 23006 {
                if slot <= 23005 {
// PORT: SOURCE P40-P47.agc:610
//		TS	FLAGWRD6
// PORT: Fixed ROM slots 23005.
                    if slot <> 23005 or instruction <> 22594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22594, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:611
//
// PORT: SOURCE P40-P47.agc:612
//		TCR	E7SETTER
// PORT: Fixed ROM slots 23006.
                    if slot <> 23006 or instruction <> 1782 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1782, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23007 {
// PORT: SOURCE P40-P47.agc:613
//
// PORT: SOURCE P40-P47.agc:614
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:615
//		EXTEND			# PREPARE FOR R1 OF V06N40 (CLOCKTASK)
// PORT: Fixed ROM slots 23007.
                    if slot <> 23007 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:616
//		DCA	TGO
// PORT: Fixed ROM slots 23008.
                    if slot <> 23008 or instruction <> 13080 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 792, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23010 {
                if slot <= 23009 {
// PORT: SOURCE P40-P47.agc:617
//		DXCH	TIG
// PORT: Fixed ROM slots 23009.
                    if slot <> 23009 or instruction <> 22283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:618
//		EXTEND
// PORT: Fixed ROM slots 23010.
                    if slot <> 23010 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23011 {
// PORT: SOURCE P40-P47.agc:619
//		DCA	TIME2
// PORT: Fixed ROM slots 23011.
                    if slot <> 23011 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23012 {
// PORT: SOURCE P40-P47.agc:620
//		DAS	TIG
// PORT: Fixed ROM slots 23012.
                        if slot <> 23012 or instruction <> 8971 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 779) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:621
//
// PORT: SOURCE P40-P47.agc:622
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23013.
                        if slot <> 23013 or instruction <> 2810 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2810, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1341] to agcAotUnit1341@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:623
//		OCT	40153		# A, 3.15 = ENGINOFF (TGO+1) .... NOT GROUP
// PORT: Fixed ROM slots 23014.
    23014, 32982,
// PORT: SOURCE P40-P47.agc:624
//		OCT	07014		# C, DELTAT NEXT, TASK BELOW, IN
// PORT: Fixed ROM slots 23015.
    23015, 7192,
// PORT: SOURCE P40-P47.agc:625
//		DEC	-0		# -0 CS
// PORT: Fixed ROM slots 23016.
    23016, 65534,
// PORT: SOURCE P40-P47.agc:626
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:627
//		2CADR	IMPLCONT
// PORT: Fixed ROM slots 23017 23018.
    23017, 3038, 23018, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23019–23020.
function agcAotUnit1342 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23019 {
// PORT: SOURCE P40-P47.agc:628
//
// PORT: SOURCE P40-P47.agc:629
//		CAE	TGO +1		# (TPAGREE IN S40.13, LESS THAN 600CS)
// PORT: Fixed ROM slots 23019.
        if slot <> 23019 or instruction <> 13080 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 792).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:630
//		TC	WAITLIST
// PORT: Fixed ROM slots 23020.
        if slot <> 23020 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1342] to agcAotUnit1342@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:631
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:632
//		2CADR	ENGINOFF
// PORT: Fixed ROM slots 23021 23022.
    23021, 3052, 23022, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23023–23033.
function agcAotUnit1343 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23027 {
        if slot <= 23024 {
            if slot <= 23023 {
// PORT: SOURCE P40-P47.agc:633
//
// PORT: SOURCE P40-P47.agc:634
//IMPLCONT	CS	BIT9		# RESET IMPULSW, ENGINOFF IS NOW SET UP
// PORT: Fixed ROM slots 23023.
                if slot <> 23023 or instruction <> 18951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:635
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 23024.
                if slot <> 23024 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23025 {
// PORT: SOURCE P40-P47.agc:636
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 23025.
                if slot <> 23025 or instruction <> 22590 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22590, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23026 {
// PORT: SOURCE P40-P47.agc:637
//
// PORT: SOURCE P40-P47.agc:638
//		TCR	E6SETTER
// PORT: Fixed ROM slots 23026.
                    if slot <> 23026 or instruction <> 1785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1785, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:639
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:640
//
// PORT: SOURCE P40-P47.agc:641
//		CAF	ZERO		# SET UP V97VCNTR IN CASE ENGINOFF (MASS-=
// PORT: Fixed ROM slots 23027.
                    if slot <> 23027 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23030 {
            if slot <= 23028 {
// PORT: SOURCE P40-P47.agc:642
//		TS	V97VCNTR	#	BACK) ARRIVES BEFORE TVCDAPON
// PORT: Fixed ROM slots 23028.
                if slot <> 23028 or instruction <> 23332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23332, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23029 {
// PORT: SOURCE P40-P47.agc:643
//
// PORT: SOURCE P40-P47.agc:644
//		TCF	PREPTVC
// PORT: Fixed ROM slots 23029.
                    if slot <> 23029 or instruction <> 5543 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5543, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:645
//
// PORT: SOURCE P40-P47.agc:646
//		EBANK=	TGO		# E7 FORCED BY 3.15SPOT VARIABLE DELTA-T
// PORT: SOURCE P40-P47.agc:647
//ENGINOFF	TCR	E6SETTER	# TASK, 3.15 PHASE (TGO+1 CS)	GET E6
// PORT: Fixed ROM slots 23030.
                    if slot <> 23030 or instruction <> 1785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1785, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23031 {
// PORT: SOURCE P40-P47.agc:648
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:649
//		CAE	CSMMASS
// PORT: Fixed ROM slots 23031.
                if slot <> 23031 or instruction <> 13116 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23032 {
// PORT: SOURCE P40-P47.agc:650
//		TS	MASSTMP		# COPYCYCLE FOR MASSBACK
// PORT: Fixed ROM slots 23032.
                    if slot <> 23032 or instruction <> 23466 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23466, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:651
//# Page 698
// PORT: SOURCE P40-P47.agc:652
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23033.
                    if slot <> 23033 or instruction <> 2810 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2810, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1343] to agcAotUnit1343@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:653
//		OCT	00003		# KILL GROUP 3 PROTECTION OF ENGINOFF, DO
// PORT: Fixed ROM slots 23034.
    23034, 6,
// PORT: SOURCE P40-P47.agc:654
//		OCT	40634		# A, 4.63 = DOSPSOFF (-0CS)
// PORT: Fixed ROM slots 23035.
    23035, 33592
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23036–23038.
function agcAotUnit1344 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23036 {
// PORT: SOURCE P40-P47.agc:655
//DOSPSOFF	TCR	SPSOFF		# SHUTDOWN SPS, MASS UPDATES, ETC.
// PORT: Fixed ROM slots 23036.
        if slot <> 23036 or instruction <> 1551 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1551, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23037 {
// PORT: SOURCE P40-P47.agc:656
//		CS	OCT27/24	# (OCTAL 27)
// PORT: Fixed ROM slots 23037.
            if slot <> 23037 or instruction <> 17687 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1303), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:657
//		TC	NEWPHASE
// PORT: Fixed ROM slots 23038.
            if slot <> 23038 or instruction <> 2124 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2124, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1344] to agcAotUnit1344@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:658
//		OCT	4		# 4.27 = DOTVCRCS (250 CS)
// PORT: Fixed ROM slots 23039.
    23039, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23040–23040.
function agcAotUnit1345 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:659
//
// PORT: SOURCE P40-P47.agc:660
//		TC	FIXDELAY	# 2.5 SECOND DELAY FOR SPS TAILOFF
// PORT: Fixed ROM slots 23040.
    if slot <> 23040 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1345] to agcAotUnit1345@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:661
//		DEC	250
// PORT: Fixed ROM slots 23041.
    23041, 500
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23042–23043.
function agcAotUnit1346 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23042 {
// PORT: SOURCE P40-P47.agc:662
//
// PORT: SOURCE P40-P47.agc:663
//DOTVCRCS	TCR	SETMAXDB	# WIDE DEADBAND FOR CUTOFF TRANSIENT
// PORT: Fixed ROM slots 23042.
        if slot <> 23042 or instruction <> 1232 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1232, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:664
//
// PORT: SOURCE P40-P47.agc:665
//		TC	IBNKCALL	# SET UP RCS DAP (KILLS TVCDAPS, SETS T5
// PORT: Fixed ROM slots 23043.
        if slot <> 23043 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1346] to agcAotUnit1346@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:666
//		CADR	RCSDAPON	#	BITS, WAITS 0.6SEC FOR TVCEXEC DIE)
// PORT: Fixed ROM slots 23044.
    23044, 34856
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23045–23045.
function agcAotUnit1347 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:667
//
// PORT: SOURCE P40-P47.agc:668
//		TC	IBNKCALL	# UPDATE WEIGHT/G AND MASS-PROPERTIES FOR
// PORT: Fixed ROM slots 23045.
    if slot <> 23045 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1347] to agcAotUnit1347@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:669
//		CADR	MASSPROP	#	RCS DAP STARTUP IN 0.6 SECONDS
// PORT: Fixed ROM slots 23046.
    23046, 11756
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23047–23048.
function agcAotUnit1348 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23047 {
// PORT: SOURCE P40-P47.agc:670
//
// PORT: SOURCE P40-P47.agc:671
//		TCR	TVCZAP		# WIPE OUT TVC, TURN OFF CLOKTASK
// PORT: Fixed ROM slots 23047.
        if slot <> 23047 or instruction <> 1593 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1593, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:672
//
// PORT: SOURCE P40-P47.agc:673
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23048.
        if slot <> 23048 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1348] to agcAotUnit1348@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:674
//		OCT	00354		# A, 4.35 = POSTBURN (NOVAC, PRIO12)
// PORT: Fixed ROM slots 23049.
    23049, 472
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23050–23051.
function agcAotUnit1349 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23050 {
// PORT: SOURCE P40-P47.agc:675
//		CAF	PRIO12		# SET UP POSTBURN V16N40 JOB
// PORT: Fixed ROM slots 23050.
        if slot <> 23050 or instruction <> 14792 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2504), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:676
//		TC	NOVAC
// PORT: Fixed ROM slots 23051.
        if slot <> 23051 or instruction <> 2652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1349] to agcAotUnit1349@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:677
//		EBANK=	DAPDATR1	# (SET MAXDB IN POST41)
// PORT: SOURCE P40-P47.agc:678
//		2CADR	POSTBURN
// PORT: Fixed ROM slots 23052 23053.
    23052, 2380, 23053, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23054–23087.
function agcAotUnit1350 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23070 {
        if slot <= 23061 {
            if slot <= 23057 {
                if slot <= 23055 {
                    if slot <= 23054 {
// PORT: SOURCE P40-P47.agc:679
//
// PORT: SOURCE P40-P47.agc:680
//		TCF	TASKOVER
// PORT: Fixed ROM slots 23054.
                        if slot <> 23054 or instruction <> 6868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6868, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:681
//
// PORT: SOURCE P40-P47.agc:682
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:683
//SPSOFF		EXTEND			# ESTABLISH SPSOFF TEVENT
// PORT: Fixed ROM slots 23055.
                        if slot <> 23055 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23056 {
// PORT: SOURCE P40-P47.agc:684
//		DCA	TIME2
// PORT: Fixed ROM slots 23056.
                        if slot <> 23056 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:685
//		DXCH	TEVENT
// PORT: Fixed ROM slots 23057.
                        if slot <> 23057 or instruction <> 22239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23059 {
                    if slot <= 23058 {
// PORT: SOURCE P40-P47.agc:686
//		CS	BIT7		# RESET ENGONFLG
// PORT: Fixed ROM slots 23058.
                        if slot <> 23058 or instruction <> 18953 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:687
//		MASK	FLAGWRD5
// PORT: Fixed ROM slots 23059.
                        if slot <> 23059 or instruction <> 28737 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23060 {
// PORT: SOURCE P40-P47.agc:688
//		TS	FLAGWRD5	# (RESTARTS WILL SHUT DOWN SPS NOW)
// PORT: Fixed ROM slots 23060.
                        if slot <> 23060 or instruction <> 22593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22593, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:689
//		CS	BIT13		# SHUT DOWN SPS ENGINE
// PORT: Fixed ROM slots 23061.
                        if slot <> 23061 or instruction <> 18947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23065 {
                if slot <= 23063 {
                    if slot <= 23062 {
// PORT: SOURCE P40-P47.agc:690
//		EXTEND
// PORT: Fixed ROM slots 23062.
                        if slot <> 23062 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:691
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 23063.
                        if slot <> 23063 or instruction <> 1545 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23064 {
// PORT: SOURCE P40-P47.agc:692
//
// PORT: SOURCE P40-P47.agc:693
//		CAF	BIT14		# ISSUE SIV CUTOFF COMMAND
// PORT: Fixed ROM slots 23064.
                        if slot <> 23064 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:694
//		EXTEND			# FOR POSSIBLE BACK-UP USE
// PORT: Fixed ROM slots 23065.
                        if slot <> 23065 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23067 {
                    if slot <= 23066 {
// PORT: SOURCE P40-P47.agc:695
//		WOR	CHAN12
// PORT: Fixed ROM slots 23066.
                        if slot <> 23066 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:696
//MASSBACK	CAE	V97VCNTR	# RESTORE PART OF PRE-DECREMENTED MASS
// PORT: Fixed ROM slots 23067.
                        if slot <> 23067 or instruction <> 13092 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 804).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23068 {
// PORT: SOURCE P40-P47.agc:697
//					#	V97CNTR = VCNTR UNLESS V97 IS
// PORT: SOURCE P40-P47.agc:698
//					#	ACTIVE.  ONLY V97CNTR IS THEN RIGHT.
// PORT: SOURCE P40-P47.agc:699
//		EXTEND			# VCNTR COUNTS 1/2-SECONDS IN TVC EXEC
// PORT: Fixed ROM slots 23068.
                        if slot <> 23068 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 23069 {
// PORT: SOURCE P40-P47.agc:700
//		MP	EMDOT		#	MDOT, SC.AT B+3 KG/CS
// PORT: Fixed ROM slots 23069.
                            if slot <> 23069 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 72, readEffective:call(words, 72)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:701
//		LXCH	A
// PORT: Fixed ROM slots 23070.
                            if slot <> 23070 or instruction <> 9216 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 23078 {
            if slot <= 23074 {
                if slot <= 23072 {
                    if slot <= 23071 {
// PORT: SOURCE P40-P47.agc:702
//# Page 699
// PORT: SOURCE P40-P47.agc:703
//		EXTEND
// PORT: Fixed ROM slots 23071.
                        if slot <> 23071 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:704
//		MP	1SEC		# DEC 100
// PORT: Fixed ROM slots 23072.
                        if slot <> 23072 or instruction <> 31265 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2593, readEffective:call(words, 2593)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23073 {
// PORT: SOURCE P40-P47.agc:705
//		AD	MASSTMP		# CORRECTION IS ACCURATE TO 5 CS OF FLOW
// PORT: Fixed ROM slots 23073.
                        if slot <> 23073 or instruction <> 25514 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 938).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:706
//		TS	CSMMASS		#	(1.44 KG OR 0.4 BITS)
// PORT: Fixed ROM slots 23074.
                        if slot <> 23074 or instruction <> 23356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23356, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23076 {
                    if slot <= 23075 {
// PORT: SOURCE P40-P47.agc:707
//
// PORT: SOURCE P40-P47.agc:708
//		CA	TVCPHASE	# CHECK IF OK FOR TRIM UPDATE
// PORT: Fixed ROM slots 23075.
                        if slot <> 23075 or instruction <> 13220 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:709
//		AD	ONE		#	THESE CHECKS ARE ONLY NEEDED
// PORT: Fixed ROM slots 23076.
                        if slot <> 23076 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                    if slot <= 23077 {
// PORT: SOURCE P40-P47.agc:710
//		EXTEND			#	FOR A LESS THAN 0.4 SEC BURN
// PORT: Fixed ROM slots 23077.
                        if slot <> 23077 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:711
//		BZF	BTRIMR		# NO.  INITIALIZATION NOT COMPLETE
// PORT: Fixed ROM slots 23078.
                        if slot <> 23078 or instruction <> 5679 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5679, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23082 {
                if slot <= 23080 {
                    if slot <= 23079 {
// PORT: SOURCE P40-P47.agc:712
//		CS	FLAGWRD6	# YES, CHECK IF TVC
// PORT: Fixed ROM slots 23079.
                        if slot <> 23079 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:713
//		MASK	OCT60000
// PORT: Fixed ROM slots 23080.
                        if slot <> 23080 or instruction <> 30789 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                            if fixedOperand = 24576 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 4) * 8192).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23081 {
// PORT: SOURCE P40-P47.agc:714
//		EXTEND
// PORT: Fixed ROM slots 23081.
                        if slot <> 23081 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:715
//		BZMF	BTRIMR		# NO, NOT TVC YET
// PORT: Fixed ROM slots 23082.
                        if slot <> 23082 or instruction <> 26159 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26159, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23084 {
                    if slot <= 23083 {
// PORT: SOURCE P40-P47.agc:716
//BESTTRIM	CAE	DELPBAR		# UPDATE TRIMS WITH DELFILTER VALUES
// PORT: Fixed ROM slots 23083.
                        if slot <> 23083 or instruction <> 13185 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 897).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:717
//		TS	PACTOFF
// PORT: Fixed ROM slots 23084.
                        if slot <> 23084 or instruction <> 23315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23315, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23085 {
// PORT: SOURCE P40-P47.agc:718
//		CAE	DELYBAR
// PORT: Fixed ROM slots 23085.
                        if slot <> 23085 or instruction <> 13187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 899).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 23086 {
// PORT: SOURCE P40-P47.agc:719
//		TS	YACTOFF
// PORT: Fixed ROM slots 23086.
                            if slot <> 23086 or instruction <> 23316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:720
//BTRIMR		TC	Q
// PORT: Fixed ROM slots 23087.
                            if slot <> 23087 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1350] to agcAotUnit1350@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:721
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:722
//STEERADS	2CADR	STEERING
// PORT: Fixed ROM slots 23088 23089.
    23088, 3338, 23089, 41068,
// PORT: SOURCE P40-P47.agc:723
//
// PORT: SOURCE P40-P47.agc:724
//.6SECT5		OCT	37703
// PORT: Fixed ROM slots 23090.
    23090, 32646,
// PORT: SOURCE P40-P47.agc:725
//5SECDP		DEC	0		# MAKE DP 5SEC
// PORT: Fixed ROM slots 23091.
    23091, 0,
// PORT: SOURCE P40-P47.agc:726
//5SEC		DEC	500
// PORT: Fixed ROM slots 23092.
    23092, 1000,
// PORT: SOURCE P40-P47.agc:727
//OCT02202	OCT	02202		# BITS 2, 8, 11 FOR CHANNEL 12 TVC/OPTICS
// PORT: Fixed ROM slots 23093.
    23093, 2308,
// PORT: SOURCE P40-P47.agc:728
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:729
//TVCON2C		2CADR	TVCDAPON
// PORT: Fixed ROM slots 23094 23095.
    23094, 2254, 23095, 30828
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23096–23107.
function agcAotUnit1351 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23101 {
        if slot <= 23098 {
            if slot <= 23096 {
// PORT: SOURCE P40-P47.agc:730
//
// PORT: SOURCE P40-P47.agc:731
//	-1	INHINT
// PORT: Fixed ROM slots 23096.
                if slot <> 23096 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23097 {
// PORT: SOURCE P40-P47.agc:732
//TVCZAP		CS	OCT02202	# DISABLE TVC AND OPT ERR CNTRLS, REENGAGE
// PORT: Fixed ROM slots 23097.
                    if slot <> 23097 or instruction <> 17973 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1589), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:733
//		EXTEND			#	OPTICS DAC
// PORT: Fixed ROM slots 23098.
                    if slot <> 23098 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23099 {
// PORT: SOURCE P40-P47.agc:734
//		WAND	CHAN12
// PORT: Fixed ROM slots 23099.
                if slot <> 23099 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23100 {
// PORT: SOURCE P40-P47.agc:735
//		CS	BIT1		# ENABLE T4RUPT OPTICS MONITOR .... PERMIT
// PORT: Fixed ROM slots 23100.
                    if slot <> 23100 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:736
//		TS	OPTIND		#	OPTICS-ZERO BUT NOT OPTICS-DRIVE
// PORT: Fixed ROM slots 23101.
                    if slot <> 23101 or instruction <> 23235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23235, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23104 {
            if slot <= 23102 {
// PORT: SOURCE P40-P47.agc:737
//		CAF	ZERO		# CLEAR NVWORD1 IN CASE CLOCKJOB WAITING
// PORT: Fixed ROM slots 23102.
                if slot <> 23102 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23103 {
// PORT: SOURCE P40-P47.agc:738
//		TS	NVWORD1
// PORT: Fixed ROM slots 23103.
                    if slot <> 23103 or instruction <> 23141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23141, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:739
//		CS	BIT11		# CLEAR TIMRFLAG TO STOP CLOKTASK
// PORT: Fixed ROM slots 23104.
                    if slot <> 23104 or instruction <> 18949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23105 {
// PORT: SOURCE P40-P47.agc:740
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 23105.
                if slot <> 23105 or instruction <> 28739 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23106 {
// PORT: SOURCE P40-P47.agc:741
//		TS	FLAGWRD7
// PORT: Fixed ROM slots 23106.
                    if slot <> 23106 or instruction <> 22595 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22595, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:742
//		TC	Q
// PORT: Fixed ROM slots 23107.
                    if slot <> 23107 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1351] to agcAotUnit1351@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:743
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:744
//UPDATEVG	STQ	BON
// PORT: Fixed ROM slots 23108.
    23108, 35872,
// PORT: SOURCE P40-P47.agc:745
//			QTEMP1
// PORT: Fixed ROM slots 23109.
    23109, 4016,
// PORT: SOURCE P40-P47.agc:746
//			XDELVFLG
// PORT: Fixed ROM slots 23110.
    23110, 1422,
// PORT: SOURCE P40-P47.agc:747
//			CALL40.8
// PORT: Fixed ROM slots 23111.
    23111, 42166,
// PORT: SOURCE P40-P47.agc:748
//
// PORT: SOURCE P40-P47.agc:749
//		SLOAD	BMN
// PORT: Fixed ROM slots 23112.
    23112, 41146,
// PORT: SOURCE P40-P47.agc:750
//			NBRCYCLS
// PORT: Fixed ROM slots 23113.
    23113, 3526,
// PORT: SOURCE P40-P47.agc:751
//			SETUP.9
// PORT: Fixed ROM slots 23114.
    23114, 42174,
// PORT: SOURCE P40-P47.agc:752
//# Page 700
// PORT: SOURCE P40-P47.agc:753
//
// PORT: SOURCE P40-P47.agc:754
//		VLOAD	VAD
// PORT: Fixed ROM slots 23115.
    23115, 44538,
// PORT: SOURCE P40-P47.agc:755
//			DELVSUM
// PORT: Fixed ROM slots 23116.
    23116, 3530,
// PORT: SOURCE P40-P47.agc:756
//			DELVREF
// PORT: Fixed ROM slots 23117.
    23117, 3638,
// PORT: SOURCE P40-P47.agc:757
//		STORE	DELVSUMP
// PORT: Fixed ROM slots 23118.
    23118, 3542,
// PORT: SOURCE P40-P47.agc:758
//		EXIT
// PORT: Fixed ROM slots 23119.
    23119, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23120–23123.
function agcAotUnit1352 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23121 {
        if slot <= 23120 {
// PORT: SOURCE P40-P47.agc:759
//		CA	ONE
// PORT: Fixed ROM slots 23120.
            if slot <> 23120 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:760
//		AD	NBRCYCLS
// PORT: Fixed ROM slots 23121.
            if slot <> 23121 or instruction <> 25570 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 994).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23122 {
// PORT: SOURCE P40-P47.agc:761
//		TS	NBRCYCLP
// PORT: Fixed ROM slots 23122.
            if slot <> 23122 or instruction <> 23523 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23523, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:762
//
// PORT: SOURCE P40-P47.agc:763
//		TC	PHASCHNG	# TYPE B RESTART RESTART BELOW AND 5.3 REREADACCS
// PORT: Fixed ROM slots 23123.
            if slot <> 23123 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1352] to agcAotUnit1352@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:764
//		OCT	10035
// PORT: Fixed ROM slots 23124.
    23124, 8250
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23125–23127.
function agcAotUnit1353 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23125 {
// PORT: SOURCE P40-P47.agc:765
//
// PORT: SOURCE P40-P47.agc:766
//		CA	NBRCYCLP
// PORT: Fixed ROM slots 23125.
        if slot <> 23125 or instruction <> 13283 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 995).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23126 {
// PORT: SOURCE P40-P47.agc:767
//		TS	NBRCYCLS
// PORT: Fixed ROM slots 23126.
            if slot <> 23126 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:768
//		TC	INTPRET
// PORT: Fixed ROM slots 23127.
            if slot <> 23127 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1353] to agcAotUnit1353@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:769
//		VLOAD
// PORT: Fixed ROM slots 23128.
    23128, 65530,
// PORT: SOURCE P40-P47.agc:770
//			DELVSUMP
// PORT: Fixed ROM slots 23129.
    23129, 3542,
// PORT: SOURCE P40-P47.agc:771
//		STORE	DELVSUM
// PORT: Fixed ROM slots 23130.
    23130, 3530,
// PORT: SOURCE P40-P47.agc:772
//
// PORT: SOURCE P40-P47.agc:773
//CALL40.8	CALL
// PORT: Fixed ROM slots 23131.
    23131, 65320,
// PORT: SOURCE P40-P47.agc:774
//			S40.8
// PORT: Fixed ROM slots 23132.
    23132, 28886,
// PORT: SOURCE P40-P47.agc:775
//		GOTO
// PORT: Fixed ROM slots 23133.
    23133, 65360,
// PORT: SOURCE P40-P47.agc:776
//			QTEMP1
// PORT: Fixed ROM slots 23134.
    23134, 4016,
// PORT: SOURCE P40-P47.agc:777
//
// PORT: SOURCE P40-P47.agc:778
//SETUP.9		BON	SLOAD
// PORT: Fixed ROM slots 23135.
    23135, 56600,
// PORT: SOURCE P40-P47.agc:779
//			FIRSTFLG
// PORT: Fixed ROM slots 23136.
    23136, 1424,
// PORT: SOURCE P40-P47.agc:780
//			SURELY.9
// PORT: Fixed ROM slots 23137.
    23137, 42200,
// PORT: SOURCE P40-P47.agc:781
//			NBRCYCLP
// PORT: Fixed ROM slots 23138.
    23138, 3528,
// PORT: SOURCE P40-P47.agc:782
//		NORM	VXSC		# (NORM HANDLES ZERO PROPERLY)
// PORT: Fixed ROM slots 23139.
    23139, 61826,
// PORT: SOURCE P40-P47.agc:783
//			X1
// PORT: Fixed ROM slots 23140.
    23140, 78,
// PORT: SOURCE P40-P47.agc:784
//			BDT
// PORT: Fixed ROM slots 23141.
    23141, 3978,
// PORT: SOURCE P40-P47.agc:785
//		VSR*	VAD
// PORT: Fixed ROM slots 23142.
    23142, 44382,
// PORT: SOURCE P40-P47.agc:786
//			0 -14D,1
// PORT: Fixed ROM slots 23143.
    23143, 17126,
// PORT: SOURCE P40-P47.agc:787
//			VGTEMP
// PORT: Fixed ROM slots 23144.
    23144, 3916,
// PORT: SOURCE P40-P47.agc:788
//		VSU
// PORT: Fixed ROM slots 23145.
    23145, 65362,
// PORT: SOURCE P40-P47.agc:789
//			DELVSUM
// PORT: Fixed ROM slots 23146.
    23146, 3530,
// PORT: SOURCE P40-P47.agc:790
//		STORE	VGPREV
// PORT: Fixed ROM slots 23147.
    23147, 4002,
// PORT: SOURCE P40-P47.agc:791
//SURELY.9	EXIT
// PORT: Fixed ROM slots 23148.
    23148, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23149–23150.
function agcAotUnit1354 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23149 {
// PORT: SOURCE P40-P47.agc:792
//		CAF	PRIO10
// PORT: Fixed ROM slots 23149.
        if slot <> 23149 or instruction <> 14851 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:793
//		TC	FINDVAC
// PORT: Fixed ROM slots 23150.
        if slot <> 23150 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1354] to agcAotUnit1354@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:794
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:795
//		2CADR	S40.9
// PORT: Fixed ROM slots 23151 23152.
    23151, 2436, 23152, 28780
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23153–23153.
function agcAotUnit1355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:796
//
// PORT: SOURCE P40-P47.agc:797
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23153.
    if slot <> 23153 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1355] to agcAotUnit1355@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:798
//		OCT	00051		# A, 1.5 = REDO40.9, PRIO 10
// PORT: Fixed ROM slots 23154.
    23154, 82,
// PORT: SOURCE P40-P47.agc:799
//		OCT	10035
// PORT: Fixed ROM slots 23155.
    23155, 8250
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23156–23156.
function agcAotUnit1356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:800
//		TC	INTPRET
// PORT: Fixed ROM slots 23156.
    if slot <> 23156 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1356] to agcAotUnit1356@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:801
//		VLOAD
// PORT: Fixed ROM slots 23157.
    23157, 65530,
// PORT: SOURCE P40-P47.agc:802
//			RN		# ACTIVE VEHICLE RADIUS VECTOR AT T1
// PORT: Fixed ROM slots 23158.
    23158, 1266,
// PORT: SOURCE P40-P47.agc:803
//		STOVL	RINIT
// PORT: Fixed ROM slots 23159.
    23159, 24304,
// PORT: SOURCE P40-P47.agc:804
//# Page 701
// PORT: SOURCE P40-P47.agc:805
//			VN		# ACTIVE VEHICLE VELOCITY VECTOR AT T1
// PORT: Fixed ROM slots 23160.
    23160, 1278,
// PORT: SOURCE P40-P47.agc:806
//		STODL	VINIT
// PORT: Fixed ROM slots 23161.
    23161, 16124,
// PORT: SOURCE P40-P47.agc:807
//			PIPTIME
// PORT: Fixed ROM slots 23162.
    23162, 1290,
// PORT: SOURCE P40-P47.agc:808
//		STORE	TNIT
// PORT: Fixed ROM slots 23163.
    23163, 3704,
// PORT: SOURCE P40-P47.agc:809
//		BDSU
// PORT: Fixed ROM slots 23164.
    23164, 65314,
// PORT: SOURCE P40-P47.agc:810
//			TPASS4
// PORT: Fixed ROM slots 23165.
    23165, 3932,
// PORT: SOURCE P40-P47.agc:811
//		STOVL	DELLT4
// PORT: Fixed ROM slots 23166.
    23166, 24102,
// PORT: SOURCE P40-P47.agc:812
//			HI6ZEROS
// PORT: Fixed ROM slots 23167.
    23167, 13754,
// PORT: SOURCE P40-P47.agc:813
//		STODL	DELVSUM
// PORT: Fixed ROM slots 23168.
    23168, 15818,
// PORT: SOURCE P40-P47.agc:814
//			HI6ZEROS
// PORT: Fixed ROM slots 23169.
    23169, 13754,
// PORT: SOURCE P40-P47.agc:815
//		STORE	NBRCYCLS
// PORT: Fixed ROM slots 23170.
    23170, 3526,
// PORT: SOURCE P40-P47.agc:816
//		GOTO
// PORT: Fixed ROM slots 23171.
    23171, 65360,
// PORT: SOURCE P40-P47.agc:817
//			CALL40.8
// PORT: Fixed ROM slots 23172.
    23172, 42166
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23173–23173.
function agcAotUnit1357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:818
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:819
//STEERING	TC	INTPRET
// PORT: Fixed ROM slots 23173.
    if slot <> 23173 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1357] to agcAotUnit1357@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:820
//		CALL
// PORT: Fixed ROM slots 23174.
    23174, 65320,
// PORT: SOURCE P40-P47.agc:821
//			UPDATEVG
// PORT: Fixed ROM slots 23175.
    23175, 42120,
// PORT: SOURCE P40-P47.agc:822
//		EXIT
// PORT: Fixed ROM slots 23176.
    23176, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23177–23181.
function agcAotUnit1358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23178 {
        if slot <= 23177 {
// PORT: SOURCE P40-P47.agc:823
//		CAF	BIT9		# CHECK IMPULSW
// PORT: Fixed ROM slots 23177.
            if slot <> 23177 or instruction <> 14855 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:824
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 23178.
            if slot <> 23178 or instruction <> 28734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 62).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23179 {
// PORT: SOURCE P40-P47.agc:825
//		CCS	A
// PORT: Fixed ROM slots 23179.
            if slot <> 23179 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23180 {
// PORT: SOURCE P40-P47.agc:826
//		TCF	+3		# PRE-IGNITE, REQUEST ENG-OFF, OR POST-OFF
// PORT: Fixed ROM slots 23180.
                if slot <> 23180 or instruction <> 5775 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5775, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:827
//SERVXT		TC	POSTJUMP
// PORT: Fixed ROM slots 23181.
                if slot <> 23181 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1358] to agcAotUnit1358@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:828
//		CADR	SERVEXIT
// PORT: Fixed ROM slots 23182.
    23182, 64814
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23183–23206.
function agcAotUnit1359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23194 {
        if slot <= 23188 {
            if slot <= 23185 {
                if slot <= 23183 {
// PORT: SOURCE P40-P47.agc:829
//		CAF	BIT13		# CHECK ENGINE-ON/-OFF
// PORT: Fixed ROM slots 23183.
                    if slot <> 23183 or instruction <> 14851 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23184 {
// PORT: SOURCE P40-P47.agc:830
//		EXTEND
// PORT: Fixed ROM slots 23184.
                        if slot <> 23184 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:831
//		RAND	DSALMOUT
// PORT: Fixed ROM slots 23185.
                        if slot <> 23185 or instruction <> 1033 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23186 {
// PORT: SOURCE P40-P47.agc:832
//		EXTEND
// PORT: Fixed ROM slots 23186.
                    if slot <> 23186 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23187 {
// PORT: SOURCE P40-P47.agc:833
//		BZF	SERVXT		# ENGINE-OFF, SO PRE-IGNITE OR POST-OFF
// PORT: Fixed ROM slots 23187.
                        if slot <> 23187 or instruction <> 5773 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5773, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:834
//		TCR	E7SETTER
// PORT: Fixed ROM slots 23188.
                        if slot <> 23188 or instruction <> 1782 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1782, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23191 {
                if slot <= 23189 {
// PORT: SOURCE P40-P47.agc:835
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:836
//		INHINT
// PORT: Fixed ROM slots 23189.
                    if slot <> 23189 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23190 {
// PORT: SOURCE P40-P47.agc:837
//		EXTEND
// PORT: Fixed ROM slots 23190.
                        if slot <> 23190 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:838
//		DCA	TIG
// PORT: Fixed ROM slots 23191.
                        if slot <> 23191 or instruction <> 13067 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 779, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23192 {
// PORT: SOURCE P40-P47.agc:839
//		DXCH	MPAC
// PORT: Fixed ROM slots 23192.
                    if slot <> 23192 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23193 {
// PORT: SOURCE P40-P47.agc:840
//		EXTEND
// PORT: Fixed ROM slots 23193.
                        if slot <> 23193 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:841
//		DCS	TIME2
// PORT: Fixed ROM slots 23194.
                        if slot <> 23194 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 23200 {
            if slot <= 23197 {
                if slot <= 23195 {
// PORT: SOURCE P40-P47.agc:842
//		DAS	MPAC
// PORT: Fixed ROM slots 23195.
                    if slot <> 23195 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23196 {
// PORT: SOURCE P40-P47.agc:843
//		TCR	DPAGREE
// PORT: Fixed ROM slots 23196.
                        if slot <> 23196 or instruction <> 3732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3732, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:844
//		CAE	MPAC +1		# (LESS THAN 6 (OR 4) SECONDS TO GO)
// PORT: Fixed ROM slots 23197.
                        if slot <> 23197 or instruction <> 12397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23198 {
// PORT: SOURCE P40-P47.agc:845
//		CCS	A		# PROTECT AGAINST NEG/ZRO W.L. CALL
// PORT: Fixed ROM slots 23198.
                    if slot <> 23198 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23199 {
// PORT: SOURCE P40-P47.agc:846
//		TCF	+3
// PORT: Fixed ROM slots 23199.
                        if slot <> 23199 or instruction <> 5794 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5794, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:847
//		TCF	+2
// PORT: Fixed ROM slots 23200.
                        if slot <> 23200 or instruction <> 5794 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5794, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23203 {
                if slot <= 23201 {
// PORT: SOURCE P40-P47.agc:848
//		CAF	ZERO
// PORT: Fixed ROM slots 23201.
                    if slot <> 23201 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23202 {
// PORT: SOURCE P40-P47.agc:849
//		AD	ONE
// PORT: Fixed ROM slots 23202.
                        if slot <> 23202 or instruction <> 27151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:850
//		XCH	L
// PORT: Fixed ROM slots 23203.
                        if slot <> 23203 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23204 {
// PORT: SOURCE P40-P47.agc:851
//		CA	ZERO
// PORT: Fixed ROM slots 23204.
                    if slot <> 23204 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23205 {
// PORT: SOURCE P40-P47.agc:852
//		DXCH	TGO
// PORT: Fixed ROM slots 23205.
                        if slot <> 23205 or instruction <> 22296 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 792, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:853
//		CA	TGO +1
// PORT: Fixed ROM slots 23206.
                        if slot <> 23206 or instruction <> 13080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 792).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1359] to agcAotUnit1359@.

// PORT: Physical bank 24. Shared continuation entries, slots 23207–23207.
function agcAotUnit1360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:854
//		TC	WAITLIST
// PORT: Fixed ROM slots 23207.
    if slot <> 23207 or instruction <> 2725 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2725, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1360] to agcAotUnit1360@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:855
//# Page 702
// PORT: SOURCE P40-P47.agc:856
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:857
//		2CADR	ENGINOFF
// PORT: Fixed ROM slots 23208 23209.
    23208, 3052, 23209, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23210–23210.
function agcAotUnit1361 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:858
//
// PORT: SOURCE P40-P47.agc:859
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23210.
    if slot <> 23210 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1361] to agcAotUnit1361@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:860
//		OCT	40153		# A, 3.15 = ENGINOFF (TGO+1) .... NOTE GROUP
// PORT: Fixed ROM slots 23211.
    23211, 32982,
// PORT: SOURCE P40-P47.agc:861
//		OCT	10035		# B, 5.3 = REREADAC, AND START BELOW
// PORT: Fixed ROM slots 23212.
    23212, 8250
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23213–23213.
function agcAotUnit1362 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:862
//		TC	DOWNFLAG	# CLEAR IMPULSW, ENGINOFF IS NOW SET UP
// PORT: Fixed ROM slots 23213.
    if slot <> 23213 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1362] to agcAotUnit1362@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:863
//		ADRES	IMPULSW		# RESTARTS OK
// PORT: Fixed ROM slots 23214.
    23214, 72
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23215–23220.
function agcAotUnit1363 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23217 {
        if slot <= 23215 {
// PORT: SOURCE P40-P47.agc:864
//		TCF	SERVXT
// PORT: Fixed ROM slots 23215.
            if slot <> 23215 or instruction <> 5773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23216 {
// PORT: SOURCE P40-P47.agc:865
//
// PORT: SOURCE P40-P47.agc:866
//# Page 703
// PORT: SOURCE P40-P47.agc:867
//# ROUTINE ** CLOKTASK ** DESCRIPTION
// PORT: SOURCE P40-P47.agc:868
//
// PORT: SOURCE P40-P47.agc:869
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:870
//CLOKTASK	CAF	BIT11		# IS TIMRFLAG SET
// PORT: Fixed ROM slots 23216.
                if slot <> 23216 or instruction <> 14853 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:871
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 23217.
                if slot <> 23217 or instruction <> 28739 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23218 {
// PORT: SOURCE P40-P47.agc:872
//		CCS	A
// PORT: Fixed ROM slots 23218.
            if slot <> 23218 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23219 {
// PORT: SOURCE P40-P47.agc:873
//		TCF	CLOCKON
// PORT: Fixed ROM slots 23219.
                if slot <> 23219 or instruction <> 5815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5815, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:874
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23220.
                if slot <> 23220 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1363] to agcAotUnit1363@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:875
//		OCT	00006		# KILL RESTART
// PORT: Fixed ROM slots 23221.
    23221, 12
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23222–23230.
function agcAotUnit1364 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23225 {
        if slot <= 23223 {
            if slot <= 23222 {
// PORT: SOURCE P40-P47.agc:876
//		TC	TASKOVER
// PORT: Fixed ROM slots 23222.
                if slot <> 23222 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:877
//
// PORT: SOURCE P40-P47.agc:878
//CLOCKON		EXTEND
// PORT: Fixed ROM slots 23223.
                if slot <> 23223 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23224 {
// PORT: SOURCE P40-P47.agc:879
//		DCA	TIME2
// PORT: Fixed ROM slots 23224.
                if slot <> 23224 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:880
//		DXCH	TTOGO
// PORT: Fixed ROM slots 23225.
                if slot <> 23225 or instruction <> 22449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 945, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23227 {
            if slot <= 23226 {
// PORT: SOURCE P40-P47.agc:881
//		EXTEND
// PORT: Fixed ROM slots 23226.
                if slot <> 23226 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:882
//		DCS	TIG
// PORT: Fixed ROM slots 23227.
                if slot <> 23227 or instruction <> 17163 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 779, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23228 {
// PORT: SOURCE P40-P47.agc:883
//		DAS	TTOGO
// PORT: Fixed ROM slots 23228.
                if slot <> 23228 or instruction <> 9137 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 945) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23229 {
// PORT: SOURCE P40-P47.agc:884
//
// PORT: SOURCE P40-P47.agc:885
//SETCLOCK	CAF	1SEC
// PORT: Fixed ROM slots 23229.
                    if slot <> 23229 or instruction <> 14881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:886
//		TC	WAITLIST
// PORT: Fixed ROM slots 23230.
                    if slot <> 23230 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1364] to agcAotUnit1364@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:887
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:888
//		2CADR	CLOKTASK
// PORT: Fixed ROM slots 23231 23232.
    23231, 3424, 23232, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23233–23242.
function agcAotUnit1365 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23237 {
        if slot <= 23234 {
            if slot <= 23233 {
// PORT: SOURCE P40-P47.agc:889
//
// PORT: SOURCE P40-P47.agc:890
//		CCS	NVWORD1
// PORT: Fixed ROM slots 23233.
                if slot <> 23233 or instruction <> 4709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:891
//		TCF	+3
// PORT: Fixed ROM slots 23234.
                if slot <> 23234 or instruction <> 5829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5829, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23235 {
// PORT: SOURCE P40-P47.agc:892
//		TCF	SETTB6
// PORT: Fixed ROM slots 23235.
                if slot <> 23235 or instruction <> 5837 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5837, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23236 {
// PORT: SOURCE P40-P47.agc:893
//
// PORT: SOURCE P40-P47.agc:894
//		TCF	+1
// PORT: Fixed ROM slots 23236.
                    if slot <> 23236 or instruction <> 5829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5829, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:895
//		CS	V06N85B		# CHECK FOR V06N85B (P41)
// PORT: Fixed ROM slots 23237.
                    if slot <> 23237 or instruction <> 17683 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1299), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23239 {
            if slot <= 23238 {
// PORT: SOURCE P40-P47.agc:896
//		AD	NVWORD1
// PORT: Fixed ROM slots 23238.
                if slot <> 23238 or instruction <> 25189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:897
//		EXTEND
// PORT: Fixed ROM slots 23239.
                if slot <> 23239 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23240 {
// PORT: SOURCE P40-P47.agc:898
//		BZF	SETUPDYN	# V06N85, SO UPDATE N85 FOR DYNAMIC DISP
// PORT: Fixed ROM slots 23240.
                if slot <> 23240 or instruction <> 5840 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23241 {
// PORT: SOURCE P40-P47.agc:899
//
// PORT: SOURCE P40-P47.agc:900
//		CAF	PRIO27
// PORT: Fixed ROM slots 23241.
                    if slot <> 23241 or instruction <> 16308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4020), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:901
//		TC	NOVAC
// PORT: Fixed ROM slots 23242.
                    if slot <> 23242 or instruction <> 2652 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1365] to agcAotUnit1365@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:902
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:903
//		2CADR	CLOCKJOB
// PORT: Fixed ROM slots 23243 23244.
    23243, 3508, 23244, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23245–23249.
function agcAotUnit1366 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23246 {
        if slot <= 23245 {
// PORT: SOURCE P40-P47.agc:904
//
// PORT: SOURCE P40-P47.agc:905
//SETTB6		CS	TIME1		# SET GROUP6 TIMEBASE
// PORT: Fixed ROM slots 23245.
            if slot <> 23245 or instruction <> 16405 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 21).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:906
//		TS	TBASE6
// PORT: Fixed ROM slots 23246.
            if slot <> 23246 or instruction <> 23093 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23093, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23247 {
// PORT: SOURCE P40-P47.agc:907
//		TCF	TASKOVER
// PORT: Fixed ROM slots 23247.
            if slot <> 23247 or instruction <> 6868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23248 {
// PORT: SOURCE P40-P47.agc:908
//
// PORT: SOURCE P40-P47.agc:909
//SETUPDYN	CAF	PRIO27		# SET UP A JOB TO UPDATE N85 (FOR P41=V06)
// PORT: Fixed ROM slots 23248.
                if slot <> 23248 or instruction <> 16308 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4020), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:910
//		TC	FINDVAC
// PORT: Fixed ROM slots 23249.
                if slot <> 23249 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1366] to agcAotUnit1366@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:911
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:912
//		2CADR	DYNDISP
// PORT: Fixed ROM slots 23250 23251.
    23250, 3498, 23251, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23252–23253.
function agcAotUnit1367 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23252 {
// PORT: SOURCE P40-P47.agc:913
//
// PORT: SOURCE P40-P47.agc:914
//		TCF	SETTB6		# CLOSE OUT CLOCKTASK
// PORT: Fixed ROM slots 23252.
        if slot <> 23252 or instruction <> 5837 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5837, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:915
//# Page 704
// PORT: SOURCE P40-P47.agc:916
//DYNDISP		TC	INTPRET		# UPDATE N85 FOR A DYNAMIC V06N85 IN P41.
// PORT: Fixed ROM slots 23253.
        if slot <> 23253 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1367] to agcAotUnit1367@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:917
//		CALL			#	PRIOR TO BLANKING AND AVEG (V16N85)
// PORT: Fixed ROM slots 23254.
    23254, 65320,
// PORT: SOURCE P40-P47.agc:918
//			P40CNV85
// PORT: Fixed ROM slots 23255.
    23255, 41456,
// PORT: SOURCE P40-P47.agc:919
//		EXIT
// PORT: Fixed ROM slots 23256.
    23256, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23257–23264.
function agcAotUnit1368 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23260 {
        if slot <= 23258 {
            if slot <= 23257 {
// PORT: SOURCE P40-P47.agc:920
//		TCF	CKNVWRD1
// PORT: Fixed ROM slots 23257.
                if slot <> 23257 or instruction <> 5858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5858, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:921
//
// PORT: SOURCE P40-P47.agc:922
//# Page 705
// PORT: SOURCE P40-P47.agc:923
//# ROUTINE ** CLOCKJOB ** DESCRIPTION
// PORT: SOURCE P40-P47.agc:924
//
// PORT: SOURCE P40-P47.agc:925
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:926
//CLOCKJOB	CA	CDUX
// PORT: Fixed ROM slots 23258.
                if slot <> 23258 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23259 {
// PORT: SOURCE P40-P47.agc:927
//		TS	CDUSPOTX
// PORT: Fixed ROM slots 23259.
                if slot <> 23259 or instruction <> 23034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:928
//		CA	CDUY
// PORT: Fixed ROM slots 23260.
                if slot <> 23260 or instruction <> 12315 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 27).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23262 {
            if slot <= 23261 {
// PORT: SOURCE P40-P47.agc:929
//		TS	CDUSPOTY
// PORT: Fixed ROM slots 23261.
                if slot <> 23261 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:930
//		CA	CDUZ
// PORT: Fixed ROM slots 23262.
                if slot <> 23262 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23263 {
// PORT: SOURCE P40-P47.agc:931
//		TS	CDUSPOTZ
// PORT: Fixed ROM slots 23263.
                if slot <> 23263 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:932
//		TC	BANKCALL
// PORT: Fixed ROM slots 23264.
                if slot <> 23264 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1368] to agcAotUnit1368@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:933
//		CADR	QUICTRIG
// PORT: Fixed ROM slots 23265.
    23265, 40666
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23266–23272.
function agcAotUnit1369 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23268 {
        if slot <= 23266 {
// PORT: SOURCE P40-P47.agc:934
//CKNVWRD1	INHINT
// PORT: Fixed ROM slots 23266.
            if slot <> 23266 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23267 {
// PORT: SOURCE P40-P47.agc:935
//		CCS	NVWORD1		# DETERMINE FUNCTION, INDICATED BY NVWORD1
// PORT: Fixed ROM slots 23267.
                if slot <> 23267 or instruction <> 4709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:936
//		TCF	NOFLASH
// PORT: Fixed ROM slots 23268.
                if slot <> 23268 or instruction <> 5875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23270 {
            if slot <= 23269 {
// PORT: SOURCE P40-P47.agc:937
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 23269.
                if slot <> 23269 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:938
//		TCF	ENGREQST	# SPS ENGINE-ON-ENABLE V99 FLASH
// PORT: Fixed ROM slots 23270.
                if slot <> 23270 or instruction <> 5869 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5869, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23271 {
// PORT: SOURCE P40-P47.agc:939
//FAILDSP		CAF	V06N40		# SPS ENGINE-FAILED V97 FLASH
// PORT: Fixed ROM slots 23271.
                if slot <> 23271 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:940
//		TC	BANKCALL
// PORT: Fixed ROM slots 23272.
                if slot <> 23272 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1369] to agcAotUnit1369@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:941
//		CADR	CLOCPLAY
// PORT: Fixed ROM slots 23273.
    23273, 17306
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23274–23278.
function agcAotUnit1370 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23275 {
        if slot <= 23274 {
// PORT: SOURCE P40-P47.agc:942
//		TCF	V97T		# TERMINATE
// PORT: Fixed ROM slots 23274.
            if slot <> 23274 or instruction <> 5914 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5914, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:943
//		TCF	V97P		# PROCEED
// PORT: Fixed ROM slots 23275.
            if slot <> 23275 or instruction <> 5941 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5941, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23276 {
// PORT: SOURCE P40-P47.agc:944
//		TCF	V97E		# ENTER
// PORT: Fixed ROM slots 23276.
            if slot <> 23276 or instruction <> 5964 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5964, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23277 {
// PORT: SOURCE P40-P47.agc:945
//
// PORT: SOURCE P40-P47.agc:946
//ENGREQST	CAF	V06N40
// PORT: Fixed ROM slots 23277.
                if slot <> 23277 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:947
//		TC	BANKCALL
// PORT: Fixed ROM slots 23278.
                if slot <> 23278 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1370] to agcAotUnit1370@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:948
//		CADR	CLOCPLAY	# LINUS MAKES IT A REDO, INHINT OK
// PORT: Fixed ROM slots 23279.
    23279, 17306
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23280–23284.
function agcAotUnit1371 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23281 {
        if slot <= 23280 {
// PORT: SOURCE P40-P47.agc:949
//		TCF	V99T		# TERMINATE
// PORT: Fixed ROM slots 23280.
            if slot <> 23280 or instruction <> 5890 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5890, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:950
//		TCF	V99P		# PROCEED
// PORT: Fixed ROM slots 23281.
            if slot <> 23281 or instruction <> 5896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5896, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23282 {
// PORT: SOURCE P40-P47.agc:951
//		TCF	V99E		# ENTER
// PORT: Fixed ROM slots 23282.
            if slot <> 23282 or instruction <> 5884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23283 {
// PORT: SOURCE P40-P47.agc:952
//
// PORT: SOURCE P40-P47.agc:953
//NOFLASH		CAE	NVWORD1		# DISPLAY NVWORD1 NORMALLY
// PORT: Fixed ROM slots 23283.
                if slot <> 23283 or instruction <> 12901 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:954
//		TC	BANKCALL
// PORT: Fixed ROM slots 23284.
                if slot <> 23284 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1371] to agcAotUnit1371@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:955
//		CADR	REGODSP
// PORT: Fixed ROM slots 23285.
    23285, 17294
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23286–23292.
function agcAotUnit1372 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23288 {
        if slot <= 23286 {
// PORT: SOURCE P40-P47.agc:956
//
// PORT: SOURCE P40-P47.agc:957
//E7SETTER	CAF	EBANK7
// PORT: Fixed ROM slots 23286.
            if slot <> 23286 or instruction <> 14896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23287 {
// PORT: SOURCE P40-P47.agc:958
//		TS	EBANK
// PORT: Fixed ROM slots 23287.
                if slot <> 23287 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:959
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:960
//		TC	Q
// PORT: Fixed ROM slots 23288.
                if slot <> 23288 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23290 {
            if slot <= 23289 {
// PORT: SOURCE P40-P47.agc:961
//
// PORT: SOURCE P40-P47.agc:962
//E6SETTER	CAF	EBANK6		# SET UP EBANK6
// PORT: Fixed ROM slots 23289.
                if slot <> 23289 or instruction <> 14895 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:963
//		TS	EBANK
// PORT: Fixed ROM slots 23290.
                if slot <> 23290 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23291 {
// PORT: SOURCE P40-P47.agc:964
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:965
//		TC	Q
// PORT: Fixed ROM slots 23291.
                if slot <> 23291 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:966
//
// PORT: SOURCE P40-P47.agc:967
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:968
//V99E		TC	2PHSCHNG
// PORT: Fixed ROM slots 23292.
                if slot <> 23292 or instruction <> 2810 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2810, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1372] to agcAotUnit1372@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:969
//		OCT	00006		# KILL PRE40.6/CLOKTASK PROTECTION
// PORT: Fixed ROM slots 23293.
    23293, 12,
// PORT: SOURCE P40-P47.agc:970
//		OCT	05024		# C, PRIORITY NEXT, JOB BELOW
// PORT: Fixed ROM slots 23294.
    23294, 5160,
// PORT: SOURCE P40-P47.agc:971
//# Page 706
// PORT: SOURCE P40-P47.agc:972
//		OCT	27000
// PORT: Fixed ROM slots 23295.
    23295, 23552
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23296–23298.
function agcAotUnit1373 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23296 {
// PORT: SOURCE P40-P47.agc:973
//V99EJOB		TCR	TVCZAP -1	# WIPE OUT TVC, CLOKTASK
// PORT: Fixed ROM slots 23296.
        if slot <> 23296 or instruction <> 1592 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1592, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23297 {
// PORT: SOURCE P40-P47.agc:974
//		TCF	P40RCS		# V16N85 POST-BURN OPERATIONS
// PORT: Fixed ROM slots 23297.
            if slot <> 23297 or instruction <> 5292 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5292, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:975
//
// PORT: SOURCE P40-P47.agc:976
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:977
//V99T		TC	2PHSCHNG	# (ENTRY FROM V97T FLOW TOO)
// PORT: Fixed ROM slots 23298.
            if slot <> 23298 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1373] to agcAotUnit1373@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:978
//		OCT	00006		# KILL PRE40.6/CLOKTASK PROTECTION
// PORT: Fixed ROM slots 23299.
    23299, 12,
// PORT: SOURCE P40-P47.agc:979
//		OCT	05024		# C, PRIORITY NEXT, JOB BELOW
// PORT: Fixed ROM slots 23300.
    23300, 5160,
// PORT: SOURCE P40-P47.agc:980
//		OCT	27000
// PORT: Fixed ROM slots 23301.
    23301, 23552
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23302–23316.
function agcAotUnit1374 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23308 {
        if slot <= 23304 {
            if slot <= 23302 {
// PORT: SOURCE P40-P47.agc:981
//V99TJOB		TCR	TVCZAP -1	# WIPE OUT TVC, CLOKTASK
// PORT: Fixed ROM slots 23302.
                if slot <> 23302 or instruction <> 1592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23303 {
// PORT: SOURCE P40-P47.agc:982
//		TCF	POST41		# AVEGEXIT, SETMAXDB, GOTOPOOH
// PORT: Fixed ROM slots 23303.
                    if slot <> 23303 or instruction <> 5309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5309, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:983
//
// PORT: SOURCE P40-P47.agc:984
//V99P		INHINT
// PORT: Fixed ROM slots 23304.
                    if slot <> 23304 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23306 {
                if slot <= 23305 {
// PORT: SOURCE P40-P47.agc:985
//		CAE	FLAGWRD7	# CHECK ASTN FLAG FOR PRIOR V99P
// PORT: Fixed ROM slots 23305.
                    if slot <> 23305 or instruction <> 12355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:986
//		MASK	BIT12
// PORT: Fixed ROM slots 23306.
                    if slot <> 23306 or instruction <> 31236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2564), 32768).
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
                if slot <= 23307 {
// PORT: SOURCE P40-P47.agc:987
//		CCS	A
// PORT: Fixed ROM slots 23307.
                    if slot <> 23307 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:988
//		TCF	V99P/TIG	# YES, THIS MUST BE A RESTART ENTRY
// PORT: Fixed ROM slots 23308.
                    if slot <> 23308 or instruction <> 5911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5911, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23312 {
            if slot <= 23310 {
                if slot <= 23309 {
// PORT: SOURCE P40-P47.agc:989
//
// PORT: SOURCE P40-P47.agc:990
//ASTNV99P	CAF	BIT12		# SET ASTN FLAG
// PORT: Fixed ROM slots 23309.
                    if slot <> 23309 or instruction <> 14852 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:991
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 23310.
                    if slot <> 23310 or instruction <> 11331 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23311 {
// PORT: SOURCE P40-P47.agc:992
//		CAE	FLAGWRD7	# CHECK IGN FLAG FOR TIG-0 ARRIVAL
// PORT: Fixed ROM slots 23311.
                    if slot <> 23311 or instruction <> 12355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:993
//		MASK	BIT13
// PORT: Fixed ROM slots 23312.
                    if slot <> 23312 or instruction <> 31235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        if fixedOperand = 4096 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23314 {
                if slot <= 23313 {
// PORT: SOURCE P40-P47.agc:994
//		EXTEND
// PORT: Fixed ROM slots 23313.
                    if slot <> 23313 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:995
//		BZF	V99P/TIG	# NO, CLEAR THE V99 AND WAIT FOR TIG-0
// PORT: Fixed ROM slots 23314.
                    if slot <> 23314 or instruction <> 5911 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5911, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23315 {
// PORT: SOURCE P40-P47.agc:996
//
// PORT: SOURCE P40-P47.agc:997
//ENDV99PI	CAF	BIT1		# TIG-0 HAS COME ALREADY
// PORT: Fixed ROM slots 23315.
                    if slot <> 23315 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:998
//		TC	WAITLIST	# SET UP IGNITION HERE
// PORT: Fixed ROM slots 23316.
                    if slot <> 23316 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1374] to agcAotUnit1374@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:999
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:1000
//		2CADR	IGNITION
// PORT: Fixed ROM slots 23317 23318.
    23317, 2858, 23318, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23319–23322.
function agcAotUnit1375 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23320 {
        if slot <= 23319 {
// PORT: SOURCE P40-P47.agc:1001
//
// PORT: SOURCE P40-P47.agc:1002
//V99P/TIG	CAF	V06N40		# CLEAR THE V99 FLASH AND WAIT FOR TIG-0
// PORT: Fixed ROM slots 23319.
            if slot <> 23319 or instruction <> 13589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1003
//		TS	NVWORD1
// PORT: Fixed ROM slots 23320.
            if slot <> 23320 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23321 {
// PORT: SOURCE P40-P47.agc:1004
//ENDV99P		TCF	ENDOFJOB
// PORT: Fixed ROM slots 23321.
            if slot <> 23321 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1005
//
// PORT: SOURCE P40-P47.agc:1006
//		EBANK=	CSMMASS
// PORT: SOURCE P40-P47.agc:1007
//V97T		TC	2PHSCHNG
// PORT: Fixed ROM slots 23322.
            if slot <> 23322 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1375] to agcAotUnit1375@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1008
//		OCT	00006		# KILL GROUP 6 (CLOKTASK)
// PORT: Fixed ROM slots 23323.
    23323, 12,
// PORT: SOURCE P40-P47.agc:1009
//		OCT	40674		# A, 4.67 = V97TTASK (-0 CS), TBASE NOW
// PORT: Fixed ROM slots 23324.
    23324, 33656
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23325–23326.
function agcAotUnit1376 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23325 {
// PORT: SOURCE P40-P47.agc:1010
//		CAF	BIT1
// PORT: Fixed ROM slots 23325.
        if slot <> 23325 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1011
//		TC	TWIDDLE
// PORT: Fixed ROM slots 23326.
        if slot <> 23326 or instruction <> 2717 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2717, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1376] to agcAotUnit1376@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1012
//		ADRES	V97TTASK	# KEEP EBANK6 FOR MASSES, SPSOFF, ETC.
// PORT: Fixed ROM slots 23327.
    23327, 3650
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23328–23334.
function agcAotUnit1377 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23330 {
        if slot <= 23328 {
// PORT: SOURCE P40-P47.agc:1013
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 23328.
            if slot <> 23328 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23329 {
// PORT: SOURCE P40-P47.agc:1014
//
// PORT: SOURCE P40-P47.agc:1015
//		EBANK=	CSMMASS
// PORT: SOURCE P40-P47.agc:1016
//V97TTASK	CAF	ZERO		# DISABLE CLOCKJOB
// PORT: Fixed ROM slots 23329.
                if slot <> 23329 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1017
//		TS	NVWORD1
// PORT: Fixed ROM slots 23330.
                if slot <> 23330 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23332 {
            if slot <= 23331 {
// PORT: SOURCE P40-P47.agc:1018
//		CAF	3MDOT		# 3 SECONDS OF MDOT (2-4 SEC ENGFAIL
// PORT: Fixed ROM slots 23331.
                if slot <> 23331 or instruction <> 13596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1308), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1019
//		AD	CSMMASS		#	DETECTION) NOT LOST BECAUSE THRUST
// PORT: Fixed ROM slots 23332.
                if slot <> 23332 or instruction <> 25404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23333 {
// PORT: SOURCE P40-P47.agc:1020
//		TS	MASSTMP		#	FAILED.  COPYCYCLE FOR MASSBACK
// PORT: Fixed ROM slots 23333.
                if slot <> 23333 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1021
//# Page 707
// PORT: SOURCE P40-P47.agc:1022
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23334.
                if slot <> 23334 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1377] to agcAotUnit1377@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1023
//		OCT	05014		# C, DELTAT NEXT, TASK BELOW, IN
// PORT: Fixed ROM slots 23335.
    23335, 5144,
// PORT: SOURCE P40-P47.agc:1024
//		DEC	-0		# -0 CS
// PORT: Fixed ROM slots 23336.
    23336, 65534
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23337–23338.
function agcAotUnit1378 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23337 {
// PORT: SOURCE P40-P47.agc:1025
//
// PORT: SOURCE P40-P47.agc:1026
//		TCR	SPSOFF		# SHUTDOWN SPS ENGINE, MASS UPDATE, ETC.
// PORT: Fixed ROM slots 23337.
        if slot <> 23337 or instruction <> 1551 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1551, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1027
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23338.
        if slot <> 23338 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1378] to agcAotUnit1378@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1028
//		OCT	00714		# A, 4.71 = V97TRCS (250 CS), TBASE OLD
// PORT: Fixed ROM slots 23339.
    23339, 920
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23340–23340.
function agcAotUnit1379 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1029
//		TC	FIXDELAY	# DELAY 2.5 SECONDS FOR (POSSIBLE) TAIL-
// PORT: Fixed ROM slots 23340.
    if slot <> 23340 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1379] to agcAotUnit1379@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1030
//		DEC	250		#	OFF (FALSE THRUST-LOSS)
// PORT: Fixed ROM slots 23341.
    23341, 500
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23342–23342.
function agcAotUnit1380 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1031
//
// PORT: SOURCE P40-P47.agc:1032
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:1033
//V97TRCS		TC	IBNKCALL	# RCS DAP IN 0.6SEC, SETTING T5 BITS TO
// PORT: Fixed ROM slots 23342.
    if slot <> 23342 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1380] to agcAotUnit1380@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1034
//		CADR	RCSDAPON	#	KILL TVCEXEC/TVCROLLDAP STARTS
// PORT: Fixed ROM slots 23343.
    23343, 34856
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23344–23345.
function agcAotUnit1381 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23344 {
// PORT: SOURCE P40-P47.agc:1035
//		CAF	PRIO27		# SET UP V99T FOR TVCZAP AND POST41 (SET-
// PORT: Fixed ROM slots 23344.
        if slot <> 23344 or instruction <> 16308 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4020), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1036
//		TC	NOVAC		#	MAXDB AND GOTOPOOH)
// PORT: Fixed ROM slots 23345.
        if slot <> 23345 or instruction <> 2652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1381] to agcAotUnit1381@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1037
//		EBANK=	DAPDATR1	# EBANK6 FOR SETMAXDB IN POST41
// PORT: SOURCE P40-P47.agc:1038
//		2CADR	V99T
// PORT: Fixed ROM slots 23346 23347.
    23346, 3588, 23347, 41068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23348–23349.
function agcAotUnit1382 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23348 {
// PORT: SOURCE P40-P47.agc:1039
//
// PORT: SOURCE P40-P47.agc:1040
//ENDV97T		TCF	TASKOVER
// PORT: Fixed ROM slots 23348.
        if slot <> 23348 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1041
//
// PORT: SOURCE P40-P47.agc:1042
//		EBANK=	V97VCNTR
// PORT: SOURCE P40-P47.agc:1043
//V97P		TC	PHASCHNG
// PORT: Fixed ROM slots 23349.
        if slot <> 23349 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1382] to agcAotUnit1382@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1044
//		OCT	40734		# A, 4.73 = V97PTASK (-0 CS), TBASE NOW
// PORT: Fixed ROM slots 23350.
    23350, 33720
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23351–23352.
function agcAotUnit1383 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23351 {
// PORT: SOURCE P40-P47.agc:1045
//		CAF	BIT1
// PORT: Fixed ROM slots 23351.
        if slot <> 23351 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1046
//		TC	TWIDDLE
// PORT: Fixed ROM slots 23352.
        if slot <> 23352 or instruction <> 2717 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2717, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1383] to agcAotUnit1383@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1047
//		ADRES	V97PTASK
// PORT: Fixed ROM slots 23353.
    23353, 3702
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23354–23359.
function agcAotUnit1384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23356 {
        if slot <= 23354 {
// PORT: SOURCE P40-P47.agc:1048
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 23354.
            if slot <> 23354 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23355 {
// PORT: SOURCE P40-P47.agc:1049
//
// PORT: SOURCE P40-P47.agc:1050
//		EBANK=	V97VCNTR
// PORT: SOURCE P40-P47.agc:1051
//V97PTASK	CAE	V97VCNTR	# GET MASS UPDATES (TVCEXEC) GOING AGAIN
// PORT: Fixed ROM slots 23355.
                if slot <> 23355 or instruction <> 13092 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 804).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1052
//		TS	VCNTR		#	(ERRORS IF FLASE THRUST-LOSS AND/OR
// PORT: Fixed ROM slots 23356.
                if slot <> 23356 or instruction <> 23459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23357 {
// PORT: SOURCE P40-P47.agc:1053
//					#	POOR SYNC OF MANUAL ENGINE-ON AND
// PORT: SOURCE P40-P47.agc:1054
//					#	THE VERB 97 PROCEED)
// PORT: SOURCE P40-P47.agc:1055
//		CAF	V06N40		# REDISPLAY V06N40
// PORT: Fixed ROM slots 23357.
            if slot <> 23357 or instruction <> 13589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23358 {
// PORT: SOURCE P40-P47.agc:1056
//		TS	NVWORD1
// PORT: Fixed ROM slots 23358.
                if slot <> 23358 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1057
//		TC	UPFLAG		# SET IDLEFAIL TO ALLOW R41-BYPASS, IN
// PORT: Fixed ROM slots 23359.
                if slot <> 23359 or instruction <> 2918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2918, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1384] to agcAotUnit1384@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1058
//		ADRES	IDLEFAIL	#	CASE OF UNFAVORABLE S40.8 SYNCH
// PORT: Fixed ROM slots 23360.
    23360, 48
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23361–23361.
function agcAotUnit1385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1059
//		TC	UPFLAG		# SET STEERSW TO RE-ENABLE STEERING
// PORT: Fixed ROM slots 23361.
    if slot <> 23361 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1385] to agcAotUnit1385@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1060
//		ADRES	STEERSW
// PORT: Fixed ROM slots 23362.
    23362, 68
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23363–23363.
function agcAotUnit1386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1061
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23363.
    if slot <> 23363 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1386] to agcAotUnit1386@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1062
//		OCT	00134		# A, 4.13 = R40ENABL (200 CS), TBASE OLD
// PORT: Fixed ROM slots 23364.
    23364, 184
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23365–23365.
function agcAotUnit1387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1063
//		TC	FIXDELAY	# WAIT 2 SECONDS, THEN
// PORT: Fixed ROM slots 23365.
    if slot <> 23365 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1387] to agcAotUnit1387@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1064
//		DEC	200
// PORT: Fixed ROM slots 23366.
    23366, 400
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23367–23367.
function agcAotUnit1388 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1065
//
// PORT: SOURCE P40-P47.agc:1066
//		EBANK=	WHOCARES
// PORT: SOURCE P40-P47.agc:1067
//R40ENABL	TC	DOWNFLAG	# RE-ENABLE R40 BY CLEARING IDLEFAIL
// PORT: Fixed ROM slots 23367.
    if slot <> 23367 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1388] to agcAotUnit1388@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1068
//		ADRES	IDLEFAIL
// PORT: Fixed ROM slots 23368.
    23368, 48
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23369–23369.
function agcAotUnit1389 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1069
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23369.
    if slot <> 23369 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1389] to agcAotUnit1389@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1070
//		OCT	00004		# KILL GROUP 4
// PORT: Fixed ROM slots 23370.
    23370, 8
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23371–23372.
function agcAotUnit1390 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23371 {
// PORT: SOURCE P40-P47.agc:1071
//# Page 708
// PORT: SOURCE P40-P47.agc:1072
//ENDV97P		TCF	TASKOVER
// PORT: Fixed ROM slots 23371.
        if slot <> 23371 or instruction <> 6868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6868, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1073
//
// PORT: SOURCE P40-P47.agc:1074
//		EBANK=	WHOCARES
// PORT: SOURCE P40-P47.agc:1075
//V97E		TC	PHASCHNG
// PORT: Fixed ROM slots 23372.
        if slot <> 23372 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1390] to agcAotUnit1390@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1076
//		OCT	40534		# A, 4.53 = V97ETASK (-0 CS), TBASE NOW
// PORT: Fixed ROM slots 23373.
    23373, 33464
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23374–23375.
function agcAotUnit1391 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23374 {
// PORT: SOURCE P40-P47.agc:1077
//		CAF	BIT1
// PORT: Fixed ROM slots 23374.
        if slot <> 23374 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1078
//		TC	WAITLIST
// PORT: Fixed ROM slots 23375.
        if slot <> 23375 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1391] to agcAotUnit1391@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1079
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:1080
//		2CADR	V97ETASK
// PORT: Fixed ROM slots 23376 23377.
    23376, 3750, 23377, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23378–23382.
function agcAotUnit1392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23379 {
        if slot <= 23378 {
// PORT: SOURCE P40-P47.agc:1081
//
// PORT: SOURCE P40-P47.agc:1082
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 23378.
            if slot <> 23378 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1083
//
// PORT: SOURCE P40-P47.agc:1084
//		EBANK=	TIG
// PORT: SOURCE P40-P47.agc:1085
//V97ETASK	CS	OCT24		# FORCE R1 OF V06N40 TO READ  59X59
// PORT: Fixed ROM slots 23379.
            if slot <> 23379 or instruction <> 18506 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23380 {
// PORT: SOURCE P40-P47.agc:1086
//		TS	TIG
// PORT: Fixed ROM slots 23380.
            if slot <> 23380 or instruction <> 23306 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23306, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23381 {
// PORT: SOURCE P40-P47.agc:1087
//		CAF	V06N40		# REDISPLAY V06N40
// PORT: Fixed ROM slots 23381.
                if slot <> 23381 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1088
//		TS	NVWORD1
// PORT: Fixed ROM slots 23382.
                if slot <> 23382 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1392] to agcAotUnit1392@.

// PORT: Physical bank 24. Shared continuation entries, slots 23383–23387.
function agcAotUnit1393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23384 {
        if slot <= 23383 {
// PORT: SOURCE P40-P47.agc:1089
//		TCR	E6SETTER	# RETURN TO EBANK6 FOR REST OF V97ETASK
// PORT: Fixed ROM slots 23383.
            if slot <> 23383 or instruction <> 1785 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1785, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1090
//		EBANK=	CSMMASS
// PORT: SOURCE P40-P47.agc:1091
//		CAF	3MDOT		# 3 SECONDS OF MDOT (2-4 SEC ENGFAIL
// PORT: Fixed ROM slots 23384.
            if slot <> 23384 or instruction <> 13596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1308), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23385 {
// PORT: SOURCE P40-P47.agc:1092
//		AD	CSMMASS		#	DETECTION) NOT LOST BECAUSE THRUST
// PORT: Fixed ROM slots 23385.
            if slot <> 23385 or instruction <> 25404 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 828).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23386 {
// PORT: SOURCE P40-P47.agc:1093
//		TS	MASSTMP		#	FAILED....COPYCYCLE FOR MASSBACK
// PORT: Fixed ROM slots 23386.
                if slot <> 23386 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1094
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23387.
                if slot <> 23387 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1393] to agcAotUnit1393@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1095
//		OCT	00754		# A, 4.75 = SPSOFF97 (-0 CS), TBASE OLD
// PORT: Fixed ROM slots 23388.
    23388, 984
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23389–23390.
function agcAotUnit1394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23389 {
// PORT: SOURCE P40-P47.agc:1096
//SPSOFF97	TCR	SPSOFF
// PORT: Fixed ROM slots 23389.
        if slot <> 23389 or instruction <> 1551 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1551, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1097
//		TC	PHASCHNG
// PORT: Fixed ROM slots 23390.
        if slot <> 23390 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1394] to agcAotUnit1394@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1098
//		OCT	00114		# A, 4.11 = V97E40.6 (250 CS), TBASE OLD
// PORT: Fixed ROM slots 23391.
    23391, 152
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23392–23392.
function agcAotUnit1395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1099
//		TC	FIXDELAY	# DELAY 2.5 SECONDS FOR (POSSIBLE) TAIL-
// PORT: Fixed ROM slots 23392.
    if slot <> 23392 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1395] to agcAotUnit1395@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1100
//		DEC	250		#	OFF (FALSE THRUST-LOSS)
// PORT: Fixed ROM slots 23393.
    23393, 500
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23394–23395.
function agcAotUnit1396 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23394 {
// PORT: SOURCE P40-P47.agc:1101
//
// PORT: SOURCE P40-P47.agc:1102
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:1103
//V97E40.6	CAF	BIT1
// PORT: Fixed ROM slots 23394.
        if slot <> 23394 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1104
//		TC	WAITLIST
// PORT: Fixed ROM slots 23395.
        if slot <> 23395 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1396] to agcAotUnit1396@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1105
//		EBANK=	CNTR
// PORT: SOURCE P40-P47.agc:1106
//		2CADR	PRE40.6		# USE S40.6 RESTART ENTRY TO TRIM ENGINE
// PORT: Fixed ROM slots 23396 23397.
    23396, 2370, 23397, 32876
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23398–23398.
function agcAotUnit1397 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1107
//
// PORT: SOURCE P40-P47.agc:1108
//		TC	IBNKCALL	# RCS DAP IN 0.6SEC, SETTING T5 BITS TO
// PORT: Fixed ROM slots 23398.
    if slot <> 23398 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1397] to agcAotUnit1397@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1109
//		CADR	RCSDAPON	#	KILL TVCEXEC/TVCROLLDAP STARTS.
// PORT: Fixed ROM slots 23399.
    23399, 34856
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23400–23400.
function agcAotUnit1398 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1110
//					#	LEAVE NARROW DEADBAND FOR REIGNITE.
// PORT: SOURCE P40-P47.agc:1111
//
// PORT: SOURCE P40-P47.agc:1112
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23400.
    if slot <> 23400 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1398] to agcAotUnit1398@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1113
//		OCT	00026		# A, 6.2 = PRE40.6 (-0 CS), CLOKTASK (1 SEC)
// PORT: Fixed ROM slots 23401.
    23401, 44,
// PORT: SOURCE P40-P47.agc:1114
//		OCT	05014		# C, DELTAT NEXT, TASK BELOW, IN
// PORT: Fixed ROM slots 23402.
    23402, 5144,
// PORT: SOURCE P40-P47.agc:1115
//		DEC	-0		# -0 CS.
// PORT: Fixed ROM slots 23403.
    23403, 65534
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23404–23408.
function agcAotUnit1399 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23405 {
        if slot <= 23404 {
// PORT: SOURCE P40-P47.agc:1116
//
// PORT: SOURCE P40-P47.agc:1117
//QUICKIGN	CS	PRIO14		# CLEAR ASTNFLAG AND SET IGNFLAG FOR
// PORT: Fixed ROM slots 23404.
            if slot <> 23404 or instruction <> 18998 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1118
//		MASK	FLAGWRD7	#	IMMEDIATE V99 RESPONSE.
// PORT: Fixed ROM slots 23405.
            if slot <> 23405 or instruction <> 28739 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 67).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23406 {
// PORT: SOURCE P40-P47.agc:1119
//		AD	BIT13
// PORT: Fixed ROM slots 23406.
            if slot <> 23406 or instruction <> 27139 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23407 {
// PORT: SOURCE P40-P47.agc:1120
//		TS	FLAGWRD7
// PORT: Fixed ROM slots 23407.
                if slot <> 23407 or instruction <> 22595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1121
//		TC	FIXDELAY	# DELAY TO ALLOW TIME FOR PRE40.6
// PORT: Fixed ROM slots 23408.
                if slot <> 23408 or instruction <> 2743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2743, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1399] to agcAotUnit1399@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1122
//# Page 709
// PORT: SOURCE P40-P47.agc:1123
//		DEC	30
// PORT: Fixed ROM slots 23409.
    23409, 60
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23410–23412.
function agcAotUnit1400 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23410 {
// PORT: SOURCE P40-P47.agc:1124
//
// PORT: SOURCE P40-P47.agc:1125
//V99FLASH	CS	BIT9		# CAUSE V99 TO FLASH
// PORT: Fixed ROM slots 23410.
        if slot <> 23410 or instruction <> 18951 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23411 {
// PORT: SOURCE P40-P47.agc:1126
//		TS	NVWORD1
// PORT: Fixed ROM slots 23411.
            if slot <> 23411 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1127
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 23412.
            if slot <> 23412 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1400] to agcAotUnit1400@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1128
//		OCT	40774		# A, 4.77 = TIG-0 (-0 CS) TBASE FOR PREPTVC
// PORT: Fixed ROM slots 23413.
    23413, 33784,
// PORT: SOURCE P40-P47.agc:1129
//		OCT	00033		# A, 3.3 = S40.13 (PRIO 20)
// PORT: Fixed ROM slots 23414.
    23414, 54
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23415–23416.
function agcAotUnit1401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23415 {
// PORT: SOURCE P40-P47.agc:1130
//		CAF	PRIO20		# SET UP TIMEBURN
// PORT: Fixed ROM slots 23415.
        if slot <> 23415 or instruction <> 14850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1131
//		TC	FINDVAC
// PORT: Fixed ROM slots 23416.
        if slot <> 23416 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1401] to agcAotUnit1401@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1132
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:1133
//		2CADR	S40.13
// PORT: Fixed ROM slots 23417 23418.
    23417, 2606, 23418, 28782
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23419–23419.
function agcAotUnit1402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1134
//
// PORT: SOURCE P40-P47.agc:1135
//ENDV97E		TCF	TASKOVER	# WAIT FOR CLOCKJOB (IMMEDIATE) REACTION
// PORT: Fixed ROM slots 23419.
    if slot <> 23419 or instruction <> 6868 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6868, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1402] to agcAotUnit1402@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1136
//					# 	TO FLASHING V99 RESPONSE.
// PORT: SOURCE P40-P47.agc:1137
//
// PORT: SOURCE P40-P47.agc:1138
//# MOD N02				LOG SECTION P40-P47
// PORT: SOURCE P40-P47.agc:1139
//# MOD BY ZELDIN
// PORT: SOURCE P40-P47.agc:1140
//#
// PORT: SOURCE P40-P47.agc:1141
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:1142
//#	COMPUTE INITIAL THRUST DIRECTION(UT) AND INITIAL VALUE OF VG
// PORT: SOURCE P40-P47.agc:1143
//#	VECTOR(VGTIG).
// PORT: SOURCE P40-P47.agc:1144
//#
// PORT: SOURCE P40-P47.agc:1145
//# CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:1146
//#	L	CALL
// PORT: SOURCE P40-P47.agc:1147
//#	L+1		S40.1
// PORT: SOURCE P40-P47.agc:1148
//#
// PORT: SOURCE P40-P47.agc:1149
//# NORMAL EXIT MODE
// PORT: SOURCE P40-P47.agc:1150
//#	AT L+2 OF CALLING SEQUENCE (GOTO L+2) NORMAL RETURN OR
// PORT: SOURCE P40-P47.agc:1151
//#	ERROR RETURN IF NOSOFLAG =1
// PORT: SOURCE P40-P47.agc:1152
//#
// PORT: SOURCE P40-P47.agc:1153
//# SUBROUTINES CALLED
// PORT: SOURCE P40-P47.agc:1154
//#	CSMPREC
// PORT: SOURCE P40-P47.agc:1155
//#	INITVEL
// PORT: SOURCE P40-P47.agc:1156
//#	CALCGRAV
// PORT: SOURCE P40-P47.agc:1157
//#	MIDGIM
// PORT: SOURCE P40-P47.agc:1158
//#
// PORT: SOURCE P40-P47.agc:1159
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P40-P47.agc:1160
//#	L+2 OF CALLING SEQUENCE, UNSOLVABLE CONIC IF NOSOFLAG=1
// PORT: SOURCE P40-P47.agc:1161
//#
// PORT: SOURCE P40-P47.agc:1162
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P40-P47.agc:1163
//#	WEIGHT/G	ANTICIPATED VEHICLE MASS	SP B16 KGM
// PORT: SOURCE P40-P47.agc:1164
//#	XDELVFLG	1=DELTA-V MANEUVER, 0=AIMPT STEER
// PORT: SOURCE P40-P47.agc:1165
//#   IF DELTA-V MANEUVER:
// PORT: SOURCE P40-P47.agc:1166
//#	DELVSIN		SPECIFIED DELTA-V REQUIRED IN
// PORT: SOURCE P40-P47.agc:1167
//#			INERTIAL COORDS. OF ACTIVE VEHICLE
// PORT: SOURCE P40-P47.agc:1168
//#			AT TIME OF IGNITION		VECTOR B7 M/CS
// PORT: SOURCE P40-P47.agc:1169
//#	DELVSAB		MAG. OF DELVSIN			DP B7 M/CS
// PORT: SOURCE P40-P47.agc:1170
//#	RTIG		POSITION AT TIME OF IGNITION	VECTOR B29 M
// PORT: SOURCE P40-P47.agc:1171
//#	VTIG		VELOCITY AT TIME OF IGNITION	VECTOR B7 M/CS.
// PORT: SOURCE P40-P47.agc:1172
//#	CSTEER = 0					DP
// PORT: SOURCE P40-P47.agc:1173
//#   IF AIMPOINT STEERING:
// PORT: SOURCE P40-P47.agc:1174
//#   IF AIMPT STEER
// PORT: SOURCE P40-P47.agc:1175
//#	TIG		TIME OF IGNITION		DP B28 CS
// PORT: SOURCE P40-P47.agc:1176
//#	RTARG		POSITION TARGET TIME		VECTOR B29 M
// PORT: SOURCE P40-P47.agc:1177
//#	CSTEER = ECSTEER (GR 0) 			DP B1
// PORT: SOURCE P40-P47.agc:1178
//# Page 710
// PORT: SOURCE P40-P47.agc:1179
//#	TPASS4 -- TIME OF ARRIVAL AT AIMPOINT
// PORT: SOURCE P40-P47.agc:1180
//#
// PORT: SOURCE P40-P47.agc:1181
//# OUTPUT
// PORT: SOURCE P40-P47.agc:1182
//#	UT		1/2 UNIT VECTOR ALIGNED WITH THRUST DIRETION IN REF COOR
// PORT: SOURCE P40-P47.agc:1183
//#	VGTIG		INITIAL VALUE OF VELOCITY
// PORT: SOURCE P40-P47.agc:1184
//#			TO BE GAINED (INERT. COORD.)		VECTOR B7 M/CS
// PORT: SOURCE P40-P47.agc:1185
//#	DELVLVC		VGTIG IN LOC. VERT. COORDS.		B7 M/CS
// PORT: SOURCE P40-P47.agc:1186
//#	F		NOMINAL THRUST FOR ENG USED FOR S40.13	DP B7 M-NEWT
// PORT: SOURCE P40-P47.agc:1187
//#	BDT		V REQUIRED AT TIG -V REQUIRED AT (TIG-2SEC)
// PORT: SOURCE P40-P47.agc:1188
//#	-GDT		FOR S40.13				VECT B7 M/CS
// PORT: SOURCE P40-P47.agc:1189
//#	RTIG		CALC IN S40.1B (AIMPT) FOR S40.2,3	VECTOR B29M
// PORT: SOURCE P40-P47.agc:1190
//#			POSITION AT TIME OF IGNITION
// PORT: SOURCE P40-P47.agc:1191
//#
// PORT: SOURCE P40-P47.agc:1192
//# DEBRIS	QTEMP1
// PORT: SOURCE P40-P47.agc:1193
//#		MPAC, QPRET
// PORT: SOURCE P40-P47.agc:1194
//#		PUSHLIST
// PORT: SOURCE P40-P47.agc:1195
//#		RTX2,RTX1
// PORT: SOURCE P40-P47.agc:1196
//
// PORT: SOURCE P40-P47.agc:1197
//		BANK	14
// PORT: SOURCE P40-P47.agc:1198
//		SETLOC	P40S1
// PORT: SOURCE P40-P47.agc:1199
//		BANK
// PORT: SOURCE P40-P47.agc:1200
//
// PORT: SOURCE P40-P47.agc:1201
//		COUNT	16/S40.1
// PORT: SOURCE P40-P47.agc:1202
//
// PORT: SOURCE P40-P47.agc:1203
//S40.1		SET	VLOAD
// PORT: Fixed ROM slots 16400.
    16400, 64792,
// PORT: SOURCE P40-P47.agc:1204
//			FIRSTFLG
// PORT: Fixed ROM slots 16401.
    16401, 1136,
// PORT: SOURCE P40-P47.agc:1205
//			LO6ZEROS
// PORT: Fixed ROM slots 16402.
    16402, 9964,
// PORT: SOURCE P40-P47.agc:1206
//		STORE	BDT
// PORT: Fixed ROM slots 16403.
    16403, 3978,
// PORT: SOURCE P40-P47.agc:1207
//		STQ	BOF
// PORT: Fixed ROM slots 16404.
    16404, 35872,
// PORT: SOURCE P40-P47.agc:1208
//			QTEMP
// PORT: Fixed ROM slots 16405.
    16405, 3934,
// PORT: SOURCE P40-P47.agc:1209
//			XDELVFLG
// PORT: Fixed ROM slots 16406.
    16406, 1486,
// PORT: SOURCE P40-P47.agc:1210
//			S40.1B		# LAMBERT
// PORT: Fixed ROM slots 16407.
    16407, 28828,
// PORT: SOURCE P40-P47.agc:1211
//		VLOAD	ABVAL		# EXTERNAL DELTA-V
// PORT: Fixed ROM slots 16408.
    16408, 42746,
// PORT: SOURCE P40-P47.agc:1212
//			DELVSIN
// PORT: Fixed ROM slots 16409.
    16409, 3916,
// PORT: SOURCE P40-P47.agc:1213
//		STORE	DELVSAB		# COMPUTE FOR P30/P40 INTERFACE
// PORT: Fixed ROM slots 16410.
    16410, 3928,
// PORT: SOURCE P40-P47.agc:1214
//					#	THUS PERMITTING MODULE-ONLY CHANGE
// PORT: SOURCE P40-P47.agc:1215
//		SETPD	VLOAD
// PORT: Fixed ROM slots 16411.
    16411, 64770,
// PORT: SOURCE P40-P47.agc:1216
//			0
// PORT: Fixed ROM slots 16412.
    16412, 2,
// PORT: SOURCE P40-P47.agc:1217
//			VTIG
// PORT: Fixed ROM slots 16413.
    16413, 3904,
// PORT: SOURCE P40-P47.agc:1218
//		STORE	VINIT
// PORT: Fixed ROM slots 16414.
    16414, 3836,
// PORT: SOURCE P40-P47.agc:1219
//		VXV	UNIT
// PORT: Fixed ROM slots 16415.
    16415, 44602,
// PORT: SOURCE P40-P47.agc:1220
//			RTIG
// PORT: Fixed ROM slots 16416.
    16416, 3892,
// PORT: SOURCE P40-P47.agc:1221
//		STOVL	UT		# UP IN UT
// PORT: Fixed ROM slots 16417.
    16417, 24470,
// PORT: SOURCE P40-P47.agc:1222
//			RTIG
// PORT: Fixed ROM slots 16418.
    16418, 3892,
// PORT: SOURCE P40-P47.agc:1223
//		STORE	RINIT
// PORT: Fixed ROM slots 16419.
    16419, 3824,
// PORT: SOURCE P40-P47.agc:1224
//		VSQ	PDDL
// PORT: Fixed ROM slots 16420.
    16420, 54588,
// PORT: SOURCE P40-P47.agc:1225
//			36D
// PORT: Fixed ROM slots 16421.
    16421, 74,
// PORT: SOURCE P40-P47.agc:1226
//		DMPR	DDV
// PORT: Fixed ROM slots 16422.
    16422, 47482,
// PORT: SOURCE P40-P47.agc:1227
//			THETACON
// PORT: Fixed ROM slots 16423.
    16423, 28884,
// PORT: SOURCE P40-P47.agc:1228
//		DMP	DMP
// PORT: Fixed ROM slots 16424.
    16424, 34058,
// PORT: SOURCE P40-P47.agc:1229
//			DELVSAB
// PORT: Fixed ROM slots 16425.
    16425, 3928,
// PORT: SOURCE P40-P47.agc:1230
//			WEIGHT/G
// PORT: Fixed ROM slots 16426.
    16426, 3196,
// PORT: SOURCE P40-P47.agc:1231
//		DDV
// PORT: Fixed ROM slots 16427.
    16427, 65394,
// PORT: SOURCE P40-P47.agc:1232
//# Page 711
// PORT: SOURCE P40-P47.agc:1233
//			F
// PORT: Fixed ROM slots 16428.
    16428, 4014,
// PORT: SOURCE P40-P47.agc:1234
//		STOVL	14D
// PORT: Fixed ROM slots 16429.
    16429, 20510,
// PORT: SOURCE P40-P47.agc:1235
//			DELVSIN
// PORT: Fixed ROM slots 16430.
    16430, 3916,
// PORT: SOURCE P40-P47.agc:1236
//
// PORT: SOURCE P40-P47.agc:1237
//		DOT	VXSC
// PORT: Fixed ROM slots 16431.
    16431, 61762,
// PORT: SOURCE P40-P47.agc:1238
//			UT
// PORT: Fixed ROM slots 16432.
    16432, 3990,
// PORT: SOURCE P40-P47.agc:1239
//			UT
// PORT: Fixed ROM slots 16433.
    16433, 3990,
// PORT: SOURCE P40-P47.agc:1240
//		VSL2	PUSH		# (DELTAV.UP)UP SCALED AT 2(+7) P.D.L. 0
// PORT: Fixed ROM slots 16434.
    16434, 34516,
// PORT: SOURCE P40-P47.agc:1241
//		BVSU	PDDL		# DELTA VP SCALED AT 2(+7) P.D.L. 6
// PORT: Fixed ROM slots 16435.
    16435, 54602,
// PORT: SOURCE P40-P47.agc:1242
//			DELVSIN
// PORT: Fixed ROM slots 16436.
    16436, 3916,
// PORT: SOURCE P40-P47.agc:1243
//			14D
// PORT: Fixed ROM slots 16437.
    16437, 30,
// PORT: SOURCE P40-P47.agc:1244
//		SIN	PDVL
// PORT: Fixed ROM slots 16438.
    16438, 52700,
// PORT: SOURCE P40-P47.agc:1245
//			6D
// PORT: Fixed ROM slots 16439.
    16439, 14,
// PORT: SOURCE P40-P47.agc:1246
//		VXV	UNIT
// PORT: Fixed ROM slots 16440.
    16440, 44602,
// PORT: SOURCE P40-P47.agc:1247
//			UT
// PORT: Fixed ROM slots 16441.
    16441, 3990,
// PORT: SOURCE P40-P47.agc:1248
//		VXSC	STADR
// PORT: Fixed ROM slots 16442.
    16442, 38626,
// PORT: SOURCE P40-P47.agc:1249
//		STOVL	VGTIG		# UNIT(VP X UP)SIN(THETAT/2) IN VGTIG.
// PORT: Fixed ROM slots 16443.
    16443, 41052,
// PORT: SOURCE P40-P47.agc:1250
//		UNIT	PDDL		# UNIT(DELTA VP) IN P.D.L. 6
// PORT: Fixed ROM slots 16444.
    16444, 54620,
// PORT: SOURCE P40-P47.agc:1251
//			14D
// PORT: Fixed ROM slots 16445.
    16445, 30,
// PORT: SOURCE P40-P47.agc:1252
//		COS	VXSC
// PORT: Fixed ROM slots 16446.
    16446, 61900,
// PORT: SOURCE P40-P47.agc:1253
//		VAD	VXSC
// PORT: Fixed ROM slots 16447.
    16447, 61786,
// PORT: SOURCE P40-P47.agc:1254
//			VGTIG
// PORT: Fixed ROM slots 16448.
    16448, 4002,
// PORT: SOURCE P40-P47.agc:1255
//			36D
// PORT: Fixed ROM slots 16449.
    16449, 74,
// PORT: SOURCE P40-P47.agc:1256
//		VSL2 	VAD
// PORT: Fixed ROM slots 16450.
    16450, 44500,
// PORT: SOURCE P40-P47.agc:1257
//		STADR
// PORT: Fixed ROM slots 16451.
    16451, 65324,
// PORT: SOURCE P40-P47.agc:1258
//		STORE	VGTIG		# VG IGNITION SCALED AT 2(+7) M/CS
// PORT: Fixed ROM slots 16452.
    16452, 61532,
// PORT: SOURCE P40-P47.agc:1259
//
// PORT: SOURCE P40-P47.agc:1260
//		UNIT
// PORT: Fixed ROM slots 16453.
    16453, 65372,
// PORT: SOURCE P40-P47.agc:1261
//		STOVL	UT		# THRUST DIRECTION SCALED AT 2(+1)
// PORT: Fixed ROM slots 16454.
    16454, 24470,
// PORT: SOURCE P40-P47.agc:1262
//			VGTIG
// PORT: Fixed ROM slots 16455.
    16455, 4002,
// PORT: SOURCE P40-P47.agc:1263
//		PUSH	SET
// PORT: Fixed ROM slots 16456.
    16456, 35852
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1264
//			AVFLAG
// PORT: Fixed ROM slots 16457.
    16457, 1140,
// PORT: SOURCE P40-P47.agc:1265
//		CALL
// PORT: Fixed ROM slots 16458.
    16458, 65320,
// PORT: SOURCE P40-P47.agc:1266
//			MIDGIM		# VGTIG IN LV COOR AT 2(+7)M/CS IN DELVLVC
// PORT: Fixed ROM slots 16459.
    16459, 9038,
// PORT: SOURCE P40-P47.agc:1267
//		GOTO
// PORT: Fixed ROM slots 16460.
    16460, 65360,
// PORT: SOURCE P40-P47.agc:1268
//			QTEMP
// PORT: Fixed ROM slots 16461.
    16461, 3934,
// PORT: SOURCE P40-P47.agc:1269
//S40.1B		DLOAD	DSU		# LAMBERT
// PORT: Fixed ROM slots 16462.
    16462, 38346,
// PORT: SOURCE P40-P47.agc:1270
//			TIG
// PORT: Fixed ROM slots 16463.
    16463, 3606,
// PORT: SOURCE P40-P47.agc:1271
//			TWODT
// PORT: Fixed ROM slots 16464.
    16464, 30722,
// PORT: SOURCE P40-P47.agc:1272
//		STODL	TDEC1
// PORT: Fixed ROM slots 16465.
    16465, 12354,
// PORT: SOURCE P40-P47.agc:1273
//			TPASS4
// PORT: Fixed ROM slots 16466.
    16466, 3932,
// PORT: SOURCE P40-P47.agc:1274
//		DSU
// PORT: Fixed ROM slots 16467.
    16467, 65322,
// PORT: SOURCE P40-P47.agc:1275
//			TDEC1
// PORT: Fixed ROM slots 16468.
    16468, 66,
// PORT: SOURCE P40-P47.agc:1276
//		STCALL	DELLT4
// PORT: Fixed ROM slots 16469.
    16469, 32294,
// PORT: SOURCE P40-P47.agc:1277
//			AGAIN
// PORT: Fixed ROM slots 16470.
    16470, 51026,
// PORT: SOURCE P40-P47.agc:1278
//		VLOAD
// PORT: Fixed ROM slots 16471.
    16471, 65530,
// PORT: SOURCE P40-P47.agc:1279
//			VIPRIME
// PORT: Fixed ROM slots 16472.
    16472, 3860,
// PORT: SOURCE P40-P47.agc:1280
//		STODL	UT
// PORT: Fixed ROM slots 16473.
    16473, 16278,
// PORT: SOURCE P40-P47.agc:1281
//			TIG
// PORT: Fixed ROM slots 16474.
    16474, 3606,
// PORT: SOURCE P40-P47.agc:1282
//		STORE	TDEC1
// PORT: Fixed ROM slots 16475.
    16475, 66,
// PORT: SOURCE P40-P47.agc:1283
//# Page 712
// PORT: SOURCE P40-P47.agc:1284
//		BDSU
// PORT: Fixed ROM slots 16476.
    16476, 65314,
// PORT: SOURCE P40-P47.agc:1285
//			TPASS4
// PORT: Fixed ROM slots 16477.
    16477, 3932,
// PORT: SOURCE P40-P47.agc:1286
//		STCALL	DELLT4
// PORT: Fixed ROM slots 16478.
    16478, 32294,
// PORT: SOURCE P40-P47.agc:1287
//			AGAIN
// PORT: Fixed ROM slots 16479.
    16479, 51026,
// PORT: SOURCE P40-P47.agc:1288
//		VLOAD	PUSH
// PORT: Fixed ROM slots 16480.
    16480, 34554,
// PORT: SOURCE P40-P47.agc:1289
//			DELVEET3
// PORT: Fixed ROM slots 16481.
    16481, 3916,
// PORT: SOURCE P40-P47.agc:1290
//		STORE	VGTIG
// PORT: Fixed ROM slots 16482.
    16482, 4002,
// PORT: SOURCE P40-P47.agc:1291
//		SET	CALL
// PORT: Fixed ROM slots 16483.
    16483, 37912,
// PORT: SOURCE P40-P47.agc:1292
//			AVFLAG
// PORT: Fixed ROM slots 16484.
    16484, 1140,
// PORT: SOURCE P40-P47.agc:1293
//			MIDGIM
// PORT: Fixed ROM slots 16485.
    16485, 9038,
// PORT: SOURCE P40-P47.agc:1294
//		SETPD	GOTO
// PORT: Fixed ROM slots 16486.
    16486, 43010,
// PORT: SOURCE P40-P47.agc:1295
//			0
// PORT: Fixed ROM slots 16487.
    16487, 2,
// PORT: SOURCE P40-P47.agc:1296
//			CALCUT
// PORT: Fixed ROM slots 16488.
    16488, 51080,
// PORT: SOURCE P40-P47.agc:1297
//
// PORT: SOURCE P40-P47.agc:1298
//THETACON	2DEC	.31830989 B-8
// PORT: Fixed ROM slots 16489 16490.
    16489, 40, 16490, 12184,
// PORT: SOURCE P40-P47.agc:1299
//
// PORT: SOURCE P40-P47.agc:1300
//		SETLOC	P40S3
// PORT: SOURCE P40-P47.agc:1301
//		BANK
// PORT: SOURCE P40-P47.agc:1302
//
// PORT: SOURCE P40-P47.agc:1303
//		COUNT	24/S40.1
// PORT: SOURCE P40-P47.agc:1304
//
// PORT: SOURCE P40-P47.agc:1305
//EP4(45)H	2DEC	.125
// PORT: Fixed ROM slots 27557 27558.
    27557, 4096, 27558, 0,
// PORT: SOURCE P40-P47.agc:1306
//
// PORT: SOURCE P40-P47.agc:1307
//EP4(10)H	2DEC	.027777777
// PORT: Fixed ROM slots 27559 27560.
    27559, 910, 27560, 3640,
// PORT: SOURCE P40-P47.agc:1308
//
// PORT: SOURCE P40-P47.agc:1309
//AGAIN		STQ	CALL
// PORT: Fixed ROM slots 27561.
    27561, 37920,
// PORT: SOURCE P40-P47.agc:1310
//			QTEMP1
// PORT: Fixed ROM slots 27562.
    27562, 4016,
// PORT: SOURCE P40-P47.agc:1311
//			THISPREC
// PORT: Fixed ROM slots 27563.
    27563, 23666,
// PORT: SOURCE P40-P47.agc:1312
//		SXA,2	SXA,1
// PORT: Fixed ROM slots 27564.
    27564, 55480,
// PORT: SOURCE P40-P47.agc:1313
//			RTX2
// PORT: Fixed ROM slots 27565.
    27565, 4044,
// PORT: SOURCE P40-P47.agc:1314
//			RTX1
// PORT: Fixed ROM slots 27566.
    27566, 4042,
// PORT: SOURCE P40-P47.agc:1315
//		VLOAD
// PORT: Fixed ROM slots 27567.
    27567, 65530,
// PORT: SOURCE P40-P47.agc:1316
//			RATT
// PORT: Fixed ROM slots 27568.
    27568, 2,
// PORT: SOURCE P40-P47.agc:1317
//		STORE	RTIG
// PORT: Fixed ROM slots 27569.
    27569, 3892,
// PORT: SOURCE P40-P47.agc:1318
//		STOVL	RINIT
// PORT: Fixed ROM slots 27570.
    27570, 24304,
// PORT: SOURCE P40-P47.agc:1319
//			VATT
// PORT: Fixed ROM slots 27571.
    27571, 14,
// PORT: SOURCE P40-P47.agc:1320
//		STORE	VTIG
// PORT: Fixed ROM slots 27572.
    27572, 3904,
// PORT: SOURCE P40-P47.agc:1321
//		STORE	VINIT
// PORT: Fixed ROM slots 27573.
    27573, 3836,
// PORT: SOURCE P40-P47.agc:1322
//		SETPD	SLOAD
// PORT: Fixed ROM slots 27574.
    27574, 56578,
// PORT: SOURCE P40-P47.agc:1323
//			0
// PORT: Fixed ROM slots 27575.
    27575, 2,
// PORT: SOURCE P40-P47.agc:1324
//			HI6ZEROS
// PORT: Fixed ROM slots 27576.
    27576, 13754,
// PORT: SOURCE P40-P47.agc:1325
//		PDDL	BON
// PORT: Fixed ROM slots 27577.
    27577, 36010,
// PORT: SOURCE P40-P47.agc:1326
//			EP4(45)H
// PORT: Fixed ROM slots 27578.
    27578, 18252,
// PORT: SOURCE P40-P47.agc:1327
//			NORMSW
// PORT: Fixed ROM slots 27579.
    27579, 3978,
// PORT: SOURCE P40-P47.agc:1328
//			+3
// PORT: Fixed ROM slots 27580.
    27580, 51070,
// PORT: SOURCE P40-P47.agc:1329
//		DLOAD
// PORT: Fixed ROM slots 27581.
    27581, 65482,
// PORT: SOURCE P40-P47.agc:1330
//			EP4(10)H
// PORT: Fixed ROM slots 27582.
    27582, 18256,
// PORT: SOURCE P40-P47.agc:1331
//		PUSH	CALL
// PORT: Fixed ROM slots 27583.
    27583, 37900,
// PORT: SOURCE P40-P47.agc:1332
//			INITVEL
// PORT: Fixed ROM slots 27584.
    27584, 18432,
// PORT: SOURCE P40-P47.agc:1333
//		SETPD	GOTO
// PORT: Fixed ROM slots 27585.
    27585, 43010,
// PORT: SOURCE P40-P47.agc:1334
//# Page 713
// PORT: SOURCE P40-P47.agc:1335
//			0
// PORT: Fixed ROM slots 27586.
    27586, 2,
// PORT: SOURCE P40-P47.agc:1336
//			QTEMP1
// PORT: Fixed ROM slots 27587.
    27587, 4016,
// PORT: SOURCE P40-P47.agc:1337
//CALCUT		VLOAD	CALL
// PORT: Fixed ROM slots 27588.
    27588, 38138,
// PORT: SOURCE P40-P47.agc:1338
//			RTIG
// PORT: Fixed ROM slots 27589.
    27589, 3892,
// PORT: SOURCE P40-P47.agc:1339
//			CALCGRAV	# GDELTAT IN MPAC AT 2(+7) M/CS
// PORT: Fixed ROM slots 27590.
    27590, 64982,
// PORT: SOURCE P40-P47.agc:1340
//		VSL1	V/SC
// PORT: Fixed ROM slots 27591.
    27591, 57844,
// PORT: SOURCE P40-P47.agc:1341
//			200CS		# G AT 2(-5) M/CS. CS
// PORT: Fixed ROM slots 27592.
    27592, 18382,
// PORT: SOURCE P40-P47.agc:1342
//		PDVL	VSU
// PORT: Fixed ROM slots 27593.
    27593, 43418,
// PORT: SOURCE P40-P47.agc:1343
//			VIPRIME
// PORT: Fixed ROM slots 27594.
    27594, 3860,
// PORT: SOURCE P40-P47.agc:1344
//			UT
// PORT: Fixed ROM slots 27595.
    27595, 3990,
// PORT: SOURCE P40-P47.agc:1345
//		V/SC	VSU
// PORT: Fixed ROM slots 27596.
    27596, 43458,
// PORT: SOURCE P40-P47.agc:1346
//			200CS
// PORT: Fixed ROM slots 27597.
    27597, 18382,
// PORT: SOURCE P40-P47.agc:1347
//		VXSC	VSL2
// PORT: Fixed ROM slots 27598.
    27598, 60130,
// PORT: SOURCE P40-P47.agc:1348
//			CSTEER
// PORT: Fixed ROM slots 27599.
    27599, 3974,
// PORT: SOURCE P40-P47.agc:1349
//		STOVL	12D		# B.C SCALED AT 2(-15) PDL 12D
// PORT: Fixed ROM slots 27600.
    27600, 20506,
// PORT: SOURCE P40-P47.agc:1350
//			VGTIG
// PORT: Fixed ROM slots 27601.
    27601, 4002,
// PORT: SOURCE P40-P47.agc:1351
//		UNIT	PUSH		# UG PDL 0 SCALED AT 2(+1)
// PORT: Fixed ROM slots 27602.
    27602, 34396,
// PORT: SOURCE P40-P47.agc:1352
//
// PORT: SOURCE P40-P47.agc:1353
//		DOT	VXSC
// PORT: Fixed ROM slots 27603.
    27603, 61762,
// PORT: SOURCE P40-P47.agc:1354
//			12D
// PORT: Fixed ROM slots 27604.
    27604, 26,
// PORT: SOURCE P40-P47.agc:1355
//			0
// PORT: Fixed ROM slots 27605.
    27605, 2,
// PORT: SOURCE P40-P47.agc:1356
//		VSL2	BVSU
// PORT: Fixed ROM slots 27606.
    27606, 42452,
// PORT: SOURCE P40-P47.agc:1357
//			12D
// PORT: Fixed ROM slots 27607.
    27607, 26,
// PORT: SOURCE P40-P47.agc:1358
//		STODL	12D		# Q PDL SCALED AT 2(-5)
// PORT: Fixed ROM slots 27608.
    27608, 12314,
// PORT: SOURCE P40-P47.agc:1359
//			F
// PORT: Fixed ROM slots 27609.
    27609, 4014,
// PORT: SOURCE P40-P47.agc:1360
//		SRR	DDV
// PORT: Fixed ROM slots 27610.
    27610, 47458,
// PORT: SOURCE P40-P47.agc:1361
//			4
// PORT: Fixed ROM slots 27611.
    27611, 18186,
// PORT: SOURCE P40-P47.agc:1362
//			WEIGHT/G
// PORT: Fixed ROM slots 27612.
    27612, 3196,
// PORT: SOURCE P40-P47.agc:1363
//		DSQ	PDVL		# F/MASS SQUARED PDL 6 AT 2(-10M/(CS.CS)
// PORT: Fixed ROM slots 27613.
    27613, 52636,
// PORT: SOURCE P40-P47.agc:1364
//			12D
// PORT: Fixed ROM slots 27614.
    27614, 26,
// PORT: SOURCE P40-P47.agc:1365
//		VSQ
// PORT: Fixed ROM slots 27615.
    27615, 65340,
// PORT: SOURCE P40-P47.agc:1366
//		BDSU	SQRT
// PORT: Fixed ROM slots 27616.
    27616, 63010,
// PORT: SOURCE P40-P47.agc:1367
//		VXSC	VSL1
// PORT: Fixed ROM slots 27617.
    27617, 64226,
// PORT: SOURCE P40-P47.agc:1368
//		VAD	UNIT
// PORT: Fixed ROM slots 27618.
    27618, 44634,
// PORT: SOURCE P40-P47.agc:1369
//			12D
// PORT: Fixed ROM slots 27619.
    27619, 26,
// PORT: SOURCE P40-P47.agc:1370
//		STCALL	UT
// PORT: Fixed ROM slots 27620.
    27620, 32662,
// PORT: SOURCE P40-P47.agc:1371
//			QTEMP
// PORT: Fixed ROM slots 27621.
    27621, 3934,
// PORT: SOURCE P40-P47.agc:1372
//200CS		2DEC	200 B-12
// PORT: Fixed ROM slots 27622 27623.
    27622, 1600, 27623, 0,
// PORT: SOURCE P40-P47.agc:1373
//
// PORT: SOURCE P40-P47.agc:1374
//# Page 714
// PORT: SOURCE P40-P47.agc:1375
//# PROGRAM DESCRIPTION S40.2,3		DATE 15 NOV 66
// PORT: SOURCE P40-P47.agc:1376
//# MOD NO 2				LOG SECTIONS P40-P47
// PORT: SOURCE P40-P47.agc:1377
//# MOD BY ZELDIN
// PORT: SOURCE P40-P47.agc:1378
//#
// PORT: SOURCE P40-P47.agc:1379
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:1380
//#
// PORT: SOURCE P40-P47.agc:1381
//#	COMPUTE GIMBAL ANGLES IF THRUSTING OCCURRED WITH PRESENT IMU
// PORT: SOURCE P40-P47.agc:1382
//#	ORIENTATION, WINGS LEVEL SPACECRAFT, HEADS UP
// PORT: SOURCE P40-P47.agc:1383
//#	COMPUTE X AXIS OF ENGINE BELL
// PORT: SOURCE P40-P47.agc:1384
//#	COMPUTE PREFERRED IMU ORIENTATION (XSCREF)
// PORT: SOURCE P40-P47.agc:1385
//#	FOR THIS CALCULATION, ASSUME X AXIS OF SC ALONG UT INITIALLY,
// PORT: SOURCE P40-P47.agc:1386
//#	YSC=UNIT(XXR), ZSC=UNIT(XX(XXR)) AND ROTATE ENGINE BELL ALONG UT.
// PORT: SOURCE P40-P47.agc:1387
//#	NEW SC AXES WILL BE APPROX. WINGS LEVEL AND NEW SC AXES IN REF.
// PORT: SOURCE P40-P47.agc:1388
//#	COORDS. WILL BE PREFERRED IMU ORIENTATION.
// PORT: SOURCE P40-P47.agc:1389
//#	COMPUTE DESIRED THRUST DIRECTION IN SM COORDS.
// PORT: SOURCE P40-P47.agc:1390
//#
// PORT: SOURCE P40-P47.agc:1391
//# CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:1392
//#	L	CALL
// PORT: SOURCE P40-P47.agc:1393
//#	L+1		S40.2,3
// PORT: SOURCE P40-P47.agc:1394
//#
// PORT: SOURCE P40-P47.agc:1395
//# NORMAL EXIT MODE
// PORT: SOURCE P40-P47.agc:1396
//#	AT L+2 OF CALLING SEQUENCE (GOTO L+2)
// PORT: SOURCE P40-P47.agc:1397
//#
// PORT: SOURCE P40-P47.agc:1398
//# SUBROUTINES CALLED
// PORT: SOURCE P40-P47.agc:1399
//#	CALCGA
// PORT: SOURCE P40-P47.agc:1400
//#
// PORT: SOURCE P40-P47.agc:1401
//# ALARM OR ABORT MODES
// PORT: SOURCE P40-P47.agc:1402
//#	NONE
// PORT: SOURCE P40-P47.agc:1403
//#
// PORT: SOURCE P40-P47.agc:1404
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P40-P47.agc:1405
//#	PACTOFF		TOTAL PITCH TRIM ANGLE		SP AT 1.0795111 REV.
// PORT: SOURCE P40-P47.agc:1406
//#	YACTOFF		TOTAL YAW   TRIM ANGLE		SP AT 1.0795111 REV.
// PORT: SOURCE P40-P47.agc:1407
//#	UT		DESIRED THRUST DIRECTION	VECT. B2 M/(CS.CS)
// PORT: SOURCE P40-P47.agc:1408
//#	RTIG		POSITION AT TIME OF IGNITION	VECT. B29 M
// PORT: SOURCE P40-P47.agc:1409
//#	ENG2FLAG	ON=RCS  OFF=SPS
// PORT: SOURCE P40-P47.agc:1410
//#
// PORT: SOURCE P40-P47.agc:1411
//# OUTPUT
// PORT: SOURCE P40-P47.agc:1412
//#	SCAXIS		UNIT VECT. ALIGNED WITH ENG BELL IN SC COOR.	B1
// PORT: SOURCE P40-P47.agc:1413
//#	XSCREF		UNIT VECTORS ALIGNED WTH PREFERRED IMU		B1
// PORT: SOURCE P40-P47.agc:1414
//#	YSCREF
// PORT: SOURCE P40-P47.agc:1415
//#	ZSCREF
// PORT: SOURCE P40-P47.agc:1416
//#	GIMBAL ANGLES IN THETAD
// PORT: SOURCE P40-P47.agc:1417
//#	POINTVSM	UNIT VECT ALONG DESIRED THRUST DIRECTION IN SM	B1
// PORT: SOURCE P40-P47.agc:1418
//#
// PORT: SOURCE P40-P47.agc:1419
//# DEBRIS
// PORT: SOURCE P40-P47.agc:1420
//#	PUSHLIST, QPRET, MPAC
// PORT: SOURCE P40-P47.agc:1421
//#	QTEMP	TEMP. ERASABLE
// PORT: SOURCE P40-P47.agc:1422
//
// PORT: SOURCE P40-P47.agc:1423
//		BANK	24
// PORT: SOURCE P40-P47.agc:1424
//		SETLOC	P40S
// PORT: SOURCE P40-P47.agc:1425
//		BANK
// PORT: SOURCE P40-P47.agc:1426
//		COUNT*	$$/S40.2
// PORT: SOURCE P40-P47.agc:1427
//S40.2,3		VLOAD	MXV
// PORT: Fixed ROM slots 23420.
    23420, 53754
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1428
//			UT
// PORT: Fixed ROM slots 23421.
    23421, 3990,
// PORT: SOURCE P40-P47.agc:1429
//			REFSMMAT
// PORT: Fixed ROM slots 23422.
    23422, 1980,
// PORT: SOURCE P40-P47.agc:1430
//		VSL1	STQ
// PORT: Fixed ROM slots 23423.
    23423, 37108,
// PORT: SOURCE P40-P47.agc:1431
//			QTEMP
// PORT: Fixed ROM slots 23424.
    23424, 3934,
// PORT: SOURCE P40-P47.agc:1432
//		STORE	POINTVSM	# THRUST IN SM AT 2
// PORT: Fixed ROM slots 23425.
    23425, 3550,
// PORT: SOURCE P40-P47.agc:1433
//		SETPD	BON
// PORT: Fixed ROM slots 23426.
    23426, 35842,
// PORT: SOURCE P40-P47.agc:1434
//			0
// PORT: Fixed ROM slots 23427.
    23427, 2,
// PORT: SOURCE P40-P47.agc:1435
//# Page 715
// PORT: SOURCE P40-P47.agc:1436
//			ENG2FLAG
// PORT: Fixed ROM slots 23428.
    23428, 904,
// PORT: SOURCE P40-P47.agc:1437
//			S40.2,3B
// PORT: Fixed ROM slots 23429.
    23429, 42906,
// PORT: SOURCE P40-P47.agc:1438
//		DLOAD
// PORT: Fixed ROM slots 23430.
    23430, 65482,
// PORT: SOURCE P40-P47.agc:1439
//			HI6ZEROS
// PORT: Fixed ROM slots 23431.
    23431, 13754,
// PORT: SOURCE P40-P47.agc:1440
//		PUSH	SLOAD		# ZERO PDL 0
// PORT: Fixed ROM slots 23432.
    23432, 56588,
// PORT: SOURCE P40-P47.agc:1441
//			YACTOFF
// PORT: Fixed ROM slots 23433.
    23433, 3114,
// PORT: SOURCE P40-P47.agc:1442
//		DMP	SL1
// PORT: Fixed ROM slots 23434.
    23434, 59914,
// PORT: SOURCE P40-P47.agc:1443
//			TRIMSCAL
// PORT: Fixed ROM slots 23435.
    23435, 10200,
// PORT: SOURCE P40-P47.agc:1444
//		DAD	PUSH
// PORT: Fixed ROM slots 23436.
    23436, 34330,
// PORT: SOURCE P40-P47.agc:1445
//			YBIAS
// PORT: Fixed ROM slots 23437.
    23437, 10204,
// PORT: SOURCE P40-P47.agc:1446
//		COS	PDDL		# COS(Y +Y0) PDL 2
// PORT: Fixed ROM slots 23438.
    23438, 54732,
// PORT: SOURCE P40-P47.agc:1447
//		SIN	PUSH		# SIN(Y +Y0) PDL 4
// PORT: Fixed ROM slots 23439.
    23439, 34524,
// PORT: SOURCE P40-P47.agc:1448
//		SLOAD
// PORT: Fixed ROM slots 23440.
    23440, 65466,
// PORT: SOURCE P40-P47.agc:1449
//			PACTOFF
// PORT: Fixed ROM slots 23441.
    23441, 3112,
// PORT: SOURCE P40-P47.agc:1450
//		DMP	SL1
// PORT: Fixed ROM slots 23442.
    23442, 59914,
// PORT: SOURCE P40-P47.agc:1451
//			TRIMSCAL
// PORT: Fixed ROM slots 23443.
    23443, 10200,
// PORT: SOURCE P40-P47.agc:1452
//		DAD	PUSH
// PORT: Fixed ROM slots 23444.
    23444, 34330,
// PORT: SOURCE P40-P47.agc:1453
//			PBIAS
// PORT: Fixed ROM slots 23445.
    23445, 10208,
// PORT: SOURCE P40-P47.agc:1454
//		COS	PDDL		# COS(P +P0) PDL 6
// PORT: Fixed ROM slots 23446.
    23446, 54732,
// PORT: SOURCE P40-P47.agc:1455
//		SIN	PUSH		# SIN(P +P0) PDL 8D
// PORT: Fixed ROM slots 23447.
    23447, 34524,
// PORT: SOURCE P40-P47.agc:1456
//		STODL	ZSCREF		# SIN(P +P0)
// PORT: Fixed ROM slots 23448.
    23448, 12710,
// PORT: SOURCE P40-P47.agc:1457
//			6
// PORT: Fixed ROM slots 23449.
    23449, 14,
// PORT: SOURCE P40-P47.agc:1458
//		DMP	SL1
// PORT: Fixed ROM slots 23450.
    23450, 59914,
// PORT: SOURCE P40-P47.agc:1459
//			4
// PORT: Fixed ROM slots 23451.
    23451, 10,
// PORT: SOURCE P40-P47.agc:1460
//		DCOMP	PDDL		# -SIN(Y+Y0)COS(P+P0) PDL 10
// PORT: Fixed ROM slots 23452.
    23452, 54652,
// PORT: SOURCE P40-P47.agc:1461
//			6
// PORT: Fixed ROM slots 23453.
    23453, 14,
// PORT: SOURCE P40-P47.agc:1462
//		DMP	SL1
// PORT: Fixed ROM slots 23454.
    23454, 59914,
// PORT: SOURCE P40-P47.agc:1463
//			2
// PORT: Fixed ROM slots 23455.
    23455, 6,
// PORT: SOURCE P40-P47.agc:1464
//		VDEF
// PORT: Fixed ROM slots 23456.
    23456, 65388,
// PORT: SOURCE P40-P47.agc:1465
//
// PORT: SOURCE P40-P47.agc:1466
//		STODL	XSCREF		# PD POINTER AT 6 NEW SC X AXIS SCALED AT
// PORT: Fixed ROM slots 23457.
    23457, 12686,
// PORT: SOURCE P40-P47.agc:1467
//			ZSCREF
// PORT: Fixed ROM slots 23458.
    23458, 422,
// PORT: SOURCE P40-P47.agc:1468
//		DMP	SL1
// PORT: Fixed ROM slots 23459.
    23459, 59914,
// PORT: SOURCE P40-P47.agc:1469
//			4
// PORT: Fixed ROM slots 23460.
    23460, 10,
// PORT: SOURCE P40-P47.agc:1470
//		PDDL	DMP
// PORT: Fixed ROM slots 23461.
    23461, 34218,
// PORT: SOURCE P40-P47.agc:1471
//			ZSCREF
// PORT: Fixed ROM slots 23462.
    23462, 422,
// PORT: SOURCE P40-P47.agc:1472
//			2
// PORT: Fixed ROM slots 23463.
    23463, 6,
// PORT: SOURCE P40-P47.agc:1473
//		SL1	DCOMP
// PORT: Fixed ROM slots 23464.
    23464, 48852,
// PORT: SOURCE P40-P47.agc:1474
//		VDEF
// PORT: Fixed ROM slots 23465.
    23465, 65388,
// PORT: SOURCE P40-P47.agc:1475
//
// PORT: SOURCE P40-P47.agc:1476
//		STODL	ZSCREF		# PD POINTER AT 4 NEW SC Z AXIS SCALED AT 2
// PORT: Fixed ROM slots 23466.
    23466, 12710,
// PORT: SOURCE P40-P47.agc:1477
//		VDEF
// PORT: Fixed ROM slots 23467.
    23467, 65388,
// PORT: SOURCE P40-P47.agc:1478
//
// PORT: SOURCE P40-P47.agc:1479
//		STODL	YSCREF		# PD POINTER AT 0 NEW SC Y AXIS SCALED AT 2
// PORT: Fixed ROM slots 23468.
    23468, 12698,
// PORT: SOURCE P40-P47.agc:1480
//			ZSCREF
// PORT: Fixed ROM slots 23469.
    23469, 422,
// PORT: SOURCE P40-P47.agc:1481
//		PDDL	PDDL
// PORT: Fixed ROM slots 23470.
    23470, 54698,
// PORT: SOURCE P40-P47.agc:1482
//			YSCREF
// PORT: Fixed ROM slots 23471.
    23471, 410,
// PORT: SOURCE P40-P47.agc:1483
//			XSCREF
// PORT: Fixed ROM slots 23472.
    23472, 398,
// PORT: SOURCE P40-P47.agc:1484
//		VDEF
// PORT: Fixed ROM slots 23473.
    23473, 65388,
// PORT: SOURCE P40-P47.agc:1485
//# Page 716
// PORT: SOURCE P40-P47.agc:1486
//		STOVL	SCAXIS		# ENGINE BELL SCALED AT 2
// PORT: Fixed ROM slots 23474.
    23474, 24018,
// PORT: SOURCE P40-P47.agc:1487
//			UT
// PORT: Fixed ROM slots 23475.
    23475, 3990,
// PORT: SOURCE P40-P47.agc:1488
//		PDVL	UNIT
// PORT: Fixed ROM slots 23476.
    23476, 44698,
// PORT: SOURCE P40-P47.agc:1489
//			RTIG
// PORT: Fixed ROM slots 23477.
    23477, 3892,
// PORT: SOURCE P40-P47.agc:1490
//		VXV	VCOMP
// PORT: Fixed ROM slots 23478.
    23478, 48698,
// PORT: SOURCE P40-P47.agc:1491
//			0
// PORT: Fixed ROM slots 23479.
    23479, 2,
// PORT: SOURCE P40-P47.agc:1492
//		UNIT	PUSH
// PORT: Fixed ROM slots 23480.
    23480, 34396,
// PORT: SOURCE P40-P47.agc:1493
//		CALL
// PORT: Fixed ROM slots 23481.
    23481, 65320,
// PORT: SOURCE P40-P47.agc:1494
//			TSTRXUT
// PORT: Fixed ROM slots 23482.
    23482, 42936,
// PORT: SOURCE P40-P47.agc:1495
//		VXV	VCOMP
// PORT: Fixed ROM slots 23483.
    23483, 48698,
// PORT: SOURCE P40-P47.agc:1496
//			0
// PORT: Fixed ROM slots 23484.
    23484, 2,
// PORT: SOURCE P40-P47.agc:1497
//		VSL1	PDVL		# 2 RF/SC IN PDL 12D
// PORT: Fixed ROM slots 23485.
    23485, 52724,
// PORT: SOURCE P40-P47.agc:1498
//			XSCREF
// PORT: Fixed ROM slots 23486.
    23486, 398,
// PORT: SOURCE P40-P47.agc:1499
//		VXM	VSL1
// PORT: Fixed ROM slots 23487.
    23487, 64138,
// PORT: SOURCE P40-P47.agc:1500
//			0
// PORT: Fixed ROM slots 23488.
    23488, 2,
// PORT: SOURCE P40-P47.agc:1501
//		STOVL	XSCREF		# X OF PREF. IMU,X OF SC IN REF COOR. AT 2
// PORT: Fixed ROM slots 23489.
    23489, 20878,
// PORT: SOURCE P40-P47.agc:1502
//			YSCREF
// PORT: Fixed ROM slots 23490.
    23490, 410,
// PORT: SOURCE P40-P47.agc:1503
//		VXM	VSL1
// PORT: Fixed ROM slots 23491.
    23491, 64138,
// PORT: SOURCE P40-P47.agc:1504
//			0
// PORT: Fixed ROM slots 23492.
    23492, 2,
// PORT: SOURCE P40-P47.agc:1505
//		STOVL	YSCREF		# Y OF PREF. IMU,Y OF SC IN REF COOR. AT 2
// PORT: Fixed ROM slots 23493.
    23493, 20890,
// PORT: SOURCE P40-P47.agc:1506
//			ZSCREF
// PORT: Fixed ROM slots 23494.
    23494, 422,
// PORT: SOURCE P40-P47.agc:1507
//		VXM	VSL1
// PORT: Fixed ROM slots 23495.
    23495, 64138,
// PORT: SOURCE P40-P47.agc:1508
//			0
// PORT: Fixed ROM slots 23496.
    23496, 2,
// PORT: SOURCE P40-P47.agc:1509
//		STORE	ZSCREF		# Z OF PREF. IMU,Z OF SC IN REF COOR. AT 2
// PORT: Fixed ROM slots 23497.
    23497, 422,
// PORT: SOURCE P40-P47.agc:1510
//		SETPD	GOTO
// PORT: Fixed ROM slots 23498.
    23498, 43010,
// PORT: SOURCE P40-P47.agc:1511
//			0
// PORT: Fixed ROM slots 23499.
    23499, 2,
// PORT: SOURCE P40-P47.agc:1512
//			QTEMP
// PORT: Fixed ROM slots 23500.
    23500, 3934,
// PORT: SOURCE P40-P47.agc:1513
//S40.2,3B	VLOAD
// PORT: Fixed ROM slots 23501.
    23501, 65530,
// PORT: SOURCE P40-P47.agc:1514
//			UNITX
// PORT: Fixed ROM slots 23502.
    23502, 13750,
// PORT: SOURCE P40-P47.agc:1515
//		STOVL	SCAXIS
// PORT: Fixed ROM slots 23503.
    23503, 24018,
// PORT: SOURCE P40-P47.agc:1516
//			UT
// PORT: Fixed ROM slots 23504.
    23504, 3990,
// PORT: SOURCE P40-P47.agc:1517
//		STORE	XSCREF
// PORT: Fixed ROM slots 23505.
    23505, 398,
// PORT: SOURCE P40-P47.agc:1518
//		VXV	UNIT
// PORT: Fixed ROM slots 23506.
    23506, 44602,
// PORT: SOURCE P40-P47.agc:1519
//			RTIG
// PORT: Fixed ROM slots 23507.
    23507, 3892,
// PORT: SOURCE P40-P47.agc:1520
//		STCALL	6D
// PORT: Fixed ROM slots 23508.
    23508, 28686,
// PORT: SOURCE P40-P47.agc:1521
//			TSTRXUT
// PORT: Fixed ROM slots 23509.
    23509, 42936,
// PORT: SOURCE P40-P47.agc:1522
//		STORE	YSCREF
// PORT: Fixed ROM slots 23510.
    23510, 410,
// PORT: SOURCE P40-P47.agc:1523
//		VXV	VCOMP
// PORT: Fixed ROM slots 23511.
    23511, 48698,
// PORT: SOURCE P40-P47.agc:1524
//			XSCREF
// PORT: Fixed ROM slots 23512.
    23512, 398,
// PORT: SOURCE P40-P47.agc:1525
//		VSL1
// PORT: Fixed ROM slots 23513.
    23513, 65524,
// PORT: SOURCE P40-P47.agc:1526
//		STCALL	ZSCREF		# ZNB AXIS IN REF COOR
// PORT: Fixed ROM slots 23514.
    23514, 29094,
// PORT: SOURCE P40-P47.agc:1527
//			QTEMP
// PORT: Fixed ROM slots 23515.
    23515, 3934,
// PORT: SOURCE P40-P47.agc:1528
//TSTRXUT		DLOAD	BHIZ
// PORT: Fixed ROM slots 23516.
    23516, 39114,
// PORT: SOURCE P40-P47.agc:1529
//			36D
// PORT: Fixed ROM slots 23517.
    23517, 74,
// PORT: SOURCE P40-P47.agc:1530
//			BADVCTOR
// PORT: Fixed ROM slots 23518.
    23518, 42946,
// PORT: SOURCE P40-P47.agc:1531
//		VLOAD	RVQ
// PORT: Fixed ROM slots 23519.
    23519, 36602,
// PORT: SOURCE P40-P47.agc:1532
//			6D
// PORT: Fixed ROM slots 23520.
    23520, 14,
// PORT: SOURCE P40-P47.agc:1533
//BADVCTOR	VLOAD	UNIT
// PORT: Fixed ROM slots 23521.
    23521, 44794,
// PORT: SOURCE P40-P47.agc:1534
//			RTIG
// PORT: Fixed ROM slots 23522.
    23522, 3892,
// PORT: SOURCE P40-P47.agc:1535
//		PDVL	UNIT
// PORT: Fixed ROM slots 23523.
    23523, 44698,
// PORT: SOURCE P40-P47.agc:1536
//# Page 717
// PORT: SOURCE P40-P47.agc:1537
//			VTIG
// PORT: Fixed ROM slots 23524.
    23524, 3904,
// PORT: SOURCE P40-P47.agc:1538
//		VSR3	VAD
// PORT: Fixed ROM slots 23525.
    23525, 44452,
// PORT: SOURCE P40-P47.agc:1539
//		VXV	UNIT
// PORT: Fixed ROM slots 23526.
    23526, 44602,
// PORT: SOURCE P40-P47.agc:1540
//			UT
// PORT: Fixed ROM slots 23527.
    23527, 3990,
// PORT: SOURCE P40-P47.agc:1541
//		VCOMP
// PORT: Fixed ROM slots 23528.
    23528, 65404,
// PORT: SOURCE P40-P47.agc:1542
//		STORE	6D
// PORT: Fixed ROM slots 23529.
    23529, 14,
// PORT: SOURCE P40-P47.agc:1543
//		RVQ
// PORT: Fixed ROM slots 23530.
    23530, 65308,
// PORT: SOURCE P40-P47.agc:1544
//TRIMSCAL	2DEC	1.07975111 B-1
// PORT: Fixed ROM slots 23531 23532.
    23531, 17690, 23532, 10522,
// PORT: SOURCE P40-P47.agc:1545
//
// PORT: SOURCE P40-P47.agc:1546
//YBIAS		2DEC	+.00263888889	# YAW	MECH BIAS (+0.95 DEG, THRUST ON)
// PORT: Fixed ROM slots 23533 23534.
    23533, 86, 23534, 7718,
// PORT: SOURCE P40-P47.agc:1547
//
// PORT: SOURCE P40-P47.agc:1548
//PBIAS		2DEC	-.00597222222	# PITCH	MECH BIAS (-2.15 DEG, THRUST ON)
// PORT: Fixed ROM slots 23535 23536.
    23535, 65340, 23536, 37718,
// PORT: SOURCE P40-P47.agc:1549
//
// PORT: SOURCE P40-P47.agc:1550
//					# REFERENCE, TRW 68.6520.3.3-40 27 FEB, 1968
// PORT: SOURCE P40-P47.agc:1551
//
// PORT: SOURCE P40-P47.agc:1552
//# PROGRAM DESCRIPTION S41.1		DATE 8 DEC 66
// PORT: SOURCE P40-P47.agc:1553
//# MOD NO 1				LOG SECTION P40-P47
// PORT: SOURCE P40-P47.agc:1554
//# MOD BY ZELDIN
// PORT: SOURCE P40-P47.agc:1555
//#
// PORT: SOURCE P40-P47.agc:1556
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:1557
//#
// PORT: SOURCE P40-P47.agc:1558
//#	COMPUTE VELOCITY TO BE GAINED INITIALLY IN REF COORDS.
// PORT: SOURCE P40-P47.agc:1559
//#	TO CONTROL COORDS.
// PORT: SOURCE P40-P47.agc:1560
//#
// PORT: SOURCE P40-P47.agc:1561
//# CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:1562
//#
// PORT: SOURCE P40-P47.agc:1563
//#	L	CALL
// PORT: SOURCE P40-P47.agc:1564
//#	L+1		S41.1
// PORT: SOURCE P40-P47.agc:1565
//#
// PORT: SOURCE P40-P47.agc:1566
//# NORMAL EXIT MODE
// PORT: SOURCE P40-P47.agc:1567
//#
// PORT: SOURCE P40-P47.agc:1568
//#	AT L +2 OF CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:1569
//#
// PORT: SOURCE P40-P47.agc:1570
//# SUBROUTINES CALLED:
// PORT: SOURCE P40-P47.agc:1571
//#
// PORT: SOURCE P40-P47.agc:1572
//#	CALCSMSC
// PORT: SOURCE P40-P47.agc:1573
//#	CDUTRIG
// PORT: SOURCE P40-P47.agc:1574
//#
// PORT: SOURCE P40-P47.agc:1575
//# ALARM OR ABORT MODES
// PORT: SOURCE P40-P47.agc:1576
//#
// PORT: SOURCE P40-P47.agc:1577
//#	NONE
// PORT: SOURCE P40-P47.agc:1578
//#
// PORT: SOURCE P40-P47.agc:1579
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P40-P47.agc:1580
//#
// PORT: SOURCE P40-P47.agc:1581
//#	VG IN REF. COORD. PDL L POINTER AT L+5.  S41.1 WILL RETURN WITH
// PORT: SOURCE P40-P47.agc:1582
//# 	POINTER AT L (L MUST BE LESS THAN OR = TO 14D)
// PORT: SOURCE P40-P47.agc:1583
//#
// PORT: SOURCE P40-P47.agc:1584
//# OUTPUT
// PORT: SOURCE P40-P47.agc:1585
//#
// PORT: SOURCE P40-P47.agc:1586
//#	MPAC CONTAINS VG IN CONTROL COORDS		VECT. B7 M/CS
// PORT: SOURCE P40-P47.agc:1587
//#
// PORT: SOURCE P40-P47.agc:1588
//# DEBRIS:
// PORT: SOURCE P40-P47.agc:1589
//#
// PORT: SOURCE P40-P47.agc:1590
//#	QTEMP		TEMP ERASABLE
// PORT: SOURCE P40-P47.agc:1591
//#	QPRET
// PORT: SOURCE P40-P47.agc:1592
//
// PORT: SOURCE P40-P47.agc:1593
//		COUNT	22/S41.1
// PORT: SOURCE P40-P47.agc:1594
//
// PORT: SOURCE P40-P47.agc:1595
//		SETLOC	P40S5
// PORT: SOURCE P40-P47.agc:1596
//		BANK
// PORT: SOURCE P40-P47.agc:1597
//
// PORT: SOURCE P40-P47.agc:1598
//S41.1		STQ	CALL
// PORT: Fixed ROM slots 21273.
    21273, 37920
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1599
//			QTEMP
// PORT: Fixed ROM slots 21274.
    21274, 3934,
// PORT: SOURCE P40-P47.agc:1600
//			CDUTRIG
// PORT: Fixed ROM slots 21275.
    21275, 40574,
// PORT: SOURCE P40-P47.agc:1601
//		VLOAD
// PORT: Fixed ROM slots 21276.
    21276, 65530,
// PORT: SOURCE P40-P47.agc:1602
//		MXV	CALL
// PORT: Fixed ROM slots 21277.
    21277, 38050,
// PORT: SOURCE P40-P47.agc:1603
//			REFSMMAT
// PORT: Fixed ROM slots 21278.
    21278, 1980,
// PORT: SOURCE P40-P47.agc:1604
//			*SMNB*
// PORT: Fixed ROM slots 21279.
    21279, 40776,
// PORT: SOURCE P40-P47.agc:1605
//# Page 718
// PORT: SOURCE P40-P47.agc:1606
//		MXV	VXSC
// PORT: Fixed ROM slots 21280.
    21280, 61858,
// PORT: SOURCE P40-P47.agc:1607
//			QUADROT
// PORT: Fixed ROM slots 21281.
    21281, 5126,
// PORT: SOURCE P40-P47.agc:1608
//			TENBNK14	# VG IN CONTROL COORD IN MPAC SCALED AT
// PORT: Fixed ROM slots 21282.
    21282, 5708,
// PORT: SOURCE P40-P47.agc:1609
//		VSL5	GOTO		# VG IN CONTROL COORDS. IN MPAC AT 2(+7)
// PORT: Fixed ROM slots 21283.
    21283, 43124,
// PORT: SOURCE P40-P47.agc:1610
//			QTEMP
// PORT: Fixed ROM slots 21284.
    21284, 3934,
// PORT: SOURCE P40-P47.agc:1611
//TENBNK14	2DEC	10. B-4
// PORT: Fixed ROM slots 21285 21286.
    21285, 20480, 21286, 0,
// PORT: SOURCE P40-P47.agc:1612
//
// PORT: SOURCE P40-P47.agc:1613
//# Page 719
// PORT: SOURCE P40-P47.agc:1614
//# NAME		S40.8 -- CROSS PRODUCT STEERING
// PORT: SOURCE P40-P47.agc:1615
//# FUNCTION	(1) UPDATES THE VELOCITY-TO-BE-GAINED VECTOR.
// PORT: SOURCE P40-P47.agc:1616
//#		(2) GENERATES ANGULAR RATE STEERING COMMANDS FOR AUTOPILOT.
// PORT: SOURCE P40-P47.agc:1617
//#		(3) ESTABLISHES ENGINE CUT-OFF SIGNALS AT APPROPRIATE TIMES.
// PORT: SOURCE P40-P47.agc:1618
//#		(4) INITIATES THRUST-FAIL ROUTINE, R40
// PORT: SOURCE P40-P47.agc:1619
//# CALLING SEQ	CALL S40.6
// PORT: SOURCE P40-P47.agc:1620
//# INPUT		VGPREV 		LAST VALUE OF THE VELOCITY-TO-BE-GAINED VECTOR
// PORT: SOURCE P40-P47.agc:1621
//#				PRIOR TO UPDATING IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1622
//#		DELVREF		CHANGE IN VEHICLE VELOCITY SINCE LAST MEASUREMENT
// PORT: SOURCE P40-P47.agc:1623
//#				IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1624
//#		BDT		EFFECT OF RATE OF CHANGE OF REQUIRED VELOCITY AND
// PORT: SOURCE P40-P47.agc:1625
//#				GRAVITY DURING DT UPON VELOCITY-TO-BE-GAINED IN
// PORT: SOURCE P40-P47.agc:1626
//#				METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1627
//#		CSTEER		A SCALAR OF THE STEERING LAW, SC.AT B+1, USED FOR
// PORT: SOURCE P40-P47.agc:1628
//#				SPS AIMPOINT STEERING MANEUVERS.
// PORT: SOURCE P40-P47.agc:1629
//#		IDLEFAIL	A FLAG TO INHIBIT (IDLE) THE THRUST-FAIL ROUTINE.
// PORT: SOURCE P40-P47.agc:1630
//#		STEERSW		A SWITCH TO PRECLUDE NEEDLESS CONDUCT OF STEERING.
// PORT: SOURCE P40-P47.agc:1631
//#		REFSMMAT, DAPDATR1, PIPTIME
// PORT: SOURCE P40-P47.agc:1632
//#		EREPFRAC, ETDECAY, KPRIMEDT FOR TVC.
// PORT: SOURCE P40-P47.agc:1633
//# OUTPUT	TTOGO		TIME REMAINING FOR ENGINE BURN IN CS AT +28.
// PORT: SOURCE P40-P47.agc:1634
//#		OMEGAC		DP VECTOR RATE COMMAND, SC.AT 1/(2TVCDT) REVS/SEC.
// PORT: SOURCE P40-P47.agc:1635
//#		VG, VGPREV, VGDISP, TGO, TIG, SCALED AS NOTED IN CODING
// PORT: SOURCE P40-P47.agc:1636
//#		STEERSW, IMPULSW, NVWORD1
// PORT: SOURCE P40-P47.agc:1637
//#		REPFRAC, CNTR, VCNTR, VCNTRTMP FOR TVC (R40 INTERFACING)
// PORT: SOURCE P40-P47.agc:1638
//# DEBRIS	OMEGAXC, +1
// PORT: SOURCE P40-P47.agc:1639
//# SUBROUTINES USED:  *SMNB*, ALARM
// PORT: SOURCE P40-P47.agc:1640
//
// PORT: SOURCE P40-P47.agc:1641
//		SETLOC	P40S1
// PORT: SOURCE P40-P47.agc:1642
//		BANK
// PORT: SOURCE P40-P47.agc:1643
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:1644
//		COUNT	16/S40.8
// PORT: SOURCE P40-P47.agc:1645
//
// PORT: SOURCE P40-P47.agc:1646
//S40.8		SETPD	STQ
// PORT: Fixed ROM slots 16491.
    16491, 36866,
// PORT: SOURCE P40-P47.agc:1647
//SPBIT1			00D
// PORT: Fixed ROM slots 16492.
    16492, 2,
// PORT: SOURCE P40-P47.agc:1648
//			QTEMP
// PORT: Fixed ROM slots 16493.
    16493, 3934,
// PORT: SOURCE P40-P47.agc:1649
//		VLOAD	BVSU		# CONSTRUCT DELVG, SC.AT B+7 M/CS
// PORT: Fixed ROM slots 16494.
    16494, 42490,
// PORT: SOURCE P40-P47.agc:1650
//			DELVREF
// PORT: Fixed ROM slots 16495.
    16495, 3638,
// PORT: SOURCE P40-P47.agc:1651
//			BDT
// PORT: Fixed ROM slots 16496.
    16496, 3978,
// PORT: SOURCE P40-P47.agc:1652
//		VAD
// PORT: Fixed ROM slots 16497.
    16497, 65370,
// PORT: SOURCE P40-P47.agc:1653
//			VGPREV
// PORT: Fixed ROM slots 16498.
    16498, 4002,
// PORT: SOURCE P40-P47.agc:1654
//		STORE	VG		# VELOCITY-TO-BE-GAINED, SC.AT B+7 M/CS
// PORT: Fixed ROM slots 16499.
    16499, 3680,
// PORT: SOURCE P40-P47.agc:1655
//
// PORT: SOURCE P40-P47.agc:1656
//		ABVAL
// PORT: Fixed ROM slots 16500.
    16500, 65356,
// PORT: SOURCE P40-P47.agc:1657
//		STORE	VGDISP		# FOR DISPLAY PURPOSES
// PORT: Fixed ROM slots 16501.
    16501, 4086,
// PORT: SOURCE P40-P47.agc:1658
//		EXIT
// PORT: Fixed ROM slots 16502.
    16502, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16503–16503.
function agcAotUnit945 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1659
//		TC	PHASCHNG
// PORT: Fixed ROM slots 16503.
    if slot <> 16503 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[945] to agcAotUnit945@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1660
//		OCT	10035		# TYPE B RESTART RESTART BELOW AND 5.3 REREADAC
// PORT: Fixed ROM slots 16504.
    16504, 8250
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16505–16505.
function agcAotUnit946 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1661
//
// PORT: SOURCE P40-P47.agc:1662
//		TC	INTPRET
// PORT: Fixed ROM slots 16505.
    if slot <> 16505 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[946] to agcAotUnit946@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1663
//		VLOAD
// PORT: Fixed ROM slots 16506.
    16506, 65530,
// PORT: SOURCE P40-P47.agc:1664
//# Page 720
// PORT: SOURCE P40-P47.agc:1665
//			VG
// PORT: Fixed ROM slots 16507.
    16507, 3680,
// PORT: SOURCE P40-P47.agc:1666
//		STORE	VGPREV
// PORT: Fixed ROM slots 16508.
    16508, 4002,
// PORT: SOURCE P40-P47.agc:1667
//		BOFF	VLOAD
// PORT: Fixed ROM slots 16509.
    16509, 64792,
// PORT: SOURCE P40-P47.agc:1668
//			STEERSW		# SKIP TGO AND CROSS-PRODUCT
// PORT: Fixed ROM slots 16510.
    16510, 1480,
// PORT: SOURCE P40-P47.agc:1669
//			QTEMP
// PORT: Fixed ROM slots 16511.
    16511, 3934,
// PORT: SOURCE P40-P47.agc:1670
//			DELVREF
// PORT: Fixed ROM slots 16512.
    16512, 3638,
// PORT: SOURCE P40-P47.agc:1671
//		ABVAL	PUSH		# CHECK FOR LOTHRUST
// PORT: Fixed ROM slots 16513.
    16513, 34380,
// PORT: SOURCE P40-P47.agc:1672
//		SLOAD	DMP
// PORT: Fixed ROM slots 16514.
    16514, 34234,
// PORT: SOURCE P40-P47.agc:1673
//			DVTHRESH	# SC.AT B-2 M/CS
// PORT: Fixed ROM slots 16515.
    16515, 1496,
// PORT: SOURCE P40-P47.agc:1674
//			DPB-9
// PORT: Fixed ROM slots 16516.
    16516, 30738,
// PORT: SOURCE P40-P47.agc:1675
//		BDSU
// PORT: Fixed ROM slots 16517.
    16517, 65314,
// PORT: SOURCE P40-P47.agc:1676
//		BMN	EXIT
// PORT: Fixed ROM slots 16518.
    16518, 65088,
// PORT: SOURCE P40-P47.agc:1677
//			LOTHRUST
// PORT: Fixed ROM slots 16519.
    16519, 33060
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16520–16524.
function agcAotUnit947 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16521 {
        if slot <= 16520 {
// PORT: SOURCE P40-P47.agc:1678
//		CAE	DAPDATR1	# ENABLE TVCDAP CG TRACKING
// PORT: Fixed ROM slots 16520.
            if slot <> 16520 or instruction <> 13110 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 822).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1679
//		MASK	BIT14
// PORT: Fixed ROM slots 16521.
            if slot <> 16521 or instruction <> 31234 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                if fixedOperand = 8192 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16522 {
// PORT: SOURCE P40-P47.agc:1680
//		CCS	A
// PORT: Fixed ROM slots 16522.
            if slot <> 16522 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16523 {
// PORT: SOURCE P40-P47.agc:1681
//		CAF	BIT1
// PORT: Fixed ROM slots 16523.
                if slot <> 16523 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1682
//		INDEX	A		# LM-OFF, LM-ON VALUE
// PORT: Fixed ROM slots 16524.
                if slot <> 16524 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[947] to agcAotUnit947@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1683
//		CAE	EREPFRAC
// PORT: Fixed ROM slots 16525.
    16525, 26146
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16526–16527.
function agcAotUnit948 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16526 {
// PORT: SOURCE P40-P47.agc:1684
//		TS	REPFRAC
// PORT: Fixed ROM slots 16526.
        if slot <> 16526 or instruction <> 23458 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23458, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1685
//
// PORT: SOURCE P40-P47.agc:1686
//		TC	INTPRET
// PORT: Fixed ROM slots 16527.
        if slot <> 16527 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[948] to agcAotUnit948@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1687
//TGOCALC		VLOAD	BVSU		# GET DELVG
// PORT: Fixed ROM slots 16528.
    16528, 42490,
// PORT: SOURCE P40-P47.agc:1688
//			DELVREF
// PORT: Fixed ROM slots 16529.
    16529, 3638,
// PORT: SOURCE P40-P47.agc:1689
//			BDT
// PORT: Fixed ROM slots 16530.
    16530, 3978,
// PORT: SOURCE P40-P47.agc:1690
//		UNIT
// PORT: Fixed ROM slots 16531.
    16531, 65372,
// PORT: SOURCE P40-P47.agc:1691
//		DOT	PUSH		# (00D)
// PORT: Fixed ROM slots 16532.
    16532, 34370,
// PORT: SOURCE P40-P47.agc:1692
//			VG
// PORT: Fixed ROM slots 16533.
    16533, 3680,
// PORT: SOURCE P40-P47.agc:1693
//		BPL	DDV		# ANGLE SHOULD BE GREATER THAN PI/2
// PORT: Fixed ROM slots 16534.
    16534, 47432,
// PORT: SOURCE P40-P47.agc:1694
//			INCRSVG		#	DISPLAY ALARM IF NOT
// PORT: Fixed ROM slots 16535.
    16535, 33048,
// PORT: SOURCE P40-P47.agc:1695
//			2VEXHUST
// PORT: Fixed ROM slots 16536.
    16536, 30730,
// PORT: SOURCE P40-P47.agc:1696
//		DAD	DMP		# (DOT PRODUCT UP FROM 00D)
// PORT: Fixed ROM slots 16537.
    16537, 34074,
// PORT: SOURCE P40-P47.agc:1697
//			LODPHALF
// PORT: Fixed ROM slots 16538.
    16538, 9960,
// PORT: SOURCE P40-P47.agc:1698
//		NORM	SR1
// PORT: Fixed ROM slots 16539.
    16539, 57986,
// PORT: SOURCE P40-P47.agc:1699
//			X1
// PORT: Fixed ROM slots 16540.
    16540, 78,
// PORT: SOURCE P40-P47.agc:1700
//		PDDL	NORM
// PORT: Fixed ROM slots 16541.
    16541, 49578,
// PORT: SOURCE P40-P47.agc:1701
//			36D		# (MAG DELVG)
// PORT: Fixed ROM slots 16542.
    16542, 74,
// PORT: SOURCE P40-P47.agc:1702
//			X2
// PORT: Fixed ROM slots 16543.
    16543, 80,
// PORT: SOURCE P40-P47.agc:1703
//		BDDV
// PORT: Fixed ROM slots 16544.
    16544, 65386,
// PORT: SOURCE P40-P47.agc:1704
//		XSU,2	SL*
// PORT: Fixed ROM slots 16545.
    16545, 44904,
// PORT: SOURCE P40-P47.agc:1705
//			X1
// PORT: Fixed ROM slots 16546.
    16546, 76,
// PORT: SOURCE P40-P47.agc:1706
//			0 -9D,2
// PORT: Fixed ROM slots 16547.
    16547, 48910,
// PORT: SOURCE P40-P47.agc:1707
//		DMP	PUSH		# (00D)
// PORT: Fixed ROM slots 16548.
    16548, 34314,
// PORT: SOURCE P40-P47.agc:1708
//			-FOURDT
// PORT: Fixed ROM slots 16549.
    16549, 30726,
// PORT: SOURCE P40-P47.agc:1709
//		SLOAD	SR
// PORT: Fixed ROM slots 16550.
    16550, 45498,
// PORT: SOURCE P40-P47.agc:1710
//			ETDECAY		# ETDECAY SC.AT B+14 CS
// PORT: Fixed ROM slots 16551.
    16551, 3094,
// PORT: SOURCE P40-P47.agc:1711
//			14D
// PORT: Fixed ROM slots 16552.
    16552, 17182,
// PORT: SOURCE P40-P47.agc:1712
//		BDSU	STADR
// PORT: Fixed ROM slots 16553.
    16553, 38434,
// PORT: SOURCE P40-P47.agc:1713
//		STORE	TGO		# TIME TO GO IN CS. AT +28
// PORT: Fixed ROM slots 16554.
    16554, 61902,
// PORT: SOURCE P40-P47.agc:1714
//		DAD
// PORT: Fixed ROM slots 16555.
    16555, 65306,
// PORT: SOURCE P40-P47.agc:1715
//# Page 721
// PORT: SOURCE P40-P47.agc:1716
//			PIPTIME
// PORT: Fixed ROM slots 16556.
    16556, 1290,
// PORT: SOURCE P40-P47.agc:1717
//		STODL	TIG
// PORT: Fixed ROM slots 16557.
    16557, 15894,
// PORT: SOURCE P40-P47.agc:1718
//			TGO
// PORT: Fixed ROM slots 16558.
    16558, 3632,
// PORT: SOURCE P40-P47.agc:1719
//		DSU	BMN
// PORT: Fixed ROM slots 16559.
    16559, 41002,
// PORT: SOURCE P40-P47.agc:1720
//			FOURSEC
// PORT: Fixed ROM slots 16560.
    16560, 30734,
// PORT: SOURCE P40-P47.agc:1721
//			S40.81
// PORT: Fixed ROM slots 16561.
    16561, 33026,
// PORT: SOURCE P40-P47.agc:1722
//
// PORT: SOURCE P40-P47.agc:1723
//XPRODUCT	VLOAD	VXSC
// PORT: Fixed ROM slots 16562.
    16562, 61946,
// PORT: SOURCE P40-P47.agc:1724
//			BDT
// PORT: Fixed ROM slots 16563.
    16563, 3978,
// PORT: SOURCE P40-P47.agc:1725
//			CSTEER
// PORT: Fixed ROM slots 16564.
    16564, 3974,
// PORT: SOURCE P40-P47.agc:1726
//		VSL2	VSU
// PORT: Fixed ROM slots 16565.
    16565, 43476,
// PORT: SOURCE P40-P47.agc:1727
//			DELVREF
// PORT: Fixed ROM slots 16566.
    16566, 3638,
// PORT: SOURCE P40-P47.agc:1728
//		UNIT	PDVL
// PORT: Fixed ROM slots 16567.
    16567, 52572,
// PORT: SOURCE P40-P47.agc:1729
//			VG
// PORT: Fixed ROM slots 16568.
    16568, 3680,
// PORT: SOURCE P40-P47.agc:1730
//		UNIT	VXV
// PORT: Fixed ROM slots 16569.
    16569, 40284,
// PORT: SOURCE P40-P47.agc:1731
//		MXV	CALL
// PORT: Fixed ROM slots 16570.
    16570, 38050,
// PORT: SOURCE P40-P47.agc:1732
//			REFSMMAT	# (REFSMMAT/2)
// PORT: Fixed ROM slots 16571.
    16571, 1980,
// PORT: SOURCE P40-P47.agc:1733
//			*SMNB*
// PORT: Fixed ROM slots 16572.
    16572, 40776,
// PORT: SOURCE P40-P47.agc:1734
//		VXSC
// PORT: Fixed ROM slots 16573.
    16573, 65506,
// PORT: SOURCE P40-P47.agc:1735
//			KPRIMEDT	# (KPRIMEDT SCIAT PI/8 RAD)
// PORT: Fixed ROM slots 16574.
    16574, 3386,
// PORT: SOURCE P40-P47.agc:1736
//OMEGACLC	STORE	OMEGAC
// PORT: Fixed ROM slots 16575.
    16575, 3244,
// PORT: SOURCE P40-P47.agc:1737
//		GOTO
// PORT: Fixed ROM slots 16576.
    16576, 65360,
// PORT: SOURCE P40-P47.agc:1738
//			QTEMP
// PORT: Fixed ROM slots 16577.
    16577, 3934,
// PORT: SOURCE P40-P47.agc:1739
//
// PORT: SOURCE P40-P47.agc:1740
//		SETLOC	DAPS7
// PORT: SOURCE P40-P47.agc:1741
//		BANK
// PORT: SOURCE P40-P47.agc:1742
//		COUNT	17/S40.8
// PORT: SOURCE P40-P47.agc:1743
//
// PORT: SOURCE P40-P47.agc:1744
//TWODT		2DEC	200.0 B-28	# 2 SEC
// PORT: Fixed ROM slots 17408 17409.
    17408, 0, 17409, 400,
// PORT: SOURCE P40-P47.agc:1745
//
// PORT: SOURCE P40-P47.agc:1746
//-FOURDT		2DEC	-800 B-18	# -4(200CS), SC.AT B+18CS (-4 FOR SCALING)
// PORT: Fixed ROM slots 17410 17411.
    17410, 65434, 17411, 65534,
// PORT: SOURCE P40-P47.agc:1747
//
// PORT: SOURCE P40-P47.agc:1748
//2VEXHUST	2DEC	63.020792 B-7	# 2(10338.0564 FPS), SC.AT B+7 M/CS
// PORT: Fixed ROM slots 17412 17413.
    17412, 16132, 17413, 21672,
// PORT: SOURCE P40-P47.agc:1749
//
// PORT: SOURCE P40-P47.agc:1750
//FOURSEC		2DEC	400.0 B-28	# 4 SEC
// PORT: Fixed ROM slots 17414 17415.
    17414, 0, 17415, 800,
// PORT: SOURCE P40-P47.agc:1751
//
// PORT: SOURCE P40-P47.agc:1752
//DPB-9		2DEC	1 B-9
// PORT: Fixed ROM slots 17416 17417.
    17416, 64, 17417, 0,
// PORT: SOURCE P40-P47.agc:1753
//
// PORT: SOURCE P40-P47.agc:1754
//		SETLOC	DAPS6
// PORT: SOURCE P40-P47.agc:1755
//		BANK
// PORT: SOURCE P40-P47.agc:1756
//
// PORT: SOURCE P40-P47.agc:1757
//		COUNT	20/S40.8
// PORT: SOURCE P40-P47.agc:1758
//
// PORT: SOURCE P40-P47.agc:1759
//S40.81		SET	VLOAD		# TGO LESS THAN 4 SECONDS
// PORT: Fixed ROM slots 18561.
    18561, 64792,
// PORT: SOURCE P40-P47.agc:1760
//			IMPULSW		# FOR ENGINE-OFF CALL
// PORT: Fixed ROM slots 18562.
    18562, 1132,
// PORT: SOURCE P40-P47.agc:1761
//			HI6ZEROS
// PORT: Fixed ROM slots 18563.
    18563, 13754,
// PORT: SOURCE P40-P47.agc:1762
//RATEZRO		STORE	OMEGAC		# TVC TO ATTITUDE HOLD
// PORT: Fixed ROM slots 18564.
    18564, 3244,
// PORT: SOURCE P40-P47.agc:1763
//		EXIT
// PORT: Fixed ROM slots 18565.
    18565, 65532
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18566–18568.
function agcAotUnit1088 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18566 {
// PORT: SOURCE P40-P47.agc:1764
//		CAF	POSMAX		# INHIBIT SWITCHOVER/TVC EG TRACKING
// PORT: Fixed ROM slots 18566.
        if slot <> 18566 or instruction <> 14847 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18567 {
// PORT: SOURCE P40-P47.agc:1765
//		TS	CNTR
// PORT: Fixed ROM slots 18567.
            if slot <> 18567 or instruction <> 23335 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23335, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1766
//# Page 722
// PORT: SOURCE P40-P47.agc:1767
//		TC	INTPRET
// PORT: Fixed ROM slots 18568.
            if slot <> 18568 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1088] to agcAotUnit1088@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1768
//		CLEAR	GOTO
// PORT: Fixed ROM slots 18569.
    18569, 43032,
// PORT: SOURCE P40-P47.agc:1769
//			STEERSW		# RESTARTS OK
// PORT: Fixed ROM slots 18570.
    18570, 1384,
// PORT: SOURCE P40-P47.agc:1770
//			QTEMP
// PORT: Fixed ROM slots 18571.
    18571, 3934,
// PORT: SOURCE P40-P47.agc:1771
//INCRSVG		EXIT			# ALARM INDICATING THAT THRUST IS POINTING
// PORT: Fixed ROM slots 18572.
    18572, 65532
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18573–18573.
function agcAotUnit1089 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1772
//		TC	ALARM		# IN WRONG DIRECTION.
// PORT: Fixed ROM slots 18573.
    if slot <> 18573 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1089] to agcAotUnit1089@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1773
//		OCT	01407
// PORT: Fixed ROM slots 18574.
    18574, 1550
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18575–18575.
function agcAotUnit1090 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1774
//		TC	INTPRET
// PORT: Fixed ROM slots 18575.
    if slot <> 18575 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1090] to agcAotUnit1090@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1775
//		GOTO
// PORT: Fixed ROM slots 18576.
    18576, 65360,
// PORT: SOURCE P40-P47.agc:1776
//			QTEMP
// PORT: Fixed ROM slots 18577.
    18577, 3934,
// PORT: SOURCE P40-P47.agc:1777
//
// PORT: SOURCE P40-P47.agc:1778
//LOTHRUST	BON	VLOAD		# THRUST FAILURE (LO-OR-NO) INDICATED
// PORT: Fixed ROM slots 18578.
    18578, 64792,
// PORT: SOURCE P40-P47.agc:1779
//			IDLEFAIL	# SET BY V97P.  ALLOWS 1 BYPASS IN CASE OF
// PORT: Fixed ROM slots 18579.
    18579, 914,
// PORT: SOURCE P40-P47.agc:1780
//			QTEMP		#	UNFAVORABLE S40.8 SYNCH.
// PORT: Fixed ROM slots 18580.
    18580, 3934,
// PORT: SOURCE P40-P47.agc:1781
//			HI6ZEROS	# START OF ENGINE-FAIL (R40) OPERATIONS
// PORT: Fixed ROM slots 18581.
    18581, 13754,
// PORT: SOURCE P40-P47.agc:1782
//		STORE	OMEGAC		# PUT TVC IN ATTITUDE HOLD
// PORT: Fixed ROM slots 18582.
    18582, 3244,
// PORT: SOURCE P40-P47.agc:1783
//		EXIT
// PORT: Fixed ROM slots 18583.
    18583, 65532
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18584–18589.
function agcAotUnit1091 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18586 {
        if slot <= 18584 {
// PORT: SOURCE P40-P47.agc:1784
//
// PORT: SOURCE P40-P47.agc:1785
//		CS	ZERO
// PORT: Fixed ROM slots 18584.
            if slot <> 18584 or instruction <> 18961 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18585 {
// PORT: SOURCE P40-P47.agc:1786
//		TS	VCNTR		# KILL CSMMASS UPDATING
// PORT: Fixed ROM slots 18585.
                if slot <> 18585 or instruction <> 23459 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1787
//		TS	VCNTRTMP	# (TVCEXEC LOGIC REQUIRES THIS TOO)
// PORT: Fixed ROM slots 18586.
                if slot <> 18586 or instruction <> 23467 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23467, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18587 {
// PORT: SOURCE P40-P47.agc:1788
//		TS	REPFRAC		# KILL TVCDAP CG TRIM TRACKING
// PORT: Fixed ROM slots 18587.
            if slot <> 18587 or instruction <> 23458 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23458, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18588 {
// PORT: SOURCE P40-P47.agc:1789
//		TS	NVWORD1		# SET UP ENGINE-FAIL V97FLASH (CLOCKJOB)
// PORT: Fixed ROM slots 18588.
                if slot <> 18588 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1790
//
// PORT: SOURCE P40-P47.agc:1791
//		TC	INTPRET
// PORT: Fixed ROM slots 18589.
                if slot <> 18589 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1091] to agcAotUnit1091@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1792
//		CLEAR	GOTO		# INHIBIT STEERING AND TGO CALC (MANUAL
// PORT: Fixed ROM slots 18590.
    18590, 43032,
// PORT: SOURCE P40-P47.agc:1793
//			STEERSW		# 	SHUTDOWN IF NOT SET UP AGAIN)
// PORT: Fixed ROM slots 18591.
    18591, 1384,
// PORT: SOURCE P40-P47.agc:1794
//			QTEMP		# RESTARTS OK
// PORT: Fixed ROM slots 18592.
    18592, 3934
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16578–16578.
function agcAotUnit949 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1795
//
// PORT: SOURCE P40-P47.agc:1796
//# Page 723
// PORT: SOURCE P40-P47.agc:1797
//# NAME		S40.9 -- VTOGAIN (AIMPOINT MANEUVERS ONLY)
// PORT: SOURCE P40-P47.agc:1798
//# FUNCTION	(1) GENERATES REQUIRED VELOCITY AND VELOCITY-TO-BE-GAINED
// PORT: SOURCE P40-P47.agc:1799
//#		VECTORS FOR USE DURING AIMPOINT MANEUVERS.
// PORT: SOURCE P40-P47.agc:1800
//#		(2) UPDATES THE B VECTOR WHICH IS USED IN THE FINAL
// PORT: SOURCE P40-P47.agc:1801
//#		CALCULATION OF EXTRAPOLATING THE VELOCITY-TO-BE-GAINED.
// PORT: SOURCE P40-P47.agc:1802
//# CALLING SEQ	VIA FINDVEC AS NEW JOB.
// PORT: SOURCE P40-P47.agc:1803
//# INPUT		RNIT	ACTIVE VEHICLE RADIUS VECTOR IN METERS AT +29.
// PORT: SOURCE P40-P47.agc:1804
//#		VNIT	ACTIVE VEHICLE VELOCITY VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1805
//#		VRPREV	LAST COMPUTED VELOCITY REQUIRED VECTOR IN
// PORT: SOURCE P40-P47.agc:1806
//#			METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1807
//#		NONTIG	TIME OF IGN.  USED IN TARGETTING ROUTINES B+28
// PORT: SOURCE P40-P47.agc:1808
//#		DELLT4	TRANSFER TIME FROM PIPTIME TO TARGET B+28
// PORT: SOURCE P40-P47.agc:1809
//#		TNIT	TIME OF RNIT AND VNIT IN CS AT +28
// PORT: SOURCE P40-P47.agc:1810
//#		GDT/2	HALF OF VELOCITY GAINED IN DELTA T TIME DUE TO
// PORT: SOURCE P40-P47.agc:1811
//#			ACCELERATION OF GRAVITY IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1812
//#		DELVREF	CHANGE IN VELOCITY DURING LAST 2 SEC IN
// PORT: SOURCE P40-P47.agc:1813
//#			METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1814
//#		NORMSW	SET=CENTRAL ANGLE BETWEEN RTARG AND RTIG IS BETWEEN
// PORT: SOURCE P40-P47.agc:1815
//#			165 TO 195 DEGREES.
// PORT: SOURCE P40-P47.agc:1816
//#			RESET=CENTRAL ANGLE OUTSIDE CONE DESCRIBED ABOVE.
// PORT: SOURCE P40-P47.agc:1817
//# OUTPUT	VGTEMP	VELOCITY TO BE GAINED VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1818
//#		COGA	INPUT OF INITIAL GUESS FOR LAMBERT FROM S40.1
// PORT: SOURCE P40-P47.agc:1819
//#			OR PREVIOUS PASS THRU S40.9.
// PORT: SOURCE P40-P47.agc:1820
//#		GOBL/2	OBLATENESS TERM IN AVG GRAV CALC: GOBL*RSQ/MU
// PORT: SOURCE P40-P47.agc:1821
//#		VRPREV/	VELOCITY REQUIRED VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1822
//#		BDT	B VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1823
//# SUBROUTINES USED -- INITVEL
// PORT: SOURCE P40-P47.agc:1824
//
// PORT: SOURCE P40-P47.agc:1825
//		SETLOC	P40S1
// PORT: SOURCE P40-P47.agc:1826
//		BANK
// PORT: SOURCE P40-P47.agc:1827
//
// PORT: SOURCE P40-P47.agc:1828
//		EBANK=	NBRCYCLS
// PORT: SOURCE P40-P47.agc:1829
//		COUNT	16/S40.9
// PORT: SOURCE P40-P47.agc:1830
//
// PORT: SOURCE P40-P47.agc:1831
//S40.9		TC	INTPRET
// PORT: Fixed ROM slots 16578.
    if slot <> 16578 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[949] to agcAotUnit949@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1832
//		SETPD	DLOAD
// PORT: Fixed ROM slots 16579.
    16579, 58626,
// PORT: SOURCE P40-P47.agc:1833
//			00D
// PORT: Fixed ROM slots 16580.
    16580, 2,
// PORT: SOURCE P40-P47.agc:1834
//			LO6ZEROS
// PORT: Fixed ROM slots 16581.
    16581, 9964,
// PORT: SOURCE P40-P47.agc:1835
//		PDDL
// PORT: Fixed ROM slots 16582.
    16582, 65450,
// PORT: SOURCE P40-P47.agc:1836
//			EP4(45)L
// PORT: Fixed ROM slots 16583.
    16583, 29224,
// PORT: SOURCE P40-P47.agc:1837
//		BON	DLOAD
// PORT: Fixed ROM slots 16584.
    16584, 58648,
// PORT: SOURCE P40-P47.agc:1838
//			NORMSW
// PORT: Fixed ROM slots 16585.
    16585, 3978,
// PORT: SOURCE P40-P47.agc:1839
//			+2
// PORT: Fixed ROM slots 16586.
    16586, 29080,
// PORT: SOURCE P40-P47.agc:1840
//			EP4(10)L
// PORT: Fixed ROM slots 16587.
    16587, 29228,
// PORT: SOURCE P40-P47.agc:1841
//		PUSH
// PORT: Fixed ROM slots 16588.
    16588, 65292,
// PORT: SOURCE P40-P47.agc:1842
//		CLEAR	CALL
// PORT: Fixed ROM slots 16589.
    16589, 37912,
// PORT: SOURCE P40-P47.agc:1843
//			GUESSW
// PORT: Fixed ROM slots 16590.
    16590, 890,
// PORT: SOURCE P40-P47.agc:1844
//			HAVEGUES
// PORT: Fixed ROM slots 16591.
    16591, 18436,
// PORT: SOURCE P40-P47.agc:1845
//		EXIT
// PORT: Fixed ROM slots 16592.
    16592, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16593–16593.
function agcAotUnit950 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1846
//		TC	PHASCHNG	# SAVE TIME BY NOT REDOING LAMBERT CALCS
// PORT: Fixed ROM slots 16593.
    if slot <> 16593 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[950] to agcAotUnit950@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1847
//		OCT	05021		# C, PRIORITY NEXT, JOB BELOW
// PORT: Fixed ROM slots 16594.
    16594, 5154,
// PORT: SOURCE P40-P47.agc:1848
//# Page 724
// PORT: SOURCE P40-P47.agc:1849
//		OCT	10000
// PORT: Fixed ROM slots 16595.
    16595, 8192
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16596–16596.
function agcAotUnit951 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1850
//		TC	INTPRET
// PORT: Fixed ROM slots 16596.
    if slot <> 16596 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[951] to agcAotUnit951@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1851
//ENDLAMB		BON
// PORT: Fixed ROM slots 16597.
    16597, 65304,
// PORT: SOURCE P40-P47.agc:1852
//			FIRSTFLG
// PORT: Fixed ROM slots 16598.
    16598, 1424,
// PORT: SOURCE P40-P47.agc:1853
//			FIRSTTME
// PORT: Fixed ROM slots 16599.
    16599, 29130,
// PORT: SOURCE P40-P47.agc:1854
//		VLOAD	VSU
// PORT: Fixed ROM slots 16600.
    16600, 43514,
// PORT: SOURCE P40-P47.agc:1855
//			VIPRIME
// PORT: Fixed ROM slots 16601.
    16601, 3860,
// PORT: SOURCE P40-P47.agc:1856
//			VRPREV
// PORT: Fixed ROM slots 16602.
    16602, 3692,
// PORT: SOURCE P40-P47.agc:1857
//		PDDL	DSU
// PORT: Fixed ROM slots 16603.
    16603, 38314,
// PORT: SOURCE P40-P47.agc:1858
//			TNIT
// PORT: Fixed ROM slots 16604.
    16604, 3704,
// PORT: SOURCE P40-P47.agc:1859
//			TNITPREV
// PORT: Fixed ROM slots 16605.
    16605, 3708,
// PORT: SOURCE P40-P47.agc:1860
//		SL	BDDV
// PORT: Fixed ROM slots 16606.
    16606, 46434,
// PORT: SOURCE P40-P47.agc:1861
//			17D
// PORT: Fixed ROM slots 16607.
    16607, 16676,
// PORT: SOURCE P40-P47.agc:1862
//			200CSHI
// PORT: Fixed ROM slots 16608.
    16608, 29216,
// PORT: SOURCE P40-P47.agc:1863
//		VXSC
// PORT: Fixed ROM slots 16609.
    16609, 65506,
// PORT: SOURCE P40-P47.agc:1864
//		VSU	VSL1
// PORT: Fixed ROM slots 16610.
    16610, 64082,
// PORT: SOURCE P40-P47.agc:1865
//			GDT/2
// PORT: Fixed ROM slots 16611.
    16611, 1294,
// PORT: SOURCE P40-P47.agc:1866
//		STORE	BDT
// PORT: Fixed ROM slots 16612.
    16612, 3978,
// PORT: SOURCE P40-P47.agc:1867
//FIRSTTME	SLOAD	DCOMP
// PORT: Fixed ROM slots 16613.
    16613, 48826,
// PORT: SOURCE P40-P47.agc:1868
//			RTX2
// PORT: Fixed ROM slots 16614.
    16614, 4046,
// PORT: SOURCE P40-P47.agc:1869
//		BMN
// PORT: Fixed ROM slots 16615.
    16615, 65344,
// PORT: SOURCE P40-P47.agc:1870
//			MOONCASE
// PORT: Fixed ROM slots 16616.
    16616, 29162,
// PORT: SOURCE P40-P47.agc:1871
//		VLOAD	UNIT
// PORT: Fixed ROM slots 16617.
    16617, 44794,
// PORT: SOURCE P40-P47.agc:1872
//			RN
// PORT: Fixed ROM slots 16618.
    16618, 1266,
// PORT: SOURCE P40-P47.agc:1873
//		DLOAD	DSU
// PORT: Fixed ROM slots 16619.
    16619, 38346,
// PORT: SOURCE P40-P47.agc:1874
//			PIPTIME
// PORT: Fixed ROM slots 16620.
    16620, 1290,
// PORT: SOURCE P40-P47.agc:1875
//			NOMTIG
// PORT: Fixed ROM slots 16621.
    16621, 3664,
// PORT: SOURCE P40-P47.agc:1876
//		DMP	DDV
// PORT: Fixed ROM slots 16622.
    16622, 47370,
// PORT: SOURCE P40-P47.agc:1877
//			EARTHMU
// PORT: Fixed ROM slots 16623.
    16623, 29220,
// PORT: SOURCE P40-P47.agc:1878
//			34D
// PORT: Fixed ROM slots 16624.
    16624, 70,
// PORT: SOURCE P40-P47.agc:1879
//		VXSC	VAD
// PORT: Fixed ROM slots 16625.
    16625, 44514,
// PORT: SOURCE P40-P47.agc:1880
//			GOBL/2
// PORT: Fixed ROM slots 16626.
    16626, 1306,
// PORT: SOURCE P40-P47.agc:1881
//			VGTEMP		# NOTE: NO TEST IS MADE TO SUBTRACT GOBL
// PORT: Fixed ROM slots 16627.
    16627, 3916,
// PORT: SOURCE P40-P47.agc:1882
//		STORE	VGTEMP		# INSIDE 165-195 DEGREE CONE AREA.
// PORT: Fixed ROM slots 16628.
    16628, 3916,
// PORT: SOURCE P40-P47.agc:1883
//MOONCASE	EXIT
// PORT: Fixed ROM slots 16629.
    16629, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16630–16630.
function agcAotUnit952 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1884
//		TC	PHASCHNG
// PORT: Fixed ROM slots 16630.
    if slot <> 16630 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[952] to agcAotUnit952@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1885
//		OCT	04021		# C, JOB BELOW
// PORT: Fixed ROM slots 16631.
    16631, 4130
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16632–16632.
function agcAotUnit953 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1886
//
// PORT: SOURCE P40-P47.agc:1887
//COPY40.9	TC	INTPRET
// PORT: Fixed ROM slots 16632.
    if slot <> 16632 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[953] to agcAotUnit953@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1888
//		DLOAD
// PORT: Fixed ROM slots 16633.
    16633, 65482,
// PORT: SOURCE P40-P47.agc:1889
//			TNIT
// PORT: Fixed ROM slots 16634.
    16634, 3704,
// PORT: SOURCE P40-P47.agc:1890
//		STOVL	TNITPREV
// PORT: Fixed ROM slots 16635.
    16635, 24188,
// PORT: SOURCE P40-P47.agc:1891
//			VIPRIME
// PORT: Fixed ROM slots 16636.
    16636, 3860,
// PORT: SOURCE P40-P47.agc:1892
//		STORE	VRPREV
// PORT: Fixed ROM slots 16637.
    16637, 3692,
// PORT: SOURCE P40-P47.agc:1893
//		CLEAR	EXIT
// PORT: Fixed ROM slots 16638.
    16638, 65048,
// PORT: SOURCE P40-P47.agc:1894
//			FIRSTFLG
// PORT: Fixed ROM slots 16639.
    16639, 1392
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16640–16642.
function agcAotUnit954 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16640 {
// PORT: SOURCE P40-P47.agc:1895
//	-2	CS	ONE		# REDO40.9 (RESTART) ENTRY TO END S40.9
// PORT: Fixed ROM slots 16640.
        if slot <> 16640 or instruction <> 18959 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16641 {
// PORT: SOURCE P40-P47.agc:1896
//		TS	NBRCYCLS
// PORT: Fixed ROM slots 16641.
            if slot <> 16641 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:1897
//ENDS40.9	TC	PHASCHNG
// PORT: Fixed ROM slots 16642.
            if slot <> 16642 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[954] to agcAotUnit954@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1898
//		OCT	00001
// PORT: Fixed ROM slots 16643.
    16643, 2
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16644–16645.
function agcAotUnit955 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16644 {
// PORT: SOURCE P40-P47.agc:1899
//# Page 725
// PORT: SOURCE P40-P47.agc:1900
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 16644.
        if slot <> 16644 or instruction <> 6799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:1901
//
// PORT: SOURCE P40-P47.agc:1902
//REDO40.9	TC	INTPRET		# S40.9 RESTARTS COME HERE TO GRACEFULLY
// PORT: Fixed ROM slots 16645.
        if slot <> 16645 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[955] to agcAotUnit955@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1903
//		VLOAD			#	TERMINATE S40.9 SO THAT IT CAN BE
// PORT: Fixed ROM slots 16646.
    16646, 65530,
// PORT: SOURCE P40-P47.agc:1904
//			LO6ZEROS	#	SET UP WITH LATEST R,V,T NEXT PASS
// PORT: Fixed ROM slots 16647.
    16647, 9964,
// PORT: SOURCE P40-P47.agc:1905
//		STODL	DELVSUM		#	(TYPE C PHASE POINTS '04021' WILL
// PORT: Fixed ROM slots 16648.
    16648, 15818,
// PORT: SOURCE P40-P47.agc:1906
//			LO6ZEROS	#	FORCE NORMAL S40.9 TERMINATIONS,
// PORT: Fixed ROM slots 16649.
    16649, 9964,
// PORT: SOURCE P40-P47.agc:1907
//		STOVL	NBRCYCLS	#	RATHER THAN LOSE TIME OF BRAND NEW
// PORT: Fixed ROM slots 16650.
    16650, 24006,
// PORT: SOURCE P40-P47.agc:1908
//			VGPREV		#	PASS -- QUICK OLD DATA BETTER THAN
// PORT: Fixed ROM slots 16651.
    16651, 4002,
// PORT: SOURCE P40-P47.agc:1909
//		STORE	VGTEMP		#	NONE) NOW CAN GO THRU SETUP.9
// PORT: Fixed ROM slots 16652.
    16652, 3916,
// PORT: SOURCE P40-P47.agc:1910
//		EXIT			#	WITHOUT DISTURBING VGPREV.
// PORT: Fixed ROM slots 16653.
    16653, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16654–16654.
function agcAotUnit956 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1911
//		TCF	ENDS40.9 -2	# STORE 0,0 COVERED NBRCYCLS,P -- FIX UP S
// PORT: Fixed ROM slots 16654.
    if slot <> 16654 or instruction <> 5376 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5376, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[956] to agcAotUnit956@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1912
//
// PORT: SOURCE P40-P47.agc:1913
//200CSHI		2DEC	200 B-12
// PORT: Fixed ROM slots 16655 16656.
    16655, 1600, 16656, 0,
// PORT: SOURCE P40-P47.agc:1914
//
// PORT: SOURCE P40-P47.agc:1915
//EARTHMU		2DEC*	-3.986032 E10 B-36*
// PORT: Fixed ROM slots 16657 16658.
    16657, 46528, 16658, 51088,
// PORT: SOURCE P40-P47.agc:1916
//
// PORT: SOURCE P40-P47.agc:1917
//EP4(45)L	2DEC	.125
// PORT: Fixed ROM slots 16659 16660.
    16659, 4096, 16660, 0,
// PORT: SOURCE P40-P47.agc:1918
//
// PORT: SOURCE P40-P47.agc:1919
//EP4(10)L	2DEC	.027777777
// PORT: Fixed ROM slots 16661 16662.
    16661, 910, 16662, 3640
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16663–16663.
function agcAotUnit957 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1920
//
// PORT: SOURCE P40-P47.agc:1921
//# Page 726
// PORT: SOURCE P40-P47.agc:1922
//# NAME:  		S40.13 -- TIMEBURN
// PORT: SOURCE P40-P47.agc:1923
//#
// PORT: SOURCE P40-P47.agc:1924
//# FUNCTION		(1) DETERMINE WHETHER A GIVEN COMBINATION OF VELOCITY-TO-
// PORT: SOURCE P40-P47.agc:1925
//#			BE-GAINED AND ENGINE CHOICE RESULT IN A BURN TIME SUFFICIENT
// PORT: SOURCE P40-P47.agc:1926
//#			TO ALLOW STEERING AT THE VEHICLE DURING THE BURN, AND
// PORT: SOURCE P40-P47.agc:1927
//#			(2) THE MAGNITUDE OF THE RESULTING BURN TIME -- IF IT IS SHORT --
// PORT: SOURCE P40-P47.agc:1928
//#			AND THE ASSOCIATED TIME OF THE ENGINE OFF SIGNAL.
// PORT: SOURCE P40-P47.agc:1929
//#
// PORT: SOURCE P40-P47.agc:1930
//# CALLING SEQUENCE	VIA FINDVAC AS A NEW JOB
// PORT: SOURCE P40-P47.agc:1931
//#
// PORT: SOURCE P40-P47.agc:1932
//# INPUT			VGTIG -- VELOCITY TO BE GAINED VECTOR (METERS/CS) AT +7
// PORT: SOURCE P40-P47.agc:1933
//#			WEIGHT/G -- MASS OF VEHICLE IN KGM AT TIG
// PORT: SOURCE P40-P47.agc:1934
//#			F -- ENGINE THRUST IN M.NEWTONS AT +7
// PORT: SOURCE P40-P47.agc:1935
//#			MDOT -- RATE OF DECREASE OF VEHICLE MASS DURING ENGINE BURN
// PORT: SOURCE P40-P47.agc:1936
//#				IN KILOGRAMS/CENTISECOND AT +3.  THIS SCALING MAY
// PORT: SOURCE P40-P47.agc:1937
//#				REQUIRE MODIFICATION FOR SATURN BURNS.
// PORT: SOURCE P40-P47.agc:1938
//#
// PORT: SOURCE P40-P47.agc:1939
//# OUTPUT		IMPULSW		ZERO FOR STEERING
// PORT: SOURCE P40-P47.agc:1940
//#					ONE FOR ATTITUDE HOLD
// PORT: SOURCE P40-P47.agc:1941
//#			TGO		TIME TO BURN IN CENTISECONDS AT +14
// PORT: SOURCE P40-P47.agc:1942
//#			THE QUANTITY M.NEWTON SHALL BE USED TO EXPRESS WEIGHT IN TERMS OF
// PORT: SOURCE P40-P47.agc:1943
//#			(KILOGRAM*METER)/(CENTISECOND*CENTISECOND)
// PORT: SOURCE P40-P47.agc:1944
//#			(1) M.NEWTON = (10000) NEWTONS.
// PORT: SOURCE P40-P47.agc:1945
//
// PORT: SOURCE P40-P47.agc:1946
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:1947
//		COUNT	16/40.13
// PORT: SOURCE P40-P47.agc:1948
//
// PORT: SOURCE P40-P47.agc:1949
//S40.13		TC	INTPRET
// PORT: Fixed ROM slots 16663.
    if slot <> 16663 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[957] to agcAotUnit957@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1950
//		SETPD	SET
// PORT: Fixed ROM slots 16664.
    16664, 35842,
// PORT: SOURCE P40-P47.agc:1951
//			00D
// PORT: Fixed ROM slots 16665.
    16665, 2,
// PORT: SOURCE P40-P47.agc:1952
//			IMPULSW		# ASSUME NO STEERING UNTIL FOUND OTHERWISE
// PORT: Fixed ROM slots 16666.
    16666, 1132,
// PORT: SOURCE P40-P47.agc:1953
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 16667.
    16667, 42746,
// PORT: SOURCE P40-P47.agc:1954
//			VGTIG		# VELOCITY TO BE GAINED AT +7
// PORT: Fixed ROM slots 16668.
    16668, 4002,
// PORT: SOURCE P40-P47.agc:1955
//		EXIT
// PORT: Fixed ROM slots 16669.
    16669, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16670–16676.
function agcAotUnit958 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16672 {
        if slot <= 16670 {
// PORT: SOURCE P40-P47.agc:1956
//		CAF	BIT7		# TEST +X TRANSLATION
// PORT: Fixed ROM slots 16670.
            if slot <> 16670 or instruction <> 14857 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16671 {
// PORT: SOURCE P40-P47.agc:1957
//		EXTEND
// PORT: Fixed ROM slots 16671.
                if slot <> 16671 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1958
//		RXOR	CHAN31
// PORT: Fixed ROM slots 16672.
                if slot <> 16672 or instruction <> 3097 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16674 {
            if slot <= 16673 {
// PORT: SOURCE P40-P47.agc:1959
//		MASK	BIT7
// PORT: Fixed ROM slots 16673.
                if slot <> 16673 or instruction <> 31241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                    if fixedOperand = 64 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1960
//		EXTEND
// PORT: Fixed ROM slots 16674.
                if slot <> 16674 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16675 {
// PORT: SOURCE P40-P47.agc:1961
//		BZF	NOTADDUL
// PORT: Fixed ROM slots 16675.
                if slot <> 16675 or instruction <> 5461 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1962
//		TC 	INTPRET
// PORT: Fixed ROM slots 16676.
                if slot <> 16676 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[958] to agcAotUnit958@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1963
//		PDDL	DDV		# 00D = MAG OF VGTIG AT +7
// PORT: Fixed ROM slots 16677.
    16677, 47530,
// PORT: SOURCE P40-P47.agc:1964
//			S40.135		# COMPENSATION FOR 2 JET ULLAGE AT +24
// PORT: Fixed ROM slots 16678.
    16678, 30754,
// PORT: SOURCE P40-P47.agc:1965
//			WEIGHT/G	# MASS IN KGMS AT +16
// PORT: Fixed ROM slots 16679.
    16679, 3196,
// PORT: SOURCE P40-P47.agc:1966
//		BON	SL1		# DOUBLE CORRECTION IF FOUR JETS
// PORT: Fixed ROM slots 16680.
    16680, 59928,
// PORT: SOURCE P40-P47.agc:1967
//			NJETSFLG
// PORT: Fixed ROM slots 16681.
    16681, 896,
// PORT: SOURCE P40-P47.agc:1968
//			S40.130
// PORT: Fixed ROM slots 16682.
    16682, 29270,
// PORT: SOURCE P40-P47.agc:1969
//S40.130		BDSU
// PORT: Fixed ROM slots 16683.
    16683, 65314,
// PORT: SOURCE P40-P47.agc:1970
//		PDDL	DDV		# 00D = MAG OF VGTIG CORRECTED FOR ULLAGE
// PORT: Fixed ROM slots 16684.
    16684, 47530,
// PORT: SOURCE P40-P47.agc:1971
//			K1VAL		# M.NEWTON-CS AT +24
// PORT: Fixed ROM slots 16685.
    16685, 2032,
// PORT: SOURCE P40-P47.agc:1972
//			WEIGHT/G
// PORT: Fixed ROM slots 16686.
    16686, 3196,
// PORT: SOURCE P40-P47.agc:1973
//		BDSU	BMN
// PORT: Fixed ROM slots 16687.
    16687, 40994,
// PORT: SOURCE P40-P47.agc:1974
//			00D
// PORT: Fixed ROM slots 16688.
    16688, 2,
// PORT: SOURCE P40-P47.agc:1975
//			S40.131		# TGO LESS THAN 100 CS
// PORT: Fixed ROM slots 16689.
    16689, 29320,
// PORT: SOURCE P40-P47.agc:1976
//		PDDL	DMP		# 02D = TEMP1 AT +7
// PORT: Fixed ROM slots 16690.
    16690, 34218,
// PORT: SOURCE P40-P47.agc:1977
//# Page 727
// PORT: SOURCE P40-P47.agc:1978
//			EMDOT		# SPS FLOW RATE SC.AT B+3 KG/CS (SP, NOTE)
// PORT: Fixed ROM slots 16691.
    16691, 146,
// PORT: SOURCE P40-P47.agc:1979
//			3.5SEC		# 350 CS AT +14
// PORT: Fixed ROM slots 16692.
    16692, 30746,
// PORT: SOURCE P40-P47.agc:1980
//		BDSU	PDDL
// PORT: Fixed ROM slots 16693.
    16693, 54562,
// PORT: SOURCE P40-P47.agc:1981
//			WEIGHT/G
// PORT: Fixed ROM slots 16694.
    16694, 3196,
// PORT: SOURCE P40-P47.agc:1982
//			FANG
// PORT: Fixed ROM slots 16695.
    16695, 2042,
// PORT: SOURCE P40-P47.agc:1983
//		DMP	SR2
// PORT: Fixed ROM slots 16696.
    16696, 49674,
// PORT: SOURCE P40-P47.agc:1984
//			5SECOND		# 500 CS AT +14
// PORT: Fixed ROM slots 16697.
    16697, 30750,
// PORT: SOURCE P40-P47.agc:1985
//		DDV	PUSH		# 04D = TEMP2
// PORT: Fixed ROM slots 16698.
    16698, 34418,
// PORT: SOURCE P40-P47.agc:1986
//		BDSU	BPL
// PORT: Fixed ROM slots 16699.
    16699, 42018,
// PORT: SOURCE P40-P47.agc:1987
//			02D
// PORT: Fixed ROM slots 16700.
    16700, 6,
// PORT: SOURCE P40-P47.agc:1988
//			S40.133		# TGO GREATER THAN 600 CS
// PORT: Fixed ROM slots 16701.
    16701, 29344,
// PORT: SOURCE P40-P47.agc:1989
//		DLOAD	BDDV
// PORT: Fixed ROM slots 16702.
    16702, 46538,
// PORT: SOURCE P40-P47.agc:1990
//		DMP	DAD
// PORT: Fixed ROM slots 16703.
    16703, 36106,
// PORT: SOURCE P40-P47.agc:1991
//			5SECOND		# 500 CS AT +14
// PORT: Fixed ROM slots 16704.
    16704, 30750,
// PORT: SOURCE P40-P47.agc:1992
//			1SEC2D		# 100 CS AT +14
// PORT: Fixed ROM slots 16705.
    16705, 30742,
// PORT: SOURCE P40-P47.agc:1993
//		GOTO
// PORT: Fixed ROM slots 16706.
    16706, 65360,
// PORT: SOURCE P40-P47.agc:1994
//			S40.132
// PORT: Fixed ROM slots 16707.
    16707, 29330,
// PORT: SOURCE P40-P47.agc:1995
//S40.131		DLOAD	DMP		# TGO LESS THAN 100 CS
// PORT: Fixed ROM slots 16708.
    16708, 34250,
// PORT: SOURCE P40-P47.agc:1996
//			WEIGHT/G
// PORT: Fixed ROM slots 16709.
    16709, 3196,
// PORT: SOURCE P40-P47.agc:1997
//		DAD	DDV
// PORT: Fixed ROM slots 16710.
    16710, 47386,
// PORT: SOURCE P40-P47.agc:1998
//			K2VAL		# M.NEWTON CS AT +24
// PORT: Fixed ROM slots 16711.
    16711, 2036,
// PORT: SOURCE P40-P47.agc:1999
//			K3VAL		# M.NEWTON AT +10
// PORT: Fixed ROM slots 16712.
    16712, 2040,
// PORT: SOURCE P40-P47.agc:2000
//S40.132		EXIT
// PORT: Fixed ROM slots 16713.
    16713, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16714–16719.
function agcAotUnit959 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16716 {
        if slot <= 16714 {
// PORT: SOURCE P40-P47.agc:2001
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:2002
//		TC	TPAGREE
// PORT: Fixed ROM slots 16714.
            if slot <> 16714 or instruction <> 3734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16715 {
// PORT: SOURCE P40-P47.agc:2003
//		CA	MPAC
// PORT: Fixed ROM slots 16715.
                if slot <> 16715 or instruction <> 12396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2004
//		XCH	L
// PORT: Fixed ROM slots 16716.
                if slot <> 16716 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16717 {
// PORT: SOURCE P40-P47.agc:2005
//		CA	ZERO
// PORT: Fixed ROM slots 16717.
            if slot <> 16717 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16718 {
// PORT: SOURCE P40-P47.agc:2006
//		DXCH	TGO		# TGO IN CS AT +28
// PORT: Fixed ROM slots 16718.
                if slot <> 16718 or instruction <> 22296 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 792, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2007
//		TC	S40.134
// PORT: Fixed ROM slots 16719.
                if slot <> 16719 or instruction <> 1362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[959] to agcAotUnit959@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2008
//S40.133		CLEAR	EXIT		# WILL STEER VEHICLE
// PORT: Fixed ROM slots 16720.
    16720, 65048,
// PORT: SOURCE P40-P47.agc:2009
//			IMPULSW
// PORT: Fixed ROM slots 16721.
    16721, 1388
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16722–16722.
function agcAotUnit960 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:2010
//S40.134		TC	PHASCHNG	# KILL GROUP 3
// PORT: Fixed ROM slots 16722.
    if slot <> 16722 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[960] to agcAotUnit960@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2011
//		OCT	3
// PORT: Fixed ROM slots 16723.
    16723, 6
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16724–16725.
function agcAotUnit961 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16724 {
// PORT: SOURCE P40-P47.agc:2012
//
// PORT: SOURCE P40-P47.agc:2013
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 16724.
        if slot <> 16724 or instruction <> 6799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:2014
//
// PORT: SOURCE P40-P47.agc:2015
//NOTADDUL	TC	INTPRET
// PORT: Fixed ROM slots 16725.
        if slot <> 16725 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[961] to agcAotUnit961@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2016
//		GOTO
// PORT: Fixed ROM slots 16726.
    16726, 65360,
// PORT: SOURCE P40-P47.agc:2017
//			S40.130 +1	# DO NOT COMPENSATE FOR 7 SEC OF ULLAGE
// PORT: Fixed ROM slots 16727.
    16727, 29272,
// PORT: SOURCE P40-P47.agc:2018
//		SETLOC	DAPS7
// PORT: SOURCE P40-P47.agc:2019
//		BANK
// PORT: SOURCE P40-P47.agc:2020
//
// PORT: SOURCE P40-P47.agc:2021
//		COUNT	17/40.13
// PORT: SOURCE P40-P47.agc:2022
//
// PORT: SOURCE P40-P47.agc:2023
//K1VAL		=	EK1VAL		# DP PAD LOAD B+23 NEWTON-SEC/E+2
// PORT: SOURCE P40-P47.agc:2024
//K2VAL		=	EK2VAL		# DP PAD LOAD B+23 NEWTON-SEC/E+2
// PORT: SOURCE P40-P47.agc:2025
//K3VAL		=	EK3VAL		# DP PAD LOAD B+09 NEWTONS/E+4
// PORT: SOURCE P40-P47.agc:2026
//1SEC2D		2DEC	100.0 B-14	# 100.0 CS AT +14
// PORT: Fixed ROM slots 17418 17419.
    17418, 200, 17419, 0,
// PORT: SOURCE P40-P47.agc:2027
//# Page 728
// PORT: SOURCE P40-P47.agc:2028
//3.5SEC		2DEC	350.0 B-13	# 350 CS AT +13
// PORT: Fixed ROM slots 17420 17421.
    17420, 1400, 17421, 0,
// PORT: SOURCE P40-P47.agc:2029
//
// PORT: SOURCE P40-P47.agc:2030
//5SECOND		2DEC	500.0 B-14	# 500.0 CS AT +14
// PORT: Fixed ROM slots 17422 17423.
    17422, 1000, 17423, 0,
// PORT: SOURCE P40-P47.agc:2031
//
// PORT: SOURCE P40-P47.agc:2032
//S40.135		2DEC	69.6005183 B-23	# IMPULSE FROM 7.96 SECS OF 2-JET FIRING
// PORT: Fixed ROM slots 17424 17425.
    17424, 0, 17425, 4454
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18593–18610.
function agcAotUnit1092 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18601 {
        if slot <= 18596 {
            if slot <= 18594 {
                if slot <= 18593 {
// PORT: SOURCE P40-P47.agc:2033
//					# 	7.96 (199.6)COS(10) LB-SEC, SC.AT
// PORT: SOURCE P40-P47.agc:2034
//					#	B+23 NEWTON-SEC/E+2 (7 SEC ULLAGE
// PORT: SOURCE P40-P47.agc:2035
//					#	TO GO, PLUS 0.96 SEC FROM PIPTIME)
// PORT: SOURCE P40-P47.agc:2036
//
// PORT: SOURCE P40-P47.agc:2037
//# Page 729
// PORT: SOURCE P40-P47.agc:2038
//# NAME		S40.6 GIMBAL DRIVE TEST AND/OR GIMBAL TRIM
// PORT: SOURCE P40-P47.agc:2039
//# MOD NO 5				DATE 9 MARCH, 1967
// PORT: SOURCE P40-P47.agc:2040
//# MOD BY ENGEL				LOG SECTION P40-P47
// PORT: SOURCE P40-P47.agc:2041
//#
// PORT: SOURCE P40-P47.agc:2042
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:2043
//#	GIMBAL DRIVE TEST....0,+2,-2,0 DEGREE ENGINE COMMANDS, AT 2 SECOND
// PORT: SOURCE P40-P47.agc:2044
//#		INTERVALS, FIRST IN PITCH, THEN IN YAW.  ASTRONAUT VERIFICATION
// PORT: SOURCE P40-P47.agc:2045
//#		OF GIMBAL MOTION ON GPI
// PORT: SOURCE P40-P47.agc:2046
//#	GIMBAL TRIM....AFTER A 4 SECOND DELAY, ENGINE COMMANDED TO
// PORT: SOURCE P40-P47.agc:2047
//#		PRE-COMPUTED TRIM POSITION.  ASTRONAUT VERIFICATION ON GPI.
// PORT: SOURCE P40-P47.agc:2048
//#	PRE40.6....RESTART ENTRY TO RE-DO S40.6, ONLY IF RCS IS ON --- IF TVC
// PORT: SOURCE P40-P47.agc:2049
//#		IS NOT ON --- PRIMARILY TO GET ACTUATORS TRIMMED FOR IGNITION.
// PORT: SOURCE P40-P47.agc:2050
//#		BYPASS 4 SEC DELAY.  SPEED IS CRITICAL NEAR IGNITION.
// PORT: SOURCE P40-P47.agc:2051
//#		IF TVC IS ON (TVCDAPON OR LATER) THEN REDOTVC WILL TAKE CARE
// PORT: SOURCE P40-P47.agc:2052
//#		OF RESTARTING ACTUATORS.
// PORT: SOURCE P40-P47.agc:2053
//#
// PORT: SOURCE P40-P47.agc:2054
//# CALLING SEQUENCE....
// PORT: SOURCE P40-P47.agc:2055
//#	WAITLIST, WITH 2CADR FOR S40.6 (OR PRE40.6), WITH EBANK= CNTR
// PORT: SOURCE P40-P47.agc:2056
//#
// PORT: SOURCE P40-P47.agc:2057
//# NORMAL EXIT MODE -- FIXDELAY, TASKOVER
// PORT: SOURCE P40-P47.agc:2058
//#
// PORT: SOURCE P40-P47.agc:2059
//# SUBROUTINES CALLED....
// PORT: SOURCE P40-P47.agc:2060
//#	OUTPUT (INTERNAL)
// PORT: SOURCE P40-P47.agc:2061
//#	FIXDELAY
// PORT: SOURCE P40-P47.agc:2062
//#
// PORT: SOURCE P40-P47.agc:2063
//# ALARM OR ABORT EXIT MODES --- NONE
// PORT: SOURCE P40-P47.agc:2064
//#
// PORT: SOURCE P40-P47.agc:2065
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P40-P47.agc:2066
//#	CNTR = +0, NORMALLY SET BY THE P40 CALL AT TST,TRIM.
// PORT: SOURCE P40-P47.agc:2067
//#	MRKRTMP....POSITIVE FOR GIMBAL DRIVE TEST AND GIMBAL TRIM (BOTH)
// PORT: SOURCE P40-P47.agc:2068
//#		   NEGATIVE FOR GIMBAL TRIM ONLY
// PORT: SOURCE P40-P47.agc:2069
//#	PACTOFF, YACTOFF SC.AT 85.41 ARCSEC/BIT (V48N48 P, YTRIM)
// PORT: SOURCE P40-P47.agc:2070
//#	"SC CONT" SWITCH AT "CMC" (A/P CONTROL SWITCH AT "GNC")
// PORT: SOURCE P40-P47.agc:2071
//#	ACTIVE SPS GIMBAL MOTOR POWER(S), PITCH, YAW
// PORT: SOURCE P40-P47.agc:2072
//#
// PORT: SOURCE P40-P47.agc:2073
//# OUTPUT
// PORT: SOURCE P40-P47.agc:2074
//#	TVCYAW, TVCPITCH (BITS RELEASED)
// PORT: SOURCE P40-P47.agc:2075
//#	TVC ENABLE AND OPTICS ERROR COUNTER ENABLE
// PORT: SOURCE P40-P47.agc:2076
//#
// PORT: SOURCE P40-P47.agc:2077
//# DEBRIS
// PORT: SOURCE P40-P47.agc:2078
//#	TBMPR60, CNTR
// PORT: SOURCE P40-P47.agc:2079
//
// PORT: SOURCE P40-P47.agc:2080
//		BANK	17
// PORT: SOURCE P40-P47.agc:2081
//		SETLOC	DAPS6
// PORT: SOURCE P40-P47.agc:2082
//		BANK
// PORT: SOURCE P40-P47.agc:2083
//
// PORT: SOURCE P40-P47.agc:2084
//		EBANK=	CNTR
// PORT: SOURCE P40-P47.agc:2085
//		COUNT	20/S40.6
// PORT: SOURCE P40-P47.agc:2086
//
// PORT: SOURCE P40-P47.agc:2087
//PRE40.6		CS	FLAGWRD6	# RESTART ENTRY TO S40.6 (DO NOT PERMIT
// PORT: Fixed ROM slots 18593.
                    if slot <> 18593 or instruction <> 16450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 66).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2088
//		MASK	OCT60000	#	IF TVC, BITS 15,14 = 1,0)
// PORT: Fixed ROM slots 18594.
                    if slot <> 18594 or instruction <> 30789 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        if fixedOperand = 24576 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 4) * 8192).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18595 {
// PORT: SOURCE P40-P47.agc:2089
//		EXTEND
// PORT: Fixed ROM slots 18595.
                    if slot <> 18595 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2090
//		BZMF	+2
// PORT: Fixed ROM slots 18596.
                    if slot <> 18596 or instruction <> 25766 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25766, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18598 {
                if slot <= 18597 {
// PORT: SOURCE P40-P47.agc:2091
//		TCF	TASKOVER	# TVC, REDOTVC WILL REESTABLISH INTERFACE
// PORT: Fixed ROM slots 18597.
                    if slot <> 18597 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2092
//
// PORT: SOURCE P40-P47.agc:2093
//		CS	BIT1		# RCS, SO DO S40.6, GIMTRIM ONLY
// PORT: Fixed ROM slots 18598.
                    if slot <> 18598 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18599 {
// PORT: SOURCE P40-P47.agc:2094
//# Page 730
// PORT: SOURCE P40-P47.agc:2095
//		TS	MRKRTMP
// PORT: Fixed ROM slots 18599.
                    if slot <> 18599 or instruction <> 23333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23333, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18600 {
// PORT: SOURCE P40-P47.agc:2096
//
// PORT: SOURCE P40-P47.agc:2097
//		CAF	BIT1		# FOR REVISED S40.6 TIMING FOR RESTARTS...
// PORT: Fixed ROM slots 18600.
                        if slot <> 18600 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2098
//		TS	CNTR		# TO INDICATE A RESTART ENTRY (CNTR 1S
// PORT: Fixed ROM slots 18601.
                        if slot <> 18601 or instruction <> 23335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23335, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18605 {
            if slot <= 18603 {
                if slot <= 18602 {
// PORT: SOURCE P40-P47.agc:2099
//					#	NORMALLY +0, BY S40.6)
// PORT: SOURCE P40-P47.agc:2100
//
// PORT: SOURCE P40-P47.agc:2101
//		EBANK=	CNTR
// PORT: SOURCE P40-P47.agc:2102
//S40.6		CS	ZERO		# INHIBIT OPTICS ACTIVITY
// PORT: Fixed ROM slots 18602.
                    if slot <> 18602 or instruction <> 18961 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2103
//		TS	OPTIND
// PORT: Fixed ROM slots 18603.
                    if slot <> 18603 or instruction <> 23235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23235, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18604 {
// PORT: SOURCE P40-P47.agc:2104
//
// PORT: SOURCE P40-P47.agc:2105
//		CS	BIT2		# DISENABLE OPTICS ERROR COUNTERS (ZERO,
// PORT: Fixed ROM slots 18604.
                    if slot <> 18604 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2106
//		EXTEND			# 	AND INHIBIT PULSE TRANSMISSION --
// PORT: Fixed ROM slots 18605.
                    if slot <> 18605 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18607 {
                if slot <= 18606 {
// PORT: SOURCE P40-P47.agc:2107
//		WAND	CHAN12		#	NORMAL STATE)
// PORT: Fixed ROM slots 18606.
                    if slot <> 18606 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2108
//
// PORT: SOURCE P40-P47.agc:2109
//		CAF	OCT02200	# TVC ENABLE (SPS SERVO AMPS SEE DAC
// PORT: Fixed ROM slots 18607.
                    if slot <> 18607 or instruction <> 13540 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1252), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18608 {
// PORT: SOURCE P40-P47.agc:2110
//		EXTEND			#	VOLTAGES) AND DISENGAGE OPTICS/DAC
// PORT: Fixed ROM slots 18608.
                    if slot <> 18608 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18609 {
// PORT: SOURCE P40-P47.agc:2111
//		WOR	CHAN12
// PORT: Fixed ROM slots 18609.
                        if slot <> 18609 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2112
//
// PORT: SOURCE P40-P47.agc:2113
//		TC	FIXDELAY	# 60MS PROCEDURAL DELAY (40MS MINIMUM) FOR
// PORT: Fixed ROM slots 18610.
                        if slot <> 18610 or instruction <> 2743 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2743, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1092] to agcAotUnit1092@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2114
//		DEC	6		#	RELAY LATCHING
// PORT: Fixed ROM slots 18611.
    18611, 12
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18612–18615.
function agcAotUnit1093 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18613 {
        if slot <= 18612 {
// PORT: SOURCE P40-P47.agc:2115
//
// PORT: SOURCE P40-P47.agc:2116
//		CAF	BIT2		# ENABLE OPTICS ERROR COUNTERS
// PORT: Fixed ROM slots 18612.
            if slot <> 18612 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2117
//		EXTEND
// PORT: Fixed ROM slots 18613.
            if slot <> 18613 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18614 {
// PORT: SOURCE P40-P47.agc:2118
//		WOR	CHAN12
// PORT: Fixed ROM slots 18614.
            if slot <> 18614 or instruction <> 2570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2119
//
// PORT: SOURCE P40-P47.agc:2120
//		TC	FIXDELAY	# 20MS PROCEDURAL DELAY (4MS MINIMUM) FOR
// PORT: Fixed ROM slots 18615.
            if slot <> 18615 or instruction <> 2743 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2743, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1093] to agcAotUnit1093@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2121
//		DEC	2		#	RELAY LATCHING
// PORT: Fixed ROM slots 18616.
    18616, 4
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18617–18639.
function agcAotUnit1094 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18627 {
        if slot <= 18621 {
            if slot <= 18618 {
                if slot <= 18617 {
// PORT: SOURCE P40-P47.agc:2122
//
// PORT: SOURCE P40-P47.agc:2123
//RSTRTST		CCS	CNTR		# CHECK FOR RESTART ENTRY (PRE40.6)
// PORT: Fixed ROM slots 18617.
                    if slot <> 18617 or instruction <> 4903 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 807).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2124
//		TCF	GIMTRIM +2	# RESTART ENTRY....BYPASS 4 SECOND DELAY
// PORT: Fixed ROM slots 18618.
                    if slot <> 18618 or instruction <> 5338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5338, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18619 {
// PORT: SOURCE P40-P47.agc:2125
//					#	TST,TRIM SETS +0 ON NORMAL ENTRY
// PORT: SOURCE P40-P47.agc:2126
//
// PORT: SOURCE P40-P47.agc:2127
//		CAE	MRKRTMP		# CHECK FOR TEST/TRIM OR TRIM ONLY
// PORT: Fixed ROM slots 18619.
                    if slot <> 18619 or instruction <> 13093 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 805).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18620 {
// PORT: SOURCE P40-P47.agc:2128
//		TS	CNTR		#	MRKRTMP SAVES CNTR FOR RESTARTS
// PORT: Fixed ROM slots 18620.
                        if slot <> 18620 or instruction <> 23335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23335, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2129
//		EXTEND
// PORT: Fixed ROM slots 18621.
                        if slot <> 18621 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18624 {
                if slot <= 18622 {
// PORT: SOURCE P40-P47.agc:2130
//		BZMF	GIMTRIM		# (TRIM ONLY)
// PORT: Fixed ROM slots 18622.
                    if slot <> 18622 or instruction <> 25816 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25816, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18623 {
// PORT: SOURCE P40-P47.agc:2131
//
// PORT: SOURCE P40-P47.agc:2132
//GDTSETUP	CS	ZERO		# GIMBAL DRIVE TEST SETUP, FOR PITCH
// PORT: Fixed ROM slots 18623.
                        if slot <> 18623 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2133
//		TS	CNTR
// PORT: Fixed ROM slots 18624.
                        if slot <> 18624 or instruction <> 23335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23335, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18625 {
// PORT: SOURCE P40-P47.agc:2134
//
// PORT: SOURCE P40-P47.agc:2135
//GIMDTEST	CAF	+2ACTDEG	# GIMBAL DRIVE TEST, 1ST INCREMENT
// PORT: Fixed ROM slots 18625.
                    if slot <> 18625 or instruction <> 13542 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1254), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18626 {
// PORT: SOURCE P40-P47.agc:2136
//		TC	OUTPUT		#	(LEAVES GIMBAL AT +2 DEG)
// PORT: Fixed ROM slots 18626.
                        if slot <> 18626 or instruction <> 1229 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1229, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2137
//		CAF	-4ACTDEG	# 2ND INCREMENT (LEAVES GIMBAL AT -2)
// PORT: Fixed ROM slots 18627.
                        if slot <> 18627 or instruction <> 13541 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1253), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18633 {
            if slot <= 18630 {
                if slot <= 18628 {
// PORT: SOURCE P40-P47.agc:2138
//		TC	OUTPUT
// PORT: Fixed ROM slots 18628.
                    if slot <> 18628 or instruction <> 1229 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1229, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18629 {
// PORT: SOURCE P40-P47.agc:2139
//		CAF	+2ACTDEG	# 3RD INCREMENT (LEAVES GIMBAL AT -0)
// PORT: Fixed ROM slots 18629.
                        if slot <> 18629 or instruction <> 13542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1254), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2140
//		TC	OUTPUT
// PORT: Fixed ROM slots 18630.
                        if slot <> 18630 or instruction <> 1229 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1229, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18631 {
// PORT: SOURCE P40-P47.agc:2141
//
// PORT: SOURCE P40-P47.agc:2142
//		CS	CNTR		# CHECK FOR COMPLETION OF YAW TEST.
// PORT: Fixed ROM slots 18631.
                    if slot <> 18631 or instruction <> 17191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 807).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18632 {
// PORT: SOURCE P40-P47.agc:2143
//# Page 731
// PORT: SOURCE P40-P47.agc:2144
//		CCS	A
// PORT: Fixed ROM slots 18632.
                        if slot <> 18632 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2145
//		TCF	GIMTRIM		# COMPLETED, GO TO GIMBAL TRIM ROUTINE
// PORT: Fixed ROM slots 18633.
                        if slot <> 18633 or instruction <> 5336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5336, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18636 {
                if slot <= 18634 {
// PORT: SOURCE P40-P47.agc:2146
//		CS	BIT1		# SET UP YAW TEST
// PORT: Fixed ROM slots 18634.
                    if slot <> 18634 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18635 {
// PORT: SOURCE P40-P47.agc:2147
//		TS	CNTR
// PORT: Fixed ROM slots 18635.
                        if slot <> 18635 or instruction <> 23335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23335, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2148
//		TCF	GIMDTEST	# FOR YAW TEST
// PORT: Fixed ROM slots 18636.
                        if slot <> 18636 or instruction <> 5313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5313, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18637 {
// PORT: SOURCE P40-P47.agc:2149
//
// PORT: SOURCE P40-P47.agc:2150
//OUTPUT		EXTEND			# OUTPUT THE INCREMENT....SAVE Q
// PORT: Fixed ROM slots 18637.
                    if slot <> 18637 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18638 {
// PORT: SOURCE P40-P47.agc:2151
//		QXCH	TEMPR60
// PORT: Fixed ROM slots 18638.
                        if slot <> 18638 or instruction <> 9830 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 614, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2152
//
// PORT: SOURCE P40-P47.agc:2153
//		INDEX	CNTR
// PORT: Fixed ROM slots 18639.
                        if slot <> 18639 or instruction <> 21287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21287, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21287, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1094] to agcAotUnit1094@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2154
//		TS	TVCPITCH
// PORT: Fixed ROM slots 18640.
    18640, 45144
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18641–18641.
function agcAotUnit1095 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:2155
//
// PORT: SOURCE P40-P47.agc:2156
//		INDEX	CNTR
// PORT: Fixed ROM slots 18641.
    if slot <> 18641 or instruction <> 21287 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21287, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21287, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1095] to agcAotUnit1095@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2157
//		CAF	BIT11
// PORT: Fixed ROM slots 18642.
    18642, 29706
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18643–18645.
function agcAotUnit1096 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18643 {
// PORT: SOURCE P40-P47.agc:2158
//		EXTEND
// PORT: Fixed ROM slots 18643.
        if slot <> 18643 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18644 {
// PORT: SOURCE P40-P47.agc:2159
//		WOR	CHAN14
// PORT: Fixed ROM slots 18644.
            if slot <> 18644 or instruction <> 2572 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2160
//
// PORT: SOURCE P40-P47.agc:2161
//		TC	FIXDELAY	# WAIT 2SEC, WHILE ASTRONAUT VERIFIES
// PORT: Fixed ROM slots 18645.
            if slot <> 18645 or instruction <> 2743 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2743, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1096] to agcAotUnit1096@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2162
//		DEC	200		# 	GIMBAL MOTION ON GPI
// PORT: Fixed ROM slots 18646.
    18646, 400
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18647–18648.
function agcAotUnit1097 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18647 {
// PORT: SOURCE P40-P47.agc:2163
//		TC	TEMPR60
// PORT: Fixed ROM slots 18647.
        if slot <> 18647 or instruction <> 614 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 614, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:2164
//
// PORT: SOURCE P40-P47.agc:2165
//GIMTRIM		TC	FIXDELAY	# WAIT 4 SECONDS BEFORE GIMBAL TRIM
// PORT: Fixed ROM slots 18648.
        if slot <> 18648 or instruction <> 2743 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2743, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1097] to agcAotUnit1097@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2166
//		DEC	400
// PORT: Fixed ROM slots 18649.
    18649, 800
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18650–18659.
function agcAotUnit1098 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18654 {
        if slot <= 18651 {
            if slot <= 18650 {
// PORT: SOURCE P40-P47.agc:2167
//
// PORT: SOURCE P40-P47.agc:2168
//	+2	CS	ZERO		# PICK UP TRIM VALUES AND OUTPUT THEM
// PORT: Fixed ROM slots 18650.
                if slot <> 18650 or instruction <> 18961 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2169
//		AD	PACTOFF		#	(AVOID +0) ENTRY POINT FROM RSTRTST
// PORT: Fixed ROM slots 18651.
                if slot <> 18651 or instruction <> 25363 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 787).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18652 {
// PORT: SOURCE P40-P47.agc:2170
//		TS	TVCPITCH	#	ON A RESTART, TO AVOID 4SEC DELAY
// PORT: Fixed ROM slots 18652.
                if slot <> 18652 or instruction <> 22572 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22572, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18653 {
// PORT: SOURCE P40-P47.agc:2171
//		CS	ZERO
// PORT: Fixed ROM slots 18653.
                    if slot <> 18653 or instruction <> 18961 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2172
//		AD	YACTOFF
// PORT: Fixed ROM slots 18654.
                    if slot <> 18654 or instruction <> 25364 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 788).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18656 {
            if slot <= 18655 {
// PORT: SOURCE P40-P47.agc:2173
//		TS	TVCYAW
// PORT: Fixed ROM slots 18655.
                if slot <> 18655 or instruction <> 22571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22571, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2174
//
// PORT: SOURCE P40-P47.agc:2175
//		CAF	PRIO6		# RELEASE THE COUNTERS, BITS 11,12
// PORT: Fixed ROM slots 18656.
                if slot <> 18656 or instruction <> 14898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2610), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18657 {
// PORT: SOURCE P40-P47.agc:2176
//		EXTEND
// PORT: Fixed ROM slots 18657.
                if slot <> 18657 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18658 {
// PORT: SOURCE P40-P47.agc:2177
//		WOR	CHAN14
// PORT: Fixed ROM slots 18658.
                    if slot <> 18658 or instruction <> 2572 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2178
//
// PORT: SOURCE P40-P47.agc:2179
//ENDS40.6	TCF	TASKOVER
// PORT: Fixed ROM slots 18659.
                    if slot <> 18659 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1098] to agcAotUnit1098@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2180
//
// PORT: SOURCE P40-P47.agc:2181
//OCT02200	OCT	02200		# BITS 8,11 FOR CHANNEL 12 TVC/OPTICS
// PORT: Fixed ROM slots 18660.
    18660, 2304,
// PORT: SOURCE P40-P47.agc:2182
//-4ACTDEG	DEC	-168		# -2(+2ACTDEG), WHOLE BITS, NO ROUNDUP
// PORT: Fixed ROM slots 18661.
    18661, 65198,
// PORT: SOURCE P40-P47.agc:2183
//+2ACTDEG	DEC	+84		# +2 DEG, SC.AT 85.41 ARCSEC/BIT (+84D)
// PORT: Fixed ROM slots 18662.
    18662, 168
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18663–18718.
function agcAotUnit1099 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18690 {
        if slot <= 18676 {
            if slot <= 18669 {
                if slot <= 18665 {
                    if slot <= 18663 {
// PORT: SOURCE P40-P47.agc:2184
//
// PORT: SOURCE P40-P47.agc:2185
//# CALLED BY "DONOUN46" (VERB 48), OR DIRECTLY BY "FRESHDAP" (RCS DAP) VIA IBNKCALL
// PORT: SOURCE P40-P47.agc:2186
//
// PORT: SOURCE P40-P47.agc:2187
//		COUNT	20/S41.2
// PORT: SOURCE P40-P47.agc:2188
//
// PORT: SOURCE P40-P47.agc:2189
//S41.2		CA	DAPDATR1
// PORT: Fixed ROM slots 18663.
                        if slot <> 18663 or instruction <> 13110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18664 {
// PORT: SOURCE P40-P47.agc:2190
//# Page 732
// PORT: SOURCE P40-P47.agc:2191
//		MASK	THREE
// PORT: Fixed ROM slots 18664.
                            if slot <> 18664 or instruction <> 31884 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                                if fixedOperand = 3 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2192
//		AD	A
// PORT: Fixed ROM slots 18665.
                            if slot <> 18665 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18667 {
                        if slot <= 18666 {
// PORT: SOURCE P40-P47.agc:2193
//		TS	RATEINDX
// PORT: Fixed ROM slots 18666.
                            if slot <> 18666 or instruction <> 23128 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23128, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2194
//
// PORT: SOURCE P40-P47.agc:2195
//		INHINT
// PORT: Fixed ROM slots 18667.
                            if slot <> 18667 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18668 {
// PORT: SOURCE P40-P47.agc:2196
//		CAE	DAPDATR1	# IS LEM ATTACHED (BITS 14,13 OF DAPDATR1
// PORT: Fixed ROM slots 18668.
                            if slot <> 18668 or instruction <> 13110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 822).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2197
//		MASK	PRIO30		#	=10)
// PORT: Fixed ROM slots 18669.
                            if slot <> 18669 or instruction <> 30969 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                                if fixedOperand = 12288 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18672 {
                    if slot <= 18670 {
// PORT: SOURCE P40-P47.agc:2198
//		AD	-BIT14		# (OCT57777)
// PORT: Fixed ROM slots 18670.
                        if slot <> 18670 or instruction <> 28613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4037), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18671 {
// PORT: SOURCE P40-P47.agc:2199
//		EXTEND
// PORT: Fixed ROM slots 18671.
                            if slot <> 18671 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2200
//		BZF	TOGETHER	# YES
// PORT: Fixed ROM slots 18672.
                            if slot <> 18672 or instruction <> 5365 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18674 {
                        if slot <= 18673 {
// PORT: SOURCE P40-P47.agc:2201
//
// PORT: SOURCE P40-P47.agc:2202
//		CS	BIT2		# NO, UNSET FLAG
// PORT: Fixed ROM slots 18673.
                            if slot <> 18673 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2203
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 18674.
                            if slot <> 18674 or instruction <> 28739 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18675 {
// PORT: SOURCE P40-P47.agc:2204
//		TS	FLAGWRD7
// PORT: Fixed ROM slots 18675.
                            if slot <> 18675 or instruction <> 22595 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22595, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2205
//
// PORT: SOURCE P40-P47.agc:2206
//		TCF	+4
// PORT: Fixed ROM slots 18676.
                            if slot <> 18676 or instruction <> 5368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18683 {
                if slot <= 18679 {
                    if slot <= 18677 {
// PORT: SOURCE P40-P47.agc:2207
//
// PORT: SOURCE P40-P47.agc:2208
//TOGETHER	CS	FLAGWRD7	# ATTACHED, SET FLAG FOR INTEGRATION
// PORT: Fixed ROM slots 18677.
                        if slot <> 18677 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18678 {
// PORT: SOURCE P40-P47.agc:2209
//		MASK	BIT2
// PORT: Fixed ROM slots 18678.
                            if slot <> 18678 or instruction <> 31246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                if fixedOperand = 2 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2210
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 18679.
                            if slot <> 18679 or instruction <> 11331 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18681 {
                        if slot <= 18680 {
// PORT: SOURCE P40-P47.agc:2211
//
// PORT: SOURCE P40-P47.agc:2212
//		RELINT
// PORT: Fixed ROM slots 18680.
                            if slot <> 18680 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2213
//
// PORT: SOURCE P40-P47.agc:2214
//		CA	DAPDATR1
// PORT: Fixed ROM slots 18681.
                            if slot <> 18681 or instruction <> 13110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 822).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18682 {
// PORT: SOURCE P40-P47.agc:2215
//		MASK	BIT4
// PORT: Fixed ROM slots 18682.
                            if slot <> 18682 or instruction <> 31244 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                if fixedOperand = 8 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2216
//		EXTEND
// PORT: Fixed ROM slots 18683.
                            if slot <> 18683 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18686 {
                    if slot <= 18684 {
// PORT: SOURCE P40-P47.agc:2217
//		BZMF	+2		# DEC 46 MEANS NARROW DB
// PORT: Fixed ROM slots 18684.
                        if slot <> 18684 or instruction <> 25854 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25854, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18685 {
// PORT: SOURCE P40-P47.agc:2218
//		CA	DEC409
// PORT: Fixed ROM slots 18685.
                            if slot <> 18685 or instruction <> 13630 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1342), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2219
//		AD	DEC46		# DEC 455 MEANS WIDE DB
// PORT: Fixed ROM slots 18686.
                            if slot <> 18686 or instruction <> 25919 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1343), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18688 {
                        if slot <= 18687 {
// PORT: SOURCE P40-P47.agc:2220
//		TS	ADB
// PORT: Fixed ROM slots 18687.
                            if slot <> 18687 or instruction <> 23469 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23469, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2221
//
// PORT: SOURCE P40-P47.agc:2222
//		CA	DAPDATR1
// PORT: Fixed ROM slots 18688.
                            if slot <> 18688 or instruction <> 13110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 822).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18689 {
// PORT: SOURCE P40-P47.agc:2223
//		MASK	BIT7		# QUAD BD
// PORT: Fixed ROM slots 18689.
                            if slot <> 18689 or instruction <> 31241 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                                if fixedOperand = 64 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2224
//		EXTEND
// PORT: Fixed ROM slots 18690.
                            if slot <> 18690 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18704 {
            if slot <= 18697 {
                if slot <= 18693 {
                    if slot <= 18691 {
// PORT: SOURCE P40-P47.agc:2225
//		BZMF	+2
// PORT: Fixed ROM slots 18691.
                        if slot <> 18691 or instruction <> 25861 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25861, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18692 {
// PORT: SOURCE P40-P47.agc:2226
//		CA	ONE
// PORT: Fixed ROM slots 18692.
                            if slot <> 18692 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2227
//		TS	XTRANS
// PORT: Fixed ROM slots 18693.
                            if slot <> 18693 or instruction <> 23449 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23449, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18695 {
                        if slot <= 18694 {
// PORT: SOURCE P40-P47.agc:2228
//		CA	DAPDATR1
// PORT: Fixed ROM slots 18694.
                            if slot <> 18694 or instruction <> 13110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 822).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2229
//		MASK	BIT10		# QUAD AC
// PORT: Fixed ROM slots 18695.
                            if slot <> 18695 or instruction <> 31238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                if fixedOperand = 512 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18696 {
// PORT: SOURCE P40-P47.agc:2230
//		EXTEND
// PORT: Fixed ROM slots 18696.
                            if slot <> 18696 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2231
//		BZMF	+2
// PORT: Fixed ROM slots 18697.
                            if slot <> 18697 or instruction <> 25867 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25867, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18700 {
                    if slot <= 18698 {
// PORT: SOURCE P40-P47.agc:2232
//		CS	ONE
// PORT: Fixed ROM slots 18698.
                        if slot <> 18698 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18699 {
// PORT: SOURCE P40-P47.agc:2233
//		ADS	XTRANS
// PORT: Fixed ROM slots 18699.
                            if slot <> 18699 or instruction <> 12185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 921).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2234
//
// PORT: SOURCE P40-P47.agc:2235
//		INHINT
// PORT: Fixed ROM slots 18700.
                            if slot <> 18700 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18702 {
                        if slot <= 18701 {
// PORT: SOURCE P40-P47.agc:2236
//		EXTEND
// PORT: Fixed ROM slots 18701.
                            if slot <> 18701 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2237
//		BZF	+5		# CLEAR NJETSFLG (4 JETS, OR NO JETS)
// PORT: Fixed ROM slots 18702.
                            if slot <> 18702 or instruction <> 5395 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5395, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18703 {
// PORT: SOURCE P40-P47.agc:2238
//		CS	FLAGWRD1	# SET NJETSFLG (2 JETS, AC OR BD QUADS)
// PORT: Fixed ROM slots 18703.
                            if slot <> 18703 or instruction <> 16445 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 61).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2239
//		MASK	BIT15		# NJETSFLG = 1 FOR 2 JET ULLAGE (AC OR BD)
// PORT: Fixed ROM slots 18704.
                            if slot <> 18704 or instruction <> 31233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                if fixedOperand = 16384 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18711 {
                if slot <= 18707 {
                    if slot <= 18705 {
// PORT: SOURCE P40-P47.agc:2240
//		ADS	FLAGWRD1
// PORT: Fixed ROM slots 18705.
                        if slot <> 18705 or instruction <> 11325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18706 {
// PORT: SOURCE P40-P47.agc:2241
//# Page 733
// PORT: SOURCE P40-P47.agc:2242
//		TCF	+4
// PORT: Fixed ROM slots 18706.
                            if slot <> 18706 or instruction <> 5398 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5398, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2243
//		CS	BIT15		# KJETSFLG = 0 FOR 4 JET (OR 0 JET) ULLAGE
// PORT: Fixed ROM slots 18707.
                            if slot <> 18707 or instruction <> 18945 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18709 {
                        if slot <= 18708 {
// PORT: SOURCE P40-P47.agc:2244
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 18708.
                            if slot <> 18708 or instruction <> 28733 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2245
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 18709.
                            if slot <> 18709 or instruction <> 22589 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22589, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18710 {
// PORT: SOURCE P40-P47.agc:2246
//		RELINT
// PORT: Fixed ROM slots 18710.
                            if slot <> 18710 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2247
//		CA	DAPDATR2
// PORT: Fixed ROM slots 18711.
                            if slot <> 18711 or instruction <> 13111 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 823).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18714 {
                    if slot <= 18712 {
// PORT: SOURCE P40-P47.agc:2248
//		MASK	BIT13
// PORT: Fixed ROM slots 18712.
                        if slot <> 18712 or instruction <> 31235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18713 {
// PORT: SOURCE P40-P47.agc:2249
//		EXTEND
// PORT: Fixed ROM slots 18713.
                            if slot <> 18713 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2250
//		BZMF	+2
// PORT: Fixed ROM slots 18714.
                            if slot <> 18714 or instruction <> 25884 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25884, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18716 {
                        if slot <= 18715 {
// PORT: SOURCE P40-P47.agc:2251
//		TCF	+2
// PORT: Fixed ROM slots 18715.
                            if slot <> 18715 or instruction <> 5405 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5405, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2252
//		CS	ONE
// PORT: Fixed ROM slots 18716.
                            if slot <> 18716 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18717 {
// PORT: SOURCE P40-P47.agc:2253
//		COM
// PORT: Fixed ROM slots 18717.
                            if slot <> 18717 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P40-P47.agc:2254
//		TS	ACORBD		# MINUS FOR A-C, PLUS FOR B-D
// PORT: Fixed ROM slots 18718.
                            if slot <> 18718 or instruction <> 23448 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23448, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1099] to agcAotUnit1099@.

// PORT: Physical bank 20. Shared continuation entries, slots 18719–18749.
function agcAotUnit1100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18733 {
        if slot <= 18725 {
            if slot <= 18721 {
                if slot <= 18719 {
// PORT: SOURCE P40-P47.agc:2255
//
// PORT: SOURCE P40-P47.agc:2256
//		CA	DAPDATR2
// PORT: Fixed ROM slots 18719.
                    if slot <> 18719 or instruction <> 13111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 823).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18720 {
// PORT: SOURCE P40-P47.agc:2257
//		MASK	BIT10
// PORT: Fixed ROM slots 18720.
                        if slot <> 18720 or instruction <> 31238 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                            if fixedOperand = 512 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2258
//		CCS	A
// PORT: Fixed ROM slots 18721.
                        if slot <> 18721 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 18723 {
                    if slot <= 18722 {
// PORT: SOURCE P40-P47.agc:2259
//		TCF	+4
// PORT: Fixed ROM slots 18722.
                        if slot <> 18722 or instruction <> 5414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2260
//		CA	ONE
// PORT: Fixed ROM slots 18723.
                        if slot <> 18723 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18724 {
// PORT: SOURCE P40-P47.agc:2261
//		TS	RACFAIL
// PORT: Fixed ROM slots 18724.
                        if slot <> 18724 or instruction <> 23446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2262
//		TCF	BDFAIL
// PORT: Fixed ROM slots 18725.
                        if slot <> 18725 or instruction <> 5422 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5422, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18729 {
                if slot <= 18727 {
                    if slot <= 18726 {
// PORT: SOURCE P40-P47.agc:2263
//		CA	ZERO
// PORT: Fixed ROM slots 18726.
                        if slot <> 18726 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2264
//		TS	RACFAIL
// PORT: Fixed ROM slots 18727.
                        if slot <> 18727 or instruction <> 23446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18728 {
// PORT: SOURCE P40-P47.agc:2265
//		CA	DAPDATR2
// PORT: Fixed ROM slots 18728.
                        if slot <> 18728 or instruction <> 13111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 823).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2266
//		MASK	BIT4
// PORT: Fixed ROM slots 18729.
                        if slot <> 18729 or instruction <> 31244 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                            if fixedOperand = 8 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18731 {
                    if slot <= 18730 {
// PORT: SOURCE P40-P47.agc:2267
//		CCS	A
// PORT: Fixed ROM slots 18730.
                        if slot <> 18730 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2268
//		TCF	BDFAIL
// PORT: Fixed ROM slots 18731.
                        if slot <> 18731 or instruction <> 5422 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5422, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18732 {
// PORT: SOURCE P40-P47.agc:2269
//		CS	ONE
// PORT: Fixed ROM slots 18732.
                        if slot <> 18732 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2270
//		TS	RACFAIL
// PORT: Fixed ROM slots 18733.
                        if slot <> 18733 or instruction <> 23446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18741 {
            if slot <= 18737 {
                if slot <= 18735 {
                    if slot <= 18734 {
// PORT: SOURCE P40-P47.agc:2271
//BDFAIL		CA	DAPDATR2
// PORT: Fixed ROM slots 18734.
                        if slot <> 18734 or instruction <> 13111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 823).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2272
//		MASK	BIT7
// PORT: Fixed ROM slots 18735.
                        if slot <> 18735 or instruction <> 31241 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18736 {
// PORT: SOURCE P40-P47.agc:2273
//		CCS	A
// PORT: Fixed ROM slots 18736.
                        if slot <> 18736 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2274
//		TCF	+4
// PORT: Fixed ROM slots 18737.
                        if slot <> 18737 or instruction <> 5429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5429, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18739 {
                    if slot <= 18738 {
// PORT: SOURCE P40-P47.agc:2275
//		CA	ONE
// PORT: Fixed ROM slots 18738.
                        if slot <> 18738 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2276
//		TS	RBDFAIL
// PORT: Fixed ROM slots 18739.
                        if slot <> 18739 or instruction <> 23447 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23447, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18740 {
// PORT: SOURCE P40-P47.agc:2277
//		TC	Q
// PORT: Fixed ROM slots 18740.
                        if slot <> 18740 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2278
//		CA	ZERO
// PORT: Fixed ROM slots 18741.
                        if slot <> 18741 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18745 {
                if slot <= 18743 {
                    if slot <= 18742 {
// PORT: SOURCE P40-P47.agc:2279
//		TS	RBDFAIL
// PORT: Fixed ROM slots 18742.
                        if slot <> 18742 or instruction <> 23447 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23447, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2280
//		CA	DAPDATR2
// PORT: Fixed ROM slots 18743.
                        if slot <> 18743 or instruction <> 13111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 823).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18744 {
// PORT: SOURCE P40-P47.agc:2281
//		MASK	BIT1
// PORT: Fixed ROM slots 18744.
                        if slot <> 18744 or instruction <> 31247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            if fixedOperand = 1 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2282
//		CCS	A
// PORT: Fixed ROM slots 18745.
                        if slot <> 18745 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 18747 {
                    if slot <= 18746 {
// PORT: SOURCE P40-P47.agc:2283
//		TC	Q
// PORT: Fixed ROM slots 18746.
                        if slot <> 18746 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2284
//		CS	ONE
// PORT: Fixed ROM slots 18747.
                        if slot <> 18747 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18748 {
// PORT: SOURCE P40-P47.agc:2285
//		TS	RBDFAIL
// PORT: Fixed ROM slots 18748.
                        if slot <> 18748 or instruction <> 23447 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23447, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2286
//		TC	Q
// PORT: Fixed ROM slots 18749.
                        if slot <> 18749 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1100] to agcAotUnit1100@.

// PORT: Physical bank 42. Shared continuation entries, slots 37766–37773.
function agcAotUnit2197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37769 {
        if slot <= 37767 {
            if slot <= 37766 {
// PORT: SOURCE P40-P47.agc:2287
//
// PORT: SOURCE P40-P47.agc:2288
//# DAPFIG ENTRY VIA TC POSTJUMP AS JOB FROM "STABLISH" (VERB 46)
// PORT: SOURCE P40-P47.agc:2289
//
// PORT: SOURCE P40-P47.agc:2290
//		BANK	42
// PORT: SOURCE P40-P47.agc:2291
//		SETLOC	EXTVBS
// PORT: SOURCE P40-P47.agc:2292
//# Page 734
// PORT: SOURCE P40-P47.agc:2293
//		BANK
// PORT: SOURCE P40-P47.agc:2294
//
// PORT: SOURCE P40-P47.agc:2295
//DAPFIG		CS	BIT9		# TURN OFF SIVB TAKEOVER
// PORT: Fixed ROM slots 37766.
                if slot <> 37766 or instruction <> 18951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2296
//		EXTEND
// PORT: Fixed ROM slots 37767.
                if slot <> 37767 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37768 {
// PORT: SOURCE P40-P47.agc:2297
//		WAND	CHAN12
// PORT: Fixed ROM slots 37768.
                if slot <> 37768 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2298
//		CAE	DAPDATR1	# DETERMINE VEHICLE CONFIGURATION
// PORT: Fixed ROM slots 37769.
                if slot <> 37769 or instruction <> 13110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 822).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37771 {
            if slot <= 37770 {
// PORT: SOURCE P40-P47.agc:2299
//		EXTEND
// PORT: Fixed ROM slots 37770.
                if slot <> 37770 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2300
//		MP	BIT3		#	RIGHT SHIFT 4 OCTAL DIGITS
// PORT: Fixed ROM slots 37771.
                if slot <> 37771 or instruction <> 31245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2573, readEffective:call(words, 2573)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37772 {
// PORT: SOURCE P40-P47.agc:2301
//		MASK	THREE		#	(IN CASE BIT 15 IS USED)
// PORT: Fixed ROM slots 37772.
                if slot <> 37772 or instruction <> 31884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    if fixedOperand = 3 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2302
//		INDEX	A
// PORT: Fixed ROM slots 37773.
                if slot <> 37773 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2197] to agcAotUnit2197@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2303
//		TCF	+1		#	BRANCH BASED ON CONFIG....
// PORT: Fixed ROM slots 37774.
    37774, 12062
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37775–37778.
function agcAotUnit2198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37776 {
        if slot <= 37775 {
// PORT: SOURCE P40-P47.agc:2304
//
// PORT: SOURCE P40-P47.agc:2305
//		TCF	NODAPUP		# CM.......ACTIVATE NODAP
// PORT: Fixed ROM slots 37775.
            if slot <> 37775 or instruction <> 6041 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6041, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2306
//		TCF	RCSDAPUP	#	CSM......ACTIVATE RCSDAP
// PORT: Fixed ROM slots 37776.
            if slot <> 37776 or instruction <> 6036 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6036, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37777 {
// PORT: SOURCE P40-P47.agc:2307
//		TCF	RCSDAPUP	#	CSM/LEM..ACTIVATE RCSDAP
// PORT: Fixed ROM slots 37777.
            if slot <> 37777 or instruction <> 6036 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6036, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2308
//		TC	POSTJUMP
// PORT: Fixed ROM slots 37778.
            if slot <> 37778 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2198] to agcAotUnit2198@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2309
//		CADR	SATSTKON
// PORT: Fixed ROM slots 37779.
    37779, 56602
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37780–37781.
function agcAotUnit2199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37780 {
// PORT: SOURCE P40-P47.agc:2310
//RCSDAPUP	INHINT			# CALL TO ACTIVATE RCSDAP, AND RETURN
// PORT: Fixed ROM slots 37780.
        if slot <> 37780 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:2311
//		TCR	IBNKCALL
// PORT: Fixed ROM slots 37781.
        if slot <> 37781 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2199] to agcAotUnit2199@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2312
//		CADR	RCSDAPON
// PORT: Fixed ROM slots 37782.
    37782, 34856
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37783–37788.
function agcAotUnit2200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37785 {
        if slot <= 37783 {
// PORT: SOURCE P40-P47.agc:2313
//		RELINT
// PORT: Fixed ROM slots 37783.
            if slot <> 37783 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37784 {
// PORT: SOURCE P40-P47.agc:2314
//		TCF	ENDFIG		# CAME IN VIA V46, GO OUT VIA GOPIN
// PORT: Fixed ROM slots 37784.
                if slot <> 37784 or instruction <> 6054 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6054, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2315
//NODAPUP		EXTEND			# T5 IDLE FOR NODAP (DON'T WORRY ABOUT T)
// PORT: Fixed ROM slots 37785.
                if slot <> 37785 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37786 {
// PORT: SOURCE P40-P47.agc:2316
//		DCA	T5IDLDAP
// PORT: Fixed ROM slots 37786.
            if slot <> 37786 or instruction <> 14249 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1961, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37787 {
// PORT: SOURCE P40-P47.agc:2317
//		DXCH	T5LOC
// PORT: Fixed ROM slots 37787.
                if slot <> 37787 or instruction <> 22219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2318
//		TC	DOWNFLAG	# RESET T5-USAGE FLAGS FOR NODAP
// PORT: Fixed ROM slots 37788.
                if slot <> 37788 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2200] to agcAotUnit2200@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2319
//		ADRES	DAPBIT1		# BIT 15 FLAG 6 = 0
// PORT: Fixed ROM slots 37789.
    37789, 180
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37790–37790.
function agcAotUnit2201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:2320
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 37790.
    if slot <> 37790 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2201] to agcAotUnit2201@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2321
//		ADRES	DAPBIT2		# BIT 14 FLAG 6 = 0
// PORT: Fixed ROM slots 37791.
    37791, 182
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37792–37793.
function agcAotUnit2202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37792 {
// PORT: SOURCE P40-P47.agc:2322
//		INHINT
// PORT: Fixed ROM slots 37792.
        if slot <> 37792 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:2323
//		TC	IBNKCALL	# ZERO JET CHANNELS IN 14 MS AND THEN
// PORT: Fixed ROM slots 37793.
        if slot <> 37793 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2202] to agcAotUnit2202@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2324
//		CADR	ZEROJET		# LEAVE THE T6 CLOCK DISABLED.
// PORT: Fixed ROM slots 37794.
    37794, 35636
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37795–37798.
function agcAotUnit2203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37796 {
        if slot <= 37795 {
// PORT: SOURCE P40-P47.agc:2325
//		RELINT
// PORT: Fixed ROM slots 37795.
            if slot <> 37795 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2326
//		CAF	BIT1		# KILL KALCMANU JOB
// PORT: Fixed ROM slots 37796.
            if slot <> 37796 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37797 {
// PORT: SOURCE P40-P47.agc:2327
//		TS	HOLDFLAG
// PORT: Fixed ROM slots 37797.
            if slot <> 37797 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2328
//ENDFIG		TC	POSTJUMP	# CAME IN VIA V46, GO OUT VIA GOPIN
// PORT: Fixed ROM slots 37798.
            if slot <> 37798 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2203] to agcAotUnit2203@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2329
//		CADR	GOPIN
// PORT: Fixed ROM slots 37799.
    37799, 55458,
// PORT: SOURCE P40-P47.agc:2330
//		SBANK=	PINSUPER	# Added by RSB 2009
// PORT: SOURCE P40-P47.agc:2331
//		EBANK=	PACTOFF
// PORT: SOURCE P40-P47.agc:2332
//T5IDLDAP	2CADR	T5IDLOC
// PORT: Fixed ROM slots 37800 37801.
    37800, 3286, 37801, 10380,
// PORT: SOURCE P40-P47.agc:2333
//
// PORT: SOURCE P40-P47.agc:2334
//		SBANK=	LOWSUPER
// PORT: SOURCE P40-P47.agc:2335
//		BANK	17
// PORT: SOURCE P40-P47.agc:2336
//		SETLOC	DAPS6
// PORT: SOURCE P40-P47.agc:2337
//		BANK
// PORT: SOURCE P40-P47.agc:2338
//
// PORT: SOURCE P40-P47.agc:2339
//DEC409		DEC	409
// PORT: Fixed ROM slots 18750.
    18750, 818,
// PORT: SOURCE P40-P47.agc:2340
//DEC46		DEC	46
// PORT: Fixed ROM slots 18751.
    18751, 92
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18752–18772.
function agcAotUnit1101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18761 {
        if slot <= 18756 {
            if slot <= 18753 {
                if slot <= 18752 {
// PORT: SOURCE P40-P47.agc:2341
//
// PORT: SOURCE P40-P47.agc:2342
//# Page 735
// PORT: SOURCE P40-P47.agc:2343
//
// PORT: SOURCE P40-P47.agc:2344
//# CALLED BY "DONOUN47" (VERB 48), OR DIRECTLY BY "FRESHDAP" (RCS DAP)
// PORT: SOURCE P40-P47.agc:2345
//S40.14		CAE	IXX		# RCS ENTRY
// PORT: Fixed ROM slots 18752.
                    if slot <> 18752 or instruction <> 13112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 824).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2346
//		EXTEND
// PORT: Fixed ROM slots 18753.
                    if slot <> 18753 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18754 {
// PORT: SOURCE P40-P47.agc:2347
//		MP	CONTONE
// PORT: Fixed ROM slots 18754.
                    if slot <> 18754 or instruction <> 30037 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1365, readEffective:call(words, 1365)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18755 {
// PORT: SOURCE P40-P47.agc:2348
//		TS	J/M
// PORT: Fixed ROM slots 18755.
                        if slot <> 18755 or instruction <> 23443 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23443, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2349
//
// PORT: SOURCE P40-P47.agc:2350
//		CA	IAVG
// PORT: Fixed ROM slots 18756.
                        if slot <> 18756 or instruction <> 13113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 825).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18758 {
                if slot <= 18757 {
// PORT: SOURCE P40-P47.agc:2351
//		EXTEND
// PORT: Fixed ROM slots 18757.
                    if slot <> 18757 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2352
//		MP	CONTONE
// PORT: Fixed ROM slots 18758.
                    if slot <> 18758 or instruction <> 30037 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1365, readEffective:call(words, 1365)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18759 {
// PORT: SOURCE P40-P47.agc:2353
//		TS	J/M1
// PORT: Fixed ROM slots 18759.
                    if slot <> 18759 or instruction <> 23444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23444, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18760 {
// PORT: SOURCE P40-P47.agc:2354
//
// PORT: SOURCE P40-P47.agc:2355
//		TS	J/M2
// PORT: Fixed ROM slots 18760.
                        if slot <> 18760 or instruction <> 23445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23445, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2356
//
// PORT: SOURCE P40-P47.agc:2357
//		EXTEND
// PORT: Fixed ROM slots 18761.
                        if slot <> 18761 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18766 {
            if slot <= 18763 {
                if slot <= 18762 {
// PORT: SOURCE P40-P47.agc:2358
//		DCA	CONTTWO
// PORT: Fixed ROM slots 18762.
                    if slot <> 18762 or instruction <> 13655 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1367, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2359
//		EXTEND
// PORT: Fixed ROM slots 18763.
                    if slot <> 18763 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18764 {
// PORT: SOURCE P40-P47.agc:2360
//		DV	IXX
// PORT: Fixed ROM slots 18764.
                    if slot <> 18764 or instruction <> 4920 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 824, readEffective:call(words, 824)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18765 {
// PORT: SOURCE P40-P47.agc:2361
//		TS	KMJ
// PORT: Fixed ROM slots 18765.
                        if slot <> 18765 or instruction <> 23440 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23440, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2362
//
// PORT: SOURCE P40-P47.agc:2363
//		EXTEND
// PORT: Fixed ROM slots 18766.
                        if slot <> 18766 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18769 {
                if slot <= 18767 {
// PORT: SOURCE P40-P47.agc:2364
//		DCA	CONTTWO
// PORT: Fixed ROM slots 18767.
                    if slot <> 18767 or instruction <> 13655 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1367, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18768 {
// PORT: SOURCE P40-P47.agc:2365
//		EXTEND
// PORT: Fixed ROM slots 18768.
                        if slot <> 18768 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2366
//		DV	IAVG
// PORT: Fixed ROM slots 18769.
                        if slot <> 18769 or instruction <> 4921 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 825, readEffective:call(words, 825)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18770 {
// PORT: SOURCE P40-P47.agc:2367
//		TS	KMJ1
// PORT: Fixed ROM slots 18770.
                    if slot <> 18770 or instruction <> 23441 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23441, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18771 {
// PORT: SOURCE P40-P47.agc:2368
//
// PORT: SOURCE P40-P47.agc:2369
//		TS	KMJ2
// PORT: Fixed ROM slots 18771.
                        if slot <> 18771 or instruction <> 23442 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23442, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:2370
//
// PORT: SOURCE P40-P47.agc:2371
//		TC	Q
// PORT: Fixed ROM slots 18772.
                        if slot <> 18772 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1101] to agcAotUnit1101@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2372
//
// PORT: SOURCE P40-P47.agc:2373
//CONTONE		DEC	.662034		# 2PI/M
// PORT: Fixed ROM slots 18773.
    18773, 21694,
// PORT: SOURCE P40-P47.agc:2374
//CONTTWO		2DEC	.00118
// PORT: Fixed ROM slots 18774 18775.
    18774, 38, 18775, 10916,
// PORT: SOURCE P40-P47.agc:2375
//
// PORT: SOURCE P40-P47.agc:2376
//		COUNT 	24/TVNG
// PORT: SOURCE P40-P47.agc:2377
//
// PORT: SOURCE P40-P47.agc:2378
//		BANK	31
// PORT: SOURCE P40-P47.agc:2379
//		SETLOC	P40S
// PORT: SOURCE P40-P47.agc:2380
//		BANK
// PORT: SOURCE P40-P47.agc:2381
//
// PORT: SOURCE P40-P47.agc:2382
//POS-2.5		OCT	37405
// PORT: Fixed ROM slots 23537.
    23537, 32266,
// PORT: SOURCE P40-P47.agc:2383
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:2384
//RCSCADR		2CADR	RCSUP
// PORT: Fixed ROM slots 23538 23539.
    23538, 2072, 23539, 34924,
// PORT: SOURCE P40-P47.agc:2385
//
// PORT: SOURCE P40-P47.agc:2386
//6SECT5		OCT	37704
// PORT: Fixed ROM slots 23540.
    23540, 32648
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19468–19472.
function agcAotUnit1120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19469 {
        if slot <= 19468 {
// PORT: SOURCE P40-P47.agc:2387
//		COUNT	21/RCSUP
// PORT: SOURCE P40-P47.agc:2388
//
// PORT: SOURCE P40-P47.agc:2389
//		BANK	20
// PORT: SOURCE P40-P47.agc:2390
//
// PORT: SOURCE P40-P47.agc:2391
//		SETLOC	DAPS3
// PORT: SOURCE P40-P47.agc:2392
//		BANK
// PORT: SOURCE P40-P47.agc:2393
//
// PORT: SOURCE P40-P47.agc:2394
//# Page 736
// PORT: SOURCE P40-P47.agc:2395
//
// PORT: SOURCE P40-P47.agc:2396
//RCSUP		LXCH	BANKRUPT
// PORT: Fixed ROM slots 19468.
            if slot <> 19468 or instruction <> 9230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 14, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:2397
//		EXTEND
// PORT: Fixed ROM slots 19469.
            if slot <> 19469 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19470 {
// PORT: SOURCE P40-P47.agc:2398
//		QXCH	QRUPT
// PORT: Fixed ROM slots 19470.
            if slot <> 19470 or instruction <> 9226 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 10, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19471 {
// PORT: SOURCE P40-P47.agc:2399
//
// PORT: SOURCE P40-P47.agc:2400
//		TCR	RCSDAPON	# ACTIVATE RCS DAP
// PORT: Fixed ROM slots 19471.
                if slot <> 19471 or instruction <> 1044 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1044, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:2401
//
// PORT: SOURCE P40-P47.agc:2402
//		TCF	RESUME
// PORT: Fixed ROM slots 19472.
                if slot <> 19472 or instruction <> 6875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1120] to agcAotUnit1120@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:2403
//
// PORT: SOURCE P40-P47.agc:2404
//		EBANK=	DAPDATR1
// PORT: SOURCE P40-P47.agc:2405
//RCSADDR		2CADR	RCSATT
// PORT: Fixed ROM slots 19473 19474.
    19473, 2212, 19474, 34924,
// PORT: SOURCE P40-P47.agc:2406
//
// PORT: SOURCE P40-P47.agc:2407
//0.6SECT5	OCT	37704
// PORT: Fixed ROM slots 19475.
    19475, 32648
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19476–19489.
function agcAotUnit1121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19482 {
        if slot <= 19478 {
            if slot <= 19476 {
// PORT: SOURCE P40-P47.agc:2408
//
// PORT: SOURCE P40-P47.agc:2409
//					# RCSDAPON ENTRY MUST BE UNDER INT-INHIBIT
// PORT: SOURCE P40-P47.agc:2410
//RCSDAPON	CAF	0.6SECT5	# 0.6 SEC ALLOWS TVCEXEC/ROLLDAP TO DIE
// PORT: Fixed ROM slots 19476.
                if slot <> 19476 or instruction <> 13331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1043), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19477 {
// PORT: SOURCE P40-P47.agc:2411
//	+1	TS	TIME5		# ENTRY FROM R00TOP00
// PORT: Fixed ROM slots 19477.
                    if slot <> 19477 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2412
//		TS	T5PHASE		# WILL CAUSE FRESHDAP (+1)
// PORT: Fixed ROM slots 19478.
                    if slot <> 19478 or instruction <> 23349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19480 {
                if slot <= 19479 {
// PORT: SOURCE P40-P47.agc:2413
//
// PORT: SOURCE P40-P47.agc:2414
//		CS	RCSFLAGS	# SET BIT3 TO REINITIALIZE FDAI ERROR
// PORT: Fixed ROM slots 19479.
                    if slot <> 19479 or instruction <> 17217 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 833).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2415
//		MASK	BIT3		#	DISPLAY, IN CASE SC CONT SWITCH
// PORT: Fixed ROM slots 19480.
                    if slot <> 19480 or instruction <> 31245 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        if fixedOperand = 4 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19481 {
// PORT: SOURCE P40-P47.agc:2416
//		ADS	RCSFLAGS	#	IN SCS NOT GNC (GUIDEMODE PRIMARY)
// PORT: Fixed ROM slots 19481.
                    if slot <> 19481 or instruction <> 12097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 833).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2417
//
// PORT: SOURCE P40-P47.agc:2418
//		EXTEND
// PORT: Fixed ROM slots 19482.
                    if slot <> 19482 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19485 {
            if slot <= 19483 {
// PORT: SOURCE P40-P47.agc:2419
//		DCA	RCSADDR		# (RCSATT)
// PORT: Fixed ROM slots 19483.
                if slot <> 19483 or instruction <> 13330 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1042, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19484 {
// PORT: SOURCE P40-P47.agc:2420
//		DXCH	T5LOC
// PORT: Fixed ROM slots 19484.
                    if slot <> 19484 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2421
//
// PORT: SOURCE P40-P47.agc:2422
//		CS	OCT60000	# SEE BITS 15,14 TO 01 TO INDICATE
// PORT: Fixed ROM slots 19485.
                    if slot <> 19485 or instruction <> 18501 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19487 {
                if slot <= 19486 {
// PORT: SOURCE P40-P47.agc:2423
//		MASK	FLAGWRD6	#	T5 TAKEOVER BY RCSDAP
// PORT: Fixed ROM slots 19486.
                    if slot <> 19486 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2424
//		AD	BIT14
// PORT: Fixed ROM slots 19487.
                    if slot <> 19487 or instruction <> 27138 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19488 {
// PORT: SOURCE P40-P47.agc:2425
//		TS	FLAGWRD6	# KILLS TVCEXEC AND ROLLDAP STARTS
// PORT: Fixed ROM slots 19488.
                    if slot <> 19488 or instruction <> 22594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22594, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:2426
//
// PORT: SOURCE P40-P47.agc:2427
//		TC	Q		# RETURN TO CALLER (TVCDAPOF OR RCSDAPUP)
// PORT: Fixed ROM slots 19489.
                    if slot <> 19489 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1121] to agcAotUnit1121@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P40-P47.agc:2428
//
// PORT: SOURCE P40-P47.agc:2429
//
