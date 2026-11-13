// PORT: Original source unit KEYRUPT_UPRUPT.agc.
// PORT: Physical bank 07. Shared continuation entries, slots 10171–10183.
function agcAotUnit630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10176 {
        if slot <= 10173 {
            if slot <= 10171 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:2
//# Filename:     KEYRUPT_UPRUPT.agc
// PORT: SOURCE KEYRUPT_UPRUPT.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE KEYRUPT_UPRUPT.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE KEYRUPT_UPRUPT.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE KEYRUPT_UPRUPT.agc:7
//# Reference:    pp. 1449-1451
// PORT: SOURCE KEYRUPT_UPRUPT.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE KEYRUPT_UPRUPT.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE KEYRUPT_UPRUPT.agc:11
//#				name, and page images. Corrected various
// PORT: SOURCE KEYRUPT_UPRUPT.agc:12
//#				typos in the transcription of program
// PORT: SOURCE KEYRUPT_UPRUPT.agc:13
//#				comments, and these should be back-ported
// PORT: SOURCE KEYRUPT_UPRUPT.agc:14
//#				to Colossus249.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:15
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE KEYRUPT_UPRUPT.agc:17
//# from scanned documents.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:18
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE KEYRUPT_UPRUPT.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:21
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE KEYRUPT_UPRUPT.agc:23
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:24
//#       Prepared by
// PORT: SOURCE KEYRUPT_UPRUPT.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE KEYRUPT_UPRUPT.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE KEYRUPT_UPRUPT.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE KEYRUPT_UPRUPT.agc:28
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:30
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE KEYRUPT_UPRUPT.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:33
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:34
//# Page 1449
// PORT: SOURCE KEYRUPT_UPRUPT.agc:35
//		BANK	14
// PORT: SOURCE KEYRUPT_UPRUPT.agc:36
//		SETLOC	KEYRUPT
// PORT: SOURCE KEYRUPT_UPRUPT.agc:37
//		BANK
// PORT: SOURCE KEYRUPT_UPRUPT.agc:38
//		COUNT*	$$/KEYUP
// PORT: SOURCE KEYRUPT_UPRUPT.agc:39
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:40
//KEYRUPT1	TS	BANKRUPT
// PORT: Fixed ROM slots 10171.
                if slot <> 10171 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10172 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:41
//		XCH	Q
// PORT: Fixed ROM slots 10172.
                    if slot <> 10172 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:42
//		TS	QRUPT
// PORT: Fixed ROM slots 10173.
                    if slot <> 10173 or instruction <> 22538 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22538, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10174 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:43
//		TC	LODSAMPT	# TIME IS SNATCHED IN RUPT FOR NOUN 65.
// PORT: Fixed ROM slots 10174.
                if slot <> 10174 or instruction <> 2316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2316, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10175 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:44
//		CAF	LOW5
// PORT: Fixed ROM slots 10175.
                    if slot <> 10175 or instruction <> 14578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:45
//		EXTEND
// PORT: Fixed ROM slots 10176.
                    if slot <> 10176 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 10179 {
            if slot <= 10177 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:46
//		RAND	MNKEYIN		# CHECK IF KEYS 5M-1M ON
// PORT: Fixed ROM slots 10177.
                if slot <> 10177 or instruction <> 1037 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 13, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 10178 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:47
//KEYCOM		TS	RUPTREG4
// PORT: Fixed ROM slots 10178.
                    if slot <> 10178 or instruction <> 22587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:48
//		CS	FLAGWRD5
// PORT: Fixed ROM slots 10179.
                    if slot <> 10179 or instruction <> 16449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 65).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10181 {
                if slot <= 10180 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:49
//		MASK	BIT15
// PORT: Fixed ROM slots 10180.
                    if slot <> 10180 or instruction <> 31233 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE KEYRUPT_UPRUPT.agc:50
//		ADS	FLAGWRD5
// PORT: Fixed ROM slots 10181.
                    if slot <> 10181 or instruction <> 11329 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10182 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:51
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:52
//ACCEPTUP	CAF	CHRPRIO		# (NOTE: RUPTREG4 = KEYTEMP1)
// PORT: Fixed ROM slots 10182.
                    if slot <> 10182 or instruction <> 14585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:53
//		TC	NOVAC
// PORT: Fixed ROM slots 10183.
                    if slot <> 10183 or instruction <> 2652 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[630] to agcAotUnit630@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KEYRUPT_UPRUPT.agc:54
//		EBANK=	DSPCOUNT
// PORT: SOURCE KEYRUPT_UPRUPT.agc:55
//		2CADR	CHARIN
// PORT: Fixed ROM slots 10184 10185.
    10184, 2048, 10185, 49282
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10186–10187.
function agcAotUnit631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10186 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:56
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:57
//		CA	RUPTREG4
// PORT: Fixed ROM slots 10186.
        if slot <> 10186 or instruction <> 12347 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 59).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:58
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 10187.
        if slot <> 10187 or instruction <> 20532 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[631] to agcAotUnit631@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KEYRUPT_UPRUPT.agc:59
//		TS	MPAC		# LEAVE 5 BIT KEY CDE IN MPAC FOR CHARIN
// PORT: Fixed ROM slots 10188.
    10188, 45272
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10189–10234.
function agcAotUnit632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10211 {
        if slot <= 10199 {
            if slot <= 10193 {
                if slot <= 10190 {
                    if slot <= 10189 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:60
//		TC	RESUME
// PORT: Fixed ROM slots 10189.
                        if slot <> 10189 or instruction <> 2779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:61
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:62
//# Page 1450
// PORT: SOURCE KEYRUPT_UPRUPT.agc:63
//# UPRUPT PROGRAM
// PORT: SOURCE KEYRUPT_UPRUPT.agc:64
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:65
//UPRUPT		TS	BANKRUPT
// PORT: Fixed ROM slots 10190.
                        if slot <> 10190 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10191 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:66
//		XCH	Q
// PORT: Fixed ROM slots 10191.
                        if slot <> 10191 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10192 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:67
//		TS	QRUPT
// PORT: Fixed ROM slots 10192.
                            if slot <> 10192 or instruction <> 22538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:68
//		TC	LODSAMPT	# TIME IS SNATCHED IN RUPT FOR NOUN 65.
// PORT: Fixed ROM slots 10193.
                            if slot <> 10193 or instruction <> 2316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10196 {
                    if slot <= 10194 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:69
//		CAF	ZERO
// PORT: Fixed ROM slots 10194.
                        if slot <> 10194 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10195 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:70
//		XCH	INLINK
// PORT: Fixed ROM slots 10195.
                            if slot <> 10195 or instruction <> 23589 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 37, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:71
//		TS	KEYTEMP1
// PORT: Fixed ROM slots 10196.
                            if slot <> 10196 or instruction <> 22587 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22587, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 10197 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:72
//		CAF	BIT3		# TURN ON UPACT LIGHT
// PORT: Fixed ROM slots 10197.
                        if slot <> 10197 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10198 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:73
//		EXTEND			# (BIT 3 OF CHANNEL 11)
// PORT: Fixed ROM slots 10198.
                            if slot <> 10198 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:74
//		WOR	DSALMOUT
// PORT: Fixed ROM slots 10199.
                            if slot <> 10199 or instruction <> 2569 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 10205 {
                if slot <= 10202 {
                    if slot <= 10200 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:75
//UPRPT1		CAF	LOW5		# TEST FOR TRIPLE CHAR REDUNDANCY
// PORT: Fixed ROM slots 10200.
                        if slot <> 10200 or instruction <> 14578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10201 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:76
//		MASK	KEYTEMP1	# LOW5 OF WORD
// PORT: Fixed ROM slots 10201.
                            if slot <> 10201 or instruction <> 28731 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 59).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:77
//		XCH	KEYTEMP1	# LOW5 INTO KEYTEMP1
// PORT: Fixed ROM slots 10202.
                            if slot <> 10202 or instruction <> 23611 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 59, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 10203 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:78
//		EXTEND
// PORT: Fixed ROM slots 10203.
                        if slot <> 10203 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10204 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:79
//		MP	BIT10		# SHIFT RIGHT 5
// PORT: Fixed ROM slots 10204.
                            if slot <> 10204 or instruction <> 31238 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2566, readEffective:call(words, 2566)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:80
//		TS	KEYTEMP2
// PORT: Fixed ROM slots 10205.
                            if slot <> 10205 or instruction <> 23004 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23004, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10208 {
                    if slot <= 10206 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:81
//		MASK	LOW5		# MID 5
// PORT: Fixed ROM slots 10206.
                        if slot <> 10206 or instruction <> 30962 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10207 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:82
//		AD	HI10
// PORT: Fixed ROM slots 10207.
                            if slot <> 10207 or instruction <> 26619 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2043), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:83
//		TC	UPTEST
// PORT: Fixed ROM slots 10208.
                            if slot <> 10208 or instruction <> 2040 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2040, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 10209 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:84
//		CAF	BIT10
// PORT: Fixed ROM slots 10209.
                        if slot <> 10209 or instruction <> 14854 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10210 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:85
//		EXTEND
// PORT: Fixed ROM slots 10210.
                            if slot <> 10210 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:86
//		MP	KEYTEMP2	# SHIFT RIGHT 5
// PORT: Fixed ROM slots 10211.
                            if slot <> 10211 or instruction <> 29148 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 476, readEffective:call(words, 476)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 10222 {
            if slot <= 10216 {
                if slot <= 10213 {
                    if slot <= 10212 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:87
//		MASK	LOW5		# HIGH 5
// PORT: Fixed ROM slots 10212.
                        if slot <> 10212 or instruction <> 30962 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:88
//		COM
// PORT: Fixed ROM slots 10213.
                        if slot <> 10213 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 10214 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:89
//		TC	UPTEST
// PORT: Fixed ROM slots 10214.
                        if slot <> 10214 or instruction <> 2040 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2040, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10215 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:90
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:91
//UPOK		CS	ELRCODE		# CODE IS GOOD. IF CODE = 'ERROR RESET',
// PORT: Fixed ROM slots 10215.
                            if slot <> 10215 or instruction <> 18430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2046), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:92
//		AD	KEYTEMP1	# CLEAR UPLOCKFL(SET BIT4 OF FLAGWRD7 = 0)
// PORT: Fixed ROM slots 10216.
                            if slot <> 10216 or instruction <> 24635 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 59).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10219 {
                    if slot <= 10217 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:93
//		EXTEND			# IF CODE DOES NOT = 'ERROR RESET', ACCEPT
// PORT: Fixed ROM slots 10217.
                        if slot <> 10217 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10218 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:94
//		BZF	CLUPLOCK	# CODE ONLY IF UPLOCKFL IS CLEAR (=0).
// PORT: Fixed ROM slots 10218.
                            if slot <> 10218 or instruction <> 6128 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6128, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:95
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:96
//		CAF	BIT4		# TEST UPLOCKFL FOR 0 OR 1.
// PORT: Fixed ROM slots 10219.
                            if slot <> 10219 or instruction <> 14860 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 10220 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:97
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 10220.
                        if slot <> 10220 or instruction <> 28739 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10221 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:98
//		CCS	A
// PORT: Fixed ROM slots 10221.
                            if slot <> 10221 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:99
//		TC	RESUME		# UPLOCKFL = 1
// PORT: Fixed ROM slots 10222.
                            if slot <> 10222 or instruction <> 2779 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2779, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 10228 {
                if slot <= 10225 {
                    if slot <= 10223 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:100
//		TC	ACCEPTUP	# UPLOCKFL = 0
// PORT: Fixed ROM slots 10223.
                        if slot <> 10223 or instruction <> 1990 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1990, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10224 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:101
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:102
//CLUPLOCK	CS	BIT4		# CLEAR UPLOCKFL (I.E., SET BIT 4 OF
// PORT: Fixed ROM slots 10224.
                            if slot <> 10224 or instruction <> 18956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:103
//		MASK	FLAGWRD7	# FLAGWRD7 = 0)
// PORT: Fixed ROM slots 10225.
                            if slot <> 10225 or instruction <> 28739 { return choose false if checkOnly else -1. }
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
                    if slot <= 10226 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:104
//		TS	FLAGWRD7
// PORT: Fixed ROM slots 10226.
                        if slot <> 10226 or instruction <> 22595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22595, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10227 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:105
//		TC	ACCEPTUP
// PORT: Fixed ROM slots 10227.
                            if slot <> 10227 or instruction <> 1990 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1990, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:106
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:107
//					# CODE IS BAD
// PORT: SOURCE KEYRUPT_UPRUPT.agc:108
//TMFAIL2		CS	FLAGWRD7	# LOCK OUT FURTHER UPLINK ACTIVITY
// PORT: Fixed ROM slots 10228.
                            if slot <> 10228 or instruction <> 16451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 67).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 10231 {
                    if slot <= 10229 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:109
//		MASK	BIT4		# (BY SETTING UPLOCKFL = 1) UNTIL
// PORT: Fixed ROM slots 10229.
                        if slot <> 10229 or instruction <> 31244 { return choose false if checkOnly else -1. }
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
                        if slot <= 10230 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:110
//		ADS	FLAGWRD7	# 'ERROR RESET' IS SENT VIA UPLINK.
// PORT: Fixed ROM slots 10230.
                            if slot <> 10230 or instruction <> 11331 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:111
//		TC	RESUME
// PORT: Fixed ROM slots 10231.
                            if slot <> 10231 or instruction <> 2779 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2779, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 10232 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:112
//UPTEST		AD	KEYTEMP1
// PORT: Fixed ROM slots 10232.
                        if slot <> 10232 or instruction <> 24635 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 59).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 10233 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:113
//# Page 1451
// PORT: SOURCE KEYRUPT_UPRUPT.agc:114
//		CCS	A
// PORT: Fixed ROM slots 10233.
                            if slot <> 10233 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:115
//		TC	TMFAIL2
// PORT: Fixed ROM slots 10234.
                            if slot <> 10234 or instruction <> 2036 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2036, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[632] to agcAotUnit632@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KEYRUPT_UPRUPT.agc:116
//HI10		OCT	77740
// PORT: Fixed ROM slots 10235.
    10235, 65472
)).

// PORT: Physical bank 07. Shared continuation entries, slots 10236–10237.
function agcAotUnit633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10236 {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:117
//		TC	TMFAIL2
// PORT: Fixed ROM slots 10236.
        if slot <> 10236 or instruction <> 2036 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2036, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE KEYRUPT_UPRUPT.agc:118
//		TC	Q
// PORT: Fixed ROM slots 10237.
        if slot <> 10237 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[633] to agcAotUnit633@.

agcAotInstallSourceRope(list(
// PORT: SOURCE KEYRUPT_UPRUPT.agc:119
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:120
//ELRCODE		OCT	22
// PORT: Fixed ROM slots 10238.
    10238, 36
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:121
//
// PORT: SOURCE KEYRUPT_UPRUPT.agc:122
//# 'UPLINK ACTIVITY LIGHT' IS TURNED OFF BY .....
// PORT: SOURCE KEYRUPT_UPRUPT.agc:123
//#	1.	VBRELDSP
// PORT: SOURCE KEYRUPT_UPRUPT.agc:124
//#	2.	ERROR RESET
// PORT: SOURCE KEYRUPT_UPRUPT.agc:125
//#	3.	UPDATE PROGRAM(P27) ENTERED BY V70,V71,V72,AND V73.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:126
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:127
//#
// PORT: SOURCE KEYRUPT_UPRUPT.agc:128
//#					-
// PORT: SOURCE KEYRUPT_UPRUPT.agc:129
//# THE RECEPTION OF A BAD CODE(I.E. CCC FAILURE) LOCKS OUT FURTHER UPLINK ACTIVITY BY SETTING BIT4 OF FLAGWRD7 = 1.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:130
//# THIS INDICATION WILL BE TRANSFERRED TO THE GROUND BY THE DOWNLINK WHICH DOWNLINKS ALL FLAGWORDS.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:131
//# WHEN UPLINK ACTIVITY IS LOCKED OUT ,IT CAN BE ALLOWED WHEN THE GROUND UPLINKS AND 'ERROR RESET' CODE.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:132
//# (IT IS RECOMMENDED THAT THE 'ERROR LIGHT RESET' CODE IS PRECEEDED BY 16 BITS THE FIRST OF WHICH IS 1 FOLLOWED
// PORT: SOURCE KEYRUPT_UPRUPT.agc:133
//# BY 15 ZEROS. THIS WILL ELIMINATE EXTRANEOUS BITS FROM INLINK WHICH MAY HAVE BEEN LEFT OVER FROM THE ORIGINAL
// PORT: SOURCE KEYRUPT_UPRUPT.agc:134
//# FAILURE).
// PORT: SOURCE KEYRUPT_UPRUPT.agc:135
//# UPLINK ACTIVITY IS ALSO ALLOWED(UNLOCKED) DURING FRESH START WHEN FRESH START SETS BIT4 OF FLAGWRD7 = 0.
// PORT: SOURCE KEYRUPT_UPRUPT.agc:136
//
