// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc
// bank 31, slots 27920-27944
function agcAotUnit1764 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27931 {
        if slot <= 27925 {
            if slot <= 27922 {
                if slot <= 27920 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1
//# Copyright:	Public domain.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:2
//# Filename:	LUNAR_LANDING_GUIDANCE_EQUATIONS.agc
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:6
//# Assembler:	yaYUL
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:7
//# Contact:	HARTMUTH GUTSCHE <hgutsche@xplornet.com>.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:8
//# Website:	www.ibiblio.org/apollo.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:9
//# Pages:	798-828
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:11
//#		2009-06-05 RSB	Fixed a goofy thing that was apparently
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:12
//#				legal in GAP but not in yaYUL.  Eliminated
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:13
//#				a couple of lines of code that shouldn't
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:14
//#				have survived from Luminary 131 to here.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:15
//#		2009-06-07 RSB	Fixed a typo.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:16
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:17
//# This source code has been transcribed or otherwise adapted from
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:19
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:21
//# in storage size and consequent reduction in image quality as well) are
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:24
//# about getting access to the (much) higher-quality images which Paul
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:25
//# actually created.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:26
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:27
//# Notations on the hardcopy document read, in part:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:28
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:30
//#	16:27 JULY 14, 1969
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:31
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:32
//# Page 798
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:33
//		EBANK=	E2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:34
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:35
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:36
//# ********************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:37
//# LUNAR LANDING FLIGHT SEQUENCE TABLES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:38
//# ********************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:39
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:40
//# FLIGHT SEQUENCE TABLES ARE ARRANGED BY FUNCTION.  THEY ARE REFERENCED USING AS AN INDEX THE REGISTER WCHPHASE:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:41
//#	WCHPHASE = -1 ---> IGNALG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:42
//#	WCHPHASE =  0 ---> BRAKQUAD
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:43
//#	WCHPHASE =  1 ---> APPRQUAD
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:44
//#	WCHPHASE =  2 ---> VERTICAL
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:45
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:46
//#*********************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:47
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:48
//# ROUTINES FOR STARTING NEW GUIDANCE PHASES:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:49
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:50
//		TCF	TTFINCR		# IGNALG
// slot 27920
                    if slot <> 27920 or instruction <> 5537 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5537, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27921 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:51
//NEWPHASE	TCF	TTFINCR		# BRAKQUAD
// slot 27921
                        if slot <> 27921 or instruction <> 5537 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5537, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:52
//		TCF	STARTP64	# APPRQUAD
// slot 27922
                        if slot <> 27922 or instruction <> 5528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27923 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:53
//		TCF	P65START	# VERTICAL
// slot 27923
                    if slot <> 27923 or instruction <> 5521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27924 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:54
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:55
//# PRE-GUIDANCE COMPUTATIONS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:56
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:57
//		TCF	CALCRGVG	# IGNALG
// slot 27924
                        if slot <> 27924 or instruction <> 5635 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5635, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:58
//PREGUIDE	TCF	RGVGCALC	# BRAKQUAD
// slot 27925
                        if slot <> 27925 or instruction <> 5643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27928 {
                if slot <= 27926 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:59
//		TCF	REDESIG		# APPRQUAD
// slot 27926
                    if slot <> 27926 or instruction <> 5572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5572, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27927 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:60
//		TCF	RGVGCALC	# VERTICAL
// slot 27927
                        if slot <> 27927 or instruction <> 5643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:61
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:62
//# GUIDANCE EQUATIONS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:63
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:64
//		TCF	TTF/8CL		# IGNALG
// slot 27928
                        if slot <> 27928 or instruction <> 5681 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5681, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27929 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:65
//WHATGUID	TCF	TTF/8CL		# BRAKQUAD
// slot 27929
                    if slot <> 27929 or instruction <> 5681 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5681, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27930 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:66
//		TCF	TTF/8CL		# APPRQUAD
// slot 27930
                        if slot <> 27930 or instruction <> 5681 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5681, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:67
//		TCF	VERTGUID	# VERTICAL
// slot 27931
                        if slot <> 27931 or instruction <> 5977 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5977, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27937 {
            if slot <= 27934 {
                if slot <= 27932 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:68
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:69
//# POST GUIDANCE EQUATION COMPUTATIONS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:70
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:71
//		TCF	CGCALC		# IGNALG
// slot 27932
                    if slot <> 27932 or instruction <> 5797 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5797, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27933 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:72
//AFTRGUID	TCF	CGCALC		# BRAKQUAD
// slot 27933
                        if slot <> 27933 or instruction <> 5797 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5797, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:73
//		TCF	CGCALC		# APPRQUAD
// slot 27934
                        if slot <> 27934 or instruction <> 5797 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5797, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27935 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:74
//		TCF	STEER?		# VERTICAL
// slot 27935
                    if slot <> 27935 or instruction <> 5914 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5914, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27936 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:75
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:76
//# Page 799
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:77
//# WINDOW VECTOR COMPUTATIONS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:78
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:79
//		TCF	EXGSUB		# IGNALG
// slot 27936
                        if slot <> 27936 or instruction <> 5849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5849, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:80
//WHATEXIT	TCF	EXBRAK		# BRAKQUAD
// slot 27937
                        if slot <> 27937 or instruction <> 5866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5866, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27940 {
                if slot <= 27938 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:81
//		TCF	EXNORM		# APPRQUAD
// slot 27938
                    if slot <> 27938 or instruction <> 5872 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5872, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27939 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:82
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:83
//# DISPLAY ROUTINES:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:84
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:85
//WHATDISP	TCF	P63DISPS	# BRAKQUAD
// slot 27939
                        if slot <> 27939 or instruction <> 5947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5947, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:86
//		TCF	P64DISPS	# APPRQUAD
// slot 27940
                        if slot <> 27940 or instruction <> 5951 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5951, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27942 {
                    if slot <= 27941 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:87
//		TCF	VERTDISP	# VERTICAL
// slot 27941
                        if slot <> 27941 or instruction <> 5975 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5975, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:88
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:89
//# ALARM ROUTINE FOR TTF COMPUTATION:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:90
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:91
//		TCF	1406P00		# IGNALG
// slot 27942
                        if slot <> 27942 or instruction <> 6107 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6107, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27943 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:92
//WHATALM		TCF	1406ALM		# BRAKQUAD
// slot 27943
                        if slot <> 27943 or instruction <> 6109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6109, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:93
//		TCF	1406ALM		# APPRQUAD
// slot 27944
                        if slot <> 27944 or instruction <> 6109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6109, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1764] to agcAotUnit1764@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:94
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:95
//# INDICES FOR REFERENCING TARGET PARAMETERS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:96
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:97
//		OCT	0		# IGNALG
// slot 27945
    27945, 0,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:98
//TARGTDEX	OCT	0		# BRAKQUAD
// slot 27946
    27946, 0,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:99
//		OCT	34		# APPRQUAD
// slot 27947
    27947, 56,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:100
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:101
//#************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:102
//# ENTRY POINTS:  ?GUIDSUB FOR THE IGNITION ALGORITHM, LUNLAND FOR SERVOUT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:103
//#************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:104
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:105
//# IGNITION ALGORITHM ENTRY:  DELIVERS N PASSES OF QUADRATIC GUIDANCE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:106
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:107
//?GUIDSUB	EXIT
// slot 27948
    27948, 65532
)).

// bank 31, slots 27949-27954
function agcAotUnit1765 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27951 {
        if slot <= 27949 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:108
//		CAF	TWO		# N = 3
// slot 27949
            if slot <> 27949 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27950 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:109
//		TS	NGUIDSUB
// slot 27950
                if slot <> 27950 or instruction <> 23463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:110
//		TCF	GUILDRET +2
// slot 27951
                if slot <> 27951 or instruction <> 5507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5507, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27952 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:111
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:112
//GUIDSUB		TS	NGUIDSUB	# ON SUCCEEDING PASSES SKIP TTFINCR
// slot 27952
            if slot <> 27952 or instruction <> 23463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27953 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:113
//		TCF	CALCRGVG
// slot 27953
                if slot <> 27953 or instruction <> 5635 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5635, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:114
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:115
//# NORMAL ENTRY:  CONTROL COMES HERE FROM SERVOUT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:116
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:117
//LUNLAND		TC	PHASCHNG
// slot 27954
                if slot <> 27954 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1765] to agcAotUnit1765@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:118
//		OCT	00035		# GROUP 5:  RETAIN ONLY PIPA TASK
// slot 27955
    27955, 58
)).

// bank 31, slots 27956-27956
function agcAotUnit1766 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:119
//		TC	PHASCHNG
// slot 27956
    if slot <> 27956 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1766] to agcAotUnit1766@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:120
//		OCT	05023		# GROUP 3:  PROTECT GUIDANCE WITH PRIO 21
// slot 27957
    27957, 5158,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:121
//		OCT	21000		#	JUST HIGHER THAN SERVICER'S PRIORITY
// slot 27958
    27958, 17408
)).

// bank 31, slots 27959-27964
function agcAotUnit1767 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27961 {
        if slot <= 27959 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:122
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:123
//# Page 800
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:124
//#*******************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:125
//# GUILDENSTERN:  AUTO-MODES MONITOR (R13)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:126
//#*******************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:127
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:128
//		COUNT*	$$/R13
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:129
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:130
//# HERE IS THE PHILOSOPHY OF GUILDENSTERN:	ON EVERY APPEARANCE OR DISAPPEARANCE OF THE MANUAL THROTTLE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:131
//# DISCRETE TO SELECT P67 OR P66 RESPECTIVELY:   ON EVERY APPEARANCE OF THE ATTITUDE-HOLD DISCRETE TO SELECT P66
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:132
//# UNLESS THE CURRENT PROGRAM IS P67 IN WHICH CASE THERE IS NO CHANGE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:133
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:134
//GUILDEN		EXTEND			# IS UN-AUTO-THROTTLE DISCRETE PRESENT?
// slot 27959
            if slot <> 27959 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27960 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:135
//# STERN					# RSB 2009: Not originally a comment.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:136
// 		READ CHAN30
// slot 27960
                if slot <> 27960 or instruction <> 24 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 0, 24, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:137
//		MASK	BIT5
// slot 27961
                if slot <> 27961 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 27962 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:138
// 		CCS	A
// slot 27962
            if slot <> 27962 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27963 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:139
// 		TCF	STARTP67	# YES
// slot 27963
                if slot <> 27963 or instruction <> 5481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:140
//P67NOW?		TC	CHECKMM		# NO:  ARE WE IN P67 NOW?
// slot 27964
                if slot <> 27964 or instruction <> 2769 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2769, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1767] to agcAotUnit1767@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:141
//		DEC	67
// slot 27965
    27965, 134
)).

// bank 31, slots 27966-27968
function agcAotUnit1768 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27966 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:142
//		TCF	STABL?		# NO
// slot 27966
        if slot <> 27966 or instruction <> 5487 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5487, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 27967 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:143
//STARTP66	TC	FASTCHNG	# YES
// slot 27967
            if slot <> 27967 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:144
//		TC	NEWMODEX
// slot 27968
            if slot <> 27968 or instruction <> 2761 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2761, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1768] to agcAotUnit1768@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:145
//DEC66		DEC	66
// slot 27969
    27969, 132
)).

// bank 31, slots 27970-27973
function agcAotUnit1769 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27971 {
        if slot <= 27970 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:146
//		EXTEND
// slot 27970
            if slot <> 27970 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:147
//		DCA	HDOTDISP	# SET DESIRED ALTITUDE RATE = CURRENT
// slot 27971
            if slot <> 27971 or instruction <> 13116 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 828, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27972 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:148
//		DXCH	VDGVERT		# 	ALTITUDE RATE.
// slot 27972
            if slot <> 27972 or instruction <> 22437 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 933, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:149
//STRTP66A	TC	INTPRET
// slot 27973
            if slot <> 27973 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1769] to agcAotUnit1769@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:150
//		SLOAD	PUSH
// slot 27974
    27974, 34490,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:151
//			PBIASZ
// slot 27975
    27975, 1630,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:152
//		SLOAD	PUSH
// slot 27976
    27976, 34490,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:153
//			PBIASY
// slot 27977
    27977, 1626,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:154
//		SLOAD	VDEF
// slot 27978
    27978, 46778,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:155
//			PBIASX
// slot 27979
    27979, 1622,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:156
//		VXSC	SET
// slot 27980
    27980, 36066,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:157
//			BIASFACT
// slot 27981
    27981, 22206,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:158
//			RODFLAG
// slot 27982
    27982, 614,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:159
//		STOVL	VBIAS
// slot 27983
    27983, 23346,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:160
//			TEMX
// slot 27984
    27984, 1370,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:161
//		VCOMP
// slot 27985
    27985, 65404,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:162
//		STOVL	OLDPIPAX
// slot 27986
    27986, 24552,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:163
//			ZEROVECS
// slot 27987
    27987, 6820,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:164
//		STODL	DELVROD
// slot 27988
    27988, 16366,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:165
//			RODSCALE
// slot 27989
    27989, 2752,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:166
//		STODL	RODSCAL1
// slot 27990
    27990, 16350,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:167
//			PIPTIME
// slot 27991
    27991, 1338,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:168
//		STORE	LASTTPIP
// slot 27992
    27992, 4064,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:169
//		EXIT
// slot 27993
    27993, 65532
)).

// bank 31, slots 27994-28002
function agcAotUnit1770 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27997 {
        if slot <= 27995 {
            if slot <= 27994 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:170
//		CAF	ZERO
// slot 27994
                if slot <> 27994 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:171
//		TS	FCOLD
// slot 27995
                if slot <> 27995 or instruction <> 23440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27996 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:172
//		TS	FWEIGHT
// slot 27996
                if slot <> 27996 or instruction <> 23432 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23432, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:173
//		TS	FWEIGHT +1
// slot 27997
                if slot <> 27997 or instruction <> 23433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27999 {
            if slot <= 27998 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:174
//VRTSTART	TS	WCHVERT
// slot 27998
                if slot <> 27998 or instruction <> 23463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:175
//# Page 801
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:176
//		CAF	TWO		# WCHPHASE = 2 ---> VERTICAL: P65,P66,P67
// slot 27999
                if slot <> 27999 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
            if slot <= 28000 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:177
//		TS	WCHPHOLD
// slot 28000
                if slot <> 28000 or instruction <> 23441 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23441, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28001 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:178
//		TS	WCHPHASE
// slot 28001
                    if slot <> 28001 or instruction <> 23273 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23273, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:179
//		TC	BANKCALL	# TEMPORARY, I HOPE HOPE HOPE
// slot 28002
                    if slot <> 28002 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1770] to agcAotUnit1770@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:180
//		CADR	STOPRATE	# TEMPORARY, I HOPE HOPE HOPE
// slot 28003
    28003, 33002
)).

// bank 31, slots 28004-28004
function agcAotUnit1771 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:181
//		TC	DOWNFLAG	# PERMIT X-AXIS OVERRIDE
// slot 28004
    if slot <> 28004 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1771] to agcAotUnit1771@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:182
//		ADRES	XOVINFLG
// slot 28005
    28005, 402
)).

// bank 31, slots 28006-28006
function agcAotUnit1772 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:183
//		TC	DOWNFLAG
// slot 28006
    if slot <> 28006 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1772] to agcAotUnit1772@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:184
//		ADRES	REDFLAG
// slot 28007
    28007, 198
)).

// bank 31, slots 28008-28009
function agcAotUnit1773 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28008 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:185
//		TCF	VERTGUID
// slot 28008
        if slot <> 28008 or instruction <> 5977 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5977, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:186
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:187
//STARTP67	TC	NEWMODEX	# NO HARM IN "STARTING" P67 OVER AND OVER
// slot 28009
        if slot <> 28009 or instruction <> 2761 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2761, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1773] to agcAotUnit1773@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:188
//		DEC	67		# SO NO NEED FOR A FASTCHNG AND NO NEED
// slot 28010
    28010, 134
)).

// bank 31, slots 28011-28047
function agcAotUnit1774 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28028 {
        if slot <= 28019 {
            if slot <= 28014 {
                if slot <= 28012 {
                    if slot <= 28011 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:189
//		CAF	ZERO		# TO SEE IF ALREADY IN P67.
// slot 28011
                        if slot <> 28011 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:190
//		TS	RODCOUNT
// slot 28012
                        if slot <> 28012 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28013 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:191
//		CAF	TEN
// slot 28013
                        if slot <> 28013 or instruction <> 14579 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:192
//		TCF	VRTSTART
// slot 28014
                        if slot <> 28014 or instruction <> 5470 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5470, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28016 {
                    if slot <= 28015 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:193
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:194
//STABL?		CAF	BIT13		# IS UN-ATTITUDE-HOLD DISCRETE PRESENT?
// slot 28015
                        if slot <> 28015 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:195
//		EXTEND
// slot 28016
                        if slot <> 28016 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28017 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:196
//		RAND	CHAN31
// slot 28017
                        if slot <> 28017 or instruction <> 1049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28018 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:197
//		CCS	A
// slot 28018
                            if slot <> 28018 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:198
//		TCF	GUILDRET	# YES ALL'S WELL
// slot 28019
                            if slot <> 28019 or instruction <> 5505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5505, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 28023 {
                if slot <= 28021 {
                    if slot <= 28020 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:199
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:200
//P66NOW?		CS	MODREG
// slot 28020
                        if slot <> 28020 or instruction <> 16905 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 521).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:201
//		AD	DEC66
// slot 28021
                        if slot <> 28021 or instruction <> 25921 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1345), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28022 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:202
//		EXTEND
// slot 28022
                        if slot <> 28022 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:203
//		BZF	RESTART?
// slot 28023
                        if slot <> 28023 or instruction <> 5500 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5500, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28025 {
                    if slot <= 28024 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:204
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:205
//		CA	RODCOUNT	# NO. HAS THE ROD SWITCH BEEN "CLICKED"?
// slot 28024
                        if slot <> 28024 or instruction <> 13286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 998).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:206
//		EXTEND
// slot 28025
                        if slot <> 28025 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28026 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:207
//		BZF	GUILDRET	# NO. CONTINUE WITH AUTOMATIC LANDING
// slot 28026
                        if slot <> 28026 or instruction <> 5505 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5505, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28027 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:208
//		TCF	STARTP66	# YES. SWITCH INTO THE ROD MODE.
// slot 28027
                            if slot <> 28027 or instruction <> 5439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:209
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:210
//RESTART?	CA	FLAGWRD1	# HAS THERE BEEN A RESTART?
// slot 28028
                            if slot <> 28028 or instruction <> 12349 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 28037 {
            if slot <= 28032 {
                if slot <= 28030 {
                    if slot <= 28029 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:211
//		MASK	RODFLBIT
// slot 28029
                        if slot <> 28029 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:212
//		EXTEND
// slot 28030
                        if slot <> 28030 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28031 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:213
//		BZF	STRTP66A	# YES.  REINITIALIZE BUT LEAVE VDGVERT AS
// slot 28031
                        if slot <> 28031 or instruction <> 5445 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5445, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:214
//					#	IS.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:215
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:216
//		TCF	VERTGUID	# NO: CONTINUE WITH R.O.D.
// slot 28032
                        if slot <> 28032 or instruction <> 5977 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5977, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28034 {
                    if slot <= 28033 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:217
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:218
//# *******************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:219
//# INITIALIZATION FOR THIS PASS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:220
//# *******************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:221
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:222
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:223
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:224
//GUILDRET	CAF	ZERO
// slot 28033
                        if slot <> 28033 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:225
//		TS	RODCOUNT
// slot 28034
                        if slot <> 28034 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28035 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:226
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:227
//# Page 802
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:228
// +2		EXTEND
// slot 28035
                        if slot <> 28035 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28036 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:229
// 		DCA	TPIP
// slot 28036
                            if slot <> 28036 or instruction <> 13205 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 917, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:230
//		DXCH	TPIPOLD
// slot 28037
                            if slot <> 28037 or instruction <> 22396 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 892, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 28042 {
                if slot <= 28039 {
                    if slot <= 28038 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:231
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:232
//		TC	FASTCHNG
// slot 28038
                        if slot <> 28038 or instruction <> 2016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2016, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:233
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:234
//		EXTEND
// slot 28039
                        if slot <> 28039 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28040 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:235
//		DCA	PIPTIME1
// slot 28040
                        if slot <> 28040 or instruction <> 13169 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28041 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:236
//		DXCH	TPIP
// slot 28041
                            if slot <> 28041 or instruction <> 22421 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 917, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:237
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:238
//		EXTEND
// slot 28042
                            if slot <> 28042 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 28044 {
                    if slot <= 28043 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:239
//		DCA	TTF/8
// slot 28043
                        if slot <> 28043 or instruction <> 13219 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 931, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:240
//		DXCH	TTF/8TMP
// slot 28044
                        if slot <> 28044 or instruction <> 22379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 875, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28045 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:241
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:242
//		CCS	FLPASS0
// slot 28045
                        if slot <> 28045 or instruction <> 5011 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 915).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28046 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:243
//		TCF	TTFINCR
// slot 28046
                            if slot <> 28046 or instruction <> 5537 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5537, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:244
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:245
//BRSPOT1		INDEX	WCHPHASE
// slot 28047
                            if slot <> 28047 or instruction <> 21225 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21225, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21225, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1774] to agcAotUnit1774@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:246
//		TCF	NEWPHASE
// slot 28048
    28048, 10786
)).

// bank 31, slots 28049-28049
function agcAotUnit1775 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:247
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:248
//# ******************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:249
//# ROUTINES TO START NEW PHASES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:250
//# ******************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:251
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:252
//P65START	TC	NEWMODEX
// slot 28049
    if slot <> 28049 or instruction <> 2761 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2761, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1775] to agcAotUnit1775@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:253
//		DEC	65
// slot 28050
    28050, 130
)).

// bank 31, slots 28051-28053
function agcAotUnit1776 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28051 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:254
//		CS	TWO
// slot 28051
        if slot <> 28051 or instruction <> 18922 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28052 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:255
//		TS	WCHVERT
// slot 28052
            if slot <> 28052 or instruction <> 23463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:256
//		TC	DOWNFLAG	# PERMIT X-AXIS OVERRIDE
// slot 28053
            if slot <> 28053 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1776] to agcAotUnit1776@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:257
//		ADRES	XOVINFLG
// slot 28054
    28054, 402
)).

// bank 31, slots 28055-28056
function agcAotUnit1777 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28055 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:258
//		TCF	TTFINCR
// slot 28055
        if slot <> 28055 or instruction <> 5537 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5537, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:259
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:260
//STARTP64	TC	NEWMODEX
// slot 28056
        if slot <> 28056 or instruction <> 2761 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2761, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1777] to agcAotUnit1777@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:261
//		DEC	64
// slot 28057
    28057, 128
)).

// bank 31, slots 28058-28063
function agcAotUnit1778 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28060 {
        if slot <= 28058 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:262
//		CA	DELTTFAP	# AUGMENT TTF/8
// slot 28058
            if slot <> 28058 or instruction <> 13077 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 789).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28059 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:263
//		ADS	TTF/8TMP
// slot 28059
                if slot <> 28059 or instruction <> 12138 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 874).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:264
//		CA	BIT12		# ENABLE RUPT10
// slot 28060
                if slot <> 28060 or instruction <> 14816 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28061 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:265
//		EXTEND
// slot 28061
            if slot <> 28061 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28062 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:266
//		WOR	CHAN13
// slot 28062
                if slot <> 28062 or instruction <> 2571 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:267
//		TC	DOWNFLAG	# INITIALIZE REDESIGNATION FLAG
// slot 28063
                if slot <> 28063 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1778] to agcAotUnit1778@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:268
//		ADRES	REDFLAG
// slot 28064
    28064, 198
)).

// bank 31, slots 28065-28065
function agcAotUnit1779 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:269
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:270
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:271
//#		(CONTINUE TO TTFINCR)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:272
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:273
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:274
//# INCREMENT TTF/8, UPDATE LAND FOR LUNAR ROTATION, DO OTHER USEFUL THINGS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:275
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:276
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:277
//#	TTFINCR COMPUTATIONS ARE AS FOLLOWS --
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:278
//# Page 803
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:279
//#		TTF/8 UPDATED FOR TIME SINCE LAST PASS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:280
//#			TTF/8 = TTF/8 + (TPIP - TPIPOLD)/8
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:281
//#		LANDING SITE VECTOR UPDATED FOR LUNAR ROTATION:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:282
//#			____               ____   ____                   __
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:283
//#			LAND = /LAND/ UNIT(LAND - LAND(TPIP - TPIPOLD) * WM)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:284
//#		SLANT RANGE TO LANDING SITE, FOR DISPLAY:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:285
//#			                 ____   _
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:286
//#			RANGEDSP = ABVAL(LAND - R)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:287
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:288
//TTFINCR		TC	INTPRET
// slot 28065
    if slot <> 28065 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1779] to agcAotUnit1779@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:289
//		DLOAD	DSU
// slot 28066
    28066, 38346,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:290
//			TPIP
// slot 28067
    28067, 3882,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:291
//			TPIPOLD
// slot 28068
    28068, 3832,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:292
//		SLR	PUSH		# SHIFT SCALES DELTA TIME TO 2(17) CSECS
// slot 28069
    28069, 34402,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:293
//			11D
// slot 28070
    28070, 17688,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:294
//		VXSC	VXV
// slot 28071
    28071, 40418,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:295
//			LAND
// slot 28072
    28072, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:296
//			WM
// slot 28073
    28073, 2474,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:297
//		BVSU	RTB
// slot 28074
    28074, 40010,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:298
//			LAND
// slot 28075
    28075, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:299
//			NORMUNIT
// slot 28076
    28076, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:300
//		VXSC	VSL1
// slot 28077
    28077, 64226,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:301
//			/LAND/
// slot 28078
    28078, 2486,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:302
//		STODL	LANDTEMP
// slot 28079
    28079, 16074,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:303
//		EXIT
// slot 28080
    28080, 65532
)).

// bank 31, slots 28081-28098
function agcAotUnit1780 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28089 {
        if slot <= 28084 {
            if slot <= 28082 {
                if slot <= 28081 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:304
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:305
//		DXCH	MPAC
// slot 28081
                    if slot <> 28081 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:306
//		DAS	TTF/8TMP	# NOW HAVE INCREMENTED TTF/8 IN TTF/8TMP
// slot 28082
                    if slot <> 28082 or instruction <> 9067 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 875) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28083 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:307
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:308
//		TC	FASTCHNG
// slot 28083
                    if slot <> 28083 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:309
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:310
//		EXTEND
// slot 28084
                    if slot <> 28084 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28086 {
                if slot <= 28085 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:311
//		DCA	TTF/8TMP
// slot 28085
                    if slot <> 28085 or instruction <> 13163 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 875, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:312
//		DXCH	TTF/8
// slot 28086
                    if slot <> 28086 or instruction <> 22435 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 931, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28087 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:313
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:314
//		EXTEND
// slot 28087
                    if slot <> 28087 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28088 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:315
//		DCA	LANDTEMP
// slot 28088
                        if slot <> 28088 or instruction <> 13157 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 869, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:316
//		DXCH	LAND
// slot 28089
                        if slot <> 28089 or instruction <> 22429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 28093 {
            if slot <= 28091 {
                if slot <= 28090 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:317
//		EXTEND
// slot 28090
                    if slot <> 28090 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:318
//		DCA	LANDTEMP +2
// slot 28091
                    if slot <> 28091 or instruction <> 13159 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 871, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28092 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:319
//		DXCH	LAND     +2
// slot 28092
                    if slot <> 28092 or instruction <> 22431 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 927, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:320
//		EXTEND
// slot 28093
                    if slot <> 28093 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28095 {
                if slot <= 28094 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:321
//		DCA	LANDTEMP +4
// slot 28094
                    if slot <> 28094 or instruction <> 13161 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 873, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:322
//		DXCH	LAND	 +4
// slot 28095
                    if slot <> 28095 or instruction <> 22433 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 929, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28096 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:323
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:324
//# Page 804
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:325
//		TC	TDISPSET
// slot 28096
                    if slot <> 28096 or instruction <> 1988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28097 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:326
//		TC	FASTCHNG	# SINCE REDESIG MAY CHANGE LANDTEMP
// slot 28097
                        if slot <> 28097 or instruction <> 2016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2016, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:327
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:328
//BRSPOT2		INDEX	WCHPHASE
// slot 28098
                        if slot <> 28098 or instruction <> 21225 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21225, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21225, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1780] to agcAotUnit1780@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:329
//		TCF	PREGUIDE
// slot 28099
    28099, 10794
)).

// bank 31, slots 28100-28101
function agcAotUnit1781 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28100 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:330
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:331
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:332
//# LANDING SITE PERTURBATION EQUATIONS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:333
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:334
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:335
//REDESIG		CA	FLAGWRD6	# IS REDFLAG SET?
// slot 28100
        if slot <> 28100 or instruction <> 12354 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 66).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:336
//		MASK	REDFLBIT
// slot 28101
        if slot <> 28101 or instruction <> 31206 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            set words[0] to agcOverflowCorrected(words[0]).
            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
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
set agcAotRoutes[1781] to agcAotUnit1781@.

// bank 31, slots 28102-28120
function agcAotUnit1782 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28110 {
        if slot <= 28105 {
            if slot <= 28103 {
                if slot <= 28102 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:337
//		EXTEND
// slot 28102
                    if slot <> 28102 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:338
//		BZF	RGVGCALC	# NO:  SKIP REDESIGNATION LOGIC
// slot 28103
                    if slot <> 28103 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28104 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:339
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:340
//		CA	TREDES		# YES:  HAS TREDES REACHED ZERO?
// slot 28104
                    if slot <> 28104 or instruction <> 13238 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 950).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:341
//		EXTEND
// slot 28105
                    if slot <> 28105 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28107 {
                if slot <= 28106 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:342
//		BZF	RGVGCALC	# YES:  SKIP REDESIGNATION LOGIC
// slot 28106
                    if slot <> 28106 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:343
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:344
//		INHINT
// slot 28107
                    if slot <> 28107 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28108 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:345
//		CA	ELINCR1
// slot 28108
                    if slot <> 28108 or instruction <> 12983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 695).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28109 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:346
//		TS	ELINCR
// slot 28109
                        if slot <> 28109 or instruction <> 23404 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23404, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:347
//		CA	AZINCR1
// slot 28110
                        if slot <> 28110 or instruction <> 12982 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 694).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 28115 {
            if slot <= 28112 {
                if slot <= 28111 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:348
//		TS	AZINCR
// slot 28111
                    if slot <> 28111 or instruction <> 23406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23406, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:349
//		TC	FASTCHNG
// slot 28112
                    if slot <> 28112 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28113 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:350
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:351
//		CA	ZERO
// slot 28113
                    if slot <> 28113 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28114 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:352
//		TS	ELINCR1
// slot 28114
                        if slot <> 28114 or instruction <> 23223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23223, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:353
//		TS	AZINCR1
// slot 28115
                        if slot <> 28115 or instruction <> 23222 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23222, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28117 {
                if slot <= 28116 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:354
//		TS	ELINCR	+1
// slot 28116
                    if slot <> 28116 or instruction <> 23405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23405, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:355
//		TS	AZINCR  +1
// slot 28117
                    if slot <> 28117 or instruction <> 23407 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23407, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28118 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:356
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:357
//		CA	FIXLOC		# SET PD TO 0
// slot 28118
                    if slot <> 28118 or instruction <> 12368 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 80).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28119 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:358
//		TS	PUSHLOC
// slot 28119
                        if slot <> 28119 or instruction <> 22646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22646, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:359
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:360
//		TC	INTPRET
// slot 28120
                        if slot <> 28120 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1782] to agcAotUnit1782@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:361
//		VLOAD	VSU
// slot 28121
    28121, 43514,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:362
//			LAND
// slot 28122
    28122, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:363
//			R		#                 ____   _
// slot 28123
    28123, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:364
//		RTB	PUSH		# PUSH DOWN UNIT (LAND - R)
// slot 28124
    28124, 34360,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:365
//			NORMUNIT
// slot 28125
    28125, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:366
//		VXV	VSL1
// slot 28126
    28126, 64058,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:367
//			YNBPIP		#                    ___        ____   _
// slot 28127
    28127, 2264,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:368
//		VXSC	PDDL		# PUSH DOWN - ELINCR(YNB * UNIT(LAND - R))
// slot 28128
    28128, 54754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:369
//			ELINCR
// slot 28129
    28129, 3802,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:370
//			AZINCR
// slot 28130
    28130, 3806,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:371
//		VXSC	VSU
// slot 28131
    28131, 43490,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:372
//			YNBPIP
// slot 28132
    28132, 2264,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:373
//		VAD	PUSH		# RESULTING VECTOR IS 1/2 REAL SIZE
// slot 28133
    28133, 34394,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:374
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:375
//# Page 805
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:376
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:377
//		DLOAD	DSU		# MAKE SURE REDESIGNATION IS NOT
// slot 28134
    28134, 38346,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:378
//			0		# 	TOO CLOSE TO THE HORIZON.
// slot 28135
    28135, 2,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:379
//			DEPRCRIT
// slot 28136
    28136, 5984,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:380
//		BMN	DLOAD
// slot 28137
    28137, 58688,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:381
//			REDES1
// slot 28138
    28138, 52186,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:382
//			DEPRCRIT
// slot 28139
    28139, 5984,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:383
//		STORE	0
// slot 28140
    28140, 2,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:384
//REDES1		DLOAD	DSU
// slot 28141
    28141, 38346,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:385
//			LAND
// slot 28142
    28142, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:386
//			R
// slot 28143
    28143, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:387
//		DDV	VXSC
// slot 28144
    28144, 61810,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:388
//			0
// slot 28145
    28145, 2,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:389
//		VAD	UNIT
// slot 28146
    28146, 44634,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:390
//			R
// slot 28147
    28147, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:391
//		VXSC	VSL1
// slot 28148
    28148, 64226,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:392
//			/LAND/
// slot 28149
    28149, 2486,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:393
//		STORE	LANDTEMP
// slot 28150
    28150, 3786,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:394
//		EXIT			# LOOKANGL WILL BE COMPUTED AT RGVGCALC
// slot 28151
    28151, 65532
)).

// bank 31, slots 28152-28163
function agcAotUnit1783 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28157 {
        if slot <= 28154 {
            if slot <= 28152 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:395
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:396
//		TC	FASTCHNG
// slot 28152
                if slot <> 28152 or instruction <> 2016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28153 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:397
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:398
//		EXTEND
// slot 28153
                    if slot <> 28153 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:399
//		DCA	LANDTEMP
// slot 28154
                    if slot <> 28154 or instruction <> 13157 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 869, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28155 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:400
//		DXCH	LAND
// slot 28155
                if slot <> 28155 or instruction <> 22429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28156 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:401
//		EXTEND
// slot 28156
                    if slot <> 28156 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:402
//		DCA	LANDTEMP +2
// slot 28157
                    if slot <> 28157 or instruction <> 13159 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 871, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28160 {
            if slot <= 28158 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:403
//		DXCH	LAND +2
// slot 28158
                if slot <> 28158 or instruction <> 22431 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 927, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28159 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:404
//		EXTEND
// slot 28159
                    if slot <> 28159 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:405
//		DCA	LANDTEMP +4
// slot 28160
                    if slot <> 28160 or instruction <> 13161 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 873, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28161 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:406
//		DXCH	LAND +4
// slot 28161
                if slot <> 28161 or instruction <> 22433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 929, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28162 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:407
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:408
//		TCF	RGVGCALC
// slot 28162
                    if slot <> 28162 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:409
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:410
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:411
//# COMPUTE STATE IN GUIDANCE COORDINATES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:412
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:413
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:414
//#	RGVGCALC COMPUTATIONS ARE AS FOLLOWS:--
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:415
//#	VELOCITY RELATIVE TO THE SURFACE:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:416
//#		_______   _   _   __
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:417
//#		ANGTERM = V + R * WM
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:418
//#	STATE IN GUIDANCE COORDINATES:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:419
//#		___   *   _   ____
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:420
//#		RGU = CG (R - LAND)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:421
//#		___   *   _   __   _
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:422
//#		VGU = CG (V - WM * R)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:423
//# Page 806 actually starts one line earlier but that would separate the markers from their variables
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:424
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:425
//#	HORIZONTAL VELOCITY FOR DISPLAY
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:426
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:427
//#		VHORIZ = 8 ABVAL (0, VG , VG )
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:428
//#		                       2    1
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:429
//# 	DEPRESSION ANGLE FOR DISPLAY:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:430
//#		                       _   ____  ______
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:431
//#		LOOKANGL = ARCSIN(UNIT(R - LAND).XMBPIP)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:432
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:433
//CALCRGVG	TC	INTPRET		# IN IGNALG, COMPUTE V FROM INTEGRATION
// slot 28163
                    if slot <> 28163 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1783] to agcAotUnit1783@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:434
//		VLOAD	MXV		#	OUTPUT AND TRIM CORRECTION TERM
// slot 28164
    28164, 53754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:435
//			VATT1		#	COMPUTED LAST PASS AND LEFT IN UNFC/2
// slot 28165
    28165, 42,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:436
//			REFSMMAT
// slot 28166
    28166, 1976,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:437
//		VSR1	VAD
// slot 28167
    28167, 44516,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:438
//			UNFC/2
// slot 28168
    28168, 3416,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:439
//		STORE	V
// slot 28169
    28169, 3758,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:440
//		EXIT
// slot 28170
    28170, 65532
)).

// bank 31, slots 28171-28171
function agcAotUnit1784 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:441
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:442
//RGVGCALC	TC	INTPRET		# ENTER HERE TO RECOMPUTE RG AND VG
// slot 28171
    if slot <> 28171 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1784] to agcAotUnit1784@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:443
//		VLOAD	VXV
// slot 28172
    28172, 40442,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:444
//			R
// slot 28173
    28173, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:445
//			WM
// slot 28174
    28174, 2474,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:446
//		VAD	VSR2		# RESCALE TO UNITS OF 2(9) M/CS
// slot 28175
    28175, 57946,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:447
//			V
// slot 28176
    28176, 3758,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:448
//		STORE	ANGTERM
// slot 28177
    28177, 2410,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:449
//		MXV
// slot 28178
    28178, 65442,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:450
//			CG		# NO SHIFT SINCE ANGTERM IS DOUBLE SIZED
// slot 28179
    28179, 2822,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:451
//		STORE	VGU
// slot 28180
    28180, 3886,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:452
//		PDDL	VDEF		# FORM (0,VG ,VG ) IN UNITS OF 2(10) M/CS
// slot 28181
    28181, 46762,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:453
//			ZEROVECS	#           2   1
// slot 28182
    28182, 6820,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:454
//		ABVAL	SL3
// slot 28183
    28183, 43596,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:455
//		STOVL	VHORIZ		# VHORIZ FOR DISPLAY DURING P65.
// slot 28184
    28184, 22886,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:456
//			R		#           _   ____
// slot 28185
    28185, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:457
//		VSU	PUSH		# PUSH DOWN R - LAND
// slot 28186
    28186, 34386,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:458
//			LAND
// slot 28187
    28187, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:459
//		MXV	VSL1
// slot 28188
    28188, 64162,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:460
//			CG
// slot 28189
    28189, 2822,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:461
//		STORE	RGU
// slot 28190
    28190, 2878,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:462
//		ABVAL
// slot 28191
    28191, 65356,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:463
//		STOVL	RANGEDSP
// slot 28192
    28192, 23338,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:464
//		RTB	DOT		# NOW IN MPAC IS SINE(LOOKANGL)/4
// slot 28193
    28193, 41272,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:465
//			NORMUNIT
// slot 28194
    28194, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:466
//			XNBPIP
// slot 28195
    28195, 2252,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:467
//		EXIT
// slot 28196
    28196, 65532
)).

// bank 31, slots 28197-28201
function agcAotUnit1785 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28198 {
        if slot <= 28197 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:468
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:469
//		CA	FIXLOC		# RESET PUSH DOWN POINTER
// slot 28197
            if slot <> 28197 or instruction <> 12368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 80).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:470
//		TS	PUSHLOC
// slot 28198
            if slot <> 28198 or instruction <> 22646 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22646, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28199 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:471
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:472
//# Page 807
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:473
//		CA	MPAC		# COMPUTE LOOKANGLE ITSELF
// slot 28199
            if slot <> 28199 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28200 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:474
//		DOUBLE
// slot 28200
                if slot <> 28200 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:475
//		TC	BANKCALL
// slot 28201
                if slot <> 28201 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1785] to agcAotUnit1785@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:476
//		CADR	SPARCSIN -1
// slot 28202
    28202, 51060
)).

// bank 31, slots 28203-28207
function agcAotUnit1786 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28204 {
        if slot <= 28203 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:477
//		AD	1/2DEG
// slot 28203
            if slot <> 28203 or instruction <> 26603 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2027), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:478
//		EXTEND
// slot 28204
            if slot <> 28204 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28205 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:479
//		MP	180DEGS
// slot 28205
            if slot <> 28205 or instruction <> 30698 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2026, readEffective:call(words, 2026)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28206 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:480
//		TS	LOOKANGL	# LOOKANGL FOR DISPLAY DURING P64
// slot 28206
                if slot <> 28206 or instruction <> 23479 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23479, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:481
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:482
//BRSPOT3		INDEX	WCHPHASE
// slot 28207
                if slot <> 28207 or instruction <> 21225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21225, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1786] to agcAotUnit1786@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:483
//		TCF	WHATGUID
// slot 28208
    28208, 10802
)).

// bank 31, slots 28209-28209
function agcAotUnit1787 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:484
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:485
//# **************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:486
//# TTF/8 COMPUTATION
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:487
//# **************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:488
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:489
//TTF/8CL		TC	INTPRETX
// slot 28209
    if slot <> 28209 or instruction <> 1983 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1983, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1787] to agcAotUnit1787@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:490
//		DLOAD*
// slot 28210
    28210, 65478,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:491
//			JDG2TTF,1
// slot 28211
    28211, 2610,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:492
//		STODL*	TABLTTF +6	# A(3) = 8 JDG  TO TABLTTF
// slot 28212
    28212, 20210,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:493
//			ADG2TTF,1	#             2
// slot 28213
    28213, 2606,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:494
//		STODL	TABLTTF +4	# A(2) = 6 ADG  TO TABLTTF
// slot 28214
    28214, 16110,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:495
//			VGU 	+4	#             2
// slot 28215
    28215, 3894,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:496
//		DMP	DAD*
// slot 28216
    28216, 35594,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:497
//			3/4DP
// slot 28217
    28217, 5980,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:498
//			VDG2TTF,1
// slot 28218
    28218, 2602,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:499
//		STODL*	TABLTTF +2	# A(1) = (6 VGU  + 18 VDG )/8 TO TABLTTF
// slot 28219
    28219, 20202,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:500
//			RDG +4,1	#              2         2
// slot 28220
    28220, 2574,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:501
//		DSU	DMP
// slot 28221
    28221, 34090,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:502
//			RGU +4
// slot 28222
    28222, 2886,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:503
//			3/8DP
// slot 28223
    28223, 5976,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:504
//		STORE	TABLTTF		# A(0) = -24 (RGU  - RDG )/64 TO TABLTTF
// slot 28224
    28224, 3814,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:505
//		EXIT			#                2      2
// slot 28225
    28225, 65532
)).

// bank 31, slots 28226-28235
function agcAotUnit1788 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28230 {
        if slot <= 28227 {
            if slot <= 28226 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:506
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:507
//		CA	BIT8
// slot 28226
                if slot <> 28226 or instruction <> 14820 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:508
//		TS	TABLTTF +10	# FRACTIONAL PRECISION FOR TTF TO TABLE
// slot 28227
                if slot <> 28227 or instruction <> 23418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28228 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:509
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:510
//		EXTEND
// slot 28228
                if slot <> 28228 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28229 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:511
//		DCA	TTF/8
// slot 28229
                    if slot <> 28229 or instruction <> 13219 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 931, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:512
//		DXCH	MPAC		# LOADS TTF/8 (INITIAL GUESS) INTO MPAC
// slot 28230
                    if slot <> 28230 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28232 {
            if slot <= 28231 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:513
//		CAF	TWO		# DEGREE - ONE
// slot 28231
                if slot <> 28231 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:514
//		TS	L
// slot 28232
                if slot <> 28232 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28233 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:515
//		CAF	TABLTTFL
// slot 28233
                if slot <> 28233 or instruction <> 14310 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2022), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28234 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:516
//		TC	ROOTPSRS	# YIELDS TTF/8 IN MPAC
// slot 28234
                    if slot <> 28234 or instruction <> 1899 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1899, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:517
//		INDEX	WCHPHASE
// slot 28235
                    if slot <> 28235 or instruction <> 21225 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21225, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21225, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1788] to agcAotUnit1788@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:518
//		TCF	WHATALM
// slot 28236
    28236, 10830
)).

// bank 31, slots 28237-28259
function agcAotUnit1789 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28247 {
        if slot <= 28241 {
            if slot <= 28238 {
                if slot <= 28237 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:519
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:520
//		EXTEND			# GOOD RETURN
// slot 28237
                    if slot <> 28237 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:521
//		DCA	MPAC		# FETCH TTF/8 KEEPING IT IN MPAC
// slot 28238
                    if slot <> 28238 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28239 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:522
//		DXCH	TTF/8		# CORRECTED TTF/8
// slot 28239
                    if slot <> 28239 or instruction <> 22435 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 931, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28240 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:523
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:524
//# Page 808
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:525
//		TC	TDISPSET
// slot 28240
                        if slot <> 28240 or instruction <> 1988 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1988, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:526
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:527
//# 		(CONTINUE TO QUADGUID)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:528
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:529
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:530
//# MAIN GUIDANCE EQUATION
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:531
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:532
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:533
//#	AS PUBLISHED --
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:534
//#		              ___   __       ___   __
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:535
//#		___   ___   6(VDG + VG)   12(RDG - RG)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:536
//#		ACG = ADG + ----------- + ------------
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:537
//#		                TTF        (TTF)(TTF)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:538
//#	AS HERE PROGRAMMED --
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:539
//#		             ___   __
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:540
//#		      3 (1/4(RDG - RG)   ___   __)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:541
//#		      - (------------- + VDG + VG)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:542
//#		___   4 (    TTF/8               )   ___
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:543
//#		ACG = ---------------------------- + ADG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:544
//#		                  TTF/8
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:545
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:546
//QUADGUID	CS	TTF/8
// slot 28241
                        if slot <> 28241 or instruction <> 17314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 930).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28244 {
                if slot <= 28242 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:547
//		AD	LEADTIME	# LEADTIME IS A NEGATIVE NUMBER
// slot 28242
                    if slot <> 28242 or instruction <> 25366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 790).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28243 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:548
//		AD	POSMAX		# SAFEGUARD THE COMPUTATIONS THAT FOLLOW
// slot 28243
                        if slot <> 28243 or instruction <> 27099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:549
//		TS	L		#	BY FORCING -TTF*LEADTIME > OR = ZERO
// slot 28244
                        if slot <> 28244 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28245 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:550
//		CS	L
// slot 28245
                    if slot <> 28245 or instruction <> 16385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 1).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28246 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:551
//		AD	L
// slot 28246
                        if slot <> 28246 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:552
//		ZL
// slot 28247
                        if slot <> 28247 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 28253 {
            if slot <= 28250 {
                if slot <= 28248 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:553
//		EXTEND
// slot 28248
                    if slot <> 28248 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28249 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:554
//		DV	TTF/8
// slot 28249
                        if slot <> 28249 or instruction <> 5026 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 930, readEffective:call(words, 930)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:555
//		TS	BUF		# - RATIO OF LAG-DIMINISHED TTF TO TTF
// slot 28250
                        if slot <> 28250 or instruction <> 22616 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22616, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28251 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:556
//		EXTEND
// slot 28251
                    if slot <> 28251 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28252 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:557
//		SQUARE
// slot 28252
                        if slot <> 28252 or instruction <> 28672 { return choose false if checkOnly else -1. }
                        if extended {
                            if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 0, readEffective:call(words, 0)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:558
//		TS	BUF +1
// slot 28253
                        if slot <> 28253 or instruction <> 22617 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22617, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28256 {
                if slot <= 28254 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:559
//		AD	BUF
// slot 28254
                    if slot <> 28254 or instruction <> 24664 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28255 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:560
//		XCH	BUF +1		# RATIO SQUARED - RATIO
// slot 28255
                        if slot <> 28255 or instruction <> 23641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 89, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:561
//		AD	BUF +1
// slot 28256
                        if slot <> 28256 or instruction <> 24665 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 89).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28257 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:562
//		TS	MPAC		# COEFFICIENT FOR VGU TERM
// slot 28257
                    if slot <> 28257 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28258 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:563
//		AD	BUF +1
// slot 28258
                        if slot <> 28258 or instruction <> 24665 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 89).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:564
//		INDEX	FIXLOC
// slot 28259
                        if slot <> 28259 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1789] to agcAotUnit1789@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:565
//		TS	26D		# COEFFICIENT FOR RDG-RGU TERM
// slot 28260
    28260, 45108
)).

// bank 31, slots 28261-28262
function agcAotUnit1790 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28261 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:566
//		AD	BUF +1
// slot 28261
        if slot <> 28261 or instruction <> 24665 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 89).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:567
//		INDEX	FIXLOC
// slot 28262
        if slot <> 28262 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1790] to agcAotUnit1790@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:568
//		TS	28D		# COEFFICIENT FOR VDG TERM
// slot 28263
    28263, 45112
)).

// bank 31, slots 28264-28268
function agcAotUnit1791 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28265 {
        if slot <= 28264 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:569
//		AD	BUF
// slot 28264
            if slot <> 28264 or instruction <> 24664 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 88).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:570
//		AD	POSMAX
// slot 28265
            if slot <> 28265 or instruction <> 27099 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28266 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:571
//# Page 809
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:572
//		AD	BUF +1
// slot 28266
            if slot <> 28266 or instruction <> 24665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 89).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28267 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:573
//		AD	BUF +1
// slot 28267
                if slot <> 28267 or instruction <> 24665 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 89).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:574
//		INDEX	FIXLOC
// slot 28268
                if slot <> 28268 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1791] to agcAotUnit1791@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:575
//		TS	30D		# COEFFICIENT FOR ADG TERM
// slot 28269
    28269, 45116
)).

// bank 31, slots 28270-28272
function agcAotUnit1792 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28270 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:576
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:577
//		CAF	ZERO
// slot 28270
        if slot <> 28270 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28271 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:578
//		TS	MODE
// slot 28271
            if slot <> 28271 or instruction <> 22643 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22643, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:579
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:580
//		TC	INTPRETX
// slot 28272
            if slot <> 28272 or instruction <> 1983 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1983, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1792] to agcAotUnit1792@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:581
//		VXSC	PDDL
// slot 28273
    28273, 54754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:582
//			VGU
// slot 28274
    28274, 3886,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:583
//			28D
// slot 28275
    28275, 58,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:584
//		VXSC*	PDVL*
// slot 28276
    28276, 52190,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:585
//			VDG,1
// slot 28277
    28277, 2578,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:586
//			RDG,1
// slot 28278
    28278, 2566,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:587
//		VSU	V/SC
// slot 28279
    28279, 57682,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:588
//			RGU
// slot 28280
    28280, 2878,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:589
//			TTF/8
// slot 28281
    28281, 3910,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:590
//		VSR2	VXSC
// slot 28282
    28282, 61892,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:591
//			26D
// slot 28283
    28283, 54,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:592
//		VAD	VAD
// slot 28284
    28284, 44378,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:593
//		V/SC	VXSC
// slot 28285
    28285, 61890,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:594
//			TTF/8
// slot 28286
    28286, 3910,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:595
//			3/4DP
// slot 28287
    28287, 5980,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:596
//		PDDL	VXSC*
// slot 28288
    28288, 61354,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:597
//			30D
// slot 28289
    28289, 62,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:598
//			ADG,1
// slot 28290
    28290, 2590,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:599
//		VAD
// slot 28291
    28291, 65370,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:600
//AFCCALC1	VXM	VSL1		# VERGUID COMES HERE
// slot 28292
    28292, 64138,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:601
//			CG
// slot 28293
    28293, 2822,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:602
//		PDVL	V/SC
// slot 28294
    28294, 57754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:603
//			GDT/2
// slot 28295
    28295, 1342,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:604
//			GSCALE
// slot 28296
    28296, 5972,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:605
//		BVSU	STADR
// slot 28297
    28297, 38474,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:606
//		STORE	UNFC/2		# UNFC/2 NEED NOT BE UNITIZED
// slot 28298
    28298, 62118,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:607
//		ABVAL
// slot 28299
    28299, 65356,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:608
//AFCCALC2	STODL	/AFC/		# MAGNITUDE OF AFC FOR THROTTLE
// slot 28300
    28300, 15976,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:609
//			UNFC/2		# VERTICAL COMPONENT
// slot 28301
    28301, 3416,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:610
//		DSQ	PDDL
// slot 28302
    28302, 54684,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:611
//			UNFC/2 +2	# OUT-OF-PLANE
// slot 28303
    28303, 3420,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:612
//		DSQ	PDDL
// slot 28304
    28304, 54684,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:613
//			HIGHESTF
// slot 28305
    28305, 5968,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:614
//		DDV	DSQ
// slot 28306
    28306, 52850,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:615
//			MASS		#                        2    2    2
// slot 28307
    28307, 1354,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:616
//		DSU	DSU		# AMAXHORIZ = SQRT(ATOTAL - A  - A  )
// slot 28308
    28308, 38186,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:617
//		BPL	DLOAD		#                            1    0
// slot 28309
    28309, 58696,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:618
//			AFCCALC3
// slot 28310
    28310, 52528,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:619
//			ZEROVECS
// slot 28311
    28311, 6820,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:620
//AFCCALC3	SQRT	DAD
// slot 28312
    28312, 36332,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:621
//			UNFC/2 +4
// slot 28313
    28313, 3424,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:622
//# Page 810
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:623
//		BPL	BDSU
// slot 28314
    28314, 37192,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:624
//			AFCCLEND
// slot 28315
    28315, 52540,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:625
//			UNFC/2 +4
// slot 28316
    28316, 3424,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:626
//		STORE	UNFC/2 +4
// slot 28317
    28317, 3424,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:627
//AFCCLEND	EXIT
// slot 28318
    28318, 65532
)).

// bank 31, slots 28319-28323
function agcAotUnit1793 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28320 {
        if slot <= 28319 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:628
//		TC	FASTCHNG
// slot 28319
            if slot <> 28319 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:629
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:630
//		CA	WCHPHASE	# PREPARE FOR PHASE SWITCHING LOGIC
// slot 28320
            if slot <> 28320 or instruction <> 13033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 745).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28321 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:631
//		TS	WCHPHOLD
// slot 28321
            if slot <> 28321 or instruction <> 23441 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23441, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28322 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:632
//		INCR	FLPASS0		# INCREMENT PASS COUNTER
// slot 28322
                if slot <> 28322 or instruction <> 11155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 915).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:633
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:634
//BRSPOT4		INDEX	WCHPHASE
// slot 28323
                if slot <> 28323 or instruction <> 21225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21225, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1793] to agcAotUnit1793@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:635
//		TCF	AFTRGUID
// slot 28324
    28324, 10810
)).

// bank 31, slots 28325-28328
function agcAotUnit1794 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28326 {
        if slot <= 28325 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:636
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:637
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:638
//# ERECT GUIDANCE-STABLE MEMBER TRANSFORMATION MATRIX
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:639
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:640
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:641
//CGCALC		CAF	EBANK5
// slot 28325
            if slot <> 28325 or instruction <> 14860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:642
//		TS	EBANK
// slot 28326
            if slot <> 28326 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28327 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:643
//		EBANK=	TCGIBRAK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:644
//		EXTEND
// slot 28327
            if slot <> 28327 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:645
//		INDEX	WCHPHASE
// slot 28328
            if slot <> 28328 or instruction <> 21225 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21225, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21225, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1794] to agcAotUnit1794@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:646
//		INDEX	TARGTDEX
// slot 28329
    28329, 43604,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:647
//		DCA	TCGFBRAK
// slot 28330
    28330, 26170
)).

// bank 31, slots 28331-28341
function agcAotUnit1795 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28335 {
        if slot <= 28332 {
            if slot <= 28331 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:648
//		INCR	BBANK
// slot 28331
                if slot <> 28331 or instruction <> 10246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:649
//		INCR	BBANK
// slot 28332
                if slot <> 28332 or instruction <> 10246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28333 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:650
//		EBANK=	TTF/8
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:651
//		AD	TTF/8
// slot 28333
                if slot <> 28333 or instruction <> 25506 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 930).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28334 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:652
//		XCH	L
// slot 28334
                    if slot <> 28334 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:653
//		AD	TTF/8
// slot 28335
                    if slot <> 28335 or instruction <> 25506 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 930).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28338 {
            if slot <= 28336 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:654
//		CCS	A
// slot 28336
                if slot <> 28336 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28337 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:655
//		CCS	L
// slot 28337
                    if slot <> 28337 or instruction <> 4097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:656
//		TCF	EXTLOGIC
// slot 28338
                    if slot <> 28338 or instruction <> 5835 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5835, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28339 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:657
//		TCF	EXTLOGIC
// slot 28339
                if slot <> 28339 or instruction <> 5835 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5835, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28340 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:658
//		NOOP
// slot 28340
                    if slot <> 28340 or instruction <> 5813 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5813, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:659
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:660
//		TC	INTPRETX
// slot 28341
                    if slot <> 28341 or instruction <> 1983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1795] to agcAotUnit1795@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:661
//		VLOAD	UNIT
// slot 28342
    28342, 44794,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:662
//			LAND
// slot 28343
    28343, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:663
//		STODL	CG
// slot 28344
    28344, 15110,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:664
//			TTF/8
// slot 28345
    28345, 3910,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:665
//		DMP*	VXSC
// slot 28346
    28346, 61702,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:666
//			GAINBRAK,1	# NUMERO MYSTERIOSO
// slot 28347
    28347, 2614,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:667
//			ANGTERM
// slot 28348
    28348, 2410,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:668
//		VAD
// slot 28349
    28349, 65370,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:669
//			LAND
// slot 28350
    28350, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:670
//		VSU	RTB
// slot 28351
    28351, 40018,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:671
//			R
// slot 28352
    28352, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:672
//			NORMUNIT
// slot 28353
    28353, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:673
//# Page 811
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:674
//		VXV	RTB
// slot 28354
    28354, 39994,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:675
//			LAND
// slot 28355
    28355, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:676
//			NORMUNIT
// slot 28356
    28356, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:677
//		STOVL	CG +6		# SECOND ROW
// slot 28357
    28357, 23314,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:678
//			CG
// slot 28358
    28358, 2822,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:679
//		VXV	VSL1
// slot 28359
    28359, 64058,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:680
//			CG +6
// slot 28360
    28360, 2834,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:681
//		STORE	CG +14
// slot 28361
    28361, 2846,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:682
//		EXIT
// slot 28362
    28362, 65532
)).

// bank 31, slots 28363-28363
function agcAotUnit1796 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:683
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:684
//#		(CONTINUE TO EXTLOGIC)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:685
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:686
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:687
//# PREPARE TO EXIT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:688
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:689
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:690
//# DECIDE (1) HOW TO EXIT, AND (2) WHETHER TO SWITCH PHASES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:691
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:692
//EXTLOGIC	INDEX	WCHPHASE	# WCHPHASE = 1   APPRQUAD
// slot 28363
    if slot <> 28363 or instruction <> 21225 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21225, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21225, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1796] to agcAotUnit1796@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:693
//		CA	TENDBRAK	# WCHPHASE = 0   BRAKQUAD
// slot 28364
    28364, 26150
)).

// bank 31, slots 28365-28367
function agcAotUnit1797 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28365 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:694
//		AD	TTF/8
// slot 28365
        if slot <> 28365 or instruction <> 25506 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 930).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28366 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:695
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:696
//EXSPOT1		EXTEND
// slot 28366
            if slot <> 28366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:697
//		INDEX	WCHPHASE
// slot 28367
            if slot <> 28367 or instruction <> 21225 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21225, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21225, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1797] to agcAotUnit1797@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:698
//		BZMF	WHATEXIT
// slot 28368
    28368, 51778
)).

// bank 31, slots 28369-28375
function agcAotUnit1798 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28371 {
        if slot <= 28369 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:699
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:700
//		TC	FASTCHNG
// slot 28369
            if slot <> 28369 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28370 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:701
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:702
//		CA	WCHPHOLD
// slot 28370
                if slot <> 28370 or instruction <> 13201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 913).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:703
//		AD	ONE
// slot 28371
                if slot <> 28371 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 28373 {
            if slot <= 28372 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:704
//		TS	WCHPHASE
// slot 28372
                if slot <> 28372 or instruction <> 23273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:705
//		CA	ZERO
// slot 28373
                if slot <> 28373 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 28374 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:706
//		TS	FLPASS0		# RESET FLPASS0
// slot 28374
                if slot <> 28374 or instruction <> 23443 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23443, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:707
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:708
//		INDEX	WCHPHOLD
// slot 28375
                if slot <> 28375 or instruction <> 21393 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21393, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1798] to agcAotUnit1798@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:709
//		TCF	WHATEXIT
// slot 28376
    28376, 10818
)).

// bank 31, slots 28377-28377
function agcAotUnit1799 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:710
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:711
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:712
//# ROUTINES FOR EXITING FROM LANDING GUIDANCE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:713
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:714
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:715
//# 1.	EXGSUB IS THE RETURN WHEN GUIDSUB IS CALLED BY THE IGNITION ALGORITHM.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:716
//# 2.	EXBRAK IN THE EXIT USED DURING THE BRAKING PHASE.  IN THIS CASE UNIT(R) IS THE WINDOW POINTING VECTOR.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:717
//# 3.	EXNORM IS THE EXIT USED AT OTHER TIMES DURING THE BURN.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:718
//# (EXOVFLOW IS A SUBROUTINE OF EXBRAK AND EXNORM CALLED WHEN OVERFLOW OCCURRED ANYWHERE IN GUIDANCE.)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:719
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:720
//EXGSUB		TC	INTPRET		# COMPUTE TRIM VELOCITY CORRECTION TERM.
// slot 28377
    if slot <> 28377 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1799] to agcAotUnit1799@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:721
//# Page 812
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:722
//		VLOAD	RTB
// slot 28378
    28378, 40186,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:723
//			UNFC/2
// slot 28379
    28379, 3416,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:724
//			NORMUNIT
// slot 28380
    28380, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:725
//		VXSC	VXSC
// slot 28381
    28381, 61922,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:726
//			ZOOMTIME
// slot 28382
    28382, 3622,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:727
//			TRIMACCL
// slot 28383
    28383, 18434,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:728
//		STORE	UNFC/2
// slot 28384
    28384, 3416,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:729
//		EXIT
// slot 28385
    28385, 65532
)).

// bank 31, slots 28386-28390
function agcAotUnit1800 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28387 {
        if slot <= 28386 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:730
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:731
//		CCS	NGUIDSUB
// slot 28386
            if slot <> 28386 or instruction <> 5031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 935).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:732
//		TCF	GUIDSUB
// slot 28387
            if slot <> 28387 or instruction <> 5424 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5424, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28388 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:733
//		CCS	NIGNLOOP
// slot 28388
            if slot <> 28388 or instruction <> 5030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 934).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28389 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:734
//		TCF	+3
// slot 28389
                if slot <> 28389 or instruction <> 5864 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5864, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:735
//		TC	ALARM
// slot 28390
                if slot <> 28390 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1800] to agcAotUnit1800@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:736
//		OCT	01412
// slot 28391
    28391, 1556
)).

// bank 31, slots 28392-28392
function agcAotUnit1801 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:737
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:738
// +3		TC	POSTJUMP
// slot 28392
    if slot <> 28392 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1801] to agcAotUnit1801@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:739
// 		CADR	DDUMCALC
// slot 28393
    28393, 54404
)).

// bank 31, slots 28394-28394
function agcAotUnit1802 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:740
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:741
//EXBRAK		TC	INTPRET
// slot 28394
    if slot <> 28394 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1802] to agcAotUnit1802@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:742
//		VLOAD
// slot 28395
    28395, 65530,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:743
//			UNIT/R/
// slot 28396
    28396, 3774,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:744
//		STORE	UNWC/2
// slot 28397
    28397, 3428,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:745
//		EXIT
// slot 28398
    28398, 65532
)).

// bank 31, slots 28399-28400
function agcAotUnit1803 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28399 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:746
//		TCF	STEER?
// slot 28399
        if slot <> 28399 or instruction <> 5914 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5914, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:747
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:748
//EXNORM		TC	INTPRET
// slot 28400
        if slot <> 28400 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1803] to agcAotUnit1803@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:749
//		VLOAD	VSU
// slot 28401
    28401, 43514,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:750
//			LAND
// slot 28402
    28402, 3898,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:751
//			R
// slot 28403
    28403, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:752
//		RTB
// slot 28404
    28404, 65336,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:753
//			NORMUNIT
// slot 28405
    28405, 18348,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:754
//		STORE	UNWC/2		# UNIT(LAND - R) IS TENTATIVE CHOICE
// slot 28406
    28406, 3428,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:755
//		VXV	DOT
// slot 28407
    28407, 41274,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:756
//			XNBPIP
// slot 28408
    28408, 2252,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:757
//			CG +6
// slot 28409
    28409, 2834,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:758
//		EXIT			# WITH PROJ IN MPAC 1/8 REAL SIZE
// slot 28410
    28410, 65532
)).

// bank 31, slots 28411-28411
function agcAotUnit1804 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:759
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:760
//		CS	MPAC		# GET COEFFICIENT FOR CG +14
// slot 28411
    if slot <> 28411 or instruction <> 16492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        agcCoreCS(words, 108).
        return list(false, false, true, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1804] to agcAotUnit1804@.

// bank 31, slots 28412-28430
function agcAotUnit1805 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28420 {
        if slot <= 28415 {
            if slot <= 28413 {
                if slot <= 28412 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:761
//		AD	PROJMAX
// slot 28412
                    if slot <> 28412 or instruction <> 26604 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:762
//		AD	POSMAX
// slot 28413
                    if slot <> 28413 or instruction <> 27099 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28414 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:763
//		TS	BUF
// slot 28414
                    if slot <> 28414 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:764
//		CS	BUF
// slot 28415
                    if slot <> 28415 or instruction <> 16472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 88).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28417 {
                if slot <= 28416 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:765
//		ADS	BUF		# RESULT IS 0 IF PROJMAX - PROJ NEGATIVE
// slot 28416
                    if slot <> 28416 or instruction <> 11352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:766
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:767
//		CS	PROJMIN		# GET COEFFICIENT FOR UNIT(LAND - R)
// slot 28417
                    if slot <> 28417 or instruction <> 18413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2029), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28418 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:768
//		AD	MPAC
// slot 28418
                    if slot <> 28418 or instruction <> 24684 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28419 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:769
//		AD	POSMAX
// slot 28419
                        if slot <> 28419 or instruction <> 27099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:770
//		TS	BUF +1
// slot 28420
                        if slot <> 28420 or instruction <> 22617 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22617, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 28425 {
            if slot <= 28422 {
                if slot <= 28421 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:771
//		CS	BUF +1
// slot 28421
                    if slot <> 28421 or instruction <> 16473 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 89).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:772
//# Page 813
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:773
//		ADS	BUF +1		# RESULT IS 0 IF PROJ - PROJMIN NEGATIVE
// slot 28422
                    if slot <> 28422 or instruction <> 11353 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 89).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28423 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:774
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:775
//		CAF	FOUR
// slot 28423
                    if slot <> 28423 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28424 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:776
//UNWCLOOP	MASK	SIX
// slot 28424
                        if slot <> 28424 or instruction <> 31906 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                            if fixedOperand = 6 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:777
//		TS	Q
// slot 28425
                        if slot <> 28425 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28427 {
                if slot <= 28426 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:778
//		CA	EBANK5
// slot 28426
                    if slot <> 28426 or instruction <> 14860 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:779
//		TS	EBANK
// slot 28427
                    if slot <> 28427 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28428 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:780
//		EBANK=	CG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:781
//		CA	BUF
// slot 28428
                    if slot <> 28428 or instruction <> 12376 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28429 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:782
//		EXTEND
// slot 28429
                        if slot <> 28429 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:783
//		INDEX	Q
// slot 28430
                        if slot <> 28430 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1805] to agcAotUnit1805@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:784
//		MP	CG +14
// slot 28431
    28431, 59164
)).

// bank 31, slots 28432-28433
function agcAotUnit1806 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28432 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:785
//		INCR	BBANK
// slot 28432
        if slot <> 28432 or instruction <> 10246 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 6).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:786
//		EBANK=	UNWC/2
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:787
//		INDEX	Q
// slot 28433
        if slot <> 28433 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1806] to agcAotUnit1806@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:788
//		DXCH	UNWC/2
// slot 28434
    28434, 44900
)).

// bank 31, slots 28435-28437
function agcAotUnit1807 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28435 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:789
//		EXTEND
// slot 28435
        if slot <> 28435 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28436 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:790
//		MP	BUF +1
// slot 28436
            if slot <> 28436 or instruction <> 28761 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 89, readEffective:call(words, 89)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:791
//		INDEX	Q
// slot 28437
            if slot <> 28437 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1807] to agcAotUnit1807@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:792
//		DAS	UNWC/2
// slot 28438
    28438, 18276
)).

// bank 31, slots 28439-28449
function agcAotUnit1808 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28443 {
        if slot <= 28440 {
            if slot <= 28439 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:793
//		CCS	Q
// slot 28439
                if slot <> 28439 or instruction <> 4098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:794
//		TCF	UNWCLOOP
// slot 28440
                if slot <> 28440 or instruction <> 5896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5896, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28441 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:795
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:796
//		INCR	BBANK
// slot 28441
                if slot <> 28441 or instruction <> 10246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28442 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:797
//		EBANK=	PIF
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:798
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:799
//STEER?		CA	FLAGWRD2	# IF STEERSW DOWN NO OUTPUTS
// slot 28442
                    if slot <> 28442 or instruction <> 12350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:800
//		MASK	STEERBIT
// slot 28443
                    if slot <> 28443 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 28446 {
            if slot <= 28444 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:801
//		EXTEND
// slot 28444
                if slot <> 28444 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28445 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:802
//		BZF	RATESTOP
// slot 28445
                    if slot <> 28445 or instruction <> 5923 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5923, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:803
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:804
//EXVERT		CA	OVFIND		# IF OVERFLOW ANYWHERE IN GUIDANCE
// slot 28446
                    if slot <> 28446 or instruction <> 12369 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 81).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28447 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:805
//		EXTEND			#	DON'T CALL THROTTLE OR FINDCDUW
// slot 28447
                if slot <> 28447 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28448 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:806
//		BZF	+13
// slot 28448
                    if slot <> 28448 or instruction <> 5931 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:807
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:808
//EXOVFLOW	TC	ALARM		# SOUND THE ALARM NON-ABORTIVELY
// slot 28449
                    if slot <> 28449 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1808] to agcAotUnit1808@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:809
//		OCT	01410
// slot 28450
    28450, 1552
)).

// bank 31, slots 28451-28456
function agcAotUnit1809 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28453 {
        if slot <= 28451 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:810
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:811
//RATESTOP	CAF	BIT13		# ARE WE IN ATTITUDE-HOLD?
// slot 28451
            if slot <> 28451 or instruction <> 14815 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28452 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:812
//		EXTEND
// slot 28452
                if slot <> 28452 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:813
//		RAND	CHAN31
// slot 28453
                if slot <> 28453 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28454 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:814
//		EXTEND
// slot 28454
            if slot <> 28454 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28455 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:815
//		BZF	DISPEXIT	# YES
// slot 28455
                if slot <> 28455 or instruction <> 5936 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:816
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:817
//		TC	BANKCALL	# NO:  DO A STOPRATE
// slot 28456
                if slot <> 28456 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1809] to agcAotUnit1809@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:818
//		CADR	STOPRATE
// slot 28457
    28457, 33002
)).

// bank 31, slots 28458-28460
function agcAotUnit1810 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28458 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:819
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:820
//		TCF	DISPEXIT
// slot 28458
        if slot <> 28458 or instruction <> 5936 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5936, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28459 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:821
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:822
//GDUMP1		TC	THROTTLE
// slot 28459
            if slot <> 28459 or instruction <> 1166 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1166, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:823
//# Page 814
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:824
//		TC	INTPRET
// slot 28460
            if slot <> 28460 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1810] to agcAotUnit1810@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:825
//		CALL
// slot 28461
    28461, 65320,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:826
//			FINDCDUW -2
// slot 28462
    28462, 50322,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:827
//		EXIT
// slot 28463
    28463, 65532
)).

// bank 31, slots 28464-28471
function agcAotUnit1811 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28467 {
        if slot <= 28465 {
            if slot <= 28464 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:828
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:829
//# 		(CONTINUE TO DISPEXIT)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:830
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:831
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:832
//# GUIDANCE LOOP DISPLAYS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:833
//# ***********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:834
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:835
//DISPEXIT	EXTEND			# KILL GROUP 3:  DISPLAYS WILL BE
// slot 28464
                if slot <> 28464 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:836
//		DCA	NEG0		#	RESTORED BY NEXT GUIDANCE CYCLE.
// slot 28465
                if slot <> 28465 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28466 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:837
//		DXCH	-PHASE3
// slot 28466
                if slot <> 28466 or instruction <> 21999 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:838
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:839
// +3		CS	FLAGWRD8	# IF FLUNDISP IS SET, NO DISPLAY THIS PASS
// slot 28467
                if slot <> 28467 or instruction <> 16452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 68).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28469 {
            if slot <= 28468 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:840
// 		MASK	FLUNDBIT
// slot 28468
                if slot <> 28468 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:841
//		EXTEND
// slot 28469
                if slot <> 28469 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28470 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:842
//		BZF	ENDLLJOB	# TO PICK UP THE TAG
// slot 28470
                if slot <> 28470 or instruction <> 5950 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5950, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:843
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:844
//		INDEX	WCHPHOLD
// slot 28471
                if slot <> 28471 or instruction <> 21393 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21393, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1811] to agcAotUnit1811@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:845
//		TCF	WHATDISP
// slot 28472
    28472, 10822
)).

// bank 31, slots 28473-28473
function agcAotUnit1812 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:846
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:847
//-2		TC	PHASCHNG	# KILL GROUP 5
// slot 28473
    if slot <> 28473 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1812] to agcAotUnit1812@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:848
//		OCT	00035
// slot 28474
    28474, 58
)).

// bank 31, slots 28475-28476
function agcAotUnit1813 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28475 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:849
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:850
//P63DISPS	CAF	V06N63
// slot 28475
        if slot <> 28475 or instruction <> 14318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2030), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:851
//DISPCOMN	TC	BANKCALL
// slot 28476
        if slot <> 28476 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1813] to agcAotUnit1813@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:852
//		CADR	REGODSPR
// slot 28477
    28477, 17008
)).

// bank 31, slots 28478-28487
function agcAotUnit1814 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28482 {
        if slot <= 28479 {
            if slot <= 28478 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:853
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:854
//ENDLLJOB	TCF	ENDOFJOB
// slot 28478
                if slot <> 28478 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:855
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:856
//P64DISPS	CA	TREDES		# HAS TREDES REACHED ZERO?
// slot 28479
                if slot <> 28479 or instruction <> 13238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 950).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28480 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:857
//		EXTEND
// slot 28480
                if slot <> 28480 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28481 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:858
//		BZF	RED-OVER	# YES: CLEAR REDESIGNATION FLAG
// slot 28481
                    if slot <> 28481 or instruction <> 5971 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5971, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:859
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:860
//		CS	FLAGWRD6	# NO:  IS REDFLAG SET?
// slot 28482
                    if slot <> 28482 or instruction <> 16450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 66).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28484 {
            if slot <= 28483 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:861
//		MASK	REDFLBIT
// slot 28483
                if slot <> 28483 or instruction <> 31206 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    if fixedOperand = 32 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:862
//		EXTEND
// slot 28484
                if slot <> 28484 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28485 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:863
//		BZF	REDES-OK	# YES:  DO STATIC DISPLAY
// slot 28485
                if slot <> 28485 or instruction <> 5973 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5973, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28486 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:864
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:865
//		CAF	V06N64		# OTHERWISE USE FLASHING DISPLAY
// slot 28486
                    if slot <> 28486 or instruction <> 14319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2031), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:866
//		TC	BANKCALL
// slot 28487
                    if slot <> 28487 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1814] to agcAotUnit1814@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:867
//		CADR	REFLASHR
// slot 28488
    28488, 16996
)).

// bank 31, slots 28489-28496
function agcAotUnit1815 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28492 {
        if slot <= 28490 {
            if slot <= 28489 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:868
//		TCF	GOTOPOOH	# TERMINATE
// slot 28489
                if slot <> 28489 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:869
//		TCF	P64CEED		# PROCEED	PERMIT REDESIGNATIONS
// slot 28490
                if slot <> 28490 or instruction <> 5965 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5965, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28491 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:870
//		TCF	P64DISPS	# RECYCLE
// slot 28491
                if slot <> 28491 or instruction <> 5951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:871
//# Page 815
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:872
//		TCF	ENDLLJOB
// slot 28492
                if slot <> 28492 or instruction <> 5950 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5950, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28494 {
            if slot <= 28493 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:873
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:874
//P64CEED		CAF	ZERO
// slot 28493
                if slot <> 28493 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:875
//		TS	ELINCR1
// slot 28494
                if slot <> 28494 or instruction <> 23223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23223, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28495 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:876
//		TS	AZINCR1
// slot 28495
                if slot <> 28495 or instruction <> 23222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:877
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:878
//		TC	UPFLAG		# ENABLE REDESIGNATION LOGIC
// slot 28496
                if slot <> 28496 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1815] to agcAotUnit1815@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:879
//		ADRES	REDFLAG
// slot 28497
    28497, 198
)).

// bank 31, slots 28498-28499
function agcAotUnit1816 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28498 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:880
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:881
//		TCF	ENDOFJOB
// slot 28498
        if slot <> 28498 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:882
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:883
//RED-OVER	TC	DOWNFLAG
// slot 28499
        if slot <> 28499 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1816] to agcAotUnit1816@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:884
//		ADRES	REDFLAG
// slot 28500
    28500, 198
)).

// bank 31, slots 28501-28508
function agcAotUnit1817 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28504 {
        if slot <= 28502 {
            if slot <= 28501 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:885
//REDES-OK	CAF	V06N64
// slot 28501
                if slot <> 28501 or instruction <> 14319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2031), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:886
//		TCF	DISPCOMN
// slot 28502
                if slot <> 28502 or instruction <> 5948 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5948, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28503 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:887
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:888
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:889
//VERTDISP	CAF	V06N60
// slot 28503
                if slot <> 28503 or instruction <> 14320 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2032), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:890
//		TCF	DISPCOMN
// slot 28504
                if slot <> 28504 or instruction <> 5948 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5948, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28506 {
            if slot <= 28505 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:891
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:892
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:893
//# **************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:894
//# GUIDANCE FOR P65
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:895
//# **************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:896
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:897
//VERTGUID	CCS	WCHVERT
// slot 28505
                if slot <> 28505 or instruction <> 5031 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 935).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:898
//		TCF	P67VERT		# POSITIVE NON-ZERO ---> P67
// slot 28506
                if slot <> 28506 or instruction <> 5989 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5989, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28507 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:899
//		TCF	P66VERT		# +0
// slot 28507
                if slot <> 28507 or instruction <> 5987 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5987, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:900
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:901
//# 	THE P65 GUIDANCE EQUATION IS AS FOLLOWS --
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:902
//#		      ____   ___
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:903
//#		      V2FG - VGU
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:904
//#		ACG = ----------
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:905
//#		        TAUVERT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:906
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:907
//P65VERT		TC	INTPRET
// slot 28508
                if slot <> 28508 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1817] to agcAotUnit1817@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:908
//		VLOAD	VSU
// slot 28509
    28509, 43514,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:909
//			V2FG
// slot 28510
    28510, 2706,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:910
//			VGU
// slot 28511
    28511, 3886,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:911
//		V/SC	GOTO
// slot 28512
    28512, 43202,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:912
//			TAUVERT
// slot 28513
    28513, 2718,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:913
//			AFCCALC1
// slot 28514
    28514, 52488
)).

// bank 31, slots 28515-28515
function agcAotUnit1818 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:914
//# Page 816
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:915
//# **********************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:916
//# GUIDANCE FOR P66
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:917
//# **********************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:918
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:919
//P66VERT		TC	POSTJUMP
// slot 28515
    if slot <> 28515 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1818] to agcAotUnit1818@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:920
//		CADR	P66VERTA
// slot 28516
    28516, 54640
)).

// bank 31, slots 28517-28517
function agcAotUnit1819 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:921
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:922
//P67VERT		TC	PHASCHNG	# TERMINATE GROUP 3.
// slot 28517
    if slot <> 28517 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1819] to agcAotUnit1819@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:923
//		OCT	00003
// slot 28518
    28518, 6
)).

// bank 31, slots 28519-28519
function agcAotUnit1820 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:924
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:925
//		TC	INTPRET
// slot 28519
    if slot <> 28519 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1820] to agcAotUnit1820@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:926
//		VLOAD	GOTO
// slot 28520
    28520, 43258,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:927
//			V
// slot 28521
    28521, 3758,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:928
//			VHORCOMP
// slot 28522
    28522, 54942
)).

// bank 32, slots 29363-29364
function agcAotUnit1883 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29363 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:929
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:930
//		SETLOC	P66LOC
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:931
//		BANK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:932
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:933
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:934
//RODTASK		CAF	PRIO22
// slot 29363
        if slot <> 29363 or instruction <> 16328 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4040), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:935
//		TC	FINDVAC
// slot 29364
        if slot <> 29364 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1883] to agcAotUnit1883@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:936
//		EBANK=	DVCNTR
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:937
//		2CADR	RODCOMP
// slot 29365 29366
    29365, 3450, 29366, 53358
)).

// bank 32, slots 29367-29368
function agcAotUnit1884 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29367 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:938
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:939
//		TCF	TASKOVER
// slot 29367
        if slot <> 29367 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:940
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:941
//P66VERTA	TC	PHASCHNG	# TERMINATE GROUP 3.
// slot 29368
        if slot <> 29368 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1884] to agcAotUnit1884@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:942
//		OCT	00003
// slot 29369
    29369, 6
)).

// bank 32, slots 29370-29371
function agcAotUnit1885 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29370 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:943
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:944
//		CAF	1SEC
// slot 29370
        if slot <> 29370 or instruction <> 14847 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:945
//		TC	TWIDDLE
// slot 29371
        if slot <> 29371 or instruction <> 2683 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2683, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1885] to agcAotUnit1885@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:946
//		ADRES	RODTASK
// slot 29372
    29372, 3430
)).

// bank 32, slots 29373-29419
function agcAotUnit1886 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29395 {
        if slot <= 29383 {
            if slot <= 29377 {
                if slot <= 29374 {
                    if slot <= 29373 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:947
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:948
//RODCOMP		INHINT
// slot 29373
                        if slot <> 29373 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:949
//		CAF	ZERO
// slot 29374
                        if slot <> 29374 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 29375 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:950
//		XCH	RODCOUNT
// slot 29375
                        if slot <> 29375 or instruction <> 24550 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 998, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29376 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:951
//		EXTEND
// slot 29376
                            if slot <> 29376 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:952
//		MP	RODSCAL1
// slot 29377
                            if slot <> 29377 or instruction <> 29678 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1006, readEffective:call(words, 1006)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29380 {
                    if slot <= 29378 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:953
//		DAS	VDGVERT		# UPDATE DESIRED ALTITUDE RATE.
// slot 29378
                        if slot <> 29378 or instruction <> 9125 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 933) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29379 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:954
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:955
//		EXTEND			# SET OLDPIPAX,Y,Z = PIPAX,Y,Z
// slot 29379
                            if slot <> 29379 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:956
//		DCA	PIPAX
// slot 29380
                            if slot <> 29380 or instruction <> 12320 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 32, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29381 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:957
//		DXCH	OLDPIPAX
// slot 29381
                        if slot <> 29381 or instruction <> 22516 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29382 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:958
//		DXCH	RUPTREG1	# SET RUPTREG1,2,3 = OLDPIPAX,Y,Z
// slot 29382
                            if slot <> 29382 or instruction <> 21561 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:959
//		CA	PIPAZ
// slot 29383
                            if slot <> 29383 or instruction <> 12321 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 33).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 29389 {
                if slot <= 29386 {
                    if slot <= 29384 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:960
//		XCH	OLDPIPAZ
// slot 29384
                        if slot <> 29384 or instruction <> 24565 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1013, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29385 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:961
//		XCH	RUPTREG3
// slot 29385
                            if slot <> 29385 or instruction <> 23610 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 58, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:962
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:963
//		EXTEND			# SNAPSHOT TIME OF PIPA READING.
// slot 29386
                            if slot <> 29386 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29387 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:964
//		DCA	TIME2
// slot 29387
                        if slot <> 29387 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29388 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:965
//# Page 817
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:966
//		DXCH	THISTPIP
// slot 29388
                            if slot <> 29388 or instruction <> 22514 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1010, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:967
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:968
//		CA	OLDPIPAX
// slot 29389
                            if slot <> 29389 or instruction <> 13299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1011).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29392 {
                    if slot <= 29390 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:969
//		AD	PIPATMPX
// slot 29390
                        if slot <> 29390 or instruction <> 25200 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 624).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29391 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:970
//		TS	MPAC		# MPAC(X) = PIPAX + PIPATMPX
// slot 29391
                            if slot <> 29391 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:971
//		CA	OLDPIPAY
// slot 29392
                            if slot <> 29392 or instruction <> 13300 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1012).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29393 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:972
//		AD	PIPATMPY
// slot 29393
                        if slot <> 29393 or instruction <> 25201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 625).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29394 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:973
//		TS	MPAC +3		# MPAC(Y) = PIPAY + PIPATMPY
// slot 29394
                            if slot <> 29394 or instruction <> 22639 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22639, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:974
//		CA	OLDPIPAZ
// slot 29395
                            if slot <> 29395 or instruction <> 13301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1013).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 29407 {
            if slot <= 29401 {
                if slot <= 29398 {
                    if slot <= 29396 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:975
//		AD	PIPATMPZ
// slot 29396
                        if slot <> 29396 or instruction <> 25202 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 626).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29397 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:976
//		TS	MPAC +5		# MPAC(Z) = PIPAZ + PIPATMPZ
// slot 29397
                            if slot <> 29397 or instruction <> 22641 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:977
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:978
//		CS	OLDPIPAX
// slot 29398
                            if slot <> 29398 or instruction <> 17395 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 1011).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29399 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:979
//		AD	TEMX
// slot 29399
                        if slot <> 29399 or instruction <> 25260 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 684).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29400 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:980
//		AD	RUPTREG1
// slot 29400
                            if slot <> 29400 or instruction <> 24632 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 56).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:981
//		TS	DELVROD
// slot 29401
                            if slot <> 29401 or instruction <> 23542 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23542, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29404 {
                    if slot <= 29402 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:982
//		CS	OLDPIPAY
// slot 29402
                        if slot <> 29402 or instruction <> 17396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1012).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29403 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:983
//		AD	TEMY
// slot 29403
                            if slot <> 29403 or instruction <> 25261 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 685).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:984
//		AD	RUPTREG2
// slot 29404
                            if slot <> 29404 or instruction <> 24633 { return choose false if checkOnly else -1. }
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
                    if slot <= 29405 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:985
//		TS	DELVROD +2
// slot 29405
                        if slot <> 29405 or instruction <> 23544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29406 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:986
//		CS	OLDPIPAZ
// slot 29406
                            if slot <> 29406 or instruction <> 17397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 1013).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:987
//		AD	TEMZ
// slot 29407
                            if slot <> 29407 or instruction <> 25262 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 686).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 29413 {
                if slot <= 29410 {
                    if slot <= 29408 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:988
//		AD	RUPTREG3
// slot 29408
                        if slot <> 29408 or instruction <> 24634 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 58).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29409 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:989
//		TS	DELVROD +4
// slot 29409
                            if slot <> 29409 or instruction <> 23546 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23546, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:990
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:991
//		CAF	ZERO
// slot 29410
                            if slot <> 29410 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 29411 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:992
//		TS	MPAC +1		# ZERO LO-ORDER MPAC COMPONENTS
// slot 29411
                        if slot <> 29411 or instruction <> 22637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29412 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:993
//		TS	MPAC +4
// slot 29412
                            if slot <> 29412 or instruction <> 22640 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22640, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:994
//		TS	MPAC +6
// slot 29413
                            if slot <> 29413 or instruction <> 22642 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22642, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29416 {
                    if slot <= 29414 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:995
//		TS	TEMX		# ZERO TEMX, TEMY, AND TEMZ SO WE WILL
// slot 29414
                        if slot <> 29414 or instruction <> 23212 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23212, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29415 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:996
//		TS	TEMY		#	KNOW WHEN READACCS CHANGES THEM.
// slot 29415
                            if slot <> 29415 or instruction <> 23213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:997
//		TS	TEMZ
// slot 29416
                            if slot <> 29416 or instruction <> 23214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23214, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29417 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:998
//		CS	ONE
// slot 29417
                        if slot <> 29417 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29418 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:999
//		TS	MODE
// slot 29418
                            if slot <> 29418 or instruction <> 22643 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22643, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1000
//		TC	INTPRET
// slot 29419
                            if slot <> 29419 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1886] to agcAotUnit1886@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1001
//ITRPNT1		VXSC	PDDL		# SCALE MPAC TO M/CS *2(-7) AND PUSH 	(6)
// slot 29420
    29420, 54754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1002
//			KPIP1
// slot 29421
    29421, 22564,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1003
//			THISTPIP
// slot 29422
    29422, 4068,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1004
//		DSU
// slot 29423
    29423, 65322,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1005
//			PIPTIME
// slot 29424
    29424, 1338,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1006
//		STORE	30D		# 30-31D CONTAINS TIME IN CS SINCE PIPTIME
// slot 29425
    29425, 62,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1007
//		DDV	PDVL		#					(8)
// slot 29426
    29426, 52594,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1008
//			4SEC(28)
// slot 29427
    29427, 23766,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1009
//			GDT/2
// slot 29428
    29428, 1342,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1010
//		VSU	VXSC		#					(6)
// slot 29429
    29429, 61778,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1011
//			VBIAS
// slot 29430
    29430, 2866,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1012
//		VSL2	VAD
// slot 29431
    29431, 44500,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1013
//			V
// slot 29432
    29432, 3758,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1014
//		VAD	STADR		#					(0)
// slot 29433
    29433, 38490,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1015
//		STOVL	24D		# STORE UPDATED VELOCITY IN 24-29D
// slot 29434
    29434, 45004,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1016
//# Page 818
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1017
//			R
// slot 29435
    29435, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1018
//		UNIT
// slot 29436
    29436, 65372,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1019
//		STORE	14D
// slot 29437
    29437, 30,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1020
//		DOT	SL1
// slot 29438
    29438, 59970,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1021
//			24D
// slot 29439
    29439, 50,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1022
//		STODL	HDOTDISP	# UPDATE HDOTDISP RATE FOR NOUN 63.
// slot 29440
    29440, 15992,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1023
//			30D
// slot 29441
    29441, 62,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1024
//		SL	DMP
// slot 29442
    29442, 34146,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1025
//			11D
// slot 29443
    29443, 16664,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1026
//			HDOTDISP
// slot 29444
    29444, 3704,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1027
//		DAD	DSU
// slot 29445
    29445, 38170,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1028
//			36D
// slot 29446
    29446, 74,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1029
//			/LAND/
// slot 29447
    29447, 2486,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1030
//		STODL	HCALC1		# UPDATE HCALC1 FOR NOUN 63.
// slot 29448
    29448, 16378,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1031
//			HDOTDISP
// slot 29449
    29449, 3704,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1032
//		BDSU	DDV
// slot 29450
    29450, 47394,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1033
//			VDGVERT
// slot 29451
    29451, 3914,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1034
//			TAUROD
// slot 29452
    29452, 2754,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1035
//		PDVL	ABVAL		#				(2)
// slot 29453
    29453, 42650,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1036
//			GDT/2
// slot 29454
    29454, 1342,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1037
//		DDV	SR2
// slot 29455
    29455, 49778,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1038
//			GSCALE
// slot 29456
    29456, 5972,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1039
//		STORE	20D
// slot 29457
    29457, 42,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1040
//		DAD			#				(0)
// slot 29458
    29458, 65306,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1041
//		PDVL	CALL		#				(2)
// slot 29459
    29459, 38042,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1042
//			UNITX
// slot 29460
    29460, 6816,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1043
//			CDU*NBSM
// slot 29461
    29461, 40802,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1044
//		DOT
// slot 29462
    29462, 65346,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1045
//			14D
// slot 29463
    29463, 30,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1046
//		STORE	22D
// slot 29464
    29464, 46,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1047
//		BDDV	STADR		#				(0)
// slot 29465
    29465, 38506,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1048
//		STOVL	/AFC/
// slot 29466
    29466, 41366,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1049
//			DELVROD
// slot 29467
    29467, 4078,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1050
//		VXSC	VAD
// slot 29468
    29468, 44514,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1051
//			KPIP1
// slot 29469
    29469, 22564,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1052
//			VBIAS
// slot 29470
    29470, 2866,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1053
//		ABVAL	PDDL		#				(2)
// slot 29471
    29471, 54604,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1054
//			THISTPIP
// slot 29472
    29472, 4068,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1055
//		DSU	PDDL		#				(4)
// slot 29473
    29473, 54570,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1056
//			LASTTPIP
// slot 29474
    29474, 4064,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1057
//			THISTPIP
// slot 29475
    29475, 4068,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1058
//		STODL	LASTTPIP	#				(2)
// slot 29476
    29476, 16352,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1059
//		DDV	BDDV		#				(0)
// slot 29477
    29477, 46450,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1060
//			SHFTFACT
// slot 29478
    29478, 22202,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1061
//		PDDL	DMP		#				(2)
// slot 29479
    29479, 34218,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1062
//			FWEIGHT
// slot 29480
    29480, 3858,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1063
//			BIT1H
// slot 29481
    29481, 22200,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1064
//		DDV	DDV
// slot 29482
    29482, 47474,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1065
//			MASS
// slot 29483
    29483, 1354,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1066
//			SCALEFAC
// slot 29484
    29484, 18444,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1067
//# Page 819
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1068
//		DAD	PDDL		#				(4)
// slot 29485
    29485, 54554,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1069
//			0D
// slot 29486
    29486, 2,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1070
//			20D
// slot 29487
    29487, 42,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1071
//		DDV	DSU		#				(2)
// slot 29488
    29488, 38258,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1072
//			22D
// slot 29489
    29489, 46,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1073
//		DMP	DAD
// slot 29490
    29490, 36106,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1074
//			LAG/TAU
// slot 29491
    29491, 2758,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1075
//			/AFC/
// slot 29492
    29492, 3688,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1076
//		PDDL	DDV		#				(4)
// slot 29493
    29493, 47530,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1077
//			MAXFORCE
// slot 29494
    29494, 2766,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1078
//			MASS
// slot 29495
    29495, 1354,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1079
//		PDDL	DDV		#				(6)
// slot 29496
    29496, 47530,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1080
//			MINFORCE
// slot 29497
    29497, 2762,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1081
//			MASS
// slot 29498
    29498, 1354,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1082
//		PUSH	BDSU		#				(8)
// slot 29499
    29499, 37132,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1083
//			2D
// slot 29500
    29500, 6,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1084
//		BMN	DLOAD		#				(6)
// slot 29501
    29501, 58688,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1085
//			AFCSPOT
// slot 29502
    29502, 54920,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1086
//		DLOAD	PUSH		#				(6)
// slot 29503
    29503, 34506,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1087
//		BDSU	BPL
// slot 29504
    29504, 42018,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1088
//			2D
// slot 29505
    29505, 6,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1089
//			AFCSPOT
// slot 29506
    29506, 54920,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1090
//		DLOAD			#				(4)
// slot 29507
    29507, 65482,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1091
//AFCSPOT		DLOAD			#				(2), (4), OR (6)
// slot 29508
    29508, 65482,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1092
//		SETPD			#				(2)
// slot 29509
    29509, 65282,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1093
//			2D
// slot 29510
    29510, 6,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1094
//		STODL	/AFC/		#				(0)
// slot 29511
    29511, 15976,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1095
//ITRPNT2		EXIT
// slot 29512
    29512, 65532
)).

// bank 32, slots 29513-29514
function agcAotUnit1887 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29513 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1096
//		DXCH	MPAC		# MPAC = MEASURED ACCELERATION.
// slot 29513
        if slot <> 29513 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1097
//		TC	BANKCALL
// slot 29514
        if slot <> 29514 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1887] to agcAotUnit1887@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1098
//		CADR	THROTTLE +3
// slot 29515
    29515, 51490
)).

// bank 32, slots 29516-29516
function agcAotUnit1888 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1099
//		TC	INTPRET
// slot 29516
    if slot <> 29516 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1888] to agcAotUnit1888@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1100
//		VLOAD			# PICK UP UPDATED VELOCITY VECTOR.
// slot 29517
    29517, 65530,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1101
//			24D
// slot 29518
    29518, 50,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1102
//VHORCOMP	VSL2	VAD
// slot 29519
    29519, 44500,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1103
//			DELVS
// slot 29520
    29520, 4024,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1104
//		VSR2	PDVL
// slot 29521
    29521, 52676,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1105
//			R
// slot 29522
    29522, 3746,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1106
//		UNIT	VXSC
// slot 29523
    29523, 61788,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1107
//			HDOTDISP
// slot 29524
    29524, 3704,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1108
//		VSL1	BVSU
// slot 29525
    29525, 42484,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1109
//		ABVAL
// slot 29526
    29526, 65356,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1110
//		STORE	VHORIZ
// slot 29527
    29527, 2406,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1111
//		EXIT
// slot 29528
    29528, 65532
)).

// bank 32, slots 29529-29529
function agcAotUnit1889 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1112
//		TC	BANKCALL	# PUT UP V06N60 DISPLAY BUT AVOID PHASCHNG
// slot 29529
    if slot <> 29529 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1889] to agcAotUnit1889@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1113
//		CADR	DISPEXIT +3
// slot 29530
    29530, 52838,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1114
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1115
//BIT1H		OCT	00001
// slot 29531
    29531, 2,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1116
//SHFTFACT	2DEC	1 B-17
// slot 29532 29533
    29532, 0, 29533, 4096,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1117
//# Page 820
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1118
//BIASFACT	2DEC	655.36 B-28
// slot 29534 29535
    29534, 0, 29535, 1310
)).

// bank 11, slots 11453-11456
function agcAotUnit732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11454 {
        if slot <= 11453 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1119
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1120
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1121
//# REDESIGNATOR TRAP
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1122
//# *********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1123
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1124
//		BANK	11
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1125
//		SETLOC	F2DPS*11
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1126
//		BANK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1127
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1128
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1129
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1130
//PITFALL		XCH	BANKRUPT
// slot 11453
            if slot <> 11453 or instruction <> 23566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 14, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1131
//		EXTEND
// slot 11454
            if slot <> 11454 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 11455 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1132
//		QXCH	QRUPT
// slot 11455
            if slot <> 11455 or instruction <> 9226 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 10, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1133
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1134
//		TC	CHECKMM		# IF NOT IN P64, NO REASON TO CONTINUE
// slot 11456
            if slot <> 11456 or instruction <> 2769 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2769, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[732] to agcAotUnit732@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1135
//		DEC	64
// slot 11457
    11457, 128
)).

// bank 11, slots 11458-11467
function agcAotUnit733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11462 {
        if slot <= 11459 {
            if slot <= 11458 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1136
//		TCF	RESUME
// slot 11458
                if slot <> 11458 or instruction <> 6840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1137
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1138
//		EXTEND
// slot 11459
                if slot <> 11459 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 11460 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1139
//		READ	CHAN31
// slot 11460
                if slot <> 11460 or instruction <> 25 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11461 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1140
//		COM
// slot 11461
                    if slot <> 11461 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1141
//		MASK	ALL4BITS
// slot 11462
                    if slot <> 11462 or instruction <> 29947 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1275), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 11464 {
            if slot <= 11463 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1142
//		TS	ELVIRA
// slot 11463
                if slot <> 11463 or instruction <> 23221 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23221, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1143
//		CAF	TWO
// slot 11464
                if slot <> 11464 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
            if slot <= 11465 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1144
//		TS	ZERLINA
// slot 11465
                if slot <> 11465 or instruction <> 23220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23220, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11466 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1145
//		CAF	FIVE
// slot 11466
                    if slot <> 11466 or instruction <> 14830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1146
//		TC	TWIDDLE
// slot 11467
                    if slot <> 11467 or instruction <> 2683 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2683, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[733] to agcAotUnit733@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1147
//		ADRES	REDESMON
// slot 11468
    11468, 2466
)).

// bank 11, slots 11469-11514
function agcAotUnit734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11491 {
        if slot <= 11479 {
            if slot <= 11473 {
                if slot <= 11470 {
                    if slot <= 11469 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1148
//		TCF	RESUME
// slot 11469
                        if slot <> 11469 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1149
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1150
//# REDESIGNATOR MONITOR (INITIATED BY PITFALL)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1151
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1152
//PREMON1		TS	ZERLINA
// slot 11470
                        if slot <> 11470 or instruction <> 23220 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23220, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11471 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1153
//PREMON2		CAF	SEVEN
// slot 11471
                        if slot <> 11471 or instruction <> 14831 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11472 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1154
//		TC	VARDELAY
// slot 11472
                            if slot <> 11472 or instruction <> 2708 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2708, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1155
//REDESMON	EXTEND
// slot 11473
                            if slot <> 11473 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11476 {
                    if slot <= 11474 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1156
//		READ	31
// slot 11474
                        if slot <> 11474 or instruction <> 25 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11475 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1157
//		COM
// slot 11475
                            if slot <> 11475 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1158
//		MASK	ALL4BITS
// slot 11476
                            if slot <> 11476 or instruction <> 29947 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1275), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11477 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1159
//		XCH	ELVIRA
// slot 11477
                        if slot <> 11477 or instruction <> 24245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 693, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11478 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1160
//		TS	L
// slot 11478
                            if slot <> 11478 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1161
//		CCS	ELVIRA		# DO ANY BITS APPEAR THIS PASS?
// slot 11479
                            if slot <> 11479 or instruction <> 4789 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 693).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 11485 {
                if slot <= 11482 {
                    if slot <= 11480 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1162
//		TCF	PREMON2		# Y:	CONTINUE MONITOR
// slot 11480
                        if slot <> 11480 or instruction <> 5327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11481 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1163
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1164
//		CCS	L		# N:	ANY LAST PASS?
// slot 11481
                            if slot <> 11481 or instruction <> 4097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1165
//		TCF	COUNT'EM	#	Y: 	COUNT 'EM, RESET RUPT, TERMINATE
// slot 11482
                            if slot <> 11482 or instruction <> 5345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11483 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1166
//# Page 821
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1167
//		CCS	ZERLINA		#	N: 	HAS ZERLINA REACHED ZERO YET?
// slot 11483
                        if slot <> 11483 or instruction <> 4788 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 692).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11484 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1168
//		TCF	PREMON1		#		N:	DIMINISH ZERLINA, CONTINUE
// slot 11484
                            if slot <> 11484 or instruction <> 5326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1169
//RESETRPT	CAF	BIT12		#		Y:	RESET RUPT. TERMINATE
// slot 11485
                            if slot <> 11485 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11488 {
                    if slot <= 11486 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1170
//		EXTEND
// slot 11486
                        if slot <> 11486 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11487 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1171
//		WOR	CHAN13
// slot 11487
                            if slot <> 11487 or instruction <> 2571 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1172
//		TCF	TASKOVER
// slot 11488
                            if slot <> 11488 or instruction <> 6833 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6833, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11489 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1173
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1174
//COUNT'EM	CAF	BIT13		# ARE WE IN ATTITUDE-HOLD?
// slot 11489
                        if slot <> 11489 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11490 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1175
//		EXTEND
// slot 11490
                            if slot <> 11490 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1176
//		RAND	CHAN31
// slot 11491
                            if slot <> 11491 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 11502 {
            if slot <= 11496 {
                if slot <= 11493 {
                    if slot <= 11492 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1177
//		EXTEND
// slot 11492
                        if slot <> 11492 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1178
//		BZF	RESETRPT	# YES: SKIP REDESIGNATION LOGIC.
// slot 11493
                        if slot <> 11493 or instruction <> 5341 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5341, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11494 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1179
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1180
//		CA	L		# NO.
// slot 11494
                        if slot <> 11494 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11495 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1181
//		MASK 	-AZBIT
// slot 11495
                            if slot <> 11495 or instruction <> 31206 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                if fixedOperand = 32 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1182
//		CCS	A
// slot 11496
                            if slot <> 11496 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 11499 {
                    if slot <= 11497 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1183
//-AZ		CS	AZEACH
// slot 11497
                        if slot <> 11497 or instruction <> 17660 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1276), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11498 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1184
//		ADS	AZINCR1
// slot 11498
                            if slot <> 11498 or instruction <> 11958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 694).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1185
//		CA	L
// slot 11499
                            if slot <> 11499 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11500 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1186
//		MASK	+AZBIT
// slot 11500
                        if slot <> 11500 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
                        if slot <= 11501 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1187
//		CCS	A
// slot 11501
                            if slot <> 11501 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1188
//+AZ		CA	AZEACH
// slot 11502
                            if slot <> 11502 or instruction <> 13564 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1276), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 11508 {
                if slot <= 11505 {
                    if slot <= 11503 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1189
//		ADS	AZINCR1
// slot 11503
                        if slot <> 11503 or instruction <> 11958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 694).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11504 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1190
//		CA	L
// slot 11504
                            if slot <> 11504 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1191
//		MASK	-ELBIT
// slot 11505
                            if slot <> 11505 or instruction <> 31211 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
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
                } else {
                    if slot <= 11506 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1192
//		CCS	A
// slot 11506
                        if slot <> 11506 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11507 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1193
//-EL		CS	ELEACH
// slot 11507
                            if slot <> 11507 or instruction <> 17661 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1277), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1194
//		ADS	ELINCR1
// slot 11508
                            if slot <> 11508 or instruction <> 11959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 695).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11511 {
                    if slot <= 11509 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1195
//		CA	L
// slot 11509
                        if slot <> 11509 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11510 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1196
//		MASK	+ELBIT
// slot 11510
                            if slot <> 11510 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1197
//		CCS	A
// slot 11511
                            if slot <> 11511 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 11512 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1198
//+EL		CA	ELEACH
// slot 11512
                        if slot <> 11512 or instruction <> 13565 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1277), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11513 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1199
//		ADS	ELINCR1
// slot 11513
                            if slot <> 11513 or instruction <> 11959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 695).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1200
//		TCF	RESETRPT
// slot 11514
                            if slot <> 11514 or instruction <> 5341 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5341, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[734] to agcAotUnit734@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1201
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1202
//# THESE EQUIVALENCES ARE BASED ON GSOP CHAPTER 4, REVISION 16 OF P64LM
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1203
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1204
//+ELBIT		=	BIT2		# -PITCH
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1205
//-ELBIT		=	BIT1		# +PITCH
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1206
//+AZBIT		=	BIT5
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1207
//-AZBIT		=	BIT6
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1208
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1209
//# Page 822
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1210
//ALL4BITS	OCT	00063
// slot 11515
    11515, 102,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1211
//AZEACH		DEC	.03491		# 2 DEGREES
// slot 11516
    11516, 1144,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1212
//ELEACH		DEC	.00873		# 1/2 DEGREE
// slot 11517
    11517, 286
)).

// bank 20, slots 18509-18514
function agcAotUnit1117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18511 {
        if slot <= 18509 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1213
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1214
//# ****************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1215
//# R.O.D. TRAP
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1216
//# ****************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1217
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1218
//		BANK	20
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1219
//		SETLOC	RODTRAP
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1220
//		BANK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1221
//		COUNT*	$$/F2DPS	# ************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1222
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1223
//DESCBITS	MASK	BIT7		# COME HERE FROM MARKRUPT CODING WITH BIT
// slot 18509
            if slot <> 18509 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
            if slot <= 18510 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1224
//		CCS	A		#	7 OR 6 OF CHANNEL 16 IN A; BIT 7 MEANS
// slot 18510
                if slot <> 18510 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1225
//		CS	TWO		#	- RATE INCREMENT, BIT 6 + INCREMENT.
// slot 18511
                if slot <> 18511 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18512 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1226
//		AD	ONE
// slot 18512
            if slot <> 18512 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
            if slot <= 18513 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1227
//		ADS	RODCOUNT
// slot 18513
                if slot <> 18513 or instruction <> 12262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 998).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1228
//		TCF	RESUME		# TRAP IS RESET WHEN SWITCH IS RELEASED
// slot 18514
                if slot <> 18514 or instruction <> 6840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1117] to agcAotUnit1117@.

// bank 31, slots 28523-28537
function agcAotUnit1821 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28529 {
        if slot <= 28525 {
            if slot <= 28523 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1229
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1230
//		BANK	31
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1231
//		SETLOC	F2DPS*31
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1232
//		BANK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1233
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1234
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1235
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1236
//# ***********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1237
//# DOUBLE PRECISION ROOT FINDER SUBROUTINE (BY ALLAN KLUMPP)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1238
//# ***********************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1239
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1240
//#	                                               N        N-1
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1241
//#	ROOTPSRS FINDS ONE ROOT OF THE POWER SERIES A X  + A   X    + ... + A X + A
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1242
//#	                                             N      N-1              1     0
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1243
//# USING NEWTON'S METHOD STARTING WITH AN INITIAL GUESS FOR THE ROOT.  THE ENTERING DATA MUST BE AS FOLLOWS:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1244
//#	A	SP	LOC-3		ADRES FOR REFERENCING PWR COF TABL
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1245
//#	L	SP	N-1		N IS THE DEGREE OF THE POWER SERIES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1246
//#	MPAC	DP	X		INITIAL GUESS FOR ROOT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1247
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1248
//#	LOC-2N	DP	A(0)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1249
//#		...
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1250
//#	LOC	DP	A(N)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1251
//#	LOC+2	SP	PRECROOT	 PREC RQD OF ROOT (AS FRACT OF 1ST GUESS)
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1252
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1253
//# Page 823
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1254
//# THE DP RESULT IS LEFT IN MPAC UPON EXIT, AND A SP COUNT OF THE ITERATIONS TO CONVERGENCE IS LEFT IN MPAC+2.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1255
//# RETURN IS NORMALLY TO LOC(TC ROOTPSRS)+3.  IF ROOTPSRS FAILS TO CONVERGE TO IN 8 PASSES, RETURN IS TO LOC+1 AND
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1256
//# OUTPUTS ARE NOT TO BE TRUSTED.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1257
//#
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1258
//# PRECAUTION:  ROOTPSRS MAKES NO CHECKS FOR OVERFLOW OR FOR IMPROPER USAGE.  IMPROPER USAGE COULD
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1259
//# PRECLUDE CONVERGENCE OR REQUIRE EXCESSIVE ITERATIONS.  AS A SPECIFIC EXAMPLE, ROOTPSRS FORMS A DERIVATIVE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1260
//# COEFFICIENT TABLE BY MULTIPLYING EACH A(I) BY I, WHERE I RANGES FROM 1 TO N.  IF AN ELEMENT OF THE DERIVATIVE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1261
//# COEFFICIENT TABLE = 1 OR >1 IN MAGNITUDE, ONLY THE EXCESS IS RETAINED.  ROOTPSRS MAY CONVERGE ON THE CORRECT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1262
//# ROOT NONETHELESS, BUT IT MAY TAKE AN EXCESSIVE NUMBER OF ITERATIONS.  THEREFORE THE USER SHOULD RECOGNIZE:
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1263
//#	1.  USER'S RESPONSIBILITY TO ASSUR THAT I X A(I) < 1 IN MAGNITUDE FOR ALL I.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1264
//#	2.  USER'S RESPONSIBILITY TO ASSURE OVERFLOW WILL NOT OCCUR IN EVALUATING EITHER THE RESIDUAL OR THE DERIVATIVE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1265
//#	    POWER SERIES.  THIS OVERFLOW WOULD BE PRODUCED BY SUBROUTINE POWRSERS, CALLED BY ROOTPSRS, AND MIGHT NOT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1266
//#	    PRECLUDE EVENTUAL CONVERGENCE.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1267
//#	3.  AT PRESENT, ERASABLE LOCATIONS ARE RESERVED ONLY FOR N UP TO 5.  AN N IN EXCESS OF 5 WILL PRODUCE CHAOS.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1268
//#	    ALL ERASABLES USED BY ROOTPSRS ARE UNSWITCHED LOCATED IN THE REGION FROM MPAC-33 OCT TO MPAC+7.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1269
//#	4.  THE ITERATION COUNT RETURNED IN MPAC+2 MAY BE USED TO DETECT ABNORMAL PERFORMANCE.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1270
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1271
//					# STORE ENTERING DATA, INITIALIZE ERASABLES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1272
//ROOTPSRS	EXTEND
// slot 28523
                if slot <> 28523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28524 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1273
//		QXCH	RETROOT		# RETURN ADRES
// slot 28524
                    if slot <> 28524 or instruction <> 9306 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 90, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1274
//		TS	PWRPTR		# PWR TABLE POINTER
// slot 28525
                    if slot <> 28525 or instruction <> 22607 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22607, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28527 {
                if slot <= 28526 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1275
//		DXCH	MPAC +3		# PWR TABLE ADRES, N-1
// slot 28526
                    if slot <> 28526 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1276
//		CA	DERTABLL
// slot 28527
                    if slot <> 28527 or instruction <> 14270 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1982), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28528 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1277
//		TS	DERPTR		# DER TABL POINTER
// slot 28528
                    if slot <> 28528 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1278
//		TS	MPAC +5		# DER TABL ADRES
// slot 28529
                    if slot <> 28529 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28533 {
            if slot <= 28531 {
                if slot <= 28530 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1279
//		CCS	MPAC +4		# NO POWER SERIES DEGREE 1 OR LESS
// slot 28530
                    if slot <> 28530 or instruction <> 4208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 112).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1280
//		TS	MPAC +6		# N-2
// slot 28531
                    if slot <> 28531 or instruction <> 22642 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22642, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28532 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1281
//		CA	ZERO		# MODE USED AS ITERATION COUNTER.  MODE
// slot 28532
                    if slot <> 28532 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1282
//		TS	MODE		# MUST BE POS SO ABS WON'T COMP MPAC+3 ETC.
// slot 28533
                    if slot <> 28533 or instruction <> 22643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28535 {
                if slot <= 28534 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1283
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1284
//					# COMPUTE CRITERION TO STOP ITERATING
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1285
//		EXTEND
// slot 28534
                    if slot <> 28534 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1286
//		DCA	MPAC		# FETCH ROOT GUESS, KEEPING IT IN MPAC
// slot 28535
                    if slot <> 28535 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28536 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1287
//		DXCH	ROOTPS		# AND IN ROOTPS
// slot 28536
                    if slot <> 28536 or instruction <> 21591 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1288
//		INDEX	MPAC +3		# PWR TABLE ADRES
// slot 28537
                    if slot <> 28537 or instruction <> 20591 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20591, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20591, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1821] to agcAotUnit1821@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1289
//		CA	5		# PRECROOT TO A
// slot 28538
    28538, 24586
)).

// bank 31, slots 28539-28540
function agcAotUnit1822 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28539 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1290
//		TC	SHORTMP		# YIELDS DP PRODUCT IN MPAC
// slot 28539
        if slot <> 28539 or instruction <> 3783 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3783, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1291
//		TC	USPRCADR
// slot 28540
        if slot <> 28540 or instruction <> 2507 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2507, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1822] to agcAotUnit1822@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1292
//		CADR	ABS		# YIELDS ABVAL OF CRITERION ON DX IN MPAC
// slot 28541
    28541, 1324
)).

// bank 31, slots 28542-28545
function agcAotUnit1823 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28543 {
        if slot <= 28542 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1293
//		DXCH	MPAC
// slot 28542
            if slot <> 28542 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1294
//		DXCH	DXCRIT		# CRITERION
// slot 28543
            if slot <> 28543 or instruction <> 21589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 85, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28544 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1295
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1296
//					# SET UP DER COF TABL
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1297
//# Page 824
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1298
//		EXTEND
// slot 28544
            if slot <> 28544 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1299
//		INDEX	PWRPTR
// slot 28545
            if slot <> 28545 or instruction <> 20559 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20559, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20559, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1823] to agcAotUnit1823@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1300
//		DCA	3
// slot 28546
    28546, 24584
)).

// bank 31, slots 28547-28553
function agcAotUnit1824 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28549 {
        if slot <= 28547 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1301
//		DXCH	MPAC		# A(N) TO MPAC
// slot 28547
            if slot <> 28547 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28548 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1302
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1303
//		CA	MPAC +4		# N-1 TO A
// slot 28548
                if slot <> 28548 or instruction <> 12400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 112).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1304
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1305
//DERCLOOP	TS	PWRCNT		# LOOP COUNTER
// slot 28549
                if slot <> 28549 or instruction <> 22624 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22624, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28551 {
            if slot <= 28550 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1306
//		AD	ONE
// slot 28550
                if slot <> 28550 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1307
//		TC	DMPNSUB		# YIELDS DERCOF = I X A(I) IN MPAC
// slot 28551
                if slot <> 28551 or instruction <> 3790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28552 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1308
//		EXTEND
// slot 28552
                if slot <> 28552 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1309
//		INDEX	PWRPTR
// slot 28553
                if slot <> 28553 or instruction <> 20559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20559, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1824] to agcAotUnit1824@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1310
//		DCA	1
// slot 28554
    28554, 24580
)).

// bank 31, slots 28555-28556
function agcAotUnit1825 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28555 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1311
//		DXCH	MPAC		# (I-1) TO MPAC, FETCHING DERCOF
// slot 28555
        if slot <> 28555 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1312
//		INDEX	DERPTR
// slot 28556
        if slot <> 28556 or instruction <> 20577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20577, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20577, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1825] to agcAotUnit1825@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1313
//		DXCH	3		# DERCOF TO DER TABLE
// slot 28557
    28557, 43016
)).

// bank 31, slots 28558-28569
function agcAotUnit1826 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28563 {
        if slot <= 28560 {
            if slot <= 28558 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1314
//		CS	TWO
// slot 28558
                if slot <> 28558 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28559 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1315
//		ADS	PWRPTR		# DECREMENT PWR POINTER
// slot 28559
                    if slot <> 28559 or instruction <> 11343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 79).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1316
//		CS	TWO
// slot 28560
                    if slot <> 28560 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28561 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1317
//		ADS	DERPTR		# DECREMENT DER POINTER
// slot 28561
                if slot <> 28561 or instruction <> 11361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 97).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28562 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1318
//		CCS	PWRCNT
// slot 28562
                    if slot <> 28562 or instruction <> 4192 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 96).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1319
//		TCF	DERCLOOP
// slot 28563
                    if slot <> 28563 or instruction <> 6021 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6021, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28566 {
            if slot <= 28564 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1320
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1321
//					# CONVERGE ON ROOT
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1322
//ROOTLOOP	EXTEND
// slot 28564
                if slot <> 28564 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28565 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1323
//		DCA	ROOTPS		# FETCH CURRENT ROOT
// slot 28565
                    if slot <> 28565 or instruction <> 12375 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 87, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1324
//		DXCH	MPAC		# LEAVE IN MPAC
// slot 28566
                    if slot <> 28566 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28567 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1325
//		EXTEND
// slot 28567
                if slot <> 28567 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28568 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1326
//		DCA	MPAC +5		# LOAD A, L WITH DER TABL ADRES, N-2
// slot 28568
                    if slot <> 28568 or instruction <> 12402 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1327
//		TC	POWRSERS	# YIELDS DERIVATIVE IN MPAC
// slot 28569
                    if slot <> 28569 or instruction <> 3725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1826] to agcAotUnit1826@.

// bank 31, slots 28570-28577
function agcAotUnit1827 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28573 {
        if slot <= 28571 {
            if slot <= 28570 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1328
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1329
//		EXTEND
// slot 28570
                if slot <> 28570 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1330
//		DCA	ROOTPS
// slot 28571
                if slot <> 28571 or instruction <> 12375 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 87, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28572 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1331
//		DXCH	MPAC		# CURRENT ROOT TO MPAC, FETCHING DERIVATIVE
// slot 28572
                if slot <> 28572 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1332
//		DXCH	BUF		# LEAVE DERIVATIVE IN BUF AS DIVISOR
// slot 28573
                if slot <> 28573 or instruction <> 21593 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 89, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28575 {
            if slot <= 28574 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1333
//		EXTEND
// slot 28574
                if slot <> 28574 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1334
//		DCA	MPAC +3		# LOAD A, L WITH PWR TABL ADRES, N-1
// slot 28575
                if slot <> 28575 or instruction <> 12400 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 112, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28576 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1335
//		TC	POWRSERS	# YIELDS RESIDUAL IN MPAC
// slot 28576
                if slot <> 28576 or instruction <> 3725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1336
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1337
//		TC	USPRCADR
// slot 28577
                if slot <> 28577 or instruction <> 2507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2507, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1827] to agcAotUnit1827@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1338
//		CADR	DDV/BDDV	# YIELDS -DX IN MPAC
// slot 28578
    28578, 470
)).

// bank 31, slots 28579-28582
function agcAotUnit1828 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28580 {
        if slot <= 28579 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1339
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1340
//		EXTEND
// slot 28579
            if slot <> 28579 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1341
//		DCS	MPAC		# FETCH DX, LEAVING -DX IN MPAC
// slot 28580
            if slot <> 28580 or instruction <> 16493 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCS", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28581 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1342
//		DAS	ROOTPS		# CORRECTED ROOT NOW IN ROOTPS
// slot 28581
            if slot <> 28581 or instruction <> 8279 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 87) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1343
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1344
//		TC	USPRCADR
// slot 28582
            if slot <> 28582 or instruction <> 2507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1828] to agcAotUnit1828@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1345
//		CADR	ABS		# YIELDS ABS(DX) IN MPAC
// slot 28583
    28583, 1324
)).

// bank 31, slots 28584-28604
function agcAotUnit1829 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28593 {
        if slot <= 28588 {
            if slot <= 28585 {
                if slot <= 28584 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1346
//		EXTEND
// slot 28584
                    if slot <> 28584 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1347
//# Page 825
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1348
//		DCS	DXCRIT
// slot 28585
                    if slot <> 28585 or instruction <> 16469 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 85, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28586 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1349
//		DAS	MPAC		# ABS(DX)-ABS(DXCRIT) IN MPAC
// slot 28586
                    if slot <> 28586 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28587 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1350
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1351
//		CA	MODE
// slot 28587
                        if slot <> 28587 or instruction <> 12403 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 115).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1352
//		MASK	BIT4		# KLUMPP SAYS GIVE UP AFTER EIGHT PASSES
// slot 28588
                        if slot <> 28588 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        } else {
            if slot <= 28590 {
                if slot <= 28589 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1353
//		CCS	A
// slot 28589
                    if slot <> 28589 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1354
//BADROOT		TC	RETROOT
// slot 28590
                    if slot <> 28590 or instruction <> 90 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 90, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28591 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1355
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1356
//		INCR	MODE		# INCREMENT ITERATION COUNTER
// slot 28591
                    if slot <> 28591 or instruction <> 10355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 115).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28592 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1357
//		CCS	MPAC		# TEST HI ORDER DX
// slot 28592
                        if slot <> 28592 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1358
//		TCF	ROOTLOOP
// slot 28593
                        if slot <> 28593 or instruction <> 6036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 28598 {
            if slot <= 28595 {
                if slot <= 28594 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1359
//		TCF	TESTLODX
// slot 28594
                    if slot <> 28594 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1360
//		TCF	ROOTSTOR
// slot 28595
                    if slot <> 28595 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28596 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1361
//TESTLODX	CCS	MPAC +1		# TEST LO ORDER DX
// slot 28596
                    if slot <> 28596 or instruction <> 4205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 109).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28597 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1362
//		TCF	ROOTLOOP
// slot 28597
                        if slot <> 28597 or instruction <> 6036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1363
//		TCF	ROOTSTOR
// slot 28598
                        if slot <> 28598 or instruction <> 6072 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6072, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28601 {
                if slot <= 28599 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1364
//		TCF	ROOTSTOR
// slot 28599
                    if slot <> 28599 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28600 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1365
//ROOTSTOR	DXCH	ROOTPS
// slot 28600
                        if slot <> 28600 or instruction <> 21591 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1366
//		DXCH	MPAC
// slot 28601
                        if slot <> 28601 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28602 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1367
//		CA	MODE
// slot 28602
                    if slot <> 28602 or instruction <> 12403 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 115).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28603 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1368
//		TS	MPAC +2		# STORE SP ITERATION COUNT IN MPAC+2
// slot 28603
                        if slot <> 28603 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1369
//		INDEX	RETROOT
// slot 28604
                        if slot <> 28604 or instruction <> 20570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20570, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20570, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1829] to agcAotUnit1829@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1370
//		TCF	2
// slot 28605
    28605, 8196,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1371
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1372
//DERTABLL	ADRES	DERCOFN -3
// slot 28606
    28606, 206
)).

// bank 31, slots 28607-28607
function agcAotUnit1830 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1373
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1374
//# ****************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1375
//# TRASHY LITTLE SUBROUTINES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1376
//# ****************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1377
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1378
//INTPRETX	INDEX	WCHPHASE	# SET X1 ON THE WAY TO THE INTERPRETER
// slot 28607
    if slot <> 28607 or instruction <> 21225 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21225, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21225, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1830] to agcAotUnit1830@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1379
//		CS	TARGTDEX
// slot 28608
    28608, 35412
)).

// bank 31, slots 28609-28609
function agcAotUnit1831 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1380
//		INDEX	FIXLOC
// slot 28609
    if slot <> 28609 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1831] to agcAotUnit1831@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1381
//		TS	X1
// slot 28610
    28610, 45132
)).

// bank 31, slots 28611-28635
function agcAotUnit1832 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28622 {
        if slot <= 28616 {
            if slot <= 28613 {
                if slot <= 28611 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1382
//		TCF	INTPRET
// slot 28611
                    if slot <> 28611 or instruction <> 7199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7199, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28612 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1383
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1384
//TDISPSET	CA	TTF/8
// slot 28612
                        if slot <> 28612 or instruction <> 13218 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 930).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1385
//		EXTEND
// slot 28613
                        if slot <> 28613 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28614 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1386
//		MP	TSCALINV
// slot 28614
                    if slot <> 28614 or instruction <> 31208 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28615 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1387
//		DXCH	TTFDISP
// slot 28615
                        if slot <> 28615 or instruction <> 22334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 830, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1388
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1389
//		CA	EBANK5		# TREDES BECOMES ZERO TWO PASSES
// slot 28616
                        if slot <> 28616 or instruction <> 14860 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 28619 {
                if slot <= 28617 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1390
//		TS	EBANK		#	BEFORE TCGFAPPR IS REACHED
// slot 28617
                    if slot <> 28617 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28618 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1391
//		EBANK=	TCGFAPPR
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1392
//		CA	TCGFAPPR
// slot 28618
                        if slot <> 28618 or instruction <> 13112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 824).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1393
//		INCR	BBANK
// slot 28619
                        if slot <> 28619 or instruction <> 10246 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 6).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28620 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1394
//		INCR	BBANK
// slot 28620
                    if slot <> 28620 or instruction <> 10246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28621 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1395
//		EBANK=	TTF/8
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1396
//# Page 826
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1397
//		AD	TTF/8
// slot 28621
                        if slot <> 28621 or instruction <> 25506 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 930).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1398
//		EXTEND
// slot 28622
                        if slot <> 28622 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 28628 {
            if slot <= 28625 {
                if slot <= 28623 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1399
//		MP	TREDESCL
// slot 28623
                    if slot <> 28623 or instruction <> 30697 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2025, readEffective:call(words, 2025)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28624 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1400
//		AD	-DEC103
// slot 28624
                        if slot <> 28624 or instruction <> 26599 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2023), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1401
//		AD	NEGMAX
// slot 28625
                        if slot <> 28625 or instruction <> 27101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28626 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1402
//		TS	L
// slot 28626
                    if slot <> 28626 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28627 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1403
//		CS	L
// slot 28627
                        if slot <> 28627 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1404
//		AD	L
// slot 28628
                        if slot <> 28628 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28631 {
                if slot <= 28629 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1405
//		AD	+DEC99
// slot 28629
                    if slot <> 28629 or instruction <> 26600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2024), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28630 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1406
//		AD	POSMAX
// slot 28630
                        if slot <> 28630 or instruction <> 27099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1407
//		TS	TREDES
// slot 28631
                        if slot <> 28631 or instruction <> 23478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23478, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 28633 {
                    if slot <= 28632 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1408
//		CS	TREDES
// slot 28632
                        if slot <> 28632 or instruction <> 17334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 950).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1409
//		ADS	TREDES
// slot 28633
                        if slot <> 28633 or instruction <> 12214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 950).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28634 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1410
//		TC	Q
// slot 28634
                        if slot <> 28634 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1411
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1412
//1406P00		TC	POODOO
// slot 28635
                        if slot <> 28635 or instruction <> 2986 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2986, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1832] to agcAotUnit1832@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1413
//		OCT	01406
// slot 28636
    28636, 1548
)).

// bank 31, slots 28637-28637
function agcAotUnit1833 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1414
//1406ALM		TC	ALARM
// slot 28637
    if slot <> 28637 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1833] to agcAotUnit1833@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1415
//		OCT	01406
// slot 28638
    28638, 1548
)).

// bank 31, slots 28639-28645
function agcAotUnit1834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28641 {
        if slot <= 28639 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1416
//		TCF	RATESTOP
// slot 28639
            if slot <> 28639 or instruction <> 5923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5923, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28640 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1417
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1418
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1419
//# SPECIALIZED "PHASCHNG" SUBROUTINE
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1420
//# *********************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1421
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1422
//		EBANK=	PHSNAME2
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1423
//FASTCHNG	CA	EBANK3		# SPECIALIZED 'PHASCHNG' ROUTINE
// slot 28640
                if slot <> 28640 or instruction <> 14855 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1424
//		XCH	EBANK
// slot 28641
                if slot <> 28641 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28643 {
            if slot <= 28642 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1425
//		DXCH	L
// slot 28642
                if slot <> 28642 or instruction <> 21506 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 2, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1426
//		TS	PHSNAME3
// slot 28643
                if slot <> 28643 or instruction <> 23330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23330, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28644 {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1427
//		LXCH	EBANK
// slot 28644
                if slot <> 28644 or instruction <> 9219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 3, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1428
//		EBANK=	E2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1429
//		TC	A
// slot 28645
                if slot <> 28645 or instruction <> 0 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 0, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1834] to agcAotUnit1834@.

agcAotInstallSourceRope(list(
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1430
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1431
//# *************************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1432
//# PARAMETER TABLE INDIRECT ADDRESSES
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1433
//# *************************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1434
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1435
//RDG		=	RBRFG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1436
//VDG		=	VBRFG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1437
//ADG		=	ABRFG
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1438
//VDG2TTF		=	VBRFG*
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1439
//ADG2TTF		=	ABRFG*
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1440
//JDG2TTF		=	JBRFG*
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1441
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1442
//# *************************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1443
//# LUNAR LANDING CONSTANTS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1444
//# *************************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1445
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1446
//# Page 827
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1447
//TABLTTFL	ADRES	TABLTTF +3	# ADDRESS FOR REFERENCING TTF TABLE
// slot 28646
    28646, 1770,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1448
//TTFSCALE	=	BIT12
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1449
//TSCALINV	=	BIT4
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1450
//-DEC103		DEC	-103
// slot 28647
    28647, 65328,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1451
//+DEC99		DEC	+99
// slot 28648
    28648, 198,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1452
//TREDESCL	DEC	-.08
// slot 28649
    28649, 62912,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1453
//180DEGS		DEC	+180
// slot 28650
    28650, 360,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1454
//1/2DEG		DEC	+.00278
// slot 28651
    28651, 92,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1455
//PROJMAX		DEC	.42262 B-3	# SIN(25')/8 TO COMPARE WITH PROJ
// slot 28652
    28652, 1732,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1456
//PROJMIN		DEC	.25882 B-3	# SIN(15')/8 TO COMPARE WITH PROJ
// slot 28653
    28653, 1060,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1457
//V06N63		VN	0663		# P63
// slot 28654
    28654, 1662,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1458
//V06N64		VN	0664		# P64
// slot 28655
    28655, 1664,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1459
//V06N60		VN	0660		# P65, P66, P67
// slot 28656
    28656, 1656,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1460
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1461
//		BANK	22
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1462
//		SETLOC	LANDCNST
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1463
//		BANK
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1464
//		COUNT*	$$/F2DPS
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1465
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1466
//HIGHESTF	2DEC	4.34546769 B-12
// slot 21415 21416
    21415, 34, 21416, 12514,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1467
//GSCALE		2DEC	100 B-11
// slot 21417 21418
    21417, 1600, 21418, 0,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1468
//3/8DP		2DEC	.375
// slot 21419 21420
    21419, 12288, 21420, 0,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1469
//3/4DP		2DEC	.750
// slot 21421 21422
    21421, 24576, 21422, 0,
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1470
//DEPRCRIT	2DEC	-.02 B-1
// slot 21423 21424
    21423, 65208, 21424, 38008
)).

// no code for the lines below
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1471
//
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1472
//# Page 828
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1473
//# **************************************************************************
// LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1474
//# **************************************************************************
