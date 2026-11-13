// KALCMANU_STEERING.agc
// bank 22, slots 21014-21017
function agcAotUnit1197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21015 {
        if slot <= 21014 {
// KALCMANU_STEERING.agc:1
//# Copyright:	Public domain.
// KALCMANU_STEERING.agc:2
//# Filename:	KALCMANU_STEERING.agc
// KALCMANU_STEERING.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// KALCMANU_STEERING.agc:4
//#		It is part of the source code for the Command Module's (CM)
// KALCMANU_STEERING.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// KALCMANU_STEERING.agc:6
//# Assembler:	yaYUL
// KALCMANU_STEERING.agc:7
//# Reference:	pp. 414-419
// KALCMANU_STEERING.agc:8
//# Contact:	Hommes Kerman <ohommes@cmu.edu>.
// KALCMANU_STEERING.agc:9
//# Website:	www.ibiblio.org/apollo.
// KALCMANU_STEERING.agc:10
//# Mod history:	05/07/09 OH	Transcription Batch 1 Assignment
// KALCMANU_STEERING.agc:11
//#
// KALCMANU_STEERING.agc:12
//# The contents of the "Comanche055" files, in general, are transcribed
// KALCMANU_STEERING.agc:13
//# from scanned documents.
// KALCMANU_STEERING.agc:14
//#
// KALCMANU_STEERING.agc:15
//#	Assemble revision 055 of AGC program Comanche by NASA
// KALCMANU_STEERING.agc:16
//#	2021113-051.  April 1, 1969.
// KALCMANU_STEERING.agc:17
//#
// KALCMANU_STEERING.agc:18
//#	This AGC program shall also be referred to as Colossus 2A
// KALCMANU_STEERING.agc:19
//#
// KALCMANU_STEERING.agc:20
//#	Prepared by
// KALCMANU_STEERING.agc:21
//#			Massachusetts Institute of Technology
// KALCMANU_STEERING.agc:22
//#			75 Cambridge Parkway
// KALCMANU_STEERING.agc:23
//#			Cambridge, Massachusetts
// KALCMANU_STEERING.agc:24
//#
// KALCMANU_STEERING.agc:25
//#	under NASA contract NAS 9-4065.
// KALCMANU_STEERING.agc:26
//#
// KALCMANU_STEERING.agc:27
//# Refer directly to the online document mentioned above for further information.
// KALCMANU_STEERING.agc:28
//# Please report any errors to info@sandroid.org.
// KALCMANU_STEERING.agc:29
//
// KALCMANU_STEERING.agc:30
//# Page 414
// KALCMANU_STEERING.agc:31
//# GENERATION OF STEERING COMMANDS FOR DIGITAL AUTOPILOT FREE FALL MANEUVERS
// KALCMANU_STEERING.agc:32
//#
// KALCMANU_STEERING.agc:33
//# NEW COMMANDS WILL BE GENERATED EVERY ONE SECOND DURING THE MANEUVER
// KALCMANU_STEERING.agc:34
//
// KALCMANU_STEERING.agc:35
//		BANK	15
// KALCMANU_STEERING.agc:36
//
// KALCMANU_STEERING.agc:37
//		SETLOC	KALCMON1
// KALCMANU_STEERING.agc:38
//		BANK
// KALCMANU_STEERING.agc:39
//
// KALCMANU_STEERING.agc:40
//		EBANK=	BCDU
// KALCMANU_STEERING.agc:41
//
// KALCMANU_STEERING.agc:42
//		COUNT	22/KALC
// KALCMANU_STEERING.agc:43
//
// KALCMANU_STEERING.agc:44
//NEWDELHI	CS	HOLDFLAG	# SEE IF MANEUVER HAS BEEN INTERRUPTED
// slot 21014
            if slot <> 21014 or instruction <> 17114 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 730).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALCMANU_STEERING.agc:45
//		EXTEND			# BY VAL
// slot 21015
            if slot <> 21015 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21016 {
// KALCMANU_STEERING.agc:46
//		BZMF	NOGO	-2	# IF SO, TERMINATE KALCMANU
// slot 21016
            if slot <> 21016 or instruction <> 26070 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26070, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// KALCMANU_STEERING.agc:47
//NEWANGL		TC	INTPRET
// slot 21017
            if slot <> 21017 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1197] to agcAotUnit1197@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:48
//		AXC,1	AXC,2
// slot 21018
    21018, 62688,
// KALCMANU_STEERING.agc:49
//			MIS		# COMPUTE THE NEW MATRIX FROM S/C TO
// slot 21019
    21019, 3488,
// KALCMANU_STEERING.agc:50
//			DEL		# STABLE MEMBER AXES
// slot 21020
    21020, 3626,
// KALCMANU_STEERING.agc:51
//		CALL
// slot 21021
    21021, 65320,
// KALCMANU_STEERING.agc:52
//			MXM3
// slot 21022
    21022, 37256,
// KALCMANU_STEERING.agc:53
//		VLOAD	STADR
// slot 21023
    21023, 38650,
// KALCMANU_STEERING.agc:54
//		STOVL	MIS +12D	# CALCULATE NEW DESIRED CDU ANGLES
// slot 21024
    21024, 41540,
// KALCMANU_STEERING.agc:55
//		STADR
// slot 21025
    21025, 65324,
// KALCMANU_STEERING.agc:56
//		STOVL	MIS +6D
// slot 21026
    21026, 41552,
// KALCMANU_STEERING.agc:57
//		STADR
// slot 21027
    21027, 65324,
// KALCMANU_STEERING.agc:58
//		STORE	MIS
// slot 21028
    21028, 62044,
// KALCMANU_STEERING.agc:59
//		AXC,1	CALL
// slot 21029
    21029, 38112,
// KALCMANU_STEERING.agc:60
//			MIS
// slot 21030
    21030, 3488,
// KALCMANU_STEERING.agc:61
//			DCMTOCDU	# PICK UP THE NEW CDU ANGLES FROM MATRIX
// slot 21031
    21031, 37722,
// KALCMANU_STEERING.agc:62
//		RTB
// slot 21032
    21032, 65336,
// KALCMANU_STEERING.agc:63
//			V1STO2S
// slot 21033
    21033, 38612,
// KALCMANU_STEERING.agc:64
//		STORE	NCDU		# NEW CDU ANGLES
// slot 21034
    21034, 3438,
// KALCMANU_STEERING.agc:65
//		BONCLR	EXIT
// slot 21035
    21035, 65048,
// KALCMANU_STEERING.agc:66
//			CALCMAN2
// slot 21036
    21036, 1306,
// KALCMANU_STEERING.agc:67
//			MANUSTAT	# TO START MANEUVER
// slot 21037
    21037, 32874
)).

// bank 22, slots 21038-21042
function agcAotUnit1198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21039 {
        if slot <= 21038 {
// KALCMANU_STEERING.agc:68
//		CAF	TWO		# 	   +0 OTHERWISE
// slot 21038
            if slot <> 21038 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALCMANU_STEERING.agc:69
//INCRDCDU	TS	KSPNDX
// slot 21039
            if slot <> 21039 or instruction <> 23476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21040 {
// KALCMANU_STEERING.agc:70
//		DOUBLE
// slot 21040
            if slot <> 21040 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21041 {
// KALCMANU_STEERING.agc:71
//		TS	KDPNDX
// slot 21041
                if slot <> 21041 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:72
//		INDEX	KSPNDX
// slot 21042
                if slot <> 21042 or instruction <> 21428 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21428, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21428, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1198] to agcAotUnit1198@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:73
//		CA	NCDU		# NEW DESIRED CDU ANGLES
// slot 21043
    21043, 26476
)).

// bank 22, slots 21044-21045
function agcAotUnit1199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21044 {
// KALCMANU_STEERING.agc:74
//		EXTEND
// slot 21044
        if slot <> 21044 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// KALCMANU_STEERING.agc:75
//		INDEX	KSPNDX
// slot 21045
        if slot <> 21045 or instruction <> 21428 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21428, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21428, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1199] to agcAotUnit1199@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:76
//		MSU	BCDU		# INITIAL S/C ANGLE OR PREVIOUS DESIRED
// slot 21046
    21046, 18274
)).

// bank 22, slots 21047-21049
function agcAotUnit1200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21047 {
// KALCMANU_STEERING.agc:77
//		EXTEND			# CDU ANGLES
// slot 21047
        if slot <> 21047 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21048 {
// KALCMANU_STEERING.agc:78
//		MP	QUADROT
// slot 21048
            if slot <> 21048 or instruction <> 30210 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 1538, readEffective:call(words, 1538)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALCMANU_STEERING.agc:79
//		INDEX	KDPNDX
// slot 21049
            if slot <> 21049 or instruction <> 21429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21429, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1200] to agcAotUnit1200@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:80
//		DXCH	DELCDUX		# ANGEL INCREMENTS TO BE ADDED TO
// slot 21050
    21050, 44796
)).

// bank 22, slots 21051-21051
function agcAotUnit1201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KALCMANU_STEERING.agc:81
//# Page 415
// KALCMANU_STEERING.agc:82
//		INDEX	KSPNDX		# DCDU EVERY TENTH SEC
// slot 21051
    if slot <> 21051 or instruction <> 21428 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21428, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21428, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1201] to agcAotUnit1201@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:83
//		CA	NCDU		# BY LEM DAP
// slot 21052
    21052, 26476
)).

// bank 22, slots 21053-21053
function agcAotUnit1202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KALCMANU_STEERING.agc:84
//		INDEX	KSPNDX
// slot 21053
    if slot <> 21053 or instruction <> 21428 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21428, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21428, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1202] to agcAotUnit1202@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:85
//		XCH	BCDU
// slot 21054
    21054, 48994
)).

// bank 22, slots 21055-21055
function agcAotUnit1203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KALCMANU_STEERING.agc:86
//		INDEX	KDPNDX
// slot 21055
    if slot <> 21055 or instruction <> 21429 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21429, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21429, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1203] to agcAotUnit1203@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:87
//		TS	CDUXD
// slot 21056
    21056, 46924
)).

// bank 22, slots 21057-21061
function agcAotUnit1204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21058 {
        if slot <= 21057 {
// KALCMANU_STEERING.agc:88
//		CCS	KSPNDX
// slot 21057
            if slot <> 21057 or instruction <> 5044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 948).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// KALCMANU_STEERING.agc:89
//		TCF	INCRDCDU	# LOOP FOR THREE AXES
// slot 21058
            if slot <> 21058 or instruction <> 5679 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5679, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21059 {
// KALCMANU_STEERING.agc:90
//
// KALCMANU_STEERING.agc:91
//		RELINT
// slot 21059
            if slot <> 21059 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21060 {
// KALCMANU_STEERING.agc:92
//# COMPARE PRESENT TIME WITH TIME TO TERMINATE MANEUVER
// KALCMANU_STEERING.agc:93
//
// KALCMANU_STEERING.agc:94
//TMANUCHK	TC	TIMECHK
// slot 21060
                if slot <> 21060 or instruction <> 1613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:95
//		TC	POSTJUMP
// slot 21061
                if slot <> 21061 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1204] to agcAotUnit1204@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:96
//		CADR	CONTMANU
// slot 21062
    21062, 32946
)).

// bank 22, slots 21063-21064
function agcAotUnit1205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21063 {
// KALCMANU_STEERING.agc:97
//
// KALCMANU_STEERING.agc:98
//		CAF	ONE
// slot 21063
        if slot <> 21063 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// KALCMANU_STEERING.agc:99
//MANUSTAL	TC	WAITLIST
// slot 21064
        if slot <> 21064 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1205] to agcAotUnit1205@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:100
//		EBANK=	BCDU
// KALCMANU_STEERING.agc:101
//		2CADR	MANUSTOP
// slot 21065 21066
    21065, 2048, 21066, 34924
)).

// bank 22, slots 21067-21089
function agcAotUnit1206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21077 {
        if slot <= 21071 {
            if slot <= 21068 {
                if slot <= 21067 {
// KALCMANU_STEERING.agc:102
//
// KALCMANU_STEERING.agc:103
//		RELINT
// slot 21067
                    if slot <> 21067 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:104
//		TCF	ENDOFJOB
// slot 21068
                    if slot <> 21068 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21069 {
// KALCMANU_STEERING.agc:105
//
// KALCMANU_STEERING.agc:106
//
// KALCMANU_STEERING.agc:107
//TIMECHK		EXTEND
// slot 21069
                    if slot <> 21069 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21070 {
// KALCMANU_STEERING.agc:108
//		DCS	TIME2
// slot 21070
                        if slot <> 21070 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:109
//		DXCH	TTEMP
// slot 21071
                        if slot <> 21071 or instruction <> 22459 { return choose false if checkOnly else -1. }
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
            if slot <= 21074 {
                if slot <= 21072 {
// KALCMANU_STEERING.agc:110
//		EXTEND
// slot 21072
                    if slot <> 21072 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21073 {
// KALCMANU_STEERING.agc:111
//		DCA	TM
// slot 21073
                        if slot <> 21073 or instruction <> 13263 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 975, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:112
//		DAS	TTEMP
// slot 21074
                        if slot <> 21074 or instruction <> 9147 { return choose false if checkOnly else -1. }
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
                if slot <= 21075 {
// KALCMANU_STEERING.agc:113
//		CCS	TTEMP
// slot 21075
                    if slot <> 21075 or instruction <> 5050 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 954).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21076 {
// KALCMANU_STEERING.agc:114
//		TC	Q
// slot 21076
                        if slot <> 21076 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:115
//		TCF	+2
// slot 21077
                        if slot <> 21077 or instruction <> 5719 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5719, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 21083 {
            if slot <= 21080 {
                if slot <= 21078 {
// KALCMANU_STEERING.agc:116
//		TCF	2NDRETRN
// slot 21078
                    if slot <> 21078 or instruction <> 5727 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5727, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21079 {
// KALCMANU_STEERING.agc:117
//		CCS	TTEMP +1
// slot 21079
                        if slot <> 21079 or instruction <> 5051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 955).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:118
//		TC	Q
// slot 21080
                        if slot <> 21080 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21081 {
// KALCMANU_STEERING.agc:119
//		TCF	MANUOFF
// slot 21081
                    if slot <> 21081 or instruction <> 5723 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5723, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21082 {
// KALCMANU_STEERING.agc:120
//		COM
// slot 21082
                        if slot <> 21082 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:121
//MANUOFF		AD	1SEC
// slot 21083
                        if slot <> 21083 or instruction <> 27169 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21086 {
                if slot <= 21084 {
// KALCMANU_STEERING.agc:122
//		EXTEND
// slot 21084
                    if slot <> 21084 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21085 {
// KALCMANU_STEERING.agc:123
//		BZMF	2NDRETRN
// slot 21085
                        if slot <> 21085 or instruction <> 26207 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26207, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:124
//		INCR	Q
// slot 21086
                        if slot <> 21086 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21087 {
// KALCMANU_STEERING.agc:125
//2NDRETRN	INCR	Q
// slot 21087
                    if slot <> 21087 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21088 {
// KALCMANU_STEERING.agc:126
//		INCR	Q
// slot 21088
                        if slot <> 21088 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:127
//		TC	Q
// slot 21089
                        if slot <> 21089 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1206] to agcAotUnit1206@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:128
//
// KALCMANU_STEERING.agc:129
//		SETLOC	MANUSTUF
// KALCMANU_STEERING.agc:130
//		BANK
// KALCMANU_STEERING.agc:131
//# Page 416
// KALCMANU_STEERING.agc:132
//MANUSTAT	EXIT			# INITIALIZATION ROUTINE
// slot 18485
    18485, 65532
)).

// bank 20, slots 18486-18519
function agcAotUnit1081 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18502 {
        if slot <= 18493 {
            if slot <= 18489 {
                if slot <= 18487 {
                    if slot <= 18486 {
// KALCMANU_STEERING.agc:133
//		EXTEND			# FOR AUTOMATIC MANEUVERS
// slot 18486
                        if slot <> 18486 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:134
//		DCA	TIME2
// slot 18487
                        if slot <> 18487 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18488 {
// KALCMANU_STEERING.agc:135
//		DAS	TM		# TM+T0    MANEUVER COMPLETION TIME
// slot 18488
                        if slot <> 18488 or instruction <> 9167 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 975) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:136
//		CS	1SEC
// slot 18489
                        if slot <> 18489 or instruction <> 18977 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18491 {
                    if slot <= 18490 {
// KALCMANU_STEERING.agc:137
//		TS	L
// slot 18490
                        if slot <> 18490 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:138
//		CS	ZERO
// slot 18491
                        if slot <> 18491 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18492 {
// KALCMANU_STEERING.agc:139
//		DAS	TM		# (TM+T0)-1
// slot 18492
                        if slot <> 18492 or instruction <> 9167 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 975) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:140
//		INHINT
// slot 18493
                        if slot <> 18493 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18497 {
                if slot <= 18495 {
                    if slot <= 18494 {
// KALCMANU_STEERING.agc:141
//		CS	ONE		# ENABLE AUTOPILOT TO PERFORM
// slot 18494
                        if slot <> 18494 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:142
//		TS	HOLDFLAG	# AUTOMATIC MANEUVERS
// slot 18495
                        if slot <> 18495 or instruction <> 23258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18496 {
// KALCMANU_STEERING.agc:143
//		CS	RATEINDX	# SEE IF MANEUVERING AT HIGH RATE
// slot 18496
                        if slot <> 18496 or instruction <> 16984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 600).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:144
//		AD	SIX
// slot 18497
                        if slot <> 18497 or instruction <> 27785 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18499 {
                    if slot <= 18498 {
// KALCMANU_STEERING.agc:145
//		EXTEND
// slot 18498
                        if slot <> 18498 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:146
//		BZMF	HIGHGAIN
// slot 18499
                        if slot <> 18499 or instruction <> 25669 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25669, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18500 {
// KALCMANU_STEERING.agc:147
//		TCF	+4
// slot 18500
                        if slot <> 18500 or instruction <> 5192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18501 {
// KALCMANU_STEERING.agc:148
//HIGHGAIN	CS	RCSFLAGS	# IF SO, SET HIGH RATE FLAG (BIT 15 OF
// slot 18501
                            if slot <> 18501 or instruction <> 17217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 833).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KALCMANU_STEERING.agc:149
//		MASK	BIT15		# RCSFLAGS)
// slot 18502
                            if slot <> 18502 or instruction <> 31233 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 18510 {
            if slot <= 18506 {
                if slot <= 18504 {
                    if slot <= 18503 {
// KALCMANU_STEERING.agc:150
//		ADS	RCSFLAGS
// slot 18503
                        if slot <> 18503 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:151
//		DXCH	BRATE		# X-AXIS MANEUVER RATE
// slot 18504
                        if slot <> 18504 or instruction <> 22473 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 969, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18505 {
// KALCMANU_STEERING.agc:152
//		DXCH	WBODY
// slot 18505
                        if slot <> 18505 or instruction <> 22358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 854, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:153
//		DXCH	BRATE +2	# Y-AXIS MANEUVER RATE
// slot 18506
                        if slot <> 18506 or instruction <> 22475 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18508 {
                    if slot <= 18507 {
// KALCMANU_STEERING.agc:154
//		DXCH	WBODY1
// slot 18507
                        if slot <> 18507 or instruction <> 22360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 856, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:155
//		DXCH	BRATE +4	# Z-AXIS MANEUVER RATE
// slot 18508
                        if slot <> 18508 or instruction <> 22477 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 973, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18509 {
// KALCMANU_STEERING.agc:156
//		DXCH	WBODY2
// slot 18509
                        if slot <> 18509 or instruction <> 22362 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 858, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:157
//		CA	BIASTEMP +1	# INSERT ATTITUDE ERROR BIASES
// slot 18510
                        if slot <> 18510 or instruction <> 13245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 957).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18514 {
                if slot <= 18512 {
                    if slot <= 18511 {
// KALCMANU_STEERING.agc:158
//		TS	BIAS		# INTO AUTOPILOT
// slot 18511
                        if slot <> 18511 or instruction <> 23412 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23412, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:159
//		CA	BIASTEMP +3
// slot 18512
                        if slot <> 18512 or instruction <> 13247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 959).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18513 {
// KALCMANU_STEERING.agc:160
//		TS	BIAS1
// slot 18513
                        if slot <> 18513 or instruction <> 23413 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23413, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:161
//		CA	BIASTEMP +5
// slot 18514
                        if slot <> 18514 or instruction <> 13249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 961).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18516 {
                    if slot <= 18515 {
// KALCMANU_STEERING.agc:162
//		TS	BIAS2
// slot 18515
                        if slot <> 18515 or instruction <> 23414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:163
//		CA	TIME1
// slot 18516
                        if slot <> 18516 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18517 {
// KALCMANU_STEERING.agc:164
//		AD	1SEC
// slot 18517
                        if slot <> 18517 or instruction <> 27169 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18518 {
// KALCMANU_STEERING.agc:165
//		XCH	NEXTIME
// slot 18518
                            if slot <> 18518 or instruction <> 24505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 953, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KALCMANU_STEERING.agc:166
//		TC	POSTJUMP
// slot 18519
                            if slot <> 18519 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1081] to agcAotUnit1081@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:167
//		CADR	INCRDCDU -1
// slot 18520
    18520, 37980
)).

// bank 20, slots 18521-18529
function agcAotUnit1082 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18524 {
        if slot <= 18522 {
            if slot <= 18521 {
// KALCMANU_STEERING.agc:168
//
// KALCMANU_STEERING.agc:169
//CONTMANU	INHINT			# CONTINUE WITH UPDATE PROCESS
// slot 18521
                if slot <> 18521 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:170
//		CS	TIME1
// slot 18522
                if slot <> 18522 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18523 {
// KALCMANU_STEERING.agc:171
//		AD	NEXTIME
// slot 18523
                if slot <> 18523 or instruction <> 25529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:172
//		CCS	A
// slot 18524
                if slot <> 18524 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 18526 {
            if slot <= 18525 {
// KALCMANU_STEERING.agc:173
//		AD	ONE
// slot 18525
                if slot <> 18525 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// KALCMANU_STEERING.agc:174
//		TCF	MANUCALL
// slot 18526
                if slot <> 18526 or instruction <> 5217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5217, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18527 {
// KALCMANU_STEERING.agc:175
//		AD	NEGMAX
// slot 18527
                if slot <> 18527 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
                if slot <= 18528 {
// KALCMANU_STEERING.agc:176
//		COM
// slot 18528
                    if slot <> 18528 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:177
//MANUCALL	TC	WAITLIST
// slot 18529
                    if slot <> 18529 or instruction <> 2725 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1082] to agcAotUnit1082@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:178
//		EBANK=	BCDU
// KALCMANU_STEERING.agc:179
//		2CADR	UPDTCALL
// slot 18530 18531
    18530, 2256, 18531, 32876
)).

// bank 20, slots 18532-18537
function agcAotUnit1083 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18534 {
        if slot <= 18532 {
// KALCMANU_STEERING.agc:180
//
// KALCMANU_STEERING.agc:181
//		RELINT
// slot 18532
            if slot <> 18532 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18533 {
// KALCMANU_STEERING.agc:182
//# Page 417
// KALCMANU_STEERING.agc:183
//		CAF	1SEC		# INCREMENT TIME FOR NEXT UPDATE
// slot 18533
                if slot <> 18533 or instruction <> 14881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2593), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:184
//		ADS	NEXTIME
// slot 18534
                if slot <> 18534 or instruction <> 12217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18535 {
// KALCMANU_STEERING.agc:185
//		TCF	ENDOFJOB
// slot 18535
            if slot <> 18535 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18536 {
// KALCMANU_STEERING.agc:186
//
// KALCMANU_STEERING.agc:187
//
// KALCMANU_STEERING.agc:188
//UPDTCALL	CAF	PRIO26		# CALL FOR UPDATE
// slot 18536
                if slot <> 18536 or instruction <> 16307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4019), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:189
//		TC	FINDVAC		# OF STEERING COMMANDS
// slot 18537
                if slot <> 18537 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1083] to agcAotUnit1083@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:190
//		EBANK=	BCDU
// KALCMANU_STEERING.agc:191
//		2CADR	NEWDELHI
// slot 18538 18539
    18538, 3116, 18539, 36972
)).

// bank 20, slots 18540-18540
function agcAotUnit1084 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KALCMANU_STEERING.agc:192
//
// KALCMANU_STEERING.agc:193
//		TC	TASKOVER
// slot 18540
    if slot <> 18540 or instruction <> 2772 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2772, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1084] to agcAotUnit1084@.

// bank 21, slots 19456-19457
function agcAotUnit1118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19456 {
// KALCMANU_STEERING.agc:194
//
// KALCMANU_STEERING.agc:195
//# Page 418
// KALCMANU_STEERING.agc:196
//# ROUTINE FOR TERMINATING AUTOMATIC MANEUVERS
// KALCMANU_STEERING.agc:197
//
// KALCMANU_STEERING.agc:198
//		SETLOC	KALCMON3
// KALCMANU_STEERING.agc:199
//		BANK
// KALCMANU_STEERING.agc:200
//
// KALCMANU_STEERING.agc:201
//MANUSTOP	TC	STOPYZ
// slot 19456
        if slot <> 19456 or instruction <> 2399 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2399, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// KALCMANU_STEERING.agc:202
//		TC	IBNKCALL
// slot 19457
        if slot <> 19457 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1118] to agcAotUnit1118@.

agcAotInstallSourceRope(list(
// KALCMANU_STEERING.agc:203
//		CADR	LOADYZ
// slot 19458
    19458, 38088
)).

// bank 21, slots 19459-19467
function agcAotUnit1119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19462 {
        if slot <= 19460 {
            if slot <= 19459 {
// KALCMANU_STEERING.agc:204
//
// KALCMANU_STEERING.agc:205
//ENDROLL		CA	CPHI
// slot 19459
                if slot <> 19459 or instruction <> 12909 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 621).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:206
//		TS	CDUXD		# SET CDUXD TO THE COMMANDED OUTER GIMBAL
// slot 19460
                if slot <> 19460 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19461 {
// KALCMANU_STEERING.agc:207
//		TC	STOPRATE
// slot 19461
                if slot <> 19461 or instruction <> 2390 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2390, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:208
//ENDMANU		CA	ATTPRIO		# RESTORE USERS PRIORITY
// slot 19462
                if slot <> 19462 or instruction <> 13015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 727).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19464 {
            if slot <= 19463 {
// KALCMANU_STEERING.agc:209
//		TS	NEWPRIO
// slot 19463
                if slot <> 19463 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:210
//
// KALCMANU_STEERING.agc:211
//		CA	ZERO		# ZERO ATTCADR
// slot 19464
                if slot <> 19464 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 19465 {
// KALCMANU_STEERING.agc:212
//		DXCH	ATTCADR
// slot 19465
                if slot <> 19465 or instruction <> 22230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 726, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19466 {
// KALCMANU_STEERING.agc:213
//
// KALCMANU_STEERING.agc:214
//		TC	SPVAC		# RETURN TO USER OF GOMANUR
// slot 19466
                    if slot <> 19466 or instruction <> 2672 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2672, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:215
//
// KALCMANU_STEERING.agc:216
//		TC	TASKOVER
// slot 19467
                    if slot <> 19467 or instruction <> 2772 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1119] to agcAotUnit1119@.

// bank 02, slots 4438-4458
function agcAotUnit164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4447 {
        if slot <= 4442 {
            if slot <= 4439 {
                if slot <= 4438 {
// KALCMANU_STEERING.agc:217
//
// KALCMANU_STEERING.agc:218
//		SETLOC	STOPRAT
// KALCMANU_STEERING.agc:219
//		BANK
// KALCMANU_STEERING.agc:220
//STOPRATE	CAF	ZERO
// slot 4438
                    if slot <> 4438 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:221
//		TS	DELCDUX
// slot 4439
                    if slot <> 4439 or instruction <> 23421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4440 {
// KALCMANU_STEERING.agc:222
//		TS	DELCDUX	+1	# ZERO ROLL INCREMENTAL ANGLES
// slot 4440
                    if slot <> 4440 or instruction <> 23422 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4441 {
// KALCMANU_STEERING.agc:223
//		TS	WBODY		# RATE
// slot 4441
                        if slot <> 4441 or instruction <> 23381 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23381, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:224
//		TS	WBODY +1
// slot 4442
                        if slot <> 4442 or instruction <> 23382 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23382, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4444 {
                if slot <= 4443 {
// KALCMANU_STEERING.agc:225
//		TS	BIAS		# BIAS
// slot 4443
                    if slot <> 4443 or instruction <> 23412 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23412, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:226
//
// KALCMANU_STEERING.agc:227
//		CS	BIT15		# MAKE SURE HIGH RATE FLAG (BIT 15 OF
// slot 4444
                    if slot <> 4444 or instruction <> 18945 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4445 {
// KALCMANU_STEERING.agc:228
//		MASK	RCSFLAGS	# RCSFLAGS) IS RESET.
// slot 4445
                    if slot <> 4445 or instruction <> 29505 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 833).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4446 {
// KALCMANU_STEERING.agc:229
//		TS	RCSFLAGS
// slot 4446
                        if slot <> 4446 or instruction <> 23361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23361, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:230
//
// KALCMANU_STEERING.agc:231
//STOPYZ		CAF	ZERO
// slot 4447
                        if slot <> 4447 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 4452 {
            if slot <= 4449 {
                if slot <= 4448 {
// KALCMANU_STEERING.agc:232
//		TS	DELCDUY		# ZERO PITCH, YAW
// slot 4448
                    if slot <> 4448 or instruction <> 23423 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23423, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KALCMANU_STEERING.agc:233
//		TS	DELCDUY	+1	# INCREMENTAL ANGLES
// slot 4449
                    if slot <> 4449 or instruction <> 23424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23424, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4450 {
// KALCMANU_STEERING.agc:234
//		TS	DELCDUZ
// slot 4450
                    if slot <> 4450 or instruction <> 23425 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23425, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4451 {
// KALCMANU_STEERING.agc:235
//		TS	DELCDUZ	+1
// slot 4451
                        if slot <> 4451 or instruction <> 23426 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23426, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:236
//		TS	WBODY1		# RATES
// slot 4452
                        if slot <> 4452 or instruction <> 23383 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23383, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4455 {
                if slot <= 4453 {
// KALCMANU_STEERING.agc:237
//		TS	WBODY1 +1
// slot 4453
                    if slot <> 4453 or instruction <> 23384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4454 {
// KALCMANU_STEERING.agc:238
//		TS	WBODY2
// slot 4454
                        if slot <> 4454 or instruction <> 23385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23385, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:239
//		TS	WBODY2 +1
// slot 4455
                        if slot <> 4455 or instruction <> 23386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23386, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4456 {
// KALCMANU_STEERING.agc:240
//		TS	BIAS1		# BIASES
// slot 4456
                    if slot <> 4456 or instruction <> 23413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23413, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4457 {
// KALCMANU_STEERING.agc:241
//		TS	BIAS2
// slot 4457
                        if slot <> 4457 or instruction <> 23414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KALCMANU_STEERING.agc:242
//		TC	Q
// slot 4458
                        if slot <> 4458 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[164] to agcAotUnit164@.

// bank 20, slots 18541-18547
function agcAotUnit1085 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18543 {
        if slot <= 18541 {
// KALCMANU_STEERING.agc:243
//
// KALCMANU_STEERING.agc:244
//		SETLOC MANUSTUF
// KALCMANU_STEERING.agc:245
//		BANK
// KALCMANU_STEERING.agc:246
//
// KALCMANU_STEERING.agc:247
//# Page 419
// KALCMANU_STEERING.agc:248
//ZEROERROR	CA	CDUX		# PICK UP CDU ANGLES AND STORE IN
// slot 18541
            if slot <> 18541 or instruction <> 12314 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 26).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18542 {
// KALCMANU_STEERING.agc:249
//		TS	CDUXD		# CDU DESIRED
// slot 18542
                if slot <> 18542 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:250
//		CA	CDUY
// slot 18543
                if slot <> 18543 or instruction <> 12315 { return choose false if checkOnly else -1. }
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
        if slot <= 18545 {
            if slot <= 18544 {
// KALCMANU_STEERING.agc:251
//		TS	CDUYD
// slot 18544
                if slot <> 18544 or instruction <> 23464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:252
//		CA	CDUZ
// slot 18545
                if slot <> 18545 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18546 {
// KALCMANU_STEERING.agc:253
//		TS	CDUZD
// slot 18546
                if slot <> 18546 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:254
//		TC	Q
// slot 18547
                if slot <> 18547 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1085] to agcAotUnit1085@.

// bank 22, slots 21090-21096
function agcAotUnit1207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21092 {
        if slot <= 21090 {
// KALCMANU_STEERING.agc:255
//
// KALCMANU_STEERING.agc:256
//		SETLOC	KALCMON1
// KALCMANU_STEERING.agc:257
//		BANK
// KALCMANU_STEERING.agc:258
//
// KALCMANU_STEERING.agc:259
//LOADCDUD	CA	CPHI		# STORE TERMINAL ANGLES INTO
// slot 21090
            if slot <> 21090 or instruction <> 12909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 621).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21091 {
// KALCMANU_STEERING.agc:260
//		TS	CDUXD		# COMMAND ANGLES
// slot 21091
                if slot <> 21091 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:261
//LOADYZ		CA	CTHETA
// slot 21092
                if slot <> 21092 or instruction <> 12910 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 622).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21094 {
            if slot <= 21093 {
// KALCMANU_STEERING.agc:262
//		TS	CDUYD
// slot 21093
                if slot <> 21093 or instruction <> 23464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:263
//		CA	CPSI
// slot 21094
                if slot <> 21094 or instruction <> 12911 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 623).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21095 {
// KALCMANU_STEERING.agc:264
//		TS	CDUZD
// slot 21095
                if slot <> 21095 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// KALCMANU_STEERING.agc:265
//		TC	Q
// slot 21096
                if slot <> 21096 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1207] to agcAotUnit1207@.

