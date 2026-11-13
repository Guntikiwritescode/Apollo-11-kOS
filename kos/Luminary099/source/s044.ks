// PORT: Original source unit LUNAR_LANDING_GUIDANCE_EQUATIONS.agc.
// PORT: Physical bank 31. Shared continuation entries, slots 27920–27944.
function agcAotUnit1764 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27931 {
        if slot <= 27925 {
            if slot <= 27922 {
                if slot <= 27920 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:2
//# Filename:	LUNAR_LANDING_GUIDANCE_EQUATIONS.agc
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:7
//# Contact:	HARTMUTH GUTSCHE <hgutsche@xplornet.com>.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:9
//# Pages:	798-828
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:11
//#		2009-06-05 RSB	Fixed a goofy thing that was apparently
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:12
//#				legal in GAP but not in yaYUL.  Eliminated
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:13
//#				a couple of lines of code that shouldn't
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:14
//#				have survived from Luminary 131 to here.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:15
//#		2009-06-07 RSB	Fixed a typo.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:16
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:17
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:19
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:21
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:24
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:25
//# actually created.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:26
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:27
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:28
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:30
//#	16:27 JULY 14, 1969
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:31
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:32
//# Page 798
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:33
//		EBANK=	E2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:34
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:35
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:36
//# ********************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:37
//# LUNAR LANDING FLIGHT SEQUENCE TABLES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:38
//# ********************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:39
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:40
//# FLIGHT SEQUENCE TABLES ARE ARRANGED BY FUNCTION.  THEY ARE REFERENCED USING AS AN INDEX THE REGISTER WCHPHASE:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:41
//#	WCHPHASE = -1 ---> IGNALG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:42
//#	WCHPHASE =  0 ---> BRAKQUAD
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:43
//#	WCHPHASE =  1 ---> APPRQUAD
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:44
//#	WCHPHASE =  2 ---> VERTICAL
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:45
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:46
//#*********************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:47
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:48
//# ROUTINES FOR STARTING NEW GUIDANCE PHASES:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:49
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:50
//		TCF	TTFINCR		# IGNALG
// PORT: Fixed ROM slots 27920.
                    if slot <> 27920 or instruction <> 5537 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5537, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27921 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:51
//NEWPHASE	TCF	TTFINCR		# BRAKQUAD
// PORT: Fixed ROM slots 27921.
                        if slot <> 27921 or instruction <> 5537 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5537, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:52
//		TCF	STARTP64	# APPRQUAD
// PORT: Fixed ROM slots 27922.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:53
//		TCF	P65START	# VERTICAL
// PORT: Fixed ROM slots 27923.
                    if slot <> 27923 or instruction <> 5521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27924 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:54
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:55
//# PRE-GUIDANCE COMPUTATIONS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:56
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:57
//		TCF	CALCRGVG	# IGNALG
// PORT: Fixed ROM slots 27924.
                        if slot <> 27924 or instruction <> 5635 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5635, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:58
//PREGUIDE	TCF	RGVGCALC	# BRAKQUAD
// PORT: Fixed ROM slots 27925.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:59
//		TCF	REDESIG		# APPRQUAD
// PORT: Fixed ROM slots 27926.
                    if slot <> 27926 or instruction <> 5572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5572, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27927 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:60
//		TCF	RGVGCALC	# VERTICAL
// PORT: Fixed ROM slots 27927.
                        if slot <> 27927 or instruction <> 5643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:61
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:62
//# GUIDANCE EQUATIONS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:63
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:64
//		TCF	TTF/8CL		# IGNALG
// PORT: Fixed ROM slots 27928.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:65
//WHATGUID	TCF	TTF/8CL		# BRAKQUAD
// PORT: Fixed ROM slots 27929.
                    if slot <> 27929 or instruction <> 5681 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5681, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27930 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:66
//		TCF	TTF/8CL		# APPRQUAD
// PORT: Fixed ROM slots 27930.
                        if slot <> 27930 or instruction <> 5681 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5681, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:67
//		TCF	VERTGUID	# VERTICAL
// PORT: Fixed ROM slots 27931.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:68
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:69
//# POST GUIDANCE EQUATION COMPUTATIONS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:70
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:71
//		TCF	CGCALC		# IGNALG
// PORT: Fixed ROM slots 27932.
                    if slot <> 27932 or instruction <> 5797 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5797, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27933 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:72
//AFTRGUID	TCF	CGCALC		# BRAKQUAD
// PORT: Fixed ROM slots 27933.
                        if slot <> 27933 or instruction <> 5797 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5797, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:73
//		TCF	CGCALC		# APPRQUAD
// PORT: Fixed ROM slots 27934.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:74
//		TCF	STEER?		# VERTICAL
// PORT: Fixed ROM slots 27935.
                    if slot <> 27935 or instruction <> 5914 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5914, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27936 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:75
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:76
//# Page 799
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:77
//# WINDOW VECTOR COMPUTATIONS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:78
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:79
//		TCF	EXGSUB		# IGNALG
// PORT: Fixed ROM slots 27936.
                        if slot <> 27936 or instruction <> 5849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5849, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:80
//WHATEXIT	TCF	EXBRAK		# BRAKQUAD
// PORT: Fixed ROM slots 27937.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:81
//		TCF	EXNORM		# APPRQUAD
// PORT: Fixed ROM slots 27938.
                    if slot <> 27938 or instruction <> 5872 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5872, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27939 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:82
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:83
//# DISPLAY ROUTINES:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:84
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:85
//WHATDISP	TCF	P63DISPS	# BRAKQUAD
// PORT: Fixed ROM slots 27939.
                        if slot <> 27939 or instruction <> 5947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5947, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:86
//		TCF	P64DISPS	# APPRQUAD
// PORT: Fixed ROM slots 27940.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:87
//		TCF	VERTDISP	# VERTICAL
// PORT: Fixed ROM slots 27941.
                        if slot <> 27941 or instruction <> 5975 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5975, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:88
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:89
//# ALARM ROUTINE FOR TTF COMPUTATION:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:90
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:91
//		TCF	1406P00		# IGNALG
// PORT: Fixed ROM slots 27942.
                        if slot <> 27942 or instruction <> 6107 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6107, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27943 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:92
//WHATALM		TCF	1406ALM		# BRAKQUAD
// PORT: Fixed ROM slots 27943.
                        if slot <> 27943 or instruction <> 6109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6109, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:93
//		TCF	1406ALM		# APPRQUAD
// PORT: Fixed ROM slots 27944.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:94
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:95
//# INDICES FOR REFERENCING TARGET PARAMETERS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:96
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:97
//		OCT	0		# IGNALG
// PORT: Fixed ROM slots 27945.
    27945, 0,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:98
//TARGTDEX	OCT	0		# BRAKQUAD
// PORT: Fixed ROM slots 27946.
    27946, 0,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:99
//		OCT	34		# APPRQUAD
// PORT: Fixed ROM slots 27947.
    27947, 56,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:100
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:101
//#************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:102
//# ENTRY POINTS:  ?GUIDSUB FOR THE IGNITION ALGORITHM, LUNLAND FOR SERVOUT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:103
//#************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:104
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:105
//# IGNITION ALGORITHM ENTRY:  DELIVERS N PASSES OF QUADRATIC GUIDANCE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:106
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:107
//?GUIDSUB	EXIT
// PORT: Fixed ROM slots 27948.
    27948, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27949–27954.
function agcAotUnit1765 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27951 {
        if slot <= 27949 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:108
//		CAF	TWO		# N = 3
// PORT: Fixed ROM slots 27949.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:109
//		TS	NGUIDSUB
// PORT: Fixed ROM slots 27950.
                if slot <> 27950 or instruction <> 23463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:110
//		TCF	GUILDRET +2
// PORT: Fixed ROM slots 27951.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:111
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:112
//GUIDSUB		TS	NGUIDSUB	# ON SUCCEEDING PASSES SKIP TTFINCR
// PORT: Fixed ROM slots 27952.
            if slot <> 27952 or instruction <> 23463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27953 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:113
//		TCF	CALCRGVG
// PORT: Fixed ROM slots 27953.
                if slot <> 27953 or instruction <> 5635 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5635, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:114
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:115
//# NORMAL ENTRY:  CONTROL COMES HERE FROM SERVOUT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:116
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:117
//LUNLAND		TC	PHASCHNG
// PORT: Fixed ROM slots 27954.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:118
//		OCT	00035		# GROUP 5:  RETAIN ONLY PIPA TASK
// PORT: Fixed ROM slots 27955.
    27955, 58
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27956–27956.
function agcAotUnit1766 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:119
//		TC	PHASCHNG
// PORT: Fixed ROM slots 27956.
    if slot <> 27956 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1766] to agcAotUnit1766@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:120
//		OCT	05023		# GROUP 3:  PROTECT GUIDANCE WITH PRIO 21
// PORT: Fixed ROM slots 27957.
    27957, 5158,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:121
//		OCT	21000		#	JUST HIGHER THAN SERVICER'S PRIORITY
// PORT: Fixed ROM slots 27958.
    27958, 17408
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27959–27964.
function agcAotUnit1767 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27961 {
        if slot <= 27959 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:122
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:123
//# Page 800
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:124
//#*******************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:125
//# GUILDENSTERN:  AUTO-MODES MONITOR (R13)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:126
//#*******************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:127
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:128
//		COUNT*	$$/R13
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:129
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:130
//# HERE IS THE PHILOSOPHY OF GUILDENSTERN:	ON EVERY APPEARANCE OR DISAPPEARANCE OF THE MANUAL THROTTLE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:131
//# DISCRETE TO SELECT P67 OR P66 RESPECTIVELY:   ON EVERY APPEARANCE OF THE ATTITUDE-HOLD DISCRETE TO SELECT P66
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:132
//# UNLESS THE CURRENT PROGRAM IS P67 IN WHICH CASE THERE IS NO CHANGE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:133
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:134
//GUILDEN		EXTEND			# IS UN-AUTO-THROTTLE DISCRETE PRESENT?
// PORT: Fixed ROM slots 27959.
            if slot <> 27959 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27960 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:135
//# STERN					# RSB 2009: Not originally a comment.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:136
// 		READ CHAN30
// PORT: Fixed ROM slots 27960.
                if slot <> 27960 or instruction <> 24 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 0, 24, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:137
//		MASK	BIT5
// PORT: Fixed ROM slots 27961.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:138
// 		CCS	A
// PORT: Fixed ROM slots 27962.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:139
// 		TCF	STARTP67	# YES
// PORT: Fixed ROM slots 27963.
                if slot <> 27963 or instruction <> 5481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:140
//P67NOW?		TC	CHECKMM		# NO:  ARE WE IN P67 NOW?
// PORT: Fixed ROM slots 27964.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:141
//		DEC	67
// PORT: Fixed ROM slots 27965.
    27965, 134
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27966–27968.
function agcAotUnit1768 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27966 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:142
//		TCF	STABL?		# NO
// PORT: Fixed ROM slots 27966.
        if slot <> 27966 or instruction <> 5487 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5487, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 27967 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:143
//STARTP66	TC	FASTCHNG	# YES
// PORT: Fixed ROM slots 27967.
            if slot <> 27967 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:144
//		TC	NEWMODEX
// PORT: Fixed ROM slots 27968.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:145
//DEC66		DEC	66
// PORT: Fixed ROM slots 27969.
    27969, 132
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27970–27973.
function agcAotUnit1769 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27971 {
        if slot <= 27970 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:146
//		EXTEND
// PORT: Fixed ROM slots 27970.
            if slot <> 27970 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:147
//		DCA	HDOTDISP	# SET DESIRED ALTITUDE RATE = CURRENT
// PORT: Fixed ROM slots 27971.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:148
//		DXCH	VDGVERT		# 	ALTITUDE RATE.
// PORT: Fixed ROM slots 27972.
            if slot <> 27972 or instruction <> 22437 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 933, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:149
//STRTP66A	TC	INTPRET
// PORT: Fixed ROM slots 27973.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:150
//		SLOAD	PUSH
// PORT: Fixed ROM slots 27974.
    27974, 34490,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:151
//			PBIASZ
// PORT: Fixed ROM slots 27975.
    27975, 1630,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:152
//		SLOAD	PUSH
// PORT: Fixed ROM slots 27976.
    27976, 34490,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:153
//			PBIASY
// PORT: Fixed ROM slots 27977.
    27977, 1626,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:154
//		SLOAD	VDEF
// PORT: Fixed ROM slots 27978.
    27978, 46778,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:155
//			PBIASX
// PORT: Fixed ROM slots 27979.
    27979, 1622,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:156
//		VXSC	SET
// PORT: Fixed ROM slots 27980.
    27980, 36066,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:157
//			BIASFACT
// PORT: Fixed ROM slots 27981.
    27981, 22206,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:158
//			RODFLAG
// PORT: Fixed ROM slots 27982.
    27982, 614,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:159
//		STOVL	VBIAS
// PORT: Fixed ROM slots 27983.
    27983, 23346,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:160
//			TEMX
// PORT: Fixed ROM slots 27984.
    27984, 1370,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:161
//		VCOMP
// PORT: Fixed ROM slots 27985.
    27985, 65404,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:162
//		STOVL	OLDPIPAX
// PORT: Fixed ROM slots 27986.
    27986, 24552,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:163
//			ZEROVECS
// PORT: Fixed ROM slots 27987.
    27987, 6820,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:164
//		STODL	DELVROD
// PORT: Fixed ROM slots 27988.
    27988, 16366,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:165
//			RODSCALE
// PORT: Fixed ROM slots 27989.
    27989, 2752,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:166
//		STODL	RODSCAL1
// PORT: Fixed ROM slots 27990.
    27990, 16350,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:167
//			PIPTIME
// PORT: Fixed ROM slots 27991.
    27991, 1338,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:168
//		STORE	LASTTPIP
// PORT: Fixed ROM slots 27992.
    27992, 4064,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:169
//		EXIT
// PORT: Fixed ROM slots 27993.
    27993, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27994–28002.
function agcAotUnit1770 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27997 {
        if slot <= 27995 {
            if slot <= 27994 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:170
//		CAF	ZERO
// PORT: Fixed ROM slots 27994.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:171
//		TS	FCOLD
// PORT: Fixed ROM slots 27995.
                if slot <> 27995 or instruction <> 23440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27996 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:172
//		TS	FWEIGHT
// PORT: Fixed ROM slots 27996.
                if slot <> 27996 or instruction <> 23432 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23432, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:173
//		TS	FWEIGHT +1
// PORT: Fixed ROM slots 27997.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:174
//VRTSTART	TS	WCHVERT
// PORT: Fixed ROM slots 27998.
                if slot <> 27998 or instruction <> 23463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:175
//# Page 801
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:176
//		CAF	TWO		# WCHPHASE = 2 ---> VERTICAL: P65,P66,P67
// PORT: Fixed ROM slots 27999.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:177
//		TS	WCHPHOLD
// PORT: Fixed ROM slots 28000.
                if slot <> 28000 or instruction <> 23441 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23441, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28001 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:178
//		TS	WCHPHASE
// PORT: Fixed ROM slots 28001.
                    if slot <> 28001 or instruction <> 23273 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23273, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:179
//		TC	BANKCALL	# TEMPORARY, I HOPE HOPE HOPE
// PORT: Fixed ROM slots 28002.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:180
//		CADR	STOPRATE	# TEMPORARY, I HOPE HOPE HOPE
// PORT: Fixed ROM slots 28003.
    28003, 33002
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28004–28004.
function agcAotUnit1771 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:181
//		TC	DOWNFLAG	# PERMIT X-AXIS OVERRIDE
// PORT: Fixed ROM slots 28004.
    if slot <> 28004 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1771] to agcAotUnit1771@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:182
//		ADRES	XOVINFLG
// PORT: Fixed ROM slots 28005.
    28005, 402
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28006–28006.
function agcAotUnit1772 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:183
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 28006.
    if slot <> 28006 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1772] to agcAotUnit1772@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:184
//		ADRES	REDFLAG
// PORT: Fixed ROM slots 28007.
    28007, 198
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28008–28009.
function agcAotUnit1773 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28008 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:185
//		TCF	VERTGUID
// PORT: Fixed ROM slots 28008.
        if slot <> 28008 or instruction <> 5977 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5977, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:186
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:187
//STARTP67	TC	NEWMODEX	# NO HARM IN "STARTING" P67 OVER AND OVER
// PORT: Fixed ROM slots 28009.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:188
//		DEC	67		# SO NO NEED FOR A FASTCHNG AND NO NEED
// PORT: Fixed ROM slots 28010.
    28010, 134
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28011–28047.
function agcAotUnit1774 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28028 {
        if slot <= 28019 {
            if slot <= 28014 {
                if slot <= 28012 {
                    if slot <= 28011 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:189
//		CAF	ZERO		# TO SEE IF ALREADY IN P67.
// PORT: Fixed ROM slots 28011.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:190
//		TS	RODCOUNT
// PORT: Fixed ROM slots 28012.
                        if slot <> 28012 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28013 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:191
//		CAF	TEN
// PORT: Fixed ROM slots 28013.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:192
//		TCF	VRTSTART
// PORT: Fixed ROM slots 28014.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:193
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:194
//STABL?		CAF	BIT13		# IS UN-ATTITUDE-HOLD DISCRETE PRESENT?
// PORT: Fixed ROM slots 28015.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:195
//		EXTEND
// PORT: Fixed ROM slots 28016.
                        if slot <> 28016 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28017 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:196
//		RAND	CHAN31
// PORT: Fixed ROM slots 28017.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:197
//		CCS	A
// PORT: Fixed ROM slots 28018.
                            if slot <> 28018 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:198
//		TCF	GUILDRET	# YES ALL'S WELL
// PORT: Fixed ROM slots 28019.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:199
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:200
//P66NOW?		CS	MODREG
// PORT: Fixed ROM slots 28020.
                        if slot <> 28020 or instruction <> 16905 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 521).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:201
//		AD	DEC66
// PORT: Fixed ROM slots 28021.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:202
//		EXTEND
// PORT: Fixed ROM slots 28022.
                        if slot <> 28022 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:203
//		BZF	RESTART?
// PORT: Fixed ROM slots 28023.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:204
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:205
//		CA	RODCOUNT	# NO. HAS THE ROD SWITCH BEEN "CLICKED"?
// PORT: Fixed ROM slots 28024.
                        if slot <> 28024 or instruction <> 13286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 998).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:206
//		EXTEND
// PORT: Fixed ROM slots 28025.
                        if slot <> 28025 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28026 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:207
//		BZF	GUILDRET	# NO. CONTINUE WITH AUTOMATIC LANDING
// PORT: Fixed ROM slots 28026.
                        if slot <> 28026 or instruction <> 5505 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5505, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28027 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:208
//		TCF	STARTP66	# YES. SWITCH INTO THE ROD MODE.
// PORT: Fixed ROM slots 28027.
                            if slot <> 28027 or instruction <> 5439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:209
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:210
//RESTART?	CA	FLAGWRD1	# HAS THERE BEEN A RESTART?
// PORT: Fixed ROM slots 28028.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:211
//		MASK	RODFLBIT
// PORT: Fixed ROM slots 28029.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:212
//		EXTEND
// PORT: Fixed ROM slots 28030.
                        if slot <> 28030 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28031 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:213
//		BZF	STRTP66A	# YES.  REINITIALIZE BUT LEAVE VDGVERT AS
// PORT: Fixed ROM slots 28031.
                        if slot <> 28031 or instruction <> 5445 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5445, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:214
//					#	IS.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:215
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:216
//		TCF	VERTGUID	# NO: CONTINUE WITH R.O.D.
// PORT: Fixed ROM slots 28032.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:217
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:218
//# *******************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:219
//# INITIALIZATION FOR THIS PASS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:220
//# *******************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:221
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:222
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:223
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:224
//GUILDRET	CAF	ZERO
// PORT: Fixed ROM slots 28033.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:225
//		TS	RODCOUNT
// PORT: Fixed ROM slots 28034.
                        if slot <> 28034 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28035 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:226
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:227
//# Page 802
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:228
// +2		EXTEND
// PORT: Fixed ROM slots 28035.
                        if slot <> 28035 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 28036 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:229
// 		DCA	TPIP
// PORT: Fixed ROM slots 28036.
                            if slot <> 28036 or instruction <> 13205 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 917, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:230
//		DXCH	TPIPOLD
// PORT: Fixed ROM slots 28037.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:231
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:232
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28038.
                        if slot <> 28038 or instruction <> 2016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2016, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:233
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:234
//		EXTEND
// PORT: Fixed ROM slots 28039.
                        if slot <> 28039 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 28040 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:235
//		DCA	PIPTIME1
// PORT: Fixed ROM slots 28040.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:236
//		DXCH	TPIP
// PORT: Fixed ROM slots 28041.
                            if slot <> 28041 or instruction <> 22421 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 917, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:237
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:238
//		EXTEND
// PORT: Fixed ROM slots 28042.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:239
//		DCA	TTF/8
// PORT: Fixed ROM slots 28043.
                        if slot <> 28043 or instruction <> 13219 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 931, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:240
//		DXCH	TTF/8TMP
// PORT: Fixed ROM slots 28044.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:241
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:242
//		CCS	FLPASS0
// PORT: Fixed ROM slots 28045.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:243
//		TCF	TTFINCR
// PORT: Fixed ROM slots 28046.
                            if slot <> 28046 or instruction <> 5537 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5537, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:244
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:245
//BRSPOT1		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28047.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:246
//		TCF	NEWPHASE
// PORT: Fixed ROM slots 28048.
    28048, 10786
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28049–28049.
function agcAotUnit1775 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:247
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:248
//# ******************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:249
//# ROUTINES TO START NEW PHASES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:250
//# ******************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:251
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:252
//P65START	TC	NEWMODEX
// PORT: Fixed ROM slots 28049.
    if slot <> 28049 or instruction <> 2761 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2761, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1775] to agcAotUnit1775@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:253
//		DEC	65
// PORT: Fixed ROM slots 28050.
    28050, 130
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28051–28053.
function agcAotUnit1776 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28051 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:254
//		CS	TWO
// PORT: Fixed ROM slots 28051.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:255
//		TS	WCHVERT
// PORT: Fixed ROM slots 28052.
            if slot <> 28052 or instruction <> 23463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:256
//		TC	DOWNFLAG	# PERMIT X-AXIS OVERRIDE
// PORT: Fixed ROM slots 28053.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:257
//		ADRES	XOVINFLG
// PORT: Fixed ROM slots 28054.
    28054, 402
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28055–28056.
function agcAotUnit1777 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28055 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:258
//		TCF	TTFINCR
// PORT: Fixed ROM slots 28055.
        if slot <> 28055 or instruction <> 5537 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5537, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:259
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:260
//STARTP64	TC	NEWMODEX
// PORT: Fixed ROM slots 28056.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:261
//		DEC	64
// PORT: Fixed ROM slots 28057.
    28057, 128
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28058–28063.
function agcAotUnit1778 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28060 {
        if slot <= 28058 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:262
//		CA	DELTTFAP	# AUGMENT TTF/8
// PORT: Fixed ROM slots 28058.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:263
//		ADS	TTF/8TMP
// PORT: Fixed ROM slots 28059.
                if slot <> 28059 or instruction <> 12138 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 874).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:264
//		CA	BIT12		# ENABLE RUPT10
// PORT: Fixed ROM slots 28060.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:265
//		EXTEND
// PORT: Fixed ROM slots 28061.
            if slot <> 28061 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28062 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:266
//		WOR	CHAN13
// PORT: Fixed ROM slots 28062.
                if slot <> 28062 or instruction <> 2571 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:267
//		TC	DOWNFLAG	# INITIALIZE REDESIGNATION FLAG
// PORT: Fixed ROM slots 28063.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:268
//		ADRES	REDFLAG
// PORT: Fixed ROM slots 28064.
    28064, 198
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28065–28065.
function agcAotUnit1779 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:269
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:270
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:271
//#		(CONTINUE TO TTFINCR)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:272
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:273
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:274
//# INCREMENT TTF/8, UPDATE LAND FOR LUNAR ROTATION, DO OTHER USEFUL THINGS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:275
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:276
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:277
//#	TTFINCR COMPUTATIONS ARE AS FOLLOWS --
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:278
//# Page 803
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:279
//#		TTF/8 UPDATED FOR TIME SINCE LAST PASS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:280
//#			TTF/8 = TTF/8 + (TPIP - TPIPOLD)/8
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:281
//#		LANDING SITE VECTOR UPDATED FOR LUNAR ROTATION:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:282
//#			____               ____   ____                   __
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:283
//#			LAND = /LAND/ UNIT(LAND - LAND(TPIP - TPIPOLD) * WM)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:284
//#		SLANT RANGE TO LANDING SITE, FOR DISPLAY:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:285
//#			                 ____   _
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:286
//#			RANGEDSP = ABVAL(LAND - R)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:287
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:288
//TTFINCR		TC	INTPRET
// PORT: Fixed ROM slots 28065.
    if slot <> 28065 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1779] to agcAotUnit1779@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:289
//		DLOAD	DSU
// PORT: Fixed ROM slots 28066.
    28066, 38346,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:290
//			TPIP
// PORT: Fixed ROM slots 28067.
    28067, 3882,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:291
//			TPIPOLD
// PORT: Fixed ROM slots 28068.
    28068, 3832,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:292
//		SLR	PUSH		# SHIFT SCALES DELTA TIME TO 2(17) CSECS
// PORT: Fixed ROM slots 28069.
    28069, 34402,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:293
//			11D
// PORT: Fixed ROM slots 28070.
    28070, 17688,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:294
//		VXSC	VXV
// PORT: Fixed ROM slots 28071.
    28071, 40418,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:295
//			LAND
// PORT: Fixed ROM slots 28072.
    28072, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:296
//			WM
// PORT: Fixed ROM slots 28073.
    28073, 2474,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:297
//		BVSU	RTB
// PORT: Fixed ROM slots 28074.
    28074, 40010,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:298
//			LAND
// PORT: Fixed ROM slots 28075.
    28075, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:299
//			NORMUNIT
// PORT: Fixed ROM slots 28076.
    28076, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:300
//		VXSC	VSL1
// PORT: Fixed ROM slots 28077.
    28077, 64226,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:301
//			/LAND/
// PORT: Fixed ROM slots 28078.
    28078, 2486,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:302
//		STODL	LANDTEMP
// PORT: Fixed ROM slots 28079.
    28079, 16074,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:303
//		EXIT
// PORT: Fixed ROM slots 28080.
    28080, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28081–28098.
function agcAotUnit1780 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28089 {
        if slot <= 28084 {
            if slot <= 28082 {
                if slot <= 28081 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:304
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:305
//		DXCH	MPAC
// PORT: Fixed ROM slots 28081.
                    if slot <> 28081 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:306
//		DAS	TTF/8TMP	# NOW HAVE INCREMENTED TTF/8 IN TTF/8TMP
// PORT: Fixed ROM slots 28082.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:307
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:308
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28083.
                    if slot <> 28083 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:309
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:310
//		EXTEND
// PORT: Fixed ROM slots 28084.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:311
//		DCA	TTF/8TMP
// PORT: Fixed ROM slots 28085.
                    if slot <> 28085 or instruction <> 13163 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 875, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:312
//		DXCH	TTF/8
// PORT: Fixed ROM slots 28086.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:313
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:314
//		EXTEND
// PORT: Fixed ROM slots 28087.
                    if slot <> 28087 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28088 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:315
//		DCA	LANDTEMP
// PORT: Fixed ROM slots 28088.
                        if slot <> 28088 or instruction <> 13157 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 869, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:316
//		DXCH	LAND
// PORT: Fixed ROM slots 28089.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:317
//		EXTEND
// PORT: Fixed ROM slots 28090.
                    if slot <> 28090 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:318
//		DCA	LANDTEMP +2
// PORT: Fixed ROM slots 28091.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:319
//		DXCH	LAND     +2
// PORT: Fixed ROM slots 28092.
                    if slot <> 28092 or instruction <> 22431 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 927, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:320
//		EXTEND
// PORT: Fixed ROM slots 28093.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:321
//		DCA	LANDTEMP +4
// PORT: Fixed ROM slots 28094.
                    if slot <> 28094 or instruction <> 13161 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 873, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:322
//		DXCH	LAND	 +4
// PORT: Fixed ROM slots 28095.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:323
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:324
//# Page 804
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:325
//		TC	TDISPSET
// PORT: Fixed ROM slots 28096.
                    if slot <> 28096 or instruction <> 1988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28097 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:326
//		TC	FASTCHNG	# SINCE REDESIG MAY CHANGE LANDTEMP
// PORT: Fixed ROM slots 28097.
                        if slot <> 28097 or instruction <> 2016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2016, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:327
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:328
//BRSPOT2		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28098.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:329
//		TCF	PREGUIDE
// PORT: Fixed ROM slots 28099.
    28099, 10794
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28100–28101.
function agcAotUnit1781 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28100 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:330
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:331
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:332
//# LANDING SITE PERTURBATION EQUATIONS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:333
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:334
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:335
//REDESIG		CA	FLAGWRD6	# IS REDFLAG SET?
// PORT: Fixed ROM slots 28100.
        if slot <> 28100 or instruction <> 12354 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 66).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:336
//		MASK	REDFLBIT
// PORT: Fixed ROM slots 28101.
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

// PORT: Physical bank 31. Shared continuation entries, slots 28102–28120.
function agcAotUnit1782 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28110 {
        if slot <= 28105 {
            if slot <= 28103 {
                if slot <= 28102 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:337
//		EXTEND
// PORT: Fixed ROM slots 28102.
                    if slot <> 28102 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:338
//		BZF	RGVGCALC	# NO:  SKIP REDESIGNATION LOGIC
// PORT: Fixed ROM slots 28103.
                    if slot <> 28103 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28104 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:339
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:340
//		CA	TREDES		# YES:  HAS TREDES REACHED ZERO?
// PORT: Fixed ROM slots 28104.
                    if slot <> 28104 or instruction <> 13238 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 950).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:341
//		EXTEND
// PORT: Fixed ROM slots 28105.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:342
//		BZF	RGVGCALC	# YES:  SKIP REDESIGNATION LOGIC
// PORT: Fixed ROM slots 28106.
                    if slot <> 28106 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:343
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:344
//		INHINT
// PORT: Fixed ROM slots 28107.
                    if slot <> 28107 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28108 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:345
//		CA	ELINCR1
// PORT: Fixed ROM slots 28108.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:346
//		TS	ELINCR
// PORT: Fixed ROM slots 28109.
                        if slot <> 28109 or instruction <> 23404 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23404, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:347
//		CA	AZINCR1
// PORT: Fixed ROM slots 28110.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:348
//		TS	AZINCR
// PORT: Fixed ROM slots 28111.
                    if slot <> 28111 or instruction <> 23406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23406, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:349
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28112.
                    if slot <> 28112 or instruction <> 2016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2016, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28113 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:350
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:351
//		CA	ZERO
// PORT: Fixed ROM slots 28113.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:352
//		TS	ELINCR1
// PORT: Fixed ROM slots 28114.
                        if slot <> 28114 or instruction <> 23223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23223, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:353
//		TS	AZINCR1
// PORT: Fixed ROM slots 28115.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:354
//		TS	ELINCR	+1
// PORT: Fixed ROM slots 28116.
                    if slot <> 28116 or instruction <> 23405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23405, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:355
//		TS	AZINCR  +1
// PORT: Fixed ROM slots 28117.
                    if slot <> 28117 or instruction <> 23407 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23407, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28118 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:356
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:357
//		CA	FIXLOC		# SET PD TO 0
// PORT: Fixed ROM slots 28118.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:358
//		TS	PUSHLOC
// PORT: Fixed ROM slots 28119.
                        if slot <> 28119 or instruction <> 22646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22646, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:359
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:360
//		TC	INTPRET
// PORT: Fixed ROM slots 28120.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:361
//		VLOAD	VSU
// PORT: Fixed ROM slots 28121.
    28121, 43514,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:362
//			LAND
// PORT: Fixed ROM slots 28122.
    28122, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:363
//			R		#                 ____   _
// PORT: Fixed ROM slots 28123.
    28123, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:364
//		RTB	PUSH		# PUSH DOWN UNIT (LAND - R)
// PORT: Fixed ROM slots 28124.
    28124, 34360,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:365
//			NORMUNIT
// PORT: Fixed ROM slots 28125.
    28125, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:366
//		VXV	VSL1
// PORT: Fixed ROM slots 28126.
    28126, 64058,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:367
//			YNBPIP		#                    ___        ____   _
// PORT: Fixed ROM slots 28127.
    28127, 2264,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:368
//		VXSC	PDDL		# PUSH DOWN - ELINCR(YNB * UNIT(LAND - R))
// PORT: Fixed ROM slots 28128.
    28128, 54754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:369
//			ELINCR
// PORT: Fixed ROM slots 28129.
    28129, 3802,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:370
//			AZINCR
// PORT: Fixed ROM slots 28130.
    28130, 3806,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:371
//		VXSC	VSU
// PORT: Fixed ROM slots 28131.
    28131, 43490,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:372
//			YNBPIP
// PORT: Fixed ROM slots 28132.
    28132, 2264,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:373
//		VAD	PUSH		# RESULTING VECTOR IS 1/2 REAL SIZE
// PORT: Fixed ROM slots 28133.
    28133, 34394,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:374
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:375
//# Page 805
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:376
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:377
//		DLOAD	DSU		# MAKE SURE REDESIGNATION IS NOT
// PORT: Fixed ROM slots 28134.
    28134, 38346,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:378
//			0		# 	TOO CLOSE TO THE HORIZON.
// PORT: Fixed ROM slots 28135.
    28135, 2,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:379
//			DEPRCRIT
// PORT: Fixed ROM slots 28136.
    28136, 5984,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:380
//		BMN	DLOAD
// PORT: Fixed ROM slots 28137.
    28137, 58688,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:381
//			REDES1
// PORT: Fixed ROM slots 28138.
    28138, 52186,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:382
//			DEPRCRIT
// PORT: Fixed ROM slots 28139.
    28139, 5984,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:383
//		STORE	0
// PORT: Fixed ROM slots 28140.
    28140, 2,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:384
//REDES1		DLOAD	DSU
// PORT: Fixed ROM slots 28141.
    28141, 38346,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:385
//			LAND
// PORT: Fixed ROM slots 28142.
    28142, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:386
//			R
// PORT: Fixed ROM slots 28143.
    28143, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:387
//		DDV	VXSC
// PORT: Fixed ROM slots 28144.
    28144, 61810,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:388
//			0
// PORT: Fixed ROM slots 28145.
    28145, 2,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:389
//		VAD	UNIT
// PORT: Fixed ROM slots 28146.
    28146, 44634,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:390
//			R
// PORT: Fixed ROM slots 28147.
    28147, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:391
//		VXSC	VSL1
// PORT: Fixed ROM slots 28148.
    28148, 64226,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:392
//			/LAND/
// PORT: Fixed ROM slots 28149.
    28149, 2486,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:393
//		STORE	LANDTEMP
// PORT: Fixed ROM slots 28150.
    28150, 3786,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:394
//		EXIT			# LOOKANGL WILL BE COMPUTED AT RGVGCALC
// PORT: Fixed ROM slots 28151.
    28151, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28152–28163.
function agcAotUnit1783 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28157 {
        if slot <= 28154 {
            if slot <= 28152 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:395
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:396
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28152.
                if slot <> 28152 or instruction <> 2016 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2016, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28153 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:397
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:398
//		EXTEND
// PORT: Fixed ROM slots 28153.
                    if slot <> 28153 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:399
//		DCA	LANDTEMP
// PORT: Fixed ROM slots 28154.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:400
//		DXCH	LAND
// PORT: Fixed ROM slots 28155.
                if slot <> 28155 or instruction <> 22429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28156 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:401
//		EXTEND
// PORT: Fixed ROM slots 28156.
                    if slot <> 28156 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:402
//		DCA	LANDTEMP +2
// PORT: Fixed ROM slots 28157.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:403
//		DXCH	LAND +2
// PORT: Fixed ROM slots 28158.
                if slot <> 28158 or instruction <> 22431 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 927, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28159 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:404
//		EXTEND
// PORT: Fixed ROM slots 28159.
                    if slot <> 28159 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:405
//		DCA	LANDTEMP +4
// PORT: Fixed ROM slots 28160.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:406
//		DXCH	LAND +4
// PORT: Fixed ROM slots 28161.
                if slot <> 28161 or instruction <> 22433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 929, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28162 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:407
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:408
//		TCF	RGVGCALC
// PORT: Fixed ROM slots 28162.
                    if slot <> 28162 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:409
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:410
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:411
//# COMPUTE STATE IN GUIDANCE COORDINATES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:412
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:413
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:414
//#	RGVGCALC COMPUTATIONS ARE AS FOLLOWS:--
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:415
//#	VELOCITY RELATIVE TO THE SURFACE:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:416
//#		_______   _   _   __
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:417
//#		ANGTERM = V + R * WM
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:418
//#	STATE IN GUIDANCE COORDINATES:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:419
//#		___   *   _   ____
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:420
//#		RGU = CG (R - LAND)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:421
//#		___   *   _   __   _
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:422
//#		VGU = CG (V - WM * R)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:423
//# Page 806 actually starts one line earlier but that would separate the markers from their variables
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:424
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:425
//#	HORIZONTAL VELOCITY FOR DISPLAY
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:426
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:427
//#		VHORIZ = 8 ABVAL (0, VG , VG )
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:428
//#		                       2    1
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:429
//# 	DEPRESSION ANGLE FOR DISPLAY:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:430
//#		                       _   ____  ______
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:431
//#		LOOKANGL = ARCSIN(UNIT(R - LAND).XMBPIP)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:432
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:433
//CALCRGVG	TC	INTPRET		# IN IGNALG, COMPUTE V FROM INTEGRATION
// PORT: Fixed ROM slots 28163.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:434
//		VLOAD	MXV		#	OUTPUT AND TRIM CORRECTION TERM
// PORT: Fixed ROM slots 28164.
    28164, 53754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:435
//			VATT1		#	COMPUTED LAST PASS AND LEFT IN UNFC/2
// PORT: Fixed ROM slots 28165.
    28165, 42,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:436
//			REFSMMAT
// PORT: Fixed ROM slots 28166.
    28166, 1976,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:437
//		VSR1	VAD
// PORT: Fixed ROM slots 28167.
    28167, 44516,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:438
//			UNFC/2
// PORT: Fixed ROM slots 28168.
    28168, 3416,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:439
//		STORE	V
// PORT: Fixed ROM slots 28169.
    28169, 3758,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:440
//		EXIT
// PORT: Fixed ROM slots 28170.
    28170, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28171–28171.
function agcAotUnit1784 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:441
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:442
//RGVGCALC	TC	INTPRET		# ENTER HERE TO RECOMPUTE RG AND VG
// PORT: Fixed ROM slots 28171.
    if slot <> 28171 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1784] to agcAotUnit1784@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:443
//		VLOAD	VXV
// PORT: Fixed ROM slots 28172.
    28172, 40442,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:444
//			R
// PORT: Fixed ROM slots 28173.
    28173, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:445
//			WM
// PORT: Fixed ROM slots 28174.
    28174, 2474,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:446
//		VAD	VSR2		# RESCALE TO UNITS OF 2(9) M/CS
// PORT: Fixed ROM slots 28175.
    28175, 57946,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:447
//			V
// PORT: Fixed ROM slots 28176.
    28176, 3758,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:448
//		STORE	ANGTERM
// PORT: Fixed ROM slots 28177.
    28177, 2410,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:449
//		MXV
// PORT: Fixed ROM slots 28178.
    28178, 65442,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:450
//			CG		# NO SHIFT SINCE ANGTERM IS DOUBLE SIZED
// PORT: Fixed ROM slots 28179.
    28179, 2822,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:451
//		STORE	VGU
// PORT: Fixed ROM slots 28180.
    28180, 3886,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:452
//		PDDL	VDEF		# FORM (0,VG ,VG ) IN UNITS OF 2(10) M/CS
// PORT: Fixed ROM slots 28181.
    28181, 46762,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:453
//			ZEROVECS	#           2   1
// PORT: Fixed ROM slots 28182.
    28182, 6820,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:454
//		ABVAL	SL3
// PORT: Fixed ROM slots 28183.
    28183, 43596,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:455
//		STOVL	VHORIZ		# VHORIZ FOR DISPLAY DURING P65.
// PORT: Fixed ROM slots 28184.
    28184, 22886,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:456
//			R		#           _   ____
// PORT: Fixed ROM slots 28185.
    28185, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:457
//		VSU	PUSH		# PUSH DOWN R - LAND
// PORT: Fixed ROM slots 28186.
    28186, 34386,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:458
//			LAND
// PORT: Fixed ROM slots 28187.
    28187, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:459
//		MXV	VSL1
// PORT: Fixed ROM slots 28188.
    28188, 64162,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:460
//			CG
// PORT: Fixed ROM slots 28189.
    28189, 2822,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:461
//		STORE	RGU
// PORT: Fixed ROM slots 28190.
    28190, 2878,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:462
//		ABVAL
// PORT: Fixed ROM slots 28191.
    28191, 65356,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:463
//		STOVL	RANGEDSP
// PORT: Fixed ROM slots 28192.
    28192, 23338,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:464
//		RTB	DOT		# NOW IN MPAC IS SINE(LOOKANGL)/4
// PORT: Fixed ROM slots 28193.
    28193, 41272,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:465
//			NORMUNIT
// PORT: Fixed ROM slots 28194.
    28194, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:466
//			XNBPIP
// PORT: Fixed ROM slots 28195.
    28195, 2252,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:467
//		EXIT
// PORT: Fixed ROM slots 28196.
    28196, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28197–28201.
function agcAotUnit1785 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28198 {
        if slot <= 28197 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:468
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:469
//		CA	FIXLOC		# RESET PUSH DOWN POINTER
// PORT: Fixed ROM slots 28197.
            if slot <> 28197 or instruction <> 12368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 80).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:470
//		TS	PUSHLOC
// PORT: Fixed ROM slots 28198.
            if slot <> 28198 or instruction <> 22646 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22646, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28199 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:471
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:472
//# Page 807
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:473
//		CA	MPAC		# COMPUTE LOOKANGLE ITSELF
// PORT: Fixed ROM slots 28199.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:474
//		DOUBLE
// PORT: Fixed ROM slots 28200.
                if slot <> 28200 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:475
//		TC	BANKCALL
// PORT: Fixed ROM slots 28201.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:476
//		CADR	SPARCSIN -1
// PORT: Fixed ROM slots 28202.
    28202, 51060
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28203–28207.
function agcAotUnit1786 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28204 {
        if slot <= 28203 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:477
//		AD	1/2DEG
// PORT: Fixed ROM slots 28203.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:478
//		EXTEND
// PORT: Fixed ROM slots 28204.
            if slot <> 28204 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28205 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:479
//		MP	180DEGS
// PORT: Fixed ROM slots 28205.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:480
//		TS	LOOKANGL	# LOOKANGL FOR DISPLAY DURING P64
// PORT: Fixed ROM slots 28206.
                if slot <> 28206 or instruction <> 23479 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23479, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:481
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:482
//BRSPOT3		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28207.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:483
//		TCF	WHATGUID
// PORT: Fixed ROM slots 28208.
    28208, 10802
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28209–28209.
function agcAotUnit1787 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:484
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:485
//# **************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:486
//# TTF/8 COMPUTATION
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:487
//# **************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:488
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:489
//TTF/8CL		TC	INTPRETX
// PORT: Fixed ROM slots 28209.
    if slot <> 28209 or instruction <> 1983 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1983, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1787] to agcAotUnit1787@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:490
//		DLOAD*
// PORT: Fixed ROM slots 28210.
    28210, 65478,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:491
//			JDG2TTF,1
// PORT: Fixed ROM slots 28211.
    28211, 2610,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:492
//		STODL*	TABLTTF +6	# A(3) = 8 JDG  TO TABLTTF
// PORT: Fixed ROM slots 28212.
    28212, 20210,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:493
//			ADG2TTF,1	#             2
// PORT: Fixed ROM slots 28213.
    28213, 2606,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:494
//		STODL	TABLTTF +4	# A(2) = 6 ADG  TO TABLTTF
// PORT: Fixed ROM slots 28214.
    28214, 16110,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:495
//			VGU 	+4	#             2
// PORT: Fixed ROM slots 28215.
    28215, 3894,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:496
//		DMP	DAD*
// PORT: Fixed ROM slots 28216.
    28216, 35594,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:497
//			3/4DP
// PORT: Fixed ROM slots 28217.
    28217, 5980,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:498
//			VDG2TTF,1
// PORT: Fixed ROM slots 28218.
    28218, 2602,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:499
//		STODL*	TABLTTF +2	# A(1) = (6 VGU  + 18 VDG )/8 TO TABLTTF
// PORT: Fixed ROM slots 28219.
    28219, 20202,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:500
//			RDG +4,1	#              2         2
// PORT: Fixed ROM slots 28220.
    28220, 2574,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:501
//		DSU	DMP
// PORT: Fixed ROM slots 28221.
    28221, 34090,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:502
//			RGU +4
// PORT: Fixed ROM slots 28222.
    28222, 2886,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:503
//			3/8DP
// PORT: Fixed ROM slots 28223.
    28223, 5976,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:504
//		STORE	TABLTTF		# A(0) = -24 (RGU  - RDG )/64 TO TABLTTF
// PORT: Fixed ROM slots 28224.
    28224, 3814,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:505
//		EXIT			#                2      2
// PORT: Fixed ROM slots 28225.
    28225, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28226–28235.
function agcAotUnit1788 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28230 {
        if slot <= 28227 {
            if slot <= 28226 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:506
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:507
//		CA	BIT8
// PORT: Fixed ROM slots 28226.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:508
//		TS	TABLTTF +10	# FRACTIONAL PRECISION FOR TTF TO TABLE
// PORT: Fixed ROM slots 28227.
                if slot <> 28227 or instruction <> 23418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28228 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:509
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:510
//		EXTEND
// PORT: Fixed ROM slots 28228.
                if slot <> 28228 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28229 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:511
//		DCA	TTF/8
// PORT: Fixed ROM slots 28229.
                    if slot <> 28229 or instruction <> 13219 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 931, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:512
//		DXCH	MPAC		# LOADS TTF/8 (INITIAL GUESS) INTO MPAC
// PORT: Fixed ROM slots 28230.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:513
//		CAF	TWO		# DEGREE - ONE
// PORT: Fixed ROM slots 28231.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:514
//		TS	L
// PORT: Fixed ROM slots 28232.
                if slot <> 28232 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28233 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:515
//		CAF	TABLTTFL
// PORT: Fixed ROM slots 28233.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:516
//		TC	ROOTPSRS	# YIELDS TTF/8 IN MPAC
// PORT: Fixed ROM slots 28234.
                    if slot <> 28234 or instruction <> 1899 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1899, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:517
//		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28235.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:518
//		TCF	WHATALM
// PORT: Fixed ROM slots 28236.
    28236, 10830
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28237–28259.
function agcAotUnit1789 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28247 {
        if slot <= 28241 {
            if slot <= 28238 {
                if slot <= 28237 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:519
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:520
//		EXTEND			# GOOD RETURN
// PORT: Fixed ROM slots 28237.
                    if slot <> 28237 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:521
//		DCA	MPAC		# FETCH TTF/8 KEEPING IT IN MPAC
// PORT: Fixed ROM slots 28238.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:522
//		DXCH	TTF/8		# CORRECTED TTF/8
// PORT: Fixed ROM slots 28239.
                    if slot <> 28239 or instruction <> 22435 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 931, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28240 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:523
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:524
//# Page 808
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:525
//		TC	TDISPSET
// PORT: Fixed ROM slots 28240.
                        if slot <> 28240 or instruction <> 1988 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1988, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:526
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:527
//# 		(CONTINUE TO QUADGUID)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:528
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:529
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:530
//# MAIN GUIDANCE EQUATION
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:531
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:532
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:533
//#	AS PUBLISHED --
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:534
//#		              ___   __       ___   __
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:535
//#		___   ___   6(VDG + VG)   12(RDG - RG)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:536
//#		ACG = ADG + ----------- + ------------
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:537
//#		                TTF        (TTF)(TTF)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:538
//#	AS HERE PROGRAMMED --
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:539
//#		             ___   __
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:540
//#		      3 (1/4(RDG - RG)   ___   __)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:541
//#		      - (------------- + VDG + VG)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:542
//#		___   4 (    TTF/8               )   ___
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:543
//#		ACG = ---------------------------- + ADG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:544
//#		                  TTF/8
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:545
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:546
//QUADGUID	CS	TTF/8
// PORT: Fixed ROM slots 28241.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:547
//		AD	LEADTIME	# LEADTIME IS A NEGATIVE NUMBER
// PORT: Fixed ROM slots 28242.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:548
//		AD	POSMAX		# SAFEGUARD THE COMPUTATIONS THAT FOLLOW
// PORT: Fixed ROM slots 28243.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:549
//		TS	L		#	BY FORCING -TTF*LEADTIME > OR = ZERO
// PORT: Fixed ROM slots 28244.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:550
//		CS	L
// PORT: Fixed ROM slots 28245.
                    if slot <> 28245 or instruction <> 16385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 1).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28246 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:551
//		AD	L
// PORT: Fixed ROM slots 28246.
                        if slot <> 28246 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:552
//		ZL
// PORT: Fixed ROM slots 28247.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:553
//		EXTEND
// PORT: Fixed ROM slots 28248.
                    if slot <> 28248 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28249 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:554
//		DV	TTF/8
// PORT: Fixed ROM slots 28249.
                        if slot <> 28249 or instruction <> 5026 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 930, readEffective:call(words, 930)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:555
//		TS	BUF		# - RATIO OF LAG-DIMINISHED TTF TO TTF
// PORT: Fixed ROM slots 28250.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:556
//		EXTEND
// PORT: Fixed ROM slots 28251.
                    if slot <> 28251 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28252 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:557
//		SQUARE
// PORT: Fixed ROM slots 28252.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:558
//		TS	BUF +1
// PORT: Fixed ROM slots 28253.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:559
//		AD	BUF
// PORT: Fixed ROM slots 28254.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:560
//		XCH	BUF +1		# RATIO SQUARED - RATIO
// PORT: Fixed ROM slots 28255.
                        if slot <> 28255 or instruction <> 23641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 89, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:561
//		AD	BUF +1
// PORT: Fixed ROM slots 28256.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:562
//		TS	MPAC		# COEFFICIENT FOR VGU TERM
// PORT: Fixed ROM slots 28257.
                    if slot <> 28257 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28258 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:563
//		AD	BUF +1
// PORT: Fixed ROM slots 28258.
                        if slot <> 28258 or instruction <> 24665 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 89).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:564
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 28259.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:565
//		TS	26D		# COEFFICIENT FOR RDG-RGU TERM
// PORT: Fixed ROM slots 28260.
    28260, 45108
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28261–28262.
function agcAotUnit1790 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28261 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:566
//		AD	BUF +1
// PORT: Fixed ROM slots 28261.
        if slot <> 28261 or instruction <> 24665 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 89).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:567
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 28262.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:568
//		TS	28D		# COEFFICIENT FOR VDG TERM
// PORT: Fixed ROM slots 28263.
    28263, 45112
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28264–28268.
function agcAotUnit1791 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28265 {
        if slot <= 28264 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:569
//		AD	BUF
// PORT: Fixed ROM slots 28264.
            if slot <> 28264 or instruction <> 24664 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 88).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:570
//		AD	POSMAX
// PORT: Fixed ROM slots 28265.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:571
//# Page 809
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:572
//		AD	BUF +1
// PORT: Fixed ROM slots 28266.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:573
//		AD	BUF +1
// PORT: Fixed ROM slots 28267.
                if slot <> 28267 or instruction <> 24665 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 89).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:574
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 28268.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:575
//		TS	30D		# COEFFICIENT FOR ADG TERM
// PORT: Fixed ROM slots 28269.
    28269, 45116
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28270–28272.
function agcAotUnit1792 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28270 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:576
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:577
//		CAF	ZERO
// PORT: Fixed ROM slots 28270.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:578
//		TS	MODE
// PORT: Fixed ROM slots 28271.
            if slot <> 28271 or instruction <> 22643 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22643, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:579
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:580
//		TC	INTPRETX
// PORT: Fixed ROM slots 28272.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:581
//		VXSC	PDDL
// PORT: Fixed ROM slots 28273.
    28273, 54754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:582
//			VGU
// PORT: Fixed ROM slots 28274.
    28274, 3886,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:583
//			28D
// PORT: Fixed ROM slots 28275.
    28275, 58,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:584
//		VXSC*	PDVL*
// PORT: Fixed ROM slots 28276.
    28276, 52190,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:585
//			VDG,1
// PORT: Fixed ROM slots 28277.
    28277, 2578,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:586
//			RDG,1
// PORT: Fixed ROM slots 28278.
    28278, 2566,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:587
//		VSU	V/SC
// PORT: Fixed ROM slots 28279.
    28279, 57682,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:588
//			RGU
// PORT: Fixed ROM slots 28280.
    28280, 2878,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:589
//			TTF/8
// PORT: Fixed ROM slots 28281.
    28281, 3910,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:590
//		VSR2	VXSC
// PORT: Fixed ROM slots 28282.
    28282, 61892,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:591
//			26D
// PORT: Fixed ROM slots 28283.
    28283, 54,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:592
//		VAD	VAD
// PORT: Fixed ROM slots 28284.
    28284, 44378,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:593
//		V/SC	VXSC
// PORT: Fixed ROM slots 28285.
    28285, 61890,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:594
//			TTF/8
// PORT: Fixed ROM slots 28286.
    28286, 3910,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:595
//			3/4DP
// PORT: Fixed ROM slots 28287.
    28287, 5980,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:596
//		PDDL	VXSC*
// PORT: Fixed ROM slots 28288.
    28288, 61354,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:597
//			30D
// PORT: Fixed ROM slots 28289.
    28289, 62,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:598
//			ADG,1
// PORT: Fixed ROM slots 28290.
    28290, 2590,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:599
//		VAD
// PORT: Fixed ROM slots 28291.
    28291, 65370,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:600
//AFCCALC1	VXM	VSL1		# VERGUID COMES HERE
// PORT: Fixed ROM slots 28292.
    28292, 64138,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:601
//			CG
// PORT: Fixed ROM slots 28293.
    28293, 2822,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:602
//		PDVL	V/SC
// PORT: Fixed ROM slots 28294.
    28294, 57754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:603
//			GDT/2
// PORT: Fixed ROM slots 28295.
    28295, 1342,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:604
//			GSCALE
// PORT: Fixed ROM slots 28296.
    28296, 5972,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:605
//		BVSU	STADR
// PORT: Fixed ROM slots 28297.
    28297, 38474,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:606
//		STORE	UNFC/2		# UNFC/2 NEED NOT BE UNITIZED
// PORT: Fixed ROM slots 28298.
    28298, 62118,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:607
//		ABVAL
// PORT: Fixed ROM slots 28299.
    28299, 65356,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:608
//AFCCALC2	STODL	/AFC/		# MAGNITUDE OF AFC FOR THROTTLE
// PORT: Fixed ROM slots 28300.
    28300, 15976,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:609
//			UNFC/2		# VERTICAL COMPONENT
// PORT: Fixed ROM slots 28301.
    28301, 3416,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:610
//		DSQ	PDDL
// PORT: Fixed ROM slots 28302.
    28302, 54684,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:611
//			UNFC/2 +2	# OUT-OF-PLANE
// PORT: Fixed ROM slots 28303.
    28303, 3420,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:612
//		DSQ	PDDL
// PORT: Fixed ROM slots 28304.
    28304, 54684,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:613
//			HIGHESTF
// PORT: Fixed ROM slots 28305.
    28305, 5968,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:614
//		DDV	DSQ
// PORT: Fixed ROM slots 28306.
    28306, 52850,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:615
//			MASS		#                        2    2    2
// PORT: Fixed ROM slots 28307.
    28307, 1354,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:616
//		DSU	DSU		# AMAXHORIZ = SQRT(ATOTAL - A  - A  )
// PORT: Fixed ROM slots 28308.
    28308, 38186,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:617
//		BPL	DLOAD		#                            1    0
// PORT: Fixed ROM slots 28309.
    28309, 58696,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:618
//			AFCCALC3
// PORT: Fixed ROM slots 28310.
    28310, 52528,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:619
//			ZEROVECS
// PORT: Fixed ROM slots 28311.
    28311, 6820,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:620
//AFCCALC3	SQRT	DAD
// PORT: Fixed ROM slots 28312.
    28312, 36332,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:621
//			UNFC/2 +4
// PORT: Fixed ROM slots 28313.
    28313, 3424,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:622
//# Page 810
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:623
//		BPL	BDSU
// PORT: Fixed ROM slots 28314.
    28314, 37192,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:624
//			AFCCLEND
// PORT: Fixed ROM slots 28315.
    28315, 52540,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:625
//			UNFC/2 +4
// PORT: Fixed ROM slots 28316.
    28316, 3424,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:626
//		STORE	UNFC/2 +4
// PORT: Fixed ROM slots 28317.
    28317, 3424,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:627
//AFCCLEND	EXIT
// PORT: Fixed ROM slots 28318.
    28318, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28319–28323.
function agcAotUnit1793 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28320 {
        if slot <= 28319 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:628
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28319.
            if slot <> 28319 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:629
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:630
//		CA	WCHPHASE	# PREPARE FOR PHASE SWITCHING LOGIC
// PORT: Fixed ROM slots 28320.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:631
//		TS	WCHPHOLD
// PORT: Fixed ROM slots 28321.
            if slot <> 28321 or instruction <> 23441 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23441, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28322 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:632
//		INCR	FLPASS0		# INCREMENT PASS COUNTER
// PORT: Fixed ROM slots 28322.
                if slot <> 28322 or instruction <> 11155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 915).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:633
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:634
//BRSPOT4		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28323.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:635
//		TCF	AFTRGUID
// PORT: Fixed ROM slots 28324.
    28324, 10810
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28325–28328.
function agcAotUnit1794 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28326 {
        if slot <= 28325 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:636
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:637
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:638
//# ERECT GUIDANCE-STABLE MEMBER TRANSFORMATION MATRIX
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:639
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:640
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:641
//CGCALC		CAF	EBANK5
// PORT: Fixed ROM slots 28325.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:642
//		TS	EBANK
// PORT: Fixed ROM slots 28326.
            if slot <> 28326 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28327 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:643
//		EBANK=	TCGIBRAK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:644
//		EXTEND
// PORT: Fixed ROM slots 28327.
            if slot <> 28327 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:645
//		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28328.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:646
//		INDEX	TARGTDEX
// PORT: Fixed ROM slots 28329.
    28329, 43604,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:647
//		DCA	TCGFBRAK
// PORT: Fixed ROM slots 28330.
    28330, 26170
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28331–28341.
function agcAotUnit1795 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28335 {
        if slot <= 28332 {
            if slot <= 28331 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:648
//		INCR	BBANK
// PORT: Fixed ROM slots 28331.
                if slot <> 28331 or instruction <> 10246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:649
//		INCR	BBANK
// PORT: Fixed ROM slots 28332.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:650
//		EBANK=	TTF/8
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:651
//		AD	TTF/8
// PORT: Fixed ROM slots 28333.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:652
//		XCH	L
// PORT: Fixed ROM slots 28334.
                    if slot <> 28334 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:653
//		AD	TTF/8
// PORT: Fixed ROM slots 28335.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:654
//		CCS	A
// PORT: Fixed ROM slots 28336.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:655
//		CCS	L
// PORT: Fixed ROM slots 28337.
                    if slot <> 28337 or instruction <> 4097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:656
//		TCF	EXTLOGIC
// PORT: Fixed ROM slots 28338.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:657
//		TCF	EXTLOGIC
// PORT: Fixed ROM slots 28339.
                if slot <> 28339 or instruction <> 5835 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5835, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28340 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:658
//		NOOP
// PORT: Fixed ROM slots 28340.
                    if slot <> 28340 or instruction <> 5813 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5813, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:659
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:660
//		TC	INTPRETX
// PORT: Fixed ROM slots 28341.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:661
//		VLOAD	UNIT
// PORT: Fixed ROM slots 28342.
    28342, 44794,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:662
//			LAND
// PORT: Fixed ROM slots 28343.
    28343, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:663
//		STODL	CG
// PORT: Fixed ROM slots 28344.
    28344, 15110,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:664
//			TTF/8
// PORT: Fixed ROM slots 28345.
    28345, 3910,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:665
//		DMP*	VXSC
// PORT: Fixed ROM slots 28346.
    28346, 61702,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:666
//			GAINBRAK,1	# NUMERO MYSTERIOSO
// PORT: Fixed ROM slots 28347.
    28347, 2614,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:667
//			ANGTERM
// PORT: Fixed ROM slots 28348.
    28348, 2410,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:668
//		VAD
// PORT: Fixed ROM slots 28349.
    28349, 65370,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:669
//			LAND
// PORT: Fixed ROM slots 28350.
    28350, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:670
//		VSU	RTB
// PORT: Fixed ROM slots 28351.
    28351, 40018,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:671
//			R
// PORT: Fixed ROM slots 28352.
    28352, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:672
//			NORMUNIT
// PORT: Fixed ROM slots 28353.
    28353, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:673
//# Page 811
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:674
//		VXV	RTB
// PORT: Fixed ROM slots 28354.
    28354, 39994,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:675
//			LAND
// PORT: Fixed ROM slots 28355.
    28355, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:676
//			NORMUNIT
// PORT: Fixed ROM slots 28356.
    28356, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:677
//		STOVL	CG +6		# SECOND ROW
// PORT: Fixed ROM slots 28357.
    28357, 23314,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:678
//			CG
// PORT: Fixed ROM slots 28358.
    28358, 2822,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:679
//		VXV	VSL1
// PORT: Fixed ROM slots 28359.
    28359, 64058,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:680
//			CG +6
// PORT: Fixed ROM slots 28360.
    28360, 2834,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:681
//		STORE	CG +14
// PORT: Fixed ROM slots 28361.
    28361, 2846,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:682
//		EXIT
// PORT: Fixed ROM slots 28362.
    28362, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28363–28363.
function agcAotUnit1796 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:683
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:684
//#		(CONTINUE TO EXTLOGIC)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:685
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:686
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:687
//# PREPARE TO EXIT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:688
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:689
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:690
//# DECIDE (1) HOW TO EXIT, AND (2) WHETHER TO SWITCH PHASES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:691
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:692
//EXTLOGIC	INDEX	WCHPHASE	# WCHPHASE = 1   APPRQUAD
// PORT: Fixed ROM slots 28363.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:693
//		CA	TENDBRAK	# WCHPHASE = 0   BRAKQUAD
// PORT: Fixed ROM slots 28364.
    28364, 26150
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28365–28367.
function agcAotUnit1797 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28365 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:694
//		AD	TTF/8
// PORT: Fixed ROM slots 28365.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:695
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:696
//EXSPOT1		EXTEND
// PORT: Fixed ROM slots 28366.
            if slot <> 28366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:697
//		INDEX	WCHPHASE
// PORT: Fixed ROM slots 28367.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:698
//		BZMF	WHATEXIT
// PORT: Fixed ROM slots 28368.
    28368, 51778
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28369–28375.
function agcAotUnit1798 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28371 {
        if slot <= 28369 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:699
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:700
//		TC	FASTCHNG
// PORT: Fixed ROM slots 28369.
            if slot <> 28369 or instruction <> 2016 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2016, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28370 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:701
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:702
//		CA	WCHPHOLD
// PORT: Fixed ROM slots 28370.
                if slot <> 28370 or instruction <> 13201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 913).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:703
//		AD	ONE
// PORT: Fixed ROM slots 28371.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:704
//		TS	WCHPHASE
// PORT: Fixed ROM slots 28372.
                if slot <> 28372 or instruction <> 23273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:705
//		CA	ZERO
// PORT: Fixed ROM slots 28373.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:706
//		TS	FLPASS0		# RESET FLPASS0
// PORT: Fixed ROM slots 28374.
                if slot <> 28374 or instruction <> 23443 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23443, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:707
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:708
//		INDEX	WCHPHOLD
// PORT: Fixed ROM slots 28375.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:709
//		TCF	WHATEXIT
// PORT: Fixed ROM slots 28376.
    28376, 10818
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28377–28377.
function agcAotUnit1799 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:710
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:711
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:712
//# ROUTINES FOR EXITING FROM LANDING GUIDANCE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:713
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:714
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:715
//# 1.	EXGSUB IS THE RETURN WHEN GUIDSUB IS CALLED BY THE IGNITION ALGORITHM.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:716
//# 2.	EXBRAK IN THE EXIT USED DURING THE BRAKING PHASE.  IN THIS CASE UNIT(R) IS THE WINDOW POINTING VECTOR.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:717
//# 3.	EXNORM IS THE EXIT USED AT OTHER TIMES DURING THE BURN.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:718
//# (EXOVFLOW IS A SUBROUTINE OF EXBRAK AND EXNORM CALLED WHEN OVERFLOW OCCURRED ANYWHERE IN GUIDANCE.)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:719
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:720
//EXGSUB		TC	INTPRET		# COMPUTE TRIM VELOCITY CORRECTION TERM.
// PORT: Fixed ROM slots 28377.
    if slot <> 28377 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1799] to agcAotUnit1799@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:721
//# Page 812
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:722
//		VLOAD	RTB
// PORT: Fixed ROM slots 28378.
    28378, 40186,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:723
//			UNFC/2
// PORT: Fixed ROM slots 28379.
    28379, 3416,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:724
//			NORMUNIT
// PORT: Fixed ROM slots 28380.
    28380, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:725
//		VXSC	VXSC
// PORT: Fixed ROM slots 28381.
    28381, 61922,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:726
//			ZOOMTIME
// PORT: Fixed ROM slots 28382.
    28382, 3622,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:727
//			TRIMACCL
// PORT: Fixed ROM slots 28383.
    28383, 18434,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:728
//		STORE	UNFC/2
// PORT: Fixed ROM slots 28384.
    28384, 3416,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:729
//		EXIT
// PORT: Fixed ROM slots 28385.
    28385, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28386–28390.
function agcAotUnit1800 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28387 {
        if slot <= 28386 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:730
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:731
//		CCS	NGUIDSUB
// PORT: Fixed ROM slots 28386.
            if slot <> 28386 or instruction <> 5031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 935).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:732
//		TCF	GUIDSUB
// PORT: Fixed ROM slots 28387.
            if slot <> 28387 or instruction <> 5424 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5424, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28388 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:733
//		CCS	NIGNLOOP
// PORT: Fixed ROM slots 28388.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:734
//		TCF	+3
// PORT: Fixed ROM slots 28389.
                if slot <> 28389 or instruction <> 5864 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5864, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:735
//		TC	ALARM
// PORT: Fixed ROM slots 28390.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:736
//		OCT	01412
// PORT: Fixed ROM slots 28391.
    28391, 1556
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28392–28392.
function agcAotUnit1801 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:737
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:738
// +3		TC	POSTJUMP
// PORT: Fixed ROM slots 28392.
    if slot <> 28392 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1801] to agcAotUnit1801@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:739
// 		CADR	DDUMCALC
// PORT: Fixed ROM slots 28393.
    28393, 54404
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28394–28394.
function agcAotUnit1802 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:740
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:741
//EXBRAK		TC	INTPRET
// PORT: Fixed ROM slots 28394.
    if slot <> 28394 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1802] to agcAotUnit1802@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:742
//		VLOAD
// PORT: Fixed ROM slots 28395.
    28395, 65530,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:743
//			UNIT/R/
// PORT: Fixed ROM slots 28396.
    28396, 3774,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:744
//		STORE	UNWC/2
// PORT: Fixed ROM slots 28397.
    28397, 3428,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:745
//		EXIT
// PORT: Fixed ROM slots 28398.
    28398, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28399–28400.
function agcAotUnit1803 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28399 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:746
//		TCF	STEER?
// PORT: Fixed ROM slots 28399.
        if slot <> 28399 or instruction <> 5914 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5914, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:747
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:748
//EXNORM		TC	INTPRET
// PORT: Fixed ROM slots 28400.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:749
//		VLOAD	VSU
// PORT: Fixed ROM slots 28401.
    28401, 43514,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:750
//			LAND
// PORT: Fixed ROM slots 28402.
    28402, 3898,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:751
//			R
// PORT: Fixed ROM slots 28403.
    28403, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:752
//		RTB
// PORT: Fixed ROM slots 28404.
    28404, 65336,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:753
//			NORMUNIT
// PORT: Fixed ROM slots 28405.
    28405, 18348,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:754
//		STORE	UNWC/2		# UNIT(LAND - R) IS TENTATIVE CHOICE
// PORT: Fixed ROM slots 28406.
    28406, 3428,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:755
//		VXV	DOT
// PORT: Fixed ROM slots 28407.
    28407, 41274,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:756
//			XNBPIP
// PORT: Fixed ROM slots 28408.
    28408, 2252,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:757
//			CG +6
// PORT: Fixed ROM slots 28409.
    28409, 2834,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:758
//		EXIT			# WITH PROJ IN MPAC 1/8 REAL SIZE
// PORT: Fixed ROM slots 28410.
    28410, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28411–28411.
function agcAotUnit1804 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:759
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:760
//		CS	MPAC		# GET COEFFICIENT FOR CG +14
// PORT: Fixed ROM slots 28411.
    if slot <> 28411 or instruction <> 16492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        agcCoreCS(words, 108).
        return list(false, false, true, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1804] to agcAotUnit1804@.

// PORT: Physical bank 31. Shared continuation entries, slots 28412–28430.
function agcAotUnit1805 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28420 {
        if slot <= 28415 {
            if slot <= 28413 {
                if slot <= 28412 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:761
//		AD	PROJMAX
// PORT: Fixed ROM slots 28412.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:762
//		AD	POSMAX
// PORT: Fixed ROM slots 28413.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:763
//		TS	BUF
// PORT: Fixed ROM slots 28414.
                    if slot <> 28414 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:764
//		CS	BUF
// PORT: Fixed ROM slots 28415.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:765
//		ADS	BUF		# RESULT IS 0 IF PROJMAX - PROJ NEGATIVE
// PORT: Fixed ROM slots 28416.
                    if slot <> 28416 or instruction <> 11352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:766
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:767
//		CS	PROJMIN		# GET COEFFICIENT FOR UNIT(LAND - R)
// PORT: Fixed ROM slots 28417.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:768
//		AD	MPAC
// PORT: Fixed ROM slots 28418.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:769
//		AD	POSMAX
// PORT: Fixed ROM slots 28419.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:770
//		TS	BUF +1
// PORT: Fixed ROM slots 28420.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:771
//		CS	BUF +1
// PORT: Fixed ROM slots 28421.
                    if slot <> 28421 or instruction <> 16473 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 89).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:772
//# Page 813
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:773
//		ADS	BUF +1		# RESULT IS 0 IF PROJ - PROJMIN NEGATIVE
// PORT: Fixed ROM slots 28422.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:774
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:775
//		CAF	FOUR
// PORT: Fixed ROM slots 28423.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:776
//UNWCLOOP	MASK	SIX
// PORT: Fixed ROM slots 28424.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:777
//		TS	Q
// PORT: Fixed ROM slots 28425.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:778
//		CA	EBANK5
// PORT: Fixed ROM slots 28426.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:779
//		TS	EBANK
// PORT: Fixed ROM slots 28427.
                    if slot <> 28427 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28428 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:780
//		EBANK=	CG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:781
//		CA	BUF
// PORT: Fixed ROM slots 28428.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:782
//		EXTEND
// PORT: Fixed ROM slots 28429.
                        if slot <> 28429 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:783
//		INDEX	Q
// PORT: Fixed ROM slots 28430.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:784
//		MP	CG +14
// PORT: Fixed ROM slots 28431.
    28431, 59164
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28432–28433.
function agcAotUnit1806 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28432 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:785
//		INCR	BBANK
// PORT: Fixed ROM slots 28432.
        if slot <> 28432 or instruction <> 10246 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 6).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:786
//		EBANK=	UNWC/2
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:787
//		INDEX	Q
// PORT: Fixed ROM slots 28433.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:788
//		DXCH	UNWC/2
// PORT: Fixed ROM slots 28434.
    28434, 44900
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28435–28437.
function agcAotUnit1807 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28435 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:789
//		EXTEND
// PORT: Fixed ROM slots 28435.
        if slot <> 28435 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28436 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:790
//		MP	BUF +1
// PORT: Fixed ROM slots 28436.
            if slot <> 28436 or instruction <> 28761 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 89, readEffective:call(words, 89)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:791
//		INDEX	Q
// PORT: Fixed ROM slots 28437.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:792
//		DAS	UNWC/2
// PORT: Fixed ROM slots 28438.
    28438, 18276
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28439–28449.
function agcAotUnit1808 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28443 {
        if slot <= 28440 {
            if slot <= 28439 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:793
//		CCS	Q
// PORT: Fixed ROM slots 28439.
                if slot <> 28439 or instruction <> 4098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:794
//		TCF	UNWCLOOP
// PORT: Fixed ROM slots 28440.
                if slot <> 28440 or instruction <> 5896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5896, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28441 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:795
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:796
//		INCR	BBANK
// PORT: Fixed ROM slots 28441.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:797
//		EBANK=	PIF
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:798
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:799
//STEER?		CA	FLAGWRD2	# IF STEERSW DOWN NO OUTPUTS
// PORT: Fixed ROM slots 28442.
                    if slot <> 28442 or instruction <> 12350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:800
//		MASK	STEERBIT
// PORT: Fixed ROM slots 28443.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:801
//		EXTEND
// PORT: Fixed ROM slots 28444.
                if slot <> 28444 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28445 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:802
//		BZF	RATESTOP
// PORT: Fixed ROM slots 28445.
                    if slot <> 28445 or instruction <> 5923 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5923, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:803
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:804
//EXVERT		CA	OVFIND		# IF OVERFLOW ANYWHERE IN GUIDANCE
// PORT: Fixed ROM slots 28446.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:805
//		EXTEND			#	DON'T CALL THROTTLE OR FINDCDUW
// PORT: Fixed ROM slots 28447.
                if slot <> 28447 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28448 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:806
//		BZF	+13
// PORT: Fixed ROM slots 28448.
                    if slot <> 28448 or instruction <> 5931 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:807
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:808
//EXOVFLOW	TC	ALARM		# SOUND THE ALARM NON-ABORTIVELY
// PORT: Fixed ROM slots 28449.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:809
//		OCT	01410
// PORT: Fixed ROM slots 28450.
    28450, 1552
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28451–28456.
function agcAotUnit1809 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28453 {
        if slot <= 28451 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:810
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:811
//RATESTOP	CAF	BIT13		# ARE WE IN ATTITUDE-HOLD?
// PORT: Fixed ROM slots 28451.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:812
//		EXTEND
// PORT: Fixed ROM slots 28452.
                if slot <> 28452 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:813
//		RAND	CHAN31
// PORT: Fixed ROM slots 28453.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:814
//		EXTEND
// PORT: Fixed ROM slots 28454.
            if slot <> 28454 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28455 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:815
//		BZF	DISPEXIT	# YES
// PORT: Fixed ROM slots 28455.
                if slot <> 28455 or instruction <> 5936 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:816
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:817
//		TC	BANKCALL	# NO:  DO A STOPRATE
// PORT: Fixed ROM slots 28456.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:818
//		CADR	STOPRATE
// PORT: Fixed ROM slots 28457.
    28457, 33002
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28458–28460.
function agcAotUnit1810 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28458 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:819
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:820
//		TCF	DISPEXIT
// PORT: Fixed ROM slots 28458.
        if slot <> 28458 or instruction <> 5936 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5936, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28459 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:821
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:822
//GDUMP1		TC	THROTTLE
// PORT: Fixed ROM slots 28459.
            if slot <> 28459 or instruction <> 1166 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1166, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:823
//# Page 814
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:824
//		TC	INTPRET
// PORT: Fixed ROM slots 28460.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:825
//		CALL
// PORT: Fixed ROM slots 28461.
    28461, 65320,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:826
//			FINDCDUW -2
// PORT: Fixed ROM slots 28462.
    28462, 50322,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:827
//		EXIT
// PORT: Fixed ROM slots 28463.
    28463, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28464–28471.
function agcAotUnit1811 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28467 {
        if slot <= 28465 {
            if slot <= 28464 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:828
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:829
//# 		(CONTINUE TO DISPEXIT)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:830
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:831
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:832
//# GUIDANCE LOOP DISPLAYS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:833
//# ***********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:834
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:835
//DISPEXIT	EXTEND			# KILL GROUP 3:  DISPLAYS WILL BE
// PORT: Fixed ROM slots 28464.
                if slot <> 28464 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:836
//		DCA	NEG0		#	RESTORED BY NEXT GUIDANCE CYCLE.
// PORT: Fixed ROM slots 28465.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:837
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 28466.
                if slot <> 28466 or instruction <> 21999 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:838
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:839
// +3		CS	FLAGWRD8	# IF FLUNDISP IS SET, NO DISPLAY THIS PASS
// PORT: Fixed ROM slots 28467.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:840
// 		MASK	FLUNDBIT
// PORT: Fixed ROM slots 28468.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:841
//		EXTEND
// PORT: Fixed ROM slots 28469.
                if slot <> 28469 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28470 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:842
//		BZF	ENDLLJOB	# TO PICK UP THE TAG
// PORT: Fixed ROM slots 28470.
                if slot <> 28470 or instruction <> 5950 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5950, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:843
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:844
//		INDEX	WCHPHOLD
// PORT: Fixed ROM slots 28471.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:845
//		TCF	WHATDISP
// PORT: Fixed ROM slots 28472.
    28472, 10822
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28473–28473.
function agcAotUnit1812 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:846
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:847
//-2		TC	PHASCHNG	# KILL GROUP 5
// PORT: Fixed ROM slots 28473.
    if slot <> 28473 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1812] to agcAotUnit1812@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:848
//		OCT	00035
// PORT: Fixed ROM slots 28474.
    28474, 58
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28475–28476.
function agcAotUnit1813 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28475 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:849
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:850
//P63DISPS	CAF	V06N63
// PORT: Fixed ROM slots 28475.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:851
//DISPCOMN	TC	BANKCALL
// PORT: Fixed ROM slots 28476.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:852
//		CADR	REGODSPR
// PORT: Fixed ROM slots 28477.
    28477, 17008
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28478–28487.
function agcAotUnit1814 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28482 {
        if slot <= 28479 {
            if slot <= 28478 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:853
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:854
//ENDLLJOB	TCF	ENDOFJOB
// PORT: Fixed ROM slots 28478.
                if slot <> 28478 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:855
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:856
//P64DISPS	CA	TREDES		# HAS TREDES REACHED ZERO?
// PORT: Fixed ROM slots 28479.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:857
//		EXTEND
// PORT: Fixed ROM slots 28480.
                if slot <> 28480 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28481 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:858
//		BZF	RED-OVER	# YES: CLEAR REDESIGNATION FLAG
// PORT: Fixed ROM slots 28481.
                    if slot <> 28481 or instruction <> 5971 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5971, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:859
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:860
//		CS	FLAGWRD6	# NO:  IS REDFLAG SET?
// PORT: Fixed ROM slots 28482.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:861
//		MASK	REDFLBIT
// PORT: Fixed ROM slots 28483.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:862
//		EXTEND
// PORT: Fixed ROM slots 28484.
                if slot <> 28484 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28485 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:863
//		BZF	REDES-OK	# YES:  DO STATIC DISPLAY
// PORT: Fixed ROM slots 28485.
                if slot <> 28485 or instruction <> 5973 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5973, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28486 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:864
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:865
//		CAF	V06N64		# OTHERWISE USE FLASHING DISPLAY
// PORT: Fixed ROM slots 28486.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:866
//		TC	BANKCALL
// PORT: Fixed ROM slots 28487.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:867
//		CADR	REFLASHR
// PORT: Fixed ROM slots 28488.
    28488, 16996
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28489–28496.
function agcAotUnit1815 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28492 {
        if slot <= 28490 {
            if slot <= 28489 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:868
//		TCF	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 28489.
                if slot <> 28489 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:869
//		TCF	P64CEED		# PROCEED	PERMIT REDESIGNATIONS
// PORT: Fixed ROM slots 28490.
                if slot <> 28490 or instruction <> 5965 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5965, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28491 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:870
//		TCF	P64DISPS	# RECYCLE
// PORT: Fixed ROM slots 28491.
                if slot <> 28491 or instruction <> 5951 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:871
//# Page 815
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:872
//		TCF	ENDLLJOB
// PORT: Fixed ROM slots 28492.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:873
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:874
//P64CEED		CAF	ZERO
// PORT: Fixed ROM slots 28493.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:875
//		TS	ELINCR1
// PORT: Fixed ROM slots 28494.
                if slot <> 28494 or instruction <> 23223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23223, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28495 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:876
//		TS	AZINCR1
// PORT: Fixed ROM slots 28495.
                if slot <> 28495 or instruction <> 23222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:877
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:878
//		TC	UPFLAG		# ENABLE REDESIGNATION LOGIC
// PORT: Fixed ROM slots 28496.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:879
//		ADRES	REDFLAG
// PORT: Fixed ROM slots 28497.
    28497, 198
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28498–28499.
function agcAotUnit1816 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28498 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:880
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:881
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 28498.
        if slot <> 28498 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:882
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:883
//RED-OVER	TC	DOWNFLAG
// PORT: Fixed ROM slots 28499.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:884
//		ADRES	REDFLAG
// PORT: Fixed ROM slots 28500.
    28500, 198
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28501–28508.
function agcAotUnit1817 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28504 {
        if slot <= 28502 {
            if slot <= 28501 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:885
//REDES-OK	CAF	V06N64
// PORT: Fixed ROM slots 28501.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:886
//		TCF	DISPCOMN
// PORT: Fixed ROM slots 28502.
                if slot <> 28502 or instruction <> 5948 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5948, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28503 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:887
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:888
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:889
//VERTDISP	CAF	V06N60
// PORT: Fixed ROM slots 28503.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:890
//		TCF	DISPCOMN
// PORT: Fixed ROM slots 28504.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:891
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:892
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:893
//# **************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:894
//# GUIDANCE FOR P65
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:895
//# **************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:896
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:897
//VERTGUID	CCS	WCHVERT
// PORT: Fixed ROM slots 28505.
                if slot <> 28505 or instruction <> 5031 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 935).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:898
//		TCF	P67VERT		# POSITIVE NON-ZERO ---> P67
// PORT: Fixed ROM slots 28506.
                if slot <> 28506 or instruction <> 5989 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5989, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28507 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:899
//		TCF	P66VERT		# +0
// PORT: Fixed ROM slots 28507.
                if slot <> 28507 or instruction <> 5987 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5987, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:900
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:901
//# 	THE P65 GUIDANCE EQUATION IS AS FOLLOWS --
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:902
//#		      ____   ___
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:903
//#		      V2FG - VGU
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:904
//#		ACG = ----------
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:905
//#		        TAUVERT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:906
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:907
//P65VERT		TC	INTPRET
// PORT: Fixed ROM slots 28508.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:908
//		VLOAD	VSU
// PORT: Fixed ROM slots 28509.
    28509, 43514,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:909
//			V2FG
// PORT: Fixed ROM slots 28510.
    28510, 2706,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:910
//			VGU
// PORT: Fixed ROM slots 28511.
    28511, 3886,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:911
//		V/SC	GOTO
// PORT: Fixed ROM slots 28512.
    28512, 43202,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:912
//			TAUVERT
// PORT: Fixed ROM slots 28513.
    28513, 2718,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:913
//			AFCCALC1
// PORT: Fixed ROM slots 28514.
    28514, 52488
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28515–28515.
function agcAotUnit1818 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:914
//# Page 816
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:915
//# **********************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:916
//# GUIDANCE FOR P66
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:917
//# **********************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:918
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:919
//P66VERT		TC	POSTJUMP
// PORT: Fixed ROM slots 28515.
    if slot <> 28515 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1818] to agcAotUnit1818@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:920
//		CADR	P66VERTA
// PORT: Fixed ROM slots 28516.
    28516, 54640
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28517–28517.
function agcAotUnit1819 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:921
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:922
//P67VERT		TC	PHASCHNG	# TERMINATE GROUP 3.
// PORT: Fixed ROM slots 28517.
    if slot <> 28517 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1819] to agcAotUnit1819@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:923
//		OCT	00003
// PORT: Fixed ROM slots 28518.
    28518, 6
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28519–28519.
function agcAotUnit1820 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:924
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:925
//		TC	INTPRET
// PORT: Fixed ROM slots 28519.
    if slot <> 28519 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1820] to agcAotUnit1820@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:926
//		VLOAD	GOTO
// PORT: Fixed ROM slots 28520.
    28520, 43258,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:927
//			V
// PORT: Fixed ROM slots 28521.
    28521, 3758,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:928
//			VHORCOMP
// PORT: Fixed ROM slots 28522.
    28522, 54942
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29363–29364.
function agcAotUnit1883 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29363 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:929
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:930
//		SETLOC	P66LOC
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:931
//		BANK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:932
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:933
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:934
//RODTASK		CAF	PRIO22
// PORT: Fixed ROM slots 29363.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:935
//		TC	FINDVAC
// PORT: Fixed ROM slots 29364.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:936
//		EBANK=	DVCNTR
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:937
//		2CADR	RODCOMP
// PORT: Fixed ROM slots 29365 29366.
    29365, 3450, 29366, 53358
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29367–29368.
function agcAotUnit1884 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29367 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:938
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:939
//		TCF	TASKOVER
// PORT: Fixed ROM slots 29367.
        if slot <> 29367 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:940
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:941
//P66VERTA	TC	PHASCHNG	# TERMINATE GROUP 3.
// PORT: Fixed ROM slots 29368.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:942
//		OCT	00003
// PORT: Fixed ROM slots 29369.
    29369, 6
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29370–29371.
function agcAotUnit1885 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29370 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:943
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:944
//		CAF	1SEC
// PORT: Fixed ROM slots 29370.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:945
//		TC	TWIDDLE
// PORT: Fixed ROM slots 29371.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:946
//		ADRES	RODTASK
// PORT: Fixed ROM slots 29372.
    29372, 3430
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29373–29419.
function agcAotUnit1886 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29395 {
        if slot <= 29383 {
            if slot <= 29377 {
                if slot <= 29374 {
                    if slot <= 29373 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:947
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:948
//RODCOMP		INHINT
// PORT: Fixed ROM slots 29373.
                        if slot <> 29373 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:949
//		CAF	ZERO
// PORT: Fixed ROM slots 29374.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:950
//		XCH	RODCOUNT
// PORT: Fixed ROM slots 29375.
                        if slot <> 29375 or instruction <> 24550 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 998, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29376 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:951
//		EXTEND
// PORT: Fixed ROM slots 29376.
                            if slot <> 29376 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:952
//		MP	RODSCAL1
// PORT: Fixed ROM slots 29377.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:953
//		DAS	VDGVERT		# UPDATE DESIRED ALTITUDE RATE.
// PORT: Fixed ROM slots 29378.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:954
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:955
//		EXTEND			# SET OLDPIPAX,Y,Z = PIPAX,Y,Z
// PORT: Fixed ROM slots 29379.
                            if slot <> 29379 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:956
//		DCA	PIPAX
// PORT: Fixed ROM slots 29380.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:957
//		DXCH	OLDPIPAX
// PORT: Fixed ROM slots 29381.
                        if slot <> 29381 or instruction <> 22516 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29382 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:958
//		DXCH	RUPTREG1	# SET RUPTREG1,2,3 = OLDPIPAX,Y,Z
// PORT: Fixed ROM slots 29382.
                            if slot <> 29382 or instruction <> 21561 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:959
//		CA	PIPAZ
// PORT: Fixed ROM slots 29383.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:960
//		XCH	OLDPIPAZ
// PORT: Fixed ROM slots 29384.
                        if slot <> 29384 or instruction <> 24565 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1013, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29385 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:961
//		XCH	RUPTREG3
// PORT: Fixed ROM slots 29385.
                            if slot <> 29385 or instruction <> 23610 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 58, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:962
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:963
//		EXTEND			# SNAPSHOT TIME OF PIPA READING.
// PORT: Fixed ROM slots 29386.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:964
//		DCA	TIME2
// PORT: Fixed ROM slots 29387.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:965
//# Page 817
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:966
//		DXCH	THISTPIP
// PORT: Fixed ROM slots 29388.
                            if slot <> 29388 or instruction <> 22514 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1010, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:967
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:968
//		CA	OLDPIPAX
// PORT: Fixed ROM slots 29389.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:969
//		AD	PIPATMPX
// PORT: Fixed ROM slots 29390.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:970
//		TS	MPAC		# MPAC(X) = PIPAX + PIPATMPX
// PORT: Fixed ROM slots 29391.
                            if slot <> 29391 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:971
//		CA	OLDPIPAY
// PORT: Fixed ROM slots 29392.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:972
//		AD	PIPATMPY
// PORT: Fixed ROM slots 29393.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:973
//		TS	MPAC +3		# MPAC(Y) = PIPAY + PIPATMPY
// PORT: Fixed ROM slots 29394.
                            if slot <> 29394 or instruction <> 22639 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22639, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:974
//		CA	OLDPIPAZ
// PORT: Fixed ROM slots 29395.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:975
//		AD	PIPATMPZ
// PORT: Fixed ROM slots 29396.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:976
//		TS	MPAC +5		# MPAC(Z) = PIPAZ + PIPATMPZ
// PORT: Fixed ROM slots 29397.
                            if slot <> 29397 or instruction <> 22641 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:977
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:978
//		CS	OLDPIPAX
// PORT: Fixed ROM slots 29398.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:979
//		AD	TEMX
// PORT: Fixed ROM slots 29399.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:980
//		AD	RUPTREG1
// PORT: Fixed ROM slots 29400.
                            if slot <> 29400 or instruction <> 24632 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 56).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:981
//		TS	DELVROD
// PORT: Fixed ROM slots 29401.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:982
//		CS	OLDPIPAY
// PORT: Fixed ROM slots 29402.
                        if slot <> 29402 or instruction <> 17396 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1012).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29403 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:983
//		AD	TEMY
// PORT: Fixed ROM slots 29403.
                            if slot <> 29403 or instruction <> 25261 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 685).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:984
//		AD	RUPTREG2
// PORT: Fixed ROM slots 29404.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:985
//		TS	DELVROD +2
// PORT: Fixed ROM slots 29405.
                        if slot <> 29405 or instruction <> 23544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29406 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:986
//		CS	OLDPIPAZ
// PORT: Fixed ROM slots 29406.
                            if slot <> 29406 or instruction <> 17397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 1013).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:987
//		AD	TEMZ
// PORT: Fixed ROM slots 29407.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:988
//		AD	RUPTREG3
// PORT: Fixed ROM slots 29408.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:989
//		TS	DELVROD +4
// PORT: Fixed ROM slots 29409.
                            if slot <> 29409 or instruction <> 23546 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23546, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:990
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:991
//		CAF	ZERO
// PORT: Fixed ROM slots 29410.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:992
//		TS	MPAC +1		# ZERO LO-ORDER MPAC COMPONENTS
// PORT: Fixed ROM slots 29411.
                        if slot <> 29411 or instruction <> 22637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29412 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:993
//		TS	MPAC +4
// PORT: Fixed ROM slots 29412.
                            if slot <> 29412 or instruction <> 22640 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22640, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:994
//		TS	MPAC +6
// PORT: Fixed ROM slots 29413.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:995
//		TS	TEMX		# ZERO TEMX, TEMY, AND TEMZ SO WE WILL
// PORT: Fixed ROM slots 29414.
                        if slot <> 29414 or instruction <> 23212 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23212, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29415 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:996
//		TS	TEMY		#	KNOW WHEN READACCS CHANGES THEM.
// PORT: Fixed ROM slots 29415.
                            if slot <> 29415 or instruction <> 23213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:997
//		TS	TEMZ
// PORT: Fixed ROM slots 29416.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:998
//		CS	ONE
// PORT: Fixed ROM slots 29417.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:999
//		TS	MODE
// PORT: Fixed ROM slots 29418.
                            if slot <> 29418 or instruction <> 22643 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22643, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1000
//		TC	INTPRET
// PORT: Fixed ROM slots 29419.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1001
//ITRPNT1		VXSC	PDDL		# SCALE MPAC TO M/CS *2(-7) AND PUSH 	(6)
// PORT: Fixed ROM slots 29420.
    29420, 54754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1002
//			KPIP1
// PORT: Fixed ROM slots 29421.
    29421, 22564,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1003
//			THISTPIP
// PORT: Fixed ROM slots 29422.
    29422, 4068,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1004
//		DSU
// PORT: Fixed ROM slots 29423.
    29423, 65322,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1005
//			PIPTIME
// PORT: Fixed ROM slots 29424.
    29424, 1338,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1006
//		STORE	30D		# 30-31D CONTAINS TIME IN CS SINCE PIPTIME
// PORT: Fixed ROM slots 29425.
    29425, 62,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1007
//		DDV	PDVL		#					(8)
// PORT: Fixed ROM slots 29426.
    29426, 52594,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1008
//			4SEC(28)
// PORT: Fixed ROM slots 29427.
    29427, 23766,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1009
//			GDT/2
// PORT: Fixed ROM slots 29428.
    29428, 1342,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1010
//		VSU	VXSC		#					(6)
// PORT: Fixed ROM slots 29429.
    29429, 61778,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1011
//			VBIAS
// PORT: Fixed ROM slots 29430.
    29430, 2866,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1012
//		VSL2	VAD
// PORT: Fixed ROM slots 29431.
    29431, 44500,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1013
//			V
// PORT: Fixed ROM slots 29432.
    29432, 3758,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1014
//		VAD	STADR		#					(0)
// PORT: Fixed ROM slots 29433.
    29433, 38490,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1015
//		STOVL	24D		# STORE UPDATED VELOCITY IN 24-29D
// PORT: Fixed ROM slots 29434.
    29434, 45004,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1016
//# Page 818
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1017
//			R
// PORT: Fixed ROM slots 29435.
    29435, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1018
//		UNIT
// PORT: Fixed ROM slots 29436.
    29436, 65372,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1019
//		STORE	14D
// PORT: Fixed ROM slots 29437.
    29437, 30,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1020
//		DOT	SL1
// PORT: Fixed ROM slots 29438.
    29438, 59970,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1021
//			24D
// PORT: Fixed ROM slots 29439.
    29439, 50,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1022
//		STODL	HDOTDISP	# UPDATE HDOTDISP RATE FOR NOUN 63.
// PORT: Fixed ROM slots 29440.
    29440, 15992,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1023
//			30D
// PORT: Fixed ROM slots 29441.
    29441, 62,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1024
//		SL	DMP
// PORT: Fixed ROM slots 29442.
    29442, 34146,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1025
//			11D
// PORT: Fixed ROM slots 29443.
    29443, 16664,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1026
//			HDOTDISP
// PORT: Fixed ROM slots 29444.
    29444, 3704,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1027
//		DAD	DSU
// PORT: Fixed ROM slots 29445.
    29445, 38170,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1028
//			36D
// PORT: Fixed ROM slots 29446.
    29446, 74,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1029
//			/LAND/
// PORT: Fixed ROM slots 29447.
    29447, 2486,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1030
//		STODL	HCALC1		# UPDATE HCALC1 FOR NOUN 63.
// PORT: Fixed ROM slots 29448.
    29448, 16378,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1031
//			HDOTDISP
// PORT: Fixed ROM slots 29449.
    29449, 3704,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1032
//		BDSU	DDV
// PORT: Fixed ROM slots 29450.
    29450, 47394,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1033
//			VDGVERT
// PORT: Fixed ROM slots 29451.
    29451, 3914,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1034
//			TAUROD
// PORT: Fixed ROM slots 29452.
    29452, 2754,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1035
//		PDVL	ABVAL		#				(2)
// PORT: Fixed ROM slots 29453.
    29453, 42650,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1036
//			GDT/2
// PORT: Fixed ROM slots 29454.
    29454, 1342,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1037
//		DDV	SR2
// PORT: Fixed ROM slots 29455.
    29455, 49778,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1038
//			GSCALE
// PORT: Fixed ROM slots 29456.
    29456, 5972,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1039
//		STORE	20D
// PORT: Fixed ROM slots 29457.
    29457, 42,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1040
//		DAD			#				(0)
// PORT: Fixed ROM slots 29458.
    29458, 65306,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1041
//		PDVL	CALL		#				(2)
// PORT: Fixed ROM slots 29459.
    29459, 38042,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1042
//			UNITX
// PORT: Fixed ROM slots 29460.
    29460, 6816,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1043
//			CDU*NBSM
// PORT: Fixed ROM slots 29461.
    29461, 40802,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1044
//		DOT
// PORT: Fixed ROM slots 29462.
    29462, 65346,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1045
//			14D
// PORT: Fixed ROM slots 29463.
    29463, 30,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1046
//		STORE	22D
// PORT: Fixed ROM slots 29464.
    29464, 46,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1047
//		BDDV	STADR		#				(0)
// PORT: Fixed ROM slots 29465.
    29465, 38506,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1048
//		STOVL	/AFC/
// PORT: Fixed ROM slots 29466.
    29466, 41366,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1049
//			DELVROD
// PORT: Fixed ROM slots 29467.
    29467, 4078,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1050
//		VXSC	VAD
// PORT: Fixed ROM slots 29468.
    29468, 44514,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1051
//			KPIP1
// PORT: Fixed ROM slots 29469.
    29469, 22564,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1052
//			VBIAS
// PORT: Fixed ROM slots 29470.
    29470, 2866,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1053
//		ABVAL	PDDL		#				(2)
// PORT: Fixed ROM slots 29471.
    29471, 54604,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1054
//			THISTPIP
// PORT: Fixed ROM slots 29472.
    29472, 4068,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1055
//		DSU	PDDL		#				(4)
// PORT: Fixed ROM slots 29473.
    29473, 54570,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1056
//			LASTTPIP
// PORT: Fixed ROM slots 29474.
    29474, 4064,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1057
//			THISTPIP
// PORT: Fixed ROM slots 29475.
    29475, 4068,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1058
//		STODL	LASTTPIP	#				(2)
// PORT: Fixed ROM slots 29476.
    29476, 16352,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1059
//		DDV	BDDV		#				(0)
// PORT: Fixed ROM slots 29477.
    29477, 46450,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1060
//			SHFTFACT
// PORT: Fixed ROM slots 29478.
    29478, 22202,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1061
//		PDDL	DMP		#				(2)
// PORT: Fixed ROM slots 29479.
    29479, 34218,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1062
//			FWEIGHT
// PORT: Fixed ROM slots 29480.
    29480, 3858,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1063
//			BIT1H
// PORT: Fixed ROM slots 29481.
    29481, 22200,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1064
//		DDV	DDV
// PORT: Fixed ROM slots 29482.
    29482, 47474,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1065
//			MASS
// PORT: Fixed ROM slots 29483.
    29483, 1354,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1066
//			SCALEFAC
// PORT: Fixed ROM slots 29484.
    29484, 18444,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1067
//# Page 819
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1068
//		DAD	PDDL		#				(4)
// PORT: Fixed ROM slots 29485.
    29485, 54554,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1069
//			0D
// PORT: Fixed ROM slots 29486.
    29486, 2,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1070
//			20D
// PORT: Fixed ROM slots 29487.
    29487, 42,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1071
//		DDV	DSU		#				(2)
// PORT: Fixed ROM slots 29488.
    29488, 38258,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1072
//			22D
// PORT: Fixed ROM slots 29489.
    29489, 46,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1073
//		DMP	DAD
// PORT: Fixed ROM slots 29490.
    29490, 36106,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1074
//			LAG/TAU
// PORT: Fixed ROM slots 29491.
    29491, 2758,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1075
//			/AFC/
// PORT: Fixed ROM slots 29492.
    29492, 3688,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1076
//		PDDL	DDV		#				(4)
// PORT: Fixed ROM slots 29493.
    29493, 47530,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1077
//			MAXFORCE
// PORT: Fixed ROM slots 29494.
    29494, 2766,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1078
//			MASS
// PORT: Fixed ROM slots 29495.
    29495, 1354,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1079
//		PDDL	DDV		#				(6)
// PORT: Fixed ROM slots 29496.
    29496, 47530,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1080
//			MINFORCE
// PORT: Fixed ROM slots 29497.
    29497, 2762,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1081
//			MASS
// PORT: Fixed ROM slots 29498.
    29498, 1354,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1082
//		PUSH	BDSU		#				(8)
// PORT: Fixed ROM slots 29499.
    29499, 37132,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1083
//			2D
// PORT: Fixed ROM slots 29500.
    29500, 6,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1084
//		BMN	DLOAD		#				(6)
// PORT: Fixed ROM slots 29501.
    29501, 58688,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1085
//			AFCSPOT
// PORT: Fixed ROM slots 29502.
    29502, 54920,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1086
//		DLOAD	PUSH		#				(6)
// PORT: Fixed ROM slots 29503.
    29503, 34506,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1087
//		BDSU	BPL
// PORT: Fixed ROM slots 29504.
    29504, 42018,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1088
//			2D
// PORT: Fixed ROM slots 29505.
    29505, 6,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1089
//			AFCSPOT
// PORT: Fixed ROM slots 29506.
    29506, 54920,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1090
//		DLOAD			#				(4)
// PORT: Fixed ROM slots 29507.
    29507, 65482,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1091
//AFCSPOT		DLOAD			#				(2), (4), OR (6)
// PORT: Fixed ROM slots 29508.
    29508, 65482,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1092
//		SETPD			#				(2)
// PORT: Fixed ROM slots 29509.
    29509, 65282,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1093
//			2D
// PORT: Fixed ROM slots 29510.
    29510, 6,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1094
//		STODL	/AFC/		#				(0)
// PORT: Fixed ROM slots 29511.
    29511, 15976,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1095
//ITRPNT2		EXIT
// PORT: Fixed ROM slots 29512.
    29512, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29513–29514.
function agcAotUnit1887 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29513 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1096
//		DXCH	MPAC		# MPAC = MEASURED ACCELERATION.
// PORT: Fixed ROM slots 29513.
        if slot <> 29513 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1097
//		TC	BANKCALL
// PORT: Fixed ROM slots 29514.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1098
//		CADR	THROTTLE +3
// PORT: Fixed ROM slots 29515.
    29515, 51490
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29516–29516.
function agcAotUnit1888 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1099
//		TC	INTPRET
// PORT: Fixed ROM slots 29516.
    if slot <> 29516 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1888] to agcAotUnit1888@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1100
//		VLOAD			# PICK UP UPDATED VELOCITY VECTOR.
// PORT: Fixed ROM slots 29517.
    29517, 65530,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1101
//			24D
// PORT: Fixed ROM slots 29518.
    29518, 50,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1102
//VHORCOMP	VSL2	VAD
// PORT: Fixed ROM slots 29519.
    29519, 44500,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1103
//			DELVS
// PORT: Fixed ROM slots 29520.
    29520, 4024,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1104
//		VSR2	PDVL
// PORT: Fixed ROM slots 29521.
    29521, 52676,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1105
//			R
// PORT: Fixed ROM slots 29522.
    29522, 3746,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1106
//		UNIT	VXSC
// PORT: Fixed ROM slots 29523.
    29523, 61788,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1107
//			HDOTDISP
// PORT: Fixed ROM slots 29524.
    29524, 3704,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1108
//		VSL1	BVSU
// PORT: Fixed ROM slots 29525.
    29525, 42484,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1109
//		ABVAL
// PORT: Fixed ROM slots 29526.
    29526, 65356,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1110
//		STORE	VHORIZ
// PORT: Fixed ROM slots 29527.
    29527, 2406,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1111
//		EXIT
// PORT: Fixed ROM slots 29528.
    29528, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29529–29529.
function agcAotUnit1889 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1112
//		TC	BANKCALL	# PUT UP V06N60 DISPLAY BUT AVOID PHASCHNG
// PORT: Fixed ROM slots 29529.
    if slot <> 29529 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1889] to agcAotUnit1889@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1113
//		CADR	DISPEXIT +3
// PORT: Fixed ROM slots 29530.
    29530, 52838,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1114
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1115
//BIT1H		OCT	00001
// PORT: Fixed ROM slots 29531.
    29531, 2,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1116
//SHFTFACT	2DEC	1 B-17
// PORT: Fixed ROM slots 29532 29533.
    29532, 0, 29533, 4096,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1117
//# Page 820
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1118
//BIASFACT	2DEC	655.36 B-28
// PORT: Fixed ROM slots 29534 29535.
    29534, 0, 29535, 1310
)).

// PORT: Physical bank 11. Shared continuation entries, slots 11453–11456.
function agcAotUnit732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11454 {
        if slot <= 11453 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1119
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1120
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1121
//# REDESIGNATOR TRAP
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1122
//# *********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1123
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1124
//		BANK	11
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1125
//		SETLOC	F2DPS*11
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1126
//		BANK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1127
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1128
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1129
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1130
//PITFALL		XCH	BANKRUPT
// PORT: Fixed ROM slots 11453.
            if slot <> 11453 or instruction <> 23566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 14, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1131
//		EXTEND
// PORT: Fixed ROM slots 11454.
            if slot <> 11454 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 11455 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1132
//		QXCH	QRUPT
// PORT: Fixed ROM slots 11455.
            if slot <> 11455 or instruction <> 9226 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 10, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1133
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1134
//		TC	CHECKMM		# IF NOT IN P64, NO REASON TO CONTINUE
// PORT: Fixed ROM slots 11456.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1135
//		DEC	64
// PORT: Fixed ROM slots 11457.
    11457, 128
)).

// PORT: Physical bank 11. Shared continuation entries, slots 11458–11467.
function agcAotUnit733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11462 {
        if slot <= 11459 {
            if slot <= 11458 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1136
//		TCF	RESUME
// PORT: Fixed ROM slots 11458.
                if slot <> 11458 or instruction <> 6840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1137
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1138
//		EXTEND
// PORT: Fixed ROM slots 11459.
                if slot <> 11459 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 11460 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1139
//		READ	CHAN31
// PORT: Fixed ROM slots 11460.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1140
//		COM
// PORT: Fixed ROM slots 11461.
                    if slot <> 11461 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1141
//		MASK	ALL4BITS
// PORT: Fixed ROM slots 11462.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1142
//		TS	ELVIRA
// PORT: Fixed ROM slots 11463.
                if slot <> 11463 or instruction <> 23221 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23221, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1143
//		CAF	TWO
// PORT: Fixed ROM slots 11464.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1144
//		TS	ZERLINA
// PORT: Fixed ROM slots 11465.
                if slot <> 11465 or instruction <> 23220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23220, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11466 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1145
//		CAF	FIVE
// PORT: Fixed ROM slots 11466.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1146
//		TC	TWIDDLE
// PORT: Fixed ROM slots 11467.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1147
//		ADRES	REDESMON
// PORT: Fixed ROM slots 11468.
    11468, 2466
)).

// PORT: Physical bank 11. Shared continuation entries, slots 11469–11514.
function agcAotUnit734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11491 {
        if slot <= 11479 {
            if slot <= 11473 {
                if slot <= 11470 {
                    if slot <= 11469 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1148
//		TCF	RESUME
// PORT: Fixed ROM slots 11469.
                        if slot <> 11469 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1149
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1150
//# REDESIGNATOR MONITOR (INITIATED BY PITFALL)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1151
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1152
//PREMON1		TS	ZERLINA
// PORT: Fixed ROM slots 11470.
                        if slot <> 11470 or instruction <> 23220 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23220, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11471 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1153
//PREMON2		CAF	SEVEN
// PORT: Fixed ROM slots 11471.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1154
//		TC	VARDELAY
// PORT: Fixed ROM slots 11472.
                            if slot <> 11472 or instruction <> 2708 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2708, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1155
//REDESMON	EXTEND
// PORT: Fixed ROM slots 11473.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1156
//		READ	31
// PORT: Fixed ROM slots 11474.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1157
//		COM
// PORT: Fixed ROM slots 11475.
                            if slot <> 11475 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1158
//		MASK	ALL4BITS
// PORT: Fixed ROM slots 11476.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1159
//		XCH	ELVIRA
// PORT: Fixed ROM slots 11477.
                        if slot <> 11477 or instruction <> 24245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 693, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11478 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1160
//		TS	L
// PORT: Fixed ROM slots 11478.
                            if slot <> 11478 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1161
//		CCS	ELVIRA		# DO ANY BITS APPEAR THIS PASS?
// PORT: Fixed ROM slots 11479.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1162
//		TCF	PREMON2		# Y:	CONTINUE MONITOR
// PORT: Fixed ROM slots 11480.
                        if slot <> 11480 or instruction <> 5327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11481 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1163
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1164
//		CCS	L		# N:	ANY LAST PASS?
// PORT: Fixed ROM slots 11481.
                            if slot <> 11481 or instruction <> 4097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1165
//		TCF	COUNT'EM	#	Y: 	COUNT 'EM, RESET RUPT, TERMINATE
// PORT: Fixed ROM slots 11482.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1166
//# Page 821
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1167
//		CCS	ZERLINA		#	N: 	HAS ZERLINA REACHED ZERO YET?
// PORT: Fixed ROM slots 11483.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1168
//		TCF	PREMON1		#		N:	DIMINISH ZERLINA, CONTINUE
// PORT: Fixed ROM slots 11484.
                            if slot <> 11484 or instruction <> 5326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1169
//RESETRPT	CAF	BIT12		#		Y:	RESET RUPT. TERMINATE
// PORT: Fixed ROM slots 11485.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1170
//		EXTEND
// PORT: Fixed ROM slots 11486.
                        if slot <> 11486 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11487 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1171
//		WOR	CHAN13
// PORT: Fixed ROM slots 11487.
                            if slot <> 11487 or instruction <> 2571 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1172
//		TCF	TASKOVER
// PORT: Fixed ROM slots 11488.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1173
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1174
//COUNT'EM	CAF	BIT13		# ARE WE IN ATTITUDE-HOLD?
// PORT: Fixed ROM slots 11489.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1175
//		EXTEND
// PORT: Fixed ROM slots 11490.
                            if slot <> 11490 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1176
//		RAND	CHAN31
// PORT: Fixed ROM slots 11491.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1177
//		EXTEND
// PORT: Fixed ROM slots 11492.
                        if slot <> 11492 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1178
//		BZF	RESETRPT	# YES: SKIP REDESIGNATION LOGIC.
// PORT: Fixed ROM slots 11493.
                        if slot <> 11493 or instruction <> 5341 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5341, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11494 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1179
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1180
//		CA	L		# NO.
// PORT: Fixed ROM slots 11494.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1181
//		MASK 	-AZBIT
// PORT: Fixed ROM slots 11495.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1182
//		CCS	A
// PORT: Fixed ROM slots 11496.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1183
//-AZ		CS	AZEACH
// PORT: Fixed ROM slots 11497.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1184
//		ADS	AZINCR1
// PORT: Fixed ROM slots 11498.
                            if slot <> 11498 or instruction <> 11958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 694).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1185
//		CA	L
// PORT: Fixed ROM slots 11499.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1186
//		MASK	+AZBIT
// PORT: Fixed ROM slots 11500.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1187
//		CCS	A
// PORT: Fixed ROM slots 11501.
                            if slot <> 11501 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1188
//+AZ		CA	AZEACH
// PORT: Fixed ROM slots 11502.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1189
//		ADS	AZINCR1
// PORT: Fixed ROM slots 11503.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1190
//		CA	L
// PORT: Fixed ROM slots 11504.
                            if slot <> 11504 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1191
//		MASK	-ELBIT
// PORT: Fixed ROM slots 11505.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1192
//		CCS	A
// PORT: Fixed ROM slots 11506.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1193
//-EL		CS	ELEACH
// PORT: Fixed ROM slots 11507.
                            if slot <> 11507 or instruction <> 17661 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1277), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1194
//		ADS	ELINCR1
// PORT: Fixed ROM slots 11508.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1195
//		CA	L
// PORT: Fixed ROM slots 11509.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1196
//		MASK	+ELBIT
// PORT: Fixed ROM slots 11510.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1197
//		CCS	A
// PORT: Fixed ROM slots 11511.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1198
//+EL		CA	ELEACH
// PORT: Fixed ROM slots 11512.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1199
//		ADS	ELINCR1
// PORT: Fixed ROM slots 11513.
                            if slot <> 11513 or instruction <> 11959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 695).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1200
//		TCF	RESETRPT
// PORT: Fixed ROM slots 11514.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1201
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1202
//# THESE EQUIVALENCES ARE BASED ON GSOP CHAPTER 4, REVISION 16 OF P64LM
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1203
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1204
//+ELBIT		=	BIT2		# -PITCH
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1205
//-ELBIT		=	BIT1		# +PITCH
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1206
//+AZBIT		=	BIT5
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1207
//-AZBIT		=	BIT6
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1208
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1209
//# Page 822
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1210
//ALL4BITS	OCT	00063
// PORT: Fixed ROM slots 11515.
    11515, 102,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1211
//AZEACH		DEC	.03491		# 2 DEGREES
// PORT: Fixed ROM slots 11516.
    11516, 1144,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1212
//ELEACH		DEC	.00873		# 1/2 DEGREE
// PORT: Fixed ROM slots 11517.
    11517, 286
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18509–18514.
function agcAotUnit1117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18511 {
        if slot <= 18509 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1213
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1214
//# ****************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1215
//# R.O.D. TRAP
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1216
//# ****************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1217
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1218
//		BANK	20
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1219
//		SETLOC	RODTRAP
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1220
//		BANK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1221
//		COUNT*	$$/F2DPS	# ************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1222
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1223
//DESCBITS	MASK	BIT7		# COME HERE FROM MARKRUPT CODING WITH BIT
// PORT: Fixed ROM slots 18509.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1224
//		CCS	A		#	7 OR 6 OF CHANNEL 16 IN A; BIT 7 MEANS
// PORT: Fixed ROM slots 18510.
                if slot <> 18510 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1225
//		CS	TWO		#	- RATE INCREMENT, BIT 6 + INCREMENT.
// PORT: Fixed ROM slots 18511.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1226
//		AD	ONE
// PORT: Fixed ROM slots 18512.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1227
//		ADS	RODCOUNT
// PORT: Fixed ROM slots 18513.
                if slot <> 18513 or instruction <> 12262 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 998).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1228
//		TCF	RESUME		# TRAP IS RESET WHEN SWITCH IS RELEASED
// PORT: Fixed ROM slots 18514.
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

// PORT: Physical bank 31. Shared continuation entries, slots 28523–28537.
function agcAotUnit1821 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28529 {
        if slot <= 28525 {
            if slot <= 28523 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1229
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1230
//		BANK	31
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1231
//		SETLOC	F2DPS*31
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1232
//		BANK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1233
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1234
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1235
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1236
//# ***********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1237
//# DOUBLE PRECISION ROOT FINDER SUBROUTINE (BY ALLAN KLUMPP)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1238
//# ***********************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1239
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1240
//#	                                               N        N-1
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1241
//#	ROOTPSRS FINDS ONE ROOT OF THE POWER SERIES A X  + A   X    + ... + A X + A
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1242
//#	                                             N      N-1              1     0
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1243
//# USING NEWTON'S METHOD STARTING WITH AN INITIAL GUESS FOR THE ROOT.  THE ENTERING DATA MUST BE AS FOLLOWS:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1244
//#	A	SP	LOC-3		ADRES FOR REFERENCING PWR COF TABL
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1245
//#	L	SP	N-1		N IS THE DEGREE OF THE POWER SERIES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1246
//#	MPAC	DP	X		INITIAL GUESS FOR ROOT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1247
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1248
//#	LOC-2N	DP	A(0)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1249
//#		...
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1250
//#	LOC	DP	A(N)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1251
//#	LOC+2	SP	PRECROOT	 PREC RQD OF ROOT (AS FRACT OF 1ST GUESS)
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1252
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1253
//# Page 823
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1254
//# THE DP RESULT IS LEFT IN MPAC UPON EXIT, AND A SP COUNT OF THE ITERATIONS TO CONVERGENCE IS LEFT IN MPAC+2.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1255
//# RETURN IS NORMALLY TO LOC(TC ROOTPSRS)+3.  IF ROOTPSRS FAILS TO CONVERGE TO IN 8 PASSES, RETURN IS TO LOC+1 AND
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1256
//# OUTPUTS ARE NOT TO BE TRUSTED.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1257
//#
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1258
//# PRECAUTION:  ROOTPSRS MAKES NO CHECKS FOR OVERFLOW OR FOR IMPROPER USAGE.  IMPROPER USAGE COULD
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1259
//# PRECLUDE CONVERGENCE OR REQUIRE EXCESSIVE ITERATIONS.  AS A SPECIFIC EXAMPLE, ROOTPSRS FORMS A DERIVATIVE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1260
//# COEFFICIENT TABLE BY MULTIPLYING EACH A(I) BY I, WHERE I RANGES FROM 1 TO N.  IF AN ELEMENT OF THE DERIVATIVE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1261
//# COEFFICIENT TABLE = 1 OR >1 IN MAGNITUDE, ONLY THE EXCESS IS RETAINED.  ROOTPSRS MAY CONVERGE ON THE CORRECT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1262
//# ROOT NONETHELESS, BUT IT MAY TAKE AN EXCESSIVE NUMBER OF ITERATIONS.  THEREFORE THE USER SHOULD RECOGNIZE:
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1263
//#	1.  USER'S RESPONSIBILITY TO ASSUR THAT I X A(I) < 1 IN MAGNITUDE FOR ALL I.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1264
//#	2.  USER'S RESPONSIBILITY TO ASSURE OVERFLOW WILL NOT OCCUR IN EVALUATING EITHER THE RESIDUAL OR THE DERIVATIVE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1265
//#	    POWER SERIES.  THIS OVERFLOW WOULD BE PRODUCED BY SUBROUTINE POWRSERS, CALLED BY ROOTPSRS, AND MIGHT NOT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1266
//#	    PRECLUDE EVENTUAL CONVERGENCE.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1267
//#	3.  AT PRESENT, ERASABLE LOCATIONS ARE RESERVED ONLY FOR N UP TO 5.  AN N IN EXCESS OF 5 WILL PRODUCE CHAOS.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1268
//#	    ALL ERASABLES USED BY ROOTPSRS ARE UNSWITCHED LOCATED IN THE REGION FROM MPAC-33 OCT TO MPAC+7.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1269
//#	4.  THE ITERATION COUNT RETURNED IN MPAC+2 MAY BE USED TO DETECT ABNORMAL PERFORMANCE.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1270
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1271
//					# STORE ENTERING DATA, INITIALIZE ERASABLES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1272
//ROOTPSRS	EXTEND
// PORT: Fixed ROM slots 28523.
                if slot <> 28523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28524 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1273
//		QXCH	RETROOT		# RETURN ADRES
// PORT: Fixed ROM slots 28524.
                    if slot <> 28524 or instruction <> 9306 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 90, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1274
//		TS	PWRPTR		# PWR TABLE POINTER
// PORT: Fixed ROM slots 28525.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1275
//		DXCH	MPAC +3		# PWR TABLE ADRES, N-1
// PORT: Fixed ROM slots 28526.
                    if slot <> 28526 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1276
//		CA	DERTABLL
// PORT: Fixed ROM slots 28527.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1277
//		TS	DERPTR		# DER TABL POINTER
// PORT: Fixed ROM slots 28528.
                    if slot <> 28528 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1278
//		TS	MPAC +5		# DER TABL ADRES
// PORT: Fixed ROM slots 28529.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1279
//		CCS	MPAC +4		# NO POWER SERIES DEGREE 1 OR LESS
// PORT: Fixed ROM slots 28530.
                    if slot <> 28530 or instruction <> 4208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 112).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1280
//		TS	MPAC +6		# N-2
// PORT: Fixed ROM slots 28531.
                    if slot <> 28531 or instruction <> 22642 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22642, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28532 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1281
//		CA	ZERO		# MODE USED AS ITERATION COUNTER.  MODE
// PORT: Fixed ROM slots 28532.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1282
//		TS	MODE		# MUST BE POS SO ABS WON'T COMP MPAC+3 ETC.
// PORT: Fixed ROM slots 28533.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1283
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1284
//					# COMPUTE CRITERION TO STOP ITERATING
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1285
//		EXTEND
// PORT: Fixed ROM slots 28534.
                    if slot <> 28534 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1286
//		DCA	MPAC		# FETCH ROOT GUESS, KEEPING IT IN MPAC
// PORT: Fixed ROM slots 28535.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1287
//		DXCH	ROOTPS		# AND IN ROOTPS
// PORT: Fixed ROM slots 28536.
                    if slot <> 28536 or instruction <> 21591 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1288
//		INDEX	MPAC +3		# PWR TABLE ADRES
// PORT: Fixed ROM slots 28537.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1289
//		CA	5		# PRECROOT TO A
// PORT: Fixed ROM slots 28538.
    28538, 24586
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28539–28540.
function agcAotUnit1822 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28539 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1290
//		TC	SHORTMP		# YIELDS DP PRODUCT IN MPAC
// PORT: Fixed ROM slots 28539.
        if slot <> 28539 or instruction <> 3783 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3783, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1291
//		TC	USPRCADR
// PORT: Fixed ROM slots 28540.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1292
//		CADR	ABS		# YIELDS ABVAL OF CRITERION ON DX IN MPAC
// PORT: Fixed ROM slots 28541.
    28541, 1324
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28542–28545.
function agcAotUnit1823 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28543 {
        if slot <= 28542 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1293
//		DXCH	MPAC
// PORT: Fixed ROM slots 28542.
            if slot <> 28542 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1294
//		DXCH	DXCRIT		# CRITERION
// PORT: Fixed ROM slots 28543.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1295
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1296
//					# SET UP DER COF TABL
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1297
//# Page 824
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1298
//		EXTEND
// PORT: Fixed ROM slots 28544.
            if slot <> 28544 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1299
//		INDEX	PWRPTR
// PORT: Fixed ROM slots 28545.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1300
//		DCA	3
// PORT: Fixed ROM slots 28546.
    28546, 24584
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28547–28553.
function agcAotUnit1824 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28549 {
        if slot <= 28547 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1301
//		DXCH	MPAC		# A(N) TO MPAC
// PORT: Fixed ROM slots 28547.
            if slot <> 28547 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28548 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1302
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1303
//		CA	MPAC +4		# N-1 TO A
// PORT: Fixed ROM slots 28548.
                if slot <> 28548 or instruction <> 12400 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 112).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1304
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1305
//DERCLOOP	TS	PWRCNT		# LOOP COUNTER
// PORT: Fixed ROM slots 28549.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1306
//		AD	ONE
// PORT: Fixed ROM slots 28550.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1307
//		TC	DMPNSUB		# YIELDS DERCOF = I X A(I) IN MPAC
// PORT: Fixed ROM slots 28551.
                if slot <> 28551 or instruction <> 3790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28552 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1308
//		EXTEND
// PORT: Fixed ROM slots 28552.
                if slot <> 28552 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1309
//		INDEX	PWRPTR
// PORT: Fixed ROM slots 28553.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1310
//		DCA	1
// PORT: Fixed ROM slots 28554.
    28554, 24580
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28555–28556.
function agcAotUnit1825 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28555 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1311
//		DXCH	MPAC		# (I-1) TO MPAC, FETCHING DERCOF
// PORT: Fixed ROM slots 28555.
        if slot <> 28555 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1312
//		INDEX	DERPTR
// PORT: Fixed ROM slots 28556.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1313
//		DXCH	3		# DERCOF TO DER TABLE
// PORT: Fixed ROM slots 28557.
    28557, 43016
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28558–28569.
function agcAotUnit1826 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28563 {
        if slot <= 28560 {
            if slot <= 28558 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1314
//		CS	TWO
// PORT: Fixed ROM slots 28558.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1315
//		ADS	PWRPTR		# DECREMENT PWR POINTER
// PORT: Fixed ROM slots 28559.
                    if slot <> 28559 or instruction <> 11343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 79).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1316
//		CS	TWO
// PORT: Fixed ROM slots 28560.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1317
//		ADS	DERPTR		# DECREMENT DER POINTER
// PORT: Fixed ROM slots 28561.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1318
//		CCS	PWRCNT
// PORT: Fixed ROM slots 28562.
                    if slot <> 28562 or instruction <> 4192 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 96).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1319
//		TCF	DERCLOOP
// PORT: Fixed ROM slots 28563.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1320
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1321
//					# CONVERGE ON ROOT
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1322
//ROOTLOOP	EXTEND
// PORT: Fixed ROM slots 28564.
                if slot <> 28564 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28565 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1323
//		DCA	ROOTPS		# FETCH CURRENT ROOT
// PORT: Fixed ROM slots 28565.
                    if slot <> 28565 or instruction <> 12375 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 87, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1324
//		DXCH	MPAC		# LEAVE IN MPAC
// PORT: Fixed ROM slots 28566.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1325
//		EXTEND
// PORT: Fixed ROM slots 28567.
                if slot <> 28567 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28568 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1326
//		DCA	MPAC +5		# LOAD A, L WITH DER TABL ADRES, N-2
// PORT: Fixed ROM slots 28568.
                    if slot <> 28568 or instruction <> 12402 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1327
//		TC	POWRSERS	# YIELDS DERIVATIVE IN MPAC
// PORT: Fixed ROM slots 28569.
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

// PORT: Physical bank 31. Shared continuation entries, slots 28570–28577.
function agcAotUnit1827 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28573 {
        if slot <= 28571 {
            if slot <= 28570 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1328
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1329
//		EXTEND
// PORT: Fixed ROM slots 28570.
                if slot <> 28570 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1330
//		DCA	ROOTPS
// PORT: Fixed ROM slots 28571.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1331
//		DXCH	MPAC		# CURRENT ROOT TO MPAC, FETCHING DERIVATIVE
// PORT: Fixed ROM slots 28572.
                if slot <> 28572 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1332
//		DXCH	BUF		# LEAVE DERIVATIVE IN BUF AS DIVISOR
// PORT: Fixed ROM slots 28573.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1333
//		EXTEND
// PORT: Fixed ROM slots 28574.
                if slot <> 28574 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1334
//		DCA	MPAC +3		# LOAD A, L WITH PWR TABL ADRES, N-1
// PORT: Fixed ROM slots 28575.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1335
//		TC	POWRSERS	# YIELDS RESIDUAL IN MPAC
// PORT: Fixed ROM slots 28576.
                if slot <> 28576 or instruction <> 3725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1336
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1337
//		TC	USPRCADR
// PORT: Fixed ROM slots 28577.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1338
//		CADR	DDV/BDDV	# YIELDS -DX IN MPAC
// PORT: Fixed ROM slots 28578.
    28578, 470
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28579–28582.
function agcAotUnit1828 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28580 {
        if slot <= 28579 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1339
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1340
//		EXTEND
// PORT: Fixed ROM slots 28579.
            if slot <> 28579 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1341
//		DCS	MPAC		# FETCH DX, LEAVING -DX IN MPAC
// PORT: Fixed ROM slots 28580.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1342
//		DAS	ROOTPS		# CORRECTED ROOT NOW IN ROOTPS
// PORT: Fixed ROM slots 28581.
            if slot <> 28581 or instruction <> 8279 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 87) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1343
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1344
//		TC	USPRCADR
// PORT: Fixed ROM slots 28582.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1345
//		CADR	ABS		# YIELDS ABS(DX) IN MPAC
// PORT: Fixed ROM slots 28583.
    28583, 1324
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28584–28604.
function agcAotUnit1829 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28593 {
        if slot <= 28588 {
            if slot <= 28585 {
                if slot <= 28584 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1346
//		EXTEND
// PORT: Fixed ROM slots 28584.
                    if slot <> 28584 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1347
//# Page 825
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1348
//		DCS	DXCRIT
// PORT: Fixed ROM slots 28585.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1349
//		DAS	MPAC		# ABS(DX)-ABS(DXCRIT) IN MPAC
// PORT: Fixed ROM slots 28586.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1350
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1351
//		CA	MODE
// PORT: Fixed ROM slots 28587.
                        if slot <> 28587 or instruction <> 12403 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 115).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1352
//		MASK	BIT4		# KLUMPP SAYS GIVE UP AFTER EIGHT PASSES
// PORT: Fixed ROM slots 28588.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1353
//		CCS	A
// PORT: Fixed ROM slots 28589.
                    if slot <> 28589 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1354
//BADROOT		TC	RETROOT
// PORT: Fixed ROM slots 28590.
                    if slot <> 28590 or instruction <> 90 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 90, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28591 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1355
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1356
//		INCR	MODE		# INCREMENT ITERATION COUNTER
// PORT: Fixed ROM slots 28591.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1357
//		CCS	MPAC		# TEST HI ORDER DX
// PORT: Fixed ROM slots 28592.
                        if slot <> 28592 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1358
//		TCF	ROOTLOOP
// PORT: Fixed ROM slots 28593.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1359
//		TCF	TESTLODX
// PORT: Fixed ROM slots 28594.
                    if slot <> 28594 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1360
//		TCF	ROOTSTOR
// PORT: Fixed ROM slots 28595.
                    if slot <> 28595 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28596 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1361
//TESTLODX	CCS	MPAC +1		# TEST LO ORDER DX
// PORT: Fixed ROM slots 28596.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1362
//		TCF	ROOTLOOP
// PORT: Fixed ROM slots 28597.
                        if slot <> 28597 or instruction <> 6036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1363
//		TCF	ROOTSTOR
// PORT: Fixed ROM slots 28598.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1364
//		TCF	ROOTSTOR
// PORT: Fixed ROM slots 28599.
                    if slot <> 28599 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28600 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1365
//ROOTSTOR	DXCH	ROOTPS
// PORT: Fixed ROM slots 28600.
                        if slot <> 28600 or instruction <> 21591 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 87, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1366
//		DXCH	MPAC
// PORT: Fixed ROM slots 28601.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1367
//		CA	MODE
// PORT: Fixed ROM slots 28602.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1368
//		TS	MPAC +2		# STORE SP ITERATION COUNT IN MPAC+2
// PORT: Fixed ROM slots 28603.
                        if slot <> 28603 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1369
//		INDEX	RETROOT
// PORT: Fixed ROM slots 28604.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1370
//		TCF	2
// PORT: Fixed ROM slots 28605.
    28605, 8196,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1371
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1372
//DERTABLL	ADRES	DERCOFN -3
// PORT: Fixed ROM slots 28606.
    28606, 206
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28607–28607.
function agcAotUnit1830 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1373
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1374
//# ****************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1375
//# TRASHY LITTLE SUBROUTINES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1376
//# ****************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1377
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1378
//INTPRETX	INDEX	WCHPHASE	# SET X1 ON THE WAY TO THE INTERPRETER
// PORT: Fixed ROM slots 28607.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1379
//		CS	TARGTDEX
// PORT: Fixed ROM slots 28608.
    28608, 35412
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28609–28609.
function agcAotUnit1831 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1380
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 28609.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1381
//		TS	X1
// PORT: Fixed ROM slots 28610.
    28610, 45132
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28611–28635.
function agcAotUnit1832 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28622 {
        if slot <= 28616 {
            if slot <= 28613 {
                if slot <= 28611 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1382
//		TCF	INTPRET
// PORT: Fixed ROM slots 28611.
                    if slot <> 28611 or instruction <> 7199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7199, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28612 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1383
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1384
//TDISPSET	CA	TTF/8
// PORT: Fixed ROM slots 28612.
                        if slot <> 28612 or instruction <> 13218 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 930).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1385
//		EXTEND
// PORT: Fixed ROM slots 28613.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1386
//		MP	TSCALINV
// PORT: Fixed ROM slots 28614.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1387
//		DXCH	TTFDISP
// PORT: Fixed ROM slots 28615.
                        if slot <> 28615 or instruction <> 22334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 830, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1388
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1389
//		CA	EBANK5		# TREDES BECOMES ZERO TWO PASSES
// PORT: Fixed ROM slots 28616.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1390
//		TS	EBANK		#	BEFORE TCGFAPPR IS REACHED
// PORT: Fixed ROM slots 28617.
                    if slot <> 28617 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28618 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1391
//		EBANK=	TCGFAPPR
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1392
//		CA	TCGFAPPR
// PORT: Fixed ROM slots 28618.
                        if slot <> 28618 or instruction <> 13112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 824).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1393
//		INCR	BBANK
// PORT: Fixed ROM slots 28619.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1394
//		INCR	BBANK
// PORT: Fixed ROM slots 28620.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1395
//		EBANK=	TTF/8
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1396
//# Page 826
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1397
//		AD	TTF/8
// PORT: Fixed ROM slots 28621.
                        if slot <> 28621 or instruction <> 25506 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 930).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1398
//		EXTEND
// PORT: Fixed ROM slots 28622.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1399
//		MP	TREDESCL
// PORT: Fixed ROM slots 28623.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1400
//		AD	-DEC103
// PORT: Fixed ROM slots 28624.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1401
//		AD	NEGMAX
// PORT: Fixed ROM slots 28625.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1402
//		TS	L
// PORT: Fixed ROM slots 28626.
                    if slot <> 28626 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28627 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1403
//		CS	L
// PORT: Fixed ROM slots 28627.
                        if slot <> 28627 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1404
//		AD	L
// PORT: Fixed ROM slots 28628.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1405
//		AD	+DEC99
// PORT: Fixed ROM slots 28629.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1406
//		AD	POSMAX
// PORT: Fixed ROM slots 28630.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1407
//		TS	TREDES
// PORT: Fixed ROM slots 28631.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1408
//		CS	TREDES
// PORT: Fixed ROM slots 28632.
                        if slot <> 28632 or instruction <> 17334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 950).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1409
//		ADS	TREDES
// PORT: Fixed ROM slots 28633.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1410
//		TC	Q
// PORT: Fixed ROM slots 28634.
                        if slot <> 28634 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1411
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1412
//1406P00		TC	POODOO
// PORT: Fixed ROM slots 28635.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1413
//		OCT	01406
// PORT: Fixed ROM slots 28636.
    28636, 1548
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28637–28637.
function agcAotUnit1833 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1414
//1406ALM		TC	ALARM
// PORT: Fixed ROM slots 28637.
    if slot <> 28637 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1833] to agcAotUnit1833@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1415
//		OCT	01406
// PORT: Fixed ROM slots 28638.
    28638, 1548
)).

// PORT: Physical bank 31. Shared continuation entries, slots 28639–28645.
function agcAotUnit1834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28641 {
        if slot <= 28639 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1416
//		TCF	RATESTOP
// PORT: Fixed ROM slots 28639.
            if slot <> 28639 or instruction <> 5923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5923, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28640 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1417
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1418
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1419
//# SPECIALIZED "PHASCHNG" SUBROUTINE
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1420
//# *********************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1421
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1422
//		EBANK=	PHSNAME2
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1423
//FASTCHNG	CA	EBANK3		# SPECIALIZED 'PHASCHNG' ROUTINE
// PORT: Fixed ROM slots 28640.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1424
//		XCH	EBANK
// PORT: Fixed ROM slots 28641.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1425
//		DXCH	L
// PORT: Fixed ROM slots 28642.
                if slot <> 28642 or instruction <> 21506 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 2, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1426
//		TS	PHSNAME3
// PORT: Fixed ROM slots 28643.
                if slot <> 28643 or instruction <> 23330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23330, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28644 {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1427
//		LXCH	EBANK
// PORT: Fixed ROM slots 28644.
                if slot <> 28644 or instruction <> 9219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 3, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1428
//		EBANK=	E2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1429
//		TC	A
// PORT: Fixed ROM slots 28645.
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
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1430
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1431
//# *************************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1432
//# PARAMETER TABLE INDIRECT ADDRESSES
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1433
//# *************************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1434
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1435
//RDG		=	RBRFG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1436
//VDG		=	VBRFG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1437
//ADG		=	ABRFG
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1438
//VDG2TTF		=	VBRFG*
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1439
//ADG2TTF		=	ABRFG*
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1440
//JDG2TTF		=	JBRFG*
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1441
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1442
//# *************************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1443
//# LUNAR LANDING CONSTANTS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1444
//# *************************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1445
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1446
//# Page 827
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1447
//TABLTTFL	ADRES	TABLTTF +3	# ADDRESS FOR REFERENCING TTF TABLE
// PORT: Fixed ROM slots 28646.
    28646, 1770,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1448
//TTFSCALE	=	BIT12
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1449
//TSCALINV	=	BIT4
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1450
//-DEC103		DEC	-103
// PORT: Fixed ROM slots 28647.
    28647, 65328,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1451
//+DEC99		DEC	+99
// PORT: Fixed ROM slots 28648.
    28648, 198,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1452
//TREDESCL	DEC	-.08
// PORT: Fixed ROM slots 28649.
    28649, 62912,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1453
//180DEGS		DEC	+180
// PORT: Fixed ROM slots 28650.
    28650, 360,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1454
//1/2DEG		DEC	+.00278
// PORT: Fixed ROM slots 28651.
    28651, 92,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1455
//PROJMAX		DEC	.42262 B-3	# SIN(25')/8 TO COMPARE WITH PROJ
// PORT: Fixed ROM slots 28652.
    28652, 1732,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1456
//PROJMIN		DEC	.25882 B-3	# SIN(15')/8 TO COMPARE WITH PROJ
// PORT: Fixed ROM slots 28653.
    28653, 1060,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1457
//V06N63		VN	0663		# P63
// PORT: Fixed ROM slots 28654.
    28654, 1662,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1458
//V06N64		VN	0664		# P64
// PORT: Fixed ROM slots 28655.
    28655, 1664,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1459
//V06N60		VN	0660		# P65, P66, P67
// PORT: Fixed ROM slots 28656.
    28656, 1656,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1460
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1461
//		BANK	22
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1462
//		SETLOC	LANDCNST
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1463
//		BANK
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1464
//		COUNT*	$$/F2DPS
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1465
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1466
//HIGHESTF	2DEC	4.34546769 B-12
// PORT: Fixed ROM slots 21415 21416.
    21415, 34, 21416, 12514,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1467
//GSCALE		2DEC	100 B-11
// PORT: Fixed ROM slots 21417 21418.
    21417, 1600, 21418, 0,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1468
//3/8DP		2DEC	.375
// PORT: Fixed ROM slots 21419 21420.
    21419, 12288, 21420, 0,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1469
//3/4DP		2DEC	.750
// PORT: Fixed ROM slots 21421 21422.
    21421, 24576, 21422, 0,
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1470
//DEPRCRIT	2DEC	-.02 B-1
// PORT: Fixed ROM slots 21423 21424.
    21423, 65208, 21424, 38008
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1471
//
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1472
//# Page 828
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1473
//# **************************************************************************
// PORT: SOURCE LUNAR_LANDING_GUIDANCE_EQUATIONS.agc:1474
//# **************************************************************************
