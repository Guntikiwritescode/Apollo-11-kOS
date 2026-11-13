// PORT: Original source unit SERVICE_ROUTINES.agc.
// PORT: Physical bank 10. Shared continuation entries, slots 11108–11121.
function agcAotUnit718 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11114 {
        if slot <= 11110 {
            if slot <= 11108 {
// PORT: SOURCE SERVICE_ROUTINES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE SERVICE_ROUTINES.agc:2
//# Filename:	SERVICE_ROUTINES.agc
// PORT: SOURCE SERVICE_ROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE SERVICE_ROUTINES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE SERVICE_ROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE SERVICE_ROUTINES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE SERVICE_ROUTINES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE SERVICE_ROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE SERVICE_ROUTINES.agc:9
//# Pages:	1374-1380
// PORT: SOURCE SERVICE_ROUTINES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE SERVICE_ROUTINES.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE SERVICE_ROUTINES.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE SERVICE_ROUTINES.agc:13
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE SERVICE_ROUTINES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE SERVICE_ROUTINES.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE SERVICE_ROUTINES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE SERVICE_ROUTINES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE SERVICE_ROUTINES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE SERVICE_ROUTINES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE SERVICE_ROUTINES.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE SERVICE_ROUTINES.agc:22
//# actually created.
// PORT: SOURCE SERVICE_ROUTINES.agc:23
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE SERVICE_ROUTINES.agc:25
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE SERVICE_ROUTINES.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE SERVICE_ROUTINES.agc:28
//
// PORT: SOURCE SERVICE_ROUTINES.agc:29
//# Page 1374
// PORT: SOURCE SERVICE_ROUTINES.agc:30
//		BANK	10
// PORT: SOURCE SERVICE_ROUTINES.agc:31
//		SETLOC	DISPLAYS
// PORT: SOURCE SERVICE_ROUTINES.agc:32
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:33
//		COUNT*	$$/DSPLA
// PORT: SOURCE SERVICE_ROUTINES.agc:34
//
// PORT: SOURCE SERVICE_ROUTINES.agc:35
//UPENT2		INHINT
// PORT: Fixed ROM slots 11108.
                if slot <> 11108 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11109 {
// PORT: SOURCE SERVICE_ROUTINES.agc:36
//		MASK	OCT77770
// PORT: Fixed ROM slots 11109.
                    if slot <> 11109 or instruction <> 31664 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2992), 32768).
                        if fixedOperand = 32760 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4096) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:37
//		TS	L
// PORT: Fixed ROM slots 11110.
                    if slot <> 11110 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 11112 {
                if slot <= 11111 {
// PORT: SOURCE SERVICE_ROUTINES.agc:38
//		CS	FLAGWRD4
// PORT: Fixed ROM slots 11111.
                    if slot <> 11111 or instruction <> 16448 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 64).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:39
//		MASK	L
// PORT: Fixed ROM slots 11112.
                    if slot <> 11112 or instruction <> 28673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 11113 {
// PORT: SOURCE SERVICE_ROUTINES.agc:40
//		ADS	FLAGWRD4
// PORT: Fixed ROM slots 11113.
                    if slot <> 11113 or instruction <> 11328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 64).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:41
//JOIN		RELINT
// PORT: Fixed ROM slots 11114.
                    if slot <> 11114 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 11117 {
            if slot <= 11115 {
// PORT: SOURCE SERVICE_ROUTINES.agc:42
//		TCF	Q+1
// PORT: Fixed ROM slots 11115.
                if slot <> 11115 or instruction <> 7647 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7647, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11116 {
// PORT: SOURCE SERVICE_ROUTINES.agc:43
//
// PORT: SOURCE SERVICE_ROUTINES.agc:44
//DOWNENT2	INHINT
// PORT: Fixed ROM slots 11116.
                    if slot <> 11116 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:45
//		MASK	OCT77770
// PORT: Fixed ROM slots 11117.
                    if slot <> 11117 or instruction <> 31664 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2992), 32768).
                        if fixedOperand = 32760 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 4096) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 11119 {
                if slot <= 11118 {
// PORT: SOURCE SERVICE_ROUTINES.agc:46
//		COM
// PORT: Fixed ROM slots 11118.
                    if slot <> 11118 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:47
//		MASK	FLAGWRD4
// PORT: Fixed ROM slots 11119.
                    if slot <> 11119 or instruction <> 28736 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 64).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 11120 {
// PORT: SOURCE SERVICE_ROUTINES.agc:48
//		TS	FLAGWRD4
// PORT: Fixed ROM slots 11120.
                    if slot <> 11120 or instruction <> 22592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:49
//		TCF	JOIN
// PORT: Fixed ROM slots 11121.
                    if slot <> 11121 or instruction <> 5994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[718] to agcAotUnit718@.

// PORT: Physical bank 02. Shared continuation entries, slots 4932–4937.
function agcAotUnit220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4934 {
        if slot <= 4932 {
// PORT: SOURCE SERVICE_ROUTINES.agc:50
//
// PORT: SOURCE SERVICE_ROUTINES.agc:51
//OCT7		EQUALS	SEVEN
// PORT: SOURCE SERVICE_ROUTINES.agc:52
//
// PORT: SOURCE SERVICE_ROUTINES.agc:53
//# Page 1375
// PORT: SOURCE SERVICE_ROUTINES.agc:54
//#     UPFLAG AND DOWNFLAG ARE ENTIRELY GENERAL FLAG SETTING AND CLEARING SUBROUTINES.   USING THEM, WHETHER OR
// PORT: SOURCE SERVICE_ROUTINES.agc:55
//# NOT IN INTERRUPT, ONE MAY SET OR CLEAR ANY SINGLE, NAMED BIT IN ANY ERASABLE REGISTER, SUBJECT OF COURSE TO
// PORT: SOURCE SERVICE_ROUTINES.agc:56
//# EBANK SETTING.   A "NAMED" BIT, AS THE WORD IS USED HERE, IS ANY BIT WITH A NAME FORMALLY ASSIGNED BY THE YUL
// PORT: SOURCE SERVICE_ROUTINES.agc:57
//# ASSEMBLER.
// PORT: SOURCE SERVICE_ROUTINES.agc:58
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:59
//#     AT PRESENT THE ONLY NAMED BITS ARE THOSE IN THE FLAGWORDS.   ASSEMBLER CHANGES WILL MAKE IT POSSIBLE TO
// PORT: SOURCE SERVICE_ROUTINES.agc:60
//# NAME ANY BIT IN ERASABLE MEMORY.
// PORT: SOURCE SERVICE_ROUTINES.agc:61
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:62
//#     CALLING SEQUENCES ARE AS FOLLOWS :-
// PORT: SOURCE SERVICE_ROUTINES.agc:63
//#		TC	UPFLAG			TC	DOWNFLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:64
//#		ADRES	NAME OF FLAG		ADRES	NAME OF FLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:65
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:66
//#     RETURN IS TO THE LOCATION FOLLOWING THE "ADRES" ABOUT .58 MS AFTER THE "TC".
// PORT: SOURCE SERVICE_ROUTINES.agc:67
//#     UPON RETURN A CONTAINS THE CURRENT FLAGWRD SETTING.
// PORT: SOURCE SERVICE_ROUTINES.agc:68
//
// PORT: SOURCE SERVICE_ROUTINES.agc:69
//		BLOCK	02
// PORT: SOURCE SERVICE_ROUTINES.agc:70
//		SETLOC	FFTAG1
// PORT: SOURCE SERVICE_ROUTINES.agc:71
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:72
//		COUNT*	$$/FLAG
// PORT: SOURCE SERVICE_ROUTINES.agc:73
//
// PORT: SOURCE SERVICE_ROUTINES.agc:74
//UPFLAG		CA	Q
// PORT: Fixed ROM slots 4932.
            if slot <> 4932 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4933 {
// PORT: SOURCE SERVICE_ROUTINES.agc:75
//		TC	DEBIT
// PORT: Fixed ROM slots 4933.
                if slot <> 4933 or instruction <> 2898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2898, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:76
//		COM			# +(15 - BIT)
// PORT: Fixed ROM slots 4934.
                if slot <> 4934 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4935 {
// PORT: SOURCE SERVICE_ROUTINES.agc:77
//		EXTEND
// PORT: Fixed ROM slots 4935.
            if slot <> 4935 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4936 {
// PORT: SOURCE SERVICE_ROUTINES.agc:78
//		ROR	LCHAN		# SET BIT
// PORT: Fixed ROM slots 4936.
                if slot <> 4936 or instruction <> 2049 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:79
//COMFLAG		INDEX	ITEMP1
// PORT: Fixed ROM slots 4937.
                if slot <> 4937 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[220] to agcAotUnit220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:80
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 4938.
    4938, 45176
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4939–4951.
function agcAotUnit221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4944 {
        if slot <= 4941 {
            if slot <= 4939 {
// PORT: SOURCE SERVICE_ROUTINES.agc:81
//		LXCH	ITEMP3
// PORT: Fixed ROM slots 4939.
                if slot <> 4939 or instruction <> 9267 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 51, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4940 {
// PORT: SOURCE SERVICE_ROUTINES.agc:82
//		RELINT
// PORT: Fixed ROM slots 4940.
                    if slot <> 4940 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:83
//		TC	L
// PORT: Fixed ROM slots 4941.
                    if slot <> 4941 or instruction <> 1 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4942 {
// PORT: SOURCE SERVICE_ROUTINES.agc:84
//
// PORT: SOURCE SERVICE_ROUTINES.agc:85
//DOWNFLAG	CA	Q
// PORT: Fixed ROM slots 4942.
                if slot <> 4942 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4943 {
// PORT: SOURCE SERVICE_ROUTINES.agc:86
//		TC	DEBIT
// PORT: Fixed ROM slots 4943.
                    if slot <> 4943 or instruction <> 2898 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2898, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:87
//		MASK	L		# RESET BIT
// PORT: Fixed ROM slots 4944.
                    if slot <> 4944 or instruction <> 28673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4947 {
            if slot <= 4945 {
// PORT: SOURCE SERVICE_ROUTINES.agc:88
//		TCF	COMFLAG
// PORT: Fixed ROM slots 4945.
                if slot <> 4945 or instruction <> 6985 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6985, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4946 {
// PORT: SOURCE SERVICE_ROUTINES.agc:89
//
// PORT: SOURCE SERVICE_ROUTINES.agc:90
//DEBIT		AD	ONE		# CET DE BITS
// PORT: Fixed ROM slots 4946.
                    if slot <> 4946 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE SERVICE_ROUTINES.agc:91
//		INHINT
// PORT: Fixed ROM slots 4947.
                    if slot <> 4947 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4949 {
                if slot <= 4948 {
// PORT: SOURCE SERVICE_ROUTINES.agc:92
//		TS	ITEMP3
// PORT: Fixed ROM slots 4948.
                    if slot <> 4948 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:93
//		CA	LOW4		# DEC15
// PORT: Fixed ROM slots 4949.
                    if slot <> 4949 or instruction <> 14834 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2546), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4950 {
// PORT: SOURCE SERVICE_ROUTINES.agc:94
//		TS	ITEMP1
// PORT: Fixed ROM slots 4950.
                    if slot <> 4950 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:95
//		INDEX	ITEMP3
// PORT: Fixed ROM slots 4951.
                    if slot <> 4951 or instruction <> 20531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20531, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[221] to agcAotUnit221@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:96
//		CA	0 -1		# ADRES
// PORT: Fixed ROM slots 4952.
    4952, 24574
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4953–4958.
function agcAotUnit222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4955 {
        if slot <= 4953 {
// PORT: SOURCE SERVICE_ROUTINES.agc:97
//		TS	L
// PORT: Fixed ROM slots 4953.
            if slot <> 4953 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4954 {
// PORT: SOURCE SERVICE_ROUTINES.agc:98
//		CA	ZERO
// PORT: Fixed ROM slots 4954.
                if slot <> 4954 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:99
//# Page 1376
// PORT: SOURCE SERVICE_ROUTINES.agc:100
//		EXTEND
// PORT: Fixed ROM slots 4955.
                if slot <> 4955 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4956 {
// PORT: SOURCE SERVICE_ROUTINES.agc:101
//		DV	ITEMP1		# A = FLAGWRD, L = (15 - BIT)
// PORT: Fixed ROM slots 4956.
            if slot <> 4956 or instruction <> 4145 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreDv(words, 49, readEffective:call(words, 49)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4957 {
// PORT: SOURCE SERVICE_ROUTINES.agc:102
//		DXCH	ITEMP1
// PORT: Fixed ROM slots 4957.
                if slot <> 4957 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:103
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 4958.
                if slot <> 4958 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[222] to agcAotUnit222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:104
//		CA	FLAGWRD0
// PORT: Fixed ROM slots 4959.
    4959, 24696
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4960–4961.
function agcAotUnit223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4960 {
// PORT: SOURCE SERVICE_ROUTINES.agc:105
//		TS	L		# CURRENT STATE
// PORT: Fixed ROM slots 4960.
        if slot <> 4960 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:106
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 4961.
        if slot <> 4961 or instruction <> 20530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20530, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20530, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[223] to agcAotUnit223@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:107
//		CS	BIT15		# -(15 - BIT)
// PORT: Fixed ROM slots 4962.
    4962, 37818
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4963–4963.
function agcAotUnit224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:108
//		TC	Q
// PORT: Fixed ROM slots 4963.
    if slot <> 4963 or instruction <> 2 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[224] to agcAotUnit224@.

// PORT: Physical bank 00. Shared continuation entries, slots 3037–3041.
function agcAotUnit45 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3038 {
        if slot <= 3037 {
// PORT: SOURCE SERVICE_ROUTINES.agc:109
//
// PORT: SOURCE SERVICE_ROUTINES.agc:110
//# Page 1377
// PORT: SOURCE SERVICE_ROUTINES.agc:111
//# DELAYJOB- A GENERAL ROUTINE TO DELAY A JOB A SPECIFIC AMOUNT OF TIME BEFORE PICKING UP AGAIN.
// PORT: SOURCE SERVICE_ROUTINES.agc:112
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:113
//# ENTRANCE REQUIREMENTS...
// PORT: SOURCE SERVICE_ROUTINES.agc:114
//#		CAF	DT		# DELAY JOB FOR DT CENTISECS
// PORT: SOURCE SERVICE_ROUTINES.agc:115
//#		TC	BANKCALL
// PORT: SOURCE SERVICE_ROUTINES.agc:116
//#		CADR	DELAYJOB
// PORT: SOURCE SERVICE_ROUTINES.agc:117
//
// PORT: SOURCE SERVICE_ROUTINES.agc:118
//		BANK	06
// PORT: SOURCE SERVICE_ROUTINES.agc:119
//		SETLOC	DLAYJOB
// PORT: SOURCE SERVICE_ROUTINES.agc:120
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:121
//
// PORT: SOURCE SERVICE_ROUTINES.agc:122
//# THIS MUST REMAIN IN BANK 0 *****************************************
// PORT: SOURCE SERVICE_ROUTINES.agc:123
//
// PORT: SOURCE SERVICE_ROUTINES.agc:124
//		COUNT*	$$/DELAY
// PORT: SOURCE SERVICE_ROUTINES.agc:125
//DELAYJOB	INHINT
// PORT: Fixed ROM slots 3037.
            if slot <> 3037 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:126
//		TS	Q		# STORE DELAY DT IN Q FOR DLY -1 IN
// PORT: Fixed ROM slots 3038.
            if slot <> 3038 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3039 {
// PORT: SOURCE SERVICE_ROUTINES.agc:127
//		CAF	DELAYNUM	# WAITLIST
// PORT: Fixed ROM slots 3039.
            if slot <> 3039 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3040 {
// PORT: SOURCE SERVICE_ROUTINES.agc:128
//DELLOOP		TS	RUPTREG1
// PORT: Fixed ROM slots 3040.
                if slot <> 3040 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:129
//		INDEX	A
// PORT: Fixed ROM slots 3041.
                if slot <> 3041 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[45] to agcAotUnit45@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:130
//		CA	DELAYLOC	# IS THIS DELAYLOC AVAILABLE
// PORT: Fixed ROM slots 3042.
    3042, 26028
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3043–3048.
function agcAotUnit46 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3045 {
        if slot <= 3043 {
// PORT: SOURCE SERVICE_ROUTINES.agc:131
//		EXTEND
// PORT: Fixed ROM slots 3043.
            if slot <> 3043 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3044 {
// PORT: SOURCE SERVICE_ROUTINES.agc:132
//		BZF	OK2DELAY	# YES
// PORT: Fixed ROM slots 3044.
                if slot <> 3044 or instruction <> 6122 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:133
//
// PORT: SOURCE SERVICE_ROUTINES.agc:134
//		CCS	RUPTREG1	# NO, TRY NEXT DELAYLOC
// PORT: Fixed ROM slots 3045.
                if slot <> 3045 or instruction <> 4152 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3046 {
// PORT: SOURCE SERVICE_ROUTINES.agc:135
//		TCF	DELLOOP
// PORT: Fixed ROM slots 3046.
            if slot <> 3046 or instruction <> 6112 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6112, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3047 {
// PORT: SOURCE SERVICE_ROUTINES.agc:136
//
// PORT: SOURCE SERVICE_ROUTINES.agc:137
//		DXCH	BUF2
// PORT: Fixed ROM slots 3047.
                if slot <> 3047 or instruction <> 21596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:138
//		TC	BAILOUT1	# NO AVAILABLE LOCS.
// PORT: Fixed ROM slots 3048.
                if slot <> 3048 or instruction <> 3022 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3022, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[46] to agcAotUnit46@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:139
//		OCT	1104
// PORT: Fixed ROM slots 3049.
    3049, 1160
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3050–3058.
function agcAotUnit47 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3053 {
        if slot <= 3051 {
            if slot <= 3050 {
// PORT: SOURCE SERVICE_ROUTINES.agc:140
//
// PORT: SOURCE SERVICE_ROUTINES.agc:141
//OK2DELAY	CA	TCSLEEP		# SET WAITLIST IMMEDIATE RETURN
// PORT: Fixed ROM slots 3050.
                if slot <> 3050 or instruction <> 14330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2042), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:142
//		TS	WAITEXIT
// PORT: Fixed ROM slots 3051.
                if slot <> 3051 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3052 {
// PORT: SOURCE SERVICE_ROUTINES.agc:143
//
// PORT: SOURCE SERVICE_ROUTINES.agc:144
//		CA	FBANK
// PORT: Fixed ROM slots 3052.
                if slot <> 3052 or instruction <> 12292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 4).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:145
//		AD	RUPTREG1	# STORE BBANK FOR TASK CALL
// PORT: Fixed ROM slots 3053.
                if slot <> 3053 or instruction <> 24632 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3055 {
            if slot <= 3054 {
// PORT: SOURCE SERVICE_ROUTINES.agc:146
//		TS	L
// PORT: Fixed ROM slots 3054.
                if slot <> 3054 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:147
//
// PORT: SOURCE SERVICE_ROUTINES.agc:148
//		CAF	WAKECAD		# STORE CADR FOR TASK CALL
// PORT: Fixed ROM slots 3055.
                if slot <> 3055 or instruction <> 14331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2043), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3056 {
// PORT: SOURCE SERVICE_ROUTINES.agc:149
//		TCF	DLY2 -1		# DLY IS IN WAITLIST ROUTINE
// PORT: Fixed ROM slots 3056.
                if slot <> 3056 or instruction <> 6793 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6793, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3057 {
// PORT: SOURCE SERVICE_ROUTINES.agc:150
//
// PORT: SOURCE SERVICE_ROUTINES.agc:151
//TCGETCAD	TC	MAKECADR	# GET CALLERS FCADR
// PORT: Fixed ROM slots 3057.
                    if slot <> 3057 or instruction <> 2469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:152
//
// PORT: SOURCE SERVICE_ROUTINES.agc:153
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 3058.
                    if slot <> 3058 or instruction <> 20536 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[47] to agcAotUnit47@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:154
//		TS	DELAYLOC	# SAVE DELAY CADRS
// PORT: Fixed ROM slots 3059.
    3059, 46508
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3060–3062.
function agcAotUnit48 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3060 {
// PORT: SOURCE SERVICE_ROUTINES.agc:155
//
// PORT: SOURCE SERVICE_ROUTINES.agc:156
//		TC	JOBSLEEP
// PORT: Fixed ROM slots 3060.
        if slot <> 3060 or instruction <> 2651 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2651, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3061 {
// PORT: SOURCE SERVICE_ROUTINES.agc:157
//
// PORT: SOURCE SERVICE_ROUTINES.agc:158
//WAKER		CAF	ZERO
// PORT: Fixed ROM slots 3061.
            if slot <> 3061 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:159
//		INDEX	BBANK
// PORT: Fixed ROM slots 3062.
            if slot <> 3062 or instruction <> 20486 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20486, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20486, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[48] to agcAotUnit48@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:160
//		XCH	DELAYLOC	# MAKE DELAYLOC AVAILABLE
// PORT: Fixed ROM slots 3063.
    3063, 48556
)).

// PORT: Physical bank 00. Shared continuation entries, slots 3064–3065.
function agcAotUnit49 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3064 {
// PORT: SOURCE SERVICE_ROUTINES.agc:161
//# Page 1378
// PORT: SOURCE SERVICE_ROUTINES.agc:162
//		TC	JOBWAKE
// PORT: Fixed ROM slots 3064.
        if slot <> 3064 or instruction <> 2655 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2655, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:163
//
// PORT: SOURCE SERVICE_ROUTINES.agc:164
//		TC	TASKOVER
// PORT: Fixed ROM slots 3065.
        if slot <> 3065 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[49] to agcAotUnit49@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:165
//
// PORT: SOURCE SERVICE_ROUTINES.agc:166
//TCSLEEP		GENADR	TCGETCAD -2
// PORT: Fixed ROM slots 3066.
    3066, 4062,
// PORT: SOURCE SERVICE_ROUTINES.agc:167
//WAKECAD		GENADR	WAKER
// PORT: Fixed ROM slots 3067.
    3067, 4074
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4964–4966.
function agcAotUnit225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4964 {
// PORT: SOURCE SERVICE_ROUTINES.agc:168
//
// PORT: SOURCE SERVICE_ROUTINES.agc:169
//# Page 1379
// PORT: SOURCE SERVICE_ROUTINES.agc:170
//# GENTRAN, A BLOCK TRANSFER ROUTINE.
// PORT: SOURCE SERVICE_ROUTINES.agc:171
//# WRITTEN BY D. EYLES
// PORT: SOURCE SERVICE_ROUTINES.agc:172
//# MOD 1 BY KERNAN						UTILITYM REV 17 11/18/67
// PORT: SOURCE SERVICE_ROUTINES.agc:173
//# MOD 2 BY SCHULENBERG (REMOVE RELINT)   SKIPPER REV 4 2/28/68
// PORT: SOURCE SERVICE_ROUTINES.agc:174
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:175
//# 	   THIS ROUTINE IS USEFULL FOR TRANSFERING N CONSECUTIVE ERASABLE OR FIXED QUANTITIES TO SOME OTHER N
// PORT: SOURCE SERVICE_ROUTINES.agc:176
//# CONSECUTIVE ERASABLE LOCATIONS.  IF BOTH BLOCKS OF DATA ARE IN SWITCHABLE EBANKS, THEY MUST BE IN THE SAME ONE.
// PORT: SOURCE SERVICE_ROUTINES.agc:177
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:178
//# 	   GENTRAN IS CALLABLE IN A JOB AS WELL AS A RUPT.  THE CALLING SEQUENCE IS:
// PORT: SOURCE SERVICE_ROUTINES.agc:179
//#	I	CA	N-1		# # OF QUANTITIES MINUS ONE.
// PORT: SOURCE SERVICE_ROUTINES.agc:180
//#	I +1	TC	GENTRAN		# IN FIXED-FIXED.
// PORT: SOURCE SERVICE_ROUTINES.agc:181
//#	I +2	ADRES	L		# STARTING ADRES OF DATA TO BE MOVED.
// PORT: SOURCE SERVICE_ROUTINES.agc:182
//#	I +3	ADRES	M		# STARTING ADRES OF DUPLICATION BLOCK.
// PORT: SOURCE SERVICE_ROUTINES.agc:183
//#	I +4				# RETURNS HERE.
// PORT: SOURCE SERVICE_ROUTINES.agc:184
//#
// PORT: SOURCE SERVICE_ROUTINES.agc:185
//# 	   GENTRAN TAKES 25 MCT'S (300 MICROSECONDS) PER ITEM + 5 MCT'S (60 MICS) FOR ENTERING AND EXITING.
// PORT: SOURCE SERVICE_ROUTINES.agc:186
//# 	   A, L, AND ITEMP1 ARE NOT PRESERVED.
// PORT: SOURCE SERVICE_ROUTINES.agc:187
//
// PORT: SOURCE SERVICE_ROUTINES.agc:188
//		BLOCK	02
// PORT: SOURCE SERVICE_ROUTINES.agc:189
//		SETLOC	FFTAG4
// PORT: SOURCE SERVICE_ROUTINES.agc:190
//		BANK
// PORT: SOURCE SERVICE_ROUTINES.agc:191
//
// PORT: SOURCE SERVICE_ROUTINES.agc:192
//		EBANK=	ITEMP1
// PORT: SOURCE SERVICE_ROUTINES.agc:193
//
// PORT: SOURCE SERVICE_ROUTINES.agc:194
//		COUNT*	$$/TRAN
// PORT: SOURCE SERVICE_ROUTINES.agc:195
//
// PORT: SOURCE SERVICE_ROUTINES.agc:196
//GENTRAN		INHINT
// PORT: Fixed ROM slots 4964.
        if slot <> 4964 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4965 {
// PORT: SOURCE SERVICE_ROUTINES.agc:197
//		TS	ITEMP1		# SAVE N-1.
// PORT: Fixed ROM slots 4965.
            if slot <> 4965 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:198
//		INDEX	Q		# C(Q) = ADRES L.
// PORT: Fixed ROM slots 4966.
            if slot <> 4966 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[225] to agcAotUnit225@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:199
//		AD	0		# ADRES (L + N - 1).
// PORT: Fixed ROM slots 4967.
    4967, 49152
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4968–4968.
function agcAotUnit226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:200
//		INDEX	A
// PORT: Fixed ROM slots 4968.
    if slot <> 4968 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[226] to agcAotUnit226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:201
//		CA	0		# C(ABOVE).
// PORT: Fixed ROM slots 4969.
    4969, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4970–4972.
function agcAotUnit227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4970 {
// PORT: SOURCE SERVICE_ROUTINES.agc:202
//		TS	L		# SAVE DATA.
// PORT: Fixed ROM slots 4970.
        if slot <> 4970 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4971 {
// PORT: SOURCE SERVICE_ROUTINES.agc:203
//		CA	ITEMP1
// PORT: Fixed ROM slots 4971.
            if slot <> 4971 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:204
//		INDEX	Q
// PORT: Fixed ROM slots 4972.
            if slot <> 4972 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[227] to agcAotUnit227@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:205
//		AD	1		# ADRES (M + N - 1).
// PORT: Fixed ROM slots 4973.
    4973, 49154
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4974–4974.
function agcAotUnit228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICE_ROUTINES.agc:206
//		INDEX	A
// PORT: Fixed ROM slots 4974.
    if slot <> 4974 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[228] to agcAotUnit228@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICE_ROUTINES.agc:207
//		LXCH	0		# STUFF IT.
// PORT: Fixed ROM slots 4975.
    4975, 18432
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4976–4982.
function agcAotUnit229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4978 {
        if slot <= 4976 {
// PORT: SOURCE SERVICE_ROUTINES.agc:208
//		CCS	ITEMP1		# LOOP UNTIL N-1 = 0.
// PORT: Fixed ROM slots 4976.
            if slot <> 4976 or instruction <> 4145 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4977 {
// PORT: SOURCE SERVICE_ROUTINES.agc:209
//		TCF	GENTRAN +1
// PORT: Fixed ROM slots 4977.
                if slot <> 4977 or instruction <> 7013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:210
//		TCF	Q+2		# RETURN TO CALLER.
// PORT: Fixed ROM slots 4978.
                if slot <> 4978 or instruction <> 7649 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7649, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4980 {
            if slot <= 4979 {
// PORT: SOURCE SERVICE_ROUTINES.agc:211
//
// PORT: SOURCE SERVICE_ROUTINES.agc:212
//# Page 1380
// PORT: SOURCE SERVICE_ROUTINES.agc:213
//# B5OFF   ZERO BIT 5 OF EXTVBACT, WHICH IS SET BY TESTXACT.
// PORT: SOURCE SERVICE_ROUTINES.agc:214
//# 	   MAY BE USED AS NEEDED BY ANY EXTENDED VERB WHICH HAS DONE TESTXACT
// PORT: SOURCE SERVICE_ROUTINES.agc:215
//
// PORT: SOURCE SERVICE_ROUTINES.agc:216
//		COUNT*	$$/EXTVB
// PORT: SOURCE SERVICE_ROUTINES.agc:217
//
// PORT: SOURCE SERVICE_ROUTINES.agc:218
//B5OFF		CS	BIT5
// PORT: Fixed ROM slots 4979.
                if slot <> 4979 or instruction <> 18919 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:219
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 4980.
                if slot <> 4980 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4981 {
// PORT: SOURCE SERVICE_ROUTINES.agc:220
//		TS	EXTVBACT
// PORT: Fixed ROM slots 4981.
                if slot <> 4981 or instruction <> 23076 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICE_ROUTINES.agc:221
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 4982.
                if slot <> 4982 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[229] to agcAotUnit229@.

