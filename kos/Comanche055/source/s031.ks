// PORT: Original source unit KALCMANU_STEERING.agc.
// PORT: Physical bank 22. Shared continuation entries, slots 21014–21017.
function agcAotUnit1197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21015 {
        if slot <= 21014 {
// PORT: SOURCE KALCMANU_STEERING.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE KALCMANU_STEERING.agc:2
//# Filename:	KALCMANU_STEERING.agc
// PORT: SOURCE KALCMANU_STEERING.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// PORT: SOURCE KALCMANU_STEERING.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE KALCMANU_STEERING.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE KALCMANU_STEERING.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE KALCMANU_STEERING.agc:7
//# Reference:	pp. 414-419
// PORT: SOURCE KALCMANU_STEERING.agc:8
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// PORT: SOURCE KALCMANU_STEERING.agc:9
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE KALCMANU_STEERING.agc:10
//# Mod history:	05/07/09 OH	Transcription Batch 1 Assignment
// PORT: SOURCE KALCMANU_STEERING.agc:11
//#
// PORT: SOURCE KALCMANU_STEERING.agc:12
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE KALCMANU_STEERING.agc:13
//# from scanned documents.
// PORT: SOURCE KALCMANU_STEERING.agc:14
//#
// PORT: SOURCE KALCMANU_STEERING.agc:15
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE KALCMANU_STEERING.agc:16
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE KALCMANU_STEERING.agc:17
//#
// PORT: SOURCE KALCMANU_STEERING.agc:18
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE KALCMANU_STEERING.agc:19
//#
// PORT: SOURCE KALCMANU_STEERING.agc:20
//#	Prepared by
// PORT: SOURCE KALCMANU_STEERING.agc:21
//#			Massachusetts Institute of Technology
// PORT: SOURCE KALCMANU_STEERING.agc:22
//#			75 Cambridge Parkway
// PORT: SOURCE KALCMANU_STEERING.agc:23
//#			Cambridge, Massachusetts
// PORT: SOURCE KALCMANU_STEERING.agc:24
//#
// PORT: SOURCE KALCMANU_STEERING.agc:25
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE KALCMANU_STEERING.agc:26
//#
// PORT: SOURCE KALCMANU_STEERING.agc:27
//# Refer directly to the online document mentioned above for further information.
// PORT: SOURCE KALCMANU_STEERING.agc:28
//# Please report any errors to info@sandroid.org.
// PORT: SOURCE KALCMANU_STEERING.agc:29
//
// PORT: SOURCE KALCMANU_STEERING.agc:30
//# Page 414
// PORT: SOURCE KALCMANU_STEERING.agc:31
//# GENERATION OF STEERING COMMANDS FOR DIGITAL AUTOPILOT FREE FALL MANEUVERS
// PORT: SOURCE KALCMANU_STEERING.agc:32
//#
// PORT: SOURCE KALCMANU_STEERING.agc:33
//# NEW COMMANDS WILL BE GENERATED EVERY ONE SECOND DURING THE MANEUVER
// PORT: SOURCE KALCMANU_STEERING.agc:34
//
// PORT: SOURCE KALCMANU_STEERING.agc:35
//		BANK	15
// PORT: SOURCE KALCMANU_STEERING.agc:36
//
// PORT: SOURCE KALCMANU_STEERING.agc:37
//		SETLOC	KALCMON1
// PORT: SOURCE KALCMANU_STEERING.agc:38
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:39
//
// PORT: SOURCE KALCMANU_STEERING.agc:40
//		EBANK=	BCDU
// PORT: SOURCE KALCMANU_STEERING.agc:41
//
// PORT: SOURCE KALCMANU_STEERING.agc:42
//		COUNT	22/KALC
// PORT: SOURCE KALCMANU_STEERING.agc:43
//
// PORT: SOURCE KALCMANU_STEERING.agc:44
//NEWDELHI	CS	HOLDFLAG	# SEE IF MANEUVER HAS BEEN INTERRUPTED
// PORT: Fixed ROM slots 21014.
            if slot <> 21014 or instruction <> 17114 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 730).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:45
//		EXTEND			# BY ASTRONAUT
// PORT: Fixed ROM slots 21015.
            if slot <> 21015 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21016 {
// PORT: SOURCE KALCMANU_STEERING.agc:46
//		BZMF	NOGO	-2	# IF SO, TERMINATE KALCMANU
// PORT: Fixed ROM slots 21016.
            if slot <> 21016 or instruction <> 26070 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26070, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:47
//NEWANGL		TC	INTPRET
// PORT: Fixed ROM slots 21017.
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
// PORT: SOURCE KALCMANU_STEERING.agc:48
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 21018.
    21018, 62688,
// PORT: SOURCE KALCMANU_STEERING.agc:49
//			MIS		# COMPUTE THE NEW MATRIX FROM S/C TO
// PORT: Fixed ROM slots 21019.
    21019, 3488,
// PORT: SOURCE KALCMANU_STEERING.agc:50
//			DEL		# STABLE MEMBER AXES
// PORT: Fixed ROM slots 21020.
    21020, 3626,
// PORT: SOURCE KALCMANU_STEERING.agc:51
//		CALL
// PORT: Fixed ROM slots 21021.
    21021, 65320,
// PORT: SOURCE KALCMANU_STEERING.agc:52
//			MXM3
// PORT: Fixed ROM slots 21022.
    21022, 37256,
// PORT: SOURCE KALCMANU_STEERING.agc:53
//		VLOAD	STADR
// PORT: Fixed ROM slots 21023.
    21023, 38650,
// PORT: SOURCE KALCMANU_STEERING.agc:54
//		STOVL	MIS +12D	# CALCULATE NEW DESIRED CDU ANGLES
// PORT: Fixed ROM slots 21024.
    21024, 41540,
// PORT: SOURCE KALCMANU_STEERING.agc:55
//		STADR
// PORT: Fixed ROM slots 21025.
    21025, 65324,
// PORT: SOURCE KALCMANU_STEERING.agc:56
//		STOVL	MIS +6D
// PORT: Fixed ROM slots 21026.
    21026, 41552,
// PORT: SOURCE KALCMANU_STEERING.agc:57
//		STADR
// PORT: Fixed ROM slots 21027.
    21027, 65324,
// PORT: SOURCE KALCMANU_STEERING.agc:58
//		STORE	MIS
// PORT: Fixed ROM slots 21028.
    21028, 62044,
// PORT: SOURCE KALCMANU_STEERING.agc:59
//		AXC,1	CALL
// PORT: Fixed ROM slots 21029.
    21029, 38112,
// PORT: SOURCE KALCMANU_STEERING.agc:60
//			MIS
// PORT: Fixed ROM slots 21030.
    21030, 3488,
// PORT: SOURCE KALCMANU_STEERING.agc:61
//			DCMTOCDU	# PICK UP THE NEW CDU ANGLES FROM MATRIX
// PORT: Fixed ROM slots 21031.
    21031, 37722,
// PORT: SOURCE KALCMANU_STEERING.agc:62
//		RTB
// PORT: Fixed ROM slots 21032.
    21032, 65336,
// PORT: SOURCE KALCMANU_STEERING.agc:63
//			V1STO2S
// PORT: Fixed ROM slots 21033.
    21033, 38612,
// PORT: SOURCE KALCMANU_STEERING.agc:64
//		STORE	NCDU		# NEW CDU ANGLES
// PORT: Fixed ROM slots 21034.
    21034, 3438,
// PORT: SOURCE KALCMANU_STEERING.agc:65
//		BONCLR	EXIT
// PORT: Fixed ROM slots 21035.
    21035, 65048,
// PORT: SOURCE KALCMANU_STEERING.agc:66
//			CALCMAN2
// PORT: Fixed ROM slots 21036.
    21036, 1306,
// PORT: SOURCE KALCMANU_STEERING.agc:67
//			MANUSTAT	# TO START MANEUVER
// PORT: Fixed ROM slots 21037.
    21037, 32874
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21038–21042.
function agcAotUnit1198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21039 {
        if slot <= 21038 {
// PORT: SOURCE KALCMANU_STEERING.agc:68
//		CAF	TWO		# 	   +0 OTHERWISE
// PORT: Fixed ROM slots 21038.
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
// PORT: SOURCE KALCMANU_STEERING.agc:69
//INCRDCDU	TS	KSPNDX
// PORT: Fixed ROM slots 21039.
            if slot <> 21039 or instruction <> 23476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21040 {
// PORT: SOURCE KALCMANU_STEERING.agc:70
//		DOUBLE
// PORT: Fixed ROM slots 21040.
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
// PORT: SOURCE KALCMANU_STEERING.agc:71
//		TS	KDPNDX
// PORT: Fixed ROM slots 21041.
                if slot <> 21041 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:72
//		INDEX	KSPNDX
// PORT: Fixed ROM slots 21042.
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
// PORT: SOURCE KALCMANU_STEERING.agc:73
//		CA	NCDU		# NEW DESIRED CDU ANGLES
// PORT: Fixed ROM slots 21043.
    21043, 26476
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21044–21045.
function agcAotUnit1199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21044 {
// PORT: SOURCE KALCMANU_STEERING.agc:74
//		EXTEND
// PORT: Fixed ROM slots 21044.
        if slot <> 21044 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:75
//		INDEX	KSPNDX
// PORT: Fixed ROM slots 21045.
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
// PORT: SOURCE KALCMANU_STEERING.agc:76
//		MSU	BCDU		# INITIAL S/C ANGLE OR PREVIOUS DESIRED
// PORT: Fixed ROM slots 21046.
    21046, 18274
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21047–21049.
function agcAotUnit1200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21047 {
// PORT: SOURCE KALCMANU_STEERING.agc:77
//		EXTEND			# CDU ANGLES
// PORT: Fixed ROM slots 21047.
        if slot <> 21047 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21048 {
// PORT: SOURCE KALCMANU_STEERING.agc:78
//		MP	QUADROT
// PORT: Fixed ROM slots 21048.
            if slot <> 21048 or instruction <> 30210 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 1538, readEffective:call(words, 1538)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:79
//		INDEX	KDPNDX
// PORT: Fixed ROM slots 21049.
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
// PORT: SOURCE KALCMANU_STEERING.agc:80
//		DXCH	DELCDUX		# ANGEL INCREMENTS TO BE ADDED TO
// PORT: Fixed ROM slots 21050.
    21050, 44796
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21051–21051.
function agcAotUnit1201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:81
//# Page 415
// PORT: SOURCE KALCMANU_STEERING.agc:82
//		INDEX	KSPNDX		# DCDU EVERY TENTH SEC
// PORT: Fixed ROM slots 21051.
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
// PORT: SOURCE KALCMANU_STEERING.agc:83
//		CA	NCDU		# BY LEM DAP
// PORT: Fixed ROM slots 21052.
    21052, 26476
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21053–21053.
function agcAotUnit1202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:84
//		INDEX	KSPNDX
// PORT: Fixed ROM slots 21053.
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
// PORT: SOURCE KALCMANU_STEERING.agc:85
//		XCH	BCDU
// PORT: Fixed ROM slots 21054.
    21054, 48994
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21055–21055.
function agcAotUnit1203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:86
//		INDEX	KDPNDX
// PORT: Fixed ROM slots 21055.
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
// PORT: SOURCE KALCMANU_STEERING.agc:87
//		TS	CDUXD
// PORT: Fixed ROM slots 21056.
    21056, 46924
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21057–21061.
function agcAotUnit1204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21058 {
        if slot <= 21057 {
// PORT: SOURCE KALCMANU_STEERING.agc:88
//		CCS	KSPNDX
// PORT: Fixed ROM slots 21057.
            if slot <> 21057 or instruction <> 5044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 948).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:89
//		TCF	INCRDCDU	# LOOP FOR THREE AXES
// PORT: Fixed ROM slots 21058.
            if slot <> 21058 or instruction <> 5679 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5679, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21059 {
// PORT: SOURCE KALCMANU_STEERING.agc:90
//
// PORT: SOURCE KALCMANU_STEERING.agc:91
//		RELINT
// PORT: Fixed ROM slots 21059.
            if slot <> 21059 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21060 {
// PORT: SOURCE KALCMANU_STEERING.agc:92
//# COMPARE PRESENT TIME WITH TIME TO TERMINATE MANEUVER
// PORT: SOURCE KALCMANU_STEERING.agc:93
//
// PORT: SOURCE KALCMANU_STEERING.agc:94
//TMANUCHK	TC	TIMECHK
// PORT: Fixed ROM slots 21060.
                if slot <> 21060 or instruction <> 1613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:95
//		TC	POSTJUMP
// PORT: Fixed ROM slots 21061.
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
// PORT: SOURCE KALCMANU_STEERING.agc:96
//		CADR	CONTMANU
// PORT: Fixed ROM slots 21062.
    21062, 32946
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21063–21064.
function agcAotUnit1205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21063 {
// PORT: SOURCE KALCMANU_STEERING.agc:97
//
// PORT: SOURCE KALCMANU_STEERING.agc:98
//		CAF	ONE
// PORT: Fixed ROM slots 21063.
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
// PORT: SOURCE KALCMANU_STEERING.agc:99
//MANUSTAL	TC	WAITLIST
// PORT: Fixed ROM slots 21064.
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
// PORT: SOURCE KALCMANU_STEERING.agc:100
//		EBANK=	BCDU
// PORT: SOURCE KALCMANU_STEERING.agc:101
//		2CADR	MANUSTOP
// PORT: Fixed ROM slots 21065 21066.
    21065, 2048, 21066, 34924
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21067–21089.
function agcAotUnit1206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21077 {
        if slot <= 21071 {
            if slot <= 21068 {
                if slot <= 21067 {
// PORT: SOURCE KALCMANU_STEERING.agc:102
//
// PORT: SOURCE KALCMANU_STEERING.agc:103
//		RELINT
// PORT: Fixed ROM slots 21067.
                    if slot <> 21067 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:104
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 21068.
                    if slot <> 21068 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21069 {
// PORT: SOURCE KALCMANU_STEERING.agc:105
//
// PORT: SOURCE KALCMANU_STEERING.agc:106
//
// PORT: SOURCE KALCMANU_STEERING.agc:107
//TIMECHK		EXTEND
// PORT: Fixed ROM slots 21069.
                    if slot <> 21069 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21070 {
// PORT: SOURCE KALCMANU_STEERING.agc:108
//		DCS	TIME2
// PORT: Fixed ROM slots 21070.
                        if slot <> 21070 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:109
//		DXCH	TTEMP
// PORT: Fixed ROM slots 21071.
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
// PORT: SOURCE KALCMANU_STEERING.agc:110
//		EXTEND
// PORT: Fixed ROM slots 21072.
                    if slot <> 21072 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21073 {
// PORT: SOURCE KALCMANU_STEERING.agc:111
//		DCA	TM
// PORT: Fixed ROM slots 21073.
                        if slot <> 21073 or instruction <> 13263 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 975, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:112
//		DAS	TTEMP
// PORT: Fixed ROM slots 21074.
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
// PORT: SOURCE KALCMANU_STEERING.agc:113
//		CCS	TTEMP
// PORT: Fixed ROM slots 21075.
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
// PORT: SOURCE KALCMANU_STEERING.agc:114
//		TC	Q
// PORT: Fixed ROM slots 21076.
                        if slot <> 21076 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:115
//		TCF	+2
// PORT: Fixed ROM slots 21077.
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
// PORT: SOURCE KALCMANU_STEERING.agc:116
//		TCF	2NDRETRN
// PORT: Fixed ROM slots 21078.
                    if slot <> 21078 or instruction <> 5727 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5727, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21079 {
// PORT: SOURCE KALCMANU_STEERING.agc:117
//		CCS	TTEMP +1
// PORT: Fixed ROM slots 21079.
                        if slot <> 21079 or instruction <> 5051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 955).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:118
//		TC	Q
// PORT: Fixed ROM slots 21080.
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
// PORT: SOURCE KALCMANU_STEERING.agc:119
//		TCF	MANUOFF
// PORT: Fixed ROM slots 21081.
                    if slot <> 21081 or instruction <> 5723 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5723, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21082 {
// PORT: SOURCE KALCMANU_STEERING.agc:120
//		COM
// PORT: Fixed ROM slots 21082.
                        if slot <> 21082 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:121
//MANUOFF		AD	1SEC
// PORT: Fixed ROM slots 21083.
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
// PORT: SOURCE KALCMANU_STEERING.agc:122
//		EXTEND
// PORT: Fixed ROM slots 21084.
                    if slot <> 21084 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21085 {
// PORT: SOURCE KALCMANU_STEERING.agc:123
//		BZMF	2NDRETRN
// PORT: Fixed ROM slots 21085.
                        if slot <> 21085 or instruction <> 26207 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26207, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:124
//		INCR	Q
// PORT: Fixed ROM slots 21086.
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
// PORT: SOURCE KALCMANU_STEERING.agc:125
//2NDRETRN	INCR	Q
// PORT: Fixed ROM slots 21087.
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
// PORT: SOURCE KALCMANU_STEERING.agc:126
//		INCR	Q
// PORT: Fixed ROM slots 21088.
                        if slot <> 21088 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:127
//		TC	Q
// PORT: Fixed ROM slots 21089.
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
// PORT: SOURCE KALCMANU_STEERING.agc:128
//
// PORT: SOURCE KALCMANU_STEERING.agc:129
//		SETLOC	MANUSTUF
// PORT: SOURCE KALCMANU_STEERING.agc:130
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:131
//# Page 416
// PORT: SOURCE KALCMANU_STEERING.agc:132
//MANUSTAT	EXIT			# INITIALIZATION ROUTINE
// PORT: Fixed ROM slots 18485.
    18485, 65532
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18486–18519.
function agcAotUnit1081 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18502 {
        if slot <= 18493 {
            if slot <= 18489 {
                if slot <= 18487 {
                    if slot <= 18486 {
// PORT: SOURCE KALCMANU_STEERING.agc:133
//		EXTEND			# FOR AUTOMATIC MANEUVERS
// PORT: Fixed ROM slots 18486.
                        if slot <> 18486 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:134
//		DCA	TIME2
// PORT: Fixed ROM slots 18487.
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
// PORT: SOURCE KALCMANU_STEERING.agc:135
//		DAS	TM		# TM+T0    MANEUVER COMPLETION TIME
// PORT: Fixed ROM slots 18488.
                        if slot <> 18488 or instruction <> 9167 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 975) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:136
//		CS	1SEC
// PORT: Fixed ROM slots 18489.
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
// PORT: SOURCE KALCMANU_STEERING.agc:137
//		TS	L
// PORT: Fixed ROM slots 18490.
                        if slot <> 18490 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:138
//		CS	ZERO
// PORT: Fixed ROM slots 18491.
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
// PORT: SOURCE KALCMANU_STEERING.agc:139
//		DAS	TM		# (TM+T0)-1
// PORT: Fixed ROM slots 18492.
                        if slot <> 18492 or instruction <> 9167 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 975) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:140
//		INHINT
// PORT: Fixed ROM slots 18493.
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
// PORT: SOURCE KALCMANU_STEERING.agc:141
//		CS	ONE		# ENABLE AUTOPILOT TO PERFORM
// PORT: Fixed ROM slots 18494.
                        if slot <> 18494 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:142
//		TS	HOLDFLAG	# AUTOMATIC MANEUVERS
// PORT: Fixed ROM slots 18495.
                        if slot <> 18495 or instruction <> 23258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18496 {
// PORT: SOURCE KALCMANU_STEERING.agc:143
//		CS	RATEINDX	# SEE IF MANEUVERING AT HIGH RATE
// PORT: Fixed ROM slots 18496.
                        if slot <> 18496 or instruction <> 16984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 600).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:144
//		AD	SIX
// PORT: Fixed ROM slots 18497.
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
// PORT: SOURCE KALCMANU_STEERING.agc:145
//		EXTEND
// PORT: Fixed ROM slots 18498.
                        if slot <> 18498 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:146
//		BZMF	HIGHGAIN
// PORT: Fixed ROM slots 18499.
                        if slot <> 18499 or instruction <> 25669 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25669, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18500 {
// PORT: SOURCE KALCMANU_STEERING.agc:147
//		TCF	+4
// PORT: Fixed ROM slots 18500.
                        if slot <> 18500 or instruction <> 5192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18501 {
// PORT: SOURCE KALCMANU_STEERING.agc:148
//HIGHGAIN	CS	RCSFLAGS	# IF SO, SET HIGH RATE FLAG (BIT 15 OF
// PORT: Fixed ROM slots 18501.
                            if slot <> 18501 or instruction <> 17217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 833).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:149
//		MASK	BIT15		# RCSFLAGS)
// PORT: Fixed ROM slots 18502.
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
// PORT: SOURCE KALCMANU_STEERING.agc:150
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 18503.
                        if slot <> 18503 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:151
//		DXCH	BRATE		# X-AXIS MANEUVER RATE
// PORT: Fixed ROM slots 18504.
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
// PORT: SOURCE KALCMANU_STEERING.agc:152
//		DXCH	WBODY
// PORT: Fixed ROM slots 18505.
                        if slot <> 18505 or instruction <> 22358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 854, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:153
//		DXCH	BRATE +2	# Y-AXIS MANEUVER RATE
// PORT: Fixed ROM slots 18506.
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
// PORT: SOURCE KALCMANU_STEERING.agc:154
//		DXCH	WBODY1
// PORT: Fixed ROM slots 18507.
                        if slot <> 18507 or instruction <> 22360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 856, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:155
//		DXCH	BRATE +4	# Z-AXIS MANEUVER RATE
// PORT: Fixed ROM slots 18508.
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
// PORT: SOURCE KALCMANU_STEERING.agc:156
//		DXCH	WBODY2
// PORT: Fixed ROM slots 18509.
                        if slot <> 18509 or instruction <> 22362 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 858, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:157
//		CA	BIASTEMP +1	# INSERT ATTITUDE ERROR BIASES
// PORT: Fixed ROM slots 18510.
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
// PORT: SOURCE KALCMANU_STEERING.agc:158
//		TS	BIAS		# INTO AUTOPILOT
// PORT: Fixed ROM slots 18511.
                        if slot <> 18511 or instruction <> 23412 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23412, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:159
//		CA	BIASTEMP +3
// PORT: Fixed ROM slots 18512.
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
// PORT: SOURCE KALCMANU_STEERING.agc:160
//		TS	BIAS1
// PORT: Fixed ROM slots 18513.
                        if slot <> 18513 or instruction <> 23413 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23413, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:161
//		CA	BIASTEMP +5
// PORT: Fixed ROM slots 18514.
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
// PORT: SOURCE KALCMANU_STEERING.agc:162
//		TS	BIAS2
// PORT: Fixed ROM slots 18515.
                        if slot <> 18515 or instruction <> 23414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:163
//		CA	TIME1
// PORT: Fixed ROM slots 18516.
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
// PORT: SOURCE KALCMANU_STEERING.agc:164
//		AD	1SEC
// PORT: Fixed ROM slots 18517.
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
// PORT: SOURCE KALCMANU_STEERING.agc:165
//		XCH	NEXTIME
// PORT: Fixed ROM slots 18518.
                            if slot <> 18518 or instruction <> 24505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 953, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:166
//		TC	POSTJUMP
// PORT: Fixed ROM slots 18519.
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
// PORT: SOURCE KALCMANU_STEERING.agc:167
//		CADR	INCRDCDU -1
// PORT: Fixed ROM slots 18520.
    18520, 37980
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18521–18529.
function agcAotUnit1082 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18524 {
        if slot <= 18522 {
            if slot <= 18521 {
// PORT: SOURCE KALCMANU_STEERING.agc:168
//
// PORT: SOURCE KALCMANU_STEERING.agc:169
//CONTMANU	INHINT			# CONTINUE WITH UPDATE PROCESS
// PORT: Fixed ROM slots 18521.
                if slot <> 18521 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:170
//		CS	TIME1
// PORT: Fixed ROM slots 18522.
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
// PORT: SOURCE KALCMANU_STEERING.agc:171
//		AD	NEXTIME
// PORT: Fixed ROM slots 18523.
                if slot <> 18523 or instruction <> 25529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:172
//		CCS	A
// PORT: Fixed ROM slots 18524.
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
// PORT: SOURCE KALCMANU_STEERING.agc:173
//		AD	ONE
// PORT: Fixed ROM slots 18525.
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
// PORT: SOURCE KALCMANU_STEERING.agc:174
//		TCF	MANUCALL
// PORT: Fixed ROM slots 18526.
                if slot <> 18526 or instruction <> 5217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5217, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18527 {
// PORT: SOURCE KALCMANU_STEERING.agc:175
//		AD	NEGMAX
// PORT: Fixed ROM slots 18527.
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
// PORT: SOURCE KALCMANU_STEERING.agc:176
//		COM
// PORT: Fixed ROM slots 18528.
                    if slot <> 18528 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:177
//MANUCALL	TC	WAITLIST
// PORT: Fixed ROM slots 18529.
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
// PORT: SOURCE KALCMANU_STEERING.agc:178
//		EBANK=	BCDU
// PORT: SOURCE KALCMANU_STEERING.agc:179
//		2CADR	UPDTCALL
// PORT: Fixed ROM slots 18530 18531.
    18530, 2256, 18531, 32876
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18532–18537.
function agcAotUnit1083 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18534 {
        if slot <= 18532 {
// PORT: SOURCE KALCMANU_STEERING.agc:180
//
// PORT: SOURCE KALCMANU_STEERING.agc:181
//		RELINT
// PORT: Fixed ROM slots 18532.
            if slot <> 18532 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18533 {
// PORT: SOURCE KALCMANU_STEERING.agc:182
//# Page 417
// PORT: SOURCE KALCMANU_STEERING.agc:183
//		CAF	1SEC		# INCREMENT TIME FOR NEXT UPDATE
// PORT: Fixed ROM slots 18533.
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
// PORT: SOURCE KALCMANU_STEERING.agc:184
//		ADS	NEXTIME
// PORT: Fixed ROM slots 18534.
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
// PORT: SOURCE KALCMANU_STEERING.agc:185
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 18535.
            if slot <> 18535 or instruction <> 6799 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6799, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18536 {
// PORT: SOURCE KALCMANU_STEERING.agc:186
//
// PORT: SOURCE KALCMANU_STEERING.agc:187
//
// PORT: SOURCE KALCMANU_STEERING.agc:188
//UPDTCALL	CAF	PRIO26		# CALL FOR UPDATE
// PORT: Fixed ROM slots 18536.
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
// PORT: SOURCE KALCMANU_STEERING.agc:189
//		TC	FINDVAC		# OF STEERING COMMANDS
// PORT: Fixed ROM slots 18537.
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
// PORT: SOURCE KALCMANU_STEERING.agc:190
//		EBANK=	BCDU
// PORT: SOURCE KALCMANU_STEERING.agc:191
//		2CADR	NEWDELHI
// PORT: Fixed ROM slots 18538 18539.
    18538, 3116, 18539, 36972
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18540–18540.
function agcAotUnit1084 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:192
//
// PORT: SOURCE KALCMANU_STEERING.agc:193
//		TC	TASKOVER
// PORT: Fixed ROM slots 18540.
    if slot <> 18540 or instruction <> 2772 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2772, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1084] to agcAotUnit1084@.

// PORT: Physical bank 21. Shared continuation entries, slots 19456–19457.
function agcAotUnit1118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19456 {
// PORT: SOURCE KALCMANU_STEERING.agc:194
//
// PORT: SOURCE KALCMANU_STEERING.agc:195
//# Page 418
// PORT: SOURCE KALCMANU_STEERING.agc:196
//# ROUTINE FOR TERMINATING AUTOMATIC MANEUVERS
// PORT: SOURCE KALCMANU_STEERING.agc:197
//
// PORT: SOURCE KALCMANU_STEERING.agc:198
//		SETLOC	KALCMON3
// PORT: SOURCE KALCMANU_STEERING.agc:199
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:200
//
// PORT: SOURCE KALCMANU_STEERING.agc:201
//MANUSTOP	TC	STOPYZ
// PORT: Fixed ROM slots 19456.
        if slot <> 19456 or instruction <> 2399 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2399, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:202
//		TC	IBNKCALL
// PORT: Fixed ROM slots 19457.
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
// PORT: SOURCE KALCMANU_STEERING.agc:203
//		CADR	LOADYZ
// PORT: Fixed ROM slots 19458.
    19458, 38088
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19459–19467.
function agcAotUnit1119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19462 {
        if slot <= 19460 {
            if slot <= 19459 {
// PORT: SOURCE KALCMANU_STEERING.agc:204
//
// PORT: SOURCE KALCMANU_STEERING.agc:205
//ENDROLL		CA	CPHI
// PORT: Fixed ROM slots 19459.
                if slot <> 19459 or instruction <> 12909 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 621).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:206
//		TS	CDUXD		# SET CDUXD TO THE COMMANDED OUTER GIMBAL
// PORT: Fixed ROM slots 19460.
                if slot <> 19460 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19461 {
// PORT: SOURCE KALCMANU_STEERING.agc:207
//		TC	STOPRATE
// PORT: Fixed ROM slots 19461.
                if slot <> 19461 or instruction <> 2390 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2390, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:208
//ENDMANU		CA	ATTPRIO		# RESTORE USERS PRIORITY
// PORT: Fixed ROM slots 19462.
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
// PORT: SOURCE KALCMANU_STEERING.agc:209
//		TS	NEWPRIO
// PORT: Fixed ROM slots 19463.
                if slot <> 19463 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:210
//
// PORT: SOURCE KALCMANU_STEERING.agc:211
//		CA	ZERO		# ZERO ATTCADR
// PORT: Fixed ROM slots 19464.
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
// PORT: SOURCE KALCMANU_STEERING.agc:212
//		DXCH	ATTCADR
// PORT: Fixed ROM slots 19465.
                if slot <> 19465 or instruction <> 22230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 726, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19466 {
// PORT: SOURCE KALCMANU_STEERING.agc:213
//
// PORT: SOURCE KALCMANU_STEERING.agc:214
//		TC	SPVAC		# RETURN TO USER OF GOMANUR
// PORT: Fixed ROM slots 19466.
                    if slot <> 19466 or instruction <> 2672 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2672, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:215
//
// PORT: SOURCE KALCMANU_STEERING.agc:216
//		TC	TASKOVER
// PORT: Fixed ROM slots 19467.
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

// PORT: Physical bank 02. Shared continuation entries, slots 4438–4458.
function agcAotUnit164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4447 {
        if slot <= 4442 {
            if slot <= 4439 {
                if slot <= 4438 {
// PORT: SOURCE KALCMANU_STEERING.agc:217
//
// PORT: SOURCE KALCMANU_STEERING.agc:218
//		SETLOC	STOPRAT
// PORT: SOURCE KALCMANU_STEERING.agc:219
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:220
//STOPRATE	CAF	ZERO
// PORT: Fixed ROM slots 4438.
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
// PORT: SOURCE KALCMANU_STEERING.agc:221
//		TS	DELCDUX
// PORT: Fixed ROM slots 4439.
                    if slot <> 4439 or instruction <> 23421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4440 {
// PORT: SOURCE KALCMANU_STEERING.agc:222
//		TS	DELCDUX	+1	# ZERO ROLL INCREMENTAL ANGLES
// PORT: Fixed ROM slots 4440.
                    if slot <> 4440 or instruction <> 23422 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4441 {
// PORT: SOURCE KALCMANU_STEERING.agc:223
//		TS	WBODY		# RATE
// PORT: Fixed ROM slots 4441.
                        if slot <> 4441 or instruction <> 23381 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23381, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:224
//		TS	WBODY +1
// PORT: Fixed ROM slots 4442.
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
// PORT: SOURCE KALCMANU_STEERING.agc:225
//		TS	BIAS		# BIAS
// PORT: Fixed ROM slots 4443.
                    if slot <> 4443 or instruction <> 23412 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23412, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:226
//
// PORT: SOURCE KALCMANU_STEERING.agc:227
//		CS	BIT15		# MAKE SURE HIGH RATE FLAG (BIT 15 OF
// PORT: Fixed ROM slots 4444.
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
// PORT: SOURCE KALCMANU_STEERING.agc:228
//		MASK	RCSFLAGS	# RCSFLAGS) IS RESET.
// PORT: Fixed ROM slots 4445.
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
// PORT: SOURCE KALCMANU_STEERING.agc:229
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 4446.
                        if slot <> 4446 or instruction <> 23361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23361, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:230
//
// PORT: SOURCE KALCMANU_STEERING.agc:231
//STOPYZ		CAF	ZERO
// PORT: Fixed ROM slots 4447.
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
// PORT: SOURCE KALCMANU_STEERING.agc:232
//		TS	DELCDUY		# ZERO PITCH, YAW
// PORT: Fixed ROM slots 4448.
                    if slot <> 4448 or instruction <> 23423 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23423, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:233
//		TS	DELCDUY	+1	# INCREMENTAL ANGLES
// PORT: Fixed ROM slots 4449.
                    if slot <> 4449 or instruction <> 23424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23424, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4450 {
// PORT: SOURCE KALCMANU_STEERING.agc:234
//		TS	DELCDUZ
// PORT: Fixed ROM slots 4450.
                    if slot <> 4450 or instruction <> 23425 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23425, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4451 {
// PORT: SOURCE KALCMANU_STEERING.agc:235
//		TS	DELCDUZ	+1
// PORT: Fixed ROM slots 4451.
                        if slot <> 4451 or instruction <> 23426 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23426, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:236
//		TS	WBODY1		# RATES
// PORT: Fixed ROM slots 4452.
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
// PORT: SOURCE KALCMANU_STEERING.agc:237
//		TS	WBODY1 +1
// PORT: Fixed ROM slots 4453.
                    if slot <> 4453 or instruction <> 23384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4454 {
// PORT: SOURCE KALCMANU_STEERING.agc:238
//		TS	WBODY2
// PORT: Fixed ROM slots 4454.
                        if slot <> 4454 or instruction <> 23385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23385, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:239
//		TS	WBODY2 +1
// PORT: Fixed ROM slots 4455.
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
// PORT: SOURCE KALCMANU_STEERING.agc:240
//		TS	BIAS1		# BIASES
// PORT: Fixed ROM slots 4456.
                    if slot <> 4456 or instruction <> 23413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23413, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4457 {
// PORT: SOURCE KALCMANU_STEERING.agc:241
//		TS	BIAS2
// PORT: Fixed ROM slots 4457.
                        if slot <> 4457 or instruction <> 23414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:242
//		TC	Q
// PORT: Fixed ROM slots 4458.
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

// PORT: Physical bank 20. Shared continuation entries, slots 18541–18547.
function agcAotUnit1085 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18543 {
        if slot <= 18541 {
// PORT: SOURCE KALCMANU_STEERING.agc:243
//
// PORT: SOURCE KALCMANU_STEERING.agc:244
//		SETLOC MANUSTUF
// PORT: SOURCE KALCMANU_STEERING.agc:245
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:246
//
// PORT: SOURCE KALCMANU_STEERING.agc:247
//# Page 419
// PORT: SOURCE KALCMANU_STEERING.agc:248
//ZEROERROR	CA	CDUX		# PICK UP CDU ANGLES AND STORE IN
// PORT: Fixed ROM slots 18541.
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
// PORT: SOURCE KALCMANU_STEERING.agc:249
//		TS	CDUXD		# CDU DESIRED
// PORT: Fixed ROM slots 18542.
                if slot <> 18542 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:250
//		CA	CDUY
// PORT: Fixed ROM slots 18543.
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
// PORT: SOURCE KALCMANU_STEERING.agc:251
//		TS	CDUYD
// PORT: Fixed ROM slots 18544.
                if slot <> 18544 or instruction <> 23464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:252
//		CA	CDUZ
// PORT: Fixed ROM slots 18545.
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
// PORT: SOURCE KALCMANU_STEERING.agc:253
//		TS	CDUZD
// PORT: Fixed ROM slots 18546.
                if slot <> 18546 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:254
//		TC	Q
// PORT: Fixed ROM slots 18547.
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

// PORT: Physical bank 22. Shared continuation entries, slots 21090–21096.
function agcAotUnit1207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21092 {
        if slot <= 21090 {
// PORT: SOURCE KALCMANU_STEERING.agc:255
//
// PORT: SOURCE KALCMANU_STEERING.agc:256
//		SETLOC	KALCMON1
// PORT: SOURCE KALCMANU_STEERING.agc:257
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:258
//
// PORT: SOURCE KALCMANU_STEERING.agc:259
//LOADCDUD	CA	CPHI		# STORE TERMINAL ANGLES INTO
// PORT: Fixed ROM slots 21090.
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
// PORT: SOURCE KALCMANU_STEERING.agc:260
//		TS	CDUXD		# COMMAND ANGLES
// PORT: Fixed ROM slots 21091.
                if slot <> 21091 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:261
//LOADYZ		CA	CTHETA
// PORT: Fixed ROM slots 21092.
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
// PORT: SOURCE KALCMANU_STEERING.agc:262
//		TS	CDUYD
// PORT: Fixed ROM slots 21093.
                if slot <> 21093 or instruction <> 23464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:263
//		CA	CPSI
// PORT: Fixed ROM slots 21094.
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
// PORT: SOURCE KALCMANU_STEERING.agc:264
//		TS	CDUZD
// PORT: Fixed ROM slots 21095.
                if slot <> 21095 or instruction <> 23466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:265
//		TC	Q
// PORT: Fixed ROM slots 21096.
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

