// PORT: Original source unit RESTARTS_ROUTINE.agc.
// PORT: Physical bank 01. Shared continuation entries, slots 3920–3935.
function agcAotUnit123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3927 {
        if slot <= 3923 {
            if slot <= 3921 {
                if slot <= 3920 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE RESTARTS_ROUTINE.agc:2
//# Filename:     RESTARTS_ROUTINE.agc
// PORT: SOURCE RESTARTS_ROUTINE.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE RESTARTS_ROUTINE.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE RESTARTS_ROUTINE.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE RESTARTS_ROUTINE.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE RESTARTS_ROUTINE.agc:7
//# Reference:    pp. 1414-1419
// PORT: SOURCE RESTARTS_ROUTINE.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE RESTARTS_ROUTINE.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE RESTARTS_ROUTINE.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE RESTARTS_ROUTINE.agc:11
//#				name, and page images. Corrected various
// PORT: SOURCE RESTARTS_ROUTINE.agc:12
//#				typos in the transcription of program
// PORT: SOURCE RESTARTS_ROUTINE.agc:13
//#				comments, and these should be back-ported
// PORT: SOURCE RESTARTS_ROUTINE.agc:14
//#				to Colossus249.
// PORT: SOURCE RESTARTS_ROUTINE.agc:15
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE RESTARTS_ROUTINE.agc:17
//# from scanned documents.
// PORT: SOURCE RESTARTS_ROUTINE.agc:18
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE RESTARTS_ROUTINE.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE RESTARTS_ROUTINE.agc:21
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE RESTARTS_ROUTINE.agc:23
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:24
//#       Prepared by
// PORT: SOURCE RESTARTS_ROUTINE.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE RESTARTS_ROUTINE.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE RESTARTS_ROUTINE.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE RESTARTS_ROUTINE.agc:28
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE RESTARTS_ROUTINE.agc:30
//#
// PORT: SOURCE RESTARTS_ROUTINE.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE RESTARTS_ROUTINE.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE RESTARTS_ROUTINE.agc:33
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:34
//# Page 1414
// PORT: SOURCE RESTARTS_ROUTINE.agc:35
//		BANK	01
// PORT: SOURCE RESTARTS_ROUTINE.agc:36
//		SETLOC	RESTART
// PORT: SOURCE RESTARTS_ROUTINE.agc:37
//		BANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:38
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:39
//		EBANK=	PHSNAME1	# GOPROG MUST SWITCH TO THIS EBANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:40
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:41
//		COUNT	01/RSROU
// PORT: SOURCE RESTARTS_ROUTINE.agc:42
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:43
//RESTARTS	CA	MPAC +5		# GET GROUP NUMBER -1
// PORT: Fixed ROM slots 3920.
                    if slot <> 3920 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:44
//		DOUBLE			# SAVE FOR INDEXING
// PORT: Fixed ROM slots 3921.
                    if slot <> 3921 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3922 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:45
//		TS	TEMP2G
// PORT: Fixed ROM slots 3922.
                    if slot <> 3922 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:46
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:47
//		CA	PHS2CADR	# SET UP EXIT IN CASE IT IS AN EVEN
// PORT: Fixed ROM slots 3923.
                    if slot <> 3923 or instruction <> 14322 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2034), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3925 {
                if slot <= 3924 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:48
//		TS	TEMPSWCH	# TABLE PHASE
// PORT: Fixed ROM slots 3924.
                    if slot <> 3924 or instruction <> 22639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22639, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:49
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:50
//		CA	RTRNCADR	# TO SAVE TIME ASSUME IT WILL GET NEXT
// PORT: Fixed ROM slots 3925.
                    if slot <> 3925 or instruction <> 14191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1903), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3926 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:51
//		TS	GOLOC +2	# GROUP AFTER THIS
// PORT: Fixed ROM slots 3926.
                    if slot <> 3926 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:52
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:53
//		CA	TEMPPHS
// PORT: Fixed ROM slots 3927.
                    if slot <> 3927 or instruction <> 12396 { return choose false if checkOnly else -1. }
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
        if slot <= 3931 {
            if slot <= 3929 {
                if slot <= 3928 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:54
//		MASK	OCT1400
// PORT: Fixed ROM slots 3928.
                    if slot <> 3928 or instruction <> 31273 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                        if fixedOperand = 768 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 256), 4) * 256).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:55
//		CCS	A		# IS IT A VARIABLE OR TABLE RESTART
// PORT: Fixed ROM slots 3929.
                    if slot <> 3929 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3930 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:56
//		TCF	ITSAVAR		# IT:S A VARIABLE RESTART
// PORT: Fixed ROM slots 3930.
                    if slot <> 3930 or instruction <> 5987 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5987, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:57
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:58
//GETPART2	CCS	TEMPPHS		# IS IT AN X.1 RESTART
// PORT: Fixed ROM slots 3931.
                    if slot <> 3931 or instruction <> 4204 { return choose false if checkOnly else -1. }
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
            if slot <= 3933 {
                if slot <= 3932 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:59
//		CCS	A
// PORT: Fixed ROM slots 3932.
                    if slot <> 3932 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:60
//		TCF	ITSATBL		# NO, ITS A TABLE RESTART
// PORT: Fixed ROM slots 3933.
                    if slot <> 3933 or instruction <> 6051 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6051, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3934 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:61
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:62
//		CA	PRIO14		# IT IS AN X.1 RESTART, THEREFORE START
// PORT: Fixed ROM slots 3934.
                    if slot <> 3934 or instruction <> 14902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:63
//		TC	FINDVAC		# THE DISPLAY RESTART JOB
// PORT: Fixed ROM slots 3935.
                    if slot <> 3935 or instruction <> 2663 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2663, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[123] to agcAotUnit123@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:64
//		EBANK=	LST1
// PORT: SOURCE RESTARTS_ROUTINE.agc:65
//		2CADR	INITDSP
// PORT: Fixed ROM slots 3936 3937.
    3936, 3426, 3937, 16486
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3938–3943.
function agcAotUnit124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3940 {
        if slot <= 3938 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:66
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:67
//		TC	RTRNCADR	# FINISHED WITH THIS GROUP, GET NEXT ONE
// PORT: Fixed ROM slots 3938.
            if slot <> 3938 or instruction <> 1903 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1903, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3939 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:68
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:69
//ITSAVAR		MASK	OCT1400		# IS IT TYPE B ?
// PORT: Fixed ROM slots 3939.
                if slot <> 3939 or instruction <> 31273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                    if fixedOperand = 768 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 4) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:70
//		CCS	A
// PORT: Fixed ROM slots 3940.
                if slot <> 3940 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 3941 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:71
//		TCF	ITSLIKEB	# YES,IT IS TYPE B
// PORT: Fixed ROM slots 3941.
            if slot <> 3941 or instruction <> 6028 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6028, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3942 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:72
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:73
//		EXTEND			# STORE THE JOB (OR TASK) 2CADR FOR EXIT
// PORT: Fixed ROM slots 3942.
                if slot <> 3942 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:74
//		NDX	TEMP2G
// PORT: Fixed ROM slots 3943.
                if slot <> 3943 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[124] to agcAotUnit124@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:75
//		DCA	PHSNAME1
// PORT: Fixed ROM slots 3944.
    3944, 26174
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3945–3956.
function agcAotUnit125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3950 {
        if slot <= 3947 {
            if slot <= 3945 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:76
//		DXCH	GOLOC
// PORT: Fixed ROM slots 3945.
                if slot <> 3945 or instruction <> 21958 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 454, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3946 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:77
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:78
//		CA	TEMPPHS		# SEE IF THIS IS A JOB, TASK, OR A LONGCALL
// PORT: Fixed ROM slots 3946.
                    if slot <> 3946 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:79
//		MASK	OCT7
// PORT: Fixed ROM slots 3947.
                    if slot <> 3947 or instruction <> 31251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
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
            if slot <= 3948 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:80
//		AD	MINUS2
// PORT: Fixed ROM slots 3948.
                if slot <> 3948 or instruction <> 28621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3949 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:81
//		CCS	A
// PORT: Fixed ROM slots 3949.
                    if slot <> 3949 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:82
//		TCF	ITSLNGCL	# ITS A LONGCALL
// PORT: Fixed ROM slots 3950.
                    if slot <> 3950 or instruction <> 6102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6102, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3953 {
            if slot <= 3951 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:83
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:84
//# Page 1415
// PORT: SOURCE RESTARTS_ROUTINE.agc:85
//RTRNCADR	TC	SWRETURN	# CANT GET HERE
// PORT: Fixed ROM slots 3951.
                if slot <> 3951 or instruction <> 2493 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2493, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3952 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:86
//		TCF	ITSAWAIT
// PORT: Fixed ROM slots 3952.
                    if slot <> 3952 or instruction <> 6002 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6002, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:87
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:88
//		TCF	ITSAJOB		# ITS A JOB
// PORT: Fixed ROM slots 3953.
                    if slot <> 3953 or instruction <> 6039 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6039, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3954 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:89
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:90
//ITSAWAIT	CA	WTLTCADR	# SET UP WAITLIST CALL
// PORT: Fixed ROM slots 3954.
                if slot <> 3954 or instruction <> 14326 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2038), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3955 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:91
//		TS	GOLOC -1
// PORT: Fixed ROM slots 3955.
                    if slot <> 3955 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:92
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:93
//		NDX	TEMP2G		# DIRECTLY STORED
// PORT: Fixed ROM slots 3956.
                    if slot <> 3956 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[125] to agcAotUnit125@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:94
//		CA	PHSPRDT1
// PORT: Fixed ROM slots 3957.
    3957, 25688
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3958–3962.
function agcAotUnit126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3959 {
        if slot <= 3958 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:95
//TIMETEST	CCS	A		# IS IT AN IMMEDIATE RESTART
// PORT: Fixed ROM slots 3958.
            if slot <> 3958 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:96
//		INCR	A		# NO.
// PORT: Fixed ROM slots 3959.
            if slot <> 3959 or instruction <> 10240 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3960 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:97
//		TCF	FINDTIME	# FIND OUT WHEN IT SHOULD BEGIN
// PORT: Fixed ROM slots 3960.
            if slot <> 3960 or instruction <> 6011 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6011, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3961 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:98
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:99
//		TCF	ITSINDIR	# STORED INDIRECTLY
// PORT: Fixed ROM slots 3961.
                if slot <> 3961 or instruction <> 6976 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6976, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:100
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:101
//		TCF	IMEDIATE	# IT WANTS AN IMMEDIATE RESTART
// PORT: Fixed ROM slots 3962.
                if slot <> 3962 or instruction <> 6026 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6026, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[126] to agcAotUnit126@.

// PORT: Physical bank 02. Shared continuation entries, slots 4928–4930.
function agcAotUnit212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4928 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:102
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:103
//# ***** THIS MUST BE IN FIXED FIXED *****
// PORT: SOURCE RESTARTS_ROUTINE.agc:104
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:105
//		BLOCK	02
// PORT: SOURCE RESTARTS_ROUTINE.agc:106
//		SETLOC	FFTAG2
// PORT: SOURCE RESTARTS_ROUTINE.agc:107
//		BANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:108
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:109
//		COUNT	02/RSROU
// PORT: SOURCE RESTARTS_ROUTINE.agc:110
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:111
//ITSINDIR	LXCH	GOLOC +1	# GET THE CORRECT E BANK IN CASE THIS IS
// PORT: Fixed ROM slots 4928.
        if slot <> 4928 or instruction <> 9670 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 454, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4929 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:112
//		LXCH	BB		# SWITCHED ERRASIBLE
// PORT: Fixed ROM slots 4929.
            if slot <> 4929 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:113
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:114
//		NDX	A		# GET THE TIME INDIRECTLY
// PORT: Fixed ROM slots 4930.
            if slot <> 4930 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RESTARTS_ROUTINE.agc:115
//		CA	1
// PORT: Fixed ROM slots 4931.
    4931, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4932–4934.
function agcAotUnit213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4932 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:116
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:117
//		LXCH	BB		# RESTORE THE BB AND GOLOC
// PORT: Fixed ROM slots 4932.
        if slot <> 4932 or instruction <> 9222 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 6, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4933 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:118
//		LXCH	GOLOC +1
// PORT: Fixed ROM slots 4933.
            if slot <> 4933 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:119
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:120
//		TCF	FINDTIME	# FIND OUT WHEN IT SHOULD BEGIN
// PORT: Fixed ROM slots 4934.
            if slot <> 4934 or instruction <> 6011 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6011, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[213] to agcAotUnit213@.

// PORT: Physical bank 01. Shared continuation entries, slots 3963–3965.
function agcAotUnit127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3963 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:121
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:122
//# ***** YOU MAY RETURN TO SWITCHED FIXED *****
// PORT: SOURCE RESTARTS_ROUTINE.agc:123
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:124
//		BANK 	01
// PORT: SOURCE RESTARTS_ROUTINE.agc:125
//		SETLOC	RESTART
// PORT: SOURCE RESTARTS_ROUTINE.agc:126
//		BANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:127
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:128
//		COUNT	01/RSROU
// PORT: SOURCE RESTARTS_ROUTINE.agc:129
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:130
//FINDTIME	COM			# MAKE NEGATIVE SINCE IT WILL BE SUBTRACTED
// PORT: Fixed ROM slots 3963.
        if slot <> 3963 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3964 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:131
//		TS	L		# AND SAVE
// PORT: Fixed ROM slots 3964.
            if slot <> 3964 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:132
//		NDX	TEMP2G
// PORT: Fixed ROM slots 3965.
            if slot <> 3965 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[127] to agcAotUnit127@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:133
//		CS	TBASE1
// PORT: Fixed ROM slots 3966.
    3966, 33878
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3967–3988.
function agcAotUnit128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3977 {
        if slot <= 3971 {
            if slot <= 3968 {
                if slot <= 3967 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:134
//		EXTEND
// PORT: Fixed ROM slots 3967.
                    if slot <> 3967 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:135
//# Page 1416
// PORT: SOURCE RESTARTS_ROUTINE.agc:136
//		SU	TIME1
// PORT: Fixed ROM slots 3968.
                    if slot <> 3968 or instruction <> 24597 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreSU(words, 21).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3969 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:137
//		CCS	A
// PORT: Fixed ROM slots 3969.
                    if slot <> 3969 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3970 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:138
//		COM
// PORT: Fixed ROM slots 3970.
                        if slot <> 3970 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:139
//		AD	OCT37776
// PORT: Fixed ROM slots 3971.
                        if slot <> 3971 or instruction <> 28608 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3974 {
                if slot <= 3972 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:140
//		AD	ONE
// PORT: Fixed ROM slots 3972.
                    if slot <> 3972 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                    if slot <= 3973 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:141
//		AD	L
// PORT: Fixed ROM slots 3973.
                        if slot <> 3973 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:142
//		CCS	A
// PORT: Fixed ROM slots 3974.
                        if slot <> 3974 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 3975 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:143
//		CA	ZERO
// PORT: Fixed ROM slots 3975.
                    if slot <> 3975 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3976 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:144
//		TCF	+2
// PORT: Fixed ROM slots 3976.
                        if slot <> 3976 or instruction <> 6026 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6026, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:145
//		TCF	+1
// PORT: Fixed ROM slots 3977.
                        if slot <> 3977 or instruction <> 6026 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6026, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3982 {
            if slot <= 3979 {
                if slot <= 3978 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:146
//IMEDIATE	AD	ONE
// PORT: Fixed ROM slots 3978.
                    if slot <> 3978 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RESTARTS_ROUTINE.agc:147
//		TC	GOLOC -1
// PORT: Fixed ROM slots 3979.
                    if slot <> 3979 or instruction <> 452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 452, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3980 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:148
//ITSLIKEB	CA	RTRNCADR	# TYPE B, SO STORE RETURN IN
// PORT: Fixed ROM slots 3980.
                    if slot <> 3980 or instruction <> 14191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1903), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3981 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:149
//		TS	TEMPSWCH	# TEMPSWCH IN CASE OF AN EVEN PHASE
// PORT: Fixed ROM slots 3981.
                        if slot <> 3981 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:150
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:151
//		CA	PRT2CADR	# SET UP EXIT TO GET TABLE PART OF THIS
// PORT: Fixed ROM slots 3982.
                        if slot <> 3982 or instruction <> 14323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2035), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3985 {
                if slot <= 3983 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:152
//		TS	GOLOC +2	# VARIABLE TYPE OF PHASE
// PORT: Fixed ROM slots 3983.
                    if slot <> 3983 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3984 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:153
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:154
//		CA	TEMPPHS		# MAKE THE PHASE LOOK RIGHT FOR THE TABLE
// PORT: Fixed ROM slots 3984.
                        if slot <> 3984 or instruction <> 12396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:155
//		MASK	OCT177		# PART OF THIS VARIABLE PHASE
// PORT: Fixed ROM slots 3985.
                        if slot <> 3985 or instruction <> 31779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3107), 32768).
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
                if slot <= 3986 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:156
//		TS	TEMPPHS
// PORT: Fixed ROM slots 3986.
                    if slot <> 3986 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3987 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:157
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:158
//		EXTEND
// PORT: Fixed ROM slots 3987.
                        if slot <> 3987 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:159
//		NDX	TEMP2G		# OBTAIN THE JOB:S 2CADR
// PORT: Fixed ROM slots 3988.
                        if slot <> 3988 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[128] to agcAotUnit128@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:160
//		DCA	PHSNAME1
// PORT: Fixed ROM slots 3989.
    3989, 26174
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3990–3991.
function agcAotUnit129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3990 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:161
//		DXCH	GOLOC
// PORT: Fixed ROM slots 3990.
        if slot <> 3990 or instruction <> 21958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 454, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:162
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:163
//ITSAJOB		NDX	TEMP2G		# NOW ADD THE PRIORITY AND LET:S GO
// PORT: Fixed ROM slots 3991.
        if slot <> 3991 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[129] to agcAotUnit129@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:164
//		CA	PHSPRDT1
// PORT: Fixed ROM slots 3992.
    3992, 25688
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3993–4012.
function agcAotUnit130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4002 {
        if slot <= 3997 {
            if slot <= 3994 {
                if slot <= 3993 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:165
//CHKNOVAC	TS	GOLOC -1	# SAVE PRIO UNTIL WE SEE IF ITS
// PORT: Fixed ROM slots 3993.
                    if slot <> 3993 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:166
//		EXTEND			# A FINDVAC OR A NOVAC
// PORT: Fixed ROM slots 3994.
                    if slot <> 3994 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3995 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:167
//		BZMF	ITSNOVAC
// PORT: Fixed ROM slots 3995.
                    if slot <> 3995 or instruction <> 26527 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3996 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:168
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:169
//		CAF	FVACCADR	# POSITIVE, SET UP FINDVAC CALL.
// PORT: Fixed ROM slots 3996.
                        if slot <> 3996 or instruction <> 14325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2037), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:170
//		XCH	GOLOC -1	# PICK UP PRIO,
// PORT: Fixed ROM slots 3997.
                        if slot <> 3997 or instruction <> 24004 { return choose false if checkOnly else -1. }
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
            if slot <= 3999 {
                if slot <= 3998 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:171
//		TC	GOLOC -1	# AND GO
// PORT: Fixed ROM slots 3998.
                    if slot <> 3998 or instruction <> 452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 452, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:172
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:173
//ITSNOVAC	CAF	NOVACADR	# NEGATIVE,
// PORT: Fixed ROM slots 3999.
                    if slot <> 3999 or instruction <> 14327 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2039), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4000 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:174
//		XCH	GOLOC -1	# SET UP NOVAC CALL,
// PORT: Fixed ROM slots 4000.
                    if slot <> 4000 or instruction <> 24004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 452, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4001 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:175
//		COM			# CORRECT PRIO,
// PORT: Fixed ROM slots 4001.
                        if slot <> 4001 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:176
//		TC	GOLOC -1	# AND GO
// PORT: Fixed ROM slots 4002.
                        if slot <> 4002 or instruction <> 452 { return choose false if checkOnly else -1. }
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
        if slot <= 4007 {
            if slot <= 4004 {
                if slot <= 4003 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:177
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:178
//ITSATBL		TS	CYR		# FIND OUT IF THE PHASE IS ODD OR EVEN
// PORT: Fixed ROM slots 4003.
                    if slot <> 4003 or instruction <> 22544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:179
//		CCS	CYR
// PORT: Fixed ROM slots 4004.
                    if slot <> 4004 or instruction <> 4112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 16).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4005 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:180
//		TCF	+1		# IT:S EVEN
// PORT: Fixed ROM slots 4005.
                    if slot <> 4005 or instruction <> 6054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4006 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:181
//		TCF	ITSEVEN
// PORT: Fixed ROM slots 4006.
                        if slot <> 4006 or instruction <> 6116 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6116, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:182
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:183
//		CA	RTRNCADR	# IN CASE THIS IS THE SECOND PART OF A
// PORT: Fixed ROM slots 4007.
                        if slot <> 4007 or instruction <> 14191 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1903), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4009 {
                if slot <= 4008 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:184
//		TS	GOLOC +2	# TYPE B RESTART, WE NEED PROPER EXIT
// PORT: Fixed ROM slots 4008.
                    if slot <> 4008 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:185
//# Page 1417
// PORT: SOURCE RESTARTS_ROUTINE.agc:186
//		CA	TEMPPHS		# SET UP POINTER FOR FINDING OUR PLACE IN
// PORT: Fixed ROM slots 4009.
                    if slot <> 4009 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4010 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:187
//		TS	SR		# THE RESTART TABLES
// PORT: Fixed ROM slots 4010.
                    if slot <> 4010 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4011 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:188
//		AD	SR
// PORT: Fixed ROM slots 4011.
                        if slot <> 4011 or instruction <> 24593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 17).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:189
//		NDX	TEMP2G
// PORT: Fixed ROM slots 4012.
                        if slot <> 4012 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[130] to agcAotUnit130@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:190
//		AD	SIZETAB +1
// PORT: Fixed ROM slots 4013.
    4013, 51202
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4014–4016.
function agcAotUnit131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4014 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:191
//		TS	POINTER
// PORT: Fixed ROM slots 4014.
        if slot <> 4014 or instruction <> 22638 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22638, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4015 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:192
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:193
//CONTBL2		EXTEND			# FIND OUT WHAT'S IN THE TABLE
// PORT: Fixed ROM slots 4015.
            if slot <> 4015 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:194
//		NDX	POINTER
// PORT: Fixed ROM slots 4016.
            if slot <> 4016 or instruction <> 20590 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[131] to agcAotUnit131@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:195
//		DCA	CADRTAB		# GET THE 2CADR
// PORT: Fixed ROM slots 4017.
    4017, 26628
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4018–4030.
function agcAotUnit132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4023 {
        if slot <= 4020 {
            if slot <= 4018 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:196
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:197
//		LXCH	GOLOC +1	# STORE THE BB INFORMATION
// PORT: Fixed ROM slots 4018.
                if slot <> 4018 or instruction <> 9670 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 454, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4019 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:198
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:199
//		CCS	A		# IS IT A JOB OR IT IT TIMED
// PORT: Fixed ROM slots 4019.
                    if slot <> 4019 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:200
//		INCR	A		# POSITIVE, MUST BE A JOB
// PORT: Fixed ROM slots 4020.
                    if slot <> 4020 or instruction <> 10240 { return choose false if checkOnly else -1. }
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
            if slot <= 4021 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:201
//		TCF	ITSAJOB2
// PORT: Fixed ROM slots 4021.
                if slot <> 4021 or instruction <> 6112 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6112, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4022 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:202
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:203
//		INCR	A		# MUST BE EITHER A WAITLIST OR LONGCALL
// PORT: Fixed ROM slots 4022.
                    if slot <> 4022 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:204
//		TS	GOLOC		# LET-S STORE THE CORRECT CADR
// PORT: Fixed ROM slots 4023.
                    if slot <> 4023 or instruction <> 22981 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22981, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4026 {
            if slot <= 4024 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:205
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:206
//		CA	WTLTCADR	# SET UP OUR EXIT TO WAITLIST
// PORT: Fixed ROM slots 4024.
                if slot <> 4024 or instruction <> 14326 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2038), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4025 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:207
//		TS	GOLOC -1
// PORT: Fixed ROM slots 4025.
                    if slot <> 4025 or instruction <> 22980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:208
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:209
//		CA	GOLOC +1	# NOW FIND OUT IF IT IS A WAITLIST CALL
// PORT: Fixed ROM slots 4026.
                    if slot <> 4026 or instruction <> 12742 { return choose false if checkOnly else -1. }
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
            if slot <= 4028 {
                if slot <= 4027 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:210
//		MASK	BIT10		# THIS SHOULD BE ONE IF WE HAVE -BB
// PORT: Fixed ROM slots 4027.
                    if slot <> 4027 or instruction <> 31238 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RESTARTS_ROUTINE.agc:211
//		CCS	A		# FOR THAT MATTER SO SHOULD BE BITS 9,8,7,
// PORT: Fixed ROM slots 4028.
                    if slot <> 4028 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4029 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:212
//					# 6,5, AND LAST BUT NOT LEAST (PERHAPS NOT
// PORT: SOURCE RESTARTS_ROUTINE.agc:213
//					# IN IMPORTANCE ANYWAY. BIT 4
// PORT: SOURCE RESTARTS_ROUTINE.agc:214
//		TCF	ITSWTLST	# IT IS A WAITLIST CALL
// PORT: Fixed ROM slots 4029.
                    if slot <> 4029 or instruction <> 6107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6107, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:215
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:216
//		NDX	POINTER		# OBTAIN THE ORIGINAL DELTA T
// PORT: Fixed ROM slots 4030.
                    if slot <> 4030 or instruction <> 20590 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[132] to agcAotUnit132@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:217
//		CA	PRDTTAB		# ADDRESS FOR THIS LONGCALL
// PORT: Fixed ROM slots 4031.
    4031, 26624
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4032–4032.
function agcAotUnit133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RESTARTS_ROUTINE.agc:218
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:219
//		TCF	ITSLGCL1	# NOW GO GET THE DELTA TIME
// PORT: Fixed ROM slots 4032.
    if slot <> 4032 or instruction <> 6983 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6983, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[133] to agcAotUnit133@.

// PORT: Physical bank 02. Shared continuation entries, slots 4935–4939.
function agcAotUnit214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4936 {
        if slot <= 4935 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:220
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:221
//# ***** THIS MUST BE IN FIXED FIXED *****
// PORT: SOURCE RESTARTS_ROUTINE.agc:222
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:223
//		BLOCK	02
// PORT: SOURCE RESTARTS_ROUTINE.agc:224
//		SETLOC	FFTAG2
// PORT: SOURCE RESTARTS_ROUTINE.agc:225
//		BANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:226
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:227
//		COUNT	02/RSROU
// PORT: SOURCE RESTARTS_ROUTINE.agc:228
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:229
//ITSLGCL1	LXCH	GOLOC +1	# OBTAIN THE CORRECT E BANK
// PORT: Fixed ROM slots 4935.
            if slot <> 4935 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:230
//		LXCH	BB
// PORT: Fixed ROM slots 4936.
            if slot <> 4936 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4937 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:231
//		LXCH	GOLOC +1	# AND PRESERVE OUR E AND F BANKS
// PORT: Fixed ROM slots 4937.
            if slot <> 4937 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4938 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:232
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:233
//		EXTEND			# GET THE DELTA TIME
// PORT: Fixed ROM slots 4938.
                if slot <> 4938 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:234
//		NDX	A
// PORT: Fixed ROM slots 4939.
                if slot <> 4939 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RESTARTS_ROUTINE.agc:235
//		DCA	0
// PORT: Fixed ROM slots 4940.
    4940, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4941–4944.
function agcAotUnit215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4942 {
        if slot <= 4941 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:236
//# Page 1418
// PORT: SOURCE RESTARTS_ROUTINE.agc:237
//		LXCH	GOLOC +1	# RESTORE OUR E AND F BANK
// PORT: Fixed ROM slots 4941.
            if slot <> 4941 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:238
//		LXCH	BB		# RESTORE THE TASKS E AND F BANKS
// PORT: Fixed ROM slots 4942.
            if slot <> 4942 or instruction <> 9222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 6, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4943 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:239
//		LXCH	GOLOC +1	# AND PRESERVE OUR L
// PORT: Fixed ROM slots 4943.
            if slot <> 4943 or instruction <> 9670 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 454, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:240
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:241
//		TCF	ITSLGCL2	# NOW LET:S PROCESS THIS LONGCALL
// PORT: Fixed ROM slots 4944.
            if slot <> 4944 or instruction <> 6081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[215] to agcAotUnit215@.

// PORT: Physical bank 01. Shared continuation entries, slots 4033–4056.
function agcAotUnit134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4044 {
        if slot <= 4038 {
            if slot <= 4035 {
                if slot <= 4033 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:242
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:243
//# ***** YOU MAY RETURN TO SWITCHED FIXED *****
// PORT: SOURCE RESTARTS_ROUTINE.agc:244
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:245
//		BANK	01
// PORT: SOURCE RESTARTS_ROUTINE.agc:246
//		SETLOC	RESTART
// PORT: SOURCE RESTARTS_ROUTINE.agc:247
//		BANK
// PORT: SOURCE RESTARTS_ROUTINE.agc:248
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:249
//		COUNT	01/RSROU
// PORT: SOURCE RESTARTS_ROUTINE.agc:250
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:251
//ITSLGCL2	DXCH	LONGTIME
// PORT: Fixed ROM slots 4033.
                    if slot <> 4033 or instruction <> 22112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 608, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4034 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:252
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:253
//		EXTEND			# CALCULATE TIME LEFT
// PORT: Fixed ROM slots 4034.
                        if slot <> 4034 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:254
//		DCS	TIME2
// PORT: Fixed ROM slots 4035.
                        if slot <> 4035 or instruction <> 16405 { return choose false if checkOnly else -1. }
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
                if slot <= 4036 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:255
//		DAS	LONGTIME
// PORT: Fixed ROM slots 4036.
                    if slot <> 4036 or instruction <> 8800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 608) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4037 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:256
//		EXTEND
// PORT: Fixed ROM slots 4037.
                        if slot <> 4037 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:257
//		DCA	LONGBASE
// PORT: Fixed ROM slots 4038.
                        if slot <> 4038 or instruction <> 12894 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 606, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4041 {
                if slot <= 4039 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:258
//		DAS	LONGTIME
// PORT: Fixed ROM slots 4039.
                    if slot <> 4039 or instruction <> 8800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 608) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4040 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:259
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:260
//		CCS	LONGTIME	# FIND OUT HOW THIS SHOULD BE RESTARTED
// PORT: Fixed ROM slots 4040.
                        if slot <> 4040 or instruction <> 4703 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 607).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:261
//		TCF	LONGCLCL
// PORT: Fixed ROM slots 4041.
                        if slot <> 4041 or instruction <> 6097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6097, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4042 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:262
//		TCF	+2
// PORT: Fixed ROM slots 4042.
                    if slot <> 4042 or instruction <> 6092 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6092, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4043 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:263
//		TCF	IMEDIATE -3
// PORT: Fixed ROM slots 4043.
                        if slot <> 4043 or instruction <> 6023 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6023, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:264
//		CCS	LONGTIME +1
// PORT: Fixed ROM slots 4044.
                        if slot <> 4044 or instruction <> 4704 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 608).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4050 {
            if slot <= 4047 {
                if slot <= 4045 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:265
//		TCF	LONGCLCL
// PORT: Fixed ROM slots 4045.
                    if slot <> 4045 or instruction <> 6097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6097, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4046 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:266
//		NOOP			# CAN:T GET HERE	*********
// PORT: Fixed ROM slots 4046.
                        if slot <> 4046 or instruction <> 6095 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6095, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:267
//		TCF	IMEDIATE -3
// PORT: Fixed ROM slots 4047.
                        if slot <> 4047 or instruction <> 6023 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6023, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4048 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:268
//		TCF	IMEDIATE
// PORT: Fixed ROM slots 4048.
                    if slot <> 4048 or instruction <> 6026 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6026, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4049 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:269
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:270
//LONGCLCL	CA	LGCLCADR	# WE WILL GO TO LONGCALL
// PORT: Fixed ROM slots 4049.
                        if slot <> 4049 or instruction <> 14324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:271
//		TS	GOLOC -1
// PORT: Fixed ROM slots 4050.
                        if slot <> 4050 or instruction <> 22980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22980, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4053 {
                if slot <= 4051 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:272
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:273
//		EXTEND			# PREPARE OUR ENTRY TO LONGCALL
// PORT: Fixed ROM slots 4051.
                    if slot <> 4051 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4052 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:274
//		DCA	LONGTIME
// PORT: Fixed ROM slots 4052.
                        if slot <> 4052 or instruction <> 12896 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 608, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:275
//		TC	GOLOC -1
// PORT: Fixed ROM slots 4053.
                        if slot <> 4053 or instruction <> 452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4054 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:276
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:277
//ITSLNGCL	CA	WTLTCADR	# ASSUME IT WILL GO TO WAITLIST
// PORT: Fixed ROM slots 4054.
                    if slot <> 4054 or instruction <> 14326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2038), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4055 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:278
//		TS	GOLOC -1
// PORT: Fixed ROM slots 4055.
                        if slot <> 4055 or instruction <> 22980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22980, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:279
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:280
//		NDX	TEMP2G
// PORT: Fixed ROM slots 4056.
                        if slot <> 4056 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[134] to agcAotUnit134@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:281
//		CS	PHSPRDT1	# GET THE DELTA T ADDRESS
// PORT: Fixed ROM slots 4057.
    4057, 33880
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4058–4058.
function agcAotUnit135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RESTARTS_ROUTINE.agc:282
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:283
//		TCF	ITSLGCL1	# NOW GET THE DELTA TIME
// PORT: Fixed ROM slots 4058.
    if slot <> 4058 or instruction <> 6983 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6983, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[135] to agcAotUnit135@.

// PORT: Physical bank 01. Shared continuation entries, slots 4059–4061.
function agcAotUnit136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4059 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:284
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:285
//ITSWTLST	CS	GOLOC +1	# CORRECT THE BBCON INFORMATION
// PORT: Fixed ROM slots 4059.
        if slot <> 4059 or instruction <> 16838 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 454).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4060 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:286
//		TS	GOLOC +1
// PORT: Fixed ROM slots 4060.
            if slot <> 4060 or instruction <> 22982 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22982, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:287
//# Page 1419
// PORT: SOURCE RESTARTS_ROUTINE.agc:288
//		NDX	POINTER		# GET THE DT AND FIND OUT IF IT WAS STORED
// PORT: Fixed ROM slots 4061.
            if slot <> 4061 or instruction <> 20590 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[136] to agcAotUnit136@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:289
//		CA	PRDTTAB		# DIRECTLY OR INDIRECTLY
// PORT: Fixed ROM slots 4062.
    4062, 26624
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4063–4065.
function agcAotUnit137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4063 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:290
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:291
//		TCF	TIMETEST	# FIND OUT HOW THE TIME IS STORED
// PORT: Fixed ROM slots 4063.
        if slot <> 4063 or instruction <> 6006 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6006, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4064 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:292
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:293
//ITSAJOB2	XCH	GOLOC		# STORE THE CADR
// PORT: Fixed ROM slots 4064.
            if slot <> 4064 or instruction <> 24005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 453, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:294
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:295
//		NDX	POINTER		# ADD THE PRIORITY AND LET:S GO
// PORT: Fixed ROM slots 4065.
            if slot <> 4065 or instruction <> 20590 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[137] to agcAotUnit137@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:296
//		CA	PRDTTAB
// PORT: Fixed ROM slots 4066.
    4066, 26624
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4067–4070.
function agcAotUnit138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4068 {
        if slot <= 4067 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:297
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:298
//		TCF	CHKNOVAC
// PORT: Fixed ROM slots 4067.
            if slot <> 4067 or instruction <> 6041 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6041, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:299
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:300
//ITSEVEN		CA	TEMPSWCH	# SET UP FOR EITHER THE SECOND PART OF THE
// PORT: Fixed ROM slots 4068.
            if slot <> 4068 or instruction <> 12399 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 111).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4069 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:301
//		TS	GOLOC +2	# TABLE, OR A RETURN FOR THE NEXT GROUP
// PORT: Fixed ROM slots 4069.
            if slot <> 4069 or instruction <> 22983 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22983, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:302
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:303
//		NDX	TEMP2G		# SET UP POINTER FOR OUR LOCATION WITHIN
// PORT: Fixed ROM slots 4070.
            if slot <> 4070 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[138] to agcAotUnit138@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:304
//		CA	SIZETAB		# THE TABLE
// PORT: Fixed ROM slots 4071.
    4071, 26624
)).

// PORT: Physical bank 01. Shared continuation entries, slots 4072–4081.
function agcAotUnit139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4076 {
        if slot <= 4073 {
            if slot <= 4072 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:305
//		AD	TEMPPHS		# THIS MAY LOOK BAD BUT LET:S SEE YOU DO
// PORT: Fixed ROM slots 4072.
                if slot <> 4072 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:306
//		AD	TEMPPHS		# BETTER IN TIME OR NUMBER OF LOCATIONS
// PORT: Fixed ROM slots 4073.
                if slot <> 4073 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4074 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:307
//		AD	TEMPPHS
// PORT: Fixed ROM slots 4074.
                if slot <> 4074 or instruction <> 24684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4075 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:308
//		TS	POINTER
// PORT: Fixed ROM slots 4075.
                    if slot <> 4075 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:309
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:310
//		TCF	CONTBL2		# NOW PROCESS WHAT IS IN THE TABLE
// PORT: Fixed ROM slots 4076.
                    if slot <> 4076 or instruction <> 6063 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6063, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4078 {
            if slot <= 4077 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:311
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:312
//PHSPART2	CA	THREE		# SET THE POINTER FOR THE SECOND HALF OF
// PORT: Fixed ROM slots 4077.
                if slot <> 4077 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:313
//		ADS	POINTER		# THE TABLE
// PORT: Fixed ROM slots 4078.
                if slot <> 4078 or instruction <> 11374 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 110).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4079 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:314
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:315
//		CA	RTRNCADR	# THIS WILL BE OUR LAST TIME THROUGH THE
// PORT: Fixed ROM slots 4079.
                if slot <> 4079 or instruction <> 14191 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1903), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4080 {
// PORT: SOURCE RESTARTS_ROUTINE.agc:316
//		TS	GOLOC +2	# EVEN TABLE , SO AFTER IT  GET THE NEXT
// PORT: Fixed ROM slots 4080.
                    if slot <> 4080 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTARTS_ROUTINE.agc:317
//					# GROUP
// PORT: SOURCE RESTARTS_ROUTINE.agc:318
//		TCF	CONTBL2		# SO LET:S GET THE SECOND ENTRY IN THE TBL
// PORT: Fixed ROM slots 4081.
                    if slot <> 4081 or instruction <> 6063 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6063, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[139] to agcAotUnit139@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTARTS_ROUTINE.agc:319
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:320
//TEMPPHS		EQUALS	MPAC
// PORT: SOURCE RESTARTS_ROUTINE.agc:321
//TEMP2G		EQUALS	MPAC +1
// PORT: SOURCE RESTARTS_ROUTINE.agc:322
//POINTER		EQUALS	MPAC +2
// PORT: SOURCE RESTARTS_ROUTINE.agc:323
//TEMPSWCH	EQUALS	MPAC +3
// PORT: SOURCE RESTARTS_ROUTINE.agc:324
//GOLOC		EQUALS	VAC5 +20D
// PORT: SOURCE RESTARTS_ROUTINE.agc:325
//MINUS2		EQUALS	NEG2
// PORT: SOURCE RESTARTS_ROUTINE.agc:326
//OCT177		EQUALS	LOW7
// PORT: SOURCE RESTARTS_ROUTINE.agc:327
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:328
//PHS2CADR	GENADR	PHSPART2
// PORT: Fixed ROM slots 4082.
    4082, 4058,
// PORT: SOURCE RESTARTS_ROUTINE.agc:329
//PRT2CADR	GENADR	GETPART2
// PORT: Fixed ROM slots 4083.
    4083, 3766,
// PORT: SOURCE RESTARTS_ROUTINE.agc:330
//LGCLCADR	GENADR	LONGCALL
// PORT: Fixed ROM slots 4084.
    4084, 5572,
// PORT: SOURCE RESTARTS_ROUTINE.agc:331
//FVACCADR	GENADR	FINDVAC
// PORT: Fixed ROM slots 4085.
    4085, 5326,
// PORT: SOURCE RESTARTS_ROUTINE.agc:332
//WTLTCADR	GENADR	WAITLIST
// PORT: Fixed ROM slots 4086.
    4086, 5450,
// PORT: SOURCE RESTARTS_ROUTINE.agc:333
//NOVACADR	GENADR	NOVAC
// PORT: Fixed ROM slots 4087.
    4087, 5304
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE RESTARTS_ROUTINE.agc:334
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:335
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:336
//
// PORT: SOURCE RESTARTS_ROUTINE.agc:337
//
