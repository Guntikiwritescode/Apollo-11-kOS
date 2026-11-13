// RESTARTS_ROUTINE.agc
// bank 01, slots 3926-3941
function agcAotUnit131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3933 {
        if slot <= 3929 {
            if slot <= 3927 {
                if slot <= 3926 {
// RESTARTS_ROUTINE.agc:1
//# Copyright:	Public domain.
// RESTARTS_ROUTINE.agc:2
//# Filename:	RESTARTS_ROUTINE.agc
// RESTARTS_ROUTINE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// RESTARTS_ROUTINE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// RESTARTS_ROUTINE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RESTARTS_ROUTINE.agc:6
//# Assembler:	yaYUL
// RESTARTS_ROUTINE.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// RESTARTS_ROUTINE.agc:8
//# Website:	www.ibiblio.org/apollo.
// RESTARTS_ROUTINE.agc:9
//# Pages:	1303-1309
// RESTARTS_ROUTINE.agc:10
//# Mod history:	2009-05-27 OH	Transcribed from page images.
// RESTARTS_ROUTINE.agc:11
//#
// RESTARTS_ROUTINE.agc:12
//# This source code has been transcribed or otherwise adapted from
// RESTARTS_ROUTINE.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// RESTARTS_ROUTINE.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// RESTARTS_ROUTINE.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// RESTARTS_ROUTINE.agc:16
//# in storage size and consequent reduction in image quality as well) are
// RESTARTS_ROUTINE.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// RESTARTS_ROUTINE.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// RESTARTS_ROUTINE.agc:19
//# about getting access to the (much) higher-quality images which Paul
// RESTARTS_ROUTINE.agc:20
//# actually created.
// RESTARTS_ROUTINE.agc:21
//#
// RESTARTS_ROUTINE.agc:22
//# Notations on the hardcopy document read, in part:
// RESTARTS_ROUTINE.agc:23
//#
// RESTARTS_ROUTINE.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// RESTARTS_ROUTINE.agc:25
//#	16:27 JULY 14, 1969
// RESTARTS_ROUTINE.agc:26
//
// RESTARTS_ROUTINE.agc:27
//# Page 1303
// RESTARTS_ROUTINE.agc:28
//		BANK	01
// RESTARTS_ROUTINE.agc:29
//		SETLOC	RESTART
// RESTARTS_ROUTINE.agc:30
//		BANK
// RESTARTS_ROUTINE.agc:31
//
// RESTARTS_ROUTINE.agc:32
//		EBANK=	PHSNAME1	# GOPROG MUST SWITCH TO THIS EBANK
// RESTARTS_ROUTINE.agc:33
//
// RESTARTS_ROUTINE.agc:34
//		COUNT*	$$/RSROU
// RESTARTS_ROUTINE.agc:35
//RESTARTS	CA	MPAC +5		# GET GROUP NUMBER -1
// slot 3926
                    if slot <> 3926 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:36
//		DOUBLE			# SAVE FOR INDEXING
// slot 3927
                    if slot <> 3927 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3928 {
// RESTARTS_ROUTINE.agc:37
//		TS	TEMP2G
// slot 3928
                    if slot <> 3928 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:38
//
// RESTARTS_ROUTINE.agc:39
//		CA	PHS2CADR	# SET UP EXIT IN CASE IT IS AN EVEN
// slot 3929
                    if slot <> 3929 or instruction <> 14328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2040), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3931 {
                if slot <= 3930 {
// RESTARTS_ROUTINE.agc:40
//		TS	TEMPSWCH	# TABLE PHASE
// slot 3930
                    if slot <> 3930 or instruction <> 22639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22639, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:41
//
// RESTARTS_ROUTINE.agc:42
//		CA	RTRNCADR	# TO SAVE TIME ASSUME IT WILL GET NEXT
// slot 3931
                    if slot <> 3931 or instruction <> 14197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1909), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3932 {
// RESTARTS_ROUTINE.agc:43
//		TS	GOLOC +2	# GROUP AFTER THIS
// slot 3932
                    if slot <> 3932 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:44
//
// RESTARTS_ROUTINE.agc:45
//		CA	TEMPPHS
// slot 3933
                    if slot <> 3933 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3937 {
            if slot <= 3935 {
                if slot <= 3934 {
// RESTARTS_ROUTINE.agc:46
//		MASK	OCT1400
// slot 3934
                    if slot <> 3934 or instruction <> 31239 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        if fixedOperand = 768 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 256), 4) * 256).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:47
//		CCS	A		# IS IT A VARIABLE OR TABLE RESTART
// slot 3935
                    if slot <> 3935 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3936 {
// RESTARTS_ROUTINE.agc:48
//		TCF	ITSAVAR		# IT:S A VARIABLE RESTART
// slot 3936
                    if slot <> 3936 or instruction <> 5993 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5993, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:49
//
// RESTARTS_ROUTINE.agc:50
//GETPART2	CCS	TEMPPHS		# IS IT AN X.1 RESTART
// slot 3937
                    if slot <> 3937 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3939 {
                if slot <= 3938 {
// RESTARTS_ROUTINE.agc:51
//		CCS	A
// slot 3938
                    if slot <> 3938 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:52
//		TCF	ITSATBL		# NO, ITS A TABLE RESTART
// slot 3939
                    if slot <> 3939 or instruction <> 6057 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6057, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3940 {
// RESTARTS_ROUTINE.agc:53
//
// RESTARTS_ROUTINE.agc:54
//		CA	PRIO14		# IT IS AN X.1 RESTART, THEREFORE START
// slot 3940
                    if slot <> 3940 or instruction <> 14868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:55
//		TC	FINDVAC		# THE DISPLAY RESTART JOB
// slot 3941
                    if slot <> 3941 or instruction <> 2629 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[131] to agcAotUnit131@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:56
//		EBANK=	LST1
// RESTARTS_ROUTINE.agc:57
//		2CADR	INITDSP
// slot 3942 3943
    3942, 3134, 3943, 16518
)).

// bank 01, slots 3944-3949
function agcAotUnit132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3946 {
        if slot <= 3944 {
// RESTARTS_ROUTINE.agc:58
//
// RESTARTS_ROUTINE.agc:59
//		TC	RTRNCADR	# FINISHED WITH THIS GROUP, GET NEXT ONE
// slot 3944
            if slot <> 3944 or instruction <> 1909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1909, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3945 {
// RESTARTS_ROUTINE.agc:60
//
// RESTARTS_ROUTINE.agc:61
//ITSAVAR		MASK	OCT1400		# IS IT TYPE B ?
// slot 3945
                if slot <> 3945 or instruction <> 31239 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    if fixedOperand = 768 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 4) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:62
//		CCS	A
// slot 3946
                if slot <> 3946 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 3947 {
// RESTARTS_ROUTINE.agc:63
//		TCF	ITSLIKEB	# YES,IT IS TYPE B
// slot 3947
            if slot <> 3947 or instruction <> 6034 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6034, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3948 {
// RESTARTS_ROUTINE.agc:64
//
// RESTARTS_ROUTINE.agc:65
//		EXTEND			# STORE THE JOB (OR TASK) 2CADR FOR EXIT
// slot 3948
                if slot <> 3948 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:66
//		NDX	TEMP2G
// slot 3949
                if slot <> 3949 or instruction <> 20589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20589, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[132] to agcAotUnit132@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:67
//		DCA	PHSNAME1
// slot 3950
    3950, 26174
)).

// bank 01, slots 3951-3962
function agcAotUnit133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3956 {
        if slot <= 3953 {
            if slot <= 3951 {
// RESTARTS_ROUTINE.agc:68
//		DXCH	GOLOC
// slot 3951
                if slot <> 3951 or instruction <> 21958 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 454, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3952 {
// RESTARTS_ROUTINE.agc:69
//
// RESTARTS_ROUTINE.agc:70
//		CA	TEMPPHS		# SEE IF THIS IS A JOB, TASK, OR A LONGCAL
// slot 3952
                    if slot <> 3952 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:71
//		MASK	OCT7
// slot 3953
                    if slot <> 3953 or instruction <> 31215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3954 {
// RESTARTS_ROUTINE.agc:72
//		AD	MINUS2
// slot 3954
                if slot <> 3954 or instruction <> 28646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3955 {
// RESTARTS_ROUTINE.agc:73
//		CCS	A
// slot 3955
                    if slot <> 3955 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:74
//		TCF	ITSLNGCL	# ITS A LONGCALL
// slot 3956
                    if slot <> 3956 or instruction <> 6108 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6108, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3959 {
            if slot <= 3957 {
// RESTARTS_ROUTINE.agc:75
//
// RESTARTS_ROUTINE.agc:76
//RTRNCADR	TC	SWRETURN	# CANT GET HERE
// slot 3957
                if slot <> 3957 or instruction <> 2457 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2457, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3958 {
// RESTARTS_ROUTINE.agc:77
//# Page 1304
// RESTARTS_ROUTINE.agc:78
//		TCF	ITSAWAIT
// slot 3958
                    if slot <> 3958 or instruction <> 6008 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6008, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:79
//
// RESTARTS_ROUTINE.agc:80
//		TCF	ITSAJOB		# ITS A JOB
// slot 3959
                    if slot <> 3959 or instruction <> 6045 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6045, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3960 {
// RESTARTS_ROUTINE.agc:81
//
// RESTARTS_ROUTINE.agc:82
//ITSAWAIT	CA	WTLTCADR	# SET UP WAITLIST CALL
// slot 3960
                if slot <> 3960 or instruction <> 14332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2044), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3961 {
// RESTARTS_ROUTINE.agc:83
//		TS	GOLOC -1
// slot 3961
                    if slot <> 3961 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:84
//
// RESTARTS_ROUTINE.agc:85
//		NDX	TEMP2G		# DIRECTLY STORED
// slot 3962
                    if slot <> 3962 or instruction <> 20589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20589, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20589, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[133] to agcAotUnit133@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:86
//		CA	PHSPRDT1
// slot 3963
    3963, 25688
)).

// bank 01, slots 3964-3968
function agcAotUnit134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3965 {
        if slot <= 3964 {
// RESTARTS_ROUTINE.agc:87
//TIMETEST	CCS	A		# IS IT AN IMMEDIATE RESTART
// slot 3964
            if slot <> 3964 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:88
//		INCR	A		# NO.
// slot 3965
            if slot <> 3965 or instruction <> 10240 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3966 {
// RESTARTS_ROUTINE.agc:89
//		TCF	FINDTIME	# FIND OUT WHEN IT SHOULD BEGIN
// slot 3966
            if slot <> 3966 or instruction <> 6017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6017, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3967 {
// RESTARTS_ROUTINE.agc:90
//
// RESTARTS_ROUTINE.agc:91
//		TCF	ITSINDIR	# STORED INDIRECTLY
// slot 3967
                if slot <> 3967 or instruction <> 6942 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6942, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:92
//
// RESTARTS_ROUTINE.agc:93
//		TCF	IMEDIATE	# IT WANTS AN IMMEDIATE RESTART
// slot 3968
                if slot <> 3968 or instruction <> 6032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[134] to agcAotUnit134@.

// bank 02, slots 4894-4896
function agcAotUnit212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4894 {
// RESTARTS_ROUTINE.agc:94
//
// RESTARTS_ROUTINE.agc:95
//# ***** THIS MUST BE IN FIXED FIXED *****
// RESTARTS_ROUTINE.agc:96
//
// RESTARTS_ROUTINE.agc:97
//		BLOCK	02
// RESTARTS_ROUTINE.agc:98
//		SETLOC	FFTAG2
// RESTARTS_ROUTINE.agc:99
//		BANK
// RESTARTS_ROUTINE.agc:100
//
// RESTARTS_ROUTINE.agc:101
//		COUNT*	$$/RSROU
// RESTARTS_ROUTINE.agc:102
//ITSINDIR	LXCH	GOLOC +1	# GET THE CORRECT E BANK IN CASE THIS IS
// slot 4894
        if slot <> 4894 or instruction <> 9670 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 454, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4895 {
// RESTARTS_ROUTINE.agc:103
//		LXCH	BB		# SWITCHED ERRASIBLE
// slot 4895
            if slot <> 4895 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:104
//
// RESTARTS_ROUTINE.agc:105
//		NDX	A		# GET THE TIME INDIRECTLY
// slot 4896
            if slot <> 4896 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[212] to agcAotUnit212@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:106
//		CA	1
// slot 4897
    4897, 24578
)).

// bank 02, slots 4898-4900
function agcAotUnit213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4898 {
// RESTARTS_ROUTINE.agc:107
//
// RESTARTS_ROUTINE.agc:108
//		LXCH	BB		# RESTORE THE BB AND GOLOC
// slot 4898
        if slot <> 4898 or instruction <> 9222 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 6, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4899 {
// RESTARTS_ROUTINE.agc:109
//		LXCH	GOLOC +1
// slot 4899
            if slot <> 4899 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:110
//
// RESTARTS_ROUTINE.agc:111
//		TCF	FINDTIME	# FIND OUT WHEN IT SHOULD BEGIN
// slot 4900
            if slot <> 4900 or instruction <> 6017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6017, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[213] to agcAotUnit213@.

// bank 01, slots 3969-3971
function agcAotUnit135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3969 {
// RESTARTS_ROUTINE.agc:112
//
// RESTARTS_ROUTINE.agc:113
//# ***** YOU MAY RETURN TO SWITCHED FIXED *****
// RESTARTS_ROUTINE.agc:114
//
// RESTARTS_ROUTINE.agc:115
//		BANK 	01
// RESTARTS_ROUTINE.agc:116
//		SETLOC	RESTART
// RESTARTS_ROUTINE.agc:117
//		BANK
// RESTARTS_ROUTINE.agc:118
//
// RESTARTS_ROUTINE.agc:119
//		COUNT*	$$/RSROU
// RESTARTS_ROUTINE.agc:120
//FINDTIME	COM			# MAKE NEGITIVE SINCE IT WILL BE SUBTRACTD
// slot 3969
        if slot <> 3969 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3970 {
// RESTARTS_ROUTINE.agc:121
//		TS	L		# AND SAVE
// slot 3970
            if slot <> 3970 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:122
//		NDX	TEMP2G
// slot 3971
            if slot <> 3971 or instruction <> 20589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[135] to agcAotUnit135@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:123
//		CS	TBASE1
// slot 3972
    3972, 33878
)).

// bank 01, slots 3973-3994
function agcAotUnit136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3983 {
        if slot <= 3977 {
            if slot <= 3974 {
                if slot <= 3973 {
// RESTARTS_ROUTINE.agc:124
//		EXTEND
// slot 3973
                    if slot <> 3973 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:125
//		SU	TIME1
// slot 3974
                    if slot <> 3974 or instruction <> 24597 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreSU(words, 21).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3975 {
// RESTARTS_ROUTINE.agc:126
//		CCS	A
// slot 3975
                    if slot <> 3975 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3976 {
// RESTARTS_ROUTINE.agc:127
//		COM
// slot 3976
                        if slot <> 3976 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:128
//# Page 1305
// RESTARTS_ROUTINE.agc:129
//		AD	OCT37776
// slot 3977
                        if slot <> 3977 or instruction <> 28633 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4057), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3980 {
                if slot <= 3978 {
// RESTARTS_ROUTINE.agc:130
//		AD	ONE
// slot 3978
                    if slot <> 3978 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                    if slot <= 3979 {
// RESTARTS_ROUTINE.agc:131
//		AD	L
// slot 3979
                        if slot <> 3979 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:132
//		CCS	A
// slot 3980
                        if slot <> 3980 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 3981 {
// RESTARTS_ROUTINE.agc:133
//		CA	ZERO
// slot 3981
                    if slot <> 3981 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3982 {
// RESTARTS_ROUTINE.agc:134
//		TCF	+2
// slot 3982
                        if slot <> 3982 or instruction <> 6032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:135
//		TCF	+1
// slot 3983
                        if slot <> 3983 or instruction <> 6032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3988 {
            if slot <= 3985 {
                if slot <= 3984 {
// RESTARTS_ROUTINE.agc:136
//IMEDIATE	AD	ONE
// slot 3984
                    if slot <> 3984 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// RESTARTS_ROUTINE.agc:137
//		TC	GOLOC -1
// slot 3985
                    if slot <> 3985 or instruction <> 452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 452, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3986 {
// RESTARTS_ROUTINE.agc:138
//ITSLIKEB	CA	RTRNCADR	# TYPE B,	      SO STORE RETURN IN
// slot 3986
                    if slot <> 3986 or instruction <> 14197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1909), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3987 {
// RESTARTS_ROUTINE.agc:139
//		TS	TEMPSWCH	# TEMPSWCH IN CASE OF AN EVEN PHASE
// slot 3987
                        if slot <> 3987 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:140
//
// RESTARTS_ROUTINE.agc:141
//		CA	PRT2CADR	# SET UP EXIT TO GET TABLE PART OF THIS
// slot 3988
                        if slot <> 3988 or instruction <> 14329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2041), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3991 {
                if slot <= 3989 {
// RESTARTS_ROUTINE.agc:142
//		TS	GOLOC +2	# VARIABLE TYPE OF PHASE
// slot 3989
                    if slot <> 3989 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3990 {
// RESTARTS_ROUTINE.agc:143
//
// RESTARTS_ROUTINE.agc:144
//		CA	TEMPPHS		# MAKE THE PHASE LOOK RIGHT FOR THE TABLE
// slot 3990
                        if slot <> 3990 or instruction <> 12396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:145
//		MASK	OCT177		# PART OF THIS VARIABLE PHASE
// slot 3991
                        if slot <> 3991 or instruction <> 31804 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                            if fixedOperand = 127 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3992 {
// RESTARTS_ROUTINE.agc:146
//		TS	TEMPPHS
// slot 3992
                    if slot <> 3992 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3993 {
// RESTARTS_ROUTINE.agc:147
//
// RESTARTS_ROUTINE.agc:148
//		EXTEND
// slot 3993
                        if slot <> 3993 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:149
//		NDX	TEMP2G		# OBTAIN THE JOB:S 2CADR
// slot 3994
                        if slot <> 3994 or instruction <> 20589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[136] to agcAotUnit136@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:150
//		DCA	PHSNAME1
// slot 3995
    3995, 26174
)).

// bank 01, slots 3996-3997
function agcAotUnit137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3996 {
// RESTARTS_ROUTINE.agc:151
//		DXCH	GOLOC
// slot 3996
        if slot <> 3996 or instruction <> 21958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 454, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// RESTARTS_ROUTINE.agc:152
//
// RESTARTS_ROUTINE.agc:153
//ITSAJOB		NDX	TEMP2G		# NOW ADD THE PRIORITY AND LET:S GO
// slot 3997
        if slot <> 3997 or instruction <> 20589 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20589, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20589, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[137] to agcAotUnit137@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:154
//		CA	PHSPRDT1
// slot 3998
    3998, 25688
)).

// bank 01, slots 3999-4018
function agcAotUnit138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4008 {
        if slot <= 4003 {
            if slot <= 4000 {
                if slot <= 3999 {
// RESTARTS_ROUTINE.agc:155
//CHKNOVAC	TS	GOLOC -1	# SAVE PRIO UNTIL WE SEE IF ITS
// slot 3999
                    if slot <> 3999 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:156
//		EXTEND			# A FINDVAC OR A NOVAC
// slot 4000
                    if slot <> 4000 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4001 {
// RESTARTS_ROUTINE.agc:157
//		BZMF	ITSNOVAC
// slot 4001
                    if slot <> 4001 or instruction <> 26533 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4002 {
// RESTARTS_ROUTINE.agc:158
//
// RESTARTS_ROUTINE.agc:159
//		CAF	FVACCADR	# POSITIVE, SET UP FINDVAC CALL.
// slot 4002
                        if slot <> 4002 or instruction <> 14331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2043), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:160
//		XCH	GOLOC -1	# PICK UP PRIO,
// slot 4003
                        if slot <> 4003 or instruction <> 24004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 452, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4005 {
                if slot <= 4004 {
// RESTARTS_ROUTINE.agc:161
//		TC	GOLOC -1	# AND GO
// slot 4004
                    if slot <> 4004 or instruction <> 452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 452, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:162
//
// RESTARTS_ROUTINE.agc:163
//ITSNOVAC	CAF	NOVACADR	# NEGATIVE,
// slot 4005
                    if slot <> 4005 or instruction <> 14333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2045), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4006 {
// RESTARTS_ROUTINE.agc:164
//		XCH	GOLOC -1	# SET UP NOVAC CALL,
// slot 4006
                    if slot <> 4006 or instruction <> 24004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 452, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4007 {
// RESTARTS_ROUTINE.agc:165
//		COM			# CORRECT PRIO,
// slot 4007
                        if slot <> 4007 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:166
//		TC	GOLOC -1	# AND GO
// slot 4008
                        if slot <> 4008 or instruction <> 452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4013 {
            if slot <= 4010 {
                if slot <= 4009 {
// RESTARTS_ROUTINE.agc:167
//
// RESTARTS_ROUTINE.agc:168
//ITSATBL		TS	CYR		# FIND OUT IF THE PHASE IS ODD OR EVEN
// slot 4009
                    if slot <> 4009 or instruction <> 22544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:169
//		CCS	CYR
// slot 4010
                    if slot <> 4010 or instruction <> 4112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 16).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4011 {
// RESTARTS_ROUTINE.agc:170
//		TCF	+1		# IT:S EVEN
// slot 4011
                    if slot <> 4011 or instruction <> 6060 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6060, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4012 {
// RESTARTS_ROUTINE.agc:171
//		TCF	ITSEVEN
// slot 4012
                        if slot <> 4012 or instruction <> 6122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6122, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:172
//
// RESTARTS_ROUTINE.agc:173
//		CA	RTRNCADR	# IN CASE THIS IS THE SECOND PART OF A
// slot 4013
                        if slot <> 4013 or instruction <> 14197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1909), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4015 {
                if slot <= 4014 {
// RESTARTS_ROUTINE.agc:174
//		TS	GOLOC +2	# TYPE B RESTART, WE NEED PROPER EXIT
// slot 4014
                    if slot <> 4014 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:175
//
// RESTARTS_ROUTINE.agc:176
//		CA	TEMPPHS		# SET UP POINTER FOR FINDING OUR PLACE IN
// slot 4015
                    if slot <> 4015 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4016 {
// RESTARTS_ROUTINE.agc:177
//		TS	SR		# THE RESTART TABLES
// slot 4016
                    if slot <> 4016 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4017 {
// RESTARTS_ROUTINE.agc:178
//		AD	SR
// slot 4017
                        if slot <> 4017 or instruction <> 24593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 17).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:179
//# Page 1306
// RESTARTS_ROUTINE.agc:180
//		NDX	TEMP2G
// slot 4018
                        if slot <> 4018 or instruction <> 20589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[138] to agcAotUnit138@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:181
//		AD	SIZETAB +1
// slot 4019
    4019, 51206
)).

// bank 01, slots 4020-4022
function agcAotUnit139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4020 {
// RESTARTS_ROUTINE.agc:182
//		TS	POINTER
// slot 4020
        if slot <> 4020 or instruction <> 22638 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22638, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4021 {
// RESTARTS_ROUTINE.agc:183
//
// RESTARTS_ROUTINE.agc:184
//CONTBL2		EXTEND			# FIND OUT WHAT:S IN THE TABLE
// slot 4021
            if slot <> 4021 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:185
//		NDX	POINTER
// slot 4022
            if slot <> 4022 or instruction <> 20590 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[139] to agcAotUnit139@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:186
//		DCA	CADRTAB		# GET THE 2CADR
// slot 4023
    4023, 26628
)).

// bank 01, slots 4024-4036
function agcAotUnit140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4029 {
        if slot <= 4026 {
            if slot <= 4024 {
// RESTARTS_ROUTINE.agc:187
//
// RESTARTS_ROUTINE.agc:188
//		LXCH	GOLOC +1	# STORE THE BB INFORMATION
// slot 4024
                if slot <> 4024 or instruction <> 9670 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 454, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4025 {
// RESTARTS_ROUTINE.agc:189
//
// RESTARTS_ROUTINE.agc:190
//		CCS	A		# IS IT A JOB OR IS IT  TIMED
// slot 4025
                    if slot <> 4025 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:191
//		INCR	A		# POSITIVE. MUST BE A JOB
// slot 4026
                    if slot <> 4026 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4027 {
// RESTARTS_ROUTINE.agc:192
//		TCF	ITSAJOB2
// slot 4027
                if slot <> 4027 or instruction <> 6118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4028 {
// RESTARTS_ROUTINE.agc:193
//
// RESTARTS_ROUTINE.agc:194
//		INCR	A		# MUST BE EITHER A WAITLIST OR LONGCALL
// slot 4028
                    if slot <> 4028 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:195
//		TS	GOLOC		# LET-S STORE THE CORRECT CADR
// slot 4029
                    if slot <> 4029 or instruction <> 22981 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22981, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4032 {
            if slot <= 4030 {
// RESTARTS_ROUTINE.agc:196
//
// RESTARTS_ROUTINE.agc:197
//		CA	WTLTCADR	# SET UP OUR EXIT TO WAITLIST
// slot 4030
                if slot <> 4030 or instruction <> 14332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2044), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4031 {
// RESTARTS_ROUTINE.agc:198
//		TS	GOLOC -1
// slot 4031
                    if slot <> 4031 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:199
//
// RESTARTS_ROUTINE.agc:200
//		CA	GOLOC +1	# NOW FIND OUT IF IT IS A WAITLIST CALL
// slot 4032
                    if slot <> 4032 or instruction <> 12742 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 454).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4034 {
                if slot <= 4033 {
// RESTARTS_ROUTINE.agc:201
//		MASK	BIT10		# THIS SHOULD BE ONE IF WE HAVE -BB
// slot 4033
                    if slot <> 4033 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
                } else {
// RESTARTS_ROUTINE.agc:202
//		CCS	A		# FOR THAT MATTER SO SHOULD BE BITS 9,8,7,
// slot 4034
                    if slot <> 4034 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4035 {
// RESTARTS_ROUTINE.agc:203
//					# 6,5, AND LAST BUT NOT LEAST (PERHAPS NOT
// RESTARTS_ROUTINE.agc:204
//					# IN IMPORTANCE ANYWAY. BIT 4
// RESTARTS_ROUTINE.agc:205
//		TCF	ITSWTLST	# IT IS A WAITLIST CALL
// slot 4035
                    if slot <> 4035 or instruction <> 6113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6113, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:206
//
// RESTARTS_ROUTINE.agc:207
//		NDX	POINTER		# OBTAIN THE ORIGINAL DELTA T
// slot 4036
                    if slot <> 4036 or instruction <> 20590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20590, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20590, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[140] to agcAotUnit140@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:208
//		CA	PRDTTAB		# ADDRESS FOR THIS LONGCALL
// slot 4037
    4037, 26624
)).

// bank 01, slots 4038-4038
function agcAotUnit141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RESTARTS_ROUTINE.agc:209
//
// RESTARTS_ROUTINE.agc:210
//		TCF	ITSLGCL1	# NOW GO GET THE DELTA TIME
// slot 4038
    if slot <> 4038 or instruction <> 6949 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6949, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[141] to agcAotUnit141@.

// bank 02, slots 4901-4905
function agcAotUnit214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4902 {
        if slot <= 4901 {
// RESTARTS_ROUTINE.agc:211
//
// RESTARTS_ROUTINE.agc:212
//# ***** THIS MUST BE IN FIXED FIXED *****
// RESTARTS_ROUTINE.agc:213
//
// RESTARTS_ROUTINE.agc:214
//		BLOCK	02
// RESTARTS_ROUTINE.agc:215
//		SETLOC	FFTAG2
// RESTARTS_ROUTINE.agc:216
//		BANK
// RESTARTS_ROUTINE.agc:217
//
// RESTARTS_ROUTINE.agc:218
//		COUNT*	$$/RSROU
// RESTARTS_ROUTINE.agc:219
//ITSLGCL1	LXCH	GOLOC +1	# OBTAIN THE CORRECT E BANK
// slot 4901
            if slot <> 4901 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:220
//		LXCH	BB
// slot 4902
            if slot <> 4902 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4903 {
// RESTARTS_ROUTINE.agc:221
//		LXCH	GOLOC +1	# AND PRESERVE OUR E AND F BANKS
// slot 4903
            if slot <> 4903 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4904 {
// RESTARTS_ROUTINE.agc:222
//
// RESTARTS_ROUTINE.agc:223
//		EXTEND			# GET THE DELTA TIME
// slot 4904
                if slot <> 4904 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:224
//		NDX	A
// slot 4905
                if slot <> 4905 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[214] to agcAotUnit214@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:225
//		DCA	0
// slot 4906
    4906, 24578
)).

// bank 02, slots 4907-4910
function agcAotUnit215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4908 {
        if slot <= 4907 {
// RESTARTS_ROUTINE.agc:226
//
// RESTARTS_ROUTINE.agc:227
//		LXCH	GOLOC +1	# RESTORE OUR E AND F BANK
// slot 4907
            if slot <> 4907 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:228
//		LXCH	BB		# RESTORE THE TASKS E AND F BANKS
// slot 4908
            if slot <> 4908 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4909 {
// RESTARTS_ROUTINE.agc:229
//		LXCH	GOLOC +1	# AND PRESERVE OUR L
// slot 4909
            if slot <> 4909 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:230
//# Page 1307
// RESTARTS_ROUTINE.agc:231
//		TCF	ITSLGCL2	# NOT LET:S PROCESS THIS LONGCALL
// slot 4910
            if slot <> 4910 or instruction <> 6087 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6087, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[215] to agcAotUnit215@.

// bank 01, slots 4039-4062
function agcAotUnit142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4050 {
        if slot <= 4044 {
            if slot <= 4041 {
                if slot <= 4039 {
// RESTARTS_ROUTINE.agc:232
//
// RESTARTS_ROUTINE.agc:233
//# ***** YOU MAY RETURN TO  SWITCHED FIXED *****
// RESTARTS_ROUTINE.agc:234
//
// RESTARTS_ROUTINE.agc:235
//		BANK	01
// RESTARTS_ROUTINE.agc:236
//		SETLOC	RESTART
// RESTARTS_ROUTINE.agc:237
//		BANK
// RESTARTS_ROUTINE.agc:238
//
// RESTARTS_ROUTINE.agc:239
//		COUNT*	$$/RSROU
// RESTARTS_ROUTINE.agc:240
//ITSLGCL2	DXCH	LONGTIME
// slot 4039
                    if slot <> 4039 or instruction <> 22124 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 620, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4040 {
// RESTARTS_ROUTINE.agc:241
//
// RESTARTS_ROUTINE.agc:242
//		EXTEND			# CALCULATE TIME LEFT
// slot 4040
                        if slot <> 4040 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:243
//		DCS	TIME2
// slot 4041
                        if slot <> 4041 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4042 {
// RESTARTS_ROUTINE.agc:244
//		DAS	LONGTIME
// slot 4042
                    if slot <> 4042 or instruction <> 8812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 620) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4043 {
// RESTARTS_ROUTINE.agc:245
//		EXTEND
// slot 4043
                        if slot <> 4043 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:246
//		DCA	LONGBASE
// slot 4044
                        if slot <> 4044 or instruction <> 12906 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 618, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4047 {
                if slot <= 4045 {
// RESTARTS_ROUTINE.agc:247
//		DAS	LONGTIME
// slot 4045
                    if slot <> 4045 or instruction <> 8812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 620) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4046 {
// RESTARTS_ROUTINE.agc:248
//
// RESTARTS_ROUTINE.agc:249
//		CCS	LONGTIME	# FIND OUT HOW THIS SHOULD BE RESTARTED
// slot 4046
                        if slot <> 4046 or instruction <> 4715 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 619).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:250
//		TCF	LONGCLCL
// slot 4047
                        if slot <> 4047 or instruction <> 6103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6103, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4048 {
// RESTARTS_ROUTINE.agc:251
//		TCF	+2
// slot 4048
                    if slot <> 4048 or instruction <> 6098 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6098, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4049 {
// RESTARTS_ROUTINE.agc:252
//		TCF	IMEDIATE -3
// slot 4049
                        if slot <> 4049 or instruction <> 6029 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6029, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:253
//		CCS	LONGTIME +1
// slot 4050
                        if slot <> 4050 or instruction <> 4716 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 620).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4056 {
            if slot <= 4053 {
                if slot <= 4051 {
// RESTARTS_ROUTINE.agc:254
//		TCF	LONGCLCL
// slot 4051
                    if slot <> 4051 or instruction <> 6103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4052 {
// RESTARTS_ROUTINE.agc:255
//		NOOP			# CAN:T GET HERE    *********
// slot 4052
                        if slot <> 4052 or instruction <> 6101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6101, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:256
//		TCF	IMEDIATE -3
// slot 4053
                        if slot <> 4053 or instruction <> 6029 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6029, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4054 {
// RESTARTS_ROUTINE.agc:257
//		TCF	IMEDIATE
// slot 4054
                    if slot <> 4054 or instruction <> 6032 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6032, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4055 {
// RESTARTS_ROUTINE.agc:258
//
// RESTARTS_ROUTINE.agc:259
//LONGCLCL	CA	LGCLCADR	# WE WILL GO TO LONGCALL
// slot 4055
                        if slot <> 4055 or instruction <> 14330 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2042), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:260
//		TS	GOLOC -1
// slot 4056
                        if slot <> 4056 or instruction <> 22980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22980, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4059 {
                if slot <= 4057 {
// RESTARTS_ROUTINE.agc:261
//
// RESTARTS_ROUTINE.agc:262
//		EXTEND			# PREPARE OUR ENTRY TO LONGCALL
// slot 4057
                    if slot <> 4057 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4058 {
// RESTARTS_ROUTINE.agc:263
//		DCA	LONGTIME
// slot 4058
                        if slot <> 4058 or instruction <> 12908 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 620, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:264
//		TC	GOLOC -1
// slot 4059
                        if slot <> 4059 or instruction <> 452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4060 {
// RESTARTS_ROUTINE.agc:265
//
// RESTARTS_ROUTINE.agc:266
//ITSLNGCL	CA	WTLTCADR	# ASSUME IT WILL GO TO WAITLIST
// slot 4060
                    if slot <> 4060 or instruction <> 14332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2044), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4061 {
// RESTARTS_ROUTINE.agc:267
//		TS	GOLOC -1
// slot 4061
                        if slot <> 4061 or instruction <> 22980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22980, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RESTARTS_ROUTINE.agc:268
//
// RESTARTS_ROUTINE.agc:269
//		NDX	TEMP2G
// slot 4062
                        if slot <> 4062 or instruction <> 20589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[142] to agcAotUnit142@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:270
//		CS	PHSPRDT1	# GET THE DELTA T ADDRESS
// slot 4063
    4063, 33880
)).

// bank 01, slots 4064-4064
function agcAotUnit143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RESTARTS_ROUTINE.agc:271
//
// RESTARTS_ROUTINE.agc:272
//		TCF	ITSLGCL1	# NOW GET THE DELTA TIME
// slot 4064
    if slot <> 4064 or instruction <> 6949 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6949, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[143] to agcAotUnit143@.

// bank 01, slots 4065-4067
function agcAotUnit144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4065 {
// RESTARTS_ROUTINE.agc:273
//
// RESTARTS_ROUTINE.agc:274
//ITSWTLST	CS	GOLOC +1	# CORRECT THE BBCON INFORMATION
// slot 4065
        if slot <> 4065 or instruction <> 16838 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 454).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4066 {
// RESTARTS_ROUTINE.agc:275
//		TS	GOLOC +1
// slot 4066
            if slot <> 4066 or instruction <> 22982 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22982, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:276
//
// RESTARTS_ROUTINE.agc:277
//		NDX	POINTER		# GET THE DT AND FIND OUT IF IT WAS STORED
// slot 4067
            if slot <> 4067 or instruction <> 20590 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[144] to agcAotUnit144@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:278
//		CA	PRDTTAB		# DIRECTLY OR INDIRECTLY
// slot 4068
    4068, 26624
)).

// bank 01, slots 4069-4071
function agcAotUnit145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4069 {
// RESTARTS_ROUTINE.agc:279
//
// RESTARTS_ROUTINE.agc:280
//		TCF	TIMETEST	# FIND OUT HOW THE TIME IS STORED
// slot 4069
        if slot <> 4069 or instruction <> 6012 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6012, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4070 {
// RESTARTS_ROUTINE.agc:281
//
// RESTARTS_ROUTINE.agc:282
//# Page 1308
// RESTARTS_ROUTINE.agc:283
//ITSAJOB2	XCH	GOLOC		# STORE THE CADR
// slot 4070
            if slot <> 4070 or instruction <> 24005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 453, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:284
//
// RESTARTS_ROUTINE.agc:285
//		NDX	POINTER		# ADD THE PRIORITY AND LET:S GO
// slot 4071
            if slot <> 4071 or instruction <> 20590 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20590, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[145] to agcAotUnit145@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:286
//		CA	PRDTTAB
// slot 4072
    4072, 26624
)).

// bank 01, slots 4073-4076
function agcAotUnit146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4074 {
        if slot <= 4073 {
// RESTARTS_ROUTINE.agc:287
//
// RESTARTS_ROUTINE.agc:288
//		TCF	CHKNOVAC
// slot 4073
            if slot <> 4073 or instruction <> 6047 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6047, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:289
//
// RESTARTS_ROUTINE.agc:290
//ITSEVEN		CA	TEMPSWCH	# SET UP FOR EITHER THE SECOND PART OF THE
// slot 4074
            if slot <> 4074 or instruction <> 12399 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 111).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4075 {
// RESTARTS_ROUTINE.agc:291
//		TS	GOLOC +2	# TABLE, OR A RETURN FOR THE NEXT GROUP
// slot 4075
            if slot <> 4075 or instruction <> 22983 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22983, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTARTS_ROUTINE.agc:292
//
// RESTARTS_ROUTINE.agc:293
//		NDX	TEMP2G		# SET UP POINTER FOR OUR LOCATION WITHIN
// slot 4076
            if slot <> 4076 or instruction <> 20589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[146] to agcAotUnit146@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:294
//		CA	SIZETAB		# THE TABLE
// slot 4077
    4077, 26628
)).

// bank 01, slots 4078-4087
function agcAotUnit147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4082 {
        if slot <= 4079 {
            if slot <= 4078 {
// RESTARTS_ROUTINE.agc:295
//		AD	TEMPPHS		# THIS MAY LOOK BAD BUT LET:S SEE YOU DO
// slot 4078
                if slot <> 4078 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:296
//		AD	TEMPPHS		# BETTER IN TIME OR NUMBERR OF LOCATIONS
// slot 4079
                if slot <> 4079 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4080 {
// RESTARTS_ROUTINE.agc:297
//		AD	TEMPPHS
// slot 4080
                if slot <> 4080 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4081 {
// RESTARTS_ROUTINE.agc:298
//		TS	POINTER
// slot 4081
                    if slot <> 4081 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:299
//
// RESTARTS_ROUTINE.agc:300
//		TCF	CONTBL2		# NOW PROCESS WHAT IS IN THE TABLE
// slot 4082
                    if slot <> 4082 or instruction <> 6069 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6069, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4084 {
            if slot <= 4083 {
// RESTARTS_ROUTINE.agc:301
//
// RESTARTS_ROUTINE.agc:302
//PHSPART2	CA	THREE		# SET THE POINTER FOR THE SECOND HALF OF
// slot 4083
                if slot <> 4083 or instruction <> 15525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTARTS_ROUTINE.agc:303
//		ADS	POINTER		# THE TABLE
// slot 4084
                if slot <> 4084 or instruction <> 11374 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 110).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4085 {
// RESTARTS_ROUTINE.agc:304
//
// RESTARTS_ROUTINE.agc:305
//		CA	RTRNCADR	# THIS WILL BE OUR LAST TIME THROUGH THE
// slot 4085
                if slot <> 4085 or instruction <> 14197 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1909), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4086 {
// RESTARTS_ROUTINE.agc:306
//		TS	GOLOC +2	# EVEN TABLE , SO AFTER IT GET THE NEXT
// slot 4086
                    if slot <> 4086 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTARTS_ROUTINE.agc:307
//					# GROUP
// RESTARTS_ROUTINE.agc:308
//		TCF	CONTBL2		# SO LET:S GET THE SECOND ENTRY IN THE TBL
// slot 4087
                    if slot <> 4087 or instruction <> 6069 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6069, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[147] to agcAotUnit147@.

agcAotInstallSourceRope(list(
// RESTARTS_ROUTINE.agc:309
//
// RESTARTS_ROUTINE.agc:310
//TEMPPHS		EQUALS	MPAC
// RESTARTS_ROUTINE.agc:311
//TEMP2G		EQUALS	MPAC +1
// RESTARTS_ROUTINE.agc:312
//POINTER		EQUALS	MPAC +2
// RESTARTS_ROUTINE.agc:313
//TEMPSWCH	EQUALS	MPAC +3
// RESTARTS_ROUTINE.agc:314
//GOLOC		EQUALS	VAC5 +20D
// RESTARTS_ROUTINE.agc:315
//MINUS2		EQUALS	NEG2
// RESTARTS_ROUTINE.agc:316
//OCT177		EQUALS	LOW7
// RESTARTS_ROUTINE.agc:317
//
// RESTARTS_ROUTINE.agc:318
//PHS2CADR	GENADR	PHSPART2
// slot 4088
    4088, 4070,
// RESTARTS_ROUTINE.agc:319
//PRT2CADR	GENADR	GETPART2
// slot 4089
    4089, 3778,
// RESTARTS_ROUTINE.agc:320
//LGCLCADR	GENADR	LONGCALL
// slot 4090
    4090, 5502,
// RESTARTS_ROUTINE.agc:321
//FVACCADR	GENADR	FINDVAC
// slot 4091
    4091, 5258,
// RESTARTS_ROUTINE.agc:322
//WTLTCADR	GENADR	WAITLIST
// slot 4092
    4092, 5382,
// RESTARTS_ROUTINE.agc:323
//NOVACADR	GENADR	NOVAC
// slot 4093
    4093, 5236
)).

