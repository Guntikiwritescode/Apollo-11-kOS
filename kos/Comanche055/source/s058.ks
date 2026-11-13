// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc
// bank 22, slots 21287-21318
function agcAotUnit1208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21302 {
        if slot <= 21294 {
            if slot <= 21290 {
                if slot <= 21288 {
                    if slot <= 21287 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:1
//# Copyright:	Public domain.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:2
//# Filename:	RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:6
//# Assembler:	yaYUL
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:8
//# Website:	www.ibiblio.org/apollo.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:9
//# Pages:	1037-1038
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:11
//#				same name, using Comanche055 page images.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:12
//#		2009-05-20 RSB	A "Page N" comment was corrected.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:13
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:16
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:18
//# consequent reduction in image quality as well) are available online at
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:21
//# (much) higher-quality images which Fjeld Kerman actually created.
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:22
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:23
//# Notations on the hardcopy document read, in part:
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:24
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:25
//#	Assemble revision 055 of AGC program Comanche by NASA
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:26
//#	2021113-051.  10:28 APR. 1, 1969
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:27
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:28
//#	This AGC program shall also be referred to as
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:29
//#			Colossus 2A
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:30
//
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:31
//# Page 1037
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:32
//# CALCULATION OF  AMGB, AMBG  ONCE EVERY SECOND
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:33
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:34
//#	AMGB =	1	SIN(PSI)		0
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:35
//#		0	COS(PSI)COS(PHI)	SIN(PHI)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:36
//#		0	-COS(PSI)SIN(PHI)	COS(PHI)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:37
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:38
//#	AMBG =	1	-TAN(PSI)COS(PHI)	TAN(PSI)SIN(PHI)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:39
//#		0	COS(PHI)/COS(PSI)	-SIN(PHI)/COS(PSI)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:40
//#		0	SIN(PHI)		COS(PHI)
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:41
//#
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:42
//# WHERE PHI AND PSI ARE CDU ANGLES
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:43
//
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:44
//
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:45
//		BANK	20
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:46
//		SETLOC	DAPS8
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:47
//		BANK
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:48
//
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:49
//		COUNT*	$$/DAPEX
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:50
//		EBANK=	KMPAC
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:51
//AMBGUPDT	CA	FLAGWRD6	# CHECK FOR RCS AUTOPILOT
// slot 21287
                        if slot <> 21287 or instruction <> 12354 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:52
//		EXTEND
// slot 21288
                        if slot <> 21288 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21289 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:53
//		BZMF	ENDOFJOB	# BIT15 = 0, BIT14 = 1
// slot 21289
                        if slot <> 21289 or instruction <> 27279 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 27279, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:54
//		MASK	BIT14		# IF NOT RCS, EXIT
// slot 21290
                        if slot <> 21290 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                if slot <= 21292 {
                    if slot <= 21291 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:55
//		EXTEND
// slot 21291
                        if slot <> 21291 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:56
//		BZF	ENDOFJOB	# TO PROTECT TVC DAP ON SWITCHOVER
// slot 21292
                        if slot <> 21292 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21293 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:57
//
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:58
//		CA	CDUZ
// slot 21293
                        if slot <> 21293 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 28).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:59
//		TC	SPSIN2
// slot 21294
                        if slot <> 21294 or instruction <> 2621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2621, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21298 {
                if slot <= 21296 {
                    if slot <= 21295 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:60
//		TS	AMGB1		# CALCULATE AMGB
// slot 21295
                        if slot <> 21295 or instruction <> 23456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23456, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:61
//		CA	CDUZ
// slot 21296
                        if slot <> 21296 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 28).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21297 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:62
//		TC	SPCOS2
// slot 21297
                        if slot <> 21297 or instruction <> 2620 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2620, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:63
//		TS	CAPSI		# MUST CHECK FOR GIMBAL LOCK
// slot 21298
                        if slot <> 21298 or instruction <> 23461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21300 {
                    if slot <= 21299 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:64
//		CAF	QUADANGL	# = 7.25  DEGREES JET QUAD ANGULAR OFFSET
// slot 21299
                        if slot <> 21299 or instruction <> 14151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1863), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:65
//		EXTEND
// slot 21300
                        if slot <> 21300 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21301 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:66
//		MSU	CDUX
// slot 21301
                        if slot <> 21301 or instruction <> 8218 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:67
//		COM			# CDUX - 7.25 DEG
// slot 21302
                        if slot <> 21302 or instruction <> 16384 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 21310 {
            if slot <= 21306 {
                if slot <= 21304 {
                    if slot <= 21303 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:68
//		TC	SPCOS1
// slot 21303
                        if slot <> 21303 or instruction <> 2620 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2620, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:69
//		TS	AMGB8
// slot 21304
                        if slot <> 21304 or instruction <> 23460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23460, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21305 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:70
//		EXTEND
// slot 21305
                        if slot <> 21305 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:71
//		MP	CAPSI
// slot 21306
                        if slot <> 21306 or instruction <> 29605 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 933, readEffective:call(words, 933)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21308 {
                    if slot <= 21307 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:72
//		TS	AMGB4
// slot 21307
                        if slot <> 21307 or instruction <> 23457 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23457, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:73
//		CAF	QUADANGL
// slot 21308
                        if slot <> 21308 or instruction <> 14151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1863), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21309 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:74
//		EXTEND
// slot 21309
                        if slot <> 21309 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:75
//		MSU	CDUX
// slot 21310
                        if slot <> 21310 or instruction <> 8218 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21314 {
                if slot <= 21312 {
                    if slot <= 21311 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:76
//		COM			# CDUX - 7.25 DEG
// slot 21311
                        if slot <> 21311 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:77
//		TC	SPSIN1
// slot 21312
                        if slot <> 21312 or instruction <> 2621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2621, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21313 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:78
//		TS	AMGB5
// slot 21313
                        if slot <> 21313 or instruction <> 23458 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23458, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:79
//		EXTEND
// slot 21314
                        if slot <> 21314 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21316 {
                    if slot <= 21315 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:80
//		MP	CAPSI
// slot 21315
                        if slot <> 21315 or instruction <> 29605 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 933, readEffective:call(words, 933)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:81
//		COM
// slot 21316
                        if slot <> 21316 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21317 {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:82
//# Page 1038
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:83
//		TS	AMGB7
// slot 21317
                        if slot <> 21317 or instruction <> 23459 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23459, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:84
//		TCF	ENDOFJOB
// slot 21318
                        if slot <> 21318 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1208] to agcAotUnit1208@.

agcAotInstallSourceRope(list(
// RCS-CSM_DAP_EXECUTIVE_PROGRAMS.agc:85
//QUADANGL	DEC	660		# = 7.25 DEGREES
// slot 21319
    21319, 1320
)).

