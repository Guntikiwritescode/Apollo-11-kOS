// PORT: Original source unit AOTMARK.agc.
// PORT: Physical bank 07. Shared continuation entries, slots 9216–9220.
function agcAotUnit545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9217 {
        if slot <= 9216 {
// PORT: SOURCE AOTMARK.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE AOTMARK.agc:2
//# Filename:	AOTMARK.agc
// PORT: SOURCE AOTMARK.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE AOTMARK.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE AOTMARK.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE AOTMARK.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE AOTMARK.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE AOTMARK.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE AOTMARK.agc:9
//# Pages:	244-261
// PORT: SOURCE AOTMARK.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE AOTMARK.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE AOTMARK.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE AOTMARK.agc:13
//#
// PORT: SOURCE AOTMARK.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE AOTMARK.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE AOTMARK.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE AOTMARK.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE AOTMARK.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE AOTMARK.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE AOTMARK.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE AOTMARK.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE AOTMARK.agc:22
//# actually created.
// PORT: SOURCE AOTMARK.agc:23
//#
// PORT: SOURCE AOTMARK.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE AOTMARK.agc:25
//#
// PORT: SOURCE AOTMARK.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE AOTMARK.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE AOTMARK.agc:28
//
// PORT: SOURCE AOTMARK.agc:29
//# Page 244
// PORT: SOURCE AOTMARK.agc:30
//		BANK	12
// PORT: SOURCE AOTMARK.agc:31
//		SETLOC	AOTMARK1
// PORT: SOURCE AOTMARK.agc:32
//		BANK
// PORT: SOURCE AOTMARK.agc:33
//
// PORT: SOURCE AOTMARK.agc:34
//		EBANK=	XYMARK
// PORT: SOURCE AOTMARK.agc:35
//		COUNT*	$$/MARK
// PORT: SOURCE AOTMARK.agc:36
//
// PORT: SOURCE AOTMARK.agc:37
//AOTMARK		INHINT
// PORT: Fixed ROM slots 9216.
            if slot <> 9216 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:38
//		CCS	MARKSTAT	# SEE IF AOTMARK BUSY
// PORT: Fixed ROM slots 9217.
            if slot <> 9217 or instruction <> 4810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 714).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9218 {
// PORT: SOURCE AOTMARK.agc:39
//		TC	+2		# MARK SYSTEM BUSY -- DO ALARM
// PORT: Fixed ROM slots 9218.
            if slot <> 9218 or instruction <> 1028 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1028, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9219 {
// PORT: SOURCE AOTMARK.agc:40
//		TC	EXTVBCHK
// PORT: Fixed ROM slots 9219.
                if slot <> 9219 or instruction <> 1030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:41
//		TC	POODOO
// PORT: Fixed ROM slots 9220.
                if slot <> 9220 or instruction <> 2986 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2986, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[545] to agcAotUnit545@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:42
//		OCT	00105
// PORT: Fixed ROM slots 9221.
    9221, 138
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9222–9239.
function agcAotUnit546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9230 {
        if slot <= 9225 {
            if slot <= 9223 {
                if slot <= 9222 {
// PORT: SOURCE AOTMARK.agc:43
//
// PORT: SOURCE AOTMARK.agc:44
//EXTVBCHK	CAF	SIX		# SEE IF EXT. VERB WORKING
// PORT: Fixed ROM slots 9222.
                    if slot <> 9222 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:45
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 9223.
                    if slot <> 9223 or instruction <> 29220 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9224 {
// PORT: SOURCE AOTMARK.agc:46
//		CCS	A
// PORT: Fixed ROM slots 9224.
                    if slot <> 9224 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:47
//		TCF	MKABORT		# YES -- ABORT
// PORT: Fixed ROM slots 9225.
                    if slot <> 9225 or instruction <> 5156 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5156, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9227 {
                if slot <= 9226 {
// PORT: SOURCE AOTMARK.agc:48
//
// PORT: SOURCE AOTMARK.agc:49
//		CAF	BIT2		# NO -- DISALLOW SOME EXTENDED VERB ACTION
// PORT: Fixed ROM slots 9226.
                    if slot <> 9226 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:50
//		ADS	EXTVBACT	# BIT2 RESET IN ENDMARK
// PORT: Fixed ROM slots 9227.
                    if slot <> 9227 or instruction <> 11812 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 548).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9228 {
// PORT: SOURCE AOTMARK.agc:51
//MKVAC		CCS	VAC1USE		# LOOK FOR A VAC AREAD -- DO ABORT IF
// PORT: Fixed ROM slots 9228.
                    if slot <> 9228 or instruction <> 4352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 256).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9229 {
// PORT: SOURCE AOTMARK.agc:52
//		TCF	MKVACFND	# NONE AVAILABLE
// PORT: Fixed ROM slots 9229.
                        if slot <> 9229 or instruction <> 5145 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5145, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:53
//		CCS	VAC2USE
// PORT: Fixed ROM slots 9230.
                        if slot <> 9230 or instruction <> 4396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 300).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9234 {
            if slot <= 9232 {
                if slot <= 9231 {
// PORT: SOURCE AOTMARK.agc:54
//		TCF	MKVACFND
// PORT: Fixed ROM slots 9231.
                    if slot <> 9231 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:55
//		CCS	VAC3USE
// PORT: Fixed ROM slots 9232.
                    if slot <> 9232 or instruction <> 4440 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 344).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9233 {
// PORT: SOURCE AOTMARK.agc:56
//		TCF	MKVACFND
// PORT: Fixed ROM slots 9233.
                    if slot <> 9233 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:57
//		CCS	VAC4USE
// PORT: Fixed ROM slots 9234.
                    if slot <> 9234 or instruction <> 4484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 388).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9236 {
                if slot <= 9235 {
// PORT: SOURCE AOTMARK.agc:58
//		TCF	MKVACFND
// PORT: Fixed ROM slots 9235.
                    if slot <> 9235 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:59
//		CCS	VAC5USE
// PORT: Fixed ROM slots 9236.
                    if slot <> 9236 or instruction <> 4528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 432).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9237 {
// PORT: SOURCE AOTMARK.agc:60
//		TCF	MKVACFND
// PORT: Fixed ROM slots 9237.
                    if slot <> 9237 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9238 {
// PORT: SOURCE AOTMARK.agc:61
//		DXCH	BUF2
// PORT: Fixed ROM slots 9238.
                        if slot <> 9238 or instruction <> 21596 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:62
//		TC	BAILOUT1	# ALL VAC AREAS OCCUPIED -- ABORT.
// PORT: Fixed ROM slots 9239.
                        if slot <> 9239 or instruction <> 3022 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3022, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[546] to agcAotUnit546@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:63
//		OCT	01207
// PORT: Fixed ROM slots 9240.
    9240, 1294
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9241–9244.
function agcAotUnit547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9242 {
        if slot <= 9241 {
// PORT: SOURCE AOTMARK.agc:64
//
// PORT: SOURCE AOTMARK.agc:65
//MKVACFND	AD	TWO
// PORT: Fixed ROM slots 9241.
            if slot <> 9241 or instruction <> 27114 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:66
//		TS	MARKSTAT        # STORE VAC ADR IN LOW 9 OF MARKSTAT
// PORT: Fixed ROM slots 9242.
            if slot <> 9242 or instruction <> 23242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23242, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9243 {
// PORT: SOURCE AOTMARK.agc:67
//
// PORT: SOURCE AOTMARK.agc:68
//		CAF	ZERO
// PORT: Fixed ROM slots 9243.
            if slot <> 9243 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:69
//		INDEX	MARKSTAT
// PORT: Fixed ROM slots 9244.
            if slot <> 9244 or instruction <> 21194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21194, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21194, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[547] to agcAotUnit547@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:70
//		TS	0 -1		# ZERO IN VACUSE REG TO SHOW VAC OCCUPIED
// PORT: Fixed ROM slots 9245.
    9245, 45054
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9246–9247.
function agcAotUnit548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9246 {
// PORT: SOURCE AOTMARK.agc:71
//
// PORT: SOURCE AOTMARK.agc:72
//		CAF	PRIO15
// PORT: Fixed ROM slots 9246.
        if slot <> 9246 or instruction <> 14869 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:73
//		TC	FINDVAC		# SET UP JOB FOR GETDAT
// PORT: Fixed ROM slots 9247.
        if slot <> 9247 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[548] to agcAotUnit548@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:74
//		EBANK=	XYMARK
// PORT: SOURCE AOTMARK.agc:75
//		2CADR	GETDAT
// PORT: Fixed ROM slots 9248 9249.
    9248, 2150, 9249, 14446
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9250–9253.
function agcAotUnit549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9251 {
        if slot <= 9250 {
// PORT: SOURCE AOTMARK.agc:76
//
// PORT: SOURCE AOTMARK.agc:77
//		RELINT
// PORT: Fixed ROM slots 9250.
            if slot <> 9250 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:78
//		TCF	SWRETURN
// PORT: Fixed ROM slots 9251.
            if slot <> 9251 or instruction <> 6553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6553, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9252 {
// PORT: SOURCE AOTMARK.agc:79
//# Page 245
// PORT: SOURCE AOTMARK.agc:80
//MKABORT		DXCH	BUF2
// PORT: Fixed ROM slots 9252.
            if slot <> 9252 or instruction <> 21596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:81
//		TC	BAILOUT1	# CONFLICT WITH EXTENDED VERB
// PORT: Fixed ROM slots 9253.
            if slot <> 9253 or instruction <> 3022 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3022, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[549] to agcAotUnit549@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:82
//		OCT	01211
// PORT: Fixed ROM slots 9254.
    9254, 1298
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9255–9259.
function agcAotUnit550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9256 {
        if slot <= 9255 {
// PORT: SOURCE AOTMARK.agc:83
//
// PORT: SOURCE AOTMARK.agc:84
//MKRELEAS	CAF	ZERO
// PORT: Fixed ROM slots 9255.
            if slot <> 9255 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:85
//		XCH	MARKSTAT	# SET MARKSTAT TO ZERO
// PORT: Fixed ROM slots 9256.
            if slot <> 9256 or instruction <> 24266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 714, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9257 {
// PORT: SOURCE AOTMARK.agc:86
//		MASK	LOW9		# PICK UP VAC AREA AOR
// PORT: Fixed ROM slots 9257.
            if slot <> 9257 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 9258 {
// PORT: SOURCE AOTMARK.agc:87
//		CCS	A
// PORT: Fixed ROM slots 9258.
                if slot <> 9258 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:88
//		INDEX	A
// PORT: Fixed ROM slots 9259.
                if slot <> 9259 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[550] to agcAotUnit550@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:89
//		TS	0		# SHOW MKVAC AREA AVAILABLE
// PORT: Fixed ROM slots 9260.
    9260, 45056
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9261–9262.
function agcAotUnit551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9261 {
// PORT: SOURCE AOTMARK.agc:90
//		CAF	ONE
// PORT: Fixed ROM slots 9261.
        if slot <> 9261 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:91
//		TC	IBNKCALL
// PORT: Fixed ROM slots 9262.
        if slot <> 9262 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[551] to agcAotUnit551@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:92
//		CADR	GOODEND		# GO WAKE UP CALLING JOB
// PORT: Fixed ROM slots 9263.
    9263, 16234
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9264–9271.
function agcAotUnit552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9267 {
        if slot <= 9265 {
            if slot <= 9264 {
// PORT: SOURCE AOTMARK.agc:93
//
// PORT: SOURCE AOTMARK.agc:94
//# Page 246
// PORT: SOURCE AOTMARK.agc:95
//KILLAOT		CAF	ZERO
// PORT: Fixed ROM slots 9264.
                if slot <> 9264 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:96
//		TS	EXTVBACT	# TERMINATE AOTMARK -- ALLOW EXT VERB
// PORT: Fixed ROM slots 9265.
                if slot <> 9265 or instruction <> 23076 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9266 {
// PORT: SOURCE AOTMARK.agc:97
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 9266.
                if slot <> 9266 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:98
//GETDAT		CS	MARKSTAT	# SET BIT12 TO DISCOURAGE MARKRUPT
// PORT: Fixed ROM slots 9267.
                if slot <> 9267 or instruction <> 17098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 714).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9269 {
            if slot <= 9268 {
// PORT: SOURCE AOTMARK.agc:99
//		MASK	BIT12		#	BIT12 RESET AT GETMARK
// PORT: Fixed ROM slots 9268.
                if slot <> 9268 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
            } else {
// PORT: SOURCE AOTMARK.agc:100
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9269.
                if slot <> 9269 or instruction <> 11978 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 714).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9270 {
// PORT: SOURCE AOTMARK.agc:101
//
// PORT: SOURCE AOTMARK.agc:102
//		CAF	V01N71		# DISPLAY DETENT AND STAR CODE
// PORT: Fixed ROM slots 9270.
                if slot <> 9270 or instruction <> 13528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1240), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:103
//		TC	BANKCALL
// PORT: Fixed ROM slots 9271.
                if slot <> 9271 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[552] to agcAotUnit552@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:104
//		CADR	GOMARKF
// PORT: Fixed ROM slots 9272.
    9272, 16824
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9273–9288.
function agcAotUnit553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9280 {
        if slot <= 9276 {
            if slot <= 9274 {
                if slot <= 9273 {
// PORT: SOURCE AOTMARK.agc:105
//
// PORT: SOURCE AOTMARK.agc:106
//		TCF	KILLAOT		# V34 -- DOES GOTOPOOH
// PORT: Fixed ROM slots 9273.
                    if slot <> 9273 or instruction <> 5168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5168, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:107
//		TCF	DODAT		# V33 -- PROCEED -- USE THIS STAR FOR MARKS
// PORT: Fixed ROM slots 9274.
                    if slot <> 9274 or instruction <> 5180 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5180, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9275 {
// PORT: SOURCE AOTMARK.agc:108
//ENTERDAT	TCF	GETDAT		# ENTER -- REDISPLAY STAR CODE
// PORT: Fixed ROM slots 9275.
                    if slot <> 9275 or instruction <> 5171 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5171, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:109
//
// PORT: SOURCE AOTMARK.agc:110
//DODAT		CAF	HIGH9		# PICK DETENT CODE FROM BITS7-9 OF AOTCODE
// PORT: Fixed ROM slots 9276.
                    if slot <> 9276 or instruction <> 16356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9278 {
                if slot <= 9277 {
// PORT: SOURCE AOTMARK.agc:111
//		MASK	AOTCODE		# AND SEE IF CODE 1 TO 6
// PORT: Fixed ROM slots 9277.
                    if slot <> 9277 or instruction <> 29149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 477).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:112
//		EXTEND
// PORT: Fixed ROM slots 9278.
                    if slot <> 9278 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9279 {
// PORT: SOURCE AOTMARK.agc:113
//		MP	BIT9
// PORT: Fixed ROM slots 9279.
                    if slot <> 9279 or instruction <> 31203 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:114
//		TS	XYMARK		# STORE DETENT
// PORT: Fixed ROM slots 9280.
                    if slot <> 9280 or instruction <> 23401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23401, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9284 {
            if slot <= 9282 {
                if slot <= 9281 {
// PORT: SOURCE AOTMARK.agc:115
//
// PORT: SOURCE AOTMARK.agc:116
//		EXTEND
// PORT: Fixed ROM slots 9281.
                    if slot <> 9281 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:117
//		BZMF	GETDAT		# COAS CALIBRATION CODE - NO GOOD HERE
// PORT: Fixed ROM slots 9282.
                    if slot <> 9282 or instruction <> 25651 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25651, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9283 {
// PORT: SOURCE AOTMARK.agc:118
//
// PORT: SOURCE AOTMARK.agc:119
//		AD	NEG7		# SEE IF DETENT 7 FOR COAS
// PORT: Fixed ROM slots 9283.
                    if slot <> 9283 or instruction <> 27568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2992), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:120
//		EXTEND
// PORT: Fixed ROM slots 9284.
                    if slot <> 9284 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9286 {
                if slot <= 9285 {
// PORT: SOURCE AOTMARK.agc:121
//		BZF	CODE7
// PORT: Fixed ROM slots 9285.
                    if slot <> 9285 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:122
//
// PORT: SOURCE AOTMARK.agc:123
//		TCF	CODE1TO6
// PORT: Fixed ROM slots 9286.
                    if slot <> 9286 or instruction <> 5203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5203, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9287 {
// PORT: SOURCE AOTMARK.agc:124
//
// PORT: SOURCE AOTMARK.agc:125
//CODE7		CAF	V06N87*		# CODE 7, COAS SIGHTING, GET OPTIC AXIS
// PORT: Fixed ROM slots 9287.
                    if slot <> 9287 or instruction <> 13529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1241), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:126
//		TC	BANKCALL	# AZ AND EL OF SIGHTING DEVICE FROM ASTRO
// PORT: Fixed ROM slots 9288.
                    if slot <> 9288 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[553] to agcAotUnit553@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:127
//		CADR	GOMARKF
// PORT: Fixed ROM slots 9289.
    9289, 16824
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9290–9295.
function agcAotUnit554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9292 {
        if slot <= 9290 {
// PORT: SOURCE AOTMARK.agc:128
//
// PORT: SOURCE AOTMARK.agc:129
//		TCF	KILLAOT		# V34 -- DOES GOTOPOOH
// PORT: Fixed ROM slots 9290.
            if slot <> 9290 or instruction <> 5168 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5168, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9291 {
// PORT: SOURCE AOTMARK.agc:130
//		TCF	+2		# PROCEED
// PORT: Fixed ROM slots 9291.
                if slot <> 9291 or instruction <> 5197 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5197, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:131
//		TCF	CODE7		# ON ENTER, RECYCLE
// PORT: Fixed ROM slots 9292.
                if slot <> 9292 or instruction <> 5191 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5191, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9293 {
// PORT: SOURCE AOTMARK.agc:132
//		EXTEND
// PORT: Fixed ROM slots 9293.
            if slot <> 9293 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9294 {
// PORT: SOURCE AOTMARK.agc:133
//		DCA	AZ		# PICK UP AZ AND EL IN SP 25 COMP
// PORT: Fixed ROM slots 9294.
                if slot <> 9294 or instruction <> 13032 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 744, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:134
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 9295.
                if slot <> 9295 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[554] to agcAotUnit554@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:135
//		DXCH	8D		# STORE IN 8D AND 9D OF LOCAL VAC
// PORT: Fixed ROM slots 9296.
    9296, 43026
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9297–9299.
function agcAotUnit555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9297 {
// PORT: SOURCE AOTMARK.agc:136
//		CAF	ZERO		# BACKUP SYSTEM TO BE USED
// PORT: Fixed ROM slots 9297.
        if slot <> 9297 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9298 {
// PORT: SOURCE AOTMARK.agc:137
//		TCF	COASCODE	# ZERO APPARENT ROTATION
// PORT: Fixed ROM slots 9298.
            if slot <> 9298 or instruction <> 5215 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5215, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:138
//
// PORT: SOURCE AOTMARK.agc:139
//CODE1TO6	INDEX	XYMARK		# INDEX AOT POSITION BY DET CODE
// PORT: Fixed ROM slots 9299.
            if slot <> 9299 or instruction <> 21353 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21353, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21353, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[555] to agcAotUnit555@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:140
//		CA	AOTEL -1
// PORT: Fixed ROM slots 9300.
    9300, 26130
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9301–9301.
function agcAotUnit556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:141
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 9301.
    if slot <> 9301 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[556] to agcAotUnit556@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:142
//		TS	9D		# STORE ELEVATION IN VAC+9D
// PORT: Fixed ROM slots 9302.
    9302, 45074
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9303–9303.
function agcAotUnit557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:143
//
// PORT: SOURCE AOTMARK.agc:144
//		INDEX	XYMARK		# INDEX DET CODE 1,2 OR 3
// PORT: Fixed ROM slots 9303.
    if slot <> 9303 or instruction <> 21353 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21353, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21353, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[557] to agcAotUnit557@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:145
//# Page 247
// PORT: SOURCE AOTMARK.agc:146
//		CA	AOTAZ -1
// PORT: Fixed ROM slots 9304.
    9304, 26118
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9305–9305.
function agcAotUnit558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:147
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 9305.
    if slot <> 9305 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[558] to agcAotUnit558@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:148
//		TS	8D		# STORE AZIMUTH IN VAC +8D
// PORT: Fixed ROM slots 9306.
    9306, 45072
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9307–9309.
function agcAotUnit559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9307 {
// PORT: SOURCE AOTMARK.agc:149
//
// PORT: SOURCE AOTMARK.agc:150
//		CA	AOTAZ +1	# COMPENSATION FOR APPARENT ROTATION OF
// PORT: Fixed ROM slots 9307.
        if slot <> 9307 or instruction <> 13061 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 773).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9308 {
// PORT: SOURCE AOTMARK.agc:151
//		EXTEND			# AOT FIELD OF VIEW IN LEFT AND RIGHT
// PORT: Fixed ROM slots 9308.
            if slot <> 9308 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:152
//		INDEX	FIXLOC		# DETENTS IS STORED IN VAC +10D IN SP
// PORT: Fixed ROM slots 9309.
            if slot <> 9309 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[559] to agcAotUnit559@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:153
//		MSU	8D		# PRECISION ONE'S COMPLEMENT
// PORT: Fixed ROM slots 9310.
    9310, 16400
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9311–9311.
function agcAotUnit560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:154
//COASCODE	INDEX	FIXLOC
// PORT: Fixed ROM slots 9311.
    if slot <> 9311 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[560] to agcAotUnit560@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:155
//		TS	10D		# ROT ANGLE
// PORT: Fixed ROM slots 9312.
    9312, 45076
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9313–9313.
function agcAotUnit561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:156
//
// PORT: SOURCE AOTMARK.agc:157
//		TC	INTPRET		# COMPUTE X AND Y PLANE VECTORS
// PORT: Fixed ROM slots 9313.
    if slot <> 9313 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[561] to agcAotUnit561@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:158
//
// PORT: SOURCE AOTMARK.agc:159
//# Page 248
// PORT: SOURCE AOTMARK.agc:160
//# THE OPTAXIS SUBROUTINE COMPUTES THE X AND Y MARK PLANE VECS AND
// PORT: SOURCE AOTMARK.agc:161
//# ROTATES THEM THRU THE APPARENT FIELD OF VIEW ROTATION UNIQUE TO AOT
// PORT: SOURCE AOTMARK.agc:162
//# OPTAXIS USES OANB TO COMPUTE THE OPTIC AXIS
// PORT: SOURCE AOTMARK.agc:163
//#
// PORT: SOURCE AOTMARK.agc:164
//#	INPUT --	AZIMUTH ANGLE IN SINGLE PREC AT CDU SCALE IN 8D OF JOB VAC
// PORT: SOURCE AOTMARK.agc:165
//#			ELEVATION ANGLE IN SINGLE PREC AT CDU SCALE IN 9D OF JOB VAC
// PORT: SOURCE AOTMARK.agc:166
//#			ROTATION ANGLE IN SINGLE PREC IS COMP SCALED BY PI IN 10D OF VAC
// PORT: SOURCE AOTMARK.agc:167
//#
// PORT: SOURCE AOTMARK.agc:168
//#	OUTPUT --	OPTIC AXIS VEC IN NG COORDS IN SCAXIS
// PORT: SOURCE AOTMARK.agc:169
//#			X-MARK PLANE 1/4VEC IN NB COORDS AT 18D OF JOB VAC
// PORT: SOURCE AOTMARK.agc:170
//#			Y-MARK PLANE 1/4VEC IN NB COORDS AT 12D OF JOB VAC
// PORT: SOURCE AOTMARK.agc:171
//
// PORT: SOURCE AOTMARK.agc:172
//OPTAXIS		CALL			# GO COMPUTE OA AN X AND Y PLANE VECS
// PORT: Fixed ROM slots 9314.
    9314, 65320,
// PORT: SOURCE AOTMARK.agc:173
//			OANB
// PORT: Fixed ROM slots 9315.
    9315, 8892,
// PORT: SOURCE AOTMARK.agc:174
//		SLOAD	SR1		# LOAD APP ROTATION IN ONES COMP
// PORT: Fixed ROM slots 9316.
    9316, 58042,
// PORT: SOURCE AOTMARK.agc:175
//			10D		# RESCALE BY 2PI
// PORT: Fixed ROM slots 9317.
    9317, 22,
// PORT: SOURCE AOTMARK.agc:176
//		PUSH	SIN		# 1/2SIN(ROT) 0-1
// PORT: Fixed ROM slots 9318.
    9318, 60940,
// PORT: SOURCE AOTMARK.agc:177
//		PDDL	COS
// PORT: Fixed ROM slots 9319.
    9319, 59050,
// PORT: SOURCE AOTMARK.agc:178
//		PUSH	VXSC		# 1/2COS(ROT) 2-3
// PORT: Fixed ROM slots 9320.
    9320, 61708,
// PORT: SOURCE AOTMARK.agc:179
//			18D
// PORT: Fixed ROM slots 9321.
    9321, 38,
// PORT: SOURCE AOTMARK.agc:180
//		PDDL	VXSC		# 1/4COS(ROT)UYP 4-9
// PORT: Fixed ROM slots 9322.
    9322, 61866,
// PORT: SOURCE AOTMARK.agc:181
//			0
// PORT: Fixed ROM slots 9323.
    9323, 2,
// PORT: SOURCE AOTMARK.agc:182
//			24D		# 1/4SIN(ROT)UXP
// PORT: Fixed ROM slots 9324.
    9324, 50,
// PORT: SOURCE AOTMARK.agc:183
//		BVSU	STADR		# UP 4-9
// PORT: Fixed ROM slots 9325.
    9325, 38474,
// PORT: SOURCE AOTMARK.agc:184
//		STODL	12D		# YPNB=1/4(COS(ROT)UYP-SIN(ROT)UXP)
// PORT: Fixed ROM slots 9326.
    9326, 53220,
// PORT: SOURCE AOTMARK.agc:185
//		VXSC	PDDL		# UP 2-3 UP 0-1 FOR EXCHANGE
// PORT: Fixed ROM slots 9327.
    9327, 54754,
// PORT: SOURCE AOTMARK.agc:186
//			24D		# 1/4COS(ROT)UXP 	PUSH 0-5
// PORT: Fixed ROM slots 9328.
    9328, 50,
// PORT: SOURCE AOTMARK.agc:187
//		VXSC	VAD		# 1/4SIN(ROT)UYP
// PORT: Fixed ROM slots 9329.
    9329, 44514,
// PORT: SOURCE AOTMARK.agc:188
//			18D		# UP 0-5
// PORT: Fixed ROM slots 9330.
    9330, 38,
// PORT: SOURCE AOTMARK.agc:189
//		STADR
// PORT: Fixed ROM slots 9331.
    9331, 65324,
// PORT: SOURCE AOTMARK.agc:190
//		STOVL	18D		# XPNB=1/4(COS(ROT)UXP+SIN(ROT)UYP)
// PORT: Fixed ROM slots 9332.
    9332, 45016,
// PORT: SOURCE AOTMARK.agc:191
//			LO6ZEROS	# INITIALIZE AVE STAR VEC ACCUMULATOR
// PORT: Fixed ROM slots 9333.
    9333, 20494,
// PORT: SOURCE AOTMARK.agc:192
//		STORE	STARAD +6
// PORT: Fixed ROM slots 9334.
    9334, 2970,
// PORT: SOURCE AOTMARK.agc:193
//		EXIT
// PORT: Fixed ROM slots 9335.
    9335, 65532
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9336–9336.
function agcAotUnit562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:194
//		TCF	GETMKS
// PORT: Fixed ROM slots 9336.
    if slot <> 9336 or instruction <> 5250 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5250, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[562] to agcAotUnit562@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:195
//
// PORT: SOURCE AOTMARK.agc:196
//# Page 249
// PORT: SOURCE AOTMARK.agc:197
//# THE OANB SUBROUTINE COMPUTES THE OPTIC AXIS OF THE SIGHTING INSTRUMENT
// PORT: SOURCE AOTMARK.agc:198
//# FROM AZIMUTH AND ELEVATION INPUT FROM THE ASTRONAUT.
// PORT: SOURCE AOTMARK.agc:199
//#
// PORT: SOURCE AOTMARK.agc:200
//#	INPUT --	AZIMUTH ANGLE IN SINGLE PREC 2'S COMP IN 8D OF JOB VAC
// PORT: SOURCE AOTMARK.agc:201
//#			ELEVATION ANGLE IN SINGLE PREC 2'S COMP IN 9D OF VAC
// PORT: SOURCE AOTMARK.agc:202
//#
// PORT: SOURCE AOTMARK.agc:203
//#	OUTPUT --	OPTIC AXIS IN NB COORDS. IN SCAXIS
// PORT: SOURCE AOTMARK.agc:204
//#			X-PLANE 1/2VEC IN NB COORDS AT 24D OF VAC
// PORT: SOURCE AOTMARK.agc:205
//#			Y-PLANE 1/2VEC IN NB COORDS AT 18D OF VAC
// PORT: SOURCE AOTMARK.agc:206
//
// PORT: SOURCE AOTMARK.agc:207
//		BANK	05
// PORT: SOURCE AOTMARK.agc:208
//		SETLOC	AOTMARK2
// PORT: SOURCE AOTMARK.agc:209
//		BANK
// PORT: SOURCE AOTMARK.agc:210
//
// PORT: SOURCE AOTMARK.agc:211
//		COUNT*	$$/MARK
// PORT: SOURCE AOTMARK.agc:212
//
// PORT: SOURCE AOTMARK.agc:213
//OANB		SETPD	STQ
// PORT: Fixed ROM slots 6494.
    6494, 36866,
// PORT: SOURCE AOTMARK.agc:214
//			0
// PORT: Fixed ROM slots 6495.
    6495, 2,
// PORT: SOURCE AOTMARK.agc:215
//			GCTR		# STORE RETURN
// PORT: Fixed ROM slots 6496.
    6496, 3004,
// PORT: SOURCE AOTMARK.agc:216
//		SLOAD	RTB
// PORT: Fixed ROM slots 6497.
    6497, 40122,
// PORT: SOURCE AOTMARK.agc:217
//			9D		# PICK UP SP ELV
// PORT: Fixed ROM slots 6498.
    6498, 20,
// PORT: SOURCE AOTMARK.agc:218
//			CDULOGIC
// PORT: Fixed ROM slots 6499.
    6499, 18172,
// PORT: SOURCE AOTMARK.agc:219
//		PUSH	COS
// PORT: Fixed ROM slots 6500.
    6500, 58892,
// PORT: SOURCE AOTMARK.agc:220
//		PDDL	SIN		# 1/2COS(ELV)	PD 0-1
// PORT: Fixed ROM slots 6501.
    6501, 61098,
// PORT: SOURCE AOTMARK.agc:221
//		STADR
// PORT: Fixed ROM slots 6502.
    6502, 65324,
// PORT: SOURCE AOTMARK.agc:222
//		STODL	SCAXIS		# OAX=1/2SIN(ELV)
// PORT: Fixed ROM slots 6503.
    6503, 49172,
// PORT: SOURCE AOTMARK.agc:223
//			8D
// PORT: Fixed ROM slots 6504.
    6504, 18,
// PORT: SOURCE AOTMARK.agc:224
//		RTB
// PORT: Fixed ROM slots 6505.
    6505, 65336,
// PORT: SOURCE AOTMARK.agc:225
//			CDULOGIC
// PORT: Fixed ROM slots 6506.
    6506, 18172,
// PORT: SOURCE AOTMARK.agc:226
//		PUSH	COS
// PORT: Fixed ROM slots 6507.
    6507, 58892,
// PORT: SOURCE AOTMARK.agc:227
//		STORE	20D		# STORE UYP(Y) 	20-21
// PORT: Fixed ROM slots 6508.
    6508, 42,
// PORT: SOURCE AOTMARK.agc:228
//		PDDL	SIN		# 1/2COS(AZ) 	PD 2-3
// PORT: Fixed ROM slots 6509.
    6509, 61098,
// PORT: SOURCE AOTMARK.agc:229
//		PUSH	DCOMP		# PUSH 1/2S IN (AZ)	4-5
// PORT: Fixed ROM slots 6510.
    6510, 48652,
// PORT: SOURCE AOTMARK.agc:230
//		STODL	22D		# STORE UYP(Z)	22-23
// PORT: Fixed ROM slots 6511.
    6511, 12334,
// PORT: SOURCE AOTMARK.agc:231
//			LO6ZEROS
// PORT: Fixed ROM slots 6512.
    6512, 20494,
// PORT: SOURCE AOTMARK.agc:232
//		STODL	18D		# STORE UYP(X)	18-19
// PORT: Fixed ROM slots 6513.
    6513, 12326,
// PORT: SOURCE AOTMARK.agc:233
//		DMP	SL1
// PORT: Fixed ROM slots 6514.
    6514, 59914,
// PORT: SOURCE AOTMARK.agc:234
//			0
// PORT: Fixed ROM slots 6515.
    6515, 2,
// PORT: SOURCE AOTMARK.agc:235
//		STODL	SCAXIS +2	# OAY=1/2COS(ELV)SIN(AZ)
// PORT: Fixed ROM slots 6516.
    6516, 16366,
// PORT: SOURCE AOTMARK.agc:236
//		DMP	SL1		# UP	2-3
// PORT: Fixed ROM slots 6517.
    6517, 59914,
// PORT: SOURCE AOTMARK.agc:237
//		STADR			# UP	0-1
// PORT: Fixed ROM slots 6518.
    6518, 65324,
// PORT: SOURCE AOTMARK.agc:238
//		STOVL	SCAXIS +4	# OAZ=1/2COS(ELV)COS(AZ)
// PORT: Fixed ROM slots 6519.
    6519, 40972,
// PORT: SOURCE AOTMARK.agc:239
//			18D		# LOAD UYP VEC
// PORT: Fixed ROM slots 6520.
    6520, 38,
// PORT: SOURCE AOTMARK.agc:240
//		VXV	UNIT
// PORT: Fixed ROM slots 6521.
    6521, 44602,
// PORT: SOURCE AOTMARK.agc:241
//			SCAXIS		# UXP VEC=UYP X OA
// PORT: Fixed ROM slots 6522.
    6522, 4074,
// PORT: SOURCE AOTMARK.agc:242
//		STORE	24D		# STORE UXP
// PORT: Fixed ROM slots 6523.
    6523, 50,
// PORT: SOURCE AOTMARK.agc:243
//		GOTO
// PORT: Fixed ROM slots 6524.
    6524, 65360,
// PORT: SOURCE AOTMARK.agc:244
//			GCTR
// PORT: Fixed ROM slots 6525.
    6525, 3004,
// PORT: SOURCE AOTMARK.agc:245
//# Page 250
// PORT: SOURCE AOTMARK.agc:246
//# SURFSTAR COMPUTES A STAR VECTOR IN SM COORDINATES FOR LUNAR
// PORT: SOURCE AOTMARK.agc:247
//# SURFACE ALIGNMENT AND EXITS TO AVEIT TO AVERAGE STAR VECTORS.
// PORT: SOURCE AOTMARK.agc:248
//#
// PORT: SOURCE AOTMARK.agc:249
//#	GIVEN	X-MARK PLANE 1/4 VEC IN NB AT 18D OF LOCAL VAC
// PORT: SOURCE AOTMARK.agc:250
//#		Y-MARK PLANE 1/4 VEC IN NB AT 12D OF LOCAL VAC
// PORT: SOURCE AOTMARK.agc:251
//#		CURSOR SP 2COMP AT POSITION 1 OF INDEXED MARKVAC
// PORT: SOURCE AOTMARK.agc:252
//#		SPIRAL SP 2COMP AT POSITION 3 OF INDEXED MARKVAC
// PORT: SOURCE AOTMARK.agc:253
//#		CDUY,Z,X AT POSITIONS 0,2,4 OF INDEXED MARKVAC
// PORT: SOURCE AOTMARK.agc:254
//
// PORT: SOURCE AOTMARK.agc:255
//		BANK	15
// PORT: SOURCE AOTMARK.agc:256
//		SETLOC	P50S
// PORT: SOURCE AOTMARK.agc:257
//		BANK
// PORT: SOURCE AOTMARK.agc:258
//		COUNT*	$$/R59
// PORT: SOURCE AOTMARK.agc:259
//
// PORT: SOURCE AOTMARK.agc:260
//SURFSTAR	VLOAD*
// PORT: Fixed ROM slots 15360.
    15360, 65526,
// PORT: SOURCE AOTMARK.agc:261
//			0,1		# PUT X-MARK CDUS IN CDUSPOT FOR TRG*NBSM
// PORT: Fixed ROM slots 15361.
    15361, 2,
// PORT: SOURCE AOTMARK.agc:262
//		STORE	CDUSPOT
// PORT: Fixed ROM slots 15362.
    15362, 1006,
// PORT: SOURCE AOTMARK.agc:263
//		SLOAD*	RTB
// PORT: Fixed ROM slots 15363.
    15363, 40118,
// PORT: SOURCE AOTMARK.agc:264
//			1,1		# PICK UP YROT
// PORT: Fixed ROM slots 15364.
    15364, 4,
// PORT: SOURCE AOTMARK.agc:265
//			CDULOGIC
// PORT: Fixed ROM slots 15365.
    15365, 18172,
// PORT: SOURCE AOTMARK.agc:266
//		STORE	24D		# STORE CURSOR FOR SPIRAL COMP (REVS)
// PORT: Fixed ROM slots 15366.
    15366, 50,
// PORT: SOURCE AOTMARK.agc:267
//		BZE
// PORT: Fixed ROM slots 15367.
    15367, 65368,
// PORT: SOURCE AOTMARK.agc:268
//			YZCHK		# IF YROT ZERO -- SEE IF SROT ZERO
// PORT: Fixed ROM slots 15368.
    15368, 14578,
// PORT: SOURCE AOTMARK.agc:269
//JUSTZY		PUSH	COS
// PORT: Fixed ROM slots 15369.
    15369, 58892,
// PORT: SOURCE AOTMARK.agc:270
//		PDDL	SIN		# 1/2COS(YROT) 	0-1
// PORT: Fixed ROM slots 15370.
    15370, 61098,
// PORT: SOURCE AOTMARK.agc:271
//		VXSC	PDDL		# UP 0-1	1/8SIN(YROT)UXP	0-5
// PORT: Fixed ROM slots 15371.
    15371, 54754,
// PORT: SOURCE AOTMARK.agc:272
//			18D
// PORT: Fixed ROM slots 15372.
    15372, 38,
// PORT: SOURCE AOTMARK.agc:273
//		VXSC	VSU		# UP 	0-5
// PORT: Fixed ROM slots 15373.
    15373, 43490,
// PORT: SOURCE AOTMARK.agc:274
//			12D		# UYP
// PORT: Fixed ROM slots 15374.
    15374, 26,
// PORT: SOURCE AOTMARK.agc:275
//		UNIT	VXV
// PORT: Fixed ROM slots 15375.
    15375, 40284,
// PORT: SOURCE AOTMARK.agc:276
//			SCAXIS
// PORT: Fixed ROM slots 15376.
    15376, 4074,
// PORT: SOURCE AOTMARK.agc:277
//		UNIT	PUSH
// PORT: Fixed ROM slots 15377.
    15377, 34396,
// PORT: SOURCE AOTMARK.agc:278
//		SLOAD*	RTB
// PORT: Fixed ROM slots 15378.
    15378, 40118,
// PORT: SOURCE AOTMARK.agc:279
//			3,1		# PICK UP SPIRAL
// PORT: Fixed ROM slots 15379.
    15379, 8,
// PORT: SOURCE AOTMARK.agc:280
//			CDULOGIC
// PORT: Fixed ROM slots 15380.
    15380, 18172,
// PORT: SOURCE AOTMARK.agc:281
//		STORE	26D		# STORE SPIRAL (REVS)
// PORT: Fixed ROM slots 15381.
    15381, 54,
// PORT: SOURCE AOTMARK.agc:282
//		DSU	DAD
// PORT: Fixed ROM slots 15382.
    15382, 36138,
// PORT: SOURCE AOTMARK.agc:283
//			24D
// PORT: Fixed ROM slots 15383.
    15383, 50,
// PORT: SOURCE AOTMARK.agc:284
//			ABOUTONE
// PORT: Fixed ROM slots 15384.
    15384, 26702,
// PORT: SOURCE AOTMARK.agc:285
//		DMP
// PORT: Fixed ROM slots 15385.
    15385, 65290,
// PORT: SOURCE AOTMARK.agc:286
//			DP1/12
// PORT: Fixed ROM slots 15386.
    15386, 27244,
// PORT: SOURCE AOTMARK.agc:287
//		STORE	26D		# SEP=(360 + SPIRAL -CURSOR)/12
// PORT: Fixed ROM slots 15387.
    15387, 54,
// PORT: SOURCE AOTMARK.agc:288
//		SIN	VXSC		# UP	0-5
// PORT: Fixed ROM slots 15388.
    15388, 61916,
// PORT: SOURCE AOTMARK.agc:289
//		VSL1	PDDL		# 1/2SIN(SEP)(UPP X OA)	0-5
// PORT: Fixed ROM slots 15389.
    15389, 54772,
// PORT: SOURCE AOTMARK.agc:290
//			26D
// PORT: Fixed ROM slots 15390.
    15390, 54,
// PORT: SOURCE AOTMARK.agc:291
//		COS	VXSC
// PORT: Fixed ROM slots 15391.
    15391, 61900,
// PORT: SOURCE AOTMARK.agc:292
//			SCAXIS
// PORT: Fixed ROM slots 15392.
    15392, 4074,
// PORT: SOURCE AOTMARK.agc:293
//		VSL1	VAD		# UP	0-5
// PORT: Fixed ROM slots 15393.
    15393, 44532,
// PORT: SOURCE AOTMARK.agc:294
//JUSTOA		UNIT	CALL
// PORT: Fixed ROM slots 15394.
    15394, 37980,
// PORT: SOURCE AOTMARK.agc:295
//			TRG*NBSM
// PORT: Fixed ROM slots 15395.
    15395, 40808,
// PORT: SOURCE AOTMARK.agc:296
//		STCALL	24D		# STAR VEC IN SM
// PORT: Fixed ROM slots 15396.
    15396, 28722,
// PORT: SOURCE AOTMARK.agc:297
//			AVEIT		# GO AVERAGE
// PORT: Fixed ROM slots 15397.
    15397, 14716,
// PORT: SOURCE AOTMARK.agc:298
//# Page 251
// PORT: SOURCE AOTMARK.agc:299
//ABOUTONE	2DEC	.99999999
// PORT: Fixed ROM slots 15398 15399.
    15398, 32766, 15399, 32762,
// PORT: SOURCE AOTMARK.agc:300
//
// PORT: SOURCE AOTMARK.agc:301
//DP1/12		EQUALS	DEG30		# .08333333
// PORT: SOURCE AOTMARK.agc:302
//		BANK	7
// PORT: SOURCE AOTMARK.agc:303
//		SETLOC	AOTMARK1
// PORT: SOURCE AOTMARK.agc:304
//		BANK
// PORT: SOURCE AOTMARK.agc:305
//		COUNT*	$$/MARK
// PORT: SOURCE AOTMARK.agc:306
//YZCHK		SLOAD*	BZE		# YROT ZERO AND IF SROT ZERO FORCE STAR
// PORT: Fixed ROM slots 9337.
    9337, 44214,
// PORT: SOURCE AOTMARK.agc:307
//			3,1		# ALONG OPTIC AXIS
// PORT: Fixed ROM slots 9338.
    9338, 8,
// PORT: SOURCE AOTMARK.agc:308
//			YSZERO
// PORT: Fixed ROM slots 9339.
    9339, 14590,
// PORT: SOURCE AOTMARK.agc:309
//		DLOAD	GOTO
// PORT: Fixed ROM slots 9340.
    9340, 43210,
// PORT: SOURCE AOTMARK.agc:310
//			24D
// PORT: Fixed ROM slots 9341.
    9341, 50,
// PORT: SOURCE AOTMARK.agc:311
//			JUSTZY		# SROT NOT ZERO -- CONTINUE NORMALLY
// PORT: Fixed ROM slots 9342.
    9342, 26642,
// PORT: SOURCE AOTMARK.agc:312
//YSZERO		VLOAD	GOTO
// PORT: Fixed ROM slots 9343.
    9343, 43258,
// PORT: SOURCE AOTMARK.agc:313
//			SCAXIS
// PORT: Fixed ROM slots 9344.
    9344, 4074,
// PORT: SOURCE AOTMARK.agc:314
//			JUSTOA
// PORT: Fixed ROM slots 9345.
    9345, 26692
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9346–9353.
function agcAotUnit563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9349 {
        if slot <= 9347 {
            if slot <= 9346 {
// PORT: SOURCE AOTMARK.agc:315
//
// PORT: SOURCE AOTMARK.agc:316
//# Page 252
// PORT: SOURCE AOTMARK.agc:317
//# THE GETMKS ROUTINE INITIALIZES THE SIGHTING MARK PROCEDURE
// PORT: SOURCE AOTMARK.agc:318
//
// PORT: SOURCE AOTMARK.agc:319
//GETMKS		CAF	ZERO		# INITIALIZE MARK ID REGISTER AND MARK CNT
// PORT: Fixed ROM slots 9346.
                if slot <> 9346 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:320
//		TS	XYMARK
// PORT: Fixed ROM slots 9347.
                if slot <> 9347 or instruction <> 23401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23401, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9348 {
// PORT: SOURCE AOTMARK.agc:321
//		TS	MARKCNTR
// PORT: Fixed ROM slots 9348.
                if slot <> 9348 or instruction <> 23400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23400, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:322
//		CAF	LOW9		# ZERO BITS10 TO 15 RETAINING MKVAC ADR
// PORT: Fixed ROM slots 9349.
                if slot <> 9349 or instruction <> 14852 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9351 {
            if slot <= 9350 {
// PORT: SOURCE AOTMARK.agc:323
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9350.
                if slot <> 9350 or instruction <> 29386 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 714).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:324
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9351.
                if slot <> 9351 or instruction <> 23242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23242, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9352 {
// PORT: SOURCE AOTMARK.agc:325
//		CAF	MKVB54*		# DISPLAY VB54 INITIALLY
// PORT: Fixed ROM slots 9352.
                if slot <> 9352 or instruction <> 13713 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1425), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:326
//PASTIT		TC	BANKCALL
// PORT: Fixed ROM slots 9353.
                if slot <> 9353 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[563] to agcAotUnit563@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:327
//		CADR	GOMARK4
// PORT: Fixed ROM slots 9354.
    9354, 16842
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9355–9384.
function agcAotUnit564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9369 {
        if slot <= 9361 {
            if slot <= 9357 {
                if slot <= 9355 {
// PORT: SOURCE AOTMARK.agc:328
//
// PORT: SOURCE AOTMARK.agc:329
//		TCF	KILLAOT		# V34 -- DOES GOTOPOOH
// PORT: Fixed ROM slots 9355.
                    if slot <> 9355 or instruction <> 5168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5168, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9356 {
// PORT: SOURCE AOTMARK.agc:330
//		TCF	MARKCHEX	# VB33 -- PROCEED, GOT MARKS, COMPUTE LOS
// PORT: Fixed ROM slots 9356.
                        if slot <> 9356 or instruction <> 5262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5262, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:331
//		TCF	GETDAT		# ENTER -- RECYCLE TO V01N71
// PORT: Fixed ROM slots 9357.
                        if slot <> 9357 or instruction <> 5171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5171, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9359 {
                    if slot <= 9358 {
// PORT: SOURCE AOTMARK.agc:332
//
// PORT: SOURCE AOTMARK.agc:333
//MARKCHEX	CS	MARKSTAT	# SET BIT12 TO DISCOURAGE MARKRUPT
// PORT: Fixed ROM slots 9358.
                        if slot <> 9358 or instruction <> 17098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 714).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:334
//		MASK	BIT12
// PORT: Fixed ROM slots 9359.
                        if slot <> 9359 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
                    if slot <= 9360 {
// PORT: SOURCE AOTMARK.agc:335
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9360.
                        if slot <> 9360 or instruction <> 11978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:336
//		MASK	LOW9
// PORT: Fixed ROM slots 9361.
                        if slot <> 9361 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 9365 {
                if slot <= 9363 {
                    if slot <= 9362 {
// PORT: SOURCE AOTMARK.agc:337
//		TS	XYMARK		# JAM MARK VAC ADR IN XYMARK FOR AVESTAR
// PORT: Fixed ROM slots 9362.
                        if slot <> 9362 or instruction <> 23401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23401, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:338
//		CAF	ZERO
// PORT: Fixed ROM slots 9363.
                        if slot <> 9363 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 9364 {
// PORT: SOURCE AOTMARK.agc:339
//		TS	MKDEX		# SET MKDEX ZERO FOR LOS VEC CNTR
// PORT: Fixed ROM slots 9364.
                        if slot <> 9364 or instruction <> 23402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23402, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:340
//		CA	MARKSTAT
// PORT: Fixed ROM slots 9365.
                        if slot <> 9365 or instruction <> 13002 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9367 {
                    if slot <= 9366 {
// PORT: SOURCE AOTMARK.agc:341
//		MASK	PRIO3		# SEE IF LAST MK PART COMPLETE
// PORT: Fixed ROM slots 9366.
                        if slot <> 9366 or instruction <> 31245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            if fixedOperand = 1536 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 4) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:342
//		TS	L
// PORT: Fixed ROM slots 9367.
                        if slot <> 9367 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9368 {
// PORT: SOURCE AOTMARK.agc:343
//		CAF	PRIO3		# BITS10 AND 11
// PORT: Fixed ROM slots 9368.
                        if slot <> 9368 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:344
//		EXTEND
// PORT: Fixed ROM slots 9369.
                        if slot <> 9369 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 9376 {
            if slot <= 9372 {
                if slot <= 9370 {
// PORT: SOURCE AOTMARK.agc:345
//		RXOR	LCHAN
// PORT: Fixed ROM slots 9370.
                    if slot <> 9370 or instruction <> 3073 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9371 {
// PORT: SOURCE AOTMARK.agc:346
//		EXTEND
// PORT: Fixed ROM slots 9371.
                        if slot <> 9371 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:347
//		BZF	AVESTAR		# LAST PAIR COMPLETE -- TO COMPUTE LOS
// PORT: Fixed ROM slots 9372.
                        if slot <> 9372 or instruction <> 5281 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5281, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9374 {
                    if slot <= 9373 {
// PORT: SOURCE AOTMARK.agc:348
//CNTCHK		CCS	MARKCNTR	# NO PAIR SHOWING -- SEE IF PAIR IN HOLD
// PORT: Fixed ROM slots 9373.
                        if slot <> 9373 or instruction <> 4968 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 872).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:349
//		TCF	+2		# PAIR BURIED -- DECREMENT COUNTER
// PORT: Fixed ROM slots 9374.
                        if slot <> 9374 or instruction <> 5280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5280, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9375 {
// PORT: SOURCE AOTMARK.agc:350
//		TCF	MKALARM		# NO PAIR -- ALARM
// PORT: Fixed ROM slots 9375.
                        if slot <> 9375 or instruction <> 5333 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5333, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:351
//		TS	MARKCNTR	# STORE DECREMENTED COUNTER
// PORT: Fixed ROM slots 9376.
                        if slot <> 9376 or instruction <> 23400 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23400, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9380 {
                if slot <= 9378 {
                    if slot <= 9377 {
// PORT: SOURCE AOTMARK.agc:352
//
// PORT: SOURCE AOTMARK.agc:353
//AVESTAR		CAF	BIT12		# INITIALIZE MKDEX FOR STAR LOS COUNTER
// PORT: Fixed ROM slots 9377.
                        if slot <> 9377 or instruction <> 14816 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:354
//		ADS	MKDEX		# MKDEX WAS INITIALIZED ZERO IN MARKCHEX
// PORT: Fixed ROM slots 9378.
                        if slot <> 9378 or instruction <> 12138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 874).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9379 {
// PORT: SOURCE AOTMARK.agc:355
//		CS	MARKCNTR
// PORT: Fixed ROM slots 9379.
                        if slot <> 9379 or instruction <> 17256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 872).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:356
//		EXTEND
// PORT: Fixed ROM slots 9380.
                        if slot <> 9380 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9382 {
                    if slot <= 9381 {
// PORT: SOURCE AOTMARK.agc:357
//		MP	SIX		# GET C(L) = -6 MARKCNTR
// PORT: Fixed ROM slots 9381.
                        if slot <> 9381 or instruction <> 31906 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 3234, readEffective:call(words, 3234)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:358
//		CS	XYMARK
// PORT: Fixed ROM slots 9382.
                        if slot <> 9382 or instruction <> 17257 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 873).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9383 {
// PORT: SOURCE AOTMARK.agc:359
//		AD	L		# ADD -- MARK VAC ADR SET IN MARKCHEX
// PORT: Fixed ROM slots 9383.
                        if slot <> 9383 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:360
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 9384.
                        if slot <> 9384 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[564] to agcAotUnit564@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:361
//		TS	X1		# JAM -- CDU ADR OF X-MARK IN X1
// PORT: Fixed ROM slots 9385.
    9385, 45132
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9386–9388.
function agcAotUnit565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9386 {
// PORT: SOURCE AOTMARK.agc:362
//
// PORT: SOURCE AOTMARK.agc:363
//		CA	FIXLOC		# SET PD POINTER TO ZERO
// PORT: Fixed ROM slots 9386.
        if slot <> 9386 or instruction <> 12368 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 80).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 9387 {
// PORT: SOURCE AOTMARK.agc:364
//		TS	PUSHLOC
// PORT: Fixed ROM slots 9387.
            if slot <> 9387 or instruction <> 22646 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22646, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:365
//
// PORT: SOURCE AOTMARK.agc:366
//		TC	INTPRET
// PORT: Fixed ROM slots 9388.
            if slot <> 9388 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[565] to agcAotUnit565@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:367
//# Page 253
// PORT: SOURCE AOTMARK.agc:368
//		BON	VLOAD*
// PORT: Fixed ROM slots 9389.
    9389, 64280,
// PORT: SOURCE AOTMARK.agc:369
//			SURFFLAG	# IF ON SURFACE COMPUTE VEC AT SURFSTAR
// PORT: Fixed ROM slots 9390.
    9390, 4494,
// PORT: SOURCE AOTMARK.agc:370
//			SURFSTAR
// PORT: Fixed ROM slots 9391.
    9391, 26624,
// PORT: SOURCE AOTMARK.agc:371
//			1,1		# PUT Y-MARK CDUS IN CDUSPOT FOR TRG*NBSM
// PORT: Fixed ROM slots 9392.
    9392, 4,
// PORT: SOURCE AOTMARK.agc:372
//		STOVL	CDUSPOT
// PORT: Fixed ROM slots 9393.
    9393, 21486,
// PORT: SOURCE AOTMARK.agc:373
//			12D		# LOAD Y-PLANE VECTOR IN NG
// PORT: Fixed ROM slots 9394.
    9394, 26,
// PORT: SOURCE AOTMARK.agc:374
//		CALL
// PORT: Fixed ROM slots 9395.
    9395, 65320,
// PORT: SOURCE AOTMARK.agc:375
//			TRG*NBSM	# CONVERT IT TO STABLE MEMBER
// PORT: Fixed ROM slots 9396.
    9396, 40808,
// PORT: SOURCE AOTMARK.agc:376
//		PUSH	VLOAD*
// PORT: Fixed ROM slots 9397.
    9397, 64268,
// PORT: SOURCE AOTMARK.agc:377
//			0,1		# PUT X-MARK CDUS IN CDUSPOT FOR TRG*NBSM
// PORT: Fixed ROM slots 9398.
    9398, 2,
// PORT: SOURCE AOTMARK.agc:378
//		STOVL	CDUSPOT
// PORT: Fixed ROM slots 9399.
    9399, 21486,
// PORT: SOURCE AOTMARK.agc:379
//			18D		# LOAD X-PLANE VECTOR IN NB
// PORT: Fixed ROM slots 9400.
    9400, 38,
// PORT: SOURCE AOTMARK.agc:380
//		CALL
// PORT: Fixed ROM slots 9401.
    9401, 65320,
// PORT: SOURCE AOTMARK.agc:381
//			TRG*NBSM	# CONVERT IT TO STABLE-MEMBER
// PORT: Fixed ROM slots 9402.
    9402, 40808,
// PORT: SOURCE AOTMARK.agc:382
//		VXV	UNIT		# UNIT(XPSM * YPSM)
// PORT: Fixed ROM slots 9403.
    9403, 44602,
// PORT: SOURCE AOTMARK.agc:383
//		STADR
// PORT: Fixed ROM slots 9404.
    9404, 65324,
// PORT: SOURCE AOTMARK.agc:384
//		STORE	24D
// PORT: Fixed ROM slots 9405.
    9405, 65484,
// PORT: SOURCE AOTMARK.agc:385
//
// PORT: SOURCE AOTMARK.agc:386
//AVEIT		SLOAD	PDVL		# N(NUMBER OF VECS) IN 0-1
// PORT: Fixed ROM slots 9406.
    9406, 52666,
// PORT: SOURCE AOTMARK.agc:387
//			MKDEX
// PORT: Fixed ROM slots 9407.
    9407, 3798,
// PORT: SOURCE AOTMARK.agc:388
//			24D		# LOAD CURRENT VECTOR
// PORT: Fixed ROM slots 9408.
    9408, 50,
// PORT: SOURCE AOTMARK.agc:389
//		VSR3	V/SC
// PORT: Fixed ROM slots 9409.
    9409, 57764,
// PORT: SOURCE AOTMARK.agc:390
//			0
// PORT: Fixed ROM slots 9410.
    9410, 2,
// PORT: SOURCE AOTMARK.agc:391
//		STODL	24D		# VEC/N
// PORT: Fixed ROM slots 9411.
    9411, 12338,
// PORT: SOURCE AOTMARK.agc:392
//			0
// PORT: Fixed ROM slots 9412.
    9412, 2,
// PORT: SOURCE AOTMARK.agc:393
//		DSU	DDV
// PORT: Fixed ROM slots 9413.
    9413, 47402,
// PORT: SOURCE AOTMARK.agc:394
//			DP1/8		# (N-1)/N
// PORT: Fixed ROM slots 9414.
    9414, 15142,
// PORT: SOURCE AOTMARK.agc:395
//		VXSC	VAD
// PORT: Fixed ROM slots 9415.
    9415, 44514,
// PORT: SOURCE AOTMARK.agc:396
//			STARAD +6	# ADD VEC TO PREVIOUSLY AVERAGED VECTOR
// PORT: Fixed ROM slots 9416.
    9416, 2970,
// PORT: SOURCE AOTMARK.agc:397
//			24D		# (N-1)/N AVESTVEC + VEC/N
// PORT: Fixed ROM slots 9417.
    9417, 50,
// PORT: SOURCE AOTMARK.agc:398
//		STORE	STARAD +6	# AVERAGE STAR VECTOR
// PORT: Fixed ROM slots 9418.
    9418, 2970,
// PORT: SOURCE AOTMARK.agc:399
//		STORE	STARSAV2
// PORT: Fixed ROM slots 9419.
    9419, 3054,
// PORT: SOURCE AOTMARK.agc:400
//		EXIT
// PORT: Fixed ROM slots 9420.
    9420, 65532
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9421–9425.
function agcAotUnit566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9422 {
        if slot <= 9421 {
// PORT: SOURCE AOTMARK.agc:401
//		CCS	MARKCNTR	# SEE IF ANOTHER MARK PAIR IN MKVAC
// PORT: Fixed ROM slots 9421.
            if slot <> 9421 or instruction <> 4968 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 872).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:402
//		TCF	AVESTAR -1	# THERE IS -- GO GET IT -- DECREMENT COUNTER
// PORT: Fixed ROM slots 9422.
            if slot <> 9422 or instruction <> 5280 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5280, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9423 {
// PORT: SOURCE AOTMARK.agc:403
//ENDMARKS	CAF	FIVE		# NO MORE MARKS -- TERMINATE AOTMARK
// PORT: Fixed ROM slots 9423.
            if slot <> 9423 or instruction <> 14830 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 9424 {
// PORT: SOURCE AOTMARK.agc:404
//		INHINT
// PORT: Fixed ROM slots 9424.
                if slot <> 9424 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:405
//		TC	WAITLIST
// PORT: Fixed ROM slots 9425.
                if slot <> 9425 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[566] to agcAotUnit566@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:406
//		EBANK=	XYMARK
// PORT: SOURCE AOTMARK.agc:407
//		2CADR	MKRELEAS
// PORT: Fixed ROM slots 9426 9427.
    9426, 2126, 9427, 14446
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9428–9429.
function agcAotUnit567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9428 {
// PORT: SOURCE AOTMARK.agc:408
//
// PORT: SOURCE AOTMARK.agc:409
//		TC	ENDMARK
// PORT: Fixed ROM slots 9428.
        if slot <> 9428 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:410
//
// PORT: SOURCE AOTMARK.agc:411
//MKALARM		TC	ALARM		# NOT A PAIR TO PROCESS -- DO GETMKS
// PORT: Fixed ROM slots 9429.
        if slot <> 9429 or instruction <> 2935 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2935, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[567] to agcAotUnit567@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:412
//		OCT	111
// PORT: Fixed ROM slots 9430.
    9430, 146
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9431–9431.
function agcAotUnit568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:413
//		TCF	GETMKS
// PORT: Fixed ROM slots 9431.
    if slot <> 9431 or instruction <> 5250 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5250, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[568] to agcAotUnit568@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:414
//
// PORT: SOURCE AOTMARK.agc:415
//V01N71		VN	171
// PORT: Fixed ROM slots 9432.
    9432, 398,
// PORT: SOURCE AOTMARK.agc:416
//V06N87*		VN	687
// PORT: Fixed ROM slots 9433.
    9433, 1710
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9434–9458.
function agcAotUnit569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9445 {
        if slot <= 9439 {
            if slot <= 9436 {
                if slot <= 9434 {
// PORT: SOURCE AOTMARK.agc:417
//
// PORT: SOURCE AOTMARK.agc:418
//# Page 254
// PORT: SOURCE AOTMARK.agc:419
//# MARKRUPT IS ENTERED FROM INTERRUPT LEAD-INS AND PROCESSES CHANNEL 16
// PORT: SOURCE AOTMARK.agc:420
//# CAUSED BY X,Y MARK OR MARK REJECT OR BY THE RATE OF DESCENT SWITCH
// PORT: SOURCE AOTMARK.agc:421
//
// PORT: SOURCE AOTMARK.agc:422
//MARKRUPT	TS	BANKRUPT
// PORT: Fixed ROM slots 9434.
                    if slot <> 9434 or instruction <> 22542 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22542, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9435 {
// PORT: SOURCE AOTMARK.agc:423
//		CA	CDUY		# STORE CDUS AND TIME NOW -- THEN SEE IF
// PORT: Fixed ROM slots 9435.
                        if slot <> 9435 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:424
//		TS	ITEMP3		# WE NEED THEM
// PORT: Fixed ROM slots 9436.
                        if slot <> 9436 or instruction <> 22579 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22579, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9437 {
// PORT: SOURCE AOTMARK.agc:425
//		CA	CDUZ
// PORT: Fixed ROM slots 9437.
                    if slot <> 9437 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9438 {
// PORT: SOURCE AOTMARK.agc:426
//		TS	ITEMP4
// PORT: Fixed ROM slots 9438.
                        if slot <> 9438 or instruction <> 22580 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22580, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:427
//		CA	CDUX
// PORT: Fixed ROM slots 9439.
                        if slot <> 9439 or instruction <> 12314 { return choose false if checkOnly else -1. }
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
            if slot <= 9442 {
                if slot <= 9440 {
// PORT: SOURCE AOTMARK.agc:428
//		TS	ITEMP5
// PORT: Fixed ROM slots 9440.
                    if slot <> 9440 or instruction <> 22581 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22581, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9441 {
// PORT: SOURCE AOTMARK.agc:429
//		EXTEND
// PORT: Fixed ROM slots 9441.
                        if slot <> 9441 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:430
//		DCA	TIME2
// PORT: Fixed ROM slots 9442.
                        if slot <> 9442 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9443 {
// PORT: SOURCE AOTMARK.agc:431
//		DXCH	ITEMP1
// PORT: Fixed ROM slots 9443.
                    if slot <> 9443 or instruction <> 21554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9444 {
// PORT: SOURCE AOTMARK.agc:432
//		XCH	Q
// PORT: Fixed ROM slots 9444.
                        if slot <> 9444 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:433
//		TS	QRUPT
// PORT: Fixed ROM slots 9445.
                        if slot <> 9445 or instruction <> 22538 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22538, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9451 {
            if slot <= 9448 {
                if slot <= 9446 {
// PORT: SOURCE AOTMARK.agc:434
//
// PORT: SOURCE AOTMARK.agc:435
//		CAF	OCT34		# SEE IF X OR Y MARK OR MKREJECT
// PORT: Fixed ROM slots 9446.
                    if slot <> 9446 or instruction <> 13716 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1428), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9447 {
// PORT: SOURCE AOTMARK.agc:436
//		EXTEND
// PORT: Fixed ROM slots 9447.
                        if slot <> 9447 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:437
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9448.
                        if slot <> 9448 or instruction <> 1038 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9449 {
// PORT: SOURCE AOTMARK.agc:438
//		CCS	A
// PORT: Fixed ROM slots 9449.
                    if slot <> 9449 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9450 {
// PORT: SOURCE AOTMARK.agc:439
//		TCF	+2		# ITS A LIVE ONE -- SEE IF ITS WANTED
// PORT: Fixed ROM slots 9450.
                        if slot <> 9450 or instruction <> 5356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5356, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:440
//		TCF	SOMEKEY		# ITS SOME OTHER KEY
// PORT: Fixed ROM slots 9451.
                        if slot <> 9451 or instruction <> 5380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5380, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9454 {
                if slot <= 9452 {
// PORT: SOURCE AOTMARK.agc:441
//
// PORT: SOURCE AOTMARK.agc:442
//		CAF	BIT12		# ARE WE ASKING FOR A MARK
// PORT: Fixed ROM slots 9452.
                    if slot <> 9452 or instruction <> 14816 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9453 {
// PORT: SOURCE AOTMARK.agc:443
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9453.
                        if slot <> 9453 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:444
//		CCS	A
// PORT: Fixed ROM slots 9454.
                        if slot <> 9454 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 9456 {
                    if slot <= 9455 {
// PORT: SOURCE AOTMARK.agc:445
//		TC	RESUME		# DON'T WANT MARK OR MKREJECT -- DO NOTHING
// PORT: Fixed ROM slots 9455.
                        if slot <> 9455 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:446
//
// PORT: SOURCE AOTMARK.agc:447
//		CCS	MARKSTAT	# ARE MARKS BEING ACCEPTED
// PORT: Fixed ROM slots 9456.
                        if slot <> 9456 or instruction <> 4810 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9457 {
// PORT: SOURCE AOTMARK.agc:448
//		TCF	FINDKEY		# THEY ARE -- WHICH ONE IS IT
// PORT: Fixed ROM slots 9457.
                        if slot <> 9457 or instruction <> 5365 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5365, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:449
//		TC	ALARM		# MARKS NOT BEING ACCEPTED -- DO ALARM
// PORT: Fixed ROM slots 9458.
                        if slot <> 9458 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[569] to agcAotUnit569@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:450
//		OCT	112
// PORT: Fixed ROM slots 9459.
    9459, 148
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9460–9481.
function agcAotUnit570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9470 {
        if slot <= 9464 {
            if slot <= 9461 {
                if slot <= 9460 {
// PORT: SOURCE AOTMARK.agc:451
//		TC	RESUME
// PORT: Fixed ROM slots 9460.
                    if slot <> 9460 or instruction <> 2744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2744, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:452
//
// PORT: SOURCE AOTMARK.agc:453
//FINDKEY		CAF	BIT5		# SEE IF MARK REJECT.
// PORT: Fixed ROM slots 9461.
                    if slot <> 9461 or instruction <> 14823 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9462 {
// PORT: SOURCE AOTMARK.agc:454
//		EXTEND
// PORT: Fixed ROM slots 9462.
                    if slot <> 9462 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9463 {
// PORT: SOURCE AOTMARK.agc:455
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9463.
                        if slot <> 9463 or instruction <> 1038 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:456
//		CCS	A
// PORT: Fixed ROM slots 9464.
                        if slot <> 9464 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 9467 {
                if slot <= 9465 {
// PORT: SOURCE AOTMARK.agc:457
//		TCF	MKREJ		# IT'S A MARK REJECT
// PORT: Fixed ROM slots 9465.
                    if slot <> 9465 or instruction <> 5425 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5425, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9466 {
// PORT: SOURCE AOTMARK.agc:458
//
// PORT: SOURCE AOTMARK.agc:459
//		CAF	BIT4		# SEE IF Y MARK
// PORT: Fixed ROM slots 9466.
                        if slot <> 9466 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:460
//		EXTEND
// PORT: Fixed ROM slots 9467.
                        if slot <> 9467 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9468 {
// PORT: SOURCE AOTMARK.agc:461
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9468.
                    if slot <> 9468 or instruction <> 1038 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9469 {
// PORT: SOURCE AOTMARK.agc:462
//		CCS	A
// PORT: Fixed ROM slots 9469.
                        if slot <> 9469 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:463
//
// PORT: SOURCE AOTMARK.agc:464
//		TCF	YMKRUPT		# IT'S A Y MARK
// PORT: Fixed ROM slots 9470.
                        if slot <> 9470 or instruction <> 5394 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5394, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9475 {
            if slot <= 9472 {
                if slot <= 9471 {
// PORT: SOURCE AOTMARK.agc:465
//
// PORT: SOURCE AOTMARK.agc:466
//		CAF	BIT3		# SEE IF X MARK
// PORT: Fixed ROM slots 9471.
                    if slot <> 9471 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:467
//		EXTEND
// PORT: Fixed ROM slots 9472.
                    if slot <> 9472 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9473 {
// PORT: SOURCE AOTMARK.agc:468
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9473.
                    if slot <> 9473 or instruction <> 1038 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9474 {
// PORT: SOURCE AOTMARK.agc:469
//
// PORT: SOURCE AOTMARK.agc:470
//# Page 255
// PORT: SOURCE AOTMARK.agc:471
//		CCS	A
// PORT: Fixed ROM slots 9474.
                        if slot <> 9474 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:472
//		TCF	XMKRUPT		# IT'S A X MARK
// PORT: Fixed ROM slots 9475.
                        if slot <> 9475 or instruction <> 5390 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5390, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9478 {
                if slot <= 9476 {
// PORT: SOURCE AOTMARK.agc:473
//
// PORT: SOURCE AOTMARK.agc:474
//SOMEKEY		CAF	OCT140		# NOT MARK OR MKREJECT -- SEE IF DESCENT BITS
// PORT: Fixed ROM slots 9476.
                    if slot <> 9476 or instruction <> 14846 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2558), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9477 {
// PORT: SOURCE AOTMARK.agc:475
//		EXTEND
// PORT: Fixed ROM slots 9477.
                        if slot <> 9477 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:476
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 9478.
                        if slot <> 9478 or instruction <> 1038 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9479 {
// PORT: SOURCE AOTMARK.agc:477
//		EXTEND
// PORT: Fixed ROM slots 9479.
                    if slot <> 9479 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9480 {
// PORT: SOURCE AOTMARK.agc:478
//		BZF	+3		# IF NO BITS
// PORT: Fixed ROM slots 9480.
                        if slot <> 9480 or instruction <> 5387 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:479
//
// PORT: SOURCE AOTMARK.agc:480
//		TC	POSTJUMP	# IF DESCENT BITS
// PORT: Fixed ROM slots 9481.
                        if slot <> 9481 or instruction <> 2461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[570] to agcAotUnit570@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:481
//		CADR	DESCBITS
// PORT: Fixed ROM slots 9482.
    9482, 32922
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9483–9483.
function agcAotUnit571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:482
//
// PORT: SOURCE AOTMARK.agc:483
//		TC	ALARM		# NO INBITS IN CHANNEL 16.
// PORT: Fixed ROM slots 9483.
    if slot <> 9483 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[571] to agcAotUnit571@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:484
//		OCT	113
// PORT: Fixed ROM slots 9484.
    9484, 150
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9485–9513.
function agcAotUnit572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9498 {
        if slot <= 9491 {
            if slot <= 9487 {
                if slot <= 9485 {
// PORT: SOURCE AOTMARK.agc:485
//
// PORT: SOURCE AOTMARK.agc:486
//		TC	RESUME
// PORT: Fixed ROM slots 9485.
                    if slot <> 9485 or instruction <> 2744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2744, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9486 {
// PORT: SOURCE AOTMARK.agc:487
//
// PORT: SOURCE AOTMARK.agc:488
//XMKRUPT		CAF	ZERO
// PORT: Fixed ROM slots 9486.
                        if slot <> 9486 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:489
//		TS	RUPTREG1	# SET X MARK STORE INDEX TO ZERO
// PORT: Fixed ROM slots 9487.
                        if slot <> 9487 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9489 {
                    if slot <= 9488 {
// PORT: SOURCE AOTMARK.agc:490
//		CAF	BIT10
// PORT: Fixed ROM slots 9488.
                        if slot <> 9488 or instruction <> 14818 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:491
//		TCF	+4
// PORT: Fixed ROM slots 9489.
                        if slot <> 9489 or instruction <> 5397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5397, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9490 {
// PORT: SOURCE AOTMARK.agc:492
//YMKRUPT		CAF	ONE
// PORT: Fixed ROM slots 9490.
                        if slot <> 9490 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:493
//		TS	RUPTREG1	# SET Y MARK STORE INDEX TO ONE
// PORT: Fixed ROM slots 9491.
                        if slot <> 9491 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9494 {
                if slot <= 9492 {
// PORT: SOURCE AOTMARK.agc:494
//		CAF	BIT11
// PORT: Fixed ROM slots 9492.
                    if slot <> 9492 or instruction <> 14817 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9493 {
// PORT: SOURCE AOTMARK.agc:495
//		TS	XYMARK		# SET MARK IDENTIFICATION
// PORT: Fixed ROM slots 9493.
                        if slot <> 9493 or instruction <> 23401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23401, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:496
//
// PORT: SOURCE AOTMARK.agc:497
//		TC	MARKTYPE	# SEE IF SURFACE MARK
// PORT: Fixed ROM slots 9494.
                        if slot <> 9494 or instruction <> 1356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1356, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9496 {
                    if slot <= 9495 {
// PORT: SOURCE AOTMARK.agc:498
//		TCF	SURFSTOR	# SURFACE MARK -- JUST STORE CDUS
// PORT: Fixed ROM slots 9495.
                        if slot <> 9495 or instruction <> 5457 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5457, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:499
//
// PORT: SOURCE AOTMARK.agc:500
//		CAF	BIT14		# GOT A MARK -- SEE IF MARK PARI MADE
// PORT: Fixed ROM slots 9496.
                        if slot <> 9496 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9497 {
// PORT: SOURCE AOTMARK.agc:501
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9497.
                        if slot <> 9497 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:502
//		EXTEND
// PORT: Fixed ROM slots 9498.
                        if slot <> 9498 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 9505 {
            if slot <= 9501 {
                if slot <= 9499 {
// PORT: SOURCE AOTMARK.agc:503
//		BZF	VERIFYMK	# NOT A PAIR, NORMAL PROCEDURE
// PORT: Fixed ROM slots 9499.
                    if slot <> 9499 or instruction <> 5412 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5412, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9500 {
// PORT: SOURCE AOTMARK.agc:504
//		CS	MARKCNTR	# GO A PAIR, SEE IF ANOTHER CAN BE MADE
// PORT: Fixed ROM slots 9500.
                        if slot <> 9500 or instruction <> 17256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 872).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:505
//		AD	FOUR		# IF SO, INCREMENT POINTER, CLEAR BITS 10,11
// PORT: Fixed ROM slots 9501.
                        if slot <> 9501 or instruction <> 27113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9503 {
                    if slot <= 9502 {
// PORT: SOURCE AOTMARK.agc:506
//		EXTEND
// PORT: Fixed ROM slots 9502.
                        if slot <> 9502 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:507
//		BZMF	5MKALARM	# HAVE FIVE MARK PAIRS -- DON'T ALLOW MARK
// PORT: Fixed ROM slots 9503.
                        if slot <> 9503 or instruction <> 25900 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25900, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9504 {
// PORT: SOURCE AOTMARK.agc:508
//		INCR	MARKCNTR	# OK FOR ANOTHER PAIR, INCR POINTER
// PORT: Fixed ROM slots 9504.
                        if slot <> 9504 or instruction <> 11112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 872).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:509
//		CS	PRIO23		# CLEAR BITS 10,11,14 FOR NEXT PAIR
// PORT: Fixed ROM slots 9505.
                        if slot <> 9505 or instruction <> 20425 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 4041), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9509 {
                if slot <= 9507 {
                    if slot <= 9506 {
// PORT: SOURCE AOTMARK.agc:510
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9506.
                        if slot <> 9506 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:511
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9507.
                        if slot <> 9507 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9508 {
// PORT: SOURCE AOTMARK.agc:512
//
// PORT: SOURCE AOTMARK.agc:513
//VERIFYMK	CA	XYMARK
// PORT: Fixed ROM slots 9508.
                        if slot <> 9508 or instruction <> 13161 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 873).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:514
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9509.
                        if slot <> 9509 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9511 {
                    if slot <= 9510 {
// PORT: SOURCE AOTMARK.agc:515
//		CCS	A
// PORT: Fixed ROM slots 9510.
                        if slot <> 9510 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:516
//		TCF	+2		# THIS MARK NOT DESIRED
// PORT: Fixed ROM slots 9511.
                        if slot <> 9511 or instruction <> 5417 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5417, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9512 {
// PORT: SOURCE AOTMARK.agc:517
//		TCF	VACSTOR		# MARK DESIRED -- STORE CDUS
// PORT: Fixed ROM slots 9512.
                        if slot <> 9512 or instruction <> 5462 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5462, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:518
//		TC	ALARM
// PORT: Fixed ROM slots 9513.
                        if slot <> 9513 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[572] to agcAotUnit572@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:519
//		OCT	114
// PORT: Fixed ROM slots 9514.
    9514, 152
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9515–9516.
function agcAotUnit573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9515 {
// PORT: SOURCE AOTMARK.agc:520
//		TC	RESUME		# RESUME -- DISPLAY UNCHANGED -- WAIT FOR ACTION
// PORT: Fixed ROM slots 9515.
        if slot <> 9515 or instruction <> 2744 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2744, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:521
//
// PORT: SOURCE AOTMARK.agc:522
//# Page 256
// PORT: SOURCE AOTMARK.agc:523
//5MKALARM	TC	ALARM		# ATTEMPTING TO MAKE MORE THAN 5 MK PAIRS
// PORT: Fixed ROM slots 9516.
        if slot <> 9516 or instruction <> 2935 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2935, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[573] to agcAotUnit573@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:524
//		OCT	107
// PORT: Fixed ROM slots 9517.
    9517, 142
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9518–9527.
function agcAotUnit574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9522 {
        if slot <= 9519 {
            if slot <= 9518 {
// PORT: SOURCE AOTMARK.agc:525
//		TC	MARKTYPE	# SEE IF SURFACE MARK
// PORT: Fixed ROM slots 9518.
                if slot <> 9518 or instruction <> 1356 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1356, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:526
//		TCF	DSPV6N79	# IT IS
// PORT: Fixed ROM slots 9519.
                if slot <> 9519 or instruction <> 5527 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5527, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9520 {
// PORT: SOURCE AOTMARK.agc:527
//		TC	RESUME		# DON'T CHANGE DISPLAY -- DO NOTHING
// PORT: Fixed ROM slots 9520.
                if slot <> 9520 or instruction <> 2744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2744, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9521 {
// PORT: SOURCE AOTMARK.agc:528
//
// PORT: SOURCE AOTMARK.agc:529
//# Page 257
// PORT: SOURCE AOTMARK.agc:530
//MKREJ		TC	MARKTYPE	# SEE IF SURFACE
// PORT: Fixed ROM slots 9521.
                    if slot <> 9521 or instruction <> 1356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:531
//		TCF	SURFREJ		# SURFACE -- JUST CHECK MARK COUNTER
// PORT: Fixed ROM slots 9522.
                    if slot <> 9522 or instruction <> 5447 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5447, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9524 {
            if slot <= 9523 {
// PORT: SOURCE AOTMARK.agc:532
//
// PORT: SOURCE AOTMARK.agc:533
//		CAF	PRIO3		# INFLIGHT -- SEE IF MARKS MADE
// PORT: Fixed ROM slots 9523.
                if slot <> 9523 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:534
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9524.
                if slot <> 9524 or instruction <> 29386 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 714).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9525 {
// PORT: SOURCE AOTMARK.agc:535
//		CCS	A
// PORT: Fixed ROM slots 9525.
                if slot <> 9525 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9526 {
// PORT: SOURCE AOTMARK.agc:536
//		TCF	REJECT		# MARKS MADE -- REJECT ONE
// PORT: Fixed ROM slots 9526.
                    if slot <> 9526 or instruction <> 5434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5434, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:537
//REJALM		TC	ALARM		# NO MARK TO REJECT -- BAD PROCEDURE -- ALARM
// PORT: Fixed ROM slots 9527.
                    if slot <> 9527 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[574] to agcAotUnit574@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:538
//		OCT	115
// PORT: Fixed ROM slots 9528.
    9528, 154
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9529–9564.
function agcAotUnit575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9546 {
        if slot <= 9537 {
            if slot <= 9532 {
                if slot <= 9530 {
                    if slot <= 9529 {
// PORT: SOURCE AOTMARK.agc:539
//		TC	RESUME		# DESIRED ACTION DISPLAYED
// PORT: Fixed ROM slots 9529.
                        if slot <> 9529 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:540
//
// PORT: SOURCE AOTMARK.agc:541
//REJECT		CS	PRIO30		# ZERO BIT14, SHOW REJ., SEE IF MARK SINCE
// PORT: Fixed ROM slots 9530.
                        if slot <> 9530 or instruction <> 18669 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9531 {
// PORT: SOURCE AOTMARK.agc:542
//		MASK	MARKSTAT	# LAST REJECT
// PORT: Fixed ROM slots 9531.
                        if slot <> 9531 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:543
//		AD	BIT13
// PORT: Fixed ROM slots 9532.
                        if slot <> 9532 or instruction <> 27103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9534 {
                    if slot <= 9533 {
// PORT: SOURCE AOTMARK.agc:544
//		XCH	MARKSTAT
// PORT: Fixed ROM slots 9533.
                        if slot <> 9533 or instruction <> 24266 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 714, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:545
//		MASK	BIT13
// PORT: Fixed ROM slots 9534.
                        if slot <> 9534 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                    }
                } else {
                    if slot <= 9535 {
// PORT: SOURCE AOTMARK.agc:546
//		CCS	A
// PORT: Fixed ROM slots 9535.
                        if slot <> 9535 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9536 {
// PORT: SOURCE AOTMARK.agc:547
//		TCF	REJECT2		# ANOTHER REJECT SET BIT 10+11 TO ZERO
// PORT: Fixed ROM slots 9536.
                            if slot <> 9536 or instruction <> 5445 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5445, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOTMARK.agc:548
//
// PORT: SOURCE AOTMARK.agc:549
//		CS	XYMARK		# MARK MADE SINCE REJECT -- REJECT MARK IN 1D
// PORT: Fixed ROM slots 9537.
                            if slot <> 9537 or instruction <> 17257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 873).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9541 {
                if slot <= 9539 {
                    if slot <= 9538 {
// PORT: SOURCE AOTMARK.agc:550
//RENEWMK		MASK	MARKSTAT
// PORT: Fixed ROM slots 9538.
                        if slot <> 9538 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:551
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9539.
                        if slot <> 9539 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9540 {
// PORT: SOURCE AOTMARK.agc:552
//		TCF	REMARK		# GO REQUEST NEW MARK ACTION
// PORT: Fixed ROM slots 9540.
                        if slot <> 9540 or instruction <> 5503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:553
//
// PORT: SOURCE AOTMARK.agc:554
//REJECT2		CS	PRIO3		# ON SECOND REJECT -- DISPLAY VB53 AGAIN
// PORT: Fixed ROM slots 9541.
                        if slot <> 9541 or instruction <> 18957 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9543 {
                    if slot <= 9542 {
// PORT: SOURCE AOTMARK.agc:555
//		TCF	RENEWMK
// PORT: Fixed ROM slots 9542.
                        if slot <> 9542 or instruction <> 5442 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5442, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:556
//
// PORT: SOURCE AOTMARK.agc:557
//SURFREJ		CCS	MARKCNTR	# IF MARK DECREMENT COUNTER
// PORT: Fixed ROM slots 9543.
                        if slot <> 9543 or instruction <> 4968 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 872).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9544 {
// PORT: SOURCE AOTMARK.agc:558
//		TCF	+2
// PORT: Fixed ROM slots 9544.
                        if slot <> 9544 or instruction <> 5450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9545 {
// PORT: SOURCE AOTMARK.agc:559
//		TCF	REJALM		# NO MARKS TO REJECT -- ALARM
// PORT: Fixed ROM slots 9545.
                            if slot <> 9545 or instruction <> 5431 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5431, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOTMARK.agc:560
//		TS	MARKCNTR
// PORT: Fixed ROM slots 9546.
                            if slot <> 9546 or instruction <> 23400 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23400, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 9555 {
            if slot <= 9550 {
                if slot <= 9548 {
                    if slot <= 9547 {
// PORT: SOURCE AOTMARK.agc:561
//		TC	RESUME
// PORT: Fixed ROM slots 9547.
                        if slot <> 9547 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:562
//
// PORT: SOURCE AOTMARK.agc:563
//# Page 258
// PORT: SOURCE AOTMARK.agc:564
//# MARKTYPE TESTS TO SEE IF LEM ON LUNAR SURFACE.  IF IT IS RETURN TO LOC+1
// PORT: SOURCE AOTMARK.agc:565
//
// PORT: SOURCE AOTMARK.agc:566
//MARKTYPE	CS	FLAGWRD8	# SURFFLAG ******** TEMPORARY ******
// PORT: Fixed ROM slots 9548.
                        if slot <> 9548 or instruction <> 16452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 68).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9549 {
// PORT: SOURCE AOTMARK.agc:567
//		MASK	BIT8
// PORT: Fixed ROM slots 9549.
                        if slot <> 9549 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOTMARK.agc:568
//		CCS	A
// PORT: Fixed ROM slots 9550.
                        if slot <> 9550 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 9552 {
                    if slot <= 9551 {
// PORT: SOURCE AOTMARK.agc:569
//		INCR	Q		# IF SURFACE MARK RETURN TO LOC +1
// PORT: Fixed ROM slots 9551.
                        if slot <> 9551 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:570
//		TC	Q		# IF INFLIGHT MARK RETURN TO LOC +2
// PORT: Fixed ROM slots 9552.
                        if slot <> 9552 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9553 {
// PORT: SOURCE AOTMARK.agc:571
//
// PORT: SOURCE AOTMARK.agc:572
//SURFSTOR	CAF	ZERO		# FOR SURFACE MARK ZERO MARK KIND INDEX
// PORT: Fixed ROM slots 9553.
                        if slot <> 9553 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9554 {
// PORT: SOURCE AOTMARK.agc:573
//		TS	RUPTREG1
// PORT: Fixed ROM slots 9554.
                            if slot <> 9554 or instruction <> 22584 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22584, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOTMARK.agc:574
//
// PORT: SOURCE AOTMARK.agc:575
//		CS	MARKSTAT	# SET BITS10,11 TO SHOW SURFACE MARK
// PORT: Fixed ROM slots 9555.
                            if slot <> 9555 or instruction <> 17098 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 714).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 9559 {
                if slot <= 9557 {
                    if slot <= 9556 {
// PORT: SOURCE AOTMARK.agc:576
//		MASK	PRIO3		# FOR MARKCHEX
// PORT: Fixed ROM slots 9556.
                        if slot <> 9556 or instruction <> 31245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            if fixedOperand = 1536 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 4) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:577
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9557.
                        if slot <> 9557 or instruction <> 11978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9558 {
// PORT: SOURCE AOTMARK.agc:578
//
// PORT: SOURCE AOTMARK.agc:579
//VACSTOR		CAF	LOW9
// PORT: Fixed ROM slots 9558.
                        if slot <> 9558 or instruction <> 14852 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:580
//		MASK	MARKSTAT	# STORE MARK VAC ADR IN RUPTREG2
// PORT: Fixed ROM slots 9559.
                        if slot <> 9559 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9561 {
                    if slot <= 9560 {
// PORT: SOURCE AOTMARK.agc:581
//		TS	RUPTREG2
// PORT: Fixed ROM slots 9560.
                        if slot <> 9560 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:582
//		EXTEND
// PORT: Fixed ROM slots 9561.
                        if slot <> 9561 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9562 {
// PORT: SOURCE AOTMARK.agc:583
//		DCA	ITEMP1		# PICK UP MARKTIME
// PORT: Fixed ROM slots 9562.
                        if slot <> 9562 or instruction <> 12338 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 50, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 9563 {
// PORT: SOURCE AOTMARK.agc:584
//		DXCH	TSIGHT		# STORE LAST MARK TIME
// PORT: Fixed ROM slots 9563.
                            if slot <> 9563 or instruction <> 22386 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 882, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOTMARK.agc:585
//		CA	MARKCNTR	# 6 X MARKCNTR FOR STORE INDEX
// PORT: Fixed ROM slots 9564.
                            if slot <> 9564 or instruction <> 13160 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 872).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[575] to agcAotUnit575@.

// PORT: Physical bank 07. Shared continuation entries, slots 9565–9572.
function agcAotUnit576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9568 {
        if slot <= 9566 {
            if slot <= 9565 {
// PORT: SOURCE AOTMARK.agc:586
//		EXTEND
// PORT: Fixed ROM slots 9565.
                if slot <> 9565 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:587
//		MP	SIX
// PORT: Fixed ROM slots 9566.
                if slot <> 9566 or instruction <> 31906 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 3234, readEffective:call(words, 3234)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9567 {
// PORT: SOURCE AOTMARK.agc:588
//		XCH	L		# GET INDEX FROM LOW ORDER PART
// PORT: Fixed ROM slots 9567.
                if slot <> 9567 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:589
//		AD	RUPTREG2	# SET CDU STORE INDEX TO MARKVAC
// PORT: Fixed ROM slots 9568.
                if slot <> 9568 or instruction <> 24633 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 57).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 9570 {
            if slot <= 9569 {
// PORT: SOURCE AOTMARK.agc:590
//		ADS	RUPTREG1	# INCREMENT VAC PICKUP BY MARK FOR FLIGHT
// PORT: Fixed ROM slots 9569.
                if slot <> 9569 or instruction <> 11320 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:591
//		TS	MKDEX		# STORE HERE IN CASE OF SURFACE MARK
// PORT: Fixed ROM slots 9570.
                if slot <> 9570 or instruction <> 23402 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23402, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 9571 {
// PORT: SOURCE AOTMARK.agc:592
//		CA	ITEMP3
// PORT: Fixed ROM slots 9571.
                if slot <> 9571 or instruction <> 12339 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 51).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOTMARK.agc:593
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 9572.
                if slot <> 9572 or instruction <> 20536 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[576] to agcAotUnit576@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:594
//		TS	0		# STORE CDUY
// PORT: Fixed ROM slots 9573.
    9573, 45056
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9574–9575.
function agcAotUnit577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9574 {
// PORT: SOURCE AOTMARK.agc:595
//		CA	ITEMP4
// PORT: Fixed ROM slots 9574.
        if slot <> 9574 or instruction <> 12340 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 52).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:596
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 9575.
        if slot <> 9575 or instruction <> 20536 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[577] to agcAotUnit577@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:597
//		TS	2		# STORE CDUZ
// PORT: Fixed ROM slots 9576.
    9576, 45060
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9577–9578.
function agcAotUnit578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9577 {
// PORT: SOURCE AOTMARK.agc:598
//		CA	ITEMP5
// PORT: Fixed ROM slots 9577.
        if slot <> 9577 or instruction <> 12341 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 53).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:599
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 9578.
        if slot <> 9578 or instruction <> 20536 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[578] to agcAotUnit578@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:600
//		TS	4		# STORE CDUX
// PORT: Fixed ROM slots 9579.
    9579, 45064
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9580–9605.
function agcAotUnit579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9592 {
        if slot <= 9585 {
            if slot <= 9582 {
                if slot <= 9580 {
// PORT: SOURCE AOTMARK.agc:601
//		TC	MARKTYPE	# IF SURFACE MARK -- JUST DO SURFJOB
// PORT: Fixed ROM slots 9580.
                    if slot <> 9580 or instruction <> 1356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9581 {
// PORT: SOURCE AOTMARK.agc:602
//		TCF	SURFJOB
// PORT: Fixed ROM slots 9581.
                        if slot <> 9581 or instruction <> 5508 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5508, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:603
//
// PORT: SOURCE AOTMARK.agc:604
//		CAF	BIT13		# CLEAR BIT13 TO SHOW MARK MADE
// PORT: Fixed ROM slots 9582.
                        if slot <> 9582 or instruction <> 14815 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 9583 {
// PORT: SOURCE AOTMARK.agc:605
//		AD	XYMARK		# SET MARK ID IN MARKSTAT
// PORT: Fixed ROM slots 9583.
                    if slot <> 9583 or instruction <> 25449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 873).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9584 {
// PORT: SOURCE AOTMARK.agc:606
//		COM
// PORT: Fixed ROM slots 9584.
                        if slot <> 9584 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:607
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9585.
                        if slot <> 9585 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9588 {
                if slot <= 9586 {
// PORT: SOURCE AOTMARK.agc:608
//		AD	XYMARK
// PORT: Fixed ROM slots 9586.
                    if slot <> 9586 or instruction <> 25449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 873).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9587 {
// PORT: SOURCE AOTMARK.agc:609
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9587.
                        if slot <> 9587 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:610
//		MASK	PRIO3		# SEE IF X, Y MARK MADE
// PORT: Fixed ROM slots 9588.
                        if slot <> 9588 or instruction <> 31245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            if fixedOperand = 1536 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 512), 4) * 512).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9590 {
                    if slot <= 9589 {
// PORT: SOURCE AOTMARK.agc:611
//		TS	L
// PORT: Fixed ROM slots 9589.
                        if slot <> 9589 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:612
//
// PORT: SOURCE AOTMARK.agc:613
//# Page 259
// PORT: SOURCE AOTMARK.agc:614
//		CA	PRIO3
// PORT: Fixed ROM slots 9590.
                        if slot <> 9590 or instruction <> 14861 { return choose false if checkOnly else -1. }
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
                    if slot <= 9591 {
// PORT: SOURCE AOTMARK.agc:615
//		EXTEND
// PORT: Fixed ROM slots 9591.
                        if slot <> 9591 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:616
//		RXOR	LCHAN
// PORT: Fixed ROM slots 9592.
                        if slot <> 9592 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 9598 {
            if slot <= 9595 {
                if slot <= 9593 {
// PORT: SOURCE AOTMARK.agc:617
//		CCS	A
// PORT: Fixed ROM slots 9593.
                    if slot <> 9593 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9594 {
// PORT: SOURCE AOTMARK.agc:618
//		TCF	REMARK		# NOT PAIR YET, DISPLAY MARK ACTION
// PORT: Fixed ROM slots 9594.
                        if slot <> 9594 or instruction <> 5503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:619
//		CS	MARKSTAT	# MARK PAIR COMPLETE -- SET BIT14
// PORT: Fixed ROM slots 9595.
                        if slot <> 9595 or instruction <> 17098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 714).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9596 {
// PORT: SOURCE AOTMARK.agc:620
//		MASK	BIT14
// PORT: Fixed ROM slots 9596.
                    if slot <> 9596 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 9597 {
// PORT: SOURCE AOTMARK.agc:621
//		ADS	MARKSTAT
// PORT: Fixed ROM slots 9597.
                        if slot <> 9597 or instruction <> 11978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:622
//		TCF	REMARK		# GO DISPLAY V54
// PORT: Fixed ROM slots 9598.
                        if slot <> 9598 or instruction <> 5503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 9601 {
                if slot <= 9599 {
// PORT: SOURCE AOTMARK.agc:623
//
// PORT: SOURCE AOTMARK.agc:624
//# Page 260
// PORT: SOURCE AOTMARK.agc:625
//REMARK		CAF	PRIO3		# BITS 10 AND 11
// PORT: Fixed ROM slots 9599.
                    if slot <> 9599 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 9600 {
// PORT: SOURCE AOTMARK.agc:626
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9600.
                        if slot <> 9600 or instruction <> 29386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 714).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:627
//		EXTEND
// PORT: Fixed ROM slots 9601.
                        if slot <> 9601 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 9603 {
                    if slot <= 9602 {
// PORT: SOURCE AOTMARK.agc:628
//		MP	BIT6		# SHIFT MARK IDS TO BE 0 TO 3 FOR INDEX
// PORT: Fixed ROM slots 9602.
                        if slot <> 9602 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2534, readEffective:call(words, 2534)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:629
//		TS	MKDEX		# STORE VERB INDEX
// PORT: Fixed ROM slots 9603.
                        if slot <> 9603 or instruction <> 23402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23402, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 9604 {
// PORT: SOURCE AOTMARK.agc:630
//SURFJOB		CAF	PRIO15
// PORT: Fixed ROM slots 9604.
                        if slot <> 9604 or instruction <> 14869 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOTMARK.agc:631
//		TC	NOVAC		# ENTER JOB TO CHANGE DISPLAY TO
// PORT: Fixed ROM slots 9605.
                        if slot <> 9605 or instruction <> 2618 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[579] to agcAotUnit579@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:632
//		EBANK=	XYMARK		# REQUEST NEXT ACTION
// PORT: SOURCE AOTMARK.agc:633
//		2CADR	CHANGEVB
// PORT: Fixed ROM slots 9606 9607.
    9606, 2834, 9607, 14446
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9608–9611.
function agcAotUnit580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9609 {
        if slot <= 9608 {
// PORT: SOURCE AOTMARK.agc:634
//
// PORT: SOURCE AOTMARK.agc:635
//		TC	RESUME
// PORT: Fixed ROM slots 9608.
            if slot <> 9608 or instruction <> 2744 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2744, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:636
//
// PORT: SOURCE AOTMARK.agc:637
//CHANGEVB	TC	MARKTYPE
// PORT: Fixed ROM slots 9609.
            if slot <> 9609 or instruction <> 1356 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1356, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 9610 {
// PORT: SOURCE AOTMARK.agc:638
//		TCF	DSPV6N79	# SURFACE -- DISPLAY V 06 N 79
// PORT: Fixed ROM slots 9610.
            if slot <> 9610 or instruction <> 5527 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5527, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOTMARK.agc:639
//		INDEX	MKDEX		# INFLIGHT -- PICK UP MARK VB INDEX
// PORT: Fixed ROM slots 9611.
            if slot <> 9611 or instruction <> 21354 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21354, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21354, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[580] to agcAotUnit580@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:640
//		CAF	MKVB54
// PORT: Fixed ROM slots 9612.
    9612, 27420
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9613–9613.
function agcAotUnit581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOTMARK.agc:641
//		TC	PASTIT		# PASTE UP NEXT MK VERB DISPLAY
// PORT: Fixed ROM slots 9613.
    if slot <> 9613 or instruction <> 1161 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1161, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[581] to agcAotUnit581@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:642
//
// PORT: SOURCE AOTMARK.agc:643
//# THE FOUR MKVBS ARE INDEXED -- THEIR ORDER CANNOT BE CHANGED
// PORT: SOURCE AOTMARK.agc:644
//
// PORT: SOURCE AOTMARK.agc:645
//MKVB54		VN	5471		# MAKE X OR Y MARK
// PORT: Fixed ROM slots 9614.
    9614, 13966,
// PORT: SOURCE AOTMARK.agc:646
//MKVB53		VN	5371		# MAKE Y MARK
// PORT: Fixed ROM slots 9615.
    9615, 13710,
// PORT: SOURCE AOTMARK.agc:647
//MKVB52		VN	5271		# MAKE X MARK
// PORT: Fixed ROM slots 9616.
    9616, 13454,
// PORT: SOURCE AOTMARK.agc:648
//MKVB54*		VN	5471		# MAKE X OR Y MARK
// PORT: Fixed ROM slots 9617.
    9617, 13966,
// PORT: SOURCE AOTMARK.agc:649
//DP1/8		2DEC	.125
// PORT: Fixed ROM slots 9618 9619.
    9618, 4096, 9619, 0,
// PORT: SOURCE AOTMARK.agc:650
//
// PORT: SOURCE AOTMARK.agc:651
//OCT34		OCT	34
// PORT: Fixed ROM slots 9620.
    9620, 56,
// PORT: SOURCE AOTMARK.agc:652
//V06N71		VN	671
// PORT: Fixed ROM slots 9621.
    9621, 1678,
// PORT: SOURCE AOTMARK.agc:653
//V06N79*		VN	679
// PORT: Fixed ROM slots 9622.
    9622, 1694
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9623–9624.
function agcAotUnit582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9623 {
// PORT: SOURCE AOTMARK.agc:654
//
// PORT: SOURCE AOTMARK.agc:655
//# Page 261
// PORT: SOURCE AOTMARK.agc:656
//# ROUTINE TO REQUEST CURSOR AND SPIRAL MEASUREMENTS
// PORT: SOURCE AOTMARK.agc:657
//		COUNT*	$$/R59
// PORT: SOURCE AOTMARK.agc:658
//
// PORT: SOURCE AOTMARK.agc:659
//DSPV6N79	CAF	V06N79*		# CURSOR -- SPIRAL DISPLAY
// PORT: Fixed ROM slots 9623.
        if slot <> 9623 or instruction <> 13718 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1430), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:660
//		TC	BANKCALL
// PORT: Fixed ROM slots 9624.
        if slot <> 9624 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[582] to agcAotUnit582@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:661
//		CADR	GOMARKF
// PORT: Fixed ROM slots 9625.
    9625, 16824
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9626–9638.
function agcAotUnit583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9631 {
        if slot <= 9628 {
            if slot <= 9626 {
// PORT: SOURCE AOTMARK.agc:662
//
// PORT: SOURCE AOTMARK.agc:663
//		TCF	KILLAOT		# V34 -- DOES GOTOPOOH
// PORT: Fixed ROM slots 9626.
                if slot <> 9626 or instruction <> 5168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5168, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9627 {
// PORT: SOURCE AOTMARK.agc:664
//		TCF	SURFEND		# V33 -- PROCEED, END MARKING
// PORT: Fixed ROM slots 9627.
                    if slot <> 9627 or instruction <> 5537 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5537, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:665
//		CAF	BIT6		# IF V32(OCT40) IN MPAC DO RECYCLE
// PORT: Fixed ROM slots 9628.
                    if slot <> 9628 or instruction <> 14822 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 9629 {
// PORT: SOURCE AOTMARK.agc:666
//		MASK	MPAC		# OTHERWISE IT IS LOAD VB ENTER SO
// PORT: Fixed ROM slots 9629.
                if slot <> 9629 or instruction <> 28780 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9630 {
// PORT: SOURCE AOTMARK.agc:667
//		CCS	A		# RE-DISPLAY V06N79
// PORT: Fixed ROM slots 9630.
                    if slot <> 9630 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:668
//		TCF	SURFAGAN	# VB32 -- RECYCLE
// PORT: Fixed ROM slots 9631.
                    if slot <> 9631 or instruction <> 5541 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5541, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 9634 {
            if slot <= 9632 {
// PORT: SOURCE AOTMARK.agc:669
//		TCF	DSPV6N79	# ENTER
// PORT: Fixed ROM slots 9632.
                if slot <> 9632 or instruction <> 5527 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5527, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9633 {
// PORT: SOURCE AOTMARK.agc:670
//
// PORT: SOURCE AOTMARK.agc:671
//SURFEND		CS	BIT14		# SET BIT14 TO SHOW MARK END
// PORT: Fixed ROM slots 9633.
                    if slot <> 9633 or instruction <> 18910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:672
//		MASK	MARKSTAT
// PORT: Fixed ROM slots 9634.
                    if slot <> 9634 or instruction <> 29386 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 714).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9636 {
                if slot <= 9635 {
// PORT: SOURCE AOTMARK.agc:673
//		AD	BIT14
// PORT: Fixed ROM slots 9635.
                    if slot <> 9635 or instruction <> 27102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:674
//		TS	MARKSTAT
// PORT: Fixed ROM slots 9636.
                    if slot <> 9636 or instruction <> 23242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23242, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 9637 {
// PORT: SOURCE AOTMARK.agc:675
//
// PORT: SOURCE AOTMARK.agc:676
//SURFAGAN	CA	CURSOR
// PORT: Fixed ROM slots 9637.
                    if slot <> 9637 or instruction <> 12958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 670).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:677
//		INDEX	MKDEX		# HOLDS VAC AREA POINTER FOR SURF MARKING
// PORT: Fixed ROM slots 9638.
                    if slot <> 9638 or instruction <> 21354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21354, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[583] to agcAotUnit583@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:678
//		TS	1		# STORE CURSOR SP 2COMP
// PORT: Fixed ROM slots 9639.
    9639, 45058
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9640–9641.
function agcAotUnit584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9640 {
// PORT: SOURCE AOTMARK.agc:679
//		CA	SPIRAL
// PORT: Fixed ROM slots 9640.
        if slot <> 9640 or instruction <> 12960 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 672).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOTMARK.agc:680
//		INDEX	MKDEX
// PORT: Fixed ROM slots 9641.
        if slot <> 9641 or instruction <> 21354 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21354, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21354, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[584] to agcAotUnit584@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOTMARK.agc:681
//		TS	3		# STORE SPIRAL
// PORT: Fixed ROM slots 9642.
    9642, 45062
)).

// PORT: Physical bank 07. Shared continuation entries, slots 9643–9654.
function agcAotUnit585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 9648 {
        if slot <= 9645 {
            if slot <= 9643 {
// PORT: SOURCE AOTMARK.agc:682
//
// PORT: SOURCE AOTMARK.agc:683
//		CS	MARKSTAT	# IF BIT 14 SET -- END MARKING
// PORT: Fixed ROM slots 9643.
                if slot <> 9643 or instruction <> 17098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 714).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9644 {
// PORT: SOURCE AOTMARK.agc:684
//		MASK	BIT14
// PORT: Fixed ROM slots 9644.
                    if slot <> 9644 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
                } else {
// PORT: SOURCE AOTMARK.agc:685
//		EXTEND
// PORT: Fixed ROM slots 9645.
                    if slot <> 9645 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9646 {
// PORT: SOURCE AOTMARK.agc:686
//		BZF	MARKCHEX
// PORT: Fixed ROM slots 9646.
                if slot <> 9646 or instruction <> 5262 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5262, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9647 {
// PORT: SOURCE AOTMARK.agc:687
//		CA	MARKCNTR	# THIS IS RECYCLE -- SEE IF 5 MARKS ALREADY
// PORT: Fixed ROM slots 9647.
                    if slot <> 9647 or instruction <> 13160 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 872).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:688
//		AD	ONE
// PORT: Fixed ROM slots 9648.
                    if slot <> 9648 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 9651 {
            if slot <= 9649 {
// PORT: SOURCE AOTMARK.agc:689
//		COM
// PORT: Fixed ROM slots 9649.
                if slot <> 9649 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9650 {
// PORT: SOURCE AOTMARK.agc:690
//		AD	FIVE
// PORT: Fixed ROM slots 9650.
                    if slot <> 9650 or instruction <> 27118 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOTMARK.agc:691
//		EXTEND
// PORT: Fixed ROM slots 9651.
                    if slot <> 9651 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 9652 {
// PORT: SOURCE AOTMARK.agc:692
//		BZMF	5MKALARM	# CAN'T RECYCLE -- TOO MANY MARKS -- ALARM
// PORT: Fixed ROM slots 9652.
                if slot <> 9652 or instruction <> 25900 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 9653 {
// PORT: SOURCE AOTMARK.agc:693
//		INCR	MARKCNTR	# OF FOR RECYCLE -- INCR COUNTER
// PORT: Fixed ROM slots 9653.
                    if slot <> 9653 or instruction <> 11112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 872).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOTMARK.agc:694
//		TCF	GETMKS +3	# GO DISPLAY MARK VB
// PORT: Fixed ROM slots 9654.
                    if slot <> 9654 or instruction <> 5253 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5253, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[585] to agcAotUnit585@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE AOTMARK.agc:695
//
