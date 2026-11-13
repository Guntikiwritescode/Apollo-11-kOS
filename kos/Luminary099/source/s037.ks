// PORT: Original source unit KALCMANU_STEERING.agc.
// PORT: Physical bank 22. Shared continuation entries, slots 20995–20995.
function agcAotUnit1285 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE KALCMANU_STEERING.agc:2
//# Filename:	KALCMANU_STEERING.agc
// PORT: SOURCE KALCMANU_STEERING.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE KALCMANU_STEERING.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE KALCMANU_STEERING.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE KALCMANU_STEERING.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE KALCMANU_STEERING.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE KALCMANU_STEERING.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE KALCMANU_STEERING.agc:9
//# Pages:	365-369
// PORT: SOURCE KALCMANU_STEERING.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE KALCMANU_STEERING.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE KALCMANU_STEERING.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE KALCMANU_STEERING.agc:13
//#		2011-01-06 JL	Added missing comment characters.
// PORT: SOURCE KALCMANU_STEERING.agc:14
//#
// PORT: SOURCE KALCMANU_STEERING.agc:15
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE KALCMANU_STEERING.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE KALCMANU_STEERING.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE KALCMANU_STEERING.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE KALCMANU_STEERING.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE KALCMANU_STEERING.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE KALCMANU_STEERING.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE KALCMANU_STEERING.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE KALCMANU_STEERING.agc:23
//# actually created.
// PORT: SOURCE KALCMANU_STEERING.agc:24
//#
// PORT: SOURCE KALCMANU_STEERING.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE KALCMANU_STEERING.agc:26
//#
// PORT: SOURCE KALCMANU_STEERING.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE KALCMANU_STEERING.agc:28
//#	16:27 JULY 14, 1969
// PORT: SOURCE KALCMANU_STEERING.agc:29
//
// PORT: SOURCE KALCMANU_STEERING.agc:30
//# Page 365
// PORT: SOURCE KALCMANU_STEERING.agc:31
//# GENERATION OF STEERING COMMANDS FOR DIGITAL AUTOPILOT FREE FALL MANEUVERS
// PORT: SOURCE KALCMANU_STEERING.agc:32
//#
// PORT: SOURCE KALCMANU_STEERING.agc:33
//# NEW COMMANDS WILL BE GENERATED EVERY ONE SECOND DURING THE MANEUVER
// PORT: SOURCE KALCMANU_STEERING.agc:34
//
// PORT: SOURCE KALCMANU_STEERING.agc:35
//		EBANK=	TTEMP
// PORT: SOURCE KALCMANU_STEERING.agc:36
//
// PORT: SOURCE KALCMANU_STEERING.agc:37
//NEWDELHI	TC	BANKCALL	# CHECK FOR AUTO STABILIZATION
// PORT: Fixed ROM slots 20995.
    if slot <> 20995 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1285] to agcAotUnit1285@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:38
//		CADR	ISITAUTO	# ONLY
// PORT: Fixed ROM slots 20996.
    20996, 45412
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20997–20999.
function agcAotUnit1286 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20997 {
// PORT: SOURCE KALCMANU_STEERING.agc:39
//		CCS	A
// PORT: Fixed ROM slots 20997.
        if slot <> 20997 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20998 {
// PORT: SOURCE KALCMANU_STEERING.agc:40
//		TCF	NOGO -2
// PORT: Fixed ROM slots 20998.
            if slot <> 20998 or instruction <> 5592 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5592, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:41
//NEWANGL		TC	INTPRET
// PORT: Fixed ROM slots 20999.
            if slot <> 20999 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1286] to agcAotUnit1286@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:42
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 21000.
    21000, 62688,
// PORT: SOURCE KALCMANU_STEERING.agc:43
//			MIS		# COMPUTE THE NEW MATRIX FROM S/C TO
// PORT: Fixed ROM slots 21001.
    21001, 3404,
// PORT: SOURCE KALCMANU_STEERING.agc:44
//			KEL		# STABLE MEMBER AXES
// PORT: Fixed ROM slots 21002.
    21002, 2352,
// PORT: SOURCE KALCMANU_STEERING.agc:45
//		CALL
// PORT: Fixed ROM slots 21003.
    21003, 65320,
// PORT: SOURCE KALCMANU_STEERING.agc:46
//			MXM3
// PORT: Fixed ROM slots 21004.
    21004, 37268,
// PORT: SOURCE KALCMANU_STEERING.agc:47
//		VLOAD	STADR
// PORT: Fixed ROM slots 21005.
    21005, 38650,
// PORT: SOURCE KALCMANU_STEERING.agc:48
//		STOVL	MIS +12D	# CALCULATE NEW DESIRED CDU ANGLES
// PORT: Fixed ROM slots 21006.
    21006, 41624,
// PORT: SOURCE KALCMANU_STEERING.agc:49
//		STADR
// PORT: Fixed ROM slots 21007.
    21007, 65324,
// PORT: SOURCE KALCMANU_STEERING.agc:50
//		STOVL	MIS +6D
// PORT: Fixed ROM slots 21008.
    21008, 41636,
// PORT: SOURCE KALCMANU_STEERING.agc:51
//		STADR
// PORT: Fixed ROM slots 21009.
    21009, 65324,
// PORT: SOURCE KALCMANU_STEERING.agc:52
//		STORE	MIS
// PORT: Fixed ROM slots 21010.
    21010, 62128,
// PORT: SOURCE KALCMANU_STEERING.agc:53
//		AXC,1	CALL
// PORT: Fixed ROM slots 21011.
    21011, 38112,
// PORT: SOURCE KALCMANU_STEERING.agc:54
//			MIS
// PORT: Fixed ROM slots 21012.
    21012, 3404,
// PORT: SOURCE KALCMANU_STEERING.agc:55
//			DCMTOCDU	# PICK UP THE NEW CDU ANGLES FROM MATRIX
// PORT: Fixed ROM slots 21013.
    21013, 37720,
// PORT: SOURCE KALCMANU_STEERING.agc:56
//		RTB
// PORT: Fixed ROM slots 21014.
    21014, 65336,
// PORT: SOURCE KALCMANU_STEERING.agc:57
//			V1STO2S
// PORT: Fixed ROM slots 21015.
    21015, 18208,
// PORT: SOURCE KALCMANU_STEERING.agc:58
//		STORE	NCDU		# NEW CDU ANGLES
// PORT: Fixed ROM slots 21016.
    21016, 3464,
// PORT: SOURCE KALCMANU_STEERING.agc:59
//		BONCLR	EXIT
// PORT: Fixed ROM slots 21017.
    21017, 65048,
// PORT: SOURCE KALCMANU_STEERING.agc:60
//			CALCMAN2
// PORT: Fixed ROM slots 21018.
    21018, 1306,
// PORT: SOURCE KALCMANU_STEERING.agc:61
//			MANUSTAT	# TO START MANEUVER
// PORT: Fixed ROM slots 21019.
    21019, 38052
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21020–21022.
function agcAotUnit1287 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21020 {
// PORT: SOURCE KALCMANU_STEERING.agc:62
//		CAF	TWO		#	   +0 OTHERWISE
// PORT: Fixed ROM slots 21020.
        if slot <> 21020 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21021 {
// PORT: SOURCE KALCMANU_STEERING.agc:63
//INCRDCDU	TS	SPNDX
// PORT: Fixed ROM slots 21021.
            if slot <> 21021 or instruction <> 23226 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23226, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:64
//		INDEX	SPNDX
// PORT: Fixed ROM slots 21022.
            if slot <> 21022 or instruction <> 21178 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21178, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21178, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1287] to agcAotUnit1287@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:65
//		CA	BCDU		# INITIAL CDU ANGLES
// PORT: Fixed ROM slots 21023.
    21023, 26492
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21024–21025.
function agcAotUnit1288 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21024 {
// PORT: SOURCE KALCMANU_STEERING.agc:66
//		EXTEND			# OR PREVIOUS DESIRED CDU ANGLES
// PORT: Fixed ROM slots 21024.
        if slot <> 21024 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:67
//		INDEX	SPNDX
// PORT: Fixed ROM slots 21025.
        if slot <> 21025 or instruction <> 21178 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21178, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21178, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1288] to agcAotUnit1288@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:68
//		MSU	NCDU
// PORT: Fixed ROM slots 21026.
    21026, 18310
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21027–21033.
function agcAotUnit1289 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21029 {
        if slot <= 21027 {
// PORT: SOURCE KALCMANU_STEERING.agc:69
//		EXTEND
// PORT: Fixed ROM slots 21027.
            if slot <> 21027 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21028 {
// PORT: SOURCE KALCMANU_STEERING.agc:70
//		SETLOC	KALCMON1
// PORT: SOURCE KALCMANU_STEERING.agc:71
//		BANK
// PORT: SOURCE KALCMANU_STEERING.agc:72
//		MP	DT/TAU
// PORT: Fixed ROM slots 21028.
                if slot <> 21028 or instruction <> 30289 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1617, readEffective:call(words, 1617)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:73
//		CCS	A		# CONVERT TO 2S COMPLEMENT
// PORT: Fixed ROM slots 21029.
                if slot <> 21029 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 21031 {
            if slot <= 21030 {
// PORT: SOURCE KALCMANU_STEERING.agc:74
//		AD	ONE
// PORT: Fixed ROM slots 21030.
                if slot <> 21030 or instruction <> 27115 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:75
//		TCF	+2
// PORT: Fixed ROM slots 21031.
                if slot <> 21031 or instruction <> 5673 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5673, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21032 {
// PORT: SOURCE KALCMANU_STEERING.agc:76
//		COM
// PORT: Fixed ROM slots 21032.
                if slot <> 21032 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:77
//		INDEX	SPNDX
// PORT: Fixed ROM slots 21033.
                if slot <> 21033 or instruction <> 21178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21178, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1289] to agcAotUnit1289@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:78
//		TS	DELDCDU		# ANGLE INCREMENTS TO BE ADDED TO
// PORT: Fixed ROM slots 21034.
    21034, 46912
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21035–21035.
function agcAotUnit1290 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:79
//		INDEX	SPNDX		# CDUXD, CDUYD, CDUZD EVERY TENTH SECOND
// PORT: Fixed ROM slots 21035.
    if slot <> 21035 or instruction <> 21178 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1290] to agcAotUnit1290@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:80
//# Page 366
// PORT: SOURCE KALCMANU_STEERING.agc:81
//		CA	NCDU		# BY LEM DAP
// PORT: Fixed ROM slots 21036.
    21036, 26502
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21037–21037.
function agcAotUnit1291 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:82
//		INDEX	SPNDX
// PORT: Fixed ROM slots 21037.
    if slot <> 21037 or instruction <> 21178 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1291] to agcAotUnit1291@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:83
//		XCH	BCDU
// PORT: Fixed ROM slots 21038.
    21038, 49020
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21039–21039.
function agcAotUnit1292 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:84
//		INDEX	SPNDX
// PORT: Fixed ROM slots 21039.
    if slot <> 21039 or instruction <> 21178 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21178, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1292] to agcAotUnit1292@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:85
//		TS	CDUXD
// PORT: Fixed ROM slots 21040.
    21040, 46906
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21041–21048.
function agcAotUnit1293 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21044 {
        if slot <= 21042 {
            if slot <= 21041 {
// PORT: SOURCE KALCMANU_STEERING.agc:86
//		CCS	SPNDX
// PORT: Fixed ROM slots 21041.
                if slot <> 21041 or instruction <> 4794 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 698).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:87
//		TCF	INCRDCDU	# LOOP FOR THREE AXES
// PORT: Fixed ROM slots 21042.
                if slot <> 21042 or instruction <> 5661 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5661, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21043 {
// PORT: SOURCE KALCMANU_STEERING.agc:88
//
// PORT: SOURCE KALCMANU_STEERING.agc:89
//		RELINT
// PORT: Fixed ROM slots 21043.
                if slot <> 21043 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:90
//
// PORT: SOURCE KALCMANU_STEERING.agc:91
//# COMPARE PRESENT TIME WITH TIME TO TERMINATE MANEUVER
// PORT: SOURCE KALCMANU_STEERING.agc:92
//
// PORT: SOURCE KALCMANU_STEERING.agc:93
//TMANUCHK	TC	TIMECHK
// PORT: Fixed ROM slots 21044.
                if slot <> 21044 or instruction <> 1597 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1597, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21046 {
            if slot <= 21045 {
// PORT: SOURCE KALCMANU_STEERING.agc:94
//		TCF	CONTMANU
// PORT: Fixed ROM slots 21045.
                if slot <> 21045 or instruction <> 5752 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5752, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:95
//		CAF	ONE
// PORT: Fixed ROM slots 21046.
                if slot <> 21046 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21047 {
// PORT: SOURCE KALCMANU_STEERING.agc:96
//MANUSTAL	INHINT			# END MAJOR PART OF MANEUVER WITHIN 1 SEC
// PORT: Fixed ROM slots 21047.
                if slot <> 21047 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:97
//		TC	WAITLIST	# UNDER WAITLIST CALL TO MANUSTOP
// PORT: Fixed ROM slots 21048.
                if slot <> 21048 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1293] to agcAotUnit1293@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:98
//		EBANK=	TTEMP
// PORT: SOURCE KALCMANU_STEERING.agc:99
//		2CADR	MANUSTOP
// PORT: Fixed ROM slots 21049 21050.
    21049, 3350, 21050, 36972
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21051–21072.
function agcAotUnit1294 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21061 {
        if slot <= 21055 {
            if slot <= 21052 {
                if slot <= 21051 {
// PORT: SOURCE KALCMANU_STEERING.agc:100
//
// PORT: SOURCE KALCMANU_STEERING.agc:101
//		RELINT
// PORT: Fixed ROM slots 21051.
                    if slot <> 21051 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:102
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 21052.
                    if slot <> 21052 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21053 {
// PORT: SOURCE KALCMANU_STEERING.agc:103
//
// PORT: SOURCE KALCMANU_STEERING.agc:104
//TIMECHK		EXTEND
// PORT: Fixed ROM slots 21053.
                    if slot <> 21053 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21054 {
// PORT: SOURCE KALCMANU_STEERING.agc:105
//		DCS	TIME2
// PORT: Fixed ROM slots 21054.
                        if slot <> 21054 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:106
//		DXCH	TTEMP
// PORT: Fixed ROM slots 21055.
                        if slot <> 21055 or instruction <> 22472 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 968, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21058 {
                if slot <= 21056 {
// PORT: SOURCE KALCMANU_STEERING.agc:107
//		EXTEND
// PORT: Fixed ROM slots 21056.
                    if slot <> 21056 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21057 {
// PORT: SOURCE KALCMANU_STEERING.agc:108
//		DCA	TM
// PORT: Fixed ROM slots 21057.
                        if slot <> 21057 or instruction <> 13276 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 988, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:109
//		DAS	TTEMP
// PORT: Fixed ROM slots 21058.
                        if slot <> 21058 or instruction <> 9160 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 968) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21059 {
// PORT: SOURCE KALCMANU_STEERING.agc:110
//		CCS	TTEMP
// PORT: Fixed ROM slots 21059.
                    if slot <> 21059 or instruction <> 5063 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 967).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21060 {
// PORT: SOURCE KALCMANU_STEERING.agc:111
//		TC	Q
// PORT: Fixed ROM slots 21060.
                        if slot <> 21060 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:112
//		TCF	+2
// PORT: Fixed ROM slots 21061.
                        if slot <> 21061 or instruction <> 5703 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5703, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 21066 {
            if slot <= 21063 {
                if slot <= 21062 {
// PORT: SOURCE KALCMANU_STEERING.agc:113
//		TCF	2NDRETRN
// PORT: Fixed ROM slots 21062.
                    if slot <> 21062 or instruction <> 5711 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5711, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:114
//		CCS	TTEMP +1
// PORT: Fixed ROM slots 21063.
                    if slot <> 21063 or instruction <> 5064 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 968).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21064 {
// PORT: SOURCE KALCMANU_STEERING.agc:115
//		TC	Q
// PORT: Fixed ROM slots 21064.
                    if slot <> 21064 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21065 {
// PORT: SOURCE KALCMANU_STEERING.agc:116
//		TCF	MANUOFF
// PORT: Fixed ROM slots 21065.
                        if slot <> 21065 or instruction <> 5707 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5707, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:117
//		COM
// PORT: Fixed ROM slots 21066.
                        if slot <> 21066 or instruction <> 16384 { return choose false if checkOnly else -1. }
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
            if slot <= 21069 {
                if slot <= 21067 {
// PORT: SOURCE KALCMANU_STEERING.agc:118
//MANUOFF		AD	ONESEK +1
// PORT: Fixed ROM slots 21067.
                    if slot <> 21067 or instruction <> 26230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1654), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21068 {
// PORT: SOURCE KALCMANU_STEERING.agc:119
//		EXTEND
// PORT: Fixed ROM slots 21068.
                        if slot <> 21068 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:120
//		BZMF	2NDRETRN
// PORT: Fixed ROM slots 21069.
                        if slot <> 21069 or instruction <> 26191 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26191, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21070 {
// PORT: SOURCE KALCMANU_STEERING.agc:121
//		INCR	Q
// PORT: Fixed ROM slots 21070.
                    if slot <> 21070 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21071 {
// PORT: SOURCE KALCMANU_STEERING.agc:122
//2NDRETRN	INCR	Q
// PORT: Fixed ROM slots 21071.
                        if slot <> 21071 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:123
//		TC	Q
// PORT: Fixed ROM slots 21072.
                        if slot <> 21072 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1294] to agcAotUnit1294@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:124
//
// PORT: SOURCE KALCMANU_STEERING.agc:125
//DT/TAU		DEC	.1
// PORT: Fixed ROM slots 21073.
    21073, 3276,
// PORT: SOURCE KALCMANU_STEERING.agc:126
//
// PORT: SOURCE KALCMANU_STEERING.agc:127
//MANUSTAT	EXIT			# INITIALIZATION ROUTINE
// PORT: Fixed ROM slots 21074.
    21074, 65532
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21075–21086.
function agcAotUnit1295 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21080 {
        if slot <= 21077 {
            if slot <= 21075 {
// PORT: SOURCE KALCMANU_STEERING.agc:128
//		EXTEND			# FOR AUTOMATIC MANEUVERS
// PORT: Fixed ROM slots 21075.
                if slot <> 21075 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21076 {
// PORT: SOURCE KALCMANU_STEERING.agc:129
//		DCA	TIME2
// PORT: Fixed ROM slots 21076.
                    if slot <> 21076 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:130
//# Page 367
// PORT: SOURCE KALCMANU_STEERING.agc:131
//		DAS	TM		# TM+TO	   MANEUVER COMPLETION TIME
// PORT: Fixed ROM slots 21077.
                    if slot <> 21077 or instruction <> 9180 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 988) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21078 {
// PORT: SOURCE KALCMANU_STEERING.agc:132
//		EXTEND
// PORT: Fixed ROM slots 21078.
                if slot <> 21078 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21079 {
// PORT: SOURCE KALCMANU_STEERING.agc:133
//		DCS	ONESEK
// PORT: Fixed ROM slots 21079.
                    if slot <> 21079 or instruction <> 18038 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 1654, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:134
//		DAS	TM		# (TM+TO)-1
// PORT: Fixed ROM slots 21080.
                    if slot <> 21080 or instruction <> 9180 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 988) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21083 {
            if slot <= 21081 {
// PORT: SOURCE KALCMANU_STEERING.agc:135
//		INHINT
// PORT: Fixed ROM slots 21081.
                if slot <> 21081 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21082 {
// PORT: SOURCE KALCMANU_STEERING.agc:136
//		CAF	TWO
// PORT: Fixed ROM slots 21082.
                    if slot <> 21082 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:137
//RATEBIAS	TS	KSPNDX
// PORT: Fixed ROM slots 21083.
                    if slot <> 21083 or instruction <> 23489 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23489, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21084 {
// PORT: SOURCE KALCMANU_STEERING.agc:138
//		DOUBLE
// PORT: Fixed ROM slots 21084.
                if slot <> 21084 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21085 {
// PORT: SOURCE KALCMANU_STEERING.agc:139
//		TS	KDPNDX
// PORT: Fixed ROM slots 21085.
                    if slot <> 21085 or instruction <> 23490 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23490, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:140
//		INDEX	A
// PORT: Fixed ROM slots 21086.
                    if slot <> 21086 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1295] to agcAotUnit1295@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:141
//		CA	BRATE
// PORT: Fixed ROM slots 21087.
    21087, 26538
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21088–21088.
function agcAotUnit1296 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:142
//		INDEX	KSPNDX		# STORE MANEUVER RATE IN
// PORT: Fixed ROM slots 21088.
    if slot <> 21088 or instruction <> 21441 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21441, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21441, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1296] to agcAotUnit1296@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:143
//		TS	OMEGAPD		# OMEGAPD, OMEGAQD, OMEGARD
// PORT: Fixed ROM slots 21089.
    21089, 46918
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21090–21096.
function agcAotUnit1297 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21092 {
        if slot <= 21090 {
// PORT: SOURCE KALCMANU_STEERING.agc:144
//		EXTEND
// PORT: Fixed ROM slots 21090.
            if slot <> 21090 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21091 {
// PORT: SOURCE KALCMANU_STEERING.agc:145
//		BZMF	+2		# COMPUTE ATTITUDE ERROR
// PORT: Fixed ROM slots 21091.
                if slot <> 21091 or instruction <> 26213 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26213, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:146
//		COM			# OFFSET = (WX)ABS(WX)/2AJX
// PORT: Fixed ROM slots 21092.
                if slot <> 21092 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21094 {
            if slot <= 21093 {
// PORT: SOURCE KALCMANU_STEERING.agc:147
//		EXTEND			# WHERE AJX= 2-JET ACCELERATION
// PORT: Fixed ROM slots 21093.
                if slot <> 21093 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:148
//		MP	BIASCALE	# = -1/16
// PORT: Fixed ROM slots 21094.
                if slot <> 21094 or instruction <> 30327 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1655, readEffective:call(words, 1655)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21095 {
// PORT: SOURCE KALCMANU_STEERING.agc:149
//		EXTEND
// PORT: Fixed ROM slots 21095.
                if slot <> 21095 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:150
//		INDEX	KDPNDX
// PORT: Fixed ROM slots 21096.
                if slot <> 21096 or instruction <> 21442 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21442, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21442, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1297] to agcAotUnit1297@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:151
//		MP	BRATE
// PORT: Fixed ROM slots 21097.
    21097, 59306
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21098–21099.
function agcAotUnit1298 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21098 {
// PORT: SOURCE KALCMANU_STEERING.agc:152
//		EXTEND
// PORT: Fixed ROM slots 21098.
        if slot <> 21098 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:153
//		INDEX	KSPNDX
// PORT: Fixed ROM slots 21099.
        if slot <> 21099 or instruction <> 21441 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21441, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21441, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1298] to agcAotUnit1298@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:154
//		DV	1JACC		# =AJX	$ 90 DEG/SEC-SEC
// PORT: Fixed ROM slots 21100.
    21100, 9904
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21101–21101.
function agcAotUnit1299 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE KALCMANU_STEERING.agc:155
//		INDEX	KSPNDX
// PORT: Fixed ROM slots 21101.
    if slot <> 21101 or instruction <> 21441 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21441, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21441, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1299] to agcAotUnit1299@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:156
//		TS	DELPEROR	#     $ 180 DEG
// PORT: Fixed ROM slots 21102.
    21102, 46462
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21103–21108.
function agcAotUnit1300 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21105 {
        if slot <= 21103 {
// PORT: SOURCE KALCMANU_STEERING.agc:157
//		CCS	KSPNDX
// PORT: Fixed ROM slots 21103.
            if slot <> 21103 or instruction <> 5057 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 961).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21104 {
// PORT: SOURCE KALCMANU_STEERING.agc:158
//		TCF	RATEBIAS
// PORT: Fixed ROM slots 21104.
                if slot <> 21104 or instruction <> 5723 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5723, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:159
//
// PORT: SOURCE KALCMANU_STEERING.agc:160
//		CA	TIME1
// PORT: Fixed ROM slots 21105.
                if slot <> 21105 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 21).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21106 {
// PORT: SOURCE KALCMANU_STEERING.agc:161
//		AD	ONESEK +1
// PORT: Fixed ROM slots 21106.
            if slot <> 21106 or instruction <> 26230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1654), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21107 {
// PORT: SOURCE KALCMANU_STEERING.agc:162
//		XCH	NEXTIME
// PORT: Fixed ROM slots 21107.
                if slot <> 21107 or instruction <> 24518 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 966, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:163
//		TCF	INCRDCDU -1
// PORT: Fixed ROM slots 21108.
                if slot <> 21108 or instruction <> 5660 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5660, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1300] to agcAotUnit1300@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:164
//
// PORT: SOURCE KALCMANU_STEERING.agc:165
//ONESEK		DEC	0
// PORT: Fixed ROM slots 21109.
    21109, 0,
// PORT: SOURCE KALCMANU_STEERING.agc:166
//		DEC	100
// PORT: Fixed ROM slots 21110.
    21110, 200,
// PORT: SOURCE KALCMANU_STEERING.agc:167
//
// PORT: SOURCE KALCMANU_STEERING.agc:168
//BIASCALE	OCT	75777		# = -1/16
// PORT: Fixed ROM slots 21111.
    21111, 63486
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21112–21120.
function agcAotUnit1301 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21115 {
        if slot <= 21113 {
            if slot <= 21112 {
// PORT: SOURCE KALCMANU_STEERING.agc:169
//
// PORT: SOURCE KALCMANU_STEERING.agc:170
//CONTMANU	CS	TIME1		# RESET FOR NEXT DCDU UPDATE
// PORT: Fixed ROM slots 21112.
                if slot <> 21112 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:171
//		AD	NEXTIME
// PORT: Fixed ROM slots 21113.
                if slot <> 21113 or instruction <> 25542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 966).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21114 {
// PORT: SOURCE KALCMANU_STEERING.agc:172
//		CCS	A
// PORT: Fixed ROM slots 21114.
                if slot <> 21114 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:173
//		AD	ONE
// PORT: Fixed ROM slots 21115.
                if slot <> 21115 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 21117 {
            if slot <= 21116 {
// PORT: SOURCE KALCMANU_STEERING.agc:174
//		TCF	MANUCALL
// PORT: Fixed ROM slots 21116.
                if slot <> 21116 or instruction <> 5759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5759, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:175
//		AD	NEGMAX
// PORT: Fixed ROM slots 21117.
                if slot <> 21117 or instruction <> 27101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21118 {
// PORT: SOURCE KALCMANU_STEERING.agc:176
//		COM
// PORT: Fixed ROM slots 21118.
                if slot <> 21118 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21119 {
// PORT: SOURCE KALCMANU_STEERING.agc:177
//MANUCALL	INHINT			# CALL FOR NEXT UPDATE VIA WAITLIST
// PORT: Fixed ROM slots 21119.
                    if slot <> 21119 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KALCMANU_STEERING.agc:178
//		TC	WAITLIST
// PORT: Fixed ROM slots 21120.
                    if slot <> 21120 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1301] to agcAotUnit1301@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:179
//		EBANK=	TTEMP
// PORT: SOURCE KALCMANU_STEERING.agc:180
//		2CADR	UPDTCALL
// PORT: Fixed ROM slots 21121 21122.
    21121, 3340, 21122, 36972
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21123–21127.
function agcAotUnit1302 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21124 {
        if slot <= 21123 {
// PORT: SOURCE KALCMANU_STEERING.agc:181
//# Page 368
// PORT: SOURCE KALCMANU_STEERING.agc:182
//		CAF	ONESEK +1	# INCREMENT TIME FOR NEXT UPDATE
// PORT: Fixed ROM slots 21123.
            if slot <> 21123 or instruction <> 13942 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1654), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE KALCMANU_STEERING.agc:183
//		ADS	NEXTIME
// PORT: Fixed ROM slots 21124.
            if slot <> 21124 or instruction <> 12230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 966).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21125 {
// PORT: SOURCE KALCMANU_STEERING.agc:184
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 21125.
            if slot <> 21125 or instruction <> 6765 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6765, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21126 {
// PORT: SOURCE KALCMANU_STEERING.agc:185
//
// PORT: SOURCE KALCMANU_STEERING.agc:186
//UPDTCALL	CAF	PRIO26		# SATELLITE PROGRAM TO CALL FOR UPDATE
// PORT: Fixed ROM slots 21126.
                if slot <> 21126 or instruction <> 16332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE KALCMANU_STEERING.agc:187
//		TC	FINDVAC		# OF STEERING COMMANDS
// PORT: Fixed ROM slots 21127.
                if slot <> 21127 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1302] to agcAotUnit1302@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KALCMANU_STEERING.agc:188
//		EBANK=	TTEMP
// PORT: SOURCE KALCMANU_STEERING.agc:189
//		2CADR	NEWDELHI
// PORT: Fixed ROM slots 21128 21129.
    21128, 3078, 21129, 36972
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21130–21153.
function agcAotUnit1303 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21141 {
        if slot <= 21135 {
            if slot <= 21132 {
                if slot <= 21130 {
// PORT: SOURCE KALCMANU_STEERING.agc:190
//
// PORT: SOURCE KALCMANU_STEERING.agc:191
//		TC	TASKOVER
// PORT: Fixed ROM slots 21130.
                    if slot <> 21130 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21131 {
// PORT: SOURCE KALCMANU_STEERING.agc:192
//
// PORT: SOURCE KALCMANU_STEERING.agc:193
//# Page 369
// PORT: SOURCE KALCMANU_STEERING.agc:194
//# ROUTINE FOR TERMINATING AUTOMATIC MANEUVERS
// PORT: SOURCE KALCMANU_STEERING.agc:195
//
// PORT: SOURCE KALCMANU_STEERING.agc:196
//MANUSTOP	CAF	ZERO		# ZERO MANEUVER RATES
// PORT: Fixed ROM slots 21131.
                        if slot <> 21131 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:197
//		TS	DELDCDU2
// PORT: Fixed ROM slots 21132.
                        if slot <> 21132 or instruction <> 23458 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23458, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21133 {
// PORT: SOURCE KALCMANU_STEERING.agc:198
//		TS	OMEGARD
// PORT: Fixed ROM slots 21133.
                    if slot <> 21133 or instruction <> 23461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21134 {
// PORT: SOURCE KALCMANU_STEERING.agc:199
//		TS	DELREROR
// PORT: Fixed ROM slots 21134.
                        if slot <> 21134 or instruction <> 23233 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23233, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:200
//		TS	DELDCDU1
// PORT: Fixed ROM slots 21135.
                        if slot <> 21135 or instruction <> 23457 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23457, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21138 {
                if slot <= 21136 {
// PORT: SOURCE KALCMANU_STEERING.agc:201
//		TS	OMEGAQD
// PORT: Fixed ROM slots 21136.
                    if slot <> 21136 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21137 {
// PORT: SOURCE KALCMANU_STEERING.agc:202
//		TS	DELQEROR
// PORT: Fixed ROM slots 21137.
                        if slot <> 21137 or instruction <> 23232 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:203
//		CA	CPSI		# SET DESIRED GIMBAL ANGLES TO
// PORT: Fixed ROM slots 21138.
                        if slot <> 21138 or instruction <> 12499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 211).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21139 {
// PORT: SOURCE KALCMANU_STEERING.agc:204
//		TS	CDUZD		# DESIRED FINAL GIMBAL ANGLES
// PORT: Fixed ROM slots 21139.
                    if slot <> 21139 or instruction <> 23455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23455, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21140 {
// PORT: SOURCE KALCMANU_STEERING.agc:205
//		CA	CTHETA
// PORT: Fixed ROM slots 21140.
                        if slot <> 21140 or instruction <> 12498 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 210).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:206
//		TS	CDUYD
// PORT: Fixed ROM slots 21141.
                        if slot <> 21141 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 21147 {
            if slot <= 21144 {
                if slot <= 21142 {
// PORT: SOURCE KALCMANU_STEERING.agc:207
//ENDROLL		CA	CPHI		# NO FINAL YAW
// PORT: Fixed ROM slots 21142.
                    if slot <> 21142 or instruction <> 12497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 209).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21143 {
// PORT: SOURCE KALCMANU_STEERING.agc:208
//		TS	CDUXD
// PORT: Fixed ROM slots 21143.
                        if slot <> 21143 or instruction <> 23453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23453, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:209
//		CAF	ZERO
// PORT: Fixed ROM slots 21144.
                        if slot <> 21144 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21145 {
// PORT: SOURCE KALCMANU_STEERING.agc:210
//		TS	OMEGAPD		# I.E. MANEUVER DID NOT GO THRU
// PORT: Fixed ROM slots 21145.
                    if slot <> 21145 or instruction <> 23459 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23459, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21146 {
// PORT: SOURCE KALCMANU_STEERING.agc:211
//		TS	DELDCDU		# GIMBAL LOCK ORIGINALLY
// PORT: Fixed ROM slots 21146.
                        if slot <> 21146 or instruction <> 23456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23456, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:212
//		TS	DELPEROR
// PORT: Fixed ROM slots 21147.
                        if slot <> 21147 or instruction <> 23231 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23231, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21150 {
                if slot <= 21148 {
// PORT: SOURCE KALCMANU_STEERING.agc:213
//GOODMANU	CA	ATTPRIO		# RESTORE USERS PRIO
// PORT: Fixed ROM slots 21148.
                    if slot <> 21148 or instruction <> 13001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 713).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21149 {
// PORT: SOURCE KALCMANU_STEERING.agc:214
//		TS	NEWPRIO
// PORT: Fixed ROM slots 21149.
                        if slot <> 21149 or instruction <> 22579 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22579, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:215
//
// PORT: SOURCE KALCMANU_STEERING.agc:216
//		CA	ZERO		# ZERO ATTCADR
// PORT: Fixed ROM slots 21150.
                        if slot <> 21150 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21151 {
// PORT: SOURCE KALCMANU_STEERING.agc:217
//		DXCH	ATTCADR
// PORT: Fixed ROM slots 21151.
                    if slot <> 21151 or instruction <> 22216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 712, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21152 {
// PORT: SOURCE KALCMANU_STEERING.agc:218
//
// PORT: SOURCE KALCMANU_STEERING.agc:219
//		TC	SPVAC		# RETURN TO USER
// PORT: Fixed ROM slots 21152.
                        if slot <> 21152 or instruction <> 2638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KALCMANU_STEERING.agc:220
//
// PORT: SOURCE KALCMANU_STEERING.agc:221
//		TC	TASKOVER
// PORT: Fixed ROM slots 21153.
                        if slot <> 21153 or instruction <> 2737 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1303] to agcAotUnit1303@.

