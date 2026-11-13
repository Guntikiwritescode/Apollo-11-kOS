// PORT: Original source unit AUTOMATIC_MANEUVERS.agc.
// PORT: Physical bank 21. Shared continuation entries, slots 20136–20164.
function agcAotUnit1176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20149 {
        if slot <= 20142 {
            if slot <= 20138 {
                if slot <= 20136 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:2
//# Filename:	AUTOMATIC_MANEUVERS.agc
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:9
//# Pages:	1025-1036
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:12
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:21
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:23
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:26
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:28
//#			Colossus 2A
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:29
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:30
//# Page 1025
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:31
//		BANK	21
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:32
//		SETLOC	DAPS3
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:33
//		BANK
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:34
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:35
//		COUNT	21/DAPAM
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:36
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:37
//		EBANK=	KMPAC
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:38
//AHFNOROT	EXTEND
// PORT: Fixed ROM slots 20136.
                    if slot <> 20136 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20137 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:39
//		READ	CHAN31
// PORT: Fixed ROM slots 20137.
                        if slot <> 20137 or instruction <> 25 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:40
//		MASK	BIT14
// PORT: Fixed ROM slots 20138.
                        if slot <> 20138 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                if slot <= 20140 {
                    if slot <= 20139 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:41
//		EXTEND
// PORT: Fixed ROM slots 20139.
                        if slot <> 20139 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:42
//		BZMF	FREECONT
// PORT: Fixed ROM slots 20140.
                        if slot <> 20140 or instruction <> 26298 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26298, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20141 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:43
//		CA	RCSFLAGS	# SEE IF RATE FILTER HAS BEEN INITIALIZED
// PORT: Fixed ROM slots 20141.
                        if slot <> 20141 or instruction <> 13121 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:44
//		MASK	BIT14
// PORT: Fixed ROM slots 20142.
                        if slot <> 20142 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 20145 {
                if slot <= 20143 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:45
//		CCS	A		# IF SO, PROCEED WITH ATTITUDE CONTROL
// PORT: Fixed ROM slots 20143.
                    if slot <> 20143 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20144 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:46
//		TCF	REINIT		# IF NOT, RECYCLE TO INITIALIZE FILTER
// PORT: Fixed ROM slots 20144.
                        if slot <> 20144 or instruction <> 5468 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5468, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:47
//					# AUTOMATIC CONTROL YET
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:48
//		EXTEND
// PORT: Fixed ROM slots 20145.
                        if slot <> 20145 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20147 {
                    if slot <= 20146 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:49
//		READ	CHAN31
// PORT: Fixed ROM slots 20146.
                        if slot <> 20146 or instruction <> 25 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:50
//		MASK	BIT13
// PORT: Fixed ROM slots 20147.
                        if slot <> 20147 or instruction <> 31235 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 20148 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:51
//		EXTEND
// PORT: Fixed ROM slots 20148.
                        if slot <> 20148 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:52
//		BZMF	HOLDFUNC
// PORT: Fixed ROM slots 20149.
                        if slot <> 20149 or instruction <> 26362 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26362, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20156 {
            if slot <= 20152 {
                if slot <= 20150 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:53
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:54
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:55
//AUTOCONT	CA	HOLDFLAG	# IF HOLDFLAG IS +, GO TO GRABANG.
// PORT: Fixed ROM slots 20150.
                    if slot <> 20150 or instruction <> 13018 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 730).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20151 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:56
//		EXTEND			# OTHERWISE, GO TO ATTHOLD.
// PORT: Fixed ROM slots 20151.
                        if slot <> 20151 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:57
//		BZMF	ATTHOLD
// PORT: Fixed ROM slots 20152.
                        if slot <> 20152 or instruction <> 26322 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26322, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20154 {
                    if slot <= 20153 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:58
//		TCF	GRABANG
// PORT: Fixed ROM slots 20153.
                        if slot <> 20153 or instruction <> 5886 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5886, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:59
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:60
//# MINIMUM IMPULSE CONTROL
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:61
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:62
//FREECONT	CAF	ONE
// PORT: Fixed ROM slots 20154.
                        if slot <> 20154 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                    if slot <= 20155 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:63
//		TS	HOLDFLAG	# RESET HOLDFLAG
// PORT: Fixed ROM slots 20155.
                        if slot <> 20155 or instruction <> 23258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:64
//					# INHIBIT AUTOMATIC STEERING
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:65
//		EXTEND
// PORT: Fixed ROM slots 20156.
                        if slot <> 20156 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20160 {
                if slot <= 20158 {
                    if slot <= 20157 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:66
//		READ	CHAN32
// PORT: Fixed ROM slots 20157.
                        if slot <> 20157 or instruction <> 26 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 26, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:67
//		TS	L
// PORT: Fixed ROM slots 20158.
                        if slot <> 20158 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20159 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:68
//		COM
// PORT: Fixed ROM slots 20159.
                        if slot <> 20159 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:69
//		MASK	MANROT
// PORT: Fixed ROM slots 20160.
                        if slot <> 20160 or instruction <> 30238 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1566), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20162 {
                    if slot <= 20161 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:70
//		MASK	CHANTEMP
// PORT: Fixed ROM slots 20161.
                        if slot <> 20161 or instruction <> 29595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 923).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:71
//		LXCH	CHANTEMP
// PORT: Fixed ROM slots 20162.
                        if slot <> 20162 or instruction <> 10139 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 923, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20163 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:72
//		TC	STICKCHK
// PORT: Fixed ROM slots 20163.
                        if slot <> 20163 or instruction <> 1624 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1624, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:73
//		INDEX	RMANNDX
// PORT: Fixed ROM slots 20164.
                        if slot <> 20164 or instruction <> 21422 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21422, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21422, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1176] to agcAotUnit1176@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:74
//		CA	MINTAU		# MINTAU	+0
// PORT: Fixed ROM slots 20165.
    20165, 28060
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20166–20167.
function agcAotUnit1177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20166 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:75
//		TS	TAU		#		+1	+14MS MINIMUM IMPULSE
// PORT: Fixed ROM slots 20166.
        if slot <> 20166 or instruction <> 23409 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23409, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:76
//		INDEX	PMANNDX		#		+2	-14MS TIME
// PORT: Fixed ROM slots 20167.
        if slot <> 20167 or instruction <> 21423 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1177] to agcAotUnit1177@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:77
//		CA	MINTAU		#		+3	+0
// PORT: Fixed ROM slots 20168.
    20168, 28060
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20169–20170.
function agcAotUnit1178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20169 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:78
//		TS	TAU1
// PORT: Fixed ROM slots 20169.
        if slot <> 20169 or instruction <> 23410 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23410, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:79
//		INDEX	YMANNDX
// PORT: Fixed ROM slots 20170.
        if slot <> 20170 or instruction <> 21424 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1178] to agcAotUnit1178@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:80
//		CA	MINTAU
// PORT: Fixed ROM slots 20171.
    20171, 28060
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20172–20173.
function agcAotUnit1179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20172 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:81
//# Page 1026
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:82
//		TS	TAU2
// PORT: Fixed ROM slots 20172.
        if slot <> 20172 or instruction <> 23411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23411, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:83
//		TCF	T6PROGM
// PORT: Fixed ROM slots 20173.
        if slot <> 20173 or instruction <> 5687 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5687, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1179] to agcAotUnit1179@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:84
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:85
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:86
//MINTAU		DEC	0
// PORT: Fixed ROM slots 20174.
    20174, 0,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:87
//		DEC	23		# = 14MS
// PORT: Fixed ROM slots 20175.
    20175, 46,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:88
//		DEC	-23		# = -14MS
// PORT: Fixed ROM slots 20176.
    20176, 65488,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:89
//		DEC	0
// PORT: Fixed ROM slots 20177.
    20177, 0
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20178–20247.
function agcAotUnit1180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20212 {
        if slot <= 20194 {
            if slot <= 20185 {
                if slot <= 20181 {
                    if slot <= 20179 {
                        if slot <= 20178 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:90
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:91
//# Page 1027
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:92
//# 	CALCULATION OF ATTITUDE ERRORS-
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:93
//#	-    *     -      -          -
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:94
//#	AK = AMGB (CDUX - THETADX) + BIAS
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:95
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:96
//# IE	*AK *   * 1        SIN(PSI)        0	** CDUX - THETADX *    *BIAS *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:97
//#	*   *   *                               **                *    *     *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:98
//#	*AK1* = * 0   COS(PSI)COS(PHI)  SIN(PHI)** CDUY - THETADY *  + *BIAS1*
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:99
//#	*   *   *                               **                *    *     *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:100
//#	*AK2*   * 0  -COS(PSI)SIN(PHI)  COS(PHI)** CDUZ - THETADZ *    *BIAS2*
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:101
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:102
//# 	THE BIASES ARE ADDED ONLY WHILE PERFORMING AUTOMATIC MANEUVERS (ESP KALCMANU) TO PROVIDE ADDITIONAL LEAD
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:103
//# AND PREVENT OVERSHOOT WHEN STARTING AN AUTOMATIC MANEUVER.  NORMALLY THE REQUIRED LEAD IS ONLY 1-2 DEGREES.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:104
//# BUT DURING HIGH RATE MANEUVERS IT CAN BE AS MUCH AS 7 DEGREES.  THE BIASES ARE COMPUTED BY KALCMANU AND REMAIN
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:105
//# FIXED UNTIL THE MANEUVER IS COMPLETED AT WHICH TIME THEY ARE RESET TO ZERO.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:106
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:107
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:108
//ATTHOLD		CA	CDUX
// PORT: Fixed ROM slots 20178.
                            if slot <> 20178 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:109
//		EXTEND
// PORT: Fixed ROM slots 20179.
                            if slot <> 20179 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20180 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:110
//		MSU	THETADX
// PORT: Fixed ROM slots 20180.
                            if slot <> 20180 or instruction <> 9082 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 890).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:111
//		TS	ERRORX
// PORT: Fixed ROM slots 20181.
                            if slot <> 20181 or instruction <> 23415 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23415, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20183 {
                        if slot <= 20182 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:112
//		CA	CDUY
// PORT: Fixed ROM slots 20182.
                            if slot <> 20182 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:113
//		EXTEND
// PORT: Fixed ROM slots 20183.
                            if slot <> 20183 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20184 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:114
//		MSU	THETADY
// PORT: Fixed ROM slots 20184.
                            if slot <> 20184 or instruction <> 9083 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 891).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:115
//		TS	T5TEMP
// PORT: Fixed ROM slots 20185.
                            if slot <> 20185 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 20189 {
                    if slot <= 20187 {
                        if slot <= 20186 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:116
//		EXTEND
// PORT: Fixed ROM slots 20186.
                            if slot <> 20186 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:117
//		MP	AMGB1
// PORT: Fixed ROM slots 20187.
                            if slot <> 20187 or instruction <> 29600 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 928, readEffective:call(words, 928)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20188 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:118
//		ADS	ERRORX
// PORT: Fixed ROM slots 20188.
                            if slot <> 20188 or instruction <> 12151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 887).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:119
//		CA	T5TEMP
// PORT: Fixed ROM slots 20189.
                            if slot <> 20189 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20191 {
                        if slot <= 20190 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:120
//		EXTEND
// PORT: Fixed ROM slots 20190.
                            if slot <> 20190 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:121
//		MP	AMGB4
// PORT: Fixed ROM slots 20191.
                            if slot <> 20191 or instruction <> 29601 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 929, readEffective:call(words, 929)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20192 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:122
//		TS	ERRORY
// PORT: Fixed ROM slots 20192.
                            if slot <> 20192 or instruction <> 23416 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23416, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20193 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:123
//		CA	T5TEMP
// PORT: Fixed ROM slots 20193.
                                if slot <> 20193 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:124
//		EXTEND
// PORT: Fixed ROM slots 20194.
                                if slot <> 20194 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 20203 {
                if slot <= 20198 {
                    if slot <= 20196 {
                        if slot <= 20195 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:125
//		MP	AMGB7
// PORT: Fixed ROM slots 20195.
                            if slot <> 20195 or instruction <> 29603 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 931, readEffective:call(words, 931)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:126
//		TS	ERRORZ
// PORT: Fixed ROM slots 20196.
                            if slot <> 20196 or instruction <> 23417 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23417, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20197 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:127
//		CA	CDUZ
// PORT: Fixed ROM slots 20197.
                            if slot <> 20197 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:128
//		EXTEND
// PORT: Fixed ROM slots 20198.
                            if slot <> 20198 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20200 {
                        if slot <= 20199 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:129
//		MSU	THETADZ
// PORT: Fixed ROM slots 20199.
                            if slot <> 20199 or instruction <> 9084 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 892).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:130
//		TS	T5TEMP
// PORT: Fixed ROM slots 20200.
                            if slot <> 20200 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20201 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:131
//		EXTEND
// PORT: Fixed ROM slots 20201.
                            if slot <> 20201 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20202 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:132
//		MP	AMGB5
// PORT: Fixed ROM slots 20202.
                                if slot <> 20202 or instruction <> 29602 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 930, readEffective:call(words, 930)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:133
//		ADS	ERRORY
// PORT: Fixed ROM slots 20203.
                                if slot <> 20203 or instruction <> 12152 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 888).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20207 {
                    if slot <= 20205 {
                        if slot <= 20204 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:134
//		CA	T5TEMP
// PORT: Fixed ROM slots 20204.
                            if slot <> 20204 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:135
//		EXTEND
// PORT: Fixed ROM slots 20205.
                            if slot <> 20205 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20206 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:136
//		MP	AMGB8
// PORT: Fixed ROM slots 20206.
                            if slot <> 20206 or instruction <> 29604 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 932, readEffective:call(words, 932)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:137
//		ADS	ERRORZ
// PORT: Fixed ROM slots 20207.
                            if slot <> 20207 or instruction <> 12153 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 889).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20209 {
                        if slot <= 20208 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:138
//		CS	HOLDFLAG
// PORT: Fixed ROM slots 20208.
                            if slot <> 20208 or instruction <> 17114 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 730).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:139
//		EXTEND
// PORT: Fixed ROM slots 20209.
                            if slot <> 20209 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20210 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:140
//# Page 1028
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:141
//		BZMF	JETS
// PORT: Fixed ROM slots 20210.
                            if slot <> 20210 or instruction <> 26401 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26401, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20211 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:142
//		CA	BIAS		# AD BIASES ONLY IF PERFORMING AUTOMATIC
// PORT: Fixed ROM slots 20211.
                                if slot <> 20211 or instruction <> 13172 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 884).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:143
//		ADS	ERRORX
// PORT: Fixed ROM slots 20212.
                                if slot <> 20212 or instruction <> 12151 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 887).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 20229 {
            if slot <= 20220 {
                if slot <= 20216 {
                    if slot <= 20214 {
                        if slot <= 20213 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:144
//		CA	BIAS1
// PORT: Fixed ROM slots 20213.
                            if slot <> 20213 or instruction <> 13173 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 885).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:145
//		ADS	ERRORY
// PORT: Fixed ROM slots 20214.
                            if slot <> 20214 or instruction <> 12152 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 888).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20215 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:146
//		CA	BIAS2
// PORT: Fixed ROM slots 20215.
                            if slot <> 20215 or instruction <> 13174 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 886).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:147
//		ADS	ERRORZ
// PORT: Fixed ROM slots 20216.
                            if slot <> 20216 or instruction <> 12153 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 889).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20218 {
                        if slot <= 20217 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:148
//		TCF	JETS
// PORT: Fixed ROM slots 20217.
                            if slot <> 20217 or instruction <> 5921 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5921, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:149
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:150
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:151
//HOLDFUNC	CCS	HOLDFLAG
// PORT: Fixed ROM slots 20218.
                            if slot <> 20218 or instruction <> 4826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 730).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20219 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:152
//		TCF	+3
// PORT: Fixed ROM slots 20219.
                            if slot <> 20219 or instruction <> 5886 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5886, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:153
//		TCF	ATTHOLD
// PORT: Fixed ROM slots 20220.
                            if slot <> 20220 or instruction <> 5842 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5842, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 20224 {
                    if slot <= 20222 {
                        if slot <= 20221 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:154
//		TCF	+1
// PORT: Fixed ROM slots 20221.
                            if slot <> 20221 or instruction <> 5886 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5886, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:155
//GRABANG		CAF	ZERO		# ZERO WBODYS AND BIASES
// PORT: Fixed ROM slots 20222.
                            if slot <> 20222 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 20223 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:156
//		TS	WBODY
// PORT: Fixed ROM slots 20223.
                            if slot <> 20223 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:157
//		TS	WBODY +1
// PORT: Fixed ROM slots 20224.
                            if slot <> 20224 or instruction <> 23382 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23382, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20226 {
                        if slot <= 20225 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:158
//		TS	WBODY1
// PORT: Fixed ROM slots 20225.
                            if slot <> 20225 or instruction <> 23383 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23383, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:159
//		TS	WBODY1 +1
// PORT: Fixed ROM slots 20226.
                            if slot <> 20226 or instruction <> 23384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23384, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20227 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:160
//		TS	WBODY2
// PORT: Fixed ROM slots 20227.
                            if slot <> 20227 or instruction <> 23385 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23385, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20228 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:161
//		TS	WBODY2 +1
// PORT: Fixed ROM slots 20228.
                                if slot <> 20228 or instruction <> 23386 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23386, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:162
//		TS	BIAS
// PORT: Fixed ROM slots 20229.
                                if slot <> 20229 or instruction <> 23412 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23412, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 20238 {
                if slot <= 20233 {
                    if slot <= 20231 {
                        if slot <= 20230 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:163
//		TS	BIAS1
// PORT: Fixed ROM slots 20230.
                            if slot <> 20230 or instruction <> 23413 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23413, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:164
//		TS	BIAS2
// PORT: Fixed ROM slots 20231.
                            if slot <> 20231 or instruction <> 23414 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23414, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20232 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:165
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:166
//		CA	RCSFLAGS
// PORT: Fixed ROM slots 20232.
                            if slot <> 20232 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:167
//		MASK	OCT16000
// PORT: Fixed ROM slots 20233.
                            if slot <> 20233 or instruction <> 30239 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20235 {
                        if slot <= 20234 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:168
//		EXTEND			# IS RATE DAMPING COMPLETED
// PORT: Fixed ROM slots 20234.
                            if slot <> 20234 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:169
//		BZF	ENDDAMP		# IF SO, GO TO ENDDAMP
// PORT: Fixed ROM slots 20235.
                            if slot <> 20235 or instruction <> 5905 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5905, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20236 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:170
//		CAF	ZERO		# OTHERWISE, ZERO ERRORS
// PORT: Fixed ROM slots 20236.
                            if slot <> 20236 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20237 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:171
//		TS	ERRORX
// PORT: Fixed ROM slots 20237.
                                if slot <> 20237 or instruction <> 23415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:172
//		TS	ERRORY
// PORT: Fixed ROM slots 20238.
                                if slot <> 20238 or instruction <> 23416 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23416, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20242 {
                    if slot <= 20240 {
                        if slot <= 20239 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:173
//		TS	ERRORZ
// PORT: Fixed ROM slots 20239.
                            if slot <> 20239 or instruction <> 23417 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23417, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:174
//		TCF	JETS
// PORT: Fixed ROM slots 20240.
                            if slot <> 20240 or instruction <> 5921 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5921, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20241 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:175
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:176
//ENDDAMP		TS	HOLDFLAG	# SET HOLDFLAG +0
// PORT: Fixed ROM slots 20241.
                            if slot <> 20241 or instruction <> 23258 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23258, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:177
//		EXTEND
// PORT: Fixed ROM slots 20242.
                            if slot <> 20242 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20244 {
                        if slot <= 20243 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:178
//		DCA	CDUX		# PICK UP CDU ANGLES FOR ATTITUDE HOLD
// PORT: Fixed ROM slots 20243.
                            if slot <> 20243 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 27, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:179
//		DXCH	THETADX		# REFERENCES
// PORT: Fixed ROM slots 20244.
                            if slot <> 20244 or instruction <> 22395 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 891, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20245 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:180
//		CA	CDUZ
// PORT: Fixed ROM slots 20245.
                            if slot <> 20245 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20246 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:181
//		TS	THETADZ
// PORT: Fixed ROM slots 20246.
                                if slot <> 20246 or instruction <> 23420 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23420, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:182
//		TCF	ATTHOLD
// PORT: Fixed ROM slots 20247.
                                if slot <> 20247 or instruction <> 5842 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5842, words[0], readEffective).
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
set agcAotRoutes[1180] to agcAotUnit1180@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:183
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:184
//# Page 1029
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:185
//# JET SWITCHING LOGIC AND CALCULATION OF REQUIRED ROTATION COMMANDS
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:186
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:187
//# DETERMINE THE LOCATION OF THE RATE ERROR AND THE ATTITUDE ERROR RELATIVE TO THE SWITCHING LOGIC IN THE PHASE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:188
//# PLANE.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:189
//# COMPUTE THE CHANGE IN RATE CORRESPONDING TO THE ATTITUDE ERROR NECESSARY TO DRIVE THE THE S/C INTO THE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:190
//# APPROPRIATE DEADZONE.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:191
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:192
//#                                     .
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:193
//#   R22                          RATE . ERROR
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:194
//#        WL+H                         .
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:195
//# *********************************   .					***** SWITCH LINES ENCLOSING DEADZONES
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:196
//#   R23  WL                        *  .
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:197
//# ----------------------------------* .					----- DESIRED RATE LINES
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:198
//#   R23  WL-H       -                *.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:199
//# ****************** -                .					R20, R21, R22, ETC REGIONS IN PHASE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:200
//#                   * -               .* R18      R20       R21		PLANE FOF COMPUTING DESIRED RESPONSE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:201
//#                    *                . *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:202
//#                     *-              .  *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:203
//#   R22             R24*-    R23      .   *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:204
//#                       *             .    *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:205
//#                        *            .     *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:206
//#                         + -ADB      .      * AF              ATTITUDE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:207
//#  ........................+--+---------------+--+........................
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:208
//#                           AF *      .     +ADB  +             ERROR
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:209
//#                               *     .            *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:210
//#                                *    .            -*
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:211
//#                                 *   .             -*
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:212
//#                                  *  .              -*
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:213
//#                                   * .                *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:214
//#                                    *.               - *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:215
//#                                     .                - *****************
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:216
//#                                     .*                -
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:217
//#                                     . * --------------------------------
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:218
//#                                     .  *
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:219
//#                                     .   ********************************
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:220
//#                                     .
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:221
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:222
//#			FIG. 1	PHASE PLANE SWITCHING LOGIC
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:223
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:224
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:225
//# CONSTANTS FOR JET SWITCHING LOGIC
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:226
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:227
//WLH/SLOP	DEC	.00463		# = WL+H/SLOPE = .83333 DEG	$180
// PORT: Fixed ROM slots 20248.
    20248, 152,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:228
//WL-H/SLP	DEC	.00277		# = WL-H/SLOPE = .5 DEG		$180
// PORT: Fixed ROM slots 20249.
    20249, 90,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:229
//WLH		2DEC	.0011111111	# = WL+H = 0.5 DEG/SEC		$450
// PORT: Fixed ROM slots 20250 20251.
    20250, 36, 20251, 6700,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:230
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:231
//WLMH		2DEC	.0006666666	# = WL-H = 0.3 DEG/SEC		$450
// PORT: Fixed ROM slots 20252 20253.
    20252, 20, 20253, 30234,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:232
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:233
//WL		2DEC	.0008888888	# = WL   = 0.4 DEG/SEC		$450
// PORT: Fixed ROM slots 20254 20255.
    20254, 28, 20255, 18466,
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:234
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:235
//# Page 1030
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:236
//SLOPE2		DEC	.32		# = 0.8 DEG/SEC/DEG		$450/180
// PORT: Fixed ROM slots 20256.
    20256, 10486
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20257–20265.
function agcAotUnit1181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20260 {
        if slot <= 20258 {
            if slot <= 20257 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:237
//JETS		CA	ADB
// PORT: Fixed ROM slots 20257.
                if slot <> 20257 or instruction <> 13229 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 941).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:238
//		AD	FOUR		# AF = FLAT REGION = .044 DEG
// PORT: Fixed ROM slots 20258.
                if slot <> 20258 or instruction <> 27149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20259 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:239
//		TS	T5TEMP		# ADB+AF
// PORT: Fixed ROM slots 20259.
                if slot <> 20259 or instruction <> 23362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:240
//		CAF	TWO
// PORT: Fixed ROM slots 20260.
                if slot <> 20260 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        if slot <= 20262 {
            if slot <= 20261 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:241
//JLOOP		TS	SPNDX
// PORT: Fixed ROM slots 20261.
                if slot <> 20261 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:242
//		DOUBLE
// PORT: Fixed ROM slots 20262.
                if slot <> 20262 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20263 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:243
//		TS	DPNDX
// PORT: Fixed ROM slots 20263.
                if slot <> 20263 or instruction <> 23367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23367, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20264 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:244
//		EXTEND
// PORT: Fixed ROM slots 20264.
                    if slot <> 20264 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:245
//		INDEX	A
// PORT: Fixed ROM slots 20265.
                    if slot <> 20265 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1181] to agcAotUnit1181@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:246
//		DCA	ADOT
// PORT: Fixed ROM slots 20266.
    20266, 26296
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20267–20272.
function agcAotUnit1182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20269 {
        if slot <= 20267 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:247
//		DXCH	EDOT
// PORT: Fixed ROM slots 20267.
            if slot <> 20267 or instruction <> 22350 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 846, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20268 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:248
//		CA	HOLDFLAG	# HOLDFLAG = +0 MEANS THAT DAP IS IN
// PORT: Fixed ROM slots 20268.
                if slot <> 20268 or instruction <> 13018 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 730).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:249
//		EXTEND			# ATTITUDE HOLD AND RATE DAMPING IS OVER.
// PORT: Fixed ROM slots 20269.
                if slot <> 20269 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20270 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:250
//		BZF	INHOLD		# IF THIS IS THE CASE, BYPASS ADDITION
// PORT: Fixed ROM slots 20270.
            if slot <> 20270 or instruction <> 5939 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5939, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20271 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:251
//					# OF WBODY AND GO TO INHOLD
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:252
//		EXTEND
// PORT: Fixed ROM slots 20271.
                if slot <> 20271 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:253
//		INDEX	DPNDX
// PORT: Fixed ROM slots 20272.
                if slot <> 20272 or instruction <> 21319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1182] to agcAotUnit1182@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:254
//		DCS	WBODY
// PORT: Fixed ROM slots 20273.
    20273, 34476
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20274–20275.
function agcAotUnit1183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20274 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:255
//		DAS	EDOT		# = ADOT-WBODY
// PORT: Fixed ROM slots 20274.
        if slot <> 20274 or instruction <> 9038 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            if not agcCoreDas(words, 846) { return -1. }
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:256
//INHOLD		INDEX	SPNDX
// PORT: Fixed ROM slots 20275.
        if slot <> 20275 or instruction <> 21318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1183] to agcAotUnit1183@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:257
//		CA	ERRORX
// PORT: Fixed ROM slots 20276.
    20276, 26350
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20277–20282.
function agcAotUnit1184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20279 {
        if slot <= 20277 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:258
//		TS	AERR		# AERR = BIAS + AK
// PORT: Fixed ROM slots 20277.
            if slot <> 20277 or instruction <> 23375 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23375, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20278 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:259
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:260
//		CCS	EDOT
// PORT: Fixed ROM slots 20278.
                if slot <> 20278 or instruction <> 4941 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 845).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:261
//		TCF	POSVEL
// PORT: Fixed ROM slots 20279.
                if slot <> 20279 or instruction <> 5951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20280 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:262
//		TCF	SIGNCK1
// PORT: Fixed ROM slots 20280.
            if slot <> 20280 or instruction <> 5946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20281 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:263
//		TCF	NEGVEL
// PORT: Fixed ROM slots 20281.
                if slot <> 20281 or instruction <> 5959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5959, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:264
//SIGNCK1		CCS	EDOT +1
// PORT: Fixed ROM slots 20282.
                if slot <> 20282 or instruction <> 4942 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 846).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1184] to agcAotUnit1184@.

// PORT: Physical bank 21. Shared continuation entries, slots 20283–20410.
function agcAotUnit1185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20346 {
        if slot <= 20314 {
            if slot <= 20298 {
                if slot <= 20290 {
                    if slot <= 20286 {
                        if slot <= 20284 {
                            if slot <= 20283 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:265
//		TCF	POSVEL
// PORT: Fixed ROM slots 20283.
                                if slot <> 20283 or instruction <> 5951 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:266
//		TCF	POSVEL
// PORT: Fixed ROM slots 20284.
                                if slot <> 20284 or instruction <> 5951 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20285 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:267
//		TCF	NEGVEL
// PORT: Fixed ROM slots 20285.
                                if slot <> 20285 or instruction <> 5959 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5959, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:268
//		TCF	NEGVEL
// PORT: Fixed ROM slots 20286.
                                if slot <> 20286 or instruction <> 5959 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5959, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20288 {
                            if slot <= 20287 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:269
//POSVEL		EXTEND
// PORT: Fixed ROM slots 20287.
                                if slot <> 20287 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:270
//		DCA	EDOT
// PORT: Fixed ROM slots 20288.
                                if slot <> 20288 or instruction <> 13134 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20289 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:271
//		DXCH	EDOTVEL
// PORT: Fixed ROM slots 20289.
                                if slot <> 20289 or instruction <> 22353 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:272
//		CA	T5TEMP
// PORT: Fixed ROM slots 20290.
                                if slot <> 20290 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20294 {
                        if slot <= 20292 {
                            if slot <= 20291 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:273
//		TS	ADBVEL		# +(ADB+AF)
// PORT: Fixed ROM slots 20291.
                                if slot <> 20291 or instruction <> 23379 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23379, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:274
//		CA	AERR
// PORT: Fixed ROM slots 20292.
                                if slot <> 20292 or instruction <> 13135 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 847).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20293 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:275
//		TS	AERRVEL
// PORT: Fixed ROM slots 20293.
                                if slot <> 20293 or instruction <> 23378 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23378, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:276
//		TC	J6.
// PORT: Fixed ROM slots 20294.
                                if slot <> 20294 or instruction <> 1870 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1870, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20296 {
                            if slot <= 20295 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:277
//NEGVEL		EXTEND
// PORT: Fixed ROM slots 20295.
                                if slot <> 20295 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:278
//		DCS	EDOT
// PORT: Fixed ROM slots 20296.
                                if slot <> 20296 or instruction <> 17230 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20297 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:279
//		DXCH	EDOTVEL
// PORT: Fixed ROM slots 20297.
                                if slot <> 20297 or instruction <> 22353 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:280
//		CS	T5TEMP
// PORT: Fixed ROM slots 20298.
                                if slot <> 20298 or instruction <> 17218 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 834).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20306 {
                    if slot <= 20302 {
                        if slot <= 20300 {
                            if slot <= 20299 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:281
//		TS	ADBVEL		# -(ADB+AF)
// PORT: Fixed ROM slots 20299.
                                if slot <> 20299 or instruction <> 23379 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23379, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:282
//		CS	AERR
// PORT: Fixed ROM slots 20300.
                                if slot <> 20300 or instruction <> 17231 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 847).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20301 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:283
//		TS	AERRVEL
// PORT: Fixed ROM slots 20301.
                                if slot <> 20301 or instruction <> 23378 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23378, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:284
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:285
//J6.		EXTEND
// PORT: Fixed ROM slots 20302.
                                if slot <> 20302 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20304 {
                            if slot <= 20303 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:286
//# Page 1031
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:287
//		SU	ADB
// PORT: Fixed ROM slots 20303.
                                if slot <> 20303 or instruction <> 25517 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreSU(words, 941).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:288
//		AD	WLH/SLOP
// PORT: Fixed ROM slots 20304.
                                if slot <> 20304 or instruction <> 26392 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1816), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20305 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:289
//		EXTEND
// PORT: Fixed ROM slots 20305.
                                if slot <> 20305 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:290
//		BZMF	J8
// PORT: Fixed ROM slots 20306.
                                if slot <> 20306 or instruction <> 26473 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26473, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20310 {
                        if slot <= 20308 {
                            if slot <= 20307 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:291
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:292
//		CS	T5TEMP		# (ADB+AF)
// PORT: Fixed ROM slots 20307.
                                if slot <> 20307 or instruction <> 17218 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 834).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:293
//		AD	AERRVEL
// PORT: Fixed ROM slots 20308.
                                if slot <> 20308 or instruction <> 25426 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 850).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20309 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:294
//		EXTEND
// PORT: Fixed ROM slots 20309.
                                if slot <> 20309 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:295
//		BZMF	+2
// PORT: Fixed ROM slots 20310.
                                if slot <> 20310 or instruction <> 26456 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26456, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20312 {
                            if slot <= 20311 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:296
//		TCF	J7
// PORT: Fixed ROM slots 20311.
                                if slot <> 20311 or instruction <> 5986 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:297
//		EXTEND
// PORT: Fixed ROM slots 20312.
                                if slot <> 20312 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20313 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:298
//		DCS	EDOTVEL
// PORT: Fixed ROM slots 20313.
                                if slot <> 20313 or instruction <> 17233 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:299
//		EXTEND
// PORT: Fixed ROM slots 20314.
                                if slot <> 20314 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 20330 {
                if slot <= 20322 {
                    if slot <= 20318 {
                        if slot <= 20316 {
                            if slot <= 20315 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:300
//		DV	SLOPE
// PORT: Fixed ROM slots 20315.
                                if slot <> 20315 or instruction <> 5036 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 940, readEffective:call(words, 940)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:301
//		EXTEND
// PORT: Fixed ROM slots 20316.
                                if slot <> 20316 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20317 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:302
//		SU	AERRVEL
// PORT: Fixed ROM slots 20317.
                                if slot <> 20317 or instruction <> 25426 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreSU(words, 850).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:303
//		AD	ADB
// PORT: Fixed ROM slots 20318.
                                if slot <> 20318 or instruction <> 25517 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 941).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20320 {
                            if slot <= 20319 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:304
//		EXTEND
// PORT: Fixed ROM slots 20319.
                                if slot <> 20319 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:305
//		BZMF	J18
// PORT: Fixed ROM slots 20320.
                                if slot <> 20320 or instruction <> 26520 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26520, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20321 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:306
//		TCF	J23
// PORT: Fixed ROM slots 20321.
                                if slot <> 20321 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:307
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:308
//J7		CS	WL-H/SLP
// PORT: Fixed ROM slots 20322.
                                if slot <> 20322 or instruction <> 18201 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1817), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20326 {
                        if slot <= 20324 {
                            if slot <= 20323 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:309
//		EXTEND
// PORT: Fixed ROM slots 20323.
                                if slot <> 20323 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:310
//		SU	T5TEMP		# (ADB+AF)
// PORT: Fixed ROM slots 20324.
                                if slot <> 20324 or instruction <> 25410 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreSU(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20325 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:311
//		AD	AERRVEL
// PORT: Fixed ROM slots 20325.
                                if slot <> 20325 or instruction <> 25426 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 850).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:312
//		EXTEND
// PORT: Fixed ROM slots 20326.
                                if slot <> 20326 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20328 {
                            if slot <= 20327 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:313
//		BZMF	J20
// PORT: Fixed ROM slots 20327.
                                if slot <> 20327 or instruction <> 26524 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26524, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:314
//		TCF	J21
// PORT: Fixed ROM slots 20328.
                                if slot <> 20328 or instruction <> 6053 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6053, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20329 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:315
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:316
//J8		EXTEND
// PORT: Fixed ROM slots 20329.
                                if slot <> 20329 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:317
//		DCS	WLH
// PORT: Fixed ROM slots 20330.
                                if slot <> 20330 or instruction <> 18203 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 1819, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20338 {
                    if slot <= 20334 {
                        if slot <= 20332 {
                            if slot <= 20331 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:318
//		DXCH	WTEMP
// PORT: Fixed ROM slots 20331.
                                if slot <> 20331 or instruction <> 22348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:319
//		EXTEND
// PORT: Fixed ROM slots 20332.
                                if slot <> 20332 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20333 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:320
//		DCA	EDOTVEL
// PORT: Fixed ROM slots 20333.
                                if slot <> 20333 or instruction <> 13137 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:321
//		DAS	WTEMP
// PORT: Fixed ROM slots 20334.
                                if slot <> 20334 or instruction <> 9036 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 844) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20336 {
                            if slot <= 20335 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:322
//		CCS	WTEMP
// PORT: Fixed ROM slots 20335.
                                if slot <> 20335 or instruction <> 4939 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 843).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:323
//		TCF	J22
// PORT: Fixed ROM slots 20336.
                                if slot <> 20336 or instruction <> 6075 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6075, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20337 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:324
//		TCF	SIGNCK2
// PORT: Fixed ROM slots 20337.
                                if slot <> 20337 or instruction <> 6003 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6003, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:325
//		TCF	NJ22
// PORT: Fixed ROM slots 20338.
                                if slot <> 20338 or instruction <> 6007 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6007, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20342 {
                        if slot <= 20340 {
                            if slot <= 20339 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:326
//SIGNCK2		CCS	WTEMP +1
// PORT: Fixed ROM slots 20339.
                                if slot <> 20339 or instruction <> 4940 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 844).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:327
//		TCF	J22
// PORT: Fixed ROM slots 20340.
                                if slot <> 20340 or instruction <> 6075 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6075, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20341 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:328
//		TCF	J22
// PORT: Fixed ROM slots 20341.
                                if slot <> 20341 or instruction <> 6075 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6075, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:329
//		TCF	NJ22
// PORT: Fixed ROM slots 20342.
                                if slot <> 20342 or instruction <> 6007 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6007, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20344 {
                            if slot <= 20343 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:330
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:331
//NJ22		EXTEND
// PORT: Fixed ROM slots 20343.
                                if slot <> 20343 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:332
//		DCA	EDOTVEL
// PORT: Fixed ROM slots 20344.
                                if slot <> 20344 or instruction <> 13137 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20345 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:333
//		EXTEND
// PORT: Fixed ROM slots 20345.
                                if slot <> 20345 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:334
//		DV	SLOPE
// PORT: Fixed ROM slots 20346.
                                if slot <> 20346 or instruction <> 5036 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 940, readEffective:call(words, 940)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 20378 {
            if slot <= 20362 {
                if slot <= 20354 {
                    if slot <= 20350 {
                        if slot <= 20348 {
                            if slot <= 20347 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:335
//		AD	T5TEMP		# (ADB+AF)
// PORT: Fixed ROM slots 20347.
                                if slot <> 20347 or instruction <> 25410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:336
//		AD	AERRVEL
// PORT: Fixed ROM slots 20348.
                                if slot <> 20348 or instruction <> 25426 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 850).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20349 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:337
//# Page 1032
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:338
//		CCS	A
// PORT: Fixed ROM slots 20349.
                                if slot <> 20349 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:339
//		TCF	J23
// PORT: Fixed ROM slots 20350.
                                if slot <> 20350 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20352 {
                            if slot <= 20351 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:340
//		TCF	J23
// PORT: Fixed ROM slots 20351.
                                if slot <> 20351 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:341
//		TCF	+2
// PORT: Fixed ROM slots 20352.
                                if slot <> 20352 or instruction <> 6018 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6018, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20353 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:342
//		TCF	J23
// PORT: Fixed ROM slots 20353.
                                if slot <> 20353 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:343
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:344
//		EXTEND
// PORT: Fixed ROM slots 20354.
                                if slot <> 20354 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20358 {
                        if slot <= 20356 {
                            if slot <= 20355 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:345
//		DCS	WLMH		# WL - H
// PORT: Fixed ROM slots 20355.
                                if slot <> 20355 or instruction <> 18205 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 1821, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:346
//		DXCH	WTEMP
// PORT: Fixed ROM slots 20356.
                                if slot <> 20356 or instruction <> 22348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20357 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:347
//		EXTEND
// PORT: Fixed ROM slots 20357.
                                if slot <> 20357 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:348
//		DCA	EDOTVEL
// PORT: Fixed ROM slots 20358.
                                if slot <> 20358 or instruction <> 13137 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 849, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20360 {
                            if slot <= 20359 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:349
//		DAS	WTEMP
// PORT: Fixed ROM slots 20359.
                                if slot <> 20359 or instruction <> 9036 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 844) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:350
//		CCS	WTEMP
// PORT: Fixed ROM slots 20360.
                                if slot <> 20360 or instruction <> 4939 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 843).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20361 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:351
//		TCF	J23
// PORT: Fixed ROM slots 20361.
                                if slot <> 20361 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:352
//		TCF	SIGNCK3
// PORT: Fixed ROM slots 20362.
                                if slot <> 20362 or instruction <> 6028 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6028, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20370 {
                    if slot <= 20366 {
                        if slot <= 20364 {
                            if slot <= 20363 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:353
//		TCF	NJ23
// PORT: Fixed ROM slots 20363.
                                if slot <> 20363 or instruction <> 6032 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6032, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:354
//SIGNCK3		CCS	WTEMP +1
// PORT: Fixed ROM slots 20364.
                                if slot <> 20364 or instruction <> 4940 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 844).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20365 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:355
//		TCF	J23
// PORT: Fixed ROM slots 20365.
                                if slot <> 20365 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:356
//		TCF	J23
// PORT: Fixed ROM slots 20366.
                                if slot <> 20366 or instruction <> 6084 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20368 {
                            if slot <= 20367 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:357
//		TCF	NJ23
// PORT: Fixed ROM slots 20367.
                                if slot <> 20367 or instruction <> 6032 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6032, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:358
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:359
//NJ23		CA	AERRVEL
// PORT: Fixed ROM slots 20368.
                                if slot <> 20368 or instruction <> 13138 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 850).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20369 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:360
//		AD	T5TEMP		# (ADB+AF)
// PORT: Fixed ROM slots 20369.
                                if slot <> 20369 or instruction <> 25410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:361
//		AD	WL-H/SLP
// PORT: Fixed ROM slots 20370.
                                if slot <> 20370 or instruction <> 26393 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1817), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20374 {
                        if slot <= 20372 {
                            if slot <= 20371 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:362
//		CCS	A
// PORT: Fixed ROM slots 20371.
                                if slot <> 20371 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:363
//		TCF	J24
// PORT: Fixed ROM slots 20372.
                                if slot <> 20372 or instruction <> 6094 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6094, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20373 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:364
//		TCF	J24
// PORT: Fixed ROM slots 20373.
                                if slot <> 20373 or instruction <> 6094 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6094, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:365
//		TCF	J22
// PORT: Fixed ROM slots 20374.
                                if slot <> 20374 or instruction <> 6075 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6075, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20376 {
                            if slot <= 20375 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:366
//		TCF	J22
// PORT: Fixed ROM slots 20375.
                                if slot <> 20375 or instruction <> 6075 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6075, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:367
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:368
//J18		EXTEND
// PORT: Fixed ROM slots 20376.
                                if slot <> 20376 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20377 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:369
//		DCS	EDOT
// PORT: Fixed ROM slots 20377.
                                if slot <> 20377 or instruction <> 17230 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:370
//		DXCH	KMPAC
// PORT: Fixed ROM slots 20378.
                                if slot <> 20378 or instruction <> 22345 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 20394 {
                if slot <= 20386 {
                    if slot <= 20382 {
                        if slot <= 20380 {
                            if slot <= 20379 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:371
//		TCF	JTIME
// PORT: Fixed ROM slots 20379.
                                if slot <> 20379 or instruction <> 6103 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:372
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:373
//J20		CS	AERR
// PORT: Fixed ROM slots 20380.
                                if slot <> 20380 or instruction <> 17231 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 847).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20381 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:374
//		AD	ADBVEL
// PORT: Fixed ROM slots 20381.
                                if slot <> 20381 or instruction <> 25427 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 851).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:375
//		EXTEND
// PORT: Fixed ROM slots 20382.
                                if slot <> 20382 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20384 {
                            if slot <= 20383 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:376
//		MP	SLOPE2		# (HYSTERESIS SLOPE)
// PORT: Fixed ROM slots 20383.
                                if slot <> 20383 or instruction <> 30496 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1824, readEffective:call(words, 1824)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:377
//		DXCH	KMPAC
// PORT: Fixed ROM slots 20384.
                                if slot <> 20384 or instruction <> 22345 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20385 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:378
//		EXTEND
// PORT: Fixed ROM slots 20385.
                                if slot <> 20385 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:379
//		DCS	EDOT
// PORT: Fixed ROM slots 20386.
                                if slot <> 20386 or instruction <> 17230 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20390 {
                        if slot <= 20388 {
                            if slot <= 20387 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:380
//		DAS	KMPAC
// PORT: Fixed ROM slots 20387.
                                if slot <> 20387 or instruction <> 9033 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 841) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:381
//		TCF	JTIME
// PORT: Fixed ROM slots 20388.
                                if slot <> 20388 or instruction <> 6103 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20389 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:382
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:383
//J21		CCS	EDOT
// PORT: Fixed ROM slots 20389.
                                if slot <> 20389 or instruction <> 4941 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 845).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:384
//		TCF	JP
// PORT: Fixed ROM slots 20390.
                                if slot <> 20390 or instruction <> 6068 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6068, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20392 {
                            if slot <= 20391 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:385
//		TCF	SIGNCK4
// PORT: Fixed ROM slots 20391.
                                if slot <> 20391 or instruction <> 6057 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6057, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:386
//		TCF	JN
// PORT: Fixed ROM slots 20392.
                                if slot <> 20392 or instruction <> 6061 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6061, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20393 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:387
//SIGNCK4		CCS	EDOT +1
// PORT: Fixed ROM slots 20393.
                                if slot <> 20393 or instruction <> 4942 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 846).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:388
//# Page 1033
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:389
//		TCF	JP
// PORT: Fixed ROM slots 20394.
                                if slot <> 20394 or instruction <> 6068 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6068, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20402 {
                    if slot <= 20398 {
                        if slot <= 20396 {
                            if slot <= 20395 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:390
//		TCF	JP
// PORT: Fixed ROM slots 20395.
                                if slot <> 20395 or instruction <> 6068 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6068, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:391
//		TCF	JN
// PORT: Fixed ROM slots 20396.
                                if slot <> 20396 or instruction <> 6061 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6061, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20397 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:392
//JN		EXTEND
// PORT: Fixed ROM slots 20397.
                                if slot <> 20397 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:393
//		DCS	EDOT
// PORT: Fixed ROM slots 20398.
                                if slot <> 20398 or instruction <> 17230 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20400 {
                            if slot <= 20399 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:394
//		DXCH	KMPAC
// PORT: Fixed ROM slots 20399.
                                if slot <> 20399 or instruction <> 22345 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:395
//		EXTEND
// PORT: Fixed ROM slots 20400.
                                if slot <> 20400 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20401 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:396
//		DCA	WL
// PORT: Fixed ROM slots 20401.
                                if slot <> 20401 or instruction <> 14111 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1823, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:397
//		DAS	KMPAC
// PORT: Fixed ROM slots 20402.
                                if slot <> 20402 or instruction <> 9033 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 841) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20406 {
                        if slot <= 20404 {
                            if slot <= 20403 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:398
//		TCF	JTIME
// PORT: Fixed ROM slots 20403.
                                if slot <> 20403 or instruction <> 6103 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:399
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:400
//JP		EXTEND
// PORT: Fixed ROM slots 20404.
                                if slot <> 20404 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20405 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:401
//		DCS	EDOT
// PORT: Fixed ROM slots 20405.
                                if slot <> 20405 or instruction <> 17230 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:402
//		DXCH	KMPAC
// PORT: Fixed ROM slots 20406.
                                if slot <> 20406 or instruction <> 22345 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 20408 {
                            if slot <= 20407 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:403
//		EXTEND
// PORT: Fixed ROM slots 20407.
                                if slot <> 20407 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:404
//		DCS	WL
// PORT: Fixed ROM slots 20408.
                                if slot <> 20408 or instruction <> 18207 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 1823, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 20409 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:405
//		DAS	KMPAC
// PORT: Fixed ROM slots 20409.
                                if slot <> 20409 or instruction <> 9033 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 841) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:406
//		TCF	JTIME
// PORT: Fixed ROM slots 20410.
                                if slot <> 20410 or instruction <> 6103 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
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
set agcAotRoutes[1185] to agcAotUnit1185@.

// PORT: Physical bank 21. Shared continuation entries, slots 20411–20420.
function agcAotUnit1186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20415 {
        if slot <= 20412 {
            if slot <= 20411 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:407
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:408
//J22		CCS	EDOT
// PORT: Fixed ROM slots 20411.
                if slot <> 20411 or instruction <> 4941 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 845).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:409
//		TCF	JN
// PORT: Fixed ROM slots 20412.
                if slot <> 20412 or instruction <> 6061 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6061, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20413 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:410
//		TCF	SIGNCK5
// PORT: Fixed ROM slots 20413.
                if slot <> 20413 or instruction <> 6079 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6079, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20414 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:411
//		TCF	JP
// PORT: Fixed ROM slots 20414.
                    if slot <> 20414 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:412
//SIGNCK5		CCS	EDOT +1
// PORT: Fixed ROM slots 20415.
                    if slot <> 20415 or instruction <> 4942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 846).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20417 {
            if slot <= 20416 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:413
//		TCF	JN
// PORT: Fixed ROM slots 20416.
                if slot <> 20416 or instruction <> 6061 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6061, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:414
//		TCF	JN
// PORT: Fixed ROM slots 20417.
                if slot <> 20417 or instruction <> 6061 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6061, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20418 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:415
//		TCF	JP
// PORT: Fixed ROM slots 20418.
                if slot <> 20418 or instruction <> 6068 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6068, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20419 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:416
//		TCF	JP
// PORT: Fixed ROM slots 20419.
                    if slot <> 20419 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:417
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:418
//J23		INDEX	SPNDX
// PORT: Fixed ROM slots 20420.
                    if slot <> 20420 or instruction <> 21318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1186] to agcAotUnit1186@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:419
//		CS	BIT13		# RESET RATE DAMPING FLAG
// PORT: Fixed ROM slots 20421.
    20421, 37894
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20422–20424.
function agcAotUnit1187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20422 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:420
//		MASK	RCSFLAGS	# BIT13 FOR ROLL  (SPNDX = 0)
// PORT: Fixed ROM slots 20422.
        if slot <> 20422 or instruction <> 29505 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 833).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20423 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:421
//		TS	RCSFLAGS	# BIT12 FOR PITCH (SPNDX = 1)
// PORT: Fixed ROM slots 20423.
            if slot <> 20423 or instruction <> 23361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23361, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:422
//					# BIT11 FOR YAW   (SPNDX = 2)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:423
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:424
//		INDEX	SPNDX
// PORT: Fixed ROM slots 20424.
            if slot <> 20424 or instruction <> 21318 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1187] to agcAotUnit1187@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:425
//		CAF	OCT01400	# IS THERE TO BE A FORCED FIRING ON THIS
// PORT: Fixed ROM slots 20425.
    20425, 27702
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20426–20439.
function agcAotUnit1188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20432 {
        if slot <= 20428 {
            if slot <= 20426 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:426
//		MASK	RCSFLAGS	# AXIS
// PORT: Fixed ROM slots 20426.
                if slot <> 20426 or instruction <> 29505 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 833).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20427 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:427
//		EXTEND
// PORT: Fixed ROM slots 20427.
                    if slot <> 20427 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:428
//		BZF	DOJET +2	# NO, GO TO DOJET +2 AND DO NOTHING
// PORT: Fixed ROM slots 20428.
                    if slot <> 20428 or instruction <> 6120 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6120, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20430 {
                if slot <= 20429 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:429
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:430
//		TCF	J18		# YES, GO TO J18 AND FORCE A FIRING
// PORT: Fixed ROM slots 20429.
                    if slot <> 20429 or instruction <> 6040 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6040, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:431
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:432
//J24		CS	AERR
// PORT: Fixed ROM slots 20430.
                    if slot <> 20430 or instruction <> 17231 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 847).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20431 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:433
//		EXTEND
// PORT: Fixed ROM slots 20431.
                    if slot <> 20431 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:434
//		SU	ADBVEL
// PORT: Fixed ROM slots 20432.
                    if slot <> 20432 or instruction <> 25427 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreSU(words, 851).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20435 {
            if slot <= 20433 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:435
//		EXTEND
// PORT: Fixed ROM slots 20433.
                if slot <> 20433 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20434 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:436
//		MP	SLOPE2		# (HYSTERESIS SLOPE)
// PORT: Fixed ROM slots 20434.
                    if slot <> 20434 or instruction <> 30496 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1824, readEffective:call(words, 1824)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:437
//		DXCH	KMPAC
// PORT: Fixed ROM slots 20435.
                    if slot <> 20435 or instruction <> 22345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20437 {
                if slot <= 20436 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:438
//		EXTEND
// PORT: Fixed ROM slots 20436.
                    if slot <> 20436 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:439
//# Page 1034
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:440
//		DCS	EDOT
// PORT: Fixed ROM slots 20437.
                    if slot <> 20437 or instruction <> 17230 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 846, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20438 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:441
//		DAS	KMPAC
// PORT: Fixed ROM slots 20438.
                    if slot <> 20438 or instruction <> 9033 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 841) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:442
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:443
//# Page 1035
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:444
//# 	COMPUTE THE JET ON TIME NECESSARY TO ACCOMPLISH THE DESIRED CHANGE IN RATE, IE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:445
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:446
//#	     T  = J/M(DELTA W)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:447
//#	      J
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:448
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:449
//#	DELTA W = DESIRED CHANGE IN S/C ANGULAR RATE AS DETERMINED BY THE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:450
//#		  SWITCHING LOGIC, AT THIS POINT STORED IN KMPAC.
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:451
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:452
//#	    J/M = S/C INERTIA TO TORQUE 9ATIO SCALED BY
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:453
//#		  	(57.3/450)(B24/1600)(1/.8)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:454
//#		  FOR 1 JET OPERATION  (M = 700 FT-LB).
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:455
//#		  IE  J/M = J(SLUG-FTFT) x 0.00000085601606
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:456
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:457
//#	          THE CORRESPONDING COMPUTER VARIABLES ESTABLISHED BY
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:458
//#		  KEYBOARD ENTRY ARE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:459
//#			J/M (ROLL)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:460
//#			J/M1 (PITCH)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:461
//#			J/M2 (YAW)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:462
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:463
//#	     T  = JET-ON TIME    SCALED 16384/1600 SEC
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:464
//#	      J
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:465
//#
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:466
//#	          THE COMPUTER VARIABLES ARE
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:467
//#			TAU  (ROLL)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:468
//#			TAU1 (PITCH)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:469
//#			TAU2 (YAW)
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:470
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:471
//JTIME		INDEX	SPNDX		# PICK UP S/C INERTIA/TORQUE RATIO
// PORT: Fixed ROM slots 20439.
                    if slot <> 20439 or instruction <> 21318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1188] to agcAotUnit1188@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:472
//		CA	J/M		# SCALED (57.3/450)(B24/1600)
// PORT: Fixed ROM slots 20440.
    20440, 26406
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20441–20454.
function agcAotUnit1189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20447 {
        if slot <= 20443 {
            if slot <= 20441 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:473
//		TC	SMALLMP		# FOR 1-JET OPERATION
// PORT: Fixed ROM slots 20441.
                if slot <> 20441 or instruction <> 1058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1058, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20442 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:474
//		CA	BIT11
// PORT: Fixed ROM slots 20442.
                    if slot <> 20442 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:475
//		TC	SMALLMP
// PORT: Fixed ROM slots 20443.
                    if slot <> 20443 or instruction <> 1058 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1058, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20445 {
                if slot <= 20444 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:476
//		CCS	KMPAC
// PORT: Fixed ROM slots 20444.
                    if slot <> 20444 or instruction <> 4936 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 840).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:477
//		TCF	+4
// PORT: Fixed ROM slots 20445.
                    if slot <> 20445 or instruction <> 6113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6113, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20446 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:478
//		TCF	TAUNORM
// PORT: Fixed ROM slots 20446.
                    if slot <> 20446 or instruction <> 6117 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6117, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:479
//		TCF	+4
// PORT: Fixed ROM slots 20447.
                    if slot <> 20447 or instruction <> 6115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20450 {
            if slot <= 20448 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:480
//		TCF	TAUNORM
// PORT: Fixed ROM slots 20448.
                if slot <> 20448 or instruction <> 6117 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6117, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20449 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:481
//		CA	POSMAX
// PORT: Fixed ROM slots 20449.
                    if slot <> 20449 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:482
//		TCF	DOJET
// PORT: Fixed ROM slots 20450.
                    if slot <> 20450 or instruction <> 6118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20452 {
                if slot <= 20451 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:483
//		CA	NEGMAX
// PORT: Fixed ROM slots 20451.
                    if slot <> 20451 or instruction <> 14849 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:484
//		TCF	DOJET
// PORT: Fixed ROM slots 20452.
                    if slot <> 20452 or instruction <> 6118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6118, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20453 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:485
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:486
//TAUNORM		CA	KMPAC +1
// PORT: Fixed ROM slots 20453.
                    if slot <> 20453 or instruction <> 13129 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 841).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:487
//DOJET		INDEX	SPNDX
// PORT: Fixed ROM slots 20454.
                    if slot <> 20454 or instruction <> 21318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21318, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1189] to agcAotUnit1189@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:488
//		TS	TAU
// PORT: Fixed ROM slots 20455.
    20455, 46818
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20456–20466.
function agcAotUnit1190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20460 {
        if slot <= 20457 {
            if slot <= 20456 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:489
//		CCS	SPNDX
// PORT: Fixed ROM slots 20456.
                if slot <> 20456 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:490
//		TCF	JLOOP
// PORT: Fixed ROM slots 20457.
                if slot <> 20457 or instruction <> 5925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5925, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20458 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:491
//		TCF	T6PROG
// PORT: Fixed ROM slots 20458.
                if slot <> 20458 or instruction <> 6127 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6127, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20459 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:492
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:493
//# Page 1036
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:494
//ZEROCMDS	CAF	ZERO
// PORT: Fixed ROM slots 20459.
                    if slot <> 20459 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:495
//		TS	TAU
// PORT: Fixed ROM slots 20460.
                    if slot <> 20460 or instruction <> 23409 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23409, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20463 {
            if slot <= 20461 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:496
//		TS	TAU1
// PORT: Fixed ROM slots 20461.
                if slot <> 20461 or instruction <> 23410 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23410, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20462 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:497
//		TS	TAU2
// PORT: Fixed ROM slots 20462.
                    if slot <> 20462 or instruction <> 23411 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23411, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:498
//T6PROG		EXTEND			# WHEN THE ROTATION COMMANDS (TAUS)
// PORT: Fixed ROM slots 20463.
                    if slot <> 20463 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20464 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:499
//		DCA	JETADDR		# HAVE BEEN DETERMINED
// PORT: Fixed ROM slots 20464.
                if slot <> 20464 or instruction <> 14324 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2036, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20465 {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:500
//		DXCH	T5LOC		# RESET T5LOC FOR PHASE3
// PORT: Fixed ROM slots 20465.
                    if slot <> 20465 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:501
//		TCF	RESUME
// PORT: Fixed ROM slots 20466.
                    if slot <> 20466 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1190] to agcAotUnit1190@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:502
//
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:503
//		EBANK=	KMPAC
// PORT: SOURCE AUTOMATIC_MANEUVERS.agc:504
//JETADDR		2CADR	JETSLECT
// PORT: Fixed ROM slots 20467 20468.
    20467, 2772, 20468, 30828
)).

