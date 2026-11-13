// PORT: Original source unit P20-P25.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 33969–33969.
function agcAotUnit1884 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P20-P25.agc:2
//# Filename:	P20-P25.agc
// PORT: SOURCE P20-P25.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P20-P25.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P20-P25.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P20-P25.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P20-P25.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P20-P25.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P20-P25.agc:9
//# Pages:	562-534
// PORT: SOURCE P20-P25.agc:10
//# Mod history:	2009-05-10 RSB	Adapted from the Colossus249/ file
// PORT: SOURCE P20-P25.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE P20-P25.agc:12
//#				images.
// PORT: SOURCE P20-P25.agc:13
//#		2009-05-20 RSB	Corrections:  P2OS -> P20S, STO -> STQ,
// PORT: SOURCE P20-P25.agc:14
//#				GOTOPOOH -> GOTOPOOH, a duplicated EXTEND
// PORT: SOURCE P20-P25.agc:15
//#				was fixed, P23.10 -> R23.10,
// PORT: SOURCE P20-P25.agc:16
//#				S22B0X44 -> S22BOX44, S22SUBSCL -> 22SUBSCL,
// PORT: SOURCE P20-P25.agc:17
//#				S22DPP -> S22DSPP, changed some instructions in
// PORT: SOURCE P20-P25.agc:18
//#				P23.152.
// PORT: SOURCE P20-P25.agc:19
//#
// PORT: SOURCE P20-P25.agc:20
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P20-P25.agc:21
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P20-P25.agc:22
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P20-P25.agc:23
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P20-P25.agc:24
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P20-P25.agc:25
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P20-P25.agc:26
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P20-P25.agc:27
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P20-P25.agc:28
//#
// PORT: SOURCE P20-P25.agc:29
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P20-P25.agc:30
//#
// PORT: SOURCE P20-P25.agc:31
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P20-P25.agc:32
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P20-P25.agc:33
//#
// PORT: SOURCE P20-P25.agc:34
//#	This AGC program shall also be referred to as
// PORT: SOURCE P20-P25.agc:35
//#			Colossus 2A
// PORT: SOURCE P20-P25.agc:36
//
// PORT: SOURCE P20-P25.agc:37
//# Page 562
// PORT: SOURCE P20-P25.agc:38
//# RENDEZVOUS NAVIGATION PROGRAM 20
// PORT: SOURCE P20-P25.agc:39
//#
// PORT: SOURCE P20-P25.agc:40
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:41
//#
// PORT: SOURCE P20-P25.agc:42
//# 	MOD NO -- 1
// PORT: SOURCE P20-P25.agc:43
//# 	MOD BY -- N. BRODEUR
// PORT: SOURCE P20-P25.agc:44
//#
// PORT: SOURCE P20-P25.agc:45
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:46
//#
// PORT: SOURCE P20-P25.agc:47
//#	TO CONTROL THE CSM ATTITUDE AND OPTICS TO ACQUIRE THE LEM IN THE S+T
// PORT: SOURCE P20-P25.agc:48
//#	FIELD AND TO POINT THE CSM TRANSPONDER AT THE LEM.  TO UPDATE EITHER THE
// PORT: SOURCE P20-P25.agc:49
//#	LEM OR CSM STATE VECTOR (AS SPECIFIED BY THE ASTRONAUT BY THE DSKY
// PORT: SOURCE P20-P25.agc:50
//#	ENTRY) ON THE BASIS OF OPTICAL TRACKING DATA (REQUESTED BY DSKY)
// PORT: SOURCE P20-P25.agc:51
//#
// PORT: SOURCE P20-P25.agc:52
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:53
//#
// PORT: SOURCE P20-P25.agc:54
//# 	ASTRONAUT REQUEST THROUGH DSKY V37E20E
// PORT: SOURCE P20-P25.agc:55
//#
// PORT: SOURCE P20-P25.agc:56
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:57
//#
// PORT: SOURCE P20-P25.agc:58
//#	R02BOTH	(IMU STATUS CHECK)				BANKCALL
// PORT: SOURCE P20-P25.agc:59
//#	FLAGUP				2PHCHNG			LOADTIME
// PORT: SOURCE P20-P25.agc:60
//#	R61CSM (PREFERRED TRACKING ATTITUDE)			FLAGDOWN
// PORT: SOURCE P20-P25.agc:61
//#	R52 (AUTO OPTICS POSITIONING ROUT)			SETINTG
// PORT: SOURCE P20-P25.agc:62
//#	R22 (REND TRACK DATA PROC ROUT)				PRIOCHNG
// PORT: SOURCE P20-P25.agc:63
//#	ENDOFJOB			INTEGRV			GRP2PC
// PORT: SOURCE P20-P25.agc:64
//#	INTPRET				MKRLEES			FINDVAC
// PORT: SOURCE P20-P25.agc:65
//#
// PORT: SOURCE P20-P25.agc:66
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:67
//#
// PORT: SOURCE P20-P25.agc:68
//# 	P20 MAY BE TERMINATED IN TWO WAYS -- ASTRONAUT SELECTION OF IDLING
// PORT: SOURCE P20-P25.agc:69
//#	PROGRAM (P00) BY KEYING V37E00E OR BY KEYING IN V56E
// PORT: SOURCE P20-P25.agc:70
//#
// PORT: SOURCE P20-P25.agc:71
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:72
//#
// PORT: SOURCE P20-P25.agc:73
//# 	NONE DIRECTLY FROM P20
// PORT: SOURCE P20-P25.agc:74
//#
// PORT: SOURCE P20-P25.agc:75
//# OUTPUT
// PORT: SOURCE P20-P25.agc:76
//#
// PORT: SOURCE P20-P25.agc:77
//# 	TRKMKCNT = NO OF RENDEZVOUS TRACKING MARKS TAKEN (COUNTER)
// PORT: SOURCE P20-P25.agc:78
//#	VHFCNT = NO OF VHF RANGING MARKS INCORPORATED (COUNTER)
// PORT: SOURCE P20-P25.agc:79
//#
// PORT: SOURCE P20-P25.agc:80
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:81
//#
// PORT: SOURCE P20-P25.agc:82
//#	RNDVZFLG,VEHUPFLG,UPDATFLG,TRACKFLG,TARG1FLG
// PORT: SOURCE P20-P25.agc:83
//#	HOLDFLAG,WBODY,WBODY1,WBODY2,DELCDUX,DELCDUY,DELCDUZ
// PORT: SOURCE P20-P25.agc:84
//#	STIKFLAG,PRFTRKAT,VINTFLAG,DIM0FLAG,R60FLAG,R61CNTR
// PORT: SOURCE P20-P25.agc:85
//
// PORT: SOURCE P20-P25.agc:86
//		BANK	33
// PORT: SOURCE P20-P25.agc:87
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:88
//		BANK
// PORT: SOURCE P20-P25.agc:89
//
// PORT: SOURCE P20-P25.agc:90
//		EBANK=	ESTROKER
// PORT: SOURCE P20-P25.agc:91
//		COUNT*	$$/P20
// PORT: SOURCE P20-P25.agc:92
//
// PORT: SOURCE P20-P25.agc:93
//PROG20		TC	BANKCALL
// PORT: Fixed ROM slots 33969.
    if slot <> 33969 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1884] to agcAotUnit1884@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:94
//		CADR	R02BOTH		# IMU STATUS CHECK
// PORT: Fixed ROM slots 33970.
    33970, 16214
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33971–33974.
function agcAotUnit1885 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33972 {
        if slot <= 33971 {
// PORT: SOURCE P20-P25.agc:95
//					# BLOCKING OF UPLINK IS DONE BY UPLINK PRG
// PORT: SOURCE P20-P25.agc:96
//		CAF	ZERO
// PORT: Fixed ROM slots 33971.
            if slot <> 33971 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:97
//		TS	TRKMKCNT	# ZERO REND TRACKING MARK COUNTER
// PORT: Fixed ROM slots 33972.
            if slot <> 33972 or instruction <> 23126 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23126, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33973 {
// PORT: SOURCE P20-P25.agc:98
//		TS	VHFCNT		# ZERO REND VHF RNG MRK COUNTER
// PORT: Fixed ROM slots 33973.
            if slot <> 33973 or instruction <> 23125 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23125, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:99
//		TC	UPFLAG		# SET PREF TRACK ATT FLAG
// PORT: Fixed ROM slots 33974.
            if slot <> 33974 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1885] to agcAotUnit1885@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:100
//		ADRES	PRFTRKAT	# BIT 10 FLAG 5
// PORT: Fixed ROM slots 33975.
    33975, 160
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33976–33976.
function agcAotUnit1886 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:101
//		TC	DOWNFLAG	# LEM TO BE UPDATED.  VEHUPFLG RESET.
// PORT: Fixed ROM slots 33976.
    if slot <> 33976 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1886] to agcAotUnit1886@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:102
//		ADRES	VEHUPFLG	# BIT 8 FLAG 1
// PORT: Fixed ROM slots 33977.
    33977, 44
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33978–33978.
function agcAotUnit1887 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:103
//# Page 563
// PORT: SOURCE P20-P25.agc:104
//		TC	UPFLAG		# SET TRACKFLAG
// PORT: Fixed ROM slots 33978.
    if slot <> 33978 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1887] to agcAotUnit1887@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:105
//		ADRES	TRACKFLG	# BIT 5 FLAG 1
// PORT: Fixed ROM slots 33979.
    33979, 50
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33980–33980.
function agcAotUnit1888 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:106
//		TC	UPFLAG		# SET UPDATFLG
// PORT: Fixed ROM slots 33980.
    if slot <> 33980 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1888] to agcAotUnit1888@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:107
//		ADRES	UPDATFLG	# BIT 7 FLAG 1
// PORT: Fixed ROM slots 33981.
    33981, 46
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33982–33982.
function agcAotUnit1889 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:108
//		TC	UPFLAG		# SET RNDVZFLG
// PORT: Fixed ROM slots 33982.
    if slot <> 33982 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1889] to agcAotUnit1889@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:109
//		ADRES	RNDVZFLG	# BIT 7 FLAG 0
// PORT: Fixed ROM slots 33983.
    33983, 16
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33984–33984.
function agcAotUnit1890 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:110
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 33984.
    if slot <> 33984 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1890] to agcAotUnit1890@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:111
//		OCT	4
// PORT: Fixed ROM slots 33985.
    33985, 8,
// PORT: SOURCE P20-P25.agc:112
//		OCT	05022
// PORT: Fixed ROM slots 33986.
    33986, 5156,
// PORT: SOURCE P20-P25.agc:113
//		OCT	26000
// PORT: Fixed ROM slots 33987.
    33987, 22528
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33988–33988.
function agcAotUnit1891 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:114
//		TC	INTPRET
// PORT: Fixed ROM slots 33988.
    if slot <> 33988 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1891] to agcAotUnit1891@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:115
//		RTB
// PORT: Fixed ROM slots 33989.
    33989, 65336,
// PORT: SOURCE P20-P25.agc:116
//			LOADTIME
// PORT: Fixed ROM slots 33990.
    33990, 38544,
// PORT: SOURCE P20-P25.agc:117
//		STCALL	MARKTIME
// PORT: Fixed ROM slots 33991.
    33991, 29994,
// PORT: SOURCE P20-P25.agc:118
//			SETINTG		# SET INTEGRATION FLAGS
// PORT: Fixed ROM slots 33992.
    33992, 47558,
// PORT: SOURCE P20-P25.agc:119
//		BOFF	SET
// PORT: Fixed ROM slots 33993.
    33993, 35864,
// PORT: SOURCE P20-P25.agc:120
//			RENDWFLG
// PORT: Fixed ROM slots 33994.
    33994, 3036,
// PORT: SOURCE P20-P25.agc:121
//			P20.1
// PORT: Fixed ROM slots 33995.
    33995, 63898,
// PORT: SOURCE P20-P25.agc:122
//			DIM0FLAG	# SET TO INTEGRATE THE W MATRIX
// PORT: Fixed ROM slots 33996.
    33996, 1660,
// PORT: SOURCE P20-P25.agc:123
//P20.1		BON	CLEAR
// PORT: Fixed ROM slots 33997.
    33997, 35864,
// PORT: SOURCE P20-P25.agc:124
//			VEHUPFLG
// PORT: Fixed ROM slots 33998.
    33998, 910,
// PORT: SOURCE P20-P25.agc:125
//			P20.2
// PORT: Fixed ROM slots 33999.
    33999, 63906,
// PORT: SOURCE P20-P25.agc:126
//			VINTFLAG	# SET FOR LM INTEGRATION
// PORT: Fixed ROM slots 34000.
    34000, 1912,
// PORT: SOURCE P20-P25.agc:127
//P20.2		CALL
// PORT: Fixed ROM slots 34001.
    34001, 65320,
// PORT: SOURCE P20-P25.agc:128
//			INTEGRV
// PORT: Fixed ROM slots 34002.
    34002, 23780,
// PORT: SOURCE P20-P25.agc:129
//		CALL
// PORT: Fixed ROM slots 34003.
    34003, 65320,
// PORT: SOURCE P20-P25.agc:130
//			GRP2PC		# GROUP 2 PHASE CHANGE
// PORT: Fixed ROM slots 34004.
    34004, 48080,
// PORT: SOURCE P20-P25.agc:131
//		CALL
// PORT: Fixed ROM slots 34005.
    34005, 65320,
// PORT: SOURCE P20-P25.agc:132
//			SETINTG		# SET INTEGRATION FLAGS
// PORT: Fixed ROM slots 34006.
    34006, 47558,
// PORT: SOURCE P20-P25.agc:133
//		BOFF	CLEAR
// PORT: Fixed ROM slots 34007.
    34007, 35864,
// PORT: SOURCE P20-P25.agc:134
//			VEHUPFLG
// PORT: Fixed ROM slots 34008.
    34008, 974,
// PORT: SOURCE P20-P25.agc:135
//			P20.3
// PORT: Fixed ROM slots 34009.
    34009, 63926,
// PORT: SOURCE P20-P25.agc:136
//			VINTFLAG	# SET FOR LM INTEGRATION
// PORT: Fixed ROM slots 34010.
    34010, 1912,
// PORT: SOURCE P20-P25.agc:137
//P20.3		CALL
// PORT: Fixed ROM slots 34011.
    34011, 65320,
// PORT: SOURCE P20-P25.agc:138
//			INTEGRV
// PORT: Fixed ROM slots 34012.
    34012, 23780,
// PORT: SOURCE P20-P25.agc:139
//		EXIT
// PORT: Fixed ROM slots 34013.
    34013, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34014–34015.
function agcAotUnit1892 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34014 {
// PORT: SOURCE P20-P25.agc:140
//		CAF	PRIO26
// PORT: Fixed ROM slots 34014.
        if slot <> 34014 or instruction <> 16307 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4019), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:141
//		TC	FINDVAC
// PORT: Fixed ROM slots 34015.
        if slot <> 34015 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1892] to agcAotUnit1892@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:142
//		EBANK=	MRKBUF2
// PORT: SOURCE P20-P25.agc:143
//		2CADR	R22
// PORT: Fixed ROM slots 34016 34017.
    34016, 2864, 34017, 57454
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34018–34018.
function agcAotUnit1893 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:144
//
// PORT: SOURCE P20-P25.agc:145
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 34018.
    if slot <> 34018 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1893] to agcAotUnit1893@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:146
//		OCT	00072
// PORT: Fixed ROM slots 34019.
    34019, 116,
// PORT: SOURCE P20-P25.agc:147
//		OCT	00111
// PORT: Fixed ROM slots 34020.
    34020, 146
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34021–34033.
function agcAotUnit1894 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34026 {
        if slot <= 34023 {
            if slot <= 34021 {
// PORT: SOURCE P20-P25.agc:148
//PIKUP20		CAF	PRIO14		# ALLOW HIGHER PRIO THAN LAMBERT
// PORT: Fixed ROM slots 34021.
                if slot <> 34021 or instruction <> 14902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34022 {
// PORT: SOURCE P20-P25.agc:149
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 34022.
                    if slot <> 34022 or instruction <> 2696 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2696, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:150
//		CAF	BIT5		# IS TRACK FLAG SET
// PORT: Fixed ROM slots 34023.
                    if slot <> 34023 or instruction <> 14859 { return choose false if checkOnly else -1. }
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
            if slot <= 34024 {
// PORT: SOURCE P20-P25.agc:151
//		MASK	STATE	+1
// PORT: Fixed ROM slots 34024.
                if slot <> 34024 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34025 {
// PORT: SOURCE P20-P25.agc:152
//		EXTEND
// PORT: Fixed ROM slots 34025.
                    if slot <> 34025 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:153
//		BZF	ENDOFJOB	# NO
// PORT: Fixed ROM slots 34026.
                    if slot <> 34026 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34029 {
            if slot <= 34027 {
// PORT: SOURCE P20-P25.agc:154
//# Page 564
// PORT: SOURCE P20-P25.agc:155
//		CAF	BIT13
// PORT: Fixed ROM slots 34027.
                if slot <> 34027 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34028 {
// PORT: SOURCE P20-P25.agc:156
//		MASK	STATE	+3	# IS REFSMFLG SET
// PORT: Fixed ROM slots 34028.
                    if slot <> 34028 or instruction <> 28735 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:157
//		EXTEND
// PORT: Fixed ROM slots 34029.
                    if slot <> 34029 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34031 {
                if slot <= 34030 {
// PORT: SOURCE P20-P25.agc:158
//		BZF	ENDOFJOB
// PORT: Fixed ROM slots 34030.
                    if slot <> 34030 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:159
//		CAF	ZERO
// PORT: Fixed ROM slots 34031.
                    if slot <> 34031 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34032 {
// PORT: SOURCE P20-P25.agc:160
//		TS	R61CNTR		# INITIALIZE R61 COUNTER
// PORT: Fixed ROM slots 34032.
                    if slot <> 34032 or instruction <> 23549 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23549, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:161
//		TC	BANKCALL
// PORT: Fixed ROM slots 34033.
                    if slot <> 34033 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1894] to agcAotUnit1894@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:162
//		CADR	R61CSM
// PORT: Fixed ROM slots 34034.
    34034, 64222
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34035–34037.
function agcAotUnit1895 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34035 {
// PORT: SOURCE P20-P25.agc:163
//		EBANK=	QMIN
// PORT: SOURCE P20-P25.agc:164
//		CAF	EBANK5
// PORT: Fixed ROM slots 34035.
        if slot <> 34035 or instruction <> 14894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2606), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34036 {
// PORT: SOURCE P20-P25.agc:165
//		TS	EBANK
// PORT: Fixed ROM slots 34036.
            if slot <> 34036 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:166
//		TC	UPFLAG		# SET TARGET FLAG TO LEM
// PORT: Fixed ROM slots 34037.
            if slot <> 34037 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1895] to agcAotUnit1895@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:167
//		ADRES	TARG1FLG	# BIT 10 FLAG 1
// PORT: Fixed ROM slots 34038.
    34038, 40
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34039–34039.
function agcAotUnit1896 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:168
//P20R52JB	TC	INTPRET
// PORT: Fixed ROM slots 34039.
    if slot <> 34039 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1896] to agcAotUnit1896@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:169
//		CALL
// PORT: Fixed ROM slots 34040.
    34040, 65320,
// PORT: SOURCE P20-P25.agc:170
//			R52		# SET UP AUTO OPTICS JOB
// PORT: Fixed ROM slots 34041.
    34041, 24594,
// PORT: SOURCE P20-P25.agc:171
//		EXIT
// PORT: Fixed ROM slots 34042.
    34042, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34043–34043.
function agcAotUnit1897 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:172
//		TC	BANKCALL
// PORT: Fixed ROM slots 34043.
    if slot <> 34043 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1897] to agcAotUnit1897@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:173
//		CADR	MKRLEES
// PORT: Fixed ROM slots 34044.
    34044, 14450
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34045–34047.
function agcAotUnit1898 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34045 {
// PORT: SOURCE P20-P25.agc:174
//		CAF	ONE		# HOLD PRESENT ATTITUDE
// PORT: Fixed ROM slots 34045.
        if slot <> 34045 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34046 {
// PORT: SOURCE P20-P25.agc:175
//		TS	HOLDFLAG
// PORT: Fixed ROM slots 34046.
            if slot <> 34046 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:176
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 34047.
            if slot <> 34047 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1898] to agcAotUnit1898@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:177
//OCT203		OCT	00203
// PORT: Fixed ROM slots 34048.
    34048, 262
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26624–26624.
function agcAotUnit1544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:178
//FIRST3		EQUALS	FURST3
// PORT: SOURCE P20-P25.agc:179
//
// PORT: SOURCE P20-P25.agc:180
//# Page 565
// PORT: SOURCE P20-P25.agc:181
//# ORBITAL NAVIGATION PROGRAM 22
// PORT: SOURCE P20-P25.agc:182
//
// PORT: SOURCE P20-P25.agc:183
//		BANK	31
// PORT: SOURCE P20-P25.agc:184
//		SETLOC	P20S1
// PORT: SOURCE P20-P25.agc:185
//		BANK
// PORT: SOURCE P20-P25.agc:186
//
// PORT: SOURCE P20-P25.agc:187
//		EBANK=	LANDMARK
// PORT: SOURCE P20-P25.agc:188
//		COUNT*	$$/P22
// PORT: SOURCE P20-P25.agc:189
//
// PORT: SOURCE P20-P25.agc:190
//PROG22		TC	DOWNFLAG	# RESET RNDVZFLG BIT 7 FLAG 0
// PORT: Fixed ROM slots 26624.
    if slot <> 26624 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1544] to agcAotUnit1544@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:191
//		ADRES	RNDVZFLG
// PORT: Fixed ROM slots 26625.
    26625, 16
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26626–26626.
function agcAotUnit1545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:192
//		TC	BANKCALL
// PORT: Fixed ROM slots 26626.
    if slot <> 26626 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1545] to agcAotUnit1545@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:193
//		CADR	R02BOTH		# IMU STATUS CHECK
// PORT: Fixed ROM slots 26627.
    26627, 16214
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26628–26628.
function agcAotUnit1546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:194
//		TC	INTPRET		# COMPUTE ANGLE BETWEEN Y AND VXR SM
// PORT: Fixed ROM slots 26628.
    if slot <> 26628 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1546] to agcAotUnit1546@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:195
//		RTB
// PORT: Fixed ROM slots 26629.
    26629, 65336,
// PORT: SOURCE P20-P25.agc:196
//			LOADTIME
// PORT: Fixed ROM slots 26630.
    26630, 38544,
// PORT: SOURCE P20-P25.agc:197
//		STCALL	TDEC1
// PORT: Fixed ROM slots 26631.
    26631, 28738,
// PORT: SOURCE P20-P25.agc:198
//			CSMCONIC	# INTEGRATE TO PRESENT TIME
// PORT: Fixed ROM slots 26632.
    26632, 23704,
// PORT: SOURCE P20-P25.agc:199
//		VLOAD	VXV		# CROSS PRODUCT BETWEEN V AND R
// PORT: Fixed ROM slots 26633.
    26633, 40442,
// PORT: SOURCE P20-P25.agc:200
//			VATT
// PORT: Fixed ROM slots 26634.
    26634, 14,
// PORT: SOURCE P20-P25.agc:201
//			RATT
// PORT: Fixed ROM slots 26635.
    26635, 2,
// PORT: SOURCE P20-P25.agc:202
//		UNIT	DOT
// PORT: Fixed ROM slots 26636.
    26636, 41308,
// PORT: SOURCE P20-P25.agc:203
//			REFSMMAT +6
// PORT: Fixed ROM slots 26637.
    26637, 1992,
// PORT: SOURCE P20-P25.agc:204
//		ABS
// PORT: Fixed ROM slots 26638.
    26638, 65356,
// PORT: SOURCE P20-P25.agc:205
//		SL1	ARCCOS
// PORT: Fixed ROM slots 26639.
    26639, 54996,
// PORT: SOURCE P20-P25.agc:206
//		STORE	+MGA
// PORT: Fixed ROM slots 26640.
    26640, 3884,
// PORT: SOURCE P20-P25.agc:207
//		CLEAR	EXIT
// PORT: Fixed ROM slots 26641.
    26641, 65048,
// PORT: SOURCE P20-P25.agc:208
//			RENDWFLG
// PORT: Fixed ROM slots 26642.
    26642, 2940
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26643–26644.
function agcAotUnit1547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26643 {
// PORT: SOURCE P20-P25.agc:209
//		CAF	V06N45B
// PORT: Fixed ROM slots 26643.
        if slot <> 26643 or instruction <> 13388 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1100), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:210
//		TC	BANKCALL
// PORT: Fixed ROM slots 26644.
        if slot <> 26644 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1547] to agcAotUnit1547@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:211
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 26645.
    26645, 17502
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26646–26655.
function agcAotUnit1548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26650 {
        if slot <= 26647 {
            if slot <= 26646 {
// PORT: SOURCE P20-P25.agc:212
//		TC	GOTOPOOH	# TERM P22
// PORT: Fixed ROM slots 26646.
                if slot <> 26646 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:213
//		TC	PROG22A		# PROC
// PORT: Fixed ROM slots 26647.
                if slot <> 26647 or instruction <> 1052 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1052, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26648 {
// PORT: SOURCE P20-P25.agc:214
//		TC	-5		# ENTER
// PORT: Fixed ROM slots 26648.
                if slot <> 26648 or instruction <> 1043 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1043, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26649 {
// PORT: SOURCE P20-P25.agc:215
//		CAF	THREE
// PORT: Fixed ROM slots 26649.
                    if slot <> 26649 or instruction <> 15500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:216
//		TC	BLANKET		# BLANK OUT R1 + R2
// PORT: Fixed ROM slots 26650.
                    if slot <> 26650 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26652 {
            if slot <= 26651 {
// PORT: SOURCE P20-P25.agc:217
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 26651.
                if slot <> 26651 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:218
//PROG22A		CS	PRIO7		# RESULT=70777  SET OFFSET NO.=0
// PORT: Fixed ROM slots 26652.
                if slot <> 26652 or instruction <> 18995 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26653 {
// PORT: SOURCE P20-P25.agc:219
//		MASK	LANDMARK
// PORT: Fixed ROM slots 26653.
                if slot <> 26653 or instruction <> 29673 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 1001).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26654 {
// PORT: SOURCE P20-P25.agc:220
//		TS	LANDMARK
// PORT: Fixed ROM slots 26654.
                    if slot <> 26654 or instruction <> 23529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:221
//		TC	INTPRET
// PORT: Fixed ROM slots 26655.
                    if slot <> 26655 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1548] to agcAotUnit1548@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:222
//		CLEAR
// PORT: Fixed ROM slots 26656.
    26656, 65304,
// PORT: SOURCE P20-P25.agc:223
//			P22MKFLG
// PORT: Fixed ROM slots 26657.
    26657, 1896,
// PORT: SOURCE P20-P25.agc:224
//		SET	BOFF
// PORT: Fixed ROM slots 26658.
    26658, 35864,
// PORT: SOURCE P20-P25.agc:225
//			ERADFLAG
// PORT: Fixed ROM slots 26659.
    26659, 612,
// PORT: SOURCE P20-P25.agc:226
//			CMOONFLG
// PORT: Fixed ROM slots 26660.
    26660, 4550,
// PORT: SOURCE P20-P25.agc:227
//			PROG22B		# EARTH
// PORT: Fixed ROM slots 26661.
    26661, 49242,
// PORT: SOURCE P20-P25.agc:228
//		SET			# MOON
// PORT: Fixed ROM slots 26662.
    26662, 65304,
// PORT: SOURCE P20-P25.agc:229
//			LUNAFLAG
// PORT: Fixed ROM slots 26663.
    26663, 1638,
// PORT: SOURCE P20-P25.agc:230
//		DLOAD	CALL		# MPAC=V05N70,MPAC+1=NONZERO FOR N70
// PORT: Fixed ROM slots 26664.
    26664, 38090,
// PORT: SOURCE P20-P25.agc:231
//			V05N7022
// PORT: Fixed ROM slots 26665.
    26665, 16540,
// PORT: SOURCE P20-P25.agc:232
//# Page 566
// PORT: SOURCE P20-P25.agc:233
//			S22N7071
// PORT: Fixed ROM slots 26666.
    26666, 49402,
// PORT: SOURCE P20-P25.agc:234
//		GOTO
// PORT: Fixed ROM slots 26667.
    26667, 65360,
// PORT: SOURCE P20-P25.agc:235
//			CALLR52
// PORT: Fixed ROM slots 26668.
    26668, 49252,
// PORT: SOURCE P20-P25.agc:236
//PROG22B		CLEAR	SET		# EARTH ORBIT
// PORT: Fixed ROM slots 26669.
    26669, 35864,
// PORT: SOURCE P20-P25.agc:237
//			LUNAFLAG
// PORT: Fixed ROM slots 26670.
    26670, 1894,
// PORT: SOURCE P20-P25.agc:238
//			KNOWNFLG
// PORT: Fixed ROM slots 26671.
    26671, 3182,
// PORT: SOURCE P20-P25.agc:239
//		CALL			# GET LAT/LONG/ALT FROM ASTRO
// PORT: Fixed ROM slots 26672.
    26672, 65320,
// PORT: SOURCE P20-P25.agc:240
//			P22SUBRB
// PORT: Fixed ROM slots 26673.
    26673, 49350,
// PORT: SOURCE P20-P25.agc:241
//CALLR52		EXIT
// PORT: Fixed ROM slots 26674.
    26674, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26675–26675.
function agcAotUnit1549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:242
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 26675.
    if slot <> 26675 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1549] to agcAotUnit1549@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:243
//		OCT	00004
// PORT: Fixed ROM slots 26676.
    26676, 8,
// PORT: SOURCE P20-P25.agc:244
//		OCT	05022
// PORT: Fixed ROM slots 26677.
    26677, 5156,
// PORT: SOURCE P20-P25.agc:245
//		OCT	13000
// PORT: Fixed ROM slots 26678.
    26678, 11264
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26679–26681.
function agcAotUnit1550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26679 {
// PORT: SOURCE P20-P25.agc:246
//		CAF	FIVE
// PORT: Fixed ROM slots 26679.
        if slot <> 26679 or instruction <> 14866 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 26680 {
// PORT: SOURCE P20-P25.agc:247
//		TS	MARKINDX	# SET MARK INDEX=5 FOR R52
// PORT: Fixed ROM slots 26680.
            if slot <> 26680 or instruction <> 22721 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22721, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:248
//		TC	UPFLAG
// PORT: Fixed ROM slots 26681.
            if slot <> 26681 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1550] to agcAotUnit1550@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:249
//		ADRES	TARG2FLG	# SET FOR SIGHTING LMK
// PORT: Fixed ROM slots 26682.
    26682, 42
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26683–26683.
function agcAotUnit1551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:250
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 26683.
    if slot <> 26683 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1551] to agcAotUnit1551@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:251
//		ADRES	TARG1FLG	# CLEAR FOR NON-LEM
// PORT: Fixed ROM slots 26684.
    26684, 40
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26685–26685.
function agcAotUnit1552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:252
//		TC	INTPRET
// PORT: Fixed ROM slots 26685.
    if slot <> 26685 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1552] to agcAotUnit1552@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:253
//		CALL
// PORT: Fixed ROM slots 26686.
    26686, 65320,
// PORT: SOURCE P20-P25.agc:254
//			R52
// PORT: Fixed ROM slots 26687.
    26687, 24594,
// PORT: SOURCE P20-P25.agc:255
//DOV5N71		SLOAD	CALL		# MPAC=V05N71,MPAC+1=0 FOR N71
// PORT: Fixed ROM slots 26688.
    26688, 38074,
// PORT: SOURCE P20-P25.agc:256
//			V05N7122
// PORT: Fixed ROM slots 26689.
    26689, 16542,
// PORT: SOURCE P20-P25.agc:257
//			S22N7071
// PORT: Fixed ROM slots 26690.
    26690, 49402,
// PORT: SOURCE P20-P25.agc:258
//PROG22C		LXC,2	SLOAD*
// PORT: Fixed ROM slots 26691.
    26691, 56264,
// PORT: SOURCE P20-P25.agc:259
//			MARKSTAT
// PORT: Fixed ROM slots 26692.
    26692, 1456,
// PORT: SOURCE P20-P25.agc:260
//			QPRET,2
// PORT: Fixed ROM slots 26693.
    26693, 65448,
// PORT: SOURCE P20-P25.agc:261
//		STCALL	8NN
// PORT: Fixed ROM slots 26694.
    26694, 31696,
// PORT: SOURCE P20-P25.agc:262
//			S22.1		# ESTABLISH LANDMARK -- COMPUTE ORBITAL
// PORT: Fixed ROM slots 26695.
    26695, 49556,
// PORT: SOURCE P20-P25.agc:263
//P22OVER		EXIT
// PORT: Fixed ROM slots 26696.
    26696, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26697–26697.
function agcAotUnit1553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:264
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26697.
    if slot <> 26697 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1553] to agcAotUnit1553@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:265
//		OCT	04022
// PORT: Fixed ROM slots 26698.
    26698, 4132
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26699–26699.
function agcAotUnit1554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:266
//		TC	PROG22A		# POINT A ON GSOP
// PORT: Fixed ROM slots 26699.
    if slot <> 26699 or instruction <> 1052 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1052, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1554] to agcAotUnit1554@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:267
//V06N45B		VN	0645
// PORT: Fixed ROM slots 26700.
    26700, 1626,
// PORT: SOURCE P20-P25.agc:268
//V05N7022	VN	00570
// PORT: Fixed ROM slots 26701.
    26701, 1420,
// PORT: SOURCE P20-P25.agc:269
//V05N7122	VN	00571
// PORT: Fixed ROM slots 26702.
    26702, 1422,
// PORT: SOURCE P20-P25.agc:270
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:271
//		BANK
// PORT: SOURCE P20-P25.agc:272
//
// PORT: SOURCE P20-P25.agc:273
//		SETLOC	P20S1
// PORT: SOURCE P20-P25.agc:274
//		BANK
// PORT: SOURCE P20-P25.agc:275
//
// PORT: SOURCE P20-P25.agc:276
//S22LSITE	RTB			# CONVERT RLS FROM MOON-FIXED TO BASIC REF
// PORT: Fixed ROM slots 26703.
    26703, 65336,
// PORT: SOURCE P20-P25.agc:277
//			LOADTIME
// PORT: Fixed ROM slots 26704.
    26704, 38544,
// PORT: SOURCE P20-P25.agc:278
//		STOVL	6D		# 6-7D= TIME
// PORT: Fixed ROM slots 26705.
    26705, 20494,
// PORT: SOURCE P20-P25.agc:279
//			RLS
// PORT: Fixed ROM slots 26706.
    26706, 2092,
// PORT: SOURCE P20-P25.agc:280
//		STODL	0D		# 0-5D= LANDING SITE VECTOR
// PORT: Fixed ROM slots 26707.
    26707, 12290,
// PORT: SOURCE P20-P25.agc:281
//			HIDPHALF	# MPAC= ANY NON-ZERO FOR MOON
// PORT: Fixed ROM slots 26708.
    26708, 13750,
// PORT: SOURCE P20-P25.agc:282
//		CALL
// PORT: Fixed ROM slots 26709.
    26709, 65320,
// PORT: SOURCE P20-P25.agc:283
//# Page 567
// PORT: SOURCE P20-P25.agc:284
//			RP-TO-R		# RLS IN BASIC REF B-27 IN MPAC
// PORT: Fixed ROM slots 26710.
    26710, 46536,
// PORT: SOURCE P20-P25.agc:285
//		VSR2			# LUNAFLAG AND ERADFLAG SET ABOVE
// PORT: Fixed ROM slots 26711.
    26711, 65476,
// PORT: SOURCE P20-P25.agc:286
//		STORE	ALPHAV		# SCALE RLS B-29 FOR LAT-LONG
// PORT: Fixed ROM slots 26712.
    26712, 2260,
// PORT: SOURCE P20-P25.agc:287
//		RTB
// PORT: Fixed ROM slots 26713.
    26713, 65336,
// PORT: SOURCE P20-P25.agc:288
//			LOADTIME	# SET PRESENT TIME IN MPAC FOR LAT-LONG
// PORT: Fixed ROM slots 26714.
    26714, 38544,
// PORT: SOURCE P20-P25.agc:289
//		CALL
// PORT: Fixed ROM slots 26715.
    26715, 65320,
// PORT: SOURCE P20-P25.agc:290
//			LAT-LONG
// PORT: Fixed ROM slots 26716.
    26716, 23024,
// PORT: SOURCE P20-P25.agc:291
//		GOTO
// PORT: Fixed ROM slots 26717.
    26717, 65360,
// PORT: SOURCE P20-P25.agc:292
//			S22TOFF		# EXIT
// PORT: Fixed ROM slots 26718.
    26718, 3950,
// PORT: SOURCE P20-P25.agc:293
//OBTAINLL	CALL			# GET LAT/LONG/ALT FROM ASTRO
// PORT: Fixed ROM slots 26719.
    26719, 65320,
// PORT: SOURCE P20-P25.agc:294
//			P22SUBRB
// PORT: Fixed ROM slots 26720.
    26720, 49350,
// PORT: SOURCE P20-P25.agc:295
//		GOTO
// PORT: Fixed ROM slots 26721.
    26721, 65360,
// PORT: SOURCE P20-P25.agc:296
//			S22TOFF		# EXIT
// PORT: Fixed ROM slots 26722.
    26722, 3950,
// PORT: SOURCE P20-P25.agc:297
//P22SUBRB	STQ	EXIT		# GET LAT/LONG/ALT FROM ASTRO
// PORT: Fixed ROM slots 26723.
    26723, 65056,
// PORT: SOURCE P20-P25.agc:298
//			S22TOFF +1
// PORT: Fixed ROM slots 26724.
    26724, 3952
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26725–26726.
function agcAotUnit1555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26725 {
// PORT: SOURCE P20-P25.agc:299
//		CAF	V06N89B
// PORT: Fixed ROM slots 26725.
        if slot <> 26725 or instruction <> 14244 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1956), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:300
//		TC	BANKCALL
// PORT: Fixed ROM slots 26726.
        if slot <> 26726 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1555] to agcAotUnit1555@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:301
//		CADR	GOFLASH
// PORT: Fixed ROM slots 26727.
    26727, 17312
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26728–26731.
function agcAotUnit1556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26729 {
        if slot <= 26728 {
// PORT: SOURCE P20-P25.agc:302
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 26728.
            if slot <> 26728 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:303
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 26729.
            if slot <> 26729 or instruction <> 1131 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1131, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26730 {
// PORT: SOURCE P20-P25.agc:304
//		TC	-5		# ENTER OR RECYCLE
// PORT: Fixed ROM slots 26730.
            if slot <> 26730 or instruction <> 1125 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1125, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:305
//		TC	INTPRET
// PORT: Fixed ROM slots 26731.
            if slot <> 26731 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1556] to agcAotUnit1556@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:306
//		DLOAD	ABS		# TEST LAT/LONG GREATER THAN 90
// PORT: Fixed ROM slots 26732.
    26732, 42698,
// PORT: SOURCE P20-P25.agc:307
//			LANDLAT
// PORT: Fixed ROM slots 26733.
    26733, 1160,
// PORT: SOURCE P20-P25.agc:308
//		BDSU	BMN		# 1/4 REV - LAT
// PORT: Fixed ROM slots 26734.
    26734, 40994,
// PORT: SOURCE P20-P25.agc:309
//			DP1/4TH
// PORT: Fixed ROM slots 26735.
    26735, 13738,
// PORT: SOURCE P20-P25.agc:310
//			N89ERRX
// PORT: Fixed ROM slots 26736.
    26736, 49388,
// PORT: SOURCE P20-P25.agc:311
//		DLOAD	ABS
// PORT: Fixed ROM slots 26737.
    26737, 42698,
// PORT: SOURCE P20-P25.agc:312
//			LANDLONG
// PORT: Fixed ROM slots 26738.
    26738, 2528,
// PORT: SOURCE P20-P25.agc:313
//		BDSU	BPL
// PORT: Fixed ROM slots 26739.
    26739, 42018,
// PORT: SOURCE P20-P25.agc:314
//			DP1/4TH
// PORT: Fixed ROM slots 26740.
    26740, 13738,
// PORT: SOURCE P20-P25.agc:315
//			+4
// PORT: Fixed ROM slots 26741.
    26741, 49394,
// PORT: SOURCE P20-P25.agc:316
//
// PORT: SOURCE P20-P25.agc:317
//N89ERRX		EXIT
// PORT: Fixed ROM slots 26742.
    26742, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26743–26744.
function agcAotUnit1557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26743 {
// PORT: SOURCE P20-P25.agc:318
//		TC	FALTON
// PORT: Fixed ROM slots 26743.
        if slot <> 26743 or instruction <> 2304 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2304, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:319
//		TC	P22SUBRB +2	# LONG GR. THAN 90  REDISPLAY
// PORT: Fixed ROM slots 26744.
        if slot <> 26744 or instruction <> 1125 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1125, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1557] to agcAotUnit1557@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:320
//		CALL
// PORT: Fixed ROM slots 26745.
    26745, 65320,
// PORT: SOURCE P20-P25.agc:321
//			LLASRDA
// PORT: Fixed ROM slots 26746.
    26746, 51704,
// PORT: SOURCE P20-P25.agc:322
//		GOTO
// PORT: Fixed ROM slots 26747.
    26747, 65360,
// PORT: SOURCE P20-P25.agc:323
//			S22TOFF +1	# EXIT
// PORT: Fixed ROM slots 26748.
    26748, 3952,
// PORT: SOURCE P20-P25.agc:324
//S22N7071	STORE	8KK		# 8KK=V05N71,V05N70 8KK+1=0 N71, NOT 0 N70
// PORT: Fixed ROM slots 26749.
    26749, 3022,
// PORT: SOURCE P20-P25.agc:325
//		STQ	EXIT
// PORT: Fixed ROM slots 26750.
    26750, 65056,
// PORT: SOURCE P20-P25.agc:326
//			S22TOFF
// PORT: Fixed ROM slots 26751.
    26751, 3950
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26752–26753.
function agcAotUnit1558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26752 {
// PORT: SOURCE P20-P25.agc:327
//S22DSPPA	CA	8KK		# V05N70 OR V05N71
// PORT: Fixed ROM slots 26752.
        if slot <> 26752 or instruction <> 13286 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 998).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:328
//		TC	BANKCALL
// PORT: Fixed ROM slots 26753.
        if slot <> 26753 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1558] to agcAotUnit1558@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:329
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 26754.
    26754, 17502
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26755–26769.
function agcAotUnit1559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26761 {
        if slot <= 26757 {
            if slot <= 26755 {
// PORT: SOURCE P20-P25.agc:330
//		TC	GOTOPOOH	# V34E TERMINATE
// PORT: Fixed ROM slots 26755.
                if slot <> 26755 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26756 {
// PORT: SOURCE P20-P25.agc:331
//		TC	+5		# V33E PROCEED
// PORT: Fixed ROM slots 26756.
                    if slot <> 26756 or instruction <> 1161 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1161, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:332
//		TC	-5		# V32E RECYCLE
// PORT: Fixed ROM slots 26757.
                    if slot <> 26757 or instruction <> 1152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1152, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26759 {
                if slot <= 26758 {
// PORT: SOURCE P20-P25.agc:333
//		CAF	FIVE		# IMMEDIATE RETURN BLANK OUT R1,R3
// PORT: Fixed ROM slots 26758.
                    if slot <> 26758 or instruction <> 14866 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:334
//		TC	BLANKET
// PORT: Fixed ROM slots 26759.
                    if slot <> 26759 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26760 {
// PORT: SOURCE P20-P25.agc:335
//# Page 568
// PORT: SOURCE P20-P25.agc:336
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 26760.
                    if slot <> 26760 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:337
//		CA	LANDMARK
// PORT: Fixed ROM slots 26761.
                    if slot <> 26761 or instruction <> 13289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26765 {
            if slot <= 26763 {
                if slot <= 26762 {
// PORT: SOURCE P20-P25.agc:338
//		MASK	PRIO7		# 07000
// PORT: Fixed ROM slots 26762.
                    if slot <> 26762 or instruction <> 31283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                        if fixedOperand = 3584 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 8) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:339
//		TS	CXOFF		# 08000 = OFFSET INDICATOR
// PORT: Fixed ROM slots 26763.
                    if slot <> 26763 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26764 {
// PORT: SOURCE P20-P25.agc:340
//		CS	PRIO5		# 5 8-5
// PORT: Fixed ROM slots 26764.
                    if slot <> 26764 or instruction <> 18993 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:341
//		AD	CXOFF
// PORT: Fixed ROM slots 26765.
                    if slot <> 26765 or instruction <> 25573 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 997).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26767 {
                if slot <= 26766 {
// PORT: SOURCE P20-P25.agc:342
//		EXTEND
// PORT: Fixed ROM slots 26766.
                    if slot <> 26766 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:343
//		BZMF	+2		# OFF=0 THRU 5 OK
// PORT: Fixed ROM slots 26767.
                    if slot <> 26767 or instruction <> 25745 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25745, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26768 {
// PORT: SOURCE P20-P25.agc:344
//		TC	S22DSPP		# OFF=6.7 ILLEGAL REDISPLAY
// PORT: Fixed ROM slots 26768.
                    if slot <> 26768 or instruction <> 1179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1179, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:345
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 26769.
                    if slot <> 26769 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1559] to agcAotUnit1559@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:346
//		ADRES	KNOWNFLG	# CLEAR KNOWNFLG
// PORT: Fixed ROM slots 26770.
    26770, 194
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26771–26783.
function agcAotUnit1560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26776 {
        if slot <= 26773 {
            if slot <= 26771 {
// PORT: SOURCE P20-P25.agc:347
//		CA	LANDMARK	# MASK A FROM ABCDE
// PORT: Fixed ROM slots 26771.
                if slot <> 26771 or instruction <> 13289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1001).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26772 {
// PORT: SOURCE P20-P25.agc:348
//		MASK	13,14,15
// PORT: Fixed ROM slots 26772.
                    if slot <> 26772 or instruction <> 32711 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                        if fixedOperand = 28672 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 8) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:349
//		EXTEND
// PORT: Fixed ROM slots 26773.
                    if slot <> 26773 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26774 {
// PORT: SOURCE P20-P25.agc:350
//		BZMF	S22DSPP		# A=0,4,5,6,7  ILLEGAL REDISPLAY
// PORT: Fixed ROM slots 26774.
                if slot <> 26774 or instruction <> 25755 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25755, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26775 {
// PORT: SOURCE P20-P25.agc:351
//		TS	22SUBSCL	# TEMP
// PORT: Fixed ROM slots 26775.
                    if slot <> 26775 or instruction <> 23524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23524, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:352
//		CS	BIT14
// PORT: Fixed ROM slots 26776.
                    if slot <> 26776 or instruction <> 18946 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26779 {
            if slot <= 26777 {
// PORT: SOURCE P20-P25.agc:353
//		AD	22SUBSCL
// PORT: Fixed ROM slots 26777.
                if slot <> 26777 or instruction <> 25572 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 996).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26778 {
// PORT: SOURCE P20-P25.agc:354
//		CCS	A
// PORT: Fixed ROM slots 26778.
                    if slot <> 26778 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:355
//S22DSPP		TC	FALTON		# + A=3 ILLEGAL REDISPLAY
// PORT: Fixed ROM slots 26779.
                    if slot <> 26779 or instruction <> 2304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2304, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26781 {
                if slot <= 26780 {
// PORT: SOURCE P20-P25.agc:356
//		TC	S22DSPPA	# COMMON ERROR EXIT BACK TO DISPLAY
// PORT: Fixed ROM slots 26780.
                    if slot <> 26780 or instruction <> 1152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1152, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:357
//		TC	+2		# - A=1 KNOWN LMK  CHECK DE
// PORT: Fixed ROM slots 26781.
                    if slot <> 26781 or instruction <> 1183 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1183, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26782 {
// PORT: SOURCE P20-P25.agc:358
//		TC	S22ABDE		# -0 A=2 UNKNOWN LMK, DE MEANINGLESS
// PORT: Fixed ROM slots 26782.
                    if slot <> 26782 or instruction <> 1203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1203, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:359
//		TC 	UPFLAG
// PORT: Fixed ROM slots 26783.
                    if slot <> 26783 or instruction <> 2918 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1560] to agcAotUnit1560@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:360
//		ADRES	KNOWNFLG	# SET KNOWNFLG
// PORT: Fixed ROM slots 26784.
    26784, 194
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26785–26803.
function agcAotUnit1561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26793 {
        if slot <= 26788 {
            if slot <= 26786 {
                if slot <= 26785 {
// PORT: SOURCE P20-P25.agc:361
//		CS	HIGH9		# RESULT= 00077
// PORT: Fixed ROM slots 26785.
                    if slot <> 26785 or instruction <> 20427 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:362
//		MASK	LANDMARK
// PORT: Fixed ROM slots 26786.
                    if slot <> 26786 or instruction <> 29673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26787 {
// PORT: SOURCE P20-P25.agc:363
//		TS	22SUBSCL	# 000DE
// PORT: Fixed ROM slots 26787.
                    if slot <> 26787 or instruction <> 23524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23524, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:364
//		CS	BIT1
// PORT: Fixed ROM slots 26788.
                    if slot <> 26788 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26790 {
                if slot <= 26789 {
// PORT: SOURCE P20-P25.agc:365
//		AD	22SUBSCL
// PORT: Fixed ROM slots 26789.
                    if slot <> 26789 or instruction <> 25572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 996).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:366
//		EXTEND
// PORT: Fixed ROM slots 26790.
                    if slot <> 26790 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26791 {
// PORT: SOURCE P20-P25.agc:367
//		BZMF	S22ABDE		# DE=0,1 OK FOR BOTH N70,N71
// PORT: Fixed ROM slots 26791.
                    if slot <> 26791 or instruction <> 25779 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25779, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26792 {
// PORT: SOURCE P20-P25.agc:368
//		CA	8KK	+1	# =0 FOR N71, NOT =0 FOR N70
// PORT: Fixed ROM slots 26792.
                        if slot <> 26792 or instruction <> 13287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 999).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:369
//		EXTEND
// PORT: Fixed ROM slots 26793.
                        if slot <> 26793 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 26798 {
            if slot <= 26795 {
                if slot <= 26794 {
// PORT: SOURCE P20-P25.agc:370
//		BZF	S22DSPP		# N71 REDISPLAY  DE MUST= 0 OR 1
// PORT: Fixed ROM slots 26794.
                    if slot <> 26794 or instruction <> 5275 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5275, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:371
//		CA	BIT5		# N70 TEST DE= 50-57 OCTAL FOR ADV. ORBIT
// PORT: Fixed ROM slots 26795.
                    if slot <> 26795 or instruction <> 14859 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26796 {
// PORT: SOURCE P20-P25.agc:372
//		AD	OCT50		# SUM=00070
// PORT: Fixed ROM slots 26796.
                    if slot <> 26796 or instruction <> 27163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26797 {
// PORT: SOURCE P20-P25.agc:373
//		MASK	22SUBSCL	# 00D0
// PORT: Fixed ROM slots 26797.
                        if slot <> 26797 or instruction <> 29668 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 996).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:374
//		CS	A
// PORT: Fixed ROM slots 26798.
                        if slot <> 26798 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26800 {
                if slot <= 26799 {
// PORT: SOURCE P20-P25.agc:375
//		AD	OCT50
// PORT: Fixed ROM slots 26799.
                    if slot <> 26799 or instruction <> 27163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:376
//		EXTEND
// PORT: Fixed ROM slots 26800.
                    if slot <> 26800 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26801 {
// PORT: SOURCE P20-P25.agc:377
//		BZF	DE-GR-50	# D=5 OR DE=50-57, OK FOR N70
// PORT: Fixed ROM slots 26801.
                    if slot <> 26801 or instruction <> 5307 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5307, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26802 {
// PORT: SOURCE P20-P25.agc:378
//		TC	S22DSPP		# DE NOT 50-57  ILLEGAL, REDISPLAY
// PORT: Fixed ROM slots 26802.
                        if slot <> 26802 or instruction <> 1179 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1179, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:379
//S22ABDE		TC	INTPRET
// PORT: Fixed ROM slots 26803.
                        if slot <> 26803 or instruction <> 3078 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3078, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1561] to agcAotUnit1561@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:380
//		BOFF	SLOAD
// PORT: Fixed ROM slots 26804.
    26804, 56600,
// PORT: SOURCE P20-P25.agc:381
//			KNOWNFLG	# UNKNOWN LMK, DE MEANINGLESS
// PORT: Fixed ROM slots 26805.
    26805, 3534,
// PORT: SOURCE P20-P25.agc:382
//			S22TOFF
// PORT: Fixed ROM slots 26806.
    26806, 3950,
// PORT: SOURCE P20-P25.agc:383
//			22SUBSCL	# =0 GET LLA FROM ASTRO, NOT=0 USE RLS
// PORT: Fixed ROM slots 26807.
    26807, 3018,
// PORT: SOURCE P20-P25.agc:384
//		BHIZ	GOTO
// PORT: Fixed ROM slots 26808.
    26808, 43056,
// PORT: SOURCE P20-P25.agc:385
//			OBTAINLL	# GET LAT/LONG/ALT FROM ASTRO  N89
// PORT: Fixed ROM slots 26809.
    26809, 49342,
// PORT: SOURCE P20-P25.agc:386
//# Page 569
// PORT: SOURCE P20-P25.agc:387
//			S22LSITE	# GET LAT/LONG/ALT FROM RLS
// PORT: Fixed ROM slots 26810.
    26810, 49310
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26811–26811.
function agcAotUnit1562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:388
//DE-GR-50	TC	2PHSCHNG
// PORT: Fixed ROM slots 26811.
    if slot <> 26811 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1562] to agcAotUnit1562@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:389
//		OCT	00004
// PORT: Fixed ROM slots 26812.
    26812, 8,
// PORT: SOURCE P20-P25.agc:390
//		OCT	05022
// PORT: Fixed ROM slots 26813.
    26813, 5156,
// PORT: SOURCE P20-P25.agc:391
//		OCT	13000
// PORT: Fixed ROM slots 26814.
    26814, 11264
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26815–26817.
function agcAotUnit1563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26815 {
// PORT: SOURCE P20-P25.agc:392
//		CA	FIVE
// PORT: Fixed ROM slots 26815.
        if slot <> 26815 or instruction <> 14866 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 26816 {
// PORT: SOURCE P20-P25.agc:393
//		TS	MARKINDX
// PORT: Fixed ROM slots 26816.
            if slot <> 26816 or instruction <> 22721 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22721, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:394
//		TC	UPFLAG
// PORT: Fixed ROM slots 26817.
            if slot <> 26817 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1563] to agcAotUnit1563@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:395
//		ADRES	TARG2FLG
// PORT: Fixed ROM slots 26818.
    26818, 42
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26819–26819.
function agcAotUnit1564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:396
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 26819.
    if slot <> 26819 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1564] to agcAotUnit1564@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:397
//		ADRES	TARG1FLG
// PORT: Fixed ROM slots 26820.
    26820, 40
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26821–26821.
function agcAotUnit1565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:398
//		TC	INTPRET
// PORT: Fixed ROM slots 26821.
    if slot <> 26821 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1565] to agcAotUnit1565@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:399
//		CALL
// PORT: Fixed ROM slots 26822.
    26822, 65320,
// PORT: SOURCE P20-P25.agc:400
//			ADVORB
// PORT: Fixed ROM slots 26823.
    26823, 24858,
// PORT: SOURCE P20-P25.agc:401
//		GOTO
// PORT: Fixed ROM slots 26824.
    26824, 65360,
// PORT: SOURCE P20-P25.agc:402
//			DOV5N71
// PORT: Fixed ROM slots 26825.
    26825, 49280,
// PORT: SOURCE P20-P25.agc:403
//
// PORT: SOURCE P20-P25.agc:404
//# Page 570
// PORT: SOURCE P20-P25.agc:405
//# PROGRAM NAME:  OPTICS CALIBRATION ROUTINE
// PORT: SOURCE P20-P25.agc:406
//# MOD NO:  1
// PORT: SOURCE P20-P25.agc:407
//# MOD BY:  TOM KNATT
// PORT: SOURCE P20-P25.agc:408
//#
// PORT: SOURCE P20-P25.agc:409
//# FUNCTIONAL DESCRIPTION:  TO MEASURE THE EFFECT OF SOLAR RADIATION ON
// PORT: SOURCE P20-P25.agc:410
//#	THE SXT TRUNNON ANGLE AND STORE THE MEASURED TRUNNION BIAS FOR P23
// PORT: SOURCE P20-P25.agc:411
//#
// PORT: SOURCE P20-P25.agc:412
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE P20-P25.agc:413
//#				R57
// PORT: SOURCE P20-P25.agc:414
//#
// PORT: SOURCE P20-P25.agc:415
//# SUBROUTINES CALLED:  DISPLAY ROUTINES
// PORT: SOURCE P20-P25.agc:416
//#
// PORT: SOURCE P20-P25.agc:417
//# NORMAL EXIT MODES:  VIA EGRESS
// PORT: SOURCE P20-P25.agc:418
//#
// PORT: SOURCE P20-P25.agc:419
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:420
//#
// PORT: SOURCE P20-P25.agc:421
//# ABORT MODES:  P23 ABORT IF MARKING SYSTEM OR EXTENDED VERB ACTIVE
// PORT: SOURCE P20-P25.agc:422
//#
// PORT: SOURCE P20-P25.agc:423
//# INPUT:  NONE REQUIRED, NORMALLY CALLED BY P23
// PORT: SOURCE P20-P25.agc:424
//#
// PORT: SOURCE P20-P25.agc:425
//# OUTPUT:  TRUNNION BIAS ANGLE: ANGLE DETERMINED WHEN SHAFT LINE OF SIGHT
// PORT: SOURCE P20-P25.agc:426
//#	(SLOS) AND LANDMARK LINE OF SIGHT (LLOS) ARE SUPERIMPOSED.  THIS ANGLE
// PORT: SOURCE P20-P25.agc:427
//#	MAY NOT BE EXACTLY ZERO BECAUSE OF UNEVEN HEATING OF THE OPTICS, FOR
// PORT: SOURCE P20-P25.agc:428
//#	EXAMPLE.
// PORT: SOURCE P20-P25.agc:429
//#
// PORT: SOURCE P20-P25.agc:430
//# ERASABLE INITIALIZATION REQUIRED:  MRKBUF1, EXTVBACT
// PORT: SOURCE P20-P25.agc:431
//#
// PORT: SOURCE P20-P25.agc:432
//# DEBRIS:  RUPTREGS USED BY MARKRUPT AND ERASABLES USED BY DISPLAYS.
// PORT: SOURCE P20-P25.agc:433
//
// PORT: SOURCE P20-P25.agc:434
//		BANK	33
// PORT: SOURCE P20-P25.agc:435
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:436
//		BANK
// PORT: SOURCE P20-P25.agc:437
//		COUNT*	$$/R57
// PORT: SOURCE P20-P25.agc:438
//		EBANK=	MRKBUF1
// PORT: SOURCE P20-P25.agc:439
//R57		STQ	EXIT
// PORT: Fixed ROM slots 34049.
    34049, 65056,
// PORT: SOURCE P20-P25.agc:440
//			EGRESS
// PORT: Fixed ROM slots 34050.
    34050, 2462
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34051–34059.
function agcAotUnit1899 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34054 {
        if slot <= 34052 {
            if slot <= 34051 {
// PORT: SOURCE P20-P25.agc:441
//		CAF	EBANK7
// PORT: Fixed ROM slots 34051.
                if slot <> 34051 or instruction <> 14896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:442
//		TS	EBANK
// PORT: Fixed ROM slots 34052.
                if slot <> 34052 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34053 {
// PORT: SOURCE P20-P25.agc:443
//		CAF	SIX		# BIT2 = MARKING SYSTEM IN USE
// PORT: Fixed ROM slots 34053.
                if slot <> 34053 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:444
//		MASK	EXTVBACT	# BIT3 = EXTENDED VERB IN PROGRESS
// PORT: Fixed ROM slots 34054.
                if slot <> 34054 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34056 {
            if slot <= 34055 {
// PORT: SOURCE P20-P25.agc:445
//		CCS	A
// PORT: Fixed ROM slots 34055.
                if slot <> 34055 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:446
//		TC	P23ABRT		# SET, THEREFORE ABORT
// PORT: Fixed ROM slots 34056.
                if slot <> 34056 or instruction <> 1328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1328, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34057 {
// PORT: SOURCE P20-P25.agc:447
//		CAF	BIT2		# NOT SET
// PORT: Fixed ROM slots 34057.
                if slot <> 34057 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34058 {
// PORT: SOURCE P20-P25.agc:448
//		ADS	EXTVBACT	# SET IT
// PORT: Fixed ROM slots 34058.
                    if slot <> 34058 or instruction <> 11812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:449
//R57A		TC	UPFLAG		# SET V59FLAG (BIT 12 FLAG 5 TO INDICATE
// PORT: Fixed ROM slots 34059.
                    if slot <> 34059 or instruction <> 2918 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1899] to agcAotUnit1899@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:450
//		ADRES	V59FLAG		# CALIBRATION MARK
// PORT: Fixed ROM slots 34060.
    34060, 156
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34061–34062.
function agcAotUnit1900 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34061 {
// PORT: SOURCE P20-P25.agc:451
//		CAF	V59NB
// PORT: Fixed ROM slots 34061.
        if slot <> 34061 or instruction <> 13619 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1331), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:452
//		TC	BANKCALL
// PORT: Fixed ROM slots 34062.
        if slot <> 34062 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1900] to agcAotUnit1900@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:453
//		CADR	GOMARKFR
// PORT: Fixed ROM slots 34063.
    34063, 17152
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34064–34071.
function agcAotUnit1901 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34067 {
        if slot <= 34065 {
            if slot <= 34064 {
// PORT: SOURCE P20-P25.agc:454
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 34064.
                if slot <> 34064 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:455
//		TC	ENDR57
// PORT: Fixed ROM slots 34065.
                if slot <> 34065 or instruction <> 1317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34066 {
// PORT: SOURCE P20-P25.agc:456
//		TC	ENDR57
// PORT: Fixed ROM slots 34066.
                if slot <> 34066 or instruction <> 1317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:457
//		CAF	SEVEN
// PORT: Fixed ROM slots 34067.
                if slot <> 34067 or instruction <> 14867 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34069 {
            if slot <= 34068 {
// PORT: SOURCE P20-P25.agc:458
//# Page 571
// PORT: SOURCE P20-P25.agc:459
//		TC	BLANKET		# BLANK OUT R1,R2,R3
// PORT: Fixed ROM slots 34068.
                if slot <> 34068 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:460
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 34069.
                if slot <> 34069 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34070 {
// PORT: SOURCE P20-P25.agc:461
//# STORE TRUNNION ANGLE (OCDU)
// PORT: SOURCE P20-P25.agc:462
//MARKDISP	CAF	V06N87NB
// PORT: Fixed ROM slots 34070.
                if slot <> 34070 or instruction <> 13618 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1330), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:463
//		TC	BANKCALL
// PORT: Fixed ROM slots 34071.
                if slot <> 34071 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1901] to agcAotUnit1901@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:464
//		CADR	GOMARKFR
// PORT: Fixed ROM slots 34072.
    34072, 17152
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34073–34085.
function agcAotUnit1902 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34078 {
        if slot <= 34075 {
            if slot <= 34073 {
// PORT: SOURCE P20-P25.agc:465
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 34073.
                if slot <> 34073 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34074 {
// PORT: SOURCE P20-P25.agc:466
//		TC	R57B		# PROCEED
// PORT: Fixed ROM slots 34074.
                    if slot <> 34074 or instruction <> 1311 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1311, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:467
//		TC	R57A		# ENTER (RECYCLE)
// PORT: Fixed ROM slots 34075.
                    if slot <> 34075 or instruction <> 1291 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1291, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34076 {
// PORT: SOURCE P20-P25.agc:468
//		CAF	FIVE
// PORT: Fixed ROM slots 34076.
                if slot <> 34076 or instruction <> 14866 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34077 {
// PORT: SOURCE P20-P25.agc:469
//		TC	BLANKET		# BLANK OUT R1,R3
// PORT: Fixed ROM slots 34077.
                    if slot <> 34077 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:470
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 34078.
                    if slot <> 34078 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34081 {
            if slot <= 34079 {
// PORT: SOURCE P20-P25.agc:471
//R57B		CA	19.77DEG	# PUT FIXED INTO ERASABLE FOR MSU
// PORT: Fixed ROM slots 34079.
                if slot <> 34079 or instruction <> 13621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1333), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34080 {
// PORT: SOURCE P20-P25.agc:472
//		TS	L		# INSTRUCTION COMING UP
// PORT: Fixed ROM slots 34080.
                    if slot <> 34080 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:473
//		CA	MRKBUF1 +5	# CONTAINS TRUNNION
// PORT: Fixed ROM slots 34081.
                    if slot <> 34081 or instruction <> 13274 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 986).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34083 {
                if slot <= 34082 {
// PORT: SOURCE P20-P25.agc:474
//		EXTEND
// PORT: Fixed ROM slots 34082.
                    if slot <> 34082 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:475
//		MSU	L		# CONNECTS TRUNBIAS FROM 2'S TO 1'S
// PORT: Fixed ROM slots 34083.
                    if slot <> 34083 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMSU(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34084 {
// PORT: SOURCE P20-P25.agc:476
//		TS	TRUNBIAS
// PORT: Fixed ROM slots 34084.
                    if slot <> 34084 or instruction <> 23266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23266, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:477
//ENDR57		TC	DOWNFLAG	# RESET V59FLAG
// PORT: Fixed ROM slots 34085.
                    if slot <> 34085 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1902] to agcAotUnit1902@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:478
//		ADRES	V59FLAG		# BIT 12 FLAG 5
// PORT: Fixed ROM slots 34086.
    34086, 156
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34087–34090.
function agcAotUnit1903 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34088 {
        if slot <= 34087 {
// PORT: SOURCE P20-P25.agc:479
//		CAF	EBANK5
// PORT: Fixed ROM slots 34087.
            if slot <> 34087 or instruction <> 14894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2606), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:480
//		TS	EBANK
// PORT: Fixed ROM slots 34088.
            if slot <> 34088 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34089 {
// PORT: SOURCE P20-P25.agc:481
//		CAF	PRIO14
// PORT: Fixed ROM slots 34089.
            if slot <> 34089 or instruction <> 14902 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:482
//		TC	NOVAC		# THIS JOB CLEARS BIT IN
// PORT: Fixed ROM slots 34090.
            if slot <> 34090 or instruction <> 2652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1903] to agcAotUnit1903@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:483
//		EBANK=	MARKSTAT
// PORT: SOURCE P20-P25.agc:484
//		2CADR	ENDMARK		# MARKING IN R57 SO R53 CAN TAKE OVER
// PORT: Fixed ROM slots 34091 34092.
    34091, 5816, 34092, 4196
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34093–34093.
function agcAotUnit1904 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:485
//
// PORT: SOURCE P20-P25.agc:486
//		TC	INTPRET
// PORT: Fixed ROM slots 34093.
    if slot <> 34093 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1904] to agcAotUnit1904@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:487
//		GOTO
// PORT: Fixed ROM slots 34094.
    34094, 65360,
// PORT: SOURCE P20-P25.agc:488
//			EGRESS
// PORT: Fixed ROM slots 34095.
    34095, 2462
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34096–34096.
function agcAotUnit1905 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:489
//P23ABRT		TC	BAILOUT
// PORT: Fixed ROM slots 34096.
    if slot <> 34096 or instruction <> 4077 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 4077, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1905] to agcAotUnit1905@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:490
//		OCT	01211
// PORT: Fixed ROM slots 34097.
    34097, 1298,
// PORT: SOURCE P20-P25.agc:491
//V06N87NB	VN	0687
// PORT: Fixed ROM slots 34098.
    34098, 1710,
// PORT: SOURCE P20-P25.agc:492
//V59NB		VN	5900
// PORT: Fixed ROM slots 34099.
    34099, 15104,
// PORT: SOURCE P20-P25.agc:493
//V51NB		VN	5100
// PORT: Fixed ROM slots 34100.
    34100, 13056,
// PORT: SOURCE P20-P25.agc:494
//19.77DEG	OCT	61740
// PORT: Fixed ROM slots 34101.
    34101, 51136
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34102–34102.
function agcAotUnit1906 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:495
//
// PORT: SOURCE P20-P25.agc:496
//# Page 572
// PORT: SOURCE P20-P25.agc:497
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:498
//# MOD NO:  1
// PORT: SOURCE P20-P25.agc:499
//# MOD BY:  N. BRODEUR
// PORT: SOURCE P20-P25.agc:500
//#
// PORT: SOURCE P20-P25.agc:501
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:502
//#
// PORT: SOURCE P20-P25.agc:503
//# TO PERFORM SIGHTING MARKS IN CONJUNCTION WITH THE RENDEZVOUS NAVIG-
// PORT: SOURCE P20-P25.agc:504
//# ATION PROGRAM.  CALLED BY ASTRONAUT VIA EXTENDED VERB.
// PORT: SOURCE P20-P25.agc:505
//#
// PORT: SOURCE P20-P25.agc:506
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:507
//#
// PORT: SOURCE P20-P25.agc:508
//#	R21 VIA V57
// PORT: SOURCE P20-P25.agc:509
//#	R23 VIA V 54
// PORT: SOURCE P20-P25.agc:510
//#
// PORT: SOURCE P20-P25.agc:511
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:512
//#
// PORT: SOURCE P20-P25.agc:513
//#	FLAGUP		FLAGDOWN	BANKCALL
// PORT: SOURCE P20-P25.agc:514
//#	ENDOFJOB	GOMARK2		GOMARKF
// PORT: SOURCE P20-P25.agc:515
//#	INTPRET		GENTRAN		KLEENEX
// PORT: SOURCE P20-P25.agc:516
//#	ENDMARK
// PORT: SOURCE P20-P25.agc:517
//#
// PORT: SOURCE P20-P25.agc:518
//# NORMAL EXIT MODES:
// PORT: SOURCE P20-P25.agc:519
//#
// PORT: SOURCE P20-P25.agc:520
//# MARKRUPT USED BY SXTMARK HAS BEEN MODIFIED TO STORE MARK IN MRKBUF2
// PORT: SOURCE P20-P25.agc:521
//# FOR USE BY R22.  WHEN ASTRONAUT IS FINISHED TAKING MARKS, HE HITS AN
// PORT: SOURCE P20-P25.agc:522
//# PROCEED, R21 IS TERMINATED THUS CAUSING THE FINAL MARK TO BE TRANSFRD
// PORT: SOURCE P20-P25.agc:523
//# TO MRKBUF2 FOR PROCESSING BY R22
// PORT: SOURCE P20-P25.agc:524
//#
// PORT: SOURCE P20-P25.agc:525
//# ALARM OR ABORT EXIT MODES:
// PORT: SOURCE P20-P25.agc:526
//#
// PORT: SOURCE P20-P25.agc:527
//#	NONE
// PORT: SOURCE P20-P25.agc:528
//#
// PORT: SOURCE P20-P25.agc:529
//# OUTPUT:
// PORT: SOURCE P20-P25.agc:530
//#
// PORT: SOURCE P20-P25.agc:531
//#	7 REGISTER MRKBUF2 CONTAINING TIME2,TIME1,CDUY,OPTICS X,CDUZ, OPTICS Y,
// PORT: SOURCE P20-P25.agc:532
//#	CDUX.
// PORT: SOURCE P20-P25.agc:533
//#
// PORT: SOURCE P20-P25.agc:534
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:535
//#
// PORT: SOURCE P20-P25.agc:536
//# FLAGS SET AND RESET
// PORT: SOURCE P20-P25.agc:537
//#	R21MARK		(COMMUNICATION TO MARKRUPT TO STORE MARKS IN MRKBUF1 +2)
// PORT: SOURCE P20-P25.agc:538
//#	R23FLG		INDICATES COAS MARKING
// PORT: SOURCE P20-P25.agc:539
//#
// PORT: SOURCE P20-P25.agc:540
//# DEBRIS
// PORT: SOURCE P20-P25.agc:541
//
// PORT: SOURCE P20-P25.agc:542
//		EBANK=	MRKBUF1
// PORT: SOURCE P20-P25.agc:543
//		SETLOC	RENDEZ
// PORT: SOURCE P20-P25.agc:544
//		BANK
// PORT: SOURCE P20-P25.agc:545
//
// PORT: SOURCE P20-P25.agc:546
//		COUNT*	$$/R21
// PORT: SOURCE P20-P25.agc:547
//
// PORT: SOURCE P20-P25.agc:548
//R21CSM		TC	UPFLAG		# SET R21MARK
// PORT: Fixed ROM slots 34102.
    if slot <> 34102 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1906] to agcAotUnit1906@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:549
//		ADRES	R21MARK		# BIT 14 FLAG 2
// PORT: Fixed ROM slots 34103.
    34103, 62
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34104–34112.
function agcAotUnit1907 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34107 {
        if slot <= 34105 {
            if slot <= 34104 {
// PORT: SOURCE P20-P25.agc:550
//R23CSM		CA	NEGONE
// PORT: Fixed ROM slots 34104.
                if slot <> 34104 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:551
//		TS	MRKBUF1
// PORT: Fixed ROM slots 34105.
                if slot <> 34105 or instruction <> 23509 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23509, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34106 {
// PORT: SOURCE P20-P25.agc:552
//		TS	MRKBUF2
// PORT: Fixed ROM slots 34106.
                if slot <> 34106 or instruction <> 23516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23516, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:553
//		CA	FLAGWRD1
// PORT: Fixed ROM slots 34107.
                if slot <> 34107 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34109 {
            if slot <= 34108 {
// PORT: SOURCE P20-P25.agc:554
//		MASK	R23BIT		# TEST R23FLG
// PORT: Fixed ROM slots 34108.
                if slot <> 34108 or instruction <> 31239 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:555
//		EXTEND
// PORT: Fixed ROM slots 34109.
                if slot <> 34109 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34110 {
// PORT: SOURCE P20-P25.agc:556
//		BZF	R21C1		# NOT SET REGULAR R21 MARKING
// PORT: Fixed ROM slots 34110.
                if slot <> 34110 or instruction <> 5465 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5465, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34111 {
// PORT: SOURCE P20-P25.agc:557
//		CAF	V0694		# R23 BACKUP MARKING
// PORT: Fixed ROM slots 34111.
                    if slot <> 34111 or instruction <> 13678 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1390), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:558
//		TC	BANKCALL	# DISPLAY SHAFT + TRUNNION
// PORT: Fixed ROM slots 34112.
                    if slot <> 34112 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1907] to agcAotUnit1907@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:559
//		CADR	GOMARKF
// PORT: Fixed ROM slots 34113.
    34113, 17122
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34114–34118.
function agcAotUnit1908 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34115 {
        if slot <= 34114 {
// PORT: SOURCE P20-P25.agc:560
//		TC	R21END		# TERM
// PORT: Fixed ROM slots 34114.
            if slot <> 34114 or instruction <> 1384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1384, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:561
//		TC	+2		# PROC
// PORT: Fixed ROM slots 34115.
            if slot <> 34115 or instruction <> 1349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1349, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34116 {
// PORT: SOURCE P20-P25.agc:562
//# Page 573
// PORT: SOURCE P20-P25.agc:563
//		TC	-5		# ENTER
// PORT: Fixed ROM slots 34116.
            if slot <> 34116 or instruction <> 1343 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1343, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34117 {
// PORT: SOURCE P20-P25.agc:564
//R23CSM1		CAF	V53		# PERFORM ALT LOST SIGHT MARK
// PORT: Fixed ROM slots 34117.
                if slot <> 34117 or instruction <> 13677 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1389), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:565
//		TC	BANKCALL
// PORT: Fixed ROM slots 34118.
                if slot <> 34118 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1908] to agcAotUnit1908@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:566
//		CADR	GOMARK2
// PORT: Fixed ROM slots 34119.
    34119, 17128
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34120–34123.
function agcAotUnit1909 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34121 {
        if slot <= 34120 {
// PORT: SOURCE P20-P25.agc:567
//		TC	R21END		# V34: TERMINATE R23
// PORT: Fixed ROM slots 34120.
            if slot <> 34120 or instruction <> 1384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1384, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:568
//		TCF	R21CSMA		# PROCEED: END BACK UP MARKING (R23)
// PORT: Fixed ROM slots 34121.
            if slot <> 34121 or instruction <> 5471 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5471, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34122 {
// PORT: SOURCE P20-P25.agc:569
//		CAF	SIX		# TRANSFER MRKBUF1 TO MRKBUF2
// PORT: Fixed ROM slots 34122.
            if slot <> 34122 or instruction <> 15497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:570
//		TC	GENTRAN
// PORT: Fixed ROM slots 34123.
            if slot <> 34123 or instruction <> 2950 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2950, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1909] to agcAotUnit1909@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:571
//		ADRES	MRKBUF1
// PORT: Fixed ROM slots 34124.
    34124, 1962,
// PORT: SOURCE P20-P25.agc:572
//		ADRES	MRKBUF2
// PORT: Fixed ROM slots 34125.
    34125, 1976
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34126–34138.
function agcAotUnit1910 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34131 {
        if slot <= 34128 {
            if slot <= 34126 {
// PORT: SOURCE P20-P25.agc:573
//		EXTEND
// PORT: Fixed ROM slots 34126.
                if slot <> 34126 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34127 {
// PORT: SOURCE P20-P25.agc:574
//		DCA	TIME2
// PORT: Fixed ROM slots 34127.
                    if slot <> 34127 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:575
//		DXCH	MRKBUF1		# READ TIME
// PORT: Fixed ROM slots 34128.
                    if slot <> 34128 or instruction <> 22486 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 982, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34129 {
// PORT: SOURCE P20-P25.agc:576
//		CA	CDUY		# READ CDU ANGLES
// PORT: Fixed ROM slots 34129.
                if slot <> 34129 or instruction <> 12315 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 27).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34130 {
// PORT: SOURCE P20-P25.agc:577
//		TS	MRKBUF1 +2
// PORT: Fixed ROM slots 34130.
                    if slot <> 34130 or instruction <> 23511 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23511, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:578
//		CA	CDUZ
// PORT: Fixed ROM slots 34131.
                    if slot <> 34131 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34134 {
            if slot <= 34132 {
// PORT: SOURCE P20-P25.agc:579
//		TS	MRKBUF1 +4
// PORT: Fixed ROM slots 34132.
                if slot <> 34132 or instruction <> 23513 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23513, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34133 {
// PORT: SOURCE P20-P25.agc:580
//		CA	CDUX
// PORT: Fixed ROM slots 34133.
                    if slot <> 34133 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:581
//		TS	MRKBUF1 +6
// PORT: Fixed ROM slots 34134.
                    if slot <> 34134 or instruction <> 23515 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23515, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34136 {
                if slot <= 34135 {
// PORT: SOURCE P20-P25.agc:582
//		RELINT
// PORT: Fixed ROM slots 34135.
                    if slot <> 34135 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:583
//		TC	R23CSM1
// PORT: Fixed ROM slots 34136.
                    if slot <> 34136 or instruction <> 1349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34137 {
// PORT: SOURCE P20-P25.agc:584
//R21C1		CAF	V51NB
// PORT: Fixed ROM slots 34137.
                    if slot <> 34137 or instruction <> 13620 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1332), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:585
//		TC	BANKCALL
// PORT: Fixed ROM slots 34138.
                    if slot <> 34138 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1910] to agcAotUnit1910@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:586
//		CADR	GOMARK2
// PORT: Fixed ROM slots 34139.
    34139, 17128
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34140–34148.
function agcAotUnit1911 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34143 {
        if slot <= 34141 {
            if slot <= 34140 {
// PORT: SOURCE P20-P25.agc:587
//		TC	R21END		# V34: TERMINATE R21
// PORT: Fixed ROM slots 34140.
                if slot <> 34140 or instruction <> 1384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1384, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:588
//		TCF	R21CSMA		# PROCEED: END R21
// PORT: Fixed ROM slots 34141.
                if slot <> 34141 or instruction <> 5471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34142 {
// PORT: SOURCE P20-P25.agc:589
//		TCF	R21C1		# RECYCLE
// PORT: Fixed ROM slots 34142.
                if slot <> 34142 or instruction <> 5465 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5465, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:590
//
// PORT: SOURCE P20-P25.agc:591
//R21CSMA		CA	MRKBUF1		# IF -1 NO MARK
// PORT: Fixed ROM slots 34143.
                if slot <> 34143 or instruction <> 13269 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 981).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34145 {
            if slot <= 34144 {
// PORT: SOURCE P20-P25.agc:592
//		AD	ONE
// PORT: Fixed ROM slots 34144.
                if slot <> 34144 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:593
//		EXTEND
// PORT: Fixed ROM slots 34145.
                if slot <> 34145 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34146 {
// PORT: SOURCE P20-P25.agc:594
//		BZF	R21END		# ZERO = NO MARK
// PORT: Fixed ROM slots 34146.
                if slot <> 34146 or instruction <> 5480 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5480, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34147 {
// PORT: SOURCE P20-P25.agc:595
//		CAF	SIX		# MARK THEREFORE TRANSFER IT TO MRKBUF2
// PORT: Fixed ROM slots 34147.
                    if slot <> 34147 or instruction <> 15497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:596
//R21CSM1		TC	GENTRAN		# TRANSFER MRKBUF1 TO MRKBUF2
// PORT: Fixed ROM slots 34148.
                    if slot <> 34148 or instruction <> 2950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1911] to agcAotUnit1911@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:597
//		ADRES	MRKBUF1
// PORT: Fixed ROM slots 34149.
    34149, 1962,
// PORT: SOURCE P20-P25.agc:598
//		ADRES	MRKBUF2
// PORT: Fixed ROM slots 34150.
    34150, 1976
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34151–34152.
function agcAotUnit1912 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34151 {
// PORT: SOURCE P20-P25.agc:599
//		RELINT
// PORT: Fixed ROM slots 34151.
        if slot <> 34151 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:600
//R21END		TC	BANKCALL
// PORT: Fixed ROM slots 34152.
        if slot <> 34152 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1912] to agcAotUnit1912@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:601
//		CADR	KLEENEX
// PORT: Fixed ROM slots 34153.
    34153, 17120
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34154–34154.
function agcAotUnit1913 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:602
//		TC	DOWNFLAG	# RESET R21MARK
// PORT: Fixed ROM slots 34154.
    if slot <> 34154 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1913] to agcAotUnit1913@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:603
//		ADRES	R21MARK		# BIT 14 FLAG 2
// PORT: Fixed ROM slots 34155.
    34155, 62
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34156–34156.
function agcAotUnit1914 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:604
//		TC	ENDMARK		# END MARKING AND ENDJOB
// PORT: Fixed ROM slots 34156.
    if slot <> 34156 or instruction <> 2908 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2908, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1914] to agcAotUnit1914@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:605
//V53		VN	5300
// PORT: Fixed ROM slots 34157.
    34157, 13568,
// PORT: SOURCE P20-P25.agc:606
//V0694		VN	0694
// PORT: Fixed ROM slots 34158.
    34158, 1724
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34159–34168.
function agcAotUnit1915 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34163 {
        if slot <= 34160 {
            if slot <= 34159 {
// PORT: SOURCE P20-P25.agc:607
//
// PORT: SOURCE P20-P25.agc:608
//# Page 574
// PORT: SOURCE P20-P25.agc:609
//# PREFERRED TRACKING ATTITUDE ROUTINE R61CSM
// PORT: SOURCE P20-P25.agc:610
//#
// PORT: SOURCE P20-P25.agc:611
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:612
//#	MOD NO:  2
// PORT: SOURCE P20-P25.agc:613
//#	MOD BY:  N. BRODEUR
// PORT: SOURCE P20-P25.agc:614
//#
// PORT: SOURCE P20-P25.agc:615
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:616
//#
// PORT: SOURCE P20-P25.agc:617
//#	TO COMPUTE THE PREFERRED TRACKING ATTITUDE OF THE CSM TO ENABLE OPTICS
// PORT: SOURCE P20-P25.agc:618
//#	TRACKING OF THE LM AND TO PERFORM THE MANEUVER TO THE PREFERRED
// PORT: SOURCE P20-P25.agc:619
//#	OR X-AXIS TRACKING ATTITUDE.
// PORT: SOURCE P20-P25.agc:620
//#
// PORT: SOURCE P20-P25.agc:621
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:622
//#
// PORT: SOURCE P20-P25.agc:623
//#	TC	BANKCALL
// PORT: SOURCE P20-P25.agc:624
//#	CADR	R61CSM
// PORT: SOURCE P20-P25.agc:625
//#
// PORT: SOURCE P20-P25.agc:626
//# SUBROUTINE CALLED
// PORT: SOURCE P20-P25.agc:627
//#
// PORT: SOURCE P20-P25.agc:628
//#	MAKECADR	BANKCALL
// PORT: SOURCE P20-P25.agc:629
//#	INTPRET		FLAGUP		FLAGDOWN
// PORT: SOURCE P20-P25.agc:630
//#	BANKJUMP	CRS61.1		R60CSM
// PORT: SOURCE P20-P25.agc:631
//#	PHASCHNG
// PORT: SOURCE P20-P25.agc:632
//#
// PORT: SOURCE P20-P25.agc:633
//# NORMAL EXIT MODES:
// PORT: SOURCE P20-P25.agc:634
//#
// PORT: SOURCE P20-P25.agc:635
//#	NORMAL RETURN TO CALLER + 1
// PORT: SOURCE P20-P25.agc:636
//#
// PORT: SOURCE P20-P25.agc:637
//# OUTPUT:
// PORT: SOURCE P20-P25.agc:638
//#
// PORT: SOURCE P20-P25.agc:639
//#	SEE OUTPUT FOR CRS61.1 & ATTITUDE MANEUVER ROUTINE (R60CSM)
// PORT: SOURCE P20-P25.agc:640
//#
// PORT: SOURCE P20-P25.agc:641
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:642
//#
// PORT: SOURCE P20-P25.agc:643
//#	GENRET USED TO SAVE Q FOR RETURN
// PORT: SOURCE P20-P25.agc:644
//#	R61CNTR MUST BE PRESET TO ZERO
// PORT: SOURCE P20-P25.agc:645
//#
// PORT: SOURCE P20-P25.agc:646
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:647
//#
// PORT: SOURCE P20-P25.agc:648
//#	3-AXIS FLAG
// PORT: SOURCE P20-P25.agc:649
//#
// PORT: SOURCE P20-P25.agc:650
//# DEBRIS
// PORT: SOURCE P20-P25.agc:651
//#
// PORT: SOURCE P20-P25.agc:652
//#	SEE SUBROUTINES
// PORT: SOURCE P20-P25.agc:653
//
// PORT: SOURCE P20-P25.agc:654
//		EBANK=	GENRET
// PORT: SOURCE P20-P25.agc:655
//		COUNT*	$$/R61		# ROUTINES -- NAVIGATION -- PREF. TR. 9TT=
// PORT: SOURCE P20-P25.agc:656
//
// PORT: SOURCE P20-P25.agc:657
//R61CSM		CAF	EBANK6		# SWITCH TO EBANK 6
// PORT: Fixed ROM slots 34159.
                if slot <> 34159 or instruction <> 14895 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:658
//		XCH	EBANK
// PORT: Fixed ROM slots 34160.
                if slot <> 34160 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34161 {
// PORT: SOURCE P20-P25.agc:659
//		TS	SAVBNK		# SAVE EBANK
// PORT: Fixed ROM slots 34161.
                if slot <> 34161 or instruction <> 23545 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23545, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34162 {
// PORT: SOURCE P20-P25.agc:660
//		TC	MAKECADR
// PORT: Fixed ROM slots 34162.
                    if slot <> 34162 or instruction <> 2505 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:661
//		TS	GENRET
// PORT: Fixed ROM slots 34163.
                    if slot <> 34163 or instruction <> 23544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34165 {
            if slot <= 34164 {
// PORT: SOURCE P20-P25.agc:662
//		CCS	R61CNTR		# TEST R61DNTR
// PORT: Fixed ROM slots 34164.
                if slot <> 34164 or instruction <> 5117 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 1021).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:663
//		TC	DECRM61		# NOT READY TO DO R61
// PORT: Fixed ROM slots 34165.
                if slot <> 34165 or instruction <> 1422 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1422, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34166 {
// PORT: SOURCE P20-P25.agc:664
//		TC	+2		# DO R61
// PORT: Fixed ROM slots 34166.
                if slot <> 34166 or instruction <> 1400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1400, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34167 {
// PORT: SOURCE P20-P25.agc:665
//		TC	DECRM61 +1
// PORT: Fixed ROM slots 34167.
                    if slot <> 34167 or instruction <> 1423 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1423, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:666
//		TC	INTPRET
// PORT: Fixed ROM slots 34168.
                    if slot <> 34168 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1915] to agcAotUnit1915@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:667
//		CALL
// PORT: Fixed ROM slots 34169.
    34169, 65320,
// PORT: SOURCE P20-P25.agc:668
//			CRS61.1		# LOS DETERMINATION + VEH ATTITUDE
// PORT: Fixed ROM slots 34170.
    34170, 58822,
// PORT: SOURCE P20-P25.agc:669
//		EXIT
// PORT: Fixed ROM slots 34171.
    34171, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34172–34172.
function agcAotUnit1916 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:670
//		INDEX	MPAC
// PORT: Fixed ROM slots 34172.
    if slot <> 34172 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1916] to agcAotUnit1916@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:671
//		TC	+1
// PORT: Fixed ROM slots 34173.
    34173, 2812
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34174–34175.
function agcAotUnit1917 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34174 {
// PORT: SOURCE P20-P25.agc:672
//		TC	R61END		# SUBROUTINE DRIVING DAP	(EXIT R61)
// PORT: Fixed ROM slots 34174.
        if slot <> 34174 or instruction <> 1421 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1421, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:673
//					# OR AUTO MODE NOT SET		(EXIT R61)
// PORT: SOURCE P20-P25.agc:674
//					# OR SKIKFLAG SET		(EXIT R61)
// PORT: SOURCE P20-P25.agc:675
//R61C1		TC	DOWNFLAG	# RESET 3-AXIS FLAG
// PORT: Fixed ROM slots 34175.
        if slot <> 34175 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1917] to agcAotUnit1917@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:676
//		ADRES	3AXISFLG	# BIT 6 FLAG 5
// PORT: Fixed ROM slots 34176.
    34176, 168
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34177–34179.
function agcAotUnit1918 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34177 {
// PORT: SOURCE P20-P25.agc:677
//# Page 575
// PORT: SOURCE P20-P25.agc:678
//		CS	ONE		# SET R61CNTR NEG. TO INDICATE KALCMANU
// PORT: Fixed ROM slots 34177.
        if slot <> 34177 or instruction <> 18959 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34178 {
// PORT: SOURCE P20-P25.agc:679
//		TS	R61CNTR
// PORT: Fixed ROM slots 34178.
            if slot <> 34178 or instruction <> 23549 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23549, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:680
//
// PORT: SOURCE P20-P25.agc:681
//		TC	UPFLAG		# SET FLAG FOR PRIORITY DISPLAYS FOR R60
// PORT: Fixed ROM slots 34179.
            if slot <> 34179 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1918] to agcAotUnit1918@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:682
//		ADRES	PDSPFLAG	# BIT 12 FLAG 4
// PORT: Fixed ROM slots 34180.
    34180, 126
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34181–34181.
function agcAotUnit1919 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:683
//		TC	BANKCALL
// PORT: Fixed ROM slots 34181.
    if slot <> 34181 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1919] to agcAotUnit1919@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:684
//		CADR	R60CSM
// PORT: Fixed ROM slots 34182.
    34182, 47104
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34183–34183.
function agcAotUnit1920 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:685
//		TC	DOWNFLAG	# RESET FLAG FOR PRIORITY DISPLAYS IN R60
// PORT: Fixed ROM slots 34183.
    if slot <> 34183 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1920] to agcAotUnit1920@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:686
//		ADRES	PDSPFLAG	# BIT 12 FLAG 4
// PORT: Fixed ROM slots 34184.
    34184, 126
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34185–34185.
function agcAotUnit1921 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:687
//		TC	PHASCHNG
// PORT: Fixed ROM slots 34185.
    if slot <> 34185 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1921] to agcAotUnit1921@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:688
//		OCT	00111
// PORT: Fixed ROM slots 34186.
    34186, 146
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34187–34196.
function agcAotUnit1922 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34191 {
        if slot <= 34188 {
            if slot <= 34187 {
// PORT: SOURCE P20-P25.agc:689
//		CAF	ZERO
// PORT: Fixed ROM slots 34187.
                if slot <> 34187 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:690
//		TC	DECRM61
// PORT: Fixed ROM slots 34188.
                if slot <> 34188 or instruction <> 1422 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1422, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34189 {
// PORT: SOURCE P20-P25.agc:691
//R61END		CAF	THREE
// PORT: Fixed ROM slots 34189.
                if slot <> 34189 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34190 {
// PORT: SOURCE P20-P25.agc:692
//
// PORT: SOURCE P20-P25.agc:693
//DECRM61		TS	R61CNTR
// PORT: Fixed ROM slots 34190.
                    if slot <> 34190 or instruction <> 23549 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23549, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:694
//
// PORT: SOURCE P20-P25.agc:695
//		CAE	GENRET
// PORT: Fixed ROM slots 34191.
                    if slot <> 34191 or instruction <> 13304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1016).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34193 {
            if slot <= 34192 {
// PORT: SOURCE P20-P25.agc:696
//		LXCH	A		# RETURN IS IN L
// PORT: Fixed ROM slots 34192.
                if slot <> 34192 or instruction <> 9216 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 0, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:697
//		CA	SAVBNK		# RESTORE EBANK
// PORT: Fixed ROM slots 34193.
                if slot <> 34193 or instruction <> 13305 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1017).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34194 {
// PORT: SOURCE P20-P25.agc:698
//		XCH	EBANK
// PORT: Fixed ROM slots 34194.
                if slot <> 34194 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34195 {
// PORT: SOURCE P20-P25.agc:699
//		LXCH	A		# RETURN IS NOW BACK IN A
// PORT: Fixed ROM slots 34195.
                    if slot <> 34195 or instruction <> 9216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 0, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:700
//		TC	BANKJUMP	# EXIT R61
// PORT: Fixed ROM slots 34196.
                    if slot <> 34196 or instruction <> 2500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2500, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1922] to agcAotUnit1922@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:701
//		BANK	13
// PORT: SOURCE P20-P25.agc:702
//		SETLOC	P20S2
// PORT: SOURCE P20-P25.agc:703
//		BANK
// PORT: SOURCE P20-P25.agc:704
//
// PORT: SOURCE P20-P25.agc:705
//		EBANK=	MRKBUF1
// PORT: SOURCE P20-P25.agc:706
//# Page 576
// PORT: SOURCE P20-P25.agc:707
//# BVECTOR PERFORMS COMPUTATIONS FOR
// PORT: SOURCE P20-P25.agc:708
//#
// PORT: SOURCE P20-P25.agc:709
//# 	DELTAQ, THE MEASURED DEVIATION BASED ON THE DIFFERENCE BETWEEN THE CSM-LEM
// PORT: SOURCE P20-P25.agc:710
//# 	STATE VECTOR ESTIMATES AND THE ACTUAL TRACKING MEASUREMENT.
// PORT: SOURCE P20-P25.agc:711
//#
// PORT: SOURCE P20-P25.agc:712
//# 	US, THE MODIFIED FICTITIOUS STAR DIRECTION VECTOR
// PORT: SOURCE P20-P25.agc:713
//#	GEOMETRY VECTORY B ASSOCIATED WITH EACH TRACKING MEASUREMENT.
// PORT: SOURCE P20-P25.agc:714
//#
// PORT: SOURCE P20-P25.agc:715
//# INPUT
// PORT: SOURCE P20-P25.agc:716
//#
// PORT: SOURCE P20-P25.agc:717
//#	UM,1/2 UNIT VECTOR ALONG THE CSM-LM LINE-OF-SIGHT (BASIC REF. SYSTEM)
// PORT: SOURCE P20-P25.agc:718
//#
// PORT: SOURCE P20-P25.agc:719
//#	USTAR,FICTITIOUS STAR DIRECTION (1/2 UNIT VECTOR)
// PORT: SOURCE P20-P25.agc:720
//#
// PORT: SOURCE P20-P25.agc:721
//#	RCLP,RELATIVE CSM TO LM POSITION VECTOR
// PORT: SOURCE P20-P25.agc:722
//#
// PORT: SOURCE P20-P25.agc:723
//# OUTPUT
// PORT: SOURCE P20-P25.agc:724
//#
// PORT: SOURCE P20-P25.agc:725
//#	USTAR,MODIFIED FICTITIOUS STAR DIRECTION (1/2 UNIT VECTOR)
// PORT: SOURCE P20-P25.agc:726
//#
// PORT: SOURCE P20-P25.agc:727
//#	BVECTOR = 9 DIMENSIONAL BVECTOR (1/2 UNIT VEC.)
// PORT: SOURCE P20-P25.agc:728
//#
// PORT: SOURCE P20-P25.agc:729
//#	DELTAQ = MEASURED DEVIATION
// PORT: SOURCE P20-P25.agc:730
//#
// PORT: SOURCE P20-P25.agc:731
//# CALLING SEQUENCE
// PORT: SOURCE P20-P25.agc:732
//#
// PORT: SOURCE P20-P25.agc:733
//#	L	CALL BVECTORS
// PORT: SOURCE P20-P25.agc:734
//#
// PORT: SOURCE P20-P25.agc:735
//# NORMAL EXIT
// PORT: SOURCE P20-P25.agc:736
//#
// PORT: SOURCE P20-P25.agc:737
//#	L+1 OF CALLING SEQUENCE
// PORT: SOURCE P20-P25.agc:738
//
// PORT: SOURCE P20-P25.agc:739
//		COUNT	23/20SUB
// PORT: SOURCE P20-P25.agc:740
//
// PORT: SOURCE P20-P25.agc:741
//BVECTORS	STQ
// PORT: Fixed ROM slots 22051.
    22051, 65312,
// PORT: SOURCE P20-P25.agc:742
//			EGRESS
// PORT: Fixed ROM slots 22052.
    22052, 2462,
// PORT: SOURCE P20-P25.agc:743
//		VLOAD	UNIT
// PORT: Fixed ROM slots 22053.
    22053, 44794,
// PORT: SOURCE P20-P25.agc:744
//			RCLP		# RELATIVE POSITION VECTOR
// PORT: Fixed ROM slots 22054.
    22054, 3762,
// PORT: SOURCE P20-P25.agc:745
//		STODL	26D		# RCLP UNIT VEC
// PORT: Fixed ROM slots 22055.
    22055, 12342,
// PORT: SOURCE P20-P25.agc:746
//			36D		# RCLP ABS VALUE
// PORT: Fixed ROM slots 22056.
    22056, 74,
// PORT: SOURCE P20-P25.agc:747
//		STOVL	TEMPOR1		# MOVE TO SAFE LOCATION
// PORT: Fixed ROM slots 22057.
    22057, 21890,
// PORT: SOURCE P20-P25.agc:748
//			USTAR
// PORT: Fixed ROM slots 22058.
    22058, 1354,
// PORT: SOURCE P20-P25.agc:749
//		VXV	UNIT
// PORT: Fixed ROM slots 22059.
    22059, 44602,
// PORT: SOURCE P20-P25.agc:750
//			26D		# USTAR = UNIT(US X UCL)
// PORT: Fixed ROM slots 22060.
    22060, 54,
// PORT: SOURCE P20-P25.agc:751
//		STCALL	BVECTOR
// PORT: Fixed ROM slots 22061.
    22061, 32388,
// PORT: SOURCE P20-P25.agc:752
//			GRP2PC		# PHASE CHANGE
// PORT: Fixed ROM slots 22062.
    22062, 48080,
// PORT: SOURCE P20-P25.agc:753
//		VLOAD
// PORT: Fixed ROM slots 22063.
    22063, 65530,
// PORT: SOURCE P20-P25.agc:754
//			BVECTOR
// PORT: Fixed ROM slots 22064.
    22064, 3716,
// PORT: SOURCE P20-P25.agc:755
//		STORE	USTAR
// PORT: Fixed ROM slots 22065.
    22065, 1354,
// PORT: SOURCE P20-P25.agc:756
//		DOT	SL1
// PORT: Fixed ROM slots 22066.
    22066, 59970,
// PORT: SOURCE P20-P25.agc:757
//			UM		# USTAR DOT UM
// PORT: Fixed ROM slots 22067.
    22067, 1338,
// PORT: SOURCE P20-P25.agc:758
//		ACOS	DSU
// PORT: Fixed ROM slots 22068.
    22068, 38316,
// PORT: SOURCE P20-P25.agc:759
//			DP1/4TH
// PORT: Fixed ROM slots 22069.
    22069, 13738,
// PORT: SOURCE P20-P25.agc:760
//		NORM	DMP
// PORT: Fixed ROM slots 22070.
    22070, 34178,
// PORT: SOURCE P20-P25.agc:761
//			X1
// PORT: Fixed ROM slots 22071.
    22071, 78,
// PORT: SOURCE P20-P25.agc:762
//			PI/4.0
// PORT: Fixed ROM slots 22072.
    22072, 7302,
// PORT: SOURCE P20-P25.agc:763
//		DMP	SRR*
// PORT: Fixed ROM slots 22073.
    22073, 44810,
// PORT: SOURCE P20-P25.agc:764
//			TEMPOR1		# RCLP ABS VALUE
// PORT: Fixed ROM slots 22074.
    22074, 1410,
// PORT: SOURCE P20-P25.agc:765
//			0 -3,1		# ADJUST SCALING
// PORT: Fixed ROM slots 22075.
    22075, 18172,
// PORT: SOURCE P20-P25.agc:766
//		STOVL	DELTAQ
// PORT: Fixed ROM slots 22076.
    22076, 24232,
// PORT: SOURCE P20-P25.agc:767
//			ZEROVECS
// PORT: Fixed ROM slots 22077.
    22077, 13754,
// PORT: SOURCE P20-P25.agc:768
//		STORE	BVECTOR +6
// PORT: Fixed ROM slots 22078.
    22078, 3728,
// PORT: SOURCE P20-P25.agc:769
//		STORE	BVECTOR +12D
// PORT: Fixed ROM slots 22079.
    22079, 3740,
// PORT: SOURCE P20-P25.agc:770
//		GOTO
// PORT: Fixed ROM slots 22080.
    22080, 65360,
// PORT: SOURCE P20-P25.agc:771
//# Page 577
// PORT: SOURCE P20-P25.agc:772
//			EGRESS
// PORT: Fixed ROM slots 22081.
    22081, 2462,
// PORT: SOURCE P20-P25.agc:773
//PI/4.0		2DEC	.785398164
// PORT: Fixed ROM slots 22082 22083.
    22082, 25734, 22083, 31572,
// PORT: SOURCE P20-P25.agc:774
//
// PORT: SOURCE P20-P25.agc:775
//# Page 578
// PORT: SOURCE P20-P25.agc:776
//# GETUM:  DETERMINES THE LINE OF SIGHT UNIT VECTOR UM IN THE BASIC REFERENCE
// PORT: SOURCE P20-P25.agc:777
//# COORDINATE SYSTEM FROM THE OPTICS SHAFT AND TRUNNION ANGLES AND THE IMU
// PORT: SOURCE P20-P25.agc:778
//# GIMBAL ANGLES.
// PORT: SOURCE P20-P25.agc:779
//#
// PORT: SOURCE P20-P25.agc:780
//# INPUT
// PORT: SOURCE P20-P25.agc:781
//#
// PORT: SOURCE P20-P25.agc:782
//#	MARKDATA, BASE ADDRESS OF MARK DATA
// PORT: SOURCE P20-P25.agc:783
//#	REFSMMAT, ROTATION MATRIX FROM STABLE MEMBER TO BASIC REF. COORD. SYSTEM
// PORT: SOURCE P20-P25.agc:784
//#
// PORT: SOURCE P20-P25.agc:785
//# SUBROUTINES CALLED-
// PORT: SOURCE P20-P25.agc:786
//#
// PORT: SOURCE P20-P25.agc:787
//#	SXTNB -- SEXT. ANGULAR READINGS TO NAV. BASE COOR.
// PORT: SOURCE P20-P25.agc:788
//#	NBSM -- TRANSFORM FROM NAV. BASE TO STABLE MEMBER
// PORT: SOURCE P20-P25.agc:789
//#
// PORT: SOURCE P20-P25.agc:790
//# OUTPUT
// PORT: SOURCE P20-P25.agc:791
//#
// PORT: SOURCE P20-P25.agc:792
//#	MPAC = LINE OF SIGHT 1/2 UNIT VECTOR IN BASIC REFERENCE SYSTEM
// PORT: SOURCE P20-P25.agc:793
//#
// PORT: SOURCE P20-P25.agc:794
//# CALLING SEQUENCE
// PORT: SOURCE P20-P25.agc:795
//#
// PORT: SOURCE P20-P25.agc:796
//#	L	CALL GETUM
// PORT: SOURCE P20-P25.agc:797
//#
// PORT: SOURCE P20-P25.agc:798
//# NORMAL EXIT
// PORT: SOURCE P20-P25.agc:799
//#
// PORT: SOURCE P20-P25.agc:800
//#	L+1 OF CALLING SEQUENCE
// PORT: SOURCE P20-P25.agc:801
//
// PORT: SOURCE P20-P25.agc:802
//GETUM		STQ	SETPD
// PORT: Fixed ROM slots 22084.
    22084, 33056,
// PORT: SOURCE P20-P25.agc:803
//			EGRESS
// PORT: Fixed ROM slots 22085.
    22085, 2462,
// PORT: SOURCE P20-P25.agc:804
//			0
// PORT: Fixed ROM slots 22086.
    22086, 2,
// PORT: SOURCE P20-P25.agc:805
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 22087.
    22087, 64448,
// PORT: SOURCE P20-P25.agc:806
//			MARKDATA	# CONTAINS ADDRESS OF MARK DATA
// PORT: Fixed ROM slots 22088.
    22088, 1348,
// PORT: SOURCE P20-P25.agc:807
//			1,1
// PORT: Fixed ROM slots 22089.
    22089, 4,
// PORT: SOURCE P20-P25.agc:808
//		STODL*	MARKDOWN +1	# TRANSFER DATA FROM WORKING STORAGE
// PORT: Fixed ROM slots 22090.
    22090, 20348,
// PORT: SOURCE P20-P25.agc:809
//			0,1		# TO MARKDOWN ARRAY FOR DOWNLINK
// PORT: Fixed ROM slots 22091.
    22091, 2,
// PORT: SOURCE P20-P25.agc:810
//		STORE	MARKDOWN
// PORT: Fixed ROM slots 22092.
    22092, 3962,
// PORT: SOURCE P20-P25.agc:811
//		AXT,2
// PORT: Fixed ROM slots 22093.
    22093, 65528,
// PORT: SOURCE P20-P25.agc:812
//			2
// PORT: Fixed ROM slots 22094.
    22094, 4,
// PORT: SOURCE P20-P25.agc:813
//		XSU,2	SXA,2
// PORT: Fixed ROM slots 22095.
    22095, 56424,
// PORT: SOURCE P20-P25.agc:814
//			X1		# X1 = MARKDATA
// PORT: Fixed ROM slots 22096.
    22096, 76,
// PORT: SOURCE P20-P25.agc:815
//			S1		# S1 = MARKDATA(ADR) +2
// PORT: Fixed ROM slots 22097.
    22097, 80,
// PORT: SOURCE P20-P25.agc:816
//		CALL
// PORT: Fixed ROM slots 22098.
    22098, 65320,
// PORT: SOURCE P20-P25.agc:817
//			SXTNB		# SEXT. ANGULAR READINGS TO NAV. BASE COOR.
// PORT: Fixed ROM slots 22099.
    22099, 38912,
// PORT: SOURCE P20-P25.agc:818
//		CALL
// PORT: Fixed ROM slots 22100.
    22100, 65320,
// PORT: SOURCE P20-P25.agc:819
//			NBSM		# TRANSFORM FROM NAV. BASE TO STABLE MEM.
// PORT: Fixed ROM slots 22101.
    22101, 40716,
// PORT: SOURCE P20-P25.agc:820
//		VXM	VSL1
// PORT: Fixed ROM slots 22102.
    22102, 64138,
// PORT: SOURCE P20-P25.agc:821
//			REFSMMAT
// PORT: Fixed ROM slots 22103.
    22103, 1980,
// PORT: SOURCE P20-P25.agc:822
//		GOTO			# MPAC = (UM) LINE OF SIGHT VECTOR
// PORT: Fixed ROM slots 22104.
    22104, 65360,
// PORT: SOURCE P20-P25.agc:823
//			EGRESS		# EXIT
// PORT: Fixed ROM slots 22105.
    22105, 2462
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31128–31133.
function agcAotUnit1776 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31130 {
        if slot <= 31128 {
// PORT: SOURCE P20-P25.agc:824
//
// PORT: SOURCE P20-P25.agc:825
//# Page 579
// PORT: SOURCE P20-P25.agc:826
//# RENDEZVOUS TRACKING DATA PROCESSING ROUTINE (R22)
// PORT: SOURCE P20-P25.agc:827
//#
// PORT: SOURCE P20-P25.agc:828
//# PURPOSE	(1) TO PROCESS RENDEZVOUS SIGHTING MARK DATA TO UPDATE THE STATE VECTOR OF EITHER THE CSM OR LM AS
// PORT: SOURCE P20-P25.agc:829
//#		DEFINED BY THE RENDEZVOUS NAVIGATION PROGRAM (P20).
// PORT: SOURCE P20-P25.agc:830
//#
// PORT: SOURCE P20-P25.agc:831
//# ASSUMPTIONS	(1) THIS ROUTINE IS MANUALLY SELECTED BY THE ASTRONAUT BY V55E WHENEVER RENDEZVOUS SIGHTING MARKS
// PORT: SOURCE P20-P25.agc:832
//#		ARE DESIRED.  ITS SELECTION, HOWEVER, IS LIMITED TO PERIODS WHEN THE CMC IS HOLDING FOR A V/N FLASHING
// PORT: SOURCE P20-P25.agc:833
//#		DATA DISPLAY.  THIS ROUTINE RETURNS TO THE ORIGINAL PROGRAM AT THE INTERRUPTED DISPLAY.
// PORT: SOURCE P20-P25.agc:834
//
// PORT: SOURCE P20-P25.agc:835
//		BANK	34
// PORT: SOURCE P20-P25.agc:836
//		SETLOC	P20S3
// PORT: SOURCE P20-P25.agc:837
//		BANK
// PORT: SOURCE P20-P25.agc:838
//
// PORT: SOURCE P20-P25.agc:839
//		COUNT	34/R22
// PORT: SOURCE P20-P25.agc:840
//
// PORT: SOURCE P20-P25.agc:841
//R22		CAF	PRIO26
// PORT: Fixed ROM slots 31128.
            if slot <> 31128 or instruction <> 16307 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4019), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31129 {
// PORT: SOURCE P20-P25.agc:842
//		TS	PHSPRDT2
// PORT: Fixed ROM slots 31129.
                if slot <> 31129 or instruction <> 23086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:843
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 31130.
                if slot <> 31130 or instruction <> 2696 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2696, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31131 {
// PORT: SOURCE P20-P25.agc:844
//		CA	NEG3
// PORT: Fixed ROM slots 31131.
            if slot <> 31131 or instruction <> 16332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31132 {
// PORT: SOURCE P20-P25.agc:845
//		TS	MRKBUF2
// PORT: Fixed ROM slots 31132.
                if slot <> 31132 or instruction <> 23516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23516, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:846
//		TC	INTPRET
// PORT: Fixed ROM slots 31133.
                if slot <> 31133 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1776] to agcAotUnit1776@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:847
//		RTB
// PORT: Fixed ROM slots 31134.
    31134, 65336,
// PORT: SOURCE P20-P25.agc:848
//			LOADTIME
// PORT: Fixed ROM slots 31135.
    31135, 38544,
// PORT: SOURCE P20-P25.agc:849
//		STORE	VHFTIME		# PRESENT TIME
// PORT: Fixed ROM slots 31136.
    31136, 1236,
// PORT: SOURCE P20-P25.agc:850
//REND1		CALL
// PORT: Fixed ROM slots 31137.
    31137, 65320,
// PORT: SOURCE P20-P25.agc:851
//			GRP2PC
// PORT: Fixed ROM slots 31138.
    31138, 48080,
// PORT: SOURCE P20-P25.agc:852
//		CALL
// PORT: Fixed ROM slots 31139.
    31139, 65320,
// PORT: SOURCE P20-P25.agc:853
//			WAITONE
// PORT: Fixed ROM slots 31140.
    31140, 47624,
// PORT: SOURCE P20-P25.agc:854
//REND1A		EXIT
// PORT: Fixed ROM slots 31141.
    31141, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31142–31148.
function agcAotUnit1777 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31144 {
        if slot <= 31142 {
// PORT: SOURCE P20-P25.agc:855
//		CA	MRKBUF2
// PORT: Fixed ROM slots 31142.
            if slot <> 31142 or instruction <> 13276 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 988).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31143 {
// PORT: SOURCE P20-P25.agc:856
//		EXTEND
// PORT: Fixed ROM slots 31143.
                if slot <> 31143 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:857
//		BZF	REND2
// PORT: Fixed ROM slots 31144.
                if slot <> 31144 or instruction <> 5547 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5547, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31146 {
            if slot <= 31145 {
// PORT: SOURCE P20-P25.agc:858
//		EXTEND
// PORT: Fixed ROM slots 31145.
                if slot <> 31145 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:859
//		BZMF	REND3A
// PORT: Fixed ROM slots 31146.
                if slot <> 31146 or instruction <> 26042 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26042, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31147 {
// PORT: SOURCE P20-P25.agc:860
//REND2		CAF	SIX
// PORT: Fixed ROM slots 31147.
                if slot <> 31147 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:861
//		TC	GENTRAN
// PORT: Fixed ROM slots 31148.
                if slot <> 31148 or instruction <> 2950 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2950, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1777] to agcAotUnit1777@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:862
//		ADRES	MRKBUF2
// PORT: Fixed ROM slots 31149.
    31149, 1976,
// PORT: SOURCE P20-P25.agc:863
//		ADRES	MARKTIME	# MARKTIME MUST BE CONTIGUOUS WITH VTEMP
// PORT: Fixed ROM slots 31150.
    31150, 1320
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31151–31154.
function agcAotUnit1778 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31152 {
        if slot <= 31151 {
// PORT: SOURCE P20-P25.agc:864
//		CAF	NEG3		# NEG VALUE TO INDICATE VALUES USED
// PORT: Fixed ROM slots 31151.
            if slot <> 31151 or instruction <> 16332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:865
//		TS	MRKBUF2
// PORT: Fixed ROM slots 31152.
            if slot <> 31152 or instruction <> 23516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31153 {
// PORT: SOURCE P20-P25.agc:866
//		RELINT
// PORT: Fixed ROM slots 31153.
            if slot <> 31153 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:867
//		TC	INTPRET
// PORT: Fixed ROM slots 31154.
            if slot <> 31154 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1778] to agcAotUnit1778@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:868
//		CLEAR	CALL
// PORT: Fixed ROM slots 31155.
    31155, 37912,
// PORT: SOURCE P20-P25.agc:869
//			SOURCFLG	# 0 = OPTICS DATA
// PORT: Fixed ROM slots 31156.
    31156, 4974,
// PORT: SOURCE P20-P25.agc:870
//			GRP2PC
// PORT: Fixed ROM slots 31157.
    31157, 48080,
// PORT: SOURCE P20-P25.agc:871
//		SSP	GOTO
// PORT: Fixed ROM slots 31158.
    31158, 43186,
// PORT: SOURCE P20-P25.agc:872
//			MARKDATA
// PORT: Fixed ROM slots 31159.
    31159, 1350,
// PORT: SOURCE P20-P25.agc:873
//		ECADR	VTEMP -2
// PORT: Fixed ROM slots 31160.
    31160, 1320,
// PORT: SOURCE P20-P25.agc:874
//			REND4
// PORT: Fixed ROM slots 31161.
    31161, 58266
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31162–31162.
function agcAotUnit1779 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:875
//REND3A		TC	INTPRET
// PORT: Fixed ROM slots 31162.
    if slot <> 31162 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1779] to agcAotUnit1779@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:876
//REND3		CALL
// PORT: Fixed ROM slots 31163.
    31163, 65320,
// PORT: SOURCE P20-P25.agc:877
//# Page 580
// PORT: SOURCE P20-P25.agc:878
//			GRP2PC
// PORT: Fixed ROM slots 31164.
    31164, 48080,
// PORT: SOURCE P20-P25.agc:879
//		CALL
// PORT: Fixed ROM slots 31165.
    31165, 65320,
// PORT: SOURCE P20-P25.agc:880
//			WAITONE
// PORT: Fixed ROM slots 31166.
    31166, 47624,
// PORT: SOURCE P20-P25.agc:881
//		BOFF
// PORT: Fixed ROM slots 31167.
    31167, 65304,
// PORT: SOURCE P20-P25.agc:882
//			VHFRFLAG
// PORT: Fixed ROM slots 31168.
    31168, 5068,
// PORT: SOURCE P20-P25.agc:883
//			REND1A
// PORT: Fixed ROM slots 31169.
    31169, 58186,
// PORT: SOURCE P20-P25.agc:884
//		RTB
// PORT: Fixed ROM slots 31170.
    31170, 65336,
// PORT: SOURCE P20-P25.agc:885
//			LOADTIME	# PRESENT TIME
// PORT: Fixed ROM slots 31171.
    31171, 38544,
// PORT: SOURCE P20-P25.agc:886
//		DSU	DSU
// PORT: Fixed ROM slots 31172.
    31172, 38186,
// PORT: SOURCE P20-P25.agc:887
//			60SECDP		# 1 MIN
// PORT: Fixed ROM slots 31173.
    31173, 13136,
// PORT: SOURCE P20-P25.agc:888
//			VHFTIME		# LAST READING OF RADAR
// PORT: Fixed ROM slots 31174.
    31174, 1236,
// PORT: SOURCE P20-P25.agc:889
//		BMN	CALL
// PORT: Fixed ROM slots 31175.
    31175, 37952,
// PORT: SOURCE P20-P25.agc:890
//			REND1A
// PORT: Fixed ROM slots 31176.
    31176, 58186,
// PORT: SOURCE P20-P25.agc:891
//			RANGERD		# READ RADAR RANGE
// PORT: Fixed ROM slots 31177.
    31177, 47642,
// PORT: SOURCE P20-P25.agc:892
//		DLOAD
// PORT: Fixed ROM slots 31178.
    31178, 65482,
// PORT: SOURCE P20-P25.agc:893
//			MARKTIME
// PORT: Fixed ROM slots 31179.
    31179, 1322,
// PORT: SOURCE P20-P25.agc:894
//		STORE	VHFTIME		# FOR DOWNLINK
// PORT: Fixed ROM slots 31180.
    31180, 1236,
// PORT: SOURCE P20-P25.agc:895
//REND4		CALL
// PORT: Fixed ROM slots 31181.
    31181, 65320,
// PORT: SOURCE P20-P25.agc:896
//			SETINTG		# SET INTEGRV FLAGS
// PORT: Fixed ROM slots 31182.
    31182, 47558,
// PORT: SOURCE P20-P25.agc:897
//		BON	CALL
// PORT: Fixed ROM slots 31183.
    31183, 37912,
// PORT: SOURCE P20-P25.agc:898
//			VEHUPFLG
// PORT: Fixed ROM slots 31184.
    31184, 910,
// PORT: SOURCE P20-P25.agc:899
//			CSMUPP		# BRANCH IF CSM UPDATE
// PORT: Fixed ROM slots 31185.
    31185, 58580,
// PORT: SOURCE P20-P25.agc:900
//			INTEGRV
// PORT: Fixed ROM slots 31186.
    31186, 23780,
// PORT: SOURCE P20-P25.agc:901
//		CALL
// PORT: Fixed ROM slots 31187.
    31187, 65320,
// PORT: SOURCE P20-P25.agc:902
//			GRP2PC		# PHASE CHANGE
// PORT: Fixed ROM slots 31188.
    31188, 48080,
// PORT: SOURCE P20-P25.agc:903
//		CALL
// PORT: Fixed ROM slots 31189.
    31189, 65320,
// PORT: SOURCE P20-P25.agc:904
//			SETINTG		# SET INTEGRV FLAGS
// PORT: Fixed ROM slots 31190.
    31190, 47558,
// PORT: SOURCE P20-P25.agc:905
//		CLEAR
// PORT: Fixed ROM slots 31191.
    31191, 65304,
// PORT: SOURCE P20-P25.agc:906
//			VINTFLAG	# SET INTEGRATION VEHICLE TO LM
// PORT: Fixed ROM slots 31192.
    31192, 1912,
// PORT: SOURCE P20-P25.agc:907
//REND5		BOFF	SET
// PORT: Fixed ROM slots 31193.
    31193, 35864,
// PORT: SOURCE P20-P25.agc:908
//			RENDWFLG
// PORT: Fixed ROM slots 31194.
    31194, 3036,
// PORT: SOURCE P20-P25.agc:909
//			REND5A		# DO NOT INTEGRATE W IF FLAG = 0
// PORT: Fixed ROM slots 31195.
    31195, 58298,
// PORT: SOURCE P20-P25.agc:910
//			DIM0FLAG
// PORT: Fixed ROM slots 31196.
    31196, 1660,
// PORT: SOURCE P20-P25.agc:911
//REND5A		CALL
// PORT: Fixed ROM slots 31197.
    31197, 65320,
// PORT: SOURCE P20-P25.agc:912
//			INTEGRV
// PORT: Fixed ROM slots 31198.
    31198, 23780,
// PORT: SOURCE P20-P25.agc:913
//		CALL
// PORT: Fixed ROM slots 31199.
    31199, 65320,
// PORT: SOURCE P20-P25.agc:914
//			SHIFTNDX	# SET EARTH MOON SCALING INDEX
// PORT: Fixed ROM slots 31200.
    31200, 47822,
// PORT: SOURCE P20-P25.agc:915
//		CALL
// PORT: Fixed ROM slots 31201.
    31201, 65320,
// PORT: SOURCE P20-P25.agc:916
//			CMPOS		# SET CSM POSITION
// PORT: Fixed ROM slots 31202.
    31202, 58690,
// PORT: SOURCE P20-P25.agc:917
//		SET	CALL
// PORT: Fixed ROM slots 31203.
    31203, 37912,
// PORT: SOURCE P20-P25.agc:918
//			INCORFLG	# SET FOR 1ST PASS
// PORT: Fixed ROM slots 31204.
    31204, 2664,
// PORT: SOURCE P20-P25.agc:919
//			LMPOS		# SET LM POSITION
// PORT: Fixed ROM slots 31205.
    31205, 58704,
// PORT: SOURCE P20-P25.agc:920
//		CLEAR	BON
// PORT: Fixed ROM slots 31206.
    31206, 35864,
// PORT: SOURCE P20-P25.agc:921
//			ORBWFLAG	# CLEAR FOR ORBITAL AND CISLUNAR
// PORT: Fixed ROM slots 31207.
    31207, 1906,
// PORT: SOURCE P20-P25.agc:922
//			RENDWFLG
// PORT: Fixed ROM slots 31208.
    31208, 2972,
// PORT: SOURCE P20-P25.agc:923
//			REND6
// PORT: Fixed ROM slots 31209.
    31209, 58338,
// PORT: SOURCE P20-P25.agc:924
//		DLOAD
// PORT: Fixed ROM slots 31210.
    31210, 65482,
// PORT: SOURCE P20-P25.agc:925
//			WRENDPOS
// PORT: Fixed ROM slots 31211.
    31211, 2050,
// PORT: SOURCE P20-P25.agc:926
//		STCALL	0		# 0 = WRENDPOS	1 = WRENDVEL
// PORT: Fixed ROM slots 31212.
    31212, 28674,
// PORT: SOURCE P20-P25.agc:927
//			INITIALW	# INTIIALIZE W MATRIX
// PORT: Fixed ROM slots 31213.
    31213, 47850,
// PORT: SOURCE P20-P25.agc:928
//# Page 581
// PORT: SOURCE P20-P25.agc:929
//		DLOAD
// PORT: Fixed ROM slots 31214.
    31214, 65482,
// PORT: SOURCE P20-P25.agc:930
//			ZEROVECS
// PORT: Fixed ROM slots 31215.
    31215, 13754,
// PORT: SOURCE P20-P25.agc:931
//		STORE	VHFCNT		# ZERO OUT VHFCNT AND TRKMKCNT
// PORT: Fixed ROM slots 31216.
    31216, 1196,
// PORT: SOURCE P20-P25.agc:932
//REND6		SET
// PORT: Fixed ROM slots 31217.
    31217, 65304,
// PORT: SOURCE P20-P25.agc:933
//			RENDWFLG
// PORT: Fixed ROM slots 31218.
    31218, 2684,
// PORT: SOURCE P20-P25.agc:934
//		VLOAD	VSU
// PORT: Fixed ROM slots 31219.
    31219, 43514,
// PORT: SOURCE P20-P25.agc:935
//			LEMPOS
// PORT: Fixed ROM slots 31220.
    31220, 1306,
// PORT: SOURCE P20-P25.agc:936
//			CSMPOS
// PORT: Fixed ROM slots 31221.
    31221, 1294,
// PORT: SOURCE P20-P25.agc:937
//		STORE	RCLP		# LM - CSM
// PORT: Fixed ROM slots 31222.
    31222, 3762,
// PORT: SOURCE P20-P25.agc:938
//REND7		UNIT	BON
// PORT: Fixed ROM slots 31223.
    31223, 35932,
// PORT: SOURCE P20-P25.agc:939
//			SOURCFLG
// PORT: Fixed ROM slots 31224.
    31224, 5006,
// PORT: SOURCE P20-P25.agc:940
//			REND14		# BRANCH IF DATA IS RADAR
// PORT: Fixed ROM slots 31225.
    31225, 58598,
// PORT: SOURCE P20-P25.agc:941
//		STORE	UCL
// PORT: Fixed ROM slots 31226.
    31226, 1398,
// PORT: SOURCE P20-P25.agc:942
//		BOFF	CALL
// PORT: Fixed ROM slots 31227.
    31227, 37912,
// PORT: SOURCE P20-P25.agc:943
//			INCORFLG
// PORT: Fixed ROM slots 31228.
    31228, 3016,
// PORT: SOURCE P20-P25.agc:944
//			REND9
// PORT: Fixed ROM slots 31229.
    31229, 58382,
// PORT: SOURCE P20-P25.agc:945
//			GETUM		# CALCULATE UM LINE OF SIGHT
// PORT: Fixed ROM slots 31230.
    31230, 40072,
// PORT: SOURCE P20-P25.agc:946
//		STOVL	UM
// PORT: Fixed ROM slots 31231.
    31231, 21818,
// PORT: SOURCE P20-P25.agc:947
//			UCL
// PORT: Fixed ROM slots 31232.
    31232, 1398,
// PORT: SOURCE P20-P25.agc:948
//		VXV	BOV
// PORT: Fixed ROM slots 31233.
    31233, 32826,
// PORT: SOURCE P20-P25.agc:949
//			UM		# UCL X UM
// PORT: Fixed ROM slots 31234.
    31234, 1338,
// PORT: SOURCE P20-P25.agc:950
//			REND8
// PORT: Fixed ROM slots 31235.
    31235, 58376,
// PORT: SOURCE P20-P25.agc:951
//REND8		UNIT	BOV
// PORT: Fixed ROM slots 31236.
    31236, 32860,
// PORT: SOURCE P20-P25.agc:952
//			REND3		# BRANCH IF OVERFLOW IGNORE MARK
// PORT: Fixed ROM slots 31237.
    31237, 58230,
// PORT: SOURCE P20-P25.agc:953
//		STORE	USTAR
// PORT: Fixed ROM slots 31238.
    31238, 1354,
// PORT: SOURCE P20-P25.agc:954
//REND9		CALL
// PORT: Fixed ROM slots 31239.
    31239, 65320,
// PORT: SOURCE P20-P25.agc:955
//			BVECTORS
// PORT: Fixed ROM slots 31240.
    31240, 40006,
// PORT: SOURCE P20-P25.agc:956
//		BON	VLOAD
// PORT: Fixed ROM slots 31241.
    31241, 64792,
// PORT: SOURCE P20-P25.agc:957
//			VEHUPFLG
// PORT: Fixed ROM slots 31242.
    31242, 910,
// PORT: SOURCE P20-P25.agc:958
//			REND9A
// PORT: Fixed ROM slots 31243.
    31243, 58398,
// PORT: SOURCE P20-P25.agc:959
//			BVECTOR
// PORT: Fixed ROM slots 31244.
    31244, 3716,
// PORT: SOURCE P20-P25.agc:960
//		VCOMP
// PORT: Fixed ROM slots 31245.
    31245, 65404,
// PORT: SOURCE P20-P25.agc:961
//		STORE	BVECTOR
// PORT: Fixed ROM slots 31246.
    31246, 3716,
// PORT: SOURCE P20-P25.agc:962
//REND9A		CALL
// PORT: Fixed ROM slots 31247.
    31247, 65320,
// PORT: SOURCE P20-P25.agc:963
//			GRP2PC
// PORT: Fixed ROM slots 31248.
    31248, 48080,
// PORT: SOURCE P20-P25.agc:964
//		BON
// PORT: Fixed ROM slots 31249.
    31249, 65304,
// PORT: SOURCE P20-P25.agc:965
//			R23FLG
// PORT: Fixed ROM slots 31250.
    31250, 908,
// PORT: SOURCE P20-P25.agc:966
//			REND15		# BRANCH IF BACKUP OPTICS (R23 WORKING)
// PORT: Fixed ROM slots 31251.
    31251, 58648,
// PORT: SOURCE P20-P25.agc:967
//		DLOAD	DAD
// PORT: Fixed ROM slots 31252.
    31252, 36298,
// PORT: SOURCE P20-P25.agc:968
//			SXTVAR
// PORT: Fixed ROM slots 31253.
    31253, 26044,
// PORT: SOURCE P20-P25.agc:969
//			IMUVAR
// PORT: Fixed ROM slots 31254.
    31254, 26048,
// PORT: SOURCE P20-P25.agc:970
//REND10		STOVL	VARIANCE	# TEMP STORAGE FOR VARIANCE CALC.
// PORT: Fixed ROM slots 31255.
    31255, 24236,
// PORT: SOURCE P20-P25.agc:971
//			RCLP
// PORT: Fixed ROM slots 31256.
    31256, 3762,
// PORT: SOURCE P20-P25.agc:972
//		ABVAL	NORM
// PORT: Fixed ROM slots 31257.
    31257, 49484,
// PORT: SOURCE P20-P25.agc:973
//			X1
// PORT: Fixed ROM slots 31258.
    31258, 78,
// PORT: SOURCE P20-P25.agc:974
//		DSQ	DMP
// PORT: Fixed ROM slots 31259.
    31259, 34204,
// PORT: SOURCE P20-P25.agc:975
//			VARIANCE
// PORT: Fixed ROM slots 31260.
    31260, 3756,
// PORT: SOURCE P20-P25.agc:976
//		XAD,1	CALL
// PORT: Fixed ROM slots 31261.
    31261, 38000,
// PORT: SOURCE P20-P25.agc:977
//			X1
// PORT: Fixed ROM slots 31262.
    31262, 76,
// PORT: SOURCE P20-P25.agc:978
//			SHIFTNDX	# GET EARTH MOON SCALING INDEX
// PORT: Fixed ROM slots 31263.
    31263, 47822,
// PORT: SOURCE P20-P25.agc:979
//# Page 582
// PORT: SOURCE P20-P25.agc:980
//		XAD,1	XAD,1
// PORT: Fixed ROM slots 31264.
    31264, 47216,
// PORT: SOURCE P20-P25.agc:981
//			X2
// PORT: Fixed ROM slots 31265.
    31265, 78,
// PORT: SOURCE P20-P25.agc:982
//			X2
// PORT: Fixed ROM slots 31266.
    31266, 78,
// PORT: SOURCE P20-P25.agc:983
//		SR*	TLOAD
// PORT: Fixed ROM slots 31267.
    31267, 59742,
// PORT: SOURCE P20-P25.agc:984
//			0 -2,1		# ADJUST SCALING TO B-40
// PORT: Fixed ROM slots 31268.
    31268, 17150,
// PORT: SOURCE P20-P25.agc:985
//			MPAC
// PORT: Fixed ROM slots 31269.
    31269, 218,
// PORT: SOURCE P20-P25.agc:986
//		STORE	VARIANCE
// PORT: Fixed ROM slots 31270.
    31270, 3756,
// PORT: SOURCE P20-P25.agc:987
//		SLOAD	SR
// PORT: Fixed ROM slots 31271.
    31271, 45498,
// PORT: SOURCE P20-P25.agc:988
//			INTVAR		# INTEGRATION VARIANCE SCALED B-15
// PORT: Fixed ROM slots 31272.
    31272, 2560,
// PORT: SOURCE P20-P25.agc:989
//			25D		# SCALE IT B-40
// PORT: Fixed ROM slots 31273.
    31273, 17204,
// PORT: SOURCE P20-P25.agc:990
//		TAD	RTB
// PORT: Fixed ROM slots 31274.
    31274, 40178,
// PORT: SOURCE P20-P25.agc:991
//			VARIANCE
// PORT: Fixed ROM slots 31275.
    31275, 3756,
// PORT: SOURCE P20-P25.agc:992
//			TPMODE
// PORT: Fixed ROM slots 31276.
    31276, 38634,
// PORT: SOURCE P20-P25.agc:993
//		STORE	VARIANCE
// PORT: Fixed ROM slots 31277.
    31277, 3756,
// PORT: SOURCE P20-P25.agc:994
//		BOFF	TAD
// PORT: Fixed ROM slots 31278.
    31278, 63768,
// PORT: SOURCE P20-P25.agc:995
//			SOURCFLG	# BRANCH IF NOT VHF RADAR
// PORT: Fixed ROM slots 31279.
    31279, 5070,
// PORT: SOURCE P20-P25.agc:996
//			REND10A
// PORT: Fixed ROM slots 31280.
    31280, 58478,
// PORT: SOURCE P20-P25.agc:997
//			RVARMIN		# VHF RADAR MIN. VARIANCE
// PORT: Fixed ROM slots 31281.
    31281, 3082,
// PORT: SOURCE P20-P25.agc:998
//		BPL	TLOAD
// PORT: Fixed ROM slots 31282.
    31282, 59720,
// PORT: SOURCE P20-P25.agc:999
//			REND10A
// PORT: Fixed ROM slots 31283.
    31283, 58478,
// PORT: SOURCE P20-P25.agc:1000
//			RVARMIN
// PORT: Fixed ROM slots 31284.
    31284, 3082,
// PORT: SOURCE P20-P25.agc:1001
//		ABS			# MIN. VALUE WAS STORED AS NEG.
// PORT: Fixed ROM slots 31285.
    31285, 65356,
// PORT: SOURCE P20-P25.agc:1002
//		STORE	VARIANCE	# STORE MIN. VALUE
// PORT: Fixed ROM slots 31286.
    31286, 3756,
// PORT: SOURCE P20-P25.agc:1003
//REND10A		CLEAR	CALL
// PORT: Fixed ROM slots 31287.
    31287, 37912
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1004
//			DMENFLG		# CLEAR FOR 6 X 6 W MATRIX
// PORT: Fixed ROM slots 31288.
    31288, 2924,
// PORT: SOURCE P20-P25.agc:1005
//			INCORP1		# CALCULATE UPDATE
// PORT: Fixed ROM slots 31289.
    31289, 62808,
// PORT: SOURCE P20-P25.agc:1006
//		CALL
// PORT: Fixed ROM slots 31290.
    31290, 65320,
// PORT: SOURCE P20-P25.agc:1007
//			GRP2PC
// PORT: Fixed ROM slots 31291.
    31291, 48080,
// PORT: SOURCE P20-P25.agc:1008
//		BOFF	CALL
// PORT: Fixed ROM slots 31292.
    31292, 37912,
// PORT: SOURCE P20-P25.agc:1009
//			INCORFLG
// PORT: Fixed ROM slots 31293.
    31293, 3016,
// PORT: SOURCE P20-P25.agc:1010
//			REND12
// PORT: Fixed ROM slots 31294.
    31294, 58536,
// PORT: SOURCE P20-P25.agc:1011
//			SHIFTNDX	# GET EARTH MOON SCALING INDEX
// PORT: Fixed ROM slots 31295.
    31295, 47822,
// PORT: SOURCE P20-P25.agc:1012
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 31296.
    31296, 42746,
// PORT: SOURCE P20-P25.agc:1013
//			DELTAX +6
// PORT: Fixed ROM slots 31297.
    31297, 1386,
// PORT: SOURCE P20-P25.agc:1014
//		SR*
// PORT: Fixed ROM slots 31298.
    31298, 65374,
// PORT: SOURCE P20-P25.agc:1015
//			0,2
// PORT: Fixed ROM slots 31299.
    31299, 48380,
// PORT: SOURCE P20-P25.agc:1016
//		STOVL	N49DISP +2
// PORT: Fixed ROM slots 31300.
    31300, 24200,
// PORT: SOURCE P20-P25.agc:1017
//			DELTAX
// PORT: Fixed ROM slots 31301.
    31301, 1374,
// PORT: SOURCE P20-P25.agc:1018
//		ABVAL	SR*
// PORT: Fixed ROM slots 31302.
    31302, 44876,
// PORT: SOURCE P20-P25.agc:1019
//			0,2
// PORT: Fixed ROM slots 31303.
    31303, 48380,
// PORT: SOURCE P20-P25.agc:1020
//		STORE	N49DISP
// PORT: Fixed ROM slots 31304.
    31304, 3716,
// PORT: SOURCE P20-P25.agc:1021
//		SLOAD
// PORT: Fixed ROM slots 31305.
    31305, 65466,
// PORT: SOURCE P20-P25.agc:1022
//			RMAX
// PORT: Fixed ROM slots 31306.
    31306, 2054,
// PORT: SOURCE P20-P25.agc:1023
//		SR	DSU
// PORT: Fixed ROM slots 31307.
    31307, 38242,
// PORT: SOURCE P20-P25.agc:1024
//			10D
// PORT: Fixed ROM slots 31308.
    31308, 17174,
// PORT: SOURCE P20-P25.agc:1025
//			N49DISP
// PORT: Fixed ROM slots 31309.
    31309, 3716,
// PORT: SOURCE P20-P25.agc:1026
//		BMN	SLOAD
// PORT: Fixed ROM slots 31310.
    31310, 56640,
// PORT: SOURCE P20-P25.agc:1027
//			RENDISP		# BRANCH IF POS UP. GREATER THAN MAX.
// PORT: Fixed ROM slots 31311.
    31311, 58718,
// PORT: SOURCE P20-P25.agc:1028
//			VMAX
// PORT: Fixed ROM slots 31312.
    31312, 2056,
// PORT: SOURCE P20-P25.agc:1029
//		DSU	BMN
// PORT: Fixed ROM slots 31313.
    31313, 41002,
// PORT: SOURCE P20-P25.agc:1030
//# Page 583
// PORT: SOURCE P20-P25.agc:1031
//			N49DISP +2
// PORT: Fixed ROM slots 31314.
    31314, 3720,
// PORT: SOURCE P20-P25.agc:1032
//			RENDISP		# BRANCH IF VEL. UPDATE GREATER THAN MAX.
// PORT: Fixed ROM slots 31315.
    31315, 58718,
// PORT: SOURCE P20-P25.agc:1033
//REND12		CALL
// PORT: Fixed ROM slots 31316.
    31316, 65320,
// PORT: SOURCE P20-P25.agc:1034
//			INCORP2		# INCORPORATE UPDATE VALUES INTO STATE VEC
// PORT: Fixed ROM slots 31317.
    31317, 63084,
// PORT: SOURCE P20-P25.agc:1035
//		BON	BOFF
// PORT: Fixed ROM slots 31318.
    31318, 35864,
// PORT: SOURCE P20-P25.agc:1036
//			SOURCFLG
// PORT: Fixed ROM slots 31319.
    31319, 5006,
// PORT: SOURCE P20-P25.agc:1037
//			REND16		# BRANCH IF DATA IS RADAR
// PORT: Fixed ROM slots 31320.
    31320, 58658,
// PORT: SOURCE P20-P25.agc:1038
//			INCORFLG
// PORT: Fixed ROM slots 31321.
    31321, 3016,
// PORT: SOURCE P20-P25.agc:1039
//			REND17
// PORT: Fixed ROM slots 31322.
    31322, 58670,
// PORT: SOURCE P20-P25.agc:1040
//		CALL
// PORT: Fixed ROM slots 31323.
    31323, 65320,
// PORT: SOURCE P20-P25.agc:1041
//			SHIFTNDX	# GET EARTH MOON SCALING INDEX
// PORT: Fixed ROM slots 31324.
    31324, 47822,
// PORT: SOURCE P20-P25.agc:1042
//		BON	CALL
// PORT: Fixed ROM slots 31325.
    31325, 37912,
// PORT: SOURCE P20-P25.agc:1043
//			VEHUPFLG
// PORT: Fixed ROM slots 31326.
    31326, 910,
// PORT: SOURCE P20-P25.agc:1044
//			REND18		# BRANCH IF CSM UPDATE
// PORT: Fixed ROM slots 31327.
    31327, 58682,
// PORT: SOURCE P20-P25.agc:1045
//			LMPOS		# GET LM POSITION
// PORT: Fixed ROM slots 31328.
    31328, 58704,
// PORT: SOURCE P20-P25.agc:1046
//REND13		CALL
// PORT: Fixed ROM slots 31329.
    31329, 65320,
// PORT: SOURCE P20-P25.agc:1047
//			GRP2PC		# PHASE CHANGE
// PORT: Fixed ROM slots 31330.
    31330, 48080,
// PORT: SOURCE P20-P25.agc:1048
//		VLOAD	VSU
// PORT: Fixed ROM slots 31331.
    31331, 43514,
// PORT: SOURCE P20-P25.agc:1049
//			LEMPOS
// PORT: Fixed ROM slots 31332.
    31332, 1306,
// PORT: SOURCE P20-P25.agc:1050
//			CSMPOS
// PORT: Fixed ROM slots 31333.
    31333, 1294,
// PORT: SOURCE P20-P25.agc:1051
//		STORE	RCLP		# LM - CSM
// PORT: Fixed ROM slots 31334.
    31334, 3762,
// PORT: SOURCE P20-P25.agc:1052
//		CLRGO
// PORT: Fixed ROM slots 31335.
    31335, 65304,
// PORT: SOURCE P20-P25.agc:1053
//			INCORFLG
// PORT: Fixed ROM slots 31336.
    31336, 2856,
// PORT: SOURCE P20-P25.agc:1054
//			REND7		# BRANCH FOR 2ND PASS THIS OPTICS MARK
// PORT: Fixed ROM slots 31337.
    31337, 58350,
// PORT: SOURCE P20-P25.agc:1055
//CSMUPP		CLEAR	CALL
// PORT: Fixed ROM slots 31338.
    31338, 37912,
// PORT: SOURCE P20-P25.agc:1056
//			VINTFLAG	# SET INTEGRATION VEHICLE EQ LM
// PORT: Fixed ROM slots 31339.
    31339, 1912,
// PORT: SOURCE P20-P25.agc:1057
//			INTEGRV
// PORT: Fixed ROM slots 31340.
    31340, 23780,
// PORT: SOURCE P20-P25.agc:1058
//		CALL
// PORT: Fixed ROM slots 31341.
    31341, 65320,
// PORT: SOURCE P20-P25.agc:1059
//			GRP2PC		# PHASE CHANGE
// PORT: Fixed ROM slots 31342.
    31342, 48080,
// PORT: SOURCE P20-P25.agc:1060
//		CALL
// PORT: Fixed ROM slots 31343.
    31343, 65320,
// PORT: SOURCE P20-P25.agc:1061
//			SETINTG		# SET FLAGS FOR INTEGRATION
// PORT: Fixed ROM slots 31344.
    31344, 47558,
// PORT: SOURCE P20-P25.agc:1062
//		GOTO
// PORT: Fixed ROM slots 31345.
    31345, 65360,
// PORT: SOURCE P20-P25.agc:1063
//			REND5
// PORT: Fixed ROM slots 31346.
    31346, 58290,
// PORT: SOURCE P20-P25.agc:1064
//REND14		STOVL	BVECTOR		# VHF RADAR BVECTOR
// PORT: Fixed ROM slots 31347.
    31347, 24196,
// PORT: SOURCE P20-P25.agc:1065
//			ZEROVECS
// PORT: Fixed ROM slots 31348.
    31348, 13754,
// PORT: SOURCE P20-P25.agc:1066
//		STORE	BVECTOR +6
// PORT: Fixed ROM slots 31349.
    31349, 3728,
// PORT: SOURCE P20-P25.agc:1067
//		STOVL	BVECTOR +12D
// PORT: Fixed ROM slots 31350.
    31350, 24220,
// PORT: SOURCE P20-P25.agc:1068
//			RCLP
// PORT: Fixed ROM slots 31351.
    31351, 3762,
// PORT: SOURCE P20-P25.agc:1069
//		UNIT	DLOAD
// PORT: Fixed ROM slots 31352.
    31352, 58716,
// PORT: SOURCE P20-P25.agc:1070
//			VHFRANGE	# VHFRANGE SCALED B-27
// PORT: Fixed ROM slots 31353.
    31353, 1374,
// PORT: SOURCE P20-P25.agc:1071
//		BON	SR2
// PORT: Fixed ROM slots 31354.
    31354, 49688,
// PORT: SOURCE P20-P25.agc:1072
//			MOONTHIS
// PORT: Fixed ROM slots 31355.
    31355, 4486,
// PORT: SOURCE P20-P25.agc:1073
//			+1
// PORT: Fixed ROM slots 31356.
    31356, 58618,
// PORT: SOURCE P20-P25.agc:1074
//		DSU	SET
// PORT: Fixed ROM slots 31357.
    31357, 35882,
// PORT: SOURCE P20-P25.agc:1075
//			36D		# ABVAL (RCLP)
// PORT: Fixed ROM slots 31358.
    31358, 74,
// PORT: SOURCE P20-P25.agc:1076
//			INCORFLG
// PORT: Fixed ROM slots 31359.
    31359, 2664,
// PORT: SOURCE P20-P25.agc:1077
//		STORE	DELTAQ
// PORT: Fixed ROM slots 31360.
    31360, 3752,
// PORT: SOURCE P20-P25.agc:1078
//		BOFF	VLOAD
// PORT: Fixed ROM slots 31361.
    31361, 64792,
// PORT: SOURCE P20-P25.agc:1079
//			VEHUPFLG
// PORT: Fixed ROM slots 31362.
    31362, 974,
// PORT: SOURCE P20-P25.agc:1080
//			REND14A
// PORT: Fixed ROM slots 31363.
    31363, 58638,
// PORT: SOURCE P20-P25.agc:1081
//# Page 584
// PORT: SOURCE P20-P25.agc:1082
//			BVECTOR
// PORT: Fixed ROM slots 31364.
    31364, 3716,
// PORT: SOURCE P20-P25.agc:1083
//		VCOMP
// PORT: Fixed ROM slots 31365.
    31365, 65404,
// PORT: SOURCE P20-P25.agc:1084
//		STORE	BVECTOR
// PORT: Fixed ROM slots 31366.
    31366, 3716,
// PORT: SOURCE P20-P25.agc:1085
//REND14A		CALL
// PORT: Fixed ROM slots 31367.
    31367, 65320,
// PORT: SOURCE P20-P25.agc:1086
//			GRP2PC
// PORT: Fixed ROM slots 31368.
    31368, 48080,
// PORT: SOURCE P20-P25.agc:1087
//		DLOAD	GOTO
// PORT: Fixed ROM slots 31369.
    31369, 43210,
// PORT: SOURCE P20-P25.agc:1088
//			RVAR
// PORT: Fixed ROM slots 31370.
    31370, 3078,
// PORT: SOURCE P20-P25.agc:1089
//			REND10
// PORT: Fixed ROM slots 31371.
    31371, 58414,
// PORT: SOURCE P20-P25.agc:1090
//REND15		SLOAD	DAD		# GET ALT LOS VARIANCE
// PORT: Fixed ROM slots 31372.
    31372, 36282,
// PORT: SOURCE P20-P25.agc:1091
//			ALTVAR		# BACKUP OPTICS
// PORT: Fixed ROM slots 31373.
    31373, 1502,
// PORT: SOURCE P20-P25.agc:1092
//			IMUVAR		# IMU VARIANCE
// PORT: Fixed ROM slots 31374.
    31374, 26048,
// PORT: SOURCE P20-P25.agc:1093
//		GOTO
// PORT: Fixed ROM slots 31375.
    31375, 65360,
// PORT: SOURCE P20-P25.agc:1094
//			REND10
// PORT: Fixed ROM slots 31376.
    31376, 58414,
// PORT: SOURCE P20-P25.agc:1095
//REND16		LXA,1	INCR,1
// PORT: Fixed ROM slots 31377.
    31377, 51408,
// PORT: SOURCE P20-P25.agc:1096
//			VHFCNT		# VHF RADAR UPDATE COUNT
// PORT: Fixed ROM slots 31378.
    31378, 1194,
// PORT: SOURCE P20-P25.agc:1097
//		DEC	1
// PORT: Fixed ROM slots 31379.
    31379, 2,
// PORT: SOURCE P20-P25.agc:1098
//		SXA,1	GOTO
// PORT: Fixed ROM slots 31380.
    31380, 43184,
// PORT: SOURCE P20-P25.agc:1099
//			VHFCNT		# UPDATE COUNT
// PORT: Fixed ROM slots 31381.
    31381, 1194,
// PORT: SOURCE P20-P25.agc:1100
//			REND1
// PORT: Fixed ROM slots 31382.
    31382, 58178,
// PORT: SOURCE P20-P25.agc:1101
//REND17		LXA,1	INCR,1
// PORT: Fixed ROM slots 31383.
    31383, 51408,
// PORT: SOURCE P20-P25.agc:1102
//			TRKMKCNT	# OPTICS MARK COUNT
// PORT: Fixed ROM slots 31384.
    31384, 1196,
// PORT: SOURCE P20-P25.agc:1103
//		DEC	1
// PORT: Fixed ROM slots 31385.
    31385, 2,
// PORT: SOURCE P20-P25.agc:1104
//		SXA,1	GOTO
// PORT: Fixed ROM slots 31386.
    31386, 43184,
// PORT: SOURCE P20-P25.agc:1105
//			TRKMKCNT	# UPDATE COUNT
// PORT: Fixed ROM slots 31387.
    31387, 1196,
// PORT: SOURCE P20-P25.agc:1106
//			REND3
// PORT: Fixed ROM slots 31388.
    31388, 58230,
// PORT: SOURCE P20-P25.agc:1107
//REND18		CALL
// PORT: Fixed ROM slots 31389.
    31389, 65320,
// PORT: SOURCE P20-P25.agc:1108
//			CMPOS		# GET CSM POSITION
// PORT: Fixed ROM slots 31390.
    31390, 58690,
// PORT: SOURCE P20-P25.agc:1109
//		GOTO
// PORT: Fixed ROM slots 31391.
    31391, 65360,
// PORT: SOURCE P20-P25.agc:1110
//			REND13
// PORT: Fixed ROM slots 31392.
    31392, 58562,
// PORT: SOURCE P20-P25.agc:1111
//CMPOS		VLOAD	VSR*
// PORT: Fixed ROM slots 31393.
    31393, 45050,
// PORT: SOURCE P20-P25.agc:1112
//			DELTACSM
// PORT: Fixed ROM slots 31394.
    31394, 1782,
// PORT: SOURCE P20-P25.agc:1113
//			7,2
// PORT: Fixed ROM slots 31395.
    31395, 48366,
// PORT: SOURCE P20-P25.agc:1114
//		VAD
// PORT: Fixed ROM slots 31396.
    31396, 65370,
// PORT: SOURCE P20-P25.agc:1115
//			RCVCSM
// PORT: Fixed ROM slots 31397.
    31397, 1806,
// PORT: SOURCE P20-P25.agc:1116
//		STORE	CSMPOS		# CSM POSITION SCALED B-27 OR B-29
// PORT: Fixed ROM slots 31398.
    31398, 1294,
// PORT: SOURCE P20-P25.agc:1117
//		RVQ
// PORT: Fixed ROM slots 31399.
    31399, 65308,
// PORT: SOURCE P20-P25.agc:1118
//LMPOS		VLOAD	VSR*
// PORT: Fixed ROM slots 31400.
    31400, 45050,
// PORT: SOURCE P20-P25.agc:1119
//			DELTALEM
// PORT: Fixed ROM slots 31401.
    31401, 1866,
// PORT: SOURCE P20-P25.agc:1120
//			7,2
// PORT: Fixed ROM slots 31402.
    31402, 48366,
// PORT: SOURCE P20-P25.agc:1121
//		VAD
// PORT: Fixed ROM slots 31403.
    31403, 65370,
// PORT: SOURCE P20-P25.agc:1122
//			RCVLEM
// PORT: Fixed ROM slots 31404.
    31404, 1890,
// PORT: SOURCE P20-P25.agc:1123
//		STORE	LEMPOS		# LM POSITION SCALED B-27 OR B-29
// PORT: Fixed ROM slots 31405.
    31405, 1306,
// PORT: SOURCE P20-P25.agc:1124
//		RVQ
// PORT: Fixed ROM slots 31406.
    31406, 65308,
// PORT: SOURCE P20-P25.agc:1125
//RENDISP		EXIT
// PORT: Fixed ROM slots 31407.
    31407, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31408–31418.
function agcAotUnit1780 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31412 {
        if slot <= 31409 {
            if slot <= 31408 {
// PORT: SOURCE P20-P25.agc:1126
//		CA	FLAGWRD9
// PORT: Fixed ROM slots 31408.
                if slot <> 31408 or instruction <> 12357 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1127
//		MASK	SOURCBIT
// PORT: Fixed ROM slots 31409.
                if slot <> 31409 or instruction <> 31240 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2568), 32768).
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
            if slot <= 31410 {
// PORT: SOURCE P20-P25.agc:1128
//		EXTEND
// PORT: Fixed ROM slots 31410.
                if slot <> 31410 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31411 {
// PORT: SOURCE P20-P25.agc:1129
//		BZF	+3
// PORT: Fixed ROM slots 31411.
                    if slot <> 31411 or instruction <> 5814 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5814, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1130
//		CA	BIT2
// PORT: Fixed ROM slots 31412.
                    if slot <> 31412 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31415 {
            if slot <= 31413 {
// PORT: SOURCE P20-P25.agc:1131
//		TC	+2
// PORT: Fixed ROM slots 31413.
                if slot <> 31413 or instruction <> 1719 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1719, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31414 {
// PORT: SOURCE P20-P25.agc:1132
//# Page 585
// PORT: SOURCE P20-P25.agc:1133
//		CA	BIT1
// PORT: Fixed ROM slots 31414.
                    if slot <> 31414 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1134
//		TS	N49DISP +4
// PORT: Fixed ROM slots 31415.
                    if slot <> 31415 or instruction <> 23365 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23365, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31416 {
// PORT: SOURCE P20-P25.agc:1135
//		CAF	ZERO		# SET TEMPOR1 > ZERO TO INDICATE
// PORT: Fixed ROM slots 31416.
                if slot <> 31416 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31417 {
// PORT: SOURCE P20-P25.agc:1136
//		TS	TEMPOR1		# V06 N49 DISPLAY HASN'T BEEN ANSWERED
// PORT: Fixed ROM slots 31417.
                    if slot <> 31417 or instruction <> 23232 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23232, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1137
//		TC	PHASCHNG
// PORT: Fixed ROM slots 31418.
                    if slot <> 31418 or instruction <> 2826 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1780] to agcAotUnit1780@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1138
//		OCT	04022
// PORT: Fixed ROM slots 31419.
    31419, 4132
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31420–31421.
function agcAotUnit1781 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31420 {
// PORT: SOURCE P20-P25.agc:1139
//		CAF	PRIO27		# SET UP DISPLAY JOB WITH HIGHER PRIORITY
// PORT: Fixed ROM slots 31420.
        if slot <> 31420 or instruction <> 16308 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4020), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1140
//		TC	NOVAC
// PORT: Fixed ROM slots 31421.
        if slot <> 31421 or instruction <> 2652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1781] to agcAotUnit1781@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1141
//		EBANK=	MRKBUF1		# THAN PRESENT JOB
// PORT: SOURCE P20-P25.agc:1142
//		2CADR	RENDISP2
// PORT: Fixed ROM slots 31422 31423.
    31422, 3472, 31423, 57454
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31424–31424.
function agcAotUnit1782 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1143
//
// PORT: SOURCE P20-P25.agc:1144
//RENDISP7	TC	INTPRET
// PORT: Fixed ROM slots 31424.
    if slot <> 31424 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1782] to agcAotUnit1782@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1145
//		STORE	MPAC
// PORT: Fixed ROM slots 31425.
    31425, 218,
// PORT: SOURCE P20-P25.agc:1146
//		SLOAD	BZE
// PORT: Fixed ROM slots 31426.
    31426, 44218,
// PORT: SOURCE P20-P25.agc:1147
//			TEMPOR1
// PORT: Fixed ROM slots 31427.
    31427, 1410,
// PORT: SOURCE P20-P25.agc:1148
//			RENDISP7 +1	# DISPLAY HAS NOT BEEN ANSWERED YET
// PORT: Fixed ROM slots 31428.
    31428, 58754,
// PORT: SOURCE P20-P25.agc:1149
//		BMN	GOTO
// PORT: Fixed ROM slots 31429.
    31429, 43072,
// PORT: SOURCE P20-P25.agc:1150
//			REND12		# NEG INDICATES PROCEED
// PORT: Fixed ROM slots 31430.
    31430, 58536,
// PORT: SOURCE P20-P25.agc:1151
//			RENDISP3	# POS INDICATES RECYCLE
// PORT: Fixed ROM slots 31431.
    31431, 58782
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31432–31433.
function agcAotUnit1783 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31432 {
// PORT: SOURCE P20-P25.agc:1152
//RENDISP2	CAF	V06N49
// PORT: Fixed ROM slots 31432.
        if slot <> 31432 or instruction <> 14049 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1761), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1153
//		TC	BANKCALL
// PORT: Fixed ROM slots 31433.
        if slot <> 31433 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1783] to agcAotUnit1783@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1154
//		CADR	PRIODSP
// PORT: Fixed ROM slots 31434.
    31434, 17330
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31435–31438.
function agcAotUnit1784 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31436 {
        if slot <= 31435 {
// PORT: SOURCE P20-P25.agc:1155
//		TC	GOTOV56		# TERM EXIT P20 VIA V56
// PORT: Fixed ROM slots 31435.
            if slot <> 31435 or instruction <> 2450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2450, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1156
//		CS	ONE		# NEG INDICATES PROCEED RENDISP7 JOB
// PORT: Fixed ROM slots 31436.
            if slot <> 31436 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31437 {
// PORT: SOURCE P20-P25.agc:1157
//		TS	TEMPOR1		# POS INDICATES RECYCLE RENDISP7 JOB
// PORT: Fixed ROM slots 31437.
            if slot <> 31437 or instruction <> 23232 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23232, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1158
//		TC	ENDOFJOB	# GO COMPLETE ABOVE JOB
// PORT: Fixed ROM slots 31438.
            if slot <> 31438 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1784] to agcAotUnit1784@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1159
//RENDISP3	BON
// PORT: Fixed ROM slots 31439.
    31439, 65304,
// PORT: SOURCE P20-P25.agc:1160
//			SOURCFLG
// PORT: Fixed ROM slots 31440.
    31440, 5006,
// PORT: SOURCE P20-P25.agc:1161
//			REND1		# DATA WAS RADAR GO LOOK FOR OPTICS NEXT
// PORT: Fixed ROM slots 31441.
    31441, 58178,
// PORT: SOURCE P20-P25.agc:1162
//		EXIT
// PORT: Fixed ROM slots 31442.
    31442, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31443–31450.
function agcAotUnit1785 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31446 {
        if slot <= 31444 {
            if slot <= 31443 {
// PORT: SOURCE P20-P25.agc:1163
//		EBANK=	MRKBUF1
// PORT: SOURCE P20-P25.agc:1164
//		INHINT
// PORT: Fixed ROM slots 31443.
                if slot <> 31443 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1165
//		CAF	BUFBANK
// PORT: Fixed ROM slots 31444.
                if slot <> 31444 or instruction <> 14050 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1762), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31445 {
// PORT: SOURCE P20-P25.agc:1166
//		TS	BBANK
// PORT: Fixed ROM slots 31445.
                if slot <> 31445 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1167
//		CA	NEGONE
// PORT: Fixed ROM slots 31446.
                if slot <> 31446 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31448 {
            if slot <= 31447 {
// PORT: SOURCE P20-P25.agc:1168
//		TS	MRKBUF1		# ERASE MARK ONE BUFFER
// PORT: Fixed ROM slots 31447.
                if slot <> 31447 or instruction <> 23509 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23509, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1169
//		TS	MRKBUF2		# ERASE MARK TWO BUFFER
// PORT: Fixed ROM slots 31448.
                if slot <> 31448 or instruction <> 23516 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23516, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31449 {
// PORT: SOURCE P20-P25.agc:1170
//		RELINT
// PORT: Fixed ROM slots 31449.
                if slot <> 31449 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1171
//RENDISP4	TC	INTPRET
// PORT: Fixed ROM slots 31450.
                if slot <> 31450 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1785] to agcAotUnit1785@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1172
//		GOTO
// PORT: Fixed ROM slots 31451.
    31451, 65360,
// PORT: SOURCE P20-P25.agc:1173
//			REND3
// PORT: Fixed ROM slots 31452.
    31452, 58230,
// PORT: SOURCE P20-P25.agc:1174
//SXTVAR		2DEC	0.04 E-6 B+16	# SXT ERROR VARIANCE = .04 (MR)SQ
// PORT: Fixed ROM slots 31453 31454.
    31453, 84, 31454, 31118,
// PORT: SOURCE P20-P25.agc:1175
//
// PORT: SOURCE P20-P25.agc:1176
//IMUVAR		2DEC	0.04 E-6 B+16	# IMU ERROR VARIANCE = .04 (MR)SQ
// PORT: Fixed ROM slots 31455 31456.
    31455, 84, 31456, 31118,
// PORT: SOURCE P20-P25.agc:1177
//
// PORT: SOURCE P20-P25.agc:1178
//V06N49		VN	0649
// PORT: Fixed ROM slots 31457.
    31457, 1634,
// PORT: SOURCE P20-P25.agc:1179
//		EBANK=	MRKBUF1
// PORT: SOURCE P20-P25.agc:1180
//BUFBANK		BBCON	RENDISP3
// PORT: Fixed ROM slots 31458.
    31458, 57454,
// PORT: SOURCE P20-P25.agc:1181
//		BANK	31
// PORT: SOURCE P20-P25.agc:1182
//		SETLOC	R22S1
// PORT: SOURCE P20-P25.agc:1183
//# Page 586
// PORT: SOURCE P20-P25.agc:1184
//		BANK
// PORT: SOURCE P20-P25.agc:1185
//SETINTG		STQ	CALL
// PORT: Fixed ROM slots 25827.
    25827, 37920,
// PORT: SOURCE P20-P25.agc:1186
//			EGRESS
// PORT: Fixed ROM slots 25828.
    25828, 2462,
// PORT: SOURCE P20-P25.agc:1187
//			INTSTALL	# RESERVE INTEGRATION
// PORT: Fixed ROM slots 25829.
    25829, 24132,
// PORT: SOURCE P20-P25.agc:1188
//		DLOAD	SET
// PORT: Fixed ROM slots 25830.
    25830, 36042,
// PORT: SOURCE P20-P25.agc:1189
//			MARKTIME
// PORT: Fixed ROM slots 25831.
    25831, 1322,
// PORT: SOURCE P20-P25.agc:1190
//			STATEFLG
// PORT: Fixed ROM slots 25832.
    25832, 1652,
// PORT: SOURCE P20-P25.agc:1191
//		STORE	TDEC1		# MARKTIME
// PORT: Fixed ROM slots 25833.
    25833, 66,
// PORT: SOURCE P20-P25.agc:1192
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 25834.
    25834, 35864,
// PORT: SOURCE P20-P25.agc:1193
//			INTYPFLG	# PRECISION INTEGRATION
// PORT: Fixed ROM slots 25835.
    25835, 1910,
// PORT: SOURCE P20-P25.agc:1194
//			DIM0FLAG
// PORT: Fixed ROM slots 25836.
    25836, 1916,
// PORT: SOURCE P20-P25.agc:1195
//		SET	CLRGO
// PORT: Fixed ROM slots 25837.
    25837, 35864,
// PORT: SOURCE P20-P25.agc:1196
//			VINTFLAG	# SET VEHICLE EQ. CSM
// PORT: Fixed ROM slots 25838.
    25838, 1656,
// PORT: SOURCE P20-P25.agc:1197
//			D6OR9FLG	# SET W MATRIX DIM. EQ 6
// PORT: Fixed ROM slots 25839.
    25839, 1850,
// PORT: SOURCE P20-P25.agc:1198
//			EGRESS		# EXIT
// PORT: Fixed ROM slots 25840.
    25840, 2462,
// PORT: SOURCE P20-P25.agc:1199
//CNTCHK		STQ
// PORT: Fixed ROM slots 25841.
    25841, 65312,
// PORT: SOURCE P20-P25.agc:1200
//			POINTEX
// PORT: Fixed ROM slots 25842.
    25842, 1232,
// PORT: SOURCE P20-P25.agc:1201
//CONTCHK		BOFF
// PORT: Fixed ROM slots 25843.
    25843, 65304,
// PORT: SOURCE P20-P25.agc:1202
//			REFSMFLG	# BRANCH TO END OF JOB IF REFSMMAT NO GOOD
// PORT: Fixed ROM slots 25844.
    25844, 1988,
// PORT: SOURCE P20-P25.agc:1203
//			ENDPLAC
// PORT: Fixed ROM slots 25845.
    25845, 24796,
// PORT: SOURCE P20-P25.agc:1204
//		SLOAD	BMN
// PORT: Fixed ROM slots 25846.
    25846, 41146,
// PORT: SOURCE P20-P25.agc:1205
//			R61CNTR
// PORT: Fixed ROM slots 25847.
    25847, 3580,
// PORT: SOURCE P20-P25.agc:1206
//			WAITONE1
// PORT: Fixed ROM slots 25848.
    25848, 47628,
// PORT: SOURCE P20-P25.agc:1207
//		BON	BOFF		# IS TRACK FLAG SET
// PORT: Fixed ROM slots 25849.
    25849, 35864,
// PORT: SOURCE P20-P25.agc:1208
//			UPDATFLG
// PORT: Fixed ROM slots 25850.
    25850, 912,
// PORT: SOURCE P20-P25.agc:1209
//			POINTEX
// PORT: Fixed ROM slots 25851.
    25851, 1232,
// PORT: SOURCE P20-P25.agc:1210
//			TRACKFLG
// PORT: Fixed ROM slots 25852.
    25852, 980,
// PORT: SOURCE P20-P25.agc:1211
//			ENDPLAC
// PORT: Fixed ROM slots 25853.
    25853, 24796,
// PORT: SOURCE P20-P25.agc:1212
//		EXIT
// PORT: Fixed ROM slots 25854.
    25854, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25855–25855.
function agcAotUnit1498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1213
//REDOR22		TC	PHASCHNG
// PORT: Fixed ROM slots 25855.
    if slot <> 25855 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1498] to agcAotUnit1498@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1214
//		OCT	00132
// PORT: Fixed ROM slots 25856.
    25856, 180
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25857–25859.
function agcAotUnit1499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25857 {
// PORT: SOURCE P20-P25.agc:1215
//		CAF	PRIO26
// PORT: Fixed ROM slots 25857.
        if slot <> 25857 or instruction <> 16307 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4019), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 25858 {
// PORT: SOURCE P20-P25.agc:1216
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 25858.
            if slot <> 25858 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1217
//		TC	WAITONE +3
// PORT: Fixed ROM slots 25859.
            if slot <> 25859 or instruction <> 1287 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1287, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1499] to agcAotUnit1499@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1218
//WAITONE		STQ
// PORT: Fixed ROM slots 25860.
    25860, 65312,
// PORT: SOURCE P20-P25.agc:1219
//			POINTEX
// PORT: Fixed ROM slots 25861.
    25861, 1232,
// PORT: SOURCE P20-P25.agc:1220
//WAITONE1	EXIT
// PORT: Fixed ROM slots 25862.
    25862, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25863–25864.
function agcAotUnit1500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25863 {
// PORT: SOURCE P20-P25.agc:1221
//		CAF	4SECS		# WAIT 4 SECS.
// PORT: Fixed ROM slots 25863.
        if slot <> 25863 or instruction <> 14885 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2597), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1222
//		TC	BANKCALL
// PORT: Fixed ROM slots 25864.
        if slot <> 25864 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1500] to agcAotUnit1500@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1223
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 25865.
    25865, 1972
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25866–25866.
function agcAotUnit1501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1224
//		TC	INTPRET
// PORT: Fixed ROM slots 25866.
    if slot <> 25866 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1501] to agcAotUnit1501@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1225
//		GOTO
// PORT: Fixed ROM slots 25867.
    25867, 65360,
// PORT: SOURCE P20-P25.agc:1226
//			CONTCHK		# CHECK AGAIN NOW
// PORT: Fixed ROM slots 25868.
    25868, 47590,
// PORT: SOURCE P20-P25.agc:1227
//RANGERD		EXIT
// PORT: Fixed ROM slots 25869.
    25869, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25870–25881.
function agcAotUnit1502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25875 {
        if slot <= 25872 {
            if slot <= 25870 {
// PORT: SOURCE P20-P25.agc:1228
//		INHINT
// PORT: Fixed ROM slots 25870.
                if slot <> 25870 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25871 {
// PORT: SOURCE P20-P25.agc:1229
//		CS	OCT17
// PORT: Fixed ROM slots 25871.
                    if slot <> 25871 or instruction <> 17728 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1344), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1230
//		EXTEND
// PORT: Fixed ROM slots 25872.
                    if slot <> 25872 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25873 {
// PORT: SOURCE P20-P25.agc:1231
//		WAND 	CHAN13		# ZERO OUT BITS 1-4 OF CHANNEL 13
// PORT: Fixed ROM slots 25873.
                if slot <> 25873 or instruction <> 1547 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25874 {
// PORT: SOURCE P20-P25.agc:1232
//		CAF	OCT11
// PORT: Fixed ROM slots 25874.
                    if slot <> 25874 or instruction <> 14556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1233
//		EXTEND
// PORT: Fixed ROM slots 25875.
                    if slot <> 25875 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25878 {
            if slot <= 25876 {
// PORT: SOURCE P20-P25.agc:1234
//# Page 587
// PORT: SOURCE P20-P25.agc:1235
//		WOR	CHAN13		# GENERAGE SHIFT PULSES TO RADR, SET R. BIT
// PORT: Fixed ROM slots 25876.
                if slot <> 25876 or instruction <> 2571 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25877 {
// PORT: SOURCE P20-P25.agc:1236
//		RELINT
// PORT: Fixed ROM slots 25877.
                    if slot <> 25877 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1237
//		EXTEND
// PORT: Fixed ROM slots 25878.
                    if slot <> 25878 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25879 {
// PORT: SOURCE P20-P25.agc:1238
//		DCA	TIME2
// PORT: Fixed ROM slots 25879.
                if slot <> 25879 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25880 {
// PORT: SOURCE P20-P25.agc:1239
//		DXCH	MARKTIME	# READ PRESENT TIME
// PORT: Fixed ROM slots 25880.
                    if slot <> 25880 or instruction <> 22165 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 661, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1240
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 25881.
                    if slot <> 25881 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1502] to agcAotUnit1502@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1241
//		ADRES	SKIPVHF
// PORT: Fixed ROM slots 25882.
    25882, 70
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25883–25883.
function agcAotUnit1503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1242
//		TC	BANKCALL
// PORT: Fixed ROM slots 25883.
    if slot <> 25883 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1503] to agcAotUnit1503@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1243
//		CADR	RADSTALL	# WAIT FOR RANGE COMPLETE
// PORT: Fixed ROM slots 25884.
    25884, 16122
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25885–25892.
function agcAotUnit1504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25888 {
        if slot <= 25886 {
            if slot <= 25885 {
// PORT: SOURCE P20-P25.agc:1244
//		TC	LIGHTON		# BAD DATA GOOD BIT
// PORT: Fixed ROM slots 25885.
                if slot <> 25885 or instruction <> 1332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1332, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1245
//		TC	TRFAILOF	# TURN TRACKER LIGHT OFF
// PORT: Fixed ROM slots 25886.
                if slot <> 25886 or instruction <> 2969 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2969, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25887 {
// PORT: SOURCE P20-P25.agc:1246
//RANGERD1	CCS	RM		# 15 BIT UNSIGNED RANGE
// PORT: Fixed ROM slots 25887.
                if slot <> 25887 or instruction <> 5059 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 963).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1247
//		TC	RANGERD4	# GR + 0
// PORT: Fixed ROM slots 25888.
                if slot <> 25888 or instruction <> 1316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1316, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25890 {
            if slot <= 25889 {
// PORT: SOURCE P20-P25.agc:1248
//		TC	LIGHTON	+4	# = + 0
// PORT: Fixed ROM slots 25889.
                if slot <> 25889 or instruction <> 1336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1336, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1249
//		TC	RANGERD3	# L - 0
// PORT: Fixed ROM slots 25890.
                if slot <> 25890 or instruction <> 1323 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1323, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25891 {
// PORT: SOURCE P20-P25.agc:1250
//		TC	RANGERD3	# = - 0
// PORT: Fixed ROM slots 25891.
                if slot <> 25891 or instruction <> 1323 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1323, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1251
//RANGERD4	TC	INTPRET
// PORT: Fixed ROM slots 25892.
                if slot <> 25892 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1504] to agcAotUnit1504@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1252
//		SLOAD	DMP
// PORT: Fixed ROM slots 25893.
    25893, 34234,
// PORT: SOURCE P20-P25.agc:1253
//			RM
// PORT: Fixed ROM slots 25894.
    25894, 3976,
// PORT: SOURCE P20-P25.agc:1254
//			CONVRNGE	# CONVERT RANGE TO METERS B-27
// PORT: Fixed ROM slots 25895.
    25895, 14982,
// PORT: SOURCE P20-P25.agc:1255
//RANGERD2	STORE	VHFRANGE
// PORT: Fixed ROM slots 25896.
    25896, 1374,
// PORT: SOURCE P20-P25.agc:1256
//		SET	RVQ
// PORT: Fixed ROM slots 25897.
    25897, 36376,
// PORT: SOURCE P20-P25.agc:1257
//			SOURCFLG	# SOURCE OF DATA TO VHF RADAR
// PORT: Fixed ROM slots 25898.
    25898, 4718
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25899–25902.
function agcAotUnit1505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25900 {
        if slot <= 25899 {
// PORT: SOURCE P20-P25.agc:1258
//RANGERD3	CA	RM
// PORT: Fixed ROM slots 25899.
            if slot <> 25899 or instruction <> 13251 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 963).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1259
//		MASK	POSMAX
// PORT: Fixed ROM slots 25900.
            if slot <> 25900 or instruction <> 31231 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                if fixedOperand = 16383 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 16384) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25901 {
// PORT: SOURCE P20-P25.agc:1260
//		TS	MPAC		# MASK OUT NEG. SIGN BIT
// PORT: Fixed ROM slots 25901.
            if slot <> 25901 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1261
//		TC	INTPRET
// PORT: Fixed ROM slots 25902.
            if slot <> 25902 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1505] to agcAotUnit1505@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1262
//		DMP
// PORT: Fixed ROM slots 25903.
    25903, 65290,
// PORT: SOURCE P20-P25.agc:1263
//			CONVRNGE	# CONVERT FROM NM TO METERS AND SCALE B-27
// PORT: Fixed ROM slots 25904.
    25904, 14982,
// PORT: SOURCE P20-P25.agc:1264
//		DAD	GOTO
// PORT: Fixed ROM slots 25905.
    25905, 43034,
// PORT: SOURCE P20-P25.agc:1265
//			RANGEB14	# VALUE IN METERS OF SIGN BIT SCALED B-27
// PORT: Fixed ROM slots 25906.
    25906, 14974,
// PORT: SOURCE P20-P25.agc:1266
//			RANGERD2
// PORT: Fixed ROM slots 25907.
    25907, 47696
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25908–25912.
function agcAotUnit1506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25909 {
        if slot <= 25908 {
// PORT: SOURCE P20-P25.agc:1267
//LIGHTON		CA	VHFRANGE
// PORT: Fixed ROM slots 25908.
            if slot <> 25908 or instruction <> 12974 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 686).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1268
//		EXTEND
// PORT: Fixed ROM slots 25909.
            if slot <> 25909 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25910 {
// PORT: SOURCE P20-P25.agc:1269
//		BZF	+2
// PORT: Fixed ROM slots 25910.
            if slot <> 25910 or instruction <> 5432 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5432, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25911 {
// PORT: SOURCE P20-P25.agc:1270
//		TC	TRFAILON
// PORT: Fixed ROM slots 25911.
                if slot <> 25911 or instruction <> 2979 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2979, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1271
//		TC	INTPRET
// PORT: Fixed ROM slots 25912.
                if slot <> 25912 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1506] to agcAotUnit1506@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1272
//		DLOAD
// PORT: Fixed ROM slots 25913.
    25913, 65482,
// PORT: SOURCE P20-P25.agc:1273
//			MARKTIME
// PORT: Fixed ROM slots 25914.
    25914, 1322,
// PORT: SOURCE P20-P25.agc:1274
//		STORE	VHFTIME
// PORT: Fixed ROM slots 25915.
    25915, 1236,
// PORT: SOURCE P20-P25.agc:1275
//		GOTO
// PORT: Fixed ROM slots 25916.
    25916, 65360,
// PORT: SOURCE P20-P25.agc:1276
//			REND1
// PORT: Fixed ROM slots 25917.
    25917, 58178,
// PORT: SOURCE P20-P25.agc:1277
//RANGEB14	2DEC	303431.7 B-27	# 16384 X 18.52 SCALED B-27
// PORT: Fixed ROM slots 25918 25919.
    25918, 74, 25919, 1310,
// PORT: SOURCE P20-P25.agc:1278
//
// PORT: SOURCE P20-P25.agc:1279
//OCT17		OCT	00017
// PORT: Fixed ROM slots 25920.
    25920, 30,
// PORT: SOURCE P20-P25.agc:1280
//OC40200		OCT	40200
// PORT: Fixed ROM slots 25921.
    25921, 33024,
// PORT: SOURCE P20-P25.agc:1281
//CONVRNGE	2DEC	18.52 B-13	# VHF INPUT RANGE CONV. FROM .01 NM TO M
// PORT: Fixed ROM slots 25922 25923.
    25922, 74, 25923, 1310
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25924–25952.
function agcAotUnit1507 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25937 {
        if slot <= 25930 {
            if slot <= 25926 {
                if slot <= 25924 {
// PORT: SOURCE P20-P25.agc:1282
//
// PORT: SOURCE P20-P25.agc:1283
//VHFREAD		EXTEND
// PORT: Fixed ROM slots 25924.
                    if slot <> 25924 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 25925 {
// PORT: SOURCE P20-P25.agc:1284
//		ROR	SUPERBNK	# MUST SAVE SBANK BECAUSE OF RUPT
// PORT: Fixed ROM slots 25925.
                        if slot <> 25925 or instruction <> 2055 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1285
//# Page 588
// PORT: SOURCE P20-P25.agc:1286
//		TS	BANKRUPT	# EXITS VIA TASKOVER BADEND OR GOODEND
// PORT: Fixed ROM slots 25926.
                        if slot <> 25926 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 25928 {
                    if slot <= 25927 {
// PORT: SOURCE P20-P25.agc:1287
//		CS	ZERO
// PORT: Fixed ROM slots 25927.
                        if slot <> 25927 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1288
//		TS	RUPTAGN
// PORT: Fixed ROM slots 25928.
                        if slot <> 25928 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 25929 {
// PORT: SOURCE P20-P25.agc:1289
//		EXTEND
// PORT: Fixed ROM slots 25929.
                        if slot <> 25929 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1290
//		QXCH	QRUPT
// PORT: Fixed ROM slots 25930.
                        if slot <> 25930 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 25933 {
                if slot <= 25931 {
// PORT: SOURCE P20-P25.agc:1291
//		CS	STATE	+2
// PORT: Fixed ROM slots 25931.
                    if slot <> 25931 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 25932 {
// PORT: SOURCE P20-P25.agc:1292
//		MASK	SKIPVBIT	# SKIPVHF FLAG
// PORT: Fixed ROM slots 25932.
                        if slot <> 25932 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:1293
//		EXTEND
// PORT: Fixed ROM slots 25933.
                        if slot <> 25933 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 25935 {
                    if slot <= 25934 {
// PORT: SOURCE P20-P25.agc:1294
//		BZF	TASKOVER	# BRANCH IF VHF RESTART BIT SET
// PORT: Fixed ROM slots 25934.
                        if slot <> 25934 or instruction <> 6868 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6868, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1295
//		CAF	UPDATBIT
// PORT: Fixed ROM slots 25935.
                        if slot <> 25935 or instruction <> 14857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 25936 {
// PORT: SOURCE P20-P25.agc:1296
//		MASK	STATE +1	# UPDATEFLG
// PORT: Fixed ROM slots 25936.
                        if slot <> 25936 or instruction <> 28733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1297
//		EXTEND
// PORT: Fixed ROM slots 25937.
                        if slot <> 25937 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 25944 {
            if slot <= 25940 {
                if slot <= 25938 {
// PORT: SOURCE P20-P25.agc:1298
//		BZF	BYPASS1
// PORT: Fixed ROM slots 25938.
                    if slot <> 25938 or instruction <> 5474 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5474, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 25939 {
// PORT: SOURCE P20-P25.agc:1299
//		CS	STATE	+4
// PORT: Fixed ROM slots 25939.
                        if slot <> 25939 or instruction <> 16448 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 64).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1300
//		MASK	PDSPFBIT	# PDSPFLAG
// PORT: Fixed ROM slots 25940.
                        if slot <> 25940 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 25942 {
                    if slot <= 25941 {
// PORT: SOURCE P20-P25.agc:1301
//		EXTEND
// PORT: Fixed ROM slots 25941.
                        if slot <> 25941 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1302
//		BZF	BYPASS1
// PORT: Fixed ROM slots 25942.
                        if slot <> 25942 or instruction <> 5474 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5474, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 25943 {
// PORT: SOURCE P20-P25.agc:1303
//		CA	RNRAD
// PORT: Fixed ROM slots 25943.
                        if slot <> 25943 or instruction <> 12326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 38).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1304
//		TS	RM		# SAVE RANGE
// PORT: Fixed ROM slots 25944.
                        if slot <> 25944 or instruction <> 23491 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23491, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 25948 {
                if slot <= 25946 {
                    if slot <= 25945 {
// PORT: SOURCE P20-P25.agc:1305
//		CAF	BIT2
// PORT: Fixed ROM slots 25945.
                        if slot <> 25945 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1306
//		EXTEND
// PORT: Fixed ROM slots 25946.
                        if slot <> 25946 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 25947 {
// PORT: SOURCE P20-P25.agc:1307
//		RAND	CHAN33		# READ DATA GOOD BIT
// PORT: Fixed ROM slots 25947.
                        if slot <> 25947 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1308
//		EXTEND
// PORT: Fixed ROM slots 25948.
                        if slot <> 25948 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 25950 {
                    if slot <= 25949 {
// PORT: SOURCE P20-P25.agc:1309
//		BZF	VHFGOOD		# BRANCH IF DATA GOOD BIT EQUALS GOOD
// PORT: Fixed ROM slots 25949.
                        if slot <> 25949 or instruction <> 5476 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5476, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1310
//BYPASS		TS	VHFRANGE	# STORE NON ZERO VALUE
// PORT: Fixed ROM slots 25950.
                        if slot <> 25950 or instruction <> 23214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23214, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 25951 {
// PORT: SOURCE P20-P25.agc:1311
//		CAF	TWO
// PORT: Fixed ROM slots 25951.
                        if slot <> 25951 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1312
//		TC	POSTJUMP
// PORT: Fixed ROM slots 25952.
                        if slot <> 25952 or instruction <> 2497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1507] to agcAotUnit1507@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1313
//		CADR	BADEND
// PORT: Fixed ROM slots 25953.
    25953, 16074
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25954–25957.
function agcAotUnit1508 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25955 {
        if slot <= 25954 {
// PORT: SOURCE P20-P25.agc:1314
//BYPASS1		CAF	ZERO
// PORT: Fixed ROM slots 25954.
            if slot <> 25954 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1315
//		TC	BYPASS
// PORT: Fixed ROM slots 25955.
            if slot <> 25955 or instruction <> 1374 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1374, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25956 {
// PORT: SOURCE P20-P25.agc:1316
//VHFGOOD		CAF	TWO
// PORT: Fixed ROM slots 25956.
            if slot <> 25956 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1317
//		TC	POSTJUMP
// PORT: Fixed ROM slots 25957.
            if slot <> 25957 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1508] to agcAotUnit1508@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1318
//		CADR	GOODEND
// PORT: Fixed ROM slots 25958.
    25958, 16080,
// PORT: SOURCE P20-P25.agc:1319
//SHIFTNDX	AXT,2	BON
// PORT: Fixed ROM slots 25959.
    25959, 36088,
// PORT: SOURCE P20-P25.agc:1320
//			0
// PORT: Fixed ROM slots 25960.
    25960, 0,
// PORT: SOURCE P20-P25.agc:1321
//			VEHUPFLG
// PORT: Fixed ROM slots 25961.
    25961, 910,
// PORT: SOURCE P20-P25.agc:1322
//			SHIFTA		# VEHICLE IS CSM
// PORT: Fixed ROM slots 25962.
    25962, 47840,
// PORT: SOURCE P20-P25.agc:1323
//		BON	RVQ
// PORT: Fixed ROM slots 25963.
    25963, 36376,
// PORT: SOURCE P20-P25.agc:1324
//			LMOONFLG
// PORT: Fixed ROM slots 25964.
    25964, 4488,
// PORT: SOURCE P20-P25.agc:1325
//			+1
// PORT: Fixed ROM slots 25965.
    25965, 47836,
// PORT: SOURCE P20-P25.agc:1326
//		INCR,2	RVQ
// PORT: Fixed ROM slots 25966.
    25966, 36504,
// PORT: SOURCE P20-P25.agc:1327
//		DEC	-2
// PORT: Fixed ROM slots 25967.
    25967, 65530,
// PORT: SOURCE P20-P25.agc:1328
//SHIFTA		BON	RVQ
// PORT: Fixed ROM slots 25968.
    25968, 36376,
// PORT: SOURCE P20-P25.agc:1329
//			CMOONFLG
// PORT: Fixed ROM slots 25969.
    25969, 4486,
// PORT: SOURCE P20-P25.agc:1330
//			+1		# MOON ORB.
// PORT: Fixed ROM slots 25970.
    25970, 47846,
// PORT: SOURCE P20-P25.agc:1331
//		INCR,2	RVQ
// PORT: Fixed ROM slots 25971.
    25971, 36504,
// PORT: SOURCE P20-P25.agc:1332
//		DEC	-2
// PORT: Fixed ROM slots 25972.
    25972, 65530,
// PORT: SOURCE P20-P25.agc:1333
//INITIALW	AXT,1	SSP
// PORT: Fixed ROM slots 25973.
    25973, 55792,
// PORT: SOURCE P20-P25.agc:1334
//			36D
// PORT: Fixed ROM slots 25974.
    25974, 72,
// PORT: SOURCE P20-P25.agc:1335
//			S1
// PORT: Fixed ROM slots 25975.
    25975, 82,
// PORT: SOURCE P20-P25.agc:1336
//# Page 589
// PORT: SOURCE P20-P25.agc:1337
//			6
// PORT: Fixed ROM slots 25976.
    25976, 12,
// PORT: SOURCE P20-P25.agc:1338
//		VLOAD
// PORT: Fixed ROM slots 25977.
    25977, 65530,
// PORT: SOURCE P20-P25.agc:1339
//			ZEROVECS
// PORT: Fixed ROM slots 25978.
    25978, 13754,
// PORT: SOURCE P20-P25.agc:1340
//INITA		STORE	W +36D,1	# CLEAR 0 - 35
// PORT: Fixed ROM slots 25979.
    25979, 6730,
// PORT: SOURCE P20-P25.agc:1341
//		TIX,1	AXT,1
// PORT: Fixed ROM slots 25980.
    25980, 63616,
// PORT: SOURCE P20-P25.agc:1342
//			INITA
// PORT: Fixed ROM slots 25981.
    25981, 47862,
// PORT: SOURCE P20-P25.agc:1343
//			36D
// PORT: Fixed ROM slots 25982.
    25982, 72,
// PORT: SOURCE P20-P25.agc:1344
//INITB		STORE	W +90D,1	# CLEAR 54 - 89
// PORT: Fixed ROM slots 25983.
    25983, 6838,
// PORT: SOURCE P20-P25.agc:1345
//		TIX,1	SLOAD
// PORT: Fixed ROM slots 25984.
    25984, 56704,
// PORT: SOURCE P20-P25.agc:1346
//			INITB
// PORT: Fixed ROM slots 25985.
    25985, 47870,
// PORT: SOURCE P20-P25.agc:1347
//			0		# POSITION VALUE
// PORT: Fixed ROM slots 25986.
    25986, 2,
// PORT: SOURCE P20-P25.agc:1348
//		STORE	W		# INITIALIZE DIAGONAL W POSITION
// PORT: Fixed ROM slots 25987.
    25987, 2562,
// PORT: SOURCE P20-P25.agc:1349
//		STORE	W +8D
// PORT: Fixed ROM slots 25988.
    25988, 2578,
// PORT: SOURCE P20-P25.agc:1350
//		STORE	W +16D
// PORT: Fixed ROM slots 25989.
    25989, 2594,
// PORT: SOURCE P20-P25.agc:1351
//		SLOAD
// PORT: Fixed ROM slots 25990.
    25990, 65466,
// PORT: SOURCE P20-P25.agc:1352
//			1		# VELOCITY VALUE
// PORT: Fixed ROM slots 25991.
    25991, 4,
// PORT: SOURCE P20-P25.agc:1353
//		STORE	W +72D		# INITIALIZE DIAGONAL W VELOCITY
// PORT: Fixed ROM slots 25992.
    25992, 2706,
// PORT: SOURCE P20-P25.agc:1354
//		STORE	W +80D
// PORT: Fixed ROM slots 25993.
    25993, 2722,
// PORT: SOURCE P20-P25.agc:1355
//		STORE	W +88D
// PORT: Fixed ROM slots 25994.
    25994, 2738,
// PORT: SOURCE P20-P25.agc:1356
//		RVQ
// PORT: Fixed ROM slots 25995.
    25995, 65308,
// PORT: SOURCE P20-P25.agc:1357
//# Page 590
// PORT: SOURCE P20-P25.agc:1358
//# CRS61.1	R/10/68
// PORT: SOURCE P20-P25.agc:1359
//#
// PORT: SOURCE P20-P25.agc:1360
//# TO COMPUTE THE PREFERRED TRACKING ATTITUDE OF THE CSM WHICH ENABLES
// PORT: SOURCE P20-P25.agc:1361
//# OPTICS TRACKING OF THE LEM AND LM TRACKING OF THE CSM RADAR TRANSPONDER
// PORT: SOURCE P20-P25.agc:1362
//# AND TO COMPUTE THE X-AXIS TRACKING ATTITUDE OF THE CSM WHICH ENABLES
// PORT: SOURCE P20-P25.agc:1363
//# COAS TRACKING OF THE LM.
// PORT: SOURCE P20-P25.agc:1364
//#
// PORT: SOURCE P20-P25.agc:1365
//# TO PERFORM THE MANEUVER TO THE SELECTED TRACKING ATTITUDE IF THE
// PORT: SOURCE P20-P25.agc:1366
//# MANEUVER IS LESS THAN 10 DEGREES BUT TO CALL R60 IF THE MANEUVER IS
// PORT: SOURCE P20-P25.agc:1367
//# GREATER THAN 10 DEGREES BUT TO CALL R60 IF THE MANEUVER IS
// PORT: SOURCE P20-P25.agc:1368
//# GREATER THAN 10 DEGREES OR IF THE R60 FLAG IS SET.
// PORT: SOURCE P20-P25.agc:1369
//#
// PORT: SOURCE P20-P25.agc:1370
//#	(1)	EXTRAPOLATE LM AND CSM STATE VECTORS TO PRESENT TIME USING
// PORT: SOURCE P20-P25.agc:1371
//#		CONIC EQUATIONS.
// PORT: SOURCE P20-P25.agc:1372
//#
// PORT: SOURCE P20-P25.agc:1373
//#	(2)	CALCULATE LOS FROM CSM TO LM = RL - RC.
// PORT: SOURCE P20-P25.agc:1374
//#
// PORT: SOURCE P20-P25.agc:1375
//#	(3)	THE PRERFERRED TRACKING ATTITUDE IS DEFINED AS FOLLOWS:
// PORT: SOURCE P20-P25.agc:1376
//#		THE TRACK AXIS (I) IS ALIGNED ALONG THE LOS TO THE LM.  THE
// PORT: SOURCE P20-P25.agc:1377
//#		TRACK AXIS (I) IS DEFINED AS:
// PORT: SOURCE P20-P25.agc:1378
//#
// PORT: SOURCE P20-P25.agc:1379
//#		UNIT(I)=UNIT(Z  )COS55  &  UNIT(X  )SIN55
// PORT: SOURCE P20-P25.agc:1380
//#		     -       -SC                -SC
// PORT: SOURCE P20-P25.agc:1381
//#
// PORT: SOURCE P20-P25.agc:1382
//#	(4)	COMPUTE DESIRED CDU ANGLES, USING VECPOINT.
// PORT: SOURCE P20-P25.agc:1383
//#
// PORT: SOURCE P20-P25.agc:1384
//# (Sorry, I don't know where (5) and (6) are. --- RSB 2009.)
// PORT: SOURCE P20-P25.agc:1385
//#	(7)	FORM DIFFERENCE BETWEEN DESIRED AND ACTUAL CDUS.
// PORT: SOURCE P20-P25.agc:1386
//#		IF ANY OF THE THREE ANGLE DIFFERENCES EXCEEDS 10 DEGREES,
// PORT: SOURCE P20-P25.agc:1387
//#		GROSS MANEUVER IS REQUIRED.  SIGNAL R61 (SET MPAC=1) TO
// PORT: SOURCE P20-P25.agc:1388
//#		OPERATE KALCMANU AND EXIT CRS61.1.
// PORT: SOURCE P20-P25.agc:1389
//#		IF ALL DIFFERENCES ARE LESS THAN 10 DEGREES, CONTINUE.
// PORT: SOURCE P20-P25.agc:1390
//#
// PORT: SOURCE P20-P25.agc:1391
//#	(8)	CALCULATE ORTHOGONAL LOS RATE IN REF COORDS AS
// PORT: SOURCE P20-P25.agc:1392
//#
// PORT: SOURCE P20-P25.agc:1393
//#		OMEGATH = (UNITLOS(B1) X UNITDV(B1))(ABSDV(B7)/ABSLOS(B29))
// PORT: SOURCE P20-P25.agc:1394
//#
// PORT: SOURCE P20-P25.agc:1395
//#		CONVERSION FACTOR OF 100/2PI (B4) REV CSEC PER RAD SEC IS
// PORT: SOURCE P20-P25.agc:1396
//#		APPLIED TO YIELD UNITS OF REVS/SEC.  SCALE IS CARRIED AS
// PORT: SOURCE P20-P25.agc:1397
//#		B+1+1+7-29+4+1 PLUS RESULTS OF NORMALIZING ABSDV, ABSLOS.
// PORT: SOURCE P20-P25.agc:1398
//#		THE EXTRA B+1 RESULTS FROM RESCALING ABSDV B8 AFTER NORM
// PORT: SOURCE P20-P25.agc:1399
//#		TO AVOID OVFLOW ON DIVIDE.
// PORT: SOURCE P20-P25.agc:1400
//#
// PORT: SOURCE P20-P25.agc:1401
//#		UNITLOS = UNIT( RL - RC ) B1.
// PORT: SOURCE P20-P25.agc:1402
//#		UNITDY  = UNIT( VL - VC ) B1.
// PORT: SOURCE P20-P25.agc:1403
//#		ABSLOS  = LENGTH OF LOS, METERS B29.
// PORT: SOURCE P20-P25.agc:1404
//#		ABSDV   = LENGTH OF DV, METERS/CSEC B7.
// PORT: SOURCE P20-P25.agc:1405
//#
// PORT: SOURCE P20-P25.agc:1406
//#	(9)	OBTAIN RATE IN SM COORDS.
// PORT: SOURCE P20-P25.agc:1407
//#
// PORT: SOURCE P20-P25.agc:1408
//#		OMETATHSM = (REFSMMAT)(OMEGATH).
// PORT: SOURCE P20-P25.agc:1409
//#
// PORT: SOURCE P20-P25.agc:1410
//#	(10)	OBTAIN GIMBAL ANGLE INCREMENTS FOR 0.1 SECOND.
// PORT: SOURCE P20-P25.agc:1411
//#
// PORT: SOURCE P20-P25.agc:1412
//#		DTHETASM = (0.1)(OMEGATHSM)
// PORT: SOURCE P20-P25.agc:1413
//#
// PORT: SOURCE P20-P25.agc:1414
//#	(11)	OBTAIN DELCDUX,Y,Z USING SUBR SMCDURES.
// PORT: SOURCE P20-P25.agc:1415
//# Page 591
// PORT: SOURCE P20-P25.agc:1416
//#		INPUT CONSISTS OF
// PORT: SOURCE P20-P25.agc:1417
//#
// PORT: SOURCE P20-P25.agc:1418
//#		(A)	VECTOR OF ANGULAR INCREMENTS, DTHETASM, STORED
// PORT: SOURCE P20-P25.agc:1419
//#			IN V(DTHETASM).
// PORT: SOURCE P20-P25.agc:1420
//#		(B)	SIN,COS CDUX,Y,Z FROM SUBR CDUTRIG.
// PORT: SOURCE P20-P25.agc:1421
//#
// PORT: SOURCE P20-P25.agc:1422
//#		TRANSFER OUTPUT OF SMCDURES FROM V(DCDU) TO VAC14D.
// PORT: SOURCE P20-P25.agc:1423
//#
// PORT: SOURCE P20-P25.agc:1424
//#	(12)	CALCULATE ANG LOS RATE IN BODY(NB) COORDS USING SUBR SMNB.
// PORT: SOURCE P20-P25.agc:1425
//#
// PORT: SOURCE P20-P25.agc:1426
//#		OMEGANB = (SMNB)(OMETATHSM)
// PORT: SOURCE P20-P25.agc:1427
//#
// PORT: SOURCE P20-P25.agc:1428
//#		SUBR SMNB REQUIRES OMEGATHSM IN V(VAC32D) AND ACTUAL CDUS
// PORT: SOURCE P20-P25.agc:1429
//#		(Y,X,Z ORDER) IN V(VAC20D) WITH S1 OF VAC = BASE ADDRESS
// PORT: SOURCE P20-P25.agc:1430
//#		OF CDUS (FIXLOC + 20D).
// PORT: SOURCE P20-P25.agc:1431
//#
// PORT: SOURCE P20-P25.agc:1432
//#	(13)	CALCULATE ANG LOS RATE IN CONTROL COORDS AS FOLLOWS
// PORT: SOURCE P20-P25.agc:1433
//#
// PORT: SOURCE P20-P25.agc:1434
//#		WBODY = (MBDYTCTL)(OMEGANB)	UNITS=REVS/SEC(B0) (?).
// PORT: SOURCE P20-P25.agc:1435
//#
// PORT: SOURCE P20-P25.agc:1436
//#			       ( 0.5       0              0      )   BODY TO
// PORT: SOURCE P20-P25.agc:1437
//#		MBDYTCTL(B1) = (  0   COS(7.25)B1   -SIN(7.25)B1 ) = CONTROL
// PORT: SOURCE P20-P25.agc:1438
//#			       (  0   SIN(7.25)B1    COS(7.25)B1 )   AXES
// PORT: SOURCE P20-P25.agc:1439
//#								     CONVERSION
// PORT: SOURCE P20-P25.agc:1440
//#								     MATRIX
// PORT: SOURCE P20-P25.agc:1441
//#
// PORT: SOURCE P20-P25.agc:1442
//#	(14)	RESCALE WBODY TO UNITS OF 460 DEG/SEC BY APPLYING FACTOR
// PORT: SOURCE P20-P25.agc:1443
//#		OF 0.8 TO REVS/SEC.
// PORT: SOURCE P20-P25.agc:1444
//#
// PORT: SOURCE P20-P25.agc:1445
//#	(15)	ADDRESS LIVE AUTOPILOT REGISTERS IN BASIC (UNDER INHINT).
// PORT: SOURCE P20-P25.agc:1446
//#
// PORT: SOURCE P20-P25.agc:1447
//#		TRANSFER DESIRED CDUS, SCALED 180 DEGREES, FROM T(SAVEDCDU)
// PORT: SOURCE P20-P25.agc:1448
//#		TO V(CDUXD).
// PORT: SOURCE P20-P25.agc:1449
//#
// PORT: SOURCE P20-P25.agc:1450
//#		TRANSFER DELCDUS, SCALED 180 DEG, FROM V(VAC14D)
// PORT: SOURCE P20-P25.agc:1451
//#		TO V(DELCDUX).
// PORT: SOURCE P20-P25.agc:1452
//#
// PORT: SOURCE P20-P25.agc:1453
//#		TRANSFER OMEGA CONTROL, SCALED 450 DEG/SEC, FROM V(MPAC)
// PORT: SOURCE P20-P25.agc:1454
//#		TO V(WBODY).
// PORT: SOURCE P20-P25.agc:1455
//#
// PORT: SOURCE P20-P25.agc:1456
//#		RELINT, SET MPAC=0, EXIT CRS61.1.
// PORT: SOURCE P20-P25.agc:1457
//#
// PORT: SOURCE P20-P25.agc:1458
//# CALL:		L	CALL	CRS61.1
// PORT: SOURCE P20-P25.agc:1459
//#
// PORT: SOURCE P20-P25.agc:1460
//# RETURNS:	ALL TO L+1.
// PORT: SOURCE P20-P25.agc:1461
//#
// PORT: SOURCE P20-P25.agc:1462
//#		(1)	S(MPAC)=0.  NORMAL EXIT.  3 SETS OF INPUTS FED TO DAP.
// PORT: SOURCE P20-P25.agc:1463
//#		(2)	S(MPAC)=1.  CALCULATED DESIRED CDUS,SP, SET IN T(CPHI)
// PORT: SOURCE P20-P25.agc:1464
//#			FOR KALCMANU.  ABS(ACDU - DCDU) EXCEEDS 10 DEGREES.
// PORT: SOURCE P20-P25.agc:1465
//#		(3)	S(MPAC)=2.  GNCS AUTO MODE NOT SELECTED (BIT10=1).
// PORT: SOURCE P20-P25.agc:1466
//#		(4)	S(MPAC)=3.  DAP HOLD FLAG (HOLDFLAG) NOT EQUAL -1.
// PORT: SOURCE P20-P25.agc:1467
//# Page 592
// PORT: SOURCE P20-P25.agc:1468
//#
// PORT: SOURCE P20-P25.agc:1469
//# INPUT:	(1)	TIME2,TIME1.  COMPUTER CLOCK TIME,DP, CENTISEC B28.
// PORT: SOURCE P20-P25.agc:1470
//#		(2)	CDUX,Y,Z.  PRESENT CDU ANGLES,SP,2S COMPL HALF-REVS B0.
// PORT: SOURCE P20-P25.agc:1471
//#		(3)	M(REFSMMAT), STABLE MEMBER COORDS B1.
// PORT: SOURCE P20-P25.agc:1472
//#
// PORT: SOURCE P20-P25.agc:1473
//# OUTPUT:	NORMAL.  EXIT WITH S(MPAC) = 0.
// PORT: SOURCE P20-P25.agc:1474
//#
// PORT: SOURCE P20-P25.agc:1475
//#		(1)	CDUXD,CDUYD,CDUZD, DESIRED OUTER, INNER, MIDDLE CDU ANGLES,
// PORT: SOURCE P20-P25.agc:1476
//#			DP, IS COMPL, SCALED 180 DEGREES (HALF-REVS B0).
// PORT: SOURCE P20-P25.agc:1477
//#		(2)	DELCDUX,DELCDUY,DELCDUZ.  0.1 SEC DCU ANGULAR INCREMENTS,
// PORT: SOURCE P20-P25.agc:1478
//#			DP, IS COMPL, SCALED 180 DEG.
// PORT: SOURCE P20-P25.agc:1479
//#		(3)	WBODY,WBODY1,WBODY2.  LOS ANGULAR RATE IN CONTROL COORDS,
// PORT: SOURCE P20-P25.agc:1480
//#			DP, IS COMPL, SCALED 450 DEG/SEC.
// PORT: SOURCE P20-P25.agc:1481
//#
// PORT: SOURCE P20-P25.agc:1482
//#		SPECIAL.  EXIT WITH S(MPAC) = 1.
// PORT: SOURCE P20-P25.agc:1483
//#
// PORT: SOURCE P20-P25.agc:1484
//#		(1)	CPHI,CTHETA,CPSI.  DESIRED OUTER, INNER, MIDDLE CDU ANGLES,
// PORT: SOURCE P20-P25.agc:1485
//#			SP, 2'S COMPL, SCALED 180 DEGREES.
// PORT: SOURCE P20-P25.agc:1486
//#
// PORT: SOURCE P20-P25.agc:1487
//# EXTERNAL SUBROUTINES USED	(B)=BASIC
// PORT: SOURCE P20-P25.agc:1488
//#
// PORT: SOURCE P20-P25.agc:1489
//#	(1) CALCGA		(5) LOADTIME(B)		(9) SMNB
// PORT: SOURCE P20-P25.agc:1490
//#	(2) CDUTRIG		(6) MATMOVE
// PORT: SOURCE P20-P25.agc:1491
//#	(3) CSMCONIC		(7) RCDUS(B)
// PORT: SOURCE P20-P25.agc:1492
//#	(4) LEMCONIC		(8) SMCDURES
// PORT: SOURCE P20-P25.agc:1493
//#
// PORT: SOURCE P20-P25.agc:1494
//# ERASABLE
// PORT: SOURCE P20-P25.agc:1495
//#
// PORT: SOURCE P20-P25.agc:1496
//#	(1) S(Q611),EBANK7	CRS61.1 EXIT.
// PORT: SOURCE P20-P25.agc:1497
//#	(2) S(Q6111),EBANK7	CALCDCDU EXIT.
// PORT: SOURCE P20-P25.agc:1498
//#	(3) T(SAVEDCDU),E6	SP VECTOR OF CDUDS.
// PORT: SOURCE P20-P25.agc:1499
//#	(4) V(SAVEPOS),E7	CSM POS VEC AND D(SAVEPOS)= LENGTH OF LOS.
// PORT: SOURCE P20-P25.agc:1500
//#	(5) V(SAVEVEL),E7	CSM VEL VEC.
// PORT: SOURCE P20-P25.agc:1501
//#
// PORT: SOURCE P20-P25.agc:1502
//# FLAGWDS:	HOLDFLAG.  USED, NOT SET.
// PORT: SOURCE P20-P25.agc:1503
//#
// PORT: SOURCE P20-P25.agc:1504
//# MISC:	(1) ERASABLE ITEMP1 USED TO TEMP STORE EBANK UNDER INHINT.
// PORT: SOURCE P20-P25.agc:1505
//#	(2) ERASABLE P21TIME USED AS TEMP STORE DURING CRS61.1
// PORT: SOURCE P20-P25.agc:1506
//#	(3) ERAS DTHETASM USED AS TEMP STORE DURING EARLY CRS61.1
// PORT: SOURCE P20-P25.agc:1507
//#
// PORT: SOURCE P20-P25.agc:1508
//# DEBRIS -- CURRENT VAC AREA, CRS61.1 ERASABLES, ITEMP1, P21TIME
// PORT: SOURCE P20-P25.agc:1509
//
// PORT: SOURCE P20-P25.agc:1510
//		BANK	24
// PORT: SOURCE P20-P25.agc:1511
//		SETLOC	P20S4
// PORT: SOURCE P20-P25.agc:1512
//		BANK
// PORT: SOURCE P20-P25.agc:1513
//
// PORT: SOURCE P20-P25.agc:1514
//		EBANK=	CDUXD
// PORT: SOURCE P20-P25.agc:1515
//		COUNT*	$/CRS61
// PORT: SOURCE P20-P25.agc:1516
//
// PORT: SOURCE P20-P25.agc:1517
//CRS61.1		STQ	SETPD
// PORT: Fixed ROM slots 31459.
    31459, 33056
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1518
//			Q611
// PORT: Fixed ROM slots 31460.
    31460, 3976,
// PORT: SOURCE P20-P25.agc:1519
//			0
// PORT: Fixed ROM slots 31461.
    31461, 2,
// PORT: SOURCE P20-P25.agc:1520
//		RTB
// PORT: Fixed ROM slots 31462.
    31462, 65336,
// PORT: SOURCE P20-P25.agc:1521
//# Page 593
// PORT: SOURCE P20-P25.agc:1522
//			LOADTIME	# LOAD CLOCK TIME2,1 INTO MPAC.
// PORT: Fixed ROM slots 31463.
    31463, 38544,
// PORT: SOURCE P20-P25.agc:1523
//
// PORT: SOURCE P20-P25.agc:1524
//STORT		STCALL	P21TIME		# STORE CLOCK TIME FOR SUBR R63
// PORT: Fixed ROM slots 31464.
    31464, 31132,
// PORT: SOURCE P20-P25.agc:1525
//			R63		# SUBR TO CALC DCDU (T=PRESENT,PASS1)
// PORT: Fixed ROM slots 31465.
    31465, 59124,
// PORT: SOURCE P20-P25.agc:1526
//		TLOAD
// PORT: Fixed ROM slots 31466.
    31466, 65490,
// PORT: SOURCE P20-P25.agc:1527
//			THETAD		# SAVE DCDU(T) FROM CALCDCDU FOR STEP4.
// PORT: Fixed ROM slots 31467.
    31467, 1244,
// PORT: SOURCE P20-P25.agc:1528
//		STORE	SAVEDCDU
// PORT: Fixed ROM slots 31468.
    31468, 3574,
// PORT: SOURCE P20-P25.agc:1529
//
// PORT: SOURCE P20-P25.agc:1530
//		EXIT
// PORT: Fixed ROM slots 31469.
    31469, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31470–31484.
function agcAotUnit1786 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31476 {
        if slot <= 31472 {
            if slot <= 31470 {
// PORT: SOURCE P20-P25.agc:1531
//		TC	STEP2CK
// PORT: Fixed ROM slots 31470.
                if slot <> 31470 or instruction <> 1791 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1791, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31471 {
// PORT: SOURCE P20-P25.agc:1532
//AUTOCK		CAF	PRIO30
// PORT: Fixed ROM slots 31471.
                    if slot <> 31471 or instruction <> 14585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1533
//		EXTEND
// PORT: Fixed ROM slots 31472.
                    if slot <> 31472 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31474 {
                if slot <= 31473 {
// PORT: SOURCE P20-P25.agc:1534
//		RXOR	CHAN31
// PORT: Fixed ROM slots 31473.
                    if slot <> 31473 or instruction <> 3097 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1535
//		MASK	FURST3
// PORT: Fixed ROM slots 31474.
                    if slot <> 31474 or instruction <> 32711 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                        if fixedOperand = 28672 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 8) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31475 {
// PORT: SOURCE P20-P25.agc:1536
//		EXTEND			# AUTO MODE SELECTED (BITS 15-13=011)
// PORT: Fixed ROM slots 31475.
                    if slot <> 31475 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1537
//		BZF	DAPCK		#	YES -- CONTINUE.
// PORT: Fixed ROM slots 31476.
                    if slot <> 31476 or instruction <> 5878 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5878, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31480 {
            if slot <= 31478 {
                if slot <= 31477 {
// PORT: SOURCE P20-P25.agc:1538
//		TC	ASET
// PORT: Fixed ROM slots 31477.
                    if slot <> 31477 or instruction <> 1786 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1786, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1539
//
// PORT: SOURCE P20-P25.agc:1540
//DAPCK		CS	FLAGWRD1	# IS STIKFLAG SET (I.E., IS SOMEONE ON RHC)
// PORT: Fixed ROM slots 31478.
                    if slot <> 31478 or instruction <> 16445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 61).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31479 {
// PORT: SOURCE P20-P25.agc:1541
//		MASK	STIKBIT
// PORT: Fixed ROM slots 31479.
                    if slot <> 31479 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                } else {
// PORT: SOURCE P20-P25.agc:1542
//		CCS	A
// PORT: Fixed ROM slots 31480.
                    if slot <> 31480 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 31482 {
                if slot <= 31481 {
// PORT: SOURCE P20-P25.agc:1543
//		TC	STEP3CK
// PORT: Fixed ROM slots 31481.
                    if slot <> 31481 or instruction <> 1818 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1818, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1544
//ASET		CAF	ZERO
// PORT: Fixed ROM slots 31482.
                    if slot <> 31482 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31483 {
// PORT: SOURCE P20-P25.agc:1545
//		TS	MPAC
// PORT: Fixed ROM slots 31483.
                    if slot <> 31483 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1546
//		TC	INTPRET		# EXIT CRS61.1
// PORT: Fixed ROM slots 31484.
                    if slot <> 31484 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1786] to agcAotUnit1786@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1547
//		GOTO
// PORT: Fixed ROM slots 31485.
    31485, 65360,
// PORT: SOURCE P20-P25.agc:1548
//			Q611
// PORT: Fixed ROM slots 31486.
    31486, 3976
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31487–31487.
function agcAotUnit1787 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1549
//
// PORT: SOURCE P20-P25.agc:1550
//STEP2CK		TC	BANKCALL
// PORT: Fixed ROM slots 31487.
    if slot <> 31487 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1787] to agcAotUnit1787@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1551
//		CADR	UPACTOFF
// PORT: Fixed ROM slots 31488.
    31488, 49118
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31489–31491.
function agcAotUnit1788 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31489 {
// PORT: SOURCE P20-P25.agc:1552
//
// PORT: SOURCE P20-P25.agc:1553
//		CAF	TWO		# SET TEMPORARY INDEX DTHETASM = 2
// PORT: Fixed ROM slots 31489.
        if slot <> 31489 or instruction <> 14862 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31490 {
// PORT: SOURCE P20-P25.agc:1554
//CDULOOP		TS	DTHETASM
// PORT: Fixed ROM slots 31490.
            if slot <> 31490 or instruction <> 23433 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23433, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1555
//		INDEX	DTHETASM
// PORT: Fixed ROM slots 31491.
            if slot <> 31491 or instruction <> 21385 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21385, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21385, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1788] to agcAotUnit1788@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1556
//		CA	CDUX		# SET A = ACTUAL CDU (ACDU).
// PORT: Fixed ROM slots 31492.
    31492, 24628
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31493–31494.
function agcAotUnit1789 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31493 {
// PORT: SOURCE P20-P25.agc:1557
//		EXTEND
// PORT: Fixed ROM slots 31493.
        if slot <> 31493 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1558
//		INDEX	DTHETASM	# SET INDEX TO ACCESS DESIRED CDU (DCDU).
// PORT: Fixed ROM slots 31494.
        if slot <> 31494 or instruction <> 21385 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21385, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21385, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1789] to agcAotUnit1789@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1559
//		MSU	THETAD		# A = DIFF = ACDU - DCDU.
// PORT: Fixed ROM slots 31495.
    31495, 17626
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31496–31497.
function agcAotUnit1790 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31496 {
// PORT: SOURCE P20-P25.agc:1560
//		TS	MPAC		# RETURN TO INTERPRETER FOR 10 DEGREE CK.
// PORT: Fixed ROM slots 31496.
        if slot <> 31496 or instruction <> 22636 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22636, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1561
//		TC	INTPRET		# (DP APPROX SP OK FOR ROUGH CHECK)
// PORT: Fixed ROM slots 31497.
        if slot <> 31497 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1790] to agcAotUnit1790@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1562
//		ABS	DSU
// PORT: Fixed ROM slots 31498.
    31498, 38220,
// PORT: SOURCE P20-P25.agc:1563
//			DEGREE10	# IS (ACDU - DCDU) MORE THAN 10 DEGREES.
// PORT: Fixed ROM slots 31499.
    31499, 26466,
// PORT: SOURCE P20-P25.agc:1564
//		BPL	EXIT		# NO -- OK, CONTINUE CHECKING OTHER ANGLES.
// PORT: Fixed ROM slots 31500.
    31500, 65096,
// PORT: SOURCE P20-P25.agc:1565
//			STKTEST		# TEST STICK FLAG
// PORT: Fixed ROM slots 31501.
    31501, 58914
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31502–31504.
function agcAotUnit1791 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31502 {
// PORT: SOURCE P20-P25.agc:1566
//		CCS	DTHETASM	# HAVE ALL 3 ANGLE DIFFS BEEN CHECKED.
// PORT: Fixed ROM slots 31502.
        if slot <> 31502 or instruction <> 5001 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 905).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31503 {
// PORT: SOURCE P20-P25.agc:1567
//		TC	CDULOOP		# NO -- DIM COUNT, CHECK NEXT ANGLE DIFF.
// PORT: Fixed ROM slots 31503.
            if slot <> 31503 or instruction <> 1794 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1794, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1568
//		TC	AUTOCK
// PORT: Fixed ROM slots 31504.
            if slot <> 31504 or instruction <> 1775 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1775, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1791] to agcAotUnit1791@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1569
//STKTEST		EXIT
// PORT: Fixed ROM slots 31505.
    31505, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31506–31514.
function agcAotUnit1792 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31509 {
        if slot <= 31507 {
            if slot <= 31506 {
// PORT: SOURCE P20-P25.agc:1570
//		CS	FLAGWRD1
// PORT: Fixed ROM slots 31506.
                if slot <> 31506 or instruction <> 16445 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 61).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1571
//		MASK	STIKBIT
// PORT: Fixed ROM slots 31507.
                if slot <> 31507 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
            if slot <= 31508 {
// PORT: SOURCE P20-P25.agc:1572
//# Page 594
// PORT: SOURCE P20-P25.agc:1573
//		CCS	A
// PORT: Fixed ROM slots 31508.
                if slot <> 31508 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1574
//		TC	MANUEXIS	# STIKFLAG IS NOT SET (DO R63)
// PORT: Fixed ROM slots 31509.
                if slot <> 31509 or instruction <> 1907 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1907, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31511 {
            if slot <= 31510 {
// PORT: SOURCE P20-P25.agc:1575
//		CAF	BIT3
// PORT: Fixed ROM slots 31510.
                if slot <> 31510 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1576
//		EXTEND			# STIKFLG IS SET
// PORT: Fixed ROM slots 31511.
                if slot <> 31511 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31512 {
// PORT: SOURCE P20-P25.agc:1577
//		WOR	DSALMOUT	# TURN ON UPACTY LIGHT
// PORT: Fixed ROM slots 31512.
                if slot <> 31512 or instruction <> 2569 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31513 {
// PORT: SOURCE P20-P25.agc:1578
//
// PORT: SOURCE P20-P25.agc:1579
//		TC	ASET		# EXIT AND SET R61CNTR
// PORT: Fixed ROM slots 31513.
                    if slot <> 31513 or instruction <> 1786 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1786, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1580
//STEP3CK		TC	INTPRET
// PORT: Fixed ROM slots 31514.
                    if slot <> 31514 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1792] to agcAotUnit1792@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1581
//		SETPD
// PORT: Fixed ROM slots 31515.
    31515, 65282,
// PORT: SOURCE P20-P25.agc:1582
//			0		# *
// PORT: Fixed ROM slots 31516.
    31516, 2,
// PORT: SOURCE P20-P25.agc:1583
//					# NOW HAVE DCDUS STORED IN T(SAVEDCDU).
// PORT: SOURCE P20-P25.agc:1584
//					# GO CALC OTHER DAP INPUTS (DELCDU,WBODY)
// PORT: SOURCE P20-P25.agc:1585
//CRS61.2		VLOAD	VSU
// PORT: Fixed ROM slots 31517.
    31517, 43514,
// PORT: SOURCE P20-P25.agc:1586
//			DCDU
// PORT: Fixed ROM slots 31518.
    31518, 3336,
// PORT: SOURCE P20-P25.agc:1587
//			SAVEVEL		# DV = VL - VC
// PORT: Fixed ROM slots 31519.
    31519, 3994,
// PORT: SOURCE P20-P25.agc:1588
//		UNIT	VCOMP		# V(MPAC)=-UNITDV. VAC36D=ABSDV.
// PORT: Fixed ROM slots 31520.
    31520, 48732,
// PORT: SOURCE P20-P25.agc:1589
//		VXV	VXSC		# (-UNITDV)CROSS(UNITLOS).
// PORT: Fixed ROM slots 31521.
    31521, 61754,
// PORT: SOURCE P20-P25.agc:1590
//			SAVEPOS
// PORT: Fixed ROM slots 31522.
    31522, 3982,
// PORT: SOURCE P20-P25.agc:1591
//			RVCS/RDS	# (UNITLOS B1)(UNITDV B1)(CONST B4)=CROSS.
// PORT: Fixed ROM slots 31523.
    31523, 26468,
// PORT: SOURCE P20-P25.agc:1592
//		PUSH			# HOLD CROSS IN PUSHLIST0.  SCALED B6.
// PORT: Fixed ROM slots 31524.
    31524, 65292,
// PORT: SOURCE P20-P25.agc:1593
//		DLOAD	NORM		# OBTAIN ABS VALUE OF LOS.
// PORT: Fixed ROM slots 31525.
    31525, 49610,
// PORT: SOURCE P20-P25.agc:1594
//			P21TIME		# P21TIME IS TEMP STORE FOR ABSLOS.
// PORT: Fixed ROM slots 31526.
    31526, 2460,
// PORT: SOURCE P20-P25.agc:1595
//			X1
// PORT: Fixed ROM slots 31527.
    31527, 78,
// PORT: SOURCE P20-P25.agc:1596
//		PUSH			# NORM ABSLOS(DENOM) AND HOLD IN PUSH1.
// PORT: Fixed ROM slots 31528.
    31528, 65292,
// PORT: SOURCE P20-P25.agc:1597
//
// PORT: SOURCE P20-P25.agc:1598
//		DLOAD	NORM
// PORT: Fixed ROM slots 31529.
    31529, 49610,
// PORT: SOURCE P20-P25.agc:1599
//			36D		# NORM ABS VALUE OF DV(NUM).
// PORT: Fixed ROM slots 31530.
    31530, 74,
// PORT: SOURCE P20-P25.agc:1600
//			S1
// PORT: Fixed ROM slots 31531.
    31531, 82,
// PORT: SOURCE P20-P25.agc:1601
//
// PORT: SOURCE P20-P25.agc:1602
//		XSU,1	SR1		# X1 = X1(N DENOM)-S1(N NUM).
// PORT: Fixed ROM slots 31532.
    31532, 57952,
// PORT: SOURCE P20-P25.agc:1603
//			S1		# SR1 TO AVOID OFLOW ON DOV.
// PORT: Fixed ROM slots 31533.
    31533, 80,
// PORT: SOURCE P20-P25.agc:1604
//		DDV	VXSC		# ABSDV(MPAC)/ABSLOS(PUSH1) = QUOT.
// PORT: Fixed ROM slots 31534.
    31534, 61810,
// PORT: SOURCE P20-P25.agc:1605
//		SXA,1			# QUOT(MPAC) X CROSS(PUSH0)
// PORT: Fixed ROM slots 31535.
    31535, 65456,
// PORT: SOURCE P20-P25.agc:1606
//			Q6111		# SAVE SCALE OF RESULT (R-15,1X).
// PORT: Fixed ROM slots 31536.
    31536, 3978,
// PORT: SOURCE P20-P25.agc:1607
//					# X1= NORM OF QUOT. QTUOT SCALE B7-B29=B-22
// PORT: SOURCE P20-P25.agc:1608
//					# CROSS IS SCALED B6.  NEED SL1 TO RECOVER
// PORT: SOURCE P20-P25.agc:1609
//					# SR1 SO THAT -22+6+1=-15.  MPAC NOW HOLDS
// PORT: SOURCE P20-P25.agc:1610
//					# ORTHO LOS RATE (OMEGA TH, B-15,X1).
// PORT: SOURCE P20-P25.agc:1611
//		MXV	VSL1		# OBTAIN RATE IN SM COORDS (OMEGTHSM) AND
// PORT: Fixed ROM slots 31537.
    31537, 64162,
// PORT: SOURCE P20-P25.agc:1612
//			REFSMMAT	# ADJUST FOR REFSMMAT SCALE OF B1.
// PORT: Fixed ROM slots 31538.
    31538, 1980,
// PORT: SOURCE P20-P25.agc:1613
//		STORE	20D		# OMEGTHSM = VAC20D
// PORT: Fixed ROM slots 31539.
    31539, 42,
// PORT: SOURCE P20-P25.agc:1614
//					# DELTA THETA SM = OMEGTHSM * .1B-3.
// PORT: SOURCE P20-P25.agc:1615
//		VXSC
// PORT: Fixed ROM slots 31540.
    31540, 65506,
// PORT: SOURCE P20-P25.agc:1616
//			TENTH
// PORT: Fixed ROM slots 31541.
    31541, 26472,
// PORT: SOURCE P20-P25.agc:1617
//		STORE	DTHETASM	# STORE SM INCREM ANGLES FOR SMCDURES.
// PORT: Fixed ROM slots 31542.
    31542, 3348,
// PORT: SOURCE P20-P25.agc:1618
//		CALL
// PORT: Fixed ROM slots 31543.
    31543, 65320,
// PORT: SOURCE P20-P25.agc:1619
//			CDUTRIG		# OBTAIN SIN,COSCDUS FOR SMCDURES.
// PORT: Fixed ROM slots 31544.
    31544, 40574,
// PORT: SOURCE P20-P25.agc:1620
//		SETPD	CALL		# SMCDURES USES PUSH
// PORT: Fixed ROM slots 31545.
    31545, 37890,
// PORT: SOURCE P20-P25.agc:1621
//			0
// PORT: Fixed ROM slots 31546.
    31546, 2,
// PORT: SOURCE P20-P25.agc:1622
//			SMCDURES	# OBTAIN DELCDU IN V(DCDU).
// PORT: Fixed ROM slots 31547.
    31547, 40900,
// PORT: SOURCE P20-P25.agc:1623
//# Page 595
// PORT: SOURCE P20-P25.agc:1624
//		LXA,1			# RELOAD X1
// PORT: Fixed ROM slots 31548.
    31548, 65488,
// PORT: SOURCE P20-P25.agc:1625
//			Q6111
// PORT: Fixed ROM slots 31549.
    31549, 3978,
// PORT: SOURCE P20-P25.agc:1626
//		VLOAD	VSL*		# RECOVER SCALE.
// PORT: Fixed ROM slots 31550.
    31550, 45050,
// PORT: SOURCE P20-P25.agc:1627
//			DCDU		# (B-15,X1) + TENTH(B-3) + HALFREVS(B1)
// PORT: Fixed ROM slots 31551.
    31551, 3336,
// PORT: SOURCE P20-P25.agc:1628
//			0 -17D,1	# EQUALS B-17D,1 TO OBTAIN HALFREVS B0.
// PORT: Fixed ROM slots 31552.
    31552, 16608,
// PORT: SOURCE P20-P25.agc:1629
//		STORE	14D		# HOLD DELS IN V(VAC14D) FOR AUTOPILOT.
// PORT: Fixed ROM slots 31553.
    31553, 30,
// PORT: SOURCE P20-P25.agc:1630
//
// PORT: SOURCE P20-P25.agc:1631
//		CALL			# COMPUTES SINES AND COSINES FOR *SMNB*
// PORT: Fixed ROM slots 31554.
    31554, 65320,
// PORT: SOURCE P20-P25.agc:1632
//			CDUTRIG
// PORT: Fixed ROM slots 31555.
    31555, 40574,
// PORT: SOURCE P20-P25.agc:1633
//		VLOAD	CALL		# LOAD VECTOR AND CALL TRANSFORMATION
// PORT: Fixed ROM slots 31556.
    31556, 38138,
// PORT: SOURCE P20-P25.agc:1634
//			20D		# VECTOR FOR TRG*SMNB INTO MPAC
// PORT: Fixed ROM slots 31557.
    31557, 42,
// PORT: SOURCE P20-P25.agc:1635
//			*SMNB*		# OBTAIN ANG. RATE REFERRED TO NB (BODY)
// PORT: Fixed ROM slots 31558.
    31558, 40776,
// PORT: SOURCE P20-P25.agc:1636
//		MXV
// PORT: Fixed ROM slots 31559.
    31559, 65442,
// PORT: SOURCE P20-P25.agc:1637
//			MBDYTCTL	# CONVERT RATE(OMEGA) TO CONTROL COORDS.
// PORT: Fixed ROM slots 31560.
    31560, 26480,
// PORT: SOURCE P20-P25.agc:1638
//		VXSC			# MULT. BY 0.8 TO RESCALE REVS TO 450 DEG.
// PORT: Fixed ROM slots 31561.
    31561, 65506,
// PORT: SOURCE P20-P25.agc:1639
//			POINT8		# RECOVER SCALE.
// PORT: Fixed ROM slots 31562.
    31562, 13682,
// PORT: SOURCE P20-P25.agc:1640
//		LXA,1	VSL*		# RELOAD X1 TO RECOVER NORMALIZ.
// PORT: Fixed ROM slots 31563.
    31563, 45008,
// PORT: SOURCE P20-P25.agc:1641
//			Q6111		# (B-15,X1) + MBDYTCTL(B1) = B-14D,1 TO
// PORT: Fixed ROM slots 31564.
    31564, 3978,
// PORT: SOURCE P20-P25.agc:1642
//			0 -14D,1	# OBTAIN REVS SCALED AT 450 DEGREES.
// PORT: Fixed ROM slots 31565.
    31565, 16614,
// PORT: SOURCE P20-P25.agc:1643
//
// PORT: SOURCE P20-P25.agc:1644
//CRS61.2A	EXIT
// PORT: Fixed ROM slots 31566.
    31566, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31567–31588.
function agcAotUnit1793 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31577 {
        if slot <= 31571 {
            if slot <= 31568 {
                if slot <= 31567 {
// PORT: SOURCE P20-P25.agc:1645
//		INHINT
// PORT: Fixed ROM slots 31567.
                    if slot <> 31567 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1646
//		CAF	ZERO		# TRANSFER DESIRED GIMBAL ANGLES
// PORT: Fixed ROM slots 31568.
                    if slot <> 31568 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31569 {
// PORT: SOURCE P20-P25.agc:1647
//		TS	CDUXD	+1	# FROM T(SAVEDCDU) TO V(CDUXD).
// PORT: Fixed ROM slots 31569.
                    if slot <> 31569 or instruction <> 23463 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23463, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31570 {
// PORT: SOURCE P20-P25.agc:1648
//		TS	CDUYD	+1
// PORT: Fixed ROM slots 31570.
                        if slot <> 31570 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1649
//		TS	CDUZD	+1
// PORT: Fixed ROM slots 31571.
                        if slot <> 31571 or instruction <> 23467 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23467, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 31574 {
                if slot <= 31572 {
// PORT: SOURCE P20-P25.agc:1650
//		CA	SAVEDCDU
// PORT: Fixed ROM slots 31572.
                    if slot <> 31572 or instruction <> 13306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1018).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31573 {
// PORT: SOURCE P20-P25.agc:1651
//		TS	CDUXD
// PORT: Fixed ROM slots 31573.
                        if slot <> 31573 or instruction <> 23462 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23462, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1652
//		CA	SAVEDCDU +1
// PORT: Fixed ROM slots 31574.
                        if slot <> 31574 or instruction <> 13307 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1019).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31575 {
// PORT: SOURCE P20-P25.agc:1653
//		TS	CDUYD
// PORT: Fixed ROM slots 31575.
                    if slot <> 31575 or instruction <> 23464 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23464, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31576 {
// PORT: SOURCE P20-P25.agc:1654
//		CA	SAVEDCDU +2
// PORT: Fixed ROM slots 31576.
                        if slot <> 31576 or instruction <> 13308 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1020).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1655
//		TS	CDUZD
// PORT: Fixed ROM slots 31577.
                        if slot <> 31577 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 31582 {
            if slot <= 31579 {
                if slot <= 31578 {
// PORT: SOURCE P20-P25.agc:1656
//
// PORT: SOURCE P20-P25.agc:1657
//		EXTEND			# TRANSFER OMEGA CONTROL (ANG. LOS RATE)
// PORT: Fixed ROM slots 31578.
                    if slot <> 31578 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1658
//		DCA	MPAC		# FROM V(MPAC) TO V(WBODY)
// PORT: Fixed ROM slots 31579.
                    if slot <> 31579 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31580 {
// PORT: SOURCE P20-P25.agc:1659
//		DXCH	WBODY
// PORT: Fixed ROM slots 31580.
                    if slot <> 31580 or instruction <> 22358 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 854, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31581 {
// PORT: SOURCE P20-P25.agc:1660
//		EXTEND
// PORT: Fixed ROM slots 31581.
                        if slot <> 31581 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1661
//		DCA	MPAC	+3
// PORT: Fixed ROM slots 31582.
                        if slot <> 31582 or instruction <> 12400 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 112, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 31585 {
                if slot <= 31583 {
// PORT: SOURCE P20-P25.agc:1662
//		DXCH	WBODY1
// PORT: Fixed ROM slots 31583.
                    if slot <> 31583 or instruction <> 22360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 856, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31584 {
// PORT: SOURCE P20-P25.agc:1663
//		EXTEND
// PORT: Fixed ROM slots 31584.
                        if slot <> 31584 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1664
//		DCA	MPAC	+5
// PORT: Fixed ROM slots 31585.
                        if slot <> 31585 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 114, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31586 {
// PORT: SOURCE P20-P25.agc:1665
//		DXCH	WBODY2
// PORT: Fixed ROM slots 31586.
                    if slot <> 31586 or instruction <> 22362 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 858, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31587 {
// PORT: SOURCE P20-P25.agc:1666
//
// PORT: SOURCE P20-P25.agc:1667
//		EXTEND			# TRANSFER CDU INCREMENTS
// PORT: Fixed ROM slots 31587.
                        if slot <> 31587 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1668
//		INDEX	FIXLOC		# FROM V(VAC14D) TO V(DELCDUX)
// PORT: Fixed ROM slots 31588.
                        if slot <> 31588 or instruction <> 20560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20560, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1793] to agcAotUnit1793@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1669
//		DCA	14D
// PORT: Fixed ROM slots 31589.
    31589, 24606
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31590–31592.
function agcAotUnit1794 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31590 {
// PORT: SOURCE P20-P25.agc:1670
//		DXCH	DELCDUX
// PORT: Fixed ROM slots 31590.
        if slot <> 31590 or instruction <> 22398 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 894, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31591 {
// PORT: SOURCE P20-P25.agc:1671
//		EXTEND
// PORT: Fixed ROM slots 31591.
            if slot <> 31591 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1672
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 31592.
            if slot <> 31592 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1794] to agcAotUnit1794@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1673
//		DCA	16D
// PORT: Fixed ROM slots 31593.
    31593, 24610
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31594–31596.
function agcAotUnit1795 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31594 {
// PORT: SOURCE P20-P25.agc:1674
//# Page 596
// PORT: SOURCE P20-P25.agc:1675
//		DXCH	DELCDUY
// PORT: Fixed ROM slots 31594.
        if slot <> 31594 or instruction <> 22400 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 896, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31595 {
// PORT: SOURCE P20-P25.agc:1676
//		EXTEND
// PORT: Fixed ROM slots 31595.
            if slot <> 31595 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1677
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 31596.
            if slot <> 31596 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1795] to agcAotUnit1795@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1678
//		DCA	18D
// PORT: Fixed ROM slots 31597.
    31597, 24614
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31598–31603.
function agcAotUnit1796 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31600 {
        if slot <= 31598 {
// PORT: SOURCE P20-P25.agc:1679
//		DXCH	DELCDUZ
// PORT: Fixed ROM slots 31598.
            if slot <> 31598 or instruction <> 22402 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 898, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31599 {
// PORT: SOURCE P20-P25.agc:1680
//		CS	ONE		# NOW DAP VARIABLES LOADED.  SET HOLDFLAG.
// PORT: Fixed ROM slots 31599.
                if slot <> 31599 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1681
//		TS	HOLDFLAG	# TO -1.
// PORT: Fixed ROM slots 31600.
                if slot <> 31600 or instruction <> 23258 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23258, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31601 {
// PORT: SOURCE P20-P25.agc:1682
//		RELINT
// PORT: Fixed ROM slots 31601.
            if slot <> 31601 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31602 {
// PORT: SOURCE P20-P25.agc:1683
//		TC	ASET
// PORT: Fixed ROM slots 31602.
                if slot <> 31602 or instruction <> 1786 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1786, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1684
//MANUEXIS	TC	INTPRET
// PORT: Fixed ROM slots 31603.
                if slot <> 31603 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1796] to agcAotUnit1796@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1685
//MANUEXIT	TLOAD			# ENTER FROM STEP2.  ACDU-DCDU EXCEEDS
// PORT: Fixed ROM slots 31604.
    31604, 65490,
// PORT: SOURCE P20-P25.agc:1686
//			SAVEDCDU	# 10 DEG. STORE DCDU(T) IN CPHI,CTHETA,
// PORT: Fixed ROM slots 31605.
    31605, 3574,
// PORT: SOURCE P20-P25.agc:1687
//		STORE	CPHI		# CPSI FOR KALCMANU.
// PORT: Fixed ROM slots 31606.
    31606, 1244,
// PORT: SOURCE P20-P25.agc:1688
//		SLOAD	GOTO		# SPECIAL RETURN (MPAC+0 = 1)
// PORT: Fixed ROM slots 31607.
    31607, 43194,
// PORT: SOURCE P20-P25.agc:1689
//			LOONE		# OCTAL 00001
// PORT: Fixed ROM slots 31608.
    31608, 26516,
// PORT: SOURCE P20-P25.agc:1690
//			Q611
// PORT: Fixed ROM slots 31609.
    31609, 3976,
// PORT: SOURCE P20-P25.agc:1691
//
// PORT: SOURCE P20-P25.agc:1692
//R63		STQ	DLOAD		# SUBR TO CALC DCDUS(T)
// PORT: Fixed ROM slots 31610.
    31610, 58656,
// PORT: SOURCE P20-P25.agc:1693
//			Q6111
// PORT: Fixed ROM slots 31611.
    31611, 3978,
// PORT: SOURCE P20-P25.agc:1694
//			P21TIME
// PORT: Fixed ROM slots 31612.
    31612, 2460,
// PORT: SOURCE P20-P25.agc:1695
//		STCALL	TDEC1
// PORT: Fixed ROM slots 31613.
    31613, 28738,
// PORT: SOURCE P20-P25.agc:1696
//			CSMCONIC
// PORT: Fixed ROM slots 31614.
    31614, 23704,
// PORT: SOURCE P20-P25.agc:1697
//HOLDATT		VLOAD			# HOLD EXTRAPOLATED CSM POSITION AND
// PORT: Fixed ROM slots 31615.
    31615, 65530,
// PORT: SOURCE P20-P25.agc:1698
//			RATT		# VELOCITY
// PORT: Fixed ROM slots 31616.
    31616, 2,
// PORT: SOURCE P20-P25.agc:1699
//		STOVL	SAVEPOS
// PORT: Fixed ROM slots 31617.
    31617, 24462,
// PORT: SOURCE P20-P25.agc:1700
//			VATT
// PORT: Fixed ROM slots 31618.
    31618, 14,
// PORT: SOURCE P20-P25.agc:1701
//		STORE	SAVEVEL
// PORT: Fixed ROM slots 31619.
    31619, 3994,
// PORT: SOURCE P20-P25.agc:1702
//CALCLEM		DLOAD			# EXTRAPOLATE LEM STATE VECTOR TO SAVE
// PORT: Fixed ROM slots 31620.
    31620, 65482,
// PORT: SOURCE P20-P25.agc:1703
//			P21TIME		# TIME AS CSM USING LEMCONIC
// PORT: Fixed ROM slots 31621.
    31621, 2460,
// PORT: SOURCE P20-P25.agc:1704
//		STCALL	TDEC1
// PORT: Fixed ROM slots 31622.
    31622, 28738,
// PORT: SOURCE P20-P25.agc:1705
//			LEMCONIC
// PORT: Fixed ROM slots 31623.
    31623, 23724,
// PORT: SOURCE P20-P25.agc:1706
//		VLOAD
// PORT: Fixed ROM slots 31624.
    31624, 65530,
// PORT: SOURCE P20-P25.agc:1707
//			VATT
// PORT: Fixed ROM slots 31625.
    31625, 14,
// PORT: SOURCE P20-P25.agc:1708
//		STOVL	DCDU		# STORE VATT IN DCDU TEMPORARILY
// PORT: Fixed ROM slots 31626.
    31626, 23816,
// PORT: SOURCE P20-P25.agc:1709
//			RATT		# LOS = RL RC
// PORT: Fixed ROM slots 31627.
    31627, 2,
// PORT: SOURCE P20-P25.agc:1710
//		VSU	UNIT
// PORT: Fixed ROM slots 31628.
    31628, 44626,
// PORT: SOURCE P20-P25.agc:1711
//			SAVEPOS
// PORT: Fixed ROM slots 31629.
    31629, 3982,
// PORT: SOURCE P20-P25.agc:1712
//		STORE	SAVEPOS		# SAVE UNITLOS FOR CRS61.2 RATE CALC.
// PORT: Fixed ROM slots 31630.
    31630, 3982,
// PORT: SOURCE P20-P25.agc:1713
//		MXV	VSL1
// PORT: Fixed ROM slots 31631.
    31631, 64162,
// PORT: SOURCE P20-P25.agc:1714
//			REFSMMAT	# CONVERT TO STABLE MEMBER
// PORT: Fixed ROM slots 31632.
    31632, 1980,
// PORT: SOURCE P20-P25.agc:1715
//		STODL	POINTVSM
// PORT: Fixed ROM slots 31633.
    31633, 15838,
// PORT: SOURCE P20-P25.agc:1716
//			36D		# HOLD ABS VAL OF LOS (VAC 36D)
// PORT: Fixed ROM slots 31634.
    31634, 74,
// PORT: SOURCE P20-P25.agc:1717
//		STORE	P21TIME		# IN D(P21TIME) FOR CRS61.2 RATE CALC.
// PORT: Fixed ROM slots 31635.
    31635, 2460,
// PORT: SOURCE P20-P25.agc:1718
//		VLOAD
// PORT: Fixed ROM slots 31636.
    31636, 65530,
// PORT: SOURCE P20-P25.agc:1719
//			UNITX
// PORT: Fixed ROM slots 31637.
    31637, 13750,
// PORT: SOURCE P20-P25.agc:1720
//		STCALL	SCAXIS		# TRACK AXIS UNIT VECTOR
// PORT: Fixed ROM slots 31638.
    31638, 32210,
// PORT: SOURCE P20-P25.agc:1721
//			VECPOINT	# FOR +X-AXIS TRACKING ATTITUDE
// PORT: Fixed ROM slots 31639.
    31639, 47276,
// PORT: SOURCE P20-P25.agc:1722
//		STORE 	CPHIX		# STORE ANGLES FOR N96 DISPLAY
// PORT: Fixed ROM slots 31640.
    31640, 1464,
// PORT: SOURCE P20-P25.agc:1723
//		VLOAD
// PORT: Fixed ROM slots 31641.
    31641, 65530,
// PORT: SOURCE P20-P25.agc:1724
//			PRFUNIT
// PORT: Fixed ROM slots 31642.
    31642, 26454,
// PORT: SOURCE P20-P25.agc:1725
//# Page 597
// PORT: SOURCE P20-P25.agc:1726
//		STCALL	SCAXIS
// PORT: Fixed ROM slots 31643.
    31643, 32210,
// PORT: SOURCE P20-P25.agc:1727
//			VECPOINT
// PORT: Fixed ROM slots 31644.
    31644, 47276,
// PORT: SOURCE P20-P25.agc:1728
//		STORE	PRAXIS		# STORE ANGLES FOR N95 DISPLAY
// PORT: Fixed ROM slots 31645.
    31645, 4006,
// PORT: SOURCE P20-P25.agc:1729
//		BOFF
// PORT: Fixed ROM slots 31646.
    31646, 65304,
// PORT: SOURCE P20-P25.agc:1730
//			PRFTRKAT
// PORT: Fixed ROM slots 31647.
    31647, 3018,
// PORT: SOURCE P20-P25.agc:1731
//			CRSTOR1
// PORT: Fixed ROM slots 31648.
    31648, 59208,
// PORT: SOURCE P20-P25.agc:1732
//CRSTOR		STORE	THETAD		# STORE ANGLES FOR N18 DISPLAY
// PORT: Fixed ROM slots 31649.
    31649, 1244,
// PORT: SOURCE P20-P25.agc:1733
//		GOTO
// PORT: Fixed ROM slots 31650.
    31650, 65360,
// PORT: SOURCE P20-P25.agc:1734
//			Q6111
// PORT: Fixed ROM slots 31651.
    31651, 3978,
// PORT: SOURCE P20-P25.agc:1735
//CRSTOR1		VLOAD
// PORT: Fixed ROM slots 31652.
    31652, 65530,
// PORT: SOURCE P20-P25.agc:1736
//			UNITX
// PORT: Fixed ROM slots 31653.
    31653, 13750,
// PORT: SOURCE P20-P25.agc:1737
//		STORE	SCAXIS
// PORT: Fixed ROM slots 31654.
    31654, 3538,
// PORT: SOURCE P20-P25.agc:1738
//		TLOAD	GOTO
// PORT: Fixed ROM slots 31655.
    31655, 43218,
// PORT: SOURCE P20-P25.agc:1739
//			CPHIX
// PORT: Fixed ROM slots 31656.
    31656, 1464,
// PORT: SOURCE P20-P25.agc:1740
//			CRSTOR
// PORT: Fixed ROM slots 31657.
    31657, 59202,
// PORT: SOURCE P20-P25.agc:1741
//PRFUNIT		2DEC	.40957602	# 55 DEG TRACK AXIS UNIT VECTOR
// PORT: Fixed ROM slots 31658 31659.
    31658, 13420, 31659, 16172,
// PORT: SOURCE P20-P25.agc:1742
//
// PORT: SOURCE P20-P25.agc:1743
//		2DEC	0.0		# FOR USE WITH VECPOINT
// PORT: Fixed ROM slots 31660 31661.
    31660, 0, 31661, 0,
// PORT: SOURCE P20-P25.agc:1744
//
// PORT: SOURCE P20-P25.agc:1745
//		2DEC	.28678822
// PORT: Fixed ROM slots 31662 31663.
    31662, 9396, 31663, 24190,
// PORT: SOURCE P20-P25.agc:1746
//
// PORT: SOURCE P20-P25.agc:1747
//DEGREE10	DEC	.05556		# 10 DEG IN REVS		STEP2
// PORT: Fixed ROM slots 31664.
    31664, 1820,
// PORT: SOURCE P20-P25.agc:1748
//RVCS/RDS	2DEC	15.915494 B-4	# 100/2PI REV-CSEC/RAD-SEC.
// PORT: Fixed ROM slots 31665 31666.
    31665, 32594, 31666, 15266,
// PORT: SOURCE P20-P25.agc:1749
//
// PORT: SOURCE P20-P25.agc:1750
//TENTH		2DEC	.1 B+3		# .1 B-3 (TO SCALE ANG. RATE TO .1 INREMS)
// PORT: Fixed ROM slots 31667 31668.
    31667, 26214, 31668, 6554,
// PORT: SOURCE P20-P25.agc:1751
//
// PORT: SOURCE P20-P25.agc:1752
//MAT1B1		2DEC	1.0 B-1
// PORT: Fixed ROM slots 31669 31670.
    31669, 16384, 31670, 0,
// PORT: SOURCE P20-P25.agc:1753
//
// PORT: SOURCE P20-P25.agc:1754
//MBDYTCTL	2DEC	.5		# 		7.25 DEG NEGATIVE
// PORT: Fixed ROM slots 31671 31672.
    31671, 16384, 31672, 0,
// PORT: SOURCE P20-P25.agc:1755
//
// PORT: SOURCE P20-P25.agc:1756
//		2DEC	0		#		X-AXIS ROTATION MATRIX
// PORT: Fixed ROM slots 31673 31674.
    31673, 0, 31674, 0,
// PORT: SOURCE P20-P25.agc:1757
//
// PORT: SOURCE P20-P25.agc:1758
//		2DEC	0		#		CONVERTS BODY TO CTL
// PORT: Fixed ROM slots 31675 31676.
    31675, 0, 31676, 0,
// PORT: SOURCE P20-P25.agc:1759
//
// PORT: SOURCE P20-P25.agc:1760
//		2DEC	0		#		AXES.  CAME AS QUADROT
// PORT: Fixed ROM slots 31677 31678.
    31677, 0, 31678, 0,
// PORT: SOURCE P20-P25.agc:1761
//
// PORT: SOURCE P20-P25.agc:1762
//		2DEC	.99200495 B-1	# COS7.25 B1	BUT SCALED B
// PORT: Fixed ROM slots 31679 31680.
    31679, 16252, 31680, 16534,
// PORT: SOURCE P20-P25.agc:1763
//
// PORT: SOURCE P20-P25.agc:1764
//		2DEC	-.12619897 B-1	# -SIN7.25 B1
// PORT: Fixed ROM slots 31681 31682.
    31681, 63468, 31682, 38600,
// PORT: SOURCE P20-P25.agc:1765
//
// PORT: SOURCE P20-P25.agc:1766
//		2DEC	0
// PORT: Fixed ROM slots 31683 31684.
    31683, 0, 31684, 0,
// PORT: SOURCE P20-P25.agc:1767
//
// PORT: SOURCE P20-P25.agc:1768
//		2DEC	.12619897 B-1	# SIN7.25 B1
// PORT: Fixed ROM slots 31685 31686.
    31685, 2066, 31686, 26934,
// PORT: SOURCE P20-P25.agc:1769
//
// PORT: SOURCE P20-P25.agc:1770
//		2DEC	.99200495 B-1	# COS7.25 B1
// PORT: Fixed ROM slots 31687 31688.
    31687, 16252, 31688, 16534,
// PORT: SOURCE P20-P25.agc:1771
//
// PORT: SOURCE P20-P25.agc:1772
//LOONE		OCT	00001		# TO SET MPAC = 00001 FOR SPECIAL EXIT.
// PORT: Fixed ROM slots 31689.
    31689, 2,
// PORT: SOURCE P20-P25.agc:1773
//FURST3		EQUALS	13,14,15	# CONSTANT FOR AUTOCK (OCT 70000).
// PORT: SOURCE P20-P25.agc:1774
//
// PORT: SOURCE P20-P25.agc:1775
//# Page 598
// PORT: SOURCE P20-P25.agc:1776
//# ..... S22.1 ORBITAL NAVIGATION ROUTINE
// PORT: SOURCE P20-P25.agc:1777
//# MOD 1
// PORT: SOURCE P20-P25.agc:1778
//#
// PORT: SOURCE P20-P25.agc:1779
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:1780
//#	1.  UPDATE CSM STATE VECTOR
// PORT: SOURCE P20-P25.agc:1781
//#	2.  UPDATE LANDMARK POSITION
// PORT: SOURCE P20-P25.agc:1782
//#	3.  CONVERT W MATRIX FROM 9 TO 6 DIMENSIONS
// PORT: SOURCE P20-P25.agc:1783
//#
// PORT: SOURCE P20-P25.agc:1784
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:1785
//#	INTSTALL,INTEGRV,GETNUM,SETRE,R-TO-TP,RP-TO-R,BVECTORS,INCORP1,INCORP2
// PORT: SOURCE P20-P25.agc:1786
//#	LALOTORV,S22F2410,LAT-LONG,ROWDOT
// PORT: SOURCE P20-P25.agc:1787
//#
// PORT: SOURCE P20-P25.agc:1788
//# ERASABLE INITIALIZATION
// PORT: SOURCE P20-P25.agc:1789
//#	W=9X9 MATRIX
// PORT: SOURCE P20-P25.agc:1790
//#	ORBWFLAG=0 FOR INVALID W MATRIX, =1 FOR VALID W MATRIX
// PORT: SOURCE P20-P25.agc:1791
//#	ASTRONAUT ENTRY OF KNOWN,L,OFF
// PORT: SOURCE P20-P25.agc:1792
//#	8NN= NUMBER OF MARKS, DECIMAL INTEGER B-14
// PORT: SOURCE P20-P25.agc:1793
//#	REFSMMAT= TRANSFORMATION MATRIX
// PORT: SOURCE P20-P25.agc:1794
//#	MARKSTAT= ADDRESS OF START OF MARK DATA (MARK DATA OF EACH MARK IS
// PORT: SOURCE P20-P25.agc:1795
//#		  STORED AS FOLLOWS: TIME,AIG,SA,AMG,PA,AOG) TIME IS IN DOUBLE
// PORT: SOURCE P20-P25.agc:1796
//#		  PRECISION, ALL OTHERS ARE IN SINGLE PRECISION
// PORT: SOURCE P20-P25.agc:1797
//#	CSM STATE VECTOR
// PORT: SOURCE P20-P25.agc:1798
//#
// PORT: SOURCE P20-P25.agc:1799
//# OUTPUT
// PORT: SOURCE P20-P25.agc:1800
//#	UPDATED CSM STATE VECTOR
// PORT: SOURCE P20-P25.agc:1801
//#	UPDATED LANDMARK POSITION
// PORT: SOURCE P20-P25.agc:1802
//#	NEW 6 DIMENSIONAL W MATRIX
// PORT: SOURCE P20-P25.agc:1803
//#
// PORT: SOURCE P20-P25.agc:1804
//# DEBRIS
// PORT: SOURCE P20-P25.agc:1805
//#	PUSH LIST,CSMPOS,ALPHAV,ERADM,UM,RCLP,USTAR,VARIANCE,X789,BVECTOR,8KK,
// PORT: SOURCE P20-P25.agc:1806
//#	S22LOC,SVMRKDAT TABLE,22SUBSCL,LANDMARK,CXOFF,S22C,LAT,LOG,ALT,
// PORT: SOURCE P20-P25.agc:1807
//#	TEMPOR1,S22TOFF,S221OFF,DSPTEM1,S22EORM,S22TPRIM
// PORT: SOURCE P20-P25.agc:1808
//
// PORT: SOURCE P20-P25.agc:1809
//		BANK	13
// PORT: SOURCE P20-P25.agc:1810
//
// PORT: SOURCE P20-P25.agc:1811
//		SETLOC	P20S6
// PORT: SOURCE P20-P25.agc:1812
//		BANK
// PORT: SOURCE P20-P25.agc:1813
//
// PORT: SOURCE P20-P25.agc:1814
//		EBANK=	LANDMARK
// PORT: SOURCE P20-P25.agc:1815
//		COUNT	35/LUORB
// PORT: SOURCE P20-P25.agc:1816
//
// PORT: SOURCE P20-P25.agc:1817
//S22.1		STQ	SSP
// PORT: Fixed ROM slots 26826.
    26826, 55584
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1818
//			S22RTNEX
// PORT: Fixed ROM slots 26827.
    26827, 3974,
// PORT: SOURCE P20-P25.agc:1819
//			S1
// PORT: Fixed ROM slots 26828.
    26828, 82,
// PORT: SOURCE P20-P25.agc:1820
//		DEC	6
// PORT: Fixed ROM slots 26829.
    26829, 12,
// PORT: SOURCE P20-P25.agc:1821
//		SSP	SSP		# SET I=1	ITEM 8KK IS I
// PORT: Fixed ROM slots 26830.
    26830, 55730,
// PORT: SOURCE P20-P25.agc:1822
//			8KK
// PORT: Fixed ROM slots 26831.
    26831, 3022,
// PORT: SOURCE P20-P25.agc:1823
//		DEC	1
// PORT: Fixed ROM slots 26832.
    26832, 2,
// PORT: SOURCE P20-P25.agc:1824
//			S22LOC
// PORT: Fixed ROM slots 26833.
    26833, 3026,
// PORT: SOURCE P20-P25.agc:1825
//		ECADR	SVMRKDAT	# SET MARK DATA ADDRESS INTO S22LOC
// PORT: Fixed ROM slots 26834.
    26834, 3774,
// PORT: SOURCE P20-P25.agc:1826
//# Page 599
// PORT: SOURCE P20-P25.agc:1827
//		LXC,2	AXT,1
// PORT: Fixed ROM slots 26835.
    26835, 63688,
// PORT: SOURCE P20-P25.agc:1828
//			MARKSTAT
// PORT: Fixed ROM slots 26836.
    26836, 1456,
// PORT: SOURCE P20-P25.agc:1829
//		DEC	36
// PORT: Fixed ROM slots 26837.
    26837, 72,
// PORT: SOURCE P20-P25.agc:1830
//S22.111		VLOAD*			# MOVE MARK DATA (5 SETS FROM ADDR. IN
// PORT: Fixed ROM slots 26838.
    26838, 65526,
// PORT: SOURCE P20-P25.agc:1831
//			0,2		# MARKSTAT TO SVMRKDAT TABLE TO AVOID LOSS
// PORT: Fixed ROM slots 26839.
    26839, 65532,
// PORT: SOURCE P20-P25.agc:1832
//		STORE	SVMRKDAT +36D,1	# IF RESTART OCCURS
// PORT: Fixed ROM slots 26840.
    26840, 7944,
// PORT: SOURCE P20-P25.agc:1833
//		INCR,2	TIX,1
// PORT: Fixed ROM slots 26841.
    26841, 49304,
// PORT: SOURCE P20-P25.agc:1834
//		DEC	-6
// PORT: Fixed ROM slots 26842.
    26842, 65522,
// PORT: SOURCE P20-P25.agc:1835
//			S22.111
// PORT: Fixed ROM slots 26843.
    26843, 49580,
// PORT: SOURCE P20-P25.agc:1836
//		SET	EXIT
// PORT: Fixed ROM slots 26844.
    26844, 65048,
// PORT: SOURCE P20-P25.agc:1837
//			P22MKFLG	# DOWNLINKED SVMRKDAT HOLDS PRESENT MARKS
// PORT: Fixed ROM slots 26845.
    26845, 1640
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26846–26846.
function agcAotUnit1566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1838
//		TC	BANKCALL	# RELEASE VAC AREA WHERE MARK DATA WAS
// PORT: Fixed ROM slots 26846.
    if slot <> 26846 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1566] to agcAotUnit1566@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1839
//		CADR	MKRELEAS
// PORT: Fixed ROM slots 26847.
    26847, 14438
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26848–26848.
function agcAotUnit1567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1840
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 26848.
    if slot <> 26848 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1567] to agcAotUnit1567@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1841
//		OCT	00004
// PORT: Fixed ROM slots 26849.
    26849, 8,
// PORT: SOURCE P20-P25.agc:1842
//		OCT	05022
// PORT: Fixed ROM slots 26850.
    26850, 5156,
// PORT: SOURCE P20-P25.agc:1843
//		OCT	13000
// PORT: Fixed ROM slots 26851.
    26851, 11264
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26852–26852.
function agcAotUnit1568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1844
//		TC	INTPRET
// PORT: Fixed ROM slots 26852.
    if slot <> 26852 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1568] to agcAotUnit1568@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1845
//		AXT,1	BOFF
// PORT: Fixed ROM slots 26853.
    26853, 36080,
// PORT: SOURCE P20-P25.agc:1846
//			0D
// PORT: Fixed ROM slots 26854.
    26854, 0,
// PORT: SOURCE P20-P25.agc:1847
//			CMOONFLG	# =0 EARTH, =1 MOON
// PORT: Fixed ROM slots 26855.
    26855, 4550,
// PORT: SOURCE P20-P25.agc:1848
//			S22SHIFT
// PORT: Fixed ROM slots 26856.
    26856, 49622,
// PORT: SOURCE P20-P25.agc:1849
//		INCR,1
// PORT: Fixed ROM slots 26857.
    26857, 65424,
// PORT: SOURCE P20-P25.agc:1850
//		DEC	-2
// PORT: Fixed ROM slots 26858.
    26858, 65530,
// PORT: SOURCE P20-P25.agc:1851
//S22SHIFT	SXA,1	SETPD
// PORT: Fixed ROM slots 26859.
    26859, 33200,
// PORT: SOURCE P20-P25.agc:1852
//			S22EORM		# SET =0 EARTH, =-2 MOON FOR SHIFTING
// PORT: Fixed ROM slots 26860.
    26860, 3958,
// PORT: SOURCE P20-P25.agc:1853
//			0D
// PORT: Fixed ROM slots 26861.
    26861, 2,
// PORT: SOURCE P20-P25.agc:1854
//FIG2EXIT	CALL
// PORT: Fixed ROM slots 26862.
    26862, 65320,
// PORT: SOURCE P20-P25.agc:1855
//			INTSTALL
// PORT: Fixed ROM slots 26863.
    26863, 24132,
// PORT: SOURCE P20-P25.agc:1856
//		CALL
// PORT: Fixed ROM slots 26864.
    26864, 65320,
// PORT: SOURCE P20-P25.agc:1857
//			S22FLGS
// PORT: Fixed ROM slots 26865.
    26865, 51674,
// PORT: SOURCE P20-P25.agc:1858
//#	FLOWCHART D=0	THEN DIM0FLAG=0, D6O9FLG NOT TESTED
// PORT: SOURCE P20-P25.agc:1859
//#	FLOWCHART D=6	THEN DIM0FLAG=1, D60R9FLG=0
// PORT: SOURCE P20-P25.agc:1860
//#	FLOWCHART D=9	THEN DIM0FLAG=1, D6OR9FLG=1
// PORT: SOURCE P20-P25.agc:1861
//
// PORT: SOURCE P20-P25.agc:1862
//		BOFF	CLRGO
// PORT: Fixed ROM slots 26866.
    26866, 35864,
// PORT: SOURCE P20-P25.agc:1863
//			ORBWFLAG
// PORT: Fixed ROM slots 26867.
    26867, 2002,
// PORT: SOURCE P20-P25.agc:1864
//			SETWW5D		# BRANCH TO SET W0-W5,ORBWFLAG,D
// PORT: Fixed ROM slots 26868.
    26868, 49646,
// PORT: SOURCE P20-P25.agc:1865
//			D6OR9FLG	# FLOWCHART D=6 PATH
// PORT: Fixed ROM slots 26869.
    26869, 1850,
// PORT: SOURCE P20-P25.agc:1866
//			SETVANDI
// PORT: Fixed ROM slots 26870.
    26870, 49688,
// PORT: SOURCE P20-P25.agc:1867
//SETWW5D		CLEAR
// PORT: Fixed ROM slots 26871.
    26871, 65304,
// PORT: SOURCE P20-P25.agc:1868
//			DIM0FLAG	# FLOWCHART D=0 PATH
// PORT: Fixed ROM slots 26872.
    26872, 1916,
// PORT: SOURCE P20-P25.agc:1869
//		AXT,1	SSP
// PORT: Fixed ROM slots 26873.
    26873, 55792,
// PORT: SOURCE P20-P25.agc:1870
//		DEC	108
// PORT: Fixed ROM slots 26874.
    26874, 216,
// PORT: SOURCE P20-P25.agc:1871
//			S1
// PORT: Fixed ROM slots 26875.
    26875, 82,
// PORT: SOURCE P20-P25.agc:1872
//		DEC	6
// PORT: Fixed ROM slots 26876.
    26876, 12,
// PORT: SOURCE P20-P25.agc:1873
//		CLEAR	VLOAD
// PORT: Fixed ROM slots 26877.
    26877, 64792,
// PORT: SOURCE P20-P25.agc:1874
//			RENDWFLG	# GSOP CHANGE 8/18/67
// PORT: Fixed ROM slots 26878.
    26878, 2940,
// PORT: SOURCE P20-P25.agc:1875
//			ZEROVECS
// PORT: Fixed ROM slots 26879.
    26879, 13754,
// PORT: SOURCE P20-P25.agc:1876
//CLEARWW5	STORE	W +108D,1
// PORT: Fixed ROM slots 26880.
    26880, 6874,
// PORT: SOURCE P20-P25.agc:1877
//# Page 600
// PORT: SOURCE P20-P25.agc:1878
//		TIX,1	SLOAD
// PORT: Fixed ROM slots 26881.
    26881, 56704,
// PORT: SOURCE P20-P25.agc:1879
//			CLEARWW5
// PORT: Fixed ROM slots 26882.
    26882, 49664,
// PORT: SOURCE P20-P25.agc:1880
//			WORBPOS
// PORT: Fixed ROM slots 26883.
    26883, 2058,
// PORT: SOURCE P20-P25.agc:1881
//		STORE	W		# SET DIAGONALS OF W0
// PORT: Fixed ROM slots 26884.
    26884, 2562,
// PORT: SOURCE P20-P25.agc:1882
//		STORE	W +8D
// PORT: Fixed ROM slots 26885.
    26885, 2578,
// PORT: SOURCE P20-P25.agc:1883
//		STORE	W +16D
// PORT: Fixed ROM slots 26886.
    26886, 2594,
// PORT: SOURCE P20-P25.agc:1884
//		SLOAD
// PORT: Fixed ROM slots 26887.
    26887, 65466,
// PORT: SOURCE P20-P25.agc:1885
//			WORBVEL
// PORT: Fixed ROM slots 26888.
    26888, 2060,
// PORT: SOURCE P20-P25.agc:1886
//		STORE	W +72D		# SET DIAGONALS OF W4
// PORT: Fixed ROM slots 26889.
    26889, 2706,
// PORT: SOURCE P20-P25.agc:1887
//		STORE	W +80D
// PORT: Fixed ROM slots 26890.
    26890, 2722,
// PORT: SOURCE P20-P25.agc:1888
//		STORE	W +88D
// PORT: Fixed ROM slots 26891.
    26891, 2738,
// PORT: SOURCE P20-P25.agc:1889
//SETVANDI	CLEAR
// PORT: Fixed ROM slots 26892.
    26892, 65304,
// PORT: SOURCE P20-P25.agc:1890
//			DMENFLG		# 0=6X6W, 1=9X9W
// PORT: Fixed ROM slots 26893.
    26893, 2924,
// PORT: SOURCE P20-P25.agc:1891
//S22NXTIN	CALL
// PORT: Fixed ROM slots 26894.
    26894, 65320,
// PORT: SOURCE P20-P25.agc:1892
//			GETTF
// PORT: Fixed ROM slots 26895.
    26895, 51666,
// PORT: SOURCE P20-P25.agc:1893
//		STCALL	TDEC1
// PORT: Fixed ROM slots 26896.
    26896, 28738,
// PORT: SOURCE P20-P25.agc:1894
//			INTEGRV
// PORT: Fixed ROM slots 26897.
    26897, 23780,
// PORT: SOURCE P20-P25.agc:1895
//		CALL
// PORT: Fixed ROM slots 26898.
    26898, 65320,
// PORT: SOURCE P20-P25.agc:1896
//			S22CALRC	# CALC. RC B-29 OR B-27 (CSMPOS)
// PORT: Fixed ROM slots 26899.
    26899, 50612,
// PORT: SOURCE P20-P25.agc:1897
//		LXA,1	SXA,1
// PORT: Fixed ROM slots 26900.
    26900, 55504,
// PORT: SOURCE P20-P25.agc:1898
//			S22LOC		# SETUP ADDR. OF MARK DATA FOR GETUM SUBR.
// PORT: Fixed ROM slots 26901.
    26901, 3024,
// PORT: SOURCE P20-P25.agc:1899
//			MARKDATA
// PORT: Fixed ROM slots 26902.
    26902, 1348,
// PORT: SOURCE P20-P25.agc:1900
//		CALL			# COMPUTE UM
// PORT: Fixed ROM slots 26903.
    26903, 65320,
// PORT: SOURCE P20-P25.agc:1901
//S2GETUM			GETUM
// PORT: Fixed ROM slots 26904.
    26904, 40072,
// PORT: SOURCE P20-P25.agc:1902
//		STORE	UM
// PORT: Fixed ROM slots 26905.
    26905, 1338,
// PORT: SOURCE P20-P25.agc:1903
//DMPINTEG	SLOAD	PUSH		# TEST OFF=I
// PORT: Fixed ROM slots 26906.
    26906, 34490,
// PORT: SOURCE P20-P25.agc:1904
//			8KK
// PORT: Fixed ROM slots 26907.
    26907, 3022,
// PORT: SOURCE P20-P25.agc:1905
//		SLOAD	SR3		# CXOFF SCALED B-5, MUST MOVE TO B-14
// PORT: Fixed ROM slots 26908.
    26908, 41658,
// PORT: SOURCE P20-P25.agc:1906
//			CXOFF		# BEFORE SUBT.
// PORT: Fixed ROM slots 26909.
    26909, 3020,
// PORT: SOURCE P20-P25.agc:1907
//		SR3	SR3
// PORT: Fixed ROM slots 26910.
    26910, 41540,
// PORT: SOURCE P20-P25.agc:1908
//		DSU
// PORT: Fixed ROM slots 26911.
    26911, 65322,
// PORT: SOURCE P20-P25.agc:1909
//		BHIZ	BON
// PORT: Fixed ROM slots 26912.
    26912, 35888,
// PORT: SOURCE P20-P25.agc:1910
//			S22OFF=I	# BRANCH HERE IF OFF=I
// PORT: Fixed ROM slots 26913.
    26913, 50138,
// PORT: SOURCE P20-P25.agc:1911
//			DMENFLG		# 0=6X6W, 1=9X9W
// PORT: Fixed ROM slots 26914.
    26914, 2956,
// PORT: SOURCE P20-P25.agc:1912
//			S22D=9
// PORT: Fixed ROM slots 26915.
    26915, 50150,
// PORT: SOURCE P20-P25.agc:1913
//		CALL
// PORT: Fixed ROM slots 26916.
    26916, 65320,
// PORT: SOURCE P20-P25.agc:1914
//			GRP2PC
// PORT: Fixed ROM slots 26917.
    26917, 48080,
// PORT: SOURCE P20-P25.agc:1915
//		SET
// PORT: Fixed ROM slots 26918.
    26918, 65304,
// PORT: SOURCE P20-P25.agc:1916
//			ORBWFLAG
// PORT: Fixed ROM slots 26919.
    26919, 1650,
// PORT: SOURCE P20-P25.agc:1917
//		SET	SET
// PORT: Fixed ROM slots 26920.
    26920, 35864,
// PORT: SOURCE P20-P25.agc:1918
//			DMENFLG		# =0 ON FIRST PASS THRU HERE FOR D=0, OR 6
// PORT: Fixed ROM slots 26921.
    26921, 2668,
// PORT: SOURCE P20-P25.agc:1919
//			22DSPFLG	# =1 TO DISPLAY DR,DV ON FIRST PASS
// PORT: Fixed ROM slots 26922.
    26922, 1124,
// PORT: SOURCE P20-P25.agc:1920
//		SET	BON
// PORT: Fixed ROM slots 26923.
    26923, 35864,
// PORT: SOURCE P20-P25.agc:1921
//			ERADFLAG	# =1 TO COMPUTE FISCHER RADIUS
// PORT: Fixed ROM slots 26924.
    26924, 612,
// PORT: SOURCE P20-P25.agc:1922
//			KNOWNFLG
// PORT: Fixed ROM slots 26925.
    26925, 3470,
// PORT: SOURCE P20-P25.agc:1923
//			S22BOX22
// PORT: Fixed ROM slots 26926.
    26926, 50342,
// PORT: SOURCE P20-P25.agc:1924
//		VLOAD	UNIT		# UNIT ALSO PUTS ABVAL(RC) IN 36D
// PORT: Fixed ROM slots 26927.
    26927, 44794,
// PORT: SOURCE P20-P25.agc:1925
//			CSMPOS
// PORT: Fixed ROM slots 26928.
    26928, 1294,
// PORT: SOURCE P20-P25.agc:1926
//		STORE	ALPHAV		# ALPHAV +4=SINL FOR SETRE
// PORT: Fixed ROM slots 26929.
    26929, 2260,
// PORT: SOURCE P20-P25.agc:1927
//		CLEAR	BOFF
// PORT: Fixed ROM slots 26930.
    26930, 35864,
// PORT: SOURCE P20-P25.agc:1928
//# Page 601
// PORT: SOURCE P20-P25.agc:1929
//			LUNAFLAG
// PORT: Fixed ROM slots 26931.
    26931, 1894,
// PORT: SOURCE P20-P25.agc:1930
//			CMOONFLG
// PORT: Fixed ROM slots 26932.
    26932, 4550,
// PORT: SOURCE P20-P25.agc:1931
//			S22C=I
// PORT: Fixed ROM slots 26933.
    26933, 49776,
// PORT: SOURCE P20-P25.agc:1932
//		SET
// PORT: Fixed ROM slots 26934.
    26934, 65304,
// PORT: SOURCE P20-P25.agc:1933
//			LUNAFLAG
// PORT: Fixed ROM slots 26935.
    26935, 1638,
// PORT: SOURCE P20-P25.agc:1934
//S22C=I		CALL			# ERADM= R0 METERS B-29 BOTH EARTH/MOON
// PORT: Fixed ROM slots 26936.
    26936, 65320,
// PORT: SOURCE P20-P25.agc:1935
//			SETRE
// PORT: Fixed ROM slots 26937.
    26937, 23298,
// PORT: SOURCE P20-P25.agc:1936
//		CALL			# COMPUTE RL FROM EQUATION 2.4.10
// PORT: Fixed ROM slots 26938.
    26938, 65320,
// PORT: SOURCE P20-P25.agc:1937
//			S22F2410	# STORED IN X789,MPAC B-27,B-29
// PORT: Fixed ROM slots 26939.
    26939, 50558,
// PORT: SOURCE P20-P25.agc:1938
//		BOFF	VSR2		# SCALE RL B-29 FOR BOTH EARTH/MOON
// PORT: Fixed ROM slots 26940.
    26940, 57880,
// PORT: SOURCE P20-P25.agc:1939
//			CMOONFLG
// PORT: Fixed ROM slots 26941.
    26941, 4550,
// PORT: SOURCE P20-P25.agc:1940
//			+1
// PORT: Fixed ROM slots 26942.
    26942, 49790,
// PORT: SOURCE P20-P25.agc:1941
//		STORE	S22RL
// PORT: Fixed ROM slots 26943.
    26943, 2874,
// PORT: SOURCE P20-P25.agc:1942
//		DOT	SL1
// PORT: Fixed ROM slots 26944.
    26944, 59970,
// PORT: SOURCE P20-P25.agc:1943
//			UM
// PORT: Fixed ROM slots 26945.
    26945, 1338,
// PORT: SOURCE P20-P25.agc:1944
//		STOVL	S22D		# D=UM RL B-29
// PORT: Fixed ROM slots 26946.
    26946, 20542,
// PORT: SOURCE P20-P25.agc:1945
//			ZEROVECS
// PORT: Fixed ROM slots 26947.
    26947, 13754,
// PORT: SOURCE P20-P25.agc:1946
//		SETPD	PUSH
// PORT: Fixed ROM slots 26948.
    26948, 34306,
// PORT: SOURCE P20-P25.agc:1947
//			0D
// PORT: Fixed ROM slots 26949.
    26949, 2,
// PORT: SOURCE P20-P25.agc:1948
//		PUSH	PDDL		# SET 0-18D = I BACKWARDS
// PORT: Fixed ROM slots 26950.
    26950, 54540,
// PORT: SOURCE P20-P25.agc:1949
//			HIDPHALF	# PD 18
// PORT: Fixed ROM slots 26951.
    26951, 13750,
// PORT: SOURCE P20-P25.agc:1950
//		SR2			# B-3
// PORT: Fixed ROM slots 26952.
    26952, 65412,
// PORT: SOURCE P20-P25.agc:1951
//		STORE	4D
// PORT: Fixed ROM slots 26953.
    26953, 10,
// PORT: SOURCE P20-P25.agc:1952
//		STORE	8D
// PORT: Fixed ROM slots 26954.
    26954, 18,
// PORT: SOURCE P20-P25.agc:1953
//		STOVL	12D
// PORT: Fixed ROM slots 26955.
    26955, 20506,
// PORT: SOURCE P20-P25.agc:1954
//			UM		# B-1
// PORT: Fixed ROM slots 26956.
    26956, 1338,
// PORT: SOURCE P20-P25.agc:1955
//		STOVL	S223X1
// PORT: Fixed ROM slots 26957.
    26957, 20518,
// PORT: SOURCE P20-P25.agc:1956
//			S22RL		# B-29
// PORT: Fixed ROM slots 26958.
    26958, 2874,
// PORT: SOURCE P20-P25.agc:1957
//		CALL			# (UM)(RL T) B-30 STORED IN S22UMRL THRU
// PORT: Fixed ROM slots 26959.
    26959, 65320,
// PORT: SOURCE P20-P25.agc:1958
//			S2231X13	# S22UMRL +17D
// PORT: Fixed ROM slots 26960.
    26960, 51636,
// PORT: SOURCE P20-P25.agc:1959
//		AXT,1	SSP
// PORT: Fixed ROM slots 26961.
    26961, 55792,
// PORT: SOURCE P20-P25.agc:1960
//		DEC	18
// PORT: Fixed ROM slots 26962.
    26962, 36,
// PORT: SOURCE P20-P25.agc:1961
//			S1
// PORT: Fixed ROM slots 26963.
    26963, 82,
// PORT: SOURCE P20-P25.agc:1962
//		DEC	6
// PORT: Fixed ROM slots 26964.
    26964, 12,
// PORT: SOURCE P20-P25.agc:1963
//S22NXTU		VLOAD*	VSR2		# (UM)(RL T) B-32
// PORT: Fixed ROM slots 26965.
    26965, 58102,
// PORT: SOURCE P20-P25.agc:1964
//			S22UMRL +18D,1
// PORT: Fixed ROM slots 26966.
    26966, 3752,
// PORT: SOURCE P20-P25.agc:1965
//		V/SC
// PORT: Fixed ROM slots 26967.
    26967, 65474,
// PORT: SOURCE P20-P25.agc:1966
//			S22D		# D B-29
// PORT: Fixed ROM slots 26968.
    26968, 62,
// PORT: SOURCE P20-P25.agc:1967
//		BVSU	STADR		# SUBTRACT FROM I B-3
// PORT: Fixed ROM slots 26969.
    26969, 38474,
// PORT: SOURCE P20-P25.agc:1968
//		STORE	S22UMRL +18D,1	# U MATRIX B-3
// PORT: Fixed ROM slots 26970.
    26970, 57686,
// PORT: SOURCE P20-P25.agc:1969
//		TIX,1	AXT,1		# PD 0 AFTER TIX
// PORT: Fixed ROM slots 26971.
    26971, 63616,
// PORT: SOURCE P20-P25.agc:1970
//			S22NXTU
// PORT: Fixed ROM slots 26972.
    26972, 49834,
// PORT: SOURCE P20-P25.agc:1971
//		DEC	36		# S1 STILL 6 FROM ABOVE
// PORT: Fixed ROM slots 26973.
    26973, 72,
// PORT: SOURCE P20-P25.agc:1972
//S22NXTWI	VLOAD*	MXV
// PORT: Fixed ROM slots 26974.
    26974, 53750
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1973
//			W +36D,1	# B-19
// PORT: Fixed ROM slots 26975.
    26975, 2634,
// PORT: SOURCE P20-P25.agc:1974
//			S22UMRL		# B-3
// PORT: Fixed ROM slots 26976.
    26976, 3716,
// PORT: SOURCE P20-P25.agc:1975
//		VSL3
// PORT: Fixed ROM slots 26977.
    26977, 65460,
// PORT: SOURCE P20-P25.agc:1976
//		STORE	W +144D,1	# W(I+18)= UW(I) B-19
// PORT: Fixed ROM slots 26978.
    26978, 6946,
// PORT: SOURCE P20-P25.agc:1977
//		TIX,1	DLOAD
// PORT: Fixed ROM slots 26979.
    26979, 58752,
// PORT: SOURCE P20-P25.agc:1978
//			S22NXTWI
// PORT: Fixed ROM slots 26980.
    26980, 49852,
// PORT: SOURCE P20-P25.agc:1979
//# Page 602
// PORT: SOURCE P20-P25.agc:1980
//			S22RHO		# B-28,B-30
// PORT: Fixed ROM slots 26981.
    26981, 66,
// PORT: SOURCE P20-P25.agc:1981
//		BOFF	SR2		# MAKE RHO B-30
// PORT: Fixed ROM slots 26982.
    26982, 49688,
// PORT: SOURCE P20-P25.agc:1982
//			CMOONFLG
// PORT: Fixed ROM slots 26983.
    26983, 4550,
// PORT: SOURCE P20-P25.agc:1983
//			+1
// PORT: Fixed ROM slots 26984.
    26984, 49874,
// PORT: SOURCE P20-P25.agc:1984
//		NORM	XAD,2
// PORT: Fixed ROM slots 26985.
    26985, 48258,
// PORT: SOURCE P20-P25.agc:1985
//			X2
// PORT: Fixed ROM slots 26986.
    26986, 80,
// PORT: SOURCE P20-P25.agc:1986
//			X2
// PORT: Fixed ROM slots 26987.
    26987, 78,
// PORT: SOURCE P20-P25.agc:1987
//		DSQ	DMP
// PORT: Fixed ROM slots 26988.
    26988, 34204,
// PORT: SOURCE P20-P25.agc:1988
//			SCTVAR		# B+16
// PORT: Fixed ROM slots 26989.
    26989, 18236,
// PORT: SOURCE P20-P25.agc:1989
//		SR1			# ACCOUNTS FOR 1/2 IN NEXT FORMULA
// PORT: Fixed ROM slots 26990.
    26990, 65476,
// PORT: SOURCE P20-P25.agc:1990
//		STORE	S22RHO		# 1/2(RHO SQ)(VARSCT)
// PORT: Fixed ROM slots 26991.
    26991, 66,
// PORT: SOURCE P20-P25.agc:1991
//		AXT,1
// PORT: Fixed ROM slots 26992.
    26992, 65520,
// PORT: SOURCE P20-P25.agc:1992
//		DEC	18		# S1 STILL 6 FROM ABOVE
// PORT: Fixed ROM slots 26993.
    26993, 36,
// PORT: SOURCE P20-P25.agc:1993
//S22NXXA		VLOAD*	MXV
// PORT: Fixed ROM slots 26994.
    26994, 53750,
// PORT: SOURCE P20-P25.agc:1994
//			S22UMRL +18D,1	# B-3
// PORT: Fixed ROM slots 26995.
    26995, 3752,
// PORT: SOURCE P20-P25.agc:1995
//			S22UMRL		# B-3
// PORT: Fixed ROM slots 26996.
    26996, 3716,
// PORT: SOURCE P20-P25.agc:1996
//		VXSC	VSR*
// PORT: Fixed ROM slots 26997.
    26997, 45026,
// PORT: SOURCE P20-P25.agc:1997
//			S22RHO
// PORT: Fixed ROM slots 26998.
    26998, 66,
// PORT: SOURCE P20-P25.agc:1998
//			0 -12D,2	# WITH VARRP SCALED B-28
// PORT: Fixed ROM slots 26999.
    26999, 48404,
// PORT: SOURCE P20-P25.agc:1999
//		STORE	S22UUT +18D,1	# 1/2(RHO SQ)(VARSCT)(U)(U T)
// PORT: Fixed ROM slots 27000.
    27000, 5506,
// PORT: SOURCE P20-P25.agc:2000
//		TIX,1	VLOAD
// PORT: Fixed ROM slots 27001.
    27001, 64896,
// PORT: SOURCE P20-P25.agc:2001
//			S22NXXA
// PORT: Fixed ROM slots 27002.
    27002, 49892,
// PORT: SOURCE P20-P25.agc:2002
//			UM
// PORT: Fixed ROM slots 27003.
    27003, 1338,
// PORT: SOURCE P20-P25.agc:2003
//		STCALL	S223X1		# UM ALSO IN MPAC FOR S2231X13 SUBR.
// PORT: Fixed ROM slots 27004.
    27004, 28710,
// PORT: SOURCE P20-P25.agc:2004
//			S2231X13	# (UM)(UM T) B-2 IN S22UMRL,P17D
// PORT: Fixed ROM slots 27005.
    27005, 51636,
// PORT: SOURCE P20-P25.agc:2005
//		DLOAD	SR3
// PORT: Fixed ROM slots 27006.
    27006, 41674,
// PORT: SOURCE P20-P25.agc:2006
//			ERADM		# B0 B-29
// PORT: Fixed ROM slots 27007.
    27007, 2370,
// PORT: SOURCE P20-P25.agc:2007
//		DDV	DSQ
// PORT: Fixed ROM slots 27008.
    27008, 52850,
// PORT: SOURCE P20-P25.agc:2008
//			S22D		# B-29
// PORT: Fixed ROM slots 27009.
    27009, 62,
// PORT: SOURCE P20-P25.agc:2009
//		DMP
// PORT: Fixed ROM slots 27010.
    27010, 65290,
// PORT: SOURCE P20-P25.agc:2010
//			RPVAR		# ***** METERS SQ
// PORT: Fixed ROM slots 27011.
    27011, 2064,
// PORT: SOURCE P20-P25.agc:2011
//		STORE	S22RHO		# TEMP (VARRP)(R0/D)
// PORT: Fixed ROM slots 27012.
    27012, 66,
// PORT: SOURCE P20-P25.agc:2012
//		AXT,1
// PORT: Fixed ROM slots 27013.
    27013, 65520,
// PORT: SOURCE P20-P25.agc:2013
//		DEC	18		# S1 STILL 6 FROM ABOVE
// PORT: Fixed ROM slots 27014.
    27014, 36,
// PORT: SOURCE P20-P25.agc:2014
//S22NXXB		VLOAD*	VXSC
// PORT: Fixed ROM slots 27015.
    27015, 61942,
// PORT: SOURCE P20-P25.agc:2015
//			S22UMRL +18D,1	# (UM)(UM T) B-2
// PORT: Fixed ROM slots 27016.
    27016, 3752,
// PORT: SOURCE P20-P25.agc:2016
//			S22RHO
// PORT: Fixed ROM slots 27017.
    27017, 66,
// PORT: SOURCE P20-P25.agc:2017
//		VAD*
// PORT: Fixed ROM slots 27018.
    27018, 65366,
// PORT: SOURCE P20-P25.agc:2018
//			S22UUT +18D,1
// PORT: Fixed ROM slots 27019.
    27019, 1410,
// PORT: SOURCE P20-P25.agc:2019
//		STORE	S22UUT +18D,1	# SMALL E MATRIX
// PORT: Fixed ROM slots 27020.
    27020, 5506,
// PORT: SOURCE P20-P25.agc:2020
//		VLOAD
// PORT: Fixed ROM slots 27021.
    27021, 65530,
// PORT: SOURCE P20-P25.agc:2021
//			ZEROVECS
// PORT: Fixed ROM slots 27022.
    27022, 13754,
// PORT: SOURCE P20-P25.agc:2022
//		STORE	W +162D,1	# CLEAR W8
// PORT: Fixed ROM slots 27023.
    27023, 6982,
// PORT: SOURCE P20-P25.agc:2023
//		TIX,1	BOV
// PORT: Fixed ROM slots 27024.
    27024, 32896,
// PORT: SOURCE P20-P25.agc:2024
//			S22NXXB
// PORT: Fixed ROM slots 27025.
    27025, 49934,
// PORT: SOURCE P20-P25.agc:2025
//			+1
// PORT: Fixed ROM slots 27026.
    27026, 49958,
// PORT: SOURCE P20-P25.agc:2026
//		DLOAD	BMN
// PORT: Fixed ROM slots 27027.
    27027, 41162,
// PORT: SOURCE P20-P25.agc:2027
//			S22UUT +16D	# E5
// PORT: Fixed ROM slots 27028.
    27028, 1406,
// PORT: SOURCE P20-P25.agc:2028
//			S22W76X
// PORT: Fixed ROM slots 27029.
    27029, 49992,
// PORT: SOURCE P20-P25.agc:2029
//		SQRT	BZE
// PORT: Fixed ROM slots 27030.
    27030, 44268,
// PORT: SOURCE P20-P25.agc:2030
//# Page 603
// PORT: SOURCE P20-P25.agc:2031
//			S22W76X
// PORT: Fixed ROM slots 27031.
    27031, 49992,
// PORT: SOURCE P20-P25.agc:2032
//		STODL	W +148D		# W74= SQ ROOT E5
// PORT: Fixed ROM slots 27032.
    27032, 15146,
// PORT: SOURCE P20-P25.agc:2033
//			S22UUT +14D	# E4
// PORT: Fixed ROM slots 27033.
    27033, 1402,
// PORT: SOURCE P20-P25.agc:2034
//		DDV	BOV
// PORT: Fixed ROM slots 27034.
    27034, 32882,
// PORT: SOURCE P20-P25.agc:2035
//			W +148D
// PORT: Fixed ROM slots 27035.
    27035, 2858,
// PORT: SOURCE P20-P25.agc:2036
//			S22W72X
// PORT: Fixed ROM slots 27036.
    27036, 49980,
// PORT: SOURCE P20-P25.agc:2037
//		STORE	W +146D		# W73= E4/W74
// PORT: Fixed ROM slots 27037.
    27037, 2854,
// PORT: SOURCE P20-P25.agc:2038
//S22W72X		DLOAD	DDV
// PORT: Fixed ROM slots 27038.
    27038, 47562,
// PORT: SOURCE P20-P25.agc:2039
//			S22UUT +12D	# E3
// PORT: Fixed ROM slots 27039.
    27039, 1398,
// PORT: SOURCE P20-P25.agc:2040
//			W +148D
// PORT: Fixed ROM slots 27040.
    27040, 2858,
// PORT: SOURCE P20-P25.agc:2041
//		BOV
// PORT: Fixed ROM slots 27041.
    27041, 65280,
// PORT: SOURCE P20-P25.agc:2042
//			S22W76X
// PORT: Fixed ROM slots 27042.
    27042, 49992,
// PORT: SOURCE P20-P25.agc:2043
//		STORE	W +144D		# W72= E4/W74
// PORT: Fixed ROM slots 27043.
    27043, 2850,
// PORT: SOURCE P20-P25.agc:2044
//S22W76X		DLOAD	DSQ
// PORT: Fixed ROM slots 27044.
    27044, 52938,
// PORT: SOURCE P20-P25.agc:2045
//			W +146D		# W73
// PORT: Fixed ROM slots 27045.
    27045, 2854,
// PORT: SOURCE P20-P25.agc:2046
//		BDSU	BMN
// PORT: Fixed ROM slots 27046.
    27046, 40994,
// PORT: SOURCE P20-P25.agc:2047
//			S22UUT +8D	# E2
// PORT: Fixed ROM slots 27047.
    27047, 1390,
// PORT: SOURCE P20-P25.agc:2048
//			S22W78X
// PORT: Fixed ROM slots 27048.
    27048, 50024,
// PORT: SOURCE P20-P25.agc:2049
//		SQRT	BZE
// PORT: Fixed ROM slots 27049.
    27049, 44268,
// PORT: SOURCE P20-P25.agc:2050
//			S22W78X
// PORT: Fixed ROM slots 27050.
    27050, 50024,
// PORT: SOURCE P20-P25.agc:2051
//		STODL	W +152D		# W76= SQ ROOT (E2-W73 SQ)
// PORT: Fixed ROM slots 27051.
    27051, 15154,
// PORT: SOURCE P20-P25.agc:2052
//			W +144D		# W72
// PORT: Fixed ROM slots 27052.
    27052, 2850,
// PORT: SOURCE P20-P25.agc:2053
//		DMP	BDSU
// PORT: Fixed ROM slots 27053.
    27053, 37130,
// PORT: SOURCE P20-P25.agc:2054
//			W +146D		# W73
// PORT: Fixed ROM slots 27054.
    27054, 2854,
// PORT: SOURCE P20-P25.agc:2055
//			S22UUT +6D	# E1
// PORT: Fixed ROM slots 27055.
    27055, 1386,
// PORT: SOURCE P20-P25.agc:2056
//		DDV	BOV
// PORT: Fixed ROM slots 27056.
    27056, 32882,
// PORT: SOURCE P20-P25.agc:2057
//			W +152D		# W76
// PORT: Fixed ROM slots 27057.
    27057, 2866,
// PORT: SOURCE P20-P25.agc:2058
//			S22W78X
// PORT: Fixed ROM slots 27058.
    27058, 50024,
// PORT: SOURCE P20-P25.agc:2059
//		STORE	W +150D		# W75= (E1-W72W73)/W76
// PORT: Fixed ROM slots 27059.
    27059, 2862,
// PORT: SOURCE P20-P25.agc:2060
//S22W78X		DLOAD	DSQ
// PORT: Fixed ROM slots 27060.
    27060, 52938,
// PORT: SOURCE P20-P25.agc:2061
//			W +150D
// PORT: Fixed ROM slots 27061.
    27061, 2862,
// PORT: SOURCE P20-P25.agc:2062
//		PDDL	DSQ
// PORT: Fixed ROM slots 27062.
    27062, 52906,
// PORT: SOURCE P20-P25.agc:2063
//			W +144D		# W72
// PORT: Fixed ROM slots 27063.
    27063, 2850,
// PORT: SOURCE P20-P25.agc:2064
//		DAD
// PORT: Fixed ROM slots 27064.
    27064, 65306,
// PORT: SOURCE P20-P25.agc:2065
//		BDSU	BMN
// PORT: Fixed ROM slots 27065.
    27065, 40994,
// PORT: SOURCE P20-P25.agc:2066
//			S22UUT		# E0
// PORT: Fixed ROM slots 27066.
    27066, 1374,
// PORT: SOURCE P20-P25.agc:2067
//			S22SCLW
// PORT: Fixed ROM slots 27067.
    27067, 50044,
// PORT: SOURCE P20-P25.agc:2068
//		SQRT
// PORT: Fixed ROM slots 27068.
    27068, 65516,
// PORT: SOURCE P20-P25.agc:2069
//		STORE	W +156D		# W78= SQ RT(E0-W72 SQ-W75 SQ)
// PORT: Fixed ROM slots 27069.
    27069, 2874,
// PORT: SOURCE P20-P25.agc:2070
//S22SCLW		VLOAD	VSR1		# SCALE W6 METERS B-19
// PORT: Fixed ROM slots 27070.
    27070, 62202,
// PORT: SOURCE P20-P25.agc:2071
//			W +144D
// PORT: Fixed ROM slots 27071.
    27071, 2850,
// PORT: SOURCE P20-P25.agc:2072
//		STOVL	W +144D
// PORT: Fixed ROM slots 27072.
    27072, 23330,
// PORT: SOURCE P20-P25.agc:2073
//			W +150D
// PORT: Fixed ROM slots 27073.
    27073, 2862,
// PORT: SOURCE P20-P25.agc:2074
//		VSR1
// PORT: Fixed ROM slots 27074.
    27074, 65508,
// PORT: SOURCE P20-P25.agc:2075
//		STOVL	W +150D
// PORT: Fixed ROM slots 27075.
    27075, 23342,
// PORT: SOURCE P20-P25.agc:2076
//			W +156D
// PORT: Fixed ROM slots 27076.
    27076, 2874,
// PORT: SOURCE P20-P25.agc:2077
//		VSR1
// PORT: Fixed ROM slots 27077.
    27077, 65508,
// PORT: SOURCE P20-P25.agc:2078
//		STORE	W +156D
// PORT: Fixed ROM slots 27078.
    27078, 2874,
// PORT: SOURCE P20-P25.agc:2079
//S22SAVET	CALL
// PORT: Fixed ROM slots 27079.
    27079, 65320,
// PORT: SOURCE P20-P25.agc:2080
//			GETTF
// PORT: Fixed ROM slots 27080.
    27080, 51666,
// PORT: SOURCE P20-P25.agc:2081
//# Page 604
// PORT: SOURCE P20-P25.agc:2082
//		STORE	S22TPRIM	# SAVE PRESENT TIME FOR PIOS
// PORT: Fixed ROM slots 27081.
    27081, 3956,
// PORT: SOURCE P20-P25.agc:2083
//S22I=N		EXIT			# TEST I=N
// PORT: Fixed ROM slots 27082.
    27082, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27083–27083.
function agcAotUnit1569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2084
//		TC	PHASCHNG
// PORT: Fixed ROM slots 27083.
    if slot <> 27083 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1569] to agcAotUnit1569@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2085
//		OCT	04022
// PORT: Fixed ROM slots 27084.
    27084, 4132
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27085–27095.
function agcAotUnit1570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27089 {
        if slot <= 27086 {
            if slot <= 27085 {
// PORT: SOURCE P20-P25.agc:2086
//		CS	8KK
// PORT: Fixed ROM slots 27085.
                if slot <> 27085 or instruction <> 17382 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 998).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2087
//		AD	8NN
// PORT: Fixed ROM slots 27086.
                if slot <> 27086 or instruction <> 25575 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 999).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27087 {
// PORT: SOURCE P20-P25.agc:2088
//		EXTEND
// PORT: Fixed ROM slots 27087.
                if slot <> 27087 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27088 {
// PORT: SOURCE P20-P25.agc:2089
//		BZMF	S22F244X	# EXIT TO FIGURE 2.4-4
// PORT: Fixed ROM slots 27088.
                    if slot <> 27088 or instruction <> 26225 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26225, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2090
//		CA	8KK		# I=I+1
// PORT: Fixed ROM slots 27089.
                    if slot <> 27089 or instruction <> 13286 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 998).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27092 {
            if slot <= 27090 {
// PORT: SOURCE P20-P25.agc:2091
//		AD	ONE
// PORT: Fixed ROM slots 27090.
                if slot <> 27090 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                if slot <= 27091 {
// PORT: SOURCE P20-P25.agc:2092
//		TS	TEMPOR1
// PORT: Fixed ROM slots 27091.
                    if slot <> 27091 or instruction <> 23232 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23232, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2093
//		CA	S22LOC		# ADD 7 TO LOC TO GET ADDR. OF NEXT MARK
// PORT: Fixed ROM slots 27092.
                    if slot <> 27092 or instruction <> 13288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1000).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27093 {
// PORT: SOURCE P20-P25.agc:2094
//		AD	SEVEN
// PORT: Fixed ROM slots 27093.
                if slot <> 27093 or instruction <> 27155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27094 {
// PORT: SOURCE P20-P25.agc:2095
//		TS	TEMPOR1 +1
// PORT: Fixed ROM slots 27094.
                    if slot <> 27094 or instruction <> 23233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23233, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2096
//		TC	PHASCHNG
// PORT: Fixed ROM slots 27095.
                    if slot <> 27095 or instruction <> 2826 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1570] to agcAotUnit1570@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2097
//		OCT	04022
// PORT: Fixed ROM slots 27096.
    27096, 4132
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27097–27101.
function agcAotUnit1571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27098 {
        if slot <= 27097 {
// PORT: SOURCE P20-P25.agc:2098
//		CA	TEMPOR1
// PORT: Fixed ROM slots 27097.
            if slot <> 27097 or instruction <> 12992 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 704).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2099
//		TS	8KK
// PORT: Fixed ROM slots 27098.
            if slot <> 27098 or instruction <> 23526 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23526, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27099 {
// PORT: SOURCE P20-P25.agc:2100
//		CA	TEMPOR1 +1
// PORT: Fixed ROM slots 27099.
            if slot <> 27099 or instruction <> 12993 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 705).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27100 {
// PORT: SOURCE P20-P25.agc:2101
//		TS	S22LOC
// PORT: Fixed ROM slots 27100.
                if slot <> 27100 or instruction <> 23528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2102
//		TC	INTPRET
// PORT: Fixed ROM slots 27101.
                if slot <> 27101 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1571] to agcAotUnit1571@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2103
//		CALL			# FOR ALL INTEGRATIONS OTHER THAN FIRST
// PORT: Fixed ROM slots 27102.
    27102, 65320,
// PORT: SOURCE P20-P25.agc:2104
//S2INTS1			INTSTALL
// PORT: Fixed ROM slots 27103.
    27103, 24132,
// PORT: SOURCE P20-P25.agc:2105
//		CALL
// PORT: Fixed ROM slots 27104.
    27104, 65320,
// PORT: SOURCE P20-P25.agc:2106
//			S22FLGS
// PORT: Fixed ROM slots 27105.
    27105, 51674,
// PORT: SOURCE P20-P25.agc:2107
//		BON	CLEAR
// PORT: Fixed ROM slots 27106.
    27106, 35864,
// PORT: SOURCE P20-P25.agc:2108
//			DMENFLG
// PORT: Fixed ROM slots 27107.
    27107, 2956,
// PORT: SOURCE P20-P25.agc:2109
//			S22NXTIN	# RETURN ALWAYS EXCEPT OFFSET POINT MARK 1
// PORT: Fixed ROM slots 27108.
    27108, 49692,
// PORT: SOURCE P20-P25.agc:2110
//			DIM0FLAG
// PORT: Fixed ROM slots 27109.
    27109, 1916,
// PORT: SOURCE P20-P25.agc:2111
//		BOFF	SET
// PORT: Fixed ROM slots 27110.
    27110, 35864,
// PORT: SOURCE P20-P25.agc:2112
//			ORBWFLAG
// PORT: Fixed ROM slots 27111.
    27111, 2002,
// PORT: SOURCE P20-P25.agc:2113
//			S22NXTIN	# OFFSET POINT MARK 1, NO W INTEGRATION
// PORT: Fixed ROM slots 27112.
    27112, 49692,
// PORT: SOURCE P20-P25.agc:2114
//			DIM0FLAG
// PORT: Fixed ROM slots 27113.
    27113, 1660,
// PORT: SOURCE P20-P25.agc:2115
//		CLRGO
// PORT: Fixed ROM slots 27114.
    27114, 65304,
// PORT: SOURCE P20-P25.agc:2116
//			D6OR9FLG
// PORT: Fixed ROM slots 27115.
    27115, 1850,
// PORT: SOURCE P20-P25.agc:2117
//			S22NXTIN	# OFFSET POINT MARK 1, INTEGRATE W 6X6
// PORT: Fixed ROM slots 27116.
    27116, 49692,
// PORT: SOURCE P20-P25.agc:2118
//S22OFF=I	CALL
// PORT: Fixed ROM slots 27117.
    27117, 65320,
// PORT: SOURCE P20-P25.agc:2119
//			GETTF
// PORT: Fixed ROM slots 27118.
    27118, 51666,
// PORT: SOURCE P20-P25.agc:2120
//		STOVL	S22TOFF		# TIME SUB OFF
// PORT: Fixed ROM slots 27119.
    27119, 24432,
// PORT: SOURCE P20-P25.agc:2121
//			UM
// PORT: Fixed ROM slots 27120.
    27120, 1338,
// PORT: SOURCE P20-P25.agc:2122
//		STCALL	S22UOFF		# U SUB OFF
// PORT: Fixed ROM slots 27121.
    27121, 29978,
// PORT: SOURCE P20-P25.agc:2123
//			S22I=N		# TEST I=N
// PORT: Fixed ROM slots 27122.
    27122, 50068,
// PORT: SOURCE P20-P25.agc:2124
//S22D=9		VLOAD			# D=9 PATH
// PORT: Fixed ROM slots 27123.
    27123, 65530,
// PORT: SOURCE P20-P25.agc:2125
//			X789
// PORT: Fixed ROM slots 27124.
    27124, 1922,
// PORT: SOURCE P20-P25.agc:2126
//		STODL	0D		# CALL PIOS TWICE TO TRANSFORM RL TO TIME
// PORT: Fixed ROM slots 27125.
    27125, 12290,
// PORT: SOURCE P20-P25.agc:2127
//			S22TPRIM	# T(SUB F) FROM TIME T PRIME
// PORT: Fixed ROM slots 27126.
    27126, 3956,
// PORT: SOURCE P20-P25.agc:2128
//		STORE	6D
// PORT: Fixed ROM slots 27127.
    27127, 14,
// PORT: SOURCE P20-P25.agc:2129
//		SLOAD	CALL
// PORT: Fixed ROM slots 27128.
    27128, 38074,
// PORT: SOURCE P20-P25.agc:2130
//			S22EORM		# 0=EARTH, NON-ZERO=MOON
// PORT: Fixed ROM slots 27129.
    27129, 3960,
// PORT: SOURCE P20-P25.agc:2131
//S2RTRP			R-TO-RP
// PORT: Fixed ROM slots 27130.
    27130, 46578,
// PORT: SOURCE P20-P25.agc:2132
//# Page 605
// PORT: SOURCE P20-P25.agc:2133
//		PUSH	CALL		# R-TO-RP LEAVES PUSHLOC AT 0
// PORT: Fixed ROM slots 27131.
    27131, 37900,
// PORT: SOURCE P20-P25.agc:2134
//			GETTF
// PORT: Fixed ROM slots 27132.
    27132, 51666,
// PORT: SOURCE P20-P25.agc:2135
//		STORE	6D
// PORT: Fixed ROM slots 27133.
    27133, 14,
// PORT: SOURCE P20-P25.agc:2136
//		SLOAD	CALL
// PORT: Fixed ROM slots 27134.
    27134, 38074,
// PORT: SOURCE P20-P25.agc:2137
//			S22EORM
// PORT: Fixed ROM slots 27135.
    27135, 3960,
// PORT: SOURCE P20-P25.agc:2138
//S2RPTR			RP-TO-R
// PORT: Fixed ROM slots 27136.
    27136, 46536,
// PORT: SOURCE P20-P25.agc:2139
//S22BOX32	STORE	X789
// PORT: Fixed ROM slots 27137.
    27137, 1922,
// PORT: SOURCE P20-P25.agc:2140
//		SET	BOV
// PORT: Fixed ROM slots 27138.
    27138, 32792,
// PORT: SOURCE P20-P25.agc:2141
//			INCORFLG	# FLAG=1
// PORT: Fixed ROM slots 27139.
    27139, 2664,
// PORT: SOURCE P20-P25.agc:2142
//			+1		# CLEAR OVERFLOW
// PORT: Fixed ROM slots 27140.
    27140, 50186,
// PORT: SOURCE P20-P25.agc:2143
//		VSU
// PORT: Fixed ROM slots 27141.
    27141, 65362,
// PORT: SOURCE P20-P25.agc:2144
//			CSMPOS
// PORT: Fixed ROM slots 27142.
    27142, 1294,
// PORT: SOURCE P20-P25.agc:2145
//		STORE	RCLP		# RCL=RL-RC
// PORT: Fixed ROM slots 27143.
    27143, 3762,
// PORT: SOURCE P20-P25.agc:2146
//		UNIT	VXV		# USTAR=UNIT(UNIT(RCL)XUM)
// PORT: Fixed ROM slots 27144.
    27144, 40284,
// PORT: SOURCE P20-P25.agc:2147
//			UM
// PORT: Fixed ROM slots 27145.
    27145, 1338,
// PORT: SOURCE P20-P25.agc:2148
//		UNIT	BOV
// PORT: Fixed ROM slots 27146.
    27146, 32860,
// PORT: SOURCE P20-P25.agc:2149
//			S22SAVET	# COMPUTATION OVERFLOW, SAVE TF
// PORT: Fixed ROM slots 27147.
    27147, 50062,
// PORT: SOURCE P20-P25.agc:2150
//		STORE	USTAR
// PORT: Fixed ROM slots 27148.
    27148, 1354,
// PORT: SOURCE P20-P25.agc:2151
//S22BOX12	SET	SET
// PORT: Fixed ROM slots 27149.
    27149, 35864,
// PORT: SOURCE P20-P25.agc:2152
//			DMENFLG		# =1 FOR 9X9 W
// PORT: Fixed ROM slots 27150.
    27150, 2668,
// PORT: SOURCE P20-P25.agc:2153
//			VEHUPFLG	# =1 FOR CSM
// PORT: Fixed ROM slots 27151.
    27151, 622,
// PORT: SOURCE P20-P25.agc:2154
//		DLOAD	DAD
// PORT: Fixed ROM slots 27152.
    27152, 36298,
// PORT: SOURCE P20-P25.agc:2155
//			SCTVAR		# B+18
// PORT: Fixed ROM slots 27153.
    27153, 18236,
// PORT: SOURCE P20-P25.agc:2156
//			IMUVARR		# B+18
// PORT: Fixed ROM slots 27154.
    27154, 18240,
// PORT: SOURCE P20-P25.agc:2157
//		STOVL	VARIANCE
// PORT: Fixed ROM slots 27155.
    27155, 24236,
// PORT: SOURCE P20-P25.agc:2158
//			RCLP		# B-29 OR B-27
// PORT: Fixed ROM slots 27156.
    27156, 3762,
// PORT: SOURCE P20-P25.agc:2159
//		ABVAL	NORM
// PORT: Fixed ROM slots 27157.
    27157, 49484,
// PORT: SOURCE P20-P25.agc:2160
//			X1
// PORT: Fixed ROM slots 27158.
    27158, 78,
// PORT: SOURCE P20-P25.agc:2161
//		DSQ	DMP
// PORT: Fixed ROM slots 27159.
    27159, 34204,
// PORT: SOURCE P20-P25.agc:2162
//			VARIANCE
// PORT: Fixed ROM slots 27160.
    27160, 3756,
// PORT: SOURCE P20-P25.agc:2163
//		XAD,1	XAD,1
// PORT: Fixed ROM slots 27161.
    27161, 47216,
// PORT: SOURCE P20-P25.agc:2164
//			X1		# DOUBLE NORM SHIFT SINCE RCLP WAS SQUARED
// PORT: Fixed ROM slots 27162.
    27162, 76,
// PORT: SOURCE P20-P25.agc:2165
//			S22EORM		# DOUBLE EARTH OR MOON SHIFT, SAME REASON
// PORT: Fixed ROM slots 27163.
    27163, 3958,
// PORT: SOURCE P20-P25.agc:2166
//		XAD,1	SR*
// PORT: Fixed ROM slots 27164.
    27164, 44912,
// PORT: SOURCE P20-P25.agc:2167
//			S22EORM
// PORT: Fixed ROM slots 27165.
    27165, 3958,
// PORT: SOURCE P20-P25.agc:2168
//			0,1		# SCALE VARIANCE B-40 FOR BOTH EARTH, MOON
// PORT: Fixed ROM slots 27166.
    27166, 17154,
// PORT: SOURCE P20-P25.agc:2169
//		TLOAD			# CHANGE MODE TO TRIPLE
// PORT: Fixed ROM slots 27167.
    27167, 65490,
// PORT: SOURCE P20-P25.agc:2170
//			MPAC
// PORT: Fixed ROM slots 27168.
    27168, 218,
// PORT: SOURCE P20-P25.agc:2171
//		STCALL	VARIANCE	# CALC B0,B1,DELTAQ, NEW USTAR
// PORT: Fixed ROM slots 27169.
    27169, 32428,
// PORT: SOURCE P20-P25.agc:2172
//S2BVTRS			BVECTORS
// PORT: Fixed ROM slots 27170.
    27170, 40006,
// PORT: SOURCE P20-P25.agc:2173
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 27171.
    27171, 48890,
// PORT: SOURCE P20-P25.agc:2174
//			BVECTOR
// PORT: Fixed ROM slots 27172.
    27172, 3716,
// PORT: SOURCE P20-P25.agc:2175
//		STCALL	BVECTOR +12D	# B2=-B0
// PORT: Fixed ROM slots 27173.
    27173, 32412,
// PORT: SOURCE P20-P25.agc:2176
//S2INCP1			INCORP1
// PORT: Fixed ROM slots 27174.
    27174, 62808,
// PORT: SOURCE P20-P25.agc:2177
//		CALL
// PORT: Fixed ROM slots 27175.
    27175, 65320,
// PORT: SOURCE P20-P25.agc:2178
//			GRP2PC
// PORT: Fixed ROM slots 27176.
    27176, 48080,
// PORT: SOURCE P20-P25.agc:2179
//		BOFF	CLEAR
// PORT: Fixed ROM slots 27177.
    27177, 35864,
// PORT: SOURCE P20-P25.agc:2180
//			22DSPFLG	# =1 DISPLAY DELTA R,V	  =0 DO NOT
// PORT: Fixed ROM slots 27178.
    27178, 1476,
// PORT: SOURCE P20-P25.agc:2181
//			S22BOX42
// PORT: Fixed ROM slots 27179.
    27179, 50312,
// PORT: SOURCE P20-P25.agc:2182
//			22DSPFLG
// PORT: Fixed ROM slots 27180.
    27180, 1380,
// PORT: SOURCE P20-P25.agc:2183
//# Page 606
// PORT: SOURCE P20-P25.agc:2184
//		CALL
// PORT: Fixed ROM slots 27181.
    27181, 65320,
// PORT: SOURCE P20-P25.agc:2185
//			GRP2PC
// PORT: Fixed ROM slots 27182.
    27182, 48080,
// PORT: SOURCE P20-P25.agc:2186
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 27183.
    27183, 42746,
// PORT: SOURCE P20-P25.agc:2187
//			DELTAX		# DELTA R
// PORT: Fixed ROM slots 27184.
    27184, 1374,
// PORT: SOURCE P20-P25.agc:2188
//		LXA,1	SR*
// PORT: Fixed ROM slots 27185.
    27185, 45008,
// PORT: SOURCE P20-P25.agc:2189
//			S22EORM		# SCALE DELTA R ALWAYS METERS B-29
// PORT: Fixed ROM slots 27186.
    27186, 3958,
// PORT: SOURCE P20-P25.agc:2190
//			0,1
// PORT: Fixed ROM slots 27187.
    27187, 17154,
// PORT: SOURCE P20-P25.agc:2191
//		STOVL	N49DISP
// PORT: Fixed ROM slots 27188.
    27188, 24196,
// PORT: SOURCE P20-P25.agc:2192
//			DELTAX +6	# DELTA V
// PORT: Fixed ROM slots 27189.
    27189, 1386,
// PORT: SOURCE P20-P25.agc:2193
//		ABVAL	SR*		# DELTA V=METERS/CSEC B-7 ALWAYS
// PORT: Fixed ROM slots 27190.
    27190, 44876,
// PORT: SOURCE P20-P25.agc:2194
//			0,1
// PORT: Fixed ROM slots 27191.
    27191, 17154,
// PORT: SOURCE P20-P25.agc:2195
//		STORE	N49DISP +2
// PORT: Fixed ROM slots 27192.
    27192, 3720,
// PORT: SOURCE P20-P25.agc:2196
//		EXIT
// PORT: Fixed ROM slots 27193.
    27193, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27194–27195.
function agcAotUnit1572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27194 {
// PORT: SOURCE P20-P25.agc:2197
//		CAF	V06N49EE
// PORT: Fixed ROM slots 27194.
        if slot <> 27194 or instruction <> 14243 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1955), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2198
//		TC	BANKCALL
// PORT: Fixed ROM slots 27195.
        if slot <> 27195 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1572] to agcAotUnit1572@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2199
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 27196.
    27196, 17502
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27197–27203.
function agcAotUnit1573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27199 {
        if slot <= 27197 {
// PORT: SOURCE P20-P25.agc:2200
//		TC	GOTOPOOH	# V34E TERMINATE
// PORT: Fixed ROM slots 27197.
            if slot <> 27197 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27198 {
// PORT: SOURCE P20-P25.agc:2201
//		TC	+5		# INCORPORATE CHANGES
// PORT: Fixed ROM slots 27198.
                if slot <> 27198 or instruction <> 1603 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1603, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2202
//		TC	S22EXEX		# V32E RECYCLE
// PORT: Fixed ROM slots 27199.
                if slot <> 27199 or instruction <> 1719 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1719, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27201 {
            if slot <= 27200 {
// PORT: SOURCE P20-P25.agc:2203
//		CAF	BIT3
// PORT: Fixed ROM slots 27200.
                if slot <> 27200 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2204
//		TC	BLANKET
// PORT: Fixed ROM slots 27201.
                if slot <> 27201 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27202 {
// PORT: SOURCE P20-P25.agc:2205
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 27202.
                if slot <> 27202 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2206
//		TC	INTPRET
// PORT: Fixed ROM slots 27203.
                if slot <> 27203 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1573] to agcAotUnit1573@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2207
//S22BOX42	CALL
// PORT: Fixed ROM slots 27204.
    27204, 65320,
// PORT: SOURCE P20-P25.agc:2208
//			INCORP2
// PORT: Fixed ROM slots 27205.
    27205, 63084,
// PORT: SOURCE P20-P25.agc:2209
//		CALL			# CSMPOS=RC B-29 OR B-27
// PORT: Fixed ROM slots 27206.
    27206, 65320,
// PORT: SOURCE P20-P25.agc:2210
//			S22CALRC
// PORT: Fixed ROM slots 27207.
    27207, 50612,
// PORT: SOURCE P20-P25.agc:2211
//DMPINCP2	BOFF	CALL
// PORT: Fixed ROM slots 27208.
    27208, 37912,
// PORT: SOURCE P20-P25.agc:2212
//			INCORFLG
// PORT: Fixed ROM slots 27209.
    27209, 3016,
// PORT: SOURCE P20-P25.agc:2213
//			S22SAVET	# SAVE TF AND TEST I=N
// PORT: Fixed ROM slots 27210.
    27210, 50062,
// PORT: SOURCE P20-P25.agc:2214
//			GRP2PC
// PORT: Fixed ROM slots 27211.
    27211, 48080,
// PORT: SOURCE P20-P25.agc:2215
//		CLEAR	VLOAD
// PORT: Fixed ROM slots 27212.
    27212, 64792,
// PORT: SOURCE P20-P25.agc:2216
//			INCORFLG	# FLAG=0
// PORT: Fixed ROM slots 27213.
    27213, 2920,
// PORT: SOURCE P20-P25.agc:2217
//			X789
// PORT: Fixed ROM slots 27214.
    27214, 1922,
// PORT: SOURCE P20-P25.agc:2218
//		VSU
// PORT: Fixed ROM slots 27215.
    27215, 65362,
// PORT: SOURCE P20-P25.agc:2219
//			CSMPOS
// PORT: Fixed ROM slots 27216.
    27216, 1294,
// PORT: SOURCE P20-P25.agc:2220
//		STCALL	RCLP		# RCL=RL-RC
// PORT: Fixed ROM slots 27217.
    27217, 32434,
// PORT: SOURCE P20-P25.agc:2221
//			S22BOX12
// PORT: Fixed ROM slots 27218.
    27218, 50202,
// PORT: SOURCE P20-P25.agc:2222
//S22BOX22	AXT,1	SSP		# CLEAR W6,W7,W8.  (27 ELEMENTS 54 REGS)
// PORT: Fixed ROM slots 27219.
    27219, 55792,
// PORT: SOURCE P20-P25.agc:2223
//		DEC	54
// PORT: Fixed ROM slots 27220.
    27220, 108,
// PORT: SOURCE P20-P25.agc:2224
//			S1
// PORT: Fixed ROM slots 27221.
    27221, 82,
// PORT: SOURCE P20-P25.agc:2225
//		DEC	6
// PORT: Fixed ROM slots 27222.
    27222, 12,
// PORT: SOURCE P20-P25.agc:2226
//		VLOAD
// PORT: Fixed ROM slots 27223.
    27223, 65530,
// PORT: SOURCE P20-P25.agc:2227
//			ZEROVECS
// PORT: Fixed ROM slots 27224.
    27224, 13754,
// PORT: SOURCE P20-P25.agc:2228
//CLRW678		STORE	W +162D,1
// PORT: Fixed ROM slots 27225.
    27225, 6982,
// PORT: SOURCE P20-P25.agc:2229
//		TIX,1	SLOAD
// PORT: Fixed ROM slots 27226.
    27226, 56704,
// PORT: SOURCE P20-P25.agc:2230
//			CLRW678
// PORT: Fixed ROM slots 27227.
    27227, 50354,
// PORT: SOURCE P20-P25.agc:2231
//			S22WSUBL
// PORT: Fixed ROM slots 27228.
    27228, 2062,
// PORT: SOURCE P20-P25.agc:2232
//		STORE	W +144D
// PORT: Fixed ROM slots 27229.
    27229, 2850,
// PORT: SOURCE P20-P25.agc:2233
//		STORE	W +152D
// PORT: Fixed ROM slots 27230.
    27230, 2866,
// PORT: SOURCE P20-P25.agc:2234
//# Page 607
// PORT: SOURCE P20-P25.agc:2235
//		STORE	W +160D
// PORT: Fixed ROM slots 27231.
    27231, 2882,
// PORT: SOURCE P20-P25.agc:2236
//		CLEAR	BOFF		# SET LUNAFLAG, TIME FOR LALOTORV
// PORT: Fixed ROM slots 27232.
    27232, 35864,
// PORT: SOURCE P20-P25.agc:2237
//			LUNAFLAG	# ERADFLAG,LAT,LONG,ALT SET PREVIOUSLY
// PORT: Fixed ROM slots 27233.
    27233, 1894,
// PORT: SOURCE P20-P25.agc:2238
//			CMOONFLG	# CHECK SCALING OF ITEMS,ALT INPUT AND
// PORT: Fixed ROM slots 27234.
    27234, 4550,
// PORT: SOURCE P20-P25.agc:2239
//			S22BX22A	# RL OUTPUT IN ALPHAV BOTH B-29
// PORT: Fixed ROM slots 27235.
    27235, 50380,
// PORT: SOURCE P20-P25.agc:2240
//		SET
// PORT: Fixed ROM slots 27236.
    27236, 65304,
// PORT: SOURCE P20-P25.agc:2241
//			LUNAFLAG
// PORT: Fixed ROM slots 27237.
    27237, 1638,
// PORT: SOURCE P20-P25.agc:2242
//S22BX22A	CALL
// PORT: Fixed ROM slots 27238.
    27238, 65320,
// PORT: SOURCE P20-P25.agc:2243
//			GETTF
// PORT: Fixed ROM slots 27239.
    27239, 51666,
// PORT: SOURCE P20-P25.agc:2244
//		CALL			# COMPUTE RL
// PORT: Fixed ROM slots 27240.
    27240, 65320,
// PORT: SOURCE P20-P25.agc:2245
//			LALOTORV
// PORT: Fixed ROM slots 27241.
    27241, 23106,
// PORT: SOURCE P20-P25.agc:2246
//		VLOAD	BOFF
// PORT: Fixed ROM slots 27242.
    27242, 36090,
// PORT: SOURCE P20-P25.agc:2247
//			ALPHAV		# RL B-29
// PORT: Fixed ROM slots 27243.
    27243, 2260,
// PORT: SOURCE P20-P25.agc:2248
//			CMOONFLG
// PORT: Fixed ROM slots 27244.
    27244, 4550,
// PORT: SOURCE P20-P25.agc:2249
//			S22BX22B
// PORT: Fixed ROM slots 27245.
    27245, 50398,
// PORT: SOURCE P20-P25.agc:2250
//		VSL2			# SCALE RL B-27 FOR MOON
// PORT: Fixed ROM slots 27246.
    27246, 65492,
// PORT: SOURCE P20-P25.agc:2251
//S22BX22B	GOTO
// PORT: Fixed ROM slots 27247.
    27247, 65360,
// PORT: SOURCE P20-P25.agc:2252
//			S22BOX32
// PORT: Fixed ROM slots 27248.
    27248, 50178
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27249–27249.
function agcAotUnit1574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2253
//S22F244X	TC	INTPRET
// PORT: Fixed ROM slots 27249.
    if slot <> 27249 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1574] to agcAotUnit1574@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2254
//S22F244		SLOAD	BHIZ		# FIG 2.4-4	TEST OFF=0
// PORT: Fixed ROM slots 27250.
    27250, 39098,
// PORT: SOURCE P20-P25.agc:2255
//			CXOFF
// PORT: Fixed ROM slots 27251.
    27251, 3020,
// PORT: SOURCE P20-P25.agc:2256
//			S22BOX44
// PORT: Fixed ROM slots 27252.
    27252, 50464,
// PORT: SOURCE P20-P25.agc:2257
//		SR			# SCALE OFFSET B-14 THEN GET GR. 8NN
// PORT: Fixed ROM slots 27253.
    27253, 65378,
// PORT: SOURCE P20-P25.agc:2258
//			9D
// PORT: Fixed ROM slots 27254.
    27254, 17172,
// PORT: SOURCE P20-P25.agc:2259
//		STORE	ALPHAV		# TEMP
// PORT: Fixed ROM slots 27255.
    27255, 2260,
// PORT: SOURCE P20-P25.agc:2260
//		SLOAD	DSU
// PORT: Fixed ROM slots 27256.
    27256, 38330,
// PORT: SOURCE P20-P25.agc:2261
//			8NN
// PORT: Fixed ROM slots 27257.
    27257, 3024,
// PORT: SOURCE P20-P25.agc:2262
//			ALPHAV
// PORT: Fixed ROM slots 27258.
    27258, 2260,
// PORT: SOURCE P20-P25.agc:2263
//		BMN	CALL		# OFFSET GR. NO. MARKS.  FORGET IT
// PORT: Fixed ROM slots 27259.
    27259, 37952,
// PORT: SOURCE P20-P25.agc:2264
//			S22BOX44
// PORT: Fixed ROM slots 27260.
    27260, 50464,
// PORT: SOURCE P20-P25.agc:2265
//			GRP2PC		# GROUP 2 PHASE CHANGE
// PORT: Fixed ROM slots 27261.
    27261, 48080,
// PORT: SOURCE P20-P25.agc:2266
//		DLOAD
// PORT: Fixed ROM slots 27262.
    27262, 65482,
// PORT: SOURCE P20-P25.agc:2267
//			S22TOFF
// PORT: Fixed ROM slots 27263.
    27263, 3952,
// PORT: SOURCE P20-P25.agc:2268
//		STCALL	TDEC1		# CALC RC AT OFFSET TIME
// PORT: Fixed ROM slots 27264.
    27264, 28738,
// PORT: SOURCE P20-P25.agc:2269
//			CSMPREC
// PORT: Fixed ROM slots 27265.
    27265, 23666,
// PORT: SOURCE P20-P25.agc:2270
//		VLOAD
// PORT: Fixed ROM slots 27266.
    27266, 65530,
// PORT: SOURCE P20-P25.agc:2271
//			RATT1		# RC METERS B-29 OR B-27
// PORT: Fixed ROM slots 27267.
    27267, 30,
// PORT: SOURCE P20-P25.agc:2272
//		STOVL	CSMPOS
// PORT: Fixed ROM slots 27268.
    27268, 21774,
// PORT: SOURCE P20-P25.agc:2273
//			S22UOFF
// PORT: Fixed ROM slots 27269.
    27269, 1306,
// PORT: SOURCE P20-P25.agc:2274
//		STOVL	UM		# U=UOFF
// PORT: Fixed ROM slots 27270.
    27270, 21818,
// PORT: SOURCE P20-P25.agc:2275
//			X789
// PORT: Fixed ROM slots 27271.
    27271, 1922,
// PORT: SOURCE P20-P25.agc:2276
//		ABVAL	BOFF
// PORT: Fixed ROM slots 27272.
    27272, 35916,
// PORT: SOURCE P20-P25.agc:2277
//			CMOONFLG
// PORT: Fixed ROM slots 27273.
    27273, 4550,
// PORT: SOURCE P20-P25.agc:2278
//			+2
// PORT: Fixed ROM slots 27274.
    27274, 50456,
// PORT: SOURCE P20-P25.agc:2279
//		SR2			# SCALE MOON R0 B-29 FOR S22F2410 SUBR
// PORT: Fixed ROM slots 27275.
    27275, 65412,
// PORT: SOURCE P20-P25.agc:2280
//		STCALL	ERADM
// PORT: Fixed ROM slots 27276.
    27276, 31042,
// PORT: SOURCE P20-P25.agc:2281
//			S22F2410
// PORT: Fixed ROM slots 27277.
    27277, 50558,
// PORT: SOURCE P20-P25.agc:2282
//		GOTO
// PORT: Fixed ROM slots 27278.
    27278, 65360,
// PORT: SOURCE P20-P25.agc:2283
//			S22BX44A
// PORT: Fixed ROM slots 27279.
    27279, 50470,
// PORT: SOURCE P20-P25.agc:2284
//S22BOX44	CALL
// PORT: Fixed ROM slots 27280.
    27280, 65320,
// PORT: SOURCE P20-P25.agc:2285
//# Page 608
// PORT: SOURCE P20-P25.agc:2286
//			GETTF
// PORT: Fixed ROM slots 27281.
    27281, 51666,
// PORT: SOURCE P20-P25.agc:2287
//		STORE	S22TOFF		# PRESENT TIME FOR LAT-LONG SETUP
// PORT: Fixed ROM slots 27282.
    27282, 3952,
// PORT: SOURCE P20-P25.agc:2288
//S22BX44A	CLEAR	VLOAD
// PORT: Fixed ROM slots 27283.
    27283, 64792,
// PORT: SOURCE P20-P25.agc:2289
//			LUNAFLAG
// PORT: Fixed ROM slots 27284.
    27284, 1894,
// PORT: SOURCE P20-P25.agc:2290
//			X789
// PORT: Fixed ROM slots 27285.
    27285, 1922,
// PORT: SOURCE P20-P25.agc:2291
//		BOFF	SET
// PORT: Fixed ROM slots 27286.
    27286, 35864,
// PORT: SOURCE P20-P25.agc:2292
//			CMOONFLG
// PORT: Fixed ROM slots 27287.
    27287, 4550,
// PORT: SOURCE P20-P25.agc:2293
//			S22BX44B
// PORT: Fixed ROM slots 27288.
    27288, 50486,
// PORT: SOURCE P20-P25.agc:2294
//			LUNAFLAG	# SET = 1 FOR LAT-LONG
// PORT: Fixed ROM slots 27289.
    27289, 1638,
// PORT: SOURCE P20-P25.agc:2295
//		VSR2			# SCALE RL MOON B-29 FOR LAT-LONG
// PORT: Fixed ROM slots 27290.
    27290, 65476,
// PORT: SOURCE P20-P25.agc:2296
//S22BX44B	STODL	ALPHAV		# RL SCALED B-29 FOR LAT-LONG
// PORT: Fixed ROM slots 27291.
    27291, 14548,
// PORT: SOURCE P20-P25.agc:2297
//			S22TOFF		# EITHER PRESENT OR OFFSET TIME
// PORT: Fixed ROM slots 27292.
    27292, 3952,
// PORT: SOURCE P20-P25.agc:2298
//		CALL
// PORT: Fixed ROM slots 27293.
    27293, 65320,
// PORT: SOURCE P20-P25.agc:2299
//			LAT-LONG	# **** ALT OUTPUT ALWAYS B-29
// PORT: Fixed ROM slots 27294.
    27294, 23024,
// PORT: SOURCE P20-P25.agc:2300
//		CALL			# DISPLAY LAT/LONG/ALT
// PORT: Fixed ROM slots 27295.
    27295, 65320,
// PORT: SOURCE P20-P25.agc:2301
//			LLASRD
// PORT: Fixed ROM slots 27296.
    27296, 51690,
// PORT: SOURCE P20-P25.agc:2302
//		EXIT
// PORT: Fixed ROM slots 27297.
    27297, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27298–27299.
function agcAotUnit1575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27298 {
// PORT: SOURCE P20-P25.agc:2303
//		CAF	V06N89B
// PORT: Fixed ROM slots 27298.
        if slot <> 27298 or instruction <> 14244 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1956), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2304
//		TC	BANKCALL
// PORT: Fixed ROM slots 27299.
        if slot <> 27299 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1575] to agcAotUnit1575@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2305
//		CADR	GOFLASH
// PORT: Fixed ROM slots 27300.
    27300, 17312
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27301–27304.
function agcAotUnit1576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27302 {
        if slot <= 27301 {
// PORT: SOURCE P20-P25.agc:2306
//		TC	S22GTP		# V34E TERMINATE
// PORT: Fixed ROM slots 27301.
            if slot <> 27301 or instruction <> 1722 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1722, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2307
//		TC	+2		# PROCEED	SAVE LANDING SITE COORD
// PORT: Fixed ROM slots 27302.
            if slot <> 27302 or instruction <> 1704 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1704, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27303 {
// PORT: SOURCE P20-P25.agc:2308
//		TC	S22.981X	# RECYCLE	POINT A IN GSOP
// PORT: Fixed ROM slots 27303.
            if slot <> 27303 or instruction <> 1715 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1715, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2309
//		TC 	INTPRET
// PORT: Fixed ROM slots 27304.
            if slot <> 27304 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1576] to agcAotUnit1576@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2310
//		DLOAD
// PORT: Fixed ROM slots 27305.
    27305, 65482,
// PORT: SOURCE P20-P25.agc:2311
//			S22TOFF		# EITHER PRESENT OR OFFSET TIME
// PORT: Fixed ROM slots 27306.
    27306, 3952,
// PORT: SOURCE P20-P25.agc:2312
//		STOVL	6D		# 6-7D= LANDING SITE TIME FOR R-TO-RP
// PORT: Fixed ROM slots 27307.
    27307, 20494,
// PORT: SOURCE P20-P25.agc:2313
//			X789
// PORT: Fixed ROM slots 27308.
    27308, 1922,
// PORT: SOURCE P20-P25.agc:2314
//		STORE	0D		# 0-5D= LANDING SITE VEC FOR R-TO-RP
// PORT: Fixed ROM slots 27309.
    27309, 2,
// PORT: SOURCE P20-P25.agc:2315
//		SLOAD	CALL
// PORT: Fixed ROM slots 27310.
    27310, 38074,
// PORT: SOURCE P20-P25.agc:2316
//			HIDPHALF	# ANY NON-ZERO FOR MOON
// PORT: Fixed ROM slots 27311.
    27311, 13750,
// PORT: SOURCE P20-P25.agc:2317
//			R-TO-RP		# CONVERT RLS TO MOON-FIXED COORD
// PORT: Fixed ROM slots 27312.
    27312, 46578,
// PORT: SOURCE P20-P25.agc:2318
//		STORE	RLS		# LANDING SITE VECTOR
// PORT: Fixed ROM slots 27313.
    27313, 2092,
// PORT: SOURCE P20-P25.agc:2319
//		EXIT
// PORT: Fixed ROM slots 27314.
    27314, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27315–27315.
function agcAotUnit1577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2320
//S22.981X	TC	INTPRET
// PORT: Fixed ROM slots 27315.
    if slot <> 27315 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1577] to agcAotUnit1577@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2321
//		CALL
// PORT: Fixed ROM slots 27316.
    27316, 65320,
// PORT: SOURCE P20-P25.agc:2322
//			9DWTO6DW
// PORT: Fixed ROM slots 27317.
    27317, 50628,
// PORT: SOURCE P20-P25.agc:2323
//		EXIT			# GO TO POINT A IN CHAPTER 5
// PORT: Fixed ROM slots 27318.
    27318, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27319–27319.
function agcAotUnit1578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2324
//S22EXEX		TC	INTPRET		# WITHOUT CONVERTING W
// PORT: Fixed ROM slots 27319.
    if slot <> 27319 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1578] to agcAotUnit1578@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2325
//		GOTO
// PORT: Fixed ROM slots 27320.
    27320, 65360,
// PORT: SOURCE P20-P25.agc:2326
//			S22RTNEX
// PORT: Fixed ROM slots 27321.
    27321, 3974
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27322–27322.
function agcAotUnit1579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2327
//
// PORT: SOURCE P20-P25.agc:2328
//S22GTP		TC	INTPRET		# CONVERT W BEFORE TC GOTOPOOH
// PORT: Fixed ROM slots 27322.
    if slot <> 27322 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1579] to agcAotUnit1579@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2329
//		CALL
// PORT: Fixed ROM slots 27323.
    27323, 65320,
// PORT: SOURCE P20-P25.agc:2330
//			9DWTO6DW
// PORT: Fixed ROM slots 27324.
    27324, 50628,
// PORT: SOURCE P20-P25.agc:2331
//		EXIT
// PORT: Fixed ROM slots 27325.
    27325, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27326–27326.
function agcAotUnit1580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2332
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 27326.
    if slot <> 27326 or instruction <> 2118 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2118, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1580] to agcAotUnit1580@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2333
//S22F2410	SETPD	VLOAD		# COMPUTE FORMULA 2.4.10
// PORT: Fixed ROM slots 27327.
    27327, 64770,
// PORT: SOURCE P20-P25.agc:2334
//			0D
// PORT: Fixed ROM slots 27328.
    27328, 2,
// PORT: SOURCE P20-P25.agc:2335
//			CSMPOS		# RC B-29 EARTH, B-27 MOON
// PORT: Fixed ROM slots 27329.
    27329, 1294,
// PORT: SOURCE P20-P25.agc:2336
//# Page 609
// PORT: SOURCE P20-P25.agc:2337
//		UNIT	DOT		# UNIT ALSO SETS 36D=ABVAL(RC) USED BELOW
// PORT: Fixed ROM slots 27330.
    27330, 41308,
// PORT: SOURCE P20-P25.agc:2338
//			UM
// PORT: Fixed ROM slots 27331.
    27331, 1338,
// PORT: SOURCE P20-P25.agc:2339
//		SL1	DCOMP		# GSOP CHANGE 8/18/67
// PORT: Fixed ROM slots 27332.
    27332, 48852,
// PORT: SOURCE P20-P25.agc:2340
//		PUSH			# PD 2D 8D=COSA=-(UM.RC)/ABVAL(RC) 	B-1
// PORT: Fixed ROM slots 27333.
    27333, 65292,
// PORT: SOURCE P20-P25.agc:2341
//		DSQ	BDSU
// PORT: Fixed ROM slots 27334.
    27334, 37276,
// PORT: SOURCE P20-P25.agc:2342
//			DEC1B2
// PORT: Fixed ROM slots 27335.
    27335, 18244,
// PORT: SOURCE P20-P25.agc:2343
//		PDDL	BOFF		# PD 4D 2D=1-COSA SQ=SINA SQ 		B-2
// PORT: Fixed ROM slots 27336.
    27336, 36010,
// PORT: SOURCE P20-P25.agc:2344
//			ERADM		# R0 ALWAYS B-29 FROM SETRE
// PORT: Fixed ROM slots 27337.
    27337, 2370,
// PORT: SOURCE P20-P25.agc:2345
//			CMOONFLG
// PORT: Fixed ROM slots 27338.
    27338, 4550,
// PORT: SOURCE P20-P25.agc:2346
//			+2
// PORT: Fixed ROM slots 27339.
    27339, 50586,
// PORT: SOURCE P20-P25.agc:2347
//		SL2			# SCALE R0 B-27 FOR MOON
// PORT: Fixed ROM slots 27340.
    27340, 65428,
// PORT: SOURCE P20-P25.agc:2348
//		SR1R	DDV		# (R0/RC) 	B-1
// PORT: Fixed ROM slots 27341.
    27341, 47588,
// PORT: SOURCE P20-P25.agc:2349
//			36D
// PORT: Fixed ROM slots 27342.
    27342, 74,
// PORT: SOURCE P20-P25.agc:2350
//		DSQ	DSU		# PD 2D (RP/RC) SQ - SINA SQ		B-2
// PORT: Fixed ROM slots 27343.
    27343, 38300,
// PORT: SOURCE P20-P25.agc:2351
//		SQRT	BDSU		# PD 0D COSA-SQRT((R0/RC)SQ-SINA SQ)	B-1
// PORT: Fixed ROM slots 27344.
    27344, 37356,
// PORT: SOURCE P20-P25.agc:2352
//		DMP			# DMP RESULT B-28 MOON, B-30 EARTH
// PORT: Fixed ROM slots 27345.
    27345, 65290,
// PORT: SOURCE P20-P25.agc:2353
//			36D		# VXSC RESULT B-29 MOON, B-31 EARTH
// PORT: Fixed ROM slots 27346.
    27346, 74,
// PORT: SOURCE P20-P25.agc:2354
//		STORE	S22RHO		# RHO FOR W INIT. OF UNKNOWN LMK B-28,B-30
// PORT: Fixed ROM slots 27347.
    27347, 66,
// PORT: SOURCE P20-P25.agc:2355
//		VXSC
// PORT: Fixed ROM slots 27348.
    27348, 65506,
// PORT: SOURCE P20-P25.agc:2356
//			UM
// PORT: Fixed ROM slots 27349.
    27349, 1338,
// PORT: SOURCE P20-P25.agc:2357
//		VSL2	VAD		# SCALE B-27 MOON, B-29 EARTH AND ADD RC
// PORT: Fixed ROM slots 27350.
    27350, 44500,
// PORT: SOURCE P20-P25.agc:2358
//			CSMPOS
// PORT: Fixed ROM slots 27351.
    27351, 1294,
// PORT: SOURCE P20-P25.agc:2359
//		STORE	X789
// PORT: Fixed ROM slots 27352.
    27352, 1922,
// PORT: SOURCE P20-P25.agc:2360
//		RVQ			# B-27 FOR EARTH OR B-29 FOR MOON
// PORT: Fixed ROM slots 27353.
    27353, 65308,
// PORT: SOURCE P20-P25.agc:2361
//S22CALRC	LXA,1	VLOAD		# COMPUTE RC B-29 OR B-27
// PORT: Fixed ROM slots 27354.
    27354, 64976,
// PORT: SOURCE P20-P25.agc:2362
//			S22EORM		# =0 FOR EARTH, -2 FOR MOON
// PORT: Fixed ROM slots 27355.
    27355, 3958,
// PORT: SOURCE P20-P25.agc:2363
//			DELTACSM
// PORT: Fixed ROM slots 27356.
    27356, 1782,
// PORT: SOURCE P20-P25.agc:2364
//		VSR*	VAD
// PORT: Fixed ROM slots 27357.
    27357, 44382,
// PORT: SOURCE P20-P25.agc:2365
//			7,1
// PORT: Fixed ROM slots 27358.
    27358, 17168,
// PORT: SOURCE P20-P25.agc:2366
//			RCVCSM
// PORT: Fixed ROM slots 27359.
    27359, 1806,
// PORT: SOURCE P20-P25.agc:2367
//		STORE	CSMPOS
// PORT: Fixed ROM slots 27360.
    27360, 1294,
// PORT: SOURCE P20-P25.agc:2368
//		RVQ
// PORT: Fixed ROM slots 27361.
    27361, 65308,
// PORT: SOURCE P20-P25.agc:2369
//		SETLOC	P22S
// PORT: SOURCE P20-P25.agc:2370
//		BANK
// PORT: SOURCE P20-P25.agc:2371
//
// PORT: SOURCE P20-P25.agc:2372
//S2231X13	STORE	S221X3		# MULT 3X1 BY 1X3, STORE RESULTING 3X3 IN
// PORT: Fixed ROM slots 27866.
    27866, 50,
// PORT: SOURCE P20-P25.agc:2373
//		SSP	AXT,2		# S22UMRL - S22UMRL+17D
// PORT: Fixed ROM slots 27867.
    27867, 64690,
// PORT: SOURCE P20-P25.agc:2374
//			S2
// PORT: Fixed ROM slots 27868.
    27868, 84,
// PORT: SOURCE P20-P25.agc:2375
//		DEC	2
// PORT: Fixed ROM slots 27869.
    27869, 4,
// PORT: SOURCE P20-P25.agc:2376
//		DEC	6
// PORT: Fixed ROM slots 27870.
    27870, 12,
// PORT: SOURCE P20-P25.agc:2377
//		AXT,1
// PORT: Fixed ROM slots 27871.
    27871, 65520,
// PORT: SOURCE P20-P25.agc:2378
//		DEC	18
// PORT: Fixed ROM slots 27872.
    27872, 36,
// PORT: SOURCE P20-P25.agc:2379
//S2231NXT	VLOAD	VXSC*
// PORT: Fixed ROM slots 27873.
    27873, 61434,
// PORT: SOURCE P20-P25.agc:2380
//			S221X3
// PORT: Fixed ROM slots 27874.
    27874, 50,
// PORT: SOURCE P20-P25.agc:2381
//			S223X1 	+6,2
// PORT: Fixed ROM slots 27875.
    27875, 65484,
// PORT: SOURCE P20-P25.agc:2382
//		STORE	S22UMRL +18D,1
// PORT: Fixed ROM slots 27876.
    27876, 7848,
// PORT: SOURCE P20-P25.agc:2383
//		INCR,1	TIX,2
// PORT: Fixed ROM slots 27877.
    27877, 50320,
// PORT: SOURCE P20-P25.agc:2384
//		DEC	-6
// PORT: Fixed ROM slots 27878.
    27878, 65522,
// PORT: SOURCE P20-P25.agc:2385
//			S2231NXT
// PORT: Fixed ROM slots 27879.
    27879, 51650,
// PORT: SOURCE P20-P25.agc:2386
//		RVQ
// PORT: Fixed ROM slots 27880.
    27880, 65308,
// PORT: SOURCE P20-P25.agc:2387
//# Page 610
// PORT: SOURCE P20-P25.agc:2388
//GETTF		LXC,1	DLOAD*		# SET MPAC= TF
// PORT: Fixed ROM slots 27881.
    27881, 58304,
// PORT: SOURCE P20-P25.agc:2389
//			S22LOC
// PORT: Fixed ROM slots 27882.
    27882, 3024,
// PORT: SOURCE P20-P25.agc:2390
//			0,1
// PORT: Fixed ROM slots 27883.
    27883, 2,
// PORT: SOURCE P20-P25.agc:2391
//		RVQ
// PORT: Fixed ROM slots 27884.
    27884, 65308,
// PORT: SOURCE P20-P25.agc:2392
//S22FLGS		SET	SET		# INTEGRATION FLAGS
// PORT: Fixed ROM slots 27885.
    27885, 35864,
// PORT: SOURCE P20-P25.agc:2393
//			DIM0FLAG
// PORT: Fixed ROM slots 27886.
    27886, 1660,
// PORT: SOURCE P20-P25.agc:2394
//			D6OR9FLG
// PORT: Fixed ROM slots 27887.
    27887, 1658,
// PORT: SOURCE P20-P25.agc:2395
//		SET	SET
// PORT: Fixed ROM slots 27888.
    27888, 35864,
// PORT: SOURCE P20-P25.agc:2396
//			VINTFLAG
// PORT: Fixed ROM slots 27889.
    27889, 1656,
// PORT: SOURCE P20-P25.agc:2397
//			STATEFLG
// PORT: Fixed ROM slots 27890.
    27890, 1652,
// PORT: SOURCE P20-P25.agc:2398
//		CLEAR	RVQ
// PORT: Fixed ROM slots 27891.
    27891, 36376,
// PORT: SOURCE P20-P25.agc:2399
//			INTYPFLG
// PORT: Fixed ROM slots 27892.
    27892, 1910,
// PORT: SOURCE P20-P25.agc:2400
//
// PORT: SOURCE P20-P25.agc:2401
//# SUBROUTINE TO MODIFY ALT AND STORE LAT TO LAT+5 IN LANDLAT TO LANDLAT+5
// PORT: SOURCE P20-P25.agc:2402
//# PRIOR TO DISPLAY.
// PORT: SOURCE P20-P25.agc:2403
//
// PORT: SOURCE P20-P25.agc:2404
//LLASRD		DLOAD			# ALT, LANDALT METERS B-29
// PORT: Fixed ROM slots 27893.
    27893, 65482,
// PORT: SOURCE P20-P25.agc:2405
//			ALT
// PORT: Fixed ROM slots 27894.
    27894, 1168,
// PORT: SOURCE P20-P25.agc:2406
//		STODL	LANDALT
// PORT: Fixed ROM slots 27895.
    27895, 14820,
// PORT: SOURCE P20-P25.agc:2407
//			LONG
// PORT: Fixed ROM slots 27896.
    27896, 1164,
// PORT: SOURCE P20-P25.agc:2408
//		SR1
// PORT: Fixed ROM slots 27897.
    27897, 65476,
// PORT: SOURCE P20-P25.agc:2409
//		STORE	LANDLONG
// PORT: Fixed ROM slots 27898.
    27898, 2528,
// PORT: SOURCE P20-P25.agc:2410
//		RVQ
// PORT: Fixed ROM slots 27899.
    27899, 65308,
// PORT: SOURCE P20-P25.agc:2411
//
// PORT: SOURCE P20-P25.agc:2412
//# SUBROUTINE TO MODIFY LANDALT AND STORE LANDALT TO LANDALT+5 IN LAT TO
// PORT: SOURCE P20-P25.agc:2413
//# LAT+5 AFTER LMK DATA LOADED BY ASTRONAUT.
// PORT: SOURCE P20-P25.agc:2414
//
// PORT: SOURCE P20-P25.agc:2415
//LLASRDA		DLOAD			# ALT, LANDALT METERS B-29
// PORT: Fixed ROM slots 27900.
    27900, 65482,
// PORT: SOURCE P20-P25.agc:2416
//			LANDALT
// PORT: Fixed ROM slots 27901.
    27901, 2532,
// PORT: SOURCE P20-P25.agc:2417
//		STODL	ALT
// PORT: Fixed ROM slots 27902.
    27902, 13456,
// PORT: SOURCE P20-P25.agc:2418
//			LANDLONG
// PORT: Fixed ROM slots 27903.
    27903, 2528,
// PORT: SOURCE P20-P25.agc:2419
//		SL1
// PORT: Fixed ROM slots 27904.
    27904, 65492,
// PORT: SOURCE P20-P25.agc:2420
//		STORE	LONG
// PORT: Fixed ROM slots 27905.
    27905, 1164,
// PORT: SOURCE P20-P25.agc:2421
//		RVQ
// PORT: Fixed ROM slots 27906.
    27906, 65308,
// PORT: SOURCE P20-P25.agc:2422
//		SETLOC	P20S6
// PORT: SOURCE P20-P25.agc:2423
//		BANK
// PORT: SOURCE P20-P25.agc:2424
//
// PORT: SOURCE P20-P25.agc:2425
//9DWTO6DW	STQ	SETPD
// PORT: Fixed ROM slots 27362.
    27362, 33056,
// PORT: SOURCE P20-P25.agc:2426
//			9DWXX
// PORT: Fixed ROM slots 27363.
    27363, 1304,
// PORT: SOURCE P20-P25.agc:2427
//			0D
// PORT: Fixed ROM slots 27364.
    27364, 2,
// PORT: SOURCE P20-P25.agc:2428
//		VLOAD	PUSH		# CLEAR WORKING AREA OF PUSHLIST
// PORT: Fixed ROM slots 27365.
    27365, 34554,
// PORT: SOURCE P20-P25.agc:2429
//			HI6ZEROS	# INCLUDING P
// PORT: Fixed ROM slots 27366.
    27366, 13754,
// PORT: SOURCE P20-P25.agc:2430
//		PUSH	PUSH		# PD 18D
// PORT: Fixed ROM slots 27367.
    27367, 34316,
// PORT: SOURCE P20-P25.agc:2431
//		SSP
// PORT: Fixed ROM slots 27368.
    27368, 65458,
// PORT: SOURCE P20-P25.agc:2432
//			9DWJ		# J=29	USE 2*29 FOR DP WORDS
// PORT: Fixed ROM slots 27369.
    27369, 30,
// PORT: SOURCE P20-P25.agc:2433
//		DEC	58
// PORT: Fixed ROM slots 27370.
    27370, 116,
// PORT: SOURCE P20-P25.agc:2434
//9DWI=J		LXA,1	SXA,1		# SET I=J
// PORT: Fixed ROM slots 27371.
    27371, 55504,
// PORT: SOURCE P20-P25.agc:2435
//			9DWJ
// PORT: Fixed ROM slots 27372.
    27372, 28,
// PORT: SOURCE P20-P25.agc:2436
//			9DWI
// PORT: Fixed ROM slots 27373.
    27373, 20,
// PORT: SOURCE P20-P25.agc:2437
//9DWEPCAL	CALL
// PORT: Fixed ROM slots 27374.
    27374, 65320,
// PORT: SOURCE P20-P25.agc:2438
//# Page 611
// PORT: SOURCE P20-P25.agc:2439
//			ROWDOT
// PORT: Fixed ROM slots 27375.
    27375, 50936,
// PORT: SOURCE P20-P25.agc:2440
//		LXA,1			# P VARIES 0-20 INSTEAD OF 20-0
// PORT: Fixed ROM slots 27376.
    27376, 65488,
// PORT: SOURCE P20-P25.agc:2441
//			9DWP
// PORT: Fixed ROM slots 27377.
    27377, 16,
// PORT: SOURCE P20-P25.agc:2442
//		STORE	EMATRIX +40D,1
// PORT: Fixed ROM slots 27378.
    27378, 6978,
// PORT: SOURCE P20-P25.agc:2443
//		INCR,1	SXA,1
// PORT: Fixed ROM slots 27379.
    27379, 55440,
// PORT: SOURCE P20-P25.agc:2444
//		DEC	2
// PORT: Fixed ROM slots 27380.
    27380, 4,
// PORT: SOURCE P20-P25.agc:2445
//			9DWP
// PORT: Fixed ROM slots 27381.
    27381, 16,
// PORT: SOURCE P20-P25.agc:2446
//		SLOAD	BHIZ		# TEST I=0
// PORT: Fixed ROM slots 27382.
    27382, 39098,
// PORT: SOURCE P20-P25.agc:2447
//			9DWI
// PORT: Fixed ROM slots 27383.
    27383, 22,
// PORT: SOURCE P20-P25.agc:2448
//			9DWTESTJ
// PORT: Fixed ROM slots 27384.
    27384, 50698,
// PORT: SOURCE P20-P25.agc:2449
//		DSU			# I=I-1
// PORT: Fixed ROM slots 27385.
    27385, 65322,
// PORT: SOURCE P20-P25.agc:2450
//			9DWID
// PORT: Fixed ROM slots 27386.
    27386, 18232,
// PORT: SOURCE P20-P25.agc:2451
//		STORE	9DWI
// PORT: Fixed ROM slots 27387.
    27387, 22,
// PORT: SOURCE P20-P25.agc:2452
//		DSU	BHIZ		# TEST I=26
// PORT: Fixed ROM slots 27388.
    27388, 38954,
// PORT: SOURCE P20-P25.agc:2453
//			9DW26D
// PORT: Fixed ROM slots 27389.
    27389, 18228,
// PORT: SOURCE P20-P25.agc:2454
//			9DWSETI2
// PORT: Fixed ROM slots 27390.
    27390, 50690,
// PORT: SOURCE P20-P25.agc:2455
//		GOTO			# NEXT E SUB P
// PORT: Fixed ROM slots 27391.
    27391, 65360,
// PORT: SOURCE P20-P25.agc:2456
//			9DWEPCAL
// PORT: Fixed ROM slots 27392.
    27392, 50652,
// PORT: SOURCE P20-P25.agc:2457
//9DWSETI2	SSP	GOTO		# I=2
// PORT: Fixed ROM slots 27393.
    27393, 43186,
// PORT: SOURCE P20-P25.agc:2458
//			9DWI
// PORT: Fixed ROM slots 27394.
    27394, 22,
// PORT: SOURCE P20-P25.agc:2459
//		DEC	4
// PORT: Fixed ROM slots 27395.
    27395, 8,
// PORT: SOURCE P20-P25.agc:2460
//			9DWEPCAL
// PORT: Fixed ROM slots 27396.
    27396, 50652
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2461
//9DWTESTJ	SLOAD	BHIZ		# TEST J=0
// PORT: Fixed ROM slots 27397.
    27397, 39098,
// PORT: SOURCE P20-P25.agc:2462
//			9DWJ
// PORT: Fixed ROM slots 27398.
    27398, 30,
// PORT: SOURCE P20-P25.agc:2463
//			9DWFIG6
// PORT: Fixed ROM slots 27399.
    27399, 50728,
// PORT: SOURCE P20-P25.agc:2464
//		DSU
// PORT: Fixed ROM slots 27400.
    27400, 65322,
// PORT: SOURCE P20-P25.agc:2465
//			9DWID
// PORT: Fixed ROM slots 27401.
    27401, 18232,
// PORT: SOURCE P20-P25.agc:2466
//		STORE	9DWJ		# J=J-1
// PORT: Fixed ROM slots 27402.
    27402, 30,
// PORT: SOURCE P20-P25.agc:2467
//		DSU	BHIZ		# TEST J=26
// PORT: Fixed ROM slots 27403.
    27403, 38954,
// PORT: SOURCE P20-P25.agc:2468
//			9DW26D
// PORT: Fixed ROM slots 27404.
    27404, 18228,
// PORT: SOURCE P20-P25.agc:2469
//			9DWSETJ2
// PORT: Fixed ROM slots 27405.
    27405, 50720,
// PORT: SOURCE P20-P25.agc:2470
//		GOTO
// PORT: Fixed ROM slots 27406.
    27406, 65360,
// PORT: SOURCE P20-P25.agc:2471
//			9DWI=J
// PORT: Fixed ROM slots 27407.
    27407, 50646,
// PORT: SOURCE P20-P25.agc:2472
//9DWSETJ2	SSP	GOTO		# SET J=2
// PORT: Fixed ROM slots 27408.
    27408, 43186,
// PORT: SOURCE P20-P25.agc:2473
//			9DWJ
// PORT: Fixed ROM slots 27409.
    27409, 30,
// PORT: SOURCE P20-P25.agc:2474
//		DEC	4
// PORT: Fixed ROM slots 27410.
    27410, 8,
// PORT: SOURCE P20-P25.agc:2475
//			9DWI=J
// PORT: Fixed ROM slots 27411.
    27411, 50646,
// PORT: SOURCE P20-P25.agc:2476
//9DWFIG6		CALL
// PORT: Fixed ROM slots 27412.
    27412, 65320,
// PORT: SOURCE P20-P25.agc:2477
//			GRP2PC
// PORT: Fixed ROM slots 27413.
    27413, 48080,
// PORT: SOURCE P20-P25.agc:2478
//		SSP	VLOAD		# START OF FIGURE 2.4-6
// PORT: Fixed ROM slots 27414.
    27414, 64946,
// PORT: SOURCE P20-P25.agc:2479
//			9DWJ		# J=29
// PORT: Fixed ROM slots 27415.
    27415, 30,
// PORT: SOURCE P20-P25.agc:2480
//		DEC	58
// PORT: Fixed ROM slots 27416.
    27416, 116,
// PORT: SOURCE P20-P25.agc:2481
//			HI6ZEROS
// PORT: Fixed ROM slots 27417.
    27417, 13754,
// PORT: SOURCE P20-P25.agc:2482
//		STORE	9DWP		# P,N,I=0
// PORT: Fixed ROM slots 27418.
    27418, 18,
// PORT: SOURCE P20-P25.agc:2483
//		AXT,1	SSP
// PORT: Fixed ROM slots 27419.
    27419, 55792,
// PORT: SOURCE P20-P25.agc:2484
//		DEC	108		# CLEAR W0 TO W54
// PORT: Fixed ROM slots 27420.
    27420, 216,
// PORT: SOURCE P20-P25.agc:2485
//			S1
// PORT: Fixed ROM slots 27421.
    27421, 82,
// PORT: SOURCE P20-P25.agc:2486
//			6
// PORT: Fixed ROM slots 27422.
    27422, 12,
// PORT: SOURCE P20-P25.agc:2487
//CLEARW54	STORE	W +108D,1
// PORT: Fixed ROM slots 27423.
    27423, 6874,
// PORT: SOURCE P20-P25.agc:2488
//		TIX,1
// PORT: Fixed ROM slots 27424.
    27424, 65408,
// PORT: SOURCE P20-P25.agc:2489
//# Page 612
// PORT: SOURCE P20-P25.agc:2490
//			CLEARW54
// PORT: Fixed ROM slots 27425.
    27425, 50750,
// PORT: SOURCE P20-P25.agc:2491
//9DWI=JA		LXA,1	SXA,1		# I=J
// PORT: Fixed ROM slots 27426.
    27426, 55504,
// PORT: SOURCE P20-P25.agc:2492
//			9DWJ
// PORT: Fixed ROM slots 27427.
    27427, 28,
// PORT: SOURCE P20-P25.agc:2493
//			9DWI
// PORT: Fixed ROM slots 27428.
    27428, 20,
// PORT: SOURCE P20-P25.agc:2494
//		CALL
// PORT: Fixed ROM slots 27429.
    27429, 65320,
// PORT: SOURCE P20-P25.agc:2495
//			ROWDOT
// PORT: Fixed ROM slots 27430.
    27430, 50936,
// PORT: SOURCE P20-P25.agc:2496
//		LXA,1	BDSU*
// PORT: Fixed ROM slots 27431.
    27431, 36816,
// PORT: SOURCE P20-P25.agc:2497
//			9DWP
// PORT: Fixed ROM slots 27432.
    27432, 16,
// PORT: SOURCE P20-P25.agc:2498
//			EMATRIX +40D,1
// PORT: Fixed ROM slots 27433.
    27433, 2882,
// PORT: SOURCE P20-P25.agc:2499
//		INCR,1	SXA,1		# -(P+1)
// PORT: Fixed ROM slots 27434.
    27434, 55440,
// PORT: SOURCE P20-P25.agc:2500
//			2
// PORT: Fixed ROM slots 27435.
    27435, 4,
// PORT: SOURCE P20-P25.agc:2501
//			9DWP
// PORT: Fixed ROM slots 27436.
    27436, 16,
// PORT: SOURCE P20-P25.agc:2502
//		LXC,1	XSU,1		# -(I+N)
// PORT: Fixed ROM slots 27437.
    27437, 45248,
// PORT: SOURCE P20-P25.agc:2503
//			9DWI
// PORT: Fixed ROM slots 27438.
    27438, 20,
// PORT: SOURCE P20-P25.agc:2504
//			9DWN
// PORT: Fixed ROM slots 27439.
    27439, 24,
// PORT: SOURCE P20-P25.agc:2505
//		BPL	DLOAD		# TEST WSQ LTE 0
// PORT: Fixed ROM slots 27440.
    27440, 58696,
// PORT: SOURCE P20-P25.agc:2506
//			9DWAAA
// PORT: Fixed ROM slots 27441.
    27441, 50794,
// PORT: SOURCE P20-P25.agc:2507
//			HI6ZEROS	# W=0
// PORT: Fixed ROM slots 27442.
    27442, 13754,
// PORT: SOURCE P20-P25.agc:2508
//		GOTO
// PORT: Fixed ROM slots 27443.
    27443, 65360,
// PORT: SOURCE P20-P25.agc:2509
//			9DWAAB
// PORT: Fixed ROM slots 27444.
    27444, 50796,
// PORT: SOURCE P20-P25.agc:2510
//9DWAAA		SQRT			# W= SQRT(WSQ)
// PORT: Fixed ROM slots 27445.
    27445, 65516,
// PORT: SOURCE P20-P25.agc:2511
//9DWAAB		STORE	W,1
// PORT: Fixed ROM slots 27446.
    27446, 6658,
// PORT: SOURCE P20-P25.agc:2512
//		STODL	WORKW
// PORT: Fixed ROM slots 27447.
    27447, 12290,
// PORT: SOURCE P20-P25.agc:2513
//			9DWJ		# TEST J=0
// PORT: Fixed ROM slots 27448.
    27448, 30,
// PORT: SOURCE P20-P25.agc:2514
//		BHIZ
// PORT: Fixed ROM slots 27449.
    27449, 65328,
// PORT: SOURCE P20-P25.agc:2515
//			9DWEXITX	# EXIT
// PORT: Fixed ROM slots 27450.
    27450, 50912,
// PORT: SOURCE P20-P25.agc:2516
//TST2I=0		SLOAD	BHIZ		# TEST I=0
// PORT: Fixed ROM slots 27451.
    27451, 39098,
// PORT: SOURCE P20-P25.agc:2517
//			9DWI
// PORT: Fixed ROM slots 27452.
    27452, 22,
// PORT: SOURCE P20-P25.agc:2518
//			9DWN=N+3
// PORT: Fixed ROM slots 27453.
    27453, 50876,
// PORT: SOURCE P20-P25.agc:2519
//		DSU
// PORT: Fixed ROM slots 27454.
    27454, 65322,
// PORT: SOURCE P20-P25.agc:2520
//			9DWID
// PORT: Fixed ROM slots 27455.
    27455, 18232,
// PORT: SOURCE P20-P25.agc:2521
//		STORE	9DWI		# I=I-1
// PORT: Fixed ROM slots 27456.
    27456, 22,
// PORT: SOURCE P20-P25.agc:2522
//		DSU	BHIZ		# TEST I=26
// PORT: Fixed ROM slots 27457.
    27457, 38954,
// PORT: SOURCE P20-P25.agc:2523
//			9DW26D
// PORT: Fixed ROM slots 27458.
    27458, 18228,
// PORT: SOURCE P20-P25.agc:2524
//			9DWAAC
// PORT: Fixed ROM slots 27459.
    27459, 50828,
// PORT: SOURCE P20-P25.agc:2525
//		GOTO
// PORT: Fixed ROM slots 27460.
    27460, 65360,
// PORT: SOURCE P20-P25.agc:2526
//			9DWNEXEP
// PORT: Fixed ROM slots 27461.
    27461, 50834,
// PORT: SOURCE P20-P25.agc:2527
//9DWAAC		SSP			# I=2
// PORT: Fixed ROM slots 27462.
    27462, 65458,
// PORT: SOURCE P20-P25.agc:2528
//			9DWI
// PORT: Fixed ROM slots 27463.
    27463, 22,
// PORT: SOURCE P20-P25.agc:2529
//			4
// PORT: Fixed ROM slots 27464.
    27464, 8,
// PORT: SOURCE P20-P25.agc:2530
//9DWNEXEP	CALL
// PORT: Fixed ROM slots 27465.
    27465, 65320,
// PORT: SOURCE P20-P25.agc:2531
//			ROWDOT
// PORT: Fixed ROM slots 27466.
    27466, 50936,
// PORT: SOURCE P20-P25.agc:2532
//		LXA,1	BDSU*		# (EP-ROWI*ROWJ)/W
// PORT: Fixed ROM slots 27467.
    27467, 36816,
// PORT: SOURCE P20-P25.agc:2533
//			9DWP
// PORT: Fixed ROM slots 27468.
    27468, 16,
// PORT: SOURCE P20-P25.agc:2534
//			EMATRIX +40D,1
// PORT: Fixed ROM slots 27469.
    27469, 2882,
// PORT: SOURCE P20-P25.agc:2535
//		DDV	INCR,1		# P=P+1
// PORT: Fixed ROM slots 27470.
    27470, 51314,
// PORT: SOURCE P20-P25.agc:2536
//			WORKW
// PORT: Fixed ROM slots 27471.
    27471, 2,
// PORT: SOURCE P20-P25.agc:2537
//			2
// PORT: Fixed ROM slots 27472.
    27472, 4,
// PORT: SOURCE P20-P25.agc:2538
//		SXA,1	LXC,1
// PORT: Fixed ROM slots 27473.
    27473, 57520,
// PORT: SOURCE P20-P25.agc:2539
//			9DWP
// PORT: Fixed ROM slots 27474.
    27474, 16,
// PORT: SOURCE P20-P25.agc:2540
//# Page 613
// PORT: SOURCE P20-P25.agc:2541
//			9DWI
// PORT: Fixed ROM slots 27475.
    27475, 20,
// PORT: SOURCE P20-P25.agc:2542
//		XSU,1	BOV		# -(I+N)
// PORT: Fixed ROM slots 27476.
    27476, 32864,
// PORT: SOURCE P20-P25.agc:2543
//			9DWN
// PORT: Fixed ROM slots 27477.
    27477, 24,
// PORT: SOURCE P20-P25.agc:2544
//			SETWIN=0
// PORT: Fixed ROM slots 27478.
    27478, 50866,
// PORT: SOURCE P20-P25.agc:2545
//		GOTO
// PORT: Fixed ROM slots 27479.
    27479, 65360,
// PORT: SOURCE P20-P25.agc:2546
//			9DWSETWX
// PORT: Fixed ROM slots 27480.
    27480, 50870,
// PORT: SOURCE P20-P25.agc:2547
//SETWIN=0	DLOAD			# W(I+N)=0
// PORT: Fixed ROM slots 27481.
    27481, 65482,
// PORT: SOURCE P20-P25.agc:2548
//			HI6ZEROS
// PORT: Fixed ROM slots 27482.
    27482, 13754,
// PORT: SOURCE P20-P25.agc:2549
//9DWSETWX	STORE	W,1
// PORT: Fixed ROM slots 27483.
    27483, 6658,
// PORT: SOURCE P20-P25.agc:2550
//		GOTO
// PORT: Fixed ROM slots 27484.
    27484, 65360,
// PORT: SOURCE P20-P25.agc:2551
//			TST2I=0
// PORT: Fixed ROM slots 27485.
    27485, 50806,
// PORT: SOURCE P20-P25.agc:2552
//9DWN=N+3	LXA,1	INCR,1		# N=N+3
// PORT: Fixed ROM slots 27486.
    27486, 51408,
// PORT: SOURCE P20-P25.agc:2553
//			9DWN
// PORT: Fixed ROM slots 27487.
    27487, 24,
// PORT: SOURCE P20-P25.agc:2554
//			6
// PORT: Fixed ROM slots 27488.
    27488, 12,
// PORT: SOURCE P20-P25.agc:2555
//		SXA,1	SLOAD		# J=J-1
// PORT: Fixed ROM slots 27489.
    27489, 56752,
// PORT: SOURCE P20-P25.agc:2556
//			9DWN
// PORT: Fixed ROM slots 27490.
    27490, 24,
// PORT: SOURCE P20-P25.agc:2557
//			9DWJ
// PORT: Fixed ROM slots 27491.
    27491, 30,
// PORT: SOURCE P20-P25.agc:2558
//		DSU
// PORT: Fixed ROM slots 27492.
    27492, 65322,
// PORT: SOURCE P20-P25.agc:2559
//			9DWID
// PORT: Fixed ROM slots 27493.
    27493, 18232,
// PORT: SOURCE P20-P25.agc:2560
//		STORE	9DWJ
// PORT: Fixed ROM slots 27494.
    27494, 30,
// PORT: SOURCE P20-P25.agc:2561
//		DSU	BHIZ		# TEST J=26
// PORT: Fixed ROM slots 27495.
    27495, 38954,
// PORT: SOURCE P20-P25.agc:2562
//			9DW26D
// PORT: Fixed ROM slots 27496.
    27496, 18228,
// PORT: SOURCE P20-P25.agc:2563
//			SETJ=2A
// PORT: Fixed ROM slots 27497.
    27497, 50904,
// PORT: SOURCE P20-P25.agc:2564
//		GOTO
// PORT: Fixed ROM slots 27498.
    27498, 65360,
// PORT: SOURCE P20-P25.agc:2565
//			9DWI=JA
// PORT: Fixed ROM slots 27499.
    27499, 50756,
// PORT: SOURCE P20-P25.agc:2566
//SETJ=2A		SSP	GOTO		# J=2
// PORT: Fixed ROM slots 27500.
    27500, 43186,
// PORT: SOURCE P20-P25.agc:2567
//			9DWJ
// PORT: Fixed ROM slots 27501.
    27501, 30,
// PORT: SOURCE P20-P25.agc:2568
//			4
// PORT: Fixed ROM slots 27502.
    27502, 8,
// PORT: SOURCE P20-P25.agc:2569
//			9DWI=JA
// PORT: Fixed ROM slots 27503.
    27503, 50756,
// PORT: SOURCE P20-P25.agc:2570
//9DWEXITX	CALL
// PORT: Fixed ROM slots 27504.
    27504, 65320,
// PORT: SOURCE P20-P25.agc:2571
//			GRP2PC
// PORT: Fixed ROM slots 27505.
    27505, 48080,
// PORT: SOURCE P20-P25.agc:2572
//		AXT,1	SSP		# CLEAR W6,W7,W8 USED TEMP FOR EMATRIX
// PORT: Fixed ROM slots 27506.
    27506, 55792,
// PORT: SOURCE P20-P25.agc:2573
//		DEC	54
// PORT: Fixed ROM slots 27507.
    27507, 108,
// PORT: SOURCE P20-P25.agc:2574
//			S1
// PORT: Fixed ROM slots 27508.
    27508, 82,
// PORT: SOURCE P20-P25.agc:2575
//			6
// PORT: Fixed ROM slots 27509.
    27509, 12,
// PORT: SOURCE P20-P25.agc:2576
//		VLOAD
// PORT: Fixed ROM slots 27510.
    27510, 65530,
// PORT: SOURCE P20-P25.agc:2577
//			HI6ZEROS
// PORT: Fixed ROM slots 27511.
    27511, 13754,
// PORT: SOURCE P20-P25.agc:2578
//9DWEXXXA	STORE	W +162D,1
// PORT: Fixed ROM slots 27512.
    27512, 6982,
// PORT: SOURCE P20-P25.agc:2579
//		TIX,1	GOTO
// PORT: Fixed ROM slots 27513.
    27513, 43136,
// PORT: SOURCE P20-P25.agc:2580
//			9DWEXXXA
// PORT: Fixed ROM slots 27514.
    27514, 50928,
// PORT: SOURCE P20-P25.agc:2581
//			9DWXX
// PORT: Fixed ROM slots 27515.
    27515, 1304,
// PORT: SOURCE P20-P25.agc:2582
//ROWDOT		SSP	BOV
// PORT: Fixed ROM slots 27516.
    27516, 32946,
// PORT: SOURCE P20-P25.agc:2583
//			XTMP1
// PORT: Fixed ROM slots 27517.
    27517, 14,
// PORT: SOURCE P20-P25.agc:2584
//		OCT	377
// PORT: Fixed ROM slots 27518.
    27518, 510,
// PORT: SOURCE P20-P25.agc:2585
//			+1
// PORT: Fixed ROM slots 27519.
    27519, 50944,
// PORT: SOURCE P20-P25.agc:2586
//		LXC,1	LXC,2
// PORT: Fixed ROM slots 27520.
    27520, 58560,
// PORT: SOURCE P20-P25.agc:2587
//			9DWI
// PORT: Fixed ROM slots 27521.
    27521, 20,
// PORT: SOURCE P20-P25.agc:2588
//			9DWJ
// PORT: Fixed ROM slots 27522.
    27522, 28
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2589
//		DLOAD	PUSH
// PORT: Fixed ROM slots 27523.
    27523, 34506,
// PORT: SOURCE P20-P25.agc:2590
//			HI6ZEROS
// PORT: Fixed ROM slots 27524.
    27524, 13754,
// PORT: SOURCE P20-P25.agc:2591
//# Page 614
// PORT: SOURCE P20-P25.agc:2592
//ROWDOT1		DLOAD*	DMPR*
// PORT: Fixed ROM slots 27525.
    27525, 48070,
// PORT: SOURCE P20-P25.agc:2593
//			W,1
// PORT: Fixed ROM slots 27526.
    27526, 2562,
// PORT: SOURCE P20-P25.agc:2594
//			W,2
// PORT: Fixed ROM slots 27527.
    27527, 62972,
// PORT: SOURCE P20-P25.agc:2595
//		DAD	PUSH
// PORT: Fixed ROM slots 27528.
    27528, 34330,
// PORT: SOURCE P20-P25.agc:2596
//		BOV	INCR,1
// PORT: Fixed ROM slots 27529.
    27529, 51200,
// PORT: SOURCE P20-P25.agc:2597
//			ROWDOT3
// PORT: Fixed ROM slots 27530.
    27530, 50988,
// PORT: SOURCE P20-P25.agc:2598
//		DEC	-6
// PORT: Fixed ROM slots 27531.
    27531, 65522,
// PORT: SOURCE P20-P25.agc:2599
//		INCR,2	SLOAD
// PORT: Fixed ROM slots 27532.
    27532, 56728,
// PORT: SOURCE P20-P25.agc:2600
//		DEC	-6
// PORT: Fixed ROM slots 27533.
    27533, 65522,
// PORT: SOURCE P20-P25.agc:2601
//			XTMP1
// PORT: Fixed ROM slots 27534.
    27534, 14,
// PORT: SOURCE P20-P25.agc:2602
//		BHIZ	SR1
// PORT: Fixed ROM slots 27535.
    27535, 57904,
// PORT: SOURCE P20-P25.agc:2603
//			ROWDOT2
// PORT: Fixed ROM slots 27536.
    27536, 50984,
// PORT: SOURCE P20-P25.agc:2604
//		STORE	XTMP1
// PORT: Fixed ROM slots 27537.
    27537, 14,
// PORT: SOURCE P20-P25.agc:2605
//		GOTO
// PORT: Fixed ROM slots 27538.
    27538, 65360,
// PORT: SOURCE P20-P25.agc:2606
//			ROWDOT1
// PORT: Fixed ROM slots 27539.
    27539, 50954,
// PORT: SOURCE P20-P25.agc:2607
//ROWDOT2		DLOAD
// PORT: Fixed ROM slots 27540.
    27540, 65482,
// PORT: SOURCE P20-P25.agc:2608
//		RVQ
// PORT: Fixed ROM slots 27541.
    27541, 65308,
// PORT: SOURCE P20-P25.agc:2609
//ROWDOT3		CLRGO
// PORT: Fixed ROM slots 27542.
    27542, 65304,
// PORT: SOURCE P20-P25.agc:2610
//			ORBWFLAG
// PORT: Fixed ROM slots 27543.
    27543, 1842,
// PORT: SOURCE P20-P25.agc:2611
//			ROWDOT2
// PORT: Fixed ROM slots 27544.
    27544, 50984,
// PORT: SOURCE P20-P25.agc:2612
//WORKW		=	0D
// PORT: SOURCE P20-P25.agc:2613
//XTMP1		=	6D
// PORT: SOURCE P20-P25.agc:2614
//9DWP		=	8D		# P
// PORT: SOURCE P20-P25.agc:2615
//9DWI		=	10D		# I
// PORT: SOURCE P20-P25.agc:2616
//9DWN		=	12D		# N
// PORT: SOURCE P20-P25.agc:2617
//9DWJ		=	14D		# J
// PORT: SOURCE P20-P25.agc:2618
//9DWXX		=	S22UOFF
// PORT: SOURCE P20-P25.agc:2619
//S22UMRL		=	BVECTOR		# 18
// PORT: SOURCE P20-P25.agc:2620
//S22UUT		=	DELTAX		# 18
// PORT: SOURCE P20-P25.agc:2621
//S223X1		=	18D		# 6
// PORT: SOURCE P20-P25.agc:2622
//S221X3		=	24D		# 6
// PORT: SOURCE P20-P25.agc:2623
//S22D		=	30D		# 2
// PORT: SOURCE P20-P25.agc:2624
//S22RHO		=	32D		# 2
// PORT: SOURCE P20-P25.agc:2625
//S22RL		=	W +156D		# 6
// PORT: SOURCE P20-P25.agc:2626
//9DW26D		2DEC	52 B-14
// PORT: Fixed ROM slots 27545 27546.
    27545, 104, 27546, 0,
// PORT: SOURCE P20-P25.agc:2627
//
// PORT: SOURCE P20-P25.agc:2628
//9DWID		2DEC	2 B-14
// PORT: Fixed ROM slots 27547 27548.
    27547, 4, 27548, 0,
// PORT: SOURCE P20-P25.agc:2629
//
// PORT: SOURCE P20-P25.agc:2630
//SCTVAR		2DEC	1.0 E-6 B+18
// PORT: Fixed ROM slots 27549 27550.
    27549, 8588, 27550, 31696,
// PORT: SOURCE P20-P25.agc:2631
//
// PORT: SOURCE P20-P25.agc:2632
//IMUVARR		2DEC	0.04 E-6 B+18
// PORT: Fixed ROM slots 27551 27552.
    27551, 342, 27552, 26172,
// PORT: SOURCE P20-P25.agc:2633
//
// PORT: SOURCE P20-P25.agc:2634
//DEC1B2		2DEC	1 B-2
// PORT: Fixed ROM slots 27553 27554.
    27553, 8192, 27554, 0,
// PORT: SOURCE P20-P25.agc:2635
//
// PORT: SOURCE P20-P25.agc:2636
//V06N49EE	VN	00649
// PORT: Fixed ROM slots 27555.
    27555, 1634,
// PORT: SOURCE P20-P25.agc:2637
//V06N89B		VN	00689
// PORT: Fixed ROM slots 27556.
    27556, 1714,
// PORT: SOURCE P20-P25.agc:2638
//S22UOFF		=	LEMPOS		# 6	U SUB OFF
// PORT: SOURCE P20-P25.agc:2639
//		SETLOC	P20S2
// PORT: SOURCE P20-P25.agc:2640
//		BANK
// PORT: SOURCE P20-P25.agc:2641
//# Page 615
// PORT: SOURCE P20-P25.agc:2642
//# Nothing on this page. --- RSB 2009.
// PORT: SOURCE P20-P25.agc:2643
//
// PORT: SOURCE P20-P25.agc:2644
//# Page 616
// PORT: SOURCE P20-P25.agc:2645
//# SUBROUTINE NAME:  V89CALL
// PORT: SOURCE P20-P25.agc:2646
//# MOD NO:  0					DATE: 8 FEB 1968
// PORT: SOURCE P20-P25.agc:2647
//# MOD BY:  DIGITAL DEVEL GROUP			LOG SECTION:  P20-P25
// PORT: SOURCE P20-P25.agc:2648
//#
// PORT: SOURCE P20-P25.agc:2649
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2650
//#
// PORT: SOURCE P20-P25.agc:2651
//# CALLED BY VERB 89 ENTER DURING P00.  PRIO 10 USED.  CALCULATES AND
// PORT: SOURCE P20-P25.agc:2652
//# DISPLAYS FINAL GIMBAL ANGLES TO POINT CSM +X AXIS OR PREFERRED AXIS
// PORT: SOURCE P20-P25.agc:2653
//# (UNIT(Z)COS55 DEG + UNIT(X)SIN55 DEG) AT LM.
// PORT: SOURCE P20-P25.agc:2654
//#
// PORT: SOURCE P20-P25.agc:2655
//# 1. KEY IN V89 E ONLY IF IN PROG 00. IF NOT IN P00, OPERATOR ERROR AND
// PORT: SOURCE P20-P25.agc:2656
//# EXIT R63, OTHERWISE CONTINUE.
// PORT: SOURCE P20-P25.agc:2657
//#
// PORT: SOURCE P20-P25.agc:2658
//# 2. IF IN P00, DO IMU STATUS CHECK (R02BOTH).  IF IMU ON AND ITS
// PORT: SOURCE P20-P25.agc:2659
//# ORIENTATION KNOWN TO CGC, CONTINUE.
// PORT: SOURCE P20-P25.agc:2660
//#
// PORT: SOURCE P20-P25.agc:2661
//# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
// PORT: SOURCE P20-P25.agc:2662
//# BE POINTED AT LM.  INITIAL CHOICE IS PREFERRED AXIS.  (R2=1).
// PORT: SOURCE P20-P25.agc:2663
//# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT= 1) BY V22 E 2 E.  CONTINUE
// PORT: SOURCE P20-P25.agc:2664
//# AFTER KEYING IN PROCEED.
// PORT: SOURCE P20-P25.agc:2665
//#
// PORT: SOURCE P20-P25.agc:2666
//# 4. SET PREFERRED ATTITUDE FLAG ACCORDING TO OPTION DESIRED.  SET FLAG
// PORT: SOURCE P20-P25.agc:2667
//# FOR PREFERRED AXIS.  RESET FLAG FOR X AXIS.
// PORT: SOURCE P20-P25.agc:2668
//#
// PORT: SOURCE P20-P25.agc:2669
//# 5. CURRENT TIME IS STORED AND R63COMP IS CALLED
// PORT: SOURCE P20-P25.agc:2670
//#
// PORT: SOURCE P20-P25.agc:2671
//#	R63COMP JOB:
// PORT: SOURCE P20-P25.agc:2672
//#
// PORT: SOURCE P20-P25.agc:2673
//#		UPDATE CSM AND LM STATE VECTORS USING CONIC EQUATIONS
// PORT: SOURCE P20-P25.agc:2674
//#
// PORT: SOURCE P20-P25.agc:2675
//#		CALCULATES BOTH PREFERRED AND X AXIS TRACKING ATT FROM CSM TO LM.
// PORT: SOURCE P20-P25.agc:2676
//#
// PORT: SOURCE P20-P25.agc:2677
//#		DESIRED GIMBAL ANGLES AS INDICATED BY PREFERRED ATTITUDE FLAG
// PORT: SOURCE P20-P25.agc:2678
//#		ARE STORED FOR LATER R60CSM CALL.
// PORT: SOURCE P20-P25.agc:2679
//#
// PORT: SOURCE P20-P25.agc:2680
//# 6. FLASH DISPLAY V 06 N18 AND AWAIT RESPONSE.
// PORT: SOURCE P20-P25.agc:2681
//#
// PORT: SOURCE P20-P25.agc:2682
//# 7. RECYCLE: RETURN TO STEP 5.
// PORT: SOURCE P20-P25.agc:2683
//#    TERMINATE: EXIT R63 ROUTINE
// PORT: SOURCE P20-P25.agc:2684
//#    PROCEED:  RESET 3AXISFLG AND CALL R60CSM FOR ATTITUDE MANEUVER.
// PORT: SOURCE P20-P25.agc:2685
//#
// PORT: SOURCE P20-P25.agc:2686
//# CALLING SEQUENCE:	V 89 E
// PORT: SOURCE P20-P25.agc:2687
//#
// PORT: SOURCE P20-P25.agc:2688
//# SUBROUTINES CALLED:  CHKPOOH, R02BOTH, GOXDSPF, R63COMP, R60CSM
// PORT: SOURCE P20-P25.agc:2689
//#
// PORT: SOURCE P20-P25.agc:2690
//# ALARMS	1.  OPERATOR ERROR IF NOT IN P00
// PORT: SOURCE P20-P25.agc:2691
//#		2.  PROGRAM ALARM IF IMU IS OFF
// PORT: SOURCE P20-P25.agc:2692
//#		3.  PROGRAM ALARM IF IMU ORIENTATION IS UNKNOWN
// PORT: SOURCE P20-P25.agc:2693
//# Page 617
// PORT: SOURCE P20-P25.agc:2694
//#
// PORT: SOURCE P20-P25.agc:2695
//# ERASABLE INITIALIZATION REQUIRED:  NONE
// PORT: SOURCE P20-P25.agc:2696
//#
// PORT: SOURCE P20-P25.agc:2697
//# DEBRIS:  OPTION1, OPTION1+1, PRFTEXAT(PREF ATT FLAG), P21TIME, 3AXISFLG
// PORT: SOURCE P20-P25.agc:2698
//
// PORT: SOURCE P20-P25.agc:2699
//DP1MIN		2DEC	6000
// PORT: Fixed ROM slots 22106 22107.
    22106, 0, 22107, 12000
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31690–31690.
function agcAotUnit1797 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2700
//
// PORT: SOURCE P20-P25.agc:2701
//		EBANK=	P21TIME
// PORT: SOURCE P20-P25.agc:2702
//		BANK	34
// PORT: SOURCE P20-P25.agc:2703
//		SETLOC	P20S4
// PORT: SOURCE P20-P25.agc:2704
//		BANK
// PORT: SOURCE P20-P25.agc:2705
//		COUNT*	$$/R63
// PORT: SOURCE P20-P25.agc:2706
//
// PORT: SOURCE P20-P25.agc:2707
//V89CALL		TC	BANKCALL	# IMU STATUS CHECK. RETURNS IF ORIENTATION
// PORT: Fixed ROM slots 31690.
    if slot <> 31690 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1797] to agcAotUnit1797@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2708
//		CADR	R02BOTH		# KNOWN.  ALARMS IF NOT.
// PORT: Fixed ROM slots 31691.
    31691, 16214
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31692–31697.
function agcAotUnit1798 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31694 {
        if slot <= 31692 {
// PORT: SOURCE P20-P25.agc:2709
//		CAF	THREE		# ALLOW ASTRONAUT TO SELECT DESIRED
// PORT: Fixed ROM slots 31692.
            if slot <> 31692 or instruction <> 15500 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31693 {
// PORT: SOURCE P20-P25.agc:2710
//		TS	OPTION1		# TRACKING ATTITUDE AXIS.
// PORT: Fixed ROM slots 31693.
                if slot <> 31693 or instruction <> 23129 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23129, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2711
//		CAF	ONE
// PORT: Fixed ROM slots 31694.
                if slot <> 31694 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
        if slot <= 31695 {
// PORT: SOURCE P20-P25.agc:2712
//		TS	OPTION1 +1
// PORT: Fixed ROM slots 31695.
            if slot <> 31695 or instruction <> 23130 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23130, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31696 {
// PORT: SOURCE P20-P25.agc:2713
//		CAF	VB04N06		# V 04 N 06
// PORT: Fixed ROM slots 31696.
                if slot <> 31696 or instruction <> 14321 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2033), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2714
//		TC	BANKCALL
// PORT: Fixed ROM slots 31697.
                if slot <> 31697 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1798] to agcAotUnit1798@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2715
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31698.
    31698, 17312
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31699–31704.
function agcAotUnit1799 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31701 {
        if slot <= 31699 {
// PORT: SOURCE P20-P25.agc:2716
//		TC	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 31699.
            if slot <> 31699 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31700 {
// PORT: SOURCE P20-P25.agc:2717
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 31700.
                if slot <> 31700 or instruction <> 2006 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2006, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2718
//		TC	-5		# DATA IN.  OPTION1 +1 = 1 FOR PREF AXIS
// PORT: Fixed ROM slots 31701.
                if slot <> 31701 or instruction <> 2000 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2000, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31702 {
// PORT: SOURCE P20-P25.agc:2719
//					#		       = 2 FOR X AXIS
// PORT: SOURCE P20-P25.agc:2720
//		CS	OPTION1 +1	# 1 FOR PREF AXIS.  2 FOR X AXIS.
// PORT: Fixed ROM slots 31702.
            if slot <> 31702 or instruction <> 16986 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 602).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31703 {
// PORT: SOURCE P20-P25.agc:2721
//		AD	ONE
// PORT: Fixed ROM slots 31703.
                if slot <> 31703 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:2722
//		EXTEND
// PORT: Fixed ROM slots 31704.
                if slot <> 31704 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1799] to agcAotUnit1799@.

// PORT: Physical bank 34. Shared continuation entries, slots 31705–31706.
function agcAotUnit1800 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31705 {
// PORT: SOURCE P20-P25.agc:2723
//		BZF	SETPAF
// PORT: Fixed ROM slots 31705.
        if slot <> 31705 or instruction <> 6126 { return choose false if checkOnly else -1. }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6126, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2724
//RSTPAF		TC	DOWNFLAG	# RESET PREF ATT FLAG FOR R63COMP
// PORT: Fixed ROM slots 31706.
        if slot <> 31706 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1800] to agcAotUnit1800@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2725
//		ADRES	RNGSCFLG	# TO DO X AXIS.  RESET BIT 10 FLAG 5
// PORT: Fixed ROM slots 31707.
    31707, 160
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31708–31708.
function agcAotUnit1801 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2726
//V89RECL		TC	INTPRET
// PORT: Fixed ROM slots 31708.
    if slot <> 31708 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1801] to agcAotUnit1801@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2727
//		RTB	DAD
// PORT: Fixed ROM slots 31709.
    31709, 36152,
// PORT: SOURCE P20-P25.agc:2728
//			LOADTIME	# READ PRESENT TIME
// PORT: Fixed ROM slots 31710.
    31710, 38544,
// PORT: SOURCE P20-P25.agc:2729
//			DP1MIN		# INTEGRATE TO 1 MIN FROM NOW
// PORT: Fixed ROM slots 31711.
    31711, 7350,
// PORT: SOURCE P20-P25.agc:2730
//		STCALL	P21TIME		# STORE TIME FOR CALL TO R63COMP.  R63COMP
// PORT: Fixed ROM slots 31712.
    31712, 31132,
// PORT: SOURCE P20-P25.agc:2731
//			R63COMP		# LEAVES DESIRED GIM ANGS IN THETAD, LOS IN
// PORT: Fixed ROM slots 31713.
    31713, 59124,
// PORT: SOURCE P20-P25.agc:2732
//		EXIT			# POINTVSM, AND SELECTED AXIS IN SCAXIS.
// PORT: Fixed ROM slots 31714.
    31714, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31715–31716.
function agcAotUnit1802 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31715 {
// PORT: SOURCE P20-P25.agc:2733
//		CAF	VB06N18		# V 06 N 18
// PORT: Fixed ROM slots 31715.
        if slot <> 31715 or instruction <> 14322 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2034), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2734
//		TC	BANKCALL	# NOUN 18 REFERS TO THE DESIRED GIMBAL
// PORT: Fixed ROM slots 31716.
        if slot <> 31716 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1802] to agcAotUnit1802@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2735
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31717.
    31717, 17312
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31718–31721.
function agcAotUnit1803 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31719 {
        if slot <= 31718 {
// PORT: SOURCE P20-P25.agc:2736
//		TC	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 31718.
            if slot <> 31718 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2737
//		TC	+2		# PROCEED
// PORT: Fixed ROM slots 31719.
            if slot <> 31719 or instruction <> 2025 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2025, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31720 {
// PORT: SOURCE P20-P25.agc:2738
//		TC	V89RECL		# RECYCLE
// PORT: Fixed ROM slots 31720.
            if slot <> 31720 or instruction <> 2012 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2012, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2739
//		TC	DOWNFLAG	# RESET 3 AXIS FLAG
// PORT: Fixed ROM slots 31721.
            if slot <> 31721 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1803] to agcAotUnit1803@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2740
//		ADRES	3AXISFLG	# RESET BIT 6 FLAG 5
// PORT: Fixed ROM slots 31722.
    31722, 168
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31723–31723.
function agcAotUnit1804 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2741
//# Page 618
// PORT: SOURCE P20-P25.agc:2742
//		TC	BANKCALL	# PERFORMS CSM MANEUVER TO ALIGN SELECTED
// PORT: Fixed ROM slots 31723.
    if slot <> 31723 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1804] to agcAotUnit1804@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2743
//		CADR	R60CSM		# SPACECRAFT AXIS TO LOS.
// PORT: Fixed ROM slots 31724.
    31724, 47104
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31725–31726.
function agcAotUnit1805 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31725 {
// PORT: SOURCE P20-P25.agc:2744
//		TCF	ENDEXT
// PORT: Fixed ROM slots 31725.
        if slot <> 31725 or instruction <> 7004 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7004, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2745
//
// PORT: SOURCE P20-P25.agc:2746
//SETPAF		TC	UPFLAG		# SET PREFERRED ATT FLAG FOR R63COMP
// PORT: Fixed ROM slots 31726.
        if slot <> 31726 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1805] to agcAotUnit1805@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2747
//		ADRES	RNGSCFLG	# TO DO PREF AXIS.  SET BIT 10 FLAG 5.
// PORT: Fixed ROM slots 31727.
    31727, 160
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31728–31728.
function agcAotUnit1806 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2748
//		TC	V89RECL
// PORT: Fixed ROM slots 31728.
    if slot <> 31728 or instruction <> 2012 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2012, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1806] to agcAotUnit1806@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2749
//
// PORT: SOURCE P20-P25.agc:2750
//VB04N06		VN	0406
// PORT: Fixed ROM slots 31729.
    31729, 1036,
// PORT: SOURCE P20-P25.agc:2751
//VB06N18		VN	0618
// PORT: Fixed ROM slots 31730.
    31730, 1572
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27907–27907.
function agcAotUnit1591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2752
//
// PORT: SOURCE P20-P25.agc:2753
//R63COMP		EQUALS	R63
// PORT: SOURCE P20-P25.agc:2754
//
// PORT: SOURCE P20-P25.agc:2755
//# Page 619
// PORT: SOURCE P20-P25.agc:2756
//# PROGRAM NAME:  P23 CISLUNAR MIDCOURSE NAVIGATION
// PORT: SOURCE P20-P25.agc:2757
//# MOD NO:
// PORT: SOURCE P20-P25.agc:2758
//# MOD BY:  TOM KNATT
// PORT: SOURCE P20-P25.agc:2759
//#
// PORT: SOURCE P20-P25.agc:2760
//# FUNCTIONAL DESCRIPTION:  DO MIDCOURSE NAVIGATION BY INCORPORATION OF
// PORT: SOURCE P20-P25.agc:2761
//# STAR/EARTH AND STAR/MOON OPTICAL MEASUREMENTS.
// PORT: SOURCE P20-P25.agc:2762
//#
// PORT: SOURCE P20-P25.agc:2763
//# CALLING SEQUENCE:  ASTRONAUT OPERATED
// PORT: SOURCE P20-P25.agc:2764
//#
// PORT: SOURCE P20-P25.agc:2765
//# SUBROUTINES CALLED:  R52,R53,R57,R60,ORBITAL INTEGRATION (INTEGRV)
// PORT: SOURCE P20-P25.agc:2766
//# INCORP1,INCORP2,LALOTORV,LUNLMKLD, AND DISPLAY INTERFACE ROuTINES.
// PORT: SOURCE P20-P25.agc:2767
//#
// PORT: SOURCE P20-P25.agc:2768
//# N0RMAL EXIT MODES:  VIA R00
// PORT: SOURCE P20-P25.agc:2769
//#
// PORT: SOURCE P20-P25.agc:2770
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:2771
//#
// PORT: SOURCE P20-P25.agc:2772
//# ABORT MODES:  NONE
// PORT: SOURCE P20-P25.agc:2773
//#
// PORT: SOURCE P20-P25.agc:2774
//# ERASABLE INITIALIZATION REQUIRED:  PAD-LOADED ERASABLES, ORBWFLAG RESET,
// PORT: SOURCE P20-P25.agc:2775
//# REFSMFLG=0 IF IMU OFF AND REFSMFLG=1 IF IMU ONE
// PORT: SOURCE P20-P25.agc:2776
//#
// PORT: SOURCE P20-P25.agc:2777
//# INPUTS BY USER REQUIRED:  STAR NUMBER, LANDMARK LAT, LONG/2, ALT OR ID NUMB.
// PORT: SOURCE P20-P25.agc:2778
//# IF LANDMARK IS USED, NEAR OR FAR HORIzON IF HORIZON IS USED, AND
// PORT: SOURCE P20-P25.agc:2779
//# BODY TO BE MARKED ON (EARTH OR MOON).  SEE GSOP CHAPT 4.
// PORT: SOURCE P20-P25.agc:2780
//#
// PORT: SOURCE P20-P25.agc:2781
//# OUTPUT:  UPDATED CMC STATE VECTOR.  VECTOR FROM S/C TO HORIZON OR LANDMARK
// PORT: SOURCE P20-P25.agc:2782
//# IN POINTAXS.  POINTAXS CAN BE USED TO GENERATE THIS VECTOR APART FROM
// PORT: SOURCE P20-P25.agc:2783
//# P23 IF DESIRED.
// PORT: SOURCE P20-P25.agc:2784
//#
// PORT: SOURCE P20-P25.agc:2785
//# DEBRIS:  NO USABLE DEBRIS IS GENERATED.  RENDWFLG IS RESET FOR P20 UPON
// PORT: SOURCE P20-P25.agc:2786
//# COMPLETION OF P23.  RUPTREGS AND ERASABLES USED BY DISPLAYS ARE DEBRIS.
// PORT: SOURCE P20-P25.agc:2787
//
// PORT: SOURCE P20-P25.agc:2788
//		BANK	31
// PORT: SOURCE P20-P25.agc:2789
//		SETLOC	RT23
// PORT: SOURCE P20-P25.agc:2790
//		BANK
// PORT: SOURCE P20-P25.agc:2791
//		COUNT	31/S23
// PORT: SOURCE P20-P25.agc:2792
//		EBANK=	W
// PORT: SOURCE P20-P25.agc:2793
//P23		TC	DOWNFLAG
// PORT: Fixed ROM slots 27907.
    if slot <> 27907 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1591] to agcAotUnit1591@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2794
//		ADRES	RNDVZFLG
// PORT: Fixed ROM slots 27908.
    27908, 16
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27909–27909.
function agcAotUnit1592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2795
//
// PORT: SOURCE P20-P25.agc:2796
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 27909.
    if slot <> 27909 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1592] to agcAotUnit1592@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2797
//		OCT	00004		# LEAVE GROUP 4
// PORT: Fixed ROM slots 27910.
    27910, 8,
// PORT: SOURCE P20-P25.agc:2798
//		OCT	00012		# ENTER GROUP 2
// PORT: Fixed ROM slots 27911.
    27911, 20
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27912–27914.
function agcAotUnit1593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27912 {
// PORT: SOURCE P20-P25.agc:2799
//		CAF	PRIO13
// PORT: Fixed ROM slots 27912.
        if slot <> 27912 or instruction <> 14901 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2613), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 27913 {
// PORT: SOURCE P20-P25.agc:2800
//		TS	PHSPRDT2
// PORT: Fixed ROM slots 27913.
            if slot <> 27913 or instruction <> 23086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2801
//		TC	INTPRET
// PORT: Fixed ROM slots 27914.
            if slot <> 27914 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1593] to agcAotUnit1593@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2802
//		SSP	CLEAR
// PORT: Fixed ROM slots 27915.
    27915, 36018,
// PORT: SOURCE P20-P25.agc:2803
//			MARKINDX
// PORT: Fixed ROM slots 27916.
    27916, 388,
// PORT: SOURCE P20-P25.agc:2804
//			1
// PORT: Fixed ROM slots 27917.
    27917, 2,
// PORT: SOURCE P20-P25.agc:2805
//			TARG2FLG	# TARGET FLAG USED R52 AND R53
// PORT: Fixed ROM slots 27918.
    27918, 876,
// PORT: SOURCE P20-P25.agc:2806
//		CLEAR	SSP
// PORT: Fixed ROM slots 27919.
    27919, 55576,
// PORT: SOURCE P20-P25.agc:2807
//			TARG1FLG
// PORT: Fixed ROM slots 27920.
    27920, 874,
// PORT: SOURCE P20-P25.agc:2808
//			STARIND
// PORT: Fixed ROM slots 27921.
    27921, 394,
// PORT: SOURCE P20-P25.agc:2809
//			0
// PORT: Fixed ROM slots 27922.
    27922, 0,
// PORT: SOURCE P20-P25.agc:2810
//		SSP	CLEAR
// PORT: Fixed ROM slots 27923.
    27923, 36018,
// PORT: SOURCE P20-P25.agc:2811
//			BESTI
// PORT: Fixed ROM slots 27924.
    27924, 390,
// PORT: SOURCE P20-P25.agc:2812
//			0
// PORT: Fixed ROM slots 27925.
    27925, 0,
// PORT: SOURCE P20-P25.agc:2813
//			R57FLAG		# SET = DO NOT REPERFORM R57
// PORT: Fixed ROM slots 27926.
    27926, 3438,
// PORT: SOURCE P20-P25.agc:2814
//		CLEAR	EXIT
// PORT: Fixed ROM slots 27927.
    27927, 65048,
// PORT: SOURCE P20-P25.agc:2815
//			V94FLAG		# SET = ALLOW V94
// PORT: Fixed ROM slots 27928.
    27928, 4968
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27929–27929.
function agcAotUnit1594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2816
//P23.00		TC	INTPRET
// PORT: Fixed ROM slots 27929.
    if slot <> 27929 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1594] to agcAotUnit1594@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2817
//# Page 620
// PORT: SOURCE P20-P25.agc:2818
//		BON	CALL
// PORT: Fixed ROM slots 27930.
    27930, 37912,
// PORT: SOURCE P20-P25.agc:2819
//			REFSMFLG	# SET NOW AS INPUT, NORMALLY EXTERNAL CONT
// PORT: Fixed ROM slots 27931.
    27931, 1924,
// PORT: SOURCE P20-P25.agc:2820
//			P23.05		# WHEN ALIGNED, PERFORM MEASUREMENT
// PORT: Fixed ROM slots 27932.
    27932, 51780,
// PORT: SOURCE P20-P25.agc:2821
//			R57		# DO OPTICS CALIBRATION IF IMU NOT ALIGNED.
// PORT: Fixed ROM slots 27933.
    27933, 64002,
// PORT: SOURCE P20-P25.agc:2822
//		CALL
// PORT: Fixed ROM slots 27934.
    27934, 65320,
// PORT: SOURCE P20-P25.agc:2823
//			R53
// PORT: Fixed ROM slots 27935.
    27935, 25984,
// PORT: SOURCE P20-P25.agc:2824
//		GOTO
// PORT: Fixed ROM slots 27936.
    27936, 65360,
// PORT: SOURCE P20-P25.agc:2825
//			P23.60
// PORT: Fixed ROM slots 27937.
    27937, 52034,
// PORT: SOURCE P20-P25.agc:2826
//P23.05		CLEAR	EXIT
// PORT: Fixed ROM slots 27938.
    27938, 65048,
// PORT: SOURCE P20-P25.agc:2827
//			SAVECFLG	# USED TO SAVE SPACE IN P23.65
// PORT: Fixed ROM slots 27939.
    27939, 4970
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27940–27941.
function agcAotUnit1595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27940 {
// PORT: SOURCE P20-P25.agc:2828
//P23.06		CAF	V05N70
// PORT: Fixed ROM slots 27940.
        if slot <> 27940 or instruction <> 14126 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1838), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2829
//		TC	BANKCALL	# IDENTIFICATION:  STAR, HOR  IDENT.
// PORT: Fixed ROM slots 27941.
        if slot <> 27941 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1595] to agcAotUnit1595@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2830
//		CADR	GOFLASH
// PORT: Fixed ROM slots 27942.
    27942, 17312
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27943–27966.
function agcAotUnit1596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27954 {
        if slot <= 27948 {
            if slot <= 27945 {
                if slot <= 27943 {
// PORT: SOURCE P20-P25.agc:2831
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 27943.
                    if slot <> 27943 or instruction <> 2118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27944 {
// PORT: SOURCE P20-P25.agc:2832
//		TC	P23.15
// PORT: Fixed ROM slots 27944.
                        if slot <> 27944 or instruction <> 1322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1322, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2833
//		TC	-5		# REDISPLAY
// PORT: Fixed ROM slots 27945.
                        if slot <> 27945 or instruction <> 1316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1316, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27946 {
// PORT: SOURCE P20-P25.agc:2834
//P23.15		CA	LANDMARK	# IF C=2, LUNAFLAG=1.  IF C=1, LUNAFLAG=0
// PORT: Fixed ROM slots 27946.
                    if slot <> 27946 or instruction <> 13289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27947 {
// PORT: SOURCE P20-P25.agc:2835
//		EXTEND
// PORT: Fixed ROM slots 27947.
                        if slot <> 27947 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2836
//		BZF	P23.151
// PORT: Fixed ROM slots 27948.
                        if slot <> 27948 or instruction <> 5427 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5427, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27951 {
                if slot <= 27949 {
// PORT: SOURCE P20-P25.agc:2837
//		CA	HORIZON
// PORT: Fixed ROM slots 27949.
                    if slot <> 27949 or instruction <> 13290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1002).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27950 {
// PORT: SOURCE P20-P25.agc:2838
//		EXTEND
// PORT: Fixed ROM slots 27950.
                        if slot <> 27950 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2839
//		BZF	+2
// PORT: Fixed ROM slots 27951.
                        if slot <> 27951 or instruction <> 5425 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5425, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27952 {
// PORT: SOURCE P20-P25.agc:2840
//		TC	R23.10		# OPERATOR DSKY ERROR
// PORT: Fixed ROM slots 27952.
                    if slot <> 27952 or instruction <> 1628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27953 {
// PORT: SOURCE P20-P25.agc:2841
//		CA	LANDMARK
// PORT: Fixed ROM slots 27953.
                        if slot <> 27953 or instruction <> 13289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1001).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2842
//		TC	P23.152
// PORT: Fixed ROM slots 27954.
                        if slot <> 27954 or instruction <> 1334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1334, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27960 {
            if slot <= 27957 {
                if slot <= 27955 {
// PORT: SOURCE P20-P25.agc:2843
//P23.151		CA	HORIZON
// PORT: Fixed ROM slots 27955.
                    if slot <> 27955 or instruction <> 13290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1002).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27956 {
// PORT: SOURCE P20-P25.agc:2844
//		EXTEND
// PORT: Fixed ROM slots 27956.
                        if slot <> 27956 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2845
//		BZF	R23.10
// PORT: Fixed ROM slots 27957.
                        if slot <> 27957 or instruction <> 5724 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5724, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27958 {
// PORT: SOURCE P20-P25.agc:2846
//P23.152		MASK	BITS7-9		# IS C EQUAL TO 1 OR 2
// PORT: Fixed ROM slots 27958.
                    if slot <> 27958 or instruction <> 30523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1851), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27959 {
// PORT: SOURCE P20-P25.agc:2847
//		AD	NEG100
// PORT: Fixed ROM slots 27959.
                        if slot <> 27959 or instruction <> 27292 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2716), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2848
//		EXTEND
// PORT: Fixed ROM slots 27960.
                        if slot <> 27960 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27963 {
                if slot <= 27961 {
// PORT: SOURCE P20-P25.agc:2849
//		BZF	P23.16
// PORT: Fixed ROM slots 27961.
                    if slot <> 27961 or instruction <> 5441 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5441, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27962 {
// PORT: SOURCE P20-P25.agc:2850
//		AD	NEG100
// PORT: Fixed ROM slots 27962.
                        if slot <> 27962 or instruction <> 27292 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2716), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2851
//		EXTEND
// PORT: Fixed ROM slots 27963.
                        if slot <> 27963 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27964 {
// PORT: SOURCE P20-P25.agc:2852
//		BZF	+2
// PORT: Fixed ROM slots 27964.
                    if slot <> 27964 or instruction <> 5438 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5438, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27965 {
// PORT: SOURCE P20-P25.agc:2853
//		TC	R23.10
// PORT: Fixed ROM slots 27965.
                        if slot <> 27965 or instruction <> 1628 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1628, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2854
//		TC	UPFLAG
// PORT: Fixed ROM slots 27966.
                        if slot <> 27966 or instruction <> 2918 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1596] to agcAotUnit1596@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2855
//		ADRES	LUNAFLAG
// PORT: Fixed ROM slots 27967.
    27967, 96
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27968–27969.
function agcAotUnit1597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27968 {
// PORT: SOURCE P20-P25.agc:2856
//		TCF	+3
// PORT: Fixed ROM slots 27968.
        if slot <> 27968 or instruction <> 5443 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5443, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2857
//P23.16		TC	DOWNFLAG
// PORT: Fixed ROM slots 27969.
        if slot <> 27969 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1597] to agcAotUnit1597@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2858
//		ADRES	LUNAFLAG
// PORT: Fixed ROM slots 27970.
    27970, 96
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27971–27980.
function agcAotUnit1598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27975 {
        if slot <= 27972 {
            if slot <= 27971 {
// PORT: SOURCE P20-P25.agc:2859
//		CA	STARCODE	# IS STARCODE GREATER THAN OR
// PORT: Fixed ROM slots 27971.
                if slot <> 27971 or instruction <> 12765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 477).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2860
//		EXTEND			# EQUAL TO 0 AND LESS THAN 37
// PORT: Fixed ROM slots 27972.
                if slot <> 27972 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27973 {
// PORT: SOURCE P20-P25.agc:2861
//		BZF	P23.176
// PORT: Fixed ROM slots 27973.
                if slot <> 27973 or instruction <> 5466 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27974 {
// PORT: SOURCE P20-P25.agc:2862
//		EXTEND
// PORT: Fixed ROM slots 27974.
                    if slot <> 27974 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2863
//		BZMF	R23.10
// PORT: Fixed ROM slots 27975.
                    if slot <> 27975 or instruction <> 26204 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26204, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27977 {
            if slot <= 27976 {
// PORT: SOURCE P20-P25.agc:2864
//		AD	NEG37
// PORT: Fixed ROM slots 27976.
                if slot <> 27976 or instruction <> 26426 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1850), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2865
//		EXTEND
// PORT: Fixed ROM slots 27977.
                if slot <> 27977 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27978 {
// PORT: SOURCE P20-P25.agc:2866
//		BZMF	+2
// PORT: Fixed ROM slots 27978.
                if slot <> 27978 or instruction <> 25932 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25932, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27979 {
// PORT: SOURCE P20-P25.agc:2867
//		TC	R23.10
// PORT: Fixed ROM slots 27979.
                    if slot <> 27979 or instruction <> 1628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2868
//# Page 621
// PORT: SOURCE P20-P25.agc:2869
//
// PORT: SOURCE P20-P25.agc:2870
//		TC	INTPRET
// PORT: Fixed ROM slots 27980.
                    if slot <> 27980 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1598] to agcAotUnit1598@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2871
//P23.17		SLOAD	BZE
// PORT: Fixed ROM slots 27981.
    27981, 44218,
// PORT: SOURCE P20-P25.agc:2872
//			STARCODE
// PORT: Fixed ROM slots 27982.
    27982, 956,
// PORT: SOURCE P20-P25.agc:2873
//			P23.175
// PORT: Fixed ROM slots 27983.
    27983, 51890,
// PORT: SOURCE P20-P25.agc:2874
//		PUSH
// PORT: Fixed ROM slots 27984.
    27984, 65292,
// PORT: SOURCE P20-P25.agc:2875
//		SLOAD	DMP
// PORT: Fixed ROM slots 27985.
    27985, 34234,
// PORT: SOURCE P20-P25.agc:2876
//			SPSIX
// PORT: Fixed ROM slots 27986.
    27986, 20070,
// PORT: SOURCE P20-P25.agc:2877
//		LXA,1	SXA,1
// PORT: Fixed ROM slots 27987.
    27987, 55504,
// PORT: SOURCE P20-P25.agc:2878
//			MPAC +1
// PORT: Fixed ROM slots 27988.
    27988, 218,
// PORT: SOURCE P20-P25.agc:2879
//			BESTI		# BESTI = 6 X STAR NUMBER
// PORT: Fixed ROM slots 27989.
    27989, 388,
// PORT: SOURCE P20-P25.agc:2880
//		CALL
// PORT: Fixed ROM slots 27990.
    27990, 65320,
// PORT: SOURCE P20-P25.agc:2881
//			LOWMEMRY	# NEEDED TO RETRIEVE STAR VECTOR FROM LOW
// PORT: Fixed ROM slots 27991.
    27991, 24576,
// PORT: SOURCE P20-P25.agc:2882
//		STORE	STARSAV2	# STORE FOR R53,P23.  US(IN P23)=STARSAV2
// PORT: Fixed ROM slots 27992.
    27992, 2846,
// PORT: SOURCE P20-P25.agc:2883
//P23.175		EXIT
// PORT: Fixed ROM slots 27993.
    27993, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27994–28005.
function agcAotUnit1599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27999 {
        if slot <= 27996 {
            if slot <= 27994 {
// PORT: SOURCE P20-P25.agc:2884
//P23.176		CA	HORIZON
// PORT: Fixed ROM slots 27994.
                if slot <> 27994 or instruction <> 13290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27995 {
// PORT: SOURCE P20-P25.agc:2885
//		EXTEND
// PORT: Fixed ROM slots 27995.
                    if slot <> 27995 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2886
//		BZF	P23.20
// PORT: Fixed ROM slots 27996.
                    if slot <> 27996 or instruction <> 5483 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5483, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27997 {
// PORT: SOURCE P20-P25.agc:2887
//		MASK	BITS4-6
// PORT: Fixed ROM slots 27997.
                if slot <> 27997 or instruction <> 30524 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1852), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27998 {
// PORT: SOURCE P20-P25.agc:2888
//		AD	-OCT10
// PORT: Fixed ROM slots 27998.
                    if slot <> 27998 or instruction <> 27769 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 3193), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2889
//		EXTEND
// PORT: Fixed ROM slots 27999.
                    if slot <> 27999 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28002 {
            if slot <= 28000 {
// PORT: SOURCE P20-P25.agc:2890
//		BZF	P23.18
// PORT: Fixed ROM slots 28000.
                if slot <> 28000 or instruction <> 5480 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5480, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28001 {
// PORT: SOURCE P20-P25.agc:2891
//		AD	-OCT10
// PORT: Fixed ROM slots 28001.
                    if slot <> 28001 or instruction <> 27769 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 3193), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2892
//		EXTEND
// PORT: Fixed ROM slots 28002.
                    if slot <> 28002 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28003 {
// PORT: SOURCE P20-P25.agc:2893
//		BZF	+2
// PORT: Fixed ROM slots 28003.
                if slot <> 28003 or instruction <> 5477 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28004 {
// PORT: SOURCE P20-P25.agc:2894
//		TC	R23.10
// PORT: Fixed ROM slots 28004.
                    if slot <> 28004 or instruction <> 1628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2895
//		TC	UPFLAG
// PORT: Fixed ROM slots 28005.
                    if slot <> 28005 or instruction <> 2918 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1599] to agcAotUnit1599@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2896
//		ADRES	NORFHOR
// PORT: Fixed ROM slots 28006.
    28006, 8
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28007–28008.
function agcAotUnit1600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28007 {
// PORT: SOURCE P20-P25.agc:2897
//		TC	P23.30
// PORT: Fixed ROM slots 28007.
        if slot <> 28007 or instruction <> 1391 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1391, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2898
//P23.18		TC	DOWNFLAG
// PORT: Fixed ROM slots 28008.
        if slot <> 28008 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1600] to agcAotUnit1600@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2899
//		ADRES	NORFHOR
// PORT: Fixed ROM slots 28009.
    28009, 8
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28010–28011.
function agcAotUnit1601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28010 {
// PORT: SOURCE P20-P25.agc:2900
//		TC	P23.30
// PORT: Fixed ROM slots 28010.
        if slot <> 28010 or instruction <> 1391 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1391, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2901
//P23.20		TC	INTPRET
// PORT: Fixed ROM slots 28011.
        if slot <> 28011 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1601] to agcAotUnit1601@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2902
//		CALL
// PORT: Fixed ROM slots 28012.
    28012, 65320,
// PORT: SOURCE P20-P25.agc:2903
//			P22SUBRB
// PORT: Fixed ROM slots 28013.
    28013, 49350,
// PORT: SOURCE P20-P25.agc:2904
//		EXIT
// PORT: Fixed ROM slots 28014.
    28014, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28015–28015.
function agcAotUnit1602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2905
//P23.30		TC	INTPRET
// PORT: Fixed ROM slots 28015.
    if slot <> 28015 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1602] to agcAotUnit1602@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2906
//		SLOAD	BZE
// PORT: Fixed ROM slots 28016.
    28016, 44218,
// PORT: SOURCE P20-P25.agc:2907
//			STARCODE
// PORT: Fixed ROM slots 28017.
    28017, 956,
// PORT: SOURCE P20-P25.agc:2908
//			LDPLANET
// PORT: Fixed ROM slots 28018.
    28018, 28672,
// PORT: SOURCE P20-P25.agc:2909
//P23.31		BON	EXIT
// PORT: Fixed ROM slots 28019.
    28019, 65048,
// PORT: SOURCE P20-P25.agc:2910
//			SAVECFLG
// PORT: Fixed ROM slots 28020.
    28020, 5002,
// PORT: SOURCE P20-P25.agc:2911
//			P23.85
// PORT: Fixed ROM slots 28021.
    28021, 52096
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28022–28023.
function agcAotUnit1603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28022 {
// PORT: SOURCE P20-P25.agc:2912
//		CAF	V50N25P
// PORT: Fixed ROM slots 28022.
        if slot <> 28022 or instruction <> 14129 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1841), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2913
//		TC	BANKCALL
// PORT: Fixed ROM slots 28023.
        if slot <> 28023 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1603] to agcAotUnit1603@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2914
//		CADR	GOPERF1		# GOPERF1 BLANKS OUT R2 AND R3
// PORT: Fixed ROM slots 28024.
    28024, 17482
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28025–28027.
function agcAotUnit1604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28025 {
// PORT: SOURCE P20-P25.agc:2915
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 28025.
        if slot <> 28025 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28026 {
// PORT: SOURCE P20-P25.agc:2916
//		TC	V94ENTER	# PROCEED.  AUTOCONTROL CMC
// PORT: Fixed ROM slots 28026.
            if slot <> 28026 or instruction <> 1406 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1406, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2917
//P23.55		TC	INTPRET
// PORT: Fixed ROM slots 28027.
            if slot <> 28027 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1604] to agcAotUnit1604@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2918
//		GOTO
// PORT: Fixed ROM slots 28028.
    28028, 65360,
// PORT: SOURCE P20-P25.agc:2919
//			P23.56
// PORT: Fixed ROM slots 28029.
    28029, 52014
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28030–28030.
function agcAotUnit1605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2920
//# Page 622
// PORT: SOURCE P20-P25.agc:2921
//
// PORT: SOURCE P20-P25.agc:2922
//# VERB 94 BEGINS HERE
// PORT: SOURCE P20-P25.agc:2923
//V94ENTER	TC	INTPRET
// PORT: Fixed ROM slots 28030.
    if slot <> 28030 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1605] to agcAotUnit1605@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2924
//		RTB
// PORT: Fixed ROM slots 28031.
    28031, 65336,
// PORT: SOURCE P20-P25.agc:2925
//			LOADTIME	# READ CLOCK
// PORT: Fixed ROM slots 28032.
    28032, 38544,
// PORT: SOURCE P20-P25.agc:2926
//		STCALL	MARKTIME
// PORT: Fixed ROM slots 28033.
    28033, 29994,
// PORT: SOURCE P20-P25.agc:2927
//			POINTAXS	# RETURN LOS IN RCLL AND MPAC
// PORT: Fixed ROM slots 28034.
    28034, 52106,
// PORT: SOURCE P20-P25.agc:2928
//		MXV	UNIT
// PORT: Fixed ROM slots 28035.
    28035, 44706,
// PORT: SOURCE P20-P25.agc:2929
//			REFSMMAT
// PORT: Fixed ROM slots 28036.
    28036, 1980,
// PORT: SOURCE P20-P25.agc:2930
//		STOVL	POINTVSM
// PORT: Fixed ROM slots 28037.
    28037, 24030,
// PORT: SOURCE P20-P25.agc:2931
//			JCAXIS
// PORT: Fixed ROM slots 28038.
    28038, 20072,
// PORT: SOURCE P20-P25.agc:2932
//		STORE	SCAXIS
// PORT: Fixed ROM slots 28039.
    28039, 3538,
// PORT: SOURCE P20-P25.agc:2933
//		EXIT
// PORT: Fixed ROM slots 28040.
    28040, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28041–28041.
function agcAotUnit1606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2934
//		TC	DOWNFLAG	# CLEAR AND GO TO VECPOINT IN R60
// PORT: Fixed ROM slots 28041.
    if slot <> 28041 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1606] to agcAotUnit1606@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2935
//		ADRES	3AXISFLG	# BIT 6 FLAG 5
// PORT: Fixed ROM slots 28042.
    28042, 168
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28043–28045.
function agcAotUnit1607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28043 {
// PORT: SOURCE P20-P25.agc:2936
//		CAF	R60ADRS
// PORT: Fixed ROM slots 28043.
        if slot <> 28043 or instruction <> 14137 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1849), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28044 {
// PORT: SOURCE P20-P25.agc:2937
//		TS	TEMPFLSH
// PORT: Fixed ROM slots 28044.
            if slot <> 28044 or instruction <> 22780 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22780, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2938
//		TC	PHASCHNG
// PORT: Fixed ROM slots 28045.
            if slot <> 28045 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1607] to agcAotUnit1607@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2939
//		OCT	00012
// PORT: Fixed ROM slots 28046.
    28046, 20
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28047–28047.
function agcAotUnit1608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2940
//R60CALL		TC	BANKCALL
// PORT: Fixed ROM slots 28047.
    if slot <> 28047 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1608] to agcAotUnit1608@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2941
//		CADR	R60CSM
// PORT: Fixed ROM slots 28048.
    28048, 47104
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28049–28049.
function agcAotUnit1609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2942
//		TC	PHASCHNG
// PORT: Fixed ROM slots 28049.
    if slot <> 28049 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1609] to agcAotUnit1609@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2943
//		OCT	04022
// PORT: Fixed ROM slots 28050.
    28050, 4132
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28051–28051.
function agcAotUnit1610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2944
//		TC	INTPRET
// PORT: Fixed ROM slots 28051.
    if slot <> 28051 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1610] to agcAotUnit1610@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2945
//		BON
// PORT: Fixed ROM slots 28052.
    28052, 65304,
// PORT: SOURCE P20-P25.agc:2946
//			R57FLAG
// PORT: Fixed ROM slots 28053.
    28053, 3470,
// PORT: SOURCE P20-P25.agc:2947
//			P23.57		# DO NOT REPERFORM R57
// PORT: Fixed ROM slots 28054.
    28054, 52018,
// PORT: SOURCE P20-P25.agc:2948
//P23.56		CALL
// PORT: Fixed ROM slots 28055.
    28055, 65320,
// PORT: SOURCE P20-P25.agc:2949
//			R57
// PORT: Fixed ROM slots 28056.
    28056, 64002,
// PORT: SOURCE P20-P25.agc:2950
//P23.57		SET	SET
// PORT: Fixed ROM slots 28057.
    28057, 35864,
// PORT: SOURCE P20-P25.agc:2951
//			V94FLAG
// PORT: Fixed ROM slots 28058.
    28058, 4712,
// PORT: SOURCE P20-P25.agc:2952
//			R57FLAG
// PORT: Fixed ROM slots 28059.
    28059, 3182,
// PORT: SOURCE P20-P25.agc:2953
//		CALL
// PORT: Fixed ROM slots 28060.
    28060, 65320,
// PORT: SOURCE P20-P25.agc:2954
//			R52
// PORT: Fixed ROM slots 28061.
    28061, 24594,
// PORT: SOURCE P20-P25.agc:2955
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 28062.
    28062, 35864,
// PORT: SOURCE P20-P25.agc:2956
//			V94FLAG
// PORT: Fixed ROM slots 28063.
    28063, 4968,
// PORT: SOURCE P20-P25.agc:2957
//			R57FLAG
// PORT: Fixed ROM slots 28064.
    28064, 3438,
// PORT: SOURCE P20-P25.agc:2958
//P23.60		EXIT
// PORT: Fixed ROM slots 28065.
    28065, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28066–28071.
function agcAotUnit1611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28068 {
        if slot <= 28066 {
// PORT: SOURCE P20-P25.agc:2959
//		INHINT
// PORT: Fixed ROM slots 28066.
            if slot <> 28066 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28067 {
// PORT: SOURCE P20-P25.agc:2960
//		CA	MARKSTAT
// PORT: Fixed ROM slots 28067.
                if slot <> 28067 or instruction <> 13016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 728).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2961
//		MASK	LOW10
// PORT: Fixed ROM slots 28068.
                if slot <> 28068 or instruction <> 31276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                    if fixedOperand = 1023 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28069 {
// PORT: SOURCE P20-P25.agc:2962
//		TS	MARKDATA
// PORT: Fixed ROM slots 28069.
            if slot <> 28069 or instruction <> 23202 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23202, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28070 {
// PORT: SOURCE P20-P25.agc:2963
//		EXTEND
// PORT: Fixed ROM slots 28070.
                if slot <> 28070 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2964
//		INDEX	MARKDATA
// PORT: Fixed ROM slots 28071.
                if slot <> 28071 or instruction <> 21154 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21154, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21154, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1611] to agcAotUnit1611@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2965
//		DCA	0
// PORT: Fixed ROM slots 28072.
    28072, 24578
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28073–28074.
function agcAotUnit1612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28073 {
// PORT: SOURCE P20-P25.agc:2966
//		DXCH	MARKTIME
// PORT: Fixed ROM slots 28073.
        if slot <> 28073 or instruction <> 22165 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 661, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2967
//		INDEX	MARKDATA
// PORT: Fixed ROM slots 28074.
        if slot <> 28074 or instruction <> 21154 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21154, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21154, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1612] to agcAotUnit1612@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2968
//		CA	5
// PORT: Fixed ROM slots 28075.
    28075, 24586
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28076–28078.
function agcAotUnit1613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28076 {
// PORT: SOURCE P20-P25.agc:2969
//		XCH	TRUNION
// PORT: Fixed ROM slots 28076.
        if slot <> 28076 or instruction <> 24556 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 1004, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28077 {
// PORT: SOURCE P20-P25.agc:2970
//		RELINT
// PORT: Fixed ROM slots 28077.
            if slot <> 28077 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2971
//		TC	INTPRET
// PORT: Fixed ROM slots 28078.
            if slot <> 28078 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1613] to agcAotUnit1613@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2972
//# Page 623
// PORT: SOURCE P20-P25.agc:2973
//		LXC,1	VLOAD*
// PORT: Fixed ROM slots 28079.
    28079, 64448,
// PORT: SOURCE P20-P25.agc:2974
//			MARKDATA
// PORT: Fixed ROM slots 28080.
    28080, 1348,
// PORT: SOURCE P20-P25.agc:2975
//			1,1
// PORT: Fixed ROM slots 28081.
    28081, 4,
// PORT: SOURCE P20-P25.agc:2976
//		STODL*	MARKDOWN +1
// PORT: Fixed ROM slots 28082.
    28082, 20348,
// PORT: SOURCE P20-P25.agc:2977
//			0,1
// PORT: Fixed ROM slots 28083.
    28083, 2,
// PORT: SOURCE P20-P25.agc:2978
//		STORE	MARKDOWN
// PORT: Fixed ROM slots 28084.
    28084, 3962,
// PORT: SOURCE P20-P25.agc:2979
//		EXIT
// PORT: Fixed ROM slots 28085.
    28085, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28086–28087.
function agcAotUnit1614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28086 {
// PORT: SOURCE P20-P25.agc:2980
//		CAF	V05N71
// PORT: Fixed ROM slots 28086.
        if slot <> 28086 or instruction <> 14127 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1839), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2981
//		TC	BANKCALL
// PORT: Fixed ROM slots 28087.
        if slot <> 28087 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1614] to agcAotUnit1614@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2982
//		CADR	GOFLASH
// PORT: Fixed ROM slots 28088.
    28088, 17312
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28089–28092.
function agcAotUnit1615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28090 {
        if slot <= 28089 {
// PORT: SOURCE P20-P25.agc:2983
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 28089.
            if slot <> 28089 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2984
//		TC	P23.65		# STORE DATA
// PORT: Fixed ROM slots 28090.
            if slot <> 28090 or instruction <> 1468 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1468, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28091 {
// PORT: SOURCE P20-P25.agc:2985
//		TC	-5		# REDISPLAY
// PORT: Fixed ROM slots 28091.
            if slot <> 28091 or instruction <> 1462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2986
//P23.65		TC	INTPRET
// PORT: Fixed ROM slots 28092.
            if slot <> 28092 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1615] to agcAotUnit1615@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2987
//		SET	EXIT
// PORT: Fixed ROM slots 28093.
    28093, 65048,
// PORT: SOURCE P20-P25.agc:2988
//			SAVECFLG
// PORT: Fixed ROM slots 28094.
    28094, 4714
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28095–28095.
function agcAotUnit1616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2989
//		TC	P23.15
// PORT: Fixed ROM slots 28095.
    if slot <> 28095 or instruction <> 1322 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1322, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1616] to agcAotUnit1616@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2990
//P23.85		CLEAR	CALL
// PORT: Fixed ROM slots 28096.
    28096, 37912,
// PORT: SOURCE P20-P25.agc:2991
//			RENDWFLG
// PORT: Fixed ROM slots 28097.
    28097, 2940,
// PORT: SOURCE P20-P25.agc:2992
//			POINTAXS
// PORT: Fixed ROM slots 28098.
    28098, 52106,
// PORT: SOURCE P20-P25.agc:2993
//		GOTO
// PORT: Fixed ROM slots 28099.
    28099, 65360,
// PORT: SOURCE P20-P25.agc:2994
//			R23.55
// PORT: Fixed ROM slots 28100.
    28100, 52210,
// PORT: SOURCE P20-P25.agc:2995
//
// PORT: SOURCE P20-P25.agc:2996
//# WE BEGIN CALCULATIONS HERE
// PORT: SOURCE P20-P25.agc:2997
//# POINTAXIS SUBROUTINE
// PORT: SOURCE P20-P25.agc:2998
//
// PORT: SOURCE P20-P25.agc:2999
//POINTAXS	STQ
// PORT: Fixed ROM slots 28101.
    28101, 65312,
// PORT: SOURCE P20-P25.agc:3000
//			POINTEX
// PORT: Fixed ROM slots 28102.
    28102, 1232,
// PORT: SOURCE P20-P25.agc:3001
//R23.05		BON	DLOAD
// PORT: Fixed ROM slots 28103.
    28103, 58648,
// PORT: SOURCE P20-P25.agc:3002
//			ORBWFLAG
// PORT: Fixed ROM slots 28104.
    28104, 1938,
// PORT: SOURCE P20-P25.agc:3003
//			R23.1
// PORT: Fixed ROM slots 28105.
    28105, 52122,
// PORT: SOURCE P20-P25.agc:3004
//			WMIDPOS
// PORT: Fixed ROM slots 28106.
    28106, 3074,
// PORT: SOURCE P20-P25.agc:3005
//		STCALL	0
// PORT: Fixed ROM slots 28107.
    28107, 28674,
// PORT: SOURCE P20-P25.agc:3006
//			INITIALW	# INITIALIZE W-MATRIX FIRST PASS IN P23
// PORT: Fixed ROM slots 28108.
    28108, 47850,
// PORT: SOURCE P20-P25.agc:3007
//R23.1		CALL
// PORT: Fixed ROM slots 28109.
    28109, 65320,
// PORT: SOURCE P20-P25.agc:3008
//			SETINTG		# SETUP FOR CSM INTEGRATION
// PORT: Fixed ROM slots 28110.
    28110, 47558,
// PORT: SOURCE P20-P25.agc:3009
//		BOF	SET
// PORT: Fixed ROM slots 28111.
    28111, 35864,
// PORT: SOURCE P20-P25.agc:3010
//			ORBWFLAG
// PORT: Fixed ROM slots 28112.
    28112, 2002,
// PORT: SOURCE P20-P25.agc:3011
//			R23.2
// PORT: Fixed ROM slots 28113.
    28113, 52134,
// PORT: SOURCE P20-P25.agc:3012
//			DIM0FLAG
// PORT: Fixed ROM slots 28114.
    28114, 1660,
// PORT: SOURCE P20-P25.agc:3013
//R23.2		SET	CALL
// PORT: Fixed ROM slots 28115.
    28115, 37912,
// PORT: SOURCE P20-P25.agc:3014
//			ORBWFLAG
// PORT: Fixed ROM slots 28116.
    28116, 1650,
// PORT: SOURCE P20-P25.agc:3015
//			INTEGRV		# INTEGRATE CSM STATE VEC. TO MARKTIME
// PORT: Fixed ROM slots 28117.
    28117, 23780,
// PORT: SOURCE P20-P25.agc:3016
//		EXIT
// PORT: Fixed ROM slots 28118.
    28118, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28119–28119.
function agcAotUnit1617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3017
//		TC	PHASCHNG
// PORT: Fixed ROM slots 28119.
    if slot <> 28119 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1617] to agcAotUnit1617@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3018
//		OCT	04022
// PORT: Fixed ROM slots 28120.
    28120, 4132
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28121–28121.
function agcAotUnit1618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3019
//		TC	INTPRET
// PORT: Fixed ROM slots 28121.
    if slot <> 28121 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1618] to agcAotUnit1618@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3020
//		CALL
// PORT: Fixed ROM slots 28122.
    28122, 65320,
// PORT: SOURCE P20-P25.agc:3021
//			RECT.1		# PICKUP CSM STATE VECTOR FROM PERM
// PORT: Fixed ROM slots 28123.
    28123, 52732,
// PORT: SOURCE P20-P25.agc:3022
//		BOFF
// PORT: Fixed ROM slots 28124.
    28124, 65304,
// PORT: SOURCE P20-P25.agc:3023
//			ZMEASURE	# IN SPHERE OF INFLUENCE OF PRIMARY BODY
// PORT: Fixed ROM slots 28125.
    28125, 458,
// PORT: SOURCE P20-P25.agc:3024
//			R23.3
// PORT: Fixed ROM slots 28126.
    28126, 52176,
// PORT: SOURCE P20-P25.agc:3025
//# Page 624
// PORT: SOURCE P20-P25.agc:3026
//		DLOAD	CALL
// PORT: Fixed ROM slots 28127.
    28127, 38090,
// PORT: SOURCE P20-P25.agc:3027
//			MARKTIME
// PORT: Fixed ROM slots 28128.
    28128, 1322,
// PORT: SOURCE P20-P25.agc:3028
//			LUNPOS
// PORT: Fixed ROM slots 28129.
    28129, 45210,
// PORT: SOURCE P20-P25.agc:3029
//		BON	VCOMP
// PORT: Fixed ROM slots 28130.
    28130, 48664,
// PORT: SOURCE P20-P25.agc:3030
//			CMOONFLG
// PORT: Fixed ROM slots 28131.
    28131, 4486,
// PORT: SOURCE P20-P25.agc:3031
//			+1
// PORT: Fixed ROM slots 28132.
    28132, 52170,
// PORT: SOURCE P20-P25.agc:3032
//		VAD
// PORT: Fixed ROM slots 28133.
    28133, 65370,
// PORT: SOURCE P20-P25.agc:3033
//			RZC
// PORT: Fixed ROM slots 28134.
    28134, 3886,
// PORT: SOURCE P20-P25.agc:3034
//		STORE	RZC
// PORT: Fixed ROM slots 28135.
    28135, 3886,
// PORT: SOURCE P20-P25.agc:3035
//R23.3		SLOAD	BHIZ
// PORT: Fixed ROM slots 28136.
    28136, 39098,
// PORT: SOURCE P20-P25.agc:3036
//			LANDMARK	# IF LANDMARK = 0, USE HORIZ SUBR
// PORT: Fixed ROM slots 28137.
    28137, 3028,
// PORT: SOURCE P20-P25.agc:3037
//			R23.4
// PORT: Fixed ROM slots 28138.
    28138, 52196,
// PORT: SOURCE P20-P25.agc:3038
//		SET
// PORT: Fixed ROM slots 28139.
    28139, 65304,
// PORT: SOURCE P20-P25.agc:3039
//			ERADFLAG
// PORT: Fixed ROM slots 28140.
    28140, 612,
// PORT: SOURCE P20-P25.agc:3040
//		DLOAD	CALL
// PORT: Fixed ROM slots 28141.
    28141, 38090,
// PORT: SOURCE P20-P25.agc:3041
//			MARKTIME
// PORT: Fixed ROM slots 28142.
    28142, 1322,
// PORT: SOURCE P20-P25.agc:3042
//			LALOTORV
// PORT: Fixed ROM slots 28143.
    28143, 23106,
// PORT: SOURCE P20-P25.agc:3043
//		GOTO
// PORT: Fixed ROM slots 28144.
    28144, 65360,
// PORT: SOURCE P20-P25.agc:3044
//			R23.5
// PORT: Fixed ROM slots 28145.
    28145, 52200,
// PORT: SOURCE P20-P25.agc:3045
//R23.4		CALL
// PORT: Fixed ROM slots 28146.
    28146, 65320,
// PORT: SOURCE P20-P25.agc:3046
//			HORIZ
// PORT: Fixed ROM slots 28147.
    28147, 52412,
// PORT: SOURCE P20-P25.agc:3047
//R23.5		VSU	SETPD
// PORT: Fixed ROM slots 28148.
    28148, 33106,
// PORT: SOURCE P20-P25.agc:3048
//			RZC
// PORT: Fixed ROM slots 28149.
    28149, 3886,
// PORT: SOURCE P20-P25.agc:3049
//			0
// PORT: Fixed ROM slots 28150.
    28150, 2,
// PORT: SOURCE P20-P25.agc:3050
//		GOTO
// PORT: Fixed ROM slots 28151.
    28151, 65360,
// PORT: SOURCE P20-P25.agc:3051
//			POINTEX
// PORT: Fixed ROM slots 28152.
    28152, 1232,
// PORT: SOURCE P20-P25.agc:3052
//# Page 625
// PORT: SOURCE P20-P25.agc:3053
//R23.55		UNIT	PUSH		# RCLL IS IN MPAC
// PORT: Fixed ROM slots 28153.
    28153, 34396,
// PORT: SOURCE P20-P25.agc:3054
//		VLOAD
// PORT: Fixed ROM slots 28154.
    28154, 65530,
// PORT: SOURCE P20-P25.agc:3055
//			34D		# RCLL * RCLL
// PORT: Fixed ROM slots 28155.
    28155, 70,
// PORT: SOURCE P20-P25.agc:3056
//		STOVL	30D		# PUSH 30-31 =RCLL*RCLL 32-33=ABVAL RCLL
// PORT: Fixed ROM slots 28156.
    28156, 20542,
// PORT: SOURCE P20-P25.agc:3057
//			VZC
// PORT: Fixed ROM slots 28157.
    28157, 3898,
// PORT: SOURCE P20-P25.agc:3058
//		VXSC	VSR
// PORT: Fixed ROM slots 28158.
    28158, 45538,
// PORT: SOURCE P20-P25.agc:3059
//			ONE/C
// PORT: Fixed ROM slots 28159.
    28159, 20030,
// PORT: SOURCE P20-P25.agc:3060
//			15D
// PORT: Fixed ROM slots 28160.
    28160, 17184,
// PORT: SOURCE P20-P25.agc:3061
//		VAD			# PUSH UP RCLL(UNIT)
// PORT: Fixed ROM slots 28161.
    28161, 65370,
// PORT: SOURCE P20-P25.agc:3062
//		UNIT
// PORT: Fixed ROM slots 28162.
    28162, 65372,
// PORT: SOURCE P20-P25.agc:3063
//		STOVL	UCLSTAR
// PORT: Fixed ROM slots 28163.
    28163, 24390,
// PORT: SOURCE P20-P25.agc:3064
//			VZC
// PORT: Fixed ROM slots 28164.
    28164, 3898,
// PORT: SOURCE P20-P25.agc:3065
//		VSR2	VSU
// PORT: Fixed ROM slots 28165.
    28165, 43460,
// PORT: SOURCE P20-P25.agc:3066
//			VESO
// PORT: Fixed ROM slots 28166.
    28166, 2242,
// PORT: SOURCE P20-P25.agc:3067
//		VXSC	VSR
// PORT: Fixed ROM slots 28167.
    28167, 45538,
// PORT: SOURCE P20-P25.agc:3068
//			ONE/C
// PORT: Fixed ROM slots 28168.
    28168, 20030,
// PORT: SOURCE P20-P25.agc:3069
//			13D
// PORT: Fixed ROM slots 28169.
    28169, 17180,
// PORT: SOURCE P20-P25.agc:3070
//		VAD	UNIT
// PORT: Fixed ROM slots 28170.
    28170, 44634,
// PORT: SOURCE P20-P25.agc:3071
//			US
// PORT: Fixed ROM slots 28171.
    28171, 2846,
// PORT: SOURCE P20-P25.agc:3072
//		STORE	USSTAR
// PORT: Fixed ROM slots 28172.
    28172, 3922,
// PORT: SOURCE P20-P25.agc:3073
//		DOT	SL1
// PORT: Fixed ROM slots 28173.
    28173, 59970,
// PORT: SOURCE P20-P25.agc:3074
//			UCLSTAR
// PORT: Fixed ROM slots 28174.
    28174, 3910,
// PORT: SOURCE P20-P25.agc:3075
//		PUSH	VLOAD		# PD 0,1 = USSTAR(DOT)UCLSTAR
// PORT: Fixed ROM slots 28175.
    28175, 64780,
// PORT: SOURCE P20-P25.agc:3076
//			UCLSTAR
// PORT: Fixed ROM slots 28176.
    28176, 3910,
// PORT: SOURCE P20-P25.agc:3077
//		VXSC	VCOMP
// PORT: Fixed ROM slots 28177.
    28177, 48866,
// PORT: SOURCE P20-P25.agc:3078
//		VSL1	VAD
// PORT: Fixed ROM slots 28178.
    28178, 44532,
// PORT: SOURCE P20-P25.agc:3079
//			USSTAR
// PORT: Fixed ROM slots 28179.
    28179, 3922,
// PORT: SOURCE P20-P25.agc:3080
//		UNIT
// PORT: Fixed ROM slots 28180.
    28180, 65372,
// PORT: SOURCE P20-P25.agc:3081
//		STOVL	BVECTOR		# USSTAR - COSQ(UCLSTAR)
// PORT: Fixed ROM slots 28181.
    28181, 24196,
// PORT: SOURCE P20-P25.agc:3082
//			ZEROVECS
// PORT: Fixed ROM slots 28182.
    28182, 13754,
// PORT: SOURCE P20-P25.agc:3083
//		STORE	BVECTOR +6
// PORT: Fixed ROM slots 28183.
    28183, 3728,
// PORT: SOURCE P20-P25.agc:3084
//		STODL	BVECTOR +12D
// PORT: Fixed ROM slots 28184.
    28184, 16028,
// PORT: SOURCE P20-P25.agc:3085
//			0
// PORT: Fixed ROM slots 28185.
    28185, 2,
// PORT: SOURCE P20-P25.agc:3086
//		ACOS	DCOMP
// PORT: Fixed ROM slots 28186.
    28186, 48812,
// PORT: SOURCE P20-P25.agc:3087
//		PUSH	DLOAD
// PORT: Fixed ROM slots 28187.
    28187, 58636,
// PORT: SOURCE P20-P25.agc:3088
//			ZEROVECS
// PORT: Fixed ROM slots 28188.
    28188, 13754,
// PORT: SOURCE P20-P25.agc:3089
//		EXIT
// PORT: Fixed ROM slots 28189.
    28189, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28190–28196.
function agcAotUnit1619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28192 {
        if slot <= 28190 {
// PORT: SOURCE P20-P25.agc:3090
//		CA	VARSUBL		# PUT FIXED INTO ERASABLE FOR MSU
// PORT: Fixed ROM slots 28190.
            if slot <> 28190 or instruction <> 14120 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1832), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28191 {
// PORT: SOURCE P20-P25.agc:3091
//		TS	L		# INSTRUCTION COMING UP
// PORT: Fixed ROM slots 28191.
                if slot <> 28191 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:3092
//		CA	TRUNION		# REQUIRED TO CHANGE 2'S COMPLEMENT
// PORT: Fixed ROM slots 28192.
                if slot <> 28192 or instruction <> 13292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1004).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28194 {
            if slot <= 28193 {
// PORT: SOURCE P20-P25.agc:3093
//		EXTEND			# TRUNION TO 1'S COMPLEMENT
// PORT: Fixed ROM slots 28193.
                if slot <> 28193 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:3094
//		MSU	L		# TRUNION (2'S)-00000 CONVERTS TRUNION TO
// PORT: Fixed ROM slots 28194.
                if slot <> 28194 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMSU(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28195 {
// PORT: SOURCE P20-P25.agc:3095
//		TS	MPAC		# 1'S.  VARSUBL=00000.
// PORT: Fixed ROM slots 28195.
                if slot <> 28195 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:3096
//		TC	INTPRET
// PORT: Fixed ROM slots 28196.
                if slot <> 28196 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1619] to agcAotUnit1619@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3097
//		PUSH	SLOAD		# PUSH IS DP.  WHEN BDSU IS EXECUTED, 2ND
// PORT: Fixed ROM slots 28197.
    28197, 56588,
// PORT: SOURCE P20-P25.agc:3098
//			TRUNBIAS	# HALF OF PUSHLIST IS GUARANTEED ZERO FROM
// PORT: Fixed ROM slots 28198.
    28198, 1478,
// PORT: SOURCE P20-P25.agc:3099
//		BDSU			# DLOAD ZEROVECS ABOVE
// PORT: Fixed ROM slots 28199.
    28199, 65314,
// PORT: SOURCE P20-P25.agc:3100
//		SR3	DAD
// PORT: Fixed ROM slots 28200.
    28200, 36164,
// PORT: SOURCE P20-P25.agc:3101
//		DAD	DMP
// PORT: Fixed ROM slots 28201.
    28201, 34074,
// PORT: SOURCE P20-P25.agc:3102
//# Page 626
// PORT: SOURCE P20-P25.agc:3103
//			TRUN19
// PORT: Fixed ROM slots 28202.
    28202, 20042,
// PORT: SOURCE P20-P25.agc:3104
//			32D
// PORT: Fixed ROM slots 28203.
    28203, 66,
// PORT: SOURCE P20-P25.agc:3105
//		DMP	SL3
// PORT: Fixed ROM slots 28204.
    28204, 43530,
// PORT: SOURCE P20-P25.agc:3106
//			PI/4.0
// PORT: Fixed ROM slots 28205.
    28205, 7302,
// PORT: SOURCE P20-P25.agc:3107
//		BOFF	SL2
// PORT: Fixed ROM slots 28206.
    28206, 51736,
// PORT: SOURCE P20-P25.agc:3108
//			CMOONFLG
// PORT: Fixed ROM slots 28207.
    28207, 4550,
// PORT: SOURCE P20-P25.agc:3109
//			R23.51
// PORT: Fixed ROM slots 28208.
    28208, 52322,
// PORT: SOURCE P20-P25.agc:3110
//R23.51		STODL	DELTAQ
// PORT: Fixed ROM slots 28209.
    28209, 16040,
// PORT: SOURCE P20-P25.agc:3111
//			30D		# RCLL * RCLL
// PORT: Fixed ROM slots 28210.
    28210, 62,
// PORT: SOURCE P20-P25.agc:3112
//		DMP	RTB
// PORT: Fixed ROM slots 28211.
    28211, 39946,
// PORT: SOURCE P20-P25.agc:3113
//			TRUNVAR
// PORT: Fixed ROM slots 28212.
    28212, 20056,
// PORT: SOURCE P20-P25.agc:3114
//			TPMODE
// PORT: Fixed ROM slots 28213.
    28213, 38634,
// PORT: SOURCE P20-P25.agc:3115
//		TAD
// PORT: Fixed ROM slots 28214.
    28214, 65522,
// PORT: SOURCE P20-P25.agc:3116
//			VARSUBL
// PORT: Fixed ROM slots 28215.
    28215, 20050,
// PORT: SOURCE P20-P25.agc:3117
//		STORE	VARIANCE
// PORT: Fixed ROM slots 28216.
    28216, 3756,
// PORT: SOURCE P20-P25.agc:3118
//		CLEAR	CALL
// PORT: Fixed ROM slots 28217.
    28217, 37912,
// PORT: SOURCE P20-P25.agc:3119
//			DMENFLG
// PORT: Fixed ROM slots 28218.
    28218, 2924,
// PORT: SOURCE P20-P25.agc:3120
//			INCORP1
// PORT: Fixed ROM slots 28219.
    28219, 62808,
// PORT: SOURCE P20-P25.agc:3121
//		CALL
// PORT: Fixed ROM slots 28220.
    28220, 65320,
// PORT: SOURCE P20-P25.agc:3122
//			GRP2PC
// PORT: Fixed ROM slots 28221.
    28221, 48080,
// PORT: SOURCE P20-P25.agc:3123
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 28222.
    28222, 42746,
// PORT: SOURCE P20-P25.agc:3124
//			DELTAX +6
// PORT: Fixed ROM slots 28223.
    28223, 1386,
// PORT: SOURCE P20-P25.agc:3125
//		BOF	SR2		# DISPLAY IS 2-27 IF IN LUNAR SPHERE.
// PORT: Fixed ROM slots 28224.
    28224, 49688,
// PORT: SOURCE P20-P25.agc:3126
//			CMOONFLG
// PORT: Fixed ROM slots 28225.
    28225, 4550,
// PORT: SOURCE P20-P25.agc:3127
//			R23.52
// PORT: Fixed ROM slots 28226.
    28226, 52358,
// PORT: SOURCE P20-P25.agc:3128
//R23.52		STOVL	N49DISP +2
// PORT: Fixed ROM slots 28227.
    28227, 24200,
// PORT: SOURCE P20-P25.agc:3129
//			DELTAX
// PORT: Fixed ROM slots 28228.
    28228, 1374,
// PORT: SOURCE P20-P25.agc:3130
//		ABVAL
// PORT: Fixed ROM slots 28229.
    28229, 65356,
// PORT: SOURCE P20-P25.agc:3131
//		BOF	SR2
// PORT: Fixed ROM slots 28230.
    28230, 49688,
// PORT: SOURCE P20-P25.agc:3132
//			CMOONFLG
// PORT: Fixed ROM slots 28231.
    28231, 4550,
// PORT: SOURCE P20-P25.agc:3133
//			R23.53
// PORT: Fixed ROM slots 28232.
    28232, 52370,
// PORT: SOURCE P20-P25.agc:3134
//R23.53		STORE	N49DISP
// PORT: Fixed ROM slots 28233.
    28233, 3716,
// PORT: SOURCE P20-P25.agc:3135
//		EXIT
// PORT: Fixed ROM slots 28234.
    28234, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28235–28236.
function agcAotUnit1620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28235 {
// PORT: SOURCE P20-P25.agc:3136
//R23.6		CAF	V6N49
// PORT: Fixed ROM slots 28235.
        if slot <> 28235 or instruction <> 14125 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1837), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:3137
//		TC	BANKCALL
// PORT: Fixed ROM slots 28236.
        if slot <> 28236 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1620] to agcAotUnit1620@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3138
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 28237.
    28237, 17502
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28238–28243.
function agcAotUnit1621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28240 {
        if slot <= 28238 {
// PORT: SOURCE P20-P25.agc:3139
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 28238.
            if slot <> 28238 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28239 {
// PORT: SOURCE P20-P25.agc:3140
//		TC	R23.7		# INCORPORATE DATA
// PORT: Fixed ROM slots 28239.
                if slot <> 28239 or instruction <> 1622 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1622, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:3141
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 28240.
                if slot <> 28240 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28241 {
// PORT: SOURCE P20-P25.agc:3142
//		CAF	BIT3		# BLAN OUT R3
// PORT: Fixed ROM slots 28241.
            if slot <> 28241 or instruction <> 14861 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28242 {
// PORT: SOURCE P20-P25.agc:3143
//		TC	BLANKET
// PORT: Fixed ROM slots 28242.
                if slot <> 28242 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:3144
//		TC	PHASCHNG
// PORT: Fixed ROM slots 28243.
                if slot <> 28243 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1621] to agcAotUnit1621@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3145
//		OCT	00012
// PORT: Fixed ROM slots 28244.
    28244, 20
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28245–28246.
function agcAotUnit1622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28245 {
// PORT: SOURCE P20-P25.agc:3146
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 28245.
        if slot <> 28245 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:3147
//R23.7		TC	INTPRET
// PORT: Fixed ROM slots 28246.
        if slot <> 28246 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1622] to agcAotUnit1622@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3148
//R23.8		SET	CALL
// PORT: Fixed ROM slots 28247.
    28247, 37912,
// PORT: SOURCE P20-P25.agc:3149
//			VEHUPFLG
// PORT: Fixed ROM slots 28248.
    28248, 622,
// PORT: SOURCE P20-P25.agc:3150
//			INCORP2
// PORT: Fixed ROM slots 28249.
    28249, 63084,
// PORT: SOURCE P20-P25.agc:3151
//		EXIT
// PORT: Fixed ROM slots 28250.
    28250, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28251–28253.
function agcAotUnit1623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28251 {
// PORT: SOURCE P20-P25.agc:3152
//R23.END		TC	GOTOPOOH
// PORT: Fixed ROM slots 28251.
        if slot <> 28251 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28252 {
// PORT: SOURCE P20-P25.agc:3153
//
// PORT: SOURCE P20-P25.agc:3154
//# Page 627
// PORT: SOURCE P20-P25.agc:3155
//R23.10		TC	FALTON
// PORT: Fixed ROM slots 28252.
            if slot <> 28252 or instruction <> 2304 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2304, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3156
//		TC	P23.06
// PORT: Fixed ROM slots 28253.
            if slot <> 28253 or instruction <> 1316 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1316, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1623] to agcAotUnit1623@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3157
//HORIZ		STQ	SETPD
// PORT: Fixed ROM slots 28254.
    28254, 33056,
// PORT: SOURCE P20-P25.agc:3158
//			SRRETURN
// PORT: Fixed ROM slots 28255.
    28255, 3932,
// PORT: SOURCE P20-P25.agc:3159
//			0
// PORT: Fixed ROM slots 28256.
    28256, 2,
// PORT: SOURCE P20-P25.agc:3160
//		DLOAD	PDDL		# PUSH 0-1 = -AYO SCALED B0
// PORT: Fixed ROM slots 28257.
    28257, 54730,
// PORT: SOURCE P20-P25.agc:3161
//			-AYO
// PORT: Fixed ROM slots 28258.
    28258, 1944,
// PORT: SOURCE P20-P25.agc:3162
//			AXO
// PORT: Fixed ROM slots 28259.
    28259, 1948,
// PORT: SOURCE P20-P25.agc:3163
//		PDDL	PDVL		# PUSH 2-3 = +AX SCALED B0
// PORT: Fixed ROM slots 28260.
    28260, 52650,
// PORT: SOURCE P20-P25.agc:3164
//			DPPOSMAX
// PORT: Fixed ROM slots 28261.
    28261, 13766,
// PORT: SOURCE P20-P25.agc:3165
//			US
// PORT: Fixed ROM slots 28262.
    28262, 2846,
// PORT: SOURCE P20-P25.agc:3166
//		VXV	UNIT
// PORT: Fixed ROM slots 28263.
    28263, 44602,
// PORT: SOURCE P20-P25.agc:3167
//			RZC
// PORT: Fixed ROM slots 28264.
    28264, 3886,
// PORT: SOURCE P20-P25.agc:3168
//		STOVL	UBAR2
// PORT: Fixed ROM slots 28265.
    28265, 24354,
// PORT: SOURCE P20-P25.agc:3169
//		VXV	UNIT		# PUSH UP
// PORT: Fixed ROM slots 28266.
    28266, 44602,
// PORT: SOURCE P20-P25.agc:3170
//			UBAR2
// PORT: Fixed ROM slots 28267.
    28267, 3874,
// PORT: SOURCE P20-P25.agc:3171
//		STOVL	UBAR0
// PORT: Fixed ROM slots 28268.
    28268, 24330,
// PORT: SOURCE P20-P25.agc:3172
//			UBAR2
// PORT: Fixed ROM slots 28269.
    28269, 3874,
// PORT: SOURCE P20-P25.agc:3173
//		VXV	UNIT
// PORT: Fixed ROM slots 28270.
    28270, 44602,
// PORT: SOURCE P20-P25.agc:3174
//			UBAR0
// PORT: Fixed ROM slots 28271.
    28271, 3850,
// PORT: SOURCE P20-P25.agc:3175
//		STORE	UBAR1
// PORT: Fixed ROM slots 28272.
    28272, 3862,
// PORT: SOURCE P20-P25.agc:3176
//		BON	DOT
// PORT: Fixed ROM slots 28273.
    28273, 41240,
// PORT: SOURCE P20-P25.agc:3177
//			LUNAFLAG
// PORT: Fixed ROM slots 28274.
    28274, 1926,
// PORT: SOURCE P20-P25.agc:3178
//			HORIZ.6
// PORT: Fixed ROM slots 28275.
    28275, 52706,
// PORT: SOURCE P20-P25.agc:3179
//			0		# UBAR1 DOT UZ
// PORT: Fixed ROM slots 28276.
    28276, 2,
// PORT: SOURCE P20-P25.agc:3180
//		STCALL	ALPHAV +4
// PORT: Fixed ROM slots 28277.
    28277, 30940,
// PORT: SOURCE P20-P25.agc:3181
//			GETERAD
// PORT: Fixed ROM slots 28278.
    28278, 23178,
// PORT: SOURCE P20-P25.agc:3182
//		DAD	PDDL		# MPAC HAS RADIUS OF FISCHER ELLIPSOID
// PORT: Fixed ROM slots 28279.
    28279, 54554,
// PORT: SOURCE P20-P25.agc:3183
//			HORIZALT	# PUSH 0-1 = BH SCALED B29
// PORT: Fixed ROM slots 28280.
    28280, 1498,
// PORT: SOURCE P20-P25.agc:3184
//			AEARTH
// PORT: Fixed ROM slots 28281.
    28281, 20034,
// PORT: SOURCE P20-P25.agc:3185
//		DAD	PUSH		# PUSH 2-3 = AH B29
// PORT: Fixed ROM slots 28282.
    28282, 34330,
// PORT: SOURCE P20-P25.agc:3186
//			HORIZALT
// PORT: Fixed ROM slots 28283.
    28283, 1498,
// PORT: SOURCE P20-P25.agc:3187
//HORIZ.1		VLOAD	MXV
// PORT: Fixed ROM slots 28284.
    28284, 53754,
// PORT: SOURCE P20-P25.agc:3188
//			RZC		# B29
// PORT: Fixed ROM slots 28285.
    28285, 3886,
// PORT: SOURCE P20-P25.agc:3189
//			UBAR0		# B1
// PORT: Fixed ROM slots 28286.
    28286, 3850,
// PORT: SOURCE P20-P25.agc:3190
//		VSL1	PDVL		# PUSH 4-9 = RH(XH,YH,ZH) B29
// PORT: Fixed ROM slots 28287.
    28287, 52724,
// PORT: SOURCE P20-P25.agc:3191
//			US
// PORT: Fixed ROM slots 28288.
    28288, 2846,
// PORT: SOURCE P20-P25.agc:3192
//		MXV	VSL1
// PORT: Fixed ROM slots 28289.
    28289, 64162,
// PORT: SOURCE P20-P25.agc:3193
//			UBAR0
// PORT: Fixed ROM slots 28290.
    28290, 3850,
// PORT: SOURCE P20-P25.agc:3194
//		PDDL			# PUSH 10-15 = USH B1
// PORT: Fixed ROM slots 28291.
    28291, 65450,
// PORT: SOURCE P20-P25.agc:3195
//			2		# AH
// PORT: Fixed ROM slots 28292.
    28292, 6,
// PORT: SOURCE P20-P25.agc:3196
//		STODL	34D
// PORT: Fixed ROM slots 28293.
    28293, 12358,
// PORT: SOURCE P20-P25.agc:3197
//			4		# XH
// PORT: Fixed ROM slots 28294.
    28294, 10,
// PORT: SOURCE P20-P25.agc:3198
//		CALL
// PORT: Fixed ROM slots 28295.
    28295, 65320,
// PORT: SOURCE P20-P25.agc:3199
//			DIVIDE
// PORT: Fixed ROM slots 28296.
    28296, 52714,
// PORT: SOURCE P20-P25.agc:3200
//		SR*	DMP
// PORT: Fixed ROM slots 28297.
    28297, 34142,
// PORT: SOURCE P20-P25.agc:3201
//			8D,1		# NOW SCALED B9
// PORT: Fixed ROM slots 28298.
    28298, 17170,
// PORT: SOURCE P20-P25.agc:3202
//			MPAC
// PORT: Fixed ROM slots 28299.
    28299, 218,
// PORT: SOURCE P20-P25.agc:3203
//		STODL	30D
// PORT: Fixed ROM slots 28300.
    28300, 12350,
// PORT: SOURCE P20-P25.agc:3204
//			0
// PORT: Fixed ROM slots 28301.
    28301, 2,
// PORT: SOURCE P20-P25.agc:3205
//# Page 628
// PORT: SOURCE P20-P25.agc:3206
//		STODL	34D
// PORT: Fixed ROM slots 28302.
    28302, 12358,
// PORT: SOURCE P20-P25.agc:3207
//			6		# YH
// PORT: Fixed ROM slots 28303.
    28303, 14,
// PORT: SOURCE P20-P25.agc:3208
//		CALL
// PORT: Fixed ROM slots 28304.
    28304, 65320,
// PORT: SOURCE P20-P25.agc:3209
//			DIVIDE
// PORT: Fixed ROM slots 28305.
    28305, 52714,
// PORT: SOURCE P20-P25.agc:3210
//		SR*	DMP
// PORT: Fixed ROM slots 28306.
    28306, 34142,
// PORT: SOURCE P20-P25.agc:3211
//			8D,1		# B9
// PORT: Fixed ROM slots 28307.
    28307, 17170,
// PORT: SOURCE P20-P25.agc:3212
//			MPAC		# B18
// PORT: Fixed ROM slots 28308.
    28308, 218,
// PORT: SOURCE P20-P25.agc:3213
//		DAD	PUSH		# PUSH 16-17 =A SCALED B18
// PORT: Fixed ROM slots 28309.
    28309, 34330,
// PORT: SOURCE P20-P25.agc:3214
//			30D
// PORT: Fixed ROM slots 28310.
    28310, 62,
// PORT: SOURCE P20-P25.agc:3215
//		DSU	SQRT
// PORT: Fixed ROM slots 28311.
    28311, 63018,
// PORT: SOURCE P20-P25.agc:3216
//			1.0B18
// PORT: Fixed ROM slots 28312.
    28312, 20046,
// PORT: SOURCE P20-P25.agc:3217
//		PDDL			# PUSH 18-19 SQRT(A-1) B9
// PORT: Fixed ROM slots 28313.
    28313, 65450,
// PORT: SOURCE P20-P25.agc:3218
//			16D
// PORT: Fixed ROM slots 28314.
    28314, 34,
// PORT: SOURCE P20-P25.agc:3219
//		STODL	34D
// PORT: Fixed ROM slots 28315.
    28315, 12358,
// PORT: SOURCE P20-P25.agc:3220
//			4		# XH
// PORT: Fixed ROM slots 28316.
    28316, 10,
// PORT: SOURCE P20-P25.agc:3221
//		CALL
// PORT: Fixed ROM slots 28317.
    28317, 65320,
// PORT: SOURCE P20-P25.agc:3222
//			DIVIDE
// PORT: Fixed ROM slots 28318.
    28318, 52714,
// PORT: SOURCE P20-P25.agc:3223
//		SR*	PDDL
// PORT: Fixed ROM slots 28319.
    28319, 54622,
// PORT: SOURCE P20-P25.agc:3224
//			17D,1		# PUSH 20-21 = XH/A B29
// PORT: Fixed ROM slots 28320.
    28320, 17188,
// PORT: SOURCE P20-P25.agc:3225
//			6		# YH
// PORT: Fixed ROM slots 28321.
    28321, 14,
// PORT: SOURCE P20-P25.agc:3226
//		CALL
// PORT: Fixed ROM slots 28322.
    28322, 65320,
// PORT: SOURCE P20-P25.agc:3227
//			DIVIDE
// PORT: Fixed ROM slots 28323.
    28323, 52714,
// PORT: SOURCE P20-P25.agc:3228
//		SR*	PDDL
// PORT: Fixed ROM slots 28324.
    28324, 54622,
// PORT: SOURCE P20-P25.agc:3229
//			17D,1		# PUSH 22-23 = YH/A B29
// PORT: Fixed ROM slots 28325.
    28325, 17188,
// PORT: SOURCE P20-P25.agc:3230
//			16D		# A
// PORT: Fixed ROM slots 28326.
    28326, 34,
// PORT: SOURCE P20-P25.agc:3231
//		STODL	34D
// PORT: Fixed ROM slots 28327.
    28327, 12358,
// PORT: SOURCE P20-P25.agc:3232
//			18D		# SQRT(A-1)
// PORT: Fixed ROM slots 28328.
    28328, 38,
// PORT: SOURCE P20-P25.agc:3233
//		CALL
// PORT: Fixed ROM slots 28329.
    28329, 65320,
// PORT: SOURCE P20-P25.agc:3234
//			DIVIDE
// PORT: Fixed ROM slots 28330.
    28330, 52714,
// PORT: SOURCE P20-P25.agc:3235
//		SR*
// PORT: Fixed ROM slots 28331.
    28331, 65374,
// PORT: SOURCE P20-P25.agc:3236
//			8D,1
// PORT: Fixed ROM slots 28332.
    28332, 17170,
// PORT: SOURCE P20-P25.agc:3237
//		STODL	28D
// PORT: Fixed ROM slots 28333.
    28333, 12346,
// PORT: SOURCE P20-P25.agc:3238
//			0		# BH
// PORT: Fixed ROM slots 28334.
    28334, 2,
// PORT: SOURCE P20-P25.agc:3239
//		STODL	34D
// PORT: Fixed ROM slots 28335.
    28335, 12358,
// PORT: SOURCE P20-P25.agc:3240
//			2		# AH
// PORT: Fixed ROM slots 28336.
    28336, 6,
// PORT: SOURCE P20-P25.agc:3241
//		CALL
// PORT: Fixed ROM slots 28337.
    28337, 65320,
// PORT: SOURCE P20-P25.agc:3242
//			DIVIDE
// PORT: Fixed ROM slots 28338.
    28338, 52714,
// PORT: SOURCE P20-P25.agc:3243
//		SR*	DMP		# AH/BH SCALED B1
// PORT: Fixed ROM slots 28339.
    28339, 34142,
// PORT: SOURCE P20-P25.agc:3244
//			0,1
// PORT: Fixed ROM slots 28340.
    28340, 17154,
// PORT: SOURCE P20-P25.agc:3245
//			28D		# SQRT(A-1)/A
// PORT: Fixed ROM slots 28341.
    28341, 58,
// PORT: SOURCE P20-P25.agc:3246
//		DMP	SL1
// PORT: Fixed ROM slots 28342.
    28342, 59914,
// PORT: SOURCE P20-P25.agc:3247
//			6		# YH
// PORT: Fixed ROM slots 28343.
    28343, 14,
// PORT: SOURCE P20-P25.agc:3248
//		PDDL
// PORT: Fixed ROM slots 28344.
    28344, 65450,
// PORT: SOURCE P20-P25.agc:3249
//			2		# AH
// PORT: Fixed ROM slots 28345.
    28345, 6,
// PORT: SOURCE P20-P25.agc:3250
//		STODL	34D
// PORT: Fixed ROM slots 28346.
    28346, 12358,
// PORT: SOURCE P20-P25.agc:3251
//			0
// PORT: Fixed ROM slots 28347.
    28347, 2,
// PORT: SOURCE P20-P25.agc:3252
//		CALL
// PORT: Fixed ROM slots 28348.
    28348, 65320,
// PORT: SOURCE P20-P25.agc:3253
//			DIVIDE
// PORT: Fixed ROM slots 28349.
    28349, 52714,
// PORT: SOURCE P20-P25.agc:3254
//		SR*	DMP		# BH/AH SCALED B1
// PORT: Fixed ROM slots 28350.
    28350, 34142,
// PORT: SOURCE P20-P25.agc:3255
//			0,1
// PORT: Fixed ROM slots 28351.
    28351, 17154,
// PORT: SOURCE P20-P25.agc:3256
//# Page 629
// PORT: SOURCE P20-P25.agc:3257
//			28D		# SQRT (A-1)/A
// PORT: Fixed ROM slots 28352.
    28352, 58,
// PORT: SOURCE P20-P25.agc:3258
//		DMP	SL1
// PORT: Fixed ROM slots 28353.
    28353, 59914,
// PORT: SOURCE P20-P25.agc:3259
//			4		# XH
// PORT: Fixed ROM slots 28354.
    28354, 10,
// PORT: SOURCE P20-P25.agc:3260
//		PDDL	DAD
// PORT: Fixed ROM slots 28355.
    28355, 36266,
// PORT: SOURCE P20-P25.agc:3261
//			20D		# XH/A
// PORT: Fixed ROM slots 28356.
    28356, 42,
// PORT: SOURCE P20-P25.agc:3262
//			24D		# ALPHA
// PORT: Fixed ROM slots 28357.
    28357, 50,
// PORT: SOURCE P20-P25.agc:3263
//		PDDL	DSU
// PORT: Fixed ROM slots 28358.
    28358, 38314,
// PORT: SOURCE P20-P25.agc:3264
//			22D		# YH/A
// PORT: Fixed ROM slots 28359.
    28359, 46,
// PORT: SOURCE P20-P25.agc:3265
//			26D		# BETA
// PORT: Fixed ROM slots 28360.
    28360, 54,
// PORT: SOURCE P20-P25.agc:3266
//		PUSH	SETPD
// PORT: Fixed ROM slots 28361.
    28361, 33036,
// PORT: SOURCE P20-P25.agc:3267
//			16D
// PORT: Fixed ROM slots 28362.
    28362, 34,
// PORT: SOURCE P20-P25.agc:3268
//		DLOAD	DSU
// PORT: Fixed ROM slots 28363.
    28363, 38346,
// PORT: SOURCE P20-P25.agc:3269
//			20D		# XH/A
// PORT: Fixed ROM slots 28364.
    28364, 42,
// PORT: SOURCE P20-P25.agc:3270
//			24D		# ALPHA
// PORT: Fixed ROM slots 28365.
    28365, 50,
// PORT: SOURCE P20-P25.agc:3271
//		PDDL	DAD
// PORT: Fixed ROM slots 28366.
    28366, 36266,
// PORT: SOURCE P20-P25.agc:3272
//			22D		# YH/A
// PORT: Fixed ROM slots 28367.
    28367, 46,
// PORT: SOURCE P20-P25.agc:3273
//			26D		# BETA
// PORT: Fixed ROM slots 28368.
    28368, 54,
// PORT: SOURCE P20-P25.agc:3274
//		PDDL	PUSH
// PORT: Fixed ROM slots 28369.
    28369, 34474,
// PORT: SOURCE P20-P25.agc:3275
//			ZEROVECS
// PORT: Fixed ROM slots 28370.
    28370, 13754,
// PORT: SOURCE P20-P25.agc:3276
//		STOVL	32D		# ZERO THIRD COMP. OF T-0 VECTOR
// PORT: Fixed ROM slots 28371.
    28371, 20546,
// PORT: SOURCE P20-P25.agc:3277
//			28D
// PORT: Fixed ROM slots 28372.
    28372, 58,
// PORT: SOURCE P20-P25.agc:3278
//		VSU	UNIT
// PORT: Fixed ROM slots 28373.
    28373, 44626,
// PORT: SOURCE P20-P25.agc:3279
//			4		# RH VECTOR
// PORT: Fixed ROM slots 28374.
    28374, 10,
// PORT: SOURCE P20-P25.agc:3280
//		DOT	PDVL		# PUSH 22-23 A-SUB-ZERO
// PORT: Fixed ROM slots 28375.
    28375, 52546,
// PORT: SOURCE P20-P25.agc:3281
//			10D		# USH VECTOR
// PORT: Fixed ROM slots 28376.
    28376, 22,
// PORT: SOURCE P20-P25.agc:3282
//			16D		# T1 VECTOR
// PORT: Fixed ROM slots 28377.
    28377, 34,
// PORT: SOURCE P20-P25.agc:3283
//		VSU	UNIT
// PORT: Fixed ROM slots 28378.
    28378, 44626,
// PORT: SOURCE P20-P25.agc:3284
//			4		# RH VECTOR
// PORT: Fixed ROM slots 28379.
    28379, 10
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3285
//		DOT	PUSH		# PUSH 24-25 A-SUB-ONE
// PORT: Fixed ROM slots 28380.
    28380, 34370,
// PORT: SOURCE P20-P25.agc:3286
//			10D
// PORT: Fixed ROM slots 28381.
    28381, 22,
// PORT: SOURCE P20-P25.agc:3287
//		BDSU	BMN
// PORT: Fixed ROM slots 28382.
    28382, 40994,
// PORT: SOURCE P20-P25.agc:3288
//			22D		# A-SUB-ZERO
// PORT: Fixed ROM slots 28383.
    28383, 46,
// PORT: SOURCE P20-P25.agc:3289
//			HORIZ.3
// PORT: Fixed ROM slots 28384.
    28384, 52686,
// PORT: SOURCE P20-P25.agc:3290
//		BON
// PORT: Fixed ROM slots 28385.
    28385, 65304,
// PORT: SOURCE P20-P25.agc:3291
//			NORFHOR
// PORT: Fixed ROM slots 28386.
    28386, 392,
// PORT: SOURCE P20-P25.agc:3292
//			HORIZ.4
// PORT: Fixed ROM slots 28387.
    28387, 52694,
// PORT: SOURCE P20-P25.agc:3293
//HORIZ.2		VLOAD	GOTO
// PORT: Fixed ROM slots 28388.
    28388, 43258,
// PORT: SOURCE P20-P25.agc:3294
//			28D		# T-0 VECTOR
// PORT: Fixed ROM slots 28389.
    28389, 58,
// PORT: SOURCE P20-P25.agc:3295
//			HORIZ.5
// PORT: Fixed ROM slots 28390.
    28390, 52698,
// PORT: SOURCE P20-P25.agc:3296
//HORIZ.3		BON	GOTO
// PORT: Fixed ROM slots 28391.
    28391, 43032,
// PORT: SOURCE P20-P25.agc:3297
//			NORFHOR
// PORT: Fixed ROM slots 28392.
    28392, 392,
// PORT: SOURCE P20-P25.agc:3298
//			HORIZ.2
// PORT: Fixed ROM slots 28393.
    28393, 52680,
// PORT: SOURCE P20-P25.agc:3299
//			HORIZ.4
// PORT: Fixed ROM slots 28394.
    28394, 52694,
// PORT: SOURCE P20-P25.agc:3300
//HORIZ.4		VLOAD
// PORT: Fixed ROM slots 28395.
    28395, 65530,
// PORT: SOURCE P20-P25.agc:3301
//			16D		# T1 VECTOR
// PORT: Fixed ROM slots 28396.
    28396, 34,
// PORT: SOURCE P20-P25.agc:3302
//HORIZ.5		VXM	VSL1
// PORT: Fixed ROM slots 28397.
    28397, 64138,
// PORT: SOURCE P20-P25.agc:3303
//			UBAR0
// PORT: Fixed ROM slots 28398.
    28398, 3850,
// PORT: SOURCE P20-P25.agc:3304
//		GOTO
// PORT: Fixed ROM slots 28399.
    28399, 65360,
// PORT: SOURCE P20-P25.agc:3305
//			SRRETURN
// PORT: Fixed ROM slots 28400.
    28400, 3932,
// PORT: SOURCE P20-P25.agc:3306
//HORIZ.6		DLOAD	PUSH
// PORT: Fixed ROM slots 28401.
    28401, 34506,
// PORT: SOURCE P20-P25.agc:3307
//# Page 630
// PORT: SOURCE P20-P25.agc:3308
//			RADMOON
// PORT: Fixed ROM slots 28402.
    28402, 20038,
// PORT: SOURCE P20-P25.agc:3309
//		PUSH	GOTO
// PORT: Fixed ROM slots 28403.
    28403, 43020,
// PORT: SOURCE P20-P25.agc:3310
//			HORIZ.1
// PORT: Fixed ROM slots 28404.
    28404, 52472,
// PORT: SOURCE P20-P25.agc:3311
//DIVIDE		NORM	SR1
// PORT: Fixed ROM slots 28405.
    28405, 57986,
// PORT: SOURCE P20-P25.agc:3312
//			X1
// PORT: Fixed ROM slots 28406.
    28406, 78,
// PORT: SOURCE P20-P25.agc:3313
//		STODL	36D
// PORT: Fixed ROM slots 28407.
    28407, 12362,
// PORT: SOURCE P20-P25.agc:3314
//			34D
// PORT: Fixed ROM slots 28408.
    28408, 70,
// PORT: SOURCE P20-P25.agc:3315
//		NORM	BDDV
// PORT: Fixed ROM slots 28409.
    28409, 46466,
// PORT: SOURCE P20-P25.agc:3316
//			S1
// PORT: Fixed ROM slots 28410.
    28410, 82,
// PORT: SOURCE P20-P25.agc:3317
//			36D
// PORT: Fixed ROM slots 28411.
    28411, 74,
// PORT: SOURCE P20-P25.agc:3318
//		XSU,1	RVQ
// PORT: Fixed ROM slots 28412.
    28412, 36448,
// PORT: SOURCE P20-P25.agc:3319
//			S1
// PORT: Fixed ROM slots 28413.
    28413, 80,
// PORT: SOURCE P20-P25.agc:3320
//RECT.1		BOFF	AXT,2		# SR TO SET ZMEASURE = 0 IF MEASUREMENT
// PORT: Fixed ROM slots 28414.
    28414, 64536,
// PORT: SOURCE P20-P25.agc:3321
//			CMOONFLG	#   PLANET AND PRIMARY PLANET ARE THE SAME.
// PORT: Fixed ROM slots 28415.
    28415, 4550,
// PORT: SOURCE P20-P25.agc:3322
//			RECT.3		#     OTHERWISE = 1
// PORT: Fixed ROM slots 28416.
    28416, 52752,
// PORT: SOURCE P20-P25.agc:3323
//		DEC	-2
// PORT: Fixed ROM slots 28417.
    28417, 65530,
// PORT: SOURCE P20-P25.agc:3324
//		BOFF			#       VEC. AND SCALE B29 AND B7
// PORT: Fixed ROM slots 28418.
    28418, 65304,
// PORT: SOURCE P20-P25.agc:3325
//			LUNAFLAG
// PORT: Fixed ROM slots 28419.
    28419, 1990,
// PORT: SOURCE P20-P25.agc:3326
//			RECT.4
// PORT: Fixed ROM slots 28420.
    28420, 52760,
// PORT: SOURCE P20-P25.agc:3327
//RECT.2		CLEAR	GOTO
// PORT: Fixed ROM slots 28421.
    28421, 43032,
// PORT: SOURCE P20-P25.agc:3328
//			ZMEASURE
// PORT: Fixed ROM slots 28422.
    28422, 362,
// PORT: SOURCE P20-P25.agc:3329
//			RECT.5
// PORT: Fixed ROM slots 28423.
    28423, 52764,
// PORT: SOURCE P20-P25.agc:3330
//RECT.3		AXT,2	BOFF
// PORT: Fixed ROM slots 28424.
    28424, 36088,
// PORT: SOURCE P20-P25.agc:3331
//			0
// PORT: Fixed ROM slots 28425.
    28425, 0,
// PORT: SOURCE P20-P25.agc:3332
//			LUNAFLAG
// PORT: Fixed ROM slots 28426.
    28426, 1990,
// PORT: SOURCE P20-P25.agc:3333
//			RECT.2
// PORT: Fixed ROM slots 28427.
    28427, 52746,
// PORT: SOURCE P20-P25.agc:3334
//RECT.4		SET
// PORT: Fixed ROM slots 28428.
    28428, 65304,
// PORT: SOURCE P20-P25.agc:3335
//			ZMEASURE
// PORT: Fixed ROM slots 28429.
    28429, 106,
// PORT: SOURCE P20-P25.agc:3336
//RECT.5		VLOAD	VSR7
// PORT: Fixed ROM slots 28430.
    28430, 37626,
// PORT: SOURCE P20-P25.agc:3337
//			DELTACSM	# SCALED B22 OR B18
// PORT: Fixed ROM slots 28431.
    28431, 1782,
// PORT: SOURCE P20-P25.agc:3338
//		VSR*	VAD
// PORT: Fixed ROM slots 28432.
    28432, 44382,
// PORT: SOURCE P20-P25.agc:3339
//			0,2
// PORT: Fixed ROM slots 28433.
    28433, 48380,
// PORT: SOURCE P20-P25.agc:3340
//			RCVCSM		# SCALED B29 OR B27
// PORT: Fixed ROM slots 28434.
    28434, 1806,
// PORT: SOURCE P20-P25.agc:3341
//		VSR*
// PORT: Fixed ROM slots 28435.
    28435, 65374,
// PORT: SOURCE P20-P25.agc:3342
//			0,2
// PORT: Fixed ROM slots 28436.
    28436, 48380,
// PORT: SOURCE P20-P25.agc:3343
//		STOVL	RZC		# NOW SCALED B29
// PORT: Fixed ROM slots 28437.
    28437, 24366,
// PORT: SOURCE P20-P25.agc:3344
//			NUVCSM		# SCALED B3 OR B-1
// PORT: Fixed ROM slots 28438.
    28438, 1794,
// PORT: SOURCE P20-P25.agc:3345
//		VSR4	VSR*
// PORT: Fixed ROM slots 28439.
    28439, 44932,
// PORT: SOURCE P20-P25.agc:3346
//			0,2
// PORT: Fixed ROM slots 28440.
    28440, 48380,
// PORT: SOURCE P20-P25.agc:3347
//		VAD	VSR*
// PORT: Fixed ROM slots 28441.
    28441, 44890,
// PORT: SOURCE P20-P25.agc:3348
//			VCVCSM		# SCALED B7 OR B5
// PORT: Fixed ROM slots 28442.
    28442, 1818,
// PORT: SOURCE P20-P25.agc:3349
//			0,2
// PORT: Fixed ROM slots 28443.
    28443, 48380,
// PORT: SOURCE P20-P25.agc:3350
//		STORE	VZC		# NOW SCALED B7
// PORT: Fixed ROM slots 28444.
    28444, 3898,
// PORT: SOURCE P20-P25.agc:3351
//		RVQ
// PORT: Fixed ROM slots 28445.
    28445, 65308,
// PORT: SOURCE P20-P25.agc:3352
//ONE/C		2DEC*	.333564049 E-6 B+21*
// PORT: Fixed ROM slots 28446 28447.
    28446, 22922, 28447, 5684,
// PORT: SOURCE P20-P25.agc:3353
//
// PORT: SOURCE P20-P25.agc:3354
//AEARTH		2DEC	6378166 B-29	# A AXIS OF EARTH (METERS B-29)
// PORT: Fixed ROM slots 28448 28449.
    28448, 388, 28449, 21174,
// PORT: SOURCE P20-P25.agc:3355
//
// PORT: SOURCE P20-P25.agc:3356
//RADMOON		2DEC	1738090 B-29	# RADIUS MOON IN METERS
// PORT: Fixed ROM slots 28450 28451.
    28450, 106, 28451, 1386,
// PORT: SOURCE P20-P25.agc:3357
//
// PORT: SOURCE P20-P25.agc:3358
//# Page 631
// PORT: SOURCE P20-P25.agc:3359
//
// PORT: SOURCE P20-P25.agc:3360
//TRUN19		OCT	01604
// PORT: Fixed ROM slots 28452.
    28452, 1800,
// PORT: SOURCE P20-P25.agc:3361
//TRUN19A		OCT	00000
// PORT: Fixed ROM slots 28453.
    28453, 0,
// PORT: SOURCE P20-P25.agc:3362
//1.0B18		2DEC	1.0 B-18
// PORT: Fixed ROM slots 28454 28455.
    28454, 0, 28455, 2048,
// PORT: SOURCE P20-P25.agc:3363
//
// PORT: SOURCE P20-P25.agc:3364
//VARSUBL		DEC	0
// PORT: Fixed ROM slots 28456.
    28456, 0,
// PORT: SOURCE P20-P25.agc:3365
//VARSUBL3	2DEC*	3.4299040 E+6 B-26*
// PORT: Fixed ROM slots 28457 28458.
    28457, 1674, 28458, 12416,
// PORT: SOURCE P20-P25.agc:3366
//
// PORT: SOURCE P20-P25.agc:3367
//TRUNVAR		2DEC	2.5 E-9 B+18
// PORT: Fixed ROM slots 28459 28460.
    28459, 20, 28460, 24164,
// PORT: SOURCE P20-P25.agc:3368
//
// PORT: SOURCE P20-P25.agc:3369
//V6N49		VN	0649
// PORT: Fixed ROM slots 28461.
    28461, 1634,
// PORT: SOURCE P20-P25.agc:3370
//V05N70		VN	0570
// PORT: Fixed ROM slots 28462.
    28462, 1420,
// PORT: SOURCE P20-P25.agc:3371
//V05N71		VN	0571
// PORT: Fixed ROM slots 28463.
    28463, 1422,
// PORT: SOURCE P20-P25.agc:3372
//OCT00077	OCT	00077
// PORT: Fixed ROM slots 28464.
    28464, 126,
// PORT: SOURCE P20-P25.agc:3373
//V50N25P		OCT	00202
// PORT: Fixed ROM slots 28465.
    28465, 260,
// PORT: SOURCE P20-P25.agc:3374
//SPSIX		OCT	00006
// PORT: Fixed ROM slots 28466.
    28466, 12,
// PORT: SOURCE P20-P25.agc:3375
//JCAXIS		2DEC	.2688190620	# 1/2(SIN 32.523 DEG)  TRACK AXIS
// PORT: Fixed ROM slots 28467 28468.
    28467, 8808, 28468, 10862,
// PORT: SOURCE P20-P25.agc:3376
//
// PORT: SOURCE P20-P25.agc:3377
//		2DEC	0
// PORT: Fixed ROM slots 28469 28470.
    28469, 0, 28470, 0,
// PORT: SOURCE P20-P25.agc:3378
//
// PORT: SOURCE P20-P25.agc:3379
//		2DEC	.4215878460	# 1/2(COS 32.523 DEG)
// PORT: Fixed ROM slots 28471 28472.
    28471, 13814, 28472, 9676,
// PORT: SOURCE P20-P25.agc:3380
//
// PORT: SOURCE P20-P25.agc:3381
//R60ADRS		CADR	R60CALL +3
// PORT: Fixed ROM slots 28473.
    28473, 52004,
// PORT: SOURCE P20-P25.agc:3382
//NEG37		DEC	-37
// PORT: Fixed ROM slots 28474.
    28474, 65460,
// PORT: SOURCE P20-P25.agc:3383
//BITS7-9		OCT	700
// PORT: Fixed ROM slots 28475.
    28475, 896,
// PORT: SOURCE P20-P25.agc:3384
//BITS4-6		OCT	70
// PORT: Fixed ROM slots 28476.
    28476, 112,
// PORT: SOURCE P20-P25.agc:3385
//		SETLOC	RT53
// PORT: SOURCE P20-P25.agc:3386
//		BANK
// PORT: SOURCE P20-P25.agc:3387
//LOWMEMRY	VLOAD*	RVQ
// PORT: Fixed ROM slots 14336.
    14336, 36598,
// PORT: SOURCE P20-P25.agc:3388
//			CATLOG,1
// PORT: Fixed ROM slots 14337.
    14337, 26594,
// PORT: SOURCE P20-P25.agc:3389
//		BANK	37
// PORT: SOURCE P20-P25.agc:3390
//		SETLOC	P23S1
// PORT: SOURCE P20-P25.agc:3391
//		BANK
// PORT: SOURCE P20-P25.agc:3392
//LDPLANET	EXIT			# KEEP THIS OPEN SUBROUTINE IN EBANK=5
// PORT: Fixed ROM slots 16384.
    16384, 65532
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16385–16386.
function agcAotUnit943 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16385 {
// PORT: SOURCE P20-P25.agc:3393
//		CAF	VNPLAN23	# BECAUSE STAR IS EBANK=5
// PORT: Fixed ROM slots 16385.
        if slot <> 16385 or instruction <> 13327 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1039), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:3394
//		TC	BANKCALL	# LDPLANET ALLOWS VECTOR TO PLANET TO BE
// PORT: Fixed ROM slots 16386.
        if slot <> 16386 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[943] to agcAotUnit943@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3395
//		CADR	GOFLASH		# STORED IN STARSAV2 IF STORED STARS ARE
// PORT: Fixed ROM slots 16387.
    16387, 17312
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16388–16391.
function agcAotUnit944 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16389 {
        if slot <= 16388 {
// PORT: SOURCE P20-P25.agc:3396
//		TC	GOTOPOOH	# NOT VISIBLE
// PORT: Fixed ROM slots 16388.
            if slot <> 16388 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3397
//		TC	+2
// PORT: Fixed ROM slots 16389.
            if slot <> 16389 or instruction <> 1031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1031, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16390 {
// PORT: SOURCE P20-P25.agc:3398
//		TC	-5
// PORT: Fixed ROM slots 16390.
            if slot <> 16390 or instruction <> 1025 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1025, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3399
//		TC	INTPRET
// PORT: Fixed ROM slots 16391.
            if slot <> 16391 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[944] to agcAotUnit944@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3400
//		VLOAD
// PORT: Fixed ROM slots 16392.
    16392, 65530,
// PORT: SOURCE P20-P25.agc:3401
//			STARSAV3
// PORT: Fixed ROM slots 16393.
    16393, 3978,
// PORT: SOURCE P20-P25.agc:3402
//		VXSC	UNIT
// PORT: Fixed ROM slots 16394.
    16394, 44770,
// PORT: SOURCE P20-P25.agc:3403
//			1/SQR3
// PORT: Fixed ROM slots 16395.
    16395, 27190,
// PORT: SOURCE P20-P25.agc:3404
//		STORE	STARSAV2
// PORT: Fixed ROM slots 16396.
    16396, 2846,
// PORT: SOURCE P20-P25.agc:3405
//		GOTO
// PORT: Fixed ROM slots 16397.
    16397, 65360,
// PORT: SOURCE P20-P25.agc:3406
//			P23.31
// PORT: Fixed ROM slots 16398.
    16398, 51942,
// PORT: SOURCE P20-P25.agc:3407
//VNPLAN23	VN	0688
// PORT: Fixed ROM slots 16399.
    16399, 1712
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4498–4500.
function agcAotUnit168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4498 {
// PORT: SOURCE P20-P25.agc:3408
//		BLOCK	02
// PORT: SOURCE P20-P25.agc:3409
//GOTOV56		EXTEND			# P20 TERMINATES BY GOTOV56 INSTEAD OF
// PORT: Fixed ROM slots 4498.
        if slot <> 4498 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4499 {
// PORT: SOURCE P20-P25.agc:3410
//# Page 632
// PORT: SOURCE P20-P25.agc:3411
//		DCA	VB56CADR	#	GOTOPOOH
// PORT: Fixed ROM slots 4499.
            if slot <> 4499 or instruction <> 14742 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2454, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3412
//		TCF	SUPDXCHZ
// PORT: Fixed ROM slots 4500.
            if slot <> 4500 or instruction <> 6807 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6807, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[168] to agcAotUnit168@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3413
//		EBANK=	WHOCARES
// PORT: SOURCE P20-P25.agc:3414
//VB56CADR	2CADR	TRACKTRM
// PORT: Fixed ROM slots 4501 4502.
    4501, 2902, 4502, 55438
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35732–35732.
function agcAotUnit2053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3415
//
// PORT: SOURCE P20-P25.agc:3416
//		SETLOC	FFTAG2
// PORT: SOURCE P20-P25.agc:3417
//		BANK
// PORT: SOURCE P20-P25.agc:3418
//		COUNT*	$$/P20
// PORT: SOURCE P20-P25.agc:3419
//		BANK	40
// PORT: SOURCE P20-P25.agc:3420
//		SETLOC	ENDPINS1
// PORT: SOURCE P20-P25.agc:3421
//		BANK
// PORT: SOURCE P20-P25.agc:3422
//		COUNT*	$$/EXTVB
// PORT: SOURCE P20-P25.agc:3423
//V67CALL		TC	INTPRET
// PORT: Fixed ROM slots 35732.
    if slot <> 35732 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2053] to agcAotUnit2053@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3424
//		CALL
// PORT: Fixed ROM slots 35733.
    35733, 65320,
// PORT: SOURCE P20-P25.agc:3425
//			V67WW
// PORT: Fixed ROM slots 35734.
    35734, 51074,
// PORT: SOURCE P20-P25.agc:3426
//		EXIT
// PORT: Fixed ROM slots 35735.
    35735, 65532
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35736–35737.
function agcAotUnit2054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 35736 {
// PORT: SOURCE P20-P25.agc:3427
//V06N99DS	CAF	V06N99A
// PORT: Fixed ROM slots 35736.
        if slot <> 35736 or instruction <> 14323 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2035), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:3428
//		TC	BANKCALL
// PORT: Fixed ROM slots 35737.
        if slot <> 35737 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2054] to agcAotUnit2054@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3429
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 35738.
    35738, 17122
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35739–35742.
function agcAotUnit2055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 35740 {
        if slot <= 35739 {
// PORT: SOURCE P20-P25.agc:3430
//		TCF	ENDEXT
// PORT: Fixed ROM slots 35739.
            if slot <> 35739 or instruction <> 7004 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7004, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3431
//		TC	V06N9933
// PORT: Fixed ROM slots 35740.
            if slot <> 35740 or instruction <> 1950 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1950, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 35741 {
// PORT: SOURCE P20-P25.agc:3432
//		TC	V06N99DS
// PORT: Fixed ROM slots 35741.
            if slot <> 35741 or instruction <> 1944 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1944, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:3433
//V06N9933	TC	INTPRET
// PORT: Fixed ROM slots 35742.
            if slot <> 35742 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2055] to agcAotUnit2055@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3434
//		SLOAD	BHIZ		# IF R3 OF V67 = 0 EXIT
// PORT: Fixed ROM slots 35743.
    35743, 39098,
// PORT: SOURCE P20-P25.agc:3435
//			WWOPT
// PORT: Fixed ROM slots 35744.
    35744, 2474,
// PORT: SOURCE P20-P25.agc:3436
//			+3
// PORT: Fixed ROM slots 35745.
    35745, 51016,
// PORT: SOURCE P20-P25.agc:3437
//		GOTO
// PORT: Fixed ROM slots 35746.
    35746, 65360,
// PORT: SOURCE P20-P25.agc:3438
//			V6N99INP
// PORT: Fixed ROM slots 35747.
    35747, 51020,
// PORT: SOURCE P20-P25.agc:3439
//		EXIT
// PORT: Fixed ROM slots 35748.
    35748, 65532
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35749–35749.
function agcAotUnit2056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3440
//		TCF	ENDEXT
// PORT: Fixed ROM slots 35749.
    if slot <> 35749 or instruction <> 7004 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7004, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2056] to agcAotUnit2056@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3441
//V6N99INP	LXA,1	LXA,2
// PORT: Fixed ROM slots 35750.
    35750, 60624,
// PORT: SOURCE P20-P25.agc:3442
//			WWPOS
// PORT: Fixed ROM slots 35751.
    35751, 2464,
// PORT: SOURCE P20-P25.agc:3443
//			WWVEL
// PORT: Fixed ROM slots 35752.
    35752, 2468,
// PORT: SOURCE P20-P25.agc:3444
//		SLOAD	DSU
// PORT: Fixed ROM slots 35753.
    35753, 38330,
// PORT: SOURCE P20-P25.agc:3445
//			WWOPT
// PORT: Fixed ROM slots 35754.
    35754, 2474,
// PORT: SOURCE P20-P25.agc:3446
//			V67DEC2
// PORT: Fixed ROM slots 35755.
    35755, 18414,
// PORT: SOURCE P20-P25.agc:3447
//		BHIZ	BPL
// PORT: Fixed ROM slots 35756.
    35756, 42032,
// PORT: SOURCE P20-P25.agc:3448
//			V67WORB
// PORT: Fixed ROM slots 35757.
    35757, 51048,
// PORT: SOURCE P20-P25.agc:3449
//			V67WMID
// PORT: Fixed ROM slots 35758.
    35758, 51058,
// PORT: SOURCE P20-P25.agc:3450
//		SXA,1	SXA,2
// PORT: Fixed ROM slots 35759.
    35759, 56496,
// PORT: SOURCE P20-P25.agc:3451
//			WRENDPOS
// PORT: Fixed ROM slots 35760.
    35760, 2048,
// PORT: SOURCE P20-P25.agc:3452
//			WRENDVEL
// PORT: Fixed ROM slots 35761.
    35761, 2050,
// PORT: SOURCE P20-P25.agc:3453
//		GOTO
// PORT: Fixed ROM slots 35762.
    35762, 65360,
// PORT: SOURCE P20-P25.agc:3454
//			V67EXITX
// PORT: Fixed ROM slots 35763.
    35763, 51064,
// PORT: SOURCE P20-P25.agc:3455
//V67WORB		SXA,1	SXA,2
// PORT: Fixed ROM slots 35764.
    35764, 56496,
// PORT: SOURCE P20-P25.agc:3456
//			WORBPOS
// PORT: Fixed ROM slots 35765.
    35765, 2056,
// PORT: SOURCE P20-P25.agc:3457
//			WORBVEL
// PORT: Fixed ROM slots 35766.
    35766, 2058,
// PORT: SOURCE P20-P25.agc:3458
//		GOTO
// PORT: Fixed ROM slots 35767.
    35767, 65360,
// PORT: SOURCE P20-P25.agc:3459
//			V67EXITX
// PORT: Fixed ROM slots 35768.
    35768, 51064,
// PORT: SOURCE P20-P25.agc:3460
//V67WMID		SXA,1	SXA,2
// PORT: Fixed ROM slots 35769.
    35769, 56496,
// PORT: SOURCE P20-P25.agc:3461
//# Page 633
// PORT: SOURCE P20-P25.agc:3462
//			WMIDPOS
// PORT: Fixed ROM slots 35770.
    35770, 3072,
// PORT: SOURCE P20-P25.agc:3463
//			WMIDVEL
// PORT: Fixed ROM slots 35771.
    35771, 3074,
// PORT: SOURCE P20-P25.agc:3464
//V67EXITX	CLEAR	CLEAR
// PORT: Fixed ROM slots 35772.
    35772, 35864,
// PORT: SOURCE P20-P25.agc:3465
//			ORBWFLAG
// PORT: Fixed ROM slots 35773.
    35773, 1906,
// PORT: SOURCE P20-P25.agc:3466
//			RENDWFLG
// PORT: Fixed ROM slots 35774.
    35774, 2940,
// PORT: SOURCE P20-P25.agc:3467
//		EXIT
// PORT: Fixed ROM slots 35775.
    35775, 65532
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35776–35776.
function agcAotUnit2057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3468
//		TCF	ENDEXT
// PORT: Fixed ROM slots 35776.
    if slot <> 35776 or instruction <> 7004 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7004, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2057] to agcAotUnit2057@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3469
//V67WW		STQ	BOV
// PORT: Fixed ROM slots 35777.
    35777, 32800,
// PORT: SOURCE P20-P25.agc:3470
//			S2
// PORT: Fixed ROM slots 35778.
    35778, 82,
// PORT: SOURCE P20-P25.agc:3471
//			+1
// PORT: Fixed ROM slots 35779.
    35779, 51080,
// PORT: SOURCE P20-P25.agc:3472
//		CALL
// PORT: Fixed ROM slots 35780.
    35780, 65320,
// PORT: SOURCE P20-P25.agc:3473
//			INTSTALL
// PORT: Fixed ROM slots 35781.
    35781, 24132,
// PORT: SOURCE P20-P25.agc:3474
//		SSP	DLOAD
// PORT: Fixed ROM slots 35782.
    35782, 58802,
// PORT: SOURCE P20-P25.agc:3475
//			S1
// PORT: Fixed ROM slots 35783.
    35783, 82,
// PORT: SOURCE P20-P25.agc:3476
//		DEC	6
// PORT: Fixed ROM slots 35784.
    35784, 12,
// PORT: SOURCE P20-P25.agc:3477
//			ZEROVECS
// PORT: Fixed ROM slots 35785.
    35785, 13754,
// PORT: SOURCE P20-P25.agc:3478
//		STORE	WWPOS
// PORT: Fixed ROM slots 35786.
    35786, 2466,
// PORT: SOURCE P20-P25.agc:3479
//		STORE	WWVEL
// PORT: Fixed ROM slots 35787.
    35787, 2470,
// PORT: SOURCE P20-P25.agc:3480
//		STORE	WWOPT
// PORT: Fixed ROM slots 35788.
    35788, 2474,
// PORT: SOURCE P20-P25.agc:3481
//		AXT,1
// PORT: Fixed ROM slots 35789.
    35789, 65520,
// PORT: SOURCE P20-P25.agc:3482
//		DEC	36
// PORT: Fixed ROM slots 35790.
    35790, 72,
// PORT: SOURCE P20-P25.agc:3483
//NXPOSVEL	VLOAD*	VSQ
// PORT: Fixed ROM slots 35791.
    35791, 40694,
// PORT: SOURCE P20-P25.agc:3484
//			W +36D,1
// PORT: Fixed ROM slots 35792.
    35792, 2634,
// PORT: SOURCE P20-P25.agc:3485
//		DAD
// PORT: Fixed ROM slots 35793.
    35793, 65306,
// PORT: SOURCE P20-P25.agc:3486
//			WWPOS
// PORT: Fixed ROM slots 35794.
    35794, 2466,
// PORT: SOURCE P20-P25.agc:3487
//		STORE	WWPOS
// PORT: Fixed ROM slots 35795.
    35795, 2466,
// PORT: SOURCE P20-P25.agc:3488
//		VLOAD*	VSQ
// PORT: Fixed ROM slots 35796.
    35796, 40694,
// PORT: SOURCE P20-P25.agc:3489
//			W +90D,1
// PORT: Fixed ROM slots 35797.
    35797, 2742,
// PORT: SOURCE P20-P25.agc:3490
//		DAD
// PORT: Fixed ROM slots 35798.
    35798, 65306,
// PORT: SOURCE P20-P25.agc:3491
//			WWVEL
// PORT: Fixed ROM slots 35799.
    35799, 2470,
// PORT: SOURCE P20-P25.agc:3492
//		STORE	WWVEL
// PORT: Fixed ROM slots 35800.
    35800, 2470,
// PORT: SOURCE P20-P25.agc:3493
//		TIX,1	SQRT
// PORT: Fixed ROM slots 35801.
    35801, 63104,
// PORT: SOURCE P20-P25.agc:3494
//			NXPOSVEL
// PORT: Fixed ROM slots 35802.
    35802, 51102,
// PORT: SOURCE P20-P25.agc:3495
//		STODL	WWVEL
// PORT: Fixed ROM slots 35803.
    35803, 14758,
// PORT: SOURCE P20-P25.agc:3496
//			WWPOS
// PORT: Fixed ROM slots 35804.
    35804, 2466,
// PORT: SOURCE P20-P25.agc:3497
//		SQRT
// PORT: Fixed ROM slots 35805.
    35805, 65516,
// PORT: SOURCE P20-P25.agc:3498
//		STORE	WWPOS
// PORT: Fixed ROM slots 35806.
    35806, 2466,
// PORT: SOURCE P20-P25.agc:3499
//		BOV	GOTO
// PORT: Fixed ROM slots 35807.
    35807, 43008,
// PORT: SOURCE P20-P25.agc:3500
//			+2
// PORT: Fixed ROM slots 35808.
    35808, 51140,
// PORT: SOURCE P20-P25.agc:3501
//			V67XXX
// PORT: Fixed ROM slots 35809.
    35809, 51148,
// PORT: SOURCE P20-P25.agc:3502
//		DLOAD
// PORT: Fixed ROM slots 35810.
    35810, 65482,
// PORT: SOURCE P20-P25.agc:3503
//			DPPOSMAX
// PORT: Fixed ROM slots 35811.
    35811, 13766,
// PORT: SOURCE P20-P25.agc:3504
//		STORE	WWPOS
// PORT: Fixed ROM slots 35812.
    35812, 2466,
// PORT: SOURCE P20-P25.agc:3505
//		STORE	WWVEL
// PORT: Fixed ROM slots 35813.
    35813, 2470,
// PORT: SOURCE P20-P25.agc:3506
//V67XXX		DLOAD	DSU
// PORT: Fixed ROM slots 35814.
    35814, 38346,
// PORT: SOURCE P20-P25.agc:3507
//			WWPOS
// PORT: Fixed ROM slots 35815.
    35815, 2466,
// PORT: SOURCE P20-P25.agc:3508
//			FT99999
// PORT: Fixed ROM slots 35816.
    35816, 18410,
// PORT: SOURCE P20-P25.agc:3509
//		BMN	DLOAD
// PORT: Fixed ROM slots 35817.
    35817, 58688,
// PORT: SOURCE P20-P25.agc:3510
//			+3
// PORT: Fixed ROM slots 35818.
    35818, 51162,
// PORT: SOURCE P20-P25.agc:3511
//			FT99999
// PORT: Fixed ROM slots 35819.
    35819, 18410,
// PORT: SOURCE P20-P25.agc:3512
//# Page 634
// PORT: SOURCE P20-P25.agc:3513
//		STORE	WWPOS
// PORT: Fixed ROM slots 35820.
    35820, 2466,
// PORT: SOURCE P20-P25.agc:3514
//		LXA,1	SXA,1
// PORT: Fixed ROM slots 35821.
    35821, 55504,
// PORT: SOURCE P20-P25.agc:3515
//			S2
// PORT: Fixed ROM slots 35822.
    35822, 82,
// PORT: SOURCE P20-P25.agc:3516
//			QPRET
// PORT: Fixed ROM slots 35823.
    35823, 84,
// PORT: SOURCE P20-P25.agc:3517
//		EXIT
// PORT: Fixed ROM slots 35824.
    35824, 65532
)).

// PORT: Physical bank 40. Shared continuation entries, slots 35825–35825.
function agcAotUnit2058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:3518
//		TC	POSTJUMP
// PORT: Fixed ROM slots 35825.
    if slot <> 35825 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2058] to agcAotUnit2058@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:3519
//		CADR	INTWAKE
// PORT: Fixed ROM slots 35826.
    35826, 24158,
// PORT: SOURCE P20-P25.agc:3520
//WWPOS		=	RANGE
// PORT: SOURCE P20-P25.agc:3521
//WWVEL		=	RRATE
// PORT: SOURCE P20-P25.agc:3522
//WWOPT		=	RTHETA
// PORT: SOURCE P20-P25.agc:3523
//V06N99A		VN	0699
// PORT: Fixed ROM slots 35827.
    35827, 1734,
// PORT: SOURCE P20-P25.agc:3524
//FT99999		2DEC	30479 B-19
// PORT: Fixed ROM slots 35828 35829.
    35828, 1904, 35829, 15360,
// PORT: SOURCE P20-P25.agc:3525
//
// PORT: SOURCE P20-P25.agc:3526
//V67DEC2		2DEC	2 B-14
// PORT: Fixed ROM slots 35830 35831.
    35830, 4, 35831, 0
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P20-P25.agc:3527
//
// PORT: SOURCE P20-P25.agc:3528
//		SBANK=	LOWSUPER
// PORT: SOURCE P20-P25.agc:3529
//
