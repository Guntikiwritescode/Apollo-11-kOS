// PORT: Original source unit T4RUPT_PROGRAM.agc.
// PORT: Physical bank 06. Shared continuation entries, slots 8192–8201.
function agcAotUnit463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8196 {
        if slot <= 8193 {
            if slot <= 8192 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE T4RUPT_PROGRAM.agc:2
//# Filename:	T4RUPT_PROGRAM.agc
// PORT: SOURCE T4RUPT_PROGRAM.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// PORT: SOURCE T4RUPT_PROGRAM.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE T4RUPT_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE T4RUPT_PROGRAM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE T4RUPT_PROGRAM.agc:7
//# Reference:	pp. 133-169
// PORT: SOURCE T4RUPT_PROGRAM.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE T4RUPT_PROGRAM.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE T4RUPT_PROGRAM.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE T4RUPT_PROGRAM.agc:11
//# Mod history:	10/05/09 FB	Transcription of Batch FB-1 Assignment.
// PORT: SOURCE T4RUPT_PROGRAM.agc:12
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE T4RUPT_PROGRAM.agc:14
//# from scanned documents.
// PORT: SOURCE T4RUPT_PROGRAM.agc:15
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:16
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE T4RUPT_PROGRAM.agc:17
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE T4RUPT_PROGRAM.agc:18
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:19
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE T4RUPT_PROGRAM.agc:20
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:21
//#	Prepared by
// PORT: SOURCE T4RUPT_PROGRAM.agc:22
//#			Massachusetts Institute of Technology
// PORT: SOURCE T4RUPT_PROGRAM.agc:23
//#			75 Cambridge Parkway
// PORT: SOURCE T4RUPT_PROGRAM.agc:24
//#			Cambridge, Massachusetts
// PORT: SOURCE T4RUPT_PROGRAM.agc:25
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:26
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE T4RUPT_PROGRAM.agc:27
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE T4RUPT_PROGRAM.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE T4RUPT_PROGRAM.agc:30
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:31
//# Page 133
// PORT: SOURCE T4RUPT_PROGRAM.agc:32
//		BANK	12
// PORT: SOURCE T4RUPT_PROGRAM.agc:33
//		SETLOC	T4RUP
// PORT: SOURCE T4RUPT_PROGRAM.agc:34
//		BANK
// PORT: SOURCE T4RUPT_PROGRAM.agc:35
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:36
//		COUNT	06/T4RPT
// PORT: SOURCE T4RUPT_PROGRAM.agc:37
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:38
//T4RUPT		TS	BANKRUPT
// PORT: Fixed ROM slots 8192.
                if slot <> 8192 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:39
//		EXTEND
// PORT: Fixed ROM slots 8193.
                if slot <> 8193 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8194 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:40
//		QXCH	QRUPT
// PORT: Fixed ROM slots 8194.
                if slot <> 8194 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8195 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:41
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:42
//		CCS	DSRUPTSW	# GOES 7(-1)0 AROUND AND AROUND
// PORT: Fixed ROM slots 8195.
                    if slot <> 8195 or instruction <> 4802 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:43
//		TCF	NORMT4 +1
// PORT: Fixed ROM slots 8196.
                    if slot <> 8196 or instruction <> 5128 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5128, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8198 {
            if slot <= 8197 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:44
//		TCF	NORMT4
// PORT: Fixed ROM slots 8197.
                if slot <> 8197 or instruction <> 5127 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5127, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:45
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:46
//		TCF	QUIKDSP
// PORT: Fixed ROM slots 8198.
                if slot <> 8198 or instruction <> 5214 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5214, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8199 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:47
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:48
//NORMT4		CAF	SEVEN
// PORT: Fixed ROM slots 8199.
                if slot <> 8199 or instruction <> 14867 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8200 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:49
//		TS	RUPTREG1
// PORT: Fixed ROM slots 8200.
                    if slot <> 8200 or instruction <> 22584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22584, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:50
//		TS	DSRUPTSW
// PORT: Fixed ROM slots 8201.
                    if slot <> 8201 or instruction <> 23234 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23234, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[463] to agcAotUnit463@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:51
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:52
//		COUNT	02/T4RPT
// PORT: SOURCE T4RUPT_PROGRAM.agc:53
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:54
//74K		=	HIGH4
// PORT: SOURCE T4RUPT_PROGRAM.agc:55
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:56
//# RELTAB IS A PACKED TABLE. RELAYWORD CODE IN UPPER 4 BITS, RELAY CODE
// PORT: SOURCE T4RUPT_PROGRAM.agc:57
//# IN LOWER 5 BITS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:58
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:59
//		BLOCK	02
// PORT: SOURCE T4RUPT_PROGRAM.agc:60
//		SETLOC	FFTAG12
// PORT: SOURCE T4RUPT_PROGRAM.agc:61
//		BANK
// PORT: SOURCE T4RUPT_PROGRAM.agc:62
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:63
//RELTAB		OCT	04025
// PORT: Fixed ROM slots 4154.
    4154, 4138,
// PORT: SOURCE T4RUPT_PROGRAM.agc:64
//		OCT	10003
// PORT: Fixed ROM slots 4155.
    4155, 8198,
// PORT: SOURCE T4RUPT_PROGRAM.agc:65
//		OCT	14031
// PORT: Fixed ROM slots 4156.
    4156, 12338,
// PORT: SOURCE T4RUPT_PROGRAM.agc:66
//		OCT	20033
// PORT: Fixed ROM slots 4157.
    4157, 16438,
// PORT: SOURCE T4RUPT_PROGRAM.agc:67
//		OCT	24017
// PORT: Fixed ROM slots 4158.
    4158, 20510,
// PORT: SOURCE T4RUPT_PROGRAM.agc:68
//		OCT	30036
// PORT: Fixed ROM slots 4159.
    4159, 24636,
// PORT: SOURCE T4RUPT_PROGRAM.agc:69
//		OCT	34034
// PORT: Fixed ROM slots 4160.
    4160, 28728,
// PORT: SOURCE T4RUPT_PROGRAM.agc:70
//		OCT	40023
// PORT: Fixed ROM slots 4161.
    4161, 32806,
// PORT: SOURCE T4RUPT_PROGRAM.agc:71
//		OCT	44035
// PORT: Fixed ROM slots 4162.
    4162, 36922,
// PORT: SOURCE T4RUPT_PROGRAM.agc:72
//		OCT	50037
// PORT: Fixed ROM slots 4163.
    4163, 41022,
// PORT: SOURCE T4RUPT_PROGRAM.agc:73
//		OCT	54000
// PORT: Fixed ROM slots 4164.
    4164, 45056,
// PORT: SOURCE T4RUPT_PROGRAM.agc:74
//RELTAB11	OCT	60000
// PORT: Fixed ROM slots 4165.
    4165, 49152
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8202–8218.
function agcAotUnit464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8209 {
        if slot <= 8205 {
            if slot <= 8203 {
                if slot <= 8202 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:75
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:76
//# Page 134
// PORT: SOURCE T4RUPT_PROGRAM.agc:77
//# SWITCHED-BANK PORTION
// PORT: SOURCE T4RUPT_PROGRAM.agc:78
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:79
//		BANK	12
// PORT: SOURCE T4RUPT_PROGRAM.agc:80
//		SETLOC	T4RUP
// PORT: SOURCE T4RUPT_PROGRAM.agc:81
//		BANK
// PORT: SOURCE T4RUPT_PROGRAM.agc:82
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:83
//		COUNT	06/T4RPT
// PORT: SOURCE T4RUPT_PROGRAM.agc:84
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:85
//CDRVE		CCS	DSPTAB +11D
// PORT: Fixed ROM slots 8202.
                    if slot <> 8202 or instruction <> 4638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 542).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:86
//		TC	DSPOUT
// PORT: Fixed ROM slots 8203.
                    if slot <> 8203 or instruction <> 1075 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1075, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8204 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:87
//		TC	DSPOUT
// PORT: Fixed ROM slots 8204.
                    if slot <> 8204 or instruction <> 1075 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1075, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:88
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:89
//		XCH	DSPTAB +11D
// PORT: Fixed ROM slots 8205.
                    if slot <> 8205 or instruction <> 24094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 542, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8207 {
                if slot <= 8206 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:90
//		MASK	LOW11
// PORT: Fixed ROM slots 8206.
                    if slot <> 8206 or instruction <> 30970 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2298), 32768).
                        if fixedOperand = 2047 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2048) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:91
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 8207.
                    if slot <> 8207 or instruction <> 23070 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23070, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8208 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:92
//		AD	RELTAB11
// PORT: Fixed ROM slots 8208.
                    if slot <> 8208 or instruction <> 26693 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:93
//		EXTEND
// PORT: Fixed ROM slots 8209.
                    if slot <> 8209 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8213 {
            if slot <= 8211 {
                if slot <= 8210 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:94
//		WRITE	OUT0
// PORT: Fixed ROM slots 8210.
                    if slot <> 8210 or instruction <> 520 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:95
//		TC	HANG20
// PORT: Fixed ROM slots 8211.
                    if slot <> 8211 or instruction <> 1081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1081, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8212 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:96
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:97
//# Page 135
// PORT: SOURCE T4RUPT_PROGRAM.agc:98
//# DSPOUT PROGRAM, PUTS OUT DISPLAYS
// PORT: SOURCE T4RUPT_PROGRAM.agc:99
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:100
//DSPOUTSB	TS	NOUT
// PORT: Fixed ROM slots 8212.
                    if slot <> 8212 or instruction <> 23054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:101
//		CS	ZERO
// PORT: Fixed ROM slots 8213.
                    if slot <> 8213 or instruction <> 18961 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8215 {
                if slot <= 8214 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:102
//		TS	DSRUPTEM	# SET TO -0 FOR 1ST PASS THRU DSPTAB
// PORT: Fixed ROM slots 8214.
                    if slot <> 8214 or instruction <> 22587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:103
//		XCH	DSPCNT
// PORT: Fixed ROM slots 8215.
                    if slot <> 8215 or instruction <> 24062 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 510, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8216 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:104
//		AD	NEG0		# TO PREVENT +0
// PORT: Fixed ROM slots 8216.
                    if slot <> 8216 or instruction <> 27152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8217 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:105
//		TS	DSPCNT
// PORT: Fixed ROM slots 8217.
                        if slot <> 8217 or instruction <> 23038 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23038, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:106
//DSPSCAN		INDEX	DSPCNT
// PORT: Fixed ROM slots 8218.
                        if slot <> 8218 or instruction <> 20990 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20990, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20990, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[464] to agcAotUnit464@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:107
//		CCS	DSPTAB
// PORT: Fixed ROM slots 8219.
    8219, 9254
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8220–8222.
function agcAotUnit465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8220 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:108
//		CCS	DSPCNT		# IF DSPTAB ENTRY +, SKIP
// PORT: Fixed ROM slots 8220.
        if slot <> 8220 or instruction <> 4606 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 510).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8221 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:109
//		TCF	DSPSCAN	-2	# IF DSPCNT +, AGAIN
// PORT: Fixed ROM slots 8221.
            if slot <> 8221 or instruction <> 5144 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5144, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:110
//		TCF	DSPLAY		# IF DSPTAB ENTRY -, DISPLAY
// PORT: Fixed ROM slots 8222.
            if slot <> 8222 or instruction <> 5159 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5159, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[465] to agcAotUnit465@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:111
//TABLNTH		OCT	12		# DEC 10 LENGTH OF DSPTAB
// PORT: Fixed ROM slots 8223.
    8223, 20
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8224–8224.
function agcAotUnit466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE T4RUPT_PROGRAM.agc:112
//		CCS	DSRUPTEM	# IF DSRUPTEM=+0, 2ND PASS THRU DSPTAB
// PORT: Fixed ROM slots 8224.
    if slot <> 8224 or instruction <> 4155 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCCS(words, 59).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[466] to agcAotUnit466@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:113
//120MRUPT	DEC	16372		# (DSPCNT = 0).  +0 INTO NOUT.
// PORT: Fixed ROM slots 8225.
    8225, 32744
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8226–8232.
function agcAotUnit467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8228 {
        if slot <= 8226 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:114
//		TS	NOUT
// PORT: Fixed ROM slots 8226.
            if slot <> 8226 or instruction <> 23054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8227 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:115
//		TC	Q
// PORT: Fixed ROM slots 8227.
                if slot <> 8227 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:116
//		TS	DSRUPTEM	# IF DSRUPTEM=-0, 1ST PASS THRU DSPTAB
// PORT: Fixed ROM slots 8228.
                if slot <> 8228 or instruction <> 22587 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22587, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8230 {
            if slot <= 8229 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:117
//		CAF	TABLNTH		# (DSPCNT=0).+0 INTO DSRUPTEM. PASS AGAIN
// PORT: Fixed ROM slots 8229.
                if slot <> 8229 or instruction <> 13343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1055), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:118
//		TCF	DSPSCAN -1
// PORT: Fixed ROM slots 8230.
                if slot <> 8230 or instruction <> 5145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5145, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8231 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:119
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:120
//DSPLAY		AD	ONE
// PORT: Fixed ROM slots 8231.
                if slot <> 8231 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:121
//		INDEX	DSPCNT
// PORT: Fixed ROM slots 8232.
                if slot <> 8232 or instruction <> 20990 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20990, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20990, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[467] to agcAotUnit467@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:122
//		TS	DSPTAB		# REPLACE POSITIVELY
// PORT: Fixed ROM slots 8233.
    8233, 46118
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8234–8237.
function agcAotUnit468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8235 {
        if slot <= 8234 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:123
//		MASK	LOW11		# REMOVE BITS 12 TO 15
// PORT: Fixed ROM slots 8234.
            if slot <> 8234 or instruction <> 30970 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2298), 32768).
                if fixedOperand = 2047 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2048) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:124
//		TS	DSRUPTEM
// PORT: Fixed ROM slots 8235.
            if slot <> 8235 or instruction <> 22587 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22587, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8236 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:125
//		CAF	HI5
// PORT: Fixed ROM slots 8236.
            if slot <> 8236 or instruction <> 14580 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:126
//		INDEX	DSPCNT
// PORT: Fixed ROM slots 8237.
            if slot <> 8237 or instruction <> 20990 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20990, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20990, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[468] to agcAotUnit468@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:127
//		MASK	RELTAB		# PICK UP BITS 12 TO 15 OF RELTAB ENTRY
// PORT: Fixed ROM slots 8238.
    8238, 61556
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8239–8267.
function agcAotUnit469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8252 {
        if slot <= 8245 {
            if slot <= 8241 {
                if slot <= 8239 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:128
//		AD	DSRUPTEM
// PORT: Fixed ROM slots 8239.
                    if slot <> 8239 or instruction <> 24635 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 59).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8240 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:129
//		EXTEND
// PORT: Fixed ROM slots 8240.
                        if slot <> 8240 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:130
//		WRITE	OUT0		# WRITE CHANNEL 10
// PORT: Fixed ROM slots 8241.
                        if slot <> 8241 or instruction <> 520 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8243 {
                    if slot <= 8242 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:131
//		TCF	Q+1		# *** NORMAL RETURN SKIPS ONE
// PORT: Fixed ROM slots 8242.
                        if slot <> 8242 or instruction <> 7622 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7622, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:132
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:133
//DSPOUT		CCS	FLAGWRD5	# DON'T DISPLAY UNLESS DSKY FLAG ON
// PORT: Fixed ROM slots 8243.
                        if slot <> 8243 or instruction <> 4161 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8244 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:134
//		CAF	ZERO
// PORT: Fixed ROM slots 8244.
                        if slot <> 8244 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:135
//		TCF	NODSPOUT
// PORT: Fixed ROM slots 8245.
                        if slot <> 8245 or instruction <> 5210 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5210, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8248 {
                if slot <= 8246 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:136
//		CCS	NOUT
// PORT: Fixed ROM slots 8246.
                    if slot <> 8246 or instruction <> 4622 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 526).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8247 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:137
//		TC	DSPOUTSB
// PORT: Fixed ROM slots 8247.
                        if slot <> 8247 or instruction <> 1044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:138
//		TCF	NODSPOUT	# NO DISPLAY REQUESTS
// PORT: Fixed ROM slots 8248.
                        if slot <> 8248 or instruction <> 5210 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5210, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8250 {
                    if slot <= 8249 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:139
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:140
//HANG20		CS	11,14,9
// PORT: Fixed ROM slots 8249.
                        if slot <> 8249 or instruction <> 17531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1147), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:141
//		ADS	DSRUPTSW
// PORT: Fixed ROM slots 8250.
                        if slot <> 8250 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8251 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:142
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:143
//		CAF	20MRUPT
// PORT: Fixed ROM slots 8251.
                        if slot <> 8251 or instruction <> 16320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:144
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:145
//SETTIME4	TS	TIME4
// PORT: Fixed ROM slots 8252.
                        if slot <> 8252 or instruction <> 22551 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22551, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8259 {
            if slot <= 8255 {
                if slot <= 8253 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:146
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:147
//# Page 136
// PORT: SOURCE T4RUPT_PROGRAM.agc:148
//# THE STATUS OF THE PROCEED PUSHBUTTON IS MONITORED EVERY 120 MILLISECONDS VIA THE CHANNEL 32 BIT 14 INBIT.
// PORT: SOURCE T4RUPT_PROGRAM.agc:149
//# THE STATE OF THIS INBIT IS COMPARED WITH ITS STATE DURING THE PREVIOUS T4RUPT AND IS PROCESSED AS FOLLOWS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:150
//#	IF PREV ON AND NOW ON 	-- BYPASS
// PORT: SOURCE T4RUPT_PROGRAM.agc:151
//#	IF PREV ON AND NOW OFF	-- UPDATE IMODES33
// PORT: SOURCE T4RUPT_PROGRAM.agc:152
//#	IF PREV OFF AND NOW ON	-- UPDATE IMODES33 AND PROCESS VIA PINBALL
// PORT: SOURCE T4RUPT_PROGRAM.agc:153
//#	IF PREV OFF AND NOW OFF	-- BYPASS
// PORT: SOURCE T4RUPT_PROGRAM.agc:154
//# THE LOGIC EMPLOYED REQUIRES ONLY 9 MCT (APPROX. 108 MICROSECONDS) OF COMPUTER TIME WHEN NO CHANGES OCCUR.
// PORT: SOURCE T4RUPT_PROGRAM.agc:155
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:156
//PROCEEDE	CA	IMODES33	# MONITOR FOR PROCEED BUTTON
// PORT: Fixed ROM slots 8253.
                    if slot <> 8253 or instruction <> 13009 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8254 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:157
//		EXTEND
// PORT: Fixed ROM slots 8254.
                        if slot <> 8254 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:158
//		RXOR	CHAN32		# CHECK IF BIT 14 DIFFERENT
// PORT: Fixed ROM slots 8255.
                        if slot <> 8255 or instruction <> 3098 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 26, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8257 {
                    if slot <= 8256 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:159
//		MASK	BIT14
// PORT: Fixed ROM slots 8256.
                        if slot <> 8256 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:160
//		EXTEND
// PORT: Fixed ROM slots 8257.
                        if slot <> 8257 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8258 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:161
//		BZF	T4JUMP		# NO CHANGE
// PORT: Fixed ROM slots 8258.
                        if slot <> 8258 or instruction <> 5198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5198, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:162
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:163
//		LXCH	IMODES33
// PORT: Fixed ROM slots 8259.
                        if slot <> 8259 or instruction <> 9937 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 721, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8263 {
                if slot <= 8261 {
                    if slot <= 8260 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:164
//		EXTEND
// PORT: Fixed ROM slots 8260.
                        if slot <> 8260 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:165
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8261.
                        if slot <> 8261 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8262 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:166
//		TS	IMODES33	# UPDATE IMODES33
// PORT: Fixed ROM slots 8262.
                        if slot <> 8262 or instruction <> 23249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23249, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:167
//		MASK	BIT14
// PORT: Fixed ROM slots 8263.
                        if slot <> 8263 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 8265 {
                    if slot <= 8264 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:168
//		CCS	A
// PORT: Fixed ROM slots 8264.
                        if slot <> 8264 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:169
//		TCF	T4JUMP		# WAS ON -- NOW OFF
// PORT: Fixed ROM slots 8265.
                        if slot <> 8265 or instruction <> 5198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5198, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8266 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:170
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:171
//		CAF	CHRPRIO		# WAS OFF -- NOW ON
// PORT: Fixed ROM slots 8266.
                        if slot <> 8266 or instruction <> 14585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:172
//		TC	NOVAC
// PORT: Fixed ROM slots 8267.
                        if slot <> 8267 or instruction <> 2652 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[469] to agcAotUnit469@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:173
//		EBANK=	DSPCOUNT
// PORT: SOURCE T4RUPT_PROGRAM.agc:174
//		2CADR	PROCKEY
// PORT: Fixed ROM slots 8268 8269.
    8268, 3550, 8269, 49282
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8270–8270.
function agcAotUnit470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE T4RUPT_PROGRAM.agc:175
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:176
//# Page 137
// PORT: SOURCE T4RUPT_PROGRAM.agc:177
//# JUMP TO APPROPRIATE ONCE-PER SECOND (0.96 SEC ACTUALLY) ACTIVITY
// PORT: SOURCE T4RUPT_PROGRAM.agc:178
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:179
//T4JUMP		INDEX	RUPTREG1
// PORT: Fixed ROM slots 8270.
    if slot <> 8270 or instruction <> 20536 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[470] to agcAotUnit470@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:180
//		TCF	+1
// PORT: Fixed ROM slots 8271.
    8271, 10400
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8272–8280.
function agcAotUnit471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8275 {
        if slot <= 8273 {
            if slot <= 8272 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:181
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:182
//		TCF	OPTTEST
// PORT: Fixed ROM slots 8272.
                if slot <> 8272 or instruction <> 5208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:183
//		TCF	OPTMON
// PORT: Fixed ROM slots 8273.
                if slot <> 8273 or instruction <> 5621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5621, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8274 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:184
//		TCF	IMUMON
// PORT: Fixed ROM slots 8274.
                if slot <> 8274 or instruction <> 5244 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5244, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:185
//		TCF	RESUME
// PORT: Fixed ROM slots 8275.
                if slot <> 8275 or instruction <> 6875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8277 {
            if slot <= 8276 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:186
//		TCF	OPTTEST
// PORT: Fixed ROM slots 8276.
                if slot <> 8276 or instruction <> 5208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:187
//		TCF	OPTMON
// PORT: Fixed ROM slots 8277.
                if slot <> 8277 or instruction <> 5621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5621, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8278 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:188
//		TCF	IMUMON
// PORT: Fixed ROM slots 8278.
                if slot <> 8278 or instruction <> 5244 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5244, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8279 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:189
//		TCF	RESUME
// PORT: Fixed ROM slots 8279.
                    if slot <> 8279 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:190
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:191
//OPTTEST		TC	IBNKCALL
// PORT: Fixed ROM slots 8280.
                    if slot <> 8280 or instruction <> 2528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[471] to agcAotUnit471@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:192
//		CADR	OPTDRIVE
// PORT: Fixed ROM slots 8281.
    8281, 16384
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8282–8307.
function agcAotUnit472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8294 {
        if slot <= 8287 {
            if slot <= 8284 {
                if slot <= 8282 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:193
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:194
//20MRUPT		=	OCT37776	# (DEC 16382)
// PORT: SOURCE T4RUPT_PROGRAM.agc:195
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:196
//NODSPOUT	EXTEND			# TURN OFF RELAYS
// PORT: Fixed ROM slots 8282.
                    if slot <> 8282 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8283 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:197
//		WRITE	OUT0
// PORT: Fixed ROM slots 8283.
                        if slot <> 8283 or instruction <> 520 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:198
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:199
//		CAF	120MRUPT	# SET FOR NEXT CDRVE
// PORT: Fixed ROM slots 8284.
                        if slot <> 8284 or instruction <> 13345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1057), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8285 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:200
//		TCF	SETTIME4
// PORT: Fixed ROM slots 8285.
                    if slot <> 8285 or instruction <> 5180 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5180, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8286 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:201
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:202
//QUIKDSP		CAF	BIT14
// PORT: Fixed ROM slots 8286.
                        if slot <> 8286 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:203
//		MASK	DSRUPTSW
// PORT: Fixed ROM slots 8287.
                        if slot <> 8287 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8290 {
                if slot <= 8288 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:204
//		EXTEND
// PORT: Fixed ROM slots 8288.
                    if slot <> 8288 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8289 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:205
//		BZF	QUIKOFF		# WROTE LAST TIME, NOW TURN OFF RELAYS.
// PORT: Fixed ROM slots 8289.
                        if slot <> 8289 or instruction <> 5239 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5239, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:206
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:207
//		CCS	NOUT
// PORT: Fixed ROM slots 8290.
                        if slot <> 8290 or instruction <> 4622 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 526).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8292 {
                    if slot <= 8291 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:208
//		TC	DSPOUTSB
// PORT: Fixed ROM slots 8291.
                        if slot <> 8291 or instruction <> 1044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:209
//		TCF	NODSPY		# NOUT=0 OR BAD RETURN FROM DSPOUTSB
// PORT: Fixed ROM slots 8292.
                        if slot <> 8292 or instruction <> 5228 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5228, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8293 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:210
//		CS	BIT14		# GOOD RETURN (WE DISPLAYED SOMETHING)
// PORT: Fixed ROM slots 8293.
                        if slot <> 8293 or instruction <> 18946 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:211
//QUIKRUPT	ADS	DSRUPTSW
// PORT: Fixed ROM slots 8294.
                        if slot <> 8294 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8300 {
            if slot <= 8297 {
                if slot <= 8295 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:212
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:213
//		CAF	20MRUPT
// PORT: Fixed ROM slots 8295.
                    if slot <> 8295 or instruction <> 16320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8296 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:214
//		TS	TIME4
// PORT: Fixed ROM slots 8296.
                        if slot <> 8296 or instruction <> 22551 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22551, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:215
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:216
//		CAF	BIT9
// PORT: Fixed ROM slots 8297.
                        if slot <> 8297 or instruction <> 14855 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8298 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:217
//		ADS	DSRUPTSW
// PORT: Fixed ROM slots 8298.
                    if slot <> 8298 or instruction <> 11970 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8299 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:218
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:219
//		TC	RESUME
// PORT: Fixed ROM slots 8299.
                        if slot <> 8299 or instruction <> 2779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:220
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:221
//NODSPY		EXTEND
// PORT: Fixed ROM slots 8300.
                        if slot <> 8300 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8303 {
                if slot <= 8301 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:222
//		WRITE	OUT0
// PORT: Fixed ROM slots 8301.
                    if slot <> 8301 or instruction <> 520 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8302 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:223
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:224
//SYNCT4		CAF	20MRUPT
// PORT: Fixed ROM slots 8302.
                        if slot <> 8302 or instruction <> 16320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:225
//		ADS	TIME4
// PORT: Fixed ROM slots 8303.
                        if slot <> 8303 or instruction <> 11287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 23).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8305 {
                    if slot <= 8304 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:226
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:227
//		CAF	BIT9
// PORT: Fixed ROM slots 8304.
                        if slot <> 8304 or instruction <> 14855 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:228
//# Page 138
// PORT: SOURCE T4RUPT_PROGRAM.agc:229
//		ADS	DSRUPTSW
// PORT: Fixed ROM slots 8305.
                        if slot <> 8305 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8306 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:230
//		CCS	DSRUPTSW
// PORT: Fixed ROM slots 8306.
                        if slot <> 8306 or instruction <> 4802 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:231
//		TC	RESUME
// PORT: Fixed ROM slots 8307.
                        if slot <> 8307 or instruction <> 2779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[472] to agcAotUnit472@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:232
//OCT37737	OCT	37737
// PORT: Fixed ROM slots 8308.
    8308, 32702
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8309–8314.
function agcAotUnit473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8311 {
        if slot <= 8309 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:233
//		TC	SYNCT4
// PORT: Fixed ROM slots 8309.
            if slot <> 8309 or instruction <> 1134 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1134, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8310 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:234
//		TC	RESUME
// PORT: Fixed ROM slots 8310.
                if slot <> 8310 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:235
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:236
//QUIKOFF		EXTEND
// PORT: Fixed ROM slots 8311.
                if slot <> 8311 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8312 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:237
//		WRITE	OUT0
// PORT: Fixed ROM slots 8312.
            if slot <> 8312 or instruction <> 520 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8313 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:238
//		CAF	BIT14		# RESET DSRUPTSW TO SEND DISPLAY NEXT PASS
// PORT: Fixed ROM slots 8313.
                if slot <> 8313 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:239
//		TCF	QUIKRUPT
// PORT: Fixed ROM slots 8314.
                if slot <> 8314 or instruction <> 5222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[473] to agcAotUnit473@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:240
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:241
//11,14,9		OCT	22400
// PORT: Fixed ROM slots 8315.
    8315, 18944
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8316–8330.
function agcAotUnit474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8322 {
        if slot <= 8318 {
            if slot <= 8316 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:242
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:243
//# Page 139
// PORT: SOURCE T4RUPT_PROGRAM.agc:244
//# PROGRAM NAME:  IMUMON
// PORT: SOURCE T4RUPT_PROGRAM.agc:245
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:246
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS ENTERED EVERY 480 MS.  IT DETECTS CHANGES OF THE IMU STATUS BITS IN
// PORT: SOURCE T4RUPT_PROGRAM.agc:247
//# CHANNEL 30 AND CALLS THE APPROPRIATE SUBROUTINES.  THE BITS PROCESSED AND THEIR RELEVANT SUBROUTINES ARE:
// PORT: SOURCE T4RUPT_PROGRAM.agc:248
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:249
//#	FUNCTION		BIT	SUBROUTINE CALLED
// PORT: SOURCE T4RUPT_PROGRAM.agc:250
//#	--------		---	-----------------
// PORT: SOURCE T4RUPT_PROGRAM.agc:251
//#	TEMP IN LIMITS		 15	TLIM
// PORT: SOURCE T4RUPT_PROGRAM.agc:252
//#	ISS TURN-ON REQUEST	 14	ITURNON
// PORT: SOURCE T4RUPT_PROGRAM.agc:253
//#	IMU FAIL		 13	IMUFAIL (SETISSW)
// PORT: SOURCE T4RUPT_PROGRAM.agc:254
//#	IMU CDU FAIL		 12	ICDUFAIL (SETISSW)
// PORT: SOURCE T4RUPT_PROGRAM.agc:255
//#	IMU CAGE		 11	IMUCAGE
// PORT: SOURCE T4RUPT_PROGRAM.agc:256
//#	IMU OPERATE		  9	IMUOP
// PORT: SOURCE T4RUPT_PROGRAM.agc:257
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:258
//# THE LAST SAMPLED STATE OF THESE BITS IS LEFT IN IMODES30.  ALSO, EACH SUBROUTINE CALLED FINDS THE NEW
// PORT: SOURCE T4RUPT_PROGRAM.agc:259
//# VALUE OF THE BIT IN A, WITH Q SET TO THE PROPER RETURN LOCATION NXTIFAIL.
// PORT: SOURCE T4RUPT_PROGRAM.agc:260
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:261
//# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:262
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:263
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:264
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:265
//# SUBROUTINES CALLED:  TLIM, ITURNON, SETISSW, IMUCAGE, IMUOP.
// PORT: SOURCE T4RUPT_PROGRAM.agc:266
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:267
//# ERASABLE INITIALIZATION:
// PORT: SOURCE T4RUPT_PROGRAM.agc:268
//#	FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C(IMODES30) = OCT 37411.
// PORT: SOURCE T4RUPT_PROGRAM.agc:269
//#	RESTART WITH ACTIVE GROUPS:	C(IMODES30) = (B(IMODES30)AND(OCT 00035)) PLUS OCT 37400.
// PORT: SOURCE T4RUPT_PROGRAM.agc:270
//#					THIS LEAVES IMU FAIL BITS INTACT.
// PORT: SOURCE T4RUPT_PROGRAM.agc:271
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:272
//# ALARMS:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:273
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:274
//# EXIT:  TNONTEST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:275
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:276
//# OUTPUT:  UPDATED IMODES30 WITH CHANGES PROCESSED BY APPROPRIATE SUBROUTINE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:277
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:278
//IMUMON		CA	IMODES30	# SEE IF THERE HAS BEEN A CHANGE IN THE
// PORT: Fixed ROM slots 8316.
                if slot <> 8316 or instruction <> 13008 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 720).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8317 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:279
//		EXTEND			# RELEVANT BITS OF CHAN 30.
// PORT: Fixed ROM slots 8317.
                    if slot <> 8317 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:280
//		RXOR	CHAN30		# CHECK IF BITS 9,11-15 CHANGED
// PORT: Fixed ROM slots 8318.
                    if slot <> 8318 or instruction <> 3096 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 24, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8320 {
                if slot <= 8319 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:281
//		MASK	30RDMSK
// PORT: Fixed ROM slots 8319.
                    if slot <> 8319 or instruction <> 30179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1507), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:282
//		EXTEND
// PORT: Fixed ROM slots 8320.
                    if slot <> 8320 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8321 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:283
//		BZF	TNONTEST	# NO CHANGE IN STATUS
// PORT: Fixed ROM slots 8321.
                    if slot <> 8321 or instruction <> 5273 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5273, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:284
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:285
//		TS	RUPTREG1	# SAVE BITS WHICH HAVE CHANGED.
// PORT: Fixed ROM slots 8322.
                    if slot <> 8322 or instruction <> 22584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22584, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8326 {
            if slot <= 8324 {
                if slot <= 8323 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:286
//		LXCH	IMODES30	# UPDATE IMODES30.
// PORT: Fixed ROM slots 8323.
                    if slot <> 8323 or instruction <> 9936 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 720, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:287
//		EXTEND
// PORT: Fixed ROM slots 8324.
                    if slot <> 8324 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8325 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:288
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8325.
                    if slot <> 8325 or instruction <> 3073 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:289
//		TS	IMODES30
// PORT: Fixed ROM slots 8326.
                    if slot <> 8326 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8328 {
                if slot <= 8327 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:290
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:291
//		CS	ONE
// PORT: Fixed ROM slots 8327.
                    if slot <> 8327 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:292
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 8328.
                    if slot <> 8328 or instruction <> 23608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 56, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8329 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:293
//		EXTEND
// PORT: Fixed ROM slots 8329.
                    if slot <> 8329 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:294
//# Page 140
// PORT: SOURCE T4RUPT_PROGRAM.agc:295
//		BZMF	TLIM		# CHANGE IN IMU TEMP.
// PORT: Fixed ROM slots 8330.
                    if slot <> 8330 or instruction <> 25927 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25927, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[474] to agcAotUnit474@.

// PORT: Physical bank 06. Shared continuation entries, slots 8331–8338.
function agcAotUnit475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8334 {
        if slot <= 8332 {
            if slot <= 8331 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:296
//		TCF	NXTIFBIT	# BEGIN BIT SCAN.
// PORT: Fixed ROM slots 8331.
                if slot <> 8331 or instruction <> 5261 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5261, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:297
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:298
// 	-1	AD	ONE		# (RE-ENTERS HERE FROM NXTIFAIL.)
// PORT: Fixed ROM slots 8332.
                if slot <> 8332 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
            if slot <= 8333 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:299
//NXTIFBIT	INCR	RUPTREG1	# ADVANCE BIT POSITION NUMBER.
// PORT: Fixed ROM slots 8333.
                if slot <> 8333 or instruction <> 10296 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:300
// 	+1	DOUBLE
// PORT: Fixed ROM slots 8334.
                if slot <> 8334 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
        if slot <= 8336 {
            if slot <= 8335 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:301
// 		TS	A		# SKIP IF OVERFLOW.
// PORT: Fixed ROM slots 8335.
                if slot <> 8335 or instruction <> 22528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:302
//		TCF	NXTIFBIT	# LOOK FOR BIT.
// PORT: Fixed ROM slots 8336.
                if slot <> 8336 or instruction <> 5261 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5261, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8337 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:303
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:304
//		XCH	RUPTREG2	# SAVE OVERFLOW-CORRECTED DATA.
// PORT: Fixed ROM slots 8337.
                if slot <> 8337 or instruction <> 23609 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 57, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:305
//		INDEX	RUPTREG1	# SELECT NEW VALUE OF THIS BIT.
// PORT: Fixed ROM slots 8338.
                if slot <> 8338 or instruction <> 20536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20536, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[475] to agcAotUnit475@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:306
//		CAF	BIT14
// PORT: Fixed ROM slots 8339.
    8339, 29700
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8340–8341.
function agcAotUnit476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8340 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:307
//		MASK	IMODES30
// PORT: Fixed ROM slots 8340.
        if slot <> 8340 or instruction <> 29392 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 720).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:308
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 8341.
        if slot <> 8341 or instruction <> 20536 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[476] to agcAotUnit476@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:309
//		TC	IFAILJMP
// PORT: Fixed ROM slots 8342.
    8342, 3006
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8343–8366.
function agcAotUnit477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8354 {
        if slot <= 8348 {
            if slot <= 8345 {
                if slot <= 8343 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:310
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:311
//NXTIFAIL	CCS	RUPTREG2	# PROCESS ANY ADDITIONAL CHANGES.
// PORT: Fixed ROM slots 8343.
                    if slot <> 8343 or instruction <> 4153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 57).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8344 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:312
//		TCF	NXTIFBIT -1
// PORT: Fixed ROM slots 8344.
                        if slot <> 8344 or instruction <> 5260 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5260, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:313
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:314
//# Page 141
// PORT: SOURCE T4RUPT_PROGRAM.agc:315
//# PROGRAM NAME:  TNONTEST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:316
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:317
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM HONORS REQUESTS FOR ISS INITIALIZATION.  ISS TURN-ON (CHANNEL 30 BIT 14)
// PORT: SOURCE T4RUPT_PROGRAM.agc:318
//# AND ISS OPERATE (CHANNEL 30 BIT 9) REQUESTS ARE TREATED AS A PAIR AND PROCESSING TAKES PLACE .480 SECONDS
// PORT: SOURCE T4RUPT_PROGRAM.agc:319
//# AFTER EITHER ONE APPEARS.  THIS INITIALIZATION TAKES ON ONE OF THE FOLLOWING THREE FORMS:
// PORT: SOURCE T4RUPT_PROGRAM.agc:320
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:321
//#	1) ISS TURN-ON:  IN THIS SITUATION THE COMPUTER IS OPERATING WHEN THE ISS IS TURNED ON.  NOMINALLY,
// PORT: SOURCE T4RUPT_PROGRAM.agc:322
//#	BOTH ISS TURN-ON AND ISS OPERATE APPEAR.  THE PLATFORM IS CAGED FOR 90 SECONDS AND THE ICDU'S ZEROED
// PORT: SOURCE T4RUPT_PROGRAM.agc:323
//#	SO THAT AT THE END OF THE PROCESS THE GIMBAL LOCK MONITOR WILL FUNCTION PROPERLY.
// PORT: SOURCE T4RUPT_PROGRAM.agc:324
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:325
//#	2) ICDU INITIALIZATION:  IN THIS CASE THE COMPUTER WAS PROBABLY TURNED ON WITH THE ISS IN OPERATE OR
// PORT: SOURCE T4RUPT_PROGRAM.agc:326
//#	A FRESH START WAS DONE WIT THE ISS IN OPERATE.  IN THIS CASE ONLY ISS OPERATE IS ON.  THE ICDU'S ARE
// PORT: SOURCE T4RUPT_PROGRAM.agc:327
//#	ZEROED SO THE GIMBAL LOCK MONITOR WILL FUNCTION.  AN EXCEPTION IS IF THE ISS IS IN GIMBAL LOCK AFTER
// PORT: SOURCE T4RUPT_PROGRAM.agc:328
//#	A RESTART, THE ICDU'S WILL NOT BE ZEROED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:329
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:330
//#	3) RESTART WITH RESTARTABLE PROGRAM USING THE IMU:  IN THIS CASE, NO INITIALIZATION TAKES PLACE SINCE
// PORT: SOURCE T4RUPT_PROGRAM.agc:331
//#	IT IS ASSUMED THAT THE USING PROGRAM DID THE INITIALIZATION AND THEREFORE T4RUPT SHOULD NOT INTERFERE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:332
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:333
//# IMODES30 BIT 7 IS SET = 1 BY THE FIRST BIT (CHANNEL 30 BIT 14 OR 9) WHICH ARRIVES.  FOLLOWING THIS, TNONTEST IS
// PORT: SOURCE T4RUPT_PROGRAM.agc:334
//# ENTERED, FINDS BIT 7 = 1 BUT BIT 8 = 0, SO IT SETS BIT 8 = 1 AND EXITS.  THE NEXT TIME IT FINDS BIT 8 = 1 AND
// PORT: SOURCE T4RUPT_PROGRAM.agc:335
//# PROCEEDS, SETTING BITS 8 AND 7 = 0.  AT PROCTNON, IF ISS TURN-ON REQUEST IS PRESENT, THE ISS IS CAGED (ZERO +
// PORT: SOURCE T4RUPT_PROGRAM.agc:336
//# COARSE).  IF ISS OPERATE IS NOT PRESENT PROGRAM ALARM 00213 IS ISSUED.  AT THE END OF A 90 SECOND CAGE, BIT 2
// PORT: SOURCE T4RUPT_PROGRAM.agc:337
//# OF IMODES30 IS TESTED.  IF IT IS = 1, ISS TURN-ON WAS NOT PRESENT FOR THE ENTIRE 90 SECONDS.  IN THAT CASE, IF
// PORT: SOURCE T4RUPT_PROGRAM.agc:338
//# THE ISS TURN-ON REQUEST IS PRESENT THE 90 SECOND WAIT IS REPEATED,  OTHERWISE NO ACTION OCCURS UNLESS A PROGRAM
// PORT: SOURCE T4RUPT_PROGRAM.agc:339
//# WAS WAITING FOR THE INITIALIZATION IN WHICH CASE THE PROGRAM IS GIVEN AN IMUSTALL ERROR RETURN.  IF THE DELAY
// PORT: SOURCE T4RUPT_PROGRAM.agc:340
//# WENT PROPERLY, THE ISS DELAY OUTBIT IS SENT AND THE ICDU'S ZEROED.  A TASK IS INITIATED TO REMOVE THE PIPA FAIL
// PORT: SOURCE T4RUPT_PROGRAM.agc:341
//# INHIBIT BIT IN 10.24 SECONDS.  IF A MISSION PROGRAM WAS WAITING IT IS INFORMED VIA ENDIMU.
// PORT: SOURCE T4RUPT_PROGRAM.agc:342
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:343
//# AT PROCTNON, IF ONLY ISS OPERATE IS PRESENT (OPONLY), THE CDU'S ARE ZEROED UNLESS THE PLATFORM IS IN COARSE
// PORT: SOURCE T4RUPT_PROGRAM.agc:344
//# ALIGN (= GIMBAL LOCK HERE) OR A MISSION PROGRAM IS USING THE IMU (INUSEFLG = 1).
// PORT: SOURCE T4RUPT_PROGRAM.agc:345
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:346
//# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS AFTER IMUMON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:347
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:348
//# JOBS OR TASKS INITIATED:  1) ENDTNON, 90 SECONDS AFTER CAGING STARTED.  2) ISSUP, 4 SECONDS AFTER CAGING DONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:349
//#	3) PFAILOK, 10.24 SECONDS AFTER INITIALIZATION COMPLETED.  4) UNZ2, 320 MILLISECONDS AFTER ZEROING
// PORT: SOURCE T4RUPT_PROGRAM.agc:350
//#	STARTED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:351
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:352
//# SUBROUTINES CALLED: CAGESUB, CAGESUB2, ZEROICDU, ENDIMU, IMUBAD, NOATTOFF, SETISSW, VARDELAY.
// PORT: SOURCE T4RUPT_PROGRAM.agc:353
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:354
//# ERASABLE INITIALIZATION:  SEE IMUMON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:355
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:356
//# ALARMS:  PROGRAM ALARM 00213 IF ISS TURN-ON REQUESTED WITHOUT ISS OPERATE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:357
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:358
//# EXIT:  ENDTNON EXITS TO C33TEST.  TASKS HAVING TO DO WITH INITIALIZATION EXIT AS FOLLOWS:  MISSION PROGRAM
// PORT: SOURCE T4RUPT_PROGRAM.agc:359
//# WAITING AND INITIALIZATION COMPLETE, EXIT TO ENDIMU, MISSION PROGRAM WAITING AND INITIALIZATION FAILED, EXIT TO
// PORT: SOURCE T4RUPT_PROGRAM.agc:360
//# IMUBAD, IMU NOT IN USE, EXIT TO TASKOVER.
// PORT: SOURCE T4RUPT_PROGRAM.agc:361
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:362
//# OUTPUT:  ISS INITIALIZED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:363
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:364
//TNONTEST		CS	IMODES30	# AFTER PROCESSING ALL CHANGES, SEE IF IT
// PORT: Fixed ROM slots 8345.
                        if slot <> 8345 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8346 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:365
//# Page 142
// PORT: SOURCE T4RUPT_PROGRAM.agc:366
//			MASK	BIT7		# IS TIME TO ACT ON A TURN-ON SEQUENCE.
// PORT: Fixed ROM slots 8346.
                    if slot <> 8346 or instruction <> 31241 { return choose false if checkOnly else -1. }
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
                    if slot <= 8347 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:367
//			CCS	A
// PORT: Fixed ROM slots 8347.
                        if slot <> 8347 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:368
//			TCF	C33TEST		# NO -- EXAMINE CHANNEL 33.
// PORT: Fixed ROM slots 8348.
                        if slot <> 8348 or instruction <> 5367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5367, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8351 {
                if slot <= 8349 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:369
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:370
//			CAF	BIT8		# SEE IF FIRST SAMPLE OR SECOND.
// PORT: Fixed ROM slots 8349.
                    if slot <> 8349 or instruction <> 14856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8350 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:371
//			MASK	IMODES30
// PORT: Fixed ROM slots 8350.
                        if slot <> 8350 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:372
//			CCS	A
// PORT: Fixed ROM slots 8351.
                        if slot <> 8351 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 8352 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:373
//			TCF	PROCTNON	# REACT AFTER A SECOND SAMPLE.
// PORT: Fixed ROM slots 8352.
                    if slot <> 8352 or instruction <> 5284 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5284, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8353 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:374
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:375
//			CAF	BIT8		# IF FIRST SAMPLE, SET BIT TO REACT NEXT
// PORT: Fixed ROM slots 8353.
                        if slot <> 8353 or instruction <> 14856 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:376
//			ADS	IMODES30	# TIME.
// PORT: Fixed ROM slots 8354.
                        if slot <> 8354 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8360 {
            if slot <= 8357 {
                if slot <= 8355 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:377
//			TCF	C33TEST
// PORT: Fixed ROM slots 8355.
                    if slot <> 8355 or instruction <> 5367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8356 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:378
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:379
//# PROCESS IMU TURN-ON REQUESTS AFTER WAITING 1 SAMPLE FOR ALL SIGNALS TO ARRIVE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:380
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:381
//PROCTNON		CS	BITS7&8
// PORT: Fixed ROM slots 8356.
                        if slot <> 8356 or instruction <> 17903 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1519), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:382
//			MASK	IMODES30
// PORT: Fixed ROM slots 8357.
                        if slot <> 8357 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8358 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:383
//			TS	IMODES30
// PORT: Fixed ROM slots 8358.
                    if slot <> 8358 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8359 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:384
//			MASK	BIT14		# SEE IF TURN-ON REQUEST.
// PORT: Fixed ROM slots 8359.
                        if slot <> 8359 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:385
//			CCS	A
// PORT: Fixed ROM slots 8360.
                        if slot <> 8360 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8363 {
                if slot <= 8361 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:386
//			TCF	OPONLY		# OPERATE ON ONLY.
// PORT: Fixed ROM slots 8361.
                    if slot <> 8361 or instruction <> 5346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5346, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8362 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:387
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:388
//			CS	IMODES30	# IF TURN-ON REQUEST, WE SHOULD HAVE IMU
// PORT: Fixed ROM slots 8362.
                        if slot <> 8362 or instruction <> 17104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 720).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:389
//			MASK	BIT9		# OPERATE.
// PORT: Fixed ROM slots 8363.
                        if slot <> 8363 or instruction <> 31239 { return choose false if checkOnly else -1. }
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
                    }
                }
            } else {
                if slot <= 8364 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:390
//			CCS	A
// PORT: Fixed ROM slots 8364.
                    if slot <> 8364 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8365 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:391
//			TCF	+3
// PORT: Fixed ROM slots 8365.
                        if slot <> 8365 or instruction <> 5296 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5296, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:392
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:393
//			TC	ALARM		# ALARM IF NOT
// PORT: Fixed ROM slots 8366.
                        if slot <> 8366 or instruction <> 2984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[477] to agcAotUnit477@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:394
//			OCT	213
// PORT: Fixed ROM slots 8367.
    8367, 278
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8368–8370.
function agcAotUnit478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8368 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:395
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:396
// 	+3		TC	CAGESUB
// PORT: Fixed ROM slots 8368.
        if slot <> 8368 or instruction <> 1487 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1487, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8369 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:397
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:398
// 			CAF	90SECS
// PORT: Fixed ROM slots 8369.
            if slot <> 8369 or instruction <> 13812 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1524), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:399
//			TC	WAITLIST
// PORT: Fixed ROM slots 8370.
            if slot <> 8370 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[478] to agcAotUnit478@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:400
//			EBANK=	CDUIND
// PORT: SOURCE T4RUPT_PROGRAM.agc:401
//			2CADR	ENDTNON
// PORT: Fixed ROM slots 8371 8372.
    8371, 2416, 8372, 12390
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8373–8390.
function agcAotUnit479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8381 {
        if slot <= 8376 {
            if slot <= 8374 {
                if slot <= 8373 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:402
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:403
//			TCF	C33TEST
// PORT: Fixed ROM slots 8373.
                    if slot <> 8373 or instruction <> 5367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:404
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:405
//RETNON			CAF	90SECS
// PORT: Fixed ROM slots 8374.
                    if slot <> 8374 or instruction <> 13812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1524), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8375 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:406
//			TC	VARDELAY
// PORT: Fixed ROM slots 8375.
                    if slot <> 8375 or instruction <> 2746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:407
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:408
//ENDTNON			CS	BIT2		# RESET TURN-ON REQUEST FAIL BIT.
// PORT: Fixed ROM slots 8376.
                    if slot <> 8376 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8378 {
                if slot <= 8377 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:409
//			MASK	IMODES30
// PORT: Fixed ROM slots 8377.
                    if slot <> 8377 or instruction <> 29392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:410
//			XCH	IMODES30
// PORT: Fixed ROM slots 8378.
                    if slot <> 8378 or instruction <> 24272 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 720, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8379 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:411
//			MASK	BIT2		# IF IT WAS OFF, SEND ISS DELAY COMPLETE.
// PORT: Fixed ROM slots 8379.
                    if slot <> 8379 or instruction <> 31246 { return choose false if checkOnly else -1. }
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
                    if slot <= 8380 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:412
//			EXTEND
// PORT: Fixed ROM slots 8380.
                        if slot <> 8380 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:413
//			BZF	ENDTNON2
// PORT: Fixed ROM slots 8381.
                        if slot <> 8381 or instruction <> 5320 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5320, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8385 {
            if slot <= 8383 {
                if slot <= 8382 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:414
//# Page 143
// PORT: SOURCE T4RUPT_PROGRAM.agc:415
//			CAF	BIT14		# IF IT WAS ON AND TURN-ON REQUEST NOW.
// PORT: Fixed ROM slots 8382.
                    if slot <> 8382 or instruction <> 14850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:416
//			MASK	IMODES30	# PRESENT, RE-ENTER 90 SEC DELAY IN WL.
// PORT: Fixed ROM slots 8383.
                    if slot <> 8383 or instruction <> 29392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8384 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:417
//			EXTEND
// PORT: Fixed ROM slots 8384.
                    if slot <> 8384 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:418
//			BZF	RETNON
// PORT: Fixed ROM slots 8385.
                    if slot <> 8385 or instruction <> 5302 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5302, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8387 {
                if slot <= 8386 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:419
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:420
//			CS	STATE		# IF IT IS NOT ON NOW, SEE IF A PROG WAS
// PORT: Fixed ROM slots 8386.
                    if slot <> 8386 or instruction <> 16444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 60).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:421
//			MASK	IMUSEFLG	# WAITING.
// PORT: Fixed ROM slots 8387.
                    if slot <> 8387 or instruction <> 31240 { return choose false if checkOnly else -1. }
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
                if slot <= 8388 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:422
//			CCS	A
// PORT: Fixed ROM slots 8388.
                    if slot <> 8388 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8389 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:423
//			TCF	TASKOVER
// PORT: Fixed ROM slots 8389.
                        if slot <> 8389 or instruction <> 6868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6868, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:424
//			TC	POSTJUMP
// PORT: Fixed ROM slots 8390.
                        if slot <> 8390 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[479] to agcAotUnit479@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:425
//			CADR	IMUBAD		# UNSUCCESSFUL TURN-ON.
// PORT: Fixed ROM slots 8391.
    8391, 16036
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8392–8395.
function agcAotUnit480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8393 {
        if slot <= 8392 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:426
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:427
//ENDTNON2		CAF	BIT15		# SEND ISS DELAY COMPLETE.
// PORT: Fixed ROM slots 8392.
            if slot <> 8392 or instruction <> 14849 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:428
//			EXTEND
// PORT: Fixed ROM slots 8393.
            if slot <> 8393 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8394 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:429
//			WOR	CHAN12		# TURN OFF ISS DELAY COUNTER
// PORT: Fixed ROM slots 8394.
            if slot <> 8394 or instruction <> 2570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:430
//			TC 	IBNKCALL	# TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 8395.
            if slot <> 8395 or instruction <> 2528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[480] to agcAotUnit480@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:431
//			CADR	NOATTOFF
// PORT: Fixed ROM slots 8396.
    8396, 15570
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8397–8414.
function agcAotUnit481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8405 {
        if slot <= 8400 {
            if slot <= 8398 {
                if slot <= 8397 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:432
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:433
//UNZ2			TC	ZEROICDU
// PORT: Fixed ROM slots 8397.
                    if slot <> 8397 or instruction <> 2897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2897, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:434
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:435
//			CS	BITS4&5		# REMOVE ZERO AND COARSE.
// PORT: Fixed ROM slots 8398.
                    if slot <> 8398 or instruction <> 18967 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8399 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:436
//			EXTEND
// PORT: Fixed ROM slots 8399.
                    if slot <> 8399 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:437
//			WAND	CHAN12
// PORT: Fixed ROM slots 8400.
                    if slot <> 8400 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8402 {
                if slot <= 8401 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:438
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:439
//			CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
// PORT: Fixed ROM slots 8401.
                    if slot <> 8401 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:440
//			TC	VARDELAY
// PORT: Fixed ROM slots 8402.
                    if slot <> 8402 or instruction <> 2746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8403 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:441
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:442
//ISSUP			CS	OCT54		# REMOVE CAGING, IMU FAIL INHIBIT, AND
// PORT: Fixed ROM slots 8403.
                    if slot <> 8403 or instruction <> 17900 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1516), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8404 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:443
//			MASK	IMODES30	# ICDUFAIL INHIBIT FLAGS.
// PORT: Fixed ROM slots 8404.
                        if slot <> 8404 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:444
//			TS	IMODES30
// PORT: Fixed ROM slots 8405.
                        if slot <> 8405 or instruction <> 23248 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23248, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8409 {
            if slot <= 8407 {
                if slot <= 8406 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:445
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:446
//			CS	BIT6		# ENABLE DAP
// PORT: Fixed ROM slots 8406.
                    if slot <> 8406 or instruction <> 18954 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:447
//			MASK	IMODES33
// PORT: Fixed ROM slots 8407.
                    if slot <> 8407 or instruction <> 29393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8408 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:448
//			TS	IMODES33
// PORT: Fixed ROM slots 8408.
                    if slot <> 8408 or instruction <> 23249 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23249, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:449
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:450
//			TC	SETISSW		# ISS WARNING MIGHT HAVE BEEN INHIBITED.
// PORT: Fixed ROM slots 8409.
                    if slot <> 8409 or instruction <> 1461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8411 {
                if slot <= 8410 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:451
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:452
//			CS	BIT15		# REMOVE IMU DELAY COMPLETE DISCRETE.
// PORT: Fixed ROM slots 8410.
                    if slot <> 8410 or instruction <> 18945 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:453
//			EXTEND
// PORT: Fixed ROM slots 8411.
                    if slot <> 8411 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8412 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:454
//			WAND	CHAN12
// PORT: Fixed ROM slots 8412.
                    if slot <> 8412 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8413 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:455
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:456
//			CAF	4SECS		# DONT ENABLE PROG ALARM ON PIP FAIL FOR
// PORT: Fixed ROM slots 8413.
                        if slot <> 8413 or instruction <> 14885 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2597), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:457
//			TC	WAITLIST	# ANOTHER 4 SECS.
// PORT: Fixed ROM slots 8414.
                        if slot <> 8414 or instruction <> 2725 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[481] to agcAotUnit481@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:458
//			EBANK=	CDUIND
// PORT: SOURCE T4RUPT_PROGRAM.agc:459
//			2CADR	PFAILOK
// PORT: Fixed ROM slots 8415 8416.
    8415, 3262, 8416, 14438
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8417–8428.
function agcAotUnit482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8422 {
        if slot <= 8419 {
            if slot <= 8417 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:460
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:461
//			TCF	TASKOVER
// PORT: Fixed ROM slots 8417.
                if slot <> 8417 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8418 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:462
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:463
//OPONLY			CAF	BIT4
// PORT: Fixed ROM slots 8418.
                    if slot <> 8418 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:464
//# Page 144
// PORT: SOURCE T4RUPT_PROGRAM.agc:465
//			EXTEND			# IF OPERATE ON ONLY AND WE ARE IN COARSE
// PORT: Fixed ROM slots 8419.
                    if slot <> 8419 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8420 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:466
//			RAND	CHAN12		# ALIGN, DON'T ZERO THE CDUS BECAUSE WE
// PORT: Fixed ROM slots 8420.
                if slot <> 8420 or instruction <> 1034 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8421 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:467
//			CCS	A		# MIGHT BE IN GIMBAL LOCK. USE V41N20 TO
// PORT: Fixed ROM slots 8421.
                    if slot <> 8421 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:468
//			TCF	C33TEST		# RECOVER.
// PORT: Fixed ROM slots 8422.
                    if slot <> 8422 or instruction <> 5367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8425 {
            if slot <= 8423 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:469
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:470
//			CAF	IMUSEFLG	# OTHERWISE, ZERO THE COUNTERS
// PORT: Fixed ROM slots 8423.
                if slot <> 8423 or instruction <> 14856 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8424 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:471
//			MASK	STATE		# UNLESS SOMEONE IS USING THE IMU.
// PORT: Fixed ROM slots 8424.
                    if slot <> 8424 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:472
//			CCS	A
// PORT: Fixed ROM slots 8425.
                    if slot <> 8425 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 8426 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:473
//			TCF	C33TEST
// PORT: Fixed ROM slots 8426.
                if slot <> 8426 or instruction <> 5367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5367, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8427 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:474
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:475
//			TC	CAGESUB2	# SET TURNON FLAGS.
// PORT: Fixed ROM slots 8427.
                    if slot <> 8427 or instruction <> 1496 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1496, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:476
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:477
//ISSZERO			TC	IBNKCALL	# TURN OFF NO ATT LAMP.
// PORT: Fixed ROM slots 8428.
                    if slot <> 8428 or instruction <> 2528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[482] to agcAotUnit482@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:478
//			CADR	NOATTOFF	#     IMU CAGE OFF ENTRY.
// PORT: Fixed ROM slots 8429.
    8429, 15570
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8430–8435.
function agcAotUnit483 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8432 {
        if slot <= 8430 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:479
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:480
//			CAF	BIT5		# ISS CDU ZERO
// PORT: Fixed ROM slots 8430.
            if slot <> 8430 or instruction <> 14859 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8431 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:481
//			EXTEND
// PORT: Fixed ROM slots 8431.
                if slot <> 8431 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:482
//			WOR	CHAN12
// PORT: Fixed ROM slots 8432.
                if slot <> 8432 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8433 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:483
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:484
//			TC	ZEROICDU
// PORT: Fixed ROM slots 8433.
            if slot <> 8433 or instruction <> 2897 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2897, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8434 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:485
//			CAF	BIT6		# WAIT 300 MS FOR AGS TO RECEIVE SIGNAL.
// PORT: Fixed ROM slots 8434.
                if slot <> 8434 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:486
//			TC	WAITLIST
// PORT: Fixed ROM slots 8435.
                if slot <> 8435 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[483] to agcAotUnit483@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:487
//			EBANK=	OPTMODES
// PORT: SOURCE T4RUPT_PROGRAM.agc:488
//			2CADR	UNZ2
// PORT: Fixed ROM slots 8436 8437.
    8436, 2458, 8437, 12388
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8438–8464.
function agcAotUnit484 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8450 {
        if slot <= 8443 {
            if slot <= 8440 {
                if slot <= 8438 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:489
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:490
//			TCF	C33TEST
// PORT: Fixed ROM slots 8438.
                    if slot <> 8438 or instruction <> 5367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8439 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:491
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:492
//# Page 145
// PORT: SOURCE T4RUPT_PROGRAM.agc:493
//# PROGRAM NAME:  C33TEST
// PORT: SOURCE T4RUPT_PROGRAM.agc:494
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:495
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THREE FLIP-FLOP INBITS OF CHANNEL 33 AND CALLS THE APPROPRIATE
// PORT: SOURCE T4RUPT_PROGRAM.agc:496
//# SUBROUTINE TO PROCESS A CHANGE.  IT IS ANALOGOUS TO IMUMON, WHICH MONITORS CHANNEL 30, EXCEPT THAT IT READS
// PORT: SOURCE T4RUPT_PROGRAM.agc:497
//# CHANNEL 33 WITH A WAND INSTRUCTION BECAUSE A `WRITE' PULSE IS REQUIRED TO RESET THE FLIP-FLOPS.  THE BITS
// PORT: SOURCE T4RUPT_PROGRAM.agc:498
//# PROCESSED AND THE SUBROUTINES CALLED ARE:
// PORT: SOURCE T4RUPT_PROGRAM.agc:499
//#	BIT	FUNCTION		SUBROUTINE
// PORT: SOURCE T4RUPT_PROGRAM.agc:500
//#	---	--------		----------
// PORT: SOURCE T4RUPT_PROGRAM.agc:501
//#	 13	PIPA FAIL		PIPFAIL
// PORT: SOURCE T4RUPT_PROGRAM.agc:502
//#	 12	DOWNLINK TOO FAST	DNTMFAST
// PORT: SOURCE T4RUPT_PROGRAM.agc:503
//#	 11	UPLINK TOO FAST		UPTMFAST
// PORT: SOURCE T4RUPT_PROGRAM.agc:504
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:505
//# UPON ENTRY TO THE SUBROUTINE, THE NEW BIT STATE IS IN A.
// PORT: SOURCE T4RUPT_PROGRAM.agc:506
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:507
//# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER TNONTEST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:508
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:509
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:510
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:511
//# SUBROUTINES CALLED:  PIPFAIL, DNTMFAST AND UPTMFAST ON BIT CHANGES.
// PORT: SOURCE T4RUPT_PROGRAM.agc:512
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:513
//# ERASABLE INITIALIZATION:  C(IMODES33) = OCT 16000 ON A FRESH START OR RESTART, THEREFORE, THESE ALARMS WILL
// PORT: SOURCE T4RUPT_PROGRAM.agc:514
//# REAPPEAR IF THE CONDITIONS PERSIST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:515
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:516
//# ALARMS:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:517
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:518
//# EXIT:  GLOCKMON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:519
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:520
//# OUTPUT:  UPDATED BITS 13, 12, AND 11 OF IMODES33 WITH CHANGES PROCESSED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:521
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:522
//C33TEST		CA	IMODES33		# SEE IF RELEVANT CHAN33 BITS HAVE
// PORT: Fixed ROM slots 8439.
                        if slot <> 8439 or instruction <> 13009 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:523
//		MASK	33RDMSK
// PORT: Fixed ROM slots 8440.
                        if slot <> 8440 or instruction <> 31288 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                            if fixedOperand = 7168 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 8) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8441 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:524
//		TS	L			# CHANGED.
// PORT: Fixed ROM slots 8441.
                    if slot <> 8441 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8442 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:525
//		CAF	33RDMSK
// PORT: Fixed ROM slots 8442.
                        if slot <> 8442 or instruction <> 14904 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:526
//		EXTEND
// PORT: Fixed ROM slots 8443.
                        if slot <> 8443 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8446 {
                if slot <= 8444 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:527
//		WAND	CHAN33			# RESETS FLIP-FLOP INPUTS
// PORT: Fixed ROM slots 8444.
                    if slot <> 8444 or instruction <> 1563 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8445 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:528
//		EXTEND
// PORT: Fixed ROM slots 8445.
                        if slot <> 8445 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:529
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8446.
                        if slot <> 8446 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8448 {
                    if slot <= 8447 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:530
//		EXTEND
// PORT: Fixed ROM slots 8447.
                        if slot <> 8447 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:531
//		BZF	GLOCKMON		# ON NO CHANGE.
// PORT: Fixed ROM slots 8448.
                        if slot <> 8448 or instruction <> 5399 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5399, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8449 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:532
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:533
//		TS	RUPTREG1		# SAVE BITS WHICH HAVE CHANGED
// PORT: Fixed ROM slots 8449.
                        if slot <> 8449 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:534
//		LXCH	IMODES33
// PORT: Fixed ROM slots 8450.
                        if slot <> 8450 or instruction <> 9937 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 721, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8457 {
            if slot <= 8453 {
                if slot <= 8451 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:535
//		EXTEND
// PORT: Fixed ROM slots 8451.
                    if slot <> 8451 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8452 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:536
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8452.
                        if slot <> 8452 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:537
//		TS	IMODES33		# UPDATED IMODES33.
// PORT: Fixed ROM slots 8453.
                        if slot <> 8453 or instruction <> 23249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23249, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8455 {
                    if slot <= 8454 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:538
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:539
//		CAF	ZERO
// PORT: Fixed ROM slots 8454.
                        if slot <> 8454 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:540
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 8455.
                        if slot <> 8455 or instruction <> 23608 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 56, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8456 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:541
//		DOUBLE
// PORT: Fixed ROM slots 8456.
                        if slot <> 8456 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:542
//# Page 146
// PORT: SOURCE T4RUPT_PROGRAM.agc:543
//		TCF	NXTIBT +1		# SCAN FOR BIT CHANGES.
// PORT: Fixed ROM slots 8457.
                        if slot <> 8457 or instruction <> 5388 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5388, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8460 {
                if slot <= 8458 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:544
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:545
// 	-1	AD	ONE
// PORT: Fixed ROM slots 8458.
                    if slot <> 8458 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                    if slot <= 8459 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:546
//NXTIBT		INCR	RUPTREG1
// PORT: Fixed ROM slots 8459.
                        if slot <> 8459 or instruction <> 10296 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:547
// 	+1	DOUBLE
// PORT: Fixed ROM slots 8460.
                        if slot <> 8460 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
                if slot <= 8462 {
                    if slot <= 8461 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:548
// 		TS	A			# (CODING IDENTICAL TO CHAN 30).
// PORT: Fixed ROM slots 8461.
                        if slot <> 8461 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:549
//		TCF	NXTIBT
// PORT: Fixed ROM slots 8462.
                        if slot <> 8462 or instruction <> 5387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8463 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:550
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:551
//		XCH	RUPTREG2
// PORT: Fixed ROM slots 8463.
                        if slot <> 8463 or instruction <> 23609 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 57, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:552
//		INDEX	RUPTREG1		# GET NEW VALUE OF BIT WHICH CHANGED.
// PORT: Fixed ROM slots 8464.
                        if slot <> 8464 or instruction <> 20536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20536, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20536, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[484] to agcAotUnit484@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:553
//		CAF	BIT13
// PORT: Fixed ROM slots 8465.
    8465, 29702
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8466–8467.
function agcAotUnit485 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8466 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:554
//		MASK	IMODES33
// PORT: Fixed ROM slots 8466.
        if slot <> 8466 or instruction <> 29393 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 721).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:555
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 8467.
        if slot <> 8467 or instruction <> 20536 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[485] to agcAotUnit485@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:556
//		TC	C33JMP
// PORT: Fixed ROM slots 8468.
    8468, 3018
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8469–8472.
function agcAotUnit486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8470 {
        if slot <= 8469 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:557
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:558
//NXTFL33		CCS	RUPTREG2		# PROCESS POSSIBLE ADDITIONAL CHANGES.
// PORT: Fixed ROM slots 8469.
            if slot <> 8469 or instruction <> 4153 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 57).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:559
//		TCF	NXTIBT -1
// PORT: Fixed ROM slots 8470.
            if slot <> 8470 or instruction <> 5386 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5386, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8471 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:560
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:561
//# Page 147
// PORT: SOURCE T4RUPT_PROGRAM.agc:562
//# PROGRAM NAME:  GLOCKMON
// PORT: SOURCE T4RUPT_PROGRAM.agc:563
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:564
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THE CDUZ COUNTER TO DETERMINE WHETHER THE ISS IS IN GIMBAL LOCK
// PORT: SOURCE T4RUPT_PROGRAM.agc:565
//# AND TAKES ACTION IF IT IS.  THREE REGIONS OF MIDDLE GIMBAL ANGLE (MGA) ARE USED:
// PORT: SOURCE T4RUPT_PROGRAM.agc:566
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:567
//#	1) ABS(MGA) LESS THAN OR EQUAL TO 70 DEGREES -- NORMAL MODE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:568
//#	2) ABS(MGA) GREATER THAN 70 DEGREES AND LESS THAN OR EQUAL TO 85 DEGREES -- GIMBAL LOCK LAMP TURNED ON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:569
//#	3) ABS(MGA) GREATER THAN 85 DEGREES -- ISS PUT IN COARSE ALIGN AND NO ATT LAMP TURNED ON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:570
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:571
//# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER C33TEST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:572
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:573
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:574
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:575
//# SUBROUTINES CALLED:	1) SETCOARS WHEN ABS(MGA) GREATER THEN 85 DEGREES AND ISS NOT IN COARSE ALIGN.
// PORT: SOURCE T4RUPT_PROGRAM.agc:576
//#			2) LAMPTEST BEFORE TURNING OFF GIMBAL LOCK LAMP.
// PORT: SOURCE T4RUPT_PROGRAM.agc:577
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:578
//# ERASABLE INITIALIZATION:
// PORT: SOURCE T4RUPT_PROGRAM.agc:579
//#		1) FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C(CDUZ) = 0, IMODES30 BIT 6 = 0, IMODES33 BIT 1 = 0.
// PORT: SOURCE T4RUPT_PROGRAM.agc:580
//#		2) RESTART WITH GROUPS ACTIVE:	SAME AS FRESH START EXCEPT C(CDUZ) NOT CHANGED SO GIMBAL MONITOR
// PORT: SOURCE T4RUPT_PROGRAM.agc:581
//#						PROCEEDS AS BEFORE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:582
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:583
//# ALARMS:	1) MGA REGION (2) CAUSES GIMBAL LOCK LAMP TO BE LIT.
// PORT: SOURCE T4RUPT_PROGRAM.agc:584
//#		2) MGA REGION (3) CAUSES THE ISS TO BE PUT IN COARSE ALIGN AND THE NO ATT LAMP TO BE LIT IF EITHER NOT
// PORT: SOURCE T4RUPT_PROGRAM.agc:585
//#		   SO ALREADY.
// PORT: SOURCE T4RUPT_PROGRAM.agc:586
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:587
//GLOCKMON	CCS	CDUZ
// PORT: Fixed ROM slots 8471.
            if slot <> 8471 or instruction <> 4124 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 28).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:588
//		TCF	GLOCKCHK		# SEE IF MAGNITUDE OF MGA IS GREATER THAN
// PORT: Fixed ROM slots 8472.
            if slot <> 8472 or instruction <> 5404 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5404, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[486] to agcAotUnit486@.

// PORT: Physical bank 06. Shared continuation entries, slots 8473–8487.
function agcAotUnit487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8479 {
        if slot <= 8475 {
            if slot <= 8473 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:589
//		TCF	SETGLOCK		# 70 DEGREES.
// PORT: Fixed ROM slots 8473.
                if slot <> 8473 or instruction <> 5424 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5424, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8474 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:590
//		TCF	GLOCKCHK
// PORT: Fixed ROM slots 8474.
                    if slot <> 8474 or instruction <> 5404 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5404, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:591
//		TCF	SETGLOCK
// PORT: Fixed ROM slots 8475.
                    if slot <> 8475 or instruction <> 5424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5424, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8477 {
                if slot <= 8476 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:592
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:593
//GLOCKCHK	AD	-70DEGS
// PORT: Fixed ROM slots 8476.
                    if slot <> 8476 or instruction <> 25925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1349), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:594
//		EXTEND
// PORT: Fixed ROM slots 8477.
                    if slot <> 8477 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8478 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:595
//		BZMF	SETGLOCK -1		# NO LOCK.
// PORT: Fixed ROM slots 8478.
                    if slot <> 8478 or instruction <> 25903 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25903, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:596
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:597
//		AD	-15DEGS			# SEE IF ABS(MGA) GREATER THAN 85 DEGREES
// PORT: Fixed ROM slots 8479.
                    if slot <> 8479 or instruction <> 25926 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1350), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8483 {
            if slot <= 8481 {
                if slot <= 8480 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:598
//		EXTEND
// PORT: Fixed ROM slots 8480.
                    if slot <> 8480 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:599
//		BZMF	NOGIMRUN
// PORT: Fixed ROM slots 8481.
                    if slot <> 8481 or instruction <> 25901 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25901, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8482 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:600
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:601
//		CAF	BIT4			# IF SO, SYSTEM SHOULD BE IN COARSE ALIGN
// PORT: Fixed ROM slots 8482.
                    if slot <> 8482 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:602
//		EXTEND				# TO PREVENT GIMBAL RUNAWAY.
// PORT: Fixed ROM slots 8483.
                    if slot <> 8483 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8485 {
                if slot <= 8484 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:603
//		RAND	CHAN12
// PORT: Fixed ROM slots 8484.
                    if slot <> 8484 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:604
//		CCS	A
// PORT: Fixed ROM slots 8485.
                    if slot <> 8485 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8486 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:605
//		TCF	NOGIMRUN
// PORT: Fixed ROM slots 8486.
                    if slot <> 8486 or instruction <> 5421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:606
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:607
//		TC	IBNKCALL		# GO INTO COARSE ALIGN.
// PORT: Fixed ROM slots 8487.
                    if slot <> 8487 or instruction <> 2528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[487] to agcAotUnit487@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:608
//		CADR	SETCOARS
// PORT: Fixed ROM slots 8488.
    8488, 15406
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8489–8490.
function agcAotUnit488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8489 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:609
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:610
//		CAF	SIX			# ENABLE ISS ERROR COUNTERS IN 60 MS.
// PORT: Fixed ROM slots 8489.
        if slot <> 8489 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:611
//		TC	WAITLIST
// PORT: Fixed ROM slots 8490.
        if slot <> 8490 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[488] to agcAotUnit488@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:612
//# Page 148
// PORT: SOURCE T4RUPT_PROGRAM.agc:613
//		EBANK=	CDUIND
// PORT: SOURCE T4RUPT_PROGRAM.agc:614
//		2CADR	CA+ECE
// PORT: Fixed ROM slots 8491 8492.
    8491, 3110, 8492, 14438
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8493–8516.
function agcAotUnit489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8504 {
        if slot <= 8498 {
            if slot <= 8495 {
                if slot <= 8493 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:615
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:616
//NOGIMRUN	CAF	BIT6			# TURN ON GIMBAL LOCK LAMP.
// PORT: Fixed ROM slots 8493.
                    if slot <> 8493 or instruction <> 14858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8494 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:617
//		TCF	SETGLOCK
// PORT: Fixed ROM slots 8494.
                        if slot <> 8494 or instruction <> 5424 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5424, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:618
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:619
// -1		CAF	ZERO
// PORT: Fixed ROM slots 8495.
                        if slot <> 8495 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 8496 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:620
//SETGLOCK	AD	DSPTAB +11D		# SEE IF PRESENT STATE OF GIMBAL LOCK LAMP
// PORT: Fixed ROM slots 8496.
                    if slot <> 8496 or instruction <> 25118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 542).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8497 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:621
//		MASK	BIT6			# AGREES WITH DESIRED STATE BY HALF ADDING
// PORT: Fixed ROM slots 8497.
                        if slot <> 8497 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:622
//		EXTEND				# THE TWO.
// PORT: Fixed ROM slots 8498.
                        if slot <> 8498 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8501 {
                if slot <= 8499 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:623
//		BZF	GLOCKOK			# OK AS IS.
// PORT: Fixed ROM slots 8499.
                    if slot <> 8499 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8500 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:624
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:625
//		MASK	DSPTAB +11D		# IF OFF, DON'T TURN ON IF IMU BEING CAGED.
// PORT: Fixed ROM slots 8500.
                        if slot <> 8500 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:626
//		CCS	A
// PORT: Fixed ROM slots 8501.
                        if slot <> 8501 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 8502 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:627
//		TCF	GLAMPTST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.
// PORT: Fixed ROM slots 8502.
                    if slot <> 8502 or instruction <> 5442 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5442, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8503 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:628
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:629
//		CAF	BIT6
// PORT: Fixed ROM slots 8503.
                        if slot <> 8503 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:630
//		MASK	IMODES30
// PORT: Fixed ROM slots 8504.
                        if slot <> 8504 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8510 {
            if slot <= 8507 {
                if slot <= 8505 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:631
//		CCS	A
// PORT: Fixed ROM slots 8505.
                    if slot <> 8505 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8506 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:632
//		TCF	GLOCKOK
// PORT: Fixed ROM slots 8506.
                        if slot <> 8506 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:633
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:634
//GLINVERT	CS	DSPTAB +11D		# INVERT GIMBAL LOCK LAMP.
// PORT: Fixed ROM slots 8507.
                        if slot <> 8507 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8508 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:635
//		MASK	BIT6
// PORT: Fixed ROM slots 8508.
                    if slot <> 8508 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8509 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:636
//		AD	BIT15			# TO INDICATE CHANGE IN DSPTAB +11D.
// PORT: Fixed ROM slots 8509.
                        if slot <> 8509 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:637
//		XCH	DSPTAB +11D
// PORT: Fixed ROM slots 8510.
                        if slot <> 8510 or instruction <> 24094 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 542, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8513 {
                if slot <= 8511 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:638
//		MASK	OCT37737
// PORT: Fixed ROM slots 8511.
                    if slot <> 8511 or instruction <> 29812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1140), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8512 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:639
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 8512.
                        if slot <> 8512 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:640
//		TCF	GLOCKOK
// PORT: Fixed ROM slots 8513.
                        if slot <> 8513 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8514 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:641
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:642
//GLAMPTST	TC	LAMPTEST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.
// PORT: Fixed ROM slots 8514.
                    if slot <> 8514 or instruction <> 1512 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1512, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8515 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:643
//		TCF	GLOCKOK
// PORT: Fixed ROM slots 8515.
                        if slot <> 8515 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:644
//		TCF	GLINVERT
// PORT: Fixed ROM slots 8516.
                        if slot <> 8516 or instruction <> 5435 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5435, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[489] to agcAotUnit489@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:645
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:646
//-70DEGS		DEC	-.38888			# -70 DEGREES SCALED IN HALF-REVOLUTIONS.
// PORT: Fixed ROM slots 8517.
    8517, 52792,
// PORT: SOURCE T4RUPT_PROGRAM.agc:647
//-15DEGS		DEC	-.08333
// PORT: Fixed ROM slots 8518.
    8518, 62804
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8519–8550.
function agcAotUnit490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8534 {
        if slot <= 8526 {
            if slot <= 8522 {
                if slot <= 8520 {
                    if slot <= 8519 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:648
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:649
//# Page 149
// PORT: SOURCE T4RUPT_PROGRAM.agc:650
//# PROGRAM NAME:  TLIM.
// PORT: SOURCE T4RUPT_PROGRAM.agc:651
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:652
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MAINTAINS THE TEMP LAMP (BIT 4 OF CHANNEL 11) ON THE DSKY TO AGREE WITH
// PORT: SOURCE T4RUPT_PROGRAM.agc:653
//# THE TEMP SIGNAL FROM THE ISS (BIT 15 OF CHANNEL 30).  HOWEVER, THE LIGHT WILL NOT BE TURNED OFF IF A LAMP TEST
// PORT: SOURCE T4RUPT_PROGRAM.agc:654
//# IS IN PROGRESS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:655
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:656
//# CALLING SEQUENCE:  CALLED BY IMUMON ON A CHANGE OF BIT 15 OF CHANNEL 30.
// PORT: SOURCE T4RUPT_PROGRAM.agc:657
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:658
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:659
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:660
//# SUBROUTINES CALLED:  LAMPTEST.
// PORT: SOURCE T4RUPT_PROGRAM.agc:661
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:662
//# ERASABLE INITIALIZATION:  FRESH START AND RESTART TURN THE TEMP LAMP OFF.
// PORT: SOURCE T4RUPT_PROGRAM.agc:663
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:664
//# ALARMS:  TEMP LAMP TURNED ON WHEN THE IMU TEMP GOES OUT OF LIMITS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:665
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:666
//# EXIT:  NXTIFAIL.
// PORT: SOURCE T4RUPT_PROGRAM.agc:667
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:668
//# OUTPUT:  SERVICE OF TEMP LAMP.		  IN A, EXCEPT FOR TLIM.
// PORT: SOURCE T4RUPT_PROGRAM.agc:669
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:670
//TLIM		MASK	POSMAX			# REMOVE BIT FROM WORD OF CHANGES AND SET
// PORT: Fixed ROM slots 8519.
                        if slot <> 8519 or instruction <> 31231 { return choose false if checkOnly else -1. }
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
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:671
//		TS	RUPTREG2		# DSKY TEMP LAMP ACCORDINGLY.
// PORT: Fixed ROM slots 8520.
                        if slot <> 8520 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8521 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:672
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:673
//		CCS	IMODES30
// PORT: Fixed ROM slots 8521.
                        if slot <> 8521 or instruction <> 4816 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:674
//		TCF	TEMPOK
// PORT: Fixed ROM slots 8522.
                        if slot <> 8522 or instruction <> 5456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5456, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8524 {
                    if slot <= 8523 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:675
//		TCF	TEMPOK
// PORT: Fixed ROM slots 8523.
                        if slot <> 8523 or instruction <> 5456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5456, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:676
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:677
//		CAF	BIT4			# TURN ON LAMP.
// PORT: Fixed ROM slots 8524.
                        if slot <> 8524 or instruction <> 14860 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8525 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:678
//		EXTEND
// PORT: Fixed ROM slots 8525.
                        if slot <> 8525 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:679
//		WOR	DSALMOUT
// PORT: Fixed ROM slots 8526.
                        if slot <> 8526 or instruction <> 2569 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8530 {
                if slot <= 8528 {
                    if slot <= 8527 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:680
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8527.
                        if slot <> 8527 or instruction <> 5271 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5271, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:681
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:682
//TEMPOK		TC	LAMPTEST		# IF TEMP NOW OK, DON'T TURN OFF LAMP IF
// PORT: Fixed ROM slots 8528.
                        if slot <> 8528 or instruction <> 1512 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1512, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8529 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:683
//		TCF	NXTIFAIL		# LAMP TEST IN PROGRESS.
// PORT: Fixed ROM slots 8529.
                        if slot <> 8529 or instruction <> 5271 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5271, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:684
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:685
//		CS	BIT4
// PORT: Fixed ROM slots 8530.
                        if slot <> 8530 or instruction <> 18956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8532 {
                    if slot <= 8531 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:686
//		EXTEND
// PORT: Fixed ROM slots 8531.
                        if slot <> 8531 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:687
//		WAND	DSALMOUT		# TURN OFF LAMP
// PORT: Fixed ROM slots 8532.
                        if slot <> 8532 or instruction <> 1545 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8533 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:688
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8533.
                        if slot <> 8533 or instruction <> 5271 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5271, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:689
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:690
//# Page 150
// PORT: SOURCE T4RUPT_PROGRAM.agc:691
//# PROGRAM NAME:  ITURNON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:692
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:693
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS CALLED BY IMUMON WHEN A CHANGE OF BIT 14 OF CHANNEL 30 (ISS TURN-ON
// PORT: SOURCE T4RUPT_PROGRAM.agc:694
//# REQUEST) IS DETECTED.  UPON ENTRY, ITURNON CHECKS IF A TURN-ON DELAY SEQUENCE HAS FAILED, AND IF SO, IT EXITS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:695
//# IF NOT, IT CHECKS WHETHER THE TURN-ON REQUEST CHANGE IS TO ON OR OFF.  IF ON, IT SETS BIT 7 OF IMODES30 TO 1 SO
// PORT: SOURCE T4RUPT_PROGRAM.agc:696
//# THAT TNONTEST WILL INITIATE THE ISS INITIALIZATION SEQUENCE.  IF OFF, THE TURN-ON DELAY SIGNAL, CHANNEL 12 BIT
// PORT: SOURCE T4RUPT_PROGRAM.agc:697
//# 15, IS CHECKED AND IF IT IS ON, ITURNON EXITS.  IF THE DELAY SIGNAL IS OFF, PROGRAM ALARM 00207 IS ISSUED, BIT 2
// PORT: SOURCE T4RUPT_PROGRAM.agc:698
//# OF IMODES30 IS SET TO 1 AND THE PROGRAM EXITS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:699
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:700
//# THE SETTING OF BIT 2 OF IMODES30 (ISS DELAY SEQUENCE FAIL) INHIBITS THIS ROUTINE AND IMUOP FROM
// PORT: SOURCE T4RUPT_PROGRAM.agc:701
//# PROCESSING ANY CHANGES.  THIS BIT WILL BE RESET BY THE ENDTNON ROUTINE WHEN THE CURRENT 90 SECOND DELAY PERIOD
// PORT: SOURCE T4RUPT_PROGRAM.agc:702
//# ENDS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:703
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:704
//# CALLING SEQUENCE:  FROM IMUMON WHEN ISS TURN-ON REQUEST CHANGES STATE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:705
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:706
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:707
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:708
//# SUBROUTINES CALLED:  ALARM, IF THE ISS TURN-ON REQUEST IS NOT PRESENT FOR 90 SECONDS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:709
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:710
//# ERASABLE INITIALIZATION:  FRESH START AND RESTART SET BIT 15 OF CHANNEL 12 AND BITS 2 AND 7 OF IMODES30 TO 0,
// PORT: SOURCE T4RUPT_PROGRAM.agc:711
//# AND BIT 14 OF IMODES30 TO 1.
// PORT: SOURCE T4RUPT_PROGRAM.agc:712
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:713
//# ALARMS: PROGRAM ALARM 00207 IS ISSUED IF THE ISS TURN-ON REQUEST SIGNAL IS NOT PRESENT FOR 90 SECONDS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:714
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:715
//# EXIT:  NXTIFAIL.
// PORT: SOURCE T4RUPT_PROGRAM.agc:716
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:717
//# OUTPUT:  BIT 7 OF IMODES30 TO START ISS INITIALIZATION, OR BIT 2 OF IMODES30 AND PROGRAM ALARM 00207 TO INDICATE
// PORT: SOURCE T4RUPT_PROGRAM.agc:718
//# A FAILED TURN-ON SEQUENCE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:719
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:720
//ITURNON		CAF	BIT2		# IF DELAY REQUEST HAS GONE OFF
// PORT: Fixed ROM slots 8534.
                        if slot <> 8534 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 8542 {
            if slot <= 8538 {
                if slot <= 8536 {
                    if slot <= 8535 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:721
//		MASK	IMODES30	# PREMATURELY, DO NOT PROCESS ANY CHANGES
// PORT: Fixed ROM slots 8535.
                        if slot <> 8535 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:722
//		CCS	A		# UNTIL THE CURRENT 90 SEC WAIT EXPIRES.
// PORT: Fixed ROM slots 8536.
                        if slot <> 8536 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8537 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:723
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8537.
                        if slot <> 8537 or instruction <> 5271 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5271, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:724
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:725
//		CAF	BIT14		# SEE IF JUST ON OR OFF.
// PORT: Fixed ROM slots 8538.
                        if slot <> 8538 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8540 {
                    if slot <= 8539 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:726
//		MASK 	IMODES30
// PORT: Fixed ROM slots 8539.
                        if slot <> 8539 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:727
//		EXTEND
// PORT: Fixed ROM slots 8540.
                        if slot <> 8540 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8541 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:728
//		BZF	ITURNON2	# IF JUST ON.
// PORT: Fixed ROM slots 8541.
                        if slot <> 8541 or instruction <> 5481 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5481, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:729
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:730
//		CAF	BIT15
// PORT: Fixed ROM slots 8542.
                        if slot <> 8542 or instruction <> 14849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8546 {
                if slot <= 8544 {
                    if slot <= 8543 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:731
//		EXTEND			# SEE IF DELAY PRESENT DISCRETE HAS BEEN
// PORT: Fixed ROM slots 8543.
                        if slot <> 8543 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:732
//		RAND	CHAN12		# SENT.  IF SO, ACTION COMPLETE
// PORT: Fixed ROM slots 8544.
                        if slot <> 8544 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8545 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:733
//		EXTEND
// PORT: Fixed ROM slots 8545.
                        if slot <> 8545 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:734
//		BZF	+2
// PORT: Fixed ROM slots 8546.
                        if slot <> 8546 or instruction <> 5476 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5476, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8548 {
                    if slot <= 8547 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:735
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8547.
                        if slot <> 8547 or instruction <> 5271 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5271, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:736
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:737
//		CAF	BIT2		# IF NOT, SET BIT TO INDICATE REQUEST NOT
// PORT: Fixed ROM slots 8548.
                        if slot <> 8548 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8549 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:738
//		ADS	IMODES30	# PRESENT FOR FULL DURATION.
// PORT: Fixed ROM slots 8549.
                        if slot <> 8549 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:739
//		TC	ALARM
// PORT: Fixed ROM slots 8550.
                        if slot <> 8550 or instruction <> 2984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[490] to agcAotUnit490@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:740
//		OCT	207
// PORT: Fixed ROM slots 8551.
    8551, 270
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8552–8569.
function agcAotUnit491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8560 {
        if slot <= 8555 {
            if slot <= 8553 {
                if slot <= 8552 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:741
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8552.
                    if slot <> 8552 or instruction <> 5271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:742
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:743
//# Page 151
// PORT: SOURCE T4RUPT_PROGRAM.agc:744
//ITURNON2	CS	IMODES30	# SET BIT7 TO INDICATE WAIT OF 1 SAMPLE
// PORT: Fixed ROM slots 8553.
                    if slot <> 8553 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8554 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:745
//		MASK	BIT7
// PORT: Fixed ROM slots 8554.
                    if slot <> 8554 or instruction <> 31241 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:746
//		ADS	IMODES30
// PORT: Fixed ROM slots 8555.
                    if slot <> 8555 or instruction <> 11984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8557 {
                if slot <= 8556 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:747
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8556.
                    if slot <> 8556 or instruction <> 5271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:748
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:749
//# Page 152
// PORT: SOURCE T4RUPT_PROGRAM.agc:750
//# PROGRAM NAME:  IMUCAGE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:751
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:752
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF THE IMUCAGE INBIT, CHANNEL 30 BITS 11.  IF THE BIT
// PORT: SOURCE T4RUPT_PROGRAM.agc:753
//# CHANGES TO 0 (CAGE BUTTON PRESSED), THE ISS IS CAGED (ICDU ZERO + COARSE ALIGN + NO ATT LAMP) UNTIL THE
// PORT: SOURCE T4RUPT_PROGRAM.agc:754
//# ASTRONAUT SELECTS ANOTHER PROGRAM TO ALIGN THE ISS.  ANY PULSE TRAINS TO THE ICDU'S AND GYRO'S ARE TERMINATED,
// PORT: SOURCE T4RUPT_PROGRAM.agc:755
//# THE ASSOCIATE OUTCOUNTERS ARE ZEROED AND THE GYRO'S ARE DE-SELECTED.  NO ACTION OCCURS WHEN THE BUTTON IS
// PORT: SOURCE T4RUPT_PROGRAM.agc:756
//# RELEASED (INBIT CHANGES TO 1).
// PORT: SOURCE T4RUPT_PROGRAM.agc:757
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:758
//# CALLING SEQUENCE:  BY IMUMON WHEN IMU CAGE BIT CHANGES.
// PORT: SOURCE T4RUPT_PROGRAM.agc:759
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:760
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:761
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:762
//# SUBROUTINES CALLED:  CAGESUB.
// PORT: SOURCE T4RUPT_PROGRAM.agc:763
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:764
//# ERASABLE INITIALZATION:  FRESH START AND RESTART SET BIT 11 OF IMODES30 TO 1.
// PORT: SOURCE T4RUPT_PROGRAM.agc:765
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:766
//# ALARMS: NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:767
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:768
//# EXIT:  NXTIFAIL.
// PORT: SOURCE T4RUPT_PROGRAM.agc:769
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:770
//# OUTPUT:  ISS CAGED, COUNTERS ZEROED, PULSE TRAINS TERMINATED AND NO ATT LAMP LIT.
// PORT: SOURCE T4RUPT_PROGRAM.agc:771
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:772
//IMUCAGE		CCS	A		# NO ACTION IF GOING OFF.
// PORT: Fixed ROM slots 8557.
                    if slot <> 8557 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8558 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:773
//		TCF	ISSZERO
// PORT: Fixed ROM slots 8558.
                    if slot <> 8558 or instruction <> 5356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8559 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:774
//		CS	OCT77000	# TERMINATE ICDU, OPTICS, GYRO PULSE TRAINS
// PORT: Fixed ROM slots 8559.
                        if slot <> 8559 or instruction <> 17906 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1522), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:775
//		EXTEND
// PORT: Fixed ROM slots 8560.
                        if slot <> 8560 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 8564 {
            if slot <= 8562 {
                if slot <= 8561 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:776
//		WAND	CHAN14
// PORT: Fixed ROM slots 8561.
                    if slot <> 8561 or instruction <> 1548 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:777
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:778
//		CS	OCT272		# KNOCK DOWN TVC ENABLE, IMU ERROR COUNTER
// PORT: Fixed ROM slots 8562.
                    if slot <> 8562 or instruction <> 17902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1518), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8563 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:779
//		EXTEND			#   ENABLE, ZERO ICDU, COARSE ALIGN
// PORT: Fixed ROM slots 8563.
                    if slot <> 8563 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:780
//		WAND	CHAN12		#   ENABLE, OPTICS ERR CNTR ENABLE
// PORT: Fixed ROM slots 8564.
                    if slot <> 8564 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8566 {
                if slot <= 8565 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:781
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:782
//		CS	BIT13		# TURN OFF ENGINE
// PORT: Fixed ROM slots 8565.
                    if slot <> 8565 or instruction <> 18947 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:783
//		EXTEND
// PORT: Fixed ROM slots 8566.
                    if slot <> 8566 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8567 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:784
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 8567.
                    if slot <> 8567 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8568 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:785
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:786
//		TC	CAGESUB1
// PORT: Fixed ROM slots 8568.
                        if slot <> 8568 or instruction <> 1493 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1493, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:787
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:788
//		TC	IBNKCALL	# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
// PORT: Fixed ROM slots 8569.
                        if slot <> 8569 or instruction <> 2528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[491] to agcAotUnit491@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:789
//		CADR	RNDREFDR
// PORT: Fixed ROM slots 8570.
    8570, 15456
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8571–8585.
function agcAotUnit492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8577 {
        if slot <= 8573 {
            if slot <= 8571 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:790
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:791
//		CS	ZERO		# ZERO COMMAND OUT-COUNTERS
// PORT: Fixed ROM slots 8571.
                if slot <> 8571 or instruction <> 18961 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8572 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:792
//		TS	CDUXCMD
// PORT: Fixed ROM slots 8572.
                    if slot <> 8572 or instruction <> 22568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22568, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:793
//		TS	CDUYCMD
// PORT: Fixed ROM slots 8573.
                    if slot <> 8573 or instruction <> 22569 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22569, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8575 {
                if slot <= 8574 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:794
//		TS	CDUZCMD
// PORT: Fixed ROM slots 8574.
                    if slot <> 8574 or instruction <> 22570 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22570, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:795
//		TS	GYROCMD
// PORT: Fixed ROM slots 8575.
                    if slot <> 8575 or instruction <> 22567 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22567, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8576 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:796
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:797
//		CS	OCT740		# HAVING WAITED AT LEAST 27 MCT FROM
// PORT: Fixed ROM slots 8576.
                    if slot <> 8576 or instruction <> 17905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1521), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:798
//		EXTEND			# GYRO PULSE TRAIN TERMINATION, WE CAN
// PORT: Fixed ROM slots 8577.
                    if slot <> 8577 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8581 {
            if slot <= 8579 {
                if slot <= 8578 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:799
//		WAND	CHAN14		# DE-SELECT THE GYROS.
// PORT: Fixed ROM slots 8578.
                    if slot <> 8578 or instruction <> 1548 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:800
//# Page 153
// PORT: SOURCE T4RUPT_PROGRAM.agc:801
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8579.
                    if slot <> 8579 or instruction <> 5271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8580 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:802
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:803
//# Page 154
// PORT: SOURCE T4RUPT_PROGRAM.agc:804
//# PROGRAM NAME:  IMUOP.
// PORT: SOURCE T4RUPT_PROGRAM.agc:805
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:806
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES IN THE ISS OPERATE DISCRETE, BIT 9 OF CHANNEL 30.
// PORT: SOURCE T4RUPT_PROGRAM.agc:807
//# IF THE INBIT CHANGES TO 0, INDICATING ISS ON, IMUOP GENERALLY SETS BIT 7 OF IMODES30 TO 1 TO REQUEST ISS
// PORT: SOURCE T4RUPT_PROGRAM.agc:808
//# INITIALIZATION VIA TNONTEST.  AN EXCEPTION IS DURING A FAILED ISS DELAY DURING WHICH BIT 2 OF IMODES30 IS SET
// PORT: SOURCE T4RUPT_PROGRAM.agc:809
//# TO 1 AND NO FURTHER INITIALIZATION IS REQUIRED.  WHEN THE INBIT CHANGES TO 1, INDICATING ISS OFF, IMUSEFLG IS
// PORT: SOURCE T4RUPT_PROGRAM.agc:810
//# TESTED TO SEE IF ANY PROGRAM WAS USING THE ISS.  IF SO, PROGRAM ALARM 00214 IS ISSUED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:811
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:812
//# CALLING SEQUENCE:  BY IMUMON WHEN BIT 9 OF CHANNEL 30 CHANGES.
// PORT: SOURCE T4RUPT_PROGRAM.agc:813
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:814
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:815
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:816
//# SUBROUTINES CALLED:  ALARM, IF ISS IS TURNED OFF WHILE IN USE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:817
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:818
//# ERASABLE INITIALIZATION:  ON FRESH START AND RESTART, BIT 9 OF IMODES30 IS SET TO 1 EXCEPT WHEN THE GIMBAL LOCK
// PORT: SOURCE T4RUPT_PROGRAM.agc:819
//# LAMP IS ON, IN WHICH CASE IT IS SET TO 0.  THIS PREVENTS ICDU ZERO BY TNONTEST WITH THE ISS IN GIMBAL LOCK.
// PORT: SOURCE T4RUPT_PROGRAM.agc:820
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:821
//# ALARMS:  PROGRAM ALARM 00214 IF THE ISS IS TURNED OFF WHILE IN USE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:822
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:823
//# EXIT:  NXTIFAIL.
// PORT: SOURCE T4RUPT_PROGRAM.agc:824
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:825
//# OUTPUT:  ISS INITIALIZATION REQUEST (IMODES30 BIT 7) OR PROGRAM ALARM 00214.
// PORT: SOURCE T4RUPT_PROGRAM.agc:826
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:827
//IMUOP		EXTEND				# IF OPERATE JUST ON, WAIT 1 SAMPLE.
// PORT: Fixed ROM slots 8580.
                    if slot <> 8580 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:828
//		BZF	IMUOP2
// PORT: Fixed ROM slots 8581.
                    if slot <> 8581 or instruction <> 5525 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8583 {
                if slot <= 8582 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:829
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:830
//		CS	IMODES33		# DISABLE DAP
// PORT: Fixed ROM slots 8582.
                    if slot <> 8582 or instruction <> 17105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 721).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:831
//		MASK	BIT6
// PORT: Fixed ROM slots 8583.
                    if slot <> 8583 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8584 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:832
//		ADS	IMODES33
// PORT: Fixed ROM slots 8584.
                    if slot <> 8584 or instruction <> 11985 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 721).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:833
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:834
//		TC	IBNKCALL		# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
// PORT: Fixed ROM slots 8585.
                    if slot <> 8585 or instruction <> 2528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[492] to agcAotUnit492@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:835
//		CADR	RNDREFDR
// PORT: Fixed ROM slots 8586.
    8586, 15456
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8587–8594.
function agcAotUnit493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8590 {
        if slot <= 8588 {
            if slot <= 8587 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:836
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:837
//		CS	BITS7&8			# KNOCK DOWN RENDEZVOUS, IMUUSE FLAGS
// PORT: Fixed ROM slots 8587.
                if slot <> 8587 or instruction <> 17903 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1519), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:838
//		MASK	STATE
// PORT: Fixed ROM slots 8588.
                if slot <> 8588 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8589 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:839
//		XCH	STATE			# IF GOING OFF, ALARM IF PROG USING IMU.
// PORT: Fixed ROM slots 8589.
                if slot <> 8589 or instruction <> 23612 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 60, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:840
//		COM
// PORT: Fixed ROM slots 8590.
                if slot <> 8590 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8592 {
            if slot <= 8591 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:841
//		MASK	IMUSEFLG
// PORT: Fixed ROM slots 8591.
                if slot <> 8591 or instruction <> 31240 { return choose false if checkOnly else -1. }
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
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:842
//		CCS	A
// PORT: Fixed ROM slots 8592.
                if slot <> 8592 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8593 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:843
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8593.
                if slot <> 8593 or instruction <> 5271 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5271, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:844
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:845
//		TC	ALARM
// PORT: Fixed ROM slots 8594.
                if slot <> 8594 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[493] to agcAotUnit493@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:846
//		OCT	214
// PORT: Fixed ROM slots 8595.
    8595, 280
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8596–8609.
function agcAotUnit494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8602 {
        if slot <= 8598 {
            if slot <= 8596 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:847
//		TCF	NXTIFAIL
// PORT: Fixed ROM slots 8596.
                if slot <> 8596 or instruction <> 5271 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5271, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8597 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:848
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:849
//IMUOP2		CAF	BIT2			# SEE IF FAILED ISS TURN-ON SEQ IN PROG.
// PORT: Fixed ROM slots 8597.
                    if slot <> 8597 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:850
//		MASK	IMODES30
// PORT: Fixed ROM slots 8598.
                    if slot <> 8598 or instruction <> 29392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8600 {
                if slot <= 8599 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:851
//		CCS	A
// PORT: Fixed ROM slots 8599.
                    if slot <> 8599 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:852
//		TCF	NXTIFAIL		# IF SO, DON'T PROCESS UNTIL PRESENT 90
// PORT: Fixed ROM slots 8600.
                    if slot <> 8600 or instruction <> 5271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8601 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:853
//		TCF	ITURNON2		# SECONDS EXPIRES
// PORT: Fixed ROM slots 8601.
                    if slot <> 8601 or instruction <> 5481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:854
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:855
//# Page 155
// PORT: SOURCE T4RUPT_PROGRAM.agc:856
//# PROGRAM NAME:  PIPFAIL
// PORT: SOURCE T4RUPT_PROGRAM.agc:857
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:858
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF BIT 13 OF CHANNEL 33, PIPA FAIL.  IT SETS BIT 10 OF
// PORT: SOURCE T4RUPT_PROGRAM.agc:859
//# IMODES30 TO AGREE.  IT CALLS SETISSW IN CASE A PIPA FAIL NECESSITATES AN ISS WARNING.  IF NOT, I.E., IMODES30
// PORT: SOURCE T4RUPT_PROGRAM.agc:860
//# BIT 1 = 1, AND A PIPA FAIL IS PRESENT AND THE ISS NOT BEING INITIALIZED, PROGRAM ALARM 0212 IS ISSUED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:861
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:862
//# CALLING SEQUENCE:  BY C33TEST ON CHANGES OF CHANNEL 33 BIT 13.
// PORT: SOURCE T4RUPT_PROGRAM.agc:863
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:864
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:865
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:866
//# SUBROUTINES CALLED:  1) SETISSW, AND 2) ALARM (SEE FUNCTIONAL DESCRIPTION).
// PORT: SOURCE T4RUPT_PROGRAM.agc:867
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:868
//# ERASABLE INITIALIZATION:  SEE IMUMON FOR INITIALIZATION OF IMODES30.  THE RELEVANT BITS ARE 5, 7, 8, 9, AND 10.
// PORT: SOURCE T4RUPT_PROGRAM.agc:869
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:870
//# ALARMS:  PROGRAM ALARM 00212 IF PIPA FAIL IS PRESENT BUT NEITHER ISS WARNING IS TO BE ISSUED NOR THE ISS IS
// PORT: SOURCE T4RUPT_PROGRAM.agc:871
//# BEING INITIALIZED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:872
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:873
//# EXIT:  NXTFL33.
// PORT: SOURCE T4RUPT_PROGRAM.agc:874
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:875
//# OUTPUT:  PROGRAM ALARM 00212 AND ISS WARNING MAINTENANCE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:876
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:877
//PIPFAIL		CCS	A			# SET BIT10 IN IMODES30 SO ALL ISS WARNING
// PORT: Fixed ROM slots 8602.
                    if slot <> 8602 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8605 {
            if slot <= 8603 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:878
//		CAF	BIT10			# INFO IS IN ONE REGISTER.
// PORT: Fixed ROM slots 8603.
                if slot <> 8603 or instruction <> 14854 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8604 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:879
//		XCH	IMODES30
// PORT: Fixed ROM slots 8604.
                    if slot <> 8604 or instruction <> 24272 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 720, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:880
//		MASK	-BIT10
// PORT: Fixed ROM slots 8605.
                    if slot <> 8605 or instruction <> 30195 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1523), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8607 {
                if slot <= 8606 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:881
//		ADS	IMODES30
// PORT: Fixed ROM slots 8606.
                    if slot <> 8606 or instruction <> 11984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 720).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:882
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:883
//		TC	SETISSW
// PORT: Fixed ROM slots 8607.
                    if slot <> 8607 or instruction <> 1461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8608 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:884
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:885
//		CS	IMODES30		# IF PIP FAIL DOESN'T LIGHT ISS WARNING, DO
// PORT: Fixed ROM slots 8608.
                    if slot <> 8608 or instruction <> 17104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 720).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:886
//		MASK	BIT1			# A PROGRAM ALARM IF IMU OPERATING BUT NOT
// PORT: Fixed ROM slots 8609.
                    if slot <> 8609 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
            }
        }
    }
}
set agcAotRoutes[494] to agcAotUnit494@.

// PORT: Physical bank 06. Shared continuation entries, slots 8610–8616.
function agcAotUnit495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8612 {
        if slot <= 8610 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:887
//		CCS	A			# CAGED OR BEING TURNED ON.
// PORT: Fixed ROM slots 8610.
            if slot <> 8610 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8611 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:888
//		TCF	NXTFL33
// PORT: Fixed ROM slots 8611.
                if slot <> 8611 or instruction <> 5397 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5397, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:889
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:890
//		CA	IMODES30
// PORT: Fixed ROM slots 8612.
                if slot <> 8612 or instruction <> 13008 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 720).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8614 {
            if slot <= 8613 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:891
//		MASK	OCT1720
// PORT: Fixed ROM slots 8613.
                if slot <> 8613 or instruction <> 30192 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1520), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:892
//		CCS	A
// PORT: Fixed ROM slots 8614.
                if slot <> 8614 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8615 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:893
//		TCF	NXTFL33			# ABOVE CONDITION NOT MET.
// PORT: Fixed ROM slots 8615.
                if slot <> 8615 or instruction <> 5397 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5397, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:894
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:895
//		TC	ALARM
// PORT: Fixed ROM slots 8616.
                if slot <> 8616 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[495] to agcAotUnit495@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:896
//		OCT	212
// PORT: Fixed ROM slots 8617.
    8617, 276
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8618–8621.
function agcAotUnit496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8619 {
        if slot <= 8618 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:897
//		TCF	NXTFL33
// PORT: Fixed ROM slots 8618.
            if slot <> 8618 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:898
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:899
//# Page 156
// PORT: SOURCE T4RUPT_PROGRAM.agc:900
//# PROGRAM NAMES:  DNTMFAST, UPTMFAST
// PORT: SOURCE T4RUPT_PROGRAM.agc:901
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:902
//# FUNCTIONAL DESCRIPTION:  THESE PROGRAMS PROCESS CHANGES OF BITS 12 AND 11 OF CHANNEL 33.  IF A BIT CHANGES TO A
// PORT: SOURCE T4RUPT_PROGRAM.agc:903
//# 0, A PROGRAM ALARM IS ISSUED.  THE ALARMS ARE:
// PORT: SOURCE T4RUPT_PROGRAM.agc:904
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:905
//#	BIT	ALARM	CAUSE
// PORT: SOURCE T4RUPT_PROGRAM.agc:906
//#	---	-----	-----
// PORT: SOURCE T4RUPT_PROGRAM.agc:907
//#	 12	01105	DOWNLINK TOO FAST
// PORT: SOURCE T4RUPT_PROGRAM.agc:908
//#	 11	01106	UPLINK TOO FAST
// PORT: SOURCE T4RUPT_PROGRAM.agc:909
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:910
//# CALLING SEQUENCE:  BY C33TEST ON A BIT CHANGE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:911
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:912
//# SUBROUTINES CALLED:  ALARM, IF A BIT CHANGES TO A 0.
// PORT: SOURCE T4RUPT_PROGRAM.agc:913
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:914
//# ERASABLE INITIALIZATION:  FRESH START OR RESTART, BITS 12 AND 11 OF IMODES33 ARE SET TO 1.
// PORT: SOURCE T4RUPT_PROGRAM.agc:915
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:916
//# ALARMS:  SEE FUNCTIONAL DESCRIPTION.
// PORT: SOURCE T4RUPT_PROGRAM.agc:917
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:918
//# EXIT:  NXTFL33.
// PORT: SOURCE T4RUPT_PROGRAM.agc:919
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:920
//# OUTPUT:  PROGRAM ALARM ON A BIT CHANGE TO 0.
// PORT: SOURCE T4RUPT_PROGRAM.agc:921
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:922
//DNTMFAST	CCS	A			# DO PROG ALARM IF TM TOO FAST.
// PORT: Fixed ROM slots 8619.
            if slot <> 8619 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8620 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:923
//		TCF	NXTFL33
// PORT: Fixed ROM slots 8620.
            if slot <> 8620 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:924
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:925
//		TC	ALARM
// PORT: Fixed ROM slots 8621.
            if slot <> 8621 or instruction <> 2984 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2984, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[496] to agcAotUnit496@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:926
//		OCT	1105
// PORT: Fixed ROM slots 8622.
    8622, 1162
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8623–8626.
function agcAotUnit497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8624 {
        if slot <= 8623 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:927
//		TCF	NXTFL33
// PORT: Fixed ROM slots 8623.
            if slot <> 8623 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:928
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:929
//UPTMFAST	CCS	A			# SAME AS DNLINK TOO FAST WITH DIFFERENT
// PORT: Fixed ROM slots 8624.
            if slot <> 8624 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8625 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:930
//		TCF	NXTFL33			# ALARM CODE.
// PORT: Fixed ROM slots 8625.
            if slot <> 8625 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:931
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:932
//		TC	ALARM
// PORT: Fixed ROM slots 8626.
            if slot <> 8626 or instruction <> 2984 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2984, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[497] to agcAotUnit497@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:933
//		OCT	1106
// PORT: Fixed ROM slots 8627.
    8627, 1164
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8628–8674.
function agcAotUnit498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8650 {
        if slot <= 8638 {
            if slot <= 8632 {
                if slot <= 8629 {
                    if slot <= 8628 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:934
//		TCF	NXTFL33
// PORT: Fixed ROM slots 8628.
                        if slot <> 8628 or instruction <> 5397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5397, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:935
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:936
//# Page 157
// PORT: SOURCE T4RUPT_PROGRAM.agc:937
//# PROGRAM NAME:  SETISSW
// PORT: SOURCE T4RUPT_PROGRAM.agc:938
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:939
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM TURNS THE ISS WARNING LAMP ON AND OFF (CHANNEL 11 BIT 1 = 1 FOR ON,
// PORT: SOURCE T4RUPT_PROGRAM.agc:940
//# 0 FOR OFF) DEPENDING ON THE STATUS OF IMODES30 BITS 13 (IMU FAIL) AND 4 (INHIBIT IMU FAIL), 12 (ICDU FAIL) AND
// PORT: SOURCE T4RUPT_PROGRAM.agc:941
//# 3 (INHIBIT ICDU FAIL), AND 10 (PIPA FAIL) AND 1 (INHIBIT PIPA FAIL).  THE LAMP IS LEFT ON IF A LAMP TEST IS IN
// PORT: SOURCE T4RUPT_PROGRAM.agc:942
//# PROGRESS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:943
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:944
//# CALLING SEQUENCE:  CALLED BY IMUMON ON CHANGES TO IMU FAIL AND ICDU FAIL.  CALLED BY IFAILOK AND PFAILOK UPON
// PORT: SOURCE T4RUPT_PROGRAM.agc:945
//# REMOVAL OF THE FAIL INHIBITS.  CALLED BY PIPFAIL WHEN THE PIPA FAIL DISCRETE CHANGES.  IT IS CALLED BY PIPUSE
// PORT: SOURCE T4RUPT_PROGRAM.agc:946
//# SINCE THE PIPA FAIL PROGRAM ALARM MAY NECESSITATE AN ISS WARNING, AND LIKEWISE BY PIPFREE WHEN THE ALARM DEPARTS
// PORT: SOURCE T4RUPT_PROGRAM.agc:947
//# AND IT IS CALLED BY IMUZERO3 AND ISSUP AFTER THE FAIL INHIBITS HAVE BEEN REMOVED.
// PORT: SOURCE T4RUPT_PROGRAM.agc:948
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:949
//# JOBS OR TASKS INITIATED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:950
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:951
//# SUBROUTINES CALLED:  NONE.
// PORT: SOURCE T4RUPT_PROGRAM.agc:952
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:953
//# ERASABLE INITIALIZATION:
// PORT: SOURCE T4RUPT_PROGRAM.agc:954
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:955
//#	1) IMODES30 -- SEE IMUMON.
// PORT: SOURCE T4RUPT_PROGRAM.agc:956
//#	2) IMODES33 BIT 1 = 0 (LAMP TEST NOT IN PROGRESS).
// PORT: SOURCE T4RUPT_PROGRAM.agc:957
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:958
//# ALARMS:  ISS WARNING.
// PORT: SOURCE T4RUPT_PROGRAM.agc:959
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:960
//# EXIT: VIA Q.
// PORT: SOURCE T4RUPT_PROGRAM.agc:961
//#
// PORT: SOURCE T4RUPT_PROGRAM.agc:962
//# OUTPUT: ISS WARNING LAMP SET PROPERLY.
// PORT: SOURCE T4RUPT_PROGRAM.agc:963
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:964
//SETISSW		CAF	OCT15			# SET ISS WARNING USING THE FAIL BITS IN
// PORT: Fixed ROM slots 8629.
                        if slot <> 8629 or instruction <> 14869 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8630 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:965
//		MASK	IMODES30		# BITS 13, 12, AND 10 OF IMODES30 AND THE
// PORT: Fixed ROM slots 8630.
                        if slot <> 8630 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8631 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:966
//		EXTEND				# FAILURE INHIBIT BITS IN POSITIONS
// PORT: Fixed ROM slots 8631.
                            if slot <> 8631 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:967
//		MP	BIT10			# 4, 3, AND 1.
// PORT: Fixed ROM slots 8632.
                            if slot <> 8632 or instruction <> 31238 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2566, readEffective:call(words, 2566)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8635 {
                    if slot <= 8633 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:968
//		CA	IMODES30
// PORT: Fixed ROM slots 8633.
                        if slot <> 8633 or instruction <> 13008 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8634 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:969
//		EXTEND
// PORT: Fixed ROM slots 8634.
                            if slot <> 8634 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:970
//		ROR	LCHAN			# 0 INDICATES FAILURE
// PORT: Fixed ROM slots 8635.
                            if slot <> 8635 or instruction <> 2049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8636 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:971
//		COM
// PORT: Fixed ROM slots 8636.
                        if slot <> 8636 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8637 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:972
//		MASK	OCT15000
// PORT: Fixed ROM slots 8637.
                            if slot <> 8637 or instruction <> 31287 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2615), 32768).
                                if fixedOperand = 6656 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512 + mod(floor(words[0] / 2048), 4) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:973
//		CCS	A
// PORT: Fixed ROM slots 8638.
                            if slot <> 8638 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8644 {
                if slot <= 8641 {
                    if slot <= 8639 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:974
//		TCF	ISSWON			# FAILURE.
// PORT: Fixed ROM slots 8639.
                        if slot <> 8639 or instruction <> 5576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5576, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8640 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:975
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:976
//ISSWOFF		CAF	BIT1			# DON'T TURN OFF ISS WARNING IF LAMP TEST
// PORT: Fixed ROM slots 8640.
                            if slot <> 8640 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:977
//		MASK	IMODES33		# IN PROGRESS.
// PORT: Fixed ROM slots 8641.
                            if slot <> 8641 or instruction <> 29393 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 721).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8642 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:978
//		CCS	A
// PORT: Fixed ROM slots 8642.
                        if slot <> 8642 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8643 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:979
//		TC	Q
// PORT: Fixed ROM slots 8643.
                            if slot <> 8643 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:980
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:981
//		CS	BIT1
// PORT: Fixed ROM slots 8644.
                            if slot <> 8644 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8647 {
                    if slot <= 8645 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:982
//		EXTEND
// PORT: Fixed ROM slots 8645.
                        if slot <> 8645 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8646 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:983
//		WAND	DSALMOUT		# TURN OFF ISS WARNING.
// PORT: Fixed ROM slots 8646.
                            if slot <> 8646 or instruction <> 1545 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:984
//		TC	Q
// PORT: Fixed ROM slots 8647.
                            if slot <> 8647 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8648 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:985
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:986
//ISSWON		EXTEND
// PORT: Fixed ROM slots 8648.
                        if slot <> 8648 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8649 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:987
//# Page 158
// PORT: SOURCE T4RUPT_PROGRAM.agc:988
//		QXCH	ITEMP6
// PORT: Fixed ROM slots 8649.
                            if slot <> 8649 or instruction <> 9270 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 54, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:989
//		TC	VARALARM		# TELL EVERYONE WHAT CAUSED THE ISS WARNING
// PORT: Fixed ROM slots 8650.
                            if slot <> 8650 or instruction <> 3060 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3060, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8662 {
            if slot <= 8656 {
                if slot <= 8653 {
                    if slot <= 8651 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:990
//		CAF	BIT1
// PORT: Fixed ROM slots 8651.
                        if slot <> 8651 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8652 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:991
//		EXTEND
// PORT: Fixed ROM slots 8652.
                            if slot <> 8652 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:992
//		WOR	DSALMOUT		# TURN ON ISS WARNING
// PORT: Fixed ROM slots 8653.
                            if slot <> 8653 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8654 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:993
//		TC	ITEMP6
// PORT: Fixed ROM slots 8654.
                        if slot <> 8654 or instruction <> 54 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 54, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8655 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:994
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:995
//CAGESUB		CS	BIT15+6			# SET OUTBITS + INTERNAL FLAGS FOR
// PORT: Fixed ROM slots 8655.
                            if slot <> 8655 or instruction <> 20419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 4035), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:996
//		EXTEND				# SYSTEM TURN-ON OR CAGE.  DISABLE THE
// PORT: Fixed ROM slots 8656.
                            if slot <> 8656 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8659 {
                    if slot <= 8657 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:997
//		WAND	CHAN12			# ERROR COUNTER AND REMOVE THE IMU DELAY COMP.
// PORT: Fixed ROM slots 8657.
                        if slot <> 8657 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8658 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:998
//		CAF	BITS4&5			# SEND ZERO AND COARSE.
// PORT: Fixed ROM slots 8658.
                            if slot <> 8658 or instruction <> 14871 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:999
//		EXTEND
// PORT: Fixed ROM slots 8659.
                            if slot <> 8659 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8660 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1000
//		WOR	CHAN12
// PORT: Fixed ROM slots 8660.
                        if slot <> 8660 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8661 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1001
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1002
//CAGESUB1	CS	DSPTAB +11D		# TURN ON NO ATT LAMP
// PORT: Fixed ROM slots 8661.
                            if slot <> 8661 or instruction <> 16926 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 542).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1003
//		MASK	OC40010
// PORT: Fixed ROM slots 8662.
                            if slot <> 8662 or instruction <> 30187 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1515), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8668 {
                if slot <= 8665 {
                    if slot <= 8663 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1004
//		ADS	DSPTAB +11D
// PORT: Fixed ROM slots 8663.
                        if slot <> 8663 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8664 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1005
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1006
//CAGESUB2	CS	IMODES30		# SET FLAGS TO INDICATE CAGING OR TURN-ON
// PORT: Fixed ROM slots 8664.
                            if slot <> 8664 or instruction <> 17104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 720).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1007
//		MASK	OCT75			# AND INHIBIT ALL ISS WARNING INFO
// PORT: Fixed ROM slots 8665.
                            if slot <> 8665 or instruction <> 30189 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1517), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8666 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1008
//		ADS	IMODES30
// PORT: Fixed ROM slots 8666.
                        if slot <> 8666 or instruction <> 11984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8667 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1009
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1010
//		CS	IMODES33		# DISABLE DAP AUTO AND HOLD MODES
// PORT: Fixed ROM slots 8667.
                            if slot <> 8667 or instruction <> 17105 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 721).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1011
//		MASK	BIT6
// PORT: Fixed ROM slots 8668.
                            if slot <> 8668 or instruction <> 31242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                if fixedOperand = 32 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
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
                if slot <= 8671 {
                    if slot <= 8669 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1012
//		ADS	IMODES33
// PORT: Fixed ROM slots 8669.
                        if slot <> 8669 or instruction <> 11985 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8670 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1013
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1014
//		TC	Q
// PORT: Fixed ROM slots 8670.
                            if slot <> 8670 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1015
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1016
//IMUFAIL		EQUALS	SETISSW
// PORT: SOURCE T4RUPT_PROGRAM.agc:1017
//ICDUFAIL	EQUALS	SETISSW
// PORT: SOURCE T4RUPT_PROGRAM.agc:1018
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1019
//# Page 159
// PORT: SOURCE T4RUPT_PROGRAM.agc:1020
//# JUMP TABLES AND CONSTANTS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:1021
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1022
//IFAILJMP	TCF	ITURNON			# CHANNEL 30 DISPATCH.
// PORT: Fixed ROM slots 8671.
                            if slot <> 8671 or instruction <> 5462 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5462, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8672 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1023
//		TCF	IMUFAIL
// PORT: Fixed ROM slots 8672.
                        if slot <> 8672 or instruction <> 5557 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5557, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8673 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1024
//		TCF	ICDUFAIL
// PORT: Fixed ROM slots 8673.
                            if slot <> 8673 or instruction <> 5557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1025
//		TCF	IMUCAGE
// PORT: Fixed ROM slots 8674.
                            if slot <> 8674 or instruction <> 5485 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5485, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[498] to agcAotUnit498@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1026
//30RDMSK		OCT	76400			# (BIT 10 NOT SAMPLED HERE).
// PORT: Fixed ROM slots 8675.
    8675, 64000
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8676–8682.
function agcAotUnit499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8678 {
        if slot <= 8676 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1027
//		TCF	IMUOP
// PORT: Fixed ROM slots 8676.
            if slot <> 8676 or instruction <> 5508 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5508, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8677 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1028
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1029
//C33JMP		TCF	PIPFAIL			# CHANNEL 33 DISPATCH.
// PORT: Fixed ROM slots 8677.
                if slot <> 8677 or instruction <> 5530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1030
//		TCF	DNTMFAST
// PORT: Fixed ROM slots 8678.
                if slot <> 8678 or instruction <> 5547 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5547, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8680 {
            if slot <= 8679 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1031
//		TCF	UPTMFAST
// PORT: Fixed ROM slots 8679.
                if slot <> 8679 or instruction <> 5552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1032
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1033
//# SUBROUTINE TO SKIP IF LAMP TEST NOT IN PROGRESS.
// PORT: SOURCE T4RUPT_PROGRAM.agc:1034
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1035
//LAMPTEST	CS	IMODES33		# BIT 1 OF IMODES33 = 1 IF LAMP TEST IN
// PORT: Fixed ROM slots 8680.
                if slot <> 8680 or instruction <> 17105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 721).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8681 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1036
//		MASK	BIT1			# PROGRESS.
// PORT: Fixed ROM slots 8681.
                if slot <> 8681 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:1037
//		TCF	ZOPFIN3
// PORT: Fixed ROM slots 8682.
                if slot <> 8682 or instruction <> 5685 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5685, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[499] to agcAotUnit499@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1038
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1039
//33RDMSK		EQUALS	PRIO16
// PORT: SOURCE T4RUPT_PROGRAM.agc:1040
//OC40010		OCT	40010
// PORT: Fixed ROM slots 8683.
    8683, 32784,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1041
//OCT54		OCT	54
// PORT: Fixed ROM slots 8684.
    8684, 88,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1042
//OCT75		OCT	75
// PORT: Fixed ROM slots 8685.
    8685, 122,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1043
//OCT272		OCT	00272
// PORT: Fixed ROM slots 8686.
    8686, 372,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1044
//BITS7&8		OCT	300
// PORT: Fixed ROM slots 8687.
    8687, 384,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1045
//OCT1720		OCT	1720
// PORT: Fixed ROM slots 8688.
    8688, 1952,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1046
//OCT740		OCT	00740
// PORT: Fixed ROM slots 8689.
    8689, 960,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1047
//OCT15000	EQUALS	PRIO15
// PORT: SOURCE T4RUPT_PROGRAM.agc:1048
//OCT77000	OCT	77000
// PORT: Fixed ROM slots 8690.
    8690, 64512,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1049
//-BIT10		OCT	-1000
// PORT: Fixed ROM slots 8691.
    8691, 64510,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1050
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1051
//90SECS		DEC	9000
// PORT: Fixed ROM slots 8692.
    8692, 18000
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8693–8737.
function agcAotUnit500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8714 {
        if slot <= 8703 {
            if slot <= 8697 {
                if slot <= 8694 {
                    if slot <= 8693 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1052
//120MS		=	OCT14			# (DEC12)
// PORT: SOURCE T4RUPT_PROGRAM.agc:1053
//GLOCKOK		EQUALS	RESUME
// PORT: SOURCE T4RUPT_PROGRAM.agc:1054
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1055
//# Page 160
// PORT: SOURCE T4RUPT_PROGRAM.agc:1056
//# OPTICS MONITORING AND ZERO ROUTINES
// PORT: SOURCE T4RUPT_PROGRAM.agc:1057
//OPTMON		CA	OPTMODES		# MONITOR OPTICS INBITS IN CHAN 30 AND 33
// PORT: Fixed ROM slots 8693.
                        if slot <> 8693 or instruction <> 13017 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1058
//		EXTEND
// PORT: Fixed ROM slots 8694.
                        if slot <> 8694 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8695 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1059
//		RXOR	CHAN30			# LOOK FOR OCDU FAIL BIT CHANGE
// PORT: Fixed ROM slots 8695.
                        if slot <> 8695 or instruction <> 3096 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 24, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8696 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1060
//		MASK	BIT7
// PORT: Fixed ROM slots 8696.
                            if slot <> 8696 or instruction <> 31241 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:1061
//		TS	RUPTREG1		# STORE CHANGE BIT
// PORT: Fixed ROM slots 8697.
                            if slot <> 8697 or instruction <> 22584 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22584, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8700 {
                    if slot <= 8698 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1062
//		CCS	A
// PORT: Fixed ROM slots 8698.
                        if slot <> 8698 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8699 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1063
//		TC	OCDUFTST		# PROCESS OCDUFAIL BIT CHANGE
// PORT: Fixed ROM slots 8699.
                            if slot <> 8699 or instruction <> 1684 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1684, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1064
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1065
//33OPTMON	CCS	OPTIND			# BYPASS IF TVC TAKEOVER
// PORT: Fixed ROM slots 8700.
                            if slot <> 8700 or instruction <> 4803 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 707).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8701 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1066
//		TCF	+4
// PORT: Fixed ROM slots 8701.
                        if slot <> 8701 or instruction <> 5633 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5633, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8702 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1067
//		TCF	+3
// PORT: Fixed ROM slots 8702.
                            if slot <> 8702 or instruction <> 5633 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5633, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1068
//		TCF	+2
// PORT: Fixed ROM slots 8703.
                            if slot <> 8703 or instruction <> 5633 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5633, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8708 {
                if slot <= 8705 {
                    if slot <= 8704 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1069
//		TCF	RESUME
// PORT: Fixed ROM slots 8704.
                        if slot <> 8704 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1070
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1071
//		CA	OPTMODES		# LOOK FOR OPTICS MODE SWITCH CHANGE
// PORT: Fixed ROM slots 8705.
                        if slot <> 8705 or instruction <> 13017 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8706 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1072
//		EXTEND
// PORT: Fixed ROM slots 8706.
                        if slot <> 8706 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8707 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1073
//		RXOR	CHAN33
// PORT: Fixed ROM slots 8707.
                            if slot <> 8707 or instruction <> 3099 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 27, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1074
//		MASK	OCTHIRTY
// PORT: Fixed ROM slots 8708.
                            if slot <> 8708 or instruction <> 31255 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                                if fixedOperand = 24 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4) * 8).
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
                if slot <= 8711 {
                    if slot <= 8709 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1075
//		ADS	RUPTREG1		# STORE INBIT CHANGES
// PORT: Fixed ROM slots 8709.
                        if slot <> 8709 or instruction <> 11320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8710 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1076
//		LXCH	OPTMODES
// PORT: Fixed ROM slots 8710.
                            if slot <> 8710 or instruction <> 9945 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 729, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1077
//		EXTEND
// PORT: Fixed ROM slots 8711.
                            if slot <> 8711 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8712 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1078
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8712.
                        if slot <> 8712 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8713 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1079
//		TS	OPTMODES		# UPDATE OPTMODES TO SHOW BIT CHANGES
// PORT: Fixed ROM slots 8713.
                            if slot <> 8713 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1080
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1081
//		COM				# SAMPLE CURRENT SWITCH SETTING
// PORT: Fixed ROM slots 8714.
                            if slot <> 8714 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8725 {
            if slot <= 8719 {
                if slot <= 8716 {
                    if slot <= 8715 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1082
//		MASK	OCTHIRTY
// PORT: Fixed ROM slots 8715.
                        if slot <> 8715 or instruction <> 31255 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                            if fixedOperand = 24 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4) * 8).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1083
//		EXTEND
// PORT: Fixed ROM slots 8716.
                        if slot <> 8716 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8717 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1084
//		BZF	SETSAMP			# MANUAL-SET ZERO IN SWSAMPLE
// PORT: Fixed ROM slots 8717.
                        if slot <> 8717 or instruction <> 5650 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5650, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8718 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1085
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1086
//		MASK	BIT5			# SEE IF CSC
// PORT: Fixed ROM slots 8718.
                            if slot <> 8718 or instruction <> 31243 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                                if fixedOperand = 16 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1087
//		CCS	A
// PORT: Fixed ROM slots 8719.
                            if slot <> 8719 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8722 {
                    if slot <= 8720 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1088
//		TC	+2			# CSC-SET SWSAMPLE POS
// PORT: Fixed ROM slots 8720.
                        if slot <> 8720 or instruction <> 1554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1554, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8721 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1089
//		CAF	NEGONE			# ZOPTICS-SET SWSAMPLE (-1)
// PORT: Fixed ROM slots 8721.
                            if slot <> 8721 or instruction <> 16334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1090
//SETSAMP		TS	SWSAMPLE		# CURRENT OPTICS SWITCH SETTING
// PORT: Fixed ROM slots 8722.
                            if slot <> 8722 or instruction <> 23244 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23244, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8723 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1091
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1092
//PROCESSW	CCS	DESOPMOD		# BRANCH ON PREVIOUS SETTING
// PORT: Fixed ROM slots 8723.
                        if slot <> 8723 or instruction <> 4813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 717).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8724 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1093
//		TC	CSCDES			# CSC
// PORT: Fixed ROM slots 8724.
                            if slot <> 8724 or instruction <> 1621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1094
//		TC	MANUDES			# MANUAL
// PORT: Fixed ROM slots 8725.
                            if slot <> 8725 or instruction <> 1599 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1599, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8731 {
                if slot <= 8728 {
                    if slot <= 8726 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1095
//		TC	ZOPTDES			# ZERO OPTICS
// PORT: Fixed ROM slots 8726.
                        if slot <> 8726 or instruction <> 1559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8727 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1096
//# Page 161
// PORT: SOURCE T4RUPT_PROGRAM.agc:1097
//ZOPTDES		CCS	SWSAMPLE		# IS SWITCH STILL AT ZOPTICS
// PORT: Fixed ROM slots 8727.
                            if slot <> 8727 or instruction <> 4812 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 716).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1098
//		TC	ZTOCSC			# NOW AT CSC
// PORT: Fixed ROM slots 8728.
                            if slot <> 8728 or instruction <> 1575 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1575, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8729 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1099
//		TC	ZTOMAN			# MANUAL
// PORT: Fixed ROM slots 8729.
                        if slot <> 8729 or instruction <> 1567 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1567, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8730 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1100
//		TC	ZOPFIN1			# ZOPTICS-SEE IF ZOPT PROCESSING	// Should be TC ZOPFINI
// PORT: Fixed ROM slots 8730.
                            if slot <> 8730 or instruction <> 1583 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1583, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1101
//		TC	SETDESMD		# ZOPT NOT PROCESSING-NO ACTION
// PORT: Fixed ROM slots 8731.
                            if slot <> 8731 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8734 {
                    if slot <= 8732 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1102
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1103
//		CCS	ZOPTCNT			# ZOPT PROCESSING-CHECK COUNTER
// PORT: Fixed ROM slots 8732.
                        if slot <> 8732 or instruction <> 4815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 719).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8733 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1104
//		TC	SETCNT			# 32 SAMPLE NOT FINISHED-SET COUNTER
// PORT: Fixed ROM slots 8733.
                            if slot <> 8733 or instruction <> 1643 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1643, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1105
//		TC	SETZOEND		# 32 SAMPLE WAIT COMPLETED-SET UP ZOP END
// PORT: Fixed ROM slots 8734.
                            if slot <> 8734 or instruction <> 1647 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1647, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8735 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1106
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1107
//ZTOMAN		TC	ZOPFIN1			# ZOP TO MANUAL-IS ZOPT DONE		// Should be TC ZOPFINI
// PORT: Fixed ROM slots 8735.
                        if slot <> 8735 or instruction <> 1583 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1583, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8736 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1108
//		TC	SETDESMD		# YES-NORMAL EXIT
// PORT: Fixed ROM slots 8736.
                            if slot <> 8736 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1109
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1110
//ZOPALARM	TC	ALARM			# ALARM-SWITCHED ALTERED WHILE ZOPTICS
// PORT: Fixed ROM slots 8737.
                            if slot <> 8737 or instruction <> 2984 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2984, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[500] to agcAotUnit500@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1111
//		OCT	00116
// PORT: Fixed ROM slots 8738.
    8738, 156
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8739–8745.
function agcAotUnit501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8741 {
        if slot <= 8739 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1112
//		CAF	OCT13			# PROCESSING-SET RETURN OPTION
// PORT: Fixed ROM slots 8739.
            if slot <> 8739 or instruction <> 14868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8740 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1113
//		TS	WTOPTION
// PORT: Fixed ROM slots 8740.
                if slot <> 8740 or instruction <> 23246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23246, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1114
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1115
//		TC	CANZOPT			# CANCEL ZOPT
// PORT: Fixed ROM slots 8741.
                if slot <> 8741 or instruction <> 1592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8743 {
            if slot <= 8742 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1116
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1117
//		TC	SETDESMD
// PORT: Fixed ROM slots 8742.
                if slot <> 8742 or instruction <> 1644 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1644, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1118
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1119
//ZTOCSC		TC	ZOPFIN1			# SEE IF ZOPT PROCESSING		// Should be TC ZOPFINI
// PORT: Fixed ROM slots 8743.
                if slot <> 8743 or instruction <> 1583 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1583, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8744 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1120
//		TC	MANTOCSC +3		# NO-CHECK RETURN TO COARS OPT
// PORT: Fixed ROM slots 8744.
                if slot <> 8744 or instruction <> 1613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1121
//		TC	ALARM			# ZOPT PROCESSING-ALARM
// PORT: Fixed ROM slots 8745.
                if slot <> 8745 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[501] to agcAotUnit501@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1122
//		OCT	00116
// PORT: Fixed ROM slots 8746.
    8746, 156
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8747–8753.
function agcAotUnit502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8749 {
        if slot <= 8747 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1123
//		TC	CANZOPT			# CANCEL ZOPT
// PORT: Fixed ROM slots 8747.
            if slot <> 8747 or instruction <> 1592 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1592, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8748 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1124
//		TC	MANTOCSC		# ZERO CNT-LOOK FOR COARS OPT RETURN
// PORT: Fixed ROM slots 8748.
                if slot <> 8748 or instruction <> 1610 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1610, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1125
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1126
//COARSLOK	CAF	BIT9			# IF COARS OPT SINCE FSTART GO TO L+2
// PORT: Fixed ROM slots 8749.
                if slot <> 8749 or instruction <> 14855 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8751 {
            if slot <= 8750 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1127
//		TCF	ZOPFIN2			# IF NOT GO TO L+1
// PORT: Fixed ROM slots 8750.
                if slot <> 8750 or instruction <> 5684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5684, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1128
//ZOPFIN1		CAF	BIT1			# SEE IF END ZOPT TASK WORKING	// Label should be ZOPFINI
// PORT: Fixed ROM slots 8751.
                if slot <> 8751 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
            if slot <= 8752 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1129
//		MASK	OPTMODES
// PORT: Fixed ROM slots 8752.
                if slot <> 8752 or instruction <> 29401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 729).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1130
//		CCS	A
// PORT: Fixed ROM slots 8753.
                if slot <> 8753 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[502] to agcAotUnit502@.

// PORT: Physical bank 06. Shared continuation entries, slots 8754–8819.
function agcAotUnit503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8786 {
        if slot <= 8769 {
            if slot <= 8761 {
                if slot <= 8757 {
                    if slot <= 8755 {
                        if slot <= 8754 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1131
//		TC	RESUME			# ZOPT TASK WORKING-WAIT ONE SAMPLE PERIOD
// PORT: Fixed ROM slots 8754.
                            if slot <> 8754 or instruction <> 2779 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2779, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1132
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1133
//		CAF	BIT3			# TEST IF ZOPTICS PROCESSING
// PORT: Fixed ROM slots 8755.
                            if slot <> 8755 or instruction <> 14861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8756 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1134
//ZOPFIN2		MASK	OPTMODES		# RETURNS TO L+1 PROCESSING AND
// PORT: Fixed ROM slots 8756.
                            if slot <> 8756 or instruction <> 29401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1135
//ZOPFIN3		CCS	A
// PORT: Fixed ROM slots 8757.
                            if slot <> 8757 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 8759 {
                        if slot <= 8758 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1136
//		INCR	Q			# L+2 IF NOT
// PORT: Fixed ROM slots 8758.
                            if slot <> 8758 or instruction <> 10242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1137
//		TC	Q
// PORT: Fixed ROM slots 8759.
                            if slot <> 8759 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8760 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1138
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1139
//CANZOPT		CS	SIX			# CANCEL ZERO OPTICS
// PORT: Fixed ROM slots 8760.
                            if slot <> 8760 or instruction <> 19593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1140
//		MASK	OPTMODES		# ZERO ZOPT PROCESSING BIT-ENABLE OCDUFAIL
// PORT: Fixed ROM slots 8761.
                            if slot <> 8761 or instruction <> 29401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8765 {
                    if slot <= 8763 {
                        if slot <= 8762 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1141
//		TS	OPTMODES
// PORT: Fixed ROM slots 8762.
                            if slot <> 8762 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1142
//		CS	BIT1			# MAKE SURE ZERO OCDU IS OFF
// PORT: Fixed ROM slots 8763.
                            if slot <> 8763 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8764 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1143
//		EXTEND
// PORT: Fixed ROM slots 8764.
                            if slot <> 8764 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1144
//		WAND	CHAN12
// PORT: Fixed ROM slots 8765.
                            if slot <> 8765 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8767 {
                        if slot <= 8766 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1145
//		TC	Q
// PORT: Fixed ROM slots 8766.
                            if slot <> 8766 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1146
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1147
//# Page 162
// PORT: SOURCE T4RUPT_PROGRAM.agc:1148
//MANUDES		CCS	SWSAMPLE		# SEE IF SWITCH STILL IN MANUAL MODE
// PORT: Fixed ROM slots 8767.
                            if slot <> 8767 or instruction <> 4812 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 716).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8768 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1149
//		TC	MANTOCSC		# NOW AT CSC
// PORT: Fixed ROM slots 8768.
                            if slot <> 8768 or instruction <> 1610 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1610, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1150
//		TC	MANTOMAN		# STILL MANUAL
// PORT: Fixed ROM slots 8769.
                            if slot <> 8769 or instruction <> 1607 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1607, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8777 {
                if slot <= 8773 {
                    if slot <= 8771 {
                        if slot <= 8770 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1151
//		CCS	WTOPTION		# ZOPTICS-LOOK AT ZOPTICS RETURN OPTION
// PORT: Fixed ROM slots 8770.
                            if slot <> 8770 or instruction <> 4814 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 718).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1152
//		TC	+2			# 5 SEC RETURN GOOD-CONTINUE ZOPTICS
// PORT: Fixed ROM slots 8771.
                            if slot <> 8771 or instruction <> 1605 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1605, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8772 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1153
//		TC	OPTZERO			# ZOPTICS MUST START ANEW
// PORT: Fixed ROM slots 8772.
                            if slot <> 8772 or instruction <> 1641 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1154
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1155
//		TC	INITZOPT		# SHOW ZERO OPTICS PROCESSING
// PORT: Fixed ROM slots 8773.
                            if slot <> 8773 or instruction <> 1678 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1678, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8775 {
                        if slot <= 8774 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1156
//		TC	SETDESMD		# NORMAL EXIT
// PORT: Fixed ROM slots 8774.
                            if slot <> 8774 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1157
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1158
//MANTOMAN	CCS	WTOPTION		# DECREMENT RETURN OPTION TIME
// PORT: Fixed ROM slots 8775.
                            if slot <> 8775 or instruction <> 4814 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 718).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8776 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1159
//		TS	WTOPTION
// PORT: Fixed ROM slots 8776.
                            if slot <> 8776 or instruction <> 23246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23246, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1160
//		TC	SETDESMD
// PORT: Fixed ROM slots 8777.
                            if slot <> 8777 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8781 {
                    if slot <= 8779 {
                        if slot <= 8778 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1161
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1162
//MANTOCSC	CAF	ZERO			# CANCEL ZOPT RETURN OPTION IF SET
// PORT: Fixed ROM slots 8778.
                            if slot <> 8778 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1163
//		TS	WTOPTION
// PORT: Fixed ROM slots 8779.
                            if slot <> 8779 or instruction <> 23246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23246, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8780 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1164
//		TS	ZOPTCNT
// PORT: Fixed ROM slots 8780.
                            if slot <> 8780 or instruction <> 23247 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23247, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1165
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1166
//		TC	COARSLOK		# CHECK FOR COARS OPT RETURN
// PORT: Fixed ROM slots 8781.
                            if slot <> 8781 or instruction <> 1581 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1581, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8783 {
                        if slot <= 8782 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1167
//		TC	SETDESMD		# NO COARS TASK-NO ACTION
// PORT: Fixed ROM slots 8782.
                            if slot <> 8782 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1168
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1169
//		CAF	ONE			# SET COARS OPT WORKING
// PORT: Fixed ROM slots 8783.
                            if slot <> 8783 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                        if slot <= 8784 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1170
//		TS	OPTIND
// PORT: Fixed ROM slots 8784.
                            if slot <> 8784 or instruction <> 23235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23235, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 8785 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1171
//		CAF	BIT2			# ENABLE OPTICS CDU ERROR CNTS
// PORT: Fixed ROM slots 8785.
                                if slot <> 8785 or instruction <> 14862 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1172
//		EXTEND
// PORT: Fixed ROM slots 8786.
                                if slot <> 8786 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 8802 {
            if slot <= 8794 {
                if slot <= 8790 {
                    if slot <= 8788 {
                        if slot <= 8787 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1173
//		WOR	CHAN12
// PORT: Fixed ROM slots 8787.
                            if slot <> 8787 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1174
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1175
//		TC	SETDESMD
// PORT: Fixed ROM slots 8788.
                            if slot <> 8788 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8789 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1176
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1177
//CSCDES		CCS	SWSAMPLE		# SEE IF SWITCH STILL AT CSC
// PORT: Fixed ROM slots 8789.
                            if slot <> 8789 or instruction <> 4812 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 716).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1178
//		TC	SETDESMD		# STILL AT CSC
// PORT: Fixed ROM slots 8790.
                            if slot <> 8790 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8792 {
                        if slot <= 8791 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1179
//		TC	CSCTOMAN		# MANUAL
// PORT: Fixed ROM slots 8791.
                            if slot <> 8791 or instruction <> 1627 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1627, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1180
//CSCTOZOP	CAF	OCT40			# ZOPTICS-INITIALIZE FOR ZOPT
// PORT: Fixed ROM slots 8792.
                            if slot <> 8792 or instruction <> 14858 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8793 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1181
//		TS	ZOPTCNT
// PORT: Fixed ROM slots 8793.
                            if slot <> 8793 or instruction <> 23247 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23247, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1182
//		TC	INITZOPT
// PORT: Fixed ROM slots 8794.
                            if slot <> 8794 or instruction <> 1678 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1678, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8798 {
                    if slot <= 8796 {
                        if slot <= 8795 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1183
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1184
//CSCTOMAN	CCS	OPTIND			# SEE IF COARS WORKING
// PORT: Fixed ROM slots 8795.
                            if slot <> 8795 or instruction <> 4803 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 707).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1185
//		TC	CANCOARS		# COARS WORKING-SWITCH NOT CSC-KILL COARS
// PORT: Fixed ROM slots 8796.
                            if slot <> 8796 or instruction <> 1632 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1632, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8797 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1186
//		TC	CANCOARS
// PORT: Fixed ROM slots 8797.
                            if slot <> 8797 or instruction <> 1632 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1632, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1187
//		TC	+1			# NO COARS-NORMAL EXIT
// PORT: Fixed ROM slots 8798.
                            if slot <> 8798 or instruction <> 1631 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1631, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8800 {
                        if slot <= 8799 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1188
//		TC	SETDESMD
// PORT: Fixed ROM slots 8799.
                            if slot <> 8799 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1189
//# Page 163
// PORT: SOURCE T4RUPT_PROGRAM.agc:1190
//CANCOARS	CA	NEGONE
// PORT: Fixed ROM slots 8800.
                            if slot <> 8800 or instruction <> 16334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8801 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1191
//		TS	OPTIND			# SET OPTIND (-1) TO SHOW NOT WORKING
// PORT: Fixed ROM slots 8801.
                            if slot <> 8801 or instruction <> 23235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23235, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1192
//		CS	BIT2			# DISABLE OCDU ERR CNTS
// PORT: Fixed ROM slots 8802.
                            if slot <> 8802 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8810 {
                if slot <= 8806 {
                    if slot <= 8804 {
                        if slot <= 8803 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1193
//		EXTEND
// PORT: Fixed ROM slots 8803.
                            if slot <> 8803 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1194
//		WAND	CHAN12
// PORT: Fixed ROM slots 8804.
                            if slot <> 8804 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8805 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1195
//		CS	OPTMODES		# SET RETURN-TO-COARS BIT
// PORT: Fixed ROM slots 8805.
                            if slot <> 8805 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1196
//		MASK	BIT9
// PORT: Fixed ROM slots 8806.
                            if slot <> 8806 or instruction <> 31239 { return choose false if checkOnly else -1. }
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
                        }
                    }
                } else {
                    if slot <= 8808 {
                        if slot <= 8807 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1197
//		ADS	OPTMODES
// PORT: Fixed ROM slots 8807.
                            if slot <> 8807 or instruction <> 11993 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1198
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1199
//		TC	SETDESMD
// PORT: Fixed ROM slots 8808.
                            if slot <> 8808 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8809 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1200
//OPTZERO		TC	INITZOPT		# INITIALIZE ZERO OPTICS
// PORT: Fixed ROM slots 8809.
                            if slot <> 8809 or instruction <> 1678 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1678, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1201
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1202
//		CA	OCT40			# SET UP 32 SAMPLE WAIT
// PORT: Fixed ROM slots 8810.
                            if slot <> 8810 or instruction <> 14858 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8814 {
                    if slot <= 8812 {
                        if slot <= 8811 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1203
//SETCNT		TS	ZOPTCNT
// PORT: Fixed ROM slots 8811.
                            if slot <> 8811 or instruction <> 23247 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23247, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1204
//SETDESMD	CA	SWSAMPLE		# SET CURRENT SWITCH INDICATION-RESUME
// PORT: Fixed ROM slots 8812.
                            if slot <> 8812 or instruction <> 13004 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 716).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8813 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1205
//		TS	DESOPMOD
// PORT: Fixed ROM slots 8813.
                            if slot <> 8813 or instruction <> 23245 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23245, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1206
//		TC	RESUME
// PORT: Fixed ROM slots 8814.
                            if slot <> 8814 or instruction <> 2779 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2779, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8816 {
                        if slot <= 8815 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1207
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1208
//SETZOEND	CAF	BIT1			# SEND ZERO OPTICS CDU
// PORT: Fixed ROM slots 8815.
                            if slot <> 8815 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1209
//		EXTEND
// PORT: Fixed ROM slots 8816.
                            if slot <> 8816 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8817 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1210
//		WOR	CHAN12
// PORT: Fixed ROM slots 8817.
                            if slot <> 8817 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 8818 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1211
//		CA	200MS			# HOLD ZERO CDU FOR 200 MS
// PORT: Fixed ROM slots 8818.
                                if slot <> 8818 or instruction <> 14410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1212
//		TC	WAITLIST
// PORT: Fixed ROM slots 8819.
                                if slot <> 8819 or instruction <> 2725 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[503] to agcAotUnit503@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1213
//		EBANK=	OPTMODES
// PORT: SOURCE T4RUPT_PROGRAM.agc:1214
//		2CADR	ENDZOPT
// PORT: Fixed ROM slots 8820 8821.
    8820, 3316, 8821, 12388
)).

// PORT: Physical bank 06. Shared continuation entries, slots 8822–8880.
function agcAotUnit504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8850 {
        if slot <= 8835 {
            if slot <= 8828 {
                if slot <= 8824 {
                    if slot <= 8822 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1215
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1216
//		CS	OPTMODES		# SHOW ZOPTICS TASK WORKING
// PORT: Fixed ROM slots 8822.
                        if slot <> 8822 or instruction <> 17113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 729).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8823 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1217
//		MASK	BIT1
// PORT: Fixed ROM slots 8823.
                            if slot <> 8823 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:1218
//		ADS	OPTMODES
// PORT: Fixed ROM slots 8824.
                            if slot <> 8824 or instruction <> 11993 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8826 {
                        if slot <= 8825 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1219
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1220
//		TC	SETDESMD
// PORT: Fixed ROM slots 8825.
                            if slot <> 8825 or instruction <> 1644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1221
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1222
//ENDZOPT		TC	ZEROPCDU		# ZERO OCDU COUNTERS
// PORT: Fixed ROM slots 8826.
                            if slot <> 8826 or instruction <> 1672 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1672, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8827 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1223
//		CS	BIT1			# TURN OFF ZERO OCDU
// PORT: Fixed ROM slots 8827.
                            if slot <> 8827 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1224
//		EXTEND
// PORT: Fixed ROM slots 8828.
                            if slot <> 8828 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8831 {
                    if slot <= 8829 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1225
//		WAND	CHAN12
// PORT: Fixed ROM slots 8829.
                        if slot <> 8829 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8830 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1226
//		CAF	200MS			# DELAY 200MS FOR CDUS TO RESYNCHRONIZE
// PORT: Fixed ROM slots 8830.
                            if slot <> 8830 or instruction <> 14410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1227
//		TC	VARDELAY
// PORT: Fixed ROM slots 8831.
                            if slot <> 8831 or instruction <> 2746 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2746, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8833 {
                        if slot <= 8832 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1228
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1229
//		CS	OPTMODES		# SHOW ZOPTICS SINCE LAST FRESH START
// PORT: Fixed ROM slots 8832.
                            if slot <> 8832 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1230
//		MASK	BIT10			#	OR RESTART
// PORT: Fixed ROM slots 8833.
                            if slot <> 8833 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
                        if slot <= 8834 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1231
//		ADS	OPTMODES
// PORT: Fixed ROM slots 8834.
                            if slot <> 8834 or instruction <> 11993 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1232
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1233
//		CS	SEVEN			# ENABLE OCDUFAIL-SHOW OPTICS COMPLETE
// PORT: Fixed ROM slots 8835.
                            if slot <> 8835 or instruction <> 18963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8842 {
                if slot <= 8838 {
                    if slot <= 8836 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1234
//		MASK	OPTMODES
// PORT: Fixed ROM slots 8836.
                        if slot <> 8836 or instruction <> 29401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8837 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1235
//		TS	OPTMODES
// PORT: Fixed ROM slots 8837.
                            if slot <> 8837 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1236
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1237
//		TC	OCDUFTST		# CHECK OCDU FAIL BIT AFTER ENABLE.
// PORT: Fixed ROM slots 8838.
                            if slot <> 8838 or instruction <> 1684 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1684, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8840 {
                        if slot <= 8839 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1238
//# Page 164
// PORT: SOURCE T4RUPT_PROGRAM.agc:1239
//		TC	TASKOVER
// PORT: Fixed ROM slots 8839.
                            if slot <> 8839 or instruction <> 2772 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2772, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1240
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1241
//ZEROPCDU	CAF	ZERO
// PORT: Fixed ROM slots 8840.
                            if slot <> 8840 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 8841 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1242
//		TS	CDUS			# ZERO IN CDUS, -20 IN CDUT
// PORT: Fixed ROM slots 8841.
                            if slot <> 8841 or instruction <> 22558 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22558, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1243
//		TS	ZONE			# INITIALIZE SHAFT MONITOR ZONE
// PORT: Fixed ROM slots 8842.
                            if slot <> 8842 or instruction <> 23239 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23239, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8846 {
                    if slot <= 8844 {
                        if slot <= 8843 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1244
//		CS	20DEGS
// PORT: Fixed ROM slots 8843.
                            if slot <> 8843 or instruction <> 18097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1713), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1245
//		TS	CDUT
// PORT: Fixed ROM slots 8844.
                            if slot <> 8844 or instruction <> 22557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8845 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1246
//		TC	Q
// PORT: Fixed ROM slots 8845.
                            if slot <> 8845 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1247
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1248
//INITZOPT	CAF	ZERO			# INITIALIZE ZOPTICS-INHIBIT OCDUFAIL
// PORT: Fixed ROM slots 8846.
                            if slot <> 8846 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 8848 {
                        if slot <= 8847 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1249
//		TS	WTOPTION		# AND SHOW OPTICS PROCESSING
// PORT: Fixed ROM slots 8847.
                            if slot <> 8847 or instruction <> 23246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23246, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1250
//		CS	OPTMODES		# SET ZERO OPTICS PROCESSING
// PORT: Fixed ROM slots 8848.
                            if slot <> 8848 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8849 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1251
//		MASK	SIX			#	OPTICS CDU FAIL INHIBITED
// PORT: Fixed ROM slots 8849.
                            if slot <> 8849 or instruction <> 31881 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                if fixedOperand = 6 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1252
//		ADS	OPTMODES
// PORT: Fixed ROM slots 8850.
                            if slot <> 8850 or instruction <> 11993 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8865 {
            if slot <= 8857 {
                if slot <= 8853 {
                    if slot <= 8851 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1253
//		TC	Q
// PORT: Fixed ROM slots 8851.
                        if slot <> 8851 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8852 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1254
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1255
//# Page 165
// PORT: SOURCE T4RUPT_PROGRAM.agc:1256
//OCDUFTST	CAF	BIT7			# SEE IF OCDUFAIL ON OR OFF
// PORT: Fixed ROM slots 8852.
                            if slot <> 8852 or instruction <> 14857 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1257
//		EXTEND
// PORT: Fixed ROM slots 8853.
                            if slot <> 8853 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8855 {
                        if slot <= 8854 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1258
//		RAND	CHAN30
// PORT: Fixed ROM slots 8854.
                            if slot <> 8854 or instruction <> 1048 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 24, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1259
//		CCS	A
// PORT: Fixed ROM slots 8855.
                            if slot <> 8855 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8856 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1260
//		TCF	OPFAILOF		# OCDUFAIL LIGHT OFF
// PORT: Fixed ROM slots 8856.
                            if slot <> 8856 or instruction <> 5802 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5802, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1261
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1262
//		CAF	BIT2			# OCDUFAIL LIGHT ON UNLESS INHIBITED
// PORT: Fixed ROM slots 8857.
                            if slot <> 8857 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
                if slot <= 8861 {
                    if slot <= 8859 {
                        if slot <= 8858 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1263
//		MASK	OPTMODES
// PORT: Fixed ROM slots 8858.
                            if slot <> 8858 or instruction <> 29401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1264
//		CCS	A
// PORT: Fixed ROM slots 8859.
                            if slot <> 8859 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8860 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1265
//		TC	Q			# OCDUFAIL INHIBITED
// PORT: Fixed ROM slots 8860.
                            if slot <> 8860 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1266
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1267
//OPFAILON	CAF	BIT8			# ON BIT
// PORT: Fixed ROM slots 8861.
                            if slot <> 8861 or instruction <> 14856 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8863 {
                        if slot <= 8862 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1268
//		AD	DSPTAB	+11D
// PORT: Fixed ROM slots 8862.
                            if slot <> 8862 or instruction <> 25118 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1269
//		MASK	BIT8
// PORT: Fixed ROM slots 8863.
                            if slot <> 8863 or instruction <> 31240 { return choose false if checkOnly else -1. }
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
                        if slot <= 8864 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1270
//SETOFF		EXTEND
// PORT: Fixed ROM slots 8864.
                            if slot <> 8864 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1271
//		BZF	TCQ			# NO CHANGE
// PORT: Fixed ROM slots 8865.
                            if slot <> 8865 or instruction <> 7625 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7625, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8872 {
                if slot <= 8868 {
                    if slot <= 8866 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1272
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1273
//		TS	L
// PORT: Fixed ROM slots 8866.
                        if slot <> 8866 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8867 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1274
//		CA	DSPTAB	+11D
// PORT: Fixed ROM slots 8867.
                            if slot <> 8867 or instruction <> 12830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1275
//		EXTEND
// PORT: Fixed ROM slots 8868.
                            if slot <> 8868 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8870 {
                        if slot <= 8869 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1276
//		RXOR	LCHAN
// PORT: Fixed ROM slots 8869.
                            if slot <> 8869 or instruction <> 3073 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1277
//		MASK	POSMAX
// PORT: Fixed ROM slots 8870.
                            if slot <> 8870 or instruction <> 31231 { return choose false if checkOnly else -1. }
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
                        if slot <= 8871 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1278
//		AD	BIT15			# SHOW ACTION WANTED
// PORT: Fixed ROM slots 8871.
                            if slot <> 8871 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE T4RUPT_PROGRAM.agc:1279
//		TS	DSPTAB	+11D
// PORT: Fixed ROM slots 8872.
                            if slot <> 8872 or instruction <> 23070 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23070, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8876 {
                    if slot <= 8874 {
                        if slot <= 8873 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1280
//		TC	Q
// PORT: Fixed ROM slots 8873.
                            if slot <> 8873 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1281
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1282
//OPFAILOF	CAF	BIT1			# DON'T TURN OFF IF LAMP TEST
// PORT: Fixed ROM slots 8874.
                            if slot <> 8874 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                        if slot <= 8875 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1283
//		MASK	IMODES33
// PORT: Fixed ROM slots 8875.
                            if slot <> 8875 or instruction <> 29393 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 721).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1284
//		CCS	A
// PORT: Fixed ROM slots 8876.
                            if slot <> 8876 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 8878 {
                        if slot <= 8877 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1285
//		TC	Q			# LAMP TEST IN PROGRESS
// PORT: Fixed ROM slots 8877.
                            if slot <> 8877 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1286
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1287
//		CAF	BIT8			# TURN OFF OCDUFAIL LIGHT
// PORT: Fixed ROM slots 8878.
                            if slot <> 8878 or instruction <> 14856 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 8879 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1288
//		MASK	DSPTAB	+11D
// PORT: Fixed ROM slots 8879.
                            if slot <> 8879 or instruction <> 29214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1289
//		TCF	SETOFF
// PORT: Fixed ROM slots 8880.
                            if slot <> 8880 or instruction <> 5792 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5792, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[504] to agcAotUnit504@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1290
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1291
//OCT13		=	ELEVEN
// PORT: SOURCE T4RUPT_PROGRAM.agc:1292
//OCTHIRTY	EQUALS	BITS4&5
// PORT: SOURCE T4RUPT_PROGRAM.agc:1293
//20DEGS		DEC	7199
// PORT: Fixed ROM slots 8881.
    8881, 14398
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10240–10268.
function agcAotUnit634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10253 {
        if slot <= 10246 {
            if slot <= 10242 {
                if slot <= 10240 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1294
//OCT40		EQUALS	BIT6
// PORT: SOURCE T4RUPT_PROGRAM.agc:1295
//200MS		EQUALS	OCT24
// PORT: SOURCE T4RUPT_PROGRAM.agc:1296
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1297
//# Page 166
// PORT: SOURCE T4RUPT_PROGRAM.agc:1298
//# OPTICS CDU DRIVING PROGRAM
// PORT: SOURCE T4RUPT_PROGRAM.agc:1299
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1300
//		BANK	10
// PORT: SOURCE T4RUPT_PROGRAM.agc:1301
//		SETLOC	OPTDRV
// PORT: SOURCE T4RUPT_PROGRAM.agc:1302
//		BANK
// PORT: SOURCE T4RUPT_PROGRAM.agc:1303
//		COUNT*	$$/SXT
// PORT: SOURCE T4RUPT_PROGRAM.agc:1304
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1305
//# SHAFT STOP MONITOR-ZONE UPDATE
// PORT: SOURCE T4RUPT_PROGRAM.agc:1306
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1307
//OPTDRIVE	CA	CDUS			# GRAB OPTIC SHAFT CDU
// PORT: Fixed ROM slots 10240.
                    if slot <> 10240 or instruction <> 12318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 30).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10241 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1308
//		TS	L
// PORT: Fixed ROM slots 10241.
                        if slot <> 10241 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1309
//		CCS	A			# GET ABS(CDUS)
// PORT: Fixed ROM slots 10242.
                        if slot <> 10242 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 10244 {
                    if slot <= 10243 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1310
//		AD	13,14,15
// PORT: Fixed ROM slots 10243.
                        if slot <> 10243 or instruction <> 28615 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1311
//		TCF	+2			# ABS(CDUS) - 45 DEG
// PORT: Fixed ROM slots 10244.
                        if slot <> 10244 or instruction <> 5126 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5126, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10245 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1312
//		TCF	-2
// PORT: Fixed ROM slots 10245.
                        if slot <> 10245 or instruction <> 5123 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5123, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1313
//		EXTEND
// PORT: Fixed ROM slots 10246.
                        if slot <> 10246 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10249 {
                if slot <= 10247 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1314
//		BZMF	OZONE			# LESS THAN 45 DEG-SET ZONE 0
// PORT: Fixed ROM slots 10247.
                    if slot <> 10247 or instruction <> 25614 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25614, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10248 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1315
//		CA	ZONE			# IF ZONE ZERO, CHANGE TO + OR - OTHERWISE
// PORT: Fixed ROM slots 10248.
                        if slot <> 10248 or instruction <> 12999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 711).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1316
//		EXTEND				# DON'T MESS WITH ZONE
// PORT: Fixed ROM slots 10249.
                        if slot <> 10249 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10251 {
                    if slot <= 10250 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1317
//		BZF	+2
// PORT: Fixed ROM slots 10250.
                        if slot <> 10250 or instruction <> 5132 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5132, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1318
//		TCF	CONTDRVE		# JUST CONTINUE
// PORT: Fixed ROM slots 10251.
                        if slot <> 10251 or instruction <> 5136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10252 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1319
//		XCH	L			# GREATER THAN 45 DEG-SET ZONE TO SIGN CDU
// PORT: Fixed ROM slots 10252.
                        if slot <> 10252 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1320
//		TCF	OZONE	+1
// PORT: Fixed ROM slots 10253.
                        if slot <> 10253 or instruction <> 5135 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5135, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 10260 {
            if slot <= 10256 {
                if slot <= 10254 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1321
//OZONE		CAF	ZERO			# ABS(CDUS) LESS THAN 90 DEG-ZONE ZERO
// PORT: Fixed ROM slots 10254.
                    if slot <> 10254 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10255 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1322
//		TS	ZONE
// PORT: Fixed ROM slots 10255.
                        if slot <> 10255 or instruction <> 23239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23239, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1323
//		COUNT*	$$/T4RUPT
// PORT: SOURCE T4RUPT_PROGRAM.agc:1324
//CONTDRVE	CCS	OPTIND
// PORT: Fixed ROM slots 10256.
                        if slot <> 10256 or instruction <> 4803 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10258 {
                    if slot <= 10257 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1325
//		TC	+4			# WORK COARS OPTICS
// PORT: Fixed ROM slots 10257.
                        if slot <> 10257 or instruction <> 1045 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1045, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1326
//		TC	+3			# WORK COARS OPTICS
// PORT: Fixed ROM slots 10258.
                        if slot <> 10258 or instruction <> 1045 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1045, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10259 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1327
//		TC	RESUME			# NO OPT
// PORT: Fixed ROM slots 10259.
                        if slot <> 10259 or instruction <> 2779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1328
//		TC	RESUME			# NO OPT
// PORT: Fixed ROM slots 10260.
                        if slot <> 10260 or instruction <> 2779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10264 {
                if slot <= 10262 {
                    if slot <= 10261 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1329
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1330
//		CA	SWSAMPLE		# SEE IF SWITCH AT CMC
// PORT: Fixed ROM slots 10261.
                        if slot <> 10261 or instruction <> 13004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 716).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1331
//		EXTEND
// PORT: Fixed ROM slots 10262.
                        if slot <> 10262 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10263 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1332
//		BZMF	RESUME			# ZERO (-1)	MANUAL (+0)
// PORT: Fixed ROM slots 10263.
                        if slot <> 10263 or instruction <> 27355 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 27355, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1333
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1334
//		CAF	BIT10			# SEE IF OCDUS ZEROED SINCE LAST FSTART
// PORT: Fixed ROM slots 10264.
                        if slot <> 10264 or instruction <> 14854 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10266 {
                    if slot <= 10265 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1335
//		MASK	OPTMODES
// PORT: Fixed ROM slots 10265.
                        if slot <> 10265 or instruction <> 29401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1336
//		CCS	A
// PORT: Fixed ROM slots 10266.
                        if slot <> 10266 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10267 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1337
//		TC	+3
// PORT: Fixed ROM slots 10267.
                        if slot <> 10267 or instruction <> 1054 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1054, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1338
//		TC	ALARM			# OPTICS NOT ZEROED
// PORT: Fixed ROM slots 10268.
                        if slot <> 10268 or instruction <> 2984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[634] to agcAotUnit634@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1339
//		OCT	00120
// PORT: Fixed ROM slots 10269.
    10269, 160
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10270–10279.
function agcAotUnit635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10274 {
        if slot <= 10271 {
            if slot <= 10270 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1340
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1341
//		CA	BIT2			# SEE IF ERR CNTS ENABLED
// PORT: Fixed ROM slots 10270.
                if slot <> 10270 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1342
//		EXTEND
// PORT: Fixed ROM slots 10271.
                if slot <> 10271 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10272 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1343
//		RAND	CHAN12
// PORT: Fixed ROM slots 10272.
                if slot <> 10272 or instruction <> 1034 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10273 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1344
//		EXTEND
// PORT: Fixed ROM slots 10273.
                    if slot <> 10273 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1345
//		BZF	SETBIT			# CNTS NOT ENABLED-DO IT AND RESUME
// PORT: Fixed ROM slots 10274.
                    if slot <> 10274 or instruction <> 5245 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5245, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10276 {
            if slot <= 10275 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1346
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1347
//		CAF	ONE			# INITIALIZE OPTIND
// PORT: Fixed ROM slots 10275.
                if slot <> 10275 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1348
//# Page 167
// PORT: SOURCE T4RUPT_PROGRAM.agc:1349
//OPT2		TS	OPTIND
// PORT: Fixed ROM slots 10276.
                if slot <> 10276 or instruction <> 23235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10277 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1350
//		EXTEND
// PORT: Fixed ROM slots 10277.
                if slot <> 10277 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10278 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1351
//		BZF	TRUNCMD			# CHECK TRUNION COMMAND
// PORT: Fixed ROM slots 10278.
                    if slot <> 10278 or instruction <> 5210 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5210, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1352
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1353
//GETOPCMD	INDEX	OPTIND
// PORT: Fixed ROM slots 10279.
                    if slot <> 10279 or instruction <> 21187 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21187, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21187, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[635] to agcAotUnit635@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1354
//		CA	DESOPTT			# PICK UP DESIRED OPT ANGLE
// PORT: Fixed ROM slots 10280.
    10280, 25824
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10281–10282.
function agcAotUnit636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10281 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1355
//		EXTEND
// PORT: Fixed ROM slots 10281.
        if slot <> 10281 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1356
//		INDEX	OPTIND
// PORT: Fixed ROM slots 10282.
        if slot <> 10282 or instruction <> 21187 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21187, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21187, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[636] to agcAotUnit636@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1357
//		MSU	CDUT			# GET DIFFERENCE
// PORT: Fixed ROM slots 10283.
    10283, 16442
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10284–10291.
function agcAotUnit637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10287 {
        if slot <= 10285 {
            if slot <= 10284 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1358
//		EXTEND
// PORT: Fixed ROM slots 10284.
                if slot <> 10284 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1359
//		MP	BIT13
// PORT: Fixed ROM slots 10285.
                if slot <> 10285 or instruction <> 31235 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2563, readEffective:call(words, 2563)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10286 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1360
//		XCH	L
// PORT: Fixed ROM slots 10286.
                if slot <> 10286 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1361
//		DOUBLE
// PORT: Fixed ROM slots 10287.
                if slot <> 10287 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
        if slot <= 10289 {
            if slot <= 10288 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1362
//		TS	ITEMP1
// PORT: Fixed ROM slots 10288.
                if slot <> 10288 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1363
//		TCF	+2			# NO OVFL
// PORT: Fixed ROM slots 10289.
                if slot <> 10289 or instruction <> 5171 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5171, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10290 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1364
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1365
//		ADS	L			# WITH OVFL
// PORT: Fixed ROM slots 10290.
                if slot <> 10290 or instruction <> 11265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1366
//STORCMD		INDEX	OPTIND
// PORT: Fixed ROM slots 10291.
                if slot <> 10291 or instruction <> 21187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21187, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21187, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[637] to agcAotUnit637@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1367
//		LXCH	COMMANDO		# STORE COMMAND
// PORT: Fixed ROM slots 10292.
    10292, 19850
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10293–10324.
function agcAotUnit638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10308 {
        if slot <= 10300 {
            if slot <= 10296 {
                if slot <= 10294 {
                    if slot <= 10293 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1368
//		CCS	OPTIND
// PORT: Fixed ROM slots 10293.
                        if slot <> 10293 or instruction <> 4803 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1369
//		TCF	OPT2			# GET NEXT COMMAND
// PORT: Fixed ROM slots 10294.
                        if slot <> 10294 or instruction <> 5156 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5156, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10295 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1370
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1371
//		TS	ITEMP1			# INITIALIZE SEND INDICATOR TO ZERO
// PORT: Fixed ROM slots 10295.
                        if slot <> 10295 or instruction <> 22577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22577, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1372
//		COUNT*	$$/SXT
// PORT: SOURCE T4RUPT_PROGRAM.agc:1373
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1374
//# SHAFT STOP AVOIDANCE
// PORT: SOURCE T4RUPT_PROGRAM.agc:1375
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1376
//		CCS	CDUS			# IF CDUS GREATER THAN + OR - 90 DEG CHECK
// PORT: Fixed ROM slots 10296.
                        if slot <> 10296 or instruction <> 4126 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 30).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10298 {
                    if slot <= 10297 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1377
//		AD	NEG1/2			# FOR POSSIBLE STOP PROBLEM
// PORT: Fixed ROM slots 10297.
                        if slot <> 10297 or instruction <> 27136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1378
//		TCF	+2
// PORT: Fixed ROM slots 10298.
                        if slot <> 10298 or instruction <> 5180 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5180, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10299 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1379
//		TCF	-2
// PORT: Fixed ROM slots 10299.
                        if slot <> 10299 or instruction <> 5177 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5177, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1380
//		EXTEND
// PORT: Fixed ROM slots 10300.
                        if slot <> 10300 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10304 {
                if slot <= 10302 {
                    if slot <= 10301 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1381
//		BZMF	CMDSETUP		# CDU LESS THAN 90 DEG, NO PROBLEMS
// PORT: Fixed ROM slots 10301.
                        if slot <> 10301 or instruction <> 25682 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25682, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1382
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1383
//		CA	ZONE
// PORT: Fixed ROM slots 10302.
                        if slot <> 10302 or instruction <> 12999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 711).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10303 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1384
//		EXTEND
// PORT: Fixed ROM slots 10303.
                        if slot <> 10303 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1385
//		BZF	CMDSETUP		# ZONE=3, NORMAL COMMAND
// PORT: Fixed ROM slots 10304.
                        if slot <> 10304 or instruction <> 5202 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5202, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10306 {
                    if slot <= 10305 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1386
//		MASK	BIT15			# GRAB SIGN OF ZONE
// PORT: Fixed ROM slots 10305.
                        if slot <> 10305 or instruction <> 31233 { return choose false if checkOnly else -1. }
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
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1387
//		TS	L
// PORT: Fixed ROM slots 10306.
                        if slot <> 10306 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10307 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1388
//		CA	COMMANDO +1
// PORT: Fixed ROM slots 10307.
                        if slot <> 10307 or instruction <> 12998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 710).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1389
//		MASK	BIT15			# GRAB SIGN OF SHAFT COMMAND
// PORT: Fixed ROM slots 10308.
                        if slot <> 10308 or instruction <> 31233 { return choose false if checkOnly else -1. }
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
        if slot <= 10316 {
            if slot <= 10312 {
                if slot <= 10310 {
                    if slot <= 10309 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1390
//		EXTEND
// PORT: Fixed ROM slots 10309.
                        if slot <> 10309 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1391
//		RXOR	LCHAN
// PORT: Fixed ROM slots 10310.
                        if slot <> 10310 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10311 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1392
//		CCS	A
// PORT: Fixed ROM slots 10311.
                        if slot <> 10311 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1393
//		TCF	CMDSETUP		# SIGN ZONE NOT EQUAL TO SIGN COMMAND
// PORT: Fixed ROM slots 10312.
                        if slot <> 10312 or instruction <> 5202 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5202, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10314 {
                    if slot <= 10313 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1394
//		CCS	DESOPTS			# SEE IF DESOPTS BETWEEN -90 AND +90
// PORT: Fixed ROM slots 10313.
                        if slot <> 10313 or instruction <> 4721 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 625).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1395
//		AD	NEG1/2
// PORT: Fixed ROM slots 10314.
                        if slot <> 10314 or instruction <> 27136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10315 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1396
//		TCF	+2			# ABS(DESOPTS) - 90 DEG
// PORT: Fixed ROM slots 10315.
                        if slot <> 10315 or instruction <> 5197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5197, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1397
//		TCF	-2
// PORT: Fixed ROM slots 10316.
                        if slot <> 10316 or instruction <> 5194 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5194, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10320 {
                if slot <= 10318 {
                    if slot <= 10317 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1398
//		EXTEND
// PORT: Fixed ROM slots 10317.
                        if slot <> 10317 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1399
//# Page 168
// PORT: SOURCE T4RUPT_PROGRAM.agc:1400
//		BZMF	+2			# DESOPTS IN FIRST OR FOURTH QUAD
// PORT: Fixed ROM slots 10318.
                        if slot <> 10318 or instruction <> 25680 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25680, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10319 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1401
//		TCF	CMDSETUP
// PORT: Fixed ROM slots 10319.
                        if slot <> 10319 or instruction <> 5202 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5202, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1402
//		CS	COMMANDO +1		# REVERSE REGULAR COMMAND
// PORT: Fixed ROM slots 10320.
                        if slot <> 10320 or instruction <> 17094 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 710).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10322 {
                    if slot <= 10321 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1403
//		TS	COMMANDO +1
// PORT: Fixed ROM slots 10321.
                        if slot <> 10321 or instruction <> 23238 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23238, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1404
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1405
//		COUNT*	$$/T4RPT
// PORT: SOURCE T4RUPT_PROGRAM.agc:1406
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1407
//CMDSETUP	CAF	ONE			# SET OPTIND
// PORT: Fixed ROM slots 10322.
                        if slot <> 10322 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                    if slot <= 10323 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1408
//		TS	OPTIND
// PORT: Fixed ROM slots 10323.
                        if slot <> 10323 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1409
//		INDEX	A
// PORT: Fixed ROM slots 10324.
                        if slot <> 10324 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[638] to agcAotUnit638@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1410
//		CCS	COMMANDO		# GET SIGN OF COMMAND
// PORT: Fixed ROM slots 10325.
    10325, 9610
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10326–10346.
function agcAotUnit639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10335 {
        if slot <= 10330 {
            if slot <= 10327 {
                if slot <= 10326 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1411
//		TC	POSOPCMD
// PORT: Fixed ROM slots 10326.
                    if slot <> 10326 or instruction <> 1124 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1124, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1412
//		TC	NEXTOPT	+1		# ZERO COMMAND-SKIP SEND INDICATOR
// PORT: Fixed ROM slots 10327.
                    if slot <> 10327 or instruction <> 1129 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1129, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10328 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1413
//		TC	NEGOPCMD
// PORT: Fixed ROM slots 10328.
                    if slot <> 10328 or instruction <> 1137 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1137, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10329 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1414
//		TC	NEXTOPT	+1		# ZERO COMMAND
// PORT: Fixed ROM slots 10329.
                        if slot <> 10329 or instruction <> 1129 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1129, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1415
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1416
//TRUNCMD		CS	CDUT			# IF COMMAND GREATER THAN 45 DEG-COMMAND
// PORT: Fixed ROM slots 10330.
                        if slot <> 10330 or instruction <> 16413 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 29).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10332 {
                if slot <= 10331 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1417
//		AD	DESOPTT			# 45 DEG
// PORT: Fixed ROM slots 10331.
                    if slot <> 10331 or instruction <> 25200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 624).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1418
//		TS	Q
// PORT: Fixed ROM slots 10332.
                    if slot <> 10332 or instruction <> 22530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10333 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1419
//		TC	GETOPCMD		# LESS THAN 45 DEG-NORMAL OPERATION
// PORT: Fixed ROM slots 10333.
                    if slot <> 10333 or instruction <> 1063 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1063, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10334 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1420
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1421
//		CCS	A			# GREATER THAN 45 DEG-USE OPSMAX WITH
// PORT: Fixed ROM slots 10334.
                        if slot <> 10334 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1422
//		CA	POSMAX			# CORRECT SIGN
// PORT: Fixed ROM slots 10335.
                        if slot <> 10335 or instruction <> 14847 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 10340 {
            if slot <= 10337 {
                if slot <= 10336 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1423
//		TC	+2
// PORT: Fixed ROM slots 10336.
                    if slot <> 10336 or instruction <> 1122 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1122, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1424
//		CS	POSMAX
// PORT: Fixed ROM slots 10337.
                    if slot <> 10337 or instruction <> 18943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10338 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1425
//		TS	L
// PORT: Fixed ROM slots 10338.
                    if slot <> 10338 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10339 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1426
//		TC	STORCMD
// PORT: Fixed ROM slots 10339.
                        if slot <> 10339 or instruction <> 1075 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1075, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1427
//POSOPCMD	AD	MAXPLS1
// PORT: Fixed ROM slots 10340.
                        if slot <> 10340 or instruction <> 25730 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1154), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 10343 {
                if slot <= 10341 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1428
//		EXTEND
// PORT: Fixed ROM slots 10341.
                    if slot <> 10341 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10342 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1429
//		BZMF	DELOPCMD		# COMMAND LESS THAN MAX PULSE
// PORT: Fixed ROM slots 10342.
                        if slot <> 10342 or instruction <> 25718 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25718, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1430
//		CS	MAXPLS			# GREATER THAN MAX PULSE-USE MAX PULSE
// PORT: Fixed ROM slots 10343.
                        if slot <> 10343 or instruction <> 17537 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1153), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 10344 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1431
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1432
//NEXTOPT		INCR	ITEMP1			# SET SEND INDICATOR
// PORT: Fixed ROM slots 10344.
                    if slot <> 10344 or instruction <> 10289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10345 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1433
//		AD	NEG0			# MAKE SURE ZERO COMMAND IS -ZERO
// PORT: Fixed ROM slots 10345.
                        if slot <> 10345 or instruction <> 27152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1434
//		INDEX	OPTIND
// PORT: Fixed ROM slots 10346.
                        if slot <> 10346 or instruction <> 21187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21187, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21187, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[639] to agcAotUnit639@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1435
//		TS	CDUTCMD			# STORE PULSE IN SEND REG
// PORT: Fixed ROM slots 10347.
    10347, 45142
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10348–10358.
function agcAotUnit640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10352 {
        if slot <= 10349 {
            if slot <= 10348 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1436
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1437
//		CCS	OPTIND
// PORT: Fixed ROM slots 10348.
                if slot <> 10348 or instruction <> 4803 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 707).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1438
//		TC	CMDSETUP +1		# GET NEXT OPT
// PORT: Fixed ROM slots 10349.
                if slot <> 10349 or instruction <> 1107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1107, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10350 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1439
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1440
//		CCS	ITEMP1			# ARE ANY PULSES TO GO
// PORT: Fixed ROM slots 10350.
                if slot <> 10350 or instruction <> 4145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 49).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10351 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1441
//		TCF	SENDOCMD		# YES-SEND EM
// PORT: Fixed ROM slots 10351.
                    if slot <> 10351 or instruction <> 5241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5241, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1442
//		TC	RESUME			# NO
// PORT: Fixed ROM slots 10352.
                    if slot <> 10352 or instruction <> 2779 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2779, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10355 {
            if slot <= 10353 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1443
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1444
//NEGOPCMD	AD	MAXPLS1
// PORT: Fixed ROM slots 10353.
                if slot <> 10353 or instruction <> 25730 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1154), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10354 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1445
//		EXTEND
// PORT: Fixed ROM slots 10354.
                    if slot <> 10354 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1446
//		BZMF	DELOPCMD		# LESS THAN MAX PULSE
// PORT: Fixed ROM slots 10355.
                    if slot <> 10355 or instruction <> 25718 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25718, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10356 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1447
//		CA	MAXPLS			# MAX PULSES
// PORT: Fixed ROM slots 10356.
                if slot <> 10356 or instruction <> 13441 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1153), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10357 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1448
//		TCF	NEXTOPT
// PORT: Fixed ROM slots 10357.
                    if slot <> 10357 or instruction <> 5224 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1449
//# Page 169
// PORT: SOURCE T4RUPT_PROGRAM.agc:1450
//DELOPCMD	INDEX	OPTIND
// PORT: Fixed ROM slots 10358.
                    if slot <> 10358 or instruction <> 21187 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21187, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21187, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[640] to agcAotUnit640@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1451
//		XCH	COMMANDO		# SET UP SMALL COMMAND
// PORT: Fixed ROM slots 10359.
    10359, 48522
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10360–10368.
function agcAotUnit641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10363 {
        if slot <= 10361 {
            if slot <= 10360 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1452
//		TCF	NEXTOPT
// PORT: Fixed ROM slots 10360.
                if slot <> 10360 or instruction <> 5224 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5224, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1453
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1454
//SENDOCMD	CAF	11,12			# SEND OCDU DRIVE COMMANDS
// PORT: Fixed ROM slots 10361.
                if slot <> 10361 or instruction <> 14898 { return choose false if checkOnly else -1. }
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
            if slot <= 10362 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1455
//		EXTEND
// PORT: Fixed ROM slots 10362.
                if slot <> 10362 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1456
//		WOR	CHAN14
// PORT: Fixed ROM slots 10363.
                if slot <> 10363 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10365 {
            if slot <= 10364 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1457
//		TC	RESUME
// PORT: Fixed ROM slots 10364.
                if slot <> 10364 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1458
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1459
//SETBIT		CAF	BIT2			# ENABLE OCDU ERR CNTS
// PORT: Fixed ROM slots 10365.
                if slot <> 10365 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10366 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1460
//		EXTEND
// PORT: Fixed ROM slots 10366.
                if slot <> 10366 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10367 {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1461
//		WOR	CHAN12
// PORT: Fixed ROM slots 10367.
                    if slot <> 10367 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T4RUPT_PROGRAM.agc:1462
//		TC	RESUME			# START COARS NEXT TIME AROUND
// PORT: Fixed ROM slots 10368.
                    if slot <> 10368 or instruction <> 2779 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2779, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[641] to agcAotUnit641@.

agcAotInstallSourceRope(list(
// PORT: SOURCE T4RUPT_PROGRAM.agc:1463
//
// PORT: SOURCE T4RUPT_PROGRAM.agc:1464
//MAXPLS		DEC	-165			# WAS -80
// PORT: Fixed ROM slots 10369.
    10369, 65204,
// PORT: SOURCE T4RUPT_PROGRAM.agc:1465
//MAXPLS1		DEC	-164			# WAS -79
// PORT: Fixed ROM slots 10370.
    10370, 65206
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE T4RUPT_PROGRAM.agc:1466
//11,12		EQUALS	PRIO6
// PORT: SOURCE T4RUPT_PROGRAM.agc:1467
//
