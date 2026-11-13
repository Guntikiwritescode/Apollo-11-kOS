// SERVICER.agc
// bank 37, slots 34568-34571
function agcAotUnit2281 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34569 {
        if slot <= 34568 {
// SERVICER.agc:1
//# Copyright:	Public domain.
// SERVICER.agc:2
//# Filename:	SERVICER.agc
// SERVICER.agc:3
//# Purpose:	Part of the source code for Luminary, build 099. It
// SERVICER.agc:4
//#		is part of the source code for the Lunar Module's
// SERVICER.agc:5
//#		(LM) Apollo Guidance Computer (AGC), Apollo 11.
// SERVICER.agc:6
//# Assembler:	yaYUL
// SERVICER.agc:7
//# Reference:	pp. 857-897
// SERVICER.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// SERVICER.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// SERVICER.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// SERVICER.agc:11
//# Mod history:	2009-06-01 FB	Transcription Batch 4 Assignment.
// SERVICER.agc:12
//#		2009-06-05 RSB	Fixed a couple of typos, plus a goofy relative
// SERVICER.agc:13
//#				label reference from the original source.
// SERVICER.agc:14
//#
// SERVICER.agc:15
//# The contents of the "Luminary099" files, in general, are transcribed
// SERVICER.agc:16
//# from scanned documents.
// SERVICER.agc:17
//#
// SERVICER.agc:18
//#	Assemble revision 001 of AGC program Luminary099 by NASA
// SERVICER.agc:19
//#	2021112-061.  July 14, 1969.
// SERVICER.agc:20
//#
// SERVICER.agc:21
//#	Prepared by
// SERVICER.agc:22
//#			Massachusetts Institute of Technology
// SERVICER.agc:23
//#			75 Cambridge Parkway
// SERVICER.agc:24
//#			Cambridge, Massachusetts
// SERVICER.agc:25
//#
// SERVICER.agc:26
//#	under NASA contract NAS 9-4065.
// SERVICER.agc:27
//#
// SERVICER.agc:28
//# Refer directly to the online document mentioned above for further
// SERVICER.agc:29
//# information.  Please report any errors to info@sandroid.org.
// SERVICER.agc:30
//
// SERVICER.agc:31
//# Page 857
// SERVICER.agc:32
//		BANK	37
// SERVICER.agc:33
//		SETLOC	SERV1
// SERVICER.agc:34
//		BANK
// SERVICER.agc:35
//
// SERVICER.agc:36
//		EBANK=	DVCNTR
// SERVICER.agc:37
//
// SERVICER.agc:38
//# ************* PREREAD *******************
// SERVICER.agc:39
//
// SERVICER.agc:40
//		COUNT*	$$/SERV
// SERVICER.agc:41
//
// SERVICER.agc:42
//PREREAD		CAF	SEVEN		# 5.7 SPOT TO SKIP LASTBIAS AFTER
// slot 34568
            if slot <> 34568 or instruction <> 14831 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:43
//		TC	GNUFAZE5	# RESTART.
// slot 34569
            if slot <> 34569 or instruction <> 1881 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1881, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34570 {
// SERVICER.agc:44
//		CAF	PRIO21
// slot 34570
            if slot <> 34570 or instruction <> 14873 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2585), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:45
//		TC	NOVAC
// slot 34571
            if slot <> 34571 or instruction <> 2618 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2618, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2281] to agcAotUnit2281@.

agcAotInstallSourceRope(list(
// SERVICER.agc:46
//		EBANK=	NBDX
// SERVICER.agc:47
//		2CADR	LASTBIAS	# DO LAST GYRO COMPENSATION IN FREE FALL
// slot 34572 34573
    34572, 3942, 34573, 12390
)).

// bank 37, slots 34574-34586
function agcAotUnit2282 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34579 {
        if slot <= 34576 {
            if slot <= 34574 {
// SERVICER.agc:48
//
// SERVICER.agc:49
//BIBIBIAS	TC	PIPASR +3	# CLEAR + READ PIPS LAST TIME IN FRE5+F133
// slot 34574
                if slot <> 34574 or instruction <> 1892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1892, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34575 {
// SERVICER.agc:50
//					# DO NOT DESTROY VALUE OF PIPTIME1
// SERVICER.agc:51
//
// SERVICER.agc:52
//		CS	FLAGWRD7
// slot 34575
                    if slot <> 34575 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:53
//		MASK	SUPER011	# SET V37FLAG AND AVEGFLAG (BITS 5 AND 6
// slot 34576
                    if slot <> 34576 or instruction <> 31227 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2555), 32768).
                        if fixedOperand = 48 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16), 4) * 16).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34577 {
// SERVICER.agc:54
//		ADS	FLAGWRD7	# 	OF FLAGWRD7)
// slot 34577
                if slot <> 34577 or instruction <> 11331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34578 {
// SERVICER.agc:55
//
// SERVICER.agc:56
//		CS	DRFTBIT
// slot 34578
                    if slot <> 34578 or instruction <> 18909 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:57
//		MASK	FLAGWRD2	# RESET DRIFTFLAG
// slot 34579
                    if slot <> 34579 or instruction <> 28734 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 34582 {
            if slot <= 34580 {
// SERVICER.agc:58
//		TS	FLAGWRD2
// slot 34580
                if slot <> 34580 or instruction <> 22590 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22590, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34581 {
// SERVICER.agc:59
//
// SERVICER.agc:60
//		CAF	FOUR		# INITIALIZE DV MONITOR
// slot 34581
                    if slot <> 34581 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:61
//		TS	PIPAGE
// slot 34582
                    if slot <> 34582 or instruction <> 23215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23215, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34584 {
                if slot <= 34583 {
// SERVICER.agc:62
//
// SERVICER.agc:63
//		CAF	ENDJBCAD	# POINT OUTROUTE TO END-OF-JOB.
// slot 34583
                    if slot <> 34583 or instruction <> 14175 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1887), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:64
//		TS	OUTROUTE
// slot 34584
                    if slot <> 34584 or instruction <> 23216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23216, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34585 {
// SERVICER.agc:65
//
// SERVICER.agc:66
//		CAF	PRIO22
// slot 34585
                    if slot <> 34585 or instruction <> 16328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:67
//		TC	FINDVAC		# TO FIRST ENTRY TO AVERAGE G
// slot 34586
                    if slot <> 34586 or instruction <> 2629 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2629, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2282] to agcAotUnit2282@.

agcAotInstallSourceRope(list(
// SERVICER.agc:68
//		EBANK=	DVCNTR
// SERVICER.agc:69
//		2CADR	NORMLIZE
// slot 34587 34588
    34587, 2658, 34588, 39022
)).

// bank 37, slots 34589-34606
function agcAotUnit2283 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34597 {
        if slot <= 34592 {
            if slot <= 34590 {
                if slot <= 34589 {
// SERVICER.agc:70
//
// SERVICER.agc:71
//		CA	TWO		# 5.2SPOT FOR REREADAC AND NORMLIZE
// slot 34589
                    if slot <> 34589 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:72
//GOREADAX	TC	GNUTFAZ5
// slot 34590
                    if slot <> 34590 or instruction <> 1877 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1877, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34591 {
// SERVICER.agc:73
//		CA	2SECS		# WAIT TWO SECONDS FOR READACCS
// slot 34591
                    if slot <> 34591 or instruction <> 14848 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:74
//		TC	VARDELAY
// slot 34592
                    if slot <> 34592 or instruction <> 2708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2708, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34594 {
                if slot <= 34593 {
// SERVICER.agc:75
//
// SERVICER.agc:76
//# Page 858
// SERVICER.agc:77
//# ************* READACCS ****************
// SERVICER.agc:78
//
// SERVICER.agc:79
//READACCS	CS	OCT37771	# THIS PIECE OF CODING ATTEMPTS TO
// slot 34593
                    if slot <> 34593 or instruction <> 18272 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1888), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:80
//		AD	TIME5		# SYNCHRONIZE READACCS WITH THE DIGITAL
// slot 34594
                    if slot <> 34594 or instruction <> 24600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 24).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34595 {
// SERVICER.agc:81
//		CCS	A		# AUTOPILOT SO THAT A PAXIS RUPT WILL
// slot 34595
                    if slot <> 34595 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34596 {
// SERVICER.agc:82
//		CS	ONE		# OCCUR APPROXIMATELY 70 MILLISECONDS
// slot 34596
                        if slot <> 34596 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:83
//		TCF	+2		# FOLLOWING THE READACCS RUPT.  THE 70 MS
// slot 34597
                        if slot <> 34597 or instruction <> 5927 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5927, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 34601 {
            if slot <= 34599 {
                if slot <= 34598 {
// SERVICER.agc:84
//		CA	ONE		# OFFSET WAS CHOSEN SO THAT THE PAXIS
// slot 34598
                    if slot <> 34598 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:85
// +2		ADS	TIME5		# RUPT WOULD NOT OCCUR SIMULTANEOUSLY
// slot 34599
                    if slot <> 34599 or instruction <> 11288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 24).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34600 {
// SERVICER.agc:86
// 					# WITH ANY OF THE 8 SUBSEQUENT R10,R11
// SERVICER.agc:87
//					# INTERRUPTS -- THUS MINIMIZING THE POSS-
// SERVICER.agc:88
//					# IBILITY OF LOSING DOWNRUPTS.
// SERVICER.agc:89
//
// SERVICER.agc:90
//		TC	PIPASR		# READ THE PIPAS.
// slot 34600
                    if slot <> 34600 or instruction <> 1889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1889, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:91
//
// SERVICER.agc:92
//PIPSDONE	CA	FIVE
// slot 34601
                    if slot <> 34601 or instruction <> 14830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34603 {
                if slot <= 34602 {
// SERVICER.agc:93
//		TC	GNUFAZE5
// slot 34602
                    if slot <> 34602 or instruction <> 1881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1881, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:94
//REDO5.5		CAF	ONE
// slot 34603
                    if slot <> 34603 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                if slot <= 34604 {
// SERVICER.agc:95
//		TS	PIPAGE
// slot 34604
                    if slot <> 34604 or instruction <> 23215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23215, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34605 {
// SERVICER.agc:96
//
// SERVICER.agc:97
//		CA	PRIO20
// slot 34605
                        if slot <> 34605 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:98
//		TC	FINDVAC
// slot 34606
                        if slot <> 34606 or instruction <> 2629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2629, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2283] to agcAotUnit2283@.

agcAotInstallSourceRope(list(
// SERVICER.agc:99
//		EBANK=	DVCNTR
// SERVICER.agc:100
//		2CADR	SERVICER	# SET UP SERVICER JOB
// slot 34607 34608
    34607, 2316, 34608, 55406
)).

// bank 37, slots 34609-34634
function agcAotUnit2284 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34621 {
        if slot <= 34614 {
            if slot <= 34611 {
                if slot <= 34609 {
// SERVICER.agc:101
//
// SERVICER.agc:102
//		CA	BIT9
// slot 34609
                    if slot <> 34609 or instruction <> 14819 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34610 {
// SERVICER.agc:103
//		EXTEND
// slot 34610
                        if slot <> 34610 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:104
//		WOR	DSALMOUT	# TURN ON TEST CONNECTOR OUTBIT
// slot 34611
                        if slot <> 34611 or instruction <> 2569 { return choose false if checkOnly else -1. }
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
                if slot <= 34612 {
// SERVICER.agc:105
//
// SERVICER.agc:106
//		CA	FLAGWRD7
// slot 34612
                    if slot <> 34612 or instruction <> 12355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34613 {
// SERVICER.agc:107
//		MASK	AVEGFBIT
// slot 34613
                        if slot <> 34613 or instruction <> 31207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            if fixedOperand = 16 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:108
//		EXTEND
// slot 34614
                        if slot <> 34614 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 34617 {
                if slot <= 34615 {
// SERVICER.agc:109
//		BZF	AVEGOUT		# AVEGFLAG DOWN -- SET UP FINAL EXIT
// slot 34615
                    if slot <> 34615 or instruction <> 5967 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5967, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34616 {
// SERVICER.agc:110
//
// SERVICER.agc:111
//		CA	FLAGWRD6
// slot 34616
                        if slot <> 34616 or instruction <> 12354 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:112
//		MASK	MUNFLBIT
// slot 34617
                        if slot <> 34617 or instruction <> 31204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            if fixedOperand = 128 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34619 {
                    if slot <= 34618 {
// SERVICER.agc:113
//		EXTEND
// slot 34618
                        if slot <> 34618 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:114
//		BZF	MAKEACCS	# MUNFLAG CLEAR -- BYPASS LR AND DISP.
// slot 34619
                        if slot <> 34619 or instruction <> 5965 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5965, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 34620 {
// SERVICER.agc:115
//
// SERVICER.agc:116
//		CCS	PHASE2
// slot 34620
                        if slot <> 34620 or instruction <> 4589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 493).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:117
//		TCF	MAKEACCS	# PHASE 2 ACTIVATED -- AVOID MULTIPLE R10.
// slot 34621
                        if slot <> 34621 or instruction <> 5965 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5965, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 34627 {
            if slot <= 34624 {
                if slot <= 34622 {
// SERVICER.agc:118
//
// SERVICER.agc:119
//		CAF	SEVEN		# SET PIPCTR FOR 4X/SEC RATE.
// slot 34622
                    if slot <> 34622 or instruction <> 14831 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34623 {
// SERVICER.agc:120
//		TS	PIPCTR
// slot 34623
                        if slot <> 34623 or instruction <> 23086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:121
//
// SERVICER.agc:122
//		CS	TIME1		# SET TBASE2 .05 SECONDS IN THE PAST.
// slot 34624
                        if slot <> 34624 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 21).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34625 {
// SERVICER.agc:123
//		AD	FIVE
// slot 34625
                    if slot <> 34625 or instruction <> 27118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34626 {
// SERVICER.agc:124
//		AD	NEG1/2
// slot 34626
                        if slot <> 34626 or instruction <> 27100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2524), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:125
//		AD	NEG1/2
// slot 34627
                        if slot <> 34627 or instruction <> 27100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2524), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 34630 {
                if slot <= 34628 {
// SERVICER.agc:126
//		XCH	TBASE2
// slot 34628
                    if slot <> 34628 or instruction <> 24109 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 557, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34629 {
// SERVICER.agc:127
//# Page 859
// SERVICER.agc:128
//		CAF	DEC17		# 2.21SPOT FOR R10,R11
// slot 34629
                        if slot <> 34629 or instruction <> 14577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2289), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:129
//		TS	L
// slot 34630
                        if slot <> 34630 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34632 {
                    if slot <= 34631 {
// SERVICER.agc:130
//		COM
// slot 34631
                        if slot <> 34631 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:131
//		DXCH	-PHASE2
// slot 34632
                        if slot <> 34632 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 34633 {
// SERVICER.agc:132
//
// SERVICER.agc:133
//		CAF	OCT24		# FIRST R10,R11 IN .200 SECONDS
// slot 34633
                        if slot <> 34633 or instruction <> 15367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:134
//		TC	WAITLIST
// slot 34634
                        if slot <> 34634 or instruction <> 2691 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2284] to agcAotUnit2284@.

agcAotInstallSourceRope(list(
// SERVICER.agc:135
//		EBANK=	UNIT/R/
// SERVICER.agc:136
//		2CADR	R10,R11
// slot 34635 34636
    34635, 2060, 34636, 34926
)).

// bank 37, slots 34637-34652
function agcAotUnit2285 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34644 {
        if slot <= 34640 {
            if slot <= 34638 {
                if slot <= 34637 {
// SERVICER.agc:137
//
// SERVICER.agc:138
//MAKEACCS	CA	FOUR
// slot 34637
                    if slot <> 34637 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:139
//		TCF	GOREADAX	# DO PHASE CHANGE AND RECALL READACCS
// slot 34638
                    if slot <> 34638 or instruction <> 5918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34639 {
// SERVICER.agc:140
//
// SERVICER.agc:141
//AVEGOUT		EXTEND
// slot 34639
                    if slot <> 34639 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:142
//		DCA	AVOUTCAD	# SET UP FINAL SERVICER EXIT
// slot 34640
                    if slot <> 34640 or instruction <> 14174 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1886, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34642 {
                if slot <= 34641 {
// SERVICER.agc:143
//		DXCH	AVGEXIT
// slot 34641
                    if slot <> 34641 or instruction <> 22187 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:144
//
// SERVICER.agc:145
//		CA	FOUR		# SET 5.4 SPOT FOR REREADAC AND SERVICER
// slot 34642
                    if slot <> 34642 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34643 {
// SERVICER.agc:146
//		TC	GNUTFAZ5	# IF REREADAC IS CALLED, IT WILL EXIT
// slot 34643
                    if slot <> 34643 or instruction <> 1877 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1877, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:147
//		TC	TASKOVER	# END TASK WITHOUT CALLING READACCS
// slot 34644
                    if slot <> 34644 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34648 {
            if slot <= 34646 {
                if slot <= 34645 {
// SERVICER.agc:148
//
// SERVICER.agc:149
//GNUTFAZ5	TS	L		# SAVE INPUT IN L
// slot 34645
                    if slot <> 34645 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:150
//		CS	TIME1
// slot 34646
                    if slot <> 34646 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34647 {
// SERVICER.agc:151
//		TS	TBASE5		# SET TBASE5
// slot 34647
                    if slot <> 34647 or instruction <> 23091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23091, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:152
//		TCF	+2
// slot 34648
                    if slot <> 34648 or instruction <> 5978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5978, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34650 {
                if slot <= 34649 {
// SERVICER.agc:153
//
// SERVICER.agc:154
//GNUFAZE5	TS	L		# SAVE INPUT IN L
// slot 34649
                    if slot <> 34649 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:155
//		CS	L		# -PHASE IN A, PHASE IN L.
// slot 34650
                    if slot <> 34650 or instruction <> 16385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 1).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34651 {
// SERVICER.agc:156
//		DXCH	-PHASE5		# SET -PHASE5,PHASE5
// slot 34651
                    if slot <> 34651 or instruction <> 22003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:157
//		TC	Q
// slot 34652
                    if slot <> 34652 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2285] to agcAotUnit2285@.

agcAotInstallSourceRope(list(
// SERVICER.agc:158
//
// SERVICER.agc:159
//		EBANK=	DVCNTR
// SERVICER.agc:160
//AVOUTCAD	2CADR	AVGEND
// slot 34653 34654
    34653, 3938, 34654, 36974,
// SERVICER.agc:161
//
// SERVICER.agc:162
//ENDJBCAD	CADR	SERVEXIT +2
// slot 34655
    34655, 55284,
// SERVICER.agc:163
//
// SERVICER.agc:164
//OCT37771	OCT	37771
// slot 34656
    34656, 32754
)).

// bank 33, slots 29830-29830
function agcAotUnit1918 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:165
//
// SERVICER.agc:166
//		BANK	33
// SERVICER.agc:167
//		SETLOC	SERVICES
// SERVICER.agc:168
//		BANK
// SERVICER.agc:169
//
// SERVICER.agc:170
//		COUNT*	$$/SERV
// SERVICER.agc:171
//
// SERVICER.agc:172
//# Page 860
// SERVICER.agc:173
//# ************* SERVICER ****************
// SERVICER.agc:174
//
// SERVICER.agc:175
//SERVICER	TC	PHASCHNG	# RESTART REREADAC + SERVICER
// slot 29830
    if slot <> 29830 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1918] to agcAotUnit1918@.

agcAotInstallSourceRope(list(
// SERVICER.agc:176
//		OCT	16035
// slot 29831
    29831, 14394,
// SERVICER.agc:177
//		OCT	20000
// slot 29832
    29832, 16384,
// SERVICER.agc:178
//		EBANK=	DVCNTR
// SERVICER.agc:179
//		2CADR	GETABVAL
// slot 29833 29834
    29833, 2334, 29834, 55406
)).

// bank 33, slots 29835-29837
function agcAotUnit1919 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29835 {
// SERVICER.agc:180
//
// SERVICER.agc:181
//		CAF	PRIO31		# INITIALIZE 1/PIPADT IN CASE RESTART HAS
// slot 29835
        if slot <> 29835 or instruction <> 16334 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4046), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29836 {
// SERVICER.agc:182
//		TS	1/PIPADT	# CAUSED LASTBIAS TO BE SKIPPED.
// slot 29836
            if slot <> 29836 or instruction <> 23101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23101, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:183
//
// SERVICER.agc:184
//		TC	BANKCALL	# PIPA COMPENSATION CALL
// slot 29837
            if slot <> 29837 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1919] to agcAotUnit1919@.

agcAotInstallSourceRope(list(
// SERVICER.agc:185
//		CADR	1/PIPA
// slot 29838
    29838, 13670
)).

// bank 33, slots 29839-29839
function agcAotUnit1920 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:186
//
// SERVICER.agc:187
//GETABVAL	TC	INTPRET
// slot 29839
    if slot <> 29839 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1920] to agcAotUnit1920@.

agcAotInstallSourceRope(list(
// SERVICER.agc:188
//		VLOAD	ABVAL
// slot 29840
    29840, 42746,
// SERVICER.agc:189
//			DELV
// slot 29841
    29841, 426,
// SERVICER.agc:190
//		EXIT
// slot 29842
    29842, 65532
)).

// bank 33, slots 29843-29873
function agcAotUnit1921 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29857 {
        if slot <= 29849 {
            if slot <= 29845 {
                if slot <= 29843 {
// SERVICER.agc:191
//		CA	MPAC
// slot 29843
                    if slot <> 29843 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 29844 {
// SERVICER.agc:192
//		TS	ABDELV		# ABDELV = CM/SEC*2(-14).
// slot 29844
                        if slot <> 29844 or instruction <> 23206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23206, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:193
//		EXTEND
// slot 29845
                        if slot <> 29845 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29847 {
                    if slot <= 29846 {
// SERVICER.agc:194
//		MP	KPIP
// slot 29846
                        if slot <> 29846 or instruction <> 29712 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1040, readEffective:call(words, 1040)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:195
//		DXCH	ABDVCONV	# ABDVCONV = M/CS * 2(-5).
// slot 29847
                        if slot <> 29847 or instruction <> 22348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29848 {
// SERVICER.agc:196
//		EXTEND
// slot 29848
                        if slot <> 29848 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:197
//		DCA	MASS
// slot 29849
                        if slot <> 29849 or instruction <> 12965 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 677, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 29853 {
                if slot <= 29851 {
                    if slot <= 29850 {
// SERVICER.agc:198
//		DXCH	MASS1		# INITIALIZE MASS1 IN CASE WE SKIP MASSMON
// slot 29850
                        if slot <> 29850 or instruction <> 22393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 889, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:199
//MASSMON		CS	FLAGWRD8	# ARE WE ON THE SURFACE?
// slot 29851
                        if slot <> 29851 or instruction <> 16452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 68).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29852 {
// SERVICER.agc:200
//		MASK	SURFFBIT
// slot 29852
                        if slot <> 29852 or instruction <> 31204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            if fixedOperand = 128 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:201
//		EXTEND
// slot 29853
                        if slot <> 29853 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29855 {
                    if slot <= 29854 {
// SERVICER.agc:202
//		BZF	MOONSPOT	# YES:  BYPASS MASS MESS
// slot 29854
                        if slot <> 29854 or instruction <> 5292 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:203
//
// SERVICER.agc:204
//		CA	FLGWRD10	# NO:  WHICH VEX SHOULD BE USED?
// slot 29855
                        if slot <> 29855 or instruction <> 12358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 70).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29856 {
// SERVICER.agc:205
//		MASK	APSFLBIT
// slot 29856
                        if slot <> 29856 or instruction <> 31199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:206
//		CCS	A
// slot 29857
                        if slot <> 29857 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 29865 {
            if slot <= 29861 {
                if slot <= 29859 {
                    if slot <= 29858 {
// SERVICER.agc:207
//		EXTEND			# IF EXTEND IS EXECUTED, APSVEX --> A,
// slot 29858
                        if slot <> 29858 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:208
//		DCA	APSVEX		# 	OTHERWISE DPSVEX --> A
// slot 29859
                        if slot <> 29859 or instruction <> 13313 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1025, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29860 {
// SERVICER.agc:209
//		TS	Q
// slot 29860
                        if slot <> 29860 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:210
//
// SERVICER.agc:211
//		EXTEND
// slot 29861
                        if slot <> 29861 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29863 {
                    if slot <= 29862 {
// SERVICER.agc:212
//		DCA	ABDVCONV
// slot 29862
                        if slot <> 29862 or instruction <> 13132 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 844, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:213
//		EXTEND
// slot 29863
                        if slot <> 29863 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29864 {
// SERVICER.agc:214
//OCT10002	DV	Q		# WHERE APPROPRIATE VEX RESIDES
// slot 29864
                        if slot <> 29864 or instruction <> 4098 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 2, words[2]).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:215
//		EXTEND
// slot 29865
                        if slot <> 29865 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 29869 {
                if slot <= 29867 {
                    if slot <= 29866 {
// SERVICER.agc:216
//		MP	MASS
// slot 29866
                        if slot <> 29866 or instruction <> 29348 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 676, readEffective:call(words, 676)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:217
//		DAS	MASS1
// slot 29867
                        if slot <> 29867 or instruction <> 9081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 889) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29868 {
// SERVICER.agc:218
//
// SERVICER.agc:219
//MOONSPOT	CA	KPIP1		# TP MPAC = ABDELV AT 2(14) CM/SEC
// slot 29868
                        if slot <> 29868 or instruction <> 13329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1041), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:220
//		TC	SHORTMP		# MULTIPLY BY KPIP1 TO GET
// slot 29869
                        if slot <> 29869 or instruction <> 3783 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3783, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 29871 {
                    if slot <= 29870 {
// SERVICER.agc:221
//# Page 861
// SERVICER.agc:222
//		DXCH	MPAC		# ABDELV AT 2(7) M/CS
// slot 29870
                        if slot <> 29870 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:223
//		DAS	DVTOTAL		# UPDATE DVTOTAL FOR DISPLAY
// slot 29871
                        if slot <> 29871 or instruction <> 9032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 840) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29872 {
// SERVICER.agc:224
//
// SERVICER.agc:225
//		TC	TMPTOSPT
// slot 29872
                        if slot <> 29872 or instruction <> 1312 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1312, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:226
//
// SERVICER.agc:227
//		TC	BANKCALL
// slot 29873
                        if slot <> 29873 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1921] to agcAotUnit1921@.

agcAotInstallSourceRope(list(
// SERVICER.agc:228
//		CADR	QUICTRIG
// slot 29874
    29874, 40730
)).

// bank 33, slots 29875-29876
function agcAotUnit1922 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29875 {
// SERVICER.agc:229
//
// SERVICER.agc:230
//		CAF	XNBPIPAD
// slot 29875
        if slot <> 29875 or instruction <> 13580 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1292), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:231
//		TC	BANKCALL
// slot 29876
        if slot <> 29876 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1922] to agcAotUnit1922@.

agcAotInstallSourceRope(list(
// SERVICER.agc:232
//		CADR	FLESHPOT
// slot 29877
    29877, 16446
)).

// bank 33, slots 29878-29878
function agcAotUnit1923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:233
//		TC	INTPRET
// slot 29878
    if slot <> 29878 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1923] to agcAotUnit1923@.

agcAotInstallSourceRope(list(
// SERVICER.agc:234
//AVERAGEG	BON	CALL
// slot 29879
    29879, 37912,
// SERVICER.agc:235
//			MUNFLAG
// slot 29880
    29880, 3470,
// SERVICER.agc:236
//			RVBOTH
// slot 29881
    29881, 56372,
// SERVICER.agc:237
//			CALCRVG
// slot 29882
    29882, 56316,
// SERVICER.agc:238
//		EXIT
// slot 29883
    29883, 65532
)).

// bank 33, slots 29884-29935
function agcAotUnit1924 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29909 {
        if slot <= 29896 {
            if slot <= 29889 {
                if slot <= 29886 {
                    if slot <= 29884 {
// SERVICER.agc:239
//GOSERV		TC	QUIKFAZ5
// slot 29884
                        if slot <> 29884 or instruction <> 1898 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1898, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29885 {
// SERVICER.agc:240
//
// SERVICER.agc:241
//COPYCYCL	TC	COPYCYC
// slot 29885
                            if slot <> 29885 or instruction <> 1299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1299, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:242
//
// SERVICER.agc:243
//#		CA	ZERO		# A IS ZERO ON RETURN FROM COPYCYC
// SERVICER.agc:244
//		TS	PIPATMPX
// slot 29886
                            if slot <> 29886 or instruction <> 23152 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23152, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29887 {
// SERVICER.agc:245
//		TS	PIPATMPY
// slot 29887
                        if slot <> 29887 or instruction <> 23153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23153, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29888 {
// SERVICER.agc:246
//		TS	PIPATMPZ
// slot 29888
                            if slot <> 29888 or instruction <> 23154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23154, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:247
//
// SERVICER.agc:248
//		CS	STEERBIT	# CLEAR STEERSW PRIOR TO DVMON.
// slot 29889
                            if slot <> 29889 or instruction <> 18913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29892 {
                    if slot <= 29890 {
// SERVICER.agc:249
//		MASK	FLAGWRD2
// slot 29890
                        if slot <> 29890 or instruction <> 28734 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29891 {
// SERVICER.agc:250
//		TS	FLAGWRD2
// slot 29891
                            if slot <> 29891 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:251
//
// SERVICER.agc:252
//		CAF	IDLEFBIT	# IS THE IDLE FLAG SET?
// slot 29892
                            if slot <> 29892 or instruction <> 14821 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29894 {
                        if slot <= 29893 {
// SERVICER.agc:253
//		MASK	FLAGWRD7
// slot 29893
                            if slot <> 29893 or instruction <> 28739 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:254
//		CCS	A
// slot 29894
                            if slot <> 29894 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29895 {
// SERVICER.agc:255
//		TCF	NODVMON1	# IDLEFLAG = 1, HENCE SET AUXFLAG TO 0.
// slot 29895
                            if slot <> 29895 or instruction <> 5346 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5346, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:256
//
// SERVICER.agc:257
//		CS	FLAGWRD6
// slot 29896
                            if slot <> 29896 or instruction <> 16450 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 66).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 29902 {
                if slot <= 29899 {
                    if slot <= 29897 {
// SERVICER.agc:258
//		MASK	AUXFLBIT
// slot 29897
                        if slot <> 29897 or instruction <> 31210 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            if fixedOperand = 2 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29898 {
// SERVICER.agc:259
//		CCS	A
// slot 29898
                            if slot <> 29898 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:260
//		TCF	NODVMON2	# AUXFLAG = 0, HENCE SET AUXFLAG TO 1.
// slot 29899
                            if slot <> 29899 or instruction <> 5350 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5350, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29900 {
// SERVICER.agc:261
//
// SERVICER.agc:262
//DVMON		CS	DVTHRUSH
// slot 29900
                        if slot <> 29900 or instruction <> 17065 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 681).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29901 {
// SERVICER.agc:263
//		AD	ABDELV
// slot 29901
                            if slot <> 29901 or instruction <> 25254 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 678).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:264
//		EXTEND
// slot 29902
                            if slot <> 29902 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29905 {
                    if slot <= 29903 {
// SERVICER.agc:265
//		BZMF	LOTHRUST
// slot 29903
                        if slot <> 29903 or instruction <> 25834 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25834, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29904 {
// SERVICER.agc:266
//
// SERVICER.agc:267
//		CS	FLAGWRD2	# SET STEERSW.
// slot 29904
                            if slot <> 29904 or instruction <> 16446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 62).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:268
//		MASK	STEERBIT
// slot 29905
                            if slot <> 29905 or instruction <> 31201 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                if fixedOperand = 1024 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29907 {
                        if slot <= 29906 {
// SERVICER.agc:269
//		ADS	FLAGWRD2
// slot 29906
                            if slot <> 29906 or instruction <> 11326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:270
//
// SERVICER.agc:271
//DVCNTSET	CAF	ONE		# ALLOW TWO PASSES MAXIMUM NOW THAT
// slot 29907
                            if slot <> 29907 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                        if slot <= 29908 {
// SERVICER.agc:272
//# Page 862
// SERVICER.agc:273
//		TS	DVCNTR		# THRUST HAS BEEN DETECTED.
// slot 29908
                            if slot <> 29908 or instruction <> 23373 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:274
//
// SERVICER.agc:275
//		CA	FLGWRD10	# BRANCH IF APSFLAG IS SET.
// slot 29909
                            if slot <> 29909 or instruction <> 12358 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 70).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 29922 {
            if slot <= 29915 {
                if slot <= 29912 {
                    if slot <= 29910 {
// SERVICER.agc:276
//		MASK	APSFLBIT
// slot 29910
                        if slot <> 29910 or instruction <> 31199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29911 {
// SERVICER.agc:277
//		CCS	A
// slot 29911
                            if slot <> 29911 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:278
//		TCF	USEJETS
// slot 29912
                            if slot <> 29912 or instruction <> 5373 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29913 {
// SERVICER.agc:279
//
// SERVICER.agc:280
//		CA	BIT9		# CHECK GIMBAL FAIL BIT
// slot 29913
                        if slot <> 29913 or instruction <> 14819 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29914 {
// SERVICER.agc:281
//		EXTEND
// slot 29914
                            if slot <> 29914 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:282
//		RAND	CHAN32
// slot 29915
                            if slot <> 29915 or instruction <> 1050 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 26, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29918 {
                    if slot <= 29916 {
// SERVICER.agc:283
//		EXTEND
// slot 29916
                        if slot <> 29916 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29917 {
// SERVICER.agc:284
//		BZF	USEJETS
// slot 29917
                            if slot <> 29917 or instruction <> 5373 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:285
//
// SERVICER.agc:286
//USEGTS		CS	USEQRJTS
// slot 29918
                            if slot <> 29918 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29920 {
                        if slot <= 29919 {
// SERVICER.agc:287
//		MASK	DAPBOOLS
// slot 29919
                            if slot <> 29919 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:288
//		TS	DAPBOOLS
// slot 29920
                            if slot <> 29920 or instruction <> 22601 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22601, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29921 {
// SERVICER.agc:289
//		TCF	SERVOUT
// slot 29921
                            if slot <> 29921 or instruction <> 5376 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5376, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:290
//
// SERVICER.agc:291
//NODVMON1	CS	AUXFLBIT	# SET AUXFLAG TO 0.
// slot 29922
                            if slot <> 29922 or instruction <> 18922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 29928 {
                if slot <= 29925 {
                    if slot <= 29923 {
// SERVICER.agc:292
//		MASK	FLAGWRD6
// slot 29923
                        if slot <> 29923 or instruction <> 28738 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29924 {
// SERVICER.agc:293
//		TS	FLAGWRD6
// slot 29924
                            if slot <> 29924 or instruction <> 22594 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22594, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:294
//		TCF	USEJETS
// slot 29925
                            if slot <> 29925 or instruction <> 5373 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29926 {
// SERVICER.agc:295
//NODVMON2	CS	FLAGWRD6	# SET AUXFLAG TO 1.
// slot 29926
                        if slot <> 29926 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29927 {
// SERVICER.agc:296
//		MASK	AUXFLBIT
// slot 29927
                            if slot <> 29927 or instruction <> 31210 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                if fixedOperand = 2 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:297
//		ADS	FLAGWRD6
// slot 29928
                            if slot <> 29928 or instruction <> 11330 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 66).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29931 {
                    if slot <= 29929 {
// SERVICER.agc:298
//		TCF	USEJETS
// slot 29929
                        if slot <> 29929 or instruction <> 5373 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5373, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29930 {
// SERVICER.agc:299
//
// SERVICER.agc:300
//LOTHRUST	TC	QUIKFAZ5
// slot 29930
                            if slot <> 29930 or instruction <> 1898 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1898, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:301
//		CCS	DVCNTR
// slot 29931
                            if slot <> 29931 or instruction <> 4941 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 845).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29933 {
                        if slot <= 29932 {
// SERVICER.agc:302
//		TCF	DECCNTR
// slot 29932
                            if slot <> 29932 or instruction <> 5366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:303
//
// SERVICER.agc:304
//		CCS	PHASE4		# COMFAIL JOB ACTIVE?
// slot 29933
                            if slot <> 29933 or instruction <> 4593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 497).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29934 {
// SERVICER.agc:305
//		TCF	SERVOUT		# YES:  WON'T NEED ANOTHER.
// slot 29934
                            if slot <> 29934 or instruction <> 5376 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5376, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:306
//
// SERVICER.agc:307
//		TC	PHASCHNG	# 4.37SPOT FOR COMFAIL.
// slot 29935
                            if slot <> 29935 or instruction <> 2795 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2795, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1924] to agcAotUnit1924@.

agcAotInstallSourceRope(list(
// SERVICER.agc:308
//		OCT	00374
// slot 29936
    29936, 504
)).

// bank 33, slots 29937-29938
function agcAotUnit1925 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29937 {
// SERVICER.agc:309
//
// SERVICER.agc:310
//		CAF	PRIO25
// slot 29937
        if slot <> 29937 or instruction <> 16331 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4043), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:311
//		TC	NOVAC
// slot 29938
        if slot <> 29938 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1925] to agcAotUnit1925@.

agcAotInstallSourceRope(list(
// SERVICER.agc:312
//		EBANK=	WHICH
// SERVICER.agc:313
//		2CADR	COMFAIL
// slot 29939 29940
    29939, 2802, 29940, 61550
)).

// bank 33, slots 29941-29947
function agcAotUnit1926 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29943 {
        if slot <= 29941 {
// SERVICER.agc:314
//
// SERVICER.agc:315
//		TCF	SERVOUT
// slot 29941
            if slot <> 29941 or instruction <> 5376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5376, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29942 {
// SERVICER.agc:316
//
// SERVICER.agc:317
//DECCNTR		TS	DVCNTR1
// slot 29942
                if slot <> 29942 or instruction <> 23416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23416, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:318
//		TC	QUIKFAZ5
// slot 29943
                if slot <> 29943 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29945 {
            if slot <= 29944 {
// SERVICER.agc:319
//		CA	DVCNTR1
// slot 29944
                if slot <> 29944 or instruction <> 13176 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 888).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:320
//		TS	DVCNTR
// slot 29945
                if slot <> 29945 or instruction <> 23373 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23373, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29946 {
// SERVICER.agc:321
//		INHINT
// slot 29946
                if slot <> 29946 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:322
//		TC	IBNKCALL	# IF THRUST IS LOW, NO STEERING IS DONE
// slot 29947
                if slot <> 29947 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1926] to agcAotUnit1926@.

agcAotInstallSourceRope(list(
// SERVICER.agc:323
//# Page 863
// SERVICER.agc:324
//		CADR	STOPRATE	# AND THE DESIRED RATES ARE SET TO ZERO.
// slot 29948
    29948, 33002
)).

// bank 33, slots 29949-29953
function agcAotUnit1927 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29950 {
        if slot <= 29949 {
// SERVICER.agc:325
//USEJETS		CS	DAPBOOLS
// slot 29949
            if slot <> 29949 or instruction <> 16457 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 73).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:326
//		MASK	USEQRJTS
// slot 29950
            if slot <> 29950 or instruction <> 31198 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
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
        if slot <= 29951 {
// SERVICER.agc:327
//		ADS	DAPBOOLS
// slot 29951
            if slot <> 29951 or instruction <> 11337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 73).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29952 {
// SERVICER.agc:328
//SERVOUT		RELINT
// slot 29952
                if slot <> 29952 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:329
//		TC	BANKCALL
// slot 29953
                if slot <> 29953 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1927] to agcAotUnit1927@.

agcAotInstallSourceRope(list(
// SERVICER.agc:330
//		CADR	1/ACCS
// slot 29954
    29954, 33374
)).

// bank 33, slots 29955-29963
function agcAotUnit1928 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29958 {
        if slot <= 29956 {
            if slot <= 29955 {
// SERVICER.agc:331
//
// SERVICER.agc:332
//		CA	PRIORITY
// slot 29955
                if slot <> 29955 or instruction <> 12407 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 119).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:333
//		MASK	LOW9
// slot 29956
                if slot <> 29956 or instruction <> 31236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    if fixedOperand = 511 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29957 {
// SERVICER.agc:334
//		TS	PUSHLOC
// slot 29957
                if slot <> 29957 or instruction <> 22646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:335
//		ZL
// slot 29958
                if slot <> 29958 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29960 {
            if slot <= 29959 {
// SERVICER.agc:336
//		DXCH	FIXLOC		# FIXLOC AND DVFIND
// slot 29959
                if slot <> 29959 or instruction <> 21585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 81, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:337
//
// SERVICER.agc:338
//		TC	QUIKFAZ5
// slot 29960
                if slot <> 29960 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29961 {
// SERVICER.agc:339
//		EXTEND			# EXIT TO SELECTED ROUTINE WHETHER THERE
// slot 29961
                if slot <> 29961 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29962 {
// SERVICER.agc:340
//		DCA	AVGEXIT		# IS THRUST OR NOT.  THE STATE OF STEERSW
// slot 29962
                    if slot <> 29962 or instruction <> 12971 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 683, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:341
//		DXCH	Z		# WILL CONVEY THIS INFORMATION.
// slot 29963
                    if slot <> 29963 or instruction <> 21510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1928] to agcAotUnit1928@.

agcAotInstallSourceRope(list(
// SERVICER.agc:342
//
// SERVICER.agc:343
//XNBPIPAD	ECADR	XNBPIP
// slot 29964
    29964, 2250
)).

// bank 22, slots 21425-21427
function agcAotUnit1324 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21425 {
// SERVICER.agc:344
//
// SERVICER.agc:345
//		BANK	32
// SERVICER.agc:346
//		SETLOC	SERV2
// SERVICER.agc:347
//		BANK
// SERVICER.agc:348
//		COUNT*	$$/SERV
// SERVICER.agc:349
//
// SERVICER.agc:350
//AVGEND		CA	PIPTIME +1	# FINAL AVERAGE G EXIT
// slot 21425
        if slot <> 21425 or instruction <> 12957 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 669).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21426 {
// SERVICER.agc:351
//		TS	1/PIPADT	# SET UP FREE FALL GYRO COMPENSATION.
// slot 21426
            if slot <> 21426 or instruction <> 23101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23101, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:352
//
// SERVICER.agc:353
//		TC	UPFLAG		# SET DRIFT FLAG.
// slot 21427
            if slot <> 21427 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1324] to agcAotUnit1324@.

agcAotInstallSourceRope(list(
// SERVICER.agc:354
//		ADRES	DRIFTFLG
// slot 21428
    21428, 60
)).

// bank 22, slots 21429-21429
function agcAotUnit1325 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:355
//
// SERVICER.agc:356
//		TC	BANKCALL
// slot 21429
    if slot <> 21429 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1325] to agcAotUnit1325@.

agcAotInstallSourceRope(list(
// SERVICER.agc:357
//		CADR	PIPFREE
// slot 21430
    21430, 15760
)).

// bank 22, slots 21431-21434
function agcAotUnit1326 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21432 {
        if slot <= 21431 {
// SERVICER.agc:358
//
// SERVICER.agc:359
//		CS	BIT9
// slot 21431
            if slot <> 21431 or instruction <> 18915 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:360
//		EXTEND
// slot 21432
            if slot <> 21432 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21433 {
// SERVICER.agc:361
//		WAND	DSALMOUT
// slot 21433
            if slot <> 21433 or instruction <> 1545 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:362
//
// SERVICER.agc:363
//		TC	2PHSCHNG
// slot 21434
            if slot <> 21434 or instruction <> 2775 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2775, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1326] to agcAotUnit1326@.

agcAotInstallSourceRope(list(
// SERVICER.agc:364
//		OCT	5		# GROUP 5 OFF
// slot 21435
    21435, 10,
// SERVICER.agc:365
//		OCT	05022		# GROUP 2 ON
// slot 21436
    21436, 5156,
// SERVICER.agc:366
//		OCT	20000
// slot 21437
    21437, 16384
)).

// bank 22, slots 21438-21438
function agcAotUnit1327 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:367
//
// SERVICER.agc:368
//		TC	INTPRET
// slot 21438
    if slot <> 21438 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1327] to agcAotUnit1327@.

agcAotInstallSourceRope(list(
// SERVICER.agc:369
//		SET	CLEAR
// slot 21439
    21439, 35864,
// SERVICER.agc:370
//			NOR29FLG	# SHUT OFF R29 WHEN SERVICER ENDS.
// slot 21440
    21440, 1640,
// SERVICER.agc:371
//			SWANDISP	# SHUT OFF R10 WHEN SERVICER ENDS.
// slot 21441
    21441, 3944,
// SERVICER.agc:372
//		CLEAR	CALL		# RESET MUNFLAG.
// slot 21442
    21442, 37912,
// SERVICER.agc:373
//			MUNFLAG
// slot 21443
    21443, 3438,
// SERVICER.agc:374
//# Page 864
// SERVICER.agc:375
//			AVETOMID
// slot 21444
    21444, 24174,
// SERVICER.agc:376
//		CLEAR	EXIT
// slot 21445
    21445, 65048,
// SERVICER.agc:377
//			V37FLAG
// slot 21446
    21446, 3954
)).

// bank 22, slots 21447-21448
function agcAotUnit1328 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21447 {
// SERVICER.agc:378
//AVERTRN		CA	OUTROUTE	# RETURN TO DESIRED POINT.
// slot 21447
        if slot <> 21447 or instruction <> 12976 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 688).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:379
//		TC	BANKJUMP
// slot 21448
        if slot <> 21448 or instruction <> 2464 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2464, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1328] to agcAotUnit1328@.

// bank 27, slots 26321-26349
function agcAotUnit1681 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26334 {
        if slot <= 26327 {
            if slot <= 26323 {
                if slot <= 26321 {
// SERVICER.agc:380
//
// SERVICER.agc:381
//OUTGOAVE	=	AVERTRN
// SERVICER.agc:382
//DVCNTR1		=	MASS1
// SERVICER.agc:383
//
// SERVICER.agc:384
//# Page 865
// SERVICER.agc:385
//		SETLOC	SERV3
// SERVICER.agc:386
//		BANK
// SERVICER.agc:387
//		COUNT*	$$/SERV
// SERVICER.agc:388
//
// SERVICER.agc:389
//SERVIDLE	EXTEND			# DISCONNECT SERVICER FROM ALL GUIDANCE
// slot 26321
                    if slot <> 26321 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26322 {
// SERVICER.agc:390
//		DCA	SVEXTADR
// slot 26322
                        if slot <> 26322 or instruction <> 14063 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1775, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:391
//		DXCH	AVGEXIT
// slot 26323
                        if slot <> 26323 or instruction <> 22187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26325 {
                    if slot <= 26324 {
// SERVICER.agc:392
//
// SERVICER.agc:393
//		CS	FLAGWRD7	# DISCONNECT THE DELTA-V MONITOR
// slot 26324
                        if slot <> 26324 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:394
//		MASK	IDLEFBIT
// slot 26325
                        if slot <> 26325 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
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
                    if slot <= 26326 {
// SERVICER.agc:395
//		ADS	FLAGWRD7
// slot 26326
                        if slot <> 26326 or instruction <> 11331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:396
//
// SERVICER.agc:397
//		CAF	LRBYBIT		# TERMINATE R12 IS RUNNING.
// slot 26327
                        if slot <> 26327 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26330 {
                if slot <= 26328 {
// SERVICER.agc:398
//		TS	FLGWRD11
// slot 26328
                    if slot <> 26328 or instruction <> 22599 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22599, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26329 {
// SERVICER.agc:399
//
// SERVICER.agc:400
//		EXTEND
// slot 26329
                        if slot <> 26329 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:401
//		DCA	NEG0
// slot 26330
                        if slot <> 26330 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26332 {
                    if slot <= 26331 {
// SERVICER.agc:402
//		DXCH	-PHASE1
// slot 26331
                        if slot <> 26331 or instruction <> 21995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:403
//
// SERVICER.agc:404
//		CA	FLAGWRD6	# DO NOT TURN OFF PHASE 2 IF MUNFLAG SET.
// slot 26332
                        if slot <> 26332 or instruction <> 12354 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26333 {
// SERVICER.agc:405
//		MASK	MUNFLBIT
// slot 26333
                        if slot <> 26333 or instruction <> 31204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            if fixedOperand = 128 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:406
//		CCS	A
// slot 26334
                        if slot <> 26334 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 26341 {
            if slot <= 26337 {
                if slot <= 26335 {
// SERVICER.agc:407
//		TCF	+4
// slot 26335
                    if slot <> 26335 or instruction <> 5859 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5859, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26336 {
// SERVICER.agc:408
//
// SERVICER.agc:409
//		EXTEND
// slot 26336
                        if slot <> 26336 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:410
//		DCA	NEG0
// slot 26337
                        if slot <> 26337 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26339 {
                    if slot <= 26338 {
// SERVICER.agc:411
//		DXCH	-PHASE2
// slot 26338
                        if slot <> 26338 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:412
//
// SERVICER.agc:413
// +4		EXTEND
// slot 26339
                        if slot <> 26339 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26340 {
// SERVICER.agc:414
// 		DCA	NEG0
// slot 26340
                        if slot <> 26340 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:415
//		DXCH	-PHASE3
// slot 26341
                        if slot <> 26341 or instruction <> 21999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26345 {
                if slot <= 26343 {
                    if slot <= 26342 {
// SERVICER.agc:416
//
// SERVICER.agc:417
//		EXTEND
// slot 26342
                        if slot <> 26342 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:418
//		DCA	NEG0
// slot 26343
                        if slot <> 26343 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26344 {
// SERVICER.agc:419
//		DXCH	-PHASE6
// slot 26344
                        if slot <> 26344 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:420
//
// SERVICER.agc:421
//		CAF	OCT33		# 4.33SPOT FOR GOP00FIX
// slot 26345
                        if slot <> 26345 or instruction <> 14836 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2548), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26347 {
                    if slot <= 26346 {
// SERVICER.agc:422
//		TS	L
// slot 26346
                        if slot <> 26346 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:423
//		COM
// slot 26347
                        if slot <> 26347 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26348 {
// SERVICER.agc:424
//		DXCH	-PHASE4
// slot 26348
                        if slot <> 26348 or instruction <> 22001 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:425
//
// SERVICER.agc:426
//		TCF	WHIMPER		# PERFORM A SOFTWARE RESTART AND PROCEED
// slot 26349
                        if slot <> 26349 or instruction <> 7076 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7076, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1681] to agcAotUnit1681@.

agcAotInstallSourceRope(list(
// SERVICER.agc:427
//					# TO GOTOPOOH WHILE SERVICER CONTINUES TO
// SERVICER.agc:428
//					# RUN, ALBEIT IN A GROUND STATE WHERE
// SERVICER.agc:429
//					# ONLY STATE-VECTOR DEPENDENT FUNCTIONS
// SERVICER.agc:430
//					# ARE MAINTAINED.
// SERVICER.agc:431
//
// SERVICER.agc:432
//		EBANK=	DVCNTR
// SERVICER.agc:433
//# Page 866
// SERVICER.agc:434
//SVEXTADR	2CADR	SERVEXIT
// slot 26350 26351
    26350, 4080, 26351, 53358
)).

// bank 32, slots 29688-29688
function agcAotUnit1906 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:435
//
// SERVICER.agc:436
//		BANK	32
// SERVICER.agc:437
//		SETLOC	SERV
// SERVICER.agc:438
//		BANK
// SERVICER.agc:439
//		COUNT*	$$/SERV
// SERVICER.agc:440
//
// SERVICER.agc:441
//SERVEXIT	TC	PHASCHNG
// slot 29688
    if slot <> 29688 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1906] to agcAotUnit1906@.

agcAotInstallSourceRope(list(
// SERVICER.agc:442
//		OCT	00035
// slot 29689
    29689, 58
)).

// bank 32, slots 29690-29690
function agcAotUnit1907 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:443
//
// SERVICER.agc:444
//+2		TCF	ENDOFJOB
// slot 29690
    if slot <> 29690 or instruction <> 6765 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6765, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1907] to agcAotUnit1907@.

// bank 23, slots 21809-21809
function agcAotUnit1359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:445
//
// SERVICER.agc:446
//		BANK	23
// SERVICER.agc:447
//		SETLOC	NORMLIZ
// SERVICER.agc:448
//		BANK
// SERVICER.agc:449
//
// SERVICER.agc:450
//		COUNT*	$$/SERV
// SERVICER.agc:451
//
// SERVICER.agc:452
//# Page 867
// SERVICER.agc:453
//NORMLIZE	TC	INTPRET
// slot 21809
    if slot <> 21809 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1359] to agcAotUnit1359@.

agcAotInstallSourceRope(list(
// SERVICER.agc:454
//		VLOAD	BOFF
// slot 21810
    21810, 36090,
// SERVICER.agc:455
//			RN1
// slot 21811
    21811, 3786,
// SERVICER.agc:456
//			MUNFLAG
// slot 21812
    21812, 3534,
// SERVICER.agc:457
//			NORMLIZ1
// slot 21813
    21813, 55834,
// SERVICER.agc:458
//		VSL6	MXV
// slot 21814
    21814, 53588,
// SERVICER.agc:459
//			REFSMMAT
// slot 21815
    21815, 1976,
// SERVICER.agc:460
//		STCALL	R
// slot 21816
    21816, 32418,
// SERVICER.agc:461
//			MUNGRAV
// slot 21817
    21817, 56496,
// SERVICER.agc:462
//		VLOAD	VSL1
// slot 21818
    21818, 64250,
// SERVICER.agc:463
//			VN1
// slot 21819
    21819, 3798,
// SERVICER.agc:464
//		MXV
// slot 21820
    21820, 65442,
// SERVICER.agc:465
//			REFSMMAT
// slot 21821
    21821, 1976,
// SERVICER.agc:466
//		STOVL	V
// slot 21822
    21822, 24238,
// SERVICER.agc:467
//			V(CSM)
// slot 21823
    21823, 1964,
// SERVICER.agc:468
//		VXV	UNIT
// slot 21824
    21824, 44602,
// SERVICER.agc:469
//			R(CSM)
// slot 21825
    21825, 1952,
// SERVICER.agc:470
//		STORE	UHYP
// slot 21826
    21826, 4000,
// SERVICER.agc:471
//ASCSPOT		EXIT
// slot 21827
    21827, 65532
)).

// bank 23, slots 21828-21831
function agcAotUnit1360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21829 {
        if slot <= 21828 {
// SERVICER.agc:472
//		EXTEND			# MAKE SURE GROUP 2 IS OFF
// slot 21828
            if slot <> 21828 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:473
//		DCA	NEG0
// slot 21829
            if slot <> 21829 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21830 {
// SERVICER.agc:474
//		DXCH	-PHASE2
// slot 21830
            if slot <> 21830 or instruction <> 21997 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:475
//
// SERVICER.agc:476
//		TC	POSTJUMP
// slot 21831
            if slot <> 21831 or instruction <> 2461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1360] to agcAotUnit1360@.

agcAotInstallSourceRope(list(
// SERVICER.agc:477
//		CADR	NORMLIZ2
// slot 21832
    21832, 55840,
// SERVICER.agc:478
//
// SERVICER.agc:479
//		BANK	33
// SERVICER.agc:480
//		SETLOC	SERVICES
// SERVICER.agc:481
//		BANK
// SERVICER.agc:482
//		COUNT*	$$/SERV
// SERVICER.agc:483
//
// SERVICER.agc:484
//NORMLIZ1	CALL
// slot 29965
    29965, 65320,
// SERVICER.agc:485
//			CALCGRAV
// slot 29966
    29966, 56240,
// SERVICER.agc:486
//		EXIT
// slot 29967
    29967, 65532
)).

// bank 33, slots 29968-29976
function agcAotUnit1929 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29971 {
        if slot <= 29969 {
            if slot <= 29968 {
// SERVICER.agc:487
//
// SERVICER.agc:488
//NORMLIZ2	CA	EIGHTEEN
// slot 29968
                if slot <> 29968 or instruction <> 13599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1311), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:489
//		TC	COPYCYC +1	# DO NOT COPY MASS IN NORMLIZE
// slot 29969
                if slot <> 29969 or instruction <> 1300 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1300, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29970 {
// SERVICER.agc:490
//		TC	ENDOFJOB
// slot 29970
                if slot <> 29970 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:491
//
// SERVICER.agc:492
//COPYCYC		CA	OCT24		# DEC 20
// slot 29971
                if slot <> 29971 or instruction <> 15367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29973 {
            if slot <= 29972 {
// SERVICER.agc:493
// +1		INHINT
// slot 29972
                if slot <> 29972 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:494
// +2		MASK	NEG1		# REDUCE BY 1 IF ODD
// slot 29973
                if slot <> 29973 or instruction <> 32743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                    if fixedOperand = 32766 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 16384) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29974 {
// SERVICER.agc:495
// 		TS	ITEMP1
// slot 29974
                if slot <> 29974 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29975 {
// SERVICER.agc:496
//		EXTEND
// slot 29975
                    if slot <> 29975 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:497
//		INDEX	ITEMP1
// slot 29976
                    if slot <> 29976 or instruction <> 20529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1929] to agcAotUnit1929@.

agcAotInstallSourceRope(list(
// SERVICER.agc:498
//		DCA	RN1
// slot 29977
    29977, 26314
)).

// bank 33, slots 29978-29978
function agcAotUnit1930 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:499
//		INDEX	ITEMP1
// slot 29978
    if slot <> 29978 or instruction <> 20529 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20529, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20529, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1930] to agcAotUnit1930@.

agcAotInstallSourceRope(list(
// SERVICER.agc:500
//# Page 868
// SERVICER.agc:501
//		DXCH	RN
// slot 29979
    29979, 44322
)).

// bank 33, slots 29980-29982
function agcAotUnit1931 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29980 {
// SERVICER.agc:502
//		CCS	ITEMP1
// slot 29980
        if slot <> 29980 or instruction <> 4145 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 49).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29981 {
// SERVICER.agc:503
//		TCF	COPYCYC +2
// slot 29981
            if slot <> 29981 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:504
//		TC	Q		# RETURN UNDER INHINT
// slot 29982
            if slot <> 29982 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1931] to agcAotUnit1931@.

agcAotInstallSourceRope(list(
// SERVICER.agc:505
//
// SERVICER.agc:506
//EIGHTEEN	DEC	18
// slot 29983
    29983, 36
)).

// bank 37, slots 34657-34707
function agcAotUnit2286 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34681 {
        if slot <= 34668 {
            if slot <= 34662 {
                if slot <= 34659 {
                    if slot <= 34657 {
// SERVICER.agc:507
//
// SERVICER.agc:508
//# Page 869
// SERVICER.agc:509
//# ************* PIPA READER *****************
// SERVICER.agc:510
//# MOD NO. 00 BY D. LICKLY, DEC. 9 1966
// SERVICER.agc:511
//#
// SERVICER.agc:512
//# FUNCTIONAL DESCRIPTION
// SERVICER.agc:513
//#	SUBROUTINE TO READ PIPA COUNTERS, TRYING TO BE VERY CAREFUL SO THAT WILL BE RESTARTABLE.
// SERVICER.agc:514
//#	PIPA READINGS ARE STORED IN THE VECTOR DELV.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS THE PIPA READING,
// SERVICER.agc:515
//# 	RESTARTS BEGIN AT REREADAC.
// SERVICER.agc:516
//#
// SERVICER.agc:517
//#	AT THE END OF THE PIPA READER THE CDUS ARE READ AND STORED AS A
// SERVICER.agc:518
//#	VECTOR IN CDUTEMP.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS
// SERVICER.agc:519
//# 	THE CDU READING IN 25 COMP IN THE ORDER CDUX,Y,Z.  THE THRUST
// SERVICER.agc:520
//#	VECTOR ESTIMATOR IN FINDCDUD REQUIRES THE CDUS BE READ AT PIPTIME.
// SERVICER.agc:521
//#
// SERVICER.agc:522
//# CALLING SEQUENCE AND EXIT
// SERVICER.agc:523
//#	CALL VIA TC, ISWCALL, ETC.
// SERVICER.agc:524
//#	EXIT IS VIA Q.
// SERVICER.agc:525
//#
// SERVICER.agc:526
//# INPUT
// SERVICER.agc:527
//#	INPUT IS THROUGH THE COUNTERS PIPAX, PIPAY, PIPAZ, AND TIME2.
// SERVICER.agc:528
//#
// SERVICER.agc:529
//# OUTPUT
// SERVICER.agc:530
//#	HIGH ORDER COMPONENTS OF THE VECTOR DELV CONTAIN THE PIPA READINGS.
// SERVICER.agc:531
//#	PIPTIME CONTAINS TIME OF PIPA READING.
// SERVICER.agc:532
//#
// SERVICER.agc:533
//# DEBRIS (ERASABLE LOCATIONS DESTROYED BY PROGRAM)
// SERVICER.agc:534
//#	TEMX, TEMY, TEMZ, PIPAGE
// SERVICER.agc:535
//
// SERVICER.agc:536
//		BANK	37
// SERVICER.agc:537
//		SETLOC	SERV1
// SERVICER.agc:538
//		BANK
// SERVICER.agc:539
//
// SERVICER.agc:540
//		COUNT*	$$/SERV
// SERVICER.agc:541
//
// SERVICER.agc:542
//PIPASR		EXTEND
// slot 34657
                        if slot <> 34657 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34658 {
// SERVICER.agc:543
//# Page 870
// SERVICER.agc:544
//		DCA	TIME2
// slot 34658
                            if slot <> 34658 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:545
//		DXCH	PIPTIME1	# CURRENT TIME POSITIVE VALUE
// slot 34659
                            if slot <> 34659 or instruction <> 22385 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 881, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34660 {
// SERVICER.agc:546
// +3		CS	ZERO		# INITIALIZE THESE AT NEG. ZERO.
// slot 34660
                        if slot <> 34660 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34661 {
// SERVICER.agc:547
// 		TS	TEMX
// slot 34661
                            if slot <> 34661 or instruction <> 23212 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23212, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:548
//		TS	TEMY
// slot 34662
                            if slot <> 34662 or instruction <> 23213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34665 {
                    if slot <= 34663 {
// SERVICER.agc:549
//		TS	TEMZ
// slot 34663
                        if slot <> 34663 or instruction <> 23214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23214, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34664 {
// SERVICER.agc:550
//
// SERVICER.agc:551
//		CA	ZERO
// slot 34664
                            if slot <> 34664 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:552
//		TS	DELVZ
// slot 34665
                            if slot <> 34665 or instruction <> 22744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34666 {
// SERVICER.agc:553
//		TS	DELVZ +1
// slot 34666
                        if slot <> 34666 or instruction <> 22745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22745, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34667 {
// SERVICER.agc:554
//		TS	DELVY
// slot 34667
                            if slot <> 34667 or instruction <> 22742 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22742, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:555
//		TS	DELVY +1
// slot 34668
                            if slot <> 34668 or instruction <> 22743 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22743, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34674 {
                if slot <= 34671 {
                    if slot <= 34669 {
// SERVICER.agc:556
//		TS	DELVX +1
// slot 34669
                        if slot <> 34669 or instruction <> 22741 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22741, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34670 {
// SERVICER.agc:557
//		TS	PIPAGE		# SHOW PIPA READING IN PROGRESS
// slot 34670
                            if slot <> 34670 or instruction <> 23215 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23215, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:558
//
// SERVICER.agc:559
//REPIP1		EXTEND
// slot 34671
                            if slot <> 34671 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34672 {
// SERVICER.agc:560
//		DCS	PIPAX		# X AND Y PIPS READ
// slot 34672
                        if slot <> 34672 or instruction <> 16416 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 32, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34673 {
// SERVICER.agc:561
//		DXCH	TEMX
// slot 34673
                            if slot <> 34673 or instruction <> 22189 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 685, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:562
//		DXCH	PIPAX		# PIPAS SET TO NEG ZERO AS READ.
// slot 34674
                            if slot <> 34674 or instruction <> 21536 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 32, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34677 {
                    if slot <= 34675 {
// SERVICER.agc:563
//		TS	DELVX
// slot 34675
                        if slot <> 34675 or instruction <> 22740 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22740, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34676 {
// SERVICER.agc:564
//		LXCH	DELVY
// slot 34676
                            if slot <> 34676 or instruction <> 9430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 214, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:565
//
// SERVICER.agc:566
//REPIP3		CS	PIPAZ		# REPEAT PROCESS FOR Z PIP
// slot 34677
                            if slot <> 34677 or instruction <> 16417 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 33).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34679 {
                        if slot <= 34678 {
// SERVICER.agc:567
//		XCH	TEMZ
// slot 34678
                            if slot <> 34678 or instruction <> 24238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 686, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:568
//		XCH	PIPAZ
// slot 34679
                            if slot <> 34679 or instruction <> 23585 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 33, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34680 {
// SERVICER.agc:569
//DODELVZ		TS	DELVZ
// slot 34680
                            if slot <> 34680 or instruction <> 22744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:570
//
// SERVICER.agc:571
//REPIP4		EXTEND			# COMPUTE GUIDANCE PERIOD
// slot 34681
                            if slot <> 34681 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 34694 {
            if slot <= 34687 {
                if slot <= 34684 {
                    if slot <= 34682 {
// SERVICER.agc:572
//		DCA	PIPTIME1
// slot 34682
                        if slot <> 34682 or instruction <> 13169 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34683 {
// SERVICER.agc:573
//		DXCH	PGUIDE
// slot 34683
                            if slot <> 34683 or instruction <> 22184 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 680, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:574
//		EXTEND
// slot 34684
                            if slot <> 34684 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34685 {
// SERVICER.agc:575
//		DCS	PIPTIME
// slot 34685
                        if slot <> 34685 or instruction <> 17053 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 669, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34686 {
// SERVICER.agc:576
//		DAS	PGUIDE
// slot 34686
                            if slot <> 34686 or instruction <> 8872 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 680) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:577
//
// SERVICER.agc:578
//		CA	CDUX		# READ CDUS INTO HIGH ORDER CDUTEMPS
// slot 34687
                            if slot <> 34687 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34690 {
                    if slot <= 34688 {
// SERVICER.agc:579
//		TS	CDUTEMPX
// slot 34688
                        if slot <> 34688 or instruction <> 23149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23149, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34689 {
// SERVICER.agc:580
//		CA	CDUY
// slot 34689
                            if slot <> 34689 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:581
//		TS	CDUTEMPY
// slot 34690
                            if slot <> 34690 or instruction <> 23150 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23150, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34692 {
                        if slot <= 34691 {
// SERVICER.agc:582
//		CA	CDUZ
// slot 34691
                            if slot <> 34691 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:583
//		TS	CDUTEMPZ
// slot 34692
                            if slot <> 34692 or instruction <> 23151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23151, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34693 {
// SERVICER.agc:584
//		CA	DELVX
// slot 34693
                            if slot <> 34693 or instruction <> 12500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 212).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:585
//		TS	PIPATMPX
// slot 34694
                            if slot <> 34694 or instruction <> 23152 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23152, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34700 {
                if slot <= 34697 {
                    if slot <= 34695 {
// SERVICER.agc:586
//		CA	DELVY
// slot 34695
                        if slot <> 34695 or instruction <> 12502 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 214).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34696 {
// SERVICER.agc:587
//		TS	PIPATMPY
// slot 34696
                            if slot <> 34696 or instruction <> 23153 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23153, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:588
//		CA	DELVZ
// slot 34697
                            if slot <> 34697 or instruction <> 12504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 216).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34698 {
// SERVICER.agc:589
//		TS	PIPATMPZ
// slot 34698
                        if slot <> 34698 or instruction <> 23154 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23154, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34699 {
// SERVICER.agc:590
//
// SERVICER.agc:591
//		TC	Q
// slot 34699
                            if slot <> 34699 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:592
//
// SERVICER.agc:593
//# Page 871
// SERVICER.agc:594
//REREADAC	CCS	PIPAGE
// slot 34700
                            if slot <> 34700 or instruction <> 4783 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 687).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34703 {
                    if slot <= 34701 {
// SERVICER.agc:595
//		TCF	READACCS	# PIP READING NOT STARTED.  GO TO BEGINNING
// slot 34701
                        if slot <> 34701 or instruction <> 5921 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5921, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34702 {
// SERVICER.agc:596
//
// SERVICER.agc:597
//		CAF	DONEADR		# SET UP RETURN FROM PIPASR
// slot 34702
                            if slot <> 34702 or instruction <> 14252 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1964), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:598
//		TS	Q
// slot 34703
                            if slot <> 34703 or instruction <> 22530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34705 {
                        if slot <= 34704 {
// SERVICER.agc:599
//
// SERVICER.agc:600
//		CCS	DELVZ
// slot 34704
                            if slot <> 34704 or instruction <> 4312 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 216).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:601
//		TCF	REPIP4		# Z DONE, GO DO CDUS
// slot 34705
                            if slot <> 34705 or instruction <> 6009 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6009, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34706 {
// SERVICER.agc:602
//		TCF	+3		# Z NOT DONE, CHECK Y.
// slot 34706
                            if slot <> 34706 or instruction <> 6037 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6037, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:603
//		TCF	REPIP4
// slot 34707
                            if slot <> 34707 or instruction <> 6009 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6009, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2286] to agcAotUnit2286@.

// bank 37, slots 34708-34731
function agcAotUnit2287 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34719 {
        if slot <= 34713 {
            if slot <= 34710 {
                if slot <= 34708 {
// SERVICER.agc:604
//		TCF	REPIP4
// slot 34708
                    if slot <> 34708 or instruction <> 6009 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6009, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34709 {
// SERVICER.agc:605
//
// SERVICER.agc:606
//		ZL
// slot 34709
                        if slot <> 34709 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:607
//		CCS	DELVY
// slot 34710
                        if slot <> 34710 or instruction <> 4310 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 214).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34711 {
// SERVICER.agc:608
//		TCF	+3
// slot 34711
                    if slot <> 34711 or instruction <> 6042 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6042, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34712 {
// SERVICER.agc:609
//		TCF	CHKTEMX		# Y NOT DONE, CHECK X.
// slot 34712
                        if slot <> 34712 or instruction <> 6049 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6049, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:610
//		TCF	+1
// slot 34713
                        if slot <> 34713 or instruction <> 6042 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6042, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 34716 {
                if slot <= 34714 {
// SERVICER.agc:611
//		LXCH	PIPAZ		# Y DONE, ZERO Z PIP.
// slot 34714
                    if slot <> 34714 or instruction <> 9249 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 33, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34715 {
// SERVICER.agc:612
//
// SERVICER.agc:613
//		CCS	TEMZ
// slot 34715
                        if slot <> 34715 or instruction <> 4782 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 686).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:614
//		CS	TEMZ		# TEMZ NOT = -0, CONTAINS -PIPAZ VALUE.
// slot 34716
                        if slot <> 34716 or instruction <> 17070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 686).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34717 {
// SERVICER.agc:615
//		TCF	DODELVZ
// slot 34717
                    if slot <> 34717 or instruction <> 6008 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6008, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34718 {
// SERVICER.agc:616
//		TCF	-2
// slot 34718
                        if slot <> 34718 or instruction <> 6044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:617
//		LXCH	DELVZ		# TEMZ = -0, L HAS ZPIP VALUE.
// slot 34719
                        if slot <> 34719 or instruction <> 9432 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 216, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 34725 {
            if slot <= 34722 {
                if slot <= 34720 {
// SERVICER.agc:618
//		TCF	REPIP4
// slot 34720
                    if slot <> 34720 or instruction <> 6009 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6009, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34721 {
// SERVICER.agc:619
//
// SERVICER.agc:620
//CHKTEMX		CCS	TEMX		# HAS THIS CHANGED
// slot 34721
                        if slot <> 34721 or instruction <> 4780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 684).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:621
//		CS	TEMX		# YES
// slot 34722
                        if slot <> 34722 or instruction <> 17068 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 684).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34723 {
// SERVICER.agc:622
//		TCF	+3		# YES
// slot 34723
                    if slot <> 34723 or instruction <> 6054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34724 {
// SERVICER.agc:623
//		TCF	-2		# YES
// slot 34724
                        if slot <> 34724 or instruction <> 6050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:624
//		TCF	REPIP1		# NO
// slot 34725
                        if slot <> 34725 or instruction <> 5999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5999, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 34728 {
                if slot <= 34726 {
// SERVICER.agc:625
//		TS	DELVX
// slot 34726
                    if slot <> 34726 or instruction <> 22740 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22740, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34727 {
// SERVICER.agc:626
//
// SERVICER.agc:627
//		CS	TEMY
// slot 34727
                        if slot <> 34727 or instruction <> 17069 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 685).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:628
//		TS	DELVY
// slot 34728
                        if slot <> 34728 or instruction <> 22742 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22742, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 34729 {
// SERVICER.agc:629
//
// SERVICER.agc:630
//		CS	ZERO		# ZERO X AND Y PIPS
// slot 34729
                    if slot <> 34729 or instruction <> 18925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34730 {
// SERVICER.agc:631
//		DXCH	PIPAX		# L STILL ZERO FROM ABOVE
// slot 34730
                        if slot <> 34730 or instruction <> 21536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 32, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:632
//
// SERVICER.agc:633
//		TCF	REPIP3
// slot 34731
                        if slot <> 34731 or instruction <> 6005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6005, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2287] to agcAotUnit2287@.

agcAotInstallSourceRope(list(
// SERVICER.agc:634
//
// SERVICER.agc:635
//DONEADR		GENADR	PIPSDONE
// slot 34732
    34732, 3666
)).

// bank 33, slots 29984-29984
function agcAotUnit1932 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:636
//
// SERVICER.agc:637
//# Page 872
// SERVICER.agc:638
//		BANK	33
// SERVICER.agc:639
//		SETLOC	SERVICES
// SERVICER.agc:640
//		BANK
// SERVICER.agc:641
//
// SERVICER.agc:642
//		COUNT*	$$/SERV
// SERVICER.agc:643
//
// SERVICER.agc:644
//TMPTOSPT	CA	CDUTEMPY	# THIS SUBROUTINE, CALLED BY AN RTB FROM
// slot 29984
    if slot <> 29984 or instruction <> 12910 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 622).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1932] to agcAotUnit1932@.

// bank 33, slots 29985-29990
function agcAotUnit1933 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29987 {
        if slot <= 29985 {
// SERVICER.agc:645
//		TS	CDUSPOTY	# INTERPRETIVE, LOADS THE CDUS CORRESPON-
// slot 29985
            if slot <> 29985 or instruction <> 23030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29986 {
// SERVICER.agc:646
//		CA	CDUTEMPZ	# DING TO PIPTIME INTO THE CDUSPOT VECTOR.
// slot 29986
                if slot <> 29986 or instruction <> 12911 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 623).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:647
//		TS	CDUSPOTZ
// slot 29987
                if slot <> 29987 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29988 {
// SERVICER.agc:648
//		CA	CDUTEMPX
// slot 29988
            if slot <> 29988 or instruction <> 12909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 621).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29989 {
// SERVICER.agc:649
//		TS	CDUSPOTX
// slot 29989
                if slot <> 29989 or instruction <> 23034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:650
//		TC 	Q
// slot 29990
                if slot <> 29990 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1933] to agcAotUnit1933@.

// bank 21, slots 19544-19557
function agcAotUnit1189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19550 {
        if slot <= 19546 {
            if slot <= 19544 {
// SERVICER.agc:651
//
// SERVICER.agc:652
//# LRHTASK IS A WAITLIST TASK SET BY READACCS DURING THE DESCENT BRAKING
// SERVICER.agc:653
//# PHASE WHEN THE ALT TO THE LUNAR SURFACE IS LESS THAN 25,000 FT.  THIS
// SERVICER.agc:654
//# TASK CLEARS THE ALTITUDE MEASUREMENT MADE DISCRETE AND INITIATES THE
// SERVICER.agc:655
//# LANDING RADAR MEASUREMENT JOB (LRHJOB) TO TAKE A ALTITUDE MEASUREMENT
// SERVICER.agc:656
//# 50 MS PRIOR TO THE NEXT READACCS TASK.
// SERVICER.agc:657
//
// SERVICER.agc:658
//		BANK	21
// SERVICER.agc:659
//		SETLOC	R10
// SERVICER.agc:660
//		BANK
// SERVICER.agc:661
//
// SERVICER.agc:662
//		COUNT*	$$/SERV
// SERVICER.agc:663
//
// SERVICER.agc:664
//LRHTASK		CS	FLGWRD11
// slot 19544
                if slot <> 19544 or instruction <> 16455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 71).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19545 {
// SERVICER.agc:665
//		MASK	LRBYBIT
// slot 19545
                    if slot <> 19545 or instruction <> 31197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        if fixedOperand = 16384 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:666
//		EXTEND
// slot 19546
                    if slot <> 19546 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19548 {
                if slot <= 19547 {
// SERVICER.agc:667
//		BZF	GRP2OFF		# LR BYPASS SET -- BYPASS ALL LR READING.
// slot 19547
                    if slot <> 19547 or instruction <> 5224 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:668
//
// SERVICER.agc:669
//		CA	READLBIT
// slot 19548
                    if slot <> 19548 or instruction <> 14822 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19549 {
// SERVICER.agc:670
//		MASK	FLGWRD11	# IS READLR FLAG SET?
// slot 19549
                    if slot <> 19549 or instruction <> 28743 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 71).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:671
//		EXTEND
// slot 19550
                    if slot <> 19550 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19553 {
            if slot <= 19551 {
// SERVICER.agc:672
//		BZF	GRP2OFF		# NO.  BYPASS LR READ.
// slot 19551
                if slot <> 19551 or instruction <> 5224 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5224, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19552 {
// SERVICER.agc:673
//
// SERVICER.agc:674
//		CS	FLGWRD11
// slot 19552
                    if slot <> 19552 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:675
//		MASK	NOLRRBIT	# IS LR READ INHIBITED?
// slot 19553
                    if slot <> 19553 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19555 {
                if slot <= 19554 {
// SERVICER.agc:676
//		EXTEND
// slot 19554
                    if slot <> 19554 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:677
//		BZF	GRP2OFF		# YES.  BYPASS LR READ.
// slot 19555
                    if slot <> 19555 or instruction <> 5224 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19556 {
// SERVICER.agc:678
//
// SERVICER.agc:679
//		CA	PRIO32		# LR READ OK.  SET JOB TO DO IT
// slot 19556
                    if slot <> 19556 or instruction <> 16336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4048), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:680
//		TC	NOVAC		# ABOUT 50 MS. PRIOR TO PIPA READ.
// slot 19557
                    if slot <> 19557 or instruction <> 2618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1189] to agcAotUnit1189@.

agcAotInstallSourceRope(list(
// SERVICER.agc:681
//		EBANK=	HMEAS
// SERVICER.agc:682
//		2CADR	LRHJOB
// slot 19558 19559
    19558, 3996, 19559, 57454
)).

// bank 21, slots 19560-19563
function agcAotUnit1190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19561 {
        if slot <= 19560 {
// SERVICER.agc:683
//
// SERVICER.agc:684
//GRP2OFF		EXTEND
// slot 19560
            if slot <> 19560 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:685
//		DCA	NEG0
// slot 19561
            if slot <> 19561 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19562 {
// SERVICER.agc:686
//		DXCH	-PHASE2
// slot 19562
            if slot <> 19562 or instruction <> 21997 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:687
//		TCF	R10,R11A
// slot 19563
            if slot <> 19563 or instruction <> 5137 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5137, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1190] to agcAotUnit1190@.

// bank 33, slots 29991-29997
function agcAotUnit1934 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29993 {
        if slot <= 29991 {
// SERVICER.agc:688
//
// SERVICER.agc:689
//		BANK	33
// SERVICER.agc:690
//		SETLOC	SERVICES
// SERVICER.agc:691
//		BANK
// SERVICER.agc:692
//# Page 873
// SERVICER.agc:693
//		COUNT*	$$/SERV
// SERVICER.agc:694
//
// SERVICER.agc:695
//# HIGATASK IS ENTERED APPROXIMATELY 6 SECS PRIOR TO HIGATE DURING THE
// SERVICER.agc:696
//# DESCENT PHASE.  HIGATASK SETS THE HIGATE FLAG (BIT11) AND THE LR INHIBIT
// SERVICER.agc:697
//# FLAG (BIT10) IN LRSTAT.  THE HIGATJOB IS SET UP TO REPOSITION THE LR
// SERVICER.agc:698
//# ANTENNA FROM POSITION 1 TO POSITION 2.  IF THE REPOSITIONING IS
// SERVICER.agc:699
//# SUCCESSFUL THE ALT BEAM AND VELOCITY BEAMS ARE TRANSFORMED TO THE NEW
// SERVICER.agc:700
//# ORIENTATION IN NB COORDINATES AND STORED IN ERASABLE.
// SERVICER.agc:701
//
// SERVICER.agc:702
//HIGATASK	INHINT
// slot 29991
            if slot <> 29991 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29992 {
// SERVICER.agc:703
//		CS	PRIO3		# SET HIGATE AND LR INHIBIT FLAGS
// slot 29992
                if slot <> 29992 or instruction <> 18957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:704
//		MASK	FLGWRD11
// slot 29993
                if slot <> 29993 or instruction <> 28743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 71).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29995 {
            if slot <= 29994 {
// SERVICER.agc:705
//		AD	PRIO3
// slot 29994
                if slot <> 29994 or instruction <> 27149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:706
//		TS	FLGWRD11
// slot 29995
                if slot <> 29995 or instruction <> 22599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29996 {
// SERVICER.agc:707
//		CAF	PRIO32
// slot 29996
                if slot <> 29996 or instruction <> 16336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4048), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:708
//		TC	FINDVAC		# SET LR POSITIONING JOB (POS2)
// slot 29997
                if slot <> 29997 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1934] to agcAotUnit1934@.

agcAotInstallSourceRope(list(
// SERVICER.agc:709
//		EBANK=	HMEAS
// SERVICER.agc:710
//		2CADR	HIGATJOB
// slot 29998 29999
    29998, 3952, 29999, 55406
)).

// bank 33, slots 30000-30000
function agcAotUnit1935 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:711
//
// SERVICER.agc:712
//		TCF	CONTSERV	# CONTINUE SERVICER
// slot 30000
    if slot <> 30000 or instruction <> 5472 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5472, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1935] to agcAotUnit1935@.

agcAotInstallSourceRope(list(
// SERVICER.agc:713
//
// SERVICER.agc:714
//# Page 874
// SERVICER.agc:715
//# MUNRETRN IS THE RETURN LOC FROM SPECIAL AVE G ROUTINE (MUNRVG)
// SERVICER.agc:716
//
// SERVICER.agc:717
//MUNRETRN	EXIT
// slot 30001
    30001, 65532
)).

// bank 33, slots 30002-30046
function agcAotUnit1936 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30023 {
        if slot <= 30012 {
            if slot <= 30006 {
                if slot <= 30003 {
                    if slot <= 30002 {
// SERVICER.agc:718
//
// SERVICER.agc:719
//		CS	FLGWRD11
// slot 30002
                        if slot <> 30002 or instruction <> 16455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 71).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:720
//		MASK	LRBYBIT
// slot 30003
                        if slot <> 30003 or instruction <> 31197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            if fixedOperand = 16384 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30004 {
// SERVICER.agc:721
//		EXTEND
// slot 30004
                        if slot <> 30004 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30005 {
// SERVICER.agc:722
//		BZF	COPYCYC1	# BYPASS LR LOGIC IF BIT15 IS SET.
// slot 30005
                            if slot <> 30005 or instruction <> 5478 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:723
//
// SERVICER.agc:724
//		CA	READLBIT	# SEE IF ALT < 35000 FT LAST CYCLE
// slot 30006
                            if slot <> 30006 or instruction <> 14822 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 30009 {
                    if slot <= 30007 {
// SERVICER.agc:725
//		MASK	FLGWRD11
// slot 30007
                        if slot <> 30007 or instruction <> 28743 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30008 {
// SERVICER.agc:726
//		EXTEND
// slot 30008
                            if slot <> 30008 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:727
//		BZF	35KCHK		# ALT WAS > 35000 FT LAST CYCLE   CHK NOW
// slot 30009
                            if slot <> 30009 or instruction <> 5585 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5585, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 30010 {
// SERVICER.agc:728
//
// SERVICER.agc:729
//		CAF	XORFLBIT	# WERE WE BELOW 30000 FT LAST PASS?
// slot 30010
                        if slot <> 30010 or instruction <> 14819 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30011 {
// SERVICER.agc:730
//		MASK	FLGWRD11
// slot 30011
                            if slot <> 30011 or instruction <> 28743 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 71).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:731
//		EXTEND
// slot 30012
                            if slot <> 30012 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 30017 {
                if slot <= 30014 {
                    if slot <= 30013 {
// SERVICER.agc:732
//		BZF	XORCHK		# NO -- TEST THIS PASS
// slot 30013
                        if slot <> 30013 or instruction <> 5576 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5576, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:733
//HITEST		CAF	PSTHIBIT	# CHECK FOR HIGATE
// slot 30014
                        if slot <> 30014 or instruction <> 14817 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30015 {
// SERVICER.agc:734
//		MASK	FLGWRD11
// slot 30015
                        if slot <> 30015 or instruction <> 28743 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30016 {
// SERVICER.agc:735
//		EXTEND
// slot 30016
                            if slot <> 30016 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:736
//		BZF	HIGATCHK	# NOT AT HIGATE LAST CYCLE -- CHK THIS CYCLE
// slot 30017
                            if slot <> 30017 or instruction <> 5453 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5453, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 30020 {
                    if slot <= 30018 {
// SERVICER.agc:737
//
// SERVICER.agc:738
//POS2CHK		CAF	BIT7		# VERIFY LR IN POS2
// slot 30018
                        if slot <> 30018 or instruction <> 14821 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30019 {
// SERVICER.agc:739
//		EXTEND
// slot 30019
                            if slot <> 30019 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:740
//		RAND	CHAN33
// slot 30020
                            if slot <> 30020 or instruction <> 1051 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 30021 {
// SERVICER.agc:741
//		EXTEND
// slot 30021
                        if slot <> 30021 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30022 {
// SERVICER.agc:742
//		BZF	UPDATCHK	# IT IS -- CHECK FOR LR UPDATE
// slot 30022
                            if slot <> 30022 or instruction <> 5741 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5741, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:743
//		CAF	BIT13
// slot 30023
                            if slot <> 30023 or instruction <> 14815 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 30034 {
            if slot <= 30028 {
                if slot <= 30025 {
                    if slot <= 30024 {
// SERVICER.agc:744
//		EXTEND
// slot 30024
                        if slot <> 30024 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:745
//		RAND	CHAN12
// slot 30025
                        if slot <> 30025 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30026 {
// SERVICER.agc:746
//		EXTEND
// slot 30026
                        if slot <> 30026 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30027 {
// SERVICER.agc:747
//		BZF	LRPOSALM	# LR NOT IN POS2 OR REPOSITIONING -- BAD
// slot 30027
                            if slot <> 30027 or instruction <> 5470 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5470, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:748
//		TCF	CONTSERV	# LR BEING REPOSITIONED -- CONTINUE SERV
// slot 30028
                            if slot <> 30028 or instruction <> 5472 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5472, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 30031 {
                    if slot <= 30029 {
// SERVICER.agc:749
//
// SERVICER.agc:750
//HIGATCHK	CA	TTF/8		# IS TTF > CRITERION?  (TTF IS NEGATIVE)
// slot 30029
                        if slot <> 30029 or instruction <> 13218 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 930).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30030 {
// SERVICER.agc:751
//		AD	RPCRTIME
// slot 30030
                            if slot <> 30030 or instruction <> 25367 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 791).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:752
//		EXTEND
// slot 30031
                            if slot <> 30031 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 30032 {
// SERVICER.agc:753
//		BZMF	POS1CHK		# NO
// slot 30032
                        if slot <> 30032 or instruction <> 25945 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25945, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30033 {
// SERVICER.agc:754
//
// SERVICER.agc:755
//		CA	EBANK4		# MUST SWITCH EBANKS
// slot 30033
                            if slot <> 30033 or instruction <> 14817 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:756
//		XCH	EBANK
// slot 30034
                            if slot <> 30034 or instruction <> 23555 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 3, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 30040 {
                if slot <= 30037 {
                    if slot <= 30035 {
// SERVICER.agc:757
//		TS	L		# SAVE IN L
// slot 30035
                        if slot <> 30035 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30036 {
// SERVICER.agc:758
//
// SERVICER.agc:759
//		EBANK=	XNBPIP
// SERVICER.agc:760
//		CS	XNBPIP		# UXBXP IN GSOP CH5
// slot 30036
                            if slot <> 30036 or instruction <> 17253 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 869).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:761
//		EBANK=	DVCNTR
// SERVICER.agc:762
//		LXCH	EBANK		# RESTORE EBANK
// slot 30037
                            if slot <> 30037 or instruction <> 9219 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 3, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 30038 {
// SERVICER.agc:763
//		AD	RPCRTQSW	# QSW - UXBXP
// slot 30038
                        if slot <> 30038 or instruction <> 25368 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 792).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30039 {
// SERVICER.agc:764
//# Page 875
// SERVICER.agc:765
//
// SERVICER.agc:766
//		EXTEND
// slot 30039
                            if slot <> 30039 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:767
//		BZMF	HIGATASK	# IF UXBXP > QSW, THEN REPOSITION
// slot 30040
                            if slot <> 30040 or instruction <> 25895 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25895, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 30043 {
                    if slot <= 30041 {
// SERVICER.agc:768
//
// SERVICER.agc:769
//POS1CHK		CAF	BIT6		# HIGATE NOT IN SIGHT -- DO POS1 CHK
// slot 30041
                        if slot <> 30041 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30042 {
// SERVICER.agc:770
//		EXTEND
// slot 30042
                            if slot <> 30042 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:771
//		RAND	33
// slot 30043
                            if slot <> 30043 or instruction <> 1051 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 30044 {
// SERVICER.agc:772
//		EXTEND
// slot 30044
                        if slot <> 30044 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30045 {
// SERVICER.agc:773
//		BZF	UPDATCHK	# LR IN POS1 -- CHECK FOR LR UPDATE
// slot 30045
                            if slot <> 30045 or instruction <> 5741 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5741, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// SERVICER.agc:774
//
// SERVICER.agc:775
//LRPOSALM	TC	ALARM		# LR NOT IN PROPER POS-ALARM-BYPASS UPDATE
// slot 30046
                            if slot <> 30046 or instruction <> 2935 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2935, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1936] to agcAotUnit1936@.

agcAotInstallSourceRope(list(
// SERVICER.agc:776
//		OCT	511		# AND CONTINUE SERVICER
// slot 30047
    30047, 658
)).

// bank 33, slots 30048-30052
function agcAotUnit1937 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30049 {
        if slot <= 30048 {
// SERVICER.agc:777
//CONTSERV	INHINT
// slot 30048
            if slot <> 30048 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:778
//		CS	BITS4-7
// slot 30049
            if slot <> 30049 or instruction <> 18028 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1644), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30050 {
// SERVICER.agc:779
//		MASK	FLGWRD11	# CLEAR LR MEASUREMENT MADE DISCRETES.
// slot 30050
            if slot <> 30050 or instruction <> 28743 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 71).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30051 {
// SERVICER.agc:780
//		TS	FLGWRD11
// slot 30051
                if slot <> 30051 or instruction <> 22599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:781
//
// SERVICER.agc:782
//		TC	IBNKCALL	# SET LR LITES PROPERLY
// slot 30052
                if slot <> 30052 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1937] to agcAotUnit1937@.

agcAotInstallSourceRope(list(
// SERVICER.agc:783
//		CADR	R12LITES
// slot 30053
    30053, 44814
)).

// bank 33, slots 30054-30072
function agcAotUnit1938 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30062 {
        if slot <= 30057 {
            if slot <= 30055 {
                if slot <= 30054 {
// SERVICER.agc:784
//
// SERVICER.agc:785
//# Page 876
// SERVICER.agc:786
//COPYCYC1	TC	QUIKFAZ5
// slot 30054
                    if slot <> 30054 or instruction <> 1898 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1898, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:787
//
// SERVICER.agc:788
//R29?		CA	FLAGWRD3
// slot 30055
                    if slot <> 30055 or instruction <> 12351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30056 {
// SERVICER.agc:789
//		MASK	NR29&RDR
// slot 30056
                    if slot <> 30056 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        if fixedOperand = 1280 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256 + mod(floor(words[0] / 1024), 2) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:790
//		CCS	A		# IS NOR29FLG OR READRFLG SET?
// slot 30057
                    if slot <> 30057 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 30059 {
                if slot <= 30058 {
// SERVICER.agc:791
//		TCF	R29NODES	# YES, SO DON'T DESIGNATE.
// slot 30058
                    if slot <> 30058 or instruction <> 5492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:792
//
// SERVICER.agc:793
//		CA	RADMODES	# NO, SO R29 IS CALLED FOR.
// slot 30059
                    if slot <> 30059 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30060 {
// SERVICER.agc:794
//		MASK	OCT10002	# IS THE RR NOT ZEROING ITS CDUS, AND
// slot 30060
                    if slot <> 30060 or instruction <> 29864 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1192), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30061 {
// SERVICER.agc:795
//		CCS	A		# IS THE RENDEZVOUS RADAR IN AUTO MODE?
// slot 30061
                        if slot <> 30061 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:796
//		TCF	R29NODES	# NO, SO DON'T DESIGNATE.
// slot 30062
                        if slot <> 30062 or instruction <> 5492 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5492, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30067 {
            if slot <= 30064 {
                if slot <= 30063 {
// SERVICER.agc:797
//
// SERVICER.agc:798
//		CA	RADMODES
// slot 30063
                    if slot <> 30063 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:799
//		MASK	PRIO22
// slot 30064
                    if slot <> 30064 or instruction <> 32712 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                        if fixedOperand = 9216 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024 + mod(floor(words[0] / 8192), 2) * 8192).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30065 {
// SERVICER.agc:800
//		CCS	A		# IS RR REPOSITIONING OR REMODING?
// slot 30065
                    if slot <> 30065 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30066 {
// SERVICER.agc:801
//		TCF	NOR29NOW	# YES:  COME BACK IN 2 SECONDS & TRY AGAIN.
// slot 30066
                        if slot <> 30066 or instruction <> 5496 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5496, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:802
//
// SERVICER.agc:803
//		TCF	R29
// slot 30067
                        if slot <> 30067 or instruction <> 5157 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5157, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30069 {
                if slot <= 30068 {
// SERVICER.agc:804
//
// SERVICER.agc:805
//R29NODES	INHINT			# R29 NOT ALLOWED THIS CYCLE.
// slot 30068
                    if slot <> 30068 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:806
//		CS	DESIGBIT	# SHOW THAT DESIGNATION IS OFF.
// slot 30069
                    if slot <> 30069 or instruction <> 18914 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30070 {
// SERVICER.agc:807
//		MASK	RADMODES
// slot 30070
                    if slot <> 30070 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30071 {
// SERVICER.agc:808
//		TS	RADMODES
// slot 30071
                        if slot <> 30071 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:809
//
// SERVICER.agc:810
//NOR29NOW 	TC	INTPRET		# INTPRET DOES A RELINT.
// slot 30072
                        if slot <> 30072 or instruction <> 3103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3103, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1938] to agcAotUnit1938@.

agcAotInstallSourceRope(list(
// SERVICER.agc:811
//		VLOAD	ABVAL		# MPAC = ABVAL( NEW SM. POSITION VECTOR )
// slot 30073
    30073, 42746,
// SERVICER.agc:812
//			R1S
// slot 30074
    30074, 3830,
// SERVICER.agc:813
//		PUSH	DSU		# 				(2)
// slot 30075
    30075, 38156,
// SERVICER.agc:814
//			/LAND/
// slot 30076
    30076, 2486,
// SERVICER.agc:815
//		STORE	HCALC		# NEW HCALC*2(24)M.
// slot 30077
    30077, 3770,
// SERVICER.agc:816
//		STORE	HCALC1
// slot 30078
    30078, 4090,
// SERVICER.agc:817
//		DMPR	RTB
// slot 30079
    30079, 40058,
// SERVICER.agc:818
//			ALTCONV
// slot 30080
    30080, 22572,
// SERVICER.agc:819
//			SGNAGREE
// slot 30081
    30081, 18196,
// SERVICER.agc:820
//		STOVL	ALTBITS		# ALTITUDE FOR R10 IN BIT UNITS.
// slot 30082
    30082, 24516,
// SERVICER.agc:821
//			UNIT/R/
// slot 30083
    30083, 3774,
// SERVICER.agc:822
//		VXV	UNIT
// slot 30084
    30084, 44602,
// SERVICER.agc:823
//			UHYP
// slot 30085
    30085, 4000,
// SERVICER.agc:824
//		STOVL	UHZP		# DOWNRANGE HALF-UNIT VECTOR FOR R10.
// slot 30086
    30086, 24492,
// SERVICER.agc:825
//			R1S
// slot 30087
    30087, 3830,
// SERVICER.agc:826
//		VXM	VSR4
// slot 30088
    30088, 49802,
// SERVICER.agc:827
//			REFSMMAT
// slot 30089
    30089, 1976,
// SERVICER.agc:828
//		STOVL	RN1		# TEMP. REF. POSITION VECTOR*2(29)M.
// slot 30090
    30090, 24266,
// SERVICER.agc:829
//			V1S
// slot 30091
    30091, 3842,
// SERVICER.agc:830
//		VXM	VSL1
// slot 30092
    30092, 64138,
// SERVICER.agc:831
//			REFSMMAT
// slot 30093
    30093, 1976,
// SERVICER.agc:832
//		STOVL	VN1		# TEMP. REF. VELOCITY VECTOR 2(7) M/CS.
// slot 30094
    30094, 24278,
// SERVICER.agc:833
//			UNIT/R/
// slot 30095
    30095, 3774,
// SERVICER.agc:834
//		VXV	ABVAL
// slot 30096
    30096, 42554,
// SERVICER.agc:835
//# Page 877
// SERVICER.agc:836
//			V1S
// slot 30097
    30097, 3842,
// SERVICER.agc:837
//		SL1	DSQ
// slot 30098
    30098, 52948,
// SERVICER.agc:838
//		DDV
// slot 30099
    30099, 65394,
// SERVICER.agc:839
//		DMPR	RTB
// slot 30100
    30100, 40058,
// SERVICER.agc:840
//			ARCONV1
// slot 30101
    30101, 22576,
// SERVICER.agc:841
//			SGNAGREE
// slot 30102
    30102, 18196,
// SERVICER.agc:842
//COPYCYC2	EXIT			# LEAVE ALTITUDE RATE COMPENSATION IN MPAC
// slot 30103
    30103, 65532
)).

// bank 33, slots 30104-30133
function agcAotUnit1939 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30118 {
        if slot <= 30110 {
            if slot <= 30106 {
                if slot <= 30104 {
// SERVICER.agc:843
//		INHINT
// slot 30104
                    if slot <> 30104 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30105 {
// SERVICER.agc:844
//		CA	UNIT/R/		# UPDATE RUNIT FOR R10.
// slot 30105
                        if slot <> 30105 or instruction <> 13150 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 862).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:845
//		TS	RUNIT
// slot 30106
                        if slot <> 30106 or instruction <> 23523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23523, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30108 {
                    if slot <= 30107 {
// SERVICER.agc:846
//		CA	UNIT/R/ +2
// slot 30107
                        if slot <> 30107 or instruction <> 13152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 864).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:847
//		TS	RUNIT +1
// slot 30108
                        if slot <> 30108 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30109 {
// SERVICER.agc:848
//		CA	UNIT/R/ +4
// slot 30109
                        if slot <> 30109 or instruction <> 13154 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 866).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:849
//		TS	RUNIT +2
// slot 30110
                        if slot <> 30110 or instruction <> 23525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23525, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30114 {
                if slot <= 30112 {
                    if slot <= 30111 {
// SERVICER.agc:850
//		CA	MPAC		# LOAD NEW DALTRATE FOR R10.
// slot 30111
                        if slot <> 30111 or instruction <> 12396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:851
//		TS	DALTRATE
// slot 30112
                        if slot <> 30112 or instruction <> 23502 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23502, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30113 {
// SERVICER.agc:852
//
// SERVICER.agc:853
//		EXTEND
// slot 30113
                        if slot <> 30113 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:854
//		DCA	R1S
// slot 30114
                        if slot <> 30114 or instruction <> 13179 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 891, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30116 {
                    if slot <= 30115 {
// SERVICER.agc:855
//		DXCH	R
// slot 30115
                        if slot <> 30115 or instruction <> 22353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 849, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:856
//		EXTEND
// slot 30116
                        if slot <> 30116 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30117 {
// SERVICER.agc:857
//		DCA	R1S +2
// slot 30117
                        if slot <> 30117 or instruction <> 13181 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 893, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:858
//		DXCH	R +2
// slot 30118
                        if slot <> 30118 or instruction <> 22355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 851, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30125 {
            if slot <= 30121 {
                if slot <= 30119 {
// SERVICER.agc:859
//		EXTEND
// slot 30119
                    if slot <> 30119 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30120 {
// SERVICER.agc:860
//		DCA	R1S +4
// slot 30120
                        if slot <> 30120 or instruction <> 13183 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 895, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:861
//		DXCH	R +4
// slot 30121
                        if slot <> 30121 or instruction <> 22357 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 853, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30123 {
                    if slot <= 30122 {
// SERVICER.agc:862
//		EXTEND
// slot 30122
                        if slot <> 30122 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:863
//		DCA	V1S
// slot 30123
                        if slot <> 30123 or instruction <> 13185 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 897, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30124 {
// SERVICER.agc:864
//		DXCH	V
// slot 30124
                        if slot <> 30124 or instruction <> 22359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 855, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:865
//		EXTEND
// slot 30125
                        if slot <> 30125 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30129 {
                if slot <= 30127 {
                    if slot <= 30126 {
// SERVICER.agc:866
//		DCA	V1S +2
// slot 30126
                        if slot <> 30126 or instruction <> 13187 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 899, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:867
//		DXCH	V +2
// slot 30127
                        if slot <> 30127 or instruction <> 22361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 857, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30128 {
// SERVICER.agc:868
//		EXTEND
// slot 30128
                        if slot <> 30128 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:869
//		DCA	V1S +4
// slot 30129
                        if slot <> 30129 or instruction <> 13189 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 901, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30131 {
                    if slot <= 30130 {
// SERVICER.agc:870
//		DXCH	V +4
// slot 30130
                        if slot <> 30130 or instruction <> 22363 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 859, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:871
//
// SERVICER.agc:872
//		TCF	COPYCYCL	# COMPLETE THE COPYCYCL.
// slot 30131
                        if slot <> 30131 or instruction <> 5309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5309, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30132 {
// SERVICER.agc:873
//
// SERVICER.agc:874
//# Page 878
// SERVICER.agc:875
//# ALTCHK COMPARES CURRENT ALTITUDE (IN HCALC) WITH A SPECIFIED ALTITUDE FROM A TABLE BEGINNING AT ALTCRIT.
// SERVICER.agc:876
//# ITS CALLING SEQUENCE IS AS FOLLOWS:-
// SERVICER.agc:877
//#
// SERVICER.agc:878
//#	L	CAF	N
// SERVICER.agc:879
//#	L+1	TC	BANKCALL
// SERVICER.agc:880
//#	L+2	CADR	ALTCHK
// SERVICER.agc:881
//#	L+3	RETURN HERE IF HCALC STILL > SPECIFIED CRITERION.   C(L) = +0.
// SERVICER.agc:882
//#	L+4	RETURN HERE IF HCALC < OR = SPECIFIED CRITERION.   C(A) = C(L) = +0
// SERVICER.agc:883
//#
// SERVICER.agc:884
//# ALTCHK MUST BE BANKCALLED EVEN FROM ITS OWN BANK.   N IS THE LOCATION, RELATIVE TO THE TAG ALTCRIT,
// SERVICER.agc:885
//# OF THE BEGINNING OF THE DP CONSTANT TO BE USED AS A CRITERION.
// SERVICER.agc:886
//
// SERVICER.agc:887
//ALTCHK		EXTEND
// slot 30132
                        if slot <> 30132 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:888
//		INDEX	A
// slot 30133
                        if slot <> 30133 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1939] to agcAotUnit1939@.

agcAotInstallSourceRope(list(
// SERVICER.agc:889
//		DCA	ALTCRIT
// slot 30134
    30134, 27520
)).

// bank 33, slots 30135-30142
function agcAotUnit1940 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30138 {
        if slot <= 30136 {
            if slot <= 30135 {
// SERVICER.agc:890
//		DXCH	MPAC +1
// slot 30135
                if slot <> 30135 or instruction <> 21614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:891
//		EXTEND
// slot 30136
                if slot <> 30136 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30137 {
// SERVICER.agc:892
//		DCS	HCALC
// slot 30137
                if slot <> 30137 or instruction <> 17245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 861, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:893
//		DAS	MPAC +1
// slot 30138
                if slot <> 30138 or instruction <> 8302 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 110) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30140 {
            if slot <= 30139 {
// SERVICER.agc:894
//		TC	BRANCH +4
// slot 30139
                if slot <> 30139 or instruction <> 3543 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3543, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:895
//		CAF	ZERO		# BETTER THAN A NOOP, PERHAPS
// slot 30140
                if slot <> 30140 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30141 {
// SERVICER.agc:896
//		INCR	BUF2
// slot 30141
                if slot <> 30141 or instruction <> 10331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:897
//		TCF	SWRETURN
// slot 30142
                if slot <> 30142 or instruction <> 6553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1940] to agcAotUnit1940@.

agcAotInstallSourceRope(list(
// SERVICER.agc:898
//
// SERVICER.agc:899
//ALTCRIT		=	25KFT
// SERVICER.agc:900
//
// SERVICER.agc:901
//25KFT		2DEC	7620 B-24  		# (0)
// slot 30143 30144
    30143, 14, 30144, 14464,
// SERVICER.agc:902
//
// SERVICER.agc:903
//50KFT		2DEC	15240 B-24		# (2)
// slot 30145 30146
    30145, 28, 30146, 28928,
// SERVICER.agc:904
//
// SERVICER.agc:905
//50FT		2DEC	15.24 B-24		# (4)
// slot 30147 30148
    30147, 0, 30148, 488,
// SERVICER.agc:906
//
// SERVICER.agc:907
//30KFT		2DEC	9144 B-24		# (6)
// slot 30149 30150
    30149, 16, 30150, 30464,
// SERVICER.agc:908
//
// SERVICER.agc:909
//2KFT/SEC	DEC	6.096 B-7		# 2000 FT/SEC AT 2(7) M/CS
// slot 30151
    30151, 1560
)).

// bank 33, slots 30152-30153
function agcAotUnit1941 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30152 {
// SERVICER.agc:910
//
// SERVICER.agc:911
//
// SERVICER.agc:912
//# (A remark was likely to be needed here to explain XORCHK) 4/Jun/09,FB
// SERVICER.agc:913
//
// SERVICER.agc:914
//XORCHK		CAF	SIX		# ARE WE BELOW 30000 FT?
// slot 30152
        if slot <> 30152 or instruction <> 15522 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:915
//		TC	BANKCALL
// slot 30153
        if slot <> 30153 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1941] to agcAotUnit1941@.

agcAotInstallSourceRope(list(
// SERVICER.agc:916
//		CADR	ALTCHK
// slot 30154
    30154, 56168
)).

// bank 33, slots 30155-30156
function agcAotUnit1942 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30155 {
// SERVICER.agc:917
//		TCF	HITEST		# CONTINUE LR UPDATE
// slot 30155
        if slot <> 30155 or instruction <> 5438 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5438, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:918
//		TC	UPFLAG		# YES: INHIBIT X-AXIS OVERRIDE
// slot 30156
        if slot <> 30156 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1942] to agcAotUnit1942@.

agcAotInstallSourceRope(list(
// SERVICER.agc:919
//		ADRES	XOVINFLG
// slot 30157
    30157, 402
)).

// bank 33, slots 30158-30158
function agcAotUnit1943 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:920
//		TC	UPFLAG
// slot 30158
    if slot <> 30158 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1943] to agcAotUnit1943@.

agcAotInstallSourceRope(list(
// SERVICER.agc:921
//		ADRES	XORFLG
// slot 30159
    30159, 342
)).

// bank 33, slots 30160-30161
function agcAotUnit1944 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30160 {
// SERVICER.agc:922
//		TCF	HITEST		# CONTINUE LR UPDATE
// slot 30160
        if slot <> 30160 or instruction <> 5438 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5438, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:923
//
// SERVICER.agc:924
//35KCHK		CAF	TWO		# ARE WE BELOW 35000 FT?
// slot 30161
        if slot <> 30161 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1944] to agcAotUnit1944@.

// bank 33, slots 30162-30162
function agcAotUnit1945 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:925
//
// SERVICER.agc:926
//# Page 879
// SERVICER.agc:927
//		TC	BANKCALL
// slot 30162
    if slot <> 30162 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1945] to agcAotUnit1945@.

agcAotInstallSourceRope(list(
// SERVICER.agc:928
//		CADR	ALTCHK
// slot 30163
    30163, 56168
)).

// bank 33, slots 30164-30165
function agcAotUnit1946 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30164 {
// SERVICER.agc:929
//		TCF	CONTSERV
// slot 30164
        if slot <> 30164 or instruction <> 5472 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5472, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:930
//		TC	UPFLAG
// slot 30165
        if slot <> 30165 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1946] to agcAotUnit1946@.

agcAotInstallSourceRope(list(
// SERVICER.agc:931
//		ADRES	READLR		# SET READLR FLAG TO ENABLE LR READING.
// slot 30166
    30166, 348
)).

// bank 33, slots 30167-30167
function agcAotUnit1947 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:932
//		TCF	CONTSERV
// slot 30167
    if slot <> 30167 or instruction <> 5472 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5472, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1947] to agcAotUnit1947@.

agcAotInstallSourceRope(list(
// SERVICER.agc:933
//
// SERVICER.agc:934
//# Page 880
// SERVICER.agc:935
//# ***************************************************************
// SERVICER.agc:936
//
// SERVICER.agc:937
//CALCGRAV	UNIT	PUSH		# SAVE UNIT/R/ IN PUSHLIST	(18)
// slot 30168
    30168, 34396,
// SERVICER.agc:938
//		STORE 	UNIT/R/
// slot 30169
    30169, 3774,
// SERVICER.agc:939
//		LXC,1	SLOAD		# RTX2 = 0 IF EARTH ORBIT, =2 IF LUNAR.
// slot 30170
    30170, 56768,
// SERVICER.agc:940
//			RTX2
// slot 30171
    30171, 3070,
// SERVICER.agc:941
//			RTX2
// slot 30172
    30172, 3072,
// SERVICER.agc:942
//		DCOMP	BMN
// slot 30173
    30173, 41084,
// SERVICER.agc:943
//			CALCGRV1
// slot 30174
    30174, 56298,
// SERVICER.agc:944
//		VLOAD	DOT		#				(12)
// slot 30175
    30175, 41466,
// SERVICER.agc:945
//			UNITZ
// slot 30176
    30176, 6808,
// SERVICER.agc:946
//			UNIT/R/
// slot 30177
    30177, 3774,
// SERVICER.agc:947
//		SL1	PUSH		#				(14)
// slot 30178
    30178, 34516,
// SERVICER.agc:948
//		DSQ	BDSU
// slot 30179
    30179, 37276,
// SERVICER.agc:949
//			DP1/20
// slot 30180
    30180, 23598,
// SERVICER.agc:950
//		PDDL	DDV
// slot 30181
    30181, 47530,
// SERVICER.agc:951
//			RESQ
// slot 30182
    30182, 22592,
// SERVICER.agc:952
//			34D		# (RN)SQ
// slot 30183
    30183, 70,
// SERVICER.agc:953
//		STORE	32D		# TEMP FOR (RE/RN)SQ
// slot 30184
    30184, 66,
// SERVICER.agc:954
//		DMP	DMP
// slot 30185
    30185, 34058,
// SERVICER.agc:955
//			20J
// slot 30186
    30186, 22596,
// SERVICER.agc:956
//		VXSC	PDDL
// slot 30187
    30187, 54754,
// SERVICER.agc:957
//			UNIT/R/
// slot 30188
    30188, 3774,
// SERVICER.agc:958
//		DMP	DMP
// slot 30189
    30189, 34058,
// SERVICER.agc:959
//			2J
// slot 30190
    30190, 22600,
// SERVICER.agc:960
//			32D
// slot 30191
    30191, 66,
// SERVICER.agc:961
//		VXSC	VSL1
// slot 30192
    30192, 64226,
// SERVICER.agc:962
//			UNITZ
// slot 30193
    30193, 6808,
// SERVICER.agc:963
//		VAD	STADR
// slot 30194
    30194, 38490,
// SERVICER.agc:964
//		STORE	UNITGOBL
// slot 30195
    30195, 61788,
// SERVICER.agc:965
//		VAD	PUSH		# MPAC = UNIT GRAVITY VECTOR.	(18)
// slot 30196
    30196, 34394,
// SERVICER.agc:966
//CALCGRV1	DLOAD	NORM		# PERFORM A NORMALIZATION ON RMAGSQ IN
// slot 30197
    30197, 49610,
// SERVICER.agc:967
//			34D		# ORDER TO BE ABLE TO SCALE THE MU FOR
// slot 30198
    30198, 70,
// SERVICER.agc:968
//			X2		# MAXIMUM PRECISION.
// slot 30199
    30199, 80,
// SERVICER.agc:969
//		BDDV*	SLR*
// slot 30200
    30200, 44902,
// SERVICER.agc:970
//			-MUDT,1
// slot 30201
    30201, 22580,
// SERVICER.agc:971
//			0 -21D,2
// slot 30202
    30202, 47910,
// SERVICER.agc:972
//		VXSC	STADR
// slot 30203
    30203, 38626,
// SERVICER.agc:973
//		STORE	GDT1/2		# SCALED AT 2(+7) M/CS
// slot 30204
    30204, 61720,
// SERVICER.agc:974
//		RVQ
// slot 30205
    30205, 65308,
// SERVICER.agc:975
//
// SERVICER.agc:976
//CALCRVG		VLOAD	VXM
// slot 30206
    30206, 50682,
// SERVICER.agc:977
//			DELV
// slot 30207
    30207, 426,
// SERVICER.agc:978
//			REFSMMAT
// slot 30208
    30208, 1976,
// SERVICER.agc:979
//		VXSC	VSL1
// slot 30209
    30209, 64226,
// SERVICER.agc:980
//			KPIP1
// slot 30210
    30210, 22564,
// SERVICER.agc:981
//		STORE	DELVREF
// slot 30211
    30211, 3758,
// SERVICER.agc:982
//		VSR1	PUSH
// slot 30212
    30212, 34532,
// SERVICER.agc:983
//		VAD	PUSH		# (DV-OLDGDT)/2 TO PD SCALED AT 2(+7) M/CS.
// slot 30213
    30213, 34394,
// SERVICER.agc:984
//# Page 881
// SERVICER.agc:985
//			GDT/2
// slot 30214
    30214, 1342,
// SERVICER.agc:986
//		VAD	PDDL
// slot 30215
    30215, 54618,
// SERVICER.agc:987
//			VN
// slot 30216
    30216, 1326,
// SERVICER.agc:988
//			PGUIDE
// slot 30217
    30217, 1360,
// SERVICER.agc:989
//		SL	VXSC
// slot 30218
    30218, 61794,
// SERVICER.agc:990
//			6D
// slot 30219
    30219, 16654,
// SERVICER.agc:991
//		VAD	STQ
// slot 30220
    30220, 36954,
// SERVICER.agc:992
//			RN
// slot 30221
    30221, 1314,
// SERVICER.agc:993
//			31D
// slot 30222
    30222, 62,
// SERVICER.agc:994
//		STCALL	RN1		# TEMP STORAGE OF RN SCALED 2(+29) M
// slot 30223
    30223, 32458,
// SERVICER.agc:995
//			CALCGRAV
// slot 30224
    30224, 56240,
// SERVICER.agc:996
//
// SERVICER.agc:997
//		VAD	VAD
// slot 30225
    30225, 44378,
// SERVICER.agc:998
//		VAD
// slot 30226
    30226, 65370,
// SERVICER.agc:999
//			VN
// slot 30227
    30227, 1326,
// SERVICER.agc:1000
//		STCALL	VN1		# TEMP STORAGE OF VN SCALED 2(+7) M/CS
// slot 30228
    30228, 32470,
// SERVICER.agc:1001
//			31D
// slot 30229
    30229, 62,
// SERVICER.agc:1002
//
// SERVICER.agc:1003
//DP1/20		2DEC	0.05
// slot 30230 30231
    30230, 1638, 30231, 6554,
// SERVICER.agc:1004
//SHIFT11		2DEC	1 B-11
// slot 30232 30233
    30232, 16, 30233, 0,
// SERVICER.agc:1005
//
// SERVICER.agc:1006
//# Page 882
// SERVICER.agc:1007
//#*****************************************************************************
// SERVICER.agc:1008
//# MUNRVG IS A SPECIAL AVERAGE G INTEGRATION ROUTINE USED BY THRUSTING
// SERVICER.agc:1009
//# PROGRAMS WHICH FUNCTION IN THE VICINITY OF AN ASSUMED SPHERICAL MOON.
// SERVICER.agc:1010
//# THE INPUT AND OUTPUT QUANTITIES ARE REFERENCED TO THE STABLE MEMBER
// SERVICER.agc:1011
//# COORDINATE SYSTEM.
// SERVICER.agc:1012
//
// SERVICER.agc:1013
//RVBOTH		VLOAD	PUSH
// slot 30234
    30234, 34554,
// SERVICER.agc:1014
//			G(CSM)
// slot 30235
    30235, 2462,
// SERVICER.agc:1015
//		VAD	PDDL
// slot 30236
    30236, 54618,
// SERVICER.agc:1016
//			V(CSM)
// slot 30237
    30237, 1964,
// SERVICER.agc:1017
//			PGUIDE
// slot 30238
    30238, 1360,
// SERVICER.agc:1018
//		DDV	VXSC
// slot 30239
    30239, 61810,
// SERVICER.agc:1019
//			SHIFT11
// slot 30240
    30240, 23602,
// SERVICER.agc:1020
//		VAD
// slot 30241
    30241, 65370,
// SERVICER.agc:1021
//			R(CSM)
// slot 30242
    30242, 1952,
// SERVICER.agc:1022
//		STCALL	R1S
// slot 30243
    30243, 32502,
// SERVICER.agc:1023
//			MUNGRAV
// slot 30244
    30244, 56496,
// SERVICER.agc:1024
//		VAD	VAD
// slot 30245
    30245, 44378,
// SERVICER.agc:1025
//			V(CSM)
// slot 30246
    30246, 1964,
// SERVICER.agc:1026
//		STADR
// slot 30247
    30247, 65324,
// SERVICER.agc:1027
//		STORE	V1S
// slot 30248
    30248, 61692,
// SERVICER.agc:1028
//		EXIT
// slot 30249
    30249, 65532
)).

// bank 33, slots 30250-30251
function agcAotUnit1948 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30250 {
// SERVICER.agc:1029
//		TC	QUIKFAZ5
// slot 30250
        if slot <> 30250 or instruction <> 1898 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1898, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:1030
//		TC	INTPRET
// slot 30251
        if slot <> 30251 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1948] to agcAotUnit1948@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1031
//		VLOAD
// slot 30252
    30252, 65530,
// SERVICER.agc:1032
//			GDT1/2
// slot 30253
    30253, 3814,
// SERVICER.agc:1033
//		STOVL	G(CSM)
// slot 30254
    30254, 22942,
// SERVICER.agc:1034
//			R1S
// slot 30255
    30255, 3830,
// SERVICER.agc:1035
//		STOVL	R(CSM)
// slot 30256
    30256, 22432,
// SERVICER.agc:1036
//			V1S
// slot 30257
    30257, 3842,
// SERVICER.agc:1037
//		STORE	V(CSM)
// slot 30258
    30258, 1964,
// SERVICER.agc:1038
//		EXIT
// slot 30259
    30259, 65532
)).

// bank 33, slots 30260-30261
function agcAotUnit1949 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30260 {
// SERVICER.agc:1039
//		TC	QUIKFAZ5
// slot 30260
        if slot <> 30260 or instruction <> 1898 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1898, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:1040
//		TC	INTPRET
// slot 30261
        if slot <> 30261 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1949] to agcAotUnit1949@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1041
//MUNRVG		VLOAD	VXSC
// slot 30262
    30262, 61946,
// SERVICER.agc:1042
//			DELV
// slot 30263
    30263, 426,
// SERVICER.agc:1043
//			KPIP2
// slot 30264
    30264, 22568,
// SERVICER.agc:1044
//		PUSH	VAD		# 1ST PUSH:  DELV IN UNITS OF 2(8) M/CS
// slot 30265
    30265, 44300,
// SERVICER.agc:1045
//			GDT/2
// slot 30266
    30266, 1342,
// SERVICER.agc:1046
//		PUSH	VAD		# 2ND PUSH:  (DELV + GDT)/2, UNITS OF 2(7)
// slot 30267
    30267, 44300,
// SERVICER.agc:1047
//			V		#				(12)
// slot 30268
    30268, 3758,
// SERVICER.agc:1048
//		PDDL	DDV
// slot 30269
    30269, 47530,
// SERVICER.agc:1049
//			PGUIDE
// slot 30270
    30270, 1360,
// SERVICER.agc:1050
//			SHIFT11
// slot 30271
    30271, 23602,
// SERVICER.agc:1051
//		VXSC
// slot 30272
    30272, 65506,
// SERVICER.agc:1052
//		VAD
// slot 30273
    30273, 65370,
// SERVICER.agc:1053
//			R
// slot 30274
    30274, 3746,
// SERVICER.agc:1054
//		STCALL	R1S		# STORE R SCALED AT 2(+24) M
// slot 30275
    30275, 32502,
// SERVICER.agc:1055
//			MUNGRAV
// slot 30276
    30276, 56496,
// SERVICER.agc:1056
//# Page 883
// SERVICER.agc:1057
//		VAD	VAD
// slot 30277
    30277, 44378,
// SERVICER.agc:1058
//		VAD
// slot 30278
    30278, 65370,
// SERVICER.agc:1059
//			V
// slot 30279
    30279, 3758,
// SERVICER.agc:1060
//		STORE	V1S		# STORE V SCALED AT 2(+7) M/CS.
// slot 30280
    30280, 3842,
// SERVICER.agc:1061
//		ABVAL
// slot 30281
    30281, 65356,
// SERVICER.agc:1062
//		STOVL	ABVEL		# STORE SPEED FOR LR AND DISPLAYS.
// slot 30282
    30282, 24180,
// SERVICER.agc:1063
//			UNIT/R/
// slot 30283
    30283, 3774,
// SERVICER.agc:1064
//		DOT	SL1
// slot 30284
    30284, 59970,
// SERVICER.agc:1065
//			V1S
// slot 30285
    30285, 3842,
// SERVICER.agc:1066
//		STOVL	HDOTDISP	# HDOT = V. UNIT(R)*2(7) M/CS.
// slot 30286
    30286, 24184,
// SERVICER.agc:1067
//			R1S
// slot 30287
    30287, 3830,
// SERVICER.agc:1068
//		VXV	VSL2
// slot 30288
    30288, 59962,
// SERVICER.agc:1069
//			WM
// slot 30289
    30289, 2474,
// SERVICER.agc:1070
//		STODL	DELVS		# LUNAR ROTATION CORRECTION TERM*2(5) M/CS.
// slot 30290
    30290, 16312,
// SERVICER.agc:1071
//			36D
// slot 30291
    30291, 74,
// SERVICER.agc:1072
//		DSU
// slot 30292
    30292, 65322,
// SERVICER.agc:1073
//			/LAND/
// slot 30293
    30293, 2486,
// SERVICER.agc:1074
//		STCALL	HCALC		# FOR NOW, DISPLAY WHETHER POS OR NEG
// slot 30294
    30294, 32442,
// SERVICER.agc:1075
//			MUNRETRN
// slot 30295
    30295, 55906,
// SERVICER.agc:1076
//MUNGRAV		UNIT			# AT 36D HAVE ABVAL(R), AT 34D R.R
// slot 30296
    30296, 65372,
// SERVICER.agc:1077
//		STODL	UNIT/R/
// slot 30297
    30297, 16062,
// SERVICER.agc:1078
//			34D
// slot 30298
    30298, 70,
// SERVICER.agc:1079
//		SL	BDDV
// slot 30299
    30299, 46434,
// SERVICER.agc:1080
//			6D
// slot 30300
    30300, 16654,
// SERVICER.agc:1081
//			-MUDTMUN
// slot 30301
    30301, 22588,
// SERVICER.agc:1082
//		DMP	VXSC
// slot 30302
    30302, 61706,
// SERVICER.agc:1083
//			SHIFT11
// slot 30303
    30303, 23602,
// SERVICER.agc:1084
//			UNIT/R/
// slot 30304
    30304, 3774,
// SERVICER.agc:1085
//		STORE	GDT1/2		# 1/2GDT SCALED AT 2(7) M/CS.
// slot 30305
    30305, 3814,
// SERVICER.agc:1086
//		RVQ
// slot 30306
    30306, 65308,
// SERVICER.agc:1087
//
// SERVICER.agc:1088
//1.95SECS	DEC	195
// slot 30307
    30307, 390,
// SERVICER.agc:1089
//7.5		2DEC	.02286 B-6	# 7.5 FT/SEC AT 2(6) M/CS
// slot 30308 30309
    30308, 10, 30309, 27924,
// SERVICER.agc:1090
//
// SERVICER.agc:1091
//2SEC(18)	2DEC	200 B-18
// slot 30310 30311
    30310, 24, 30311, 16384,
// SERVICER.agc:1092
//
// SERVICER.agc:1093
//2SEC(28)	2OCT	0000000310	# 2SEC AT 2(28)
// slot 30312 30313
    30312, 0, 30313, 400,
// SERVICER.agc:1094
//
// SERVICER.agc:1095
//4SEC(28)	2DEC	400 B-28
// slot 30314 30315
    30314, 0, 30315, 800,
// SERVICER.agc:1096
//
// SERVICER.agc:1097
//BITS4-7		OCT	110
// slot 30316
    30316, 144
)).

// bank 33, slots 30317-30327
function agcAotUnit1950 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30321 {
        if slot <= 30318 {
            if slot <= 30317 {
// SERVICER.agc:1098
//
// SERVICER.agc:1099
//
// SERVICER.agc:1100
//# Page 884
// SERVICER.agc:1101
//UPDATCHK	CAF	NOLRRBIT	# SEE IF LR UPDATE INHIBITED.
// slot 30317
                if slot <> 30317 or instruction <> 14818 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1102
//		MASK	FLGWRD11
// slot 30318
                if slot <> 30318 or instruction <> 28743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 71).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30319 {
// SERVICER.agc:1103
//		CCS	A
// slot 30319
                if slot <> 30319 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30320 {
// SERVICER.agc:1104
//		TCF	CONTSERV	# IT IS -- NO LR UPDATE
// slot 30320
                    if slot <> 30320 or instruction <> 5472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5472, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1105
//		CAF	RNGEDBIT	# NO INHIBIT -- SEE ALT MEAS. THIS CYCLE.
// slot 30321
                    if slot <> 30321 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30324 {
            if slot <= 30322 {
// SERVICER.agc:1106
//		MASK	FLGWRD11
// slot 30322
                if slot <> 30322 or instruction <> 28743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 71).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30323 {
// SERVICER.agc:1107
//		EXTEND
// slot 30323
                    if slot <> 30323 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1108
//		BZF	VMEASCHK	# NO ALT MEAS THIS CYCLE -- CHECK FOR VEL
// slot 30324
                    if slot <> 30324 or instruction <> 5832 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5832, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30325 {
// SERVICER.agc:1109
//
// SERVICER.agc:1110
//POSUPDAT	CA	FIXLOC		# SET PUSHLIST TO ZERO
// slot 30325
                if slot <> 30325 or instruction <> 12368 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 80).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30326 {
// SERVICER.agc:1111
//		TS	PUSHLOC
// slot 30326
                    if slot <> 30326 or instruction <> 22646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22646, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1112
//
// SERVICER.agc:1113
//		TC	INTPRET
// slot 30327
                    if slot <> 30327 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1950] to agcAotUnit1950@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1114
//		VLOAD	VXM
// slot 30328
    30328, 50682,
// SERVICER.agc:1115
//			HBEAMNB
// slot 30329
    30329, 2422,
// SERVICER.agc:1116
//			XNBPIP		# HBEAM SM AT 2(2)
// slot 30330
    30330, 2252,
// SERVICER.agc:1117
//		PDVL	VSL2		# STORE HBEAM IN PD 0-5
// slot 30331
    30331, 60058,
// SERVICER.agc:1118
//			V1S		# SCALE V AT 2(5) M/CS
// slot 30332
    30332, 3842,
// SERVICER.agc:1119
//		VAD	DOT
// slot 30333
    30333, 41306,
// SERVICER.agc:1120
//			DELVS		# V RELATIVE TO SURFACE AT 2(5) M/CS
// slot 30334
    30334, 4024,
// SERVICER.agc:1121
//			0D		# V ALONG HBEAM AT 2(7) M/CS.
// slot 30335
    30335, 2,
// SERVICER.agc:1122
//		DMP	EXIT
// slot 30336
    30336, 65034,
// SERVICER.agc:1123
//			RADSKAL		# SCALE TO RADAR COUNTS X 5
// slot 30337
    30337, 1498
)).

// bank 33, slots 30338-30344
function agcAotUnit1951 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30340 {
        if slot <= 30338 {
// SERVICER.agc:1124
//
// SERVICER.agc:1125
//		CS	FLGWRD12	# TEST LR ALTITUDE SCALE FACTOR
// slot 30338
            if slot <> 30338 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30339 {
// SERVICER.agc:1126
//		MASK	ALTSCBIT
// slot 30339
                if slot <> 30339 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1127
//		EXTEND
// slot 30340
                if slot <> 30340 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30342 {
            if slot <= 30341 {
// SERVICER.agc:1128
//		BZF	+3		# BRANCH IF HIGH SCALE
// slot 30341
                if slot <> 30341 or instruction <> 5768 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1129
//
// SERVICER.agc:1130
//		CA	SKALSKAL	# RESCALE IF LOW SCALE
// slot 30342
                if slot <> 30342 or instruction <> 13038 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 750).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30343 {
// SERVICER.agc:1131
//		TC	SHORTMP
// slot 30343
                if slot <> 30343 or instruction <> 3783 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3783, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1132
//
// SERVICER.agc:1133
// 	+3	TC	INTPRET
// slot 30344
                if slot <> 30344 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1951] to agcAotUnit1951@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1134
// 		DAD	SL		# CORRECT HMEAS FOR DOPPLER EFFECT
// slot 30345
    30345, 45338,
// SERVICER.agc:1135
//			HMEAS
// slot 30346
    30346, 3930,
// SERVICER.agc:1136
//			7D
// slot 30347
    30347, 16656,
// SERVICER.agc:1137
//		DMP	VXSC		# SLANT RANGE AT 2(21), PUSH UP FOR HBEAM
// slot 30348
    30348, 61706,
// SERVICER.agc:1138
//			HSCAL		# SLANT RANGE VECTOR AT 2(23) M
// slot 30349
    30349, 22546,
// SERVICER.agc:1139
//		DOT	DSU
// slot 30350
    30350, 38210,
// SERVICER.agc:1140
//			UNIT/R/		# ALTITUDE AT 2(24) M
// slot 30351
    30351, 3774,
// SERVICER.agc:1141
//			HCALC		# DELTA H AT 2(24) M
// slot 30352
    30352, 3770,
// SERVICER.agc:1142
//		STORE	DELTAH
// slot 30353
    30353, 3946,
// SERVICER.agc:1143
//		EXIT
// slot 30354
    30354, 65532
)).

// bank 33, slots 30355-30359
function agcAotUnit1952 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30356 {
        if slot <= 30355 {
// SERVICER.agc:1144
//
// SERVICER.agc:1145
//		CA	FLGWRD11
// slot 30355
            if slot <> 30355 or instruction <> 12359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 71).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1146
//		MASK	PSTHIBIT
// slot 30356
            if slot <> 30356 or instruction <> 31201 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                if fixedOperand = 1024 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30357 {
// SERVICER.agc:1147
//		EXTEND			# DO NOT PERFORM DATA REASONABLENESS TEST
// slot 30357
            if slot <> 30357 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30358 {
// SERVICER.agc:1148
//		BZF	NOREASON	# UNTIL AFTER HIGATE
// slot 30358
                if slot <> 30358 or instruction <> 5795 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1149
//# Page 885
// SERVICER.agc:1150
//		TC	INTPRET
// slot 30359
                if slot <> 30359 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1952] to agcAotUnit1952@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1151
//		ABS	DSU
// slot 30360
    30360, 38220,
// SERVICER.agc:1152
//			DELQFIX		# ABS(DELTAH) - DQFIX	50 FT NOM
// slot 30361
    30361, 2722,
// SERVICER.agc:1153
//		SL3	DSU		# SCALE TO 2(21)
// slot 30362
    30362, 38228,
// SERVICER.agc:1154
//			HCALC		# ABS(DELTAH) - (50 + HCALC/8) AT 2(21)
// slot 30363
    30363, 3770,
// SERVICER.agc:1155
//		EXIT
// slot 30364
    30364, 65532
)).

// bank 33, slots 30365-30369
function agcAotUnit1953 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30366 {
        if slot <= 30365 {
// SERVICER.agc:1156
//
// SERVICER.agc:1157
//		INCR	LRLCTR
// slot 30365
            if slot <> 30365 or instruction <> 11192 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 952).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1158
//		TC	BRANCH
// slot 30366
            if slot <> 30366 or instruction <> 3539 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3539, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30367 {
// SERVICER.agc:1159
//		TCF	HFAIL		# DELTA H TOO LARGE
// slot 30367
            if slot <> 30367 or instruction <> 6000 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6000, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30368 {
// SERVICER.agc:1160
//		TCF	HFAIL		# DELTA H TOO LARGE
// slot 30368
                if slot <> 30368 or instruction <> 6000 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6000, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1161
//		TC	DOWNFLAG	# TURN OFF ALT FAIL LAMP
// slot 30369
                if slot <> 30369 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1953] to agcAotUnit1953@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1162
//		ADRES	HFLSHFLG
// slot 30370
    30370, 358
)).

// bank 33, slots 30371-30375
function agcAotUnit1954 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30372 {
        if slot <= 30371 {
// SERVICER.agc:1163
//
// SERVICER.agc:1164
//NOREASON	CS	FLGWRD11
// slot 30371
            if slot <> 30371 or instruction <> 16455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 71).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1165
//		MASK	LRINHBIT
// slot 30372
            if slot <> 30372 or instruction <> 31204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2532), 32768).
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
        if slot <= 30373 {
// SERVICER.agc:1166
//		CCS	A
// slot 30373
            if slot <> 30373 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30374 {
// SERVICER.agc:1167
//		TCF	VMEASCHK	# UPDATE INHIBITED -- TEST VELOCITY ANYWAY
// slot 30374
                if slot <> 30374 or instruction <> 5832 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5832, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1168
//
// SERVICER.agc:1169
//		TC	INTPRET		# DO POSITION UPDATE
// slot 30375
                if slot <> 30375 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1954] to agcAotUnit1954@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1170
//		DLOAD	SR4
// slot 30376
    30376, 33482,
// SERVICER.agc:1171
//			HCALC		# RESCALE H TO 2(28)M
// slot 30377
    30377, 3770,
// SERVICER.agc:1172
//		EXIT
// slot 30378
    30378, 65532
)).

// bank 33, slots 30379-30397
function agcAotUnit1955 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30387 {
        if slot <= 30382 {
            if slot <= 30380 {
                if slot <= 30379 {
// SERVICER.agc:1173
//		EXTEND
// slot 30379
                    if slot <> 30379 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1174
//		DCA	DELTAH		# STORE DELTAH IN MPAC AND
// slot 30380
                    if slot <> 30380 or instruction <> 13237 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 949, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30381 {
// SERVICER.agc:1175
//		DXCH	MPAC		# BRING HCALC INTO A,L
// slot 30381
                    if slot <> 30381 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1176
//		TC	ALSIGNAG
// slot 30382
                    if slot <> 30382 or instruction <> 3940 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3940, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30384 {
                if slot <= 30383 {
// SERVICER.agc:1177
//		EXTEND			# IF HIGH PART OF HCALC IS NON-ZERO, THEN
// slot 30383
                    if slot <> 30383 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1178
//		BZF	+2		# HCALC > HMAX,
// slot 30384
                    if slot <> 30384 or instruction <> 5810 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5810, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30385 {
// SERVICER.agc:1179
//		TCF	VMEASCHK	# SO UPDATE IS BYPASSED
// slot 30385
                    if slot <> 30385 or instruction <> 5832 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5832, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30386 {
// SERVICER.agc:1180
//		TS	MPAC +2		#	FOR LATER SHORTMP
// slot 30386
                        if slot <> 30386 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1181
//
// SERVICER.agc:1182
//		CS	L		# -H AT 2(14) M
// slot 30387
                        if slot <> 30387 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30392 {
            if slot <= 30389 {
                if slot <= 30388 {
// SERVICER.agc:1183
//		AD	LRHMAX		# HMAX - H
// slot 30388
                    if slot <> 30388 or instruction <> 25360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 784).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1184
//		EXTEND
// slot 30389
                    if slot <> 30389 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30390 {
// SERVICER.agc:1185
//		BZMF	VMEASCHK	# IF H >HMAX, BYPASS UPDATE
// slot 30390
                    if slot <> 30390 or instruction <> 26312 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26312, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30391 {
// SERVICER.agc:1186
//		EXTEND
// slot 30391
                        if slot <> 30391 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1187
//		MP	LRWH		# WH(HMAX - H)
// slot 30392
                        if slot <> 30392 or instruction <> 29457 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 785, readEffective:call(words, 785)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30394 {
                if slot <= 30393 {
// SERVICER.agc:1188
//		EXTEND
// slot 30393
                    if slot <> 30393 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1189
//		DV	LRHMAX		# WH(1 - H/HMAX)
// slot 30394
                    if slot <> 30394 or instruction <> 4880 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 784, readEffective:call(words, 784)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30395 {
// SERVICER.agc:1190
//		TS	MPTEMP
// slot 30395
                    if slot <> 30395 or instruction <> 22621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30396 {
// SERVICER.agc:1191
//		TC	SHORTMP2	# DELTAH (WH)(1 - H/HMAX) IN MPAC
// slot 30396
                        if slot <> 30396 or instruction <> 3787 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3787, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1192
//		TC	INTPRET		# MODE IS DP FROM ABOVE
// slot 30397
                        if slot <> 30397 or instruction <> 3103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3103, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1955] to agcAotUnit1955@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1193
//		SL1
// slot 30398
    30398, 65492,
// SERVICER.agc:1194
//		VXSC	VAD
// slot 30399
    30399, 44514,
// SERVICER.agc:1195
//			UNIT/R/		# DELTAR = DH(WH)(1 - H/HMAX) UNIT/R/
// slot 30400
    30400, 3774,
// SERVICER.agc:1196
//			R1S
// slot 30401
    30401, 3830,
// SERVICER.agc:1197
//		STCALL	GNUR
// slot 30402
    30402, 32606,
// SERVICER.agc:1198
//			MUNGRAV
// slot 30403
    30403, 56496,
// SERVICER.agc:1199
//		EXIT
// slot 30404
    30404, 65532
)).

// bank 33, slots 30405-30418
function agcAotUnit1956 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30411 {
        if slot <= 30407 {
            if slot <= 30405 {
// SERVICER.agc:1200
//# Page 886
// SERVICER.agc:1201
//		TC	QUIKFAZ5
// slot 30405
                if slot <> 30405 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30406 {
// SERVICER.agc:1202
//
// SERVICER.agc:1203
//		CA	ZERO
// slot 30406
                    if slot <> 30406 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1204
//RUPDATED	TC	GNURVST
// slot 30407
                    if slot <> 30407 or instruction <> 1884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30409 {
                if slot <= 30408 {
// SERVICER.agc:1205
//
// SERVICER.agc:1206
//VMEASCHK	TC	QUIKFAZ5	# RESTART AT NEXT LOCATION
// slot 30408
                    if slot <> 30408 or instruction <> 1898 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1898, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1207
//		CS	FLGWRD11
// slot 30409
                    if slot <> 30409 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30410 {
// SERVICER.agc:1208
//		MASK	VELDABIT	# IS V READING AVAILABLE?
// slot 30410
                    if slot <> 30410 or instruction <> 31205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1209
//		CCS	A
// slot 30411
                    if slot <> 30411 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 30414 {
            if slot <= 30412 {
// SERVICER.agc:1210
//		TCF	VALTCHK		# NO:  SEE IF V READING TO BE TAKEN
// slot 30412
                if slot <> 30412 or instruction <> 5964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30413 {
// SERVICER.agc:1211
//
// SERVICER.agc:1212
//VELUPDAT	CS	VSELECT		# PROCESS VELOCITY DATA
// slot 30413
                    if slot <> 30413 or instruction <> 17321 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 937).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1213
//		TS	L
// slot 30414
                    if slot <> 30414 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30416 {
                if slot <= 30415 {
// SERVICER.agc:1214
//		ADS	L		# -2 VSELECT IN L
// slot 30415
                    if slot <> 30415 or instruction <> 11265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1215
//		AD	L
// slot 30416
                    if slot <> 30416 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30417 {
// SERVICER.agc:1216
//		AD	L		# -6 VSELECT IN A
// slot 30417
                    if slot <> 30417 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1217
//		INDEX	FIXLOC
// slot 30418
                    if slot <> 30418 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1956] to agcAotUnit1956@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1218
//		DXCH	X1		# X1 = -6 VSELECT, X2 = -2 VSELECT
// slot 30419
    30419, 43086
)).

// bank 33, slots 30420-30428
function agcAotUnit1957 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30423 {
        if slot <= 30421 {
            if slot <= 30420 {
// SERVICER.agc:1219
//
// SERVICER.agc:1220
//		CA	EBANK4
// slot 30420
                if slot <> 30420 or instruction <> 14817 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1221
//		TS	EBANK
// slot 30421
                if slot <> 30421 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30422 {
// SERVICER.agc:1222
//		EBANK=	LRXCDU
// SERVICER.agc:1223
//
// SERVICER.agc:1224
//		CA	LRYCDU		# STORE LRCDUS IN CDUSPOTS
// slot 30422
                if slot <> 30422 or instruction <> 13229 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 941).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1225
//		TS	CDUSPOT
// slot 30423
                if slot <> 30423 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30425 {
            if slot <= 30424 {
// SERVICER.agc:1226
//		CA	LRZCDU
// slot 30424
                if slot <> 30424 or instruction <> 13230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 942).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1227
//		TS	CDUSPOT +2
// slot 30425
                if slot <> 30425 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30426 {
// SERVICER.agc:1228
//		CA	LRXCDU
// slot 30426
                if slot <> 30426 or instruction <> 13228 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 940).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30427 {
// SERVICER.agc:1229
//		TS	CDUSPOT +4
// slot 30427
                    if slot <> 30427 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1230
//
// SERVICER.agc:1231
//		TC	BANKCALL
// slot 30428
                    if slot <> 30428 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1957] to agcAotUnit1957@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1232
//		CADR	QUICTRIG	# GET SINES AND COSINES FOR NBSM
// slot 30429
    30429, 40730
)).

// bank 33, slots 30430-30432
function agcAotUnit1958 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30430 {
// SERVICER.agc:1233
//
// SERVICER.agc:1234
//		CA	FIXLOC
// slot 30430
        if slot <> 30430 or instruction <> 12368 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 80).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30431 {
// SERVICER.agc:1235
//		TS	PUSHLOC		# SET PD TO ZERO
// slot 30431
            if slot <> 30431 or instruction <> 22646 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22646, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1236
//
// SERVICER.agc:1237
//		TC	INTPRET
// slot 30432
            if slot <> 30432 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1958] to agcAotUnit1958@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1238
//		VLOAD*	CALL
// slot 30433
    30433, 38134,
// SERVICER.agc:1239
//			VZBEAMNB,1	# CONVERT VBEAM FROM NB TO SM
// slot 30434
    30434, 2354,
// SERVICER.agc:1240
//			*NBSM*
// slot 30435
    30435, 40822,
// SERVICER.agc:1241
//		PDDL	SL		# STORE IN PD 0-5
// slot 30436
    30436, 45482,
// SERVICER.agc:1242
//			VMEAS		# LOAD VELOCITY MEASUREMENT
// slot 30437
    30437, 3926,
// SERVICER.agc:1243
//			12D
// slot 30438
    30438, 16666,
// SERVICER.agc:1244
//		DMP*	PUSH		# SCALE TO M/CS AT 2(6)
// slot 30439
    30439, 34310,
// SERVICER.agc:1245
//			VZSCAL,2	# AND STORE IN PD 6-7
// slot 30440
    30440, 42984,
// SERVICER.agc:1246
//		EXIT
// slot 30441
    30441, 65532
)).

// bank 33, slots 30442-30455
function agcAotUnit1959 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30448 {
        if slot <= 30444 {
            if slot <= 30442 {
// SERVICER.agc:1247
//		CS	ONE
// slot 30442
                if slot <> 30442 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30443 {
// SERVICER.agc:1248
//		TS	MODE		# CHANGE STORE MODE TO VECTOR
// slot 30443
                    if slot <> 30443 or instruction <> 22643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1249
//
// SERVICER.agc:1250
//		CA	PIPTEM		# STORE DELV IN MPAC
// slot 30444
                    if slot <> 30444 or instruction <> 13231 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 943).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30446 {
                if slot <= 30445 {
// SERVICER.agc:1251
//# Page 887
// SERVICER.agc:1252
//		ZL
// slot 30445
                    if slot <> 30445 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1253
//		DXCH	MPAC
// slot 30446
                    if slot <> 30446 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30447 {
// SERVICER.agc:1254
//
// SERVICER.agc:1255
//		CA	PIPTEM +1
// slot 30447
                    if slot <> 30447 or instruction <> 13232 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 944).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1256
//		ZL
// slot 30448
                    if slot <> 30448 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30451 {
            if slot <= 30449 {
// SERVICER.agc:1257
//		DXCH	MPAC +3
// slot 30449
                if slot <> 30449 or instruction <> 21616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30450 {
// SERVICER.agc:1258
//
// SERVICER.agc:1259
//		CA	PIPTEM +2
// slot 30450
                    if slot <> 30450 or instruction <> 13233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 945).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1260
//		ZL
// slot 30451
                    if slot <> 30451 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30453 {
                if slot <= 30452 {
// SERVICER.agc:1261
//		DXCH	MPAC +5
// slot 30452
                    if slot <> 30452 or instruction <> 21618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1262
//
// SERVICER.agc:1263
//		CA	EBANK7
// slot 30453
                    if slot <> 30453 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
                if slot <= 30454 {
// SERVICER.agc:1264
//		TS	EBANK		# RESTORE EBANK 7
// slot 30454
                    if slot <> 30454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1265
//		EBANK=	DVCNTR
// SERVICER.agc:1266
//		TC	INTPRET
// slot 30455
                    if slot <> 30455 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1959] to agcAotUnit1959@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1267
//		VXSC	PDDL
// slot 30456
    30456, 54754,
// SERVICER.agc:1268
//			KPIP1		# SCALE DELV TO 2(7) M/CS AND PUSH
// slot 30457
    30457, 22564,
// SERVICER.agc:1269
//			LRVTIME		# TIME OF DELV AT 2(28) CS
// slot 30458
    30458, 2390,
// SERVICER.agc:1270
//		DSU	DDV
// slot 30459
    30459, 47402,
// SERVICER.agc:1271
//			PIPTIME		# TU - T(N-1)
// slot 30460
    30460, 1338,
// SERVICER.agc:1272
//			2SEC(28)
// slot 30461
    30461, 23762,
// SERVICER.agc:1273
//		VXSC	VSL1		# G(N-1)(TU - T(N-1))
// slot 30462
    30462, 64226,
// SERVICER.agc:1274
//			GDT/2		# SCALED AT 2(7) M/CS
// slot 30463
    30463, 1342,
// SERVICER.agc:1275
//		VAD	VAD		# PUSH UP FOR DELV
// slot 30464
    30464, 44378,
// SERVICER.agc:1276
//			V		# VU = V(N-1) + DELVU + G(N-1) DTU
// slot 30465
    30465, 3758,
// SERVICER.agc:1277
//		VSL2	VAD		# SCALE TO 2(5) M/CS AND SUBTRACT
// slot 30466
    30466, 44500,
// SERVICER.agc:1278
//			DELVS		#	MOON ROTATION.
// slot 30467
    30467, 4024,
// SERVICER.agc:1279
//		PUSH	ABVAL		# STORE IN PD
// slot 30468
    30468, 42508,
// SERVICER.agc:1280
//		SR4	DAD		# ABS(VM)/8 + 7.5 AT 2(6)
// slot 30469
    30469, 36100,
// SERVICER.agc:1281
//			7.5
// slot 30470
    30470, 23754,
// SERVICER.agc:1282
//		STOVL	20D		# STORE IN 20D AND PICK UP VM
// slot 30471
    30471, 20522,
// SERVICER.agc:1283
//		DOT	BDSU		# V(EST) AT 2(6)
// slot 30472
    30472, 37186,
// SERVICER.agc:1284
//			0		# DELTAV = VMEAS - V(EST)
// slot 30473
    30473, 2,
// SERVICER.agc:1285
//		PUSH	ABS
// slot 30474
    30474, 42508,
// SERVICER.agc:1286
//		DSU	EXIT		# ABS(DV) - (7.5 + ABS(VM)/8))
// slot 30475
    30475, 65066,
// SERVICER.agc:1287
//			20D
// slot 30476
    30476, 42
)).

// bank 33, slots 30477-30481
function agcAotUnit1960 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30478 {
        if slot <= 30477 {
// SERVICER.agc:1288
//
// SERVICER.agc:1289
//		INCR	LRMCTR
// slot 30477
            if slot <> 30477 or instruction <> 11194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 954).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1290
//		TC	BRANCH
// slot 30478
            if slot <> 30478 or instruction <> 3539 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3539, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30479 {
// SERVICER.agc:1291
//		TCF	VFAIL		# DELTA V TOO LARGE.	ALARM
// slot 30479
            if slot <> 30479 or instruction <> 6013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6013, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30480 {
// SERVICER.agc:1292
//		TCF	VFAIL		# DELTA V TOO LARGE.	ALARM
// slot 30480
                if slot <> 30480 or instruction <> 6013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1293
//
// SERVICER.agc:1294
//		TC	DOWNFLAG	# TURN OFF VEL FAIL LAMP
// slot 30481
                if slot <> 30481 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1960] to agcAotUnit1960@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1295
//		ADRES	VFLSHFLG
// slot 30482
    30482, 356
)).

// bank 33, slots 30483-30487
function agcAotUnit1961 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30484 {
        if slot <= 30483 {
// SERVICER.agc:1296
//
// SERVICER.agc:1297
//		CA	FLGWRD11
// slot 30483
            if slot <> 30483 or instruction <> 12359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 71).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1298
//		MASK	VXINHBIT
// slot 30484
            if slot <> 30484 or instruction <> 31200 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
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
        if slot <= 30485 {
// SERVICER.agc:1299
//		EXTEND
// slot 30485
            if slot <> 30485 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30486 {
// SERVICER.agc:1300
//		BZF	VUPDAT		# IF VX INHIBIT RESET, INCORPORATE DATA.
// slot 30486
                if slot <> 30486 or instruction <> 5917 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5917, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1301
//# Page 888
// SERVICER.agc:1302
//		TC	DOWNFLAG
// slot 30487
                if slot <> 30487 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1961] to agcAotUnit1961@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1303
//		ADRES	VXINH		# RESET VX INHIBIT
// slot 30488
    30488, 336
)).

// bank 33, slots 30489-30506
function agcAotUnit1962 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30497 {
        if slot <= 30492 {
            if slot <= 30490 {
                if slot <= 30489 {
// SERVICER.agc:1304
//
// SERVICER.agc:1305
//		CA	VSELECT
// slot 30489
                    if slot <> 30489 or instruction <> 13225 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 937).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1306
//		AD	NEG2		# IF VSELECT = 2 (X AXIS).
// slot 30490
                    if slot <> 30490 or instruction <> 28646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30491 {
// SERVICER.agc:1307
//		EXTEND			# BYPASS UPDATE
// slot 30491
                    if slot <> 30491 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1308
//		BZF	ENDVDAT
// slot 30492
                    if slot <> 30492 or instruction <> 5964 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5964, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30494 {
                if slot <= 30493 {
// SERVICER.agc:1309
//
// SERVICER.agc:1310
//VUPDAT		CS	FLGWRD11
// slot 30493
                    if slot <> 30493 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1311
//		MASK	LRINHBIT
// slot 30494
                    if slot <> 30494 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
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
                if slot <= 30495 {
// SERVICER.agc:1312
//		CCS	A
// slot 30495
                    if slot <> 30495 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30496 {
// SERVICER.agc:1313
//		TCF	VALTCHK		# UPDATE INHIBITED
// slot 30496
                        if slot <> 30496 or instruction <> 5964 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5964, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1314
//
// SERVICER.agc:1315
//		TS	MPAC +1
// slot 30497
                        if slot <> 30497 or instruction <> 22637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30501 {
            if slot <= 30499 {
                if slot <= 30498 {
// SERVICER.agc:1316
//
// SERVICER.agc:1317
//		CA	ABVEL		# STORE E7 ERASABLES NEEDED IN TEMPS
// slot 30498
                    if slot <> 30498 or instruction <> 13113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 825).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1318
//		TS	ABVEL*
// slot 30499
                    if slot <> 30499 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30500 {
// SERVICER.agc:1319
//		CA	VSELECT
// slot 30500
                    if slot <> 30500 or instruction <> 13225 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 937).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1320
//		TS	VSELECT*
// slot 30501
                    if slot <> 30501 or instruction <> 22617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22617, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30503 {
                if slot <= 30502 {
// SERVICER.agc:1321
//		CA	EBANK5
// slot 30502
                    if slot <> 30502 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1322
//		TS	EBANK		# CHANGE EBANKS
// slot 30503
                    if slot <> 30503 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30504 {
// SERVICER.agc:1323
//
// SERVICER.agc:1324
//		EBANK=	LRVF
// SERVICER.agc:1325
//		CS	LRVF
// slot 30504
                    if slot <> 30504 or instruction <> 17239 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 855).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30505 {
// SERVICER.agc:1326
//		AD	ABVEL*		# IF V < VF, USE WVF
// slot 30505
                        if slot <> 30505 or instruction <> 24664 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 88).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1327
//		EXTEND
// slot 30506
                        if slot <> 30506 or instruction <> 6 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1962] to agcAotUnit1962@.

// bank 33, slots 30507-30513
function agcAotUnit1963 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30509 {
        if slot <= 30507 {
// SERVICER.agc:1328
//		BZMF	USEVF
// slot 30507
            if slot <> 30507 or instruction <> 26422 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26422, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30508 {
// SERVICER.agc:1329
//
// SERVICER.agc:1330
//		CS	ABVEL*
// slot 30508
                if slot <> 30508 or instruction <> 16472 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 88).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1331
//		AD	LRVMAX		# VMAX - V
// slot 30509
                if slot <> 30509 or instruction <> 25430 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 854).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30511 {
            if slot <= 30510 {
// SERVICER.agc:1332
//		EXTEND
// slot 30510
                if slot <> 30510 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1333
//		BZMF	WSTOR -1	# IF V > VMAX, W = 0
// slot 30511
                if slot <> 30511 or instruction <> 26425 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26425, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30512 {
// SERVICER.agc:1334
//
// SERVICER.agc:1335
//		EXTEND
// slot 30512
                if slot <> 30512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1336
//		INDEX	VSELECT*
// slot 30513
                if slot <> 30513 or instruction <> 20569 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20569, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20569, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1963] to agcAotUnit1963@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1337
//		MP	LRWVZ		# WV(VMAX - V)
// slot 30514
    30514, 59056
)).

// bank 33, slots 30515-30518
function agcAotUnit1964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30516 {
        if slot <= 30515 {
// SERVICER.agc:1338
//
// SERVICER.agc:1339
//		EXTEND
// slot 30515
            if slot <> 30515 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1340
//		DV	LRVMAX		# WV( 1 - V/VMAX )
// slot 30516
            if slot <> 30516 or instruction <> 4950 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreDv(words, 854, readEffective:call(words, 854)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30517 {
// SERVICER.agc:1341
//		TCF	WSTOR
// slot 30517
            if slot <> 30517 or instruction <> 5946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1342
//
// SERVICER.agc:1343
//USEVF		INDEX	VSELECT*
// slot 30518
            if slot <> 30518 or instruction <> 20569 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20569, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20569, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1964] to agcAotUnit1964@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1344
//		CA	LRWVFZ		# USE APPROPRIATE CONSTANT WEIGHT
// slot 30519
    30519, 26294
)).

// bank 33, slots 30520-30531
function agcAotUnit1965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30525 {
        if slot <= 30522 {
            if slot <= 30520 {
// SERVICER.agc:1345
//		TCF	WSTOR
// slot 30520
                if slot <> 30520 or instruction <> 5946 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5946, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30521 {
// SERVICER.agc:1346
//
// SERVICER.agc:1347
// -1		CA	ZERO
// slot 30521
                    if slot <> 30521 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1348
//WSTOR		TS	MPAC
// slot 30522
                    if slot <> 30522 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30523 {
// SERVICER.agc:1349
//		CS	BIT7		# (=64D)
// slot 30523
                if slot <> 30523 or instruction <> 18917 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30524 {
// SERVICER.agc:1350
//		AD	MODREG
// slot 30524
                    if slot <> 30524 or instruction <> 25097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1351
//		EXTEND
// slot 30525
                    if slot <> 30525 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30528 {
            if slot <= 30526 {
// SERVICER.agc:1352
//# Page 889
// SERVICER.agc:1353
//		BZMF	+3		# IF IN P65,P66,P67, USE ANOTHER CONSTANT
// slot 30526
                if slot <> 30526 or instruction <> 26433 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30527 {
// SERVICER.agc:1354
//
// SERVICER.agc:1355
//		CA	LRWVFF
// slot 30527
                    if slot <> 30527 or instruction <> 13150 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 862).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1356
//		TS	MPAC
// slot 30528
                    if slot <> 30528 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30529 {
// SERVICER.agc:1357
//
// SERVICER.agc:1358
// +3		CA	EBANK7
// slot 30529
                if slot <> 30529 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30530 {
// SERVICER.agc:1359
// 		TS	EBANK		# CHANGE EBANKS
// slot 30530
                    if slot <> 30530 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1360
//
// SERVICER.agc:1361
//		EBANK=	ABVEL
// SERVICER.agc:1362
//		TC	INTPRET
// slot 30531
                    if slot <> 30531 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1965] to agcAotUnit1965@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1363
//		DMP	VXSC		# W(DELTA V)(VBEAMSM) UP 6-7, 0-5
// slot 30532
    30532, 61706,
// SERVICER.agc:1364
//		VAD
// slot 30533
    30533, 65370,
// SERVICER.agc:1365
//			V1S		# ADD WEIGHTED DELTA V TO VELOCITY
// slot 30534
    30534, 3842,
// SERVICER.agc:1366
//		STORE	GNUV
// slot 30535
    30535, 3934,
// SERVICER.agc:1367
//		EXIT
// slot 30536
    30536, 65532
)).

// bank 33, slots 30537-30549
function agcAotUnit1966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30542 {
        if slot <= 30539 {
            if slot <= 30537 {
// SERVICER.agc:1368
//
// SERVICER.agc:1369
//		TC	QUIKFAZ5	# DO NOT RE-UPDATE
// slot 30537
                if slot <> 30537 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30538 {
// SERVICER.agc:1370
//
// SERVICER.agc:1371
//		CA	SIX
// slot 30538
                    if slot <> 30538 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1372
//VUPDATED	TC	GNURVST		# STORE NEW VELOCITY VECTOR
// slot 30539
                    if slot <> 30539 or instruction <> 1884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30540 {
// SERVICER.agc:1373
//ENDVDAT		=	VALTCHK
// SERVICER.agc:1374
//
// SERVICER.agc:1375
//VALTCHK		TC	QUIKFAZ5	# DO NOT REPEAT ABOVE
// slot 30540
                if slot <> 30540 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30541 {
// SERVICER.agc:1376
//
// SERVICER.agc:1377
//		CAF	READVBIT	# TEST READVEL TO SEE IF VELOCITY READING
// slot 30541
                    if slot <> 30541 or instruction <> 14823 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1378
//		MASK	FLGWRD11	# IS DESIRED.
// slot 30542
                    if slot <> 30542 or instruction <> 28743 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 71).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30545 {
            if slot <= 30543 {
// SERVICER.agc:1379
//		CCS	A
// slot 30543
                if slot <> 30543 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30544 {
// SERVICER.agc:1380
//		TCF	READV		# YES -- READ VELOCITY
// slot 30544
                    if slot <> 30544 or instruction <> 5975 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5975, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1381
//		CS	ABVEL		# NO -- SEE IF VELOCITY < 2000 FT/SEC
// slot 30545
                    if slot <> 30545 or instruction <> 17209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 825).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30547 {
                if slot <= 30546 {
// SERVICER.agc:1382
//		AD	2KFT/SEC
// slot 30546
                    if slot <> 30546 or instruction <> 26055 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1479), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1383
//		EXTEND
// slot 30547
                    if slot <> 30547 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30548 {
// SERVICER.agc:1384
//		BZMF	CONTSERV	# V > 2000 FT/SEC  DO NOT READ VEL
// slot 30548
                    if slot <> 30548 or instruction <> 25952 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25952, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1385
//
// SERVICER.agc:1386
//		TC	UPFLAG		# V < 2000 FT/SEC  SET READVEL AND READ.
// slot 30549
                    if slot <> 30549 or instruction <> 2884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1966] to agcAotUnit1966@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1387
//		ADRES	READVEL
// slot 30550
    30550, 350
)).

// bank 33, slots 30551-30552
function agcAotUnit1967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30551 {
// SERVICER.agc:1388
//
// SERVICER.agc:1389
//READV		CAF	PRIO32		# SET UP JOB TO READ VELOCITY BEAMS.
// slot 30551
        if slot <> 30551 or instruction <> 16336 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4048), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SERVICER.agc:1390
//		TC	NOVAC
// slot 30552
        if slot <> 30552 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1967] to agcAotUnit1967@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1391
//		EBANK=	HMEAS
// SERVICER.agc:1392
//		2CADR	LRVJOB
// slot 30553 30554
    30553, 3868, 30554, 55406
)).

// bank 33, slots 30555-30559
function agcAotUnit1968 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30556 {
        if slot <= 30555 {
// SERVICER.agc:1393
//
// SERVICER.agc:1394
//		TCF	CONTSERV	# CONTINUE WITH SERVICER
// slot 30555
            if slot <> 30555 or instruction <> 5472 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5472, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1395
//
// SERVICER.agc:1396
//GNURVST		TS	BUF		# STORE GNUR (=GNUV) IN R1S OR V1S
// slot 30556
            if slot <> 30556 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30557 {
// SERVICER.agc:1397
//		EXTEND			# A = 0 FOR R, A = 6 FOR V
// slot 30557
            if slot <> 30557 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30558 {
// SERVICER.agc:1398
//		DCA	GNUR
// slot 30558
                if slot <> 30558 or instruction <> 13231 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 943, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1399
//		INDEX	BUF
// slot 30559
                if slot <> 30559 or instruction <> 20568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20568, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1968] to agcAotUnit1968@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1400
//		DXCH	R1S
// slot 30560
    30560, 44790
)).

// bank 33, slots 30561-30563
function agcAotUnit1969 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30561 {
// SERVICER.agc:1401
//		EXTEND
// slot 30561
        if slot <> 30561 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30562 {
// SERVICER.agc:1402
//# Page 890
// SERVICER.agc:1403
//		DCA	GNUR +2
// slot 30562
            if slot <> 30562 or instruction <> 13233 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 945, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1404
//		INDEX	BUF
// slot 30563
            if slot <> 30563 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1969] to agcAotUnit1969@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1405
//		DXCH	R1S +2
// slot 30564
    30564, 44794
)).

// bank 33, slots 30565-30567
function agcAotUnit1970 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30565 {
// SERVICER.agc:1406
//		EXTEND
// slot 30565
        if slot <> 30565 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30566 {
// SERVICER.agc:1407
//		DCA	GNUR +4
// slot 30566
            if slot <> 30566 or instruction <> 13235 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 947, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1408
//		INDEX	BUF
// slot 30567
            if slot <> 30567 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1970] to agcAotUnit1970@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1409
//		DXCH	R1S +4
// slot 30568
    30568, 44798
)).

// bank 33, slots 30569-30584
function agcAotUnit1971 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30576 {
        if slot <= 30572 {
            if slot <= 30570 {
                if slot <= 30569 {
// SERVICER.agc:1410
//		TC	Q
// slot 30569
                    if slot <> 30569 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1411
//
// SERVICER.agc:1412
//QUIKFAZ5	CA	EBANK3
// slot 30570
                    if slot <> 30570 or instruction <> 14855 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30571 {
// SERVICER.agc:1413
//		XCH	EBANK		# SET EBANK 3
// slot 30571
                    if slot <> 30571 or instruction <> 23555 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 3, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1414
//		DXCH	L		# Q TO A, A TO L
// slot 30572
                    if slot <> 30572 or instruction <> 21506 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 2, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30574 {
                if slot <= 30573 {
// SERVICER.agc:1415
//		EBANK=	PHSNAME5
// SERVICER.agc:1416
//		TS	PHSNAME5
// slot 30573
                    if slot <> 30573 or instruction <> 23334 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23334, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1417
//		LXCH	EBANK
// slot 30574
                    if slot <> 30574 or instruction <> 9219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 3, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30575 {
// SERVICER.agc:1418
//		EBANK=	DVCNTR
// SERVICER.agc:1419
//		TC	A
// slot 30575
                    if slot <> 30575 or instruction <> 0 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 0, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1420
//
// SERVICER.agc:1421
//HFAIL		CS	LRRCTR
// slot 30576
                    if slot <> 30576 or instruction <> 17337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 953).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30580 {
            if slot <= 30578 {
                if slot <= 30577 {
// SERVICER.agc:1422
//		EXTEND
// slot 30577
                    if slot <> 30577 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1423
//		BZF	NORLITE		# IF R = 0, DO NOT TURN ON TRK FAIL
// slot 30578
                    if slot <> 30578 or instruction <> 6010 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6010, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30579 {
// SERVICER.agc:1424
//		AD	LRLCTR
// slot 30579
                    if slot <> 30579 or instruction <> 25528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 952).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1425
//		MASK	NEG3
// slot 30580
                    if slot <> 30580 or instruction <> 32741 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                        if fixedOperand = 32764 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 8192) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30582 {
                if slot <= 30581 {
// SERVICER.agc:1426
//		EXTEND			# IF L-R LT 4, DO NOT TURN ON TRK FAIL
// slot 30581
                    if slot <> 30581 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1427
//		BZF	+2
// slot 30582
                    if slot <> 30582 or instruction <> 6008 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6008, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30583 {
// SERVICER.agc:1428
//		TCF	NORLITE
// slot 30583
                    if slot <> 30583 or instruction <> 6010 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6010, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1429
//
// SERVICER.agc:1430
//		TC	UPFLAG		# AND SET BIT TO TURN ON TRACKER FAIL LITE
// slot 30584
                    if slot <> 30584 or instruction <> 2884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1971] to agcAotUnit1971@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1431
//		ADRES	HFLSHFLG
// slot 30585
    30585, 358
)).

// bank 33, slots 30586-30597
function agcAotUnit1972 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30591 {
        if slot <= 30588 {
            if slot <= 30586 {
// SERVICER.agc:1432
//
// SERVICER.agc:1433
//NORLITE		CA	LRLCTR
// slot 30586
                if slot <> 30586 or instruction <> 13240 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 952).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30587 {
// SERVICER.agc:1434
//		TS	LRRCTR		# SET R = L
// slot 30587
                    if slot <> 30587 or instruction <> 23481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1435
//
// SERVICER.agc:1436
//		TCF	VMEASCHK
// slot 30588
                    if slot <> 30588 or instruction <> 5832 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5832, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30589 {
// SERVICER.agc:1437
//
// SERVICER.agc:1438
//VFAIL		CS	LRSCTR		# DELTA Q LARGE
// slot 30589
                if slot <> 30589 or instruction <> 17339 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 955).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30590 {
// SERVICER.agc:1439
//		EXTEND			# IF S = 0, DO NOT TURN ON TRACKER FAIL
// slot 30590
                    if slot <> 30590 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1440
//		BZF	NOLITE
// slot 30591
                    if slot <> 30591 or instruction <> 6023 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6023, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30594 {
            if slot <= 30592 {
// SERVICER.agc:1441
//		AD	LRMCTR		# M-S
// slot 30592
                if slot <> 30592 or instruction <> 25530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 954).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30593 {
// SERVICER.agc:1442
//		MASK	NEG3		# TEST FOR M-S > 3
// slot 30593
                    if slot <> 30593 or instruction <> 32741 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                        if fixedOperand = 32764 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 8192) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1443
//		EXTEND			# IF M-S > 3, THEN TWO OR MORE OF THE
// slot 30594
                    if slot <> 30594 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30595 {
// SERVICER.agc:1444
//		BZF	+2		# 	LAST FOUR V READINGS WERE BAD,
// slot 30595
                if slot <> 30595 or instruction <> 6021 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6021, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30596 {
// SERVICER.agc:1445
//		TCF	NOLITE		#	SO TURN ON VELOCITY FAIL LIGHT
// slot 30596
                    if slot <> 30596 or instruction <> 6023 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6023, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1446
//
// SERVICER.agc:1447
//		TC	UPFLAG		# AND SET BIT TO TURN ON TRACKER FAIL LITE
// slot 30597
                    if slot <> 30597 or instruction <> 2884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1972] to agcAotUnit1972@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1448
//		ADRES	VFLSHFLG
// slot 30598
    30598, 356
)).

// bank 33, slots 30599-30603
function agcAotUnit1973 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30600 {
        if slot <= 30599 {
// SERVICER.agc:1449
//
// SERVICER.agc:1450
//# Page 891
// SERVICER.agc:1451
//NOLITE		CA	LRMCTR		# SET S = M
// slot 30599
            if slot <> 30599 or instruction <> 13242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 954).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1452
//		TS	LRSCTR
// slot 30600
            if slot <> 30600 or instruction <> 23483 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23483, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30601 {
// SERVICER.agc:1453
//
// SERVICER.agc:1454
//		CCS	VSELECT		# TEST FOR Z COMPONENT
// slot 30601
            if slot <> 30601 or instruction <> 5033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 937).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30602 {
// SERVICER.agc:1455
//		TCF	ENDVDAT		# NOT Z, DO NOT SET VX INHIBIT
// slot 30602
                if slot <> 30602 or instruction <> 5964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1456
//
// SERVICER.agc:1457
//		TC	UPFLAG		# Z COMPONENT - SET FLAG TO SKIP X
// slot 30603
                if slot <> 30603 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1973] to agcAotUnit1973@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1458
//		ADRES	VXINH		# COMPONENT, AS ERROR MAY BE DUE TO CROSS
// slot 30604
    30604, 336
)).

// bank 33, slots 30605-30607
function agcAotUnit1974 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30605 {
// SERVICER.agc:1459
//		TCF	ENDVDAT		# LOBE LOCK UP NOT DETECTED ON X AXIS.
// slot 30605
        if slot <> 30605 or instruction <> 5964 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5964, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30606 {
// SERVICER.agc:1460
//
// SERVICER.agc:1461
//# Page 892
// SERVICER.agc:1462
//# ********************************************************************************
// SERVICER.agc:1463
//# LRVJOB IS SET WHEN THE LEM IS BELOW 15000 FT DURING THE LANDING PHASE
// SERVICER.agc:1464
//# THIS JOB INITIALIZES THE LANDING RADAR READ ROUTINE FOR 5 VELOCITY
// SERVICER.agc:1465
//# SAMPLES AND GOES TO SLEEP WHILE THE SAMPLING IS DONE -- ABOUT 500 MS.
// SERVICER.agc:1466
//# WITH A GOODEND RETURN THE DATA IS STORED IN VMEAS AND BIT7 OF LRSTAT
// SERVICER.agc:1467
//# IS SET.  THE GIMBAL ANGLES ARE READ ABOUT MIDWAY IN THE SAMPLINGS.
// SERVICER.agc:1468
//
// SERVICER.agc:1469
//170MS		EQUALS	ND1
// SERVICER.agc:1470
//
// SERVICER.agc:1471
//LRVJOB		CA	170MS		# SET TASK TO READ CDUS + PIPAS
// slot 30606
            if slot <> 30606 or instruction <> 14577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2289), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1472
//		TC	WAITLIST
// slot 30607
            if slot <> 30607 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1974] to agcAotUnit1974@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1473
//		EBANK=	LRVTIME
// SERVICER.agc:1474
//		2CADR	RDGIMS
// slot 30608 30609
    30608, 4062, 30609, 57448
)).

// bank 33, slots 30610-30614
function agcAotUnit1975 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30611 {
        if slot <= 30610 {
// SERVICER.agc:1475
//
// SERVICER.agc:1476
//		CCS	VSELECT		# SEQUENCE LR VEL BEAM SELECTOR
// slot 30610
            if slot <> 30610 or instruction <> 5033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 937).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1477
//		TCF	+2
// slot 30611
            if slot <> 30611 or instruction <> 6037 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6037, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30612 {
// SERVICER.agc:1478
//		CAF	TWO		# IF ZERO, RESET TO TWO
// slot 30612
            if slot <> 30612 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30613 {
// SERVICER.agc:1479
//		DOUBLE			# 2XVSELECT USED FOR VBEAM INDEX IN LRVEL
// slot 30613
                if slot <> 30613 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1480
//		TC	BANKCALL	# GO INITIALIZE LR VEL READ ROUTINE
// slot 30614
                if slot <> 30614 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1975] to agcAotUnit1975@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1481
//		CADR	LRVEL
// slot 30615
    30615, 44174
)).

// bank 33, slots 30616-30616
function agcAotUnit1976 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1482
//		TC	BANKCALL	# PUT LRVJOB TO SLEEP ABOUT 500 MS
// slot 30616
    if slot <> 30616 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1976] to agcAotUnit1976@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1483
//		CADR	RADSTALL
// slot 30617
    30617, 16280
)).

// bank 33, slots 30618-30647
function agcAotUnit1977 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30632 {
        if slot <= 30624 {
            if slot <= 30620 {
                if slot <= 30618 {
// SERVICER.agc:1484
//		TCF	VBAD
// slot 30618
                    if slot <> 30618 or instruction <> 6069 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6069, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30619 {
// SERVICER.agc:1485
//		CCS	STILBADV	# IS DATA GOOD JUST PRESENT?
// slot 30619
                        if slot <> 30619 or instruction <> 5053 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 957).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1486
//		TCF	VSTILBAD	# JUST GOOD -- MUST WAIT 4 SECONDS.
// slot 30620
                        if slot <> 30620 or instruction <> 6070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30622 {
                    if slot <= 30621 {
// SERVICER.agc:1487
//
// SERVICER.agc:1488
//		INHINT
// slot 30621
                        if slot <> 30621 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1489
//		EXTEND			# GOOD RETURN -- STOW AWAY VMEAS
// slot 30622
                        if slot <> 30622 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30623 {
// SERVICER.agc:1490
//		DCA	SAMPLSUM
// slot 30623
                        if slot <> 30623 or instruction <> 12866 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 578, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1491
//		DXCH	VMEAS
// slot 30624
                        if slot <> 30624 or instruction <> 22443 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 939, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30628 {
                if slot <= 30626 {
                    if slot <= 30625 {
// SERVICER.agc:1492
//		CA	EBANK4		# FOR DOWNLINK
// slot 30625
                        if slot <> 30625 or instruction <> 14817 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1493
//		TS	EBANK
// slot 30626
                        if slot <> 30626 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30627 {
// SERVICER.agc:1494
//		EBANK=	LRVTIME
// SERVICER.agc:1495
//
// SERVICER.agc:1496
//		EXTEND
// slot 30627
                        if slot <> 30627 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1497
//		DCA	LRVTIME
// slot 30628
                        if slot <> 30628 or instruction <> 13227 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 939, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30630 {
                    if slot <= 30629 {
// SERVICER.agc:1498
//		DXCH	LRVTIMDL
// slot 30629
                        if slot <> 30629 or instruction <> 22496 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 992, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1499
//		EXTEND
// slot 30630
                        if slot <> 30630 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30631 {
// SERVICER.agc:1500
//		DCA	LRXCDU
// slot 30631
                        if slot <> 30631 or instruction <> 13229 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 941, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1501
//		DXCH	LRXCDUDL
// slot 30632
                        if slot <> 30632 or instruction <> 22493 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 989, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30639 {
            if slot <= 30635 {
                if slot <= 30633 {
// SERVICER.agc:1502
//		CA	LRZCDU
// slot 30633
                    if slot <> 30633 or instruction <> 13230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 942).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30634 {
// SERVICER.agc:1503
//		TS	LRZCDUDL
// slot 30634
                        if slot <> 30634 or instruction <> 23518 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23518, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1504
//		CA	EBANK7
// slot 30635
                        if slot <> 30635 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 30637 {
                    if slot <= 30636 {
// SERVICER.agc:1505
//		TS	EBANK
// slot 30636
                        if slot <> 30636 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1506
//		EBANK=	VSELECT
// SERVICER.agc:1507
//
// SERVICER.agc:1508
//		CS	FLGWRD11	# SET BIT TO INDICATE VELOCITY
// slot 30637
                        if slot <> 30637 or instruction <> 16455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 71).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30638 {
// SERVICER.agc:1509
//		MASK	VELDABIT	# MEASUREMENT MADE
// slot 30638
                        if slot <> 30638 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1510
//# Page 893
// SERVICER.agc:1511
//		ADS	FLGWRD11
// slot 30639
                        if slot <> 30639 or instruction <> 11335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30643 {
                if slot <= 30641 {
                    if slot <= 30640 {
// SERVICER.agc:1512
//ENDLRV		CCS	VSELECT		# UPDATE VSELECT
// slot 30640
                        if slot <> 30640 or instruction <> 5033 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1513
//		TCF	+2
// slot 30641
                        if slot <> 30641 or instruction <> 6067 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6067, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30642 {
// SERVICER.agc:1514
//		CA	TWO
// slot 30642
                        if slot <> 30642 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1515
//		TS	VSELECT
// slot 30643
                        if slot <> 30643 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30645 {
                    if slot <= 30644 {
// SERVICER.agc:1516
//		TCF	ENDOFJOB
// slot 30644
                        if slot <> 30644 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1517
//
// SERVICER.agc:1518
//VBAD		CAF	TWO		# SET STILBAD TO WAIT 4 SECONDS
// slot 30645
                        if slot <> 30645 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30646 {
// SERVICER.agc:1519
//VSTILBAD	TS	STILBADV
// slot 30646
                        if slot <> 30646 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1520
//		TCF	ENDLRV
// slot 30647
                        if slot <> 30647 or instruction <> 6064 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6064, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1977] to agcAotUnit1977@.

// bank 34, slots 31694-31694
function agcAotUnit2005 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1521
//
// SERVICER.agc:1522
//# LRHJOB IS SET BY LRHTASK WHEN LEM IS BELOW 25000 FT.  THIS JOB
// SERVICER.agc:1523
//# INITIALIZES THE LR READ ROUTINE FOR AN ALT MEASUREMENT AND GOES TO
// SERVICER.agc:1524
//# SLEEP WHILE THE SAMPLING IS DONE -- ABOUT 95 MS.  WITH A GOODEND RETURN
// SERVICER.agc:1525
//# THE ALT DATA IS STORED IN HMEAS AND BIT7 OF LRSTAT IS SET.
// SERVICER.agc:1526
//
// SERVICER.agc:1527
//		BANK	34
// SERVICER.agc:1528
//		SETLOC	R12STUFF
// SERVICER.agc:1529
//		BANK
// SERVICER.agc:1530
//
// SERVICER.agc:1531
//		COUNT*	$$/SERV
// SERVICER.agc:1532
//
// SERVICER.agc:1533
//LRHJOB		TC	BANKCALL	# INITIATE LR ALT MEASUREMENT
// slot 31694
    if slot <> 31694 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2005] to agcAotUnit2005@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1534
//		CADR	LRALT
// slot 31695
    31695, 44150
)).

// bank 34, slots 31696-31696
function agcAotUnit2006 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1535
//		TC	BANKCALL	# LRHJOB TO SLEEP ABOUT 95MS
// slot 31696
    if slot <> 31696 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2006] to agcAotUnit2006@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1536
//		CADR	RADSTALL
// slot 31697
    31697, 16280
)).

// bank 34, slots 31698-31721
function agcAotUnit2007 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31709 {
        if slot <= 31703 {
            if slot <= 31700 {
                if slot <= 31698 {
// SERVICER.agc:1537
//		TCF	HBAD
// slot 31698
                    if slot <> 31698 or instruction <> 6117 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6117, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31699 {
// SERVICER.agc:1538
//		CCS	STILBADH	# IS DATA GOOD JUST PRESENT?
// slot 31699
                        if slot <> 31699 or instruction <> 5052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 956).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1539
//		TCF	HSTILBAD	# JUST GOOD -- MUST WAIT 4 SECONDS.
// slot 31700
                        if slot <> 31700 or instruction <> 6125 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6125, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31701 {
// SERVICER.agc:1540
//
// SERVICER.agc:1541
//		INHINT
// slot 31701
                    if slot <> 31701 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31702 {
// SERVICER.agc:1542
//		EXTEND
// slot 31702
                        if slot <> 31702 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1543
//		DCA	SAMPLSUM	# GOOD RETURN -- STORE AWAY LRH DATA
// slot 31703
                        if slot <> 31703 or instruction <> 12866 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 578, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 31706 {
                if slot <= 31704 {
// SERVICER.agc:1544
//		DXCH	HMEAS		# LRH DATA 1.079 FT/BIT
// slot 31704
                    if slot <> 31704 or instruction <> 22445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 941, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31705 {
// SERVICER.agc:1545
//		EXTEND			# FOR DOWNLINK
// slot 31705
                        if slot <> 31705 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1546
//		DCA	PIPTIME1
// slot 31706
                        if slot <> 31706 or instruction <> 13169 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31707 {
// SERVICER.agc:1547
//		DXCH	MKTIME
// slot 31707
                    if slot <> 31707 or instruction <> 22509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1005, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31708 {
// SERVICER.agc:1548
//
// SERVICER.agc:1549
//		EXTEND
// slot 31708
                        if slot <> 31708 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1550
//		DCA	CDUTEMPY	# CDUY,Z = AIG,AMG
// slot 31709
                        if slot <> 31709 or instruction <> 12911 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 623, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 31715 {
            if slot <= 31712 {
                if slot <= 31710 {
// SERVICER.agc:1551
//		DXCH	AIG
// slot 31710
                    if slot <> 31710 or instruction <> 22320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31711 {
// SERVICER.agc:1552
//
// SERVICER.agc:1553
//		CA	CDUTEMPX	# CDUX = AOG
// slot 31711
                        if slot <> 31711 or instruction <> 12909 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 621).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1554
//		TS	AOG
// slot 31712
                        if slot <> 31712 or instruction <> 23345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23345, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31713 {
// SERVICER.agc:1555
//
// SERVICER.agc:1556
//		CS	FLGWRD11	# SET BIT TO INDICATE RANGE
// slot 31713
                    if slot <> 31713 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31714 {
// SERVICER.agc:1557
//		MASK	RNGEDBIT	# MEASUREMENT MADE.
// slot 31714
                        if slot <> 31714 or instruction <> 31208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            if fixedOperand = 8 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1558
//		ADS	FLGWRD11
// slot 31715
                        if slot <> 31715 or instruction <> 11335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 31718 {
                if slot <= 31716 {
// SERVICER.agc:1559
//ENDLRH		TC	ENDOFJOB	# TERMATE LRHJOB
// slot 31716
                    if slot <> 31716 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31717 {
// SERVICER.agc:1560
//
// SERVICER.agc:1561
//# Page 894
// SERVICER.agc:1562
//HBAD		CA	FLAGWRD5
// slot 31717
                        if slot <> 31717 or instruction <> 12353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1563
//		MASK	RNGSCBIT	# IS BAD RETURN DUE TO SCALE CHANGE?
// slot 31718
                        if slot <> 31718 or instruction <> 31202 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            if fixedOperand = 512 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 31719 {
// SERVICER.agc:1564
//		EXTEND
// slot 31719
                    if slot <> 31719 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31720 {
// SERVICER.agc:1565
//		BZF	HSTILBAD -1	# NO  RESET HSTILBAD
// slot 31720
                        if slot <> 31720 or instruction <> 6124 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6124, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1566
//		TC	DOWNFLAG	# YES  RESET SCALE CHANGE BIT AND IGNORE
// slot 31721
                        if slot <> 31721 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2007] to agcAotUnit2007@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1567
//		ADRES	RNGSCFLG
// slot 31722
    31722, 160
)).

// bank 34, slots 31723-31740
function agcAotUnit2008 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31731 {
        if slot <= 31726 {
            if slot <= 31724 {
                if slot <= 31723 {
// SERVICER.agc:1568
//		TC	ENDOFJOB
// slot 31723
                    if slot <> 31723 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1569
//
// SERVICER.agc:1570
//		CAF	TWO		# SET STILBAD TO WAIT 4 SECONDS
// slot 31724
                    if slot <> 31724 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31725 {
// SERVICER.agc:1571
//HSTILBAD	TS	STILBADH
// slot 31725
                    if slot <> 31725 or instruction <> 23484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23484, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1572
//		TC	ENDOFJOB
// slot 31726
                    if slot <> 31726 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31728 {
                if slot <= 31727 {
// SERVICER.agc:1573
//
// SERVICER.agc:1574
//		BANK	34
// SERVICER.agc:1575
//		SETLOC	SERV4
// SERVICER.agc:1576
//		BANK
// SERVICER.agc:1577
//
// SERVICER.agc:1578
//		COUNT*	$$/SERV
// SERVICER.agc:1579
//
// SERVICER.agc:1580
//# RDGIMS IS A TASK SET UP BY LRVJOB TO PICK UP THE IMU CDUS AND TIME
// SERVICER.agc:1581
//# AT ABOUT THE MIDPOINT OF THE LR VEL READ ROUTINE WHEN 5 VEL SAMPLES
// SERVICER.agc:1582
//# ARE SPECIFIED.
// SERVICER.agc:1583
//
// SERVICER.agc:1584
//		EBANK=	LRVTIME
// SERVICER.agc:1585
//RDGIMS		EXTEND
// slot 31727
                    if slot <> 31727 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1586
//		DCA	TIME2		# PICK UP TIME2, TIME1
// slot 31728
                    if slot <> 31728 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31729 {
// SERVICER.agc:1587
//		DXCH	LRVTIME		#	AND SAVE IN LRVTIME
// slot 31729
                    if slot <> 31729 or instruction <> 22443 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 939, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31730 {
// SERVICER.agc:1588
//
// SERVICER.agc:1589
//		EXTEND
// slot 31730
                        if slot <> 31730 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1590
//		DCA	CDUX		# PICK UP CDUX AND CDUY
// slot 31731
                        if slot <> 31731 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 27, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 31735 {
            if slot <= 31733 {
                if slot <= 31732 {
// SERVICER.agc:1591
//		DXCH	LRXCDU		#	AND SAVE IN LRXCDU AND LRYCDU
// slot 31732
                    if slot <> 31732 or instruction <> 22445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 941, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1592
//
// SERVICER.agc:1593
//		CA	CDUZ
// slot 31733
                    if slot <> 31733 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31734 {
// SERVICER.agc:1594
//		TS	LRZCDU		# SAVE CDUZ IN LRZCDU
// slot 31734
                    if slot <> 31734 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1595
//
// SERVICER.agc:1596
//		CA	PIPAX
// slot 31735
                    if slot <> 31735 or instruction <> 12319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 31).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31737 {
                if slot <= 31736 {
// SERVICER.agc:1597
//		TS	PIPTEM		# SAVE PIPAX IN PIPTEM
// slot 31736
                    if slot <> 31736 or instruction <> 23471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1598
//
// SERVICER.agc:1599
//		EXTEND
// slot 31737
                    if slot <> 31737 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31738 {
// SERVICER.agc:1600
//		DCA	PIPAY		# PICK UP PIPAY AND PIPAZ
// slot 31738
                    if slot <> 31738 or instruction <> 12321 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 33, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31739 {
// SERVICER.agc:1601
//		DXCH	PIPTEM +1	#	AND SAVE IN PIPTEM +1 AND PIPTEM +2
// slot 31739
                        if slot <> 31739 or instruction <> 22449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 945, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1602
//		TC	TASKOVER
// slot 31740
                        if slot <> 31740 or instruction <> 2737 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2008] to agcAotUnit2008@.

// bank 33, slots 30648-30648
function agcAotUnit1978 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1603
//
// SERVICER.agc:1604
//		BANK	33
// SERVICER.agc:1605
//		SETLOC	SERVICES
// SERVICER.agc:1606
//		BANK
// SERVICER.agc:1607
//
// SERVICER.agc:1608
//		COUNT*	$$/SERV
// SERVICER.agc:1609
//
// SERVICER.agc:1610
//		EBANK=	DVCNTR
// SERVICER.agc:1611
//# Page 895
// SERVICER.agc:1612
//# HIGATJOB IS SET APPROXIMATELY 6 SECONDS PRIOR TO HIGH GATE DURING
// SERVICER.agc:1613
//# THE DESCENT BURN PHASE OF LUNAR LANDING.  THIS JOB INITIATES THE
// SERVICER.agc:1614
//# LANDING RADAR REPOSITIONING ROUTINE AND GOES TO SLEEP UNTIL THE
// SERVICER.agc:1615
//# LR ANTENNA MOVES FROM POSITION 1 TO POSITION 2.  IF THE LR ANTENNA
// SERVICER.agc:1616
//# ACHIEVES POSITION 2 WITHIN 22 SECONDS THE ALTITUDE AND VELOCITY
// SERVICER.agc:1617
//# BEAM VECTORS ARE RECOMPUTED TO REFLECT THE NEW ORIENTATION WITH
// SERVICER.agc:1618
//# RESPECT TO THE NB.  BIT10 OF LRSTAT IS CLEARED TO ALLOW LR
// SERVICER.agc:1619
//# MEASUREMENTS AND THE JOB TERMINATES.
// SERVICER.agc:1620
//
// SERVICER.agc:1621
//HIGATJOB	TC	BANKCALL	# START LRPOS2 JOB
// slot 30648
    if slot <> 30648 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1978] to agcAotUnit1978@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1622
//		CADR	LRPOS2
// slot 30649
    30649, 44658
)).

// bank 33, slots 30650-30650
function agcAotUnit1979 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1623
//		TC	BANKCALL	# PUT HIGATJOB TO SLEEP UNTIL JOB IS DONE
// slot 30650
    if slot <> 30650 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1979] to agcAotUnit1979@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1624
//		CADR	RADSTALL
// slot 30651
    30651, 16280
)).

// bank 33, slots 30652-30656
function agcAotUnit1980 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30653 {
        if slot <= 30652 {
// SERVICER.agc:1625
//		TCF	POSALARM	# BAD END    ALARM
// slot 30652
            if slot <> 30652 or instruction <> 6083 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6083, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1626
//
// SERVICER.agc:1627
//POSGOOD		CA	PRIO23		# REDUCE PRIORITY FOR INTERPRETIVE COMPS.
// slot 30653
            if slot <> 30653 or instruction <> 16329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4041), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30654 {
// SERVICER.agc:1628
//		TC	PRIOCHNG
// slot 30654
            if slot <> 30654 or instruction <> 2662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30655 {
// SERVICER.agc:1629
//
// SERVICER.agc:1630
//		TC	SETPOS2		# LR IN POS2 -- SET UP TRANSFORMATIONS
// slot 30655
                if slot <> 30655 or instruction <> 2015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2015, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1631
//
// SERVICER.agc:1632
//		TC	DOWNFLAG
// slot 30656
                if slot <> 30656 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1980] to agcAotUnit1980@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1633
//		ADRES	NOLRREAD	# RESET NOLRREAD FLAG TO ENABLE LR READING
// slot 30657
    30657, 340
)).

// bank 33, slots 30658-30660
function agcAotUnit1981 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30658 {
// SERVICER.agc:1634
//		TC	ENDOFJOB
// slot 30658
        if slot <> 30658 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30659 {
// SERVICER.agc:1635
//
// SERVICER.agc:1636
//POSALARM	CA	OCT523
// slot 30659
            if slot <> 30659 or instruction <> 14288 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2000), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SERVICER.agc:1637
//		TC	BANKCALL
// slot 30660
            if slot <> 30660 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1981] to agcAotUnit1981@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1638
//		CADR	PRIOLARM	# FLASH ALARM CODE
// slot 30661
    30661, 18148
)).

// bank 33, slots 30662-30671
function agcAotUnit1982 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30666 {
        if slot <= 30663 {
            if slot <= 30662 {
// SERVICER.agc:1639
//		TCF	GOTOPOOH	# TERMINATE
// slot 30662
                if slot <> 30662 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1640
//		TCF	+3		# PROCEED -- TRY AGAIN
// slot 30663
                if slot <> 30663 or instruction <> 6090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6090, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30664 {
// SERVICER.agc:1641
//		TCF	ENDOFJOB	# V 32 E    TERMINATE R12
// slot 30664
                if slot <> 30664 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30665 {
// SERVICER.agc:1642
//		TC	ENDOFJOB
// slot 30665
                    if slot <> 30665 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1643
//
// SERVICER.agc:1644
// +3		CA	BIT7		# SEE IF IN POS2 YET
// slot 30666
                    if slot <> 30666 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30668 {
            if slot <= 30667 {
// SERVICER.agc:1645
//		EXTEND
// slot 30667
                if slot <> 30667 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1646
//		RAND	CHAN33
// slot 30668
                if slot <> 30668 or instruction <> 1051 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30669 {
// SERVICER.agc:1647
//		EXTEND
// slot 30669
                if slot <> 30669 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30670 {
// SERVICER.agc:1648
//		BZF	POSGOOD		# POS2 ACHIEVED   SET UP ANTENNA BEAMS
// slot 30670
                    if slot <> 30670 or instruction <> 6077 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1649
//		TCF	POSALARM	# STILL DIDN'T MAKE IT   REALARM
// slot 30671
                    if slot <> 30671 or instruction <> 6083 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6083, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1982] to agcAotUnit1982@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1650
//
// SERVICER.agc:1651
//OCT523		OCT	00523
// slot 30672
    30672, 678
)).

// bank 33, slots 30673-30693
function agcAotUnit1983 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30682 {
        if slot <= 30677 {
            if slot <= 30674 {
                if slot <= 30673 {
// SERVICER.agc:1652
//
// SERVICER.agc:1653
//
// SERVICER.agc:1654
//
// SERVICER.agc:1655
//SETPOS1		TC	MAKECADR	# MUST BE CALLED BY BANKCALL
// slot 30673
                    if slot <> 30673 or instruction <> 2469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1656
//		TS	LRADRET1	# SAVE RETURN CADR.  SINCE BUP2 CLOBBERED
// slot 30674
                    if slot <> 30674 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30675 {
// SERVICER.agc:1657
//
// SERVICER.agc:1658
//		CAF	TWO
// slot 30675
                    if slot <> 30675 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30676 {
// SERVICER.agc:1659
//		TS	STILBADH	# INITIALIZE STILBAD
// slot 30676
                        if slot <> 30676 or instruction <> 23484 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23484, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1660
//		TS	STILBADV	# INITIALIZE STILBAD
// slot 30677
                        if slot <> 30677 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30679 {
                if slot <= 30678 {
// SERVICER.agc:1661
//
// SERVICER.agc:1662
//		CA	ZERO		# INDEX FOR LRALPHA, LRBETA IN POS 1.
// slot 30678
                    if slot <> 30678 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1663
//# Page 896
// SERVICER.agc:1664
//		TS	LRLCTR		# SET L,M,R, ANS S TO ZERO
// slot 30679
                    if slot <> 30679 or instruction <> 23480 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23480, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30680 {
// SERVICER.agc:1665
//		TS	LRMCTR
// slot 30680
                    if slot <> 30680 or instruction <> 23482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30681 {
// SERVICER.agc:1666
//		TS	LRRCTR
// slot 30681
                        if slot <> 30681 or instruction <> 23481 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23481, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1667
//		TS	LRSCTR
// slot 30682
                        if slot <> 30682 or instruction <> 23483 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23483, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30687 {
            if slot <= 30684 {
                if slot <= 30683 {
// SERVICER.agc:1668
//		TS	VSELECT		# INITIALIZE VSELECT
// slot 30683
                    if slot <> 30683 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SERVICER.agc:1669
//
// SERVICER.agc:1670
//		TC	SETPOS		# CONTINUE WITH COMPUTATIONS.
// slot 30684
                    if slot <> 30684 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30685 {
// SERVICER.agc:1671
//
// SERVICER.agc:1672
//		CA	LRADRET1
// slot 30685
                    if slot <> 30685 or instruction <> 13230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 942).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30686 {
// SERVICER.agc:1673
//		TC	BANKJUMP	# RETURN TO CALLER
// slot 30686
                        if slot <> 30686 or instruction <> 2464 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2464, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1674
//
// SERVICER.agc:1675
//SETPOS2		CA	TWO		# INDEX FOR POS2
// slot 30687
                        if slot <> 30687 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30690 {
                if slot <= 30688 {
// SERVICER.agc:1676
//SETPOS		XCH	Q		# SAVE INDEX IN Q
// slot 30688
                    if slot <> 30688 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30689 {
// SERVICER.agc:1677
//		TS	LRADRET		# SAVE RETURN
// slot 30689
                        if slot <> 30689 or instruction <> 23464 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23464, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1678
//
// SERVICER.agc:1679
//		CA	EBANK5
// slot 30690
                        if slot <> 30690 or instruction <> 14860 { return choose false if checkOnly else -1. }
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
                if slot <= 30691 {
// SERVICER.agc:1680
//		TS	EBANK
// slot 30691
                    if slot <> 30691 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30692 {
// SERVICER.agc:1681
//		EBANK=	LRALPHA
// SERVICER.agc:1682
//
// SERVICER.agc:1683
//		EXTEND
// slot 30692
                        if slot <> 30692 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SERVICER.agc:1684
//		INDEX	Q
// slot 30693
                        if slot <> 30693 or instruction <> 20482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20482, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1983] to agcAotUnit1983@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1685
//		DCA	LRALPHA		# LRALPHA IN A, LRBETA IN L
// slot 30694
    30694, 26278
)).

// bank 33, slots 30695-30701
function agcAotUnit1984 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30697 {
        if slot <= 30695 {
// SERVICER.agc:1686
//		TS	CDUSPOT +4	# ROTATION ABOUT X
// slot 30695
            if slot <> 30695 or instruction <> 23034 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23034, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30696 {
// SERVICER.agc:1687
//		LXCH	CDUSPOT		# ROTATION ABOUT Y
// slot 30696
                if slot <> 30696 or instruction <> 9718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 502, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1688
//		CA	ZERO
// slot 30697
                if slot <> 30697 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        if slot <= 30699 {
            if slot <= 30698 {
// SERVICER.agc:1689
//		TS	CDUSPOT +2	# ZERO ROTATION ABOUT Z.
// slot 30698
                if slot <> 30698 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1690
//
// SERVICER.agc:1691
//		CA	EBANK7
// slot 30699
                if slot <> 30699 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
            if slot <= 30700 {
// SERVICER.agc:1692
//		TS	EBANK
// slot 30700
                if slot <> 30700 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SERVICER.agc:1693
//		EBANK=	LRADRET
// SERVICER.agc:1694
//
// SERVICER.agc:1695
//		TC	INTPRET
// slot 30701
                if slot <> 30701 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1984] to agcAotUnit1984@.

agcAotInstallSourceRope(list(
// SERVICER.agc:1696
//		VLOAD	CALL
// slot 30702
    30702, 38138,
// SERVICER.agc:1697
//			UNITY		# CONVERT UNITY(ANTENNA) TO NB
// slot 30703
    30703, 6812,
// SERVICER.agc:1698
//			TRG*SMNB
// slot 30704
    30704, 40786,
// SERVICER.agc:1699
//		STOVL	VYBEAMNB
// slot 30705
    30705, 22846,
// SERVICER.agc:1700
//			UNITX		# CONVERT UNITX(ANTENNA) TO NB
// slot 30706
    30706, 6816,
// SERVICER.agc:1701
//		CALL
// slot 30707
    30707, 65320,
// SERVICER.agc:1702
//			*SMNB*
// slot 30708
    30708, 40818,
// SERVICER.agc:1703
//		STORE	VXBEAMNB
// slot 30709
    30709, 2378,
// SERVICER.agc:1704
//		VXV	VSL1
// slot 30710
    30710, 64058,
// SERVICER.agc:1705
//			VYBEAMNB
// slot 30711
    30711, 2366,
// SERVICER.agc:1706
//		STOVL	VZBEAMNB	# Z = X * Y
// slot 30712
    30712, 22834,
// SERVICER.agc:1707
//			HBEAMANT
// slot 30713
    30713, 22534,
// SERVICER.agc:1708
//		CALL
// slot 30714
    30714, 65320,
// SERVICER.agc:1709
//			*SMNB*		# CONVERT TO NB
// slot 30715
    30715, 40818,
// SERVICER.agc:1710
//		STORE	HBEAMNB
// slot 30716
    30716, 2422,
// SERVICER.agc:1711
//		EXIT
// slot 30717
    30717, 65532
)).

// bank 33, slots 30718-30718
function agcAotUnit1985 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SERVICER.agc:1712
//
// SERVICER.agc:1713
//# Page 897
// SERVICER.agc:1714
//		TC	LRADRET
// slot 30718
    if slot <> 30718 or instruction <> 936 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 936, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1985] to agcAotUnit1985@.

// no code for the lines below
// SERVICER.agc:1715
//
