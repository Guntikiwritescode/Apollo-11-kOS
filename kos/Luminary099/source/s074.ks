// PORT: Original source unit SERVICER.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 34568–34571.
function agcAotUnit2281 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34569 {
        if slot <= 34568 {
// PORT: SOURCE SERVICER.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE SERVICER.agc:2
//# Filename:	SERVICER.agc
// PORT: SOURCE SERVICER.agc:3
//# Purpose:	Part of the source code for Luminary, build 099. It
// PORT: SOURCE SERVICER.agc:4
//#		is part of the source code for the Lunar Module's
// PORT: SOURCE SERVICER.agc:5
//#		(LM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE SERVICER.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE SERVICER.agc:7
//# Reference:	pp. 857-897
// PORT: SOURCE SERVICER.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE SERVICER.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE SERVICER.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE SERVICER.agc:11
//# Mod history:	2009-06-01 FB	Transcription Batch 4 Assignment.
// PORT: SOURCE SERVICER.agc:12
//#		2009-06-05 RSB	Fixed a couple of typos, plus a goofy relative
// PORT: SOURCE SERVICER.agc:13
//#				label reference from the original source.
// PORT: SOURCE SERVICER.agc:14
//#
// PORT: SOURCE SERVICER.agc:15
//# The contents of the "Luminary099" files, in general, are transcribed
// PORT: SOURCE SERVICER.agc:16
//# from scanned documents.
// PORT: SOURCE SERVICER.agc:17
//#
// PORT: SOURCE SERVICER.agc:18
//#	Assemble revision 001 of AGC program Luminary099 by NASA
// PORT: SOURCE SERVICER.agc:19
//#	2021112-061.  July 14, 1969.
// PORT: SOURCE SERVICER.agc:20
//#
// PORT: SOURCE SERVICER.agc:21
//#	Prepared by
// PORT: SOURCE SERVICER.agc:22
//#			Massachusetts Institute of Technology
// PORT: SOURCE SERVICER.agc:23
//#			75 Cambridge Parkway
// PORT: SOURCE SERVICER.agc:24
//#			Cambridge, Massachusetts
// PORT: SOURCE SERVICER.agc:25
//#
// PORT: SOURCE SERVICER.agc:26
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE SERVICER.agc:27
//#
// PORT: SOURCE SERVICER.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE SERVICER.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE SERVICER.agc:30
//
// PORT: SOURCE SERVICER.agc:31
//# Page 857
// PORT: SOURCE SERVICER.agc:32
//		BANK	37
// PORT: SOURCE SERVICER.agc:33
//		SETLOC	SERV1
// PORT: SOURCE SERVICER.agc:34
//		BANK
// PORT: SOURCE SERVICER.agc:35
//
// PORT: SOURCE SERVICER.agc:36
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:37
//
// PORT: SOURCE SERVICER.agc:38
//# ************* PREREAD *******************
// PORT: SOURCE SERVICER.agc:39
//
// PORT: SOURCE SERVICER.agc:40
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:41
//
// PORT: SOURCE SERVICER.agc:42
//PREREAD		CAF	SEVEN		# 5.7 SPOT TO SKIP LASTBIAS AFTER
// PORT: Fixed ROM slots 34568.
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
// PORT: SOURCE SERVICER.agc:43
//		TC	GNUFAZE5	# RESTART.
// PORT: Fixed ROM slots 34569.
            if slot <> 34569 or instruction <> 1881 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1881, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34570 {
// PORT: SOURCE SERVICER.agc:44
//		CAF	PRIO21
// PORT: Fixed ROM slots 34570.
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
// PORT: SOURCE SERVICER.agc:45
//		TC	NOVAC
// PORT: Fixed ROM slots 34571.
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
// PORT: SOURCE SERVICER.agc:46
//		EBANK=	NBDX
// PORT: SOURCE SERVICER.agc:47
//		2CADR	LASTBIAS	# DO LAST GYRO COMPENSATION IN FREE FALL
// PORT: Fixed ROM slots 34572 34573.
    34572, 3942, 34573, 12390
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34574–34586.
function agcAotUnit2282 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34579 {
        if slot <= 34576 {
            if slot <= 34574 {
// PORT: SOURCE SERVICER.agc:48
//
// PORT: SOURCE SERVICER.agc:49
//BIBIBIAS	TC	PIPASR +3	# CLEAR + READ PIPS LAST TIME IN FRE5+F133
// PORT: Fixed ROM slots 34574.
                if slot <> 34574 or instruction <> 1892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1892, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34575 {
// PORT: SOURCE SERVICER.agc:50
//					# DO NOT DESTROY VALUE OF PIPTIME1
// PORT: SOURCE SERVICER.agc:51
//
// PORT: SOURCE SERVICER.agc:52
//		CS	FLAGWRD7
// PORT: Fixed ROM slots 34575.
                    if slot <> 34575 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:53
//		MASK	SUPER011	# SET V37FLAG AND AVEGFLAG (BITS 5 AND 6
// PORT: Fixed ROM slots 34576.
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
// PORT: SOURCE SERVICER.agc:54
//		ADS	FLAGWRD7	# 	OF FLAGWRD7)
// PORT: Fixed ROM slots 34577.
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
// PORT: SOURCE SERVICER.agc:55
//
// PORT: SOURCE SERVICER.agc:56
//		CS	DRFTBIT
// PORT: Fixed ROM slots 34578.
                    if slot <> 34578 or instruction <> 18909 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:57
//		MASK	FLAGWRD2	# RESET DRIFTFLAG
// PORT: Fixed ROM slots 34579.
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
// PORT: SOURCE SERVICER.agc:58
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 34580.
                if slot <> 34580 or instruction <> 22590 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22590, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34581 {
// PORT: SOURCE SERVICER.agc:59
//
// PORT: SOURCE SERVICER.agc:60
//		CAF	FOUR		# INITIALIZE DV MONITOR
// PORT: Fixed ROM slots 34581.
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
// PORT: SOURCE SERVICER.agc:61
//		TS	PIPAGE
// PORT: Fixed ROM slots 34582.
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
// PORT: SOURCE SERVICER.agc:62
//
// PORT: SOURCE SERVICER.agc:63
//		CAF	ENDJBCAD	# POINT OUTROUTE TO END-OF-JOB.
// PORT: Fixed ROM slots 34583.
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
// PORT: SOURCE SERVICER.agc:64
//		TS	OUTROUTE
// PORT: Fixed ROM slots 34584.
                    if slot <> 34584 or instruction <> 23216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23216, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34585 {
// PORT: SOURCE SERVICER.agc:65
//
// PORT: SOURCE SERVICER.agc:66
//		CAF	PRIO22
// PORT: Fixed ROM slots 34585.
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
// PORT: SOURCE SERVICER.agc:67
//		TC	FINDVAC		# TO FIRST ENTRY TO AVERAGE G
// PORT: Fixed ROM slots 34586.
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
// PORT: SOURCE SERVICER.agc:68
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:69
//		2CADR	NORMLIZE
// PORT: Fixed ROM slots 34587 34588.
    34587, 2658, 34588, 39022
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34589–34606.
function agcAotUnit2283 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34597 {
        if slot <= 34592 {
            if slot <= 34590 {
                if slot <= 34589 {
// PORT: SOURCE SERVICER.agc:70
//
// PORT: SOURCE SERVICER.agc:71
//		CA	TWO		# 5.2SPOT FOR REREADAC AND NORMLIZE
// PORT: Fixed ROM slots 34589.
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
// PORT: SOURCE SERVICER.agc:72
//GOREADAX	TC	GNUTFAZ5
// PORT: Fixed ROM slots 34590.
                    if slot <> 34590 or instruction <> 1877 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1877, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34591 {
// PORT: SOURCE SERVICER.agc:73
//		CA	2SECS		# WAIT TWO SECONDS FOR READACCS
// PORT: Fixed ROM slots 34591.
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
// PORT: SOURCE SERVICER.agc:74
//		TC	VARDELAY
// PORT: Fixed ROM slots 34592.
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
// PORT: SOURCE SERVICER.agc:75
//
// PORT: SOURCE SERVICER.agc:76
//# Page 858
// PORT: SOURCE SERVICER.agc:77
//# ************* READACCS ****************
// PORT: SOURCE SERVICER.agc:78
//
// PORT: SOURCE SERVICER.agc:79
//READACCS	CS	OCT37771	# THIS PIECE OF CODING ATTEMPTS TO
// PORT: Fixed ROM slots 34593.
                    if slot <> 34593 or instruction <> 18272 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1888), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:80
//		AD	TIME5		# SYNCHRONIZE READACCS WITH THE DIGITAL
// PORT: Fixed ROM slots 34594.
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
// PORT: SOURCE SERVICER.agc:81
//		CCS	A		# AUTOPILOT SO THAT A PAXIS RUPT WILL
// PORT: Fixed ROM slots 34595.
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
// PORT: SOURCE SERVICER.agc:82
//		CS	ONE		# OCCUR APPROXIMATELY 70 MILLISECONDS
// PORT: Fixed ROM slots 34596.
                        if slot <> 34596 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:83
//		TCF	+2		# FOLLOWING THE READACCS RUPT.  THE 70 MS
// PORT: Fixed ROM slots 34597.
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
// PORT: SOURCE SERVICER.agc:84
//		CA	ONE		# OFFSET WAS CHOSEN SO THAT THE PAXIS
// PORT: Fixed ROM slots 34598.
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
// PORT: SOURCE SERVICER.agc:85
// +2		ADS	TIME5		# RUPT WOULD NOT OCCUR SIMULTANEOUSLY
// PORT: Fixed ROM slots 34599.
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
// PORT: SOURCE SERVICER.agc:86
// 					# WITH ANY OF THE 8 SUBSEQUENT R10,R11
// PORT: SOURCE SERVICER.agc:87
//					# INTERRUPTS -- THUS MINIMIZING THE POSS-
// PORT: SOURCE SERVICER.agc:88
//					# IBILITY OF LOSING DOWNRUPTS.
// PORT: SOURCE SERVICER.agc:89
//
// PORT: SOURCE SERVICER.agc:90
//		TC	PIPASR		# READ THE PIPAS.
// PORT: Fixed ROM slots 34600.
                    if slot <> 34600 or instruction <> 1889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1889, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:91
//
// PORT: SOURCE SERVICER.agc:92
//PIPSDONE	CA	FIVE
// PORT: Fixed ROM slots 34601.
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
// PORT: SOURCE SERVICER.agc:93
//		TC	GNUFAZE5
// PORT: Fixed ROM slots 34602.
                    if slot <> 34602 or instruction <> 1881 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1881, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:94
//REDO5.5		CAF	ONE
// PORT: Fixed ROM slots 34603.
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
// PORT: SOURCE SERVICER.agc:95
//		TS	PIPAGE
// PORT: Fixed ROM slots 34604.
                    if slot <> 34604 or instruction <> 23215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23215, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34605 {
// PORT: SOURCE SERVICER.agc:96
//
// PORT: SOURCE SERVICER.agc:97
//		CA	PRIO20
// PORT: Fixed ROM slots 34605.
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
// PORT: SOURCE SERVICER.agc:98
//		TC	FINDVAC
// PORT: Fixed ROM slots 34606.
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
// PORT: SOURCE SERVICER.agc:99
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:100
//		2CADR	SERVICER	# SET UP SERVICER JOB
// PORT: Fixed ROM slots 34607 34608.
    34607, 2316, 34608, 55406
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34609–34634.
function agcAotUnit2284 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34621 {
        if slot <= 34614 {
            if slot <= 34611 {
                if slot <= 34609 {
// PORT: SOURCE SERVICER.agc:101
//
// PORT: SOURCE SERVICER.agc:102
//		CA	BIT9
// PORT: Fixed ROM slots 34609.
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
// PORT: SOURCE SERVICER.agc:103
//		EXTEND
// PORT: Fixed ROM slots 34610.
                        if slot <> 34610 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:104
//		WOR	DSALMOUT	# TURN ON TEST CONNECTOR OUTBIT
// PORT: Fixed ROM slots 34611.
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
// PORT: SOURCE SERVICER.agc:105
//
// PORT: SOURCE SERVICER.agc:106
//		CA	FLAGWRD7
// PORT: Fixed ROM slots 34612.
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
// PORT: SOURCE SERVICER.agc:107
//		MASK	AVEGFBIT
// PORT: Fixed ROM slots 34613.
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
// PORT: SOURCE SERVICER.agc:108
//		EXTEND
// PORT: Fixed ROM slots 34614.
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
// PORT: SOURCE SERVICER.agc:109
//		BZF	AVEGOUT		# AVEGFLAG DOWN -- SET UP FINAL EXIT
// PORT: Fixed ROM slots 34615.
                    if slot <> 34615 or instruction <> 5967 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5967, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34616 {
// PORT: SOURCE SERVICER.agc:110
//
// PORT: SOURCE SERVICER.agc:111
//		CA	FLAGWRD6
// PORT: Fixed ROM slots 34616.
                        if slot <> 34616 or instruction <> 12354 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:112
//		MASK	MUNFLBIT
// PORT: Fixed ROM slots 34617.
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
// PORT: SOURCE SERVICER.agc:113
//		EXTEND
// PORT: Fixed ROM slots 34618.
                        if slot <> 34618 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:114
//		BZF	MAKEACCS	# MUNFLAG CLEAR -- BYPASS LR AND DISP.
// PORT: Fixed ROM slots 34619.
                        if slot <> 34619 or instruction <> 5965 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5965, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 34620 {
// PORT: SOURCE SERVICER.agc:115
//
// PORT: SOURCE SERVICER.agc:116
//		CCS	PHASE2
// PORT: Fixed ROM slots 34620.
                        if slot <> 34620 or instruction <> 4589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 493).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:117
//		TCF	MAKEACCS	# PHASE 2 ACTIVATED -- AVOID MULTIPLE R10.
// PORT: Fixed ROM slots 34621.
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
// PORT: SOURCE SERVICER.agc:118
//
// PORT: SOURCE SERVICER.agc:119
//		CAF	SEVEN		# SET PIPCTR FOR 4X/SEC RATE.
// PORT: Fixed ROM slots 34622.
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
// PORT: SOURCE SERVICER.agc:120
//		TS	PIPCTR
// PORT: Fixed ROM slots 34623.
                        if slot <> 34623 or instruction <> 23086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:121
//
// PORT: SOURCE SERVICER.agc:122
//		CS	TIME1		# SET TBASE2 .05 SECONDS IN THE PAST.
// PORT: Fixed ROM slots 34624.
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
// PORT: SOURCE SERVICER.agc:123
//		AD	FIVE
// PORT: Fixed ROM slots 34625.
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
// PORT: SOURCE SERVICER.agc:124
//		AD	NEG1/2
// PORT: Fixed ROM slots 34626.
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
// PORT: SOURCE SERVICER.agc:125
//		AD	NEG1/2
// PORT: Fixed ROM slots 34627.
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
// PORT: SOURCE SERVICER.agc:126
//		XCH	TBASE2
// PORT: Fixed ROM slots 34628.
                    if slot <> 34628 or instruction <> 24109 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 557, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34629 {
// PORT: SOURCE SERVICER.agc:127
//# Page 859
// PORT: SOURCE SERVICER.agc:128
//		CAF	DEC17		# 2.21SPOT FOR R10,R11
// PORT: Fixed ROM slots 34629.
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
// PORT: SOURCE SERVICER.agc:129
//		TS	L
// PORT: Fixed ROM slots 34630.
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
// PORT: SOURCE SERVICER.agc:130
//		COM
// PORT: Fixed ROM slots 34631.
                        if slot <> 34631 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:131
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 34632.
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
// PORT: SOURCE SERVICER.agc:132
//
// PORT: SOURCE SERVICER.agc:133
//		CAF	OCT24		# FIRST R10,R11 IN .200 SECONDS
// PORT: Fixed ROM slots 34633.
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
// PORT: SOURCE SERVICER.agc:134
//		TC	WAITLIST
// PORT: Fixed ROM slots 34634.
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
// PORT: SOURCE SERVICER.agc:135
//		EBANK=	UNIT/R/
// PORT: SOURCE SERVICER.agc:136
//		2CADR	R10,R11
// PORT: Fixed ROM slots 34635 34636.
    34635, 2060, 34636, 34926
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34637–34652.
function agcAotUnit2285 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34644 {
        if slot <= 34640 {
            if slot <= 34638 {
                if slot <= 34637 {
// PORT: SOURCE SERVICER.agc:137
//
// PORT: SOURCE SERVICER.agc:138
//MAKEACCS	CA	FOUR
// PORT: Fixed ROM slots 34637.
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
// PORT: SOURCE SERVICER.agc:139
//		TCF	GOREADAX	# DO PHASE CHANGE AND RECALL READACCS
// PORT: Fixed ROM slots 34638.
                    if slot <> 34638 or instruction <> 5918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34639 {
// PORT: SOURCE SERVICER.agc:140
//
// PORT: SOURCE SERVICER.agc:141
//AVEGOUT		EXTEND
// PORT: Fixed ROM slots 34639.
                    if slot <> 34639 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:142
//		DCA	AVOUTCAD	# SET UP FINAL SERVICER EXIT
// PORT: Fixed ROM slots 34640.
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
// PORT: SOURCE SERVICER.agc:143
//		DXCH	AVGEXIT
// PORT: Fixed ROM slots 34641.
                    if slot <> 34641 or instruction <> 22187 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:144
//
// PORT: SOURCE SERVICER.agc:145
//		CA	FOUR		# SET 5.4 SPOT FOR REREADAC AND SERVICER
// PORT: Fixed ROM slots 34642.
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
// PORT: SOURCE SERVICER.agc:146
//		TC	GNUTFAZ5	# IF REREADAC IS CALLED, IT WILL EXIT
// PORT: Fixed ROM slots 34643.
                    if slot <> 34643 or instruction <> 1877 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1877, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:147
//		TC	TASKOVER	# END TASK WITHOUT CALLING READACCS
// PORT: Fixed ROM slots 34644.
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
// PORT: SOURCE SERVICER.agc:148
//
// PORT: SOURCE SERVICER.agc:149
//GNUTFAZ5	TS	L		# SAVE INPUT IN L
// PORT: Fixed ROM slots 34645.
                    if slot <> 34645 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:150
//		CS	TIME1
// PORT: Fixed ROM slots 34646.
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
// PORT: SOURCE SERVICER.agc:151
//		TS	TBASE5		# SET TBASE5
// PORT: Fixed ROM slots 34647.
                    if slot <> 34647 or instruction <> 23091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23091, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:152
//		TCF	+2
// PORT: Fixed ROM slots 34648.
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
// PORT: SOURCE SERVICER.agc:153
//
// PORT: SOURCE SERVICER.agc:154
//GNUFAZE5	TS	L		# SAVE INPUT IN L
// PORT: Fixed ROM slots 34649.
                    if slot <> 34649 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:155
//		CS	L		# -PHASE IN A, PHASE IN L.
// PORT: Fixed ROM slots 34650.
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
// PORT: SOURCE SERVICER.agc:156
//		DXCH	-PHASE5		# SET -PHASE5,PHASE5
// PORT: Fixed ROM slots 34651.
                    if slot <> 34651 or instruction <> 22003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:157
//		TC	Q
// PORT: Fixed ROM slots 34652.
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
// PORT: SOURCE SERVICER.agc:158
//
// PORT: SOURCE SERVICER.agc:159
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:160
//AVOUTCAD	2CADR	AVGEND
// PORT: Fixed ROM slots 34653 34654.
    34653, 3938, 34654, 36974,
// PORT: SOURCE SERVICER.agc:161
//
// PORT: SOURCE SERVICER.agc:162
//ENDJBCAD	CADR	SERVEXIT +2
// PORT: Fixed ROM slots 34655.
    34655, 55284,
// PORT: SOURCE SERVICER.agc:163
//
// PORT: SOURCE SERVICER.agc:164
//OCT37771	OCT	37771
// PORT: Fixed ROM slots 34656.
    34656, 32754
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29830–29830.
function agcAotUnit1918 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:165
//
// PORT: SOURCE SERVICER.agc:166
//		BANK	33
// PORT: SOURCE SERVICER.agc:167
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER.agc:168
//		BANK
// PORT: SOURCE SERVICER.agc:169
//
// PORT: SOURCE SERVICER.agc:170
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:171
//
// PORT: SOURCE SERVICER.agc:172
//# Page 860
// PORT: SOURCE SERVICER.agc:173
//# ************* SERVICER ****************
// PORT: SOURCE SERVICER.agc:174
//
// PORT: SOURCE SERVICER.agc:175
//SERVICER	TC	PHASCHNG	# RESTART REREADAC + SERVICER
// PORT: Fixed ROM slots 29830.
    if slot <> 29830 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1918] to agcAotUnit1918@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:176
//		OCT	16035
// PORT: Fixed ROM slots 29831.
    29831, 14394,
// PORT: SOURCE SERVICER.agc:177
//		OCT	20000
// PORT: Fixed ROM slots 29832.
    29832, 16384,
// PORT: SOURCE SERVICER.agc:178
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:179
//		2CADR	GETABVAL
// PORT: Fixed ROM slots 29833 29834.
    29833, 2334, 29834, 55406
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29835–29837.
function agcAotUnit1919 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29835 {
// PORT: SOURCE SERVICER.agc:180
//
// PORT: SOURCE SERVICER.agc:181
//		CAF	PRIO31		# INITIALIZE 1/PIPADT IN CASE RESTART HAS
// PORT: Fixed ROM slots 29835.
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
// PORT: SOURCE SERVICER.agc:182
//		TS	1/PIPADT	# CAUSED LASTBIAS TO BE SKIPPED.
// PORT: Fixed ROM slots 29836.
            if slot <> 29836 or instruction <> 23101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23101, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:183
//
// PORT: SOURCE SERVICER.agc:184
//		TC	BANKCALL	# PIPA COMPENSATION CALL
// PORT: Fixed ROM slots 29837.
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
// PORT: SOURCE SERVICER.agc:185
//		CADR	1/PIPA
// PORT: Fixed ROM slots 29838.
    29838, 13670
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29839–29839.
function agcAotUnit1920 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:186
//
// PORT: SOURCE SERVICER.agc:187
//GETABVAL	TC	INTPRET
// PORT: Fixed ROM slots 29839.
    if slot <> 29839 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1920] to agcAotUnit1920@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:188
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 29840.
    29840, 42746,
// PORT: SOURCE SERVICER.agc:189
//			DELV
// PORT: Fixed ROM slots 29841.
    29841, 426,
// PORT: SOURCE SERVICER.agc:190
//		EXIT
// PORT: Fixed ROM slots 29842.
    29842, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29843–29873.
function agcAotUnit1921 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29857 {
        if slot <= 29849 {
            if slot <= 29845 {
                if slot <= 29843 {
// PORT: SOURCE SERVICER.agc:191
//		CA	MPAC
// PORT: Fixed ROM slots 29843.
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
// PORT: SOURCE SERVICER.agc:192
//		TS	ABDELV		# ABDELV = CM/SEC*2(-14).
// PORT: Fixed ROM slots 29844.
                        if slot <> 29844 or instruction <> 23206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23206, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:193
//		EXTEND
// PORT: Fixed ROM slots 29845.
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
// PORT: SOURCE SERVICER.agc:194
//		MP	KPIP
// PORT: Fixed ROM slots 29846.
                        if slot <> 29846 or instruction <> 29712 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1040, readEffective:call(words, 1040)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:195
//		DXCH	ABDVCONV	# ABDVCONV = M/CS * 2(-5).
// PORT: Fixed ROM slots 29847.
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
// PORT: SOURCE SERVICER.agc:196
//		EXTEND
// PORT: Fixed ROM slots 29848.
                        if slot <> 29848 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:197
//		DCA	MASS
// PORT: Fixed ROM slots 29849.
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
// PORT: SOURCE SERVICER.agc:198
//		DXCH	MASS1		# INITIALIZE MASS1 IN CASE WE SKIP MASSMON
// PORT: Fixed ROM slots 29850.
                        if slot <> 29850 or instruction <> 22393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 889, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:199
//MASSMON		CS	FLAGWRD8	# ARE WE ON THE SURFACE?
// PORT: Fixed ROM slots 29851.
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
// PORT: SOURCE SERVICER.agc:200
//		MASK	SURFFBIT
// PORT: Fixed ROM slots 29852.
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
// PORT: SOURCE SERVICER.agc:201
//		EXTEND
// PORT: Fixed ROM slots 29853.
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
// PORT: SOURCE SERVICER.agc:202
//		BZF	MOONSPOT	# YES:  BYPASS MASS MESS
// PORT: Fixed ROM slots 29854.
                        if slot <> 29854 or instruction <> 5292 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:203
//
// PORT: SOURCE SERVICER.agc:204
//		CA	FLGWRD10	# NO:  WHICH VEX SHOULD BE USED?
// PORT: Fixed ROM slots 29855.
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
// PORT: SOURCE SERVICER.agc:205
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 29856.
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
// PORT: SOURCE SERVICER.agc:206
//		CCS	A
// PORT: Fixed ROM slots 29857.
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
// PORT: SOURCE SERVICER.agc:207
//		EXTEND			# IF EXTEND IS EXECUTED, APSVEX --> A,
// PORT: Fixed ROM slots 29858.
                        if slot <> 29858 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:208
//		DCA	APSVEX		# 	OTHERWISE DPSVEX --> A
// PORT: Fixed ROM slots 29859.
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
// PORT: SOURCE SERVICER.agc:209
//		TS	Q
// PORT: Fixed ROM slots 29860.
                        if slot <> 29860 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:210
//
// PORT: SOURCE SERVICER.agc:211
//		EXTEND
// PORT: Fixed ROM slots 29861.
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
// PORT: SOURCE SERVICER.agc:212
//		DCA	ABDVCONV
// PORT: Fixed ROM slots 29862.
                        if slot <> 29862 or instruction <> 13132 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 844, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:213
//		EXTEND
// PORT: Fixed ROM slots 29863.
                        if slot <> 29863 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 29864 {
// PORT: SOURCE SERVICER.agc:214
//OCT10002	DV	Q		# WHERE APPROPRIATE VEX RESIDES
// PORT: Fixed ROM slots 29864.
                        if slot <> 29864 or instruction <> 4098 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 2, words[2]).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:215
//		EXTEND
// PORT: Fixed ROM slots 29865.
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
// PORT: SOURCE SERVICER.agc:216
//		MP	MASS
// PORT: Fixed ROM slots 29866.
                        if slot <> 29866 or instruction <> 29348 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 676, readEffective:call(words, 676)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:217
//		DAS	MASS1
// PORT: Fixed ROM slots 29867.
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
// PORT: SOURCE SERVICER.agc:218
//
// PORT: SOURCE SERVICER.agc:219
//MOONSPOT	CA	KPIP1		# TP MPAC = ABDELV AT 2(14) CM/SEC
// PORT: Fixed ROM slots 29868.
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
// PORT: SOURCE SERVICER.agc:220
//		TC	SHORTMP		# MULTIPLY BY KPIP1 TO GET
// PORT: Fixed ROM slots 29869.
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
// PORT: SOURCE SERVICER.agc:221
//# Page 861
// PORT: SOURCE SERVICER.agc:222
//		DXCH	MPAC		# ABDELV AT 2(7) M/CS
// PORT: Fixed ROM slots 29870.
                        if slot <> 29870 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:223
//		DAS	DVTOTAL		# UPDATE DVTOTAL FOR DISPLAY
// PORT: Fixed ROM slots 29871.
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
// PORT: SOURCE SERVICER.agc:224
//
// PORT: SOURCE SERVICER.agc:225
//		TC	TMPTOSPT
// PORT: Fixed ROM slots 29872.
                        if slot <> 29872 or instruction <> 1312 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1312, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:226
//
// PORT: SOURCE SERVICER.agc:227
//		TC	BANKCALL
// PORT: Fixed ROM slots 29873.
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
// PORT: SOURCE SERVICER.agc:228
//		CADR	QUICTRIG
// PORT: Fixed ROM slots 29874.
    29874, 40730
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29875–29876.
function agcAotUnit1922 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29875 {
// PORT: SOURCE SERVICER.agc:229
//
// PORT: SOURCE SERVICER.agc:230
//		CAF	XNBPIPAD
// PORT: Fixed ROM slots 29875.
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
// PORT: SOURCE SERVICER.agc:231
//		TC	BANKCALL
// PORT: Fixed ROM slots 29876.
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
// PORT: SOURCE SERVICER.agc:232
//		CADR	FLESHPOT
// PORT: Fixed ROM slots 29877.
    29877, 16446
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29878–29878.
function agcAotUnit1923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:233
//		TC	INTPRET
// PORT: Fixed ROM slots 29878.
    if slot <> 29878 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1923] to agcAotUnit1923@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:234
//AVERAGEG	BON	CALL
// PORT: Fixed ROM slots 29879.
    29879, 37912,
// PORT: SOURCE SERVICER.agc:235
//			MUNFLAG
// PORT: Fixed ROM slots 29880.
    29880, 3470,
// PORT: SOURCE SERVICER.agc:236
//			RVBOTH
// PORT: Fixed ROM slots 29881.
    29881, 56372,
// PORT: SOURCE SERVICER.agc:237
//			CALCRVG
// PORT: Fixed ROM slots 29882.
    29882, 56316,
// PORT: SOURCE SERVICER.agc:238
//		EXIT
// PORT: Fixed ROM slots 29883.
    29883, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29884–29935.
function agcAotUnit1924 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29909 {
        if slot <= 29896 {
            if slot <= 29889 {
                if slot <= 29886 {
                    if slot <= 29884 {
// PORT: SOURCE SERVICER.agc:239
//GOSERV		TC	QUIKFAZ5
// PORT: Fixed ROM slots 29884.
                        if slot <> 29884 or instruction <> 1898 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1898, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29885 {
// PORT: SOURCE SERVICER.agc:240
//
// PORT: SOURCE SERVICER.agc:241
//COPYCYCL	TC	COPYCYC
// PORT: Fixed ROM slots 29885.
                            if slot <> 29885 or instruction <> 1299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1299, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:242
//
// PORT: SOURCE SERVICER.agc:243
//#		CA	ZERO		# A IS ZERO ON RETURN FROM COPYCYC
// PORT: SOURCE SERVICER.agc:244
//		TS	PIPATMPX
// PORT: Fixed ROM slots 29886.
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
// PORT: SOURCE SERVICER.agc:245
//		TS	PIPATMPY
// PORT: Fixed ROM slots 29887.
                        if slot <> 29887 or instruction <> 23153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23153, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29888 {
// PORT: SOURCE SERVICER.agc:246
//		TS	PIPATMPZ
// PORT: Fixed ROM slots 29888.
                            if slot <> 29888 or instruction <> 23154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23154, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:247
//
// PORT: SOURCE SERVICER.agc:248
//		CS	STEERBIT	# CLEAR STEERSW PRIOR TO DVMON.
// PORT: Fixed ROM slots 29889.
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
// PORT: SOURCE SERVICER.agc:249
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 29890.
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
// PORT: SOURCE SERVICER.agc:250
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 29891.
                            if slot <> 29891 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:251
//
// PORT: SOURCE SERVICER.agc:252
//		CAF	IDLEFBIT	# IS THE IDLE FLAG SET?
// PORT: Fixed ROM slots 29892.
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
// PORT: SOURCE SERVICER.agc:253
//		MASK	FLAGWRD7
// PORT: Fixed ROM slots 29893.
                            if slot <> 29893 or instruction <> 28739 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:254
//		CCS	A
// PORT: Fixed ROM slots 29894.
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
// PORT: SOURCE SERVICER.agc:255
//		TCF	NODVMON1	# IDLEFLAG = 1, HENCE SET AUXFLAG TO 0.
// PORT: Fixed ROM slots 29895.
                            if slot <> 29895 or instruction <> 5346 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5346, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:256
//
// PORT: SOURCE SERVICER.agc:257
//		CS	FLAGWRD6
// PORT: Fixed ROM slots 29896.
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
// PORT: SOURCE SERVICER.agc:258
//		MASK	AUXFLBIT
// PORT: Fixed ROM slots 29897.
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
// PORT: SOURCE SERVICER.agc:259
//		CCS	A
// PORT: Fixed ROM slots 29898.
                            if slot <> 29898 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:260
//		TCF	NODVMON2	# AUXFLAG = 0, HENCE SET AUXFLAG TO 1.
// PORT: Fixed ROM slots 29899.
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
// PORT: SOURCE SERVICER.agc:261
//
// PORT: SOURCE SERVICER.agc:262
//DVMON		CS	DVTHRUSH
// PORT: Fixed ROM slots 29900.
                        if slot <> 29900 or instruction <> 17065 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 681).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29901 {
// PORT: SOURCE SERVICER.agc:263
//		AD	ABDELV
// PORT: Fixed ROM slots 29901.
                            if slot <> 29901 or instruction <> 25254 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 678).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:264
//		EXTEND
// PORT: Fixed ROM slots 29902.
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
// PORT: SOURCE SERVICER.agc:265
//		BZMF	LOTHRUST
// PORT: Fixed ROM slots 29903.
                        if slot <> 29903 or instruction <> 25834 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25834, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29904 {
// PORT: SOURCE SERVICER.agc:266
//
// PORT: SOURCE SERVICER.agc:267
//		CS	FLAGWRD2	# SET STEERSW.
// PORT: Fixed ROM slots 29904.
                            if slot <> 29904 or instruction <> 16446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 62).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:268
//		MASK	STEERBIT
// PORT: Fixed ROM slots 29905.
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
// PORT: SOURCE SERVICER.agc:269
//		ADS	FLAGWRD2
// PORT: Fixed ROM slots 29906.
                            if slot <> 29906 or instruction <> 11326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:270
//
// PORT: SOURCE SERVICER.agc:271
//DVCNTSET	CAF	ONE		# ALLOW TWO PASSES MAXIMUM NOW THAT
// PORT: Fixed ROM slots 29907.
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
// PORT: SOURCE SERVICER.agc:272
//# Page 862
// PORT: SOURCE SERVICER.agc:273
//		TS	DVCNTR		# THRUST HAS BEEN DETECTED.
// PORT: Fixed ROM slots 29908.
                            if slot <> 29908 or instruction <> 23373 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:274
//
// PORT: SOURCE SERVICER.agc:275
//		CA	FLGWRD10	# BRANCH IF APSFLAG IS SET.
// PORT: Fixed ROM slots 29909.
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
// PORT: SOURCE SERVICER.agc:276
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 29910.
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
// PORT: SOURCE SERVICER.agc:277
//		CCS	A
// PORT: Fixed ROM slots 29911.
                            if slot <> 29911 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:278
//		TCF	USEJETS
// PORT: Fixed ROM slots 29912.
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
// PORT: SOURCE SERVICER.agc:279
//
// PORT: SOURCE SERVICER.agc:280
//		CA	BIT9		# CHECK GIMBAL FAIL BIT
// PORT: Fixed ROM slots 29913.
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
// PORT: SOURCE SERVICER.agc:281
//		EXTEND
// PORT: Fixed ROM slots 29914.
                            if slot <> 29914 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:282
//		RAND	CHAN32
// PORT: Fixed ROM slots 29915.
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
// PORT: SOURCE SERVICER.agc:283
//		EXTEND
// PORT: Fixed ROM slots 29916.
                        if slot <> 29916 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29917 {
// PORT: SOURCE SERVICER.agc:284
//		BZF	USEJETS
// PORT: Fixed ROM slots 29917.
                            if slot <> 29917 or instruction <> 5373 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:285
//
// PORT: SOURCE SERVICER.agc:286
//USEGTS		CS	USEQRJTS
// PORT: Fixed ROM slots 29918.
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
// PORT: SOURCE SERVICER.agc:287
//		MASK	DAPBOOLS
// PORT: Fixed ROM slots 29919.
                            if slot <> 29919 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:288
//		TS	DAPBOOLS
// PORT: Fixed ROM slots 29920.
                            if slot <> 29920 or instruction <> 22601 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22601, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29921 {
// PORT: SOURCE SERVICER.agc:289
//		TCF	SERVOUT
// PORT: Fixed ROM slots 29921.
                            if slot <> 29921 or instruction <> 5376 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5376, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:290
//
// PORT: SOURCE SERVICER.agc:291
//NODVMON1	CS	AUXFLBIT	# SET AUXFLAG TO 0.
// PORT: Fixed ROM slots 29922.
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
// PORT: SOURCE SERVICER.agc:292
//		MASK	FLAGWRD6
// PORT: Fixed ROM slots 29923.
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
// PORT: SOURCE SERVICER.agc:293
//		TS	FLAGWRD6
// PORT: Fixed ROM slots 29924.
                            if slot <> 29924 or instruction <> 22594 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22594, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:294
//		TCF	USEJETS
// PORT: Fixed ROM slots 29925.
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
// PORT: SOURCE SERVICER.agc:295
//NODVMON2	CS	FLAGWRD6	# SET AUXFLAG TO 1.
// PORT: Fixed ROM slots 29926.
                        if slot <> 29926 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29927 {
// PORT: SOURCE SERVICER.agc:296
//		MASK	AUXFLBIT
// PORT: Fixed ROM slots 29927.
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
// PORT: SOURCE SERVICER.agc:297
//		ADS	FLAGWRD6
// PORT: Fixed ROM slots 29928.
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
// PORT: SOURCE SERVICER.agc:298
//		TCF	USEJETS
// PORT: Fixed ROM slots 29929.
                        if slot <> 29929 or instruction <> 5373 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5373, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29930 {
// PORT: SOURCE SERVICER.agc:299
//
// PORT: SOURCE SERVICER.agc:300
//LOTHRUST	TC	QUIKFAZ5
// PORT: Fixed ROM slots 29930.
                            if slot <> 29930 or instruction <> 1898 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1898, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:301
//		CCS	DVCNTR
// PORT: Fixed ROM slots 29931.
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
// PORT: SOURCE SERVICER.agc:302
//		TCF	DECCNTR
// PORT: Fixed ROM slots 29932.
                            if slot <> 29932 or instruction <> 5366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:303
//
// PORT: SOURCE SERVICER.agc:304
//		CCS	PHASE4		# COMFAIL JOB ACTIVE?
// PORT: Fixed ROM slots 29933.
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
// PORT: SOURCE SERVICER.agc:305
//		TCF	SERVOUT		# YES:  WON'T NEED ANOTHER.
// PORT: Fixed ROM slots 29934.
                            if slot <> 29934 or instruction <> 5376 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5376, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:306
//
// PORT: SOURCE SERVICER.agc:307
//		TC	PHASCHNG	# 4.37SPOT FOR COMFAIL.
// PORT: Fixed ROM slots 29935.
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
// PORT: SOURCE SERVICER.agc:308
//		OCT	00374
// PORT: Fixed ROM slots 29936.
    29936, 504
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29937–29938.
function agcAotUnit1925 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29937 {
// PORT: SOURCE SERVICER.agc:309
//
// PORT: SOURCE SERVICER.agc:310
//		CAF	PRIO25
// PORT: Fixed ROM slots 29937.
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
// PORT: SOURCE SERVICER.agc:311
//		TC	NOVAC
// PORT: Fixed ROM slots 29938.
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
// PORT: SOURCE SERVICER.agc:312
//		EBANK=	WHICH
// PORT: SOURCE SERVICER.agc:313
//		2CADR	COMFAIL
// PORT: Fixed ROM slots 29939 29940.
    29939, 2802, 29940, 61550
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29941–29947.
function agcAotUnit1926 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29943 {
        if slot <= 29941 {
// PORT: SOURCE SERVICER.agc:314
//
// PORT: SOURCE SERVICER.agc:315
//		TCF	SERVOUT
// PORT: Fixed ROM slots 29941.
            if slot <> 29941 or instruction <> 5376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5376, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29942 {
// PORT: SOURCE SERVICER.agc:316
//
// PORT: SOURCE SERVICER.agc:317
//DECCNTR		TS	DVCNTR1
// PORT: Fixed ROM slots 29942.
                if slot <> 29942 or instruction <> 23416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23416, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:318
//		TC	QUIKFAZ5
// PORT: Fixed ROM slots 29943.
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
// PORT: SOURCE SERVICER.agc:319
//		CA	DVCNTR1
// PORT: Fixed ROM slots 29944.
                if slot <> 29944 or instruction <> 13176 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 888).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:320
//		TS	DVCNTR
// PORT: Fixed ROM slots 29945.
                if slot <> 29945 or instruction <> 23373 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23373, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29946 {
// PORT: SOURCE SERVICER.agc:321
//		INHINT
// PORT: Fixed ROM slots 29946.
                if slot <> 29946 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:322
//		TC	IBNKCALL	# IF THRUST IS LOW, NO STEERING IS DONE
// PORT: Fixed ROM slots 29947.
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
// PORT: SOURCE SERVICER.agc:323
//# Page 863
// PORT: SOURCE SERVICER.agc:324
//		CADR	STOPRATE	# AND THE DESIRED RATES ARE SET TO ZERO.
// PORT: Fixed ROM slots 29948.
    29948, 33002
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29949–29953.
function agcAotUnit1927 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29950 {
        if slot <= 29949 {
// PORT: SOURCE SERVICER.agc:325
//USEJETS		CS	DAPBOOLS
// PORT: Fixed ROM slots 29949.
            if slot <> 29949 or instruction <> 16457 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 73).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:326
//		MASK	USEQRJTS
// PORT: Fixed ROM slots 29950.
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
// PORT: SOURCE SERVICER.agc:327
//		ADS	DAPBOOLS
// PORT: Fixed ROM slots 29951.
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
// PORT: SOURCE SERVICER.agc:328
//SERVOUT		RELINT
// PORT: Fixed ROM slots 29952.
                if slot <> 29952 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:329
//		TC	BANKCALL
// PORT: Fixed ROM slots 29953.
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
// PORT: SOURCE SERVICER.agc:330
//		CADR	1/ACCS
// PORT: Fixed ROM slots 29954.
    29954, 33374
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29955–29963.
function agcAotUnit1928 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29958 {
        if slot <= 29956 {
            if slot <= 29955 {
// PORT: SOURCE SERVICER.agc:331
//
// PORT: SOURCE SERVICER.agc:332
//		CA	PRIORITY
// PORT: Fixed ROM slots 29955.
                if slot <> 29955 or instruction <> 12407 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 119).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:333
//		MASK	LOW9
// PORT: Fixed ROM slots 29956.
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
// PORT: SOURCE SERVICER.agc:334
//		TS	PUSHLOC
// PORT: Fixed ROM slots 29957.
                if slot <> 29957 or instruction <> 22646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:335
//		ZL
// PORT: Fixed ROM slots 29958.
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
// PORT: SOURCE SERVICER.agc:336
//		DXCH	FIXLOC		# FIXLOC AND DVFIND
// PORT: Fixed ROM slots 29959.
                if slot <> 29959 or instruction <> 21585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 81, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:337
//
// PORT: SOURCE SERVICER.agc:338
//		TC	QUIKFAZ5
// PORT: Fixed ROM slots 29960.
                if slot <> 29960 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29961 {
// PORT: SOURCE SERVICER.agc:339
//		EXTEND			# EXIT TO SELECTED ROUTINE WHETHER THERE
// PORT: Fixed ROM slots 29961.
                if slot <> 29961 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29962 {
// PORT: SOURCE SERVICER.agc:340
//		DCA	AVGEXIT		# IS THRUST OR NOT.  THE STATE OF STEERSW
// PORT: Fixed ROM slots 29962.
                    if slot <> 29962 or instruction <> 12971 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 683, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:341
//		DXCH	Z		# WILL CONVEY THIS INFORMATION.
// PORT: Fixed ROM slots 29963.
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
// PORT: SOURCE SERVICER.agc:342
//
// PORT: SOURCE SERVICER.agc:343
//XNBPIPAD	ECADR	XNBPIP
// PORT: Fixed ROM slots 29964.
    29964, 2250
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21425–21427.
function agcAotUnit1324 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21425 {
// PORT: SOURCE SERVICER.agc:344
//
// PORT: SOURCE SERVICER.agc:345
//		BANK	32
// PORT: SOURCE SERVICER.agc:346
//		SETLOC	SERV2
// PORT: SOURCE SERVICER.agc:347
//		BANK
// PORT: SOURCE SERVICER.agc:348
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:349
//
// PORT: SOURCE SERVICER.agc:350
//AVGEND		CA	PIPTIME +1	# FINAL AVERAGE G EXIT
// PORT: Fixed ROM slots 21425.
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
// PORT: SOURCE SERVICER.agc:351
//		TS	1/PIPADT	# SET UP FREE FALL GYRO COMPENSATION.
// PORT: Fixed ROM slots 21426.
            if slot <> 21426 or instruction <> 23101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23101, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:352
//
// PORT: SOURCE SERVICER.agc:353
//		TC	UPFLAG		# SET DRIFT FLAG.
// PORT: Fixed ROM slots 21427.
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
// PORT: SOURCE SERVICER.agc:354
//		ADRES	DRIFTFLG
// PORT: Fixed ROM slots 21428.
    21428, 60
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21429–21429.
function agcAotUnit1325 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:355
//
// PORT: SOURCE SERVICER.agc:356
//		TC	BANKCALL
// PORT: Fixed ROM slots 21429.
    if slot <> 21429 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1325] to agcAotUnit1325@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:357
//		CADR	PIPFREE
// PORT: Fixed ROM slots 21430.
    21430, 15760
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21431–21434.
function agcAotUnit1326 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21432 {
        if slot <= 21431 {
// PORT: SOURCE SERVICER.agc:358
//
// PORT: SOURCE SERVICER.agc:359
//		CS	BIT9
// PORT: Fixed ROM slots 21431.
            if slot <> 21431 or instruction <> 18915 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:360
//		EXTEND
// PORT: Fixed ROM slots 21432.
            if slot <> 21432 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21433 {
// PORT: SOURCE SERVICER.agc:361
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 21433.
            if slot <> 21433 or instruction <> 1545 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:362
//
// PORT: SOURCE SERVICER.agc:363
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 21434.
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
// PORT: SOURCE SERVICER.agc:364
//		OCT	5		# GROUP 5 OFF
// PORT: Fixed ROM slots 21435.
    21435, 10,
// PORT: SOURCE SERVICER.agc:365
//		OCT	05022		# GROUP 2 ON
// PORT: Fixed ROM slots 21436.
    21436, 5156,
// PORT: SOURCE SERVICER.agc:366
//		OCT	20000
// PORT: Fixed ROM slots 21437.
    21437, 16384
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21438–21438.
function agcAotUnit1327 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:367
//
// PORT: SOURCE SERVICER.agc:368
//		TC	INTPRET
// PORT: Fixed ROM slots 21438.
    if slot <> 21438 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1327] to agcAotUnit1327@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:369
//		SET	CLEAR
// PORT: Fixed ROM slots 21439.
    21439, 35864,
// PORT: SOURCE SERVICER.agc:370
//			NOR29FLG	# SHUT OFF R29 WHEN SERVICER ENDS.
// PORT: Fixed ROM slots 21440.
    21440, 1640,
// PORT: SOURCE SERVICER.agc:371
//			SWANDISP	# SHUT OFF R10 WHEN SERVICER ENDS.
// PORT: Fixed ROM slots 21441.
    21441, 3944,
// PORT: SOURCE SERVICER.agc:372
//		CLEAR	CALL		# RESET MUNFLAG.
// PORT: Fixed ROM slots 21442.
    21442, 37912,
// PORT: SOURCE SERVICER.agc:373
//			MUNFLAG
// PORT: Fixed ROM slots 21443.
    21443, 3438,
// PORT: SOURCE SERVICER.agc:374
//# Page 864
// PORT: SOURCE SERVICER.agc:375
//			AVETOMID
// PORT: Fixed ROM slots 21444.
    21444, 24174,
// PORT: SOURCE SERVICER.agc:376
//		CLEAR	EXIT
// PORT: Fixed ROM slots 21445.
    21445, 65048,
// PORT: SOURCE SERVICER.agc:377
//			V37FLAG
// PORT: Fixed ROM slots 21446.
    21446, 3954
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21447–21448.
function agcAotUnit1328 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21447 {
// PORT: SOURCE SERVICER.agc:378
//AVERTRN		CA	OUTROUTE	# RETURN TO DESIRED POINT.
// PORT: Fixed ROM slots 21447.
        if slot <> 21447 or instruction <> 12976 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 688).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:379
//		TC	BANKJUMP
// PORT: Fixed ROM slots 21448.
        if slot <> 21448 or instruction <> 2464 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2464, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1328] to agcAotUnit1328@.

// PORT: Physical bank 27. Shared continuation entries, slots 26321–26349.
function agcAotUnit1681 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26334 {
        if slot <= 26327 {
            if slot <= 26323 {
                if slot <= 26321 {
// PORT: SOURCE SERVICER.agc:380
//
// PORT: SOURCE SERVICER.agc:381
//OUTGOAVE	=	AVERTRN
// PORT: SOURCE SERVICER.agc:382
//DVCNTR1		=	MASS1
// PORT: SOURCE SERVICER.agc:383
//
// PORT: SOURCE SERVICER.agc:384
//# Page 865
// PORT: SOURCE SERVICER.agc:385
//		SETLOC	SERV3
// PORT: SOURCE SERVICER.agc:386
//		BANK
// PORT: SOURCE SERVICER.agc:387
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:388
//
// PORT: SOURCE SERVICER.agc:389
//SERVIDLE	EXTEND			# DISCONNECT SERVICER FROM ALL GUIDANCE
// PORT: Fixed ROM slots 26321.
                    if slot <> 26321 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26322 {
// PORT: SOURCE SERVICER.agc:390
//		DCA	SVEXTADR
// PORT: Fixed ROM slots 26322.
                        if slot <> 26322 or instruction <> 14063 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1775, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:391
//		DXCH	AVGEXIT
// PORT: Fixed ROM slots 26323.
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
// PORT: SOURCE SERVICER.agc:392
//
// PORT: SOURCE SERVICER.agc:393
//		CS	FLAGWRD7	# DISCONNECT THE DELTA-V MONITOR
// PORT: Fixed ROM slots 26324.
                        if slot <> 26324 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:394
//		MASK	IDLEFBIT
// PORT: Fixed ROM slots 26325.
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
// PORT: SOURCE SERVICER.agc:395
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 26326.
                        if slot <> 26326 or instruction <> 11331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:396
//
// PORT: SOURCE SERVICER.agc:397
//		CAF	LRBYBIT		# TERMINATE R12 IS RUNNING.
// PORT: Fixed ROM slots 26327.
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
// PORT: SOURCE SERVICER.agc:398
//		TS	FLGWRD11
// PORT: Fixed ROM slots 26328.
                    if slot <> 26328 or instruction <> 22599 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22599, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26329 {
// PORT: SOURCE SERVICER.agc:399
//
// PORT: SOURCE SERVICER.agc:400
//		EXTEND
// PORT: Fixed ROM slots 26329.
                        if slot <> 26329 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:401
//		DCA	NEG0
// PORT: Fixed ROM slots 26330.
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
// PORT: SOURCE SERVICER.agc:402
//		DXCH	-PHASE1
// PORT: Fixed ROM slots 26331.
                        if slot <> 26331 or instruction <> 21995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:403
//
// PORT: SOURCE SERVICER.agc:404
//		CA	FLAGWRD6	# DO NOT TURN OFF PHASE 2 IF MUNFLAG SET.
// PORT: Fixed ROM slots 26332.
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
// PORT: SOURCE SERVICER.agc:405
//		MASK	MUNFLBIT
// PORT: Fixed ROM slots 26333.
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
// PORT: SOURCE SERVICER.agc:406
//		CCS	A
// PORT: Fixed ROM slots 26334.
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
// PORT: SOURCE SERVICER.agc:407
//		TCF	+4
// PORT: Fixed ROM slots 26335.
                    if slot <> 26335 or instruction <> 5859 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5859, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26336 {
// PORT: SOURCE SERVICER.agc:408
//
// PORT: SOURCE SERVICER.agc:409
//		EXTEND
// PORT: Fixed ROM slots 26336.
                        if slot <> 26336 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:410
//		DCA	NEG0
// PORT: Fixed ROM slots 26337.
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
// PORT: SOURCE SERVICER.agc:411
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 26338.
                        if slot <> 26338 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:412
//
// PORT: SOURCE SERVICER.agc:413
// +4		EXTEND
// PORT: Fixed ROM slots 26339.
                        if slot <> 26339 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26340 {
// PORT: SOURCE SERVICER.agc:414
// 		DCA	NEG0
// PORT: Fixed ROM slots 26340.
                        if slot <> 26340 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:415
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 26341.
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
// PORT: SOURCE SERVICER.agc:416
//
// PORT: SOURCE SERVICER.agc:417
//		EXTEND
// PORT: Fixed ROM slots 26342.
                        if slot <> 26342 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:418
//		DCA	NEG0
// PORT: Fixed ROM slots 26343.
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
// PORT: SOURCE SERVICER.agc:419
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 26344.
                        if slot <> 26344 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:420
//
// PORT: SOURCE SERVICER.agc:421
//		CAF	OCT33		# 4.33SPOT FOR GOP00FIX
// PORT: Fixed ROM slots 26345.
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
// PORT: SOURCE SERVICER.agc:422
//		TS	L
// PORT: Fixed ROM slots 26346.
                        if slot <> 26346 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:423
//		COM
// PORT: Fixed ROM slots 26347.
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
// PORT: SOURCE SERVICER.agc:424
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 26348.
                        if slot <> 26348 or instruction <> 22001 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:425
//
// PORT: SOURCE SERVICER.agc:426
//		TCF	WHIMPER		# PERFORM A SOFTWARE RESTART AND PROCEED
// PORT: Fixed ROM slots 26349.
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
// PORT: SOURCE SERVICER.agc:427
//					# TO GOTOPOOH WHILE SERVICER CONTINUES TO
// PORT: SOURCE SERVICER.agc:428
//					# RUN, ALBEIT IN A GROUND STATE WHERE
// PORT: SOURCE SERVICER.agc:429
//					# ONLY STATE-VECTOR DEPENDENT FUNCTIONS
// PORT: SOURCE SERVICER.agc:430
//					# ARE MAINTAINED.
// PORT: SOURCE SERVICER.agc:431
//
// PORT: SOURCE SERVICER.agc:432
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:433
//# Page 866
// PORT: SOURCE SERVICER.agc:434
//SVEXTADR	2CADR	SERVEXIT
// PORT: Fixed ROM slots 26350 26351.
    26350, 4080, 26351, 53358
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29688–29688.
function agcAotUnit1906 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:435
//
// PORT: SOURCE SERVICER.agc:436
//		BANK	32
// PORT: SOURCE SERVICER.agc:437
//		SETLOC	SERV
// PORT: SOURCE SERVICER.agc:438
//		BANK
// PORT: SOURCE SERVICER.agc:439
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:440
//
// PORT: SOURCE SERVICER.agc:441
//SERVEXIT	TC	PHASCHNG
// PORT: Fixed ROM slots 29688.
    if slot <> 29688 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1906] to agcAotUnit1906@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:442
//		OCT	00035
// PORT: Fixed ROM slots 29689.
    29689, 58
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29690–29690.
function agcAotUnit1907 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:443
//
// PORT: SOURCE SERVICER.agc:444
//+2		TCF	ENDOFJOB
// PORT: Fixed ROM slots 29690.
    if slot <> 29690 or instruction <> 6765 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6765, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1907] to agcAotUnit1907@.

// PORT: Physical bank 23. Shared continuation entries, slots 21809–21809.
function agcAotUnit1359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:445
//
// PORT: SOURCE SERVICER.agc:446
//		BANK	23
// PORT: SOURCE SERVICER.agc:447
//		SETLOC	NORMLIZ
// PORT: SOURCE SERVICER.agc:448
//		BANK
// PORT: SOURCE SERVICER.agc:449
//
// PORT: SOURCE SERVICER.agc:450
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:451
//
// PORT: SOURCE SERVICER.agc:452
//# Page 867
// PORT: SOURCE SERVICER.agc:453
//NORMLIZE	TC	INTPRET
// PORT: Fixed ROM slots 21809.
    if slot <> 21809 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1359] to agcAotUnit1359@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:454
//		VLOAD	BOFF
// PORT: Fixed ROM slots 21810.
    21810, 36090,
// PORT: SOURCE SERVICER.agc:455
//			RN1
// PORT: Fixed ROM slots 21811.
    21811, 3786,
// PORT: SOURCE SERVICER.agc:456
//			MUNFLAG
// PORT: Fixed ROM slots 21812.
    21812, 3534,
// PORT: SOURCE SERVICER.agc:457
//			NORMLIZ1
// PORT: Fixed ROM slots 21813.
    21813, 55834,
// PORT: SOURCE SERVICER.agc:458
//		VSL6	MXV
// PORT: Fixed ROM slots 21814.
    21814, 53588,
// PORT: SOURCE SERVICER.agc:459
//			REFSMMAT
// PORT: Fixed ROM slots 21815.
    21815, 1976,
// PORT: SOURCE SERVICER.agc:460
//		STCALL	R
// PORT: Fixed ROM slots 21816.
    21816, 32418,
// PORT: SOURCE SERVICER.agc:461
//			MUNGRAV
// PORT: Fixed ROM slots 21817.
    21817, 56496,
// PORT: SOURCE SERVICER.agc:462
//		VLOAD	VSL1
// PORT: Fixed ROM slots 21818.
    21818, 64250,
// PORT: SOURCE SERVICER.agc:463
//			VN1
// PORT: Fixed ROM slots 21819.
    21819, 3798,
// PORT: SOURCE SERVICER.agc:464
//		MXV
// PORT: Fixed ROM slots 21820.
    21820, 65442,
// PORT: SOURCE SERVICER.agc:465
//			REFSMMAT
// PORT: Fixed ROM slots 21821.
    21821, 1976,
// PORT: SOURCE SERVICER.agc:466
//		STOVL	V
// PORT: Fixed ROM slots 21822.
    21822, 24238,
// PORT: SOURCE SERVICER.agc:467
//			V(CSM)
// PORT: Fixed ROM slots 21823.
    21823, 1964,
// PORT: SOURCE SERVICER.agc:468
//		VXV	UNIT
// PORT: Fixed ROM slots 21824.
    21824, 44602,
// PORT: SOURCE SERVICER.agc:469
//			R(CSM)
// PORT: Fixed ROM slots 21825.
    21825, 1952,
// PORT: SOURCE SERVICER.agc:470
//		STORE	UHYP
// PORT: Fixed ROM slots 21826.
    21826, 4000,
// PORT: SOURCE SERVICER.agc:471
//ASCSPOT		EXIT
// PORT: Fixed ROM slots 21827.
    21827, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21828–21831.
function agcAotUnit1360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21829 {
        if slot <= 21828 {
// PORT: SOURCE SERVICER.agc:472
//		EXTEND			# MAKE SURE GROUP 2 IS OFF
// PORT: Fixed ROM slots 21828.
            if slot <> 21828 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:473
//		DCA	NEG0
// PORT: Fixed ROM slots 21829.
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
// PORT: SOURCE SERVICER.agc:474
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 21830.
            if slot <> 21830 or instruction <> 21997 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:475
//
// PORT: SOURCE SERVICER.agc:476
//		TC	POSTJUMP
// PORT: Fixed ROM slots 21831.
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
// PORT: SOURCE SERVICER.agc:477
//		CADR	NORMLIZ2
// PORT: Fixed ROM slots 21832.
    21832, 55840,
// PORT: SOURCE SERVICER.agc:478
//
// PORT: SOURCE SERVICER.agc:479
//		BANK	33
// PORT: SOURCE SERVICER.agc:480
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER.agc:481
//		BANK
// PORT: SOURCE SERVICER.agc:482
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:483
//
// PORT: SOURCE SERVICER.agc:484
//NORMLIZ1	CALL
// PORT: Fixed ROM slots 29965.
    29965, 65320,
// PORT: SOURCE SERVICER.agc:485
//			CALCGRAV
// PORT: Fixed ROM slots 29966.
    29966, 56240,
// PORT: SOURCE SERVICER.agc:486
//		EXIT
// PORT: Fixed ROM slots 29967.
    29967, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29968–29976.
function agcAotUnit1929 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29971 {
        if slot <= 29969 {
            if slot <= 29968 {
// PORT: SOURCE SERVICER.agc:487
//
// PORT: SOURCE SERVICER.agc:488
//NORMLIZ2	CA	EIGHTEEN
// PORT: Fixed ROM slots 29968.
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
// PORT: SOURCE SERVICER.agc:489
//		TC	COPYCYC +1	# DO NOT COPY MASS IN NORMLIZE
// PORT: Fixed ROM slots 29969.
                if slot <> 29969 or instruction <> 1300 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1300, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29970 {
// PORT: SOURCE SERVICER.agc:490
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 29970.
                if slot <> 29970 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:491
//
// PORT: SOURCE SERVICER.agc:492
//COPYCYC		CA	OCT24		# DEC 20
// PORT: Fixed ROM slots 29971.
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
// PORT: SOURCE SERVICER.agc:493
// +1		INHINT
// PORT: Fixed ROM slots 29972.
                if slot <> 29972 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:494
// +2		MASK	NEG1		# REDUCE BY 1 IF ODD
// PORT: Fixed ROM slots 29973.
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
// PORT: SOURCE SERVICER.agc:495
// 		TS	ITEMP1
// PORT: Fixed ROM slots 29974.
                if slot <> 29974 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29975 {
// PORT: SOURCE SERVICER.agc:496
//		EXTEND
// PORT: Fixed ROM slots 29975.
                    if slot <> 29975 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:497
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 29976.
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
// PORT: SOURCE SERVICER.agc:498
//		DCA	RN1
// PORT: Fixed ROM slots 29977.
    29977, 26314
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29978–29978.
function agcAotUnit1930 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:499
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 29978.
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
// PORT: SOURCE SERVICER.agc:500
//# Page 868
// PORT: SOURCE SERVICER.agc:501
//		DXCH	RN
// PORT: Fixed ROM slots 29979.
    29979, 44322
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29980–29982.
function agcAotUnit1931 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29980 {
// PORT: SOURCE SERVICER.agc:502
//		CCS	ITEMP1
// PORT: Fixed ROM slots 29980.
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
// PORT: SOURCE SERVICER.agc:503
//		TCF	COPYCYC +2
// PORT: Fixed ROM slots 29981.
            if slot <> 29981 or instruction <> 5397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:504
//		TC	Q		# RETURN UNDER INHINT
// PORT: Fixed ROM slots 29982.
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
// PORT: SOURCE SERVICER.agc:505
//
// PORT: SOURCE SERVICER.agc:506
//EIGHTEEN	DEC	18
// PORT: Fixed ROM slots 29983.
    29983, 36
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34657–34707.
function agcAotUnit2286 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34681 {
        if slot <= 34668 {
            if slot <= 34662 {
                if slot <= 34659 {
                    if slot <= 34657 {
// PORT: SOURCE SERVICER.agc:507
//
// PORT: SOURCE SERVICER.agc:508
//# Page 869
// PORT: SOURCE SERVICER.agc:509
//# ************* PIPA READER *****************
// PORT: SOURCE SERVICER.agc:510
//# MOD NO. 00 BY D. LICKLY, DEC. 9 1966
// PORT: SOURCE SERVICER.agc:511
//#
// PORT: SOURCE SERVICER.agc:512
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE SERVICER.agc:513
//#	SUBROUTINE TO READ PIPA COUNTERS, TRYING TO BE VERY CAREFUL SO THAT WILL BE RESTARTABLE.
// PORT: SOURCE SERVICER.agc:514
//#	PIPA READINGS ARE STORED IN THE VECTOR DELV.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS THE PIPA READING,
// PORT: SOURCE SERVICER.agc:515
//# 	RESTARTS BEGIN AT REREADAC.
// PORT: SOURCE SERVICER.agc:516
//#
// PORT: SOURCE SERVICER.agc:517
//#	AT THE END OF THE PIPA READER THE CDUS ARE READ AND STORED AS A
// PORT: SOURCE SERVICER.agc:518
//#	VECTOR IN CDUTEMP.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS
// PORT: SOURCE SERVICER.agc:519
//# 	THE CDU READING IN 25 COMP IN THE ORDER CDUX,Y,Z.  THE THRUST
// PORT: SOURCE SERVICER.agc:520
//#	VECTOR ESTIMATOR IN FINDCDUD REQUIRES THE CDUS BE READ AT PIPTIME.
// PORT: SOURCE SERVICER.agc:521
//#
// PORT: SOURCE SERVICER.agc:522
//# CALLING SEQUENCE AND EXIT
// PORT: SOURCE SERVICER.agc:523
//#	CALL VIA TC, ISWCALL, ETC.
// PORT: SOURCE SERVICER.agc:524
//#	EXIT IS VIA Q.
// PORT: SOURCE SERVICER.agc:525
//#
// PORT: SOURCE SERVICER.agc:526
//# INPUT
// PORT: SOURCE SERVICER.agc:527
//#	INPUT IS THROUGH THE COUNTERS PIPAX, PIPAY, PIPAZ, AND TIME2.
// PORT: SOURCE SERVICER.agc:528
//#
// PORT: SOURCE SERVICER.agc:529
//# OUTPUT
// PORT: SOURCE SERVICER.agc:530
//#	HIGH ORDER COMPONENTS OF THE VECTOR DELV CONTAIN THE PIPA READINGS.
// PORT: SOURCE SERVICER.agc:531
//#	PIPTIME CONTAINS TIME OF PIPA READING.
// PORT: SOURCE SERVICER.agc:532
//#
// PORT: SOURCE SERVICER.agc:533
//# DEBRIS (ERASABLE LOCATIONS DESTROYED BY PROGRAM)
// PORT: SOURCE SERVICER.agc:534
//#	TEMX, TEMY, TEMZ, PIPAGE
// PORT: SOURCE SERVICER.agc:535
//
// PORT: SOURCE SERVICER.agc:536
//		BANK	37
// PORT: SOURCE SERVICER.agc:537
//		SETLOC	SERV1
// PORT: SOURCE SERVICER.agc:538
//		BANK
// PORT: SOURCE SERVICER.agc:539
//
// PORT: SOURCE SERVICER.agc:540
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:541
//
// PORT: SOURCE SERVICER.agc:542
//PIPASR		EXTEND
// PORT: Fixed ROM slots 34657.
                        if slot <> 34657 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34658 {
// PORT: SOURCE SERVICER.agc:543
//# Page 870
// PORT: SOURCE SERVICER.agc:544
//		DCA	TIME2
// PORT: Fixed ROM slots 34658.
                            if slot <> 34658 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:545
//		DXCH	PIPTIME1	# CURRENT TIME POSITIVE VALUE
// PORT: Fixed ROM slots 34659.
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
// PORT: SOURCE SERVICER.agc:546
// +3		CS	ZERO		# INITIALIZE THESE AT NEG. ZERO.
// PORT: Fixed ROM slots 34660.
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
// PORT: SOURCE SERVICER.agc:547
// 		TS	TEMX
// PORT: Fixed ROM slots 34661.
                            if slot <> 34661 or instruction <> 23212 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23212, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:548
//		TS	TEMY
// PORT: Fixed ROM slots 34662.
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
// PORT: SOURCE SERVICER.agc:549
//		TS	TEMZ
// PORT: Fixed ROM slots 34663.
                        if slot <> 34663 or instruction <> 23214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23214, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34664 {
// PORT: SOURCE SERVICER.agc:550
//
// PORT: SOURCE SERVICER.agc:551
//		CA	ZERO
// PORT: Fixed ROM slots 34664.
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
// PORT: SOURCE SERVICER.agc:552
//		TS	DELVZ
// PORT: Fixed ROM slots 34665.
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
// PORT: SOURCE SERVICER.agc:553
//		TS	DELVZ +1
// PORT: Fixed ROM slots 34666.
                        if slot <> 34666 or instruction <> 22745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22745, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34667 {
// PORT: SOURCE SERVICER.agc:554
//		TS	DELVY
// PORT: Fixed ROM slots 34667.
                            if slot <> 34667 or instruction <> 22742 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22742, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:555
//		TS	DELVY +1
// PORT: Fixed ROM slots 34668.
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
// PORT: SOURCE SERVICER.agc:556
//		TS	DELVX +1
// PORT: Fixed ROM slots 34669.
                        if slot <> 34669 or instruction <> 22741 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22741, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34670 {
// PORT: SOURCE SERVICER.agc:557
//		TS	PIPAGE		# SHOW PIPA READING IN PROGRESS
// PORT: Fixed ROM slots 34670.
                            if slot <> 34670 or instruction <> 23215 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23215, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:558
//
// PORT: SOURCE SERVICER.agc:559
//REPIP1		EXTEND
// PORT: Fixed ROM slots 34671.
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
// PORT: SOURCE SERVICER.agc:560
//		DCS	PIPAX		# X AND Y PIPS READ
// PORT: Fixed ROM slots 34672.
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
// PORT: SOURCE SERVICER.agc:561
//		DXCH	TEMX
// PORT: Fixed ROM slots 34673.
                            if slot <> 34673 or instruction <> 22189 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 685, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:562
//		DXCH	PIPAX		# PIPAS SET TO NEG ZERO AS READ.
// PORT: Fixed ROM slots 34674.
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
// PORT: SOURCE SERVICER.agc:563
//		TS	DELVX
// PORT: Fixed ROM slots 34675.
                        if slot <> 34675 or instruction <> 22740 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22740, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34676 {
// PORT: SOURCE SERVICER.agc:564
//		LXCH	DELVY
// PORT: Fixed ROM slots 34676.
                            if slot <> 34676 or instruction <> 9430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 214, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:565
//
// PORT: SOURCE SERVICER.agc:566
//REPIP3		CS	PIPAZ		# REPEAT PROCESS FOR Z PIP
// PORT: Fixed ROM slots 34677.
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
// PORT: SOURCE SERVICER.agc:567
//		XCH	TEMZ
// PORT: Fixed ROM slots 34678.
                            if slot <> 34678 or instruction <> 24238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 686, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:568
//		XCH	PIPAZ
// PORT: Fixed ROM slots 34679.
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
// PORT: SOURCE SERVICER.agc:569
//DODELVZ		TS	DELVZ
// PORT: Fixed ROM slots 34680.
                            if slot <> 34680 or instruction <> 22744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:570
//
// PORT: SOURCE SERVICER.agc:571
//REPIP4		EXTEND			# COMPUTE GUIDANCE PERIOD
// PORT: Fixed ROM slots 34681.
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
// PORT: SOURCE SERVICER.agc:572
//		DCA	PIPTIME1
// PORT: Fixed ROM slots 34682.
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
// PORT: SOURCE SERVICER.agc:573
//		DXCH	PGUIDE
// PORT: Fixed ROM slots 34683.
                            if slot <> 34683 or instruction <> 22184 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 680, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:574
//		EXTEND
// PORT: Fixed ROM slots 34684.
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
// PORT: SOURCE SERVICER.agc:575
//		DCS	PIPTIME
// PORT: Fixed ROM slots 34685.
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
// PORT: SOURCE SERVICER.agc:576
//		DAS	PGUIDE
// PORT: Fixed ROM slots 34686.
                            if slot <> 34686 or instruction <> 8872 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 680) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:577
//
// PORT: SOURCE SERVICER.agc:578
//		CA	CDUX		# READ CDUS INTO HIGH ORDER CDUTEMPS
// PORT: Fixed ROM slots 34687.
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
// PORT: SOURCE SERVICER.agc:579
//		TS	CDUTEMPX
// PORT: Fixed ROM slots 34688.
                        if slot <> 34688 or instruction <> 23149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23149, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34689 {
// PORT: SOURCE SERVICER.agc:580
//		CA	CDUY
// PORT: Fixed ROM slots 34689.
                            if slot <> 34689 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:581
//		TS	CDUTEMPY
// PORT: Fixed ROM slots 34690.
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
// PORT: SOURCE SERVICER.agc:582
//		CA	CDUZ
// PORT: Fixed ROM slots 34691.
                            if slot <> 34691 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:583
//		TS	CDUTEMPZ
// PORT: Fixed ROM slots 34692.
                            if slot <> 34692 or instruction <> 23151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23151, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34693 {
// PORT: SOURCE SERVICER.agc:584
//		CA	DELVX
// PORT: Fixed ROM slots 34693.
                            if slot <> 34693 or instruction <> 12500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 212).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:585
//		TS	PIPATMPX
// PORT: Fixed ROM slots 34694.
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
// PORT: SOURCE SERVICER.agc:586
//		CA	DELVY
// PORT: Fixed ROM slots 34695.
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
// PORT: SOURCE SERVICER.agc:587
//		TS	PIPATMPY
// PORT: Fixed ROM slots 34696.
                            if slot <> 34696 or instruction <> 23153 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23153, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:588
//		CA	DELVZ
// PORT: Fixed ROM slots 34697.
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
// PORT: SOURCE SERVICER.agc:589
//		TS	PIPATMPZ
// PORT: Fixed ROM slots 34698.
                        if slot <> 34698 or instruction <> 23154 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23154, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34699 {
// PORT: SOURCE SERVICER.agc:590
//
// PORT: SOURCE SERVICER.agc:591
//		TC	Q
// PORT: Fixed ROM slots 34699.
                            if slot <> 34699 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:592
//
// PORT: SOURCE SERVICER.agc:593
//# Page 871
// PORT: SOURCE SERVICER.agc:594
//REREADAC	CCS	PIPAGE
// PORT: Fixed ROM slots 34700.
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
// PORT: SOURCE SERVICER.agc:595
//		TCF	READACCS	# PIP READING NOT STARTED.  GO TO BEGINNING
// PORT: Fixed ROM slots 34701.
                        if slot <> 34701 or instruction <> 5921 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5921, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34702 {
// PORT: SOURCE SERVICER.agc:596
//
// PORT: SOURCE SERVICER.agc:597
//		CAF	DONEADR		# SET UP RETURN FROM PIPASR
// PORT: Fixed ROM slots 34702.
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
// PORT: SOURCE SERVICER.agc:598
//		TS	Q
// PORT: Fixed ROM slots 34703.
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
// PORT: SOURCE SERVICER.agc:599
//
// PORT: SOURCE SERVICER.agc:600
//		CCS	DELVZ
// PORT: Fixed ROM slots 34704.
                            if slot <> 34704 or instruction <> 4312 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 216).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:601
//		TCF	REPIP4		# Z DONE, GO DO CDUS
// PORT: Fixed ROM slots 34705.
                            if slot <> 34705 or instruction <> 6009 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6009, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34706 {
// PORT: SOURCE SERVICER.agc:602
//		TCF	+3		# Z NOT DONE, CHECK Y.
// PORT: Fixed ROM slots 34706.
                            if slot <> 34706 or instruction <> 6037 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6037, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:603
//		TCF	REPIP4
// PORT: Fixed ROM slots 34707.
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

// PORT: Physical bank 37. Shared continuation entries, slots 34708–34731.
function agcAotUnit2287 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34719 {
        if slot <= 34713 {
            if slot <= 34710 {
                if slot <= 34708 {
// PORT: SOURCE SERVICER.agc:604
//		TCF	REPIP4
// PORT: Fixed ROM slots 34708.
                    if slot <> 34708 or instruction <> 6009 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6009, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34709 {
// PORT: SOURCE SERVICER.agc:605
//
// PORT: SOURCE SERVICER.agc:606
//		ZL
// PORT: Fixed ROM slots 34709.
                        if slot <> 34709 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:607
//		CCS	DELVY
// PORT: Fixed ROM slots 34710.
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
// PORT: SOURCE SERVICER.agc:608
//		TCF	+3
// PORT: Fixed ROM slots 34711.
                    if slot <> 34711 or instruction <> 6042 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6042, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34712 {
// PORT: SOURCE SERVICER.agc:609
//		TCF	CHKTEMX		# Y NOT DONE, CHECK X.
// PORT: Fixed ROM slots 34712.
                        if slot <> 34712 or instruction <> 6049 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6049, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:610
//		TCF	+1
// PORT: Fixed ROM slots 34713.
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
// PORT: SOURCE SERVICER.agc:611
//		LXCH	PIPAZ		# Y DONE, ZERO Z PIP.
// PORT: Fixed ROM slots 34714.
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
// PORT: SOURCE SERVICER.agc:612
//
// PORT: SOURCE SERVICER.agc:613
//		CCS	TEMZ
// PORT: Fixed ROM slots 34715.
                        if slot <> 34715 or instruction <> 4782 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 686).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:614
//		CS	TEMZ		# TEMZ NOT = -0, CONTAINS -PIPAZ VALUE.
// PORT: Fixed ROM slots 34716.
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
// PORT: SOURCE SERVICER.agc:615
//		TCF	DODELVZ
// PORT: Fixed ROM slots 34717.
                    if slot <> 34717 or instruction <> 6008 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6008, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34718 {
// PORT: SOURCE SERVICER.agc:616
//		TCF	-2
// PORT: Fixed ROM slots 34718.
                        if slot <> 34718 or instruction <> 6044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:617
//		LXCH	DELVZ		# TEMZ = -0, L HAS ZPIP VALUE.
// PORT: Fixed ROM slots 34719.
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
// PORT: SOURCE SERVICER.agc:618
//		TCF	REPIP4
// PORT: Fixed ROM slots 34720.
                    if slot <> 34720 or instruction <> 6009 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6009, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34721 {
// PORT: SOURCE SERVICER.agc:619
//
// PORT: SOURCE SERVICER.agc:620
//CHKTEMX		CCS	TEMX		# HAS THIS CHANGED
// PORT: Fixed ROM slots 34721.
                        if slot <> 34721 or instruction <> 4780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 684).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:621
//		CS	TEMX		# YES
// PORT: Fixed ROM slots 34722.
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
// PORT: SOURCE SERVICER.agc:622
//		TCF	+3		# YES
// PORT: Fixed ROM slots 34723.
                    if slot <> 34723 or instruction <> 6054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34724 {
// PORT: SOURCE SERVICER.agc:623
//		TCF	-2		# YES
// PORT: Fixed ROM slots 34724.
                        if slot <> 34724 or instruction <> 6050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:624
//		TCF	REPIP1		# NO
// PORT: Fixed ROM slots 34725.
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
// PORT: SOURCE SERVICER.agc:625
//		TS	DELVX
// PORT: Fixed ROM slots 34726.
                    if slot <> 34726 or instruction <> 22740 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22740, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34727 {
// PORT: SOURCE SERVICER.agc:626
//
// PORT: SOURCE SERVICER.agc:627
//		CS	TEMY
// PORT: Fixed ROM slots 34727.
                        if slot <> 34727 or instruction <> 17069 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 685).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:628
//		TS	DELVY
// PORT: Fixed ROM slots 34728.
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
// PORT: SOURCE SERVICER.agc:629
//
// PORT: SOURCE SERVICER.agc:630
//		CS	ZERO		# ZERO X AND Y PIPS
// PORT: Fixed ROM slots 34729.
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
// PORT: SOURCE SERVICER.agc:631
//		DXCH	PIPAX		# L STILL ZERO FROM ABOVE
// PORT: Fixed ROM slots 34730.
                        if slot <> 34730 or instruction <> 21536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 32, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:632
//
// PORT: SOURCE SERVICER.agc:633
//		TCF	REPIP3
// PORT: Fixed ROM slots 34731.
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
// PORT: SOURCE SERVICER.agc:634
//
// PORT: SOURCE SERVICER.agc:635
//DONEADR		GENADR	PIPSDONE
// PORT: Fixed ROM slots 34732.
    34732, 3666
)).

// PORT: Physical bank 33. Shared continuation entries, slots 29984–29984.
function agcAotUnit1932 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:636
//
// PORT: SOURCE SERVICER.agc:637
//# Page 872
// PORT: SOURCE SERVICER.agc:638
//		BANK	33
// PORT: SOURCE SERVICER.agc:639
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER.agc:640
//		BANK
// PORT: SOURCE SERVICER.agc:641
//
// PORT: SOURCE SERVICER.agc:642
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:643
//
// PORT: SOURCE SERVICER.agc:644
//TMPTOSPT	CA	CDUTEMPY	# THIS SUBROUTINE, CALLED BY AN RTB FROM
// PORT: Fixed ROM slots 29984.
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

// PORT: Physical bank 33. Shared continuation entries, slots 29985–29990.
function agcAotUnit1933 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29987 {
        if slot <= 29985 {
// PORT: SOURCE SERVICER.agc:645
//		TS	CDUSPOTY	# INTERPRETIVE, LOADS THE CDUS CORRESPON-
// PORT: Fixed ROM slots 29985.
            if slot <> 29985 or instruction <> 23030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29986 {
// PORT: SOURCE SERVICER.agc:646
//		CA	CDUTEMPZ	# DING TO PIPTIME INTO THE CDUSPOT VECTOR.
// PORT: Fixed ROM slots 29986.
                if slot <> 29986 or instruction <> 12911 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 623).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:647
//		TS	CDUSPOTZ
// PORT: Fixed ROM slots 29987.
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
// PORT: SOURCE SERVICER.agc:648
//		CA	CDUTEMPX
// PORT: Fixed ROM slots 29988.
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
// PORT: SOURCE SERVICER.agc:649
//		TS	CDUSPOTX
// PORT: Fixed ROM slots 29989.
                if slot <> 29989 or instruction <> 23034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:650
//		TC 	Q
// PORT: Fixed ROM slots 29990.
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

// PORT: Physical bank 21. Shared continuation entries, slots 19544–19557.
function agcAotUnit1189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19550 {
        if slot <= 19546 {
            if slot <= 19544 {
// PORT: SOURCE SERVICER.agc:651
//
// PORT: SOURCE SERVICER.agc:652
//# LRHTASK IS A WAITLIST TASK SET BY READACCS DURING THE DESCENT BRAKING
// PORT: SOURCE SERVICER.agc:653
//# PHASE WHEN THE ALT TO THE LUNAR SURFACE IS LESS THAN 25,000 FT.  THIS
// PORT: SOURCE SERVICER.agc:654
//# TASK CLEARS THE ALTITUDE MEASUREMENT MADE DISCRETE AND INITIATES THE
// PORT: SOURCE SERVICER.agc:655
//# LANDING RADAR MEASUREMENT JOB (LRHJOB) TO TAKE A ALTITUDE MEASUREMENT
// PORT: SOURCE SERVICER.agc:656
//# 50 MS PRIOR TO THE NEXT READACCS TASK.
// PORT: SOURCE SERVICER.agc:657
//
// PORT: SOURCE SERVICER.agc:658
//		BANK	21
// PORT: SOURCE SERVICER.agc:659
//		SETLOC	R10
// PORT: SOURCE SERVICER.agc:660
//		BANK
// PORT: SOURCE SERVICER.agc:661
//
// PORT: SOURCE SERVICER.agc:662
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:663
//
// PORT: SOURCE SERVICER.agc:664
//LRHTASK		CS	FLGWRD11
// PORT: Fixed ROM slots 19544.
                if slot <> 19544 or instruction <> 16455 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 71).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19545 {
// PORT: SOURCE SERVICER.agc:665
//		MASK	LRBYBIT
// PORT: Fixed ROM slots 19545.
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
// PORT: SOURCE SERVICER.agc:666
//		EXTEND
// PORT: Fixed ROM slots 19546.
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
// PORT: SOURCE SERVICER.agc:667
//		BZF	GRP2OFF		# LR BYPASS SET -- BYPASS ALL LR READING.
// PORT: Fixed ROM slots 19547.
                    if slot <> 19547 or instruction <> 5224 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:668
//
// PORT: SOURCE SERVICER.agc:669
//		CA	READLBIT
// PORT: Fixed ROM slots 19548.
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
// PORT: SOURCE SERVICER.agc:670
//		MASK	FLGWRD11	# IS READLR FLAG SET?
// PORT: Fixed ROM slots 19549.
                    if slot <> 19549 or instruction <> 28743 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 71).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:671
//		EXTEND
// PORT: Fixed ROM slots 19550.
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
// PORT: SOURCE SERVICER.agc:672
//		BZF	GRP2OFF		# NO.  BYPASS LR READ.
// PORT: Fixed ROM slots 19551.
                if slot <> 19551 or instruction <> 5224 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5224, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19552 {
// PORT: SOURCE SERVICER.agc:673
//
// PORT: SOURCE SERVICER.agc:674
//		CS	FLGWRD11
// PORT: Fixed ROM slots 19552.
                    if slot <> 19552 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:675
//		MASK	NOLRRBIT	# IS LR READ INHIBITED?
// PORT: Fixed ROM slots 19553.
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
// PORT: SOURCE SERVICER.agc:676
//		EXTEND
// PORT: Fixed ROM slots 19554.
                    if slot <> 19554 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:677
//		BZF	GRP2OFF		# YES.  BYPASS LR READ.
// PORT: Fixed ROM slots 19555.
                    if slot <> 19555 or instruction <> 5224 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19556 {
// PORT: SOURCE SERVICER.agc:678
//
// PORT: SOURCE SERVICER.agc:679
//		CA	PRIO32		# LR READ OK.  SET JOB TO DO IT
// PORT: Fixed ROM slots 19556.
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
// PORT: SOURCE SERVICER.agc:680
//		TC	NOVAC		# ABOUT 50 MS. PRIOR TO PIPA READ.
// PORT: Fixed ROM slots 19557.
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
// PORT: SOURCE SERVICER.agc:681
//		EBANK=	HMEAS
// PORT: SOURCE SERVICER.agc:682
//		2CADR	LRHJOB
// PORT: Fixed ROM slots 19558 19559.
    19558, 3996, 19559, 57454
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19560–19563.
function agcAotUnit1190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19561 {
        if slot <= 19560 {
// PORT: SOURCE SERVICER.agc:683
//
// PORT: SOURCE SERVICER.agc:684
//GRP2OFF		EXTEND
// PORT: Fixed ROM slots 19560.
            if slot <> 19560 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:685
//		DCA	NEG0
// PORT: Fixed ROM slots 19561.
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
// PORT: SOURCE SERVICER.agc:686
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 19562.
            if slot <> 19562 or instruction <> 21997 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:687
//		TCF	R10,R11A
// PORT: Fixed ROM slots 19563.
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

// PORT: Physical bank 33. Shared continuation entries, slots 29991–29997.
function agcAotUnit1934 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29993 {
        if slot <= 29991 {
// PORT: SOURCE SERVICER.agc:688
//
// PORT: SOURCE SERVICER.agc:689
//		BANK	33
// PORT: SOURCE SERVICER.agc:690
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER.agc:691
//		BANK
// PORT: SOURCE SERVICER.agc:692
//# Page 873
// PORT: SOURCE SERVICER.agc:693
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:694
//
// PORT: SOURCE SERVICER.agc:695
//# HIGATASK IS ENTERED APPROXIMATELY 6 SECS PRIOR TO HIGATE DURING THE
// PORT: SOURCE SERVICER.agc:696
//# DESCENT PHASE.  HIGATASK SETS THE HIGATE FLAG (BIT11) AND THE LR INHIBIT
// PORT: SOURCE SERVICER.agc:697
//# FLAG (BIT10) IN LRSTAT.  THE HIGATJOB IS SET UP TO REPOSITION THE LR
// PORT: SOURCE SERVICER.agc:698
//# ANTENNA FROM POSITION 1 TO POSITION 2.  IF THE REPOSITIONING IS
// PORT: SOURCE SERVICER.agc:699
//# SUCCESSFUL THE ALT BEAM AND VELOCITY BEAMS ARE TRANSFORMED TO THE NEW
// PORT: SOURCE SERVICER.agc:700
//# ORIENTATION IN NB COORDINATES AND STORED IN ERASABLE.
// PORT: SOURCE SERVICER.agc:701
//
// PORT: SOURCE SERVICER.agc:702
//HIGATASK	INHINT
// PORT: Fixed ROM slots 29991.
            if slot <> 29991 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29992 {
// PORT: SOURCE SERVICER.agc:703
//		CS	PRIO3		# SET HIGATE AND LR INHIBIT FLAGS
// PORT: Fixed ROM slots 29992.
                if slot <> 29992 or instruction <> 18957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:704
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 29993.
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
// PORT: SOURCE SERVICER.agc:705
//		AD	PRIO3
// PORT: Fixed ROM slots 29994.
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
// PORT: SOURCE SERVICER.agc:706
//		TS	FLGWRD11
// PORT: Fixed ROM slots 29995.
                if slot <> 29995 or instruction <> 22599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29996 {
// PORT: SOURCE SERVICER.agc:707
//		CAF	PRIO32
// PORT: Fixed ROM slots 29996.
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
// PORT: SOURCE SERVICER.agc:708
//		TC	FINDVAC		# SET LR POSITIONING JOB (POS2)
// PORT: Fixed ROM slots 29997.
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
// PORT: SOURCE SERVICER.agc:709
//		EBANK=	HMEAS
// PORT: SOURCE SERVICER.agc:710
//		2CADR	HIGATJOB
// PORT: Fixed ROM slots 29998 29999.
    29998, 3952, 29999, 55406
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30000–30000.
function agcAotUnit1935 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:711
//
// PORT: SOURCE SERVICER.agc:712
//		TCF	CONTSERV	# CONTINUE SERVICER
// PORT: Fixed ROM slots 30000.
    if slot <> 30000 or instruction <> 5472 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5472, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1935] to agcAotUnit1935@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:713
//
// PORT: SOURCE SERVICER.agc:714
//# Page 874
// PORT: SOURCE SERVICER.agc:715
//# MUNRETRN IS THE RETURN LOC FROM SPECIAL AVE G ROUTINE (MUNRVG)
// PORT: SOURCE SERVICER.agc:716
//
// PORT: SOURCE SERVICER.agc:717
//MUNRETRN	EXIT
// PORT: Fixed ROM slots 30001.
    30001, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30002–30046.
function agcAotUnit1936 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30023 {
        if slot <= 30012 {
            if slot <= 30006 {
                if slot <= 30003 {
                    if slot <= 30002 {
// PORT: SOURCE SERVICER.agc:718
//
// PORT: SOURCE SERVICER.agc:719
//		CS	FLGWRD11
// PORT: Fixed ROM slots 30002.
                        if slot <> 30002 or instruction <> 16455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 71).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:720
//		MASK	LRBYBIT
// PORT: Fixed ROM slots 30003.
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
// PORT: SOURCE SERVICER.agc:721
//		EXTEND
// PORT: Fixed ROM slots 30004.
                        if slot <> 30004 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30005 {
// PORT: SOURCE SERVICER.agc:722
//		BZF	COPYCYC1	# BYPASS LR LOGIC IF BIT15 IS SET.
// PORT: Fixed ROM slots 30005.
                            if slot <> 30005 or instruction <> 5478 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:723
//
// PORT: SOURCE SERVICER.agc:724
//		CA	READLBIT	# SEE IF ALT < 35000 FT LAST CYCLE
// PORT: Fixed ROM slots 30006.
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
// PORT: SOURCE SERVICER.agc:725
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 30007.
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
// PORT: SOURCE SERVICER.agc:726
//		EXTEND
// PORT: Fixed ROM slots 30008.
                            if slot <> 30008 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:727
//		BZF	35KCHK		# ALT WAS > 35000 FT LAST CYCLE   CHK NOW
// PORT: Fixed ROM slots 30009.
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
// PORT: SOURCE SERVICER.agc:728
//
// PORT: SOURCE SERVICER.agc:729
//		CAF	XORFLBIT	# WERE WE BELOW 30000 FT LAST PASS?
// PORT: Fixed ROM slots 30010.
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
// PORT: SOURCE SERVICER.agc:730
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 30011.
                            if slot <> 30011 or instruction <> 28743 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 71).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:731
//		EXTEND
// PORT: Fixed ROM slots 30012.
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
// PORT: SOURCE SERVICER.agc:732
//		BZF	XORCHK		# NO -- TEST THIS PASS
// PORT: Fixed ROM slots 30013.
                        if slot <> 30013 or instruction <> 5576 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5576, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:733
//HITEST		CAF	PSTHIBIT	# CHECK FOR HIGATE
// PORT: Fixed ROM slots 30014.
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
// PORT: SOURCE SERVICER.agc:734
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 30015.
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
// PORT: SOURCE SERVICER.agc:735
//		EXTEND
// PORT: Fixed ROM slots 30016.
                            if slot <> 30016 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:736
//		BZF	HIGATCHK	# NOT AT HIGATE LAST CYCLE -- CHK THIS CYCLE
// PORT: Fixed ROM slots 30017.
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
// PORT: SOURCE SERVICER.agc:737
//
// PORT: SOURCE SERVICER.agc:738
//POS2CHK		CAF	BIT7		# VERIFY LR IN POS2
// PORT: Fixed ROM slots 30018.
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
// PORT: SOURCE SERVICER.agc:739
//		EXTEND
// PORT: Fixed ROM slots 30019.
                            if slot <> 30019 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:740
//		RAND	CHAN33
// PORT: Fixed ROM slots 30020.
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
// PORT: SOURCE SERVICER.agc:741
//		EXTEND
// PORT: Fixed ROM slots 30021.
                        if slot <> 30021 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30022 {
// PORT: SOURCE SERVICER.agc:742
//		BZF	UPDATCHK	# IT IS -- CHECK FOR LR UPDATE
// PORT: Fixed ROM slots 30022.
                            if slot <> 30022 or instruction <> 5741 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5741, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:743
//		CAF	BIT13
// PORT: Fixed ROM slots 30023.
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
// PORT: SOURCE SERVICER.agc:744
//		EXTEND
// PORT: Fixed ROM slots 30024.
                        if slot <> 30024 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:745
//		RAND	CHAN12
// PORT: Fixed ROM slots 30025.
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
// PORT: SOURCE SERVICER.agc:746
//		EXTEND
// PORT: Fixed ROM slots 30026.
                        if slot <> 30026 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30027 {
// PORT: SOURCE SERVICER.agc:747
//		BZF	LRPOSALM	# LR NOT IN POS2 OR REPOSITIONING -- BAD
// PORT: Fixed ROM slots 30027.
                            if slot <> 30027 or instruction <> 5470 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5470, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:748
//		TCF	CONTSERV	# LR BEING REPOSITIONED -- CONTINUE SERV
// PORT: Fixed ROM slots 30028.
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
// PORT: SOURCE SERVICER.agc:749
//
// PORT: SOURCE SERVICER.agc:750
//HIGATCHK	CA	TTF/8		# IS TTF > CRITERION?  (TTF IS NEGATIVE)
// PORT: Fixed ROM slots 30029.
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
// PORT: SOURCE SERVICER.agc:751
//		AD	RPCRTIME
// PORT: Fixed ROM slots 30030.
                            if slot <> 30030 or instruction <> 25367 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 791).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:752
//		EXTEND
// PORT: Fixed ROM slots 30031.
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
// PORT: SOURCE SERVICER.agc:753
//		BZMF	POS1CHK		# NO
// PORT: Fixed ROM slots 30032.
                        if slot <> 30032 or instruction <> 25945 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25945, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30033 {
// PORT: SOURCE SERVICER.agc:754
//
// PORT: SOURCE SERVICER.agc:755
//		CA	EBANK4		# MUST SWITCH EBANKS
// PORT: Fixed ROM slots 30033.
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
// PORT: SOURCE SERVICER.agc:756
//		XCH	EBANK
// PORT: Fixed ROM slots 30034.
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
// PORT: SOURCE SERVICER.agc:757
//		TS	L		# SAVE IN L
// PORT: Fixed ROM slots 30035.
                        if slot <> 30035 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30036 {
// PORT: SOURCE SERVICER.agc:758
//
// PORT: SOURCE SERVICER.agc:759
//		EBANK=	XNBPIP
// PORT: SOURCE SERVICER.agc:760
//		CS	XNBPIP		# UXBXP IN GSOP CH5
// PORT: Fixed ROM slots 30036.
                            if slot <> 30036 or instruction <> 17253 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 869).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:761
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:762
//		LXCH	EBANK		# RESTORE EBANK
// PORT: Fixed ROM slots 30037.
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
// PORT: SOURCE SERVICER.agc:763
//		AD	RPCRTQSW	# QSW - UXBXP
// PORT: Fixed ROM slots 30038.
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
// PORT: SOURCE SERVICER.agc:764
//# Page 875
// PORT: SOURCE SERVICER.agc:765
//
// PORT: SOURCE SERVICER.agc:766
//		EXTEND
// PORT: Fixed ROM slots 30039.
                            if slot <> 30039 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:767
//		BZMF	HIGATASK	# IF UXBXP > QSW, THEN REPOSITION
// PORT: Fixed ROM slots 30040.
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
// PORT: SOURCE SERVICER.agc:768
//
// PORT: SOURCE SERVICER.agc:769
//POS1CHK		CAF	BIT6		# HIGATE NOT IN SIGHT -- DO POS1 CHK
// PORT: Fixed ROM slots 30041.
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
// PORT: SOURCE SERVICER.agc:770
//		EXTEND
// PORT: Fixed ROM slots 30042.
                            if slot <> 30042 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:771
//		RAND	33
// PORT: Fixed ROM slots 30043.
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
// PORT: SOURCE SERVICER.agc:772
//		EXTEND
// PORT: Fixed ROM slots 30044.
                        if slot <> 30044 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 30045 {
// PORT: SOURCE SERVICER.agc:773
//		BZF	UPDATCHK	# LR IN POS1 -- CHECK FOR LR UPDATE
// PORT: Fixed ROM slots 30045.
                            if slot <> 30045 or instruction <> 5741 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5741, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER.agc:774
//
// PORT: SOURCE SERVICER.agc:775
//LRPOSALM	TC	ALARM		# LR NOT IN PROPER POS-ALARM-BYPASS UPDATE
// PORT: Fixed ROM slots 30046.
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
// PORT: SOURCE SERVICER.agc:776
//		OCT	511		# AND CONTINUE SERVICER
// PORT: Fixed ROM slots 30047.
    30047, 658
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30048–30052.
function agcAotUnit1937 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30049 {
        if slot <= 30048 {
// PORT: SOURCE SERVICER.agc:777
//CONTSERV	INHINT
// PORT: Fixed ROM slots 30048.
            if slot <> 30048 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:778
//		CS	BITS4-7
// PORT: Fixed ROM slots 30049.
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
// PORT: SOURCE SERVICER.agc:779
//		MASK	FLGWRD11	# CLEAR LR MEASUREMENT MADE DISCRETES.
// PORT: Fixed ROM slots 30050.
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
// PORT: SOURCE SERVICER.agc:780
//		TS	FLGWRD11
// PORT: Fixed ROM slots 30051.
                if slot <> 30051 or instruction <> 22599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:781
//
// PORT: SOURCE SERVICER.agc:782
//		TC	IBNKCALL	# SET LR LITES PROPERLY
// PORT: Fixed ROM slots 30052.
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
// PORT: SOURCE SERVICER.agc:783
//		CADR	R12LITES
// PORT: Fixed ROM slots 30053.
    30053, 44814
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30054–30072.
function agcAotUnit1938 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30062 {
        if slot <= 30057 {
            if slot <= 30055 {
                if slot <= 30054 {
// PORT: SOURCE SERVICER.agc:784
//
// PORT: SOURCE SERVICER.agc:785
//# Page 876
// PORT: SOURCE SERVICER.agc:786
//COPYCYC1	TC	QUIKFAZ5
// PORT: Fixed ROM slots 30054.
                    if slot <> 30054 or instruction <> 1898 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1898, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:787
//
// PORT: SOURCE SERVICER.agc:788
//R29?		CA	FLAGWRD3
// PORT: Fixed ROM slots 30055.
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
// PORT: SOURCE SERVICER.agc:789
//		MASK	NR29&RDR
// PORT: Fixed ROM slots 30056.
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
// PORT: SOURCE SERVICER.agc:790
//		CCS	A		# IS NOR29FLG OR READRFLG SET?
// PORT: Fixed ROM slots 30057.
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
// PORT: SOURCE SERVICER.agc:791
//		TCF	R29NODES	# YES, SO DON'T DESIGNATE.
// PORT: Fixed ROM slots 30058.
                    if slot <> 30058 or instruction <> 5492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:792
//
// PORT: SOURCE SERVICER.agc:793
//		CA	RADMODES	# NO, SO R29 IS CALLED FOR.
// PORT: Fixed ROM slots 30059.
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
// PORT: SOURCE SERVICER.agc:794
//		MASK	OCT10002	# IS THE RR NOT ZEROING ITS CDUS, AND
// PORT: Fixed ROM slots 30060.
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
// PORT: SOURCE SERVICER.agc:795
//		CCS	A		# IS THE RENDEZVOUS RADAR IN AUTO MODE?
// PORT: Fixed ROM slots 30061.
                        if slot <> 30061 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:796
//		TCF	R29NODES	# NO, SO DON'T DESIGNATE.
// PORT: Fixed ROM slots 30062.
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
// PORT: SOURCE SERVICER.agc:797
//
// PORT: SOURCE SERVICER.agc:798
//		CA	RADMODES
// PORT: Fixed ROM slots 30063.
                    if slot <> 30063 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:799
//		MASK	PRIO22
// PORT: Fixed ROM slots 30064.
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
// PORT: SOURCE SERVICER.agc:800
//		CCS	A		# IS RR REPOSITIONING OR REMODING?
// PORT: Fixed ROM slots 30065.
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
// PORT: SOURCE SERVICER.agc:801
//		TCF	NOR29NOW	# YES:  COME BACK IN 2 SECONDS & TRY AGAIN.
// PORT: Fixed ROM slots 30066.
                        if slot <> 30066 or instruction <> 5496 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5496, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:802
//
// PORT: SOURCE SERVICER.agc:803
//		TCF	R29
// PORT: Fixed ROM slots 30067.
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
// PORT: SOURCE SERVICER.agc:804
//
// PORT: SOURCE SERVICER.agc:805
//R29NODES	INHINT			# R29 NOT ALLOWED THIS CYCLE.
// PORT: Fixed ROM slots 30068.
                    if slot <> 30068 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:806
//		CS	DESIGBIT	# SHOW THAT DESIGNATION IS OFF.
// PORT: Fixed ROM slots 30069.
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
// PORT: SOURCE SERVICER.agc:807
//		MASK	RADMODES
// PORT: Fixed ROM slots 30070.
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
// PORT: SOURCE SERVICER.agc:808
//		TS	RADMODES
// PORT: Fixed ROM slots 30071.
                        if slot <> 30071 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:809
//
// PORT: SOURCE SERVICER.agc:810
//NOR29NOW 	TC	INTPRET		# INTPRET DOES A RELINT.
// PORT: Fixed ROM slots 30072.
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
// PORT: SOURCE SERVICER.agc:811
//		VLOAD	ABVAL		# MPAC = ABVAL( NEW SM. POSITION VECTOR )
// PORT: Fixed ROM slots 30073.
    30073, 42746,
// PORT: SOURCE SERVICER.agc:812
//			R1S
// PORT: Fixed ROM slots 30074.
    30074, 3830,
// PORT: SOURCE SERVICER.agc:813
//		PUSH	DSU		# 				(2)
// PORT: Fixed ROM slots 30075.
    30075, 38156,
// PORT: SOURCE SERVICER.agc:814
//			/LAND/
// PORT: Fixed ROM slots 30076.
    30076, 2486,
// PORT: SOURCE SERVICER.agc:815
//		STORE	HCALC		# NEW HCALC*2(24)M.
// PORT: Fixed ROM slots 30077.
    30077, 3770,
// PORT: SOURCE SERVICER.agc:816
//		STORE	HCALC1
// PORT: Fixed ROM slots 30078.
    30078, 4090,
// PORT: SOURCE SERVICER.agc:817
//		DMPR	RTB
// PORT: Fixed ROM slots 30079.
    30079, 40058,
// PORT: SOURCE SERVICER.agc:818
//			ALTCONV
// PORT: Fixed ROM slots 30080.
    30080, 22572,
// PORT: SOURCE SERVICER.agc:819
//			SGNAGREE
// PORT: Fixed ROM slots 30081.
    30081, 18196,
// PORT: SOURCE SERVICER.agc:820
//		STOVL	ALTBITS		# ALTITUDE FOR R10 IN BIT UNITS.
// PORT: Fixed ROM slots 30082.
    30082, 24516,
// PORT: SOURCE SERVICER.agc:821
//			UNIT/R/
// PORT: Fixed ROM slots 30083.
    30083, 3774,
// PORT: SOURCE SERVICER.agc:822
//		VXV	UNIT
// PORT: Fixed ROM slots 30084.
    30084, 44602,
// PORT: SOURCE SERVICER.agc:823
//			UHYP
// PORT: Fixed ROM slots 30085.
    30085, 4000,
// PORT: SOURCE SERVICER.agc:824
//		STOVL	UHZP		# DOWNRANGE HALF-UNIT VECTOR FOR R10.
// PORT: Fixed ROM slots 30086.
    30086, 24492,
// PORT: SOURCE SERVICER.agc:825
//			R1S
// PORT: Fixed ROM slots 30087.
    30087, 3830,
// PORT: SOURCE SERVICER.agc:826
//		VXM	VSR4
// PORT: Fixed ROM slots 30088.
    30088, 49802,
// PORT: SOURCE SERVICER.agc:827
//			REFSMMAT
// PORT: Fixed ROM slots 30089.
    30089, 1976,
// PORT: SOURCE SERVICER.agc:828
//		STOVL	RN1		# TEMP. REF. POSITION VECTOR*2(29)M.
// PORT: Fixed ROM slots 30090.
    30090, 24266,
// PORT: SOURCE SERVICER.agc:829
//			V1S
// PORT: Fixed ROM slots 30091.
    30091, 3842,
// PORT: SOURCE SERVICER.agc:830
//		VXM	VSL1
// PORT: Fixed ROM slots 30092.
    30092, 64138,
// PORT: SOURCE SERVICER.agc:831
//			REFSMMAT
// PORT: Fixed ROM slots 30093.
    30093, 1976,
// PORT: SOURCE SERVICER.agc:832
//		STOVL	VN1		# TEMP. REF. VELOCITY VECTOR 2(7) M/CS.
// PORT: Fixed ROM slots 30094.
    30094, 24278,
// PORT: SOURCE SERVICER.agc:833
//			UNIT/R/
// PORT: Fixed ROM slots 30095.
    30095, 3774,
// PORT: SOURCE SERVICER.agc:834
//		VXV	ABVAL
// PORT: Fixed ROM slots 30096.
    30096, 42554,
// PORT: SOURCE SERVICER.agc:835
//# Page 877
// PORT: SOURCE SERVICER.agc:836
//			V1S
// PORT: Fixed ROM slots 30097.
    30097, 3842,
// PORT: SOURCE SERVICER.agc:837
//		SL1	DSQ
// PORT: Fixed ROM slots 30098.
    30098, 52948,
// PORT: SOURCE SERVICER.agc:838
//		DDV
// PORT: Fixed ROM slots 30099.
    30099, 65394,
// PORT: SOURCE SERVICER.agc:839
//		DMPR	RTB
// PORT: Fixed ROM slots 30100.
    30100, 40058,
// PORT: SOURCE SERVICER.agc:840
//			ARCONV1
// PORT: Fixed ROM slots 30101.
    30101, 22576,
// PORT: SOURCE SERVICER.agc:841
//			SGNAGREE
// PORT: Fixed ROM slots 30102.
    30102, 18196,
// PORT: SOURCE SERVICER.agc:842
//COPYCYC2	EXIT			# LEAVE ALTITUDE RATE COMPENSATION IN MPAC
// PORT: Fixed ROM slots 30103.
    30103, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30104–30133.
function agcAotUnit1939 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30118 {
        if slot <= 30110 {
            if slot <= 30106 {
                if slot <= 30104 {
// PORT: SOURCE SERVICER.agc:843
//		INHINT
// PORT: Fixed ROM slots 30104.
                    if slot <> 30104 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30105 {
// PORT: SOURCE SERVICER.agc:844
//		CA	UNIT/R/		# UPDATE RUNIT FOR R10.
// PORT: Fixed ROM slots 30105.
                        if slot <> 30105 or instruction <> 13150 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 862).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:845
//		TS	RUNIT
// PORT: Fixed ROM slots 30106.
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
// PORT: SOURCE SERVICER.agc:846
//		CA	UNIT/R/ +2
// PORT: Fixed ROM slots 30107.
                        if slot <> 30107 or instruction <> 13152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 864).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:847
//		TS	RUNIT +1
// PORT: Fixed ROM slots 30108.
                        if slot <> 30108 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30109 {
// PORT: SOURCE SERVICER.agc:848
//		CA	UNIT/R/ +4
// PORT: Fixed ROM slots 30109.
                        if slot <> 30109 or instruction <> 13154 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 866).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:849
//		TS	RUNIT +2
// PORT: Fixed ROM slots 30110.
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
// PORT: SOURCE SERVICER.agc:850
//		CA	MPAC		# LOAD NEW DALTRATE FOR R10.
// PORT: Fixed ROM slots 30111.
                        if slot <> 30111 or instruction <> 12396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:851
//		TS	DALTRATE
// PORT: Fixed ROM slots 30112.
                        if slot <> 30112 or instruction <> 23502 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23502, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30113 {
// PORT: SOURCE SERVICER.agc:852
//
// PORT: SOURCE SERVICER.agc:853
//		EXTEND
// PORT: Fixed ROM slots 30113.
                        if slot <> 30113 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:854
//		DCA	R1S
// PORT: Fixed ROM slots 30114.
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
// PORT: SOURCE SERVICER.agc:855
//		DXCH	R
// PORT: Fixed ROM slots 30115.
                        if slot <> 30115 or instruction <> 22353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 849, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:856
//		EXTEND
// PORT: Fixed ROM slots 30116.
                        if slot <> 30116 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30117 {
// PORT: SOURCE SERVICER.agc:857
//		DCA	R1S +2
// PORT: Fixed ROM slots 30117.
                        if slot <> 30117 or instruction <> 13181 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 893, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:858
//		DXCH	R +2
// PORT: Fixed ROM slots 30118.
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
// PORT: SOURCE SERVICER.agc:859
//		EXTEND
// PORT: Fixed ROM slots 30119.
                    if slot <> 30119 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30120 {
// PORT: SOURCE SERVICER.agc:860
//		DCA	R1S +4
// PORT: Fixed ROM slots 30120.
                        if slot <> 30120 or instruction <> 13183 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 895, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:861
//		DXCH	R +4
// PORT: Fixed ROM slots 30121.
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
// PORT: SOURCE SERVICER.agc:862
//		EXTEND
// PORT: Fixed ROM slots 30122.
                        if slot <> 30122 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:863
//		DCA	V1S
// PORT: Fixed ROM slots 30123.
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
// PORT: SOURCE SERVICER.agc:864
//		DXCH	V
// PORT: Fixed ROM slots 30124.
                        if slot <> 30124 or instruction <> 22359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 855, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:865
//		EXTEND
// PORT: Fixed ROM slots 30125.
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
// PORT: SOURCE SERVICER.agc:866
//		DCA	V1S +2
// PORT: Fixed ROM slots 30126.
                        if slot <> 30126 or instruction <> 13187 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 899, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:867
//		DXCH	V +2
// PORT: Fixed ROM slots 30127.
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
// PORT: SOURCE SERVICER.agc:868
//		EXTEND
// PORT: Fixed ROM slots 30128.
                        if slot <> 30128 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:869
//		DCA	V1S +4
// PORT: Fixed ROM slots 30129.
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
// PORT: SOURCE SERVICER.agc:870
//		DXCH	V +4
// PORT: Fixed ROM slots 30130.
                        if slot <> 30130 or instruction <> 22363 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 859, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:871
//
// PORT: SOURCE SERVICER.agc:872
//		TCF	COPYCYCL	# COMPLETE THE COPYCYCL.
// PORT: Fixed ROM slots 30131.
                        if slot <> 30131 or instruction <> 5309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5309, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30132 {
// PORT: SOURCE SERVICER.agc:873
//
// PORT: SOURCE SERVICER.agc:874
//# Page 878
// PORT: SOURCE SERVICER.agc:875
//# ALTCHK COMPARES CURRENT ALTITUDE (IN HCALC) WITH A SPECIFIED ALTITUDE FROM A TABLE BEGINNING AT ALTCRIT.
// PORT: SOURCE SERVICER.agc:876
//# ITS CALLING SEQUENCE IS AS FOLLOWS:-
// PORT: SOURCE SERVICER.agc:877
//#
// PORT: SOURCE SERVICER.agc:878
//#	L	CAF	N
// PORT: SOURCE SERVICER.agc:879
//#	L+1	TC	BANKCALL
// PORT: SOURCE SERVICER.agc:880
//#	L+2	CADR	ALTCHK
// PORT: SOURCE SERVICER.agc:881
//#	L+3	RETURN HERE IF HCALC STILL > SPECIFIED CRITERION.   C(L) = +0.
// PORT: SOURCE SERVICER.agc:882
//#	L+4	RETURN HERE IF HCALC < OR = SPECIFIED CRITERION.   C(A) = C(L) = +0
// PORT: SOURCE SERVICER.agc:883
//#
// PORT: SOURCE SERVICER.agc:884
//# ALTCHK MUST BE BANKCALLED EVEN FROM ITS OWN BANK.   N IS THE LOCATION, RELATIVE TO THE TAG ALTCRIT,
// PORT: SOURCE SERVICER.agc:885
//# OF THE BEGINNING OF THE DP CONSTANT TO BE USED AS A CRITERION.
// PORT: SOURCE SERVICER.agc:886
//
// PORT: SOURCE SERVICER.agc:887
//ALTCHK		EXTEND
// PORT: Fixed ROM slots 30132.
                        if slot <> 30132 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:888
//		INDEX	A
// PORT: Fixed ROM slots 30133.
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
// PORT: SOURCE SERVICER.agc:889
//		DCA	ALTCRIT
// PORT: Fixed ROM slots 30134.
    30134, 27520
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30135–30142.
function agcAotUnit1940 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30138 {
        if slot <= 30136 {
            if slot <= 30135 {
// PORT: SOURCE SERVICER.agc:890
//		DXCH	MPAC +1
// PORT: Fixed ROM slots 30135.
                if slot <> 30135 or instruction <> 21614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:891
//		EXTEND
// PORT: Fixed ROM slots 30136.
                if slot <> 30136 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30137 {
// PORT: SOURCE SERVICER.agc:892
//		DCS	HCALC
// PORT: Fixed ROM slots 30137.
                if slot <> 30137 or instruction <> 17245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 861, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:893
//		DAS	MPAC +1
// PORT: Fixed ROM slots 30138.
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
// PORT: SOURCE SERVICER.agc:894
//		TC	BRANCH +4
// PORT: Fixed ROM slots 30139.
                if slot <> 30139 or instruction <> 3543 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3543, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:895
//		CAF	ZERO		# BETTER THAN A NOOP, PERHAPS
// PORT: Fixed ROM slots 30140.
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
// PORT: SOURCE SERVICER.agc:896
//		INCR	BUF2
// PORT: Fixed ROM slots 30141.
                if slot <> 30141 or instruction <> 10331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:897
//		TCF	SWRETURN
// PORT: Fixed ROM slots 30142.
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
// PORT: SOURCE SERVICER.agc:898
//
// PORT: SOURCE SERVICER.agc:899
//ALTCRIT		=	25KFT
// PORT: SOURCE SERVICER.agc:900
//
// PORT: SOURCE SERVICER.agc:901
//25KFT		2DEC	7620 B-24  		# (0)
// PORT: Fixed ROM slots 30143 30144.
    30143, 14, 30144, 14464,
// PORT: SOURCE SERVICER.agc:902
//
// PORT: SOURCE SERVICER.agc:903
//50KFT		2DEC	15240 B-24		# (2)
// PORT: Fixed ROM slots 30145 30146.
    30145, 28, 30146, 28928,
// PORT: SOURCE SERVICER.agc:904
//
// PORT: SOURCE SERVICER.agc:905
//50FT		2DEC	15.24 B-24		# (4)
// PORT: Fixed ROM slots 30147 30148.
    30147, 0, 30148, 488,
// PORT: SOURCE SERVICER.agc:906
//
// PORT: SOURCE SERVICER.agc:907
//30KFT		2DEC	9144 B-24		# (6)
// PORT: Fixed ROM slots 30149 30150.
    30149, 16, 30150, 30464,
// PORT: SOURCE SERVICER.agc:908
//
// PORT: SOURCE SERVICER.agc:909
//2KFT/SEC	DEC	6.096 B-7		# 2000 FT/SEC AT 2(7) M/CS
// PORT: Fixed ROM slots 30151.
    30151, 1560
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30152–30153.
function agcAotUnit1941 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30152 {
// PORT: SOURCE SERVICER.agc:910
//
// PORT: SOURCE SERVICER.agc:911
//
// PORT: SOURCE SERVICER.agc:912
//# (A remark was likely to be needed here to explain XORCHK) 4/Jun/09,FB
// PORT: SOURCE SERVICER.agc:913
//
// PORT: SOURCE SERVICER.agc:914
//XORCHK		CAF	SIX		# ARE WE BELOW 30000 FT?
// PORT: Fixed ROM slots 30152.
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
// PORT: SOURCE SERVICER.agc:915
//		TC	BANKCALL
// PORT: Fixed ROM slots 30153.
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
// PORT: SOURCE SERVICER.agc:916
//		CADR	ALTCHK
// PORT: Fixed ROM slots 30154.
    30154, 56168
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30155–30156.
function agcAotUnit1942 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30155 {
// PORT: SOURCE SERVICER.agc:917
//		TCF	HITEST		# CONTINUE LR UPDATE
// PORT: Fixed ROM slots 30155.
        if slot <> 30155 or instruction <> 5438 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5438, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:918
//		TC	UPFLAG		# YES: INHIBIT X-AXIS OVERRIDE
// PORT: Fixed ROM slots 30156.
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
// PORT: SOURCE SERVICER.agc:919
//		ADRES	XOVINFLG
// PORT: Fixed ROM slots 30157.
    30157, 402
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30158–30158.
function agcAotUnit1943 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:920
//		TC	UPFLAG
// PORT: Fixed ROM slots 30158.
    if slot <> 30158 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1943] to agcAotUnit1943@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:921
//		ADRES	XORFLG
// PORT: Fixed ROM slots 30159.
    30159, 342
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30160–30161.
function agcAotUnit1944 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30160 {
// PORT: SOURCE SERVICER.agc:922
//		TCF	HITEST		# CONTINUE LR UPDATE
// PORT: Fixed ROM slots 30160.
        if slot <> 30160 or instruction <> 5438 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5438, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:923
//
// PORT: SOURCE SERVICER.agc:924
//35KCHK		CAF	TWO		# ARE WE BELOW 35000 FT?
// PORT: Fixed ROM slots 30161.
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

// PORT: Physical bank 33. Shared continuation entries, slots 30162–30162.
function agcAotUnit1945 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:925
//
// PORT: SOURCE SERVICER.agc:926
//# Page 879
// PORT: SOURCE SERVICER.agc:927
//		TC	BANKCALL
// PORT: Fixed ROM slots 30162.
    if slot <> 30162 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1945] to agcAotUnit1945@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:928
//		CADR	ALTCHK
// PORT: Fixed ROM slots 30163.
    30163, 56168
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30164–30165.
function agcAotUnit1946 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30164 {
// PORT: SOURCE SERVICER.agc:929
//		TCF	CONTSERV
// PORT: Fixed ROM slots 30164.
        if slot <> 30164 or instruction <> 5472 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5472, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:930
//		TC	UPFLAG
// PORT: Fixed ROM slots 30165.
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
// PORT: SOURCE SERVICER.agc:931
//		ADRES	READLR		# SET READLR FLAG TO ENABLE LR READING.
// PORT: Fixed ROM slots 30166.
    30166, 348
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30167–30167.
function agcAotUnit1947 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:932
//		TCF	CONTSERV
// PORT: Fixed ROM slots 30167.
    if slot <> 30167 or instruction <> 5472 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5472, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1947] to agcAotUnit1947@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:933
//
// PORT: SOURCE SERVICER.agc:934
//# Page 880
// PORT: SOURCE SERVICER.agc:935
//# ***************************************************************
// PORT: SOURCE SERVICER.agc:936
//
// PORT: SOURCE SERVICER.agc:937
//CALCGRAV	UNIT	PUSH		# SAVE UNIT/R/ IN PUSHLIST	(18)
// PORT: Fixed ROM slots 30168.
    30168, 34396,
// PORT: SOURCE SERVICER.agc:938
//		STORE 	UNIT/R/
// PORT: Fixed ROM slots 30169.
    30169, 3774,
// PORT: SOURCE SERVICER.agc:939
//		LXC,1	SLOAD		# RTX2 = 0 IF EARTH ORBIT, =2 IF LUNAR.
// PORT: Fixed ROM slots 30170.
    30170, 56768,
// PORT: SOURCE SERVICER.agc:940
//			RTX2
// PORT: Fixed ROM slots 30171.
    30171, 3070,
// PORT: SOURCE SERVICER.agc:941
//			RTX2
// PORT: Fixed ROM slots 30172.
    30172, 3072,
// PORT: SOURCE SERVICER.agc:942
//		DCOMP	BMN
// PORT: Fixed ROM slots 30173.
    30173, 41084,
// PORT: SOURCE SERVICER.agc:943
//			CALCGRV1
// PORT: Fixed ROM slots 30174.
    30174, 56298,
// PORT: SOURCE SERVICER.agc:944
//		VLOAD	DOT		#				(12)
// PORT: Fixed ROM slots 30175.
    30175, 41466,
// PORT: SOURCE SERVICER.agc:945
//			UNITZ
// PORT: Fixed ROM slots 30176.
    30176, 6808,
// PORT: SOURCE SERVICER.agc:946
//			UNIT/R/
// PORT: Fixed ROM slots 30177.
    30177, 3774,
// PORT: SOURCE SERVICER.agc:947
//		SL1	PUSH		#				(14)
// PORT: Fixed ROM slots 30178.
    30178, 34516,
// PORT: SOURCE SERVICER.agc:948
//		DSQ	BDSU
// PORT: Fixed ROM slots 30179.
    30179, 37276,
// PORT: SOURCE SERVICER.agc:949
//			DP1/20
// PORT: Fixed ROM slots 30180.
    30180, 23598,
// PORT: SOURCE SERVICER.agc:950
//		PDDL	DDV
// PORT: Fixed ROM slots 30181.
    30181, 47530,
// PORT: SOURCE SERVICER.agc:951
//			RESQ
// PORT: Fixed ROM slots 30182.
    30182, 22592,
// PORT: SOURCE SERVICER.agc:952
//			34D		# (RN)SQ
// PORT: Fixed ROM slots 30183.
    30183, 70,
// PORT: SOURCE SERVICER.agc:953
//		STORE	32D		# TEMP FOR (RE/RN)SQ
// PORT: Fixed ROM slots 30184.
    30184, 66,
// PORT: SOURCE SERVICER.agc:954
//		DMP	DMP
// PORT: Fixed ROM slots 30185.
    30185, 34058,
// PORT: SOURCE SERVICER.agc:955
//			20J
// PORT: Fixed ROM slots 30186.
    30186, 22596,
// PORT: SOURCE SERVICER.agc:956
//		VXSC	PDDL
// PORT: Fixed ROM slots 30187.
    30187, 54754,
// PORT: SOURCE SERVICER.agc:957
//			UNIT/R/
// PORT: Fixed ROM slots 30188.
    30188, 3774,
// PORT: SOURCE SERVICER.agc:958
//		DMP	DMP
// PORT: Fixed ROM slots 30189.
    30189, 34058,
// PORT: SOURCE SERVICER.agc:959
//			2J
// PORT: Fixed ROM slots 30190.
    30190, 22600,
// PORT: SOURCE SERVICER.agc:960
//			32D
// PORT: Fixed ROM slots 30191.
    30191, 66,
// PORT: SOURCE SERVICER.agc:961
//		VXSC	VSL1
// PORT: Fixed ROM slots 30192.
    30192, 64226,
// PORT: SOURCE SERVICER.agc:962
//			UNITZ
// PORT: Fixed ROM slots 30193.
    30193, 6808,
// PORT: SOURCE SERVICER.agc:963
//		VAD	STADR
// PORT: Fixed ROM slots 30194.
    30194, 38490,
// PORT: SOURCE SERVICER.agc:964
//		STORE	UNITGOBL
// PORT: Fixed ROM slots 30195.
    30195, 61788,
// PORT: SOURCE SERVICER.agc:965
//		VAD	PUSH		# MPAC = UNIT GRAVITY VECTOR.	(18)
// PORT: Fixed ROM slots 30196.
    30196, 34394,
// PORT: SOURCE SERVICER.agc:966
//CALCGRV1	DLOAD	NORM		# PERFORM A NORMALIZATION ON RMAGSQ IN
// PORT: Fixed ROM slots 30197.
    30197, 49610,
// PORT: SOURCE SERVICER.agc:967
//			34D		# ORDER TO BE ABLE TO SCALE THE MU FOR
// PORT: Fixed ROM slots 30198.
    30198, 70,
// PORT: SOURCE SERVICER.agc:968
//			X2		# MAXIMUM PRECISION.
// PORT: Fixed ROM slots 30199.
    30199, 80,
// PORT: SOURCE SERVICER.agc:969
//		BDDV*	SLR*
// PORT: Fixed ROM slots 30200.
    30200, 44902,
// PORT: SOURCE SERVICER.agc:970
//			-MUDT,1
// PORT: Fixed ROM slots 30201.
    30201, 22580,
// PORT: SOURCE SERVICER.agc:971
//			0 -21D,2
// PORT: Fixed ROM slots 30202.
    30202, 47910,
// PORT: SOURCE SERVICER.agc:972
//		VXSC	STADR
// PORT: Fixed ROM slots 30203.
    30203, 38626,
// PORT: SOURCE SERVICER.agc:973
//		STORE	GDT1/2		# SCALED AT 2(+7) M/CS
// PORT: Fixed ROM slots 30204.
    30204, 61720,
// PORT: SOURCE SERVICER.agc:974
//		RVQ
// PORT: Fixed ROM slots 30205.
    30205, 65308,
// PORT: SOURCE SERVICER.agc:975
//
// PORT: SOURCE SERVICER.agc:976
//CALCRVG		VLOAD	VXM
// PORT: Fixed ROM slots 30206.
    30206, 50682,
// PORT: SOURCE SERVICER.agc:977
//			DELV
// PORT: Fixed ROM slots 30207.
    30207, 426,
// PORT: SOURCE SERVICER.agc:978
//			REFSMMAT
// PORT: Fixed ROM slots 30208.
    30208, 1976,
// PORT: SOURCE SERVICER.agc:979
//		VXSC	VSL1
// PORT: Fixed ROM slots 30209.
    30209, 64226,
// PORT: SOURCE SERVICER.agc:980
//			KPIP1
// PORT: Fixed ROM slots 30210.
    30210, 22564,
// PORT: SOURCE SERVICER.agc:981
//		STORE	DELVREF
// PORT: Fixed ROM slots 30211.
    30211, 3758,
// PORT: SOURCE SERVICER.agc:982
//		VSR1	PUSH
// PORT: Fixed ROM slots 30212.
    30212, 34532,
// PORT: SOURCE SERVICER.agc:983
//		VAD	PUSH		# (DV-OLDGDT)/2 TO PD SCALED AT 2(+7) M/CS.
// PORT: Fixed ROM slots 30213.
    30213, 34394,
// PORT: SOURCE SERVICER.agc:984
//# Page 881
// PORT: SOURCE SERVICER.agc:985
//			GDT/2
// PORT: Fixed ROM slots 30214.
    30214, 1342,
// PORT: SOURCE SERVICER.agc:986
//		VAD	PDDL
// PORT: Fixed ROM slots 30215.
    30215, 54618,
// PORT: SOURCE SERVICER.agc:987
//			VN
// PORT: Fixed ROM slots 30216.
    30216, 1326,
// PORT: SOURCE SERVICER.agc:988
//			PGUIDE
// PORT: Fixed ROM slots 30217.
    30217, 1360,
// PORT: SOURCE SERVICER.agc:989
//		SL	VXSC
// PORT: Fixed ROM slots 30218.
    30218, 61794,
// PORT: SOURCE SERVICER.agc:990
//			6D
// PORT: Fixed ROM slots 30219.
    30219, 16654,
// PORT: SOURCE SERVICER.agc:991
//		VAD	STQ
// PORT: Fixed ROM slots 30220.
    30220, 36954,
// PORT: SOURCE SERVICER.agc:992
//			RN
// PORT: Fixed ROM slots 30221.
    30221, 1314,
// PORT: SOURCE SERVICER.agc:993
//			31D
// PORT: Fixed ROM slots 30222.
    30222, 62,
// PORT: SOURCE SERVICER.agc:994
//		STCALL	RN1		# TEMP STORAGE OF RN SCALED 2(+29) M
// PORT: Fixed ROM slots 30223.
    30223, 32458,
// PORT: SOURCE SERVICER.agc:995
//			CALCGRAV
// PORT: Fixed ROM slots 30224.
    30224, 56240,
// PORT: SOURCE SERVICER.agc:996
//
// PORT: SOURCE SERVICER.agc:997
//		VAD	VAD
// PORT: Fixed ROM slots 30225.
    30225, 44378,
// PORT: SOURCE SERVICER.agc:998
//		VAD
// PORT: Fixed ROM slots 30226.
    30226, 65370,
// PORT: SOURCE SERVICER.agc:999
//			VN
// PORT: Fixed ROM slots 30227.
    30227, 1326,
// PORT: SOURCE SERVICER.agc:1000
//		STCALL	VN1		# TEMP STORAGE OF VN SCALED 2(+7) M/CS
// PORT: Fixed ROM slots 30228.
    30228, 32470,
// PORT: SOURCE SERVICER.agc:1001
//			31D
// PORT: Fixed ROM slots 30229.
    30229, 62,
// PORT: SOURCE SERVICER.agc:1002
//
// PORT: SOURCE SERVICER.agc:1003
//DP1/20		2DEC	0.05
// PORT: Fixed ROM slots 30230 30231.
    30230, 1638, 30231, 6554,
// PORT: SOURCE SERVICER.agc:1004
//SHIFT11		2DEC	1 B-11
// PORT: Fixed ROM slots 30232 30233.
    30232, 16, 30233, 0,
// PORT: SOURCE SERVICER.agc:1005
//
// PORT: SOURCE SERVICER.agc:1006
//# Page 882
// PORT: SOURCE SERVICER.agc:1007
//#*****************************************************************************
// PORT: SOURCE SERVICER.agc:1008
//# MUNRVG IS A SPECIAL AVERAGE G INTEGRATION ROUTINE USED BY THRUSTING
// PORT: SOURCE SERVICER.agc:1009
//# PROGRAMS WHICH FUNCTION IN THE VICINITY OF AN ASSUMED SPHERICAL MOON.
// PORT: SOURCE SERVICER.agc:1010
//# THE INPUT AND OUTPUT QUANTITIES ARE REFERENCED TO THE STABLE MEMBER
// PORT: SOURCE SERVICER.agc:1011
//# COORDINATE SYSTEM.
// PORT: SOURCE SERVICER.agc:1012
//
// PORT: SOURCE SERVICER.agc:1013
//RVBOTH		VLOAD	PUSH
// PORT: Fixed ROM slots 30234.
    30234, 34554,
// PORT: SOURCE SERVICER.agc:1014
//			G(CSM)
// PORT: Fixed ROM slots 30235.
    30235, 2462,
// PORT: SOURCE SERVICER.agc:1015
//		VAD	PDDL
// PORT: Fixed ROM slots 30236.
    30236, 54618,
// PORT: SOURCE SERVICER.agc:1016
//			V(CSM)
// PORT: Fixed ROM slots 30237.
    30237, 1964,
// PORT: SOURCE SERVICER.agc:1017
//			PGUIDE
// PORT: Fixed ROM slots 30238.
    30238, 1360,
// PORT: SOURCE SERVICER.agc:1018
//		DDV	VXSC
// PORT: Fixed ROM slots 30239.
    30239, 61810,
// PORT: SOURCE SERVICER.agc:1019
//			SHIFT11
// PORT: Fixed ROM slots 30240.
    30240, 23602,
// PORT: SOURCE SERVICER.agc:1020
//		VAD
// PORT: Fixed ROM slots 30241.
    30241, 65370,
// PORT: SOURCE SERVICER.agc:1021
//			R(CSM)
// PORT: Fixed ROM slots 30242.
    30242, 1952,
// PORT: SOURCE SERVICER.agc:1022
//		STCALL	R1S
// PORT: Fixed ROM slots 30243.
    30243, 32502,
// PORT: SOURCE SERVICER.agc:1023
//			MUNGRAV
// PORT: Fixed ROM slots 30244.
    30244, 56496,
// PORT: SOURCE SERVICER.agc:1024
//		VAD	VAD
// PORT: Fixed ROM slots 30245.
    30245, 44378,
// PORT: SOURCE SERVICER.agc:1025
//			V(CSM)
// PORT: Fixed ROM slots 30246.
    30246, 1964,
// PORT: SOURCE SERVICER.agc:1026
//		STADR
// PORT: Fixed ROM slots 30247.
    30247, 65324,
// PORT: SOURCE SERVICER.agc:1027
//		STORE	V1S
// PORT: Fixed ROM slots 30248.
    30248, 61692,
// PORT: SOURCE SERVICER.agc:1028
//		EXIT
// PORT: Fixed ROM slots 30249.
    30249, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30250–30251.
function agcAotUnit1948 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30250 {
// PORT: SOURCE SERVICER.agc:1029
//		TC	QUIKFAZ5
// PORT: Fixed ROM slots 30250.
        if slot <> 30250 or instruction <> 1898 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1898, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:1030
//		TC	INTPRET
// PORT: Fixed ROM slots 30251.
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
// PORT: SOURCE SERVICER.agc:1031
//		VLOAD
// PORT: Fixed ROM slots 30252.
    30252, 65530,
// PORT: SOURCE SERVICER.agc:1032
//			GDT1/2
// PORT: Fixed ROM slots 30253.
    30253, 3814,
// PORT: SOURCE SERVICER.agc:1033
//		STOVL	G(CSM)
// PORT: Fixed ROM slots 30254.
    30254, 22942,
// PORT: SOURCE SERVICER.agc:1034
//			R1S
// PORT: Fixed ROM slots 30255.
    30255, 3830,
// PORT: SOURCE SERVICER.agc:1035
//		STOVL	R(CSM)
// PORT: Fixed ROM slots 30256.
    30256, 22432,
// PORT: SOURCE SERVICER.agc:1036
//			V1S
// PORT: Fixed ROM slots 30257.
    30257, 3842,
// PORT: SOURCE SERVICER.agc:1037
//		STORE	V(CSM)
// PORT: Fixed ROM slots 30258.
    30258, 1964,
// PORT: SOURCE SERVICER.agc:1038
//		EXIT
// PORT: Fixed ROM slots 30259.
    30259, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30260–30261.
function agcAotUnit1949 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30260 {
// PORT: SOURCE SERVICER.agc:1039
//		TC	QUIKFAZ5
// PORT: Fixed ROM slots 30260.
        if slot <> 30260 or instruction <> 1898 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1898, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER.agc:1040
//		TC	INTPRET
// PORT: Fixed ROM slots 30261.
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
// PORT: SOURCE SERVICER.agc:1041
//MUNRVG		VLOAD	VXSC
// PORT: Fixed ROM slots 30262.
    30262, 61946,
// PORT: SOURCE SERVICER.agc:1042
//			DELV
// PORT: Fixed ROM slots 30263.
    30263, 426,
// PORT: SOURCE SERVICER.agc:1043
//			KPIP2
// PORT: Fixed ROM slots 30264.
    30264, 22568,
// PORT: SOURCE SERVICER.agc:1044
//		PUSH	VAD		# 1ST PUSH:  DELV IN UNITS OF 2(8) M/CS
// PORT: Fixed ROM slots 30265.
    30265, 44300,
// PORT: SOURCE SERVICER.agc:1045
//			GDT/2
// PORT: Fixed ROM slots 30266.
    30266, 1342,
// PORT: SOURCE SERVICER.agc:1046
//		PUSH	VAD		# 2ND PUSH:  (DELV + GDT)/2, UNITS OF 2(7)
// PORT: Fixed ROM slots 30267.
    30267, 44300,
// PORT: SOURCE SERVICER.agc:1047
//			V		#				(12)
// PORT: Fixed ROM slots 30268.
    30268, 3758,
// PORT: SOURCE SERVICER.agc:1048
//		PDDL	DDV
// PORT: Fixed ROM slots 30269.
    30269, 47530,
// PORT: SOURCE SERVICER.agc:1049
//			PGUIDE
// PORT: Fixed ROM slots 30270.
    30270, 1360,
// PORT: SOURCE SERVICER.agc:1050
//			SHIFT11
// PORT: Fixed ROM slots 30271.
    30271, 23602,
// PORT: SOURCE SERVICER.agc:1051
//		VXSC
// PORT: Fixed ROM slots 30272.
    30272, 65506,
// PORT: SOURCE SERVICER.agc:1052
//		VAD
// PORT: Fixed ROM slots 30273.
    30273, 65370,
// PORT: SOURCE SERVICER.agc:1053
//			R
// PORT: Fixed ROM slots 30274.
    30274, 3746,
// PORT: SOURCE SERVICER.agc:1054
//		STCALL	R1S		# STORE R SCALED AT 2(+24) M
// PORT: Fixed ROM slots 30275.
    30275, 32502,
// PORT: SOURCE SERVICER.agc:1055
//			MUNGRAV
// PORT: Fixed ROM slots 30276.
    30276, 56496,
// PORT: SOURCE SERVICER.agc:1056
//# Page 883
// PORT: SOURCE SERVICER.agc:1057
//		VAD	VAD
// PORT: Fixed ROM slots 30277.
    30277, 44378,
// PORT: SOURCE SERVICER.agc:1058
//		VAD
// PORT: Fixed ROM slots 30278.
    30278, 65370,
// PORT: SOURCE SERVICER.agc:1059
//			V
// PORT: Fixed ROM slots 30279.
    30279, 3758,
// PORT: SOURCE SERVICER.agc:1060
//		STORE	V1S		# STORE V SCALED AT 2(+7) M/CS.
// PORT: Fixed ROM slots 30280.
    30280, 3842,
// PORT: SOURCE SERVICER.agc:1061
//		ABVAL
// PORT: Fixed ROM slots 30281.
    30281, 65356,
// PORT: SOURCE SERVICER.agc:1062
//		STOVL	ABVEL		# STORE SPEED FOR LR AND DISPLAYS.
// PORT: Fixed ROM slots 30282.
    30282, 24180,
// PORT: SOURCE SERVICER.agc:1063
//			UNIT/R/
// PORT: Fixed ROM slots 30283.
    30283, 3774,
// PORT: SOURCE SERVICER.agc:1064
//		DOT	SL1
// PORT: Fixed ROM slots 30284.
    30284, 59970,
// PORT: SOURCE SERVICER.agc:1065
//			V1S
// PORT: Fixed ROM slots 30285.
    30285, 3842,
// PORT: SOURCE SERVICER.agc:1066
//		STOVL	HDOTDISP	# HDOT = V. UNIT(R)*2(7) M/CS.
// PORT: Fixed ROM slots 30286.
    30286, 24184,
// PORT: SOURCE SERVICER.agc:1067
//			R1S
// PORT: Fixed ROM slots 30287.
    30287, 3830,
// PORT: SOURCE SERVICER.agc:1068
//		VXV	VSL2
// PORT: Fixed ROM slots 30288.
    30288, 59962,
// PORT: SOURCE SERVICER.agc:1069
//			WM
// PORT: Fixed ROM slots 30289.
    30289, 2474,
// PORT: SOURCE SERVICER.agc:1070
//		STODL	DELVS		# LUNAR ROTATION CORRECTION TERM*2(5) M/CS.
// PORT: Fixed ROM slots 30290.
    30290, 16312,
// PORT: SOURCE SERVICER.agc:1071
//			36D
// PORT: Fixed ROM slots 30291.
    30291, 74,
// PORT: SOURCE SERVICER.agc:1072
//		DSU
// PORT: Fixed ROM slots 30292.
    30292, 65322,
// PORT: SOURCE SERVICER.agc:1073
//			/LAND/
// PORT: Fixed ROM slots 30293.
    30293, 2486,
// PORT: SOURCE SERVICER.agc:1074
//		STCALL	HCALC		# FOR NOW, DISPLAY WHETHER POS OR NEG
// PORT: Fixed ROM slots 30294.
    30294, 32442,
// PORT: SOURCE SERVICER.agc:1075
//			MUNRETRN
// PORT: Fixed ROM slots 30295.
    30295, 55906,
// PORT: SOURCE SERVICER.agc:1076
//MUNGRAV		UNIT			# AT 36D HAVE ABVAL(R), AT 34D R.R
// PORT: Fixed ROM slots 30296.
    30296, 65372,
// PORT: SOURCE SERVICER.agc:1077
//		STODL	UNIT/R/
// PORT: Fixed ROM slots 30297.
    30297, 16062,
// PORT: SOURCE SERVICER.agc:1078
//			34D
// PORT: Fixed ROM slots 30298.
    30298, 70,
// PORT: SOURCE SERVICER.agc:1079
//		SL	BDDV
// PORT: Fixed ROM slots 30299.
    30299, 46434,
// PORT: SOURCE SERVICER.agc:1080
//			6D
// PORT: Fixed ROM slots 30300.
    30300, 16654,
// PORT: SOURCE SERVICER.agc:1081
//			-MUDTMUN
// PORT: Fixed ROM slots 30301.
    30301, 22588,
// PORT: SOURCE SERVICER.agc:1082
//		DMP	VXSC
// PORT: Fixed ROM slots 30302.
    30302, 61706,
// PORT: SOURCE SERVICER.agc:1083
//			SHIFT11
// PORT: Fixed ROM slots 30303.
    30303, 23602,
// PORT: SOURCE SERVICER.agc:1084
//			UNIT/R/
// PORT: Fixed ROM slots 30304.
    30304, 3774,
// PORT: SOURCE SERVICER.agc:1085
//		STORE	GDT1/2		# 1/2GDT SCALED AT 2(7) M/CS.
// PORT: Fixed ROM slots 30305.
    30305, 3814,
// PORT: SOURCE SERVICER.agc:1086
//		RVQ
// PORT: Fixed ROM slots 30306.
    30306, 65308,
// PORT: SOURCE SERVICER.agc:1087
//
// PORT: SOURCE SERVICER.agc:1088
//1.95SECS	DEC	195
// PORT: Fixed ROM slots 30307.
    30307, 390,
// PORT: SOURCE SERVICER.agc:1089
//7.5		2DEC	.02286 B-6	# 7.5 FT/SEC AT 2(6) M/CS
// PORT: Fixed ROM slots 30308 30309.
    30308, 10, 30309, 27924,
// PORT: SOURCE SERVICER.agc:1090
//
// PORT: SOURCE SERVICER.agc:1091
//2SEC(18)	2DEC	200 B-18
// PORT: Fixed ROM slots 30310 30311.
    30310, 24, 30311, 16384,
// PORT: SOURCE SERVICER.agc:1092
//
// PORT: SOURCE SERVICER.agc:1093
//2SEC(28)	2OCT	0000000310	# 2SEC AT 2(28)
// PORT: Fixed ROM slots 30312 30313.
    30312, 0, 30313, 400,
// PORT: SOURCE SERVICER.agc:1094
//
// PORT: SOURCE SERVICER.agc:1095
//4SEC(28)	2DEC	400 B-28
// PORT: Fixed ROM slots 30314 30315.
    30314, 0, 30315, 800,
// PORT: SOURCE SERVICER.agc:1096
//
// PORT: SOURCE SERVICER.agc:1097
//BITS4-7		OCT	110
// PORT: Fixed ROM slots 30316.
    30316, 144
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30317–30327.
function agcAotUnit1950 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30321 {
        if slot <= 30318 {
            if slot <= 30317 {
// PORT: SOURCE SERVICER.agc:1098
//
// PORT: SOURCE SERVICER.agc:1099
//
// PORT: SOURCE SERVICER.agc:1100
//# Page 884
// PORT: SOURCE SERVICER.agc:1101
//UPDATCHK	CAF	NOLRRBIT	# SEE IF LR UPDATE INHIBITED.
// PORT: Fixed ROM slots 30317.
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
// PORT: SOURCE SERVICER.agc:1102
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 30318.
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
// PORT: SOURCE SERVICER.agc:1103
//		CCS	A
// PORT: Fixed ROM slots 30319.
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
// PORT: SOURCE SERVICER.agc:1104
//		TCF	CONTSERV	# IT IS -- NO LR UPDATE
// PORT: Fixed ROM slots 30320.
                    if slot <> 30320 or instruction <> 5472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5472, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1105
//		CAF	RNGEDBIT	# NO INHIBIT -- SEE ALT MEAS. THIS CYCLE.
// PORT: Fixed ROM slots 30321.
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
// PORT: SOURCE SERVICER.agc:1106
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 30322.
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
// PORT: SOURCE SERVICER.agc:1107
//		EXTEND
// PORT: Fixed ROM slots 30323.
                    if slot <> 30323 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1108
//		BZF	VMEASCHK	# NO ALT MEAS THIS CYCLE -- CHECK FOR VEL
// PORT: Fixed ROM slots 30324.
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
// PORT: SOURCE SERVICER.agc:1109
//
// PORT: SOURCE SERVICER.agc:1110
//POSUPDAT	CA	FIXLOC		# SET PUSHLIST TO ZERO
// PORT: Fixed ROM slots 30325.
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
// PORT: SOURCE SERVICER.agc:1111
//		TS	PUSHLOC
// PORT: Fixed ROM slots 30326.
                    if slot <> 30326 or instruction <> 22646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22646, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1112
//
// PORT: SOURCE SERVICER.agc:1113
//		TC	INTPRET
// PORT: Fixed ROM slots 30327.
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
// PORT: SOURCE SERVICER.agc:1114
//		VLOAD	VXM
// PORT: Fixed ROM slots 30328.
    30328, 50682,
// PORT: SOURCE SERVICER.agc:1115
//			HBEAMNB
// PORT: Fixed ROM slots 30329.
    30329, 2422,
// PORT: SOURCE SERVICER.agc:1116
//			XNBPIP		# HBEAM SM AT 2(2)
// PORT: Fixed ROM slots 30330.
    30330, 2252,
// PORT: SOURCE SERVICER.agc:1117
//		PDVL	VSL2		# STORE HBEAM IN PD 0-5
// PORT: Fixed ROM slots 30331.
    30331, 60058,
// PORT: SOURCE SERVICER.agc:1118
//			V1S		# SCALE V AT 2(5) M/CS
// PORT: Fixed ROM slots 30332.
    30332, 3842,
// PORT: SOURCE SERVICER.agc:1119
//		VAD	DOT
// PORT: Fixed ROM slots 30333.
    30333, 41306,
// PORT: SOURCE SERVICER.agc:1120
//			DELVS		# V RELATIVE TO SURFACE AT 2(5) M/CS
// PORT: Fixed ROM slots 30334.
    30334, 4024,
// PORT: SOURCE SERVICER.agc:1121
//			0D		# V ALONG HBEAM AT 2(7) M/CS.
// PORT: Fixed ROM slots 30335.
    30335, 2,
// PORT: SOURCE SERVICER.agc:1122
//		DMP	EXIT
// PORT: Fixed ROM slots 30336.
    30336, 65034,
// PORT: SOURCE SERVICER.agc:1123
//			RADSKAL		# SCALE TO RADAR COUNTS X 5
// PORT: Fixed ROM slots 30337.
    30337, 1498
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30338–30344.
function agcAotUnit1951 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30340 {
        if slot <= 30338 {
// PORT: SOURCE SERVICER.agc:1124
//
// PORT: SOURCE SERVICER.agc:1125
//		CS	FLGWRD12	# TEST LR ALTITUDE SCALE FACTOR
// PORT: Fixed ROM slots 30338.
            if slot <> 30338 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30339 {
// PORT: SOURCE SERVICER.agc:1126
//		MASK	ALTSCBIT
// PORT: Fixed ROM slots 30339.
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
// PORT: SOURCE SERVICER.agc:1127
//		EXTEND
// PORT: Fixed ROM slots 30340.
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
// PORT: SOURCE SERVICER.agc:1128
//		BZF	+3		# BRANCH IF HIGH SCALE
// PORT: Fixed ROM slots 30341.
                if slot <> 30341 or instruction <> 5768 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1129
//
// PORT: SOURCE SERVICER.agc:1130
//		CA	SKALSKAL	# RESCALE IF LOW SCALE
// PORT: Fixed ROM slots 30342.
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
// PORT: SOURCE SERVICER.agc:1131
//		TC	SHORTMP
// PORT: Fixed ROM slots 30343.
                if slot <> 30343 or instruction <> 3783 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3783, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1132
//
// PORT: SOURCE SERVICER.agc:1133
// 	+3	TC	INTPRET
// PORT: Fixed ROM slots 30344.
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
// PORT: SOURCE SERVICER.agc:1134
// 		DAD	SL		# CORRECT HMEAS FOR DOPPLER EFFECT
// PORT: Fixed ROM slots 30345.
    30345, 45338,
// PORT: SOURCE SERVICER.agc:1135
//			HMEAS
// PORT: Fixed ROM slots 30346.
    30346, 3930,
// PORT: SOURCE SERVICER.agc:1136
//			7D
// PORT: Fixed ROM slots 30347.
    30347, 16656,
// PORT: SOURCE SERVICER.agc:1137
//		DMP	VXSC		# SLANT RANGE AT 2(21), PUSH UP FOR HBEAM
// PORT: Fixed ROM slots 30348.
    30348, 61706,
// PORT: SOURCE SERVICER.agc:1138
//			HSCAL		# SLANT RANGE VECTOR AT 2(23) M
// PORT: Fixed ROM slots 30349.
    30349, 22546,
// PORT: SOURCE SERVICER.agc:1139
//		DOT	DSU
// PORT: Fixed ROM slots 30350.
    30350, 38210,
// PORT: SOURCE SERVICER.agc:1140
//			UNIT/R/		# ALTITUDE AT 2(24) M
// PORT: Fixed ROM slots 30351.
    30351, 3774,
// PORT: SOURCE SERVICER.agc:1141
//			HCALC		# DELTA H AT 2(24) M
// PORT: Fixed ROM slots 30352.
    30352, 3770,
// PORT: SOURCE SERVICER.agc:1142
//		STORE	DELTAH
// PORT: Fixed ROM slots 30353.
    30353, 3946,
// PORT: SOURCE SERVICER.agc:1143
//		EXIT
// PORT: Fixed ROM slots 30354.
    30354, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30355–30359.
function agcAotUnit1952 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30356 {
        if slot <= 30355 {
// PORT: SOURCE SERVICER.agc:1144
//
// PORT: SOURCE SERVICER.agc:1145
//		CA	FLGWRD11
// PORT: Fixed ROM slots 30355.
            if slot <> 30355 or instruction <> 12359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 71).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1146
//		MASK	PSTHIBIT
// PORT: Fixed ROM slots 30356.
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
// PORT: SOURCE SERVICER.agc:1147
//		EXTEND			# DO NOT PERFORM DATA REASONABLENESS TEST
// PORT: Fixed ROM slots 30357.
            if slot <> 30357 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30358 {
// PORT: SOURCE SERVICER.agc:1148
//		BZF	NOREASON	# UNTIL AFTER HIGATE
// PORT: Fixed ROM slots 30358.
                if slot <> 30358 or instruction <> 5795 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1149
//# Page 885
// PORT: SOURCE SERVICER.agc:1150
//		TC	INTPRET
// PORT: Fixed ROM slots 30359.
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
// PORT: SOURCE SERVICER.agc:1151
//		ABS	DSU
// PORT: Fixed ROM slots 30360.
    30360, 38220,
// PORT: SOURCE SERVICER.agc:1152
//			DELQFIX		# ABS(DELTAH) - DQFIX	50 FT NOM
// PORT: Fixed ROM slots 30361.
    30361, 2722,
// PORT: SOURCE SERVICER.agc:1153
//		SL3	DSU		# SCALE TO 2(21)
// PORT: Fixed ROM slots 30362.
    30362, 38228,
// PORT: SOURCE SERVICER.agc:1154
//			HCALC		# ABS(DELTAH) - (50 + HCALC/8) AT 2(21)
// PORT: Fixed ROM slots 30363.
    30363, 3770,
// PORT: SOURCE SERVICER.agc:1155
//		EXIT
// PORT: Fixed ROM slots 30364.
    30364, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30365–30369.
function agcAotUnit1953 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30366 {
        if slot <= 30365 {
// PORT: SOURCE SERVICER.agc:1156
//
// PORT: SOURCE SERVICER.agc:1157
//		INCR	LRLCTR
// PORT: Fixed ROM slots 30365.
            if slot <> 30365 or instruction <> 11192 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 952).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1158
//		TC	BRANCH
// PORT: Fixed ROM slots 30366.
            if slot <> 30366 or instruction <> 3539 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3539, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30367 {
// PORT: SOURCE SERVICER.agc:1159
//		TCF	HFAIL		# DELTA H TOO LARGE
// PORT: Fixed ROM slots 30367.
            if slot <> 30367 or instruction <> 6000 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6000, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30368 {
// PORT: SOURCE SERVICER.agc:1160
//		TCF	HFAIL		# DELTA H TOO LARGE
// PORT: Fixed ROM slots 30368.
                if slot <> 30368 or instruction <> 6000 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6000, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1161
//		TC	DOWNFLAG	# TURN OFF ALT FAIL LAMP
// PORT: Fixed ROM slots 30369.
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
// PORT: SOURCE SERVICER.agc:1162
//		ADRES	HFLSHFLG
// PORT: Fixed ROM slots 30370.
    30370, 358
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30371–30375.
function agcAotUnit1954 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30372 {
        if slot <= 30371 {
// PORT: SOURCE SERVICER.agc:1163
//
// PORT: SOURCE SERVICER.agc:1164
//NOREASON	CS	FLGWRD11
// PORT: Fixed ROM slots 30371.
            if slot <> 30371 or instruction <> 16455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 71).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1165
//		MASK	LRINHBIT
// PORT: Fixed ROM slots 30372.
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
// PORT: SOURCE SERVICER.agc:1166
//		CCS	A
// PORT: Fixed ROM slots 30373.
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
// PORT: SOURCE SERVICER.agc:1167
//		TCF	VMEASCHK	# UPDATE INHIBITED -- TEST VELOCITY ANYWAY
// PORT: Fixed ROM slots 30374.
                if slot <> 30374 or instruction <> 5832 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5832, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1168
//
// PORT: SOURCE SERVICER.agc:1169
//		TC	INTPRET		# DO POSITION UPDATE
// PORT: Fixed ROM slots 30375.
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
// PORT: SOURCE SERVICER.agc:1170
//		DLOAD	SR4
// PORT: Fixed ROM slots 30376.
    30376, 33482,
// PORT: SOURCE SERVICER.agc:1171
//			HCALC		# RESCALE H TO 2(28)M
// PORT: Fixed ROM slots 30377.
    30377, 3770,
// PORT: SOURCE SERVICER.agc:1172
//		EXIT
// PORT: Fixed ROM slots 30378.
    30378, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30379–30397.
function agcAotUnit1955 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30387 {
        if slot <= 30382 {
            if slot <= 30380 {
                if slot <= 30379 {
// PORT: SOURCE SERVICER.agc:1173
//		EXTEND
// PORT: Fixed ROM slots 30379.
                    if slot <> 30379 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1174
//		DCA	DELTAH		# STORE DELTAH IN MPAC AND
// PORT: Fixed ROM slots 30380.
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
// PORT: SOURCE SERVICER.agc:1175
//		DXCH	MPAC		# BRING HCALC INTO A,L
// PORT: Fixed ROM slots 30381.
                    if slot <> 30381 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1176
//		TC	ALSIGNAG
// PORT: Fixed ROM slots 30382.
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
// PORT: SOURCE SERVICER.agc:1177
//		EXTEND			# IF HIGH PART OF HCALC IS NON-ZERO, THEN
// PORT: Fixed ROM slots 30383.
                    if slot <> 30383 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1178
//		BZF	+2		# HCALC > HMAX,
// PORT: Fixed ROM slots 30384.
                    if slot <> 30384 or instruction <> 5810 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5810, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30385 {
// PORT: SOURCE SERVICER.agc:1179
//		TCF	VMEASCHK	# SO UPDATE IS BYPASSED
// PORT: Fixed ROM slots 30385.
                    if slot <> 30385 or instruction <> 5832 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5832, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30386 {
// PORT: SOURCE SERVICER.agc:1180
//		TS	MPAC +2		#	FOR LATER SHORTMP
// PORT: Fixed ROM slots 30386.
                        if slot <> 30386 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1181
//
// PORT: SOURCE SERVICER.agc:1182
//		CS	L		# -H AT 2(14) M
// PORT: Fixed ROM slots 30387.
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
// PORT: SOURCE SERVICER.agc:1183
//		AD	LRHMAX		# HMAX - H
// PORT: Fixed ROM slots 30388.
                    if slot <> 30388 or instruction <> 25360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 784).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1184
//		EXTEND
// PORT: Fixed ROM slots 30389.
                    if slot <> 30389 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30390 {
// PORT: SOURCE SERVICER.agc:1185
//		BZMF	VMEASCHK	# IF H >HMAX, BYPASS UPDATE
// PORT: Fixed ROM slots 30390.
                    if slot <> 30390 or instruction <> 26312 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26312, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30391 {
// PORT: SOURCE SERVICER.agc:1186
//		EXTEND
// PORT: Fixed ROM slots 30391.
                        if slot <> 30391 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1187
//		MP	LRWH		# WH(HMAX - H)
// PORT: Fixed ROM slots 30392.
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
// PORT: SOURCE SERVICER.agc:1188
//		EXTEND
// PORT: Fixed ROM slots 30393.
                    if slot <> 30393 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1189
//		DV	LRHMAX		# WH(1 - H/HMAX)
// PORT: Fixed ROM slots 30394.
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
// PORT: SOURCE SERVICER.agc:1190
//		TS	MPTEMP
// PORT: Fixed ROM slots 30395.
                    if slot <> 30395 or instruction <> 22621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30396 {
// PORT: SOURCE SERVICER.agc:1191
//		TC	SHORTMP2	# DELTAH (WH)(1 - H/HMAX) IN MPAC
// PORT: Fixed ROM slots 30396.
                        if slot <> 30396 or instruction <> 3787 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3787, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1192
//		TC	INTPRET		# MODE IS DP FROM ABOVE
// PORT: Fixed ROM slots 30397.
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
// PORT: SOURCE SERVICER.agc:1193
//		SL1
// PORT: Fixed ROM slots 30398.
    30398, 65492,
// PORT: SOURCE SERVICER.agc:1194
//		VXSC	VAD
// PORT: Fixed ROM slots 30399.
    30399, 44514,
// PORT: SOURCE SERVICER.agc:1195
//			UNIT/R/		# DELTAR = DH(WH)(1 - H/HMAX) UNIT/R/
// PORT: Fixed ROM slots 30400.
    30400, 3774,
// PORT: SOURCE SERVICER.agc:1196
//			R1S
// PORT: Fixed ROM slots 30401.
    30401, 3830,
// PORT: SOURCE SERVICER.agc:1197
//		STCALL	GNUR
// PORT: Fixed ROM slots 30402.
    30402, 32606,
// PORT: SOURCE SERVICER.agc:1198
//			MUNGRAV
// PORT: Fixed ROM slots 30403.
    30403, 56496,
// PORT: SOURCE SERVICER.agc:1199
//		EXIT
// PORT: Fixed ROM slots 30404.
    30404, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30405–30418.
function agcAotUnit1956 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30411 {
        if slot <= 30407 {
            if slot <= 30405 {
// PORT: SOURCE SERVICER.agc:1200
//# Page 886
// PORT: SOURCE SERVICER.agc:1201
//		TC	QUIKFAZ5
// PORT: Fixed ROM slots 30405.
                if slot <> 30405 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30406 {
// PORT: SOURCE SERVICER.agc:1202
//
// PORT: SOURCE SERVICER.agc:1203
//		CA	ZERO
// PORT: Fixed ROM slots 30406.
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
// PORT: SOURCE SERVICER.agc:1204
//RUPDATED	TC	GNURVST
// PORT: Fixed ROM slots 30407.
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
// PORT: SOURCE SERVICER.agc:1205
//
// PORT: SOURCE SERVICER.agc:1206
//VMEASCHK	TC	QUIKFAZ5	# RESTART AT NEXT LOCATION
// PORT: Fixed ROM slots 30408.
                    if slot <> 30408 or instruction <> 1898 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1898, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1207
//		CS	FLGWRD11
// PORT: Fixed ROM slots 30409.
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
// PORT: SOURCE SERVICER.agc:1208
//		MASK	VELDABIT	# IS V READING AVAILABLE?
// PORT: Fixed ROM slots 30410.
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
// PORT: SOURCE SERVICER.agc:1209
//		CCS	A
// PORT: Fixed ROM slots 30411.
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
// PORT: SOURCE SERVICER.agc:1210
//		TCF	VALTCHK		# NO:  SEE IF V READING TO BE TAKEN
// PORT: Fixed ROM slots 30412.
                if slot <> 30412 or instruction <> 5964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30413 {
// PORT: SOURCE SERVICER.agc:1211
//
// PORT: SOURCE SERVICER.agc:1212
//VELUPDAT	CS	VSELECT		# PROCESS VELOCITY DATA
// PORT: Fixed ROM slots 30413.
                    if slot <> 30413 or instruction <> 17321 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 937).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1213
//		TS	L
// PORT: Fixed ROM slots 30414.
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
// PORT: SOURCE SERVICER.agc:1214
//		ADS	L		# -2 VSELECT IN L
// PORT: Fixed ROM slots 30415.
                    if slot <> 30415 or instruction <> 11265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1215
//		AD	L
// PORT: Fixed ROM slots 30416.
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
// PORT: SOURCE SERVICER.agc:1216
//		AD	L		# -6 VSELECT IN A
// PORT: Fixed ROM slots 30417.
                    if slot <> 30417 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1217
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 30418.
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
// PORT: SOURCE SERVICER.agc:1218
//		DXCH	X1		# X1 = -6 VSELECT, X2 = -2 VSELECT
// PORT: Fixed ROM slots 30419.
    30419, 43086
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30420–30428.
function agcAotUnit1957 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30423 {
        if slot <= 30421 {
            if slot <= 30420 {
// PORT: SOURCE SERVICER.agc:1219
//
// PORT: SOURCE SERVICER.agc:1220
//		CA	EBANK4
// PORT: Fixed ROM slots 30420.
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
// PORT: SOURCE SERVICER.agc:1221
//		TS	EBANK
// PORT: Fixed ROM slots 30421.
                if slot <> 30421 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30422 {
// PORT: SOURCE SERVICER.agc:1222
//		EBANK=	LRXCDU
// PORT: SOURCE SERVICER.agc:1223
//
// PORT: SOURCE SERVICER.agc:1224
//		CA	LRYCDU		# STORE LRCDUS IN CDUSPOTS
// PORT: Fixed ROM slots 30422.
                if slot <> 30422 or instruction <> 13229 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 941).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1225
//		TS	CDUSPOT
// PORT: Fixed ROM slots 30423.
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
// PORT: SOURCE SERVICER.agc:1226
//		CA	LRZCDU
// PORT: Fixed ROM slots 30424.
                if slot <> 30424 or instruction <> 13230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 942).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1227
//		TS	CDUSPOT +2
// PORT: Fixed ROM slots 30425.
                if slot <> 30425 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30426 {
// PORT: SOURCE SERVICER.agc:1228
//		CA	LRXCDU
// PORT: Fixed ROM slots 30426.
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
// PORT: SOURCE SERVICER.agc:1229
//		TS	CDUSPOT +4
// PORT: Fixed ROM slots 30427.
                    if slot <> 30427 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1230
//
// PORT: SOURCE SERVICER.agc:1231
//		TC	BANKCALL
// PORT: Fixed ROM slots 30428.
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
// PORT: SOURCE SERVICER.agc:1232
//		CADR	QUICTRIG	# GET SINES AND COSINES FOR NBSM
// PORT: Fixed ROM slots 30429.
    30429, 40730
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30430–30432.
function agcAotUnit1958 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30430 {
// PORT: SOURCE SERVICER.agc:1233
//
// PORT: SOURCE SERVICER.agc:1234
//		CA	FIXLOC
// PORT: Fixed ROM slots 30430.
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
// PORT: SOURCE SERVICER.agc:1235
//		TS	PUSHLOC		# SET PD TO ZERO
// PORT: Fixed ROM slots 30431.
            if slot <> 30431 or instruction <> 22646 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22646, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1236
//
// PORT: SOURCE SERVICER.agc:1237
//		TC	INTPRET
// PORT: Fixed ROM slots 30432.
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
// PORT: SOURCE SERVICER.agc:1238
//		VLOAD*	CALL
// PORT: Fixed ROM slots 30433.
    30433, 38134,
// PORT: SOURCE SERVICER.agc:1239
//			VZBEAMNB,1	# CONVERT VBEAM FROM NB TO SM
// PORT: Fixed ROM slots 30434.
    30434, 2354,
// PORT: SOURCE SERVICER.agc:1240
//			*NBSM*
// PORT: Fixed ROM slots 30435.
    30435, 40822,
// PORT: SOURCE SERVICER.agc:1241
//		PDDL	SL		# STORE IN PD 0-5
// PORT: Fixed ROM slots 30436.
    30436, 45482,
// PORT: SOURCE SERVICER.agc:1242
//			VMEAS		# LOAD VELOCITY MEASUREMENT
// PORT: Fixed ROM slots 30437.
    30437, 3926,
// PORT: SOURCE SERVICER.agc:1243
//			12D
// PORT: Fixed ROM slots 30438.
    30438, 16666,
// PORT: SOURCE SERVICER.agc:1244
//		DMP*	PUSH		# SCALE TO M/CS AT 2(6)
// PORT: Fixed ROM slots 30439.
    30439, 34310,
// PORT: SOURCE SERVICER.agc:1245
//			VZSCAL,2	# AND STORE IN PD 6-7
// PORT: Fixed ROM slots 30440.
    30440, 42984,
// PORT: SOURCE SERVICER.agc:1246
//		EXIT
// PORT: Fixed ROM slots 30441.
    30441, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30442–30455.
function agcAotUnit1959 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30448 {
        if slot <= 30444 {
            if slot <= 30442 {
// PORT: SOURCE SERVICER.agc:1247
//		CS	ONE
// PORT: Fixed ROM slots 30442.
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
// PORT: SOURCE SERVICER.agc:1248
//		TS	MODE		# CHANGE STORE MODE TO VECTOR
// PORT: Fixed ROM slots 30443.
                    if slot <> 30443 or instruction <> 22643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1249
//
// PORT: SOURCE SERVICER.agc:1250
//		CA	PIPTEM		# STORE DELV IN MPAC
// PORT: Fixed ROM slots 30444.
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
// PORT: SOURCE SERVICER.agc:1251
//# Page 887
// PORT: SOURCE SERVICER.agc:1252
//		ZL
// PORT: Fixed ROM slots 30445.
                    if slot <> 30445 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1253
//		DXCH	MPAC
// PORT: Fixed ROM slots 30446.
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
// PORT: SOURCE SERVICER.agc:1254
//
// PORT: SOURCE SERVICER.agc:1255
//		CA	PIPTEM +1
// PORT: Fixed ROM slots 30447.
                    if slot <> 30447 or instruction <> 13232 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 944).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1256
//		ZL
// PORT: Fixed ROM slots 30448.
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
// PORT: SOURCE SERVICER.agc:1257
//		DXCH	MPAC +3
// PORT: Fixed ROM slots 30449.
                if slot <> 30449 or instruction <> 21616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30450 {
// PORT: SOURCE SERVICER.agc:1258
//
// PORT: SOURCE SERVICER.agc:1259
//		CA	PIPTEM +2
// PORT: Fixed ROM slots 30450.
                    if slot <> 30450 or instruction <> 13233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 945).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1260
//		ZL
// PORT: Fixed ROM slots 30451.
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
// PORT: SOURCE SERVICER.agc:1261
//		DXCH	MPAC +5
// PORT: Fixed ROM slots 30452.
                    if slot <> 30452 or instruction <> 21618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1262
//
// PORT: SOURCE SERVICER.agc:1263
//		CA	EBANK7
// PORT: Fixed ROM slots 30453.
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
// PORT: SOURCE SERVICER.agc:1264
//		TS	EBANK		# RESTORE EBANK 7
// PORT: Fixed ROM slots 30454.
                    if slot <> 30454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1265
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:1266
//		TC	INTPRET
// PORT: Fixed ROM slots 30455.
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
// PORT: SOURCE SERVICER.agc:1267
//		VXSC	PDDL
// PORT: Fixed ROM slots 30456.
    30456, 54754,
// PORT: SOURCE SERVICER.agc:1268
//			KPIP1		# SCALE DELV TO 2(7) M/CS AND PUSH
// PORT: Fixed ROM slots 30457.
    30457, 22564,
// PORT: SOURCE SERVICER.agc:1269
//			LRVTIME		# TIME OF DELV AT 2(28) CS
// PORT: Fixed ROM slots 30458.
    30458, 2390,
// PORT: SOURCE SERVICER.agc:1270
//		DSU	DDV
// PORT: Fixed ROM slots 30459.
    30459, 47402,
// PORT: SOURCE SERVICER.agc:1271
//			PIPTIME		# TU - T(N-1)
// PORT: Fixed ROM slots 30460.
    30460, 1338,
// PORT: SOURCE SERVICER.agc:1272
//			2SEC(28)
// PORT: Fixed ROM slots 30461.
    30461, 23762,
// PORT: SOURCE SERVICER.agc:1273
//		VXSC	VSL1		# G(N-1)(TU - T(N-1))
// PORT: Fixed ROM slots 30462.
    30462, 64226,
// PORT: SOURCE SERVICER.agc:1274
//			GDT/2		# SCALED AT 2(7) M/CS
// PORT: Fixed ROM slots 30463.
    30463, 1342,
// PORT: SOURCE SERVICER.agc:1275
//		VAD	VAD		# PUSH UP FOR DELV
// PORT: Fixed ROM slots 30464.
    30464, 44378,
// PORT: SOURCE SERVICER.agc:1276
//			V		# VU = V(N-1) + DELVU + G(N-1) DTU
// PORT: Fixed ROM slots 30465.
    30465, 3758,
// PORT: SOURCE SERVICER.agc:1277
//		VSL2	VAD		# SCALE TO 2(5) M/CS AND SUBTRACT
// PORT: Fixed ROM slots 30466.
    30466, 44500,
// PORT: SOURCE SERVICER.agc:1278
//			DELVS		#	MOON ROTATION.
// PORT: Fixed ROM slots 30467.
    30467, 4024,
// PORT: SOURCE SERVICER.agc:1279
//		PUSH	ABVAL		# STORE IN PD
// PORT: Fixed ROM slots 30468.
    30468, 42508,
// PORT: SOURCE SERVICER.agc:1280
//		SR4	DAD		# ABS(VM)/8 + 7.5 AT 2(6)
// PORT: Fixed ROM slots 30469.
    30469, 36100,
// PORT: SOURCE SERVICER.agc:1281
//			7.5
// PORT: Fixed ROM slots 30470.
    30470, 23754,
// PORT: SOURCE SERVICER.agc:1282
//		STOVL	20D		# STORE IN 20D AND PICK UP VM
// PORT: Fixed ROM slots 30471.
    30471, 20522,
// PORT: SOURCE SERVICER.agc:1283
//		DOT	BDSU		# V(EST) AT 2(6)
// PORT: Fixed ROM slots 30472.
    30472, 37186,
// PORT: SOURCE SERVICER.agc:1284
//			0		# DELTAV = VMEAS - V(EST)
// PORT: Fixed ROM slots 30473.
    30473, 2,
// PORT: SOURCE SERVICER.agc:1285
//		PUSH	ABS
// PORT: Fixed ROM slots 30474.
    30474, 42508,
// PORT: SOURCE SERVICER.agc:1286
//		DSU	EXIT		# ABS(DV) - (7.5 + ABS(VM)/8))
// PORT: Fixed ROM slots 30475.
    30475, 65066,
// PORT: SOURCE SERVICER.agc:1287
//			20D
// PORT: Fixed ROM slots 30476.
    30476, 42
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30477–30481.
function agcAotUnit1960 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30478 {
        if slot <= 30477 {
// PORT: SOURCE SERVICER.agc:1288
//
// PORT: SOURCE SERVICER.agc:1289
//		INCR	LRMCTR
// PORT: Fixed ROM slots 30477.
            if slot <> 30477 or instruction <> 11194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 954).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1290
//		TC	BRANCH
// PORT: Fixed ROM slots 30478.
            if slot <> 30478 or instruction <> 3539 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3539, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30479 {
// PORT: SOURCE SERVICER.agc:1291
//		TCF	VFAIL		# DELTA V TOO LARGE.	ALARM
// PORT: Fixed ROM slots 30479.
            if slot <> 30479 or instruction <> 6013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6013, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30480 {
// PORT: SOURCE SERVICER.agc:1292
//		TCF	VFAIL		# DELTA V TOO LARGE.	ALARM
// PORT: Fixed ROM slots 30480.
                if slot <> 30480 or instruction <> 6013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1293
//
// PORT: SOURCE SERVICER.agc:1294
//		TC	DOWNFLAG	# TURN OFF VEL FAIL LAMP
// PORT: Fixed ROM slots 30481.
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
// PORT: SOURCE SERVICER.agc:1295
//		ADRES	VFLSHFLG
// PORT: Fixed ROM slots 30482.
    30482, 356
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30483–30487.
function agcAotUnit1961 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30484 {
        if slot <= 30483 {
// PORT: SOURCE SERVICER.agc:1296
//
// PORT: SOURCE SERVICER.agc:1297
//		CA	FLGWRD11
// PORT: Fixed ROM slots 30483.
            if slot <> 30483 or instruction <> 12359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 71).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1298
//		MASK	VXINHBIT
// PORT: Fixed ROM slots 30484.
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
// PORT: SOURCE SERVICER.agc:1299
//		EXTEND
// PORT: Fixed ROM slots 30485.
            if slot <> 30485 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30486 {
// PORT: SOURCE SERVICER.agc:1300
//		BZF	VUPDAT		# IF VX INHIBIT RESET, INCORPORATE DATA.
// PORT: Fixed ROM slots 30486.
                if slot <> 30486 or instruction <> 5917 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5917, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1301
//# Page 888
// PORT: SOURCE SERVICER.agc:1302
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 30487.
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
// PORT: SOURCE SERVICER.agc:1303
//		ADRES	VXINH		# RESET VX INHIBIT
// PORT: Fixed ROM slots 30488.
    30488, 336
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30489–30506.
function agcAotUnit1962 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30497 {
        if slot <= 30492 {
            if slot <= 30490 {
                if slot <= 30489 {
// PORT: SOURCE SERVICER.agc:1304
//
// PORT: SOURCE SERVICER.agc:1305
//		CA	VSELECT
// PORT: Fixed ROM slots 30489.
                    if slot <> 30489 or instruction <> 13225 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 937).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1306
//		AD	NEG2		# IF VSELECT = 2 (X AXIS).
// PORT: Fixed ROM slots 30490.
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
// PORT: SOURCE SERVICER.agc:1307
//		EXTEND			# BYPASS UPDATE
// PORT: Fixed ROM slots 30491.
                    if slot <> 30491 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1308
//		BZF	ENDVDAT
// PORT: Fixed ROM slots 30492.
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
// PORT: SOURCE SERVICER.agc:1309
//
// PORT: SOURCE SERVICER.agc:1310
//VUPDAT		CS	FLGWRD11
// PORT: Fixed ROM slots 30493.
                    if slot <> 30493 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1311
//		MASK	LRINHBIT
// PORT: Fixed ROM slots 30494.
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
// PORT: SOURCE SERVICER.agc:1312
//		CCS	A
// PORT: Fixed ROM slots 30495.
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
// PORT: SOURCE SERVICER.agc:1313
//		TCF	VALTCHK		# UPDATE INHIBITED
// PORT: Fixed ROM slots 30496.
                        if slot <> 30496 or instruction <> 5964 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5964, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1314
//
// PORT: SOURCE SERVICER.agc:1315
//		TS	MPAC +1
// PORT: Fixed ROM slots 30497.
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
// PORT: SOURCE SERVICER.agc:1316
//
// PORT: SOURCE SERVICER.agc:1317
//		CA	ABVEL		# STORE E7 ERASABLES NEEDED IN TEMPS
// PORT: Fixed ROM slots 30498.
                    if slot <> 30498 or instruction <> 13113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 825).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1318
//		TS	ABVEL*
// PORT: Fixed ROM slots 30499.
                    if slot <> 30499 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30500 {
// PORT: SOURCE SERVICER.agc:1319
//		CA	VSELECT
// PORT: Fixed ROM slots 30500.
                    if slot <> 30500 or instruction <> 13225 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 937).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1320
//		TS	VSELECT*
// PORT: Fixed ROM slots 30501.
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
// PORT: SOURCE SERVICER.agc:1321
//		CA	EBANK5
// PORT: Fixed ROM slots 30502.
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
// PORT: SOURCE SERVICER.agc:1322
//		TS	EBANK		# CHANGE EBANKS
// PORT: Fixed ROM slots 30503.
                    if slot <> 30503 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30504 {
// PORT: SOURCE SERVICER.agc:1323
//
// PORT: SOURCE SERVICER.agc:1324
//		EBANK=	LRVF
// PORT: SOURCE SERVICER.agc:1325
//		CS	LRVF
// PORT: Fixed ROM slots 30504.
                    if slot <> 30504 or instruction <> 17239 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 855).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30505 {
// PORT: SOURCE SERVICER.agc:1326
//		AD	ABVEL*		# IF V < VF, USE WVF
// PORT: Fixed ROM slots 30505.
                        if slot <> 30505 or instruction <> 24664 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 88).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1327
//		EXTEND
// PORT: Fixed ROM slots 30506.
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

// PORT: Physical bank 33. Shared continuation entries, slots 30507–30513.
function agcAotUnit1963 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30509 {
        if slot <= 30507 {
// PORT: SOURCE SERVICER.agc:1328
//		BZMF	USEVF
// PORT: Fixed ROM slots 30507.
            if slot <> 30507 or instruction <> 26422 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26422, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30508 {
// PORT: SOURCE SERVICER.agc:1329
//
// PORT: SOURCE SERVICER.agc:1330
//		CS	ABVEL*
// PORT: Fixed ROM slots 30508.
                if slot <> 30508 or instruction <> 16472 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 88).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1331
//		AD	LRVMAX		# VMAX - V
// PORT: Fixed ROM slots 30509.
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
// PORT: SOURCE SERVICER.agc:1332
//		EXTEND
// PORT: Fixed ROM slots 30510.
                if slot <> 30510 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1333
//		BZMF	WSTOR -1	# IF V > VMAX, W = 0
// PORT: Fixed ROM slots 30511.
                if slot <> 30511 or instruction <> 26425 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26425, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30512 {
// PORT: SOURCE SERVICER.agc:1334
//
// PORT: SOURCE SERVICER.agc:1335
//		EXTEND
// PORT: Fixed ROM slots 30512.
                if slot <> 30512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1336
//		INDEX	VSELECT*
// PORT: Fixed ROM slots 30513.
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
// PORT: SOURCE SERVICER.agc:1337
//		MP	LRWVZ		# WV(VMAX - V)
// PORT: Fixed ROM slots 30514.
    30514, 59056
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30515–30518.
function agcAotUnit1964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30516 {
        if slot <= 30515 {
// PORT: SOURCE SERVICER.agc:1338
//
// PORT: SOURCE SERVICER.agc:1339
//		EXTEND
// PORT: Fixed ROM slots 30515.
            if slot <> 30515 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1340
//		DV	LRVMAX		# WV( 1 - V/VMAX )
// PORT: Fixed ROM slots 30516.
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
// PORT: SOURCE SERVICER.agc:1341
//		TCF	WSTOR
// PORT: Fixed ROM slots 30517.
            if slot <> 30517 or instruction <> 5946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1342
//
// PORT: SOURCE SERVICER.agc:1343
//USEVF		INDEX	VSELECT*
// PORT: Fixed ROM slots 30518.
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
// PORT: SOURCE SERVICER.agc:1344
//		CA	LRWVFZ		# USE APPROPRIATE CONSTANT WEIGHT
// PORT: Fixed ROM slots 30519.
    30519, 26294
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30520–30531.
function agcAotUnit1965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30525 {
        if slot <= 30522 {
            if slot <= 30520 {
// PORT: SOURCE SERVICER.agc:1345
//		TCF	WSTOR
// PORT: Fixed ROM slots 30520.
                if slot <> 30520 or instruction <> 5946 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5946, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30521 {
// PORT: SOURCE SERVICER.agc:1346
//
// PORT: SOURCE SERVICER.agc:1347
// -1		CA	ZERO
// PORT: Fixed ROM slots 30521.
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
// PORT: SOURCE SERVICER.agc:1348
//WSTOR		TS	MPAC
// PORT: Fixed ROM slots 30522.
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
// PORT: SOURCE SERVICER.agc:1349
//		CS	BIT7		# (=64D)
// PORT: Fixed ROM slots 30523.
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
// PORT: SOURCE SERVICER.agc:1350
//		AD	MODREG
// PORT: Fixed ROM slots 30524.
                    if slot <> 30524 or instruction <> 25097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1351
//		EXTEND
// PORT: Fixed ROM slots 30525.
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
// PORT: SOURCE SERVICER.agc:1352
//# Page 889
// PORT: SOURCE SERVICER.agc:1353
//		BZMF	+3		# IF IN P65,P66,P67, USE ANOTHER CONSTANT
// PORT: Fixed ROM slots 30526.
                if slot <> 30526 or instruction <> 26433 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30527 {
// PORT: SOURCE SERVICER.agc:1354
//
// PORT: SOURCE SERVICER.agc:1355
//		CA	LRWVFF
// PORT: Fixed ROM slots 30527.
                    if slot <> 30527 or instruction <> 13150 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 862).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1356
//		TS	MPAC
// PORT: Fixed ROM slots 30528.
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
// PORT: SOURCE SERVICER.agc:1357
//
// PORT: SOURCE SERVICER.agc:1358
// +3		CA	EBANK7
// PORT: Fixed ROM slots 30529.
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
// PORT: SOURCE SERVICER.agc:1359
// 		TS	EBANK		# CHANGE EBANKS
// PORT: Fixed ROM slots 30530.
                    if slot <> 30530 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1360
//
// PORT: SOURCE SERVICER.agc:1361
//		EBANK=	ABVEL
// PORT: SOURCE SERVICER.agc:1362
//		TC	INTPRET
// PORT: Fixed ROM slots 30531.
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
// PORT: SOURCE SERVICER.agc:1363
//		DMP	VXSC		# W(DELTA V)(VBEAMSM) UP 6-7, 0-5
// PORT: Fixed ROM slots 30532.
    30532, 61706,
// PORT: SOURCE SERVICER.agc:1364
//		VAD
// PORT: Fixed ROM slots 30533.
    30533, 65370,
// PORT: SOURCE SERVICER.agc:1365
//			V1S		# ADD WEIGHTED DELTA V TO VELOCITY
// PORT: Fixed ROM slots 30534.
    30534, 3842,
// PORT: SOURCE SERVICER.agc:1366
//		STORE	GNUV
// PORT: Fixed ROM slots 30535.
    30535, 3934,
// PORT: SOURCE SERVICER.agc:1367
//		EXIT
// PORT: Fixed ROM slots 30536.
    30536, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30537–30549.
function agcAotUnit1966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30542 {
        if slot <= 30539 {
            if slot <= 30537 {
// PORT: SOURCE SERVICER.agc:1368
//
// PORT: SOURCE SERVICER.agc:1369
//		TC	QUIKFAZ5	# DO NOT RE-UPDATE
// PORT: Fixed ROM slots 30537.
                if slot <> 30537 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30538 {
// PORT: SOURCE SERVICER.agc:1370
//
// PORT: SOURCE SERVICER.agc:1371
//		CA	SIX
// PORT: Fixed ROM slots 30538.
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
// PORT: SOURCE SERVICER.agc:1372
//VUPDATED	TC	GNURVST		# STORE NEW VELOCITY VECTOR
// PORT: Fixed ROM slots 30539.
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
// PORT: SOURCE SERVICER.agc:1373
//ENDVDAT		=	VALTCHK
// PORT: SOURCE SERVICER.agc:1374
//
// PORT: SOURCE SERVICER.agc:1375
//VALTCHK		TC	QUIKFAZ5	# DO NOT REPEAT ABOVE
// PORT: Fixed ROM slots 30540.
                if slot <> 30540 or instruction <> 1898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30541 {
// PORT: SOURCE SERVICER.agc:1376
//
// PORT: SOURCE SERVICER.agc:1377
//		CAF	READVBIT	# TEST READVEL TO SEE IF VELOCITY READING
// PORT: Fixed ROM slots 30541.
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
// PORT: SOURCE SERVICER.agc:1378
//		MASK	FLGWRD11	# IS DESIRED.
// PORT: Fixed ROM slots 30542.
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
// PORT: SOURCE SERVICER.agc:1379
//		CCS	A
// PORT: Fixed ROM slots 30543.
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
// PORT: SOURCE SERVICER.agc:1380
//		TCF	READV		# YES -- READ VELOCITY
// PORT: Fixed ROM slots 30544.
                    if slot <> 30544 or instruction <> 5975 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5975, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1381
//		CS	ABVEL		# NO -- SEE IF VELOCITY < 2000 FT/SEC
// PORT: Fixed ROM slots 30545.
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
// PORT: SOURCE SERVICER.agc:1382
//		AD	2KFT/SEC
// PORT: Fixed ROM slots 30546.
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
// PORT: SOURCE SERVICER.agc:1383
//		EXTEND
// PORT: Fixed ROM slots 30547.
                    if slot <> 30547 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30548 {
// PORT: SOURCE SERVICER.agc:1384
//		BZMF	CONTSERV	# V > 2000 FT/SEC  DO NOT READ VEL
// PORT: Fixed ROM slots 30548.
                    if slot <> 30548 or instruction <> 25952 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25952, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1385
//
// PORT: SOURCE SERVICER.agc:1386
//		TC	UPFLAG		# V < 2000 FT/SEC  SET READVEL AND READ.
// PORT: Fixed ROM slots 30549.
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
// PORT: SOURCE SERVICER.agc:1387
//		ADRES	READVEL
// PORT: Fixed ROM slots 30550.
    30550, 350
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30551–30552.
function agcAotUnit1967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30551 {
// PORT: SOURCE SERVICER.agc:1388
//
// PORT: SOURCE SERVICER.agc:1389
//READV		CAF	PRIO32		# SET UP JOB TO READ VELOCITY BEAMS.
// PORT: Fixed ROM slots 30551.
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
// PORT: SOURCE SERVICER.agc:1390
//		TC	NOVAC
// PORT: Fixed ROM slots 30552.
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
// PORT: SOURCE SERVICER.agc:1391
//		EBANK=	HMEAS
// PORT: SOURCE SERVICER.agc:1392
//		2CADR	LRVJOB
// PORT: Fixed ROM slots 30553 30554.
    30553, 3868, 30554, 55406
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30555–30559.
function agcAotUnit1968 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30556 {
        if slot <= 30555 {
// PORT: SOURCE SERVICER.agc:1393
//
// PORT: SOURCE SERVICER.agc:1394
//		TCF	CONTSERV	# CONTINUE WITH SERVICER
// PORT: Fixed ROM slots 30555.
            if slot <> 30555 or instruction <> 5472 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5472, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1395
//
// PORT: SOURCE SERVICER.agc:1396
//GNURVST		TS	BUF		# STORE GNUR (=GNUV) IN R1S OR V1S
// PORT: Fixed ROM slots 30556.
            if slot <> 30556 or instruction <> 22616 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22616, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30557 {
// PORT: SOURCE SERVICER.agc:1397
//		EXTEND			# A = 0 FOR R, A = 6 FOR V
// PORT: Fixed ROM slots 30557.
            if slot <> 30557 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30558 {
// PORT: SOURCE SERVICER.agc:1398
//		DCA	GNUR
// PORT: Fixed ROM slots 30558.
                if slot <> 30558 or instruction <> 13231 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 943, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1399
//		INDEX	BUF
// PORT: Fixed ROM slots 30559.
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
// PORT: SOURCE SERVICER.agc:1400
//		DXCH	R1S
// PORT: Fixed ROM slots 30560.
    30560, 44790
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30561–30563.
function agcAotUnit1969 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30561 {
// PORT: SOURCE SERVICER.agc:1401
//		EXTEND
// PORT: Fixed ROM slots 30561.
        if slot <> 30561 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30562 {
// PORT: SOURCE SERVICER.agc:1402
//# Page 890
// PORT: SOURCE SERVICER.agc:1403
//		DCA	GNUR +2
// PORT: Fixed ROM slots 30562.
            if slot <> 30562 or instruction <> 13233 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 945, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1404
//		INDEX	BUF
// PORT: Fixed ROM slots 30563.
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
// PORT: SOURCE SERVICER.agc:1405
//		DXCH	R1S +2
// PORT: Fixed ROM slots 30564.
    30564, 44794
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30565–30567.
function agcAotUnit1970 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30565 {
// PORT: SOURCE SERVICER.agc:1406
//		EXTEND
// PORT: Fixed ROM slots 30565.
        if slot <> 30565 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30566 {
// PORT: SOURCE SERVICER.agc:1407
//		DCA	GNUR +4
// PORT: Fixed ROM slots 30566.
            if slot <> 30566 or instruction <> 13235 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 947, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1408
//		INDEX	BUF
// PORT: Fixed ROM slots 30567.
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
// PORT: SOURCE SERVICER.agc:1409
//		DXCH	R1S +4
// PORT: Fixed ROM slots 30568.
    30568, 44798
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30569–30584.
function agcAotUnit1971 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30576 {
        if slot <= 30572 {
            if slot <= 30570 {
                if slot <= 30569 {
// PORT: SOURCE SERVICER.agc:1410
//		TC	Q
// PORT: Fixed ROM slots 30569.
                    if slot <> 30569 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1411
//
// PORT: SOURCE SERVICER.agc:1412
//QUIKFAZ5	CA	EBANK3
// PORT: Fixed ROM slots 30570.
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
// PORT: SOURCE SERVICER.agc:1413
//		XCH	EBANK		# SET EBANK 3
// PORT: Fixed ROM slots 30571.
                    if slot <> 30571 or instruction <> 23555 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 3, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1414
//		DXCH	L		# Q TO A, A TO L
// PORT: Fixed ROM slots 30572.
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
// PORT: SOURCE SERVICER.agc:1415
//		EBANK=	PHSNAME5
// PORT: SOURCE SERVICER.agc:1416
//		TS	PHSNAME5
// PORT: Fixed ROM slots 30573.
                    if slot <> 30573 or instruction <> 23334 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23334, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1417
//		LXCH	EBANK
// PORT: Fixed ROM slots 30574.
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
// PORT: SOURCE SERVICER.agc:1418
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:1419
//		TC	A
// PORT: Fixed ROM slots 30575.
                    if slot <> 30575 or instruction <> 0 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 0, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1420
//
// PORT: SOURCE SERVICER.agc:1421
//HFAIL		CS	LRRCTR
// PORT: Fixed ROM slots 30576.
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
// PORT: SOURCE SERVICER.agc:1422
//		EXTEND
// PORT: Fixed ROM slots 30577.
                    if slot <> 30577 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1423
//		BZF	NORLITE		# IF R = 0, DO NOT TURN ON TRK FAIL
// PORT: Fixed ROM slots 30578.
                    if slot <> 30578 or instruction <> 6010 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6010, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30579 {
// PORT: SOURCE SERVICER.agc:1424
//		AD	LRLCTR
// PORT: Fixed ROM slots 30579.
                    if slot <> 30579 or instruction <> 25528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 952).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1425
//		MASK	NEG3
// PORT: Fixed ROM slots 30580.
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
// PORT: SOURCE SERVICER.agc:1426
//		EXTEND			# IF L-R LT 4, DO NOT TURN ON TRK FAIL
// PORT: Fixed ROM slots 30581.
                    if slot <> 30581 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1427
//		BZF	+2
// PORT: Fixed ROM slots 30582.
                    if slot <> 30582 or instruction <> 6008 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6008, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30583 {
// PORT: SOURCE SERVICER.agc:1428
//		TCF	NORLITE
// PORT: Fixed ROM slots 30583.
                    if slot <> 30583 or instruction <> 6010 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6010, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1429
//
// PORT: SOURCE SERVICER.agc:1430
//		TC	UPFLAG		# AND SET BIT TO TURN ON TRACKER FAIL LITE
// PORT: Fixed ROM slots 30584.
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
// PORT: SOURCE SERVICER.agc:1431
//		ADRES	HFLSHFLG
// PORT: Fixed ROM slots 30585.
    30585, 358
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30586–30597.
function agcAotUnit1972 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30591 {
        if slot <= 30588 {
            if slot <= 30586 {
// PORT: SOURCE SERVICER.agc:1432
//
// PORT: SOURCE SERVICER.agc:1433
//NORLITE		CA	LRLCTR
// PORT: Fixed ROM slots 30586.
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
// PORT: SOURCE SERVICER.agc:1434
//		TS	LRRCTR		# SET R = L
// PORT: Fixed ROM slots 30587.
                    if slot <> 30587 or instruction <> 23481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1435
//
// PORT: SOURCE SERVICER.agc:1436
//		TCF	VMEASCHK
// PORT: Fixed ROM slots 30588.
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
// PORT: SOURCE SERVICER.agc:1437
//
// PORT: SOURCE SERVICER.agc:1438
//VFAIL		CS	LRSCTR		# DELTA Q LARGE
// PORT: Fixed ROM slots 30589.
                if slot <> 30589 or instruction <> 17339 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 955).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30590 {
// PORT: SOURCE SERVICER.agc:1439
//		EXTEND			# IF S = 0, DO NOT TURN ON TRACKER FAIL
// PORT: Fixed ROM slots 30590.
                    if slot <> 30590 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1440
//		BZF	NOLITE
// PORT: Fixed ROM slots 30591.
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
// PORT: SOURCE SERVICER.agc:1441
//		AD	LRMCTR		# M-S
// PORT: Fixed ROM slots 30592.
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
// PORT: SOURCE SERVICER.agc:1442
//		MASK	NEG3		# TEST FOR M-S > 3
// PORT: Fixed ROM slots 30593.
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
// PORT: SOURCE SERVICER.agc:1443
//		EXTEND			# IF M-S > 3, THEN TWO OR MORE OF THE
// PORT: Fixed ROM slots 30594.
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
// PORT: SOURCE SERVICER.agc:1444
//		BZF	+2		# 	LAST FOUR V READINGS WERE BAD,
// PORT: Fixed ROM slots 30595.
                if slot <> 30595 or instruction <> 6021 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6021, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30596 {
// PORT: SOURCE SERVICER.agc:1445
//		TCF	NOLITE		#	SO TURN ON VELOCITY FAIL LIGHT
// PORT: Fixed ROM slots 30596.
                    if slot <> 30596 or instruction <> 6023 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6023, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1446
//
// PORT: SOURCE SERVICER.agc:1447
//		TC	UPFLAG		# AND SET BIT TO TURN ON TRACKER FAIL LITE
// PORT: Fixed ROM slots 30597.
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
// PORT: SOURCE SERVICER.agc:1448
//		ADRES	VFLSHFLG
// PORT: Fixed ROM slots 30598.
    30598, 356
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30599–30603.
function agcAotUnit1973 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30600 {
        if slot <= 30599 {
// PORT: SOURCE SERVICER.agc:1449
//
// PORT: SOURCE SERVICER.agc:1450
//# Page 891
// PORT: SOURCE SERVICER.agc:1451
//NOLITE		CA	LRMCTR		# SET S = M
// PORT: Fixed ROM slots 30599.
            if slot <> 30599 or instruction <> 13242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 954).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1452
//		TS	LRSCTR
// PORT: Fixed ROM slots 30600.
            if slot <> 30600 or instruction <> 23483 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23483, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30601 {
// PORT: SOURCE SERVICER.agc:1453
//
// PORT: SOURCE SERVICER.agc:1454
//		CCS	VSELECT		# TEST FOR Z COMPONENT
// PORT: Fixed ROM slots 30601.
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
// PORT: SOURCE SERVICER.agc:1455
//		TCF	ENDVDAT		# NOT Z, DO NOT SET VX INHIBIT
// PORT: Fixed ROM slots 30602.
                if slot <> 30602 or instruction <> 5964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1456
//
// PORT: SOURCE SERVICER.agc:1457
//		TC	UPFLAG		# Z COMPONENT - SET FLAG TO SKIP X
// PORT: Fixed ROM slots 30603.
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
// PORT: SOURCE SERVICER.agc:1458
//		ADRES	VXINH		# COMPONENT, AS ERROR MAY BE DUE TO CROSS
// PORT: Fixed ROM slots 30604.
    30604, 336
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30605–30607.
function agcAotUnit1974 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30605 {
// PORT: SOURCE SERVICER.agc:1459
//		TCF	ENDVDAT		# LOBE LOCK UP NOT DETECTED ON X AXIS.
// PORT: Fixed ROM slots 30605.
        if slot <> 30605 or instruction <> 5964 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5964, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30606 {
// PORT: SOURCE SERVICER.agc:1460
//
// PORT: SOURCE SERVICER.agc:1461
//# Page 892
// PORT: SOURCE SERVICER.agc:1462
//# ********************************************************************************
// PORT: SOURCE SERVICER.agc:1463
//# LRVJOB IS SET WHEN THE LEM IS BELOW 15000 FT DURING THE LANDING PHASE
// PORT: SOURCE SERVICER.agc:1464
//# THIS JOB INITIALIZES THE LANDING RADAR READ ROUTINE FOR 5 VELOCITY
// PORT: SOURCE SERVICER.agc:1465
//# SAMPLES AND GOES TO SLEEP WHILE THE SAMPLING IS DONE -- ABOUT 500 MS.
// PORT: SOURCE SERVICER.agc:1466
//# WITH A GOODEND RETURN THE DATA IS STORED IN VMEAS AND BIT7 OF LRSTAT
// PORT: SOURCE SERVICER.agc:1467
//# IS SET.  THE GIMBAL ANGLES ARE READ ABOUT MIDWAY IN THE SAMPLINGS.
// PORT: SOURCE SERVICER.agc:1468
//
// PORT: SOURCE SERVICER.agc:1469
//170MS		EQUALS	ND1
// PORT: SOURCE SERVICER.agc:1470
//
// PORT: SOURCE SERVICER.agc:1471
//LRVJOB		CA	170MS		# SET TASK TO READ CDUS + PIPAS
// PORT: Fixed ROM slots 30606.
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
// PORT: SOURCE SERVICER.agc:1472
//		TC	WAITLIST
// PORT: Fixed ROM slots 30607.
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
// PORT: SOURCE SERVICER.agc:1473
//		EBANK=	LRVTIME
// PORT: SOURCE SERVICER.agc:1474
//		2CADR	RDGIMS
// PORT: Fixed ROM slots 30608 30609.
    30608, 4062, 30609, 57448
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30610–30614.
function agcAotUnit1975 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30611 {
        if slot <= 30610 {
// PORT: SOURCE SERVICER.agc:1475
//
// PORT: SOURCE SERVICER.agc:1476
//		CCS	VSELECT		# SEQUENCE LR VEL BEAM SELECTOR
// PORT: Fixed ROM slots 30610.
            if slot <> 30610 or instruction <> 5033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 937).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1477
//		TCF	+2
// PORT: Fixed ROM slots 30611.
            if slot <> 30611 or instruction <> 6037 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6037, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30612 {
// PORT: SOURCE SERVICER.agc:1478
//		CAF	TWO		# IF ZERO, RESET TO TWO
// PORT: Fixed ROM slots 30612.
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
// PORT: SOURCE SERVICER.agc:1479
//		DOUBLE			# 2XVSELECT USED FOR VBEAM INDEX IN LRVEL
// PORT: Fixed ROM slots 30613.
                if slot <> 30613 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1480
//		TC	BANKCALL	# GO INITIALIZE LR VEL READ ROUTINE
// PORT: Fixed ROM slots 30614.
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
// PORT: SOURCE SERVICER.agc:1481
//		CADR	LRVEL
// PORT: Fixed ROM slots 30615.
    30615, 44174
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30616–30616.
function agcAotUnit1976 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1482
//		TC	BANKCALL	# PUT LRVJOB TO SLEEP ABOUT 500 MS
// PORT: Fixed ROM slots 30616.
    if slot <> 30616 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1976] to agcAotUnit1976@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:1483
//		CADR	RADSTALL
// PORT: Fixed ROM slots 30617.
    30617, 16280
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30618–30647.
function agcAotUnit1977 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30632 {
        if slot <= 30624 {
            if slot <= 30620 {
                if slot <= 30618 {
// PORT: SOURCE SERVICER.agc:1484
//		TCF	VBAD
// PORT: Fixed ROM slots 30618.
                    if slot <> 30618 or instruction <> 6069 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6069, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30619 {
// PORT: SOURCE SERVICER.agc:1485
//		CCS	STILBADV	# IS DATA GOOD JUST PRESENT?
// PORT: Fixed ROM slots 30619.
                        if slot <> 30619 or instruction <> 5053 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 957).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1486
//		TCF	VSTILBAD	# JUST GOOD -- MUST WAIT 4 SECONDS.
// PORT: Fixed ROM slots 30620.
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
// PORT: SOURCE SERVICER.agc:1487
//
// PORT: SOURCE SERVICER.agc:1488
//		INHINT
// PORT: Fixed ROM slots 30621.
                        if slot <> 30621 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1489
//		EXTEND			# GOOD RETURN -- STOW AWAY VMEAS
// PORT: Fixed ROM slots 30622.
                        if slot <> 30622 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30623 {
// PORT: SOURCE SERVICER.agc:1490
//		DCA	SAMPLSUM
// PORT: Fixed ROM slots 30623.
                        if slot <> 30623 or instruction <> 12866 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 578, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1491
//		DXCH	VMEAS
// PORT: Fixed ROM slots 30624.
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
// PORT: SOURCE SERVICER.agc:1492
//		CA	EBANK4		# FOR DOWNLINK
// PORT: Fixed ROM slots 30625.
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
// PORT: SOURCE SERVICER.agc:1493
//		TS	EBANK
// PORT: Fixed ROM slots 30626.
                        if slot <> 30626 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30627 {
// PORT: SOURCE SERVICER.agc:1494
//		EBANK=	LRVTIME
// PORT: SOURCE SERVICER.agc:1495
//
// PORT: SOURCE SERVICER.agc:1496
//		EXTEND
// PORT: Fixed ROM slots 30627.
                        if slot <> 30627 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1497
//		DCA	LRVTIME
// PORT: Fixed ROM slots 30628.
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
// PORT: SOURCE SERVICER.agc:1498
//		DXCH	LRVTIMDL
// PORT: Fixed ROM slots 30629.
                        if slot <> 30629 or instruction <> 22496 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 992, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1499
//		EXTEND
// PORT: Fixed ROM slots 30630.
                        if slot <> 30630 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30631 {
// PORT: SOURCE SERVICER.agc:1500
//		DCA	LRXCDU
// PORT: Fixed ROM slots 30631.
                        if slot <> 30631 or instruction <> 13229 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 941, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1501
//		DXCH	LRXCDUDL
// PORT: Fixed ROM slots 30632.
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
// PORT: SOURCE SERVICER.agc:1502
//		CA	LRZCDU
// PORT: Fixed ROM slots 30633.
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
// PORT: SOURCE SERVICER.agc:1503
//		TS	LRZCDUDL
// PORT: Fixed ROM slots 30634.
                        if slot <> 30634 or instruction <> 23518 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23518, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1504
//		CA	EBANK7
// PORT: Fixed ROM slots 30635.
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
// PORT: SOURCE SERVICER.agc:1505
//		TS	EBANK
// PORT: Fixed ROM slots 30636.
                        if slot <> 30636 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1506
//		EBANK=	VSELECT
// PORT: SOURCE SERVICER.agc:1507
//
// PORT: SOURCE SERVICER.agc:1508
//		CS	FLGWRD11	# SET BIT TO INDICATE VELOCITY
// PORT: Fixed ROM slots 30637.
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
// PORT: SOURCE SERVICER.agc:1509
//		MASK	VELDABIT	# MEASUREMENT MADE
// PORT: Fixed ROM slots 30638.
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
// PORT: SOURCE SERVICER.agc:1510
//# Page 893
// PORT: SOURCE SERVICER.agc:1511
//		ADS	FLGWRD11
// PORT: Fixed ROM slots 30639.
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
// PORT: SOURCE SERVICER.agc:1512
//ENDLRV		CCS	VSELECT		# UPDATE VSELECT
// PORT: Fixed ROM slots 30640.
                        if slot <> 30640 or instruction <> 5033 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 937).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1513
//		TCF	+2
// PORT: Fixed ROM slots 30641.
                        if slot <> 30641 or instruction <> 6067 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6067, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30642 {
// PORT: SOURCE SERVICER.agc:1514
//		CA	TWO
// PORT: Fixed ROM slots 30642.
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
// PORT: SOURCE SERVICER.agc:1515
//		TS	VSELECT
// PORT: Fixed ROM slots 30643.
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
// PORT: SOURCE SERVICER.agc:1516
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 30644.
                        if slot <> 30644 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1517
//
// PORT: SOURCE SERVICER.agc:1518
//VBAD		CAF	TWO		# SET STILBAD TO WAIT 4 SECONDS
// PORT: Fixed ROM slots 30645.
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
// PORT: SOURCE SERVICER.agc:1519
//VSTILBAD	TS	STILBADV
// PORT: Fixed ROM slots 30646.
                        if slot <> 30646 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1520
//		TCF	ENDLRV
// PORT: Fixed ROM slots 30647.
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

// PORT: Physical bank 34. Shared continuation entries, slots 31694–31694.
function agcAotUnit2005 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1521
//
// PORT: SOURCE SERVICER.agc:1522
//# LRHJOB IS SET BY LRHTASK WHEN LEM IS BELOW 25000 FT.  THIS JOB
// PORT: SOURCE SERVICER.agc:1523
//# INITIALIZES THE LR READ ROUTINE FOR AN ALT MEASUREMENT AND GOES TO
// PORT: SOURCE SERVICER.agc:1524
//# SLEEP WHILE THE SAMPLING IS DONE -- ABOUT 95 MS.  WITH A GOODEND RETURN
// PORT: SOURCE SERVICER.agc:1525
//# THE ALT DATA IS STORED IN HMEAS AND BIT7 OF LRSTAT IS SET.
// PORT: SOURCE SERVICER.agc:1526
//
// PORT: SOURCE SERVICER.agc:1527
//		BANK	34
// PORT: SOURCE SERVICER.agc:1528
//		SETLOC	R12STUFF
// PORT: SOURCE SERVICER.agc:1529
//		BANK
// PORT: SOURCE SERVICER.agc:1530
//
// PORT: SOURCE SERVICER.agc:1531
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:1532
//
// PORT: SOURCE SERVICER.agc:1533
//LRHJOB		TC	BANKCALL	# INITIATE LR ALT MEASUREMENT
// PORT: Fixed ROM slots 31694.
    if slot <> 31694 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2005] to agcAotUnit2005@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:1534
//		CADR	LRALT
// PORT: Fixed ROM slots 31695.
    31695, 44150
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31696–31696.
function agcAotUnit2006 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1535
//		TC	BANKCALL	# LRHJOB TO SLEEP ABOUT 95MS
// PORT: Fixed ROM slots 31696.
    if slot <> 31696 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2006] to agcAotUnit2006@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:1536
//		CADR	RADSTALL
// PORT: Fixed ROM slots 31697.
    31697, 16280
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31698–31721.
function agcAotUnit2007 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31709 {
        if slot <= 31703 {
            if slot <= 31700 {
                if slot <= 31698 {
// PORT: SOURCE SERVICER.agc:1537
//		TCF	HBAD
// PORT: Fixed ROM slots 31698.
                    if slot <> 31698 or instruction <> 6117 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6117, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31699 {
// PORT: SOURCE SERVICER.agc:1538
//		CCS	STILBADH	# IS DATA GOOD JUST PRESENT?
// PORT: Fixed ROM slots 31699.
                        if slot <> 31699 or instruction <> 5052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 956).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1539
//		TCF	HSTILBAD	# JUST GOOD -- MUST WAIT 4 SECONDS.
// PORT: Fixed ROM slots 31700.
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
// PORT: SOURCE SERVICER.agc:1540
//
// PORT: SOURCE SERVICER.agc:1541
//		INHINT
// PORT: Fixed ROM slots 31701.
                    if slot <> 31701 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31702 {
// PORT: SOURCE SERVICER.agc:1542
//		EXTEND
// PORT: Fixed ROM slots 31702.
                        if slot <> 31702 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1543
//		DCA	SAMPLSUM	# GOOD RETURN -- STORE AWAY LRH DATA
// PORT: Fixed ROM slots 31703.
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
// PORT: SOURCE SERVICER.agc:1544
//		DXCH	HMEAS		# LRH DATA 1.079 FT/BIT
// PORT: Fixed ROM slots 31704.
                    if slot <> 31704 or instruction <> 22445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 941, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31705 {
// PORT: SOURCE SERVICER.agc:1545
//		EXTEND			# FOR DOWNLINK
// PORT: Fixed ROM slots 31705.
                        if slot <> 31705 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1546
//		DCA	PIPTIME1
// PORT: Fixed ROM slots 31706.
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
// PORT: SOURCE SERVICER.agc:1547
//		DXCH	MKTIME
// PORT: Fixed ROM slots 31707.
                    if slot <> 31707 or instruction <> 22509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1005, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31708 {
// PORT: SOURCE SERVICER.agc:1548
//
// PORT: SOURCE SERVICER.agc:1549
//		EXTEND
// PORT: Fixed ROM slots 31708.
                        if slot <> 31708 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1550
//		DCA	CDUTEMPY	# CDUY,Z = AIG,AMG
// PORT: Fixed ROM slots 31709.
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
// PORT: SOURCE SERVICER.agc:1551
//		DXCH	AIG
// PORT: Fixed ROM slots 31710.
                    if slot <> 31710 or instruction <> 22320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31711 {
// PORT: SOURCE SERVICER.agc:1552
//
// PORT: SOURCE SERVICER.agc:1553
//		CA	CDUTEMPX	# CDUX = AOG
// PORT: Fixed ROM slots 31711.
                        if slot <> 31711 or instruction <> 12909 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 621).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1554
//		TS	AOG
// PORT: Fixed ROM slots 31712.
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
// PORT: SOURCE SERVICER.agc:1555
//
// PORT: SOURCE SERVICER.agc:1556
//		CS	FLGWRD11	# SET BIT TO INDICATE RANGE
// PORT: Fixed ROM slots 31713.
                    if slot <> 31713 or instruction <> 16455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 71).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31714 {
// PORT: SOURCE SERVICER.agc:1557
//		MASK	RNGEDBIT	# MEASUREMENT MADE.
// PORT: Fixed ROM slots 31714.
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
// PORT: SOURCE SERVICER.agc:1558
//		ADS	FLGWRD11
// PORT: Fixed ROM slots 31715.
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
// PORT: SOURCE SERVICER.agc:1559
//ENDLRH		TC	ENDOFJOB	# TERMATE LRHJOB
// PORT: Fixed ROM slots 31716.
                    if slot <> 31716 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31717 {
// PORT: SOURCE SERVICER.agc:1560
//
// PORT: SOURCE SERVICER.agc:1561
//# Page 894
// PORT: SOURCE SERVICER.agc:1562
//HBAD		CA	FLAGWRD5
// PORT: Fixed ROM slots 31717.
                        if slot <> 31717 or instruction <> 12353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1563
//		MASK	RNGSCBIT	# IS BAD RETURN DUE TO SCALE CHANGE?
// PORT: Fixed ROM slots 31718.
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
// PORT: SOURCE SERVICER.agc:1564
//		EXTEND
// PORT: Fixed ROM slots 31719.
                    if slot <> 31719 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31720 {
// PORT: SOURCE SERVICER.agc:1565
//		BZF	HSTILBAD -1	# NO  RESET HSTILBAD
// PORT: Fixed ROM slots 31720.
                        if slot <> 31720 or instruction <> 6124 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6124, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1566
//		TC	DOWNFLAG	# YES  RESET SCALE CHANGE BIT AND IGNORE
// PORT: Fixed ROM slots 31721.
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
// PORT: SOURCE SERVICER.agc:1567
//		ADRES	RNGSCFLG
// PORT: Fixed ROM slots 31722.
    31722, 160
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31723–31740.
function agcAotUnit2008 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31731 {
        if slot <= 31726 {
            if slot <= 31724 {
                if slot <= 31723 {
// PORT: SOURCE SERVICER.agc:1568
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 31723.
                    if slot <> 31723 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1569
//
// PORT: SOURCE SERVICER.agc:1570
//		CAF	TWO		# SET STILBAD TO WAIT 4 SECONDS
// PORT: Fixed ROM slots 31724.
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
// PORT: SOURCE SERVICER.agc:1571
//HSTILBAD	TS	STILBADH
// PORT: Fixed ROM slots 31725.
                    if slot <> 31725 or instruction <> 23484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23484, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1572
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 31726.
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
// PORT: SOURCE SERVICER.agc:1573
//
// PORT: SOURCE SERVICER.agc:1574
//		BANK	34
// PORT: SOURCE SERVICER.agc:1575
//		SETLOC	SERV4
// PORT: SOURCE SERVICER.agc:1576
//		BANK
// PORT: SOURCE SERVICER.agc:1577
//
// PORT: SOURCE SERVICER.agc:1578
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:1579
//
// PORT: SOURCE SERVICER.agc:1580
//# RDGIMS IS A TASK SET UP BY LRVJOB TO PICK UP THE IMU CDUS AND TIME
// PORT: SOURCE SERVICER.agc:1581
//# AT ABOUT THE MIDPOINT OF THE LR VEL READ ROUTINE WHEN 5 VEL SAMPLES
// PORT: SOURCE SERVICER.agc:1582
//# ARE SPECIFIED.
// PORT: SOURCE SERVICER.agc:1583
//
// PORT: SOURCE SERVICER.agc:1584
//		EBANK=	LRVTIME
// PORT: SOURCE SERVICER.agc:1585
//RDGIMS		EXTEND
// PORT: Fixed ROM slots 31727.
                    if slot <> 31727 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1586
//		DCA	TIME2		# PICK UP TIME2, TIME1
// PORT: Fixed ROM slots 31728.
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
// PORT: SOURCE SERVICER.agc:1587
//		DXCH	LRVTIME		#	AND SAVE IN LRVTIME
// PORT: Fixed ROM slots 31729.
                    if slot <> 31729 or instruction <> 22443 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 939, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31730 {
// PORT: SOURCE SERVICER.agc:1588
//
// PORT: SOURCE SERVICER.agc:1589
//		EXTEND
// PORT: Fixed ROM slots 31730.
                        if slot <> 31730 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1590
//		DCA	CDUX		# PICK UP CDUX AND CDUY
// PORT: Fixed ROM slots 31731.
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
// PORT: SOURCE SERVICER.agc:1591
//		DXCH	LRXCDU		#	AND SAVE IN LRXCDU AND LRYCDU
// PORT: Fixed ROM slots 31732.
                    if slot <> 31732 or instruction <> 22445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 941, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1592
//
// PORT: SOURCE SERVICER.agc:1593
//		CA	CDUZ
// PORT: Fixed ROM slots 31733.
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
// PORT: SOURCE SERVICER.agc:1594
//		TS	LRZCDU		# SAVE CDUZ IN LRZCDU
// PORT: Fixed ROM slots 31734.
                    if slot <> 31734 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1595
//
// PORT: SOURCE SERVICER.agc:1596
//		CA	PIPAX
// PORT: Fixed ROM slots 31735.
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
// PORT: SOURCE SERVICER.agc:1597
//		TS	PIPTEM		# SAVE PIPAX IN PIPTEM
// PORT: Fixed ROM slots 31736.
                    if slot <> 31736 or instruction <> 23471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1598
//
// PORT: SOURCE SERVICER.agc:1599
//		EXTEND
// PORT: Fixed ROM slots 31737.
                    if slot <> 31737 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31738 {
// PORT: SOURCE SERVICER.agc:1600
//		DCA	PIPAY		# PICK UP PIPAY AND PIPAZ
// PORT: Fixed ROM slots 31738.
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
// PORT: SOURCE SERVICER.agc:1601
//		DXCH	PIPTEM +1	#	AND SAVE IN PIPTEM +1 AND PIPTEM +2
// PORT: Fixed ROM slots 31739.
                        if slot <> 31739 or instruction <> 22449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 945, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1602
//		TC	TASKOVER
// PORT: Fixed ROM slots 31740.
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

// PORT: Physical bank 33. Shared continuation entries, slots 30648–30648.
function agcAotUnit1978 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1603
//
// PORT: SOURCE SERVICER.agc:1604
//		BANK	33
// PORT: SOURCE SERVICER.agc:1605
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER.agc:1606
//		BANK
// PORT: SOURCE SERVICER.agc:1607
//
// PORT: SOURCE SERVICER.agc:1608
//		COUNT*	$$/SERV
// PORT: SOURCE SERVICER.agc:1609
//
// PORT: SOURCE SERVICER.agc:1610
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER.agc:1611
//# Page 895
// PORT: SOURCE SERVICER.agc:1612
//# HIGATJOB IS SET APPROXIMATELY 6 SECONDS PRIOR TO HIGH GATE DURING
// PORT: SOURCE SERVICER.agc:1613
//# THE DESCENT BURN PHASE OF LUNAR LANDING.  THIS JOB INITIATES THE
// PORT: SOURCE SERVICER.agc:1614
//# LANDING RADAR REPOSITIONING ROUTINE AND GOES TO SLEEP UNTIL THE
// PORT: SOURCE SERVICER.agc:1615
//# LR ANTENNA MOVES FROM POSITION 1 TO POSITION 2.  IF THE LR ANTENNA
// PORT: SOURCE SERVICER.agc:1616
//# ACHIEVES POSITION 2 WITHIN 22 SECONDS THE ALTITUDE AND VELOCITY
// PORT: SOURCE SERVICER.agc:1617
//# BEAM VECTORS ARE RECOMPUTED TO REFLECT THE NEW ORIENTATION WITH
// PORT: SOURCE SERVICER.agc:1618
//# RESPECT TO THE NB.  BIT10 OF LRSTAT IS CLEARED TO ALLOW LR
// PORT: SOURCE SERVICER.agc:1619
//# MEASUREMENTS AND THE JOB TERMINATES.
// PORT: SOURCE SERVICER.agc:1620
//
// PORT: SOURCE SERVICER.agc:1621
//HIGATJOB	TC	BANKCALL	# START LRPOS2 JOB
// PORT: Fixed ROM slots 30648.
    if slot <> 30648 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1978] to agcAotUnit1978@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:1622
//		CADR	LRPOS2
// PORT: Fixed ROM slots 30649.
    30649, 44658
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30650–30650.
function agcAotUnit1979 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1623
//		TC	BANKCALL	# PUT HIGATJOB TO SLEEP UNTIL JOB IS DONE
// PORT: Fixed ROM slots 30650.
    if slot <> 30650 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1979] to agcAotUnit1979@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER.agc:1624
//		CADR	RADSTALL
// PORT: Fixed ROM slots 30651.
    30651, 16280
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30652–30656.
function agcAotUnit1980 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30653 {
        if slot <= 30652 {
// PORT: SOURCE SERVICER.agc:1625
//		TCF	POSALARM	# BAD END    ALARM
// PORT: Fixed ROM slots 30652.
            if slot <> 30652 or instruction <> 6083 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6083, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER.agc:1626
//
// PORT: SOURCE SERVICER.agc:1627
//POSGOOD		CA	PRIO23		# REDUCE PRIORITY FOR INTERPRETIVE COMPS.
// PORT: Fixed ROM slots 30653.
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
// PORT: SOURCE SERVICER.agc:1628
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 30654.
            if slot <> 30654 or instruction <> 2662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30655 {
// PORT: SOURCE SERVICER.agc:1629
//
// PORT: SOURCE SERVICER.agc:1630
//		TC	SETPOS2		# LR IN POS2 -- SET UP TRANSFORMATIONS
// PORT: Fixed ROM slots 30655.
                if slot <> 30655 or instruction <> 2015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2015, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1631
//
// PORT: SOURCE SERVICER.agc:1632
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 30656.
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
// PORT: SOURCE SERVICER.agc:1633
//		ADRES	NOLRREAD	# RESET NOLRREAD FLAG TO ENABLE LR READING
// PORT: Fixed ROM slots 30657.
    30657, 340
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30658–30660.
function agcAotUnit1981 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30658 {
// PORT: SOURCE SERVICER.agc:1634
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 30658.
        if slot <> 30658 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30659 {
// PORT: SOURCE SERVICER.agc:1635
//
// PORT: SOURCE SERVICER.agc:1636
//POSALARM	CA	OCT523
// PORT: Fixed ROM slots 30659.
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
// PORT: SOURCE SERVICER.agc:1637
//		TC	BANKCALL
// PORT: Fixed ROM slots 30660.
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
// PORT: SOURCE SERVICER.agc:1638
//		CADR	PRIOLARM	# FLASH ALARM CODE
// PORT: Fixed ROM slots 30661.
    30661, 18148
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30662–30671.
function agcAotUnit1982 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30666 {
        if slot <= 30663 {
            if slot <= 30662 {
// PORT: SOURCE SERVICER.agc:1639
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 30662.
                if slot <> 30662 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1640
//		TCF	+3		# PROCEED -- TRY AGAIN
// PORT: Fixed ROM slots 30663.
                if slot <> 30663 or instruction <> 6090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6090, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30664 {
// PORT: SOURCE SERVICER.agc:1641
//		TCF	ENDOFJOB	# V 32 E    TERMINATE R12
// PORT: Fixed ROM slots 30664.
                if slot <> 30664 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30665 {
// PORT: SOURCE SERVICER.agc:1642
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 30665.
                    if slot <> 30665 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1643
//
// PORT: SOURCE SERVICER.agc:1644
// +3		CA	BIT7		# SEE IF IN POS2 YET
// PORT: Fixed ROM slots 30666.
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
// PORT: SOURCE SERVICER.agc:1645
//		EXTEND
// PORT: Fixed ROM slots 30667.
                if slot <> 30667 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1646
//		RAND	CHAN33
// PORT: Fixed ROM slots 30668.
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
// PORT: SOURCE SERVICER.agc:1647
//		EXTEND
// PORT: Fixed ROM slots 30669.
                if slot <> 30669 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30670 {
// PORT: SOURCE SERVICER.agc:1648
//		BZF	POSGOOD		# POS2 ACHIEVED   SET UP ANTENNA BEAMS
// PORT: Fixed ROM slots 30670.
                    if slot <> 30670 or instruction <> 6077 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1649
//		TCF	POSALARM	# STILL DIDN'T MAKE IT   REALARM
// PORT: Fixed ROM slots 30671.
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
// PORT: SOURCE SERVICER.agc:1650
//
// PORT: SOURCE SERVICER.agc:1651
//OCT523		OCT	00523
// PORT: Fixed ROM slots 30672.
    30672, 678
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30673–30693.
function agcAotUnit1983 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30682 {
        if slot <= 30677 {
            if slot <= 30674 {
                if slot <= 30673 {
// PORT: SOURCE SERVICER.agc:1652
//
// PORT: SOURCE SERVICER.agc:1653
//
// PORT: SOURCE SERVICER.agc:1654
//
// PORT: SOURCE SERVICER.agc:1655
//SETPOS1		TC	MAKECADR	# MUST BE CALLED BY BANKCALL
// PORT: Fixed ROM slots 30673.
                    if slot <> 30673 or instruction <> 2469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1656
//		TS	LRADRET1	# SAVE RETURN CADR.  SINCE BUP2 CLOBBERED
// PORT: Fixed ROM slots 30674.
                    if slot <> 30674 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30675 {
// PORT: SOURCE SERVICER.agc:1657
//
// PORT: SOURCE SERVICER.agc:1658
//		CAF	TWO
// PORT: Fixed ROM slots 30675.
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
// PORT: SOURCE SERVICER.agc:1659
//		TS	STILBADH	# INITIALIZE STILBAD
// PORT: Fixed ROM slots 30676.
                        if slot <> 30676 or instruction <> 23484 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23484, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1660
//		TS	STILBADV	# INITIALIZE STILBAD
// PORT: Fixed ROM slots 30677.
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
// PORT: SOURCE SERVICER.agc:1661
//
// PORT: SOURCE SERVICER.agc:1662
//		CA	ZERO		# INDEX FOR LRALPHA, LRBETA IN POS 1.
// PORT: Fixed ROM slots 30678.
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
// PORT: SOURCE SERVICER.agc:1663
//# Page 896
// PORT: SOURCE SERVICER.agc:1664
//		TS	LRLCTR		# SET L,M,R, ANS S TO ZERO
// PORT: Fixed ROM slots 30679.
                    if slot <> 30679 or instruction <> 23480 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23480, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30680 {
// PORT: SOURCE SERVICER.agc:1665
//		TS	LRMCTR
// PORT: Fixed ROM slots 30680.
                    if slot <> 30680 or instruction <> 23482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30681 {
// PORT: SOURCE SERVICER.agc:1666
//		TS	LRRCTR
// PORT: Fixed ROM slots 30681.
                        if slot <> 30681 or instruction <> 23481 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23481, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1667
//		TS	LRSCTR
// PORT: Fixed ROM slots 30682.
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
// PORT: SOURCE SERVICER.agc:1668
//		TS	VSELECT		# INITIALIZE VSELECT
// PORT: Fixed ROM slots 30683.
                    if slot <> 30683 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER.agc:1669
//
// PORT: SOURCE SERVICER.agc:1670
//		TC	SETPOS		# CONTINUE WITH COMPUTATIONS.
// PORT: Fixed ROM slots 30684.
                    if slot <> 30684 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30685 {
// PORT: SOURCE SERVICER.agc:1671
//
// PORT: SOURCE SERVICER.agc:1672
//		CA	LRADRET1
// PORT: Fixed ROM slots 30685.
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
// PORT: SOURCE SERVICER.agc:1673
//		TC	BANKJUMP	# RETURN TO CALLER
// PORT: Fixed ROM slots 30686.
                        if slot <> 30686 or instruction <> 2464 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2464, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1674
//
// PORT: SOURCE SERVICER.agc:1675
//SETPOS2		CA	TWO		# INDEX FOR POS2
// PORT: Fixed ROM slots 30687.
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
// PORT: SOURCE SERVICER.agc:1676
//SETPOS		XCH	Q		# SAVE INDEX IN Q
// PORT: Fixed ROM slots 30688.
                    if slot <> 30688 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30689 {
// PORT: SOURCE SERVICER.agc:1677
//		TS	LRADRET		# SAVE RETURN
// PORT: Fixed ROM slots 30689.
                        if slot <> 30689 or instruction <> 23464 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23464, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1678
//
// PORT: SOURCE SERVICER.agc:1679
//		CA	EBANK5
// PORT: Fixed ROM slots 30690.
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
// PORT: SOURCE SERVICER.agc:1680
//		TS	EBANK
// PORT: Fixed ROM slots 30691.
                    if slot <> 30691 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30692 {
// PORT: SOURCE SERVICER.agc:1681
//		EBANK=	LRALPHA
// PORT: SOURCE SERVICER.agc:1682
//
// PORT: SOURCE SERVICER.agc:1683
//		EXTEND
// PORT: Fixed ROM slots 30692.
                        if slot <> 30692 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE SERVICER.agc:1684
//		INDEX	Q
// PORT: Fixed ROM slots 30693.
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
// PORT: SOURCE SERVICER.agc:1685
//		DCA	LRALPHA		# LRALPHA IN A, LRBETA IN L
// PORT: Fixed ROM slots 30694.
    30694, 26278
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30695–30701.
function agcAotUnit1984 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30697 {
        if slot <= 30695 {
// PORT: SOURCE SERVICER.agc:1686
//		TS	CDUSPOT +4	# ROTATION ABOUT X
// PORT: Fixed ROM slots 30695.
            if slot <> 30695 or instruction <> 23034 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23034, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30696 {
// PORT: SOURCE SERVICER.agc:1687
//		LXCH	CDUSPOT		# ROTATION ABOUT Y
// PORT: Fixed ROM slots 30696.
                if slot <> 30696 or instruction <> 9718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 502, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1688
//		CA	ZERO
// PORT: Fixed ROM slots 30697.
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
// PORT: SOURCE SERVICER.agc:1689
//		TS	CDUSPOT +2	# ZERO ROTATION ABOUT Z.
// PORT: Fixed ROM slots 30698.
                if slot <> 30698 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1690
//
// PORT: SOURCE SERVICER.agc:1691
//		CA	EBANK7
// PORT: Fixed ROM slots 30699.
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
// PORT: SOURCE SERVICER.agc:1692
//		TS	EBANK
// PORT: Fixed ROM slots 30700.
                if slot <> 30700 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER.agc:1693
//		EBANK=	LRADRET
// PORT: SOURCE SERVICER.agc:1694
//
// PORT: SOURCE SERVICER.agc:1695
//		TC	INTPRET
// PORT: Fixed ROM slots 30701.
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
// PORT: SOURCE SERVICER.agc:1696
//		VLOAD	CALL
// PORT: Fixed ROM slots 30702.
    30702, 38138,
// PORT: SOURCE SERVICER.agc:1697
//			UNITY		# CONVERT UNITY(ANTENNA) TO NB
// PORT: Fixed ROM slots 30703.
    30703, 6812,
// PORT: SOURCE SERVICER.agc:1698
//			TRG*SMNB
// PORT: Fixed ROM slots 30704.
    30704, 40786,
// PORT: SOURCE SERVICER.agc:1699
//		STOVL	VYBEAMNB
// PORT: Fixed ROM slots 30705.
    30705, 22846,
// PORT: SOURCE SERVICER.agc:1700
//			UNITX		# CONVERT UNITX(ANTENNA) TO NB
// PORT: Fixed ROM slots 30706.
    30706, 6816,
// PORT: SOURCE SERVICER.agc:1701
//		CALL
// PORT: Fixed ROM slots 30707.
    30707, 65320,
// PORT: SOURCE SERVICER.agc:1702
//			*SMNB*
// PORT: Fixed ROM slots 30708.
    30708, 40818,
// PORT: SOURCE SERVICER.agc:1703
//		STORE	VXBEAMNB
// PORT: Fixed ROM slots 30709.
    30709, 2378,
// PORT: SOURCE SERVICER.agc:1704
//		VXV	VSL1
// PORT: Fixed ROM slots 30710.
    30710, 64058,
// PORT: SOURCE SERVICER.agc:1705
//			VYBEAMNB
// PORT: Fixed ROM slots 30711.
    30711, 2366,
// PORT: SOURCE SERVICER.agc:1706
//		STOVL	VZBEAMNB	# Z = X * Y
// PORT: Fixed ROM slots 30712.
    30712, 22834,
// PORT: SOURCE SERVICER.agc:1707
//			HBEAMANT
// PORT: Fixed ROM slots 30713.
    30713, 22534,
// PORT: SOURCE SERVICER.agc:1708
//		CALL
// PORT: Fixed ROM slots 30714.
    30714, 65320,
// PORT: SOURCE SERVICER.agc:1709
//			*SMNB*		# CONVERT TO NB
// PORT: Fixed ROM slots 30715.
    30715, 40818,
// PORT: SOURCE SERVICER.agc:1710
//		STORE	HBEAMNB
// PORT: Fixed ROM slots 30716.
    30716, 2422,
// PORT: SOURCE SERVICER.agc:1711
//		EXIT
// PORT: Fixed ROM slots 30717.
    30717, 65532
)).

// PORT: Physical bank 33. Shared continuation entries, slots 30718–30718.
function agcAotUnit1985 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER.agc:1712
//
// PORT: SOURCE SERVICER.agc:1713
//# Page 897
// PORT: SOURCE SERVICER.agc:1714
//		TC	LRADRET
// PORT: Fixed ROM slots 30718.
    if slot <> 30718 or instruction <> 936 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 936, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1985] to agcAotUnit1985@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE SERVICER.agc:1715
//
